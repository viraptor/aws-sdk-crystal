require "json"
require "time"

module AwsSdk
  module KendraRanking
    module Types

      # You don’t have sufficient access to perform this action. Please ensure you have the required
      # permission policies and user accounts and try again.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Sets additional capacity units configured for your rescore execution plan. A rescore execution plan
      # is an Amazon Kendra Intelligent Ranking resource used for provisioning the Rescore API. You can add
      # and remove capacity units to fit your usage requirements.
      struct CapacityUnitsConfiguration
        include JSON::Serializable

        # The amount of extra capacity for your rescore execution plan. A single extra capacity unit for a
        # rescore execution plan provides 0.01 rescore requests per second. You can add up to 1000 extra
        # capacity units.
        @[JSON::Field(key: "RescoreCapacityUnits")]
        getter rescore_capacity_units : Int32

        def initialize(
          @rescore_capacity_units : Int32
        )
        end
      end

      # A conflict occurred with the request. Please fix any inconsistencies with your resources and try
      # again.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateRescoreExecutionPlanRequest
        include JSON::Serializable

        # A name for the rescore execution plan.
        @[JSON::Field(key: "Name")]
        getter name : String

        # You can set additional capacity units to meet the needs of your rescore execution plan. You are
        # given a single capacity unit by default. If you want to use the default capacity, you don't set
        # additional capacity units. For more information on the default capacity and additional capacity
        # units, see Adjusting capacity .
        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Types::CapacityUnitsConfiguration?

        # A token that you provide to identify the request to create a rescore execution plan. Multiple calls
        # to the CreateRescoreExecutionPlanRequest API with the same client token will create only one rescore
        # execution plan.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the rescore execution plan.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of key-value pairs that identify or categorize your rescore execution plan. You can also use
        # tags to help control access to the rescore execution plan. Tag keys and values can consist of
        # Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @capacity_units : Types::CapacityUnitsConfiguration? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRescoreExecutionPlanResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rescore execution plan.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The identifier of the rescore execution plan.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @arn : String,
          @id : String
        )
        end
      end

      struct DeleteRescoreExecutionPlanRequest
        include JSON::Serializable

        # The identifier of the rescore execution plan that you want to delete.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DescribeRescoreExecutionPlanRequest
        include JSON::Serializable

        # The identifier of the rescore execution plan that you want to get information on.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DescribeRescoreExecutionPlanResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rescore execution plan.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The capacity units set for the rescore execution plan. A capacity of zero indicates that the rescore
        # execution plan is using the default capacity. For more information on the default capacity and
        # additional capacity units, see Adjusting capacity .
        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Types::CapacityUnitsConfiguration?

        # The Unix timestamp of when the rescore execution plan was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description for the rescore execution plan.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # When the Status field value is FAILED , the ErrorMessage field contains a message that explains why.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the rescore execution plan.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name for the rescore execution plan.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the rescore execution plan. When the value is ACTIVE , the rescore execution
        # plan is ready for use. If the Status field value is FAILED , the ErrorMessage field contains a
        # message that explains why.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp of when the rescore execution plan was last updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @capacity_units : Types::CapacityUnitsConfiguration? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about a document from a search service such as OpenSearch (self managed). Amazon Kendra
      # Intelligent Ranking uses this information to rank and score on.
      struct Document
        include JSON::Serializable

        # The identifier of the document from the search service.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The original document score or rank from the search service. Amazon Kendra Intelligent Ranking gives
        # the document a new score or rank based on its intelligent search algorithms.
        @[JSON::Field(key: "OriginalScore")]
        getter original_score : Float64

        # The body text of the search service's document.
        @[JSON::Field(key: "Body")]
        getter body : String?

        # The optional group identifier of the document from the search service. Documents with the same group
        # identifier are grouped together and processed as one document within the service.
        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # The title of the search service's document.
        @[JSON::Field(key: "Title")]
        getter title : String?

        # The body text of the search service's document represented as a list of tokens or words. You must
        # choose to provide Body or TokenizedBody . You cannot provide both.
        @[JSON::Field(key: "TokenizedBody")]
        getter tokenized_body : Array(String)?

        # The title of the search service's document represented as a list of tokens or words. You must choose
        # to provide Title or TokenizedTitle . You cannot provide both.
        @[JSON::Field(key: "TokenizedTitle")]
        getter tokenized_title : Array(String)?

        def initialize(
          @id : String,
          @original_score : Float64,
          @body : String? = nil,
          @group_id : String? = nil,
          @title : String? = nil,
          @tokenized_body : Array(String)? = nil,
          @tokenized_title : Array(String)? = nil
        )
        end
      end

      # An issue occurred with the internal server used for your Amazon Kendra Intelligent Ranking service.
      # Please wait a few minutes and try again, or contact Support for help.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListRescoreExecutionPlansRequest
        include JSON::Serializable

        # The maximum number of rescore execution plans to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the response is truncated, Amazon Kendra Intelligent Ranking returns a pagination token in the
        # response. You can use this pagination token to retrieve the next set of rescore execution plans.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRescoreExecutionPlansResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra Intelligent Ranking returns a pagination token in the
        # response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for one or more rescore execution plans.
        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::RescoreExecutionPlanSummary)?

        def initialize(
          @next_token : String? = nil,
          @summary_items : Array(Types::RescoreExecutionPlanSummary)? = nil
        )
        end
      end

      # The request information for listing tags associated with a rescore execution plan. A rescore
      # execution plan is an Amazon Kendra Intelligent Ranking resource used for provisioning the Rescore
      # API.
      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rescore execution plan to get a list of tags for.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response.
      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the rescore execution plan.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Summary information for a rescore execution plan. A rescore execution plan is an Amazon Kendra
      # Intelligent Ranking resource used for provisioning the Rescore API.
      struct RescoreExecutionPlanSummary
        include JSON::Serializable

        # The Unix timestamp when the rescore execution plan was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the rescore execution plan.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the rescore execution plan.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the rescore execution plan. When the value is ACTIVE , the rescore execution
        # plan is ready for use.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the rescore execution plan was last updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct RescoreRequest
        include JSON::Serializable

        # The list of documents for Amazon Kendra Intelligent Ranking to rescore or rank on.
        @[JSON::Field(key: "Documents")]
        getter documents : Array(Types::Document)

        # The identifier of the rescore execution plan. A rescore execution plan is an Amazon Kendra
        # Intelligent Ranking resource used for provisioning the Rescore API.
        @[JSON::Field(key: "RescoreExecutionPlanId")]
        getter rescore_execution_plan_id : String

        # The input query from the search service.
        @[JSON::Field(key: "SearchQuery")]
        getter search_query : String

        def initialize(
          @documents : Array(Types::Document),
          @rescore_execution_plan_id : String,
          @search_query : String
        )
        end
      end

      struct RescoreResult
        include JSON::Serializable

        # The identifier associated with the scores that Amazon Kendra Intelligent Ranking gives to the
        # results. Amazon Kendra Intelligent Ranking rescores or re-ranks the results for the search service.
        @[JSON::Field(key: "RescoreId")]
        getter rescore_id : String?

        # A list of result items for documents with new relevancy scores. The results are in descending order.
        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::RescoreResultItem)?

        def initialize(
          @rescore_id : String? = nil,
          @result_items : Array(Types::RescoreResultItem)? = nil
        )
        end
      end

      # A result item for a document with a new relevancy score.
      struct RescoreResultItem
        include JSON::Serializable

        # The identifier of the document from the search service.
        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # The relevancy score or rank that Amazon Kendra Intelligent Ranking gives to the result.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @document_id : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The resource you want to use doesn't exist. Please check you have provided the correct resource and
      # try again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource you want to use is unavailable. Please check you have provided the correct resource
      # information and try again.
      struct ResourceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have exceeded the set limits for your Amazon Kendra Intelligent Ranking service. Please see
      # Quotas for more information, or contact Support to inquire about an increase of limits.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A key-value pair that identifies or categorizes a rescore execution plan. A rescore execution plan
      # is an Amazon Kendra Intelligent Ranking resource used for provisioning the Rescore API. You can also
      # use a tag to help control access to a rescore execution plan. A tag key and value can consist of
      # Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.
      struct Tag
        include JSON::Serializable

        # The key for the tag. Keys are not case sensitive and must be unique.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value associated with the tag. The value can be an empty string but it can't be null.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The request information for tagging a rescore execution plan. A rescore execution plan is an Amazon
      # Kendra Intelligent Ranking resource used for provisioning the Rescore API.
      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rescore execution plan to tag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tag keys to add to a rescore execution plan. If a tag already exists, the existing value
        # is replaced with the new value.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.
      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling. Please reduce the number of requests and try
      # again.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request information to remove a tag from a rescore execution plan. A rescore execution plan is
      # an Amazon Kendra Intelligent Ranking resource used for provisioning the Rescore API.
      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rescore execution plan to remove the tag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tag keys to remove from the rescore execution plan. If a tag key does not exist on the
        # resource, it is ignored.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.
      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateRescoreExecutionPlanRequest
        include JSON::Serializable

        # The identifier of the rescore execution plan that you want to update.
        @[JSON::Field(key: "Id")]
        getter id : String

        # You can set additional capacity units to meet the needs of your rescore execution plan. You are
        # given a single capacity unit by default. If you want to use the default capacity, you don't set
        # additional capacity units. For more information on the default capacity and additional capacity
        # units, see Adjusting capacity .
        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Types::CapacityUnitsConfiguration?

        # A new description for the rescore execution plan.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A new name for the rescore execution plan.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String,
          @capacity_units : Types::CapacityUnitsConfiguration? = nil,
          @description : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints set by the Amazon Kendra Intelligent Ranking service.
      # Please provide the correct input and try again.
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
