require "json"
require "time"

module AwsSdk
  module DataZone
    module Types

      # Specifies the prediction (aka, the automatically generated piece of metadata) and the target (for
      # example, a column name) that can be accepted.
      struct AcceptChoice
        include JSON::Serializable

        # Specifies the target (for example, a column name) where a prediction can be accepted.
        @[JSON::Field(key: "predictionTarget")]
        getter prediction_target : String

        # The edit of the prediction.
        @[JSON::Field(key: "editedValue")]
        getter edited_value : String?

        # Specifies the prediction (aka, the automatically generated piece of metadata) that can be accepted.
        @[JSON::Field(key: "predictionChoice")]
        getter prediction_choice : Int32?

        def initialize(
          @prediction_target : String,
          @edited_value : String? = nil,
          @prediction_choice : Int32? = nil
        )
        end
      end

      struct AcceptPredictionsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the asset.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies the prediction (aka, the automatically generated piece of metadata) and the target (for
        # example, a column name) that can be accepted.
        @[JSON::Field(key: "acceptChoices")]
        getter accept_choices : Array(Types::AcceptChoice)?

        # Specifies the rule (or the conditions) under which a prediction can be accepted.
        @[JSON::Field(key: "acceptRule")]
        getter accept_rule : Types::AcceptRule?

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The revision that is to be made to the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @accept_choices : Array(Types::AcceptChoice)? = nil,
          @accept_rule : Types::AcceptRule? = nil,
          @client_token : String? = nil,
          @revision : String? = nil
        )
        end
      end

      struct AcceptPredictionsOutput
        include JSON::Serializable

        # The ID of the asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The revision that is to be made to the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String

        def initialize(
          @asset_id : String,
          @domain_id : String,
          @revision : String
        )
        end
      end

      # Specifies the rule and the threshold under which a prediction can be accepted.
      struct AcceptRule
        include JSON::Serializable

        # Specifies whether you want to accept the top prediction for all targets or none.
        @[JSON::Field(key: "rule")]
        getter rule : String?

        # The confidence score that specifies the condition at which a prediction can be accepted.
        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        def initialize(
          @rule : String? = nil,
          @threshold : Float64? = nil
        )
        end
      end

      struct AcceptSubscriptionRequestInput
        include JSON::Serializable

        # The Amazon DataZone domain where the specified subscription request is being accepted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The unique identifier of the subscription request that is to be accepted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The asset permissions of the accept subscription request.
        @[JSON::Field(key: "assetPermissions")]
        getter asset_permissions : Array(Types::AssetPermission)?

        # The asset scopes of the accept subscription request.
        @[JSON::Field(key: "assetScopes")]
        getter asset_scopes : Array(Types::AcceptedAssetScope)?

        # A description that specifies the reason for accepting the specified subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @asset_permissions : Array(Types::AssetPermission)? = nil,
          @asset_scopes : Array(Types::AcceptedAssetScope)? = nil,
          @decision_comment : String? = nil
        )
        end
      end

      struct AcceptSubscriptionRequestOutput
        include JSON::Serializable

        # The timestamp that specifies when the subscription request was accepted.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Specifies the Amazon DataZone user that accepted the specified subscription request.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the Amazon DataZone domain where the specified subscription request was
        # accepted.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription request.
        @[JSON::Field(key: "id")]
        getter id : String

        # Specifies the reason for requesting a subscription to the asset.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # Specifies the status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies the asset for which the subscription request was created.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # Specifies the Amazon DataZone users who are subscribed to the asset specified in the subscription
        # request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # Specifies the timestamp when subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Specifies the reason for accepting the subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # The metadata form in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormOutput)?

        # Specifes the ID of the Amazon DataZone user who reviewed the subscription request.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # Specifies the Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms : Array(Types::FormOutput)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The accepted asset scope.
      struct AcceptedAssetScope
        include JSON::Serializable

        # The asset ID of the accepted asset scope.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The filter IDs of the accepted asset scope.
        @[JSON::Field(key: "filterIds")]
        getter filter_ids : Array(String)

        def initialize(
          @asset_id : String,
          @filter_ids : Array(String)
        )
        end
      end

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The account information within an account pool.
      struct AccountInfo
        include JSON::Serializable

        # The account ID.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The regions supported for an account within an account pool.
        @[JSON::Field(key: "supportedRegions")]
        getter supported_regions : Array(String)

        # The account name.
        @[JSON::Field(key: "awsAccountName")]
        getter aws_account_name : String?

        def initialize(
          @aws_account_id : String,
          @supported_regions : Array(String),
          @aws_account_name : String? = nil
        )
        end
      end

      # The summary of the account pool.
      struct AccountPoolSummary
        include JSON::Serializable

        # The user who created the account pool.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The ID of the account pool.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the account pool.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        # The user who updated the account pool.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @domain_unit_id : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @resolution_strategy : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The source of accounts for the account pool. In the current release, it's either a static list of
      # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
      struct AccountSource
        include JSON::Serializable

        # The static list of accounts within an account pool.
        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AccountInfo)?

        # The custom Amazon Web Services Lambda handler within an account pool.
        @[JSON::Field(key: "customAccountPoolHandler")]
        getter custom_account_pool_handler : Types::CustomAccountPoolHandler?

        def initialize(
          @accounts : Array(Types::AccountInfo)? = nil,
          @custom_account_pool_handler : Types::CustomAccountPoolHandler? = nil
        )
        end
      end

      # The parameters of the environment action.
      struct ActionParameters
        include JSON::Serializable

        # The console link specified as part of the environment action.
        @[JSON::Field(key: "awsConsoleLink")]
        getter aws_console_link : Types::AwsConsoleLinkParameters?

        def initialize(
          @aws_console_link : Types::AwsConsoleLinkParameters? = nil
        )
        end
      end

      struct AddEntityOwnerInput
        include JSON::Serializable

        # The ID of the domain in which you want to add the entity owner.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity to which you want to add an owner.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of an entity.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The owner that you want to add to the entity.
        @[JSON::Field(key: "owner")]
        getter owner : Types::OwnerProperties

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @owner : Types::OwnerProperties,
          @client_token : String? = nil
        )
        end
      end

      struct AddEntityOwnerOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AddPolicyGrantInput
        include JSON::Serializable

        # The details of the policy grant.
        @[JSON::Field(key: "detail")]
        getter detail : Types::PolicyGrantDetail

        # The ID of the domain where you want to add a policy grant.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity (resource) to which you want to add a policy grant.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of entity (resource) to which the grant is added.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The type of policy that you want to grant.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The principal to whom the permissions are granted.
        @[JSON::Field(key: "principal")]
        getter principal : Types::PolicyGrantPrincipal

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @detail : Types::PolicyGrantDetail,
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @policy_type : String,
          @principal : Types::PolicyGrantPrincipal,
          @client_token : String? = nil
        )
        end
      end

      struct AddPolicyGrantOutput
        include JSON::Serializable

        # The ID of the policy grant that was added to a specified entity.
        @[JSON::Field(key: "grantId")]
        getter grant_id : String?

        def initialize(
          @grant_id : String? = nil
        )
        end
      end

      # The details of the policy grant.
      struct AddToProjectMemberPoolPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      # An aggregation list item.
      struct AggregationListItem
        include JSON::Serializable

        # An attribute on which to compute aggregations.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The display value of the aggregation list item. Supported values include value and glossaryTerm.name
        # .
        @[JSON::Field(key: "displayValue")]
        getter display_value : String?

        def initialize(
          @attribute : String,
          @display_value : String? = nil
        )
        end
      end

      # The aggregation for an attribute.
      struct AggregationOutput
        include JSON::Serializable

        # The attribute for this aggregation.
        @[JSON::Field(key: "attribute")]
        getter attribute : String?

        # The display value of the aggregation output item.
        @[JSON::Field(key: "displayValue")]
        getter display_value : String?

        # A list of aggregation output items.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AggregationOutputItem)?

        def initialize(
          @attribute : String? = nil,
          @display_value : String? = nil,
          @items : Array(Types::AggregationOutputItem)? = nil
        )
        end
      end

      # An aggregation output item.
      struct AggregationOutputItem
        include JSON::Serializable

        # The count of the aggregation output item.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # The display value of the aggregation. If the attribute being aggregated corresponds to the id of a
        # public resource, the service automatically resolves the id to the provided display value.
        @[JSON::Field(key: "displayValue")]
        getter display_value : String?

        # The attribute value of the aggregation output item.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @count : Int32? = nil,
          @display_value : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The grant filter for all domain units.
      struct AllDomainUnitsGrantFilter
        include JSON::Serializable

        def initialize
        end
      end

      # The all users grant filter.
      struct AllUsersGrantFilter
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Q properties of the connection.
      struct AmazonQPropertiesInput
        include JSON::Serializable

        # Specifies whether Amazon Q is enabled for the connection.
        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool

        # The authentication mode of the connection's Amazon Q properties.
        @[JSON::Field(key: "authMode")]
        getter auth_mode : String?

        # The profile ARN of the connection's Amazon Q properties.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String?

        def initialize(
          @is_enabled : Bool,
          @auth_mode : String? = nil,
          @profile_arn : String? = nil
        )
        end
      end

      # The Amazon Q properties of the connection.
      struct AmazonQPropertiesOutput
        include JSON::Serializable

        # Specifies whether Amazon Q is enabled for the connection.
        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool

        # The authentication mode of the connection's Amazon Q properties.
        @[JSON::Field(key: "authMode")]
        getter auth_mode : String?

        # The profile ARN of the connection's Amazon Q properties.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String?

        def initialize(
          @is_enabled : Bool,
          @auth_mode : String? = nil,
          @profile_arn : String? = nil
        )
        end
      end

      # The Amazon Q properties of the connection.
      struct AmazonQPropertiesPatch
        include JSON::Serializable

        # Specifies whether Amazon Q is enabled for the connection.
        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool

        # The authentication mode of the connection's Amazon Q properties.
        @[JSON::Field(key: "authMode")]
        getter auth_mode : String?

        # The profile ARN of the connection's Amazon Q properties.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String?

        def initialize(
          @is_enabled : Bool,
          @auth_mode : String? = nil,
          @profile_arn : String? = nil
        )
        end
      end

      # The configuration details of the asset filter.
      struct AssetFilterConfiguration
        include JSON::Serializable

        # The column configuration of the asset filter.
        @[JSON::Field(key: "columnConfiguration")]
        getter column_configuration : Types::ColumnFilterConfiguration?

        # The row configuration of the asset filter.
        @[JSON::Field(key: "rowConfiguration")]
        getter row_configuration : Types::RowFilterConfiguration?

        def initialize(
          @column_configuration : Types::ColumnFilterConfiguration? = nil,
          @row_configuration : Types::RowFilterConfiguration? = nil
        )
        end
      end

      # The summary of the asset filter.
      struct AssetFilterSummary
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The ID of the domain where the asset filter lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the asset filter.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp at which the asset filter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The effective column names of the asset filter.
        @[JSON::Field(key: "effectiveColumnNames")]
        getter effective_column_names : Array(String)?

        # The effective row filter of the asset filter.
        @[JSON::Field(key: "effectiveRowFilter")]
        getter effective_row_filter : String?

        # The error message that is displayed if the action does not succeed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The status of the asset filter.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @asset_id : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @effective_column_names : Array(String)? = nil,
          @effective_row_filter : String? = nil,
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The listing of the asset in a data product.
      struct AssetInDataProductListingItem
        include JSON::Serializable

        # The entity ID of the listing of the asset in a data product.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The entity revision of the listing of the asset in a data product.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        # The entity type of the listing of the asset in a data product.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        def initialize(
          @entity_id : String? = nil,
          @entity_revision : String? = nil,
          @entity_type : String? = nil
        )
        end
      end

      # A Amazon DataZone inventory asset.
      struct AssetItem
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the inventory asset exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # the identifier of the Amazon DataZone inventory asset.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The name of the Amazon DataZone inventory asset.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the Amazon DataZone project that owns the inventory asset.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The identifier of the asset type of the specified Amazon DataZone inventory asset.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The revision of the inventory asset type.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # The additional attributes of a Amazon DataZone inventory asset.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::AssetItemAdditionalAttributes?

        # The timestamp of when the Amazon DataZone inventory asset was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the inventory asset.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of an Amazon DataZone inventory asset.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The external identifier of the Amazon DataZone inventory asset.
        @[JSON::Field(key: "externalIdentifier")]
        getter external_identifier : String?

        # The timestamp of when the first revision of the inventory asset was created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The Amazon DataZone user who created the first revision of the inventory asset.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The glossary terms attached to the Amazon DataZone inventory asset.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The restricted glossary terms accociated with an asset.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)?

        def initialize(
          @domain_id : String,
          @identifier : String,
          @name : String,
          @owning_project_id : String,
          @type_identifier : String,
          @type_revision : String,
          @additional_attributes : Types::AssetItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @external_identifier : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @governed_glossary_terms : Array(String)? = nil
        )
        end
      end

      # The additional attributes of an inventory asset.
      struct AssetItemAdditionalAttributes
        include JSON::Serializable

        # The forms included in the additional attributes of an inventory asset.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)?

        # The latest time series data points forms included in the additional attributes of an asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointFormsOutput")]
        getter latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        # The read-only forms included in the additional attributes of an inventory asset.
        @[JSON::Field(key: "readOnlyFormsOutput")]
        getter read_only_forms_output : Array(Types::FormOutput)?

        def initialize(
          @forms_output : Array(Types::FormOutput)? = nil,
          @latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @match_rationale : Array(Types::MatchRationaleItem)? = nil,
          @read_only_forms_output : Array(Types::FormOutput)? = nil
        )
        end
      end

      # An asset published in an Amazon DataZone catalog.
      struct AssetListing
        include JSON::Serializable

        # The identifier of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String?

        # The revision of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "assetRevision")]
        getter asset_revision : String?

        # The type of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "assetType")]
        getter asset_type : String?

        # The timestamp of when an asset published in an Amazon DataZone catalog was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The metadata forms attached to an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "forms")]
        getter forms : String?

        # The glossary terms attached to an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The restricted glossary terms associated with an asset.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The latest time series data points forms included in the additional attributes of an asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointForms")]
        getter latest_time_series_data_point_forms : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # The identifier of the project where an asset published in an Amazon DataZone catalog exists.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        def initialize(
          @asset_id : String? = nil,
          @asset_revision : String? = nil,
          @asset_type : String? = nil,
          @created_at : Time? = nil,
          @forms : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @governed_glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @latest_time_series_data_point_forms : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @owning_project_id : String? = nil
        )
        end
      end

      # The details of an asset published in an Amazon DataZone catalog.
      struct AssetListingDetails
        include JSON::Serializable

        # The identifier of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "listingId")]
        getter listing_id : String

        # The status of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "listingStatus")]
        getter listing_status : String

        def initialize(
          @listing_id : String,
          @listing_status : String
        )
        end
      end

      # The details of an asset published in an Amazon DataZone catalog.
      struct AssetListingItem
        include JSON::Serializable

        # The additional attributes of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::AssetListingItemAdditionalAttributes?

        # The timestamp of when an asset published in an Amazon DataZone catalog was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the inventory asset.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The revision of the inventory asset.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        # The type of the inventory asset.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # Glossary terms attached to the inventory asset.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The restricted glossary terms associated with an asset.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The Amazon DataZone user who created the listing.
        @[JSON::Field(key: "listingCreatedBy")]
        getter listing_created_by : String?

        # The identifier of the listing (asset published in Amazon DataZone catalog).
        @[JSON::Field(key: "listingId")]
        getter listing_id : String?

        # The revision of the listing (asset published in Amazon DataZone catalog).
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String?

        # The Amazon DataZone user who updated the listing.
        @[JSON::Field(key: "listingUpdatedBy")]
        getter listing_updated_by : String?

        # The name of the inventory asset.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The identifier of the project that owns the inventory asset.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        def initialize(
          @additional_attributes : Types::AssetListingItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @entity_id : String? = nil,
          @entity_revision : String? = nil,
          @entity_type : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @governed_glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @listing_created_by : String? = nil,
          @listing_id : String? = nil,
          @listing_revision : String? = nil,
          @listing_updated_by : String? = nil,
          @name : String? = nil,
          @owning_project_id : String? = nil
        )
        end
      end

      # Additional attributes of an inventory asset.
      struct AssetListingItemAdditionalAttributes
        include JSON::Serializable

        # The metadata forms that form additional attributes of the metadata asset.
        @[JSON::Field(key: "forms")]
        getter forms : String?

        # The latest time series data points forms included in the additional attributes of an asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointForms")]
        getter latest_time_series_data_point_forms : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        def initialize(
          @forms : String? = nil,
          @latest_time_series_data_point_forms : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @match_rationale : Array(Types::MatchRationaleItem)? = nil
        )
        end
      end

      # The asset permissions.
      struct AssetPermission
        include JSON::Serializable

        # The asset ID as part of the asset permissions.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The details as part of the asset permissions.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::Permissions

        def initialize(
          @asset_id : String,
          @permissions : Types::Permissions
        )
        end
      end

      # The revision of an inventory asset.
      struct AssetRevision
        include JSON::Serializable

        # The timestamp of when an inventory asset revison was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the asset revision.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The Amazon DataZone user who created the inventory asset.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The identifier of the inventory asset revision.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The revision details of the inventory asset.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # The asset scope.
      struct AssetScope
        include JSON::Serializable

        # The asset ID of the asset scope.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The filter IDs of the asset scope.
        @[JSON::Field(key: "filterIds")]
        getter filter_ids : Array(String)

        # The status of the asset scope.
        @[JSON::Field(key: "status")]
        getter status : String

        # The error message of the asset scope.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @asset_id : String,
          @filter_ids : Array(String),
          @status : String,
          @error_message : String? = nil
        )
        end
      end

      # The name map for assets.
      struct AssetTargetNameMap
        include JSON::Serializable

        # The identifier of the inventory asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The target name in the asset target name map.
        @[JSON::Field(key: "targetName")]
        getter target_name : String

        def initialize(
          @asset_id : String,
          @target_name : String
        )
        end
      end

      # The details of the asset type.
      struct AssetTypeItem
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain where the asset type exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The forms included in the details of the asset type.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Hash(String, Types::FormEntryOutput)

        # The name of the asset type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the Amazon DataZone project that owns the asset type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the asset type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp of when the asset type was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the asset type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the asset type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the Amazon DataZone domain where the asset type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The identifier of the Amazon DataZone project where the asset type exists.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The timestamp of when the asset type was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the asset type.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @forms_output : Hash(String, Types::FormEntryOutput),
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The asset type for the rule details.
      struct AssetTypesForRule
        include JSON::Serializable

        # The selection mode for the rule.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # The specific asset types that are included in the rule.
        @[JSON::Field(key: "specificAssetTypes")]
        getter specific_asset_types : Array(String)?

        def initialize(
          @selection_mode : String,
          @specific_asset_types : Array(String)? = nil
        )
        end
      end

      struct AssociateEnvironmentRoleInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment role is associated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the Amazon DataZone environment.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ARN of the environment role.
        @[JSON::Field(key: "environmentRoleArn")]
        getter environment_role_arn : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @environment_role_arn : String
        )
        end
      end

      struct AssociateEnvironmentRoleOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateGovernedTermsInput
        include JSON::Serializable

        # The ID of the domain where governed terms are to be associated with an asset.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset with which you want to associate a governed term.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset with which you want to associate a governed term.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The glossary terms in a restricted glossary.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @governed_glossary_terms : Array(String)
        )
        end
      end

      struct AssociateGovernedTermsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Athena properties of a connection.
      struct AthenaPropertiesInput
        include JSON::Serializable

        # The Amazon Athena workgroup name of a connection.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @workgroup_name : String? = nil
        )
        end
      end

      # The Amazon Athena properties of a connection.
      struct AthenaPropertiesOutput
        include JSON::Serializable

        # The Amazon Athena workgroup name of a connection.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @workgroup_name : String? = nil
        )
        end
      end

      # The Amazon Athena properties patch of a connection.
      struct AthenaPropertiesPatch
        include JSON::Serializable

        # The Amazon Athena workgroup name of a connection.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @workgroup_name : String? = nil
        )
        end
      end

      # The attribute error.
      struct AttributeError
        include JSON::Serializable

        # The attribute ID as part of the attribute error.
        @[JSON::Field(key: "attributeIdentifier")]
        getter attribute_identifier : String

        # The code generated as part of the attribute error.
        @[JSON::Field(key: "code")]
        getter code : String

        # The message generated as part of the attribute error.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @attribute_identifier : String,
          @code : String,
          @message : String
        )
        end
      end

      # The attribute input.
      struct AttributeInput
        include JSON::Serializable

        # The ID of the attribute.
        @[JSON::Field(key: "attributeIdentifier")]
        getter attribute_identifier : String

        # The metadata forms as part of the attribute input.
        @[JSON::Field(key: "forms")]
        getter forms : Array(Types::FormInput)

        def initialize(
          @attribute_identifier : String,
          @forms : Array(Types::FormInput)
        )
        end
      end

      # The authentication configuration of a connection.
      struct AuthenticationConfiguration
        include JSON::Serializable

        # The authentication type of a connection.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The oAuth2 properties of a connection.
        @[JSON::Field(key: "oAuth2Properties")]
        getter o_auth2_properties : Types::OAuth2Properties?

        # The secret ARN of a connection.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @authentication_type : String? = nil,
          @o_auth2_properties : Types::OAuth2Properties? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # The authentication configuration of a connection.
      struct AuthenticationConfigurationInput
        include JSON::Serializable

        # The authentication type of a connection.
        @[JSON::Field(key: "authenticationType")]
        getter authentication_type : String?

        # The basic authentication credentials of a connection.
        @[JSON::Field(key: "basicAuthenticationCredentials")]
        getter basic_authentication_credentials : Types::BasicAuthenticationCredentials?

        # The custom authentication credentials of a connection.
        @[JSON::Field(key: "customAuthenticationCredentials")]
        getter custom_authentication_credentials : Hash(String, String)?

        # The KMS key ARN of a connection.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The oAuth2 properties of a connection.
        @[JSON::Field(key: "oAuth2Properties")]
        getter o_auth2_properties : Types::OAuth2Properties?

        # The secret ARN of a connection.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @authentication_type : String? = nil,
          @basic_authentication_credentials : Types::BasicAuthenticationCredentials? = nil,
          @custom_authentication_credentials : Hash(String, String)? = nil,
          @kms_key_arn : String? = nil,
          @o_auth2_properties : Types::OAuth2Properties? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # The authentication configuration patch of a connection.
      struct AuthenticationConfigurationPatch
        include JSON::Serializable

        # The basic authentication credentials of a connection.
        @[JSON::Field(key: "basicAuthenticationCredentials")]
        getter basic_authentication_credentials : Types::BasicAuthenticationCredentials?

        # The secret ARN of a connection.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        def initialize(
          @basic_authentication_credentials : Types::BasicAuthenticationCredentials? = nil,
          @secret_arn : String? = nil
        )
        end
      end

      # The authorization code properties of a connection.
      struct AuthorizationCodeProperties
        include JSON::Serializable

        # The authorization code of a connection.
        @[JSON::Field(key: "authorizationCode")]
        getter authorization_code : String?

        # The redirect URI of a connection.
        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String?

        def initialize(
          @authorization_code : String? = nil,
          @redirect_uri : String? = nil
        )
        end
      end

      # The account ID of a project.
      struct AwsAccount
        include JSON::Serializable

        # The account ID of a project.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The account ID path of a project.
        @[JSON::Field(key: "awsAccountIdPath")]
        getter aws_account_id_path : String?

        def initialize(
          @aws_account_id : String? = nil,
          @aws_account_id_path : String? = nil
        )
        end
      end

      # The parameters of the console link specified as part of the environment action.
      struct AwsConsoleLinkParameters
        include JSON::Serializable

        # The URI of the console link specified as part of the environment action.
        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @uri : String? = nil
        )
        end
      end

      # The location of a project.
      struct AwsLocation
        include JSON::Serializable

        # The access role of a connection.
        @[JSON::Field(key: "accessRole")]
        getter access_role : String?

        # The account ID of a connection.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Region of a connection.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : String?

        # The IAM connection ID of a connection.
        @[JSON::Field(key: "iamConnectionId")]
        getter iam_connection_id : String?

        def initialize(
          @access_role : String? = nil,
          @aws_account_id : String? = nil,
          @aws_region : String? = nil,
          @iam_connection_id : String? = nil
        )
        end
      end

      # The basic authentication credentials of a connection.
      struct BasicAuthenticationCredentials
        include JSON::Serializable

        # The password for a connection.
        @[JSON::Field(key: "password")]
        getter password : String?

        # The user name for the connecion.
        @[JSON::Field(key: "userName")]
        getter user_name : String?

        def initialize(
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # The results of the BatchGetAttribute action.
      struct BatchGetAttributeOutput
        include JSON::Serializable

        # The attribute ID.
        @[JSON::Field(key: "attributeIdentifier")]
        getter attribute_identifier : String

        # The metadata forms that are part of the results of the BatchGetAttribute action.
        @[JSON::Field(key: "forms")]
        getter forms : Array(Types::FormOutput)?

        def initialize(
          @attribute_identifier : String,
          @forms : Array(Types::FormOutput)? = nil
        )
        end
      end

      struct BatchGetAttributesMetadataInput
        include JSON::Serializable

        # The attribute identifier.
        @[JSON::Field(key: "attributeIdentifier")]
        getter attribute_identifiers : Array(String)

        # The domain ID where you want to get the attribute metadata.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The entity ID for which you want to get attribute metadata.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The entity type for which you want to get attribute metadata.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The entity revision for which you want to get attribute metadata.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        def initialize(
          @attribute_identifiers : Array(String),
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @entity_revision : String? = nil
        )
        end
      end

      struct BatchGetAttributesMetadataOutput
        include JSON::Serializable

        # The errors generated when the BatchGetAttributesMetadata action is invoked.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AttributeError)

        # The results of the BatchGetAttributesMetadata action.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::BatchGetAttributeOutput)?

        def initialize(
          @errors : Array(Types::AttributeError),
          @attributes : Array(Types::BatchGetAttributeOutput)? = nil
        )
        end
      end

      # The results of the BatchPutAttribute action.
      struct BatchPutAttributeOutput
        include JSON::Serializable

        # The attribute ID.
        @[JSON::Field(key: "attributeIdentifier")]
        getter attribute_identifier : String

        def initialize(
          @attribute_identifier : String
        )
        end
      end

      struct BatchPutAttributesMetadataInput
        include JSON::Serializable

        # The attributes of the metadata.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::AttributeInput)

        # The domain ID where you want to write the attribute metadata.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The entity ID for which you want to write the attribute metadata.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The entity type for which you want to write the attribute metadata.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @attributes : Array(Types::AttributeInput),
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @client_token : String? = nil
        )
        end
      end

      struct BatchPutAttributesMetadataOutput
        include JSON::Serializable

        # The results of the BatchPutAttributeMetadata action.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::BatchPutAttributeOutput)?

        # The errors generated when the BatchPutAttributeMetadata action is invoked.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::AttributeError)?

        def initialize(
          @attributes : Array(Types::BatchPutAttributeOutput)? = nil,
          @errors : Array(Types::AttributeError)? = nil
        )
        end
      end

      # The configuration of the business name generation.
      struct BusinessNameGenerationConfiguration
        include JSON::Serializable

        # Specifies whether the business name generation is enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      struct CancelMetadataGenerationRunInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the metadata generation run is to be cancelled.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the metadata generation run.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct CancelMetadataGenerationRunOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelSubscriptionInput
        include JSON::Serializable

        # The unique identifier of the Amazon DataZone domain where the subscription request is being
        # cancelled.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The unique identifier of the subscription that is being cancelled.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct CancelSubscriptionOutput
        include JSON::Serializable

        # The timestamp that specifies when the request to cancel the subscription was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Specifies the Amazon DataZone user who is cancelling the subscription.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the Amazon DataZone domain where the subscription is being cancelled.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the request to cancel the subscription.
        @[JSON::Field(key: "status")]
        getter status : String

        # The asset to which a subscription is being cancelled.
        @[JSON::Field(key: "subscribedListing")]
        getter subscribed_listing : Types::SubscribedListing

        # The Amazon DataZone user who is made a subscriber to the specified asset by the subscription that is
        # being cancelled.
        @[JSON::Field(key: "subscribedPrincipal")]
        getter subscribed_principal : Types::SubscribedPrincipal

        # The timestamp that specifies when the subscription was cancelled.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Specifies whether the permissions to the asset are retained after the subscription is cancelled.
        @[JSON::Field(key: "retainPermissions")]
        getter retain_permissions : Bool?

        # The unique ID of the subscripton request for the subscription that is being cancelled.
        @[JSON::Field(key: "subscriptionRequestId")]
        getter subscription_request_id : String?

        # The Amazon DataZone user that cancelled the subscription.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @status : String,
          @subscribed_listing : Types::SubscribedListing,
          @subscribed_principal : Types::SubscribedPrincipal,
          @updated_at : Time,
          @retain_permissions : Bool? = nil,
          @subscription_request_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Part of the provisioning properties of the environment blueprint.
      struct CloudFormationProperties
        include JSON::Serializable

        # The template URL of the cloud formation provisioning properties of the environment blueprint.
        @[JSON::Field(key: "templateUrl")]
        getter template_url : String

        def initialize(
          @template_url : String
        )
        end
      end

      # The column configuration of the asset filter.
      struct ColumnFilterConfiguration
        include JSON::Serializable

        # Specifies whether to include column names.
        @[JSON::Field(key: "includedColumnNames")]
        getter included_column_names : Array(String)?

        def initialize(
          @included_column_names : Array(String)? = nil
        )
        end
      end

      # The details of the parameters for the configurable environment action.
      struct ConfigurableActionParameter
        include JSON::Serializable

        # The key of the configurable action parameter.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of the configurable action parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The configurable action of a Amazon DataZone environment.
      struct ConfigurableEnvironmentAction
        include JSON::Serializable

        # The parameters of a configurable action in a Amazon DataZone environment.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::ConfigurableActionParameter)

        # The type of a configurable action in a Amazon DataZone environment.
        @[JSON::Field(key: "type")]
        getter type : String

        # The authentication type of a configurable action of a Amazon DataZone environment.
        @[JSON::Field(key: "auth")]
        getter auth : String?

        def initialize(
          @parameters : Array(Types::ConfigurableActionParameter),
          @type : String,
          @auth : String? = nil
        )
        end
      end

      # There is a conflict while performing this action.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The credentials of a connection.
      struct ConnectionCredentials
        include JSON::Serializable

        # The access key ID of a connection.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The expiration of the connection credentials.
        @[JSON::Field(key: "expiration")]
        getter expiration : Time?

        # The secret access key of a connection.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The session token of a connection credentials.
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # The properties of a connection.
      struct ConnectionPropertiesInput
        include JSON::Serializable

        # The Amazon Q properties of the connection.
        @[JSON::Field(key: "amazonQProperties")]
        getter amazon_q_properties : Types::AmazonQPropertiesInput?

        # The Amazon Athena properties of a connection.
        @[JSON::Field(key: "athenaProperties")]
        getter athena_properties : Types::AthenaPropertiesInput?

        # The Amazon Web Services Glue properties of a connection.
        @[JSON::Field(key: "glueProperties")]
        getter glue_properties : Types::GluePropertiesInput?

        # The hyper pod properties of a connection.
        @[JSON::Field(key: "hyperPodProperties")]
        getter hyper_pod_properties : Types::HyperPodPropertiesInput?

        # The IAM properties of a connection.
        @[JSON::Field(key: "iamProperties")]
        getter iam_properties : Types::IamPropertiesInput?

        # The MLflow properties of a connection.
        @[JSON::Field(key: "mlflowProperties")]
        getter mlflow_properties : Types::MlflowPropertiesInput?

        # The Amazon Redshift properties of a connection.
        @[JSON::Field(key: "redshiftProperties")]
        getter redshift_properties : Types::RedshiftPropertiesInput?

        # The Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3Properties")]
        getter s3_properties : Types::S3PropertiesInput?

        # The Spark EMR properties of a connection.
        @[JSON::Field(key: "sparkEmrProperties")]
        getter spark_emr_properties : Types::SparkEmrPropertiesInput?

        # The Spark Amazon Web Services Glue properties of a connection.
        @[JSON::Field(key: "sparkGlueProperties")]
        getter spark_glue_properties : Types::SparkGluePropertiesInput?

        def initialize(
          @amazon_q_properties : Types::AmazonQPropertiesInput? = nil,
          @athena_properties : Types::AthenaPropertiesInput? = nil,
          @glue_properties : Types::GluePropertiesInput? = nil,
          @hyper_pod_properties : Types::HyperPodPropertiesInput? = nil,
          @iam_properties : Types::IamPropertiesInput? = nil,
          @mlflow_properties : Types::MlflowPropertiesInput? = nil,
          @redshift_properties : Types::RedshiftPropertiesInput? = nil,
          @s3_properties : Types::S3PropertiesInput? = nil,
          @spark_emr_properties : Types::SparkEmrPropertiesInput? = nil,
          @spark_glue_properties : Types::SparkGluePropertiesInput? = nil
        )
        end
      end

      # The properties of a connection.
      struct ConnectionPropertiesOutput
        include JSON::Serializable

        # The Amazon Q properties of the connection.
        @[JSON::Field(key: "amazonQProperties")]
        getter amazon_q_properties : Types::AmazonQPropertiesOutput?

        # The Amazon Athena properties of a connection.
        @[JSON::Field(key: "athenaProperties")]
        getter athena_properties : Types::AthenaPropertiesOutput?

        # The Amazon Web Services Glue properties of a connection.
        @[JSON::Field(key: "glueProperties")]
        getter glue_properties : Types::GluePropertiesOutput?

        # The hyper pod properties of a connection.
        @[JSON::Field(key: "hyperPodProperties")]
        getter hyper_pod_properties : Types::HyperPodPropertiesOutput?

        # The IAM properties of a connection.
        @[JSON::Field(key: "iamProperties")]
        getter iam_properties : Types::IamPropertiesOutput?

        # The MLflow properties of a connection.
        @[JSON::Field(key: "mlflowProperties")]
        getter mlflow_properties : Types::MlflowPropertiesOutput?

        # The Amazon Redshift properties of a connection.
        @[JSON::Field(key: "redshiftProperties")]
        getter redshift_properties : Types::RedshiftPropertiesOutput?

        # The Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3Properties")]
        getter s3_properties : Types::S3PropertiesOutput?

        # The Spark EMR properties of a connection.
        @[JSON::Field(key: "sparkEmrProperties")]
        getter spark_emr_properties : Types::SparkEmrPropertiesOutput?

        # The Spark Amazon Web Services Glue properties of a connection.
        @[JSON::Field(key: "sparkGlueProperties")]
        getter spark_glue_properties : Types::SparkGluePropertiesOutput?

        def initialize(
          @amazon_q_properties : Types::AmazonQPropertiesOutput? = nil,
          @athena_properties : Types::AthenaPropertiesOutput? = nil,
          @glue_properties : Types::GluePropertiesOutput? = nil,
          @hyper_pod_properties : Types::HyperPodPropertiesOutput? = nil,
          @iam_properties : Types::IamPropertiesOutput? = nil,
          @mlflow_properties : Types::MlflowPropertiesOutput? = nil,
          @redshift_properties : Types::RedshiftPropertiesOutput? = nil,
          @s3_properties : Types::S3PropertiesOutput? = nil,
          @spark_emr_properties : Types::SparkEmrPropertiesOutput? = nil,
          @spark_glue_properties : Types::SparkGluePropertiesOutput? = nil
        )
        end
      end

      # The connection properties patch.
      struct ConnectionPropertiesPatch
        include JSON::Serializable

        # The Amazon Q properties of the connection.
        @[JSON::Field(key: "amazonQProperties")]
        getter amazon_q_properties : Types::AmazonQPropertiesPatch?

        # The Amazon Athena properties of a connection properties patch.
        @[JSON::Field(key: "athenaProperties")]
        getter athena_properties : Types::AthenaPropertiesPatch?

        # The Amazon Web Services Glue properties of a connection properties patch.
        @[JSON::Field(key: "glueProperties")]
        getter glue_properties : Types::GluePropertiesPatch?

        # The IAM properties of a connection properties patch.
        @[JSON::Field(key: "iamProperties")]
        getter iam_properties : Types::IamPropertiesPatch?

        # The MLflow properties of a connection.
        @[JSON::Field(key: "mlflowProperties")]
        getter mlflow_properties : Types::MlflowPropertiesPatch?

        # The Amazon Redshift properties of a connection properties patch.
        @[JSON::Field(key: "redshiftProperties")]
        getter redshift_properties : Types::RedshiftPropertiesPatch?

        # The Amazon S3 properties of a connection properties patch.
        @[JSON::Field(key: "s3Properties")]
        getter s3_properties : Types::S3PropertiesPatch?

        # The Spark EMR properties of a connection properties patch.
        @[JSON::Field(key: "sparkEmrProperties")]
        getter spark_emr_properties : Types::SparkEmrPropertiesPatch?

        def initialize(
          @amazon_q_properties : Types::AmazonQPropertiesPatch? = nil,
          @athena_properties : Types::AthenaPropertiesPatch? = nil,
          @glue_properties : Types::GluePropertiesPatch? = nil,
          @iam_properties : Types::IamPropertiesPatch? = nil,
          @mlflow_properties : Types::MlflowPropertiesPatch? = nil,
          @redshift_properties : Types::RedshiftPropertiesPatch? = nil,
          @s3_properties : Types::S3PropertiesPatch? = nil,
          @spark_emr_properties : Types::SparkEmrPropertiesPatch? = nil
        )
        end
      end

      # The summary of a connection.
      struct ConnectionSummary
        include JSON::Serializable

        # The ID of a connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The domain ID of a connection.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The domain unit ID of a connection.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String

        # The connection name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The connection physical endpoints.
        @[JSON::Field(key: "physicalEndpoints")]
        getter physical_endpoints : Array(Types::PhysicalEndpoint)

        # The connection type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The environment ID of a connection.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The connection project ID.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesOutput?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @connection_id : String,
          @domain_id : String,
          @domain_unit_id : String,
          @name : String,
          @physical_endpoints : Array(Types::PhysicalEndpoint),
          @type : String,
          @environment_id : String? = nil,
          @project_id : String? = nil,
          @props : Types::ConnectionPropertiesOutput? = nil,
          @scope : String? = nil
        )
        end
      end

      struct CreateAccountPoolInput
        include JSON::Serializable

        # The source of accounts for the account pool. In the current release, it's either a static list of
        # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
        @[JSON::Field(key: "accountSource")]
        getter account_source : Types::AccountSource

        # The ID of the domain where the account pool is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the account pool.
        @[JSON::Field(key: "name")]
        getter name : String

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String

        # The description of the account pool.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @account_source : Types::AccountSource,
          @domain_identifier : String,
          @name : String,
          @resolution_strategy : String,
          @description : String? = nil
        )
        end
      end

      struct CreateAccountPoolOutput
        include JSON::Serializable

        # The source of accounts for the account pool. In the current release, it's either a static list of
        # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
        @[JSON::Field(key: "accountSource")]
        getter account_source : Types::AccountSource

        # The user who created the account pool.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The timestamp at which the account pool was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the account pool.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain where the account pool is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the domain where the account pool is created.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The ID of the account pool.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp at which the account pool was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the account pool.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        # The user who last updated the account pool.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @account_source : Types::AccountSource,
          @created_by : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @domain_unit_id : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @resolution_strategy : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct CreateAssetFilterInput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The configuration of the asset filter.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AssetFilterConfiguration

        # The ID of the domain in which you want to create an asset filter.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @asset_identifier : String,
          @configuration : Types::AssetFilterConfiguration,
          @domain_identifier : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateAssetFilterOutput
        include JSON::Serializable

        # The ID of the asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The configuration of the asset filter.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AssetFilterConfiguration

        # The ID of the domain where the asset filter is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the asset filter.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp at which the asset filter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The column names in the asset filter.
        @[JSON::Field(key: "effectiveColumnNames")]
        getter effective_column_names : Array(String)?

        # The row filter in the asset filter.
        @[JSON::Field(key: "effectiveRowFilter")]
        getter effective_row_filter : String?

        # The error message that is displayed if the asset filter is not created successfully.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The status of the asset filter.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @asset_id : String,
          @configuration : Types::AssetFilterConfiguration,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @effective_column_names : Array(String)? = nil,
          @effective_row_filter : String? = nil,
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateAssetInput
        include JSON::Serializable

        # Amazon DataZone domain where the asset is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Asset name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier of the project that owns this asset.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # The unique identifier of this asset's type.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Asset description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The external identifier of the asset. If the value for the externalIdentifier parameter is
        # specified, it must be a unique value.
        @[JSON::Field(key: "externalIdentifier")]
        getter external_identifier : String?

        # Metadata forms attached to the asset.
        @[JSON::Field(key: "formsInput")]
        getter forms_input : Array(Types::FormInput)?

        # Glossary terms attached to the asset.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The configuration of the automatically generated business-friendly metadata for the asset.
        @[JSON::Field(key: "predictionConfiguration")]
        getter prediction_configuration : Types::PredictionConfiguration?

        # The revision of this asset's type.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @owning_project_identifier : String,
          @type_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @external_identifier : String? = nil,
          @forms_input : Array(Types::FormInput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @prediction_configuration : Types::PredictionConfiguration? = nil,
          @type_revision : String? = nil
        )
        end
      end

      struct CreateAssetOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The metadata forms that are attached to the created asset.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)

        # The unique identifier of the created asset.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the created asset.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project that owns the created asset.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The identifier of the created asset type.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The revision type of the asset.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # The timestamp of when the asset was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user that created this asset in the catalog.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the created asset.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The external identifier of the asset.
        @[JSON::Field(key: "externalIdentifier")]
        getter external_identifier : String?

        # The timestamp of when the first revision of the asset took place.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The Amazon DataZone user that made the first revision of the asset.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The glossary terms that are attached to the created asset.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The glossary terms in a restricted glossary.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)?

        # The latest data point that was imported into the time series form for the asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointFormsOutput")]
        getter latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # The details of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "listing")]
        getter listing : Types::AssetListingDetails?

        # The configuration of the automatically generated business-friendly metadata for the asset.
        @[JSON::Field(key: "predictionConfiguration")]
        getter prediction_configuration : Types::PredictionConfiguration?

        # The read-only metadata forms that are attached to the created asset.
        @[JSON::Field(key: "readOnlyFormsOutput")]
        getter read_only_forms_output : Array(Types::FormOutput)?

        def initialize(
          @domain_id : String,
          @forms_output : Array(Types::FormOutput),
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @type_identifier : String,
          @type_revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @external_identifier : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @governed_glossary_terms : Array(String)? = nil,
          @latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @listing : Types::AssetListingDetails? = nil,
          @prediction_configuration : Types::PredictionConfiguration? = nil,
          @read_only_forms_output : Array(Types::FormOutput)? = nil
        )
        end
      end

      struct CreateAssetRevisionInput
        include JSON::Serializable

        # The unique identifier of the domain where the asset is being revised.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the asset.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Te revised name of the asset.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The revised description of the asset.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The metadata forms to be attached to the asset as part of asset revision.
        @[JSON::Field(key: "formsInput")]
        getter forms_input : Array(Types::FormInput)?

        # The glossary terms to be attached to the asset as part of asset revision.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The configuration of the automatically generated business-friendly metadata for the asset.
        @[JSON::Field(key: "predictionConfiguration")]
        getter prediction_configuration : Types::PredictionConfiguration?

        # The revision type of the asset.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @forms_input : Array(Types::FormInput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @prediction_configuration : Types::PredictionConfiguration? = nil,
          @type_revision : String? = nil
        )
        end
      end

      struct CreateAssetRevisionOutput
        include JSON::Serializable

        # The unique identifier of the Amazon DataZone domain where the asset was revised.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The metadata forms that were attached to the asset as part of the asset revision.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)

        # The unique identifier of the asset revision.
        @[JSON::Field(key: "id")]
        getter id : String

        # The revised name of the asset.
        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifier of the revised project that owns the asset.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The identifier of the revision type.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The revision type of the asset.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # The timestamp of when the asset revision occured.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who performed the asset revision.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The revised asset description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The external identifier of the asset.
        @[JSON::Field(key: "externalIdentifier")]
        getter external_identifier : String?

        # The timestamp of when the first asset revision occured.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The Amazon DataZone user who performed the first asset revision.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The glossary terms that were attached to the asset as part of asset revision.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The glossary terms in a restricted glossary.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)?

        # The latest data point that was imported into the time series form for the asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointFormsOutput")]
        getter latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # The details of an asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "listing")]
        getter listing : Types::AssetListingDetails?

        # The configuration of the automatically generated business-friendly metadata for the asset.
        @[JSON::Field(key: "predictionConfiguration")]
        getter prediction_configuration : Types::PredictionConfiguration?

        # The read-only metadata forms that were attached to the asset as part of the asset revision.
        @[JSON::Field(key: "readOnlyFormsOutput")]
        getter read_only_forms_output : Array(Types::FormOutput)?

        def initialize(
          @domain_id : String,
          @forms_output : Array(Types::FormOutput),
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @type_identifier : String,
          @type_revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @external_identifier : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @governed_glossary_terms : Array(String)? = nil,
          @latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @listing : Types::AssetListingDetails? = nil,
          @prediction_configuration : Types::PredictionConfiguration? = nil,
          @read_only_forms_output : Array(Types::FormOutput)? = nil
        )
        end
      end

      struct CreateAssetTypeInput
        include JSON::Serializable

        # The unique identifier of the Amazon DataZone domain where the custom asset type is being created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The metadata forms that are to be attached to the custom asset type.
        @[JSON::Field(key: "formsInput")]
        getter forms_input : Hash(String, Types::FormEntryInput)

        # The name of the custom asset type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the Amazon DataZone project that is to own the custom asset type.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # The descripton of the custom asset type.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_identifier : String,
          @forms_input : Hash(String, Types::FormEntryInput),
          @name : String,
          @owning_project_identifier : String,
          @description : String? = nil
        )
        end
      end

      struct CreateAssetTypeOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset type was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The metadata forms that are attached to the asset type.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Hash(String, Types::FormEntryOutput)

        # The name of the asset type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the custom asset type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp of when the asset type is to be created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who creates this custom asset type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the custom asset type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the Amazon DataZone domain where the asset type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The ID of the Amazon DataZone project where the asset type was originally created.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The ID of the Amazon DataZone project that currently owns this asset type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The timestamp of when the custom type was created.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user that created the custom asset type.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @forms_output : Hash(String, Types::FormEntryOutput),
          @name : String,
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @owning_project_id : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateAssetTypePolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      struct CreateConnectionInput
        include JSON::Serializable

        # The ID of the domain where the connection is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The connection name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The location where the connection is created.
        @[JSON::Field(key: "awsLocation")]
        getter aws_location : Types::AwsLocation?

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A connection description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the trusted identity propagation is enabled.
        @[JSON::Field(key: "enableTrustedIdentityPropagation")]
        getter enable_trusted_identity_propagation : Bool?

        # The ID of the environment where the connection is created.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String?

        # The connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesInput?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @aws_location : Types::AwsLocation? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @enable_trusted_identity_propagation : Bool? = nil,
          @environment_identifier : String? = nil,
          @props : Types::ConnectionPropertiesInput? = nil,
          @scope : String? = nil
        )
        end
      end

      struct CreateConnectionOutput
        include JSON::Serializable

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the domain where the connection is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the domain unit where the connection is created.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String

        # The connection name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The physical endpoints of the connection.
        @[JSON::Field(key: "physicalEndpoints")]
        getter physical_endpoints : Array(Types::PhysicalEndpoint)

        # The connection type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The connection description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment where the connection is created.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The ID of the project where the connection is created.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesOutput?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @connection_id : String,
          @domain_id : String,
          @domain_unit_id : String,
          @name : String,
          @physical_endpoints : Array(Types::PhysicalEndpoint),
          @type : String,
          @description : String? = nil,
          @environment_id : String? = nil,
          @project_id : String? = nil,
          @props : Types::ConnectionPropertiesOutput? = nil,
          @scope : String? = nil
        )
        end
      end

      struct CreateDataProductInput
        include JSON::Serializable

        # The ID of the domain where the data product is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the data product.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the owning project of the data product.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the data product.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The metadata forms of the data product.
        @[JSON::Field(key: "formsInput")]
        getter forms_input : Array(Types::FormInput)?

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The data assets of the data product.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductItem)?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @owning_project_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @forms_input : Array(Types::FormInput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @items : Array(Types::DataProductItem)? = nil
        )
        end
      end

      struct CreateDataProductOutput
        include JSON::Serializable

        # The ID of the domain where the data product lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data product.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data product.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the owning project of the data product.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the data product.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The status of the data product.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp at which the data product was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data product.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data product.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which the first revision of the data product was created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The user who created the first revision of the data product.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The metadata forms of the data product.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)?

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The data assets of the data product.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductItem)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @status : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @forms_output : Array(Types::FormOutput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @items : Array(Types::DataProductItem)? = nil
        )
        end
      end

      struct CreateDataProductRevisionInput
        include JSON::Serializable

        # The ID of the domain where the data product revision is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data product revision.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The name of the data product revision.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the data product revision.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The metadata forms of the data product revision.
        @[JSON::Field(key: "formsInput")]
        getter forms_input : Array(Types::FormInput)?

        # The glossary terms of the data product revision.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The data assets of the data product revision.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductItem)?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @forms_input : Array(Types::FormInput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @items : Array(Types::DataProductItem)? = nil
        )
        end
      end

      struct CreateDataProductRevisionOutput
        include JSON::Serializable

        # The ID of the domain where data product revision is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data product revision.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data product revision.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the owning project of the data product revision.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the data product revision.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The status of the data product revision.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp at which the data product revision is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data product revision.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data product revision.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which the first revision of the data product is created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The user who created the first revision of the data product.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The metadata forms of the data product revision.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)?

        # The glossary terms of the data product revision.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The data assets of the data product revision.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductItem)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @status : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @forms_output : Array(Types::FormOutput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @items : Array(Types::DataProductItem)? = nil
        )
        end
      end

      struct CreateDataSourceInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where the data source is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the data source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the Amazon DataZone project in which you want to add this data source.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The type of the data source. In Amazon DataZone, you can use data sources to import technical
        # metadata of assets (data) from the source databases or data warehouses into Amazon DataZone. In the
        # current release of Amazon DataZone, you can create and run data sources for Amazon Web Services Glue
        # and Amazon Redshift.
        @[JSON::Field(key: "type")]
        getter type : String

        # The metadata forms that are to be attached to the assets that this data source works with.
        @[JSON::Field(key: "assetFormsInput")]
        getter asset_forms_input : Array(Types::FormInput)?

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the configuration of the data source. It can be set to either glueRunConfiguration or
        # redshiftRunConfiguration .
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationInput?

        # The ID of the connection.
        @[JSON::Field(key: "connectionIdentifier")]
        getter connection_identifier : String?

        # The description of the data source.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the data source is enabled.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The unique identifier of the Amazon DataZone environment to which the data source publishes assets.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String?

        # Specifies whether the assets that this data source creates in the inventory are to be also
        # automatically published to the catalog.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # Specifies whether the business name generation is to be enabled for this data source.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationConfiguration?

        # The schedule of the data source runs.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @project_identifier : String,
          @type : String,
          @asset_forms_input : Array(Types::FormInput)? = nil,
          @client_token : String? = nil,
          @configuration : Types::DataSourceConfigurationInput? = nil,
          @connection_identifier : String? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_identifier : String? = nil,
          @publish_on_import : Bool? = nil,
          @recommendation : Types::RecommendationConfiguration? = nil,
          @schedule : Types::ScheduleConfiguration? = nil
        )
        end
      end

      struct CreateDataSourceOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data source is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The unique identifier of the data source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project to which the data source is added.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The metadata forms attached to the assets that this data source creates.
        @[JSON::Field(key: "assetFormsOutput")]
        getter asset_forms_output : Array(Types::FormOutput)?

        # Specifies the configuration of the data source. It can be set to either glueRunConfiguration or
        # redshiftRunConfiguration .
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationOutput?

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The timestamp of when the data source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the data source.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the data source is enabled.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The unique identifier of the Amazon DataZone environment to which the data source publishes assets.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The timestamp that specifies when the data source was last run.
        @[JSON::Field(key: "lastRunAt")]
        getter last_run_at : Time?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "lastRunErrorMessage")]
        getter last_run_error_message : Types::DataSourceErrorMessage?

        # The status of the last run of this data source.
        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        # Specifies whether the assets that this data source creates in the inventory are to be also
        # automatically published to the catalog.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # Specifies whether the business name generation is to be enabled for this data source.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationConfiguration?

        # The schedule of the data source runs.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the data source.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp of when the data source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @asset_forms_output : Array(Types::FormOutput)? = nil,
          @configuration : Types::DataSourceConfigurationOutput? = nil,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_id : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_at : Time? = nil,
          @last_run_error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_status : String? = nil,
          @publish_on_import : Bool? = nil,
          @recommendation : Types::RecommendationConfiguration? = nil,
          @schedule : Types::ScheduleConfiguration? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct CreateDomainInput
        include JSON::Serializable

        # The domain execution role that is created when an Amazon DataZone domain is created. The domain
        # execution role is created in the Amazon Web Services account that houses the Amazon DataZone domain.
        @[JSON::Field(key: "domainExecutionRole")]
        getter domain_execution_role : String

        # The name of the Amazon DataZone domain.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the Amazon DataZone domain.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the domain that is created.
        @[JSON::Field(key: "domainVersion")]
        getter domain_version : String?

        # The identifier of the Amazon Web Services Key Management Service (KMS) key that is used to encrypt
        # the Amazon DataZone domain, metadata, and reporting data.
        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The service role of the domain that is created.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The single-sign on configuration of the Amazon DataZone domain.
        @[JSON::Field(key: "singleSignOn")]
        getter single_sign_on : Types::SingleSignOn?

        # The tags specified for the Amazon DataZone domain.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_execution_role : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @domain_version : String? = nil,
          @kms_key_identifier : String? = nil,
          @service_role : String? = nil,
          @single_sign_on : Types::SingleSignOn? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDomainOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of the Amazon DataZone domain.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description of the Amazon DataZone domain.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain execution role that is created when an Amazon DataZone domain is created. The domain
        # execution role is created in the Amazon Web Services account that houses the Amazon DataZone domain.
        @[JSON::Field(key: "domainExecutionRole")]
        getter domain_execution_role : String?

        # The version of the domain that is created.
        @[JSON::Field(key: "domainVersion")]
        getter domain_version : String?

        # The identifier of the Amazon Web Services Key Management Service (KMS) key that is used to encrypt
        # the Amazon DataZone domain, metadata, and reporting data.
        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The name of the Amazon DataZone domain.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL of the data portal for this Amazon DataZone domain.
        @[JSON::Field(key: "portalUrl")]
        getter portal_url : String?

        # The ID of the root domain unit.
        @[JSON::Field(key: "rootDomainUnitId")]
        getter root_domain_unit_id : String?

        # Te service role of the domain that is created.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The single-sign on configuration of the Amazon DataZone domain.
        @[JSON::Field(key: "singleSignOn")]
        getter single_sign_on : Types::SingleSignOn?

        # The status of the Amazon DataZone domain.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags specified for the Amazon DataZone domain.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @arn : String? = nil,
          @description : String? = nil,
          @domain_execution_role : String? = nil,
          @domain_version : String? = nil,
          @kms_key_identifier : String? = nil,
          @name : String? = nil,
          @portal_url : String? = nil,
          @root_domain_unit_id : String? = nil,
          @service_role : String? = nil,
          @single_sign_on : Types::SingleSignOn? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDomainUnitInput
        include JSON::Serializable

        # The ID of the domain where you want to crate a domain unit.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the domain unit.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the parent domain unit.
        @[JSON::Field(key: "parentDomainUnitIdentifier")]
        getter parent_domain_unit_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the domain unit.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @parent_domain_unit_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateDomainUnitOutput
        include JSON::Serializable

        # The IDs of the ancestor domain units.
        @[JSON::Field(key: "ancestorDomainUnitIds")]
        getter ancestor_domain_unit_ids : Array(String)

        # The ID of the domain where the domain unit was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the domain unit.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the domain unit.
        @[JSON::Field(key: "name")]
        getter name : String

        # The owners of the domain unit.
        @[JSON::Field(key: "owners")]
        getter owners : Array(Types::DomainUnitOwnerProperties)

        # The timestamp at which the domain unit was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the domain unit.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the domain unit.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the parent domain unit.
        @[JSON::Field(key: "parentDomainUnitId")]
        getter parent_domain_unit_id : String?

        def initialize(
          @ancestor_domain_unit_ids : Array(String),
          @domain_id : String,
          @id : String,
          @name : String,
          @owners : Array(Types::DomainUnitOwnerProperties),
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @parent_domain_unit_id : String? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateDomainUnitPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      struct CreateEnvironmentActionInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment action is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment in which the environment action is created.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters

        # The description of the environment action that is being created in the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @name : String,
          @parameters : Types::ActionParameters,
          @description : String? = nil
        )
        end
      end

      struct CreateEnvironmentActionOutput
        include JSON::Serializable

        # The ID of the domain in which the environment action is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the environment in which the environment is created.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the environment action.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters

        # The description of the environment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @parameters : Types::ActionParameters,
          @description : String? = nil
        )
        end
      end

      struct CreateEnvironmentBlueprintInput
        include JSON::Serializable

        # The identifier of the domain in which this blueprint is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of this Amazon DataZone blueprint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provisioning properties of this Amazon DataZone blueprint.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties

        # The description of the Amazon DataZone blueprint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The user parameters of this Amazon DataZone blueprint.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @provisioning_properties : Types::ProvisioningProperties,
          @description : String? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct CreateEnvironmentBlueprintOutput
        include JSON::Serializable

        # The ID of this Amazon DataZone blueprint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of this Amazon DataZone blueprint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provider of this Amazon DataZone blueprint.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The provisioning properties of this Amazon DataZone blueprint.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties

        # The timestamp at which the environment blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties of this Amazon DataZone blueprint.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description of this Amazon DataZone blueprint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The glossary terms attached to this Amazon DataZone blueprint.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when this blueprint was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of this Amazon DataZone blueprint.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @id : String,
          @name : String,
          @provider : String,
          @provisioning_properties : Types::ProvisioningProperties,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct CreateEnvironmentInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the environment is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the Amazon DataZone environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the Amazon DataZone project in which this environment is created.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The deployment order of the environment.
        @[JSON::Field(key: "deploymentOrder")]
        getter deployment_order : Int32?

        # The description of the Amazon DataZone environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the account in which the environment is being created.
        @[JSON::Field(key: "environmentAccountIdentifier")]
        getter environment_account_identifier : String?

        # The region of the account in which the environment is being created.
        @[JSON::Field(key: "environmentAccountRegion")]
        getter environment_account_region : String?

        # The ID of the blueprint with which the environment is being created.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String?

        # The configuration ID of the environment.
        @[JSON::Field(key: "environmentConfigurationId")]
        getter environment_configuration_id : String?

        # The identifier of the environment profile that is used to create this Amazon DataZone environment.
        @[JSON::Field(key: "environmentProfileIdentifier")]
        getter environment_profile_identifier : String?

        # The glossary terms that can be used in this Amazon DataZone environment.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The user parameters of this Amazon DataZone environment.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentParameter)?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @project_identifier : String,
          @deployment_order : Int32? = nil,
          @description : String? = nil,
          @environment_account_identifier : String? = nil,
          @environment_account_region : String? = nil,
          @environment_blueprint_identifier : String? = nil,
          @environment_configuration_id : String? = nil,
          @environment_profile_identifier : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @user_parameters : Array(Types::EnvironmentParameter)? = nil
        )
        end
      end

      struct CreateEnvironmentOutput
        include JSON::Serializable

        # The Amazon DataZone user who created this environment.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the environment is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of this environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project in which this environment is created.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of this Amazon DataZone environment.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The Amazon Web Services account in which the Amazon DataZone environment is created.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region in which the Amazon DataZone environment is created.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties of this Amazon DataZone environment.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description of this Amazon DataZone environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configurable actions of this Amazon DataZone environment.
        @[JSON::Field(key: "environmentActions")]
        getter environment_actions : Array(Types::ConfigurableEnvironmentAction)?

        # The ID of the blueprint with which this Amazon DataZone environment was created.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String?

        # The configuration ID of the environment.
        @[JSON::Field(key: "environmentConfigurationId")]
        getter environment_configuration_id : String?

        # The ID of the environment profile with which this Amazon DataZone environment was created.
        @[JSON::Field(key: "environmentProfileId")]
        getter environment_profile_id : String?

        # The glossary terms that can be used in this Amazon DataZone environment.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The ID of this Amazon DataZone environment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The details of the last deployment of this Amazon DataZone environment.
        @[JSON::Field(key: "lastDeployment")]
        getter last_deployment : Types::Deployment?

        # The provisioned resources of this Amazon DataZone environment.
        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::Resource)?

        # The provisioning properties of this Amazon DataZone environment.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties?

        # The status of this Amazon DataZone environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when this environment was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of this Amazon DataZone environment.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @environment_actions : Array(Types::ConfigurableEnvironmentAction)? = nil,
          @environment_blueprint_id : String? = nil,
          @environment_configuration_id : String? = nil,
          @environment_profile_id : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @id : String? = nil,
          @last_deployment : Types::Deployment? = nil,
          @provisioned_resources : Array(Types::Resource)? = nil,
          @provisioning_properties : Types::ProvisioningProperties? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct CreateEnvironmentProfileInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this environment profile is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the blueprint with which this environment profile is created.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String

        # The name of this Amazon DataZone environment profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project in which to create the environment profile.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The Amazon Web Services account in which the Amazon DataZone environment is created.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region in which this environment profile is created.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The description of this Amazon DataZone environment profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The user parameters of this Amazon DataZone environment profile.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentParameter)?

        def initialize(
          @domain_identifier : String,
          @environment_blueprint_identifier : String,
          @name : String,
          @project_identifier : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @description : String? = nil,
          @user_parameters : Array(Types::EnvironmentParameter)? = nil
        )
        end
      end

      struct CreateEnvironmentProfileOutput
        include JSON::Serializable

        # The Amazon DataZone user who created this environment profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which this environment profile is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the blueprint with which this environment profile is created.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The ID of this Amazon DataZone environment profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of this Amazon DataZone environment profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account ID in which this Amazon DataZone environment profile is created.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region in which this Amazon DataZone environment profile is created.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when this environment profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of this Amazon DataZone environment profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the Amazon DataZone project in which this environment profile is created.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The timestamp of when this environment profile was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of this Amazon DataZone environment profile.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @environment_blueprint_id : String,
          @id : String,
          @name : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @project_id : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateEnvironmentProfilePolicyGrantDetail
        include JSON::Serializable

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        def initialize(
          @domain_unit_id : String? = nil
        )
        end
      end

      struct CreateFormTypeInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this metadata form type is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The model of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "model")]
        getter model : Types::Model

        # The name of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project that owns this metadata form type.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # The description of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @model : Types::Model,
          @name : String,
          @owning_project_identifier : String,
          @description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateFormTypeOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this metadata form type is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The description of this Amazon DataZone metadata form type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the Amazon DataZone domain in which this metadata form type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The ID of the project in which this Amazon DataZone metadata form type was originally created.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The ID of the project that owns this Amazon DataZone metadata form type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @revision : String,
          @description : String? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @owning_project_id : String? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateFormTypePolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      struct CreateGlossaryInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of this business glossary.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project that currently owns business glossary.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of this business glossary.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of this business glossary.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The usage restriction of the restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @owning_project_identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @status : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct CreateGlossaryOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of this business glossary.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of this business glossary.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project that currently owns this business glossary.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The description of this business glossary.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status of this business glossary.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The usage restriction of the restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @description : String? = nil,
          @status : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateGlossaryPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      struct CreateGlossaryTermInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary term is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the business glossary in which this term is created.
        @[JSON::Field(key: "glossaryIdentifier")]
        getter glossary_identifier : String

        # The name of this business glossary term.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The long description of this business glossary term.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The short description of this business glossary term.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The status of this business glossary term.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The term relations of this business glossary term.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        def initialize(
          @domain_identifier : String,
          @glossary_identifier : String,
          @name : String,
          @client_token : String? = nil,
          @long_description : String? = nil,
          @short_description : String? = nil,
          @status : String? = nil,
          @term_relations : Types::TermRelations? = nil
        )
        end
      end

      struct CreateGlossaryTermOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary term is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the business glossary in which this term is created.
        @[JSON::Field(key: "glossaryId")]
        getter glossary_id : String

        # The ID of this business glossary term.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of this business glossary term.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of this business glossary term.
        @[JSON::Field(key: "status")]
        getter status : String

        # The long description of this business glossary term.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The short description of this business glossary term.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The term relations of this business glossary term.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        # The usage restriction of the restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @glossary_id : String,
          @id : String,
          @name : String,
          @status : String,
          @long_description : String? = nil,
          @short_description : String? = nil,
          @term_relations : Types::TermRelations? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct CreateGroupProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the group profile is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the group for which the group profile is created.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @group_identifier : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateGroupProfileOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the group profile is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The name of the group for which group profile is created.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The identifier of the group profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the group profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String? = nil,
          @group_name : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateListingChangeSetInput
        include JSON::Serializable

        # Specifies whether to publish or unpublish a listing.
        @[JSON::Field(key: "action")]
        getter action : String

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of an entity.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The revision of an asset.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        def initialize(
          @action : String,
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @client_token : String? = nil,
          @entity_revision : String? = nil
        )
        end
      end

      struct CreateListingChangeSetOutput
        include JSON::Serializable

        # The ID of the listing (a record of an asset at a given time).
        @[JSON::Field(key: "listingId")]
        getter listing_id : String

        # The revision of a listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String

        # Specifies the status of the listing.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @listing_id : String,
          @listing_revision : String,
          @status : String
        )
        end
      end

      # Specifies whether to create a project from project profile policy grant details.
      struct CreateProjectFromProjectProfilePolicyGrantDetail
        include JSON::Serializable

        # Specifies whether to include child domain units when creating a project from project profile policy
        # grant details
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        # Specifies project profiles when creating a project from project profile policy grant details
        @[JSON::Field(key: "projectProfiles")]
        getter project_profiles : Array(String)?

        def initialize(
          @include_child_domain_units : Bool? = nil,
          @project_profiles : Array(String)? = nil
        )
        end
      end

      struct CreateProjectInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this project is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the Amazon DataZone project.
        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the Amazon DataZone project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit. This parameter is not required and if it is not specified, then the
        # project is created at the root domain unit level.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The glossary terms that can be used in this Amazon DataZone project.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The ID of the project profile.
        @[JSON::Field(key: "projectProfileId")]
        getter project_profile_id : String?

        # The resource tags of the project.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The user parameters of the project.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentConfigurationUserParameter)?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @project_profile_id : String? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
        )
        end
      end

      struct CreateProjectMembershipInput
        include JSON::Serializable

        # The designation of the project membership.
        @[JSON::Field(key: "designation")]
        getter designation : String

        # The ID of the Amazon DataZone domain in which project membership is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The project member whose project membership was created.
        @[JSON::Field(key: "member")]
        getter member : Types::Member

        # The ID of the project for which this project membership was created.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        def initialize(
          @designation : String,
          @domain_identifier : String,
          @member : Types::Member,
          @project_identifier : String
        )
        end
      end

      struct CreateProjectMembershipOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateProjectOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the project.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the project was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the Amazon DataZone project.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp of when the project was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment deployment details.
        @[JSON::Field(key: "environmentDeploymentDetails")]
        getter environment_deployment_details : Types::EnvironmentDeploymentDetails?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(Types::ProjectDeletionError)?

        # The glossary terms that can be used in the project.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when the project was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The project profile ID.
        @[JSON::Field(key: "projectProfileId")]
        getter project_profile_id : String?

        # The status of the Amazon DataZone project that was created.
        @[JSON::Field(key: "projectStatus")]
        getter project_status : String?

        # The resource tags of the project.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The user parameters of the project.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentConfigurationUserParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_deployment_details : Types::EnvironmentDeploymentDetails? = nil,
          @failure_reasons : Array(Types::ProjectDeletionError)? = nil,
          @glossary_terms : Array(String)? = nil,
          @last_updated_at : Time? = nil,
          @project_profile_id : String? = nil,
          @project_status : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
        )
        end
      end

      # The details of the policy grant.
      struct CreateProjectPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy grant is applied to child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      struct CreateProjectProfileInput
        include JSON::Serializable

        # A domain ID of the project profile.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Project profile name.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether custom project resource tags are supported.
        @[JSON::Field(key: "allowCustomProjectResourceTags")]
        getter allow_custom_project_resource_tags : Bool?

        # A description of a project profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A domain unit ID of the project profile.
        @[JSON::Field(key: "domainUnitIdentifier")]
        getter domain_unit_identifier : String?

        # Environment configurations of the project profile.
        @[JSON::Field(key: "environmentConfigurations")]
        getter environment_configurations : Array(Types::EnvironmentConfiguration)?

        # The resource tags of the project profile.
        @[JSON::Field(key: "projectResourceTags")]
        getter project_resource_tags : Array(Types::ResourceTagParameter)?

        # Field viewable through the UI that provides a project user with the allowed resource tag
        # specifications.
        @[JSON::Field(key: "projectResourceTagsDescription")]
        getter project_resource_tags_description : String?

        # Project profile status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @name : String,
          @allow_custom_project_resource_tags : Bool? = nil,
          @description : String? = nil,
          @domain_unit_identifier : String? = nil,
          @environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
          @project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
          @project_resource_tags_description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateProjectProfileOutput
        include JSON::Serializable

        # A user who created a project profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the domain where a project profile is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # Project profile ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Project profile name.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether custom project resource tags are supported.
        @[JSON::Field(key: "allowCustomProjectResourceTags")]
        getter allow_custom_project_resource_tags : Bool?

        # A timestamp at which a project profile is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A project profile description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit where a project profile is created.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # Environment configurations of a project profile.
        @[JSON::Field(key: "environmentConfigurations")]
        getter environment_configurations : Array(Types::EnvironmentConfiguration)?

        # A timestamp when a project profile was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The resource tags of the project profile.
        @[JSON::Field(key: "projectResourceTags")]
        getter project_resource_tags : Array(Types::ResourceTagParameter)?

        # Field viewable through the UI that provides a project user with the allowed resource tag
        # specifications.
        @[JSON::Field(key: "projectResourceTagsDescription")]
        getter project_resource_tags_description : String?

        # Project profile status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @allow_custom_project_resource_tags : Bool? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
          @last_updated_at : Time? = nil,
          @project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
          @project_resource_tags_description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateRuleInput
        include JSON::Serializable

        # The action of the rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The detail of the rule.
        @[JSON::Field(key: "detail")]
        getter detail : Types::RuleDetail

        # The ID of the domain where the rule is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The scope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope

        # The target of the rule.
        @[JSON::Field(key: "target")]
        getter target : Types::RuleTarget

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action : String,
          @detail : Types::RuleDetail,
          @domain_identifier : String,
          @name : String,
          @scope : Types::RuleScope,
          @target : Types::RuleTarget,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateRuleOutput
        include JSON::Serializable

        # The action of the rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The timestamp at which the rule is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who creates the rule.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The detail of the rule.
        @[JSON::Field(key: "detail")]
        getter detail : Types::RuleDetail

        # The ID of the rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of the rule.
        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # The scope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope

        # The target of the rule.
        @[JSON::Field(key: "target")]
        getter target : Types::RuleTarget

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The target type of the rule.
        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @created_by : String,
          @detail : Types::RuleDetail,
          @identifier : String,
          @name : String,
          @rule_type : String,
          @scope : Types::RuleScope,
          @target : Types::RuleTarget,
          @description : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      struct CreateSubscriptionGrantInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription grant is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment in which the subscription grant is created.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The entity to which the subscription is to be granted.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntityInput

        # The names of the assets for which the subscription grant is created.
        @[JSON::Field(key: "assetTargetNames")]
        getter asset_target_names : Array(Types::AssetTargetNameMap)?

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ID of the subscription target for which the subscription grant is created.
        @[JSON::Field(key: "subscriptionTargetIdentifier")]
        getter subscription_target_identifier : String?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @granted_entity : Types::GrantedEntityInput,
          @asset_target_names : Array(Types::AssetTargetNameMap)? = nil,
          @client_token : String? = nil,
          @subscription_target_identifier : String? = nil
        )
        end
      end

      struct CreateSubscriptionGrantOutput
        include JSON::Serializable

        # A timestamp of when the subscription grant is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription grant.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription grant is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The entity to which the subscription is granted.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntity

        # The ID of the subscription grant.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription grant.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ID of the subscription target for which the subscription grant is created.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String

        # A timestamp of when the subscription grant was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The assets for which the subscription grant is created.
        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::SubscribedAsset)?

        # The environment ID for which subscription grant is created.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The identifier of the subscription grant.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The Amazon DataZone user who updated the subscription grant.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @granted_entity : Types::GrantedEntity,
          @id : String,
          @status : String,
          @subscription_target_id : String,
          @updated_at : Time,
          @assets : Array(Types::SubscribedAsset)? = nil,
          @environment_id : String? = nil,
          @subscription_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct CreateSubscriptionRequestInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription request is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The reason for the subscription request.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The published asset for which the subscription grant is to be created.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListingInput)

        # The Amazon DataZone principals for whom the subscription request is created.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipalInput)

        # The asset permissions of the subscription request.
        @[JSON::Field(key: "assetPermissions")]
        getter asset_permissions : Array(Types::AssetPermission)?

        # The asset scopes of the subscription request.
        @[JSON::Field(key: "assetScopes")]
        getter asset_scopes : Array(Types::AcceptedAssetScope)?

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The metadata form included in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormInput)?

        def initialize(
          @domain_identifier : String,
          @request_reason : String,
          @subscribed_listings : Array(Types::SubscribedListingInput),
          @subscribed_principals : Array(Types::SubscribedPrincipalInput),
          @asset_permissions : Array(Types::AssetPermission)? = nil,
          @asset_scopes : Array(Types::AcceptedAssetScope)? = nil,
          @client_token : String? = nil,
          @metadata_forms : Array(Types::FormInput)? = nil
        )
        end
      end

      struct CreateSubscriptionRequestOutput
        include JSON::Serializable

        # A timestamp of when the subscription request is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription request.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in whcih the subscription request is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the subscription request.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reason for the subscription request.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # The published asset for which the subscription grant is to be created.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # The subscribed principals of the subscription request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # The timestamp of when the subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The decision comment of the subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # The metadata form included in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormOutput)?

        # The ID of the reviewer of the subscription request.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # The Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms : Array(Types::FormOutput)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct CreateSubscriptionTargetInput
        include JSON::Serializable

        # The asset types that can be included in the subscription target.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)

        # The authorized principals of the subscription target.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)

        # The ID of the Amazon DataZone domain in which subscription target is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment in which subscription target is created.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The manage access role that is used to create the subscription target.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String

        # The name of the subscription target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration of the subscription target.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)

        # The type of the subscription target.
        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The provider of the subscription target.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        def initialize(
          @applicable_asset_types : Array(String),
          @authorized_principals : Array(String),
          @domain_identifier : String,
          @environment_identifier : String,
          @manage_access_role : String,
          @name : String,
          @subscription_target_config : Array(Types::SubscriptionTargetForm),
          @type : String,
          @client_token : String? = nil,
          @provider : String? = nil,
          @subscription_grant_creation_mode : String? = nil
        )
        end
      end

      struct CreateSubscriptionTargetOutput
        include JSON::Serializable

        # The asset types that can be included in the subscription target.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)

        # The authorised principals of the subscription target.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)

        # The timestamp of when the subscription target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription target.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription target was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the environment in which the subscription target was created.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the subscription target.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the subscription target.
        @[JSON::Field(key: "name")]
        getter name : String

        # ???
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of the subscription target.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The configuration of the subscription target.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)

        # The type of the subscription target.
        @[JSON::Field(key: "type")]
        getter type : String

        # The manage access role with which the subscription target was created.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        # The timestamp of when the subscription target was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the subscription target.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @applicable_asset_types : Array(String),
          @authorized_principals : Array(String),
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @subscription_target_config : Array(Types::SubscriptionTargetForm),
          @type : String,
          @manage_access_role : String? = nil,
          @subscription_grant_creation_mode : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct CreateUserProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a user profile is created.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the user for which the user profile is created.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The user type of the user for which the user profile is created.
        @[JSON::Field(key: "userType")]
        getter user_type : String?

        def initialize(
          @domain_identifier : String,
          @user_identifier : String,
          @client_token : String? = nil,
          @user_type : String? = nil
        )
        end
      end

      struct CreateUserProfileOutput
        include JSON::Serializable

        # The user profile details.
        @[JSON::Field(key: "details")]
        getter details : Types::UserProfileDetails?

        # The identifier of the Amazon DataZone domain in which a user profile is created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The identifier of the user profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the user profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the user profile.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Types::UserProfileDetails? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The custom Amazon Web Services Lambda handler within an account pool.
      struct CustomAccountPoolHandler
        include JSON::Serializable

        # The ARN of the Amazon Web Services Lambda function for the custom Amazon Web Services Lambda
        # handler.
        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String

        # The ARN of the IAM role that enables Amazon SageMaker Unified Studio to invoke the Amazon Web
        # Services Lambda funtion if the account source is the custom account pool handler.
        @[JSON::Field(key: "lambdaExecutionRoleArn")]
        getter lambda_execution_role_arn : String?

        def initialize(
          @lambda_function_arn : String,
          @lambda_execution_role_arn : String? = nil
        )
        end
      end

      # The details of user parameters of an environment blueprint.
      struct CustomParameter
        include JSON::Serializable

        # The filed type of the parameter.
        @[JSON::Field(key: "fieldType")]
        getter field_type : String

        # The key name of the parameter.
        @[JSON::Field(key: "keyName")]
        getter key_name : String

        # The default value of the parameter.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The description of the parameter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the parameter is editable.
        @[JSON::Field(key: "isEditable")]
        getter is_editable : Bool?

        # Specifies whether the custom parameter is optional.
        @[JSON::Field(key: "isOptional")]
        getter is_optional : Bool?

        # Specifies whether a parameter value can be updated after creation.
        @[JSON::Field(key: "isUpdateSupported")]
        getter is_update_supported : Bool?

        def initialize(
          @field_type : String,
          @key_name : String,
          @default_value : String? = nil,
          @description : String? = nil,
          @is_editable : Bool? = nil,
          @is_optional : Bool? = nil,
          @is_update_supported : Bool? = nil
        )
        end
      end

      # The data product.
      struct DataProductItem
        include JSON::Serializable

        # The ID of the data product.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The type of the data product.
        @[JSON::Field(key: "itemType")]
        getter item_type : String

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The revision of the data product.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @identifier : String,
          @item_type : String,
          @glossary_terms : Array(String)? = nil,
          @revision : String? = nil
        )
        end
      end

      # The additional attributes of an Amazon DataZone data product.
      struct DataProductItemAdditionalAttributes
        include JSON::Serializable

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        def initialize(
          @match_rationale : Array(Types::MatchRationaleItem)? = nil
        )
        end
      end

      # The data product listing.
      struct DataProductListing
        include JSON::Serializable

        # The timestamp at which the data product listing was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the data product listing.
        @[JSON::Field(key: "dataProductId")]
        getter data_product_id : String?

        # The revision of the data product listing.
        @[JSON::Field(key: "dataProductRevision")]
        getter data_product_revision : String?

        # The metadata forms of the data product listing.
        @[JSON::Field(key: "forms")]
        getter forms : String?

        # The glossary terms of the data product listing.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The data assets of the data product listing.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListingSummary)?

        # The ID of the owning project of the data product listing.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        def initialize(
          @created_at : Time? = nil,
          @data_product_id : String? = nil,
          @data_product_revision : String? = nil,
          @forms : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @items : Array(Types::ListingSummary)? = nil,
          @owning_project_id : String? = nil
        )
        end
      end

      # The asset of the data product listing.
      struct DataProductListingItem
        include JSON::Serializable

        # The additional attributes of the asset of the data product.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::DataProductListingItemAdditionalAttributes?

        # The timestamp at which the asset of the data product listing was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the asset of the asset of the data product.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The entity ID of the asset of the asset of the data product.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The revision of the asset of the asset of the data product.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        # The glossary terms of the asset of the asset of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The data of the asset of the data product.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ListingSummaryItem)?

        # The timestamp at which the listing was created.
        @[JSON::Field(key: "listingCreatedBy")]
        getter listing_created_by : String?

        # The ID of the listing.
        @[JSON::Field(key: "listingId")]
        getter listing_id : String?

        # The revision of the listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String?

        # The user who updated the listing.
        @[JSON::Field(key: "listingUpdatedBy")]
        getter listing_updated_by : String?

        # The name of the asset of the data product.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the owning project of the asset of the data product.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        def initialize(
          @additional_attributes : Types::DataProductListingItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @entity_id : String? = nil,
          @entity_revision : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @items : Array(Types::ListingSummaryItem)? = nil,
          @listing_created_by : String? = nil,
          @listing_id : String? = nil,
          @listing_revision : String? = nil,
          @listing_updated_by : String? = nil,
          @name : String? = nil,
          @owning_project_id : String? = nil
        )
        end
      end

      # The additional attributes of the asset of the data product.
      struct DataProductListingItemAdditionalAttributes
        include JSON::Serializable

        # The metadata forms of the asset of the data product.
        @[JSON::Field(key: "forms")]
        getter forms : String?

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        def initialize(
          @forms : String? = nil,
          @match_rationale : Array(Types::MatchRationaleItem)? = nil
        )
        end
      end

      # The data product.
      struct DataProductResultItem
        include JSON::Serializable

        # The ID of the domain where the data product lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data product.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data product.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the owning project of the data product.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The additional attributes of an Amazon DataZone data product.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::DataProductItemAdditionalAttributes?

        # The timestamp at which the data product was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data product.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data product.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which first revision of the data product was created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The user who created the first revision of the data product.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @additional_attributes : Types::DataProductItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @glossary_terms : Array(String)? = nil
        )
        end
      end

      # The data product revision.
      struct DataProductRevision
        include JSON::Serializable

        # The timestamp at which the data product revision was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data product revision.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the domain where the data product revision lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the data product revision.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The data product revision.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # The configuration of the data source.
      struct DataSourceConfigurationInput
        include JSON::Serializable

        # The configuration of the Amazon Web Services Glue data source.
        @[JSON::Field(key: "glueRunConfiguration")]
        getter glue_run_configuration : Types::GlueRunConfigurationInput?

        # The configuration of the Amazon Redshift data source.
        @[JSON::Field(key: "redshiftRunConfiguration")]
        getter redshift_run_configuration : Types::RedshiftRunConfigurationInput?

        # The Amazon SageMaker run configuration.
        @[JSON::Field(key: "sageMakerRunConfiguration")]
        getter sage_maker_run_configuration : Types::SageMakerRunConfigurationInput?

        def initialize(
          @glue_run_configuration : Types::GlueRunConfigurationInput? = nil,
          @redshift_run_configuration : Types::RedshiftRunConfigurationInput? = nil,
          @sage_maker_run_configuration : Types::SageMakerRunConfigurationInput? = nil
        )
        end
      end

      # The configuration of the data source.
      struct DataSourceConfigurationOutput
        include JSON::Serializable

        # The configuration of the Amazon Web Services Glue data source.
        @[JSON::Field(key: "glueRunConfiguration")]
        getter glue_run_configuration : Types::GlueRunConfigurationOutput?

        # The configuration of the Amazon Redshift data source.
        @[JSON::Field(key: "redshiftRunConfiguration")]
        getter redshift_run_configuration : Types::RedshiftRunConfigurationOutput?

        # The Amazon SageMaker run configuration.
        @[JSON::Field(key: "sageMakerRunConfiguration")]
        getter sage_maker_run_configuration : Types::SageMakerRunConfigurationOutput?

        def initialize(
          @glue_run_configuration : Types::GlueRunConfigurationOutput? = nil,
          @redshift_run_configuration : Types::RedshiftRunConfigurationOutput? = nil,
          @sage_maker_run_configuration : Types::SageMakerRunConfigurationOutput? = nil
        )
        end
      end

      # The details of the error message that is returned if the operation cannot be successfully completed.
      struct DataSourceErrorMessage
        include JSON::Serializable

        # The type of the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorType")]
        getter error_type : String

        # The details of the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorDetail")]
        getter error_detail : String?

        def initialize(
          @error_type : String,
          @error_detail : String? = nil
        )
        end
      end

      # The activity details of the data source run.
      struct DataSourceRunActivity
        include JSON::Serializable

        # The timestamp of when data source run activity was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The status of the asset included in the data source run activity.
        @[JSON::Field(key: "dataAssetStatus")]
        getter data_asset_status : String

        # The identifier of the data source for the data source run activity.
        @[JSON::Field(key: "dataSourceRunId")]
        getter data_source_run_id : String

        # The database included in the data source run activity.
        @[JSON::Field(key: "database")]
        getter database : String

        # The project ID included in the data source run activity.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The technical name included in the data source run activity.
        @[JSON::Field(key: "technicalName")]
        getter technical_name : String

        # The timestamp of when data source run activity was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The identifier of the asset included in the data source run activity.
        @[JSON::Field(key: "dataAssetId")]
        getter data_asset_id : String?

        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The data lineage summary.
        @[JSON::Field(key: "lineageSummary")]
        getter lineage_summary : Types::LineageInfo?

        # The technical description included in the data source run activity.
        @[JSON::Field(key: "technicalDescription")]
        getter technical_description : String?

        def initialize(
          @created_at : Time,
          @data_asset_status : String,
          @data_source_run_id : String,
          @database : String,
          @project_id : String,
          @technical_name : String,
          @updated_at : Time,
          @data_asset_id : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @lineage_summary : Types::LineageInfo? = nil,
          @technical_description : String? = nil
        )
        end
      end

      # The run lineage summary of a data source.
      struct DataSourceRunLineageSummary
        include JSON::Serializable

        # The import status that's part of the run lineage summary of a data source.
        @[JSON::Field(key: "importStatus")]
        getter import_status : String?

        def initialize(
          @import_status : String? = nil
        )
        end
      end

      # The details of a data source run.
      struct DataSourceRunSummary
        include JSON::Serializable

        # The timestamp of when a data source run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier of the data source of the data source run.
        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the data source run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The project ID of the data source run.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The status of the data source run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the data source run.
        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when a data source run was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The run lineage summary of a data source.
        @[JSON::Field(key: "lineageSummary")]
        getter lineage_summary : Types::DataSourceRunLineageSummary?

        @[JSON::Field(key: "runStatisticsForAssets")]
        getter run_statistics_for_assets : Types::RunStatisticsForAssets?

        # The timestamp of when a data source run was started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The timestamp of when a data source run was stopped.
        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Time?

        def initialize(
          @created_at : Time,
          @data_source_id : String,
          @id : String,
          @project_id : String,
          @status : String,
          @type : String,
          @updated_at : Time,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @lineage_summary : Types::DataSourceRunLineageSummary? = nil,
          @run_statistics_for_assets : Types::RunStatisticsForAssets? = nil,
          @started_at : Time? = nil,
          @stopped_at : Time? = nil
        )
        end
      end

      # The details of the data source.
      struct DataSourceSummary
        include JSON::Serializable

        # The ID of the data source.
        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The ID of the Amazon DataZone domain in which the data source exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the data source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the data source.
        @[JSON::Field(key: "type")]
        getter type : String

        # The connection ID that's part of the data source summary.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The timestamp of when the data source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The data source description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether the data source is enabled.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The ID of the environment in which the data source exists.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The count of the assets created during the last data source run.
        @[JSON::Field(key: "lastRunAssetCount")]
        getter last_run_asset_count : Int32?

        # The timestamp of when the data source run was last performed.
        @[JSON::Field(key: "lastRunAt")]
        getter last_run_at : Time?

        @[JSON::Field(key: "lastRunErrorMessage")]
        getter last_run_error_message : Types::DataSourceErrorMessage?

        # The status of the last data source run.
        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        # The timestamp of when the data source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @data_source_id : String,
          @domain_id : String,
          @name : String,
          @status : String,
          @type : String,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_id : String? = nil,
          @last_run_asset_count : Int32? = nil,
          @last_run_at : Time? = nil,
          @last_run_error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_status : String? = nil,
          @schedule : Types::ScheduleConfiguration? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct DeleteAccountPoolInput
        include JSON::Serializable

        # The ID of the domain where the account pool is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the account pool to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteAccountPoolOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAssetFilterInput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The ID of the domain where you want to delete an asset filter.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset filter that you want to delete.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @asset_identifier : String,
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteAssetInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the asset that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteAssetOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAssetTypeInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset type is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the asset type that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteAssetTypeOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteConnectionInput
        include JSON::Serializable

        # The ID of the domain where the connection is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the connection that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteConnectionOutput
        include JSON::Serializable

        # The status of the action.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DeleteDataProductInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data product is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the data product that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteDataProductOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDataSourceInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data source is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the data source that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies that the granted permissions are retained in case of a self-subscribe functionality
        # failure for a data source.
        @[JSON::Field(key: "retainPermissionsOnRevokeFailure")]
        getter retain_permissions_on_revoke_failure : Bool?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @client_token : String? = nil,
          @retain_permissions_on_revoke_failure : Bool? = nil
        )
        end
      end

      struct DeleteDataSourceOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data source is deleted.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data source that is deleted.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data source that is deleted.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project in which this data source exists and from which it's deleted.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The asset data forms associated with this data source.
        @[JSON::Field(key: "assetFormsOutput")]
        getter asset_forms_output : Array(Types::FormOutput)?

        # The configuration of the data source that is deleted.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationOutput?

        # The ID of the connection that is deleted.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The timestamp of when this data source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the data source that is deleted.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The enable setting of the data source that specifies whether the data source is enabled or disabled.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The ID of the environemnt associated with this data source.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The timestamp of when the data source was last run.
        @[JSON::Field(key: "lastRunAt")]
        getter last_run_at : Time?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "lastRunErrorMessage")]
        getter last_run_error_message : Types::DataSourceErrorMessage?

        # The status of the last run of this data source.
        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        # Specifies whether the assets that this data source creates in the inventory are to be also
        # automatically published to the catalog.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # Specifies that the granted permissions are retained in case of a self-subscribe functionality
        # failure for a data source.
        @[JSON::Field(key: "retainPermissionsOnRevokeFailure")]
        getter retain_permissions_on_revoke_failure : Bool?

        # The schedule of runs for this data source.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        # Specifies the status of the self-granting functionality.
        @[JSON::Field(key: "selfGrantStatus")]
        getter self_grant_status : Types::SelfGrantStatusOutput?

        # The status of this data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of this data source.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp of when this data source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @asset_forms_output : Array(Types::FormOutput)? = nil,
          @configuration : Types::DataSourceConfigurationOutput? = nil,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_id : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_at : Time? = nil,
          @last_run_error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_status : String? = nil,
          @publish_on_import : Bool? = nil,
          @retain_permissions_on_revoke_failure : Bool? = nil,
          @schedule : Types::ScheduleConfiguration? = nil,
          @self_grant_status : Types::SelfGrantStatusOutput? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct DeleteDomainInput
        include JSON::Serializable

        # The identifier of the Amazon Web Services domain that is to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the optional flag to delete all child entities within the domain.
        @[JSON::Field(key: "skipDeletionCheck")]
        getter skip_deletion_check : Bool?

        def initialize(
          @identifier : String,
          @client_token : String? = nil,
          @skip_deletion_check : Bool? = nil
        )
        end
      end

      struct DeleteDomainOutput
        include JSON::Serializable

        # The status of the domain.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      struct DeleteDomainUnitInput
        include JSON::Serializable

        # The ID of the domain where you want to delete a domain unit.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the domain unit that you want to delete.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteDomainUnitOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEnvironmentActionInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which an environment action is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment where an environment action is deleted.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ID of the environment action that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteEnvironmentBlueprintConfigurationInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the blueprint configuration is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the blueprint the configuration of which is deleted.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_blueprint_identifier : String
        )
        end
      end

      struct DeleteEnvironmentBlueprintConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEnvironmentBlueprintInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the blueprint is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the blueprint that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteEnvironmentInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment that is to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteEnvironmentProfileInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment profile is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment profile that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteFormTypeInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the metadata form type is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the metadata form type that is deleted.
        @[JSON::Field(key: "formTypeIdentifier")]
        getter form_type_identifier : String

        def initialize(
          @domain_identifier : String,
          @form_type_identifier : String
        )
        end
      end

      struct DeleteFormTypeOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteGlossaryInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the business glossary is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the business glossary that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteGlossaryOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteGlossaryTermInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the business glossary term is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the business glossary term that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteGlossaryTermOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteListingInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the listing to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteListingOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProjectInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the project is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the project that is to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies the optional flag to delete all child entities within the project.
        @[JSON::Field(key: "skipDeletionCheck")]
        getter skip_deletion_check : Bool?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @skip_deletion_check : Bool? = nil
        )
        end
      end

      struct DeleteProjectMembershipInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where project membership is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The project member whose project membership is deleted.
        @[JSON::Field(key: "member")]
        getter member : Types::Member

        # The ID of the Amazon DataZone project the membership to which is deleted.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        def initialize(
          @domain_identifier : String,
          @member : Types::Member,
          @project_identifier : String
        )
        end
      end

      struct DeleteProjectMembershipOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProjectOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProjectProfileInput
        include JSON::Serializable

        # The ID of the domain where a project profile is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the project profile that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteProjectProfileOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteRuleInput
        include JSON::Serializable

        # The ID of the domain that where the rule is to be deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the rule that is to be deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteRuleOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteSubscriptionGrantInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where the subscription grant is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the subscription grant that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteSubscriptionGrantOutput
        include JSON::Serializable

        # The timestamp of when the subscription grant that is deleted was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription grant that is deleted.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription grant is deleted.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The entity to which the subscription is deleted.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntity

        # The ID of the subscription grant that is deleted.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription grant that is deleted.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ID of the subscription target associated with the subscription grant that is deleted.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String

        # The timestamp of when the subscription grant that is deleted was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The assets for which the subsctiption grant that is deleted gave access.
        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::SubscribedAsset)?

        # The ID of the environment in which the subscription grant is deleted.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The identifier of the subsctiption whose subscription grant is to be deleted.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The Amazon DataZone user who updated the subscription grant that is deleted.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @granted_entity : Types::GrantedEntity,
          @id : String,
          @status : String,
          @subscription_target_id : String,
          @updated_at : Time,
          @assets : Array(Types::SubscribedAsset)? = nil,
          @environment_id : String? = nil,
          @subscription_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct DeleteSubscriptionRequestInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription request is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the subscription request that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteSubscriptionTargetInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription target is deleted.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the Amazon DataZone environment in which the subscription target is deleted.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ID of the subscription target that is deleted.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String
        )
        end
      end

      struct DeleteTimeSeriesDataPointsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain that houses the asset for which you want to delete a time
        # series form.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset for which you want to delete a time series form.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset for which you want to delete a time series form.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The name of the time series form that you want to delete.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @form_name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteTimeSeriesDataPointsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The details of the last deployment of the environment.
      struct Deployment
        include JSON::Serializable

        # The identifier of the last deployment of the environment.
        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The status of the last deployment of the environment.
        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?

        # The type of the last deployment of the environment.
        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        # The failure reason of the last deployment of the environment.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : Types::EnvironmentError?

        # Specifies whether the last deployment of the environment is complete.
        @[JSON::Field(key: "isDeploymentComplete")]
        getter is_deployment_complete : Bool?

        # The messages of the last deployment of the environment.
        @[JSON::Field(key: "messages")]
        getter messages : Array(String)?

        def initialize(
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_type : String? = nil,
          @failure_reason : Types::EnvironmentError? = nil,
          @is_deployment_complete : Bool? = nil,
          @messages : Array(String)? = nil
        )
        end
      end

      # The deployment properties of the Amazon DataZone blueprint.
      struct DeploymentProperties
        include JSON::Serializable

        # The end timeout of the environment blueprint deployment.
        @[JSON::Field(key: "endTimeoutMinutes")]
        getter end_timeout_minutes : Int32?

        # The start timeout of the environment blueprint deployment.
        @[JSON::Field(key: "startTimeoutMinutes")]
        getter start_timeout_minutes : Int32?

        def initialize(
          @end_timeout_minutes : Int32? = nil,
          @start_timeout_minutes : Int32? = nil
        )
        end
      end

      # Details of a glossary term attached to the inventory asset.
      struct DetailedGlossaryTerm
        include JSON::Serializable

        # The name of a glossary term attached to the inventory asset.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The shoft description of a glossary term attached to the inventory asset.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        def initialize(
          @name : String? = nil,
          @short_description : String? = nil
        )
        end
      end

      struct DisassociateEnvironmentRoleInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which an environment role is disassociated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ARN of the environment role.
        @[JSON::Field(key: "environmentRoleArn")]
        getter environment_role_arn : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @environment_role_arn : String
        )
        end
      end

      struct DisassociateEnvironmentRoleOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateGovernedTermsInput
        include JSON::Serializable

        # The ID of the domain where you want to disassociate restricted terms from an asset.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of an asset from which you want to disassociate restricted terms.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset from which you want to disassociate restricted terms.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The restricted glossary terms that you want to disassociate from an asset.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @governed_glossary_terms : Array(String)
        )
        end
      end

      struct DisassociateGovernedTermsOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A summary of a Amazon DataZone domain.
      struct DomainSummary
        include JSON::Serializable

        # The ARN of the Amazon DataZone domain.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # A timestamp of when a Amazon DataZone domain was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "id")]
        getter id : String

        # The identifier of the Amazon Web Services account that manages the domain.
        @[JSON::Field(key: "managedAccountId")]
        getter managed_account_id : String

        # A name of an Amazon DataZone domain.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the Amazon DataZone domain.
        @[JSON::Field(key: "status")]
        getter status : String

        # A description of an Amazon DataZone domain.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain version.
        @[JSON::Field(key: "domainVersion")]
        getter domain_version : String?

        # A timestamp of when a Amazon DataZone domain was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The data portal URL for the Amazon DataZone domain.
        @[JSON::Field(key: "portalUrl")]
        getter portal_url : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @managed_account_id : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @domain_version : String? = nil,
          @last_updated_at : Time? = nil,
          @portal_url : String? = nil
        )
        end
      end

      # The domain unit filter of the project grant filter.
      struct DomainUnitFilterForProject
        include JSON::Serializable

        # The domain unit ID to use in the filter.
        @[JSON::Field(key: "domainUnit")]
        getter domain_unit : String

        # Specifies whether to include child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @domain_unit : String,
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      # The grant filter for the domain unit. In the current release of Amazon DataZone, the only supported
      # filter is the allDomainUnitsGrantFilter .
      struct DomainUnitGrantFilter
        include JSON::Serializable

        # Specifies a grant filter containing all domain units.
        @[JSON::Field(key: "allDomainUnitsGrantFilter")]
        getter all_domain_units_grant_filter : Types::AllDomainUnitsGrantFilter?

        def initialize(
          @all_domain_units_grant_filter : Types::AllDomainUnitsGrantFilter? = nil
        )
        end
      end

      # The properties of a domain unit group.
      struct DomainUnitGroupProperties
        include JSON::Serializable

        # The ID of the domain unit group.
        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        def initialize(
          @group_id : String? = nil
        )
        end
      end

      # The properties of the domain unit owner.
      struct DomainUnitOwnerProperties
        include JSON::Serializable

        # Indicates that the domain unit owner is a group.
        @[JSON::Field(key: "group")]
        getter group : Types::DomainUnitGroupProperties?

        # Indicates that the domain unit owner is a user.
        @[JSON::Field(key: "user")]
        getter user : Types::DomainUnitUserProperties?

        def initialize(
          @group : Types::DomainUnitGroupProperties? = nil,
          @user : Types::DomainUnitUserProperties? = nil
        )
        end
      end

      # The domain unit principal to whom the policy is granted.
      struct DomainUnitPolicyGrantPrincipal
        include JSON::Serializable

        # Specifes the designation of the domain unit users.
        @[JSON::Field(key: "domainUnitDesignation")]
        getter domain_unit_designation : String

        # The grant filter for the domain unit.
        @[JSON::Field(key: "domainUnitGrantFilter")]
        getter domain_unit_grant_filter : Types::DomainUnitGrantFilter?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitIdentifier")]
        getter domain_unit_identifier : String?

        def initialize(
          @domain_unit_designation : String,
          @domain_unit_grant_filter : Types::DomainUnitGrantFilter? = nil,
          @domain_unit_identifier : String? = nil
        )
        end
      end

      # The summary of the domain unit.
      struct DomainUnitSummary
        include JSON::Serializable

        # The ID of the domain unit summary.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the domain unit summary.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @id : String,
          @name : String
        )
        end
      end

      # The target for the domain unit.
      struct DomainUnitTarget
        include JSON::Serializable

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String

        # Specifies whether to apply a rule to the child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @domain_unit_id : String,
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      # The properties of the domain unit user.
      struct DomainUnitUserProperties
        include JSON::Serializable

        # The ID of teh domain unit user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # The encryption configuration details.
      struct EncryptionConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the KMS key to use for encryption. This field is required only
        # when sseAlgorithm is set to aws:kms .
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The server-side encryption algorithm to use. Valid values are AES256 for S3-managed encryption keys,
        # or aws:kms for Amazon Web Services KMS-managed encryption keys. If you choose SSE-KMS encryption you
        # must grant the S3 Tables maintenance principal access to your KMS key. For more information, see
        # Permissions requirements for S3 Tables SSE-KMS encryption .
        @[JSON::Field(key: "sseAlgorithm")]
        getter sse_algorithm : String?

        def initialize(
          @kms_key_arn : String? = nil,
          @sse_algorithm : String? = nil
        )
        end
      end

      # The details about the specified action configured for an environment. For example, the details of
      # the specified console links for an analytics tool that is available in this environment.
      struct EnvironmentActionSummary
        include JSON::Serializable

        # The Amazon DataZone domain ID of the environment action.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The environment ID of the environment action.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the environment action.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters

        # The environment action description.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @parameters : Types::ActionParameters,
          @description : String? = nil
        )
        end
      end

      # The configuration details of an environment blueprint.
      struct EnvironmentBlueprintConfigurationItem
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which an environment blueprint exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the environment blueprint.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The timestamp of when an environment blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The enabled Amazon Web Services Regions specified in a blueprint configuration.
        @[JSON::Field(key: "enabledRegions")]
        getter enabled_regions : Array(String)?

        # The environment role permission boundary.
        @[JSON::Field(key: "environmentRolePermissionBoundary")]
        getter environment_role_permission_boundary : String?

        # The ARN of the manage access role specified in the environment blueprint configuration.
        @[JSON::Field(key: "manageAccessRoleArn")]
        getter manage_access_role_arn : String?

        # The provisioning configuration of a blueprint.
        @[JSON::Field(key: "provisioningConfigurations")]
        getter provisioning_configurations : Array(Types::ProvisioningConfiguration)?

        # The ARN of the provisioning role specified in the environment blueprint configuration.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # The regional parameters of the environment blueprint.
        @[JSON::Field(key: "regionalParameters")]
        getter regional_parameters : Hash(String, Hash(String, String))?

        # The timestamp of when the environment blueprint was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @environment_blueprint_id : String,
          @created_at : Time? = nil,
          @enabled_regions : Array(String)? = nil,
          @environment_role_permission_boundary : String? = nil,
          @manage_access_role_arn : String? = nil,
          @provisioning_configurations : Array(Types::ProvisioningConfiguration)? = nil,
          @provisioning_role_arn : String? = nil,
          @regional_parameters : Hash(String, Hash(String, String))? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The details of an environment blueprint summary.
      struct EnvironmentBlueprintSummary
        include JSON::Serializable

        # The identifier of the blueprint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the blueprint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provider of the blueprint.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The provisioning properties of the blueprint.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties

        # The timestamp of when an environment blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of a blueprint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the blueprint was enabled.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @id : String,
          @name : String,
          @provider : String,
          @provisioning_properties : Types::ProvisioningProperties,
          @created_at : Time? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The configuration of an environment.
      struct EnvironmentConfiguration
        include JSON::Serializable

        # The environment blueprint ID.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The environment name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The account pools used by a custom project profile.
        @[JSON::Field(key: "accountPools")]
        getter account_pools : Array(String)?

        # The Amazon Web Services account of the environment.
        @[JSON::Field(key: "awsAccount")]
        getter aws_account : Types::AwsAccount?

        # The Amazon Web Services Region of the environment.
        @[JSON::Field(key: "awsRegion")]
        getter aws_region : Types::Region?

        # The configuration parameters of the environment.
        @[JSON::Field(key: "configurationParameters")]
        getter configuration_parameters : Types::EnvironmentConfigurationParametersDetails?

        # The deployment mode of the environment.
        @[JSON::Field(key: "deploymentMode")]
        getter deployment_mode : String?

        # The deployment order of the environment.
        @[JSON::Field(key: "deploymentOrder")]
        getter deployment_order : Int32?

        # The environment description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment ID.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @environment_blueprint_id : String,
          @name : String,
          @account_pools : Array(String)? = nil,
          @aws_account : Types::AwsAccount? = nil,
          @aws_region : Types::Region? = nil,
          @configuration_parameters : Types::EnvironmentConfigurationParametersDetails? = nil,
          @deployment_mode : String? = nil,
          @deployment_order : Int32? = nil,
          @description : String? = nil,
          @id : String? = nil
        )
        end
      end

      # The environment configuration parameter.
      struct EnvironmentConfigurationParameter
        include JSON::Serializable

        # Specifies whether the environment parameter is editable.
        @[JSON::Field(key: "isEditable")]
        getter is_editable : Bool?

        # The name of the environment configuration parameter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the environment configuration parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @is_editable : Bool? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The details of the environment configuration parameter.
      struct EnvironmentConfigurationParametersDetails
        include JSON::Serializable

        # The parameter overrides.
        @[JSON::Field(key: "parameterOverrides")]
        getter parameter_overrides : Array(Types::EnvironmentConfigurationParameter)?

        # The resolved environment configuration parameters.
        @[JSON::Field(key: "resolvedParameters")]
        getter resolved_parameters : Array(Types::EnvironmentConfigurationParameter)?

        # Ssm path environment configuration parameters.
        @[JSON::Field(key: "ssmPath")]
        getter ssm_path : String?

        def initialize(
          @parameter_overrides : Array(Types::EnvironmentConfigurationParameter)? = nil,
          @resolved_parameters : Array(Types::EnvironmentConfigurationParameter)? = nil,
          @ssm_path : String? = nil
        )
        end
      end

      # The environment configuration user parameters.
      struct EnvironmentConfigurationUserParameter
        include JSON::Serializable

        # The environment configuration name.
        @[JSON::Field(key: "environmentConfigurationName")]
        getter environment_configuration_name : String?

        # The ID of the environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The environment parameters.
        @[JSON::Field(key: "environmentParameters")]
        getter environment_parameters : Array(Types::EnvironmentParameter)?

        # Specifies the account/Region that is to be used during project creation for a particular blueprint.
        @[JSON::Field(key: "environmentResolvedAccount")]
        getter environment_resolved_account : Types::EnvironmentResolvedAccount?

        def initialize(
          @environment_configuration_name : String? = nil,
          @environment_id : String? = nil,
          @environment_parameters : Array(Types::EnvironmentParameter)? = nil,
          @environment_resolved_account : Types::EnvironmentResolvedAccount? = nil
        )
        end
      end

      # The environment deployment details.
      struct EnvironmentDeploymentDetails
        include JSON::Serializable

        # Environment failure reasons.
        @[JSON::Field(key: "environmentFailureReasons")]
        getter environment_failure_reasons : Hash(String, Array(Types::EnvironmentError))?

        # The overall deployment status of the environment.
        @[JSON::Field(key: "overallDeploymentStatus")]
        getter overall_deployment_status : String?

        def initialize(
          @environment_failure_reasons : Hash(String, Array(Types::EnvironmentError))? = nil,
          @overall_deployment_status : String? = nil
        )
        end
      end

      # The failure reasons for the environment deployment.
      struct EnvironmentError
        include JSON::Serializable

        # The error message for the failure reason for the environment deployment.
        @[JSON::Field(key: "message")]
        getter message : String

        # The error code for the failure reason for the environment deployment.
        @[JSON::Field(key: "code")]
        getter code : String?

        def initialize(
          @message : String,
          @code : String? = nil
        )
        end
      end

      # The parameter details of an evironment profile.
      struct EnvironmentParameter
        include JSON::Serializable

        # The name of an environment profile parameter.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of an environment profile parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The details of an environment profile.
      struct EnvironmentProfileSummary
        include JSON::Serializable

        # The Amazon DataZone user who created the environment profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the environment profile exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of a blueprint with which an environment profile is created.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The identifier of the environment profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of an Amazon Web Services account in which an environment profile exists.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region in which an environment profile exists.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when an environment profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the environment profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of a project in which an environment profile exists.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The timestamp of when the environment profile was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @environment_blueprint_id : String,
          @id : String,
          @name : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @project_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Specifies the account/Region that is to be used during project creation for a particular blueprint.
      struct EnvironmentResolvedAccount
        include JSON::Serializable

        # The ID of the resolved account.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The name of the resolved Region.
        @[JSON::Field(key: "regionName")]
        getter region_name : String

        # The ID of the account pool.
        @[JSON::Field(key: "sourceAccountPoolId")]
        getter source_account_pool_id : String?

        def initialize(
          @aws_account_id : String,
          @region_name : String,
          @source_account_pool_id : String? = nil
        )
        end
      end

      # The details of an environment.
      struct EnvironmentSummary
        include JSON::Serializable

        # The Amazon DataZone user who created the environment.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the environment exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project in which the environment exists.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of the environment.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The identifier of the Amazon Web Services account in which an environment exists.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region in which an environment exists.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration ID with which the environment is created.
        @[JSON::Field(key: "environmentConfigurationId")]
        getter environment_configuration_id : String?

        # The identifier of the environment profile with which the environment was created.
        @[JSON::Field(key: "environmentProfileId")]
        getter environment_profile_id : String?

        # The identifier of the environment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when the environment was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @environment_configuration_id : String? = nil,
          @environment_profile_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Specifies whether the value is equal to an expression.
      struct EqualToExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be equal to an expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # The event summary.
      struct EventSummary
        include JSON::Serializable

        # The open lineage run event summary.
        @[JSON::Field(key: "openLineageRunEventSummary")]
        getter open_lineage_run_event_summary : Types::OpenLineageRunEventSummary?

        def initialize(
          @open_lineage_run_event_summary : Types::OpenLineageRunEventSummary? = nil
        )
        end
      end

      # Specifies the error message that is returned if the operation cannot be successfully completed.
      struct FailureCause
        include JSON::Serializable

        # The description of the error message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A search filter in Amazon DataZone.
      struct Filter
        include JSON::Serializable

        # A search filter attribute in Amazon DataZone.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # A search filter integer value in Amazon DataZone.
        @[JSON::Field(key: "intValue")]
        getter int_value : Int64?

        # Specifies the search filter operator.
        @[JSON::Field(key: "operator")]
        getter operator : String?

        # A search filter string value in Amazon DataZone.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @attribute : String,
          @int_value : Int64? = nil,
          @operator : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A search filter clause in Amazon DataZone.
      struct FilterClause
        include JSON::Serializable

        # The 'and' search filter clause in Amazon DataZone.
        @[JSON::Field(key: "and")]
        getter and : Array(Types::FilterClause)?

        # A search filter in Amazon DataZone.
        @[JSON::Field(key: "filter")]
        getter filter : Types::Filter?

        # The 'or' search filter clause in Amazon DataZone.
        @[JSON::Field(key: "or")]
        getter or : Array(Types::FilterClause)?

        def initialize(
          @and : Array(Types::FilterClause)? = nil,
          @filter : Types::Filter? = nil,
          @or : Array(Types::FilterClause)? = nil
        )
        end
      end

      # A filter expression in Amazon DataZone.
      struct FilterExpression
        include JSON::Serializable

        # The search filter expression.
        @[JSON::Field(key: "expression")]
        getter expression : String

        # The search filter explresison type.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @expression : String,
          @type : String
        )
        end
      end

      # The details of the form entry.
      struct FormEntryInput
        include JSON::Serializable

        # The type ID of the form entry.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The type revision of the form entry.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # Specifies whether a form entry is required.
        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @type_identifier : String,
          @type_revision : String,
          @required : Bool? = nil
        )
        end
      end

      # The details of the form entry.
      struct FormEntryOutput
        include JSON::Serializable

        # The name of the type of the form entry.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The type revision of the form entry.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # Specifies whether a form entry is required.
        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @type_name : String,
          @type_revision : String,
          @required : Bool? = nil
        )
        end
      end

      # The details of a metadata form.
      struct FormInput
        include JSON::Serializable

        # The name of the metadata form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The content of the metadata form.
        @[JSON::Field(key: "content")]
        getter content : String?

        # The ID of the metadata form type.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String?

        # The revision of the metadata form type.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @form_name : String,
          @content : String? = nil,
          @type_identifier : String? = nil,
          @type_revision : String? = nil
        )
        end
      end

      # The details of a metadata form.
      struct FormOutput
        include JSON::Serializable

        # The name of the metadata form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The content of the metadata form.
        @[JSON::Field(key: "content")]
        getter content : String?

        # The name of the metadata form type.
        @[JSON::Field(key: "typeName")]
        getter type_name : String?

        # The revision of the metadata form type.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @form_name : String,
          @content : String? = nil,
          @type_name : String? = nil,
          @type_revision : String? = nil
        )
        end
      end

      # The details of the metadata form type.
      struct FormTypeData
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the form type exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the form type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the form type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp of when the metadata form type was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created teh metadata form type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the metadata form type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The imports specified in the form type.
        @[JSON::Field(key: "imports")]
        getter imports : Array(Types::Import)?

        # The model of the form type.
        @[JSON::Field(key: "model")]
        getter model : Types::Model?

        # The identifier of the Amazon DataZone domain in which the form type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The identifier of the project in which the form type was originally created.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The identifier of the project that owns the form type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The status of the form type.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String,
          @name : String,
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @imports : Array(Types::Import)? = nil,
          @model : Types::Model? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @owning_project_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetAccountPoolInput
        include JSON::Serializable

        # The ID of the domain in which the account pool lives whose details are to be displayed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the account pool whose details are to be displayed.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetAccountPoolOutput
        include JSON::Serializable

        # The source of accounts for the account pool. In the current release, it's either a static list of
        # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
        @[JSON::Field(key: "accountSource")]
        getter account_source : Types::AccountSource

        # The user who created the account pool.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The timestamp at which the account pool was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the account pool.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain in which the account pool lives whose details are to be displayed.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The domain unit ID of the account pool.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The ID of the account pool.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp at which the account pool was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the account pool.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        # The user who last updated the account pool.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @account_source : Types::AccountSource,
          @created_by : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @domain_unit_id : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @resolution_strategy : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetAssetFilterInput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The ID of the domain where you want to get an asset filter.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset filter.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @asset_identifier : String,
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetAssetFilterOutput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The configuration of the asset filter.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AssetFilterConfiguration

        # The ID of the domain where you want to get an asset filter.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the asset filter.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp at which the asset filter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The column names of the asset filter.
        @[JSON::Field(key: "effectiveColumnNames")]
        getter effective_column_names : Array(String)?

        # The row filter of the asset filter.
        @[JSON::Field(key: "effectiveRowFilter")]
        getter effective_row_filter : String?

        # The error message that is displayed if the action does not complete successfully.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The status of the asset filter.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @asset_id : String,
          @configuration : Types::AssetFilterConfiguration,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @effective_column_names : Array(String)? = nil,
          @effective_row_filter : String? = nil,
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetAssetInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain to which the asset belongs.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the Amazon DataZone asset. This parameter supports either the value of assetId or
        # externalIdentifier as input. If you are passing the value of externalIdentifier , you must prefix
        # this value with externalIdentifer%2F .
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The revision of the Amazon DataZone asset.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @revision : String? = nil
        )
        end
      end

      struct GetAssetOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain to which the asset belongs.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The metadata forms attached to the asset.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)

        # The ID of the asset.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the asset.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project that owns the asset.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The ID of the asset type.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The revision of the asset type.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # The timestamp of when the asset was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the asset.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the Amazon DataZone asset.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The external ID of the asset.
        @[JSON::Field(key: "externalIdentifier")]
        getter external_identifier : String?

        # The timestamp of when the first revision of the asset was created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The Amazon DataZone user who created the first revision of the asset.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The business glossary terms attached to the asset.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The restricted glossary terms attached to an asset.
        @[JSON::Field(key: "governedGlossaryTerms")]
        getter governed_glossary_terms : Array(String)?

        # The latest data point that was imported into the time series form for the asset.
        @[JSON::Field(key: "latestTimeSeriesDataPointFormsOutput")]
        getter latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # The listing of the asset.
        @[JSON::Field(key: "listing")]
        getter listing : Types::AssetListingDetails?

        # The read-only metadata forms attached to the asset.
        @[JSON::Field(key: "readOnlyFormsOutput")]
        getter read_only_forms_output : Array(Types::FormOutput)?

        def initialize(
          @domain_id : String,
          @forms_output : Array(Types::FormOutput),
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @type_identifier : String,
          @type_revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @external_identifier : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @governed_glossary_terms : Array(String)? = nil,
          @latest_time_series_data_point_forms_output : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @listing : Types::AssetListingDetails? = nil,
          @read_only_forms_output : Array(Types::FormOutput)? = nil
        )
        end
      end

      struct GetAssetTypeInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset type exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset type.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The revision of the asset type.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @revision : String? = nil
        )
        end
      end

      struct GetAssetTypeOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the asset type exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The metadata forms attached to the asset type.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Hash(String, Types::FormEntryOutput)

        # The name of the asset type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project that owns the asset type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the asset type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp of when the asset type was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the asset type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the asset type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the Amazon DataZone domain in which the asset type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The ID of the Amazon DataZone project in which the asset type was originally created.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The timestamp of when the asset type was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user that updated the asset type.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @forms_output : Hash(String, Types::FormEntryOutput),
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetConnectionInput
        include JSON::Serializable

        # The ID of the domain where we get the connection.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The connection ID.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies whether a connection has a secret.
        @[JSON::Field(key: "withSecret")]
        getter with_secret : Bool?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @with_secret : Bool? = nil
        )
        end
      end

      struct GetConnectionOutput
        include JSON::Serializable

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The domain ID of the connection.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The domain unit ID of the connection.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String

        # The name of the connection.
        @[JSON::Field(key: "name")]
        getter name : String

        # The physical endpoints of the connection.
        @[JSON::Field(key: "physicalEndpoints")]
        getter physical_endpoints : Array(Types::PhysicalEndpoint)

        # The type of the connection.
        @[JSON::Field(key: "type")]
        getter type : String

        # Connection credentials.
        @[JSON::Field(key: "connectionCredentials")]
        getter connection_credentials : Types::ConnectionCredentials?

        # Connection description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The environment user role.
        @[JSON::Field(key: "environmentUserRole")]
        getter environment_user_role : String?

        # The ID of the project.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # Connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesOutput?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @connection_id : String,
          @domain_id : String,
          @domain_unit_id : String,
          @name : String,
          @physical_endpoints : Array(Types::PhysicalEndpoint),
          @type : String,
          @connection_credentials : Types::ConnectionCredentials? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @environment_user_role : String? = nil,
          @project_id : String? = nil,
          @props : Types::ConnectionPropertiesOutput? = nil,
          @scope : String? = nil
        )
        end
      end

      struct GetDataExportConfigurationInput
        include JSON::Serializable

        # The ID of the domain where you want to get the data export configuration details.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        def initialize(
          @domain_identifier : String
        )
        end
      end

      struct GetDataExportConfigurationOutput
        include JSON::Serializable

        # The timestamp at which the data export configuration report was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The encryption configuration as part of the data export configuration details.
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Specifies whether the export is enabled.
        @[JSON::Field(key: "isExportEnabled")]
        getter is_export_enabled : Bool?

        # The Amazon S3 table bucket ARN as part of the data export configuration details.
        @[JSON::Field(key: "s3TableBucketArn")]
        getter s3_table_bucket_arn : String?

        # The status of the data export configuration.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp at which the data export configuration report was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @is_export_enabled : Bool? = nil,
          @s3_table_bucket_arn : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetDataProductInput
        include JSON::Serializable

        # The ID of the domain where the data product lives.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data product.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The revision of the data product.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @revision : String? = nil
        )
        end
      end

      struct GetDataProductOutput
        include JSON::Serializable

        # The ID of the domain where the data product lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data product.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data product.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the owning project of the data product.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The revision of the data product.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The status of the data product.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp at which the data product is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data product.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data product.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which the first revision of the data product is created.
        @[JSON::Field(key: "firstRevisionCreatedAt")]
        getter first_revision_created_at : Time?

        # The user who created the first revision of the data product.
        @[JSON::Field(key: "firstRevisionCreatedBy")]
        getter first_revision_created_by : String?

        # The metadata forms of the data product.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)?

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The data assets of the data product.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductItem)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @revision : String,
          @status : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @first_revision_created_at : Time? = nil,
          @first_revision_created_by : String? = nil,
          @forms_output : Array(Types::FormOutput)? = nil,
          @glossary_terms : Array(String)? = nil,
          @items : Array(Types::DataProductItem)? = nil
        )
        end
      end

      struct GetDataSourceInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data source exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the Amazon DataZone data source.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetDataSourceOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the data source exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data source.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the data source.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project where the data source creates and publishes assets.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The metadata forms attached to the assets created by this data source.
        @[JSON::Field(key: "assetFormsOutput")]
        getter asset_forms_output : Array(Types::FormOutput)?

        # The configuration of the data source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationOutput?

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The timestamp of when the data source was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the data source.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether this data source is enabled or not.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The ID of the environment where this data source creates and publishes assets,
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The number of assets created by the data source during its last run.
        @[JSON::Field(key: "lastRunAssetCount")]
        getter last_run_asset_count : Int32?

        # The timestamp of the last run of the data source.
        @[JSON::Field(key: "lastRunAt")]
        getter last_run_at : Time?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "lastRunErrorMessage")]
        getter last_run_error_message : Types::DataSourceErrorMessage?

        # The status of the last run of the data source.
        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        # Specifies whether the assets that this data source creates in the inventory are to be also
        # automatically published to the catalog.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # The recommendation configuration of the data source.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationConfiguration?

        # The schedule of the data source runs.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        # Specifies the status of the self-granting functionality.
        @[JSON::Field(key: "selfGrantStatus")]
        getter self_grant_status : Types::SelfGrantStatusOutput?

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the data source.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp of when the data source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @asset_forms_output : Array(Types::FormOutput)? = nil,
          @configuration : Types::DataSourceConfigurationOutput? = nil,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_id : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_asset_count : Int32? = nil,
          @last_run_at : Time? = nil,
          @last_run_error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_status : String? = nil,
          @publish_on_import : Bool? = nil,
          @recommendation : Types::RecommendationConfiguration? = nil,
          @schedule : Types::ScheduleConfiguration? = nil,
          @self_grant_status : Types::SelfGrantStatusOutput? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetDataSourceRunInput
        include JSON::Serializable

        # The ID of the domain in which this data source run was performed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data source run.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetDataSourceRunOutput
        include JSON::Serializable

        # The timestamp of when the data source run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the data source for this data source run.
        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The ID of the domain in which this data source run was performed.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data source run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the project in which this data source run occured.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The status of this data source run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of this data source run.
        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when this data source run was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration snapshot of the data source run.
        @[JSON::Field(key: "dataSourceConfigurationSnapshot")]
        getter data_source_configuration_snapshot : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The summary of the data lineage.
        @[JSON::Field(key: "lineageSummary")]
        getter lineage_summary : Types::DataSourceRunLineageSummary?

        # The asset statistics from this data source run.
        @[JSON::Field(key: "runStatisticsForAssets")]
        getter run_statistics_for_assets : Types::RunStatisticsForAssets?

        # The timestamp of when this data source run started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The timestamp of when this data source run stopped.
        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Time?

        def initialize(
          @created_at : Time,
          @data_source_id : String,
          @domain_id : String,
          @id : String,
          @project_id : String,
          @status : String,
          @type : String,
          @updated_at : Time,
          @data_source_configuration_snapshot : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @lineage_summary : Types::DataSourceRunLineageSummary? = nil,
          @run_statistics_for_assets : Types::RunStatisticsForAssets? = nil,
          @started_at : Time? = nil,
          @stopped_at : Time? = nil
        )
        end
      end

      struct GetDomainInput
        include JSON::Serializable

        # The identifier of the specified Amazon DataZone domain.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      struct GetDomainOutput
        include JSON::Serializable

        # The domain execution role with which the Amazon DataZone domain is created.
        @[JSON::Field(key: "domainExecutionRole")]
        getter domain_execution_role : String

        # The identifier of the specified Amazon DataZone domain.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the specified Amazon DataZone domain.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ARN of the specified Amazon DataZone domain.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp of when the Amazon DataZone domain was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the Amazon DataZone domain.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the domain.
        @[JSON::Field(key: "domainVersion")]
        getter domain_version : String?

        # The identifier of the Amazon Web Services Key Management Service (KMS) key that is used to encrypt
        # the Amazon DataZone domain, metadata, and reporting data.
        @[JSON::Field(key: "kmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The timestamp of when the Amazon DataZone domain was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the Amazon DataZone domain.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The URL of the data portal for this Amazon DataZone domain.
        @[JSON::Field(key: "portalUrl")]
        getter portal_url : String?

        # The ID of the root domain in Amazon Datazone.
        @[JSON::Field(key: "rootDomainUnitId")]
        getter root_domain_unit_id : String?

        # The service role of the domain.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The single sing-on option of the specified Amazon DataZone domain.
        @[JSON::Field(key: "singleSignOn")]
        getter single_sign_on : Types::SingleSignOn?

        # The tags specified for the Amazon DataZone domain.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_execution_role : String,
          @id : String,
          @status : String,
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_version : String? = nil,
          @kms_key_identifier : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @portal_url : String? = nil,
          @root_domain_unit_id : String? = nil,
          @service_role : String? = nil,
          @single_sign_on : Types::SingleSignOn? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetDomainUnitInput
        include JSON::Serializable

        # The ID of the domain where you want to get a domain unit.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the domain unit that you want to get.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetDomainUnitOutput
        include JSON::Serializable

        # The ID of the domain in which the domain unit lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the domain unit.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the domain unit.
        @[JSON::Field(key: "name")]
        getter name : String

        # The owners of the domain unit.
        @[JSON::Field(key: "owners")]
        getter owners : Array(Types::DomainUnitOwnerProperties)

        # The time stamp at which the domain unit was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the domain unit.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the domain unit.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which the domain unit was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The user who last updated the domain unit.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The ID of the parent domain unit.
        @[JSON::Field(key: "parentDomainUnitId")]
        getter parent_domain_unit_id : String?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owners : Array(Types::DomainUnitOwnerProperties),
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @parent_domain_unit_id : String? = nil
        )
        end
      end

      struct GetEnvironmentActionInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the GetEnvironmentAction API is invoked.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The environment ID of the environment action.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ID of the environment action
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetEnvironmentActionOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment action lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The environment ID of the environment action.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the environment action.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters

        # The description of the environment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @parameters : Types::ActionParameters,
          @description : String? = nil
        )
        end
      end

      struct GetEnvironmentBlueprintConfigurationInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where this blueprint exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # He ID of the blueprint.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_blueprint_identifier : String
        )
        end
      end

      struct GetEnvironmentBlueprintConfigurationOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where this blueprint exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the blueprint.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The timestamp of when this blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Web Services regions in which this blueprint is enabled.
        @[JSON::Field(key: "enabledRegions")]
        getter enabled_regions : Array(String)?

        # The environment role permissions boundary.
        @[JSON::Field(key: "environmentRolePermissionBoundary")]
        getter environment_role_permission_boundary : String?

        # The ARN of the manage access role with which this blueprint is created.
        @[JSON::Field(key: "manageAccessRoleArn")]
        getter manage_access_role_arn : String?

        # The provisioning configuration of a blueprint.
        @[JSON::Field(key: "provisioningConfigurations")]
        getter provisioning_configurations : Array(Types::ProvisioningConfiguration)?

        # The ARN of the provisioning role with which this blueprint is created.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # The regional parameters of the blueprint.
        @[JSON::Field(key: "regionalParameters")]
        getter regional_parameters : Hash(String, Hash(String, String))?

        # The timestamp of when this blueprint was upated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @environment_blueprint_id : String,
          @created_at : Time? = nil,
          @enabled_regions : Array(String)? = nil,
          @environment_role_permission_boundary : String? = nil,
          @manage_access_role_arn : String? = nil,
          @provisioning_configurations : Array(Types::ProvisioningConfiguration)? = nil,
          @provisioning_role_arn : String? = nil,
          @regional_parameters : Hash(String, Hash(String, String))? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct GetEnvironmentBlueprintInput
        include JSON::Serializable

        # The identifier of the domain in which this blueprint exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of this Amazon DataZone blueprint.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetEnvironmentBlueprintOutput
        include JSON::Serializable

        # The ID of this Amazon DataZone blueprint.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of this Amazon DataZone blueprint.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provider of this Amazon DataZone blueprint.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The provisioning properties of this Amazon DataZone blueprint.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties

        # A timestamp of when this blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties of this Amazon DataZone blueprint.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description of this Amazon DataZone blueprint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The glossary terms attached to this Amazon DataZone blueprint.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when this blueprint was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of this blueprint.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @id : String,
          @name : String,
          @provider : String,
          @provisioning_properties : Types::ProvisioningProperties,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct GetEnvironmentCredentialsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this environment and its credentials exist.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment whose credentials this operation gets.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String
        )
        end
      end

      struct GetEnvironmentCredentialsOutput
        include JSON::Serializable

        # The access key ID of the environment.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The expiration timestamp of the environment credentials.
        @[JSON::Field(key: "expiration")]
        getter expiration : Time?

        # The secret access key of the environment credentials.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The session token of the environment credentials.
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_access_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      struct GetEnvironmentInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where the environment exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the Amazon DataZone environment.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetEnvironmentOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the environment.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain where the environment exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon DataZone project in which this environment is created.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of this Amazon DataZone environment.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The ID of the Amazon Web Services account where the environment exists.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region where the environment exists.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties of the environment.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description of the environment.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The actions of the environment.
        @[JSON::Field(key: "environmentActions")]
        getter environment_actions : Array(Types::ConfigurableEnvironmentAction)?

        # The blueprint with which the environment is created.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String?

        # The configuration ID that is used to create the environment.
        @[JSON::Field(key: "environmentConfigurationId")]
        getter environment_configuration_id : String?

        # The ID of the environment profile with which the environment is created.
        @[JSON::Field(key: "environmentProfileId")]
        getter environment_profile_id : String?

        # The business glossary terms that can be used in this environment.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The ID of the environment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The details of the last deployment of the environment.
        @[JSON::Field(key: "lastDeployment")]
        getter last_deployment : Types::Deployment?

        # The provisioned resources of this Amazon DataZone environment.
        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::Resource)?

        # The provisioning properties of this Amazon DataZone environment.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties?

        # The status of this Amazon DataZone environment.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when this environment was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of this Amazon DataZone environment.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @environment_actions : Array(Types::ConfigurableEnvironmentAction)? = nil,
          @environment_blueprint_id : String? = nil,
          @environment_configuration_id : String? = nil,
          @environment_profile_id : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @id : String? = nil,
          @last_deployment : Types::Deployment? = nil,
          @provisioned_resources : Array(Types::Resource)? = nil,
          @provisioning_properties : Types::ProvisioningProperties? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct GetEnvironmentProfileInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this environment profile exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment profile.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetEnvironmentProfileOutput
        include JSON::Serializable

        # The Amazon DataZone user who created this environment profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which this environment profile exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the blueprint with which this environment profile is created.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The ID of the environment profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the Amazon Web Services account where this environment profile exists.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region where this environment profile exists.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when this environment profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the environment profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the Amazon DataZone project in which this environment profile is created.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The timestamp of when this environment profile was upated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters of the environment profile.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @environment_blueprint_id : String,
          @id : String,
          @name : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @project_id : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct GetFormTypeInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this metadata form type exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the metadata form type.
        @[JSON::Field(key: "formTypeIdentifier")]
        getter form_type_identifier : String

        # The revision of this metadata form type.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @form_type_identifier : String,
          @revision : String? = nil
        )
        end
      end

      struct GetFormTypeOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this metadata form type exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The model of the metadata form type.
        @[JSON::Field(key: "model")]
        getter model : Types::Model

        # The name of the metadata form type.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the metadata form type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp of when this metadata form type was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created this metadata form type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the metadata form type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The imports of the metadata form type.
        @[JSON::Field(key: "imports")]
        getter imports : Array(Types::Import)?

        # The ID of the Amazon DataZone domain in which the metadata form type was originally created.
        @[JSON::Field(key: "originDomainId")]
        getter origin_domain_id : String?

        # The ID of the project in which this metadata form type was originally created.
        @[JSON::Field(key: "originProjectId")]
        getter origin_project_id : String?

        # The ID of the project that owns this metadata form type.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The status of the metadata form type.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String,
          @model : Types::Model,
          @name : String,
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @imports : Array(Types::Import)? = nil,
          @origin_domain_id : String? = nil,
          @origin_project_id : String? = nil,
          @owning_project_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetGlossaryInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the business glossary.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetGlossaryOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the business glossary.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the business glossary.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project that owns this business glossary.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The status of the business glossary.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when this business glossary was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created this business glossary.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the business glossary.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the business glossary was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the business glossary.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The usage restriction of the restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @status : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct GetGlossaryTermInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary term exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the business glossary term.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetGlossaryTermOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which this business glossary term exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the business glossary to which this term belongs.
        @[JSON::Field(key: "glossaryId")]
        getter glossary_id : String

        # The ID of the business glossary term.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the business glossary term.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the business glossary term.
        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the business glossary term was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the business glossary.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The long description of the business glossary term.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The short decription of the business glossary term.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The relations of the business glossary term.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        # The timestamp of when the business glossary term was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the business glossary term.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The usage restriction of a term within a restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @glossary_id : String,
          @id : String,
          @name : String,
          @status : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @long_description : String? = nil,
          @short_description : String? = nil,
          @term_relations : Types::TermRelations? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct GetGroupProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the group profile exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the group profile.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        def initialize(
          @domain_identifier : String,
          @group_identifier : String
        )
        end
      end

      struct GetGroupProfileOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the group profile exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The name of the group for which the specified group profile exists.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The identifier of the group profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The identifier of the group profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String? = nil,
          @group_name : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetIamPortalLoginUrlInput
        include JSON::Serializable

        # the ID of the Amazon DataZone domain the data portal of which you want to get.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        def initialize(
          @domain_identifier : String
        )
        end
      end

      struct GetIamPortalLoginUrlOutput
        include JSON::Serializable

        # The ID of the user profile.
        @[JSON::Field(key: "userProfileId")]
        getter user_profile_id : String

        # The data portal URL of the specified Amazon DataZone domain.
        @[JSON::Field(key: "authCodeUrl")]
        getter auth_code_url : String?

        def initialize(
          @user_profile_id : String,
          @auth_code_url : String? = nil
        )
        end
      end

      struct GetJobRunInput
        include JSON::Serializable

        # The ID of the domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the job run.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetJobRunOutput
        include JSON::Serializable

        # The timestamp of when the job run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the job run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The details of the job run.
        @[JSON::Field(key: "details")]
        getter details : Types::JobRunDetails?

        # The ID of the domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The timestamp of when the job run ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The error generated if the action is not completed successfully.
        @[JSON::Field(key: "error")]
        getter error : Types::JobRunError?

        # The ID of the job run.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The ID of the job run.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The type of the job run.
        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # The mode of the job run.
        @[JSON::Field(key: "runMode")]
        getter run_mode : String?

        # The timestamp of when the job run started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of the job run.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @details : Types::JobRunDetails? = nil,
          @domain_id : String? = nil,
          @end_time : Time? = nil,
          @error : Types::JobRunError? = nil,
          @id : String? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @run_mode : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetLineageEventInput
        include JSON::Serializable

        # The ID of the domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the lineage event.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetLineageEventOutput
        include JSON::Serializable

        # The timestamp of when the lineage event was created.
        @[JSON::Field(key: "Created-At")]
        getter created_at : Time?

        # The user who created the lineage event.
        @[JSON::Field(key: "Created-By")]
        getter created_by : String?

        # The ID of the domain.
        @[JSON::Field(key: "Domain-Id")]
        getter domain_id : String?

        # The lineage event details.
        @[JSON::Field(key: "event")]
        getter event : Bytes?

        # The time of the lineage event.
        @[JSON::Field(key: "Event-Time")]
        getter event_time : Time?

        # The ID of the lineage event.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The progressing status of the lineage event.
        @[JSON::Field(key: "Processing-Status")]
        getter processing_status : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @event : Bytes? = nil,
          @event_time : Time? = nil,
          @id : String? = nil,
          @processing_status : String? = nil
        )
        end
      end

      struct GetLineageNodeInput
        include JSON::Serializable

        # The ID of the domain in which you want to get the data lineage node.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data lineage node that you want to get. Both, a lineage node identifier generated by
        # Amazon DataZone and a sourceIdentifier of the lineage node are supported. If sourceIdentifier is
        # greater than 1800 characters, you can use lineage node identifier generated by Amazon DataZone to
        # get the node details.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The event time stamp for which you want to get the data lineage node.
        @[JSON::Field(key: "timestamp")]
        getter event_timestamp : Time?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @event_timestamp : Time? = nil
        )
        end
      end

      struct GetLineageNodeOutput
        include JSON::Serializable

        # The ID of the domain where you're getting the data lineage node.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data lineage node.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the type of the specified data lineage node.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The timestamp at which the data lineage node was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data lineage node.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data lineage node.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The downsteam nodes of the specified data lineage node.
        @[JSON::Field(key: "downstreamNodes")]
        getter downstream_nodes : Array(Types::LineageNodeReference)?

        # The timestamp of the event described in the data lineage node.
        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time?

        # The metadata of the specified data lineage node.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Array(Types::FormOutput)?

        # The name of the data lineage node.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The source identifier of the data lineage node.
        @[JSON::Field(key: "sourceIdentifier")]
        getter source_identifier : String?

        # The revision type of the specified data lineage node.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        # The timestamp at which the data lineage node was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who updated the data lineage node.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The upstream nodes of the specified data lineage node.
        @[JSON::Field(key: "upstreamNodes")]
        getter upstream_nodes : Array(Types::LineageNodeReference)?

        def initialize(
          @domain_id : String,
          @id : String,
          @type_name : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @downstream_nodes : Array(Types::LineageNodeReference)? = nil,
          @event_timestamp : Time? = nil,
          @forms_output : Array(Types::FormOutput)? = nil,
          @name : String? = nil,
          @source_identifier : String? = nil,
          @type_revision : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @upstream_nodes : Array(Types::LineageNodeReference)? = nil
        )
        end
      end

      struct GetListingInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the listing.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The revision of the listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @listing_revision : String? = nil
        )
        end
      end

      struct GetListingOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the listing.
        @[JSON::Field(key: "id")]
        getter id : String

        # The revision of a listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String

        # The timestamp of when the listing was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the listing.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the listing.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The details of a listing.
        @[JSON::Field(key: "item")]
        getter item : Types::ListingItem?

        # The name of the listing.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of the listing.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when the listing was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the listing.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @id : String,
          @listing_revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @item : Types::ListingItem? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetMetadataGenerationRunInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain the metadata generation run of which you want to get.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the metadata generation run.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The type of the metadata generation run.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @type : String? = nil
        )
        end
      end

      struct GetMetadataGenerationRunOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain the metadata generation run of which you want to get.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the metadata generation run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the project that owns the assets for which you're running metadata generation.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The timestamp of when the metadata generation run was start.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who started the metadata generation run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The status of the metadata generation run.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The asset for which you're generating metadata.
        @[JSON::Field(key: "target")]
        getter target : Types::MetadataGenerationRunTarget?

        # The type of metadata generation run.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The type stats included in the metadata generation run output details.
        @[JSON::Field(key: "typeStats")]
        getter type_stats : Array(Types::MetadataGenerationRunTypeStat)?

        # The types of the metadata generation run.
        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @owning_project_id : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @status : String? = nil,
          @target : Types::MetadataGenerationRunTarget? = nil,
          @type : String? = nil,
          @type_stats : Array(Types::MetadataGenerationRunTypeStat)? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      struct GetProjectInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the project exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the project.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetProjectOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the project.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the project exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # &gt;The ID of the project.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp of when the project was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment deployment status of a project.
        @[JSON::Field(key: "environmentDeploymentDetails")]
        getter environment_deployment_details : Types::EnvironmentDeploymentDetails?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(Types::ProjectDeletionError)?

        # The business glossary terms that can be used in the project.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when the project was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The ID of the project profile of a project.
        @[JSON::Field(key: "projectProfileId")]
        getter project_profile_id : String?

        # The status of the project.
        @[JSON::Field(key: "projectStatus")]
        getter project_status : String?

        # The resource tags of the project.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The user parameters of a project.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentConfigurationUserParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_deployment_details : Types::EnvironmentDeploymentDetails? = nil,
          @failure_reasons : Array(Types::ProjectDeletionError)? = nil,
          @glossary_terms : Array(String)? = nil,
          @last_updated_at : Time? = nil,
          @project_profile_id : String? = nil,
          @project_status : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
        )
        end
      end

      struct GetProjectProfileInput
        include JSON::Serializable

        # The ID of the domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the project profile.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetProjectProfileOutput
        include JSON::Serializable

        # The user who created the project profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the domain of the project profile.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the project profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether custom project resource tags are supported.
        @[JSON::Field(key: "allowCustomProjectResourceTags")]
        getter allow_custom_project_resource_tags : Bool?

        # The timestamp of when the project profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the project profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit of the project profile.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment configurations of the project profile.
        @[JSON::Field(key: "environmentConfigurations")]
        getter environment_configurations : Array(Types::EnvironmentConfiguration)?

        # The timestamp of when project profile was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The resource tags of the project profile.
        @[JSON::Field(key: "projectResourceTags")]
        getter project_resource_tags : Array(Types::ResourceTagParameter)?

        # Field viewable through the UI that provides a project user with the allowed resource tag
        # specifications.
        @[JSON::Field(key: "projectResourceTagsDescription")]
        getter project_resource_tags_description : String?

        # The status of the project profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @allow_custom_project_resource_tags : Bool? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
          @last_updated_at : Time? = nil,
          @project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
          @project_resource_tags_description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetRuleInput
        include JSON::Serializable

        # The ID of the domain where the GetRule action is to be invoked.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The revision of the rule.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @revision : String? = nil
        )
        end
      end

      struct GetRuleOutput
        include JSON::Serializable

        # The action of the rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The timestamp at which the rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the rule.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The detail of the rule.
        @[JSON::Field(key: "detail")]
        getter detail : Types::RuleDetail

        # The ID of the rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the rule.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The type of the rule.
        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # The scope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope

        # The target of the rule.
        @[JSON::Field(key: "target")]
        getter target : Types::RuleTarget

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The target type of the rule.
        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @created_by : String,
          @detail : Types::RuleDetail,
          @identifier : String,
          @last_updated_by : String,
          @name : String,
          @revision : String,
          @rule_type : String,
          @scope : Types::RuleScope,
          @target : Types::RuleTarget,
          @updated_at : Time,
          @description : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      struct GetSubscriptionGrantInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription grant exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the subscription grant.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetSubscriptionGrantOutput
        include JSON::Serializable

        # The timestamp of when the subscription grant is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription grant.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription grant exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The entity to which the subscription is granted.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntity

        # The ID of the subscription grant.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription grant.
        @[JSON::Field(key: "status")]
        getter status : String

        # The subscription target ID associated with the subscription grant.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String

        # The timestamp of when the subscription grant was upated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The assets for which the subscription grant is created.
        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::SubscribedAsset)?

        # The environment ID of the subscription grant.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The identifier of the subscription.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The Amazon DataZone user who updated the subscription grant.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @granted_entity : Types::GrantedEntity,
          @id : String,
          @status : String,
          @subscription_target_id : String,
          @updated_at : Time,
          @assets : Array(Types::SubscribedAsset)? = nil,
          @environment_id : String? = nil,
          @subscription_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetSubscriptionInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the subscription.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetSubscriptionOutput
        include JSON::Serializable

        # The timestamp of when the subscription was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription.
        @[JSON::Field(key: "status")]
        getter status : String

        # The details of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "subscribedListing")]
        getter subscribed_listing : Types::SubscribedListing

        # The principal that owns the subscription.
        @[JSON::Field(key: "subscribedPrincipal")]
        getter subscribed_principal : Types::SubscribedPrincipal

        # The timestamp of when the subscription was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The retain permissions of the subscription.
        @[JSON::Field(key: "retainPermissions")]
        getter retain_permissions : Bool?

        # The ID of the subscription request.
        @[JSON::Field(key: "subscriptionRequestId")]
        getter subscription_request_id : String?

        # The Amazon DataZone user who updated the subscription.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @status : String,
          @subscribed_listing : Types::SubscribedListing,
          @subscribed_principal : Types::SubscribedPrincipal,
          @updated_at : Time,
          @retain_permissions : Bool? = nil,
          @subscription_request_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetSubscriptionRequestDetailsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which to get the subscription request details.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the subscription request the details of which to get.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetSubscriptionRequestDetailsOutput
        include JSON::Serializable

        # The timestamp of when the specified subscription request was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription request.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The Amazon DataZone domain of the subscription request.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription request.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reason for the subscription request.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # The subscribed listings in the subscription request.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # The subscribed principals in the subscription request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # The timestamp of when the subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The decision comment of the subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # The metadata forms included in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormOutput)?

        # The identifier of the Amazon DataZone user who reviewed the subscription request.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # The Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms : Array(Types::FormOutput)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetSubscriptionTargetInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the subscription target exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment associated with the subscription target.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ID of the subscription target.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String
        )
        end
      end

      struct GetSubscriptionTargetOutput
        include JSON::Serializable

        # The asset types associated with the subscription target.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)

        # The authorized principals of the subscription target.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)

        # The timestamp of when the subscription target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription target.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the Amazon DataZone domain in which the subscription target exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the environment associated with the subscription target.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the subscription target.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the subscription target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the project associated with the subscription target.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of the subscription target.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The configuration of teh subscription target.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)

        # The type of the subscription target.
        @[JSON::Field(key: "type")]
        getter type : String

        # The manage access role with which the subscription target was created.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        # The timestamp of when the subscription target was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the subscription target.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @applicable_asset_types : Array(String),
          @authorized_principals : Array(String),
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @subscription_target_config : Array(Types::SubscriptionTargetForm),
          @type : String,
          @manage_access_role : String? = nil,
          @subscription_grant_creation_mode : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetTimeSeriesDataPointInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain that houses the asset for which you want to get the data point.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset for which you want to get the data point.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset for which you want to get the data point.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The name of the time series form that houses the data point that you want to get.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The ID of the data point that you want to get.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @form_name : String,
          @identifier : String
        )
        end
      end

      struct GetTimeSeriesDataPointOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain that houses the asset data point that you want to get.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the asset for which you want to get the data point.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The type of the asset for which you want to get the data point.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # The time series form that houses the data point that you want to get.
        @[JSON::Field(key: "form")]
        getter form : Types::TimeSeriesDataPointFormOutput?

        # The name of the time series form that houses the data point that you want to get.
        @[JSON::Field(key: "formName")]
        getter form_name : String?

        def initialize(
          @domain_id : String? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil,
          @form : Types::TimeSeriesDataPointFormOutput? = nil,
          @form_name : String? = nil
        )
        end
      end

      struct GetUserProfileInput
        include JSON::Serializable

        # the ID of the Amazon DataZone domain the data portal of which you want to get.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the user for which you want to get the user profile.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String

        # The type of the user profile.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @user_identifier : String,
          @type : String? = nil
        )
        end
      end

      struct GetUserProfileOutput
        include JSON::Serializable

        # The user profile details.
        @[JSON::Field(key: "details")]
        getter details : Types::UserProfileDetails?

        # the identifier of the Amazon DataZone domain of which you want to get the user profile.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The identifier of the user profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the user profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the user profile.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Types::UserProfileDetails? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The details of a business glossary.
      struct GlossaryItem
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the business glossary exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the glossary.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the glossary.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project that owns the business glosary.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The business glossary status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The additional attributes of an Amazon DataZone glossary.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::GlossaryItemAdditionalAttributes?

        # The timestamp of when the glossary was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the glossary.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The business glossary description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp of when the business glossary was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the business glossary.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The usage restrictions associated with a goverened glossary term.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @status : String,
          @additional_attributes : Types::GlossaryItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      # The additional attributes of an Amazon DataZone glossary.
      struct GlossaryItemAdditionalAttributes
        include JSON::Serializable

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        def initialize(
          @match_rationale : Array(Types::MatchRationaleItem)? = nil
        )
        end
      end

      # The enforcement details of a glossary term.
      struct GlossaryTermEnforcementDetail
        include JSON::Serializable

        # The ID of the required glossary term.
        @[JSON::Field(key: "requiredGlossaryTermIds")]
        getter required_glossary_term_ids : Array(String)?

        def initialize(
          @required_glossary_term_ids : Array(String)? = nil
        )
        end
      end

      # The details of a business glossary term.
      struct GlossaryTermItem
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the business glossary exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the business glossary to which the term belongs.
        @[JSON::Field(key: "glossaryId")]
        getter glossary_id : String

        # The identifier of the business glossary term.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the business glossary term.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the business glossary term.
        @[JSON::Field(key: "status")]
        getter status : String

        # The additional attributes of an Amazon DataZone glossary term.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Types::GlossaryTermItemAdditionalAttributes?

        # The timestamp of when a business glossary term was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon DataZone user who created the business glossary.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The long description of the business glossary term.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The short description of the business glossary term.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The relations of the business glossary term.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        # The timestamp of when a business glossary term was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the business glossary term.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The usage restrictions associated with a goverened glossary term.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @glossary_id : String,
          @id : String,
          @name : String,
          @status : String,
          @additional_attributes : Types::GlossaryTermItemAdditionalAttributes? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @long_description : String? = nil,
          @short_description : String? = nil,
          @term_relations : Types::TermRelations? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      # The additional attributes of an Amazon DataZone glossary term.
      struct GlossaryTermItemAdditionalAttributes
        include JSON::Serializable

        # List of rationales indicating why this item was matched by search.
        @[JSON::Field(key: "matchRationale")]
        getter match_rationale : Array(Types::MatchRationaleItem)?

        def initialize(
          @match_rationale : Array(Types::MatchRationaleItem)? = nil
        )
        end
      end

      # The Amazon Web Services Glue connection.
      struct GlueConnection
        include JSON::Serializable

        # The Amazon Athena properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "athenaProperties")]
        getter athena_properties : Hash(String, String)?

        # The authentication configuration of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfiguration?

        # The compatible compute environments of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "compatibleComputeEnvironments")]
        getter compatible_compute_environments : Array(String)?

        # The properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "connectionProperties")]
        getter connection_properties : Hash(String, String)?

        # The connection schema version of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "connectionSchemaVersion")]
        getter connection_schema_version : Int32?

        # The type of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # The creation time of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The last validation time of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "lastConnectionValidationTime")]
        getter last_connection_validation_time : Time?

        # The user who last updated the Amazon Web Services Glue connection.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The timestamp at which the Amazon Web Services Glue connection was last updated.
        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The match criteria of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "matchCriteria")]
        getter match_criteria : Array(String)?

        # The name of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The physical connection requirements of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "physicalConnectionRequirements")]
        getter physical_connection_requirements : Types::PhysicalConnectionRequirements?

        # The Python properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "pythonProperties")]
        getter python_properties : Hash(String, String)?

        # The Spark properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "sparkProperties")]
        getter spark_properties : Hash(String, String)?

        # The status of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status reason of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @athena_properties : Hash(String, String)? = nil,
          @authentication_configuration : Types::AuthenticationConfiguration? = nil,
          @compatible_compute_environments : Array(String)? = nil,
          @connection_properties : Hash(String, String)? = nil,
          @connection_schema_version : Int32? = nil,
          @connection_type : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @last_connection_validation_time : Time? = nil,
          @last_updated_by : String? = nil,
          @last_updated_time : Time? = nil,
          @match_criteria : Array(String)? = nil,
          @name : String? = nil,
          @physical_connection_requirements : Types::PhysicalConnectionRequirements? = nil,
          @python_properties : Hash(String, String)? = nil,
          @spark_properties : Hash(String, String)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The Amazon Web Services Glue connecton input.
      struct GlueConnectionInput
        include JSON::Serializable

        # The Amazon Athena properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "athenaProperties")]
        getter athena_properties : Hash(String, String)?

        # The authentication configuration of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfigurationInput?

        # The connection properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "connectionProperties")]
        getter connection_properties : Hash(String, String)?

        # The connection type of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # The description of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The match criteria of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "matchCriteria")]
        getter match_criteria : String?

        # The name of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The physical connection requirements for the Amazon Web Services Glue connection.
        @[JSON::Field(key: "physicalConnectionRequirements")]
        getter physical_connection_requirements : Types::PhysicalConnectionRequirements?

        # The Python properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "pythonProperties")]
        getter python_properties : Hash(String, String)?

        # The Spark properties of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "sparkProperties")]
        getter spark_properties : Hash(String, String)?

        # Speciefies whether to validate credentials of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "validateCredentials")]
        getter validate_credentials : Bool?

        # Speciefies whether to validate for compute environments of the Amazon Web Services Glue connection.
        @[JSON::Field(key: "validateForComputeEnvironments")]
        getter validate_for_compute_environments : Array(String)?

        def initialize(
          @athena_properties : Hash(String, String)? = nil,
          @authentication_configuration : Types::AuthenticationConfigurationInput? = nil,
          @connection_properties : Hash(String, String)? = nil,
          @connection_type : String? = nil,
          @description : String? = nil,
          @match_criteria : String? = nil,
          @name : String? = nil,
          @physical_connection_requirements : Types::PhysicalConnectionRequirements? = nil,
          @python_properties : Hash(String, String)? = nil,
          @spark_properties : Hash(String, String)? = nil,
          @validate_credentials : Bool? = nil,
          @validate_for_compute_environments : Array(String)? = nil
        )
        end
      end

      # The Amazon Web Services Glue connection patch.
      struct GlueConnectionPatch
        include JSON::Serializable

        # The authentication configuration of the Amazon Web Services Glue connection patch.
        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfigurationPatch?

        # The properties of the Amazon Web Services Glue connection patch.
        @[JSON::Field(key: "connectionProperties")]
        getter connection_properties : Hash(String, String)?

        # The description of the Amazon Web Services Glue connection patch.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @authentication_configuration : Types::AuthenticationConfigurationPatch? = nil,
          @connection_properties : Hash(String, String)? = nil,
          @description : String? = nil
        )
        end
      end

      # The GlueOAuth2 credentials of a connection.
      struct GlueOAuth2Credentials
        include JSON::Serializable

        # The access token of a connection.
        @[JSON::Field(key: "accessToken")]
        getter access_token : String?

        # The jwt token of the connection.
        @[JSON::Field(key: "jwtToken")]
        getter jwt_token : String?

        # The refresh token of the connection.
        @[JSON::Field(key: "refreshToken")]
        getter refresh_token : String?

        # The user managed client application client secret of the connection.
        @[JSON::Field(key: "userManagedClientApplicationClientSecret")]
        getter user_managed_client_application_client_secret : String?

        def initialize(
          @access_token : String? = nil,
          @jwt_token : String? = nil,
          @refresh_token : String? = nil,
          @user_managed_client_application_client_secret : String? = nil
        )
        end
      end

      # The Amazon Web Services Glue properties of a connection.
      struct GluePropertiesInput
        include JSON::Serializable

        # The Amazon Web Services Glue connection.
        @[JSON::Field(key: "glueConnectionInput")]
        getter glue_connection_input : Types::GlueConnectionInput?

        def initialize(
          @glue_connection_input : Types::GlueConnectionInput? = nil
        )
        end
      end

      # The properties of the Amazon Web Services Glue connection.
      struct GluePropertiesOutput
        include JSON::Serializable

        # The error message generated if the action is not completed successfully.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The status of a connection.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The Amazon Web Services Glue properties patch of a connection.
      struct GluePropertiesPatch
        include JSON::Serializable

        # The Amazon Web Services Glue properties patch of a connection.
        @[JSON::Field(key: "glueConnectionInput")]
        getter glue_connection_input : Types::GlueConnectionPatch?

        def initialize(
          @glue_connection_input : Types::GlueConnectionPatch? = nil
        )
        end
      end

      # The configuration details of the Amazon Web Services Glue data source.
      struct GlueRunConfigurationInput
        include JSON::Serializable

        # The relational filter configurations included in the configuration details of the Amazon Web
        # Services Glue data source.
        @[JSON::Field(key: "relationalFilterConfigurations")]
        getter relational_filter_configurations : Array(Types::RelationalFilterConfiguration)

        # Specifies whether to automatically import data quality metrics as part of the data source run.
        @[JSON::Field(key: "autoImportDataQualityResult")]
        getter auto_import_data_quality_result : Bool?

        # The catalog name in the Amazon Web Services Glue run configuration.
        @[JSON::Field(key: "catalogName")]
        getter catalog_name : String?

        # The data access role included in the configuration details of the Amazon Web Services Glue data
        # source.
        @[JSON::Field(key: "dataAccessRole")]
        getter data_access_role : String?

        def initialize(
          @relational_filter_configurations : Array(Types::RelationalFilterConfiguration),
          @auto_import_data_quality_result : Bool? = nil,
          @catalog_name : String? = nil,
          @data_access_role : String? = nil
        )
        end
      end

      # The configuration details of the Amazon Web Services Glue data source.
      struct GlueRunConfigurationOutput
        include JSON::Serializable

        # The relational filter configurations included in the configuration details of the Amazon Web
        # Services Glue data source.
        @[JSON::Field(key: "relationalFilterConfigurations")]
        getter relational_filter_configurations : Array(Types::RelationalFilterConfiguration)

        # The Amazon Web Services account ID included in the configuration details of the Amazon Web Services
        # Glue data source.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Specifies whether to automatically import data quality metrics as part of the data source run.
        @[JSON::Field(key: "autoImportDataQualityResult")]
        getter auto_import_data_quality_result : Bool?

        # The catalog name in the Amazon Web Services Glue run configuration.
        @[JSON::Field(key: "catalogName")]
        getter catalog_name : String?

        # The data access role included in the configuration details of the Amazon Web Services Glue data
        # source.
        @[JSON::Field(key: "dataAccessRole")]
        getter data_access_role : String?

        # The Amazon Web Services region included in the configuration details of the Amazon Web Services Glue
        # data source.
        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @relational_filter_configurations : Array(Types::RelationalFilterConfiguration),
          @account_id : String? = nil,
          @auto_import_data_quality_result : Bool? = nil,
          @catalog_name : String? = nil,
          @data_access_role : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The details of the self granting status.
      struct GlueSelfGrantStatusOutput
        include JSON::Serializable

        # The details for the self granting status for a Glue data source.
        @[JSON::Field(key: "selfGrantStatusDetails")]
        getter self_grant_status_details : Array(Types::SelfGrantStatusDetail)

        def initialize(
          @self_grant_status_details : Array(Types::SelfGrantStatusDetail)
        )
        end
      end

      # The details of a listing for which a subscription is granted.
      struct GrantedEntity
        include JSON::Serializable

        # The listing for which a subscription is granted.
        @[JSON::Field(key: "listing")]
        getter listing : Types::ListingRevision?

        def initialize(
          @listing : Types::ListingRevision? = nil
        )
        end
      end

      # The details of a listing for which a subscription is to be granted.
      struct GrantedEntityInput
        include JSON::Serializable

        # The listing for which a subscription is to be granted.
        @[JSON::Field(key: "listing")]
        getter listing : Types::ListingRevisionInput?

        def initialize(
          @listing : Types::ListingRevisionInput? = nil
        )
        end
      end

      # Specifies whether the value is greater than an expression.
      struct GreaterThanExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be greater than an expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # Specifies whether the value is greater than or equal to an expression.
      struct GreaterThanOrEqualToExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be greater than or equal to an expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # The details of a group in Amazon DataZone.
      struct GroupDetails
        include JSON::Serializable

        # The identifier of the group in Amazon DataZone.
        @[JSON::Field(key: "groupId")]
        getter group_id : String

        def initialize(
          @group_id : String
        )
        end
      end

      # The group principal to whom the policy is granted.
      struct GroupPolicyGrantPrincipal
        include JSON::Serializable

        # The ID Of the group of the group principal.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?

        def initialize(
          @group_identifier : String? = nil
        )
        end
      end

      # The details of a group profile.
      struct GroupProfileSummary
        include JSON::Serializable

        # The ID of the Amazon DataZone domain of a group profile.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The group name of a group profile.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The ID of a group profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of a group profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String? = nil,
          @group_name : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The hyper pod properties of a Amazon Web Services Glue properties patch.
      struct HyperPodPropertiesInput
        include JSON::Serializable

        # The cluster name the hyper pod properties.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end

      # The hyper pod properties of a Amazon Web Services Glue properties patch.
      struct HyperPodPropertiesOutput
        include JSON::Serializable

        # The cluster name the hyper pod properties.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The cluster ARN of the hyper pod properties.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The orchestrator of the hyper pod properties.
        @[JSON::Field(key: "orchestrator")]
        getter orchestrator : String?

        def initialize(
          @cluster_name : String,
          @cluster_arn : String? = nil,
          @orchestrator : String? = nil
        )
        end
      end

      # The IAM properties of a connection.
      struct IamPropertiesInput
        include JSON::Serializable

        # Specifies whether Amazon Web Services Glue lineage sync is enabled for a connection.
        @[JSON::Field(key: "glueLineageSyncEnabled")]
        getter glue_lineage_sync_enabled : Bool?

        def initialize(
          @glue_lineage_sync_enabled : Bool? = nil
        )
        end
      end

      # The IAM properties of a connection.
      struct IamPropertiesOutput
        include JSON::Serializable

        # The environment ID of the connection.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies whether Amazon Web Services Glue lineage sync is enabled for a connection.
        @[JSON::Field(key: "glueLineageSyncEnabled")]
        getter glue_lineage_sync_enabled : Bool?

        def initialize(
          @environment_id : String? = nil,
          @glue_lineage_sync_enabled : Bool? = nil
        )
        end
      end

      # The IAM properties patch of a connection.
      struct IamPropertiesPatch
        include JSON::Serializable

        # Specifies whether Amazon Web Services Glue lineage sync is enabled for a connection.
        @[JSON::Field(key: "glueLineageSyncEnabled")]
        getter glue_lineage_sync_enabled : Bool?

        def initialize(
          @glue_lineage_sync_enabled : Bool? = nil
        )
        end
      end

      # The details of the IAM user profile.
      struct IamUserProfileDetails
        include JSON::Serializable

        # The ARN of the IAM user.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The principal ID as part of the IAM user profile details.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @arn : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      # The details of the import of the metadata form type.
      struct Import
        include JSON::Serializable

        # The name of the import.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the import.
        @[JSON::Field(key: "revision")]
        getter revision : String

        def initialize(
          @name : String,
          @revision : String
        )
        end
      end

      # Specifies whether values are in the expression.
      struct InExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The values that might be in the expression.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @column_name : String,
          @values : Array(String)
        )
        end
      end

      # The request has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies that the expression is not null.
      struct IsNotNullExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        def initialize(
          @column_name : String
        )
        end
      end

      # Specifies that the expression is null.
      struct IsNullExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        def initialize(
          @column_name : String
        )
        end
      end

      # The details of a job run.
      struct JobRunDetails
        include JSON::Serializable

        # The data lineage details of a job run.
        @[JSON::Field(key: "lineageRunDetails")]
        getter lineage_run_details : Types::LineageRunDetails?

        def initialize(
          @lineage_run_details : Types::LineageRunDetails? = nil
        )
        end
      end

      # The job run error.
      struct JobRunError
        include JSON::Serializable

        # The job run error message.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The job run summary.
      struct JobRunSummary
        include JSON::Serializable

        # The timestamp at which job run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the job run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The domain ID of the job run.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The end time of a job run.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The error of a job run.
        @[JSON::Field(key: "error")]
        getter error : Types::JobRunError?

        # The job ID of a job run.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The job type of a job run.
        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # The run ID of a job run.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        # The run mode of a job run.
        @[JSON::Field(key: "runMode")]
        getter run_mode : String?

        # The start time of a job run.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The status of a job run.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @end_time : Time? = nil,
          @error : Types::JobRunError? = nil,
          @job_id : String? = nil,
          @job_type : String? = nil,
          @run_id : String? = nil,
          @run_mode : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The Lake Formation configuration of the Data Lake blueprint.
      struct LakeFormationConfiguration
        include JSON::Serializable

        # Specifies certain Amazon S3 locations if you do not want Amazon DataZone to automatically register
        # them in hybrid mode.
        @[JSON::Field(key: "locationRegistrationExcludeS3Locations")]
        getter location_registration_exclude_s3_locations : Array(String)?

        # The role that is used to manage read/write access to the chosen Amazon S3 bucket(s) for Data Lake
        # using Amazon Web Services Lake Formation hybrid access mode.
        @[JSON::Field(key: "locationRegistrationRole")]
        getter location_registration_role : String?

        def initialize(
          @location_registration_exclude_s3_locations : Array(String)? = nil,
          @location_registration_role : String? = nil
        )
        end
      end

      # Specifies that a value is less than an expression.
      struct LessThanExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be less than the expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # Specifies that a value is less than or equal to an expression.
      struct LessThanOrEqualToExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be less than or equal to an expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # Specifies that a value is like the expression.
      struct LikeExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might be like the expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # The data lineage event summary.
      struct LineageEventSummary
        include JSON::Serializable

        # The timestamp at which data lineage event was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data lineage event.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The domain ID of the lineage event.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The summary of the data lineate event.
        @[JSON::Field(key: "eventSummary")]
        getter event_summary : Types::EventSummary?

        # The time of the data lineage event.
        @[JSON::Field(key: "eventTime")]
        getter event_time : Time?

        # The ID of the data lineage event.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The processing status of the data lineage event.
        @[JSON::Field(key: "processingStatus")]
        getter processing_status : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @domain_id : String? = nil,
          @event_summary : Types::EventSummary? = nil,
          @event_time : Time? = nil,
          @id : String? = nil,
          @processing_status : String? = nil
        )
        end
      end

      # The data lineage information.
      struct LineageInfo
        include JSON::Serializable

        # The data lineage error message.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The data lineage event ID.
        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        # The data lineage event status.
        @[JSON::Field(key: "eventStatus")]
        getter event_status : String?

        def initialize(
          @error_message : String? = nil,
          @event_id : String? = nil,
          @event_status : String? = nil
        )
        end
      end

      # The reference details for the data lineage node.
      struct LineageNodeReference
        include JSON::Serializable

        # The event timestamp of the data lineage node.
        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time?

        # The ID of the data lineage node.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @event_timestamp : Time? = nil,
          @id : String? = nil
        )
        end
      end

      # The summary of the data lineage node.
      struct LineageNodeSummary
        include JSON::Serializable

        # The ID of the domain of the data lineage node.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the data lineage node.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the type of the data lineage node.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The timestamp at which the data lineage node was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data lineage node.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data lineage node.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The event timestamp of the data lineage node.
        @[JSON::Field(key: "eventTimestamp")]
        getter event_timestamp : Time?

        # The name of the data lineage node.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The alternate ID of the data lineage node.
        @[JSON::Field(key: "sourceIdentifier")]
        getter source_identifier : String?

        # The type of the revision of the data lineage node.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        # The timestamp at which the data lineage node was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who updated the data lineage node.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @id : String,
          @type_name : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @event_timestamp : Time? = nil,
          @name : String? = nil,
          @source_identifier : String? = nil,
          @type_revision : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of a data lineage node type.
      struct LineageNodeTypeItem
        include JSON::Serializable

        # The ID of the domain where the data lineage node type lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The forms output of the data lineage node type.
        @[JSON::Field(key: "formsOutput")]
        getter forms_output : Hash(String, Types::FormEntryOutput)

        # The revision of the data lineage node type.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The timestamp at which the data lineage node type was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the data lineage node type.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the data lineage node type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the data lineage node type.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp at which the data lineage node type was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user who updated the data lineage node type.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @domain_id : String,
          @forms_output : Hash(String, Types::FormEntryOutput),
          @revision : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The data lineage run details.
      struct LineageRunDetails
        include JSON::Serializable

        # The SQL query run details of a data lineage run.
        @[JSON::Field(key: "sqlQueryRunDetails")]
        getter sql_query_run_details : Types::LineageSqlQueryRunDetails?

        def initialize(
          @sql_query_run_details : Types::LineageSqlQueryRunDetails? = nil
        )
        end
      end

      # The SQL query run details of a data lineage run.
      struct LineageSqlQueryRunDetails
        include JSON::Serializable

        # The error message of the SQL query run details of a data lineage run.
        @[JSON::Field(key: "errorMessages")]
        getter error_messages : Array(String)?

        # The number of queries that failed in the SQL query run details of a data lineage run.
        @[JSON::Field(key: "numQueriesFailed")]
        getter num_queries_failed : Int32?

        # The query end time in the SQL query run details of a data lineage run.
        @[JSON::Field(key: "queryEndTime")]
        getter query_end_time : Time?

        # The query start time in the SQL query run details of a data lineage run.
        @[JSON::Field(key: "queryStartTime")]
        getter query_start_time : Time?

        # The total queries processed in the SQL query run details of a data lineage run.
        @[JSON::Field(key: "totalQueriesProcessed")]
        getter total_queries_processed : Int32?

        def initialize(
          @error_messages : Array(String)? = nil,
          @num_queries_failed : Int32? = nil,
          @query_end_time : Time? = nil,
          @query_start_time : Time? = nil,
          @total_queries_processed : Int32? = nil
        )
        end
      end

      # The lineage sync schedule.
      struct LineageSyncSchedule
        include JSON::Serializable

        # The lineage sync schedule.
        @[JSON::Field(key: "schedule")]
        getter schedule : String?

        def initialize(
          @schedule : String? = nil
        )
        end
      end

      struct ListAccountPoolsInput
        include JSON::Serializable

        # The ID of the domain where exsting account pools are to be listed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of account pools to return in a single call to ListAccountPools. When the number
        # of account pools to be listed is greater than the value of MaxResults, the response contains a
        # NextToken value that you can use in a subsequent call to ListAccountPools to list the next set of
        # account pools.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the account pool to be listed.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of account pools is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of account pools, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListAccountPools to list the next set of account pools.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort by mechanism in which the existing account pools are to be listed.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order in which the existing account pools are to be listed.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListAccountPoolsOutput
        include JSON::Serializable

        # The results of the ListAccountPools operation.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AccountPoolSummary)?

        # When the number of account pools is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of account pools, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListAccountPools to list the next set of account pools.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AccountPoolSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccountsInAccountPoolInput
        include JSON::Serializable

        # The ID of the domain in which the accounts in the specified account pool are to be listed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the account pool whose accounts are to be listed.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The maximum number of accounts to return in a single call to ListAccountsInAccountPool. When the
        # number of accounts to be listed is greater than the value of MaxResults, the response contains a
        # NextToken value that you can use in a subsequent call to ListAccountsInAccountPool to list the next
        # set of accounts.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of accounts is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of accounts, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListAccountsInAccountPool to list the next set of accounts.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccountsInAccountPoolOutput
        include JSON::Serializable

        # The results of the ListAccountsInAccountPool operation.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AccountInfo)?

        # When the number of accounts is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of accounts, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListAccountsInAccountPool to list the next set of accounts.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AccountInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssetFiltersInput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The ID of the domain where you want to list asset filters.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of asset filters to return in a single call to ListAssetFilters . When the number
        # of asset filters to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListAssetFilters to list the next set of
        # asset filters.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of asset filters is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of asset filters, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListAssetFilters to list the next set of asset filters.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the asset filter.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @asset_identifier : String,
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListAssetFiltersOutput
        include JSON::Serializable

        # The results of the ListAssetFilters action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AssetFilterSummary)

        # When the number of asset filters is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of asset filters, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListAssetFilters to list the next set of asset filters.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AssetFilterSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListAssetRevisionsInput
        include JSON::Serializable

        # The identifier of the domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the asset.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The maximum number of revisions to return in a single call to ListAssetRevisions . When the number
        # of revisions to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListAssetRevisions to list the next set of
        # revisions.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of revisions is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of revisions, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListAssetRevisions to list the next set of revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssetRevisionsOutput
        include JSON::Serializable

        # The results of the ListAssetRevisions action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::AssetRevision)?

        # When the number of revisions is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of revisions, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListAssetRevisions to list the next set of revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::AssetRevision)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectionsInput
        include JSON::Serializable

        # The ID of the domain where you want to list connections.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the environment where you want to list connections.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String?

        # The maximum number of connections to return in a single call to ListConnections. When the number of
        # connections to be listed is greater than the value of MaxResults, the response contains a NextToken
        # value that you can use in a subsequent call to ListConnections to list the next set of connections.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the connection.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of connections is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of connections, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListConnections to list the next set of connections.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the project where you want to list connections.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        # Specifies how you want to sort the listed connections.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order for the listed connections.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The type of connection.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @project_identifier : String? = nil,
          @scope : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListConnectionsOutput
        include JSON::Serializable

        # The results of the ListConnections action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ConnectionSummary)

        # When the number of connections is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of connections, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListConnections to list the next set of connections.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ConnectionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDataProductRevisionsInput
        include JSON::Serializable

        # The ID of the domain of the data product revisions that you want to list.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data product revision.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The maximum number of asset filters to return in a single call to ListDataProductRevisions . When
        # the number of data product revisions to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to
        # ListDataProductRevisions to list the next set of data product revisions.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of data product revisions is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of data
        # product revisions, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListDataProductRevisions to list the next set of data
        # product revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDataProductRevisionsOutput
        include JSON::Serializable

        # The results of the ListDataProductRevisions action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataProductRevision)

        # When the number of data product revisions is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of data
        # product revisions, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListDataProductRevisions to list the next set of data
        # product revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DataProductRevision),
          @next_token : String? = nil
        )
        end
      end

      struct ListDataSourceRunActivitiesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which to list data source run activities.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the data source run.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The maximum number of activities to return in a single call to ListDataSourceRunActivities . When
        # the number of activities to be listed is greater than the value of MaxResults , the response
        # contains a NextToken value that you can use in a subsequent call to ListDataSourceRunActivities to
        # list the next set of activities.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of activities is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of activities, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListDataSourceRunActivities to list the next set of activities.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the data source run.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListDataSourceRunActivitiesOutput
        include JSON::Serializable

        # The results of the ListDataSourceRunActivities action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataSourceRunActivity)

        # When the number of activities is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of activities, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListDataSourceRunActivities to list the next set of activities.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DataSourceRunActivity),
          @next_token : String? = nil
        )
        end
      end

      struct ListDataSourceRunsInput
        include JSON::Serializable

        # The identifier of the data source.
        @[JSON::Field(key: "dataSourceIdentifier")]
        getter data_source_identifier : String

        # The identifier of the Amazon DataZone domain in which to invoke the ListDataSourceRuns action.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of runs to return in a single call to ListDataSourceRuns . When the number of
        # runs to be listed is greater than the value of MaxResults , the response contains a NextToken value
        # that you can use in a subsequent call to ListDataSourceRuns to list the next set of runs.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of runs is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of runs, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListDataSourceRuns to list the next set of runs.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @data_source_identifier : String,
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListDataSourceRunsOutput
        include JSON::Serializable

        # The results of the ListDataSourceRuns action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataSourceRunSummary)

        # When the number of runs is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of runs, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListDataSourceRuns to list the next set of runs.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DataSourceRunSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDataSourcesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which to list the data sources.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the project in which to list data sources.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The ID of the connection.
        @[JSON::Field(key: "connectionIdentifier")]
        getter connection_identifier : String?

        # The identifier of the environment in which to list the data sources.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String?

        # The maximum number of data sources to return in a single call to ListDataSources . When the number
        # of data sources to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListDataSources to list the next set of
        # data sources.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the data source.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of data sources is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of data sources, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListDataSources to list the next set of data sources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the data source.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @project_identifier : String,
          @connection_identifier : String? = nil,
          @environment_identifier : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListDataSourcesOutput
        include JSON::Serializable

        # The results of the ListDataSources action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DataSourceSummary)

        # When the number of data sources is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of data sources, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListDataSources to list the next set of data sources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DataSourceSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainUnitsForParentInput
        include JSON::Serializable

        # The ID of the domain in which you want to list domain units for a parent domain unit.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the parent domain unit.
        @[JSON::Field(key: "parentDomainUnitIdentifier")]
        getter parent_domain_unit_identifier : String

        # The maximum number of domain units to return in a single call to ListDomainUnitsForParent. When the
        # number of domain units to be listed is greater than the value of MaxResults, the response contains a
        # NextToken value that you can use in a subsequent call to ListDomainUnitsForParent to list the next
        # set of domain units.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of domain units is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of domain units, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListDomainUnitsForParent to list the next set of domain units.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @parent_domain_unit_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainUnitsForParentOutput
        include JSON::Serializable

        # The results returned by this action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DomainUnitSummary)

        # When the number of domain units is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of domain units, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListDomainUnitsForParent to list the next set of domain units.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainUnitSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListDomainsInput
        include JSON::Serializable

        # The maximum number of domains to return in a single call to ListDomains . When the number of domains
        # to be listed is greater than the value of MaxResults , the response contains a NextToken value that
        # you can use in a subsequent call to ListDomains to list the next set of domains.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of domains is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of domains, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListDomains to list the next set of domains.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListDomainsOutput
        include JSON::Serializable

        # The results of the ListDomains action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::DomainSummary)

        # When the number of domains is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of domains, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListDomains to list the next set of domains.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityOwnersInput
        include JSON::Serializable

        # The ID of the domain where you want to list entity owners.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity that you want to list.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the entity that you want to list.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The maximum number of entities to return in a single call to ListEntityOwners . When the number of
        # entities to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to ListEntityOwners to list the next set of entities.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of entities is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of entities, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListEntityOwners to list the next set of entities.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityOwnersOutput
        include JSON::Serializable

        # The owners of the entity.
        @[JSON::Field(key: "owners")]
        getter owners : Array(Types::OwnerPropertiesOutput)

        # When the number of entities is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of entities, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListEntityOwners to list the next set of entities.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @owners : Array(Types::OwnerPropertiesOutput),
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentActionsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the environment actions are listed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the envrironment whose environment actions are listed.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of environment actions to return in a single call to ListEnvironmentActions .
        # When the number of environment actions to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to ListEnvironmentActions
        # to list the next set of environment actions.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of environment actions is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # environment actions, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListEnvironmentActions to list the next set of environment
        # actions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentActionsOutput
        include JSON::Serializable

        # The results of ListEnvironmentActions .
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EnvironmentActionSummary)?

        # When the number of environment actions is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # environment actions, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListEnvironmentActions to list the next set of environment
        # actions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EnvironmentActionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentBlueprintConfigurationsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of blueprint configurations to return in a single call to
        # ListEnvironmentBlueprintConfigurations . When the number of configurations to be listed is greater
        # than the value of MaxResults , the response contains a NextToken value that you can use in a
        # subsequent call to ListEnvironmentBlueprintConfigurations to list the next set of configurations.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of blueprint configurations is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # configurations, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListEnvironmentBlueprintConfigurations to list the next set
        # of configurations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentBlueprintConfigurationsOutput
        include JSON::Serializable

        # The results of the ListEnvironmentBlueprintConfigurations action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EnvironmentBlueprintConfigurationItem)?

        # When the number of blueprint configurations is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # configurations, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListEnvironmentBlueprintConfigurations to list the next set
        # of configurations.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EnvironmentBlueprintConfigurationItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentBlueprintsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies whether the environment blueprint is managed by Amazon DataZone.
        @[JSON::Field(key: "managed")]
        getter managed : Bool?

        # The maximum number of blueprints to return in a single call to ListEnvironmentBlueprints . When the
        # number of blueprints to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListEnvironmentBlueprints to list the next
        # set of blueprints.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the Amazon DataZone environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of blueprints in the environment is greater than the default value for the
        # MaxResults parameter, or if you explicitly specify a value for MaxResults that is less than the
        # number of blueprints in the environment, the response includes a pagination token named NextToken .
        # You can specify this NextToken value in a subsequent call to ListEnvironmentBlueprints to list the
        # next set of blueprints.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @managed : Bool? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentBlueprintsOutput
        include JSON::Serializable

        # The results of the ListEnvironmentBlueprints action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EnvironmentBlueprintSummary)

        # When the number of blueprints in the environment is greater than the default value for the
        # MaxResults parameter, or if you explicitly specify a value for MaxResults that is less than the
        # number of blueprints in the environment, the response includes a pagination token named NextToken .
        # You can specify this NextToken value in a subsequent call to ListEnvironmentBlueprints to list the
        # next set of blueprints.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EnvironmentBlueprintSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentProfilesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the Amazon Web Services account where you want to list environment profiles.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region where you want to list environment profiles.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The identifier of the blueprint that was used to create the environment profiles that you want to
        # list.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String?

        # The maximum number of environment profiles to return in a single call to ListEnvironmentProfiles .
        # When the number of environment profiles to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to ListEnvironmentProfiles
        # to list the next set of environment profiles.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of environment profiles is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # environment profiles, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListEnvironmentProfiles to list the next set of
        # environment profiles.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the Amazon DataZone project.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String?

        def initialize(
          @domain_identifier : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @environment_blueprint_identifier : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @project_identifier : String? = nil
        )
        end
      end

      struct ListEnvironmentProfilesOutput
        include JSON::Serializable

        # The results of the ListEnvironmentProfiles action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EnvironmentProfileSummary)

        # When the number of environment profiles is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # environment profiles, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListEnvironmentProfiles to list the next set of
        # environment profiles.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EnvironmentProfileSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListEnvironmentsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the Amazon DataZone project.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The identifier of the Amazon Web Services account where you want to list environments.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services region where you want to list environments.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The identifier of the Amazon DataZone blueprint.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String?

        # The identifier of the environment profile.
        @[JSON::Field(key: "environmentProfileIdentifier")]
        getter environment_profile_identifier : String?

        # The maximum number of environments to return in a single call to ListEnvironments . When the number
        # of environments to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListEnvironments to list the next set of
        # environments.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of environments is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of environments, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListEnvironments to list the next set of environments.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The provider of the environment.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        # The status of the environments that you want to list.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @project_identifier : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @environment_blueprint_identifier : String? = nil,
          @environment_profile_identifier : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @provider : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListEnvironmentsOutput
        include JSON::Serializable

        # The results of the ListEnvironments action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::EnvironmentSummary)

        # When the number of environments is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of environments, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListEnvironments to list the next set of environments.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::EnvironmentSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunsInput
        include JSON::Serializable

        # The ID of the domain where you want to list job runs.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the job run.
        @[JSON::Field(key: "jobIdentifier")]
        getter job_identifier : String

        # The maximum number of job runs to return in a single call to ListJobRuns. When the number of job
        # runs to be listed is greater than the value of MaxResults, the response contains a NextToken value
        # that you can use in a subsequent call to ListJobRuns to list the next set of job runs.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of job runs is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of job runs, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListJobRuns to list the next set of job runs.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the order in which job runs are to be sorted.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The status of a job run.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @job_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListJobRunsOutput
        include JSON::Serializable

        # The results of the ListJobRuns action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::JobRunSummary)?

        # When the number of job runs is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of job runs, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListJobRuns to list the next set of job runs.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::JobRunSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLineageEventsInput
        include JSON::Serializable

        # The ID of the domain where you want to list lineage events.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of lineage events to return in a single call to ListLineageEvents. When the
        # number of lineage events to be listed is greater than the value of MaxResults, the response contains
        # a NextToken value that you can use in a subsequent call to ListLineageEvents to list the next set of
        # lineage events.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of lineage events is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of lineage events, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListLineageEvents to list the next set of lineage events.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The processing status of a lineage event.
        @[JSON::Field(key: "processingStatus")]
        getter processing_status : String?

        # The sort order of the lineage events.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The after timestamp of a lineage event.
        @[JSON::Field(key: "timestampAfter")]
        getter timestamp_after : Time?

        # The before timestamp of a lineage event.
        @[JSON::Field(key: "timestampBefore")]
        getter timestamp_before : Time?

        def initialize(
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @processing_status : String? = nil,
          @sort_order : String? = nil,
          @timestamp_after : Time? = nil,
          @timestamp_before : Time? = nil
        )
        end
      end

      struct ListLineageEventsOutput
        include JSON::Serializable

        # The results of the ListLineageEvents action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::LineageEventSummary)?

        # When the number of lineage events is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of lineage events, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListLineageEvents to list the next set of lineage events.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::LineageEventSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLineageNodeHistoryInput
        include JSON::Serializable

        # The ID of the domain where you want to list the history of the specified data lineage node.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the data lineage node whose history you want to list.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The direction of the data lineage node refers to the lineage node having neighbors in that
        # direction. For example, if direction is UPSTREAM , the ListLineageNodeHistory API responds with
        # historical versions with upstream neighbors only.
        @[JSON::Field(key: "direction")]
        getter direction : String?

        # Specifies whether the action is to return data lineage node history from the time after the event
        # timestamp.
        @[JSON::Field(key: "timestampGTE")]
        getter event_timestamp_gte : Time?

        # Specifies whether the action is to return data lineage node history from the time prior of the event
        # timestamp.
        @[JSON::Field(key: "timestampLTE")]
        getter event_timestamp_lte : Time?

        # The maximum number of history items to return in a single call to ListLineageNodeHistory. When the
        # number of memberships to be listed is greater than the value of MaxResults, the response contains a
        # NextToken value that you can use in a subsequent call to ListLineageNodeHistory to list the next set
        # of items.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of history items is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of items, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListLineageNodeHistory to list the next set of items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order by which you want data lineage node history to be sorted.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @direction : String? = nil,
          @event_timestamp_gte : Time? = nil,
          @event_timestamp_lte : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListLineageNodeHistoryOutput
        include JSON::Serializable

        # When the number of history items is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of items, the response
        # includes a pagination token named NextToken. You can specify this NextToken value in a subsequent
        # call to ListLineageNodeHistory to list the next set of items.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The nodes returned by the ListLineageNodeHistory action.
        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::LineageNodeSummary)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::LineageNodeSummary)? = nil
        )
        end
      end

      struct ListMetadataGenerationRunsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where you want to list metadata generation runs.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of metadata generation runs to return in a single call to
        # ListMetadataGenerationRuns. When the number of metadata generation runs to be listed is greater than
        # the value of MaxResults, the response contains a NextToken value that you can use in a subsequent
        # call to ListMetadataGenerationRuns to list the next set of revisions.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of metadata generation runs is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # metadata generation runs, the response includes a pagination token named NextToken. You can specify
        # this NextToken value in a subsequent call to ListMetadataGenerationRuns to list the next set of
        # revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the metadata generation runs.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The target ID for which you want to list metadata generation runs.
        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String?

        # The type of the metadata generation runs.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil,
          @target_identifier : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListMetadataGenerationRunsOutput
        include JSON::Serializable

        # The results of the ListMetadataGenerationRuns action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::MetadataGenerationRunItem)?

        # When the number of metadata generation runs is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # metadata generation runs, the response includes a pagination token named NextToken. You can specify
        # this NextToken value in a subsequent call to ListMetadataGenerationRuns to list the next set of
        # revisions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::MetadataGenerationRunItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListNotificationsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The type of notifications.
        @[JSON::Field(key: "type")]
        getter type : String

        # The time after which you want to list notifications.
        @[JSON::Field(key: "afterTimestamp")]
        getter after_timestamp : Time?

        # The time before which you want to list notifications.
        @[JSON::Field(key: "beforeTimestamp")]
        getter before_timestamp : Time?

        # The maximum number of notifications to return in a single call to ListNotifications . When the
        # number of notifications to be listed is greater than the value of MaxResults , the response contains
        # a NextToken value that you can use in a subsequent call to ListNotifications to list the next set of
        # notifications.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of notifications is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of notifications, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListNotifications to list the next set of notifications.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The subjects of notifications.
        @[JSON::Field(key: "subjects")]
        getter subjects : Array(String)?

        # The task status of notifications.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @domain_identifier : String,
          @type : String,
          @after_timestamp : Time? = nil,
          @before_timestamp : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @subjects : Array(String)? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct ListNotificationsOutput
        include JSON::Serializable

        # When the number of notifications is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of notifications, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListNotifications to list the next set of notifications.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The results of the ListNotifications action.
        @[JSON::Field(key: "notifications")]
        getter notifications : Array(Types::NotificationOutput)?

        def initialize(
          @next_token : String? = nil,
          @notifications : Array(Types::NotificationOutput)? = nil
        )
        end
      end

      struct ListPolicyGrantsInput
        include JSON::Serializable

        # The ID of the domain where you want to list policy grants.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity for which you want to list policy grants.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of entity for which you want to list policy grants.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The type of policy that you want to list.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The maximum number of grants to return in a single call to ListPolicyGrants . When the number of
        # grants to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to ListPolicyGrants to list the next set of grants.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of grants is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of grants, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListPolicyGrants to list the next set of grants.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @policy_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPolicyGrantsOutput
        include JSON::Serializable

        # The results of this action - the listed grants.
        @[JSON::Field(key: "grantList")]
        getter grant_list : Array(Types::PolicyGrantMember)

        # When the number of grants is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of grants, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListPolicyGrants to list the next set of grants.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @grant_list : Array(Types::PolicyGrantMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectMembershipsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which you want to list project memberships.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the project whose memberships you want to list.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String

        # The maximum number of memberships to return in a single call to ListProjectMemberships . When the
        # number of memberships to be listed is greater than the value of MaxResults , the response contains a
        # NextToken value that you can use in a subsequent call to ListProjectMemberships to list the next set
        # of memberships.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of memberships is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of memberships, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListProjectMemberships to list the next set of memberships.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The method by which you want to sort the project memberships.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order of the project memberships.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @domain_identifier : String,
          @project_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListProjectMembershipsOutput
        include JSON::Serializable

        # The members of the project.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::ProjectMember)

        # When the number of memberships is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of memberships, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListProjectMemberships to list the next set of memberships.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::ProjectMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectProfilesInput
        include JSON::Serializable

        # The ID of the domain where you want to list project profiles.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The maximum number of project profiles to return in a single call to ListProjectProfiles. When the
        # number of project profiles to be listed is greater than the value of MaxResults, the response
        # contains a NextToken value that you can use in a subsequent call to ListProjectProfiles to list the
        # next set of project profiles.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of a project profile.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of project profiles is greater than the default value for the MaxResults parameter,
        # or if you explicitly specify a value for MaxResults that is less than the number of project
        # profiles, the response includes a pagination token named NextToken. You can specify this NextToken
        # value in a subsequent call to ListProjectProfiles to list the next set of project profiles.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies by what to sort project profiles.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order of the project profiles.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @domain_identifier : String,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListProjectProfilesOutput
        include JSON::Serializable

        # The results of the ListProjectProfiles action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProjectProfileSummary)?

        # When the number of project profiles is greater than the default value for the MaxResults parameter,
        # or if you explicitly specify a value for MaxResults that is less than the number of project
        # profiles, the response includes a pagination token named NextToken. You can specify this NextToken
        # value in a subsequent call to ListProjectProfiles to list the next set of project profiles.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProjectProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of a group.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?

        # The maximum number of projects to return in a single call to ListProjects . When the number of
        # projects to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to ListProjects to list the next set of projects.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the project.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the number of projects is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of projects, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListProjects to list the next set of projects.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the Amazon DataZone user.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String?

        def initialize(
          @domain_identifier : String,
          @group_identifier : String? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @user_identifier : String? = nil
        )
        end
      end

      struct ListProjectsOutput
        include JSON::Serializable

        # The results of the ListProjects action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProjectSummary)?

        # When the number of projects is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of projects, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListProjects to list the next set of projects.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProjectSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRulesInput
        include JSON::Serializable

        # The ID of the domain in which the rules are to be listed.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The target ID of the rule.
        @[JSON::Field(key: "targetIdentifier")]
        getter target_identifier : String

        # The target type of the rule.
        @[JSON::Field(key: "targetType")]
        getter target_type : String

        # The action of the rule.
        @[JSON::Field(key: "ruleAction")]
        getter action : String?

        # The asset types of the rule.
        @[JSON::Field(key: "assetTypes")]
        getter asset_types : Array(String)?

        # The data product of the rule.
        @[JSON::Field(key: "dataProduct")]
        getter data_product : Bool?

        # Specifies whether to include cascading rules in the results.
        @[JSON::Field(key: "includeCascaded")]
        getter include_cascaded : Bool?

        # The maximum number of rules to return in a single call to ListRules . When the number of rules to be
        # listed is greater than the value of MaxResults , the response contains a NextToken value that you
        # can use in a subsequent call to ListRules to list the next set of rules.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of rules is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of rules, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListRules to list the next set of rules.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The IDs of projects in which rules are to be listed.
        @[JSON::Field(key: "projectIds")]
        getter project_ids : Array(String)?

        # The type of the rule.
        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        def initialize(
          @domain_identifier : String,
          @target_identifier : String,
          @target_type : String,
          @action : String? = nil,
          @asset_types : Array(String)? = nil,
          @data_product : Bool? = nil,
          @include_cascaded : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_ids : Array(String)? = nil,
          @rule_type : String? = nil
        )
        end
      end

      struct ListRulesOutput
        include JSON::Serializable

        # The results of the ListRules action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::RuleSummary)

        # When the number of rules is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of rules, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to ListRules to list the next set of rules.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RuleSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSubscriptionGrantsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the Amazon DataZone environment.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The maximum number of subscription grants to return in a single call to ListSubscriptionGrants .
        # When the number of subscription grants to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to ListSubscriptionGrants
        # to list the next set of subscription grants.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of subscription grants is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription grants, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListSubscriptionGrants to list the next set of subscription
        # grants.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the owning group.
        @[JSON::Field(key: "owningGroupId")]
        getter owning_group_id : String?

        # The ARN of the owning IAM principal.
        @[JSON::Field(key: "owningIamPrincipalArn")]
        getter owning_iam_principal_arn : String?

        # The ID of the owning project of the subscription grants.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The ID of the owning user.
        @[JSON::Field(key: "owningUserId")]
        getter owning_user_id : String?

        # Specifies the way of sorting the results of this action.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order of this action.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The identifier of the subscribed listing.
        @[JSON::Field(key: "subscribedListingId")]
        getter subscribed_listing_id : String?

        # The identifier of the subscription.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The identifier of the subscription target.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String?

        def initialize(
          @domain_identifier : String,
          @environment_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owning_group_id : String? = nil,
          @owning_iam_principal_arn : String? = nil,
          @owning_project_id : String? = nil,
          @owning_user_id : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @subscribed_listing_id : String? = nil,
          @subscription_id : String? = nil,
          @subscription_target_id : String? = nil
        )
        end
      end

      struct ListSubscriptionGrantsOutput
        include JSON::Serializable

        # The results of the ListSubscriptionGrants action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SubscriptionGrantSummary)

        # When the number of subscription grants is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription grants, the response includes a pagination token named NextToken . You can specify this
        # NextToken value in a subsequent call to ListSubscriptionGrants to list the next set of subscription
        # grants.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SubscriptionGrantSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSubscriptionRequestsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the subscription request approver's project.
        @[JSON::Field(key: "approverProjectId")]
        getter approver_project_id : String?

        # The maximum number of subscription requests to return in a single call to ListSubscriptionRequests .
        # When the number of subscription requests to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to
        # ListSubscriptionRequests to list the next set of subscription requests.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of subscription requests is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription requests, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListSubscriptionRequests to list the next set of
        # subscription requests.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the owning group.
        @[JSON::Field(key: "owningGroupId")]
        getter owning_group_id : String?

        # The ARN of the owning IAM principal.
        @[JSON::Field(key: "owningIamPrincipalArn")]
        getter owning_iam_principal_arn : String?

        # The identifier of the project for the subscription requests.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The ID of the owning user.
        @[JSON::Field(key: "owningUserId")]
        getter owning_user_id : String?

        # Specifies the way to sort the results of this action.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order for the results of this action.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # Specifies the status of the subscription requests. This is not a required parameter, but if not
        # specified, by default, Amazon DataZone returns only PENDING subscription requests.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The identifier of the subscribed listing.
        @[JSON::Field(key: "subscribedListingId")]
        getter subscribed_listing_id : String?

        def initialize(
          @domain_identifier : String,
          @approver_project_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owning_group_id : String? = nil,
          @owning_iam_principal_arn : String? = nil,
          @owning_project_id : String? = nil,
          @owning_user_id : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status : String? = nil,
          @subscribed_listing_id : String? = nil
        )
        end
      end

      struct ListSubscriptionRequestsOutput
        include JSON::Serializable

        # The results of the ListSubscriptionRequests action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SubscriptionRequestSummary)

        # When the number of subscription requests is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription requests, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListSubscriptionRequests to list the next set of
        # subscription requests.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SubscriptionRequestSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSubscriptionTargetsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain where you want to list subscription targets.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment where you want to list subscription targets.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of subscription targets to return in a single call to ListSubscriptionTargets .
        # When the number of subscription targets to be listed is greater than the value of MaxResults , the
        # response contains a NextToken value that you can use in a subsequent call to ListSubscriptionTargets
        # to list the next set of subscription targets.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of subscription targets is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription targets, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListSubscriptionTargets to list the next set of
        # subscription targets.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the way in which the results of this action are to be sorted.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order for the results of this action.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListSubscriptionTargetsOutput
        include JSON::Serializable

        # The results of the ListSubscriptionTargets action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SubscriptionTargetSummary)

        # When the number of subscription targets is greater than the default value for the MaxResults
        # parameter, or if you explicitly specify a value for MaxResults that is less than the number of
        # subscription targets, the response includes a pagination token named NextToken . You can specify
        # this NextToken value in a subsequent call to ListSubscriptionTargets to list the next set of
        # subscription targets.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SubscriptionTargetSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSubscriptionsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the project for the subscription's approver.
        @[JSON::Field(key: "approverProjectId")]
        getter approver_project_id : String?

        # The maximum number of subscriptions to return in a single call to ListSubscriptions . When the
        # number of subscriptions to be listed is greater than the value of MaxResults , the response contains
        # a NextToken value that you can use in a subsequent call to ListSubscriptions to list the next set of
        # Subscriptions.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of subscriptions is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of subscriptions, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListSubscriptions to list the next set of subscriptions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of the owning group.
        @[JSON::Field(key: "owningGroupId")]
        getter owning_group_id : String?

        # The ARN of the owning IAM principal.
        @[JSON::Field(key: "owningIamPrincipalArn")]
        getter owning_iam_principal_arn : String?

        # The identifier of the owning project.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The ID of the owning user.
        @[JSON::Field(key: "owningUserId")]
        getter owning_user_id : String?

        # Specifies the way in which the results of this action are to be sorted.
        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # Specifies the sort order for the results of this action.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The status of the subscriptions that you want to list. This is not a required parameter, but if not
        # provided, by default, Amazon DataZone returns only APPROVED subscriptions.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The identifier of the subscribed listing for the subscriptions that you want to list.
        @[JSON::Field(key: "subscribedListingId")]
        getter subscribed_listing_id : String?

        # The identifier of the subscription request for the subscriptions that you want to list.
        @[JSON::Field(key: "subscriptionRequestIdentifier")]
        getter subscription_request_identifier : String?

        def initialize(
          @domain_identifier : String,
          @approver_project_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owning_group_id : String? = nil,
          @owning_iam_principal_arn : String? = nil,
          @owning_project_id : String? = nil,
          @owning_user_id : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status : String? = nil,
          @subscribed_listing_id : String? = nil,
          @subscription_request_identifier : String? = nil
        )
        end
      end

      struct ListSubscriptionsOutput
        include JSON::Serializable

        # The results of the ListSubscriptions action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SubscriptionSummary)

        # When the number of subscriptions is greater than the default value for the MaxResults parameter, or
        # if you explicitly specify a value for MaxResults that is less than the number of subscriptions, the
        # response includes a pagination token named NextToken . You can specify this NextToken value in a
        # subsequent call to ListSubscriptions to list the next set of subscriptions.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::SubscriptionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource whose tags you want to list.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags of the specified resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTimeSeriesDataPointsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain that houses the assets for which you want to list time series
        # data points.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset for which you want to list data points.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset for which you want to list data points.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The name of the time series data points form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The timestamp at which the data points that you wanted to list ended.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The maximum number of data points to return in a single call to ListTimeSeriesDataPoints. When the
        # number of data points to be listed is greater than the value of MaxResults, the response contains a
        # NextToken value that you can use in a subsequent call to ListTimeSeriesDataPoints to list the next
        # set of data points.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of data points is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of data points, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListTimeSeriesDataPoints to list the next set of data points.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The timestamp at which the data points that you want to list started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @form_name : String,
          @ended_at : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @started_at : Time? = nil
        )
        end
      end

      struct ListTimeSeriesDataPointsOutput
        include JSON::Serializable

        # The results of the ListTimeSeriesDataPoints action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::TimeSeriesDataPointSummaryFormOutput)?

        # When the number of data points is greater than the default value for the MaxResults parameter, or if
        # you explicitly specify a value for MaxResults that is less than the number of data points, the
        # response includes a pagination token named NextToken. You can specify this NextToken value in a
        # subsequent call to ListTimeSeriesDataPoints to list the next set of data points.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::TimeSeriesDataPointSummaryFormOutput)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The details of a listing (aka asset published in a Amazon DataZone catalog).
      struct ListingItem
        include JSON::Serializable

        # An asset published in an Amazon DataZone catalog.
        @[JSON::Field(key: "assetListing")]
        getter asset_listing : Types::AssetListing?

        # The data product listing.
        @[JSON::Field(key: "dataProductListing")]
        getter data_product_listing : Types::DataProductListing?

        def initialize(
          @asset_listing : Types::AssetListing? = nil,
          @data_product_listing : Types::DataProductListing? = nil
        )
        end
      end

      # A revision of an asset published in a Amazon DataZone catalog.
      struct ListingRevision
        include JSON::Serializable

        # An identifier of a revision of an asset published in a Amazon DataZone catalog.
        @[JSON::Field(key: "id")]
        getter id : String

        # The details of a revision of an asset published in a Amazon DataZone catalog.
        @[JSON::Field(key: "revision")]
        getter revision : String

        def initialize(
          @id : String,
          @revision : String
        )
        end
      end

      # A revision to be made to an asset published in a Amazon DataZone catalog.
      struct ListingRevisionInput
        include JSON::Serializable

        # An identifier of revision to be made to an asset published in a Amazon DataZone catalog.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The details of a revision to be made to an asset published in a Amazon DataZone catalog.
        @[JSON::Field(key: "revision")]
        getter revision : String

        def initialize(
          @identifier : String,
          @revision : String
        )
        end
      end

      # The summary of the listing of the data product.
      struct ListingSummary
        include JSON::Serializable

        # The glossary terms of the data product.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The ID of the data product listing.
        @[JSON::Field(key: "listingId")]
        getter listing_id : String?

        # The revision of the data product listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String?

        def initialize(
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @listing_id : String? = nil,
          @listing_revision : String? = nil
        )
        end
      end

      # The results of the data product summary.
      struct ListingSummaryItem
        include JSON::Serializable

        # The glossary terms of the data product listing.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The ID of the data product listing.
        @[JSON::Field(key: "listingId")]
        getter listing_id : String?

        # The revision of the data product listing.
        @[JSON::Field(key: "listingRevision")]
        getter listing_revision : String?

        def initialize(
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @listing_id : String? = nil,
          @listing_revision : String? = nil
        )
        end
      end

      # The managed endpoint credentials of the EMR on EKS cluster.
      struct ManagedEndpointCredentials
        include JSON::Serializable

        # The identifier of the managed endpoint credentials.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The ARN of the managed endpoint credentials.
        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @id : String? = nil,
          @token : String? = nil
        )
        end
      end

      # The offset of a matched term.
      struct MatchOffset
        include JSON::Serializable

        # The 0-indexed number indicating the end position (exclusive) of a matched term.
        @[JSON::Field(key: "endOffset")]
        getter end_offset : Int32?

        # The 0-indexed number indicating the start position (inclusive) of a matched term.
        @[JSON::Field(key: "startOffset")]
        getter start_offset : Int32?

        def initialize(
          @end_offset : Int32? = nil,
          @start_offset : Int32? = nil
        )
        end
      end

      # A rationale indicating why this item was matched by search.
      struct MatchRationaleItem
        include JSON::Serializable

        # A list of TextMatchItems.
        @[JSON::Field(key: "textMatches")]
        getter text_matches : Array(Types::TextMatchItem)?

        def initialize(
          @text_matches : Array(Types::TextMatchItem)? = nil
        )
        end
      end

      # The details about a project member.
      struct Member
        include JSON::Serializable

        # The ID of the group of a project member.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String?

        # The user ID of a project member.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String?

        def initialize(
          @group_identifier : String? = nil,
          @user_identifier : String? = nil
        )
        end
      end

      # The details about a project member.
      struct MemberDetails
        include JSON::Serializable

        # The group details of a project member.
        @[JSON::Field(key: "group")]
        getter group : Types::GroupDetails?

        # The user details of a project member.
        @[JSON::Field(key: "user")]
        getter user : Types::UserDetails?

        def initialize(
          @group : Types::GroupDetails? = nil,
          @user : Types::UserDetails? = nil
        )
        end
      end

      # The enforcement details of a metadata form.
      struct MetadataFormEnforcementDetail
        include JSON::Serializable

        # The required metadata forms.
        @[JSON::Field(key: "requiredMetadataForms")]
        getter required_metadata_forms : Array(Types::MetadataFormReference)?

        def initialize(
          @required_metadata_forms : Array(Types::MetadataFormReference)? = nil
        )
        end
      end

      # The reference of a metadata form.
      struct MetadataFormReference
        include JSON::Serializable

        # The type ID of the metadata form reference.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The type revision of the metadata form reference.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        def initialize(
          @type_identifier : String,
          @type_revision : String
        )
        end
      end

      # The summary of the metadata form.
      struct MetadataFormSummary
        include JSON::Serializable

        # The type name of the metadata form.
        @[JSON::Field(key: "typeName")]
        getter type_name : String

        # The type revision of the metadata form.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String

        # The form name of the metadata form.
        @[JSON::Field(key: "formName")]
        getter form_name : String?

        def initialize(
          @type_name : String,
          @type_revision : String,
          @form_name : String? = nil
        )
        end
      end

      # The metadata generation run.
      struct MetadataGenerationRunItem
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the metadata generation run was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the metadata generation run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The ID of the project that owns the asset for which the metadata generation was ran.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The timestamp at which the metadata generation run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the metadata generation run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The status of the metadata generation run.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The asset for which metadata was generated.
        @[JSON::Field(key: "target")]
        getter target : Types::MetadataGenerationRunTarget?

        # The type of the metadata generation run.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The types of the metadata generation run.
        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @owning_project_id : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @status : String? = nil,
          @target : Types::MetadataGenerationRunTarget? = nil,
          @type : String? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # The asset for which metadata was generated.
      struct MetadataGenerationRunTarget
        include JSON::Serializable

        # The ID of the metadata generation run's target.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The type of the asset for which metadata was generated.
        @[JSON::Field(key: "type")]
        getter type : String

        # The revision of the asset for which metadata was generated.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @identifier : String,
          @type : String,
          @revision : String? = nil
        )
        end
      end

      # The statistics of the metadata generation run type.
      struct MetadataGenerationRunTypeStat
        include JSON::Serializable

        # The status of the metadata generation run type statistics.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the metadata generation run type statistics.
        @[JSON::Field(key: "type")]
        getter type : String

        # The error message displayed if the action fails to run.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @status : String,
          @type : String,
          @error_message : String? = nil
        )
        end
      end

      # The MLflow properties of a connection.
      struct MlflowPropertiesInput
        include JSON::Serializable

        # The tracking server ARN as part of the MLflow properties of a connection.
        @[JSON::Field(key: "trackingServerArn")]
        getter tracking_server_arn : String?

        def initialize(
          @tracking_server_arn : String? = nil
        )
        end
      end

      # The MLflow properties of a connection.
      struct MlflowPropertiesOutput
        include JSON::Serializable

        # The tracking server ARN as part of the MLflow properties of a connection.
        @[JSON::Field(key: "trackingServerArn")]
        getter tracking_server_arn : String?

        def initialize(
          @tracking_server_arn : String? = nil
        )
        end
      end

      # The MLflow properties of a connection.
      struct MlflowPropertiesPatch
        include JSON::Serializable

        # The tracking server ARN as part of the MLflow properties of a connection.
        @[JSON::Field(key: "trackingServerArn")]
        getter tracking_server_arn : String?

        def initialize(
          @tracking_server_arn : String? = nil
        )
        end
      end

      # The model of the API.
      struct Model
        include JSON::Serializable

        # Indicates the smithy model of the API.
        @[JSON::Field(key: "smithy")]
        getter smithy : String?

        def initialize(
          @smithy : String? = nil
        )
        end
      end

      # The name identifier.
      struct NameIdentifier
        include JSON::Serializable

        # The name in the name identifier.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The namespace in the name identifier.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @name : String? = nil,
          @namespace : String? = nil
        )
        end
      end

      # Specifies that a value is not equal to the expression.
      struct NotEqualToExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might not be equal to the expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # Specifies that a value is not in the expression.
      struct NotInExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might not be in the expression.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @column_name : String,
          @values : Array(String)
        )
        end
      end

      # Specifies that a value might be not like the expression.
      struct NotLikeExpression
        include JSON::Serializable

        # The name of the column.
        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The value that might not be like the expression.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @column_name : String,
          @value : String
        )
        end
      end

      # The details of a notification generated in Amazon DataZone.
      struct NotificationOutput
        include JSON::Serializable

        # The action link included in the notification.
        @[JSON::Field(key: "actionLink")]
        getter action_link : String

        # The timestamp of when a notification was created.
        @[JSON::Field(key: "creationTimestamp")]
        getter creation_timestamp : Time

        # The identifier of a Amazon DataZone domain in which the notification exists.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the notification.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The timestamp of when the notification was last updated.
        @[JSON::Field(key: "lastUpdatedTimestamp")]
        getter last_updated_timestamp : Time

        # The message included in the notification.
        @[JSON::Field(key: "message")]
        getter message : String

        # The title of the notification.
        @[JSON::Field(key: "title")]
        getter title : String

        # The topic of the notification.
        @[JSON::Field(key: "topic")]
        getter topic : Types::Topic

        # The type of the notification.
        @[JSON::Field(key: "type")]
        getter type : String

        # The metadata included in the notification.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The status included in the notification.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @action_link : String,
          @creation_timestamp : Time,
          @domain_identifier : String,
          @identifier : String,
          @last_updated_timestamp : Time,
          @message : String,
          @title : String,
          @topic : Types::Topic,
          @type : String,
          @metadata : Hash(String, String)? = nil,
          @status : String? = nil
        )
        end
      end

      # The details of the resource mentioned in a notification.
      struct NotificationResource
        include JSON::Serializable

        # The ID of the resource mentioned in a notification.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of the resource mentioned in a notification.
        @[JSON::Field(key: "type")]
        getter type : String

        # The name of the resource mentioned in a notification.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String,
          @type : String,
          @name : String? = nil
        )
        end
      end

      # The OAuth2Client application.
      struct OAuth2ClientApplication
        include JSON::Serializable

        # The Amazon Web Services managed client application reference in the OAuth2Client application.
        @[JSON::Field(key: "aWSManagedClientApplicationReference")]
        getter a_ws_managed_client_application_reference : String?

        # The user managed client application client ID in the OAuth2Client application.
        @[JSON::Field(key: "userManagedClientApplicationClientId")]
        getter user_managed_client_application_client_id : String?

        def initialize(
          @a_ws_managed_client_application_reference : String? = nil,
          @user_managed_client_application_client_id : String? = nil
        )
        end
      end

      # The OAuth2 properties.
      struct OAuth2Properties
        include JSON::Serializable

        # The authorization code properties of the OAuth2 properties.
        @[JSON::Field(key: "authorizationCodeProperties")]
        getter authorization_code_properties : Types::AuthorizationCodeProperties?

        # The OAuth2 client application of the OAuth2 properties.
        @[JSON::Field(key: "oAuth2ClientApplication")]
        getter o_auth2_client_application : Types::OAuth2ClientApplication?

        # The OAuth2 credentials of the OAuth2 properties.
        @[JSON::Field(key: "oAuth2Credentials")]
        getter o_auth2_credentials : Types::GlueOAuth2Credentials?

        # The OAuth2 grant type of the OAuth2 properties.
        @[JSON::Field(key: "oAuth2GrantType")]
        getter o_auth2_grant_type : String?

        # The OAuth2 token URL of the OAuth2 properties.
        @[JSON::Field(key: "tokenUrl")]
        getter token_url : String?

        # The OAuth2 token URL parameter map of the OAuth2 properties.
        @[JSON::Field(key: "tokenUrlParametersMap")]
        getter token_url_parameters_map : Hash(String, String)?

        def initialize(
          @authorization_code_properties : Types::AuthorizationCodeProperties? = nil,
          @o_auth2_client_application : Types::OAuth2ClientApplication? = nil,
          @o_auth2_credentials : Types::GlueOAuth2Credentials? = nil,
          @o_auth2_grant_type : String? = nil,
          @token_url : String? = nil,
          @token_url_parameters_map : Hash(String, String)? = nil
        )
        end
      end

      # The open lineage run event summary.
      struct OpenLineageRunEventSummary
        include JSON::Serializable

        # The event type of the open lineage run event summary.
        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # The inputs of the open lineage run event summary.
        @[JSON::Field(key: "inputs")]
        getter inputs : Array(Types::NameIdentifier)?

        # The job of the open lineage run event summary.
        @[JSON::Field(key: "job")]
        getter job : Types::NameIdentifier?

        # The outputs of the open lineage run event summary.
        @[JSON::Field(key: "outputs")]
        getter outputs : Array(Types::NameIdentifier)?

        # The runID of the open lineage run event summary.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @event_type : String? = nil,
          @inputs : Array(Types::NameIdentifier)? = nil,
          @job : Types::NameIdentifier? = nil,
          @outputs : Array(Types::NameIdentifier)? = nil,
          @run_id : String? = nil
        )
        end
      end

      # The grant details of the override domain unit owners policy.
      struct OverrideDomainUnitOwnersPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy is inherited by child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      # The details of the override project owners policy grant.
      struct OverrideProjectOwnersPolicyGrantDetail
        include JSON::Serializable

        # Specifies whether the policy is inherited by child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        def initialize(
          @include_child_domain_units : Bool? = nil
        )
        end
      end

      # The properties of the domain unit owners group.
      struct OwnerGroupProperties
        include JSON::Serializable

        # The ID of the domain unit owners group.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        def initialize(
          @group_identifier : String
        )
        end
      end

      # The properties of the domain unit owners group.
      struct OwnerGroupPropertiesOutput
        include JSON::Serializable

        # The ID of the domain unit owners group.
        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        def initialize(
          @group_id : String? = nil
        )
        end
      end

      # The properties of a domain unit's owner.
      struct OwnerProperties
        include JSON::Serializable

        # Specifies that the domain unit owner is a group.
        @[JSON::Field(key: "group")]
        getter group : Types::OwnerGroupProperties?

        # Specifies that the domain unit owner is a user.
        @[JSON::Field(key: "user")]
        getter user : Types::OwnerUserProperties?

        def initialize(
          @group : Types::OwnerGroupProperties? = nil,
          @user : Types::OwnerUserProperties? = nil
        )
        end
      end

      # The ID of the domain unit owners group.
      struct OwnerPropertiesOutput
        include JSON::Serializable

        # Specifies that the domain unit owner is a group.
        @[JSON::Field(key: "group")]
        getter group : Types::OwnerGroupPropertiesOutput?

        # Specifies that the domain unit owner is a user.
        @[JSON::Field(key: "user")]
        getter user : Types::OwnerUserPropertiesOutput?

        def initialize(
          @group : Types::OwnerGroupPropertiesOutput? = nil,
          @user : Types::OwnerUserPropertiesOutput? = nil
        )
        end
      end

      # The properties of the owner user.
      struct OwnerUserProperties
        include JSON::Serializable

        # The ID of the owner user.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String

        def initialize(
          @user_identifier : String
        )
        end
      end

      # The properties of the owner user.
      struct OwnerUserPropertiesOutput
        include JSON::Serializable

        # The ID of the owner user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # The asset permissions.
      struct Permissions
        include JSON::Serializable

        # The S3 details of the asset permissions.
        @[JSON::Field(key: "s3")]
        getter s3 : Array(String)?

        def initialize(
          @s3 : Array(String)? = nil
        )
        end
      end

      # Physical connection requirements of a connection.
      struct PhysicalConnectionRequirements
        include JSON::Serializable

        # The availability zone of the physical connection requirements of a connection.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The group ID list of the physical connection requirements of a connection.
        @[JSON::Field(key: "securityGroupIdList")]
        getter security_group_id_list : Array(String)?

        # The subnet ID of the physical connection requirements of a connection.
        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The subnet ID list of the physical connection requirements of a connection.
        @[JSON::Field(key: "subnetIdList")]
        getter subnet_id_list : Array(String)?

        def initialize(
          @availability_zone : String? = nil,
          @security_group_id_list : Array(String)? = nil,
          @subnet_id : String? = nil,
          @subnet_id_list : Array(String)? = nil
        )
        end
      end

      # The physical endpoints of a connection.
      struct PhysicalEndpoint
        include JSON::Serializable

        # The location of a connection.
        @[JSON::Field(key: "awsLocation")]
        getter aws_location : Types::AwsLocation?

        # Specified whether trusted identity propagation for the connection is enabled.
        @[JSON::Field(key: "enableTrustedIdentityPropagation")]
        getter enable_trusted_identity_propagation : Bool?

        # The Amazon Web Services Glue connection.
        @[JSON::Field(key: "glueConnection")]
        getter glue_connection : Types::GlueConnection?

        # The Amazon Web Services Glue connection name.
        @[JSON::Field(key: "glueConnectionName")]
        getter glue_connection_name : String?

        # The host in the physical endpoints of a connection.
        @[JSON::Field(key: "host")]
        getter host : String?

        # The port in the physical endpoints of a connection.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The protocol in the physical endpoints of a connection.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The stage in the physical endpoints of a connection.
        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @aws_location : Types::AwsLocation? = nil,
          @enable_trusted_identity_propagation : Bool? = nil,
          @glue_connection : Types::GlueConnection? = nil,
          @glue_connection_name : String? = nil,
          @host : String? = nil,
          @port : Int32? = nil,
          @protocol : String? = nil,
          @stage : String? = nil
        )
        end
      end

      # The details of the policy grant.
      struct PolicyGrantDetail
        include JSON::Serializable

        # Specifies that the policy grant is to be added to the members of the project.
        @[JSON::Field(key: "addToProjectMemberPool")]
        getter add_to_project_member_pool : Types::AddToProjectMemberPoolPolicyGrantDetail?

        # Specifies that this is a create asset type policy.
        @[JSON::Field(key: "createAssetType")]
        getter create_asset_type : Types::CreateAssetTypePolicyGrantDetail?

        # Specifies that this is a create domain unit policy.
        @[JSON::Field(key: "createDomainUnit")]
        getter create_domain_unit : Types::CreateDomainUnitPolicyGrantDetail?

        # Specifies that this is a create environment policy.
        @[JSON::Field(key: "createEnvironment")]
        getter create_environment : Types::Unit?

        @[JSON::Field(key: "createEnvironmentFromBlueprint")]
        getter create_environment_from_blueprint : Types::Unit?

        # Specifies that this is a create environment profile policy.
        @[JSON::Field(key: "createEnvironmentProfile")]
        getter create_environment_profile : Types::CreateEnvironmentProfilePolicyGrantDetail?

        # Specifies that this is a create form type policy.
        @[JSON::Field(key: "createFormType")]
        getter create_form_type : Types::CreateFormTypePolicyGrantDetail?

        # Specifies that this is a create glossary policy.
        @[JSON::Field(key: "createGlossary")]
        getter create_glossary : Types::CreateGlossaryPolicyGrantDetail?

        # Specifies that this is a create project policy.
        @[JSON::Field(key: "createProject")]
        getter create_project : Types::CreateProjectPolicyGrantDetail?

        # Specifies whether to create a project from project profile.
        @[JSON::Field(key: "createProjectFromProjectProfile")]
        getter create_project_from_project_profile : Types::CreateProjectFromProjectProfilePolicyGrantDetail?

        # Specifies that this is the delegation of the create environment profile policy.
        @[JSON::Field(key: "delegateCreateEnvironmentProfile")]
        getter delegate_create_environment_profile : Types::Unit?

        # Specifies whether to override domain unit owners.
        @[JSON::Field(key: "overrideDomainUnitOwners")]
        getter override_domain_unit_owners : Types::OverrideDomainUnitOwnersPolicyGrantDetail?

        # Specifies whether to override project owners.
        @[JSON::Field(key: "overrideProjectOwners")]
        getter override_project_owners : Types::OverrideProjectOwnersPolicyGrantDetail?

        # Specifies the domain unit(s) whose projects can use this asset type while creating asset or asset
        # revisions.
        @[JSON::Field(key: "useAssetType")]
        getter use_asset_type : Types::UseAssetTypePolicyGrantDetail?

        def initialize(
          @add_to_project_member_pool : Types::AddToProjectMemberPoolPolicyGrantDetail? = nil,
          @create_asset_type : Types::CreateAssetTypePolicyGrantDetail? = nil,
          @create_domain_unit : Types::CreateDomainUnitPolicyGrantDetail? = nil,
          @create_environment : Types::Unit? = nil,
          @create_environment_from_blueprint : Types::Unit? = nil,
          @create_environment_profile : Types::CreateEnvironmentProfilePolicyGrantDetail? = nil,
          @create_form_type : Types::CreateFormTypePolicyGrantDetail? = nil,
          @create_glossary : Types::CreateGlossaryPolicyGrantDetail? = nil,
          @create_project : Types::CreateProjectPolicyGrantDetail? = nil,
          @create_project_from_project_profile : Types::CreateProjectFromProjectProfilePolicyGrantDetail? = nil,
          @delegate_create_environment_profile : Types::Unit? = nil,
          @override_domain_unit_owners : Types::OverrideDomainUnitOwnersPolicyGrantDetail? = nil,
          @override_project_owners : Types::OverrideProjectOwnersPolicyGrantDetail? = nil,
          @use_asset_type : Types::UseAssetTypePolicyGrantDetail? = nil
        )
        end
      end

      # A member of the policy grant list.
      struct PolicyGrantMember
        include JSON::Serializable

        # Specifies the timestamp at which policy grant member was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Specifies the user who created the policy grant member.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The details of the policy grant member.
        @[JSON::Field(key: "detail")]
        getter detail : Types::PolicyGrantDetail?

        # The ID of the policy grant.
        @[JSON::Field(key: "grantId")]
        getter grant_id : String?

        # The principal of the policy grant member.
        @[JSON::Field(key: "principal")]
        getter principal : Types::PolicyGrantPrincipal?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @detail : Types::PolicyGrantDetail? = nil,
          @grant_id : String? = nil,
          @principal : Types::PolicyGrantPrincipal? = nil
        )
        end
      end

      # The policy grant principal.
      struct PolicyGrantPrincipal
        include JSON::Serializable

        # The domain unit of the policy grant principal.
        @[JSON::Field(key: "domainUnit")]
        getter domain_unit : Types::DomainUnitPolicyGrantPrincipal?

        # The group of the policy grant principal.
        @[JSON::Field(key: "group")]
        getter group : Types::GroupPolicyGrantPrincipal?

        # The project of the policy grant principal.
        @[JSON::Field(key: "project")]
        getter project : Types::ProjectPolicyGrantPrincipal?

        # The user of the policy grant principal.
        @[JSON::Field(key: "user")]
        getter user : Types::UserPolicyGrantPrincipal?

        def initialize(
          @domain_unit : Types::DomainUnitPolicyGrantPrincipal? = nil,
          @group : Types::GroupPolicyGrantPrincipal? = nil,
          @project : Types::ProjectPolicyGrantPrincipal? = nil,
          @user : Types::UserPolicyGrantPrincipal? = nil
        )
        end
      end

      struct PostLineageEventInput
        include JSON::Serializable

        # The ID of the domain where you want to post a data lineage event.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The data lineage event that you want to post. Only open-lineage run event are supported as events.
        @[JSON::Field(key: "event")]
        getter event : Bytes

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "Client-Token")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @event : Bytes,
          @client_token : String? = nil
        )
        end
      end

      struct PostLineageEventOutput
        include JSON::Serializable

        # The ID of the domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the lineage event.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @domain_id : String? = nil,
          @id : String? = nil
        )
        end
      end

      struct PostTimeSeriesDataPointsInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which you want to post time series data points.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset for which you want to post time series data points.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the asset for which you want to post data points.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The forms that contain the data points that you want to post.
        @[JSON::Field(key: "forms")]
        getter forms : Array(Types::TimeSeriesDataPointFormInput)

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @forms : Array(Types::TimeSeriesDataPointFormInput),
          @client_token : String? = nil
        )
        end
      end

      struct PostTimeSeriesDataPointsOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which you want to post time series data points.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the asset for which you want to post time series data points.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The type of the asset for which you want to post data points.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # The forms that contain the data points that you have posted.
        @[JSON::Field(key: "forms")]
        getter forms : Array(Types::TimeSeriesDataPointFormOutput)?

        def initialize(
          @domain_id : String? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil,
          @forms : Array(Types::TimeSeriesDataPointFormOutput)? = nil
        )
        end
      end

      # The configuration of the prediction.
      struct PredictionConfiguration
        include JSON::Serializable

        # The business name generation mechanism.
        @[JSON::Field(key: "businessNameGeneration")]
        getter business_name_generation : Types::BusinessNameGenerationConfiguration?

        def initialize(
          @business_name_generation : Types::BusinessNameGenerationConfiguration? = nil
        )
        end
      end

      # Specifies the error message that is returned if the operation cannot be successfully completed.
      struct ProjectDeletionError
        include JSON::Serializable

        # The code of the project deletion error.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The message of the project deletion error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The project grant filter.
      struct ProjectGrantFilter
        include JSON::Serializable

        # The domain unit filter of the project grant filter.
        @[JSON::Field(key: "domainUnitFilter")]
        getter domain_unit_filter : Types::DomainUnitFilterForProject?

        def initialize(
          @domain_unit_filter : Types::DomainUnitFilterForProject? = nil
        )
        end
      end

      # The details of a project member.
      struct ProjectMember
        include JSON::Serializable

        # The designated role of a project member.
        @[JSON::Field(key: "designation")]
        getter designation : String

        # The membership details of a project member.
        @[JSON::Field(key: "memberDetails")]
        getter member_details : Types::MemberDetails

        def initialize(
          @designation : String,
          @member_details : Types::MemberDetails
        )
        end
      end

      # The project policy grant principal.
      struct ProjectPolicyGrantPrincipal
        include JSON::Serializable

        # The project designation of the project policy grant principal.
        @[JSON::Field(key: "projectDesignation")]
        getter project_designation : String

        # The project grant filter of the project policy grant principal.
        @[JSON::Field(key: "projectGrantFilter")]
        getter project_grant_filter : Types::ProjectGrantFilter?

        # The project ID of the project policy grant principal.
        @[JSON::Field(key: "projectIdentifier")]
        getter project_identifier : String?

        def initialize(
          @project_designation : String,
          @project_grant_filter : Types::ProjectGrantFilter? = nil,
          @project_identifier : String? = nil
        )
        end
      end

      # The summary of a project profile.
      struct ProjectProfileSummary
        include JSON::Serializable

        # The user who created the project profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The domain ID of the project profile.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the project profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of a project profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp of when the project profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the project profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain unit ID of the project profile.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The timestamp at which a project profile was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The status of a project profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The details of a Amazon DataZone project.
      struct ProjectSummary
        include JSON::Serializable

        # The Amazon DataZone user who created the project.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of a Amazon DataZone domain where the project exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of a project.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of a project.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp of when a project was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of a project.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(Types::ProjectDeletionError)?

        # The status of the project.
        @[JSON::Field(key: "projectStatus")]
        getter project_status : String?

        # The timestamp of when the project was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @failure_reasons : Array(Types::ProjectDeletionError)? = nil,
          @project_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Specifies projects in which the rule is created.
      struct ProjectsForRule
        include JSON::Serializable

        # The selection mode of the rule.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # The specific projects in which the rule is created.
        @[JSON::Field(key: "specificProjects")]
        getter specific_projects : Array(String)?

        def initialize(
          @selection_mode : String,
          @specific_projects : Array(String)? = nil
        )
        end
      end

      # The provisioning configuration of the blueprint.
      struct ProvisioningConfiguration
        include JSON::Serializable

        # The Lake Formation configuration of the Data Lake blueprint.
        @[JSON::Field(key: "lakeFormationConfiguration")]
        getter lake_formation_configuration : Types::LakeFormationConfiguration?

        def initialize(
          @lake_formation_configuration : Types::LakeFormationConfiguration? = nil
        )
        end
      end

      # The provisioning properties of an environment blueprint.
      struct ProvisioningProperties
        include JSON::Serializable

        # The cloud formation properties included as part of the provisioning properties of an environment
        # blueprint.
        @[JSON::Field(key: "cloudFormation")]
        getter cloud_formation : Types::CloudFormationProperties?

        def initialize(
          @cloud_formation : Types::CloudFormationProperties? = nil
        )
        end
      end

      struct PutDataExportConfigurationInput
        include JSON::Serializable

        # The domain ID where you want to create data export configuration details.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies that the export is to be enabled as part of creating data export configuration details.
        @[JSON::Field(key: "enableExport")]
        getter enable_export : Bool

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The encryption configuration as part of creating data export configuration details. The KMS key
        # provided here as part of encryptionConfiguration must have the required permissions as described in
        # KMS permissions for exporting asset metadata in Amazon SageMaker Unified Studio .
        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        def initialize(
          @domain_identifier : String,
          @enable_export : Bool,
          @client_token : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil
        )
        end
      end

      struct PutDataExportConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct PutEnvironmentBlueprintConfigurationInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies the enabled Amazon Web Services Regions.
        @[JSON::Field(key: "enabledRegions")]
        getter enabled_regions : Array(String)

        # The identifier of the environment blueprint.
        @[JSON::Field(key: "environmentBlueprintIdentifier")]
        getter environment_blueprint_identifier : String

        # The environment role permissions boundary.
        @[JSON::Field(key: "environmentRolePermissionBoundary")]
        getter environment_role_permission_boundary : String?

        # Region-agnostic environment blueprint parameters.
        @[JSON::Field(key: "globalParameters")]
        getter global_parameters : Hash(String, String)?

        # The ARN of the manage access role.
        @[JSON::Field(key: "manageAccessRoleArn")]
        getter manage_access_role_arn : String?

        # The provisioning configuration of a blueprint.
        @[JSON::Field(key: "provisioningConfigurations")]
        getter provisioning_configurations : Array(Types::ProvisioningConfiguration)?

        # The ARN of the provisioning role.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # The regional parameters in the environment blueprint.
        @[JSON::Field(key: "regionalParameters")]
        getter regional_parameters : Hash(String, Hash(String, String))?

        def initialize(
          @domain_identifier : String,
          @enabled_regions : Array(String),
          @environment_blueprint_identifier : String,
          @environment_role_permission_boundary : String? = nil,
          @global_parameters : Hash(String, String)? = nil,
          @manage_access_role_arn : String? = nil,
          @provisioning_configurations : Array(Types::ProvisioningConfiguration)? = nil,
          @provisioning_role_arn : String? = nil,
          @regional_parameters : Hash(String, Hash(String, String))? = nil
        )
        end
      end

      struct PutEnvironmentBlueprintConfigurationOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the environment blueprint.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The timestamp of when the environment blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Specifies the enabled Amazon Web Services Regions.
        @[JSON::Field(key: "enabledRegions")]
        getter enabled_regions : Array(String)?

        # The environment role permissions boundary.
        @[JSON::Field(key: "environmentRolePermissionBoundary")]
        getter environment_role_permission_boundary : String?

        # The ARN of the manage access role.
        @[JSON::Field(key: "manageAccessRoleArn")]
        getter manage_access_role_arn : String?

        # The provisioning configuration of a blueprint.
        @[JSON::Field(key: "provisioningConfigurations")]
        getter provisioning_configurations : Array(Types::ProvisioningConfiguration)?

        # The ARN of the provisioning role.
        @[JSON::Field(key: "provisioningRoleArn")]
        getter provisioning_role_arn : String?

        # The regional parameters in the environment blueprint.
        @[JSON::Field(key: "regionalParameters")]
        getter regional_parameters : Hash(String, Hash(String, String))?

        # The timestamp of when the environment blueprint was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @environment_blueprint_id : String,
          @created_at : Time? = nil,
          @enabled_regions : Array(String)? = nil,
          @environment_role_permission_boundary : String? = nil,
          @manage_access_role_arn : String? = nil,
          @provisioning_configurations : Array(Types::ProvisioningConfiguration)? = nil,
          @provisioning_role_arn : String? = nil,
          @regional_parameters : Hash(String, Hash(String, String))? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The recommendation to be updated as part of the UpdateDataSource action.
      struct RecommendationConfiguration
        include JSON::Serializable

        # Specifies whether automatic business name generation is to be enabled or not as part of the
        # recommendation configuration.
        @[JSON::Field(key: "enableBusinessNameGeneration")]
        getter enable_business_name_generation : Bool?

        def initialize(
          @enable_business_name_generation : Bool? = nil
        )
        end
      end

      # The details of the Amazon Redshift cluster storage.
      struct RedshiftClusterStorage
        include JSON::Serializable

        # The name of an Amazon Redshift cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        def initialize(
          @cluster_name : String
        )
        end
      end

      # The details of the credentials required to access an Amazon Redshift cluster.
      struct RedshiftCredentialConfiguration
        include JSON::Serializable

        # The ARN of a secret manager for an Amazon Redshift cluster.
        @[JSON::Field(key: "secretManagerArn")]
        getter secret_manager_arn : String

        def initialize(
          @secret_manager_arn : String
        )
        end
      end

      # Amazon Redshift credentials of a connection.
      struct RedshiftCredentials
        include JSON::Serializable

        # The secret ARN of the Amazon Redshift credentials of a connection.
        @[JSON::Field(key: "secretArn")]
        getter secret_arn : String?

        # The username and password of the Amazon Redshift credentials of a connection.
        @[JSON::Field(key: "usernamePassword")]
        getter username_password : Types::UsernamePassword?

        def initialize(
          @secret_arn : String? = nil,
          @username_password : Types::UsernamePassword? = nil
        )
        end
      end

      # The Amaon Redshift lineage sync configuration.
      struct RedshiftLineageSyncConfigurationInput
        include JSON::Serializable

        # Specifies whether the Amaon Redshift lineage sync configuration is enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The schedule of the Amaon Redshift lineage sync configuration.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::LineageSyncSchedule?

        def initialize(
          @enabled : Bool? = nil,
          @schedule : Types::LineageSyncSchedule? = nil
        )
        end
      end

      # The Amaon Redshift lineage sync configuration.
      struct RedshiftLineageSyncConfigurationOutput
        include JSON::Serializable

        # Specifies whether the Amaon Redshift lineage sync configuration is enabled.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The lineage job ID of the Amaon Redshift lineage sync configuration.
        @[JSON::Field(key: "lineageJobId")]
        getter lineage_job_id : String?

        # The schedule of teh Amaon Redshift lineage sync configuration.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::LineageSyncSchedule?

        def initialize(
          @enabled : Bool? = nil,
          @lineage_job_id : String? = nil,
          @schedule : Types::LineageSyncSchedule? = nil
        )
        end
      end

      # The Amazon Redshift properties.
      struct RedshiftPropertiesInput
        include JSON::Serializable

        # The Amaon Redshift credentials.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::RedshiftCredentials?

        # The Amazon Redshift database name.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # The Amazon Redshift host.
        @[JSON::Field(key: "host")]
        getter host : String?

        # The lineage sync of the Amazon Redshift.
        @[JSON::Field(key: "lineageSync")]
        getter lineage_sync : Types::RedshiftLineageSyncConfigurationInput?

        # The Amaon Redshift port.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The Amazon Redshift storage.
        @[JSON::Field(key: "storage")]
        getter storage : Types::RedshiftStorageProperties?

        def initialize(
          @credentials : Types::RedshiftCredentials? = nil,
          @database_name : String? = nil,
          @host : String? = nil,
          @lineage_sync : Types::RedshiftLineageSyncConfigurationInput? = nil,
          @port : Int32? = nil,
          @storage : Types::RedshiftStorageProperties? = nil
        )
        end
      end

      # The Amazon Redshift properties.
      struct RedshiftPropertiesOutput
        include JSON::Serializable

        # The Amazon Redshift credentials.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::RedshiftCredentials?

        # The Amazon Redshift database name.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # Specifies whether Amaon Redshift properties has a provisioned secret.
        @[JSON::Field(key: "isProvisionedSecret")]
        getter is_provisioned_secret : Bool?

        # The jdbcIam URL of the Amazon Redshift properties.
        @[JSON::Field(key: "jdbcIamUrl")]
        getter jdbc_iam_url : String?

        # The jdbcURL of the Amazon Redshift properties.
        @[JSON::Field(key: "jdbcUrl")]
        getter jdbc_url : String?

        # The lineage syn of the Amazon Redshift properties.
        @[JSON::Field(key: "lineageSync")]
        getter lineage_sync : Types::RedshiftLineageSyncConfigurationOutput?

        # The redshiftTempDir of the Amazon Redshift properties.
        @[JSON::Field(key: "redshiftTempDir")]
        getter redshift_temp_dir : String?

        # The status in the Amazon Redshift properties.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The storage in the Amazon Redshift properties.
        @[JSON::Field(key: "storage")]
        getter storage : Types::RedshiftStorageProperties?

        def initialize(
          @credentials : Types::RedshiftCredentials? = nil,
          @database_name : String? = nil,
          @is_provisioned_secret : Bool? = nil,
          @jdbc_iam_url : String? = nil,
          @jdbc_url : String? = nil,
          @lineage_sync : Types::RedshiftLineageSyncConfigurationOutput? = nil,
          @redshift_temp_dir : String? = nil,
          @status : String? = nil,
          @storage : Types::RedshiftStorageProperties? = nil
        )
        end
      end

      # Amazon Redshift properties patch.
      struct RedshiftPropertiesPatch
        include JSON::Serializable

        # The credentials in the Amazon Redshift properties patch.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::RedshiftCredentials?

        # The name in the Amazon Redshift properties patch.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String?

        # The host in the Amazon Redshift properties patch.
        @[JSON::Field(key: "host")]
        getter host : String?

        # The lineage sync in the Amazon Redshift properties patch.
        @[JSON::Field(key: "lineageSync")]
        getter lineage_sync : Types::RedshiftLineageSyncConfigurationInput?

        # The port in the Amazon Redshift properties patch.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The storage in the Amazon Redshift properties patch.
        @[JSON::Field(key: "storage")]
        getter storage : Types::RedshiftStorageProperties?

        def initialize(
          @credentials : Types::RedshiftCredentials? = nil,
          @database_name : String? = nil,
          @host : String? = nil,
          @lineage_sync : Types::RedshiftLineageSyncConfigurationInput? = nil,
          @port : Int32? = nil,
          @storage : Types::RedshiftStorageProperties? = nil
        )
        end
      end

      # The configuration details of the Amazon Redshift data source.
      struct RedshiftRunConfigurationInput
        include JSON::Serializable

        # The relational filger configurations included in the configuration details of the Amazon Redshift
        # data source.
        @[JSON::Field(key: "relationalFilterConfigurations")]
        getter relational_filter_configurations : Array(Types::RelationalFilterConfiguration)

        # The data access role included in the configuration details of the Amazon Redshift data source.
        @[JSON::Field(key: "dataAccessRole")]
        getter data_access_role : String?

        @[JSON::Field(key: "redshiftCredentialConfiguration")]
        getter redshift_credential_configuration : Types::RedshiftCredentialConfiguration?

        @[JSON::Field(key: "redshiftStorage")]
        getter redshift_storage : Types::RedshiftStorage?

        def initialize(
          @relational_filter_configurations : Array(Types::RelationalFilterConfiguration),
          @data_access_role : String? = nil,
          @redshift_credential_configuration : Types::RedshiftCredentialConfiguration? = nil,
          @redshift_storage : Types::RedshiftStorage? = nil
        )
        end
      end

      # The configuration details of the Amazon Redshift data source.
      struct RedshiftRunConfigurationOutput
        include JSON::Serializable

        @[JSON::Field(key: "redshiftStorage")]
        getter redshift_storage : Types::RedshiftStorage

        # The relational filger configurations included in the configuration details of the Amazon Redshift
        # data source.
        @[JSON::Field(key: "relationalFilterConfigurations")]
        getter relational_filter_configurations : Array(Types::RelationalFilterConfiguration)

        # The ID of the Amazon Web Services account included in the configuration details of the Amazon
        # Redshift data source.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The data access role included in the configuration details of the Amazon Redshift data source.
        @[JSON::Field(key: "dataAccessRole")]
        getter data_access_role : String?

        @[JSON::Field(key: "redshiftCredentialConfiguration")]
        getter redshift_credential_configuration : Types::RedshiftCredentialConfiguration?

        # The Amazon Web Services region included in the configuration details of the Amazon Redshift data
        # source.
        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @redshift_storage : Types::RedshiftStorage,
          @relational_filter_configurations : Array(Types::RelationalFilterConfiguration),
          @account_id : String? = nil,
          @data_access_role : String? = nil,
          @redshift_credential_configuration : Types::RedshiftCredentialConfiguration? = nil,
          @region : String? = nil
        )
        end
      end

      # The details for the self granting status for an Amazon Redshift data source.
      struct RedshiftSelfGrantStatusOutput
        include JSON::Serializable

        # The details for the self granting status for an Amazon Redshift data source.
        @[JSON::Field(key: "selfGrantStatusDetails")]
        getter self_grant_status_details : Array(Types::SelfGrantStatusDetail)

        def initialize(
          @self_grant_status_details : Array(Types::SelfGrantStatusDetail)
        )
        end
      end

      # The details of the Amazon Redshift Serverless workgroup storage.
      struct RedshiftServerlessStorage
        include JSON::Serializable

        # The name of the Amazon Redshift Serverless workgroup.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String

        def initialize(
          @workgroup_name : String
        )
        end
      end

      # The details of the Amazon Redshift storage as part of the configuration of an Amazon Redshift data
      # source run.
      struct RedshiftStorage
        include JSON::Serializable

        # The details of the Amazon Redshift cluster source.
        @[JSON::Field(key: "redshiftClusterSource")]
        getter redshift_cluster_source : Types::RedshiftClusterStorage?

        # The details of the Amazon Redshift Serverless workgroup source.
        @[JSON::Field(key: "redshiftServerlessSource")]
        getter redshift_serverless_source : Types::RedshiftServerlessStorage?

        def initialize(
          @redshift_cluster_source : Types::RedshiftClusterStorage? = nil,
          @redshift_serverless_source : Types::RedshiftServerlessStorage? = nil
        )
        end
      end

      # The Amazon Redshift storage properties.
      struct RedshiftStorageProperties
        include JSON::Serializable

        # The cluster name in the Amazon Redshift storage properties.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The workgroup name in the Amazon Redshift storage properties.
        @[JSON::Field(key: "workgroupName")]
        getter workgroup_name : String?

        def initialize(
          @cluster_name : String? = nil,
          @workgroup_name : String? = nil
        )
        end
      end

      # The Amazon Web Services Region.
      struct Region
        include JSON::Serializable

        # The Amazon Web Services Region name.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # The region name path.
        @[JSON::Field(key: "regionNamePath")]
        getter region_name_path : String?

        def initialize(
          @region_name : String? = nil,
          @region_name_path : String? = nil
        )
        end
      end

      # The details of the automatically generated business metadata that is rejected.
      struct RejectChoice
        include JSON::Serializable

        # Specifies the target (for example, a column name) where a prediction can be rejected.
        @[JSON::Field(key: "predictionTarget")]
        getter prediction_target : String

        # Specifies the the automatically generated business metadata that can be rejected.
        @[JSON::Field(key: "predictionChoices")]
        getter prediction_choices : Array(Int32)?

        def initialize(
          @prediction_target : String,
          @prediction_choices : Array(Int32)? = nil
        )
        end
      end

      struct RejectPredictionsInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the prediction.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the prediction (aka, the automatically generated piece of metadata) and the target (for
        # example, a column name) that can be rejected.
        @[JSON::Field(key: "rejectChoices")]
        getter reject_choices : Array(Types::RejectChoice)?

        # Specifies the rule (or the conditions) under which a prediction can be rejected.
        @[JSON::Field(key: "rejectRule")]
        getter reject_rule : Types::RejectRule?

        # The revision that is to be made to the asset.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @client_token : String? = nil,
          @reject_choices : Array(Types::RejectChoice)? = nil,
          @reject_rule : Types::RejectRule? = nil,
          @revision : String? = nil
        )
        end
      end

      struct RejectPredictionsOutput
        include JSON::Serializable

        # The ID of the asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The revision that is to be made to the asset.
        @[JSON::Field(key: "assetRevision")]
        getter asset_revision : String

        # The ID of the Amazon DataZone domain.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        def initialize(
          @asset_id : String,
          @asset_revision : String,
          @domain_id : String
        )
        end
      end

      # Specifies the rule and the threshold under which a prediction can be rejected.
      struct RejectRule
        include JSON::Serializable

        # Specifies whether you want to reject the top prediction for all targets or none.
        @[JSON::Field(key: "rule")]
        getter rule : String?

        # The confidence score that specifies the condition at which a prediction can be rejected.
        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        def initialize(
          @rule : String? = nil,
          @threshold : Float64? = nil
        )
        end
      end

      struct RejectSubscriptionRequestInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which the subscription request was rejected.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the subscription request that was rejected.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The decision comment of the rejected subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @decision_comment : String? = nil
        )
        end
      end

      struct RejectSubscriptionRequestOutput
        include JSON::Serializable

        # The timestamp of when the subscription request was rejected.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The timestamp of when the subscription request was rejected.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the subscription request was rejected.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription request that was rejected.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reason for the subscription request.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # The subscribed listings of the subscription request.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # The subscribed principals of the subscription request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # The timestamp of when the subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The decision comment of the rejected subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # Metadata forms included in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormOutput)?

        # The identifier of the subscription request reviewer.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # The Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms : Array(Types::FormOutput)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The relational filter configuration for the data source.
      struct RelationalFilterConfiguration
        include JSON::Serializable

        # The database name specified in the relational filter configuration for the data source.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The filter expressions specified in the relational filter configuration for the data source.
        @[JSON::Field(key: "filterExpressions")]
        getter filter_expressions : Array(Types::FilterExpression)?

        # The schema name specified in the relational filter configuration for the data source.
        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        def initialize(
          @database_name : String,
          @filter_expressions : Array(Types::FilterExpression)? = nil,
          @schema_name : String? = nil
        )
        end
      end

      struct RemoveEntityOwnerInput
        include JSON::Serializable

        # The ID of the domain where you want to remove an owner from an entity.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity from which you want to remove an owner.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the entity from which you want to remove an owner.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The owner that you want to remove from an entity.
        @[JSON::Field(key: "owner")]
        getter owner : Types::OwnerProperties

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @owner : Types::OwnerProperties,
          @client_token : String? = nil
        )
        end
      end

      struct RemoveEntityOwnerOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct RemovePolicyGrantInput
        include JSON::Serializable

        # The ID of the domain where you want to remove a policy grant.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the entity from which you want to remove a policy grant.
        @[JSON::Field(key: "entityIdentifier")]
        getter entity_identifier : String

        # The type of the entity from which you want to remove a policy grant.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String

        # The type of the policy that you want to remove.
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The principal from which you want to remove a policy grant.
        @[JSON::Field(key: "principal")]
        getter principal : Types::PolicyGrantPrincipal

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The ID of the policy grant that is to be removed from a specified entity.
        @[JSON::Field(key: "grantIdentifier")]
        getter grant_identifier : String?

        def initialize(
          @domain_identifier : String,
          @entity_identifier : String,
          @entity_type : String,
          @policy_type : String,
          @principal : Types::PolicyGrantPrincipal,
          @client_token : String? = nil,
          @grant_identifier : String? = nil
        )
        end
      end

      struct RemovePolicyGrantOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The details of a provisioned resource of this Amazon DataZone environment.
      struct Resource
        include JSON::Serializable

        # The type of a provisioned resource of this Amazon DataZone environment.
        @[JSON::Field(key: "type")]
        getter type : String

        # The value of a provisioned resource of this Amazon DataZone environment.
        @[JSON::Field(key: "value")]
        getter value : String

        # The name of a provisioned resource of this Amazon DataZone environment.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The provider of a provisioned resource of this Amazon DataZone environment.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        def initialize(
          @type : String,
          @value : String,
          @name : String? = nil,
          @provider : String? = nil
        )
        end
      end

      # The specified resource cannot be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The resource tag of the project.
      struct ResourceTag
        include JSON::Serializable

        # The key of the resource tag of the project.
        @[JSON::Field(key: "key")]
        getter key : String

        # The source of the resource tag of the project.
        @[JSON::Field(key: "source")]
        getter source : String

        # The value of the resource tag of the project.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @source : String,
          @value : String
        )
        end
      end

      # The resource tag parameter of the project profile.
      struct ResourceTagParameter
        include JSON::Serializable

        # Specifies whether the value of the resource tag parameter of the project profile is editable at the
        # project level.
        @[JSON::Field(key: "isValueEditable")]
        getter is_value_editable : Bool

        # The key of the resource tag parameter of the project profile.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the resource tag parameter key of the project profile.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @is_value_editable : Bool,
          @key : String,
          @value : String
        )
        end
      end

      struct RevokeSubscriptionInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain where you want to revoke a subscription.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the revoked subscription.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies whether permissions are retained when the subscription is revoked.
        @[JSON::Field(key: "retainPermissions")]
        getter retain_permissions : Bool?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @retain_permissions : Bool? = nil
        )
        end
      end

      struct RevokeSubscriptionOutput
        include JSON::Serializable

        # The timestamp of when the subscription was revoked.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier of the user who revoked the subscription.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain where you want to revoke a subscription.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the revoked subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the revoked subscription.
        @[JSON::Field(key: "status")]
        getter status : String

        # The subscribed listing of the revoked subscription.
        @[JSON::Field(key: "subscribedListing")]
        getter subscribed_listing : Types::SubscribedListing

        # The subscribed principal of the revoked subscription.
        @[JSON::Field(key: "subscribedPrincipal")]
        getter subscribed_principal : Types::SubscribedPrincipal

        # The timestamp of when the subscription was revoked.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Specifies whether permissions are retained when the subscription is revoked.
        @[JSON::Field(key: "retainPermissions")]
        getter retain_permissions : Bool?

        # The identifier of the subscription request for the revoked subscription.
        @[JSON::Field(key: "subscriptionRequestId")]
        getter subscription_request_id : String?

        # The Amazon DataZone user who revoked the subscription.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @status : String,
          @subscribed_listing : Types::SubscribedListing,
          @subscribed_principal : Types::SubscribedPrincipal,
          @updated_at : Time,
          @retain_permissions : Bool? = nil,
          @subscription_request_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The row filter.
      struct RowFilter
        include JSON::Serializable

        # The 'and' clause of the row filter.
        @[JSON::Field(key: "and")]
        getter and : Array(Types::RowFilter)?

        # The expression of the row filter.
        @[JSON::Field(key: "expression")]
        getter expression : Types::RowFilterExpression?

        # The 'or' clause of the row filter.
        @[JSON::Field(key: "or")]
        getter or : Array(Types::RowFilter)?

        def initialize(
          @and : Array(Types::RowFilter)? = nil,
          @expression : Types::RowFilterExpression? = nil,
          @or : Array(Types::RowFilter)? = nil
        )
        end
      end

      # The row filter configuration details.
      struct RowFilterConfiguration
        include JSON::Serializable

        # The row filter.
        @[JSON::Field(key: "rowFilter")]
        getter row_filter : Types::RowFilter

        # Specifies whether the row filter is sensitive.
        @[JSON::Field(key: "sensitive")]
        getter sensitive : Bool?

        def initialize(
          @row_filter : Types::RowFilter,
          @sensitive : Bool? = nil
        )
        end
      end

      # The row filter expression.
      struct RowFilterExpression
        include JSON::Serializable

        # The 'equal to' clause of the row filter expression.
        @[JSON::Field(key: "equalTo")]
        getter equal_to : Types::EqualToExpression?

        # The 'greater than' clause of the row filter expression.
        @[JSON::Field(key: "greaterThan")]
        getter greater_than : Types::GreaterThanExpression?

        # The 'greater than or equal to' clause of the filter expression.
        @[JSON::Field(key: "greaterThanOrEqualTo")]
        getter greater_than_or_equal_to : Types::GreaterThanOrEqualToExpression?

        # The 'in' clause of the row filter expression.
        @[JSON::Field(key: "in")]
        getter in : Types::InExpression?

        # The 'is not null' clause of the row filter expression.
        @[JSON::Field(key: "isNotNull")]
        getter is_not_null : Types::IsNotNullExpression?

        # The 'is null' clause of the row filter expression.
        @[JSON::Field(key: "isNull")]
        getter is_null : Types::IsNullExpression?

        # The 'less than' clause of the row filter expression.
        @[JSON::Field(key: "lessThan")]
        getter less_than : Types::LessThanExpression?

        # The 'less than or equal to' clause of the row filter expression.
        @[JSON::Field(key: "lessThanOrEqualTo")]
        getter less_than_or_equal_to : Types::LessThanOrEqualToExpression?

        # The 'like' clause of the row filter expression.
        @[JSON::Field(key: "like")]
        getter like : Types::LikeExpression?

        # The 'no equal to' clause of the row filter expression.
        @[JSON::Field(key: "notEqualTo")]
        getter not_equal_to : Types::NotEqualToExpression?

        # The 'not in' clause of the row filter expression.
        @[JSON::Field(key: "notIn")]
        getter not_in : Types::NotInExpression?

        # The 'not like' clause of the row filter expression.
        @[JSON::Field(key: "notLike")]
        getter not_like : Types::NotLikeExpression?

        def initialize(
          @equal_to : Types::EqualToExpression? = nil,
          @greater_than : Types::GreaterThanExpression? = nil,
          @greater_than_or_equal_to : Types::GreaterThanOrEqualToExpression? = nil,
          @in : Types::InExpression? = nil,
          @is_not_null : Types::IsNotNullExpression? = nil,
          @is_null : Types::IsNullExpression? = nil,
          @less_than : Types::LessThanExpression? = nil,
          @less_than_or_equal_to : Types::LessThanOrEqualToExpression? = nil,
          @like : Types::LikeExpression? = nil,
          @not_equal_to : Types::NotEqualToExpression? = nil,
          @not_in : Types::NotInExpression? = nil,
          @not_like : Types::NotLikeExpression? = nil
        )
        end
      end

      # The details of a rule.
      struct RuleDetail
        include JSON::Serializable

        # The enforcement details of a glossary term that's part of the metadata rule.
        @[JSON::Field(key: "glossaryTermEnforcementDetail")]
        getter glossary_term_enforcement_detail : Types::GlossaryTermEnforcementDetail?

        # The enforcement detail of the metadata form.
        @[JSON::Field(key: "metadataFormEnforcementDetail")]
        getter metadata_form_enforcement_detail : Types::MetadataFormEnforcementDetail?

        def initialize(
          @glossary_term_enforcement_detail : Types::GlossaryTermEnforcementDetail? = nil,
          @metadata_form_enforcement_detail : Types::MetadataFormEnforcementDetail? = nil
        )
        end
      end

      # The scope of a rule.
      struct RuleScope
        include JSON::Serializable

        # The asset type included in the rule scope.
        @[JSON::Field(key: "assetType")]
        getter asset_type : Types::AssetTypesForRule?

        # The data product included in the rule scope.
        @[JSON::Field(key: "dataProduct")]
        getter data_product : Bool?

        # The project included in the rule scope.
        @[JSON::Field(key: "project")]
        getter project : Types::ProjectsForRule?

        def initialize(
          @asset_type : Types::AssetTypesForRule? = nil,
          @data_product : Bool? = nil,
          @project : Types::ProjectsForRule? = nil
        )
        end
      end

      # The summary of the rule.
      struct RuleSummary
        include JSON::Serializable

        # The action of the rule.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The ID of the rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The revision of the rule.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        # The type of the rule.
        @[JSON::Field(key: "ruleType")]
        getter rule_type : String?

        # The scope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope?

        # The target of the rule.
        @[JSON::Field(key: "target")]
        getter target : Types::RuleTarget?

        # The target type of the rule.
        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @action : String? = nil,
          @identifier : String? = nil,
          @last_updated_by : String? = nil,
          @name : String? = nil,
          @revision : String? = nil,
          @rule_type : String? = nil,
          @scope : Types::RuleScope? = nil,
          @target : Types::RuleTarget? = nil,
          @target_type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The target of the rule.
      struct RuleTarget
        include JSON::Serializable

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitTarget")]
        getter domain_unit_target : Types::DomainUnitTarget?

        def initialize(
          @domain_unit_target : Types::DomainUnitTarget? = nil
        )
        end
      end

      # The asset statistics from the data source run.
      struct RunStatisticsForAssets
        include JSON::Serializable

        # The added statistic for the data source run.
        @[JSON::Field(key: "added")]
        getter added : Int32?

        # The failed statistic for the data source run.
        @[JSON::Field(key: "failed")]
        getter failed : Int32?

        # The skipped statistic for the data source run.
        @[JSON::Field(key: "skipped")]
        getter skipped : Int32?

        # The unchanged statistic for the data source run.
        @[JSON::Field(key: "unchanged")]
        getter unchanged : Int32?

        # The updated statistic for the data source run.
        @[JSON::Field(key: "updated")]
        getter updated : Int32?

        def initialize(
          @added : Int32? = nil,
          @failed : Int32? = nil,
          @skipped : Int32? = nil,
          @unchanged : Int32? = nil,
          @updated : Int32? = nil
        )
        end
      end

      # The Amazon S3 properties of a connection.
      struct S3PropertiesInput
        include JSON::Serializable

        # The Amazon S3 URI that's part of the Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The Amazon S3 Access Grant location ID that's part of the Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3AccessGrantLocationId")]
        getter s3_access_grant_location_id : String?

        def initialize(
          @s3_uri : String,
          @s3_access_grant_location_id : String? = nil
        )
        end
      end

      # The Amazon S3 properties of a connection.
      struct S3PropertiesOutput
        include JSON::Serializable

        # The Amazon S3 URI that's part of the Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The error message that gets displayed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The Amazon S3 Access Grant location ID that's part of the Amazon S3 properties of a connection.
        @[JSON::Field(key: "s3AccessGrantLocationId")]
        getter s3_access_grant_location_id : String?

        # The status of the Amazon S3 connection.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @s3_uri : String,
          @error_message : String? = nil,
          @s3_access_grant_location_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The Amazon S3 properties patch of a connection.
      struct S3PropertiesPatch
        include JSON::Serializable

        # The Amazon S3 URI that's part of the Amazon S3 properties patch of a connection.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The Amazon S3 Access Grant location ID that's part of the Amazon S3 properties patch of a
        # connection.
        @[JSON::Field(key: "s3AccessGrantLocationId")]
        getter s3_access_grant_location_id : String?

        def initialize(
          @s3_uri : String,
          @s3_access_grant_location_id : String? = nil
        )
        end
      end

      # The Amazon SageMaker run configuration.
      struct SageMakerRunConfigurationInput
        include JSON::Serializable

        # The tracking assets of the Amazon SageMaker run.
        @[JSON::Field(key: "trackingAssets")]
        getter tracking_assets : Hash(String, Array(String))

        def initialize(
          @tracking_assets : Hash(String, Array(String))
        )
        end
      end

      # The Amazon SageMaker run configuration.
      struct SageMakerRunConfigurationOutput
        include JSON::Serializable

        # The tracking assets of the Amazon SageMaker.
        @[JSON::Field(key: "trackingAssets")]
        getter tracking_assets : Hash(String, Array(String))

        # The Amazon SageMaker account ID.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon SageMaker Region.
        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @tracking_assets : Hash(String, Array(String)),
          @account_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # The details of the schedule of the data source runs.
      struct ScheduleConfiguration
        include JSON::Serializable

        # The schedule of the data source runs.
        @[JSON::Field(key: "schedule")]
        getter schedule : String?

        # The timezone of the data source run.
        @[JSON::Field(key: "timezone")]
        getter timezone : String?

        def initialize(
          @schedule : String? = nil,
          @timezone : String? = nil
        )
        end
      end

      struct SearchGroupProfilesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which you want to search group profiles.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The group type for which to search.
        @[JSON::Field(key: "groupType")]
        getter group_type : String

        # The maximum number of results to return in a single call to SearchGroupProfiles . When the number of
        # results to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to SearchGroupProfiles to list the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchGroupProfiles to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the text for which to search.
        @[JSON::Field(key: "searchText")]
        getter search_text : String?

        def initialize(
          @domain_identifier : String,
          @group_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_text : String? = nil
        )
        end
      end

      struct SearchGroupProfilesOutput
        include JSON::Serializable

        # The results of the SearchGroupProfiles action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::GroupProfileSummary)?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchGroupProfiles to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::GroupProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The details of the search.
      struct SearchInItem
        include JSON::Serializable

        # The search attribute.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        def initialize(
          @attribute : String
        )
        end
      end

      struct SearchInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The scope of the search.
        @[JSON::Field(key: "searchScope")]
        getter search_scope : String

        # Specifies additional attributes for the Search action.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Array(String)?

        # Specifies the search filters.
        @[JSON::Field(key: "filters")]
        getter filters : Types::FilterClause?

        # The maximum number of results to return in a single call to Search . When the number of results to
        # be listed is greater than the value of MaxResults , the response contains a NextToken value that you
        # can use in a subsequent call to Search to list the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to Search to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The identifier of the owning project specified for the search.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String?

        # The details of the search.
        @[JSON::Field(key: "searchIn")]
        getter search_in : Array(Types::SearchInItem)?

        # Specifies the text for which to search.
        @[JSON::Field(key: "searchText")]
        getter search_text : String?

        # Specifies the way in which the search results are to be sorted.
        @[JSON::Field(key: "sort")]
        getter sort : Types::SearchSort?

        def initialize(
          @domain_identifier : String,
          @search_scope : String,
          @additional_attributes : Array(String)? = nil,
          @filters : Types::FilterClause? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owning_project_identifier : String? = nil,
          @search_in : Array(Types::SearchInItem)? = nil,
          @search_text : String? = nil,
          @sort : Types::SearchSort? = nil
        )
        end
      end

      # The details of the search results.
      struct SearchInventoryResultItem
        include JSON::Serializable

        # The asset item included in the search results.
        @[JSON::Field(key: "assetItem")]
        getter asset_item : Types::AssetItem?

        # The data product.
        @[JSON::Field(key: "dataProductItem")]
        getter data_product_item : Types::DataProductResultItem?

        # The glossary item included in the search results.
        @[JSON::Field(key: "glossaryItem")]
        getter glossary_item : Types::GlossaryItem?

        # The glossary term item included in the search results.
        @[JSON::Field(key: "glossaryTermItem")]
        getter glossary_term_item : Types::GlossaryTermItem?

        def initialize(
          @asset_item : Types::AssetItem? = nil,
          @data_product_item : Types::DataProductResultItem? = nil,
          @glossary_item : Types::GlossaryItem? = nil,
          @glossary_term_item : Types::GlossaryTermItem? = nil
        )
        end
      end

      struct SearchListingsInput
        include JSON::Serializable

        # The identifier of the domain in which to search listings.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies additional attributes for the search.
        @[JSON::Field(key: "additionalAttributes")]
        getter additional_attributes : Array(String)?

        # Enables you to specify one or more attributes to compute and return counts grouped by field values.
        @[JSON::Field(key: "aggregations")]
        getter aggregations : Array(Types::AggregationListItem)?

        # Specifies the filters for the search of listings.
        @[JSON::Field(key: "filters")]
        getter filters : Types::FilterClause?

        # The maximum number of results to return in a single call to SearchListings . When the number of
        # results to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to SearchListings to list the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchListings to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The details of the search.
        @[JSON::Field(key: "searchIn")]
        getter search_in : Array(Types::SearchInItem)?

        # Specifies the text for which to search.
        @[JSON::Field(key: "searchText")]
        getter search_text : String?

        # Specifies the way for sorting the search results.
        @[JSON::Field(key: "sort")]
        getter sort : Types::SearchSort?

        def initialize(
          @domain_identifier : String,
          @additional_attributes : Array(String)? = nil,
          @aggregations : Array(Types::AggregationListItem)? = nil,
          @filters : Types::FilterClause? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_in : Array(Types::SearchInItem)? = nil,
          @search_text : String? = nil,
          @sort : Types::SearchSort? = nil
        )
        end
      end

      struct SearchListingsOutput
        include JSON::Serializable

        # Contains computed counts grouped by field values based on the requested aggregation attributes for
        # the matching listings.
        @[JSON::Field(key: "aggregates")]
        getter aggregates : Array(Types::AggregationOutput)?

        # The results of the SearchListings action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SearchResultItem)?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchListings to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Total number of search results.
        @[JSON::Field(key: "totalMatchCount")]
        getter total_match_count : Int32?

        def initialize(
          @aggregates : Array(Types::AggregationOutput)? = nil,
          @items : Array(Types::SearchResultItem)? = nil,
          @next_token : String? = nil,
          @total_match_count : Int32? = nil
        )
        end
      end

      struct SearchOutput
        include JSON::Serializable

        # The results of the Search action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SearchInventoryResultItem)?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to Search to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Total number of search results.
        @[JSON::Field(key: "totalMatchCount")]
        getter total_match_count : Int32?

        def initialize(
          @items : Array(Types::SearchInventoryResultItem)? = nil,
          @next_token : String? = nil,
          @total_match_count : Int32? = nil
        )
        end
      end

      # The details of the results of the SearchListings action.
      struct SearchResultItem
        include JSON::Serializable

        # The asset listing included in the results of the SearchListings action.
        @[JSON::Field(key: "assetListing")]
        getter asset_listing : Types::AssetListingItem?

        # The data product listing.
        @[JSON::Field(key: "dataProductListing")]
        getter data_product_listing : Types::DataProductListingItem?

        def initialize(
          @asset_listing : Types::AssetListingItem? = nil,
          @data_product_listing : Types::DataProductListingItem? = nil
        )
        end
      end

      # The details of the way to sort search results.
      struct SearchSort
        include JSON::Serializable

        # The attribute detail of the way to sort search results.
        @[JSON::Field(key: "attribute")]
        getter attribute : String

        # The order detail of the wya to sort search results.
        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @attribute : String,
          @order : String? = nil
        )
        end
      end

      struct SearchTypesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which to invoke the SearchTypes action.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies whether the search is managed.
        @[JSON::Field(key: "managed")]
        getter managed : Bool

        # Specifies the scope of the search for types.
        @[JSON::Field(key: "searchScope")]
        getter search_scope : String

        # The filters for the SearchTypes action.
        @[JSON::Field(key: "filters")]
        getter filters : Types::FilterClause?

        # The maximum number of results to return in a single call to SearchTypes . When the number of results
        # to be listed is greater than the value of MaxResults , the response contains a NextToken value that
        # you can use in a subsequent call to SearchTypes to list the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchTypes to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The details of the search.
        @[JSON::Field(key: "searchIn")]
        getter search_in : Array(Types::SearchInItem)?

        # Specifies the text for which to search.
        @[JSON::Field(key: "searchText")]
        getter search_text : String?

        # The specifies the way to sort the SearchTypes results.
        @[JSON::Field(key: "sort")]
        getter sort : Types::SearchSort?

        def initialize(
          @domain_identifier : String,
          @managed : Bool,
          @search_scope : String,
          @filters : Types::FilterClause? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_in : Array(Types::SearchInItem)? = nil,
          @search_text : String? = nil,
          @sort : Types::SearchSort? = nil
        )
        end
      end

      struct SearchTypesOutput
        include JSON::Serializable

        # The results of the SearchTypes action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::SearchTypesResultItem)?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchTypes to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Total number of search results.
        @[JSON::Field(key: "totalMatchCount")]
        getter total_match_count : Int32?

        def initialize(
          @items : Array(Types::SearchTypesResultItem)? = nil,
          @next_token : String? = nil,
          @total_match_count : Int32? = nil
        )
        end
      end

      # The details of the results of the SearchTypes action.
      struct SearchTypesResultItem
        include JSON::Serializable

        # The asset type included in the results of the SearchTypes action.
        @[JSON::Field(key: "assetTypeItem")]
        getter asset_type_item : Types::AssetTypeItem?

        # The form type included in the results of the SearchTypes action.
        @[JSON::Field(key: "formTypeItem")]
        getter form_type_item : Types::FormTypeData?

        # The details of a data lineage node type.
        @[JSON::Field(key: "lineageNodeTypeItem")]
        getter lineage_node_type_item : Types::LineageNodeTypeItem?

        def initialize(
          @asset_type_item : Types::AssetTypeItem? = nil,
          @form_type_item : Types::FormTypeData? = nil,
          @lineage_node_type_item : Types::LineageNodeTypeItem? = nil
        )
        end
      end

      struct SearchUserProfilesInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which you want to search user profiles.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # Specifies the user type for the SearchUserProfiles action.
        @[JSON::Field(key: "userType")]
        getter user_type : String

        # The maximum number of results to return in a single call to SearchUserProfiles . When the number of
        # results to be listed is greater than the value of MaxResults , the response contains a NextToken
        # value that you can use in a subsequent call to SearchUserProfiles to list the next set of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchUserProfiles to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the text for which to search.
        @[JSON::Field(key: "searchText")]
        getter search_text : String?

        def initialize(
          @domain_identifier : String,
          @user_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_text : String? = nil
        )
        end
      end

      struct SearchUserProfilesOutput
        include JSON::Serializable

        # The results of the SearchUserProfiles action.
        @[JSON::Field(key: "items")]
        getter items : Array(Types::UserProfileSummary)?

        # When the number of results is greater than the default value for the MaxResults parameter, or if you
        # explicitly specify a value for MaxResults that is less than the number of results, the response
        # includes a pagination token named NextToken . You can specify this NextToken value in a subsequent
        # call to SearchUserProfiles to list the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::UserProfileSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The details for the self granting status.
      struct SelfGrantStatusDetail
        include JSON::Serializable

        # The name of the database used for the data source.
        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The self granting status of the data source.
        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for why the operation failed.
        @[JSON::Field(key: "failureCause")]
        getter failure_cause : String?

        # The name of the schema used in the data source.
        @[JSON::Field(key: "schemaName")]
        getter schema_name : String?

        def initialize(
          @database_name : String,
          @status : String,
          @failure_cause : String? = nil,
          @schema_name : String? = nil
        )
        end
      end

      # The details for the self granting status for a data source.
      struct SelfGrantStatusOutput
        include JSON::Serializable

        # The details for the self granting status for a Glue data source.
        @[JSON::Field(key: "glueSelfGrantStatus")]
        getter glue_self_grant_status : Types::GlueSelfGrantStatusOutput?

        # The details for the self granting status for an Amazon Redshift data source.
        @[JSON::Field(key: "redshiftSelfGrantStatus")]
        getter redshift_self_grant_status : Types::RedshiftSelfGrantStatusOutput?

        def initialize(
          @glue_self_grant_status : Types::GlueSelfGrantStatusOutput? = nil,
          @redshift_self_grant_status : Types::RedshiftSelfGrantStatusOutput? = nil
        )
        end
      end

      # The request has exceeded the specified service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The single sign-on details in Amazon DataZone.
      struct SingleSignOn
        include JSON::Serializable

        # The ARN of the IDC instance.
        @[JSON::Field(key: "idcInstanceArn")]
        getter idc_instance_arn : String?

        # The type of single sign-on in Amazon DataZone.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The single sign-on user assignment in Amazon DataZone.
        @[JSON::Field(key: "userAssignment")]
        getter user_assignment : String?

        def initialize(
          @idc_instance_arn : String? = nil,
          @type : String? = nil,
          @user_assignment : String? = nil
        )
        end
      end

      # The Spark EMR properties.
      struct SparkEmrPropertiesInput
        include JSON::Serializable

        # The compute ARN of Spark EMR.
        @[JSON::Field(key: "computeArn")]
        getter compute_arn : String?

        # The instance profile ARN of Spark EMR.
        @[JSON::Field(key: "instanceProfileArn")]
        getter instance_profile_arn : String?

        # The java virtual env of the Spark EMR.
        @[JSON::Field(key: "javaVirtualEnv")]
        getter java_virtual_env : String?

        # The log URI of the Spark EMR.
        @[JSON::Field(key: "logUri")]
        getter log_uri : String?

        # The managed endpoint ARN of the EMR on EKS cluster.
        @[JSON::Field(key: "managedEndpointArn")]
        getter managed_endpoint_arn : String?

        # The Python virtual env of the Spark EMR.
        @[JSON::Field(key: "pythonVirtualEnv")]
        getter python_virtual_env : String?

        # The runtime role of the Spark EMR.
        @[JSON::Field(key: "runtimeRole")]
        getter runtime_role : String?

        # The certificates S3 URI of the Spark EMR.
        @[JSON::Field(key: "trustedCertificatesS3Uri")]
        getter trusted_certificates_s3_uri : String?

        def initialize(
          @compute_arn : String? = nil,
          @instance_profile_arn : String? = nil,
          @java_virtual_env : String? = nil,
          @log_uri : String? = nil,
          @managed_endpoint_arn : String? = nil,
          @python_virtual_env : String? = nil,
          @runtime_role : String? = nil,
          @trusted_certificates_s3_uri : String? = nil
        )
        end
      end

      # The Spark EMR properties.
      struct SparkEmrPropertiesOutput
        include JSON::Serializable

        # The certificate data of the EMR on EKS cluster.
        @[JSON::Field(key: "certificateData")]
        getter certificate_data : String?

        # The compute ARN of the Spark EMR.
        @[JSON::Field(key: "computeArn")]
        getter compute_arn : String?

        # The credentials of the Spark EMR.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::UsernamePassword?

        # The credential expiration of the Spark EMR.
        @[JSON::Field(key: "credentialsExpiration")]
        getter credentials_expiration : Time?

        # The governance type of the Spark EMR.
        @[JSON::Field(key: "governanceType")]
        getter governance_type : String?

        # The instance profile ARN of the Spark EMR.
        @[JSON::Field(key: "instanceProfileArn")]
        getter instance_profile_arn : String?

        # The Java virtual env of the Spark EMR.
        @[JSON::Field(key: "javaVirtualEnv")]
        getter java_virtual_env : String?

        # The livy endpoint of the Spark EMR.
        @[JSON::Field(key: "livyEndpoint")]
        getter livy_endpoint : String?

        # The log URI of the Spark EMR.
        @[JSON::Field(key: "logUri")]
        getter log_uri : String?

        # The managed endpoint ARN of the EMR on EKS cluster.
        @[JSON::Field(key: "managedEndpointArn")]
        getter managed_endpoint_arn : String?

        # The managed endpoint credentials of the EMR on EKS cluster.
        @[JSON::Field(key: "managedEndpointCredentials")]
        getter managed_endpoint_credentials : Types::ManagedEndpointCredentials?

        # The Python virtual env of the Spark EMR.
        @[JSON::Field(key: "pythonVirtualEnv")]
        getter python_virtual_env : String?

        # The runtime role of the Spark EMR.
        @[JSON::Field(key: "runtimeRole")]
        getter runtime_role : String?

        # The trusted certificate S3 URL of the Spark EMR.
        @[JSON::Field(key: "trustedCertificatesS3Uri")]
        getter trusted_certificates_s3_uri : String?

        def initialize(
          @certificate_data : String? = nil,
          @compute_arn : String? = nil,
          @credentials : Types::UsernamePassword? = nil,
          @credentials_expiration : Time? = nil,
          @governance_type : String? = nil,
          @instance_profile_arn : String? = nil,
          @java_virtual_env : String? = nil,
          @livy_endpoint : String? = nil,
          @log_uri : String? = nil,
          @managed_endpoint_arn : String? = nil,
          @managed_endpoint_credentials : Types::ManagedEndpointCredentials? = nil,
          @python_virtual_env : String? = nil,
          @runtime_role : String? = nil,
          @trusted_certificates_s3_uri : String? = nil
        )
        end
      end

      # The Spark EMR properties patch.
      struct SparkEmrPropertiesPatch
        include JSON::Serializable

        # The compute ARN in the Spark EMR properties patch.
        @[JSON::Field(key: "computeArn")]
        getter compute_arn : String?

        # The instance profile ARN in the Spark EMR properties patch.
        @[JSON::Field(key: "instanceProfileArn")]
        getter instance_profile_arn : String?

        # The Java virtual evn in the Spark EMR properties patch.
        @[JSON::Field(key: "javaVirtualEnv")]
        getter java_virtual_env : String?

        # The log URI in the Spark EMR properties patch.
        @[JSON::Field(key: "logUri")]
        getter log_uri : String?

        # The managed endpoint ARN of the EMR on EKS cluster.
        @[JSON::Field(key: "managedEndpointArn")]
        getter managed_endpoint_arn : String?

        # The Python virtual env in the Spark EMR properties patch.
        @[JSON::Field(key: "pythonVirtualEnv")]
        getter python_virtual_env : String?

        # The runtime role in the Spark EMR properties patch.
        @[JSON::Field(key: "runtimeRole")]
        getter runtime_role : String?

        # The trusted certificates S3 URI in the Spark EMR properties patch.
        @[JSON::Field(key: "trustedCertificatesS3Uri")]
        getter trusted_certificates_s3_uri : String?

        def initialize(
          @compute_arn : String? = nil,
          @instance_profile_arn : String? = nil,
          @java_virtual_env : String? = nil,
          @log_uri : String? = nil,
          @managed_endpoint_arn : String? = nil,
          @python_virtual_env : String? = nil,
          @runtime_role : String? = nil,
          @trusted_certificates_s3_uri : String? = nil
        )
        end
      end

      # The Spark Amazon Web Services Glue args.
      struct SparkGlueArgs
        include JSON::Serializable

        # The connection in the Spark Amazon Web Services Glue args.
        @[JSON::Field(key: "connection")]
        getter connection : String?

        def initialize(
          @connection : String? = nil
        )
        end
      end

      # The Spark Amazon Web Services Glue properties.
      struct SparkGluePropertiesInput
        include JSON::Serializable

        # The additional args in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "additionalArgs")]
        getter additional_args : Types::SparkGlueArgs?

        # The Amazon Web Services Glue connection name in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "glueConnectionName")]
        getter glue_connection_name : String?

        # The Amazon Web Services Glue version in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "glueVersion")]
        getter glue_version : String?

        # The idle timeout in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "idleTimeout")]
        getter idle_timeout : Int32?

        # The Java virtual env in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "javaVirtualEnv")]
        getter java_virtual_env : String?

        # The number of workers in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "numberOfWorkers")]
        getter number_of_workers : Int32?

        # The Python virtual env in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "pythonVirtualEnv")]
        getter python_virtual_env : String?

        # The worker type in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "workerType")]
        getter worker_type : String?

        def initialize(
          @additional_args : Types::SparkGlueArgs? = nil,
          @glue_connection_name : String? = nil,
          @glue_version : String? = nil,
          @idle_timeout : Int32? = nil,
          @java_virtual_env : String? = nil,
          @number_of_workers : Int32? = nil,
          @python_virtual_env : String? = nil,
          @worker_type : String? = nil
        )
        end
      end

      # The Spark Amazon Web Services Glue properties.
      struct SparkGluePropertiesOutput
        include JSON::Serializable

        # The additional args in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "additionalArgs")]
        getter additional_args : Types::SparkGlueArgs?

        # The Amazon Web Services Glue connection name in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "glueConnectionName")]
        getter glue_connection_name : String?

        # The Amazon Web Services Glue version in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "glueVersion")]
        getter glue_version : String?

        # The idle timeout in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "idleTimeout")]
        getter idle_timeout : Int32?

        # The Java virtual env in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "javaVirtualEnv")]
        getter java_virtual_env : String?

        # The number of workers in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "numberOfWorkers")]
        getter number_of_workers : Int32?

        # The Python virtual env in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "pythonVirtualEnv")]
        getter python_virtual_env : String?

        # The worker type in the Spark Amazon Web Services Glue properties.
        @[JSON::Field(key: "workerType")]
        getter worker_type : String?

        def initialize(
          @additional_args : Types::SparkGlueArgs? = nil,
          @glue_connection_name : String? = nil,
          @glue_version : String? = nil,
          @idle_timeout : Int32? = nil,
          @java_virtual_env : String? = nil,
          @number_of_workers : Int32? = nil,
          @python_virtual_env : String? = nil,
          @worker_type : String? = nil
        )
        end
      end

      # The SSO user profile detail.
      struct SsoUserProfileDetails
        include JSON::Serializable

        # The first name as part of the SSO user profile detail.
        @[JSON::Field(key: "firstName")]
        getter first_name : String?

        # The last name as part of the SSO user profile detail.
        @[JSON::Field(key: "lastName")]
        getter last_name : String?

        # The username as part of the SSO user profile detail.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @first_name : String? = nil,
          @last_name : String? = nil,
          @username : String? = nil
        )
        end
      end

      struct StartDataSourceRunInput
        include JSON::Serializable

        # The identifier of the data source.
        @[JSON::Field(key: "dataSourceIdentifier")]
        getter data_source_identifier : String

        # The identifier of the Amazon DataZone domain in which to start a data source run.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @data_source_identifier : String,
          @domain_identifier : String,
          @client_token : String? = nil
        )
        end
      end

      struct StartDataSourceRunOutput
        include JSON::Serializable

        # The timestamp of when data source run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier of the data source.
        @[JSON::Field(key: "dataSourceId")]
        getter data_source_id : String

        # The identifier of the Amazon DataZone domain in which to start a data source run.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the data source run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The identifier of the project.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The status of the data source run.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the data source run.
        @[JSON::Field(key: "type")]
        getter type : String

        # The timestamp of when the data source run was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The configuration snapshot of the data source that is being run.
        @[JSON::Field(key: "dataSourceConfigurationSnapshot")]
        getter data_source_configuration_snapshot : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # Specifies run statistics for assets.
        @[JSON::Field(key: "runStatisticsForAssets")]
        getter run_statistics_for_assets : Types::RunStatisticsForAssets?

        # The timestamp of when the data source run was started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The timestamp of when the data source run was stopped.
        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Time?

        def initialize(
          @created_at : Time,
          @data_source_id : String,
          @domain_id : String,
          @id : String,
          @project_id : String,
          @status : String,
          @type : String,
          @updated_at : Time,
          @data_source_configuration_snapshot : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @run_statistics_for_assets : Types::RunStatisticsForAssets? = nil,
          @started_at : Time? = nil,
          @stopped_at : Time? = nil
        )
        end
      end

      struct StartMetadataGenerationRunInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where you want to start a metadata generation run.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the project that owns the asset for which you want to start a metadata generation run.
        @[JSON::Field(key: "owningProjectIdentifier")]
        getter owning_project_identifier : String

        # The asset for which you want to start a metadata generation run.
        @[JSON::Field(key: "target")]
        getter target : Types::MetadataGenerationRunTarget

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The type of the metadata generation run.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The types of the metadata generation run.
        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @domain_identifier : String,
          @owning_project_identifier : String,
          @target : Types::MetadataGenerationRunTarget,
          @client_token : String? = nil,
          @type : String? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      struct StartMetadataGenerationRunOutput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain in which the metadata generation run was started.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the metadata generation run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The timestamp at which the metadata generation run was started.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the user who started the metadata generation run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ID of the project that owns the asset for which the metadata generation run was started.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String?

        # The status of the metadata generation run.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the metadata generation run.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The types of the metadata generation run.
        @[JSON::Field(key: "types")]
        getter types : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @owning_project_id : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # The details of the asset for which the subscription grant is created.
      struct SubscribedAsset
        include JSON::Serializable

        # The identifier of the asset for which the subscription grant is created.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The revision of the asset for which the subscription grant is created.
        @[JSON::Field(key: "assetRevision")]
        getter asset_revision : String

        # The status of the asset for which the subscription grant is created.
        @[JSON::Field(key: "status")]
        getter status : String

        # The asset scope of the subscribed asset.
        @[JSON::Field(key: "assetScope")]
        getter asset_scope : Types::AssetScope?

        # The failure cause included in the details of the asset for which the subscription grant is created.
        @[JSON::Field(key: "failureCause")]
        getter failure_cause : Types::FailureCause?

        # The failure timestamp included in the details of the asset for which the subscription grant is
        # created.
        @[JSON::Field(key: "failureTimestamp")]
        getter failure_timestamp : Time?

        # The timestamp of when the subscription grant to the asset is created.
        @[JSON::Field(key: "grantedTimestamp")]
        getter granted_timestamp : Time?

        # The asset permissions.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::Permissions?

        # The target name of the asset for which the subscription grant is created.
        @[JSON::Field(key: "targetName")]
        getter target_name : String?

        def initialize(
          @asset_id : String,
          @asset_revision : String,
          @status : String,
          @asset_scope : Types::AssetScope? = nil,
          @failure_cause : Types::FailureCause? = nil,
          @failure_timestamp : Time? = nil,
          @granted_timestamp : Time? = nil,
          @permissions : Types::Permissions? = nil,
          @target_name : String? = nil
        )
        end
      end

      # The details of the published asset for which the subscription grant is created.
      struct SubscribedAssetListing
        include JSON::Serializable

        # The asset scope of the subscribed asset listing.
        @[JSON::Field(key: "assetScope")]
        getter asset_scope : Types::AssetScope?

        # The identifier of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The revision of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        # The type of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "entityType")]
        getter entity_type : String?

        # The forms attached to the published asset for which the subscription grant is created.
        @[JSON::Field(key: "forms")]
        getter forms : String?

        # The glossary terms attached to the published asset for which the subscription grant is created.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The asset permissions.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::Permissions?

        def initialize(
          @asset_scope : Types::AssetScope? = nil,
          @entity_id : String? = nil,
          @entity_revision : String? = nil,
          @entity_type : String? = nil,
          @forms : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @permissions : Types::Permissions? = nil
        )
        end
      end

      # The group that subscribes to the asset.
      struct SubscribedGroup
        include JSON::Serializable

        # The ID of the subscribed group.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the subscribed group.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The details of the subscribed group.
      struct SubscribedGroupInput
        include JSON::Serializable

        # The ID of the subscribed group.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        def initialize(
          @identifier : String? = nil
        )
        end
      end

      # The IAM principal that subscribes to the asset.
      struct SubscribedIamPrincipal
        include JSON::Serializable

        # The ARN of the subscribed IAM principal.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @principal_arn : String? = nil
        )
        end
      end

      # The details of the subscribed IAM principal.
      struct SubscribedIamPrincipalInput
        include JSON::Serializable

        # The ARN of the subscribed IAM principal.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        def initialize(
          @identifier : String? = nil
        )
        end
      end

      # The details of the published asset for which the subscription grant is created.
      struct SubscribedListing
        include JSON::Serializable

        # The description of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "description")]
        getter description : String

        # The identifier of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "id")]
        getter id : String

        # The published asset for which the subscription grant is created.
        @[JSON::Field(key: "item")]
        getter item : Types::SubscribedListingItem

        # The name of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "ownerProjectId")]
        getter owner_project_id : String

        # The name of the project that owns the published asset for which the subscription grant is created.
        @[JSON::Field(key: "ownerProjectName")]
        getter owner_project_name : String?

        # The revision of the published asset for which the subscription grant is created.
        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @description : String,
          @id : String,
          @item : Types::SubscribedListingItem,
          @name : String,
          @owner_project_id : String,
          @owner_project_name : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # The published asset for which the subscription grant is to be created.
      struct SubscribedListingInput
        include JSON::Serializable

        # The identifier of the published asset for which the subscription grant is to be created.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # The published asset for which the subscription grant is created.
      struct SubscribedListingItem
        include JSON::Serializable

        # The asset for which the subscription grant is created.
        @[JSON::Field(key: "assetListing")]
        getter asset_listing : Types::SubscribedAssetListing?

        # The data product listing.
        @[JSON::Field(key: "productListing")]
        getter product_listing : Types::SubscribedProductListing?

        def initialize(
          @asset_listing : Types::SubscribedAssetListing? = nil,
          @product_listing : Types::SubscribedProductListing? = nil
        )
        end
      end

      # The principal that has the subscription grant for the asset.
      struct SubscribedPrincipal
        include JSON::Serializable

        # The subscribed group.
        @[JSON::Field(key: "group")]
        getter group : Types::SubscribedGroup?

        # The subscribed IAM principal.
        @[JSON::Field(key: "iam")]
        getter iam : Types::SubscribedIamPrincipal?

        # The project that has the subscription grant.
        @[JSON::Field(key: "project")]
        getter project : Types::SubscribedProject?

        # The subscribed user.
        @[JSON::Field(key: "user")]
        getter user : Types::SubscribedUser?

        def initialize(
          @group : Types::SubscribedGroup? = nil,
          @iam : Types::SubscribedIamPrincipal? = nil,
          @project : Types::SubscribedProject? = nil,
          @user : Types::SubscribedUser? = nil
        )
        end
      end

      # The principal that is to be given a subscriptiong grant.
      struct SubscribedPrincipalInput
        include JSON::Serializable

        # The subscribed group.
        @[JSON::Field(key: "group")]
        getter group : Types::SubscribedGroupInput?

        # The subscribed IAM principal.
        @[JSON::Field(key: "iam")]
        getter iam : Types::SubscribedIamPrincipalInput?

        # The project that is to be given a subscription grant.
        @[JSON::Field(key: "project")]
        getter project : Types::SubscribedProjectInput?

        # The subscribed user.
        @[JSON::Field(key: "user")]
        getter user : Types::SubscribedUserInput?

        def initialize(
          @group : Types::SubscribedGroupInput? = nil,
          @iam : Types::SubscribedIamPrincipalInput? = nil,
          @project : Types::SubscribedProjectInput? = nil,
          @user : Types::SubscribedUserInput? = nil
        )
        end
      end

      # The data product listing.
      struct SubscribedProductListing
        include JSON::Serializable

        # The data assets of the data product listing.
        @[JSON::Field(key: "assetListings")]
        getter asset_listings : Array(Types::AssetInDataProductListingItem)?

        # The description of the data product listing.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the data product listing.
        @[JSON::Field(key: "entityId")]
        getter entity_id : String?

        # The revision of the data product listing.
        @[JSON::Field(key: "entityRevision")]
        getter entity_revision : String?

        # The glossary terms of the data product listing.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(Types::DetailedGlossaryTerm)?

        # The name of the data product listing.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @asset_listings : Array(Types::AssetInDataProductListingItem)? = nil,
          @description : String? = nil,
          @entity_id : String? = nil,
          @entity_revision : String? = nil,
          @glossary_terms : Array(Types::DetailedGlossaryTerm)? = nil,
          @name : String? = nil
        )
        end
      end

      # The project that has the subscription grant.
      struct SubscribedProject
        include JSON::Serializable

        # The identifier of the project that has the subscription grant.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the project that has the subscription grant.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The project that is to be given a subscription grant.
      struct SubscribedProjectInput
        include JSON::Serializable

        # The identifier of the project that is to be given a subscription grant.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        def initialize(
          @identifier : String? = nil
        )
        end
      end

      # The subscribed user.
      struct SubscribedUser
        include JSON::Serializable

        # The subscribed user details.
        @[JSON::Field(key: "details")]
        getter details : Types::UserProfileDetails?

        # The ID of the subscribed user.
        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @details : Types::UserProfileDetails? = nil,
          @id : String? = nil
        )
        end
      end

      # The subscribed user.
      struct SubscribedUserInput
        include JSON::Serializable

        # The ID of the subscribed user.
        @[JSON::Field(key: "identifier")]
        getter identifier : String?

        def initialize(
          @identifier : String? = nil
        )
        end
      end

      # The details of the subscription grant.
      struct SubscriptionGrantSummary
        include JSON::Serializable

        # The timestamp of when a subscription grant was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The datazone user who created the subscription grant.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription grant exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The entity to which the subscription is granted.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntity

        # The identifier of the subscription grant.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription grant.
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of the target of the subscription grant.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String

        # The timestamp of when the subscription grant was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The assets included in the subscription grant.
        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::SubscribedAsset)?

        # The environment ID of the subscription grant.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The ID of the subscription.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The Amazon DataZone user who updated the subscription grant.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @granted_entity : Types::GrantedEntity,
          @id : String,
          @status : String,
          @subscription_target_id : String,
          @updated_at : Time,
          @assets : Array(Types::SubscribedAsset)? = nil,
          @environment_id : String? = nil,
          @subscription_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of the subscription request.
      struct SubscriptionRequestSummary
        include JSON::Serializable

        # The timestamp of when a subscription request was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription request.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription request exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription request.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reason for the subscription request.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # The listings included in the subscription request.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # The principals included in the subscription request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # The timestamp of when the subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The decision comment of the subscription request.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # The summary of the metadata forms.
        @[JSON::Field(key: "metadataFormsSummary")]
        getter metadata_forms_summary : Array(Types::MetadataFormSummary)?

        # The identifier of the subscription request reviewer.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # The identifier of the Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms_summary : Array(Types::MetadataFormSummary)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of the subscription.
      struct SubscriptionSummary
        include JSON::Serializable

        # The timestamp of when the subscription was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status of the subscription.
        @[JSON::Field(key: "status")]
        getter status : String

        # The listing included in the subscription.
        @[JSON::Field(key: "subscribedListing")]
        getter subscribed_listing : Types::SubscribedListing

        # The principal included in the subscription.
        @[JSON::Field(key: "subscribedPrincipal")]
        getter subscribed_principal : Types::SubscribedPrincipal

        # The timestamp of when the subscription was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The retain permissions included in the subscription.
        @[JSON::Field(key: "retainPermissions")]
        getter retain_permissions : Bool?

        # The identifier of the subscription request for the subscription.
        @[JSON::Field(key: "subscriptionRequestId")]
        getter subscription_request_id : String?

        # The Amazon DataZone user who updated the subscription.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @status : String,
          @subscribed_listing : Types::SubscribedListing,
          @subscribed_principal : Types::SubscribedPrincipal,
          @updated_at : Time,
          @retain_permissions : Bool? = nil,
          @subscription_request_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of the subscription target configuration.
      struct SubscriptionTargetForm
        include JSON::Serializable

        # The content of the subscription target configuration.
        @[JSON::Field(key: "content")]
        getter content : String

        # The form name included in the subscription target configuration.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        def initialize(
          @content : String,
          @form_name : String
        )
        end
      end

      # The details of the subscription target.
      struct SubscriptionTargetSummary
        include JSON::Serializable

        # The asset types included in the subscription target.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)

        # The authorized principals included in the subscription target.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)

        # The timestamp of when the subscription target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription target.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the subscription target exists.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the environment of the subscription target.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The identifier of the subscription target.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the subscription target.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project specified in the subscription target.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider of the subscription target.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The configuration of the subscription target.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)

        # The type of the subscription target.
        @[JSON::Field(key: "type")]
        getter type : String

        # The manage access role specified in the subscription target.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        # The timestamp of when the subscription target was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the subscription target.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @applicable_asset_types : Array(String),
          @authorized_principals : Array(String),
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @subscription_target_config : Array(Types::SubscriptionTargetForm),
          @type : String,
          @manage_access_role : String? = nil,
          @subscription_grant_creation_mode : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be tagged in Amazon DataZone.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specifies the tags for the TagResource action.
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

      # The details of the term relations.
      struct TermRelations
        include JSON::Serializable

        # The classifies of the term relations.
        @[JSON::Field(key: "classifies")]
        getter classifies : Array(String)?

        # The isA property of the term relations.
        @[JSON::Field(key: "isA")]
        getter is_a : Array(String)?

        def initialize(
          @classifies : Array(String)? = nil,
          @is_a : Array(String)? = nil
        )
        end
      end

      # A structure indicating matched terms for an attribute.
      struct TextMatchItem
        include JSON::Serializable

        # The name of the attribute.
        @[JSON::Field(key: "attribute")]
        getter attribute : String?

        # List of offsets indicating matching terms in the TextMatchItem text.
        @[JSON::Field(key: "matchOffsets")]
        getter match_offsets : Array(Types::MatchOffset)?

        # Snippet of attribute text containing highlighted content.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @attribute : String? = nil,
          @match_offsets : Array(Types::MatchOffset)? = nil,
          @text : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The time series data points form.
      struct TimeSeriesDataPointFormInput
        include JSON::Serializable

        # The name of the time series data points form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The timestamp of the time series data points form.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The ID of the type of the time series data points form.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The content of the time series data points form.
        @[JSON::Field(key: "content")]
        getter content : String?

        # The revision type of the time series data points form.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @form_name : String,
          @timestamp : Time,
          @type_identifier : String,
          @content : String? = nil,
          @type_revision : String? = nil
        )
        end
      end

      # The time series data points form.
      struct TimeSeriesDataPointFormOutput
        include JSON::Serializable

        # The name of the time series data points form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The timestamp of the time series data points form.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The ID of the type of the time series data points form.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The content of the time series data points form.
        @[JSON::Field(key: "content")]
        getter content : String?

        # The ID of the time series data points form.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The revision type of the time series data points form.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @form_name : String,
          @timestamp : Time,
          @type_identifier : String,
          @content : String? = nil,
          @id : String? = nil,
          @type_revision : String? = nil
        )
        end
      end

      # The summary of the time series data points form.
      struct TimeSeriesDataPointSummaryFormOutput
        include JSON::Serializable

        # The name of the time series data points summary form.
        @[JSON::Field(key: "formName")]
        getter form_name : String

        # The timestamp of the time series data points summary form.
        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # The type ID of the time series data points summary form.
        @[JSON::Field(key: "typeIdentifier")]
        getter type_identifier : String

        # The content of the summary of the time series data points form.
        @[JSON::Field(key: "contentSummary")]
        getter content_summary : String?

        # The ID of the time series data points summary form.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The type revision of the time series data points summary form.
        @[JSON::Field(key: "typeRevision")]
        getter type_revision : String?

        def initialize(
          @form_name : String,
          @timestamp : Time,
          @type_identifier : String,
          @content_summary : String? = nil,
          @id : String? = nil,
          @type_revision : String? = nil
        )
        end
      end

      # The topic of the notification.
      struct Topic
        include JSON::Serializable

        @[JSON::Field(key: "resource")]
        getter resource : Types::NotificationResource

        # The role of the resource mentioned in a notification.
        @[JSON::Field(key: "role")]
        getter role : String

        # The subject of the resource mentioned in a notification.
        @[JSON::Field(key: "subject")]
        getter subject : String

        def initialize(
          @resource : Types::NotificationResource,
          @role : String,
          @subject : String
        )
        end
      end

      # You do not have permission to perform this action.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The details of the policy of creating an environment.
      struct Unit
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be untagged in Amazon DataZone.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specifies the tag keys for the UntagResource action.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAccountPoolInput
        include JSON::Serializable

        # The domain ID where the account pool that is to be updated lives.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the account pool that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The source of accounts for the account pool. In the current release, it's either a static list of
        # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
        @[JSON::Field(key: "accountSource")]
        getter account_source : Types::AccountSource?

        # The description of the account pool that is to be udpated.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the account pool that is to be updated.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @account_source : Types::AccountSource? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @resolution_strategy : String? = nil
        )
        end
      end

      struct UpdateAccountPoolOutput
        include JSON::Serializable

        # The source of accounts for the account pool. In the current release, it's either a static list of
        # accounts provided by the customer or a custom Amazon Web Services Lambda handler.
        @[JSON::Field(key: "accountSource")]
        getter account_source : Types::AccountSource

        # The user who created the account pool.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The timestamp at which the account pool was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the account pool that is to be udpated.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain ID where the account pool that is to be updated lives.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The domain ID in which the account pool that is to be updated lives.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The ID of the account pool that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The timestamp at which the account pool was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name of the account pool that is to be updated.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The mechanism used to resolve the account selection from the account pool.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        # The user who last updated the account pool.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @account_source : Types::AccountSource,
          @created_by : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_id : String? = nil,
          @domain_unit_id : String? = nil,
          @id : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @resolution_strategy : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct UpdateAssetFilterInput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The ID of the domain where you want to update an asset filter.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the asset filter.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The configuration of the asset filter.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AssetFilterConfiguration?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @asset_identifier : String,
          @domain_identifier : String,
          @identifier : String,
          @configuration : Types::AssetFilterConfiguration? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateAssetFilterOutput
        include JSON::Serializable

        # The ID of the data asset.
        @[JSON::Field(key: "assetId")]
        getter asset_id : String

        # The configuration of the asset filter.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::AssetFilterConfiguration

        # The ID of the domain where the asset filter was created.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the asset filter.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the asset filter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp at which the asset filter was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the asset filter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The column names of the asset filter.
        @[JSON::Field(key: "effectiveColumnNames")]
        getter effective_column_names : Array(String)?

        # The row filter of the asset filter.
        @[JSON::Field(key: "effectiveRowFilter")]
        getter effective_row_filter : String?

        # The error message that is displayed if the action is not completed successfully.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The status of the asset filter.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @asset_id : String,
          @configuration : Types::AssetFilterConfiguration,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @effective_column_names : Array(String)? = nil,
          @effective_row_filter : String? = nil,
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateConnectionInput
        include JSON::Serializable

        # The ID of the domain where a connection is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the connection to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The location where a connection is to be updated.
        @[JSON::Field(key: "awsLocation")]
        getter aws_location : Types::AwsLocation?

        # The description of a connection.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesPatch?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @aws_location : Types::AwsLocation? = nil,
          @description : String? = nil,
          @props : Types::ConnectionPropertiesPatch? = nil
        )
        end
      end

      struct UpdateConnectionOutput
        include JSON::Serializable

        # The ID of the connection.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        # The ID of the domain where a connection is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the domain unit where a connection is to be updated.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String

        # The name of the connection.
        @[JSON::Field(key: "name")]
        getter name : String

        # The physical endpoints of the connection.
        @[JSON::Field(key: "physicalEndpoints")]
        getter physical_endpoints : Array(Types::PhysicalEndpoint)

        # The connection type.
        @[JSON::Field(key: "type")]
        getter type : String

        # The connection description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the environment where a connection is to be updated.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The project ID of the connection.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The connection props.
        @[JSON::Field(key: "props")]
        getter props : Types::ConnectionPropertiesOutput?

        # The scope of the connection.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @connection_id : String,
          @domain_id : String,
          @domain_unit_id : String,
          @name : String,
          @physical_endpoints : Array(Types::PhysicalEndpoint),
          @type : String,
          @description : String? = nil,
          @environment_id : String? = nil,
          @project_id : String? = nil,
          @props : Types::ConnectionPropertiesOutput? = nil,
          @scope : String? = nil
        )
        end
      end

      struct UpdateDataSourceInput
        include JSON::Serializable

        # The identifier of the domain in which to update a data source.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the data source to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The asset forms to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "assetFormsInput")]
        getter asset_forms_input : Array(Types::FormInput)?

        # The configuration to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationInput?

        # The description to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The enable setting to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The name to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The publish on import setting to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # The recommendation to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationConfiguration?

        # Specifies that the granted permissions are retained in case of a self-subscribe functionality
        # failure for a data source.
        @[JSON::Field(key: "retainPermissionsOnRevokeFailure")]
        getter retain_permissions_on_revoke_failure : Bool?

        # The schedule to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @asset_forms_input : Array(Types::FormInput)? = nil,
          @configuration : Types::DataSourceConfigurationInput? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @name : String? = nil,
          @publish_on_import : Bool? = nil,
          @recommendation : Types::RecommendationConfiguration? = nil,
          @retain_permissions_on_revoke_failure : Bool? = nil,
          @schedule : Types::ScheduleConfiguration? = nil
        )
        end
      end

      struct UpdateDataSourceOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a data source is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the data source to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project where data source is to be updated.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The asset forms to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "assetFormsOutput")]
        getter asset_forms_output : Array(Types::FormOutput)?

        # The configuration to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DataSourceConfigurationOutput?

        # The connection ID.
        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The timestamp of when the data source was updated.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The enable setting to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "enableSetting")]
        getter enable_setting : String?

        # The identifier of the environment in which a data source is to be updated.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : Types::DataSourceErrorMessage?

        # The timestamp of when the data source was last run.
        @[JSON::Field(key: "lastRunAt")]
        getter last_run_at : Time?

        # The last run error message of the data source.
        @[JSON::Field(key: "lastRunErrorMessage")]
        getter last_run_error_message : Types::DataSourceErrorMessage?

        # The last run status of the data source.
        @[JSON::Field(key: "lastRunStatus")]
        getter last_run_status : String?

        # The publish on import setting to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "publishOnImport")]
        getter publish_on_import : Bool?

        # The recommendation to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::RecommendationConfiguration?

        # Specifies that the granted permissions are retained in case of a self-subscribe functionality
        # failure for a data source.
        @[JSON::Field(key: "retainPermissionsOnRevokeFailure")]
        getter retain_permissions_on_revoke_failure : Bool?

        # The schedule to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ScheduleConfiguration?

        # Specifies the status of the self-granting functionality.
        @[JSON::Field(key: "selfGrantStatus")]
        getter self_grant_status : Types::SelfGrantStatusOutput?

        # The status to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type to be updated as part of the UpdateDataSource action.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The timestamp of when the data source was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @asset_forms_output : Array(Types::FormOutput)? = nil,
          @configuration : Types::DataSourceConfigurationOutput? = nil,
          @connection_id : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @enable_setting : String? = nil,
          @environment_id : String? = nil,
          @error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_at : Time? = nil,
          @last_run_error_message : Types::DataSourceErrorMessage? = nil,
          @last_run_status : String? = nil,
          @publish_on_import : Bool? = nil,
          @recommendation : Types::RecommendationConfiguration? = nil,
          @retain_permissions_on_revoke_failure : Bool? = nil,
          @schedule : Types::ScheduleConfiguration? = nil,
          @self_grant_status : Types::SelfGrantStatusOutput? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct UpdateDomainInput
        include JSON::Serializable

        # The ID of the Amazon Web Services domain that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain execution role to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "domainExecutionRole")]
        getter domain_execution_role : String?

        # The name to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The service role of the domain.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The single sign-on option to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "singleSignOn")]
        getter single_sign_on : Types::SingleSignOn?

        def initialize(
          @identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @domain_execution_role : String? = nil,
          @name : String? = nil,
          @service_role : String? = nil,
          @single_sign_on : Types::SingleSignOn? = nil
        )
        end
      end

      struct UpdateDomainOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain.
        @[JSON::Field(key: "id")]
        getter id : String

        # The description to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain execution role to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "domainExecutionRole")]
        getter domain_execution_role : String?

        # Specifies the timestamp of when the domain was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The name to be updated as part of the UpdateDomain action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the root domain unit.
        @[JSON::Field(key: "rootDomainUnitId")]
        getter root_domain_unit_id : String?

        # The service role of the domain.
        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The single sign-on option of the Amazon DataZone domain.
        @[JSON::Field(key: "singleSignOn")]
        getter single_sign_on : Types::SingleSignOn?

        def initialize(
          @id : String,
          @description : String? = nil,
          @domain_execution_role : String? = nil,
          @last_updated_at : Time? = nil,
          @name : String? = nil,
          @root_domain_unit_id : String? = nil,
          @service_role : String? = nil,
          @single_sign_on : Types::SingleSignOn? = nil
        )
        end
      end

      struct UpdateDomainUnitInput
        include JSON::Serializable

        # The ID of the domain where you want to update a domain unit.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the domain unit that you want to update.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The description of the domain unit that you want to update.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the domain unit that you want to update.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateDomainUnitOutput
        include JSON::Serializable

        # The ID of the domain where you want to update the domain unit.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the domain unit that you want to update.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the domain unit that you want to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # The owners of the domain unit that you want to update.
        @[JSON::Field(key: "owners")]
        getter owners : Array(Types::DomainUnitOwnerProperties)

        # The time stamp at which the domain unit that you want to update was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user who created the domain unit that you want to update.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The description of the domain unit that you want to update.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The timestamp at which the domain unit was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The user who last updated the domain unit.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The ID of the parent domain unit.
        @[JSON::Field(key: "parentDomainUnitId")]
        getter parent_domain_unit_id : String?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owners : Array(Types::DomainUnitOwnerProperties),
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @last_updated_by : String? = nil,
          @parent_domain_unit_id : String? = nil
        )
        end
      end

      struct UpdateEnvironmentActionInput
        include JSON::Serializable

        # The domain ID of the environment action.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The environment ID of the environment action.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # The ID of the environment action.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The description of the environment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String,
          @description : String? = nil,
          @name : String? = nil,
          @parameters : Types::ActionParameters? = nil
        )
        end
      end

      struct UpdateEnvironmentActionOutput
        include JSON::Serializable

        # The domain ID of the environment action.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The environment ID of the environment action.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The ID of the environment action.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the environment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The parameters of the environment action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Types::ActionParameters

        # The description of the environment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @parameters : Types::ActionParameters,
          @description : String? = nil
        )
        end
      end

      struct UpdateEnvironmentBlueprintInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which an environment blueprint is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment blueprint to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The description to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The provisioning properties to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties?

        # The user parameters to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @description : String? = nil,
          @provisioning_properties : Types::ProvisioningProperties? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct UpdateEnvironmentBlueprintOutput
        include JSON::Serializable

        # The identifier of the blueprint to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The provider of the blueprint to be udpated.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The provisioning properties to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties

        # The timestamp of when the environment blueprint was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The glossary terms to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when the blueprint was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters to be updated as part of the UpdateEnvironmentBlueprint action.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @id : String,
          @name : String,
          @provider : String,
          @provisioning_properties : Types::ProvisioningProperties,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct UpdateEnvironmentInput
        include JSON::Serializable

        # The identifier of the domain in which the environment is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The blueprint version to which the environment should be updated. You can only specify the following
        # string for this parameter: latest .
        @[JSON::Field(key: "blueprintVersion")]
        getter blueprint_version : String?

        # The description to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The glossary terms to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The name to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The user parameters of the environment.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentParameter)?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @blueprint_version : String? = nil,
          @description : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @name : String? = nil,
          @user_parameters : Array(Types::EnvironmentParameter)? = nil
        )
        end
      end

      struct UpdateEnvironmentOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the environment.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the domain in which the environment is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The name to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The project identifier of the environment.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider identifier of the environment.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The identifier of the Amazon Web Services account in which the environment is to be updated.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region in which the environment is updated.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when the environment was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The deployment properties to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "deploymentProperties")]
        getter deployment_properties : Types::DeploymentProperties?

        # The description to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment actions to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "environmentActions")]
        getter environment_actions : Array(Types::ConfigurableEnvironmentAction)?

        # The blueprint identifier of the environment.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String?

        # The configuration ID of the environment.
        @[JSON::Field(key: "environmentConfigurationId")]
        getter environment_configuration_id : String?

        # The profile identifier of the environment.
        @[JSON::Field(key: "environmentProfileId")]
        getter environment_profile_id : String?

        # The glossary terms to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The identifier of the environment that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The last deployment of the environment.
        @[JSON::Field(key: "lastDeployment")]
        getter last_deployment : Types::Deployment?

        # The provisioned resources to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "provisionedResources")]
        getter provisioned_resources : Array(Types::Resource)?

        # The provisioning properties to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "provisioningProperties")]
        getter provisioning_properties : Types::ProvisioningProperties?

        # The status to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp of when the environment was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters to be updated as part of the UpdateEnvironment action.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @deployment_properties : Types::DeploymentProperties? = nil,
          @description : String? = nil,
          @environment_actions : Array(Types::ConfigurableEnvironmentAction)? = nil,
          @environment_blueprint_id : String? = nil,
          @environment_configuration_id : String? = nil,
          @environment_profile_id : String? = nil,
          @glossary_terms : Array(String)? = nil,
          @id : String? = nil,
          @last_deployment : Types::Deployment? = nil,
          @provisioned_resources : Array(Types::Resource)? = nil,
          @provisioning_properties : Types::ProvisioningProperties? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct UpdateEnvironmentProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which an environment profile is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment profile that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The Amazon Web Services account in which a specified environment profile is to be udpated.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region in which a specified environment profile is to be updated.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The description to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The user parameters to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentParameter)?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @user_parameters : Array(Types::EnvironmentParameter)? = nil
        )
        end
      end

      struct UpdateEnvironmentProfileOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the environment profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which the environment profile is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the blueprint of the environment profile that is to be updated.
        @[JSON::Field(key: "environmentBlueprintId")]
        getter environment_blueprint_id : String

        # The identifier of the environment profile that is to be udpated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account in which a specified environment profile is to be udpated.
        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String?

        # The Amazon Web Services Region in which a specified environment profile is to be updated.
        @[JSON::Field(key: "awsAccountRegion")]
        getter aws_account_region : String?

        # The timestamp of when the environment profile was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the project of the environment profile that is to be updated.
        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        # The timestamp of when the environment profile was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user parameters to be updated as part of the UpdateEnvironmentProfile action.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::CustomParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @environment_blueprint_id : String,
          @id : String,
          @name : String,
          @aws_account_id : String? = nil,
          @aws_account_region : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @project_id : String? = nil,
          @updated_at : Time? = nil,
          @user_parameters : Array(Types::CustomParameter)? = nil
        )
        end
      end

      struct UpdateGlossaryInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a business glossary is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the business glossary to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A unique, case-sensitive identifier that is provided to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The name to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateGlossaryOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a business glossary is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the business glossary that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project in which to update a business glossary.
        @[JSON::Field(key: "owningProjectId")]
        getter owning_project_id : String

        # The description to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The status to be updated as part of the UpdateGlossary action.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The usage restriction of the restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @id : String,
          @name : String,
          @owning_project_id : String,
          @description : String? = nil,
          @status : String? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct UpdateGlossaryTermInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a business glossary term is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the business glossary term that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The identifier of the business glossary in which a term is to be updated.
        @[JSON::Field(key: "glossaryIdentifier")]
        getter glossary_identifier : String?

        # The long description to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The name to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The short description to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The status to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The term relations to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @glossary_identifier : String? = nil,
          @long_description : String? = nil,
          @name : String? = nil,
          @short_description : String? = nil,
          @status : String? = nil,
          @term_relations : Types::TermRelations? = nil
        )
        end
      end

      struct UpdateGlossaryTermOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a business glossary term is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the business glossary in which a term is to be updated.
        @[JSON::Field(key: "glossaryId")]
        getter glossary_id : String

        # The identifier of the business glossary term that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The long description to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "longDescription")]
        getter long_description : String?

        # The short description to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "shortDescription")]
        getter short_description : String?

        # The term relations to be updated as part of the UpdateGlossaryTerm action.
        @[JSON::Field(key: "termRelations")]
        getter term_relations : Types::TermRelations?

        # The usage restriction of a term within a restricted glossary.
        @[JSON::Field(key: "usageRestrictions")]
        getter usage_restrictions : Array(String)?

        def initialize(
          @domain_id : String,
          @glossary_id : String,
          @id : String,
          @name : String,
          @status : String,
          @long_description : String? = nil,
          @short_description : String? = nil,
          @term_relations : Types::TermRelations? = nil,
          @usage_restrictions : Array(String)? = nil
        )
        end
      end

      struct UpdateGroupProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a group profile is updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the group profile that is updated.
        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # The status of the group profile that is updated.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @domain_identifier : String,
          @group_identifier : String,
          @status : String
        )
        end
      end

      struct UpdateGroupProfileOutput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a group profile is updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The name of the group profile that is updated.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # The identifier of the group profile that is updated.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the group profile that is updated.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_id : String? = nil,
          @group_name : String? = nil,
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateProjectInput
        include JSON::Serializable

        # The ID of the Amazon DataZone domain where a project is being updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the project that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The description to be updated as part of the UpdateProject action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment deployment details of the project.
        @[JSON::Field(key: "environmentDeploymentDetails")]
        getter environment_deployment_details : Types::EnvironmentDeploymentDetails?

        # The glossary terms to be updated as part of the UpdateProject action.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The name to be updated as part of the UpdateProject action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The project profile version to which the project should be updated. You can only specify the
        # following string for this parameter: latest .
        @[JSON::Field(key: "projectProfileVersion")]
        getter project_profile_version : String?

        # The resource tags of the project.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The user parameters of the project.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentConfigurationUserParameter)?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_deployment_details : Types::EnvironmentDeploymentDetails? = nil,
          @glossary_terms : Array(String)? = nil,
          @name : String? = nil,
          @project_profile_version : String? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
        )
        end
      end

      struct UpdateProjectOutput
        include JSON::Serializable

        # The Amazon DataZone user who created the project.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a project is updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the project that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project that is to be updated.
        @[JSON::Field(key: "name")]
        getter name : String

        # The timestamp of when the project was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the project that is to be updated.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment deployment details of the project.
        @[JSON::Field(key: "environmentDeploymentDetails")]
        getter environment_deployment_details : Types::EnvironmentDeploymentDetails?

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "failureReasons")]
        getter failure_reasons : Array(Types::ProjectDeletionError)?

        # The glossary terms of the project that are to be updated.
        @[JSON::Field(key: "glossaryTerms")]
        getter glossary_terms : Array(String)?

        # The timestamp of when the project was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The ID of the project profile.
        @[JSON::Field(key: "projectProfileId")]
        getter project_profile_id : String?

        # The status of the project.
        @[JSON::Field(key: "projectStatus")]
        getter project_status : String?

        # The resource tags of the project.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        # The user parameters of the project.
        @[JSON::Field(key: "userParameters")]
        getter user_parameters : Array(Types::EnvironmentConfigurationUserParameter)?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_deployment_details : Types::EnvironmentDeploymentDetails? = nil,
          @failure_reasons : Array(Types::ProjectDeletionError)? = nil,
          @glossary_terms : Array(String)? = nil,
          @last_updated_at : Time? = nil,
          @project_profile_id : String? = nil,
          @project_status : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil,
          @user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
        )
        end
      end

      struct UpdateProjectProfileInput
        include JSON::Serializable

        # The ID of the domain where a project profile is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of a project profile that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Specifies whether custom project resource tags are supported.
        @[JSON::Field(key: "allowCustomProjectResourceTags")]
        getter allow_custom_project_resource_tags : Bool?

        # The description of a project profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the domain unit where a project profile is to be updated.
        @[JSON::Field(key: "domainUnitIdentifier")]
        getter domain_unit_identifier : String?

        # The environment configurations of a project profile.
        @[JSON::Field(key: "environmentConfigurations")]
        getter environment_configurations : Array(Types::EnvironmentConfiguration)?

        # The name of a project profile.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The resource tags of the project profile.
        @[JSON::Field(key: "projectResourceTags")]
        getter project_resource_tags : Array(Types::ResourceTagParameter)?

        # Field viewable through the UI that provides a project user with the allowed resource tag
        # specifications.
        @[JSON::Field(key: "projectResourceTagsDescription")]
        getter project_resource_tags_description : String?

        # The status of a project profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @allow_custom_project_resource_tags : Bool? = nil,
          @description : String? = nil,
          @domain_unit_identifier : String? = nil,
          @environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
          @name : String? = nil,
          @project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
          @project_resource_tags_description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateProjectProfileOutput
        include JSON::Serializable

        # The user who created a project profile.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The ID of the domain where project profile is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The ID of the project profile.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the project profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether custom project resource tags are supported.
        @[JSON::Field(key: "allowCustomProjectResourceTags")]
        getter allow_custom_project_resource_tags : Bool?

        # The timestamp at which a project profile is created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of a project profile.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain unit ID of the project profile to be updated.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        # The environment configurations of a project profile.
        @[JSON::Field(key: "environmentConfigurations")]
        getter environment_configurations : Array(Types::EnvironmentConfiguration)?

        # The timestamp at which a project profile was last updated.
        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The resource tags of the project profile.
        @[JSON::Field(key: "projectResourceTags")]
        getter project_resource_tags : Array(Types::ResourceTagParameter)?

        # Field viewable through the UI that provides a project user with the allowed resource tag
        # specifications.
        @[JSON::Field(key: "projectResourceTagsDescription")]
        getter project_resource_tags_description : String?

        # The status of the project profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_by : String,
          @domain_id : String,
          @id : String,
          @name : String,
          @allow_custom_project_resource_tags : Bool? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_unit_id : String? = nil,
          @environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
          @last_updated_at : Time? = nil,
          @project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
          @project_resource_tags_description : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateRootDomainUnitOwnerInput
        include JSON::Serializable

        # The current owner of the root domain unit.
        @[JSON::Field(key: "currentOwner")]
        getter current_owner : String

        # The ID of the domain where the root domain unit owner is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The new owner of the root domain unit.
        @[JSON::Field(key: "newOwner")]
        getter new_owner : String

        # A unique, case-sensitive identifier to ensure idempotency of the request. This field is
        # automatically populated if not provided.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @current_owner : String,
          @domain_identifier : String,
          @new_owner : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateRootDomainUnitOwnerOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRuleInput
        include JSON::Serializable

        # The ID of the domain in which a rule is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The ID of the rule that is to be updated
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The detail of the rule.
        @[JSON::Field(key: "detail")]
        getter detail : Types::RuleDetail?

        # Specifies whether to update this rule in the child domain units.
        @[JSON::Field(key: "includeChildDomainUnits")]
        getter include_child_domain_units : Bool?

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The scrope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope?

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @description : String? = nil,
          @detail : Types::RuleDetail? = nil,
          @include_child_domain_units : Bool? = nil,
          @name : String? = nil,
          @scope : Types::RuleScope? = nil
        )
        end
      end

      struct UpdateRuleOutput
        include JSON::Serializable

        # The action of the rule.
        @[JSON::Field(key: "action")]
        getter action : String

        # The timestamp at which the rule was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the rule.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The detail of the rule.
        @[JSON::Field(key: "detail")]
        getter detail : Types::RuleDetail

        # The ID of the rule.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String

        # The name of the rule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The revision of the rule.
        @[JSON::Field(key: "revision")]
        getter revision : String

        # The type of the rule.
        @[JSON::Field(key: "ruleType")]
        getter rule_type : String

        # The scope of the rule.
        @[JSON::Field(key: "scope")]
        getter scope : Types::RuleScope

        # The target of the rule.
        @[JSON::Field(key: "target")]
        getter target : Types::RuleTarget

        # The timestamp at which the rule was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The description of the rule.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action : String,
          @created_at : Time,
          @created_by : String,
          @detail : Types::RuleDetail,
          @identifier : String,
          @last_updated_by : String,
          @name : String,
          @revision : String,
          @rule_type : String,
          @scope : Types::RuleScope,
          @target : Types::RuleTarget,
          @updated_at : Time,
          @description : String? = nil
        )
        end
      end

      struct UpdateSubscriptionGrantStatusInput
        include JSON::Serializable

        # The identifier of the asset the subscription grant status of which is to be updated.
        @[JSON::Field(key: "assetIdentifier")]
        getter asset_identifier : String

        # The identifier of the Amazon DataZone domain in which a subscription grant status is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the subscription grant the status of which is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The status to be updated as part of the UpdateSubscriptionGrantStatus action.
        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies the error message that is returned if the operation cannot be successfully completed.
        @[JSON::Field(key: "failureCause")]
        getter failure_cause : Types::FailureCause?

        # The target name to be updated as part of the UpdateSubscriptionGrantStatus action.
        @[JSON::Field(key: "targetName")]
        getter target_name : String?

        def initialize(
          @asset_identifier : String,
          @domain_identifier : String,
          @identifier : String,
          @status : String,
          @failure_cause : Types::FailureCause? = nil,
          @target_name : String? = nil
        )
        end
      end

      struct UpdateSubscriptionGrantStatusOutput
        include JSON::Serializable

        # The timestamp of when the subscription grant status was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone domain user who created the subscription grant status.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription grant status is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The granted entity to be updated as part of the UpdateSubscriptionGrantStatus action.
        @[JSON::Field(key: "grantedEntity")]
        getter granted_entity : Types::GrantedEntity

        # The identifier of the subscription grant.
        @[JSON::Field(key: "id")]
        getter id : String

        # The status to be updated as part of the UpdateSubscriptionGrantStatus action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of the subscription target whose subscription grant status is to be updated.
        @[JSON::Field(key: "subscriptionTargetId")]
        getter subscription_target_id : String

        # The timestamp of when the subscription grant status is to be updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The details of the asset for which the subscription grant is created.
        @[JSON::Field(key: "assets")]
        getter assets : Array(Types::SubscribedAsset)?

        # The ID of the environment in which the subscription grant is updated.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The identifier of the subscription.
        @[JSON::Field(key: "subscriptionId")]
        getter subscription_id : String?

        # The Amazon DataZone user who updated the subscription grant status.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @granted_entity : Types::GrantedEntity,
          @id : String,
          @status : String,
          @subscription_target_id : String,
          @updated_at : Time,
          @assets : Array(Types::SubscribedAsset)? = nil,
          @environment_id : String? = nil,
          @subscription_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct UpdateSubscriptionRequestInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a subscription request is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the subscription request that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The reason for the UpdateSubscriptionRequest action.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        def initialize(
          @domain_identifier : String,
          @identifier : String,
          @request_reason : String
        )
        end
      end

      struct UpdateSubscriptionRequestOutput
        include JSON::Serializable

        # The timestamp of when the subscription request was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription request.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription request is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the subscription request that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The reason for the UpdateSubscriptionRequest action.
        @[JSON::Field(key: "requestReason")]
        getter request_reason : String

        # The status of the subscription request.
        @[JSON::Field(key: "status")]
        getter status : String

        # The subscribed listings of the subscription request.
        @[JSON::Field(key: "subscribedListings")]
        getter subscribed_listings : Array(Types::SubscribedListing)

        # The subscribed principals of the subscription request.
        @[JSON::Field(key: "subscribedPrincipals")]
        getter subscribed_principals : Array(Types::SubscribedPrincipal)

        # The timestamp of when the subscription request was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The decision comment of the UpdateSubscriptionRequest action.
        @[JSON::Field(key: "decisionComment")]
        getter decision_comment : String?

        # The ID of the existing subscription.
        @[JSON::Field(key: "existingSubscriptionId")]
        getter existing_subscription_id : String?

        # Metadata forms included in the subscription request.
        @[JSON::Field(key: "metadataForms")]
        getter metadata_forms : Array(Types::FormOutput)?

        # The identifier of the Amazon DataZone user who reviews the subscription request.
        @[JSON::Field(key: "reviewerId")]
        getter reviewer_id : String?

        # The Amazon DataZone user who updated the subscription request.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @id : String,
          @request_reason : String,
          @status : String,
          @subscribed_listings : Array(Types::SubscribedListing),
          @subscribed_principals : Array(Types::SubscribedPrincipal),
          @updated_at : Time,
          @decision_comment : String? = nil,
          @existing_subscription_id : String? = nil,
          @metadata_forms : Array(Types::FormOutput)? = nil,
          @reviewer_id : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct UpdateSubscriptionTargetInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a subscription target is to be updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The identifier of the environment in which a subscription target is to be updated.
        @[JSON::Field(key: "environmentIdentifier")]
        getter environment_identifier : String

        # Identifier of the subscription target that is to be updated.
        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # The applicable asset types to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)?

        # The authorized principals to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)?

        # The manage access role to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String?

        # The name to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The provider to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "provider")]
        getter provider : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        # The configuration to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)?

        def initialize(
          @domain_identifier : String,
          @environment_identifier : String,
          @identifier : String,
          @applicable_asset_types : Array(String)? = nil,
          @authorized_principals : Array(String)? = nil,
          @manage_access_role : String? = nil,
          @name : String? = nil,
          @provider : String? = nil,
          @subscription_grant_creation_mode : String? = nil,
          @subscription_target_config : Array(Types::SubscriptionTargetForm)? = nil
        )
        end
      end

      struct UpdateSubscriptionTargetOutput
        include JSON::Serializable

        # The applicable asset types to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "applicableAssetTypes")]
        getter applicable_asset_types : Array(String)

        # The authorized principals to be updated as part of the UpdateSubscriptionTarget action. Updates are
        # supported in batches of 5 at a time.
        @[JSON::Field(key: "authorizedPrincipals")]
        getter authorized_principals : Array(String)

        # The timestamp of when a subscription target was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon DataZone user who created the subscription target.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The identifier of the Amazon DataZone domain in which a subscription target is to be updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String

        # The identifier of the environment in which a subscription target is to be updated.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # Identifier of the subscription target that is to be updated.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the project in which a subscription target is to be updated.
        @[JSON::Field(key: "projectId")]
        getter project_id : String

        # The provider to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "provider")]
        getter provider : String

        # The configuration to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "subscriptionTargetConfig")]
        getter subscription_target_config : Array(Types::SubscriptionTargetForm)

        # The type to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "type")]
        getter type : String

        # The manage access role to be updated as part of the UpdateSubscriptionTarget action.
        @[JSON::Field(key: "manageAccessRole")]
        getter manage_access_role : String?

        # Determines the subscription grant creation mode for this target, defining if grants are auto-created
        # upon subscription approval or managed manually.
        @[JSON::Field(key: "subscriptionGrantCreationMode")]
        getter subscription_grant_creation_mode : String?

        # The timestamp of when the subscription target was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The Amazon DataZone user who updated the subscription target.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @applicable_asset_types : Array(String),
          @authorized_principals : Array(String),
          @created_at : Time,
          @created_by : String,
          @domain_id : String,
          @environment_id : String,
          @id : String,
          @name : String,
          @project_id : String,
          @provider : String,
          @subscription_target_config : Array(Types::SubscriptionTargetForm),
          @type : String,
          @manage_access_role : String? = nil,
          @subscription_grant_creation_mode : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct UpdateUserProfileInput
        include JSON::Serializable

        # The identifier of the Amazon DataZone domain in which a user profile is updated.
        @[JSON::Field(key: "domainIdentifier")]
        getter domain_identifier : String

        # The status of the user profile that are to be updated.
        @[JSON::Field(key: "status")]
        getter status : String

        # The identifier of the user whose user profile is to be updated.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String

        # The type of the user profile that are to be updated.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @domain_identifier : String,
          @status : String,
          @user_identifier : String,
          @type : String? = nil
        )
        end
      end

      struct UpdateUserProfileOutput
        include JSON::Serializable

        # The results of the UpdateUserProfile action.
        @[JSON::Field(key: "details")]
        getter details : Types::UserProfileDetails?

        # The identifier of the Amazon DataZone domain in which a user profile is updated.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The identifier of the user profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the user profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the user profile.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Types::UserProfileDetails? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies the domain unit(s) whose projects can use this asset type while creating asset or asset
      # revisions.
      struct UseAssetTypePolicyGrantDetail
        include JSON::Serializable

        # The ID of the domain unit.
        @[JSON::Field(key: "domainUnitId")]
        getter domain_unit_id : String?

        def initialize(
          @domain_unit_id : String? = nil
        )
        end
      end

      # The user details of a project member.
      struct UserDetails
        include JSON::Serializable

        # The identifier of the Amazon DataZone user.
        @[JSON::Field(key: "userId")]
        getter user_id : String

        def initialize(
          @user_id : String
        )
        end
      end

      # The user policy grant principal.
      struct UserPolicyGrantPrincipal
        include JSON::Serializable

        # The all users grant filter of the user policy grant principal.
        @[JSON::Field(key: "allUsersGrantFilter")]
        getter all_users_grant_filter : Types::AllUsersGrantFilter?

        # The user ID of the user policy grant principal.
        @[JSON::Field(key: "userIdentifier")]
        getter user_identifier : String?

        def initialize(
          @all_users_grant_filter : Types::AllUsersGrantFilter? = nil,
          @user_identifier : String? = nil
        )
        end
      end

      # The user profile details.
      struct UserProfileDetails
        include JSON::Serializable

        # The IAM details of the user profile.
        @[JSON::Field(key: "iam")]
        getter iam : Types::IamUserProfileDetails?

        # The SSO details of the user profile.
        @[JSON::Field(key: "sso")]
        getter sso : Types::SsoUserProfileDetails?

        def initialize(
          @iam : Types::IamUserProfileDetails? = nil,
          @sso : Types::SsoUserProfileDetails? = nil
        )
        end
      end

      # The details of the user profile.
      struct UserProfileSummary
        include JSON::Serializable

        # The details of the user profile.
        @[JSON::Field(key: "details")]
        getter details : Types::UserProfileDetails?

        # The ID of the Amazon DataZone domain of the user profile.
        @[JSON::Field(key: "domainId")]
        getter domain_id : String?

        # The ID of the user profile.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the user profile.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the user profile.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Types::UserProfileDetails? = nil,
          @domain_id : String? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The username and password of a connection.
      struct UsernamePassword
        include JSON::Serializable

        # The password of a connection.
        @[JSON::Field(key: "password")]
        getter password : String

        # The username of a connection.
        @[JSON::Field(key: "username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by the Amazon Web Services service.
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
