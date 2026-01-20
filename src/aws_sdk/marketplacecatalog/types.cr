require "json"

module AwsSdk
  module MarketplaceCatalog
    module Types

      # Access is denied. HTTP status code: 403

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Object that allows filtering on entity id of an AMI product.

      struct AmiProductEntityIdFilter
        include JSON::Serializable

        # A string array of unique entity id values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for AMI products. Client can add only one wildcard filter
      # and a maximum of 8 filters in a single ListEntities request.

      struct AmiProductFilters
        include JSON::Serializable

        # Unique identifier for the AMI product.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::AmiProductEntityIdFilter?

        # The last date on which the AMI product was modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::AmiProductLastModifiedDateFilter?

        # The title of the AMI product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : Types::AmiProductTitleFilter?

        # The visibility of the AMI product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : Types::AmiProductVisibilityFilter?

        def initialize(
          @entity_id : Types::AmiProductEntityIdFilter? = nil,
          @last_modified_date : Types::AmiProductLastModifiedDateFilter? = nil,
          @product_title : Types::AmiProductTitleFilter? = nil,
          @visibility : Types::AmiProductVisibilityFilter? = nil
        )
        end
      end

      # Object that allows filtering based on the last modified date of AMI products.

      struct AmiProductLastModifiedDateFilter
        include JSON::Serializable

        # Dates between which the AMI product was last modified.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::AmiProductLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::AmiProductLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Object that contains date range of the last modified date to be filtered on. You can optionally
      # provide a BeforeValue and/or AfterValue . Both are inclusive.

      struct AmiProductLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Date after which the AMI product was last modified.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Date before which the AMI product was last modified.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Objects that allows sorting on AMI products based on certain fields and sorting order.

      struct AmiProductSort
        include JSON::Serializable

        # Field to sort the AMI products by.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order. Can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Object that contains summarized information about an AMI product.

      struct AmiProductSummary
        include JSON::Serializable

        # The title of the AMI product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The lifecycle of the AMI product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @product_title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Object that allows filtering on product title.

      struct AmiProductTitleFilter
        include JSON::Serializable

        # A string array of unique product title values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # A string that will be the wildCard input for product tile filter. It matches the provided value as a
        # substring in the actual value.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Object that allows filtering on the visibility of the product in the AWS Marketplace.

      struct AmiProductVisibilityFilter
        include JSON::Serializable

        # A string array of unique visibility values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end


      struct BatchDescribeEntitiesRequest
        include JSON::Serializable

        # List of entity IDs and the catalogs the entities are present in.

        @[JSON::Field(key: "EntityRequestList")]
        getter entity_request_list : Array(Types::EntityRequest)

        def initialize(
          @entity_request_list : Array(Types::EntityRequest)
        )
        end
      end


      struct BatchDescribeEntitiesResponse
        include JSON::Serializable

        # Details about each entity.

        @[JSON::Field(key: "EntityDetails")]
        getter entity_details : Hash(String, Types::EntityDetail)?

        # A map of errors returned, with EntityId as the key and errorDetail as the value.

        @[JSON::Field(key: "Errors")]
        getter errors : Hash(String, Types::BatchDescribeErrorDetail)?

        def initialize(
          @entity_details : Hash(String, Types::EntityDetail)? = nil,
          @errors : Hash(String, Types::BatchDescribeErrorDetail)? = nil
        )
        end
      end

      # An object that contains an error code and error message.

      struct BatchDescribeErrorDetail
        include JSON::Serializable

        # The error code returned.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message returned.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct CancelChangeSetRequest
        include JSON::Serializable

        # Required. The catalog related to the request. Fixed value: AWSMarketplace .

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Required. The unique identifier of the StartChangeSet request that you want to cancel.

        @[JSON::Field(key: "changeSetId")]
        getter change_set_id : String

        def initialize(
          @catalog : String,
          @change_set_id : String
        )
        end
      end


      struct CancelChangeSetResponse
        include JSON::Serializable

        # The ARN associated with the change set referenced in this request.

        @[JSON::Field(key: "ChangeSetArn")]
        getter change_set_arn : String?

        # The unique identifier for the change set referenced in this request.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        def initialize(
          @change_set_arn : String? = nil,
          @change_set_id : String? = nil
        )
        end
      end

      # An object that contains the ChangeType , Details , and Entity .

      struct Change
        include JSON::Serializable

        # Change types are single string values that describe your intention for the change. Each change type
        # is unique for each EntityType provided in the change's scope. For more information about change
        # types available for single-AMI products, see Working with single-AMI products . Also, for more
        # information about change types available for container-based products, see Working with container
        # products .

        @[JSON::Field(key: "ChangeType")]
        getter change_type : String

        # The entity to be changed.

        @[JSON::Field(key: "Entity")]
        getter entity : Types::Entity

        # Optional name for the change.

        @[JSON::Field(key: "ChangeName")]
        getter change_name : String?

        # This object contains details specific to the change type of the requested change. For more
        # information about change types available for single-AMI products, see Working with single-AMI
        # products . Also, for more information about change types available for container-based products, see
        # Working with container products .

        @[JSON::Field(key: "Details")]
        getter details : String?

        # Alternative field that accepts a JSON value instead of a string for ChangeType details. You can use
        # either Details or DetailsDocument , but not both. To download the "DetailsDocument" shapes, see the
        # Python and Java shapes on GitHub.

        @[JSON::Field(key: "DetailsDocument")]
        getter details_document : Types::JsonDocumentType?

        # The tags associated with the change.

        @[JSON::Field(key: "EntityTags")]
        getter entity_tags : Array(Types::Tag)?

        def initialize(
          @change_type : String,
          @entity : Types::Entity,
          @change_name : String? = nil,
          @details : String? = nil,
          @details_document : Types::JsonDocumentType? = nil,
          @entity_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A summary of a change set returned in a list of change sets when the ListChangeSets action is
      # called.

      struct ChangeSetSummaryListItem
        include JSON::Serializable

        # The ARN associated with the unique identifier for the change set referenced in this request.

        @[JSON::Field(key: "ChangeSetArn")]
        getter change_set_arn : String?

        # The unique identifier for a change set.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # The non-unique name for the change set.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was finished.

        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # This object is a list of entity IDs (string) that are a part of a change set. The entity ID list is
        # a maximum of 20 entities. It must contain at least one entity.

        @[JSON::Field(key: "EntityIdList")]
        getter entity_id_list : Array(String)?

        # Returned if the change set is in FAILED status. Can be either CLIENT_ERROR , which means that there
        # are issues with the request (see the ErrorDetailList of DescribeChangeSet ), or SERVER_FAULT , which
        # means that there is a problem in the system, and you should retry your request.

        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # The time, in ISO 8601 format (2018-02-27T13:45:22Z), when the change set was started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        # The current status of the change set.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @change_set_arn : String? = nil,
          @change_set_id : String? = nil,
          @change_set_name : String? = nil,
          @end_time : String? = nil,
          @entity_id_list : Array(String)? = nil,
          @failure_code : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end

      # This object is a container for common summary information about the change. The summary doesn't
      # contain the whole change structure.

      struct ChangeSummary
        include JSON::Serializable

        # Optional name for the change.

        @[JSON::Field(key: "ChangeName")]
        getter change_name : String?

        # The type of the change.

        @[JSON::Field(key: "ChangeType")]
        getter change_type : String?

        # This object contains details specific to the change type of the requested change.

        @[JSON::Field(key: "Details")]
        getter details : String?

        # The JSON value of the details specific to the change type of the requested change. To download the
        # "DetailsDocument" shapes, see the Python and Java shapes on GitHub.

        @[JSON::Field(key: "DetailsDocument")]
        getter details_document : Types::JsonDocumentType?

        # The entity to be changed.

        @[JSON::Field(key: "Entity")]
        getter entity : Types::Entity?

        # An array of ErrorDetail objects associated with the change.

        @[JSON::Field(key: "ErrorDetailList")]
        getter error_detail_list : Array(Types::ErrorDetail)?

        def initialize(
          @change_name : String? = nil,
          @change_type : String? = nil,
          @details : String? = nil,
          @details_document : Types::JsonDocumentType? = nil,
          @entity : Types::Entity? = nil,
          @error_detail_list : Array(Types::ErrorDetail)? = nil
        )
        end
      end

      # Object that allows filtering on entity id of a container product.

      struct ContainerProductEntityIdFilter
        include JSON::Serializable

        # A string array of unique entity id values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for container products. Client can add only one wildcard
      # filter and a maximum of 8 filters in a single ListEntities request.

      struct ContainerProductFilters
        include JSON::Serializable

        # Unique identifier for the container product.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::ContainerProductEntityIdFilter?

        # The last date on which the container product was modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::ContainerProductLastModifiedDateFilter?

        # The title of the container product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : Types::ContainerProductTitleFilter?

        # The visibility of the container product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : Types::ContainerProductVisibilityFilter?

        def initialize(
          @entity_id : Types::ContainerProductEntityIdFilter? = nil,
          @last_modified_date : Types::ContainerProductLastModifiedDateFilter? = nil,
          @product_title : Types::ContainerProductTitleFilter? = nil,
          @visibility : Types::ContainerProductVisibilityFilter? = nil
        )
        end
      end

      # Object that allows filtering based on the last modified date of container products.

      struct ContainerProductLastModifiedDateFilter
        include JSON::Serializable

        # Dates between which the container product was last modified.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::ContainerProductLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::ContainerProductLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Object that contains date range of the last modified date to be filtered on. You can optionally
      # provide a BeforeValue and/or AfterValue . Both are inclusive.

      struct ContainerProductLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Date after which the container product was last modified.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Date before which the container product was last modified.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Objects that allows sorting on container products based on certain fields and sorting order.

      struct ContainerProductSort
        include JSON::Serializable

        # Field to sort the container products by.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order. Can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Object that contains summarized information about a container product.

      struct ContainerProductSummary
        include JSON::Serializable

        # The title of the container product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The lifecycle of the product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @product_title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Object that allows filtering on product title.

      struct ContainerProductTitleFilter
        include JSON::Serializable

        # A string array of unique product title values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # A string that will be the wildCard input for product tile filter. It matches the provided value as a
        # substring in the actual value.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Object that allows filtering on the visibility of the product in the AWS Marketplace.

      struct ContainerProductVisibilityFilter
        include JSON::Serializable

        # A string array of unique visibility values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object that allows filtering on entity id of a data product.

      struct DataProductEntityIdFilter
        include JSON::Serializable

        # A string array of unique entity id values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for data products. Client can add only one wildcard filter
      # and a maximum of 8 filters in a single ListEntities request.

      struct DataProductFilters
        include JSON::Serializable

        # Unique identifier for the data product.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::DataProductEntityIdFilter?

        # The last date on which the data product was modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::DataProductLastModifiedDateFilter?

        # The title of the data product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : Types::DataProductTitleFilter?

        # The visibility of the data product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : Types::DataProductVisibilityFilter?

        def initialize(
          @entity_id : Types::DataProductEntityIdFilter? = nil,
          @last_modified_date : Types::DataProductLastModifiedDateFilter? = nil,
          @product_title : Types::DataProductTitleFilter? = nil,
          @visibility : Types::DataProductVisibilityFilter? = nil
        )
        end
      end

      # Object that allows filtering based on the last modified date of data products.

      struct DataProductLastModifiedDateFilter
        include JSON::Serializable

        # Dates between which the data product was last modified.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::DataProductLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::DataProductLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Object that contains date range of the last modified date to be filtered on. You can optionally
      # provide a BeforeValue and/or AfterValue . Both are inclusive.

      struct DataProductLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Date after which the data product was last modified.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Date before which the data product was last modified.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Objects that allows sorting on data products based on certain fields and sorting order.

      struct DataProductSort
        include JSON::Serializable

        # Field to sort the data products by.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order. Can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Object that contains summarized information about a data product.

      struct DataProductSummary
        include JSON::Serializable

        # The title of the data product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The lifecycle of the data product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @product_title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Object that allows filtering on product title.

      struct DataProductTitleFilter
        include JSON::Serializable

        # A string array of unique product title values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # A string that will be the wildCard input for product tile filter. It matches the provided value as a
        # substring in the actual value.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Object that allows filtering on the visibility of the product in the AWS Marketplace.

      struct DataProductVisibilityFilter
        include JSON::Serializable

        # A string array of unique visibility values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity resource that is associated with the resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeChangeSetRequest
        include JSON::Serializable

        # Required. The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Required. The unique identifier for the StartChangeSet request that you want to describe the details
        # for.

        @[JSON::Field(key: "changeSetId")]
        getter change_set_id : String

        def initialize(
          @catalog : String,
          @change_set_id : String
        )
        end
      end


      struct DescribeChangeSetResponse
        include JSON::Serializable

        # An array of ChangeSummary objects.

        @[JSON::Field(key: "ChangeSet")]
        getter change_set : Array(Types::ChangeSummary)?

        # The ARN associated with the unique identifier for the change set referenced in this request.

        @[JSON::Field(key: "ChangeSetArn")]
        getter change_set_arn : String?

        # Required. The unique identifier for the change set referenced in this request.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        # The optional name provided in the StartChangeSet request. If you do not provide a name, one is set
        # by default.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request transitioned to a terminal
        # state. The change cannot transition to a different state. Null if the request is not in a terminal
        # state.

        @[JSON::Field(key: "EndTime")]
        getter end_time : String?

        # Returned if the change set is in FAILED status. Can be either CLIENT_ERROR , which means that there
        # are issues with the request (see the ErrorDetailList ), or SERVER_FAULT , which means that there is
        # a problem in the system, and you should retry your request.

        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # Returned if there is a failure on the change set, but that failure is not related to any of the
        # changes in the request.

        @[JSON::Field(key: "FailureDescription")]
        getter failure_description : String?

        # The optional intent provided in the StartChangeSet request. If you do not provide an intent, APPLY
        # is set by default.

        @[JSON::Field(key: "Intent")]
        getter intent : String?

        # The date and time, in ISO 8601 format (2018-02-27T13:45:22Z), the request started.

        @[JSON::Field(key: "StartTime")]
        getter start_time : String?

        # The status of the change request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @change_set : Array(Types::ChangeSummary)? = nil,
          @change_set_arn : String? = nil,
          @change_set_id : String? = nil,
          @change_set_name : String? = nil,
          @end_time : String? = nil,
          @failure_code : String? = nil,
          @failure_description : String? = nil,
          @intent : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeEntityRequest
        include JSON::Serializable

        # Required. The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # Required. The unique ID of the entity to describe.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        def initialize(
          @catalog : String,
          @entity_id : String
        )
        end
      end


      struct DescribeEntityResponse
        include JSON::Serializable

        # This stringified JSON object includes the details of the entity.

        @[JSON::Field(key: "Details")]
        getter details : String?

        # The JSON value of the details specific to the entity. To download "DetailsDocument" shapes, see the
        # Python and Java shapes on GitHub.

        @[JSON::Field(key: "DetailsDocument")]
        getter details_document : Types::JsonDocumentType?

        # The ARN associated to the unique identifier for the entity referenced in this request.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String?

        # The identifier of the entity, in the format of EntityId@RevisionId .

        @[JSON::Field(key: "EntityIdentifier")]
        getter entity_identifier : String?

        # The named type of the entity, in the format of EntityType@Version .

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        # The last modified date of the entity, in ISO 8601 format (2018-02-27T13:45:22Z).

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        def initialize(
          @details : String? = nil,
          @details_document : Types::JsonDocumentType? = nil,
          @entity_arn : String? = nil,
          @entity_identifier : String? = nil,
          @entity_type : String? = nil,
          @last_modified_date : String? = nil
        )
        end
      end

      # An entity contains data that describes your product, its supported features, and how it can be used
      # or launched by your customer.

      struct Entity
        include JSON::Serializable

        # The type of entity.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The identifier for the entity.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String?

        def initialize(
          @type : String,
          @identifier : String? = nil
        )
        end
      end

      # An object that contains metadata and details about the entity.

      struct EntityDetail
        include JSON::Serializable

        # An object that contains all the details of the entity.

        @[JSON::Field(key: "DetailsDocument")]
        getter details_document : Types::JsonDocumentType?

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String?

        # The ID of the entity, in the format of EntityId@RevisionId .

        @[JSON::Field(key: "EntityIdentifier")]
        getter entity_identifier : String?

        # The entity type of the entity, in the format of EntityType@Version .

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        # The last time the entity was modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?

        def initialize(
          @details_document : Types::JsonDocumentType? = nil,
          @entity_arn : String? = nil,
          @entity_identifier : String? = nil,
          @entity_type : String? = nil,
          @last_modified_date : String? = nil
        )
        end
      end

      # An object that contains entity ID and the catalog in which the entity is present.

      struct EntityRequest
        include JSON::Serializable

        # The name of the catalog the entity is present in. The only value at this time is AWSMarketplace .

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The ID of the entity.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        def initialize(
          @catalog : String,
          @entity_id : String
        )
        end
      end

      # This object is a container for common summary information about the entity. The summary doesn't
      # contain the whole entity structure, but it does contain information common across all entities.

      struct EntitySummary
        include JSON::Serializable

        # An object that contains summary information about the AMI product.

        @[JSON::Field(key: "AmiProductSummary")]
        getter ami_product_summary : Types::AmiProductSummary?

        # An object that contains summary information about the container product.

        @[JSON::Field(key: "ContainerProductSummary")]
        getter container_product_summary : Types::ContainerProductSummary?

        # An object that contains summary information about the data product.

        @[JSON::Field(key: "DataProductSummary")]
        getter data_product_summary : Types::DataProductSummary?

        # The ARN associated with the unique identifier for the entity.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String?

        # The unique identifier for the entity.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The type of the entity.

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        # The last time the entity was published, using ISO 8601 format (2018-02-27T13:45:22Z).

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : String?


        @[JSON::Field(key: "MachineLearningProductSummary")]
        getter machine_learning_product_summary : Types::MachineLearningProductSummary?

        # The name for the entity. This value is not unique. It is defined by the seller.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An object that contains summary information about the offer set.

        @[JSON::Field(key: "OfferSetSummary")]
        getter offer_set_summary : Types::OfferSetSummary?

        # An object that contains summary information about the offer.

        @[JSON::Field(key: "OfferSummary")]
        getter offer_summary : Types::OfferSummary?

        # An object that contains summary information about the Resale Authorization.

        @[JSON::Field(key: "ResaleAuthorizationSummary")]
        getter resale_authorization_summary : Types::ResaleAuthorizationSummary?

        # An object that contains summary information about the SaaS product.

        @[JSON::Field(key: "SaaSProductSummary")]
        getter saa_s_product_summary : Types::SaaSProductSummary?

        # The visibility status of the entity to buyers. This value can be Public (everyone can view the
        # entity), Limited (the entity is visible to limited accounts only), or Restricted (the entity was
        # published and then unpublished and only existing buyers can view it).

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @ami_product_summary : Types::AmiProductSummary? = nil,
          @container_product_summary : Types::ContainerProductSummary? = nil,
          @data_product_summary : Types::DataProductSummary? = nil,
          @entity_arn : String? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil,
          @last_modified_date : String? = nil,
          @machine_learning_product_summary : Types::MachineLearningProductSummary? = nil,
          @name : String? = nil,
          @offer_set_summary : Types::OfferSetSummary? = nil,
          @offer_summary : Types::OfferSummary? = nil,
          @resale_authorization_summary : Types::ResaleAuthorizationSummary? = nil,
          @saa_s_product_summary : Types::SaaSProductSummary? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Object containing all the filter fields per entity type.

      struct EntityTypeFilters
        include JSON::Serializable

        # A filter for AMI products.

        @[JSON::Field(key: "AmiProductFilters")]
        getter ami_product_filters : Types::AmiProductFilters?

        # A filter for container products.

        @[JSON::Field(key: "ContainerProductFilters")]
        getter container_product_filters : Types::ContainerProductFilters?

        # A filter for data products.

        @[JSON::Field(key: "DataProductFilters")]
        getter data_product_filters : Types::DataProductFilters?


        @[JSON::Field(key: "MachineLearningProductFilters")]
        getter machine_learning_product_filters : Types::MachineLearningProductFilters?

        # A filter for offers.

        @[JSON::Field(key: "OfferFilters")]
        getter offer_filters : Types::OfferFilters?

        # A filter for offer sets.

        @[JSON::Field(key: "OfferSetFilters")]
        getter offer_set_filters : Types::OfferSetFilters?

        # A filter for Resale Authorizations.

        @[JSON::Field(key: "ResaleAuthorizationFilters")]
        getter resale_authorization_filters : Types::ResaleAuthorizationFilters?

        # A filter for SaaS products.

        @[JSON::Field(key: "SaaSProductFilters")]
        getter saa_s_product_filters : Types::SaaSProductFilters?

        def initialize(
          @ami_product_filters : Types::AmiProductFilters? = nil,
          @container_product_filters : Types::ContainerProductFilters? = nil,
          @data_product_filters : Types::DataProductFilters? = nil,
          @machine_learning_product_filters : Types::MachineLearningProductFilters? = nil,
          @offer_filters : Types::OfferFilters? = nil,
          @offer_set_filters : Types::OfferSetFilters? = nil,
          @resale_authorization_filters : Types::ResaleAuthorizationFilters? = nil,
          @saa_s_product_filters : Types::SaaSProductFilters? = nil
        )
        end
      end

      # Object containing all the sort fields per entity type.

      struct EntityTypeSort
        include JSON::Serializable

        # A sort for AMI products.

        @[JSON::Field(key: "AmiProductSort")]
        getter ami_product_sort : Types::AmiProductSort?

        # A sort for container products.

        @[JSON::Field(key: "ContainerProductSort")]
        getter container_product_sort : Types::ContainerProductSort?

        # A sort for data products.

        @[JSON::Field(key: "DataProductSort")]
        getter data_product_sort : Types::DataProductSort?


        @[JSON::Field(key: "MachineLearningProductSort")]
        getter machine_learning_product_sort : Types::MachineLearningProductSort?

        # A sort for offer sets.

        @[JSON::Field(key: "OfferSetSort")]
        getter offer_set_sort : Types::OfferSetSort?

        # A sort for offers.

        @[JSON::Field(key: "OfferSort")]
        getter offer_sort : Types::OfferSort?

        # A sort for Resale Authorizations.

        @[JSON::Field(key: "ResaleAuthorizationSort")]
        getter resale_authorization_sort : Types::ResaleAuthorizationSort?

        # A sort for SaaS products.

        @[JSON::Field(key: "SaaSProductSort")]
        getter saa_s_product_sort : Types::SaaSProductSort?

        def initialize(
          @ami_product_sort : Types::AmiProductSort? = nil,
          @container_product_sort : Types::ContainerProductSort? = nil,
          @data_product_sort : Types::DataProductSort? = nil,
          @machine_learning_product_sort : Types::MachineLearningProductSort? = nil,
          @offer_set_sort : Types::OfferSetSort? = nil,
          @offer_sort : Types::OfferSort? = nil,
          @resale_authorization_sort : Types::ResaleAuthorizationSort? = nil,
          @saa_s_product_sort : Types::SaaSProductSort? = nil
        )
        end
      end

      # Details about the error.

      struct ErrorDetail
        include JSON::Serializable

        # The error code that identifies the type of error.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The message for the error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # A filter object, used to optionally filter results from calls to the ListEntities and ListChangeSets
      # actions.

      struct Filter
        include JSON::Serializable

        # For ListEntities , the supported value for this is an EntityId . For ListChangeSets , the supported
        # values are as follows:

        @[JSON::Field(key: "Name")]
        getter name : String?

        # ListEntities - This is a list of unique EntityId s. ListChangeSets - The supported filter names and
        # associated ValueList s is as follows: ChangeSetName - The supported ValueList is a list of
        # non-unique ChangeSetName s. These are defined when you call the StartChangeSet action. Status - The
        # supported ValueList is a list of statuses for all change set requests. EntityId - The supported
        # ValueList is a list of unique EntityId s. BeforeStartTime - The supported ValueList is a list of all
        # change sets that started before the filter value. AfterStartTime - The supported ValueList is a list
        # of all change sets that started after the filter value. BeforeEndTime - The supported ValueList is a
        # list of all change sets that ended before the filter value. AfterEndTime - The supported ValueList
        # is a list of all change sets that ended after the filter value.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @name : String? = nil,
          @value_list : Array(String)? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity resource that is associated with the resource policy.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The policy document to set; formatted in JSON.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end

      # There was an internal service exception. HTTP status code: 500

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct JsonDocumentType
        include JSON::Serializable

        def initialize
        end
      end


      struct ListChangeSetsRequest
        include JSON::Serializable

        # The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # An array of filter objects.

        @[JSON::Field(key: "FilterList")]
        getter filter_list : Array(Types::Filter)?

        # The maximum number of results returned by a single call. This value must be provided in the next
        # call to retrieve the next set of results. By default, this value is 20.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An object that contains two attributes, SortBy and SortOrder .

        @[JSON::Field(key: "Sort")]
        getter sort : Types::Sort?

        def initialize(
          @catalog : String,
          @filter_list : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::Sort? = nil
        )
        end
      end


      struct ListChangeSetsResponse
        include JSON::Serializable

        # Array of ChangeSetSummaryListItem objects.

        @[JSON::Field(key: "ChangeSetSummaryList")]
        getter change_set_summary_list : Array(Types::ChangeSetSummaryListItem)?

        # The value of the next token, if it exists. Null if there are no more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @change_set_summary_list : Array(Types::ChangeSetSummaryListItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEntitiesRequest
        include JSON::Serializable

        # The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # The type of entities to retrieve. Valid values are: AmiProduct , ContainerProduct , DataProduct ,
        # SaaSProduct , ProcurementPolicy , Experience , Audience , BrandingSettings , Offer , OfferSet ,
        # Seller , ResaleAuthorization , Solution .

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String

        # A Union object containing filter shapes for all EntityType s. Each EntityTypeFilter shape will have
        # filters applicable for that EntityType that can be used to search or filter entities.

        @[JSON::Field(key: "EntityTypeFilters")]
        getter entity_type_filters : Types::EntityTypeFilters?

        # A Union object containing Sort shapes for all EntityType s. Each EntityTypeSort shape will have
        # SortBy and SortOrder applicable for fields on that EntityType . This can be used to sort the results
        # of the filter query.

        @[JSON::Field(key: "EntityTypeSort")]
        getter entity_type_sort : Types::EntityTypeSort?

        # An array of filter objects. Each filter object contains two attributes, filterName and filterValues
        # .

        @[JSON::Field(key: "FilterList")]
        getter filter_list : Array(Types::Filter)?

        # Specifies the upper limit of the elements on a single page. If a value isn't provided, the default
        # value is 20.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The value of the next token, if it exists. Null if there are no more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the returned set of entities based on their owner. The default is SELF . To list entities
        # shared with you through AWS Resource Access Manager (AWS RAM), set to SHARED . Entities shared
        # through the AWS Marketplace Catalog API PutResourcePolicy operation can't be discovered through the
        # SHARED parameter.

        @[JSON::Field(key: "OwnershipType")]
        getter ownership_type : String?

        # An object that contains two attributes, SortBy and SortOrder .

        @[JSON::Field(key: "Sort")]
        getter sort : Types::Sort?

        def initialize(
          @catalog : String,
          @entity_type : String,
          @entity_type_filters : Types::EntityTypeFilters? = nil,
          @entity_type_sort : Types::EntityTypeSort? = nil,
          @filter_list : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ownership_type : String? = nil,
          @sort : Types::Sort? = nil
        )
        end
      end


      struct ListEntitiesResponse
        include JSON::Serializable

        # Array of EntitySummary objects.

        @[JSON::Field(key: "EntitySummaryList")]
        getter entity_summary_list : Array(Types::EntitySummary)?

        # The value of the next token if it exists. Null if there is no more result.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_summary_list : Array(Types::EntitySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Required. The Amazon Resource Name (ARN) associated with the resource you want to list tags on.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Required. The ARN associated with the resource you want to list tags on.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Required. A list of objects specifying each key name and value. Number of objects allowed: 1-50.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The filter for machine learning product entity IDs.

      struct MachineLearningProductEntityIdFilter
        include JSON::Serializable

        # A list of entity IDs to filter by. The operation returns machine learning products with entity IDs
        # that match the values in this list.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # The filters that you can use with the ListEntities operation to filter machine learning products.
      # You can filter by EntityId , astModifiedDate , ProductTitle , and Visibility .

      struct MachineLearningProductFilters
        include JSON::Serializable

        # Filter machine learning products by their entity IDs.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::MachineLearningProductEntityIdFilter?

        # Filter machine learning products by their last modified date.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::MachineLearningProductLastModifiedDateFilter?

        # Filter machine learning products by their product titles.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : Types::MachineLearningProductTitleFilter?

        # Filter machine learning products by their visibility status.

        @[JSON::Field(key: "Visibility")]
        getter visibility : Types::MachineLearningProductVisibilityFilter?

        def initialize(
          @entity_id : Types::MachineLearningProductEntityIdFilter? = nil,
          @last_modified_date : Types::MachineLearningProductLastModifiedDateFilter? = nil,
          @product_title : Types::MachineLearningProductTitleFilter? = nil,
          @visibility : Types::MachineLearningProductVisibilityFilter? = nil
        )
        end
      end

      # The filter for machine learning product last modified date.

      struct MachineLearningProductLastModifiedDateFilter
        include JSON::Serializable

        # A date range to filter by. The operation returns machine learning products with last modified dates
        # that fall within this range.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::MachineLearningProductLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::MachineLearningProductLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # A date range for filtering machine learning products by their last modified date.

      struct MachineLearningProductLastModifiedDateFilterDateRange
        include JSON::Serializable

        # The start date (inclusive) of the date range. The operation returns machine learning products with
        # last modified dates on or after this date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # The end date (inclusive) of the date range. The operation returns machine learning products with
        # last modified dates on or before this date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # The sort options for machine learning products.

      struct MachineLearningProductSort
        include JSON::Serializable

        # The field to sort by. Valid values: EntityId , LastModifiedDate , ProductTitle , and Visibility .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sort order. Valid values are ASC (ascending) and DESC (descending).

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A summary of a machine learning product.

      struct MachineLearningProductSummary
        include JSON::Serializable

        # The title of the machine learning product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The visibility status of the machine learning product. Valid values are Limited , Public ,
        # Restricted , and Draft .

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @product_title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # The filter for machine learning product titles.

      struct MachineLearningProductTitleFilter
        include JSON::Serializable

        # A list of product titles to filter by. The operation returns machine learning products with titles
        # that exactly match the values in this list.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # A wildcard value to filter product titles. The operation returns machine learning products with
        # titles that match this wildcard pattern.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # The filter for machine learning product visibility status.

      struct MachineLearningProductVisibilityFilter
        include JSON::Serializable

        # A list of visibility values to filter by. The operation returns machine learning products with
        # visibility status that match the values in this list.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the AvailabilityEndDate of an offer.

      struct OfferAvailabilityEndDateFilter
        include JSON::Serializable

        # Allows filtering on the AvailabilityEndDate of an offer with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::OfferAvailabilityEndDateFilterDateRange?

        def initialize(
          @date_range : Types::OfferAvailabilityEndDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the AvailabilityEndDate of an offer with date range as input.

      struct OfferAvailabilityEndDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the AvailabilityEndDate of an offer after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the AvailabilityEndDate of an offer before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the BuyerAccounts of an offer.

      struct OfferBuyerAccountsFilter
        include JSON::Serializable

        # Allows filtering on the BuyerAccounts of an offer with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the entity id of an offer.

      struct OfferEntityIdFilter
        include JSON::Serializable

        # Allows filtering on entity id of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for offers entity. Client can add only one wildcard filter
      # and a maximum of 8 filters in a single ListEntities request.

      struct OfferFilters
        include JSON::Serializable

        # Allows filtering on the AvailabilityEndDate of an offer.

        @[JSON::Field(key: "AvailabilityEndDate")]
        getter availability_end_date : Types::OfferAvailabilityEndDateFilter?

        # Allows filtering on the BuyerAccounts of an offer.

        @[JSON::Field(key: "BuyerAccounts")]
        getter buyer_accounts : Types::OfferBuyerAccountsFilter?

        # Allows filtering on EntityId of an offer.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::OfferEntityIdFilter?

        # Allows filtering on the LastModifiedDate of an offer.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::OfferLastModifiedDateFilter?

        # Allows filtering on the Name of an offer.

        @[JSON::Field(key: "Name")]
        getter name : Types::OfferNameFilter?

        # Allows filtering on the OfferSetId of an offer.

        @[JSON::Field(key: "OfferSetId")]
        getter offer_set_id : Types::OfferSetIdFilter?

        # Allows filtering on the ProductId of an offer.

        @[JSON::Field(key: "ProductId")]
        getter product_id : Types::OfferProductIdFilter?

        # Allows filtering on the ReleaseDate of an offer.

        @[JSON::Field(key: "ReleaseDate")]
        getter release_date : Types::OfferReleaseDateFilter?

        # Allows filtering on the ResaleAuthorizationId of an offer. Not all offers have a
        # ResaleAuthorizationId . The response will only include offers for which you have permissions.

        @[JSON::Field(key: "ResaleAuthorizationId")]
        getter resale_authorization_id : Types::OfferResaleAuthorizationIdFilter?

        # Allows filtering on the State of an offer.

        @[JSON::Field(key: "State")]
        getter state : Types::OfferStateFilter?

        # Allows filtering on the Targeting of an offer.

        @[JSON::Field(key: "Targeting")]
        getter targeting : Types::OfferTargetingFilter?

        def initialize(
          @availability_end_date : Types::OfferAvailabilityEndDateFilter? = nil,
          @buyer_accounts : Types::OfferBuyerAccountsFilter? = nil,
          @entity_id : Types::OfferEntityIdFilter? = nil,
          @last_modified_date : Types::OfferLastModifiedDateFilter? = nil,
          @name : Types::OfferNameFilter? = nil,
          @offer_set_id : Types::OfferSetIdFilter? = nil,
          @product_id : Types::OfferProductIdFilter? = nil,
          @release_date : Types::OfferReleaseDateFilter? = nil,
          @resale_authorization_id : Types::OfferResaleAuthorizationIdFilter? = nil,
          @state : Types::OfferStateFilter? = nil,
          @targeting : Types::OfferTargetingFilter? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of an offer.

      struct OfferLastModifiedDateFilter
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of an offer with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::OfferLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::OfferLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of an offer with date range as input.

      struct OfferLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of an offer after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the LastModifiedDate of an offer before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the Name of an offer.

      struct OfferNameFilter
        include JSON::Serializable

        # Allows filtering on the Name of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the Name of an offer with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the ProductId of an offer.

      struct OfferProductIdFilter
        include JSON::Serializable

        # Allows filtering on the ProductId of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the ReleaseDate of an offer.

      struct OfferReleaseDateFilter
        include JSON::Serializable

        # Allows filtering on the ReleaseDate of an offer with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::OfferReleaseDateFilterDateRange?

        def initialize(
          @date_range : Types::OfferReleaseDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the ReleaseDate of an offer with date range as input.

      struct OfferReleaseDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the ReleaseDate of offers after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the ReleaseDate of offers before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the ResaleAuthorizationId of an offer. Not all offers have a
      # ResaleAuthorizationId . The response will only include offers for which you have permissions.

      struct OfferResaleAuthorizationIdFilter
        include JSON::Serializable

        # Allows filtering on the ResaleAuthorizationId of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the AssociatedOfferIds of an offer set.

      struct OfferSetAssociatedOfferIdsFilter
        include JSON::Serializable

        # Allows filtering on the AssociatedOfferIds of an offer set with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the entity id of an offer set.

      struct OfferSetEntityIdFilter
        include JSON::Serializable

        # Allows filtering on entity id of an offer set with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for offer sets entity. Client can add a maximum of 8 filters
      # in a single ListEntities request.

      struct OfferSetFilters
        include JSON::Serializable

        # Allows filtering on the AssociatedOfferIds of an offer set.

        @[JSON::Field(key: "AssociatedOfferIds")]
        getter associated_offer_ids : Types::OfferSetAssociatedOfferIdsFilter?

        # Allows filtering on EntityId of an offer set.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::OfferSetEntityIdFilter?

        # Allows filtering on the LastModifiedDate of an offer set.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::OfferSetLastModifiedDateFilter?

        # Allows filtering on the Name of an offer set.

        @[JSON::Field(key: "Name")]
        getter name : Types::OfferSetNameFilter?

        # Allows filtering on the ReleaseDate of an offer set.

        @[JSON::Field(key: "ReleaseDate")]
        getter release_date : Types::OfferSetReleaseDateFilter?

        # Allows filtering on the SolutionId of an offer set.

        @[JSON::Field(key: "SolutionId")]
        getter solution_id : Types::OfferSetSolutionIdFilter?

        # Allows filtering on the State of an offer set.

        @[JSON::Field(key: "State")]
        getter state : Types::OfferSetStateFilter?

        def initialize(
          @associated_offer_ids : Types::OfferSetAssociatedOfferIdsFilter? = nil,
          @entity_id : Types::OfferSetEntityIdFilter? = nil,
          @last_modified_date : Types::OfferSetLastModifiedDateFilter? = nil,
          @name : Types::OfferSetNameFilter? = nil,
          @release_date : Types::OfferSetReleaseDateFilter? = nil,
          @solution_id : Types::OfferSetSolutionIdFilter? = nil,
          @state : Types::OfferSetStateFilter? = nil
        )
        end
      end

      # Allows filtering on the OfferSetId of an offer.

      struct OfferSetIdFilter
        include JSON::Serializable

        # Allows filtering on the OfferSetId of an offer.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of an offer set.

      struct OfferSetLastModifiedDateFilter
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of an offer set with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::OfferSetLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::OfferSetLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of an offer set with date range as input.

      struct OfferSetLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of an offer set after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the LastModifiedDate of an offer set before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the Name of an offer set.

      struct OfferSetNameFilter
        include JSON::Serializable

        # Allows filtering on the Name of an offer set with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the ReleaseDate of an offer set.

      struct OfferSetReleaseDateFilter
        include JSON::Serializable

        # Allows filtering on the ReleaseDate of an offer set with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::OfferSetReleaseDateFilterDateRange?

        def initialize(
          @date_range : Types::OfferSetReleaseDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the ReleaseDate of an offer set with date range as input.

      struct OfferSetReleaseDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the ReleaseDate of offer set after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the ReleaseDate of offer set before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the SolutionId of an offer set.

      struct OfferSetSolutionIdFilter
        include JSON::Serializable

        # Allows filtering on the SolutionId of an offer set with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows to sort offer sets.

      struct OfferSetSort
        include JSON::Serializable

        # Allows to sort offer sets.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Allows to sort offer sets.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Allows filtering on the State of an offer set.

      struct OfferSetStateFilter
        include JSON::Serializable

        # Allows filtering on the State of an offer set with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Summarized information about an offer set.

      struct OfferSetSummary
        include JSON::Serializable

        # The list of offer IDs associated with the offer set.

        @[JSON::Field(key: "AssociatedOfferIds")]
        getter associated_offer_ids : Array(String)?

        # The name of the offer set.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The release date of the offer set.

        @[JSON::Field(key: "ReleaseDate")]
        getter release_date : String?

        # The solution ID associated with the offer set.

        @[JSON::Field(key: "SolutionId")]
        getter solution_id : String?

        # The state of the offer set.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @associated_offer_ids : Array(String)? = nil,
          @name : String? = nil,
          @release_date : String? = nil,
          @solution_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Allows to sort offers.

      struct OfferSort
        include JSON::Serializable

        # Allows to sort offers.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Allows to sort offers.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Allows filtering on the State of an offer.

      struct OfferStateFilter
        include JSON::Serializable

        # Allows filtering on the State of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Summarized information about an offer.

      struct OfferSummary
        include JSON::Serializable

        # The availability end date of the offer.

        @[JSON::Field(key: "AvailabilityEndDate")]
        getter availability_end_date : String?

        # The buyer accounts in the offer.

        @[JSON::Field(key: "BuyerAccounts")]
        getter buyer_accounts : Array(String)?

        # The name of the offer.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The offer set ID of the offer.

        @[JSON::Field(key: "OfferSetId")]
        getter offer_set_id : String?

        # The product ID of the offer.

        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The release date of the offer.

        @[JSON::Field(key: "ReleaseDate")]
        getter release_date : String?

        # The ResaleAuthorizationId of the offer.

        @[JSON::Field(key: "ResaleAuthorizationId")]
        getter resale_authorization_id : String?

        # The status of the offer.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The targeting in the offer.

        @[JSON::Field(key: "Targeting")]
        getter targeting : Array(String)?

        def initialize(
          @availability_end_date : String? = nil,
          @buyer_accounts : Array(String)? = nil,
          @name : String? = nil,
          @offer_set_id : String? = nil,
          @product_id : String? = nil,
          @release_date : String? = nil,
          @resale_authorization_id : String? = nil,
          @state : String? = nil,
          @targeting : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the Targeting of an offer.

      struct OfferTargetingFilter
        include JSON::Serializable

        # Allows filtering on the Targeting of an offer with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The policy document to set; formatted in JSON.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the entity resource you want to associate with a resource policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Allows filtering on AvailabilityEndDate of a ResaleAuthorization.

      struct ResaleAuthorizationAvailabilityEndDateFilter
        include JSON::Serializable

        # Allows filtering on AvailabilityEndDate of a ResaleAuthorization with date range as input

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::ResaleAuthorizationAvailabilityEndDateFilterDateRange?

        # Allows filtering on AvailabilityEndDate of a ResaleAuthorization with date value as input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @date_range : Types::ResaleAuthorizationAvailabilityEndDateFilterDateRange? = nil,
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on AvailabilityEndDate of a ResaleAuthorization with date range as input.

      struct ResaleAuthorizationAvailabilityEndDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on AvailabilityEndDate of a ResaleAuthorization after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on AvailabilityEndDate of a ResaleAuthorization before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on CreatedDate of a ResaleAuthorization.

      struct ResaleAuthorizationCreatedDateFilter
        include JSON::Serializable

        # Allows filtering on CreatedDate of a ResaleAuthorization with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::ResaleAuthorizationCreatedDateFilterDateRange?

        # Allows filtering on CreatedDate of a ResaleAuthorization with date value as input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @date_range : Types::ResaleAuthorizationCreatedDateFilterDateRange? = nil,
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on CreatedDate of a ResaleAuthorization with date range as input.

      struct ResaleAuthorizationCreatedDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on CreatedDate of a ResaleAuthorization after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on CreatedDate of a ResaleAuthorization before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on EntityId of a ResaleAuthorization.

      struct ResaleAuthorizationEntityIdFilter
        include JSON::Serializable

        # Allows filtering on EntityId of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for resale authorization entity. Client can add only one
      # wildcard filter and a maximum of 8 filters in a single ListEntities request.

      struct ResaleAuthorizationFilters
        include JSON::Serializable

        # Allows filtering on the AvailabilityEndDate of a ResaleAuthorization.

        @[JSON::Field(key: "AvailabilityEndDate")]
        getter availability_end_date : Types::ResaleAuthorizationAvailabilityEndDateFilter?

        # Allows filtering on the CreatedDate of a ResaleAuthorization.

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : Types::ResaleAuthorizationCreatedDateFilter?

        # Allows filtering on the EntityId of a ResaleAuthorization.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::ResaleAuthorizationEntityIdFilter?

        # Allows filtering on the LastModifiedDate of a ResaleAuthorization.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::ResaleAuthorizationLastModifiedDateFilter?

        # Allows filtering on the ManufacturerAccountId of a ResaleAuthorization.

        @[JSON::Field(key: "ManufacturerAccountId")]
        getter manufacturer_account_id : Types::ResaleAuthorizationManufacturerAccountIdFilter?

        # Allows filtering on the ManufacturerLegalName of a ResaleAuthorization.

        @[JSON::Field(key: "ManufacturerLegalName")]
        getter manufacturer_legal_name : Types::ResaleAuthorizationManufacturerLegalNameFilter?

        # Allows filtering on the Name of a ResaleAuthorization.

        @[JSON::Field(key: "Name")]
        getter name : Types::ResaleAuthorizationNameFilter?

        # Allows filtering on the OfferExtendedStatus of a ResaleAuthorization.

        @[JSON::Field(key: "OfferExtendedStatus")]
        getter offer_extended_status : Types::ResaleAuthorizationOfferExtendedStatusFilter?

        # Allows filtering on the ProductId of a ResaleAuthorization.

        @[JSON::Field(key: "ProductId")]
        getter product_id : Types::ResaleAuthorizationProductIdFilter?

        # Allows filtering on the ProductName of a ResaleAuthorization.

        @[JSON::Field(key: "ProductName")]
        getter product_name : Types::ResaleAuthorizationProductNameFilter?

        # Allows filtering on the ResellerAccountID of a ResaleAuthorization.

        @[JSON::Field(key: "ResellerAccountID")]
        getter reseller_account_id : Types::ResaleAuthorizationResellerAccountIDFilter?

        # Allows filtering on the ResellerLegalName of a ResaleAuthorization.

        @[JSON::Field(key: "ResellerLegalName")]
        getter reseller_legal_name : Types::ResaleAuthorizationResellerLegalNameFilter?

        # Allows filtering on the Status of a ResaleAuthorization.

        @[JSON::Field(key: "Status")]
        getter status : Types::ResaleAuthorizationStatusFilter?

        def initialize(
          @availability_end_date : Types::ResaleAuthorizationAvailabilityEndDateFilter? = nil,
          @created_date : Types::ResaleAuthorizationCreatedDateFilter? = nil,
          @entity_id : Types::ResaleAuthorizationEntityIdFilter? = nil,
          @last_modified_date : Types::ResaleAuthorizationLastModifiedDateFilter? = nil,
          @manufacturer_account_id : Types::ResaleAuthorizationManufacturerAccountIdFilter? = nil,
          @manufacturer_legal_name : Types::ResaleAuthorizationManufacturerLegalNameFilter? = nil,
          @name : Types::ResaleAuthorizationNameFilter? = nil,
          @offer_extended_status : Types::ResaleAuthorizationOfferExtendedStatusFilter? = nil,
          @product_id : Types::ResaleAuthorizationProductIdFilter? = nil,
          @product_name : Types::ResaleAuthorizationProductNameFilter? = nil,
          @reseller_account_id : Types::ResaleAuthorizationResellerAccountIDFilter? = nil,
          @reseller_legal_name : Types::ResaleAuthorizationResellerLegalNameFilter? = nil,
          @status : Types::ResaleAuthorizationStatusFilter? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of a ResaleAuthorization.

      struct ResaleAuthorizationLastModifiedDateFilter
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of a ResaleAuthorization with date range as input.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::ResaleAuthorizationLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::ResaleAuthorizationLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Allows filtering on the LastModifiedDate of a ResaleAuthorization with date range as input.

      struct ResaleAuthorizationLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Allows filtering on the LastModifiedDate of a ResaleAuthorization after a date.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Allows filtering on the LastModifiedDate of a ResaleAuthorization before a date.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Allows filtering on the ManufacturerAccountId of a ResaleAuthorization.

      struct ResaleAuthorizationManufacturerAccountIdFilter
        include JSON::Serializable

        # Allows filtering on the ManufacturerAccountId of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ManufacturerAccountId of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the ManufacturerLegalName of a ResaleAuthorization.

      struct ResaleAuthorizationManufacturerLegalNameFilter
        include JSON::Serializable

        # Allows filtering on the ManufacturerLegalName of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ManufacturerLegalName of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the Name of a ResaleAuthorization.

      struct ResaleAuthorizationNameFilter
        include JSON::Serializable

        # Allows filtering on the Name of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the Name of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the OfferExtendedStatus of a ResaleAuthorization.

      struct ResaleAuthorizationOfferExtendedStatusFilter
        include JSON::Serializable

        # Allows filtering on the OfferExtendedStatus of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Allows filtering on the ProductId of a ResaleAuthorization.

      struct ResaleAuthorizationProductIdFilter
        include JSON::Serializable

        # Allows filtering on the ProductId of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ProductId of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the ProductName of a ResaleAuthorization.

      struct ResaleAuthorizationProductNameFilter
        include JSON::Serializable

        # Allows filtering on the ProductName of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ProductName of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the ResellerAccountID of a ResaleAuthorization.

      struct ResaleAuthorizationResellerAccountIDFilter
        include JSON::Serializable

        # Allows filtering on the ResellerAccountID of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ResellerAccountID of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows filtering on the ResellerLegalName of a ResaleAuthorization.

      struct ResaleAuthorizationResellerLegalNameFilter
        include JSON::Serializable

        # Allows filtering on the ResellerLegalNameProductName of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # Allows filtering on the ResellerLegalName of a ResaleAuthorization with wild card input.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Allows to sort ResaleAuthorization.

      struct ResaleAuthorizationSort
        include JSON::Serializable

        # Allows to sort ResaleAuthorization.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Allows to sort ResaleAuthorization.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Allows filtering on the Status of a ResaleAuthorization.

      struct ResaleAuthorizationStatusFilter
        include JSON::Serializable

        # Allows filtering on the Status of a ResaleAuthorization with list input.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Summarized information about a Resale Authorization.

      struct ResaleAuthorizationSummary
        include JSON::Serializable

        # The availability end date of the ResaleAuthorization.

        @[JSON::Field(key: "AvailabilityEndDate")]
        getter availability_end_date : String?

        # The created date of the ResaleAuthorization.

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : String?

        # The manufacturer account ID of the ResaleAuthorization.

        @[JSON::Field(key: "ManufacturerAccountId")]
        getter manufacturer_account_id : String?

        # The manufacturer legal name of the ResaleAuthorization.

        @[JSON::Field(key: "ManufacturerLegalName")]
        getter manufacturer_legal_name : String?

        # The name of the ResaleAuthorization.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The offer extended status of the ResaleAuthorization

        @[JSON::Field(key: "OfferExtendedStatus")]
        getter offer_extended_status : String?

        # The product ID of the ResaleAuthorization.

        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # The product name of the ResaleAuthorization.

        @[JSON::Field(key: "ProductName")]
        getter product_name : String?

        # The reseller account ID of the ResaleAuthorization.

        @[JSON::Field(key: "ResellerAccountID")]
        getter reseller_account_id : String?

        # The reseller legal name of the ResaleAuthorization

        @[JSON::Field(key: "ResellerLegalName")]
        getter reseller_legal_name : String?

        # The status of the ResaleAuthorization.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @availability_end_date : String? = nil,
          @created_date : String? = nil,
          @manufacturer_account_id : String? = nil,
          @manufacturer_legal_name : String? = nil,
          @name : String? = nil,
          @offer_extended_status : String? = nil,
          @product_id : String? = nil,
          @product_name : String? = nil,
          @reseller_account_id : String? = nil,
          @reseller_legal_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The resource is currently in use.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource wasn't found. HTTP status code: 404

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Currently, the specified resource is not supported.

      struct ResourceNotSupportedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Object that allows filtering on entity id of a SaaS product.

      struct SaaSProductEntityIdFilter
        include JSON::Serializable

        # A string array of unique entity id values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # Object containing all the filter fields for SaaS products. Client can add only one wildcard filter
      # and a maximum of 8 filters in a single ListEntities request.

      struct SaaSProductFilters
        include JSON::Serializable

        # Unique identifier for the SaaS product.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : Types::SaaSProductEntityIdFilter?

        # The last date on which the SaaS product was modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Types::SaaSProductLastModifiedDateFilter?

        # The title of the SaaS product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : Types::SaaSProductTitleFilter?

        # The visibility of the SaaS product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : Types::SaaSProductVisibilityFilter?

        def initialize(
          @entity_id : Types::SaaSProductEntityIdFilter? = nil,
          @last_modified_date : Types::SaaSProductLastModifiedDateFilter? = nil,
          @product_title : Types::SaaSProductTitleFilter? = nil,
          @visibility : Types::SaaSProductVisibilityFilter? = nil
        )
        end
      end

      # Object that allows filtering based on the last modified date of SaaS products

      struct SaaSProductLastModifiedDateFilter
        include JSON::Serializable

        # Dates between which the SaaS product was last modified.

        @[JSON::Field(key: "DateRange")]
        getter date_range : Types::SaaSProductLastModifiedDateFilterDateRange?

        def initialize(
          @date_range : Types::SaaSProductLastModifiedDateFilterDateRange? = nil
        )
        end
      end

      # Object that contains date range of the last modified date to be filtered on. You can optionally
      # provide a BeforeValue and/or AfterValue . Both are inclusive.

      struct SaaSProductLastModifiedDateFilterDateRange
        include JSON::Serializable

        # Date after which the SaaS product was last modified.

        @[JSON::Field(key: "AfterValue")]
        getter after_value : String?

        # Date before which the SaaS product was last modified.

        @[JSON::Field(key: "BeforeValue")]
        getter before_value : String?

        def initialize(
          @after_value : String? = nil,
          @before_value : String? = nil
        )
        end
      end

      # Objects that allows sorting on SaaS products based on certain fields and sorting order.

      struct SaaSProductSort
        include JSON::Serializable

        # Field to sort the SaaS products by.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order. Can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Object that contains summarized information about a SaaS product.

      struct SaaSProductSummary
        include JSON::Serializable

        # The title of the SaaS product.

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The lifecycle of the SaaS product.

        @[JSON::Field(key: "Visibility")]
        getter visibility : String?

        def initialize(
          @product_title : String? = nil,
          @visibility : String? = nil
        )
        end
      end

      # Object that allows filtering on product title.

      struct SaaSProductTitleFilter
        include JSON::Serializable

        # A string array of unique product title values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        # A string that will be the wildCard input for product tile filter. It matches the provided value as a
        # substring in the actual value.

        @[JSON::Field(key: "WildCardValue")]
        getter wild_card_value : String?

        def initialize(
          @value_list : Array(String)? = nil,
          @wild_card_value : String? = nil
        )
        end
      end

      # Object that allows filtering on the visibility of the product in the AWS Marketplace.

      struct SaaSProductVisibilityFilter
        include JSON::Serializable

        # A string array of unique visibility values to be filtered on.

        @[JSON::Field(key: "ValueList")]
        getter value_list : Array(String)?

        def initialize(
          @value_list : Array(String)? = nil
        )
        end
      end

      # The maximum number of open requests per account has been exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains two attributes, SortBy and SortOrder .

      struct Sort
        include JSON::Serializable

        # For ListEntities , supported attributes include LastModifiedDate (default) and EntityId . In
        # addition to LastModifiedDate and EntityId , each EntityType might support additional fields. For
        # ListChangeSets , supported attributes include StartTime and EndTime .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sorting order. Can be ASCENDING or DESCENDING . The default value is DESCENDING .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct StartChangeSetRequest
        include JSON::Serializable

        # The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "Catalog")]
        getter catalog : String

        # Array of change object.

        @[JSON::Field(key: "ChangeSet")]
        getter change_set : Array(Types::Change)

        # Optional case sensitive string of up to 100 ASCII characters. The change set name can be used to
        # filter the list of change sets.

        @[JSON::Field(key: "ChangeSetName")]
        getter change_set_name : String?

        # A list of objects specifying each key name and value for the ChangeSetTags property.

        @[JSON::Field(key: "ChangeSetTags")]
        getter change_set_tags : Array(Types::Tag)?

        # A unique token to identify the request to ensure idempotency.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The intent related to the request. The default is APPLY . To test your request before applying
        # changes to your entities, use VALIDATE . This feature is currently available for adding versions to
        # single-AMI products. For more information, see Add a new version .

        @[JSON::Field(key: "Intent")]
        getter intent : String?

        def initialize(
          @catalog : String,
          @change_set : Array(Types::Change),
          @change_set_name : String? = nil,
          @change_set_tags : Array(Types::Tag)? = nil,
          @client_request_token : String? = nil,
          @intent : String? = nil
        )
        end
      end


      struct StartChangeSetResponse
        include JSON::Serializable

        # The ARN associated to the unique identifier generated for the request.

        @[JSON::Field(key: "ChangeSetArn")]
        getter change_set_arn : String?

        # Unique identifier generated for the request.

        @[JSON::Field(key: "ChangeSetId")]
        getter change_set_id : String?

        def initialize(
          @change_set_arn : String? = nil,
          @change_set_id : String? = nil
        )
        end
      end

      # A list of objects specifying each key name and value.

      struct Tag
        include JSON::Serializable

        # The key associated with the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value associated with the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # Required. The Amazon Resource Name (ARN) associated with the resource you want to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Required. A list of objects specifying each key name and value. Number of objects allowed: 1-50.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Too many requests. HTTP status code: 429

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # Required. The Amazon Resource Name (ARN) associated with the resource you want to remove the tag
        # from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Required. A list of key names of tags to be removed. Number of strings allowed: 0-256.

        @[JSON::Field(key: "TagKeys")]
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

      # An error occurred during validation. HTTP status code: 422

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
