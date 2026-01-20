require "json"
require "time"

module AwsSdk
  module CodeGuruReviewer
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AssociateRepositoryRequest
        include JSON::Serializable

        # The repository to associate.

        @[JSON::Field(key: "Repository")]
        getter repository : Types::Repository

        # Amazon CodeGuru Reviewer uses this value to prevent the accidental creation of duplicate repository
        # associations if there are failures and retries.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A KMSKeyDetails object that contains: The encryption option for this repository association. It is
        # either owned by Amazon Web Services Key Management Service (KMS) ( AWS_OWNED_CMK ) or customer
        # managed ( CUSTOMER_MANAGED_CMK ). The ID of the Amazon Web Services KMS key that is associated with
        # this repository association.

        @[JSON::Field(key: "KMSKeyDetails")]
        getter kms_key_details : Types::KMSKeyDetails?

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @repository : Types::Repository,
          @client_request_token : String? = nil,
          @kms_key_details : Types::KMSKeyDetails? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct AssociateRepositoryResponse
        include JSON::Serializable

        # Information about the repository association.

        @[JSON::Field(key: "RepositoryAssociation")]
        getter repository_association : Types::RepositoryAssociation?

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @repository_association : Types::RepositoryAssociation? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A type of SourceCodeType that specifies a code diff between a source and destination branch in an
      # associated repository.

      struct BranchDiffSourceCodeType
        include JSON::Serializable

        # The destination branch for a diff in an associated repository.

        @[JSON::Field(key: "DestinationBranchName")]
        getter destination_branch_name : String

        # The source branch for a diff in an associated repository.

        @[JSON::Field(key: "SourceBranchName")]
        getter source_branch_name : String

        def initialize(
          @destination_branch_name : String,
          @source_branch_name : String
        )
        end
      end

      # Code artifacts are source code artifacts and build artifacts used in a repository analysis or a pull
      # request review. Source code artifacts are source code files in a Git repository that are compressed
      # into a .zip file. Build artifacts are .jar or .class files that are compressed in a .zip file.

      struct CodeArtifacts
        include JSON::Serializable

        # The S3 object key for a source code .zip file. This is required for all code reviews.

        @[JSON::Field(key: "SourceCodeArtifactsObjectKey")]
        getter source_code_artifacts_object_key : String

        # The S3 object key for a build artifacts .zip file that contains .jar or .class files. This is
        # required for a code review with security analysis. For more information, see Create code reviews
        # with GitHub Actions in the Amazon CodeGuru Reviewer User Guide .

        @[JSON::Field(key: "BuildArtifactsObjectKey")]
        getter build_artifacts_object_key : String?

        def initialize(
          @source_code_artifacts_object_key : String,
          @build_artifacts_object_key : String? = nil
        )
        end
      end

      # Information about an Amazon Web Services CodeCommit repository. The CodeCommit repository must be in
      # the same Amazon Web Services Region and Amazon Web Services account where its CodeGuru Reviewer code
      # reviews are configured.

      struct CodeCommitRepository
        include JSON::Serializable

        # The name of the Amazon Web Services CodeCommit repository. For more information, see repositoryName
        # in the Amazon Web Services CodeCommit API Reference .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Information about a code review. A code review belongs to the associated repository that contains
      # the reviewed code.

      struct CodeReview
        include JSON::Serializable

        # The types of analysis performed during a repository analysis or a pull request review. You can
        # specify either Security , CodeQuality , or both.

        @[JSON::Field(key: "AnalysisTypes")]
        getter analysis_types : Array(String)?

        # The Amazon Resource Name (ARN) of the RepositoryAssociation that contains the reviewed source code.
        # You can retrieve associated repository ARNs by calling ListRepositoryAssociations .

        @[JSON::Field(key: "AssociationArn")]
        getter association_arn : String?

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String?

        # The state of the aws-codeguru-reviewer.yml configuration file that allows the configuration of the
        # CodeGuru Reviewer analysis. The file either exists, doesn't exist, or exists with errors at the root
        # directory of your repository.

        @[JSON::Field(key: "ConfigFileState")]
        getter config_file_state : String?

        # The time, in milliseconds since the epoch, when the code review was created.

        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Time?

        # The time, in milliseconds since the epoch, when the code review was last updated.

        @[JSON::Field(key: "LastUpdatedTimeStamp")]
        getter last_updated_time_stamp : Time?

        # The statistics from the code review.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::Metrics?

        # The name of the code review.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the repository. For an Amazon Web Services CodeCommit repository, this is the Amazon
        # Web Services account ID of the account that owns the repository. For a GitHub, GitHub Enterprise
        # Server, or Bitbucket repository, this is the username for the account that owns the repository. For
        # an S3 repository, it can be the username or Amazon Web Services account ID.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The type of repository that contains the reviewed code (for example, GitHub or Bitbucket).

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The pull request ID for the code review.

        @[JSON::Field(key: "PullRequestId")]
        getter pull_request_id : String?

        # The name of the repository.

        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String?

        # The type of the source code for the code review.

        @[JSON::Field(key: "SourceCodeType")]
        getter source_code_type : Types::SourceCodeType?

        # The valid code review states are: Completed : The code review is complete. Pending : The code review
        # started and has not completed or failed. Failed : The code review failed. Deleting : The code review
        # is being deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason for the state of the code review.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The type of code review.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @analysis_types : Array(String)? = nil,
          @association_arn : String? = nil,
          @code_review_arn : String? = nil,
          @config_file_state : String? = nil,
          @created_time_stamp : Time? = nil,
          @last_updated_time_stamp : Time? = nil,
          @metrics : Types::Metrics? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @provider_type : String? = nil,
          @pull_request_id : String? = nil,
          @repository_name : String? = nil,
          @source_code_type : Types::SourceCodeType? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the summary of the code review.

      struct CodeReviewSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String?

        # The time, in milliseconds since the epoch, when the code review was created.

        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Time?

        # The time, in milliseconds since the epoch, when the code review was last updated.

        @[JSON::Field(key: "LastUpdatedTimeStamp")]
        getter last_updated_time_stamp : Time?

        # The statistics from the code review.

        @[JSON::Field(key: "MetricsSummary")]
        getter metrics_summary : Types::MetricsSummary?

        # The name of the code review.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the repository. For an Amazon Web Services CodeCommit repository, this is the Amazon
        # Web Services account ID of the account that owns the repository. For a GitHub, GitHub Enterprise
        # Server, or Bitbucket repository, this is the username for the account that owns the repository. For
        # an S3 repository, it can be the username or Amazon Web Services account ID.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The provider type of the repository association.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The pull request ID for the code review.

        @[JSON::Field(key: "PullRequestId")]
        getter pull_request_id : String?

        # The name of the repository.

        @[JSON::Field(key: "RepositoryName")]
        getter repository_name : String?


        @[JSON::Field(key: "SourceCodeType")]
        getter source_code_type : Types::SourceCodeType?

        # The state of the code review. The valid code review states are: Completed : The code review is
        # complete. Pending : The code review started and has not completed or failed. Failed : The code
        # review failed. Deleting : The code review is being deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The type of the code review.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @code_review_arn : String? = nil,
          @created_time_stamp : Time? = nil,
          @last_updated_time_stamp : Time? = nil,
          @metrics_summary : Types::MetricsSummary? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @provider_type : String? = nil,
          @pull_request_id : String? = nil,
          @repository_name : String? = nil,
          @source_code_type : Types::SourceCodeType? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The type of a code review. There are two code review types: PullRequest - A code review that is
      # automatically triggered by a pull request on an associated repository. RepositoryAnalysis - A code
      # review that analyzes all code under a specified branch in an associated repository. The associated
      # repository is specified using its ARN in CreateCodeReview .

      struct CodeReviewType
        include JSON::Serializable

        # A code review that analyzes all code under a specified branch in an associated repository. The
        # associated repository is specified using its ARN in CreateCodeReview .

        @[JSON::Field(key: "RepositoryAnalysis")]
        getter repository_analysis : Types::RepositoryAnalysis

        # They types of analysis performed during a repository analysis or a pull request review. You can
        # specify either Security , CodeQuality , or both.

        @[JSON::Field(key: "AnalysisTypes")]
        getter analysis_types : Array(String)?

        def initialize(
          @repository_analysis : Types::RepositoryAnalysis,
          @analysis_types : Array(String)? = nil
        )
        end
      end

      # A type of SourceCodeType that specifies the commit diff for a pull request on an associated
      # repository. The SourceCommit and DestinationCommit fields are required to do a pull request code
      # review.

      struct CommitDiffSourceCodeType
        include JSON::Serializable

        # The SHA of the destination commit used to generate a commit diff. This field is required for a pull
        # request code review.

        @[JSON::Field(key: "DestinationCommit")]
        getter destination_commit : String?

        # The SHA of the merge base of a commit.

        @[JSON::Field(key: "MergeBaseCommit")]
        getter merge_base_commit : String?

        # The SHA of the source commit used to generate a commit diff. This field is required for a pull
        # request code review.

        @[JSON::Field(key: "SourceCommit")]
        getter source_commit : String?

        def initialize(
          @destination_commit : String? = nil,
          @merge_base_commit : String? = nil,
          @source_commit : String? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateCodeReviewRequest
        include JSON::Serializable

        # The name of the code review. The name of each code review in your Amazon Web Services account must
        # be unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations . A code review can only be created on an associated repository.
        # This is the ARN of the associated repository.

        @[JSON::Field(key: "RepositoryAssociationArn")]
        getter repository_association_arn : String

        # The type of code review to create. This is specified using a CodeReviewType object. You can create a
        # code review only of type RepositoryAnalysis .

        @[JSON::Field(key: "Type")]
        getter type : Types::CodeReviewType

        # Amazon CodeGuru Reviewer uses this value to prevent the accidental creation of duplicate code
        # reviews if there are failures and retries.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @name : String,
          @repository_association_arn : String,
          @type : Types::CodeReviewType,
          @client_request_token : String? = nil
        )
        end
      end


      struct CreateCodeReviewResponse
        include JSON::Serializable


        @[JSON::Field(key: "CodeReview")]
        getter code_review : Types::CodeReview?

        def initialize(
          @code_review : Types::CodeReview? = nil
        )
        end
      end


      struct DescribeCodeReviewRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String

        def initialize(
          @code_review_arn : String
        )
        end
      end


      struct DescribeCodeReviewResponse
        include JSON::Serializable

        # Information about the code review.

        @[JSON::Field(key: "CodeReview")]
        getter code_review : Types::CodeReview?

        def initialize(
          @code_review : Types::CodeReview? = nil
        )
        end
      end


      struct DescribeRecommendationFeedbackRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String

        # The recommendation ID that can be used to track the provided recommendations and then to collect the
        # feedback.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String

        # Optional parameter to describe the feedback for a given user. If this is not supplied, it defaults
        # to the user making the request. The UserId is an IAM principal that can be specified as an Amazon
        # Web Services account ID or an Amazon Resource Name (ARN). For more information, see Specifying a
        # Principal in the Amazon Web Services Identity and Access Management User Guide .

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @code_review_arn : String,
          @recommendation_id : String,
          @user_id : String? = nil
        )
        end
      end


      struct DescribeRecommendationFeedbackResponse
        include JSON::Serializable

        # The recommendation feedback given by the user.

        @[JSON::Field(key: "RecommendationFeedback")]
        getter recommendation_feedback : Types::RecommendationFeedback?

        def initialize(
          @recommendation_feedback : Types::RecommendationFeedback? = nil
        )
        end
      end


      struct DescribeRepositoryAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "AssociationArn")]
        getter association_arn : String

        def initialize(
          @association_arn : String
        )
        end
      end


      struct DescribeRepositoryAssociationResponse
        include JSON::Serializable

        # Information about the repository association.

        @[JSON::Field(key: "RepositoryAssociation")]
        getter repository_association : Types::RepositoryAssociation?

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @repository_association : Types::RepositoryAssociation? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DisassociateRepositoryRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "AssociationArn")]
        getter association_arn : String

        def initialize(
          @association_arn : String
        )
        end
      end


      struct DisassociateRepositoryResponse
        include JSON::Serializable

        # Information about the disassociated repository.

        @[JSON::Field(key: "RepositoryAssociation")]
        getter repository_association : Types::RepositoryAssociation?

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @repository_association : Types::RepositoryAssociation? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about an event. The event might be a push, pull request, scheduled request, or another
      # type of event.

      struct EventInfo
        include JSON::Serializable

        # The name of the event. The possible names are pull_request , workflow_dispatch , schedule , and push

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of an event. The state might be open, closed, or another state.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that contains: The encryption option for a repository association. It is either owned by
      # Amazon Web Services Key Management Service (KMS) ( AWS_OWNED_CMK ) or customer managed (
      # CUSTOMER_MANAGED_CMK ). The ID of the Amazon Web Services KMS key that is associated with a
      # repository association.

      struct KMSKeyDetails
        include JSON::Serializable

        # The encryption option for a repository association. It is either owned by Amazon Web Services Key
        # Management Service (KMS) ( AWS_OWNED_CMK ) or customer managed ( CUSTOMER_MANAGED_CMK ).

        @[JSON::Field(key: "EncryptionOption")]
        getter encryption_option : String?

        # The ID of the Amazon Web Services KMS key that is associated with a repository association.

        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_option : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end


      struct ListCodeReviewsRequest
        include JSON::Serializable

        # The type of code reviews to list in the response.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The maximum number of results that are returned per call. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of provider types for filtering that needs to be applied before displaying the result. For
        # example, providerTypes=[GitHub] lists code reviews from GitHub.

        @[JSON::Field(key: "ProviderTypes")]
        getter provider_types : Array(String)?

        # List of repository names for filtering that needs to be applied before displaying the result.

        @[JSON::Field(key: "RepositoryNames")]
        getter repository_names : Array(String)?

        # List of states for filtering that needs to be applied before displaying the result. For example,
        # states=[Pending] lists code reviews in the Pending state. The valid code review states are:
        # Completed : The code review is complete. Pending : The code review started and has not completed or
        # failed. Failed : The code review failed. Deleting : The code review is being deleted.

        @[JSON::Field(key: "States")]
        getter states : Array(String)?

        def initialize(
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @provider_types : Array(String)? = nil,
          @repository_names : Array(String)? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct ListCodeReviewsResponse
        include JSON::Serializable

        # A list of code reviews that meet the criteria of the request.

        @[JSON::Field(key: "CodeReviewSummaries")]
        getter code_review_summaries : Array(Types::CodeReviewSummary)?

        # Pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @code_review_summaries : Array(Types::CodeReviewSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationFeedbackRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String

        # The maximum number of results that are returned per call. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Used to query the recommendation feedback for a given recommendation.

        @[JSON::Field(key: "RecommendationIds")]
        getter recommendation_ids : Array(String)?

        # An Amazon Web Services user's account ID or Amazon Resource Name (ARN). Use this ID to query the
        # recommendation feedback for a code review from that user. The UserId is an IAM principal that can be
        # specified as an Amazon Web Services account ID or an Amazon Resource Name (ARN). For more
        # information, see Specifying a Principal in the Amazon Web Services Identity and Access Management
        # User Guide .

        @[JSON::Field(key: "UserIds")]
        getter user_ids : Array(String)?

        def initialize(
          @code_review_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @recommendation_ids : Array(String)? = nil,
          @user_ids : Array(String)? = nil
        )
        end
      end


      struct ListRecommendationFeedbackResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Recommendation feedback summaries corresponding to the code review ARN.

        @[JSON::Field(key: "RecommendationFeedbackSummaries")]
        getter recommendation_feedback_summaries : Array(Types::RecommendationFeedbackSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_feedback_summaries : Array(Types::RecommendationFeedbackSummary)? = nil
        )
        end
      end


      struct ListRecommendationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String

        # The maximum number of results that are returned per call. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @code_review_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRecommendationsResponse
        include JSON::Serializable

        # Pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of recommendations for the requested code review.

        @[JSON::Field(key: "RecommendationSummaries")]
        getter recommendation_summaries : Array(Types::RecommendationSummary)?

        def initialize(
          @next_token : String? = nil,
          @recommendation_summaries : Array(Types::RecommendationSummary)? = nil
        )
        end
      end


      struct ListRepositoryAssociationsRequest
        include JSON::Serializable

        # The maximum number of repository association results returned by ListRepositoryAssociations in
        # paginated output. When this parameter is used, ListRepositoryAssociations only returns maxResults
        # results in a single page with a nextToken response element. The remaining results of the initial
        # request can be seen by sending another ListRepositoryAssociations request with the returned
        # nextToken value. This value can be between 1 and 100. If this parameter is not used,
        # ListRepositoryAssociations returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # List of repository names to use as a filter.

        @[JSON::Field(key: "Name")]
        getter names : Array(String)?

        # The nextToken value returned from a previous paginated ListRepositoryAssociations request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. Treat this token as an opaque
        # identifier that is only used to retrieve the next items in a list and not for other programmatic
        # purposes.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of owners to use as a filter. For Amazon Web Services CodeCommit, it is the name of the
        # CodeCommit account that was used to associate the repository. For other repository source providers,
        # such as Bitbucket and GitHub Enterprise Server, this is name of the account that was used to
        # associate the repository.

        @[JSON::Field(key: "Owner")]
        getter owners : Array(String)?

        # List of provider types to use as a filter.

        @[JSON::Field(key: "ProviderType")]
        getter provider_types : Array(String)?

        # List of repository association states to use as a filter. The valid repository association states
        # are: Associated : The repository association is complete. Associating : CodeGuru Reviewer is:
        # Setting up pull request notifications. This is required for pull requests to trigger a CodeGuru
        # Reviewer review. If your repository ProviderType is GitHub , GitHub Enterprise Server , or Bitbucket
        # , CodeGuru Reviewer creates webhooks in your repository to trigger CodeGuru Reviewer reviews. If you
        # delete these webhooks, reviews of code in your repository cannot be triggered. Setting up source
        # code access. This is required for CodeGuru Reviewer to securely clone code in your repository.
        # Failed : The repository failed to associate or disassociate. Disassociating : CodeGuru Reviewer is
        # removing the repository's pull request notifications and source code access. Disassociated :
        # CodeGuru Reviewer successfully disassociated the repository. You can create a new association with
        # this repository if you want to review source code in it later. You can control access to code
        # reviews created in anassociated repository with tags after it has been disassociated. For more
        # information, see Using tags to control access to associated repositories in the Amazon CodeGuru
        # Reviewer User Guide .

        @[JSON::Field(key: "State")]
        getter states : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil,
          @owners : Array(String)? = nil,
          @provider_types : Array(String)? = nil,
          @states : Array(String)? = nil
        )
        end
      end


      struct ListRepositoryAssociationsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListRecommendations request. When the results of a
        # ListRecommendations request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of repository associations that meet the criteria of the request.

        @[JSON::Field(key: "RepositoryAssociationSummaries")]
        getter repository_association_summaries : Array(Types::RepositoryAssociationSummary)?

        def initialize(
          @next_token : String? = nil,
          @repository_association_summaries : Array(Types::RepositoryAssociationSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the statistics from the code review.

      struct Metrics
        include JSON::Serializable

        # Total number of recommendations found in the code review.

        @[JSON::Field(key: "FindingsCount")]
        getter findings_count : Int64?

        # MeteredLinesOfCodeCount is the number of lines of code in the repository where the code review
        # happened. This does not include non-code lines such as comments and blank lines.

        @[JSON::Field(key: "MeteredLinesOfCodeCount")]
        getter metered_lines_of_code_count : Int64?

        # SuppressedLinesOfCodeCount is the number of lines of code in the repository where the code review
        # happened that CodeGuru Reviewer did not analyze. The lines suppressed in the analysis is based on
        # the excludeFiles variable in the aws-codeguru-reviewer.yml file. This number does not include
        # non-code lines such as comments and blank lines.

        @[JSON::Field(key: "SuppressedLinesOfCodeCount")]
        getter suppressed_lines_of_code_count : Int64?

        def initialize(
          @findings_count : Int64? = nil,
          @metered_lines_of_code_count : Int64? = nil,
          @suppressed_lines_of_code_count : Int64? = nil
        )
        end
      end

      # Information about metrics summaries.

      struct MetricsSummary
        include JSON::Serializable

        # Total number of recommendations found in the code review.

        @[JSON::Field(key: "FindingsCount")]
        getter findings_count : Int64?

        # Lines of code metered in the code review. For the initial code review pull request and all
        # subsequent revisions, this includes all lines of code in the files added to the pull request. In
        # subsequent revisions, for files that already existed in the pull request, this includes only the
        # changed lines of code. In both cases, this does not include non-code lines such as comments and
        # import statements. For example, if you submit a pull request containing 5 files, each with 500 lines
        # of code, and in a subsequent revision you added a new file with 200 lines of code, and also modified
        # a total of 25 lines across the initial 5 files, MeteredLinesOfCodeCount includes the first 5 files
        # (5 * 500 = 2,500 lines), the new file (200 lines) and the 25 changed lines of code for a total of
        # 2,725 lines of code.

        @[JSON::Field(key: "MeteredLinesOfCodeCount")]
        getter metered_lines_of_code_count : Int64?

        # Lines of code suppressed in the code review based on the excludeFiles element in the
        # aws-codeguru-reviewer.yml file. For full repository analyses, this number includes all lines of code
        # in the files that are suppressed. For pull requests, this number only includes the changed lines of
        # code that are suppressed. In both cases, this number does not include non-code lines such as
        # comments and import statements. For example, if you initiate a full repository analysis on a
        # repository containing 5 files, each file with 100 lines of code, and 2 files are listed as excluded
        # in the aws-codeguru-reviewer.yml file, then SuppressedLinesOfCodeCount returns 200 (2 * 100) as the
        # total number of lines of code suppressed. However, if you submit a pull request for the same
        # repository, then SuppressedLinesOfCodeCount only includes the lines in the 2 files that changed. If
        # only 1 of the 2 files changed in the pull request, then SuppressedLinesOfCodeCount returns 100 (1 *
        # 100) as the total number of lines of code suppressed.

        @[JSON::Field(key: "SuppressedLinesOfCodeCount")]
        getter suppressed_lines_of_code_count : Int64?

        def initialize(
          @findings_count : Int64? = nil,
          @metered_lines_of_code_count : Int64? = nil,
          @suppressed_lines_of_code_count : Int64? = nil
        )
        end
      end

      # The resource specified in the request was not found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutRecommendationFeedbackRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String

        # List for storing reactions. Reactions are utf-8 text code for emojis. If you send an empty list it
        # clears all your feedback.

        @[JSON::Field(key: "Reactions")]
        getter reactions : Array(String)

        # The recommendation ID that can be used to track the provided recommendations and then to collect the
        # feedback.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String

        def initialize(
          @code_review_arn : String,
          @reactions : Array(String),
          @recommendation_id : String
        )
        end
      end


      struct PutRecommendationFeedbackResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the recommendation feedback.

      struct RecommendationFeedback
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CodeReview object.

        @[JSON::Field(key: "CodeReviewArn")]
        getter code_review_arn : String?

        # The time at which the feedback was created.

        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Time?

        # The time at which the feedback was last updated.

        @[JSON::Field(key: "LastUpdatedTimeStamp")]
        getter last_updated_time_stamp : Time?

        # List for storing reactions. Reactions are utf-8 text code for emojis. You can send an empty list to
        # clear off all your feedback.

        @[JSON::Field(key: "Reactions")]
        getter reactions : Array(String)?

        # The recommendation ID that can be used to track the provided recommendations. Later on it can be
        # used to collect the feedback.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        # The ID of the user that made the API call. The UserId is an IAM principal that can be specified as
        # an Amazon Web Services account ID or an Amazon Resource Name (ARN). For more information, see
        # Specifying a Principal in the Amazon Web Services Identity and Access Management User Guide .

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @code_review_arn : String? = nil,
          @created_time_stamp : Time? = nil,
          @last_updated_time_stamp : Time? = nil,
          @reactions : Array(String)? = nil,
          @recommendation_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Information about recommendation feedback summaries.

      struct RecommendationFeedbackSummary
        include JSON::Serializable

        # List for storing reactions. Reactions are utf-8 text code for emojis.

        @[JSON::Field(key: "Reactions")]
        getter reactions : Array(String)?

        # The recommendation ID that can be used to track the provided recommendations. Later on it can be
        # used to collect the feedback.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        # The ID of the user that gave the feedback. The UserId is an IAM principal that can be specified as
        # an Amazon Web Services account ID or an Amazon Resource Name (ARN). For more information, see
        # Specifying a Principal in the Amazon Web Services Identity and Access Management User Guide .

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @reactions : Array(String)? = nil,
          @recommendation_id : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Information about recommendations.

      struct RecommendationSummary
        include JSON::Serializable

        # A description of the recommendation generated by CodeGuru Reviewer for the lines of code between the
        # start line and the end line.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Last line where the recommendation is applicable in the source commit or source branch. For a single
        # line comment the start line and end line values are the same.

        @[JSON::Field(key: "EndLine")]
        getter end_line : Int32?

        # Name of the file on which a recommendation is provided.

        @[JSON::Field(key: "FilePath")]
        getter file_path : String?

        # The type of a recommendation.

        @[JSON::Field(key: "RecommendationCategory")]
        getter recommendation_category : String?

        # The recommendation ID that can be used to track the provided recommendations. Later on it can be
        # used to collect the feedback.

        @[JSON::Field(key: "RecommendationId")]
        getter recommendation_id : String?

        # Metadata about a rule. Rule metadata includes an ID, a name, a list of tags, and a short and long
        # description. CodeGuru Reviewer uses rules to analyze code. A rule's recommendation is included in
        # analysis results if code is detected that violates the rule.

        @[JSON::Field(key: "RuleMetadata")]
        getter rule_metadata : Types::RuleMetadata?

        # The severity of the issue in the code that generated this recommendation.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # Start line from where the recommendation is applicable in the source commit or source branch.

        @[JSON::Field(key: "StartLine")]
        getter start_line : Int32?

        def initialize(
          @description : String? = nil,
          @end_line : Int32? = nil,
          @file_path : String? = nil,
          @recommendation_category : String? = nil,
          @recommendation_id : String? = nil,
          @rule_metadata : Types::RuleMetadata? = nil,
          @severity : String? = nil,
          @start_line : Int32? = nil
        )
        end
      end

      # Information about an associated Amazon Web Services CodeCommit repository or an associated
      # repository that is managed by Amazon Web Services CodeStar Connections (for example, Bitbucket).
      # This Repository object is not used if your source code is in an associated GitHub repository.

      struct Repository
        include JSON::Serializable

        # Information about a Bitbucket repository.

        @[JSON::Field(key: "Bitbucket")]
        getter bitbucket : Types::ThirdPartySourceRepository?

        # Information about an Amazon Web Services CodeCommit repository.

        @[JSON::Field(key: "CodeCommit")]
        getter code_commit : Types::CodeCommitRepository?

        # Information about a GitHub Enterprise Server repository.

        @[JSON::Field(key: "GitHubEnterpriseServer")]
        getter git_hub_enterprise_server : Types::ThirdPartySourceRepository?


        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : Types::S3Repository?

        def initialize(
          @bitbucket : Types::ThirdPartySourceRepository? = nil,
          @code_commit : Types::CodeCommitRepository? = nil,
          @git_hub_enterprise_server : Types::ThirdPartySourceRepository? = nil,
          @s3_bucket : Types::S3Repository? = nil
        )
        end
      end

      # A code review type that analyzes all code under a specified branch in an associated repository. The
      # associated repository is specified using its ARN when you call CreateCodeReview .

      struct RepositoryAnalysis
        include JSON::Serializable

        # A SourceCodeType that specifies the tip of a branch in an associated repository.

        @[JSON::Field(key: "RepositoryHead")]
        getter repository_head : Types::RepositoryHeadSourceCodeType?


        @[JSON::Field(key: "SourceCodeType")]
        getter source_code_type : Types::SourceCodeType?

        def initialize(
          @repository_head : Types::RepositoryHeadSourceCodeType? = nil,
          @source_code_type : Types::SourceCodeType? = nil
        )
        end
      end

      # Information about a repository association. The DescribeRepositoryAssociation operation returns a
      # RepositoryAssociation object.

      struct RepositoryAssociation
        include JSON::Serializable

        # The Amazon Resource Name (ARN) identifying the repository association.

        @[JSON::Field(key: "AssociationArn")]
        getter association_arn : String?

        # The ID of the repository association.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar Connections connection. Its format
        # is arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id . For more
        # information, see Connection in the Amazon Web Services CodeStar Connections API Reference .

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The time, in milliseconds since the epoch, when the repository association was created.

        @[JSON::Field(key: "CreatedTimeStamp")]
        getter created_time_stamp : Time?

        # A KMSKeyDetails object that contains: The encryption option for this repository association. It is
        # either owned by Amazon Web Services Key Management Service (KMS) ( AWS_OWNED_CMK ) or customer
        # managed ( CUSTOMER_MANAGED_CMK ). The ID of the Amazon Web Services KMS key that is associated with
        # this repository association.

        @[JSON::Field(key: "KMSKeyDetails")]
        getter kms_key_details : Types::KMSKeyDetails?

        # The time, in milliseconds since the epoch, when the repository association was last updated.

        @[JSON::Field(key: "LastUpdatedTimeStamp")]
        getter last_updated_time_stamp : Time?

        # The name of the repository.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the repository. For an Amazon Web Services CodeCommit repository, this is the Amazon
        # Web Services account ID of the account that owns the repository. For a GitHub, GitHub Enterprise
        # Server, or Bitbucket repository, this is the username for the account that owns the repository. For
        # an S3 repository, it can be the username or Amazon Web Services account ID.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The provider type of the repository association.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?


        @[JSON::Field(key: "S3RepositoryDetails")]
        getter s3_repository_details : Types::S3RepositoryDetails?

        # The state of the repository association. The valid repository association states are: Associated :
        # The repository association is complete. Associating : CodeGuru Reviewer is: Setting up pull request
        # notifications. This is required for pull requests to trigger a CodeGuru Reviewer review. If your
        # repository ProviderType is GitHub , GitHub Enterprise Server , or Bitbucket , CodeGuru Reviewer
        # creates webhooks in your repository to trigger CodeGuru Reviewer reviews. If you delete these
        # webhooks, reviews of code in your repository cannot be triggered. Setting up source code access.
        # This is required for CodeGuru Reviewer to securely clone code in your repository. Failed : The
        # repository failed to associate or disassociate. Disassociating : CodeGuru Reviewer is removing the
        # repository's pull request notifications and source code access. Disassociated : CodeGuru Reviewer
        # successfully disassociated the repository. You can create a new association with this repository if
        # you want to review source code in it later. You can control access to code reviews created in
        # anassociated repository with tags after it has been disassociated. For more information, see Using
        # tags to control access to associated repositories in the Amazon CodeGuru Reviewer User Guide .

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description of why the repository association is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @connection_arn : String? = nil,
          @created_time_stamp : Time? = nil,
          @kms_key_details : Types::KMSKeyDetails? = nil,
          @last_updated_time_stamp : Time? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @provider_type : String? = nil,
          @s3_repository_details : Types::S3RepositoryDetails? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # Summary information about a repository association. The ListRepositoryAssociations operation returns
      # a list of RepositoryAssociationSummary objects.

      struct RepositoryAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "AssociationArn")]
        getter association_arn : String?

        # The repository association ID.

        @[JSON::Field(key: "AssociationId")]
        getter association_id : String?

        # The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar Connections connection. Its format
        # is arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id . For more
        # information, see Connection in the Amazon Web Services CodeStar Connections API Reference .

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The time, in milliseconds since the epoch, since the repository association was last updated.

        @[JSON::Field(key: "LastUpdatedTimeStamp")]
        getter last_updated_time_stamp : Time?

        # The name of the repository association.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The owner of the repository. For an Amazon Web Services CodeCommit repository, this is the Amazon
        # Web Services account ID of the account that owns the repository. For a GitHub, GitHub Enterprise
        # Server, or Bitbucket repository, this is the username for the account that owns the repository. For
        # an S3 repository, it can be the username or Amazon Web Services account ID.

        @[JSON::Field(key: "Owner")]
        getter owner : String?

        # The provider type of the repository association.

        @[JSON::Field(key: "ProviderType")]
        getter provider_type : String?

        # The state of the repository association. The valid repository association states are: Associated :
        # The repository association is complete. Associating : CodeGuru Reviewer is: Setting up pull request
        # notifications. This is required for pull requests to trigger a CodeGuru Reviewer review. If your
        # repository ProviderType is GitHub , GitHub Enterprise Server , or Bitbucket , CodeGuru Reviewer
        # creates webhooks in your repository to trigger CodeGuru Reviewer reviews. If you delete these
        # webhooks, reviews of code in your repository cannot be triggered. Setting up source code access.
        # This is required for CodeGuru Reviewer to securely clone code in your repository. Failed : The
        # repository failed to associate or disassociate. Disassociating : CodeGuru Reviewer is removing the
        # repository's pull request notifications and source code access. Disassociated : CodeGuru Reviewer
        # successfully disassociated the repository. You can create a new association with this repository if
        # you want to review source code in it later. You can control access to code reviews created in
        # anassociated repository with tags after it has been disassociated. For more information, see Using
        # tags to control access to associated repositories in the Amazon CodeGuru Reviewer User Guide .

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @association_arn : String? = nil,
          @association_id : String? = nil,
          @connection_arn : String? = nil,
          @last_updated_time_stamp : Time? = nil,
          @name : String? = nil,
          @owner : String? = nil,
          @provider_type : String? = nil,
          @state : String? = nil
        )
        end
      end

      # A SourceCodeType that specifies the tip of a branch in an associated repository.

      struct RepositoryHeadSourceCodeType
        include JSON::Serializable

        # The name of the branch in an associated repository. The RepositoryHeadSourceCodeType specifies the
        # tip of this branch.

        @[JSON::Field(key: "BranchName")]
        getter branch_name : String

        def initialize(
          @branch_name : String
        )
        end
      end

      # Metadata that is associated with a code review. This applies to both pull request and repository
      # analysis code reviews.

      struct RequestMetadata
        include JSON::Serializable

        # Information about the event associated with a code review.

        @[JSON::Field(key: "EventInfo")]
        getter event_info : Types::EventInfo?

        # The ID of the request. This is required for a pull request code review.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # An identifier, such as a name or account ID, that is associated with the requester. The Requester is
        # used to capture the author/actor name of the event request.

        @[JSON::Field(key: "Requester")]
        getter requester : String?

        # The name of the repository vendor used to upload code to an S3 bucket for a CI/CD code review. For
        # example, if code and artifacts are uploaded to an S3 bucket for a CI/CD code review by GitHub
        # scripts from a GitHub repository, then the repository association's ProviderType is S3Bucket and the
        # CI/CD repository vendor name is GitHub. For more information, see the definition for ProviderType in
        # RepositoryAssociation .

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        def initialize(
          @event_info : Types::EventInfo? = nil,
          @request_id : String? = nil,
          @requester : String? = nil,
          @vendor_name : String? = nil
        )
        end
      end

      # The resource specified in the request was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata about a rule. Rule metadata includes an ID, a name, a list of tags, and a short and long
      # description. CodeGuru Reviewer uses rules to analyze code. A rule's recommendation is included in
      # analysis results if code is detected that violates the rule.

      struct RuleMetadata
        include JSON::Serializable

        # A long description of the rule.

        @[JSON::Field(key: "LongDescription")]
        getter long_description : String?

        # The ID of the rule.

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String?

        # The name of the rule.

        @[JSON::Field(key: "RuleName")]
        getter rule_name : String?

        # Tags that are associated with the rule.

        @[JSON::Field(key: "RuleTags")]
        getter rule_tags : Array(String)?

        # A short description of the rule.

        @[JSON::Field(key: "ShortDescription")]
        getter short_description : String?

        def initialize(
          @long_description : String? = nil,
          @rule_id : String? = nil,
          @rule_name : String? = nil,
          @rule_tags : Array(String)? = nil,
          @short_description : String? = nil
        )
        end
      end

      # Information about an associated repository in an S3 bucket. The associated repository contains a
      # source code .zip file and a build artifacts .zip file that contains .jar or .class files.

      struct S3BucketRepository
        include JSON::Serializable

        # The name of the repository when the ProviderType is S3Bucket .

        @[JSON::Field(key: "Name")]
        getter name : String

        # An S3RepositoryDetails object that specifies the name of an S3 bucket and a CodeArtifacts object.
        # The CodeArtifacts object includes the S3 object keys for a source code .zip file and for a build
        # artifacts .zip file.

        @[JSON::Field(key: "Details")]
        getter details : Types::S3RepositoryDetails?

        def initialize(
          @name : String,
          @details : Types::S3RepositoryDetails? = nil
        )
        end
      end

      # Information about a repository in an S3 bucket.

      struct S3Repository
        include JSON::Serializable

        # The name of the S3 bucket used for associating a new S3 repository. It must begin with
        # codeguru-reviewer- .

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # The name of the repository in the S3 bucket.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @bucket_name : String,
          @name : String
        )
        end
      end

      # Specifies the name of an S3 bucket and a CodeArtifacts object that contains the S3 object keys for a
      # source code .zip file and for a build artifacts .zip file that contains .jar or .class files.

      struct S3RepositoryDetails
        include JSON::Serializable

        # The name of the S3 bucket used for associating a new S3 repository. It must begin with
        # codeguru-reviewer- .

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # A CodeArtifacts object. The CodeArtifacts object includes the S3 object key for a source code .zip
        # file and for a build artifacts .zip file that contains .jar or .class files.

        @[JSON::Field(key: "CodeArtifacts")]
        getter code_artifacts : Types::CodeArtifacts?

        def initialize(
          @bucket_name : String? = nil,
          @code_artifacts : Types::CodeArtifacts? = nil
        )
        end
      end

      # Specifies the source code that is analyzed in a code review.

      struct SourceCodeType
        include JSON::Serializable

        # A type of SourceCodeType that specifies a source branch name and a destination branch name in an
        # associated repository.

        @[JSON::Field(key: "BranchDiff")]
        getter branch_diff : Types::BranchDiffSourceCodeType?

        # A SourceCodeType that specifies a commit diff created by a pull request on an associated repository.

        @[JSON::Field(key: "CommitDiff")]
        getter commit_diff : Types::CommitDiffSourceCodeType?


        @[JSON::Field(key: "RepositoryHead")]
        getter repository_head : Types::RepositoryHeadSourceCodeType?

        # Metadata that is associated with a code review. This applies to any type of code review supported by
        # CodeGuru Reviewer. The RequestMetadaa field captures any event metadata. For example, it might
        # capture metadata associated with an event trigger, such as a push or a pull request.

        @[JSON::Field(key: "RequestMetadata")]
        getter request_metadata : Types::RequestMetadata?

        # Information about an associated repository in an S3 bucket that includes its name and an
        # S3RepositoryDetails object. The S3RepositoryDetails object includes the name of an S3 bucket, an S3
        # key for a source code .zip file, and an S3 key for a build artifacts .zip file. S3BucketRepository
        # is required in SourceCodeType for S3BucketRepository based code reviews.

        @[JSON::Field(key: "S3BucketRepository")]
        getter s3_bucket_repository : Types::S3BucketRepository?

        def initialize(
          @branch_diff : Types::BranchDiffSourceCodeType? = nil,
          @commit_diff : Types::CommitDiffSourceCodeType? = nil,
          @repository_head : Types::RepositoryHeadSourceCodeType? = nil,
          @request_metadata : Types::RequestMetadata? = nil,
          @s3_bucket_repository : Types::S3BucketRepository? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # An array of key-value pairs used to tag an associated repository. A tag is a custom attribute label
        # with two parts: A tag key (for example, CostCenter , Environment , Project , or Secret ). Tag keys
        # are case sensitive. An optional field known as a tag value (for example, 111122223333 , Production ,
        # or a team name). Omitting the tag value is the same as using an empty string. Like tag keys, tag
        # values are case sensitive.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @tags : Hash(String, String),
          @resource_arn : String
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a third-party source repository connected to CodeGuru Reviewer.

      struct ThirdPartySourceRepository
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon Web Services CodeStar Connections connection. Its format
        # is arn:aws:codestar-connections:region-id:aws-account_id:connection/connection-id . For more
        # information, see Connection in the Amazon Web Services CodeStar Connections API Reference .

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # The name of the third party source repository.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The owner of the repository. For a GitHub, GitHub Enterprise, or Bitbucket repository, this is the
        # username for the account that owns the repository. For an S3 repository, this can be the username or
        # Amazon Web Services account ID

        @[JSON::Field(key: "Owner")]
        getter owner : String

        def initialize(
          @connection_arn : String,
          @name : String,
          @owner : String
        )
        end
      end

      # The request was denied due to request throttling.

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

        # A list of the keys for each tag you want to remove from an associated repository.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        # The Amazon Resource Name (ARN) of the RepositoryAssociation object. You can retrieve this ARN by
        # calling ListRepositoryAssociations .

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @tag_keys : Array(String),
          @resource_arn : String
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the specified constraints.

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
