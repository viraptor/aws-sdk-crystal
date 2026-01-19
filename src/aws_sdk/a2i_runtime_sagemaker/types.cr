require "json"
require "time"

module AwsSdk
  module SageMakerA2IRuntime
    module Types

      # Your request has the same name as another active human loop but has different input data. You cannot
      # start two human loops with the same name and different input data.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteHumanLoopRequest
        include JSON::Serializable

        # The name of the human loop that you want to delete.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        def initialize(
          @human_loop_name : String
        )
        end
      end

      struct DeleteHumanLoopResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeHumanLoopRequest
        include JSON::Serializable

        # The name of the human loop that you want information about.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        def initialize(
          @human_loop_name : String
        )
        end
      end

      struct DescribeHumanLoopResponse
        include JSON::Serializable

        # The creation time when Amazon Augmented AI created the human loop.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the flow definition.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String

        # The Amazon Resource Name (ARN) of the human loop.
        @[JSON::Field(key: "HumanLoopArn")]
        getter human_loop_arn : String

        # The name of the human loop. The name must be lowercase, unique within the Region in your account,
        # and can have up to 63 characters. Valid characters: a-z, 0-9, and - (hyphen).
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        # The status of the human loop.
        @[JSON::Field(key: "HumanLoopStatus")]
        getter human_loop_status : String

        # A failure code that identifies the type of failure. Possible values: ValidationError , Expired ,
        # InternalError
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # The reason why a human loop failed. The failure reason is returned when the status of the human loop
        # is Failed .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # An object that contains information about the output of the human loop.
        @[JSON::Field(key: "HumanLoopOutput")]
        getter human_loop_output : Types::HumanLoopOutput?

        def initialize(
          @creation_time : Time,
          @flow_definition_arn : String,
          @human_loop_arn : String,
          @human_loop_name : String,
          @human_loop_status : String,
          @failure_code : String? = nil,
          @failure_reason : String? = nil,
          @human_loop_output : Types::HumanLoopOutput? = nil
        )
        end
      end

      # Attributes of the data specified by the customer. Use these to describe the data to be labeled.
      struct HumanLoopDataAttributes
        include JSON::Serializable

        # Declares that your content is free of personally identifiable information or adult content. Amazon
        # SageMaker can restrict the Amazon Mechanical Turk workers who can view your task based on this
        # information.
        @[JSON::Field(key: "ContentClassifiers")]
        getter content_classifiers : Array(String)

        def initialize(
          @content_classifiers : Array(String)
        )
        end
      end

      # An object containing the human loop input in JSON format.
      struct HumanLoopInput
        include JSON::Serializable

        # Serialized input from the human loop. The input must be a string representation of a file in JSON
        # format.
        @[JSON::Field(key: "InputContent")]
        getter input_content : String

        def initialize(
          @input_content : String
        )
        end
      end

      # Information about where the human output will be stored.
      struct HumanLoopOutput
        include JSON::Serializable

        # The location of the Amazon S3 object where Amazon Augmented AI stores your human loop output.
        @[JSON::Field(key: "OutputS3Uri")]
        getter output_s3_uri : String

        def initialize(
          @output_s3_uri : String
        )
        end
      end

      # Summary information about the human loop.
      struct HumanLoopSummary
        include JSON::Serializable

        # When Amazon Augmented AI created the human loop.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The reason why the human loop failed. A failure reason is returned when the status of the human loop
        # is Failed .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The Amazon Resource Name (ARN) of the flow definition used to configure the human loop.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String?

        # The name of the human loop.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String?

        # The status of the human loop.
        @[JSON::Field(key: "HumanLoopStatus")]
        getter human_loop_status : String?

        def initialize(
          @creation_time : Time? = nil,
          @failure_reason : String? = nil,
          @flow_definition_arn : String? = nil,
          @human_loop_name : String? = nil,
          @human_loop_status : String? = nil
        )
        end
      end

      # We couldn't process your request because of an issue with the server. Try again later.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListHumanLoopsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a flow definition.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String

        # (Optional) The timestamp of the date when you want the human loops to begin in ISO 8601 format. For
        # example, 2020-02-24 .
        @[JSON::Field(key: "CreationTimeAfter")]
        getter creation_time_after : Time?

        # (Optional) The timestamp of the date before which you want the human loops to begin in ISO 8601
        # format. For example, 2020-02-24 .
        @[JSON::Field(key: "CreationTimeBefore")]
        getter creation_time_before : Time?

        # The total number of items to return. If the total number of available items is more than the value
        # specified in MaxResults , then a NextToken is returned in the output. You can use this token to
        # display the next page of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to display the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Optional. The order for displaying results. Valid values: Ascending and Descending .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @flow_definition_arn : String,
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListHumanLoopsResponse
        include JSON::Serializable

        # An array of objects that contain information about the human loops.
        @[JSON::Field(key: "HumanLoopSummaries")]
        getter human_loop_summaries : Array(Types::HumanLoopSummary)

        # A token to display the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @human_loop_summaries : Array(Types::HumanLoopSummary),
          @next_token : String? = nil
        )
        end
      end

      # We couldn't find the requested resource. Check that your resources exists and were created in the
      # same AWS Region as your request, and try your request again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your AWS account. For a list of Amazon A2I service quotes,
      # see Amazon Augmented AI Service Quotes . Delete some resources or request an increase in your
      # service quota. You can request a quota increase using Service Quotas or the AWS Support Center. To
      # request an increase, see AWS Service Quotas in the AWS General Reference .
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct StartHumanLoopRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow definition associated with this human loop.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String

        # An object that contains information about the human loop.
        @[JSON::Field(key: "HumanLoopInput")]
        getter human_loop_input : Types::HumanLoopInput

        # The name of the human loop.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        # Attributes of the specified data. Use DataAttributes to specify if your data is free of personally
        # identifiable information and/or free of adult content.
        @[JSON::Field(key: "DataAttributes")]
        getter data_attributes : Types::HumanLoopDataAttributes?

        def initialize(
          @flow_definition_arn : String,
          @human_loop_input : Types::HumanLoopInput,
          @human_loop_name : String,
          @data_attributes : Types::HumanLoopDataAttributes? = nil
        )
        end
      end

      struct StartHumanLoopResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the human loop.
        @[JSON::Field(key: "HumanLoopArn")]
        getter human_loop_arn : String?

        def initialize(
          @human_loop_arn : String? = nil
        )
        end
      end

      struct StopHumanLoopRequest
        include JSON::Serializable

        # The name of the human loop that you want to stop.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        def initialize(
          @human_loop_name : String
        )
        end
      end

      struct StopHumanLoopResponse
        include JSON::Serializable

        def initialize
        end
      end

      # You exceeded the maximum number of requests.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request isn't valid. Check the syntax and try again.
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
