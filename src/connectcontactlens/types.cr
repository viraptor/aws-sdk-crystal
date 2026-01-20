require "json"

module Aws
  module ConnectContactLens
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides the category rules that are used to automatically categorize contacts based on uttered
      # keywords and phrases.

      struct Categories
        include JSON::Serializable

        # The category rules that have been matched in the analyzed segment.

        @[JSON::Field(key: "MatchedCategories")]
        getter matched_categories : Array(String)

        # The category rule that was matched and when it occurred in the transcript.

        @[JSON::Field(key: "MatchedDetails")]
        getter matched_details : Hash(String, Types::CategoryDetails)

        def initialize(
          @matched_categories : Array(String),
          @matched_details : Hash(String, Types::CategoryDetails)
        )
        end
      end

      # Provides information about the category rule that was matched.

      struct CategoryDetails
        include JSON::Serializable

        # The section of audio where the category rule was detected.

        @[JSON::Field(key: "PointsOfInterest")]
        getter points_of_interest : Array(Types::PointOfInterest)

        def initialize(
          @points_of_interest : Array(Types::PointOfInterest)
        )
        end
      end

      # For characters that were detected as issues, where they occur in the transcript.

      struct CharacterOffsets
        include JSON::Serializable

        # The beginning of the issue.

        @[JSON::Field(key: "BeginOffsetChar")]
        getter begin_offset_char : Int32

        # The end of the issue.

        @[JSON::Field(key: "EndOffsetChar")]
        getter end_offset_char : Int32

        def initialize(
          @begin_offset_char : Int32,
          @end_offset_char : Int32
        )
        end
      end

      # Request processing failed due to an error or failure with the service.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is not valid.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Potential issues that are detected based on an artificial intelligence analysis of each turn in the
      # conversation.

      struct IssueDetected
        include JSON::Serializable

        # The offset for when the issue was detected in the segment.

        @[JSON::Field(key: "CharacterOffsets")]
        getter character_offsets : Types::CharacterOffsets

        def initialize(
          @character_offsets : Types::CharacterOffsets
        )
        end
      end


      struct ListRealtimeContactAnalysisSegmentsRequest
        include JSON::Serializable

        # The identifier of the contact.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The identifier of the Amazon Connect instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The maximum number of results to return per page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contact_id : String,
          @instance_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRealtimeContactAnalysisSegmentsResponse
        include JSON::Serializable

        # An analyzed transcript or category.

        @[JSON::Field(key: "Segments")]
        getter segments : Array(Types::RealtimeContactAnalysisSegment)

        # If there are additional results, this is the token for the next set of results. If response includes
        # nextToken there are two possible scenarios: There are more segments so another call is required to
        # get them. There are no more segments at this time, but more may be available later (real-time
        # analysis is in progress) so the client should call the operation again to get new segments. If
        # response does not include nextToken , the analysis is completed (successfully or failed) and there
        # are no more segments to retrieve.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @segments : Array(Types::RealtimeContactAnalysisSegment),
          @next_token : String? = nil
        )
        end
      end

      # The section of the contact audio where that category rule was detected.

      struct PointOfInterest
        include JSON::Serializable

        # The beginning offset in milliseconds where the category rule was detected.

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int32

        # The ending offset in milliseconds where the category rule was detected.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int32

        def initialize(
          @begin_offset_millis : Int32,
          @end_offset_millis : Int32
        )
        end
      end

      # Information about the post-contact summary.

      struct PostContactSummary
        include JSON::Serializable

        # Whether the summary was successfully COMPLETED or FAILED to be generated.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The content of the summary.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # If the summary failed to be generated, one of the following failure codes occurs: QUOTA_EXCEEDED :
        # The number of concurrent analytics jobs reached your service quota.
        # INSUFFICIENT_CONVERSATION_CONTENT : The conversation needs to have at least one turn from both the
        # participants in order to generate the summary. FAILED_SAFETY_GUIDELINES : The generated summary
        # cannot be provided because it failed to meet system safety guidelines.
        # INVALID_ANALYSIS_CONFIGURATION : This code occurs when, for example, you're using a language that
        # isn't supported by generative AI-powered post-contact summaries. INTERNAL_ERROR : Internal system
        # error.

        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        def initialize(
          @status : String,
          @content : String? = nil,
          @failure_code : String? = nil
        )
        end
      end

      # An analyzed segment for a real-time analysis session.

      struct RealtimeContactAnalysisSegment
        include JSON::Serializable

        # The matched category rules.

        @[JSON::Field(key: "Categories")]
        getter categories : Types::Categories?

        # Information about the post-contact summary.

        @[JSON::Field(key: "PostContactSummary")]
        getter post_contact_summary : Types::PostContactSummary?

        # The analyzed transcript.

        @[JSON::Field(key: "Transcript")]
        getter transcript : Types::Transcript?

        def initialize(
          @categories : Types::Categories? = nil,
          @post_contact_summary : Types::PostContactSummary? = nil,
          @transcript : Types::Transcript? = nil
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The throttling limit has been exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A list of messages in the session.

      struct Transcript
        include JSON::Serializable

        # The beginning offset in the contact for this transcript.

        @[JSON::Field(key: "BeginOffsetMillis")]
        getter begin_offset_millis : Int32

        # The content of the transcript.

        @[JSON::Field(key: "Content")]
        getter content : String

        # The end offset in the contact for this transcript.

        @[JSON::Field(key: "EndOffsetMillis")]
        getter end_offset_millis : Int32

        # The identifier of the transcript.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the participant. Valid values are CUSTOMER or AGENT.

        @[JSON::Field(key: "ParticipantId")]
        getter participant_id : String

        # The role of participant. For example, is it a customer, agent, or system.

        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String

        # List of positions where issues were detected on the transcript.

        @[JSON::Field(key: "IssuesDetected")]
        getter issues_detected : Array(Types::IssueDetected)?

        # The sentiment detected for this piece of transcript.

        @[JSON::Field(key: "Sentiment")]
        getter sentiment : String?

        def initialize(
          @begin_offset_millis : Int32,
          @content : String,
          @end_offset_millis : Int32,
          @id : String,
          @participant_id : String,
          @participant_role : String,
          @issues_detected : Array(Types::IssueDetected)? = nil,
          @sentiment : String? = nil
        )
        end
      end
    end
  end
end
