module AwsSdk
  module CodeGuruReviewer
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Use to associate an Amazon Web Services CodeCommit repository or a repository managed by Amazon Web
      # Services CodeStar Connections with Amazon CodeGuru Reviewer. When you associate a repository,
      # CodeGuru Reviewer reviews source code changes in the repository's pull requests and provides
      # automatic recommendations. You can view recommendations using the CodeGuru Reviewer console. For
      # more information, see Recommendations in Amazon CodeGuru Reviewer in the Amazon CodeGuru Reviewer
      # User Guide. If you associate a CodeCommit or S3 repository, it must be in the same Amazon Web
      # Services Region and Amazon Web Services account where its CodeGuru Reviewer code reviews are
      # configured. Bitbucket and GitHub Enterprise Server repositories are managed by Amazon Web Services
      # CodeStar Connections to connect to CodeGuru Reviewer. For more information, see Associate a
      # repository in the Amazon CodeGuru Reviewer User Guide. You cannot use the CodeGuru Reviewer SDK or
      # the Amazon Web Services CLI to associate a GitHub repository with Amazon CodeGuru Reviewer. To
      # associate a GitHub repository, use the console. For more information, see Getting started with
      # CodeGuru Reviewer in the CodeGuru Reviewer User Guide.

      def associate_repository(
        repository : Types::Repository,
        client_request_token : String? = nil,
        kms_key_details : Types::KMSKeyDetails? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::AssociateRepositoryRequest.new(repository: repository, client_request_token: client_request_token, kms_key_details: kms_key_details, tags: tags)
        associate_repository(input)
      end

      def associate_repository(input : Types::AssociateRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use to create a code review with a CodeReviewType of RepositoryAnalysis . This type of code review
      # analyzes all code under a specified branch in an associated repository. PullRequest code reviews are
      # automatically triggered by a pull request.

      def create_code_review(
        name : String,
        repository_association_arn : String,
        type : Types::CodeReviewType,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateCodeReviewRequest.new(name: name, repository_association_arn: repository_association_arn, type: type, client_request_token: client_request_token)
        create_code_review(input)
      end

      def create_code_review(input : Types::CreateCodeReviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CODE_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the metadata associated with the code review along with its status.

      def describe_code_review(
        code_review_arn : String
      ) : Protocol::Request
        input = Types::DescribeCodeReviewRequest.new(code_review_arn: code_review_arn)
        describe_code_review(input)
      end

      def describe_code_review(input : Types::DescribeCodeReviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CODE_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the customer feedback for a CodeGuru Reviewer recommendation.

      def describe_recommendation_feedback(
        code_review_arn : String,
        recommendation_id : String,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRecommendationFeedbackRequest.new(code_review_arn: code_review_arn, recommendation_id: recommendation_id, user_id: user_id)
        describe_recommendation_feedback(input)
      end

      def describe_recommendation_feedback(input : Types::DescribeRecommendationFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RECOMMENDATION_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a RepositoryAssociation object that contains information about the requested repository
      # association.

      def describe_repository_association(
        association_arn : String
      ) : Protocol::Request
        input = Types::DescribeRepositoryAssociationRequest.new(association_arn: association_arn)
        describe_repository_association(input)
      end

      def describe_repository_association(input : Types::DescribeRepositoryAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REPOSITORY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between Amazon CodeGuru Reviewer and a repository.

      def disassociate_repository(
        association_arn : String
      ) : Protocol::Request
        input = Types::DisassociateRepositoryRequest.new(association_arn: association_arn)
        disassociate_repository(input)
      end

      def disassociate_repository(input : Types::DisassociateRepositoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_REPOSITORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the code reviews that the customer has created in the past 90 days.

      def list_code_reviews(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provider_types : Array(String)? = nil,
        repository_names : Array(String)? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListCodeReviewsRequest.new(type: type, max_results: max_results, next_token: next_token, provider_types: provider_types, repository_names: repository_names, states: states)
        list_code_reviews(input)
      end

      def list_code_reviews(input : Types::ListCodeReviewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CODE_REVIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of RecommendationFeedbackSummary objects that contain customer recommendation
      # feedback for all CodeGuru Reviewer users.

      def list_recommendation_feedback(
        code_review_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recommendation_ids : Array(String)? = nil,
        user_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationFeedbackRequest.new(code_review_arn: code_review_arn, max_results: max_results, next_token: next_token, recommendation_ids: recommendation_ids, user_ids: user_ids)
        list_recommendation_feedback(input)
      end

      def list_recommendation_feedback(input : Types::ListRecommendationFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATION_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of all recommendations for a completed code review.

      def list_recommendations(
        code_review_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationsRequest.new(code_review_arn: code_review_arn, max_results: max_results, next_token: next_token)
        list_recommendations(input)
      end

      def list_recommendations(input : Types::ListRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of RepositoryAssociationSummary objects that contain summary information about a
      # repository association. You can filter the returned list by ProviderType , Name , State , and Owner
      # .

      def list_repository_associations(
        max_results : Int32? = nil,
        names : Array(String)? = nil,
        next_token : String? = nil,
        owners : Array(String)? = nil,
        provider_types : Array(String)? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListRepositoryAssociationsRequest.new(max_results: max_results, names: names, next_token: next_token, owners: owners, provider_types: provider_types, states: states)
        list_repository_associations(input)
      end

      def list_repository_associations(input : Types::ListRepositoryAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPOSITORY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the list of tags associated with an associated repository resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stores customer feedback for a CodeGuru Reviewer recommendation. When this API is called again with
      # different reactions the previous feedback is overwritten.

      def put_recommendation_feedback(
        code_review_arn : String,
        reactions : Array(String),
        recommendation_id : String
      ) : Protocol::Request
        input = Types::PutRecommendationFeedbackRequest.new(code_review_arn: code_review_arn, reactions: reactions, recommendation_id: recommendation_id)
        put_recommendation_feedback(input)
      end

      def put_recommendation_feedback(input : Types::PutRecommendationFeedbackRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RECOMMENDATION_FEEDBACK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to an associated repository.

      def tag_resource(
        tags : Hash(String, String),
        resource_arn : String
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(tags: tags, resource_arn: resource_arn)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from an associated repository.

      def untag_resource(
        tag_keys : Array(String),
        resource_arn : String
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(tag_keys: tag_keys, resource_arn: resource_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
