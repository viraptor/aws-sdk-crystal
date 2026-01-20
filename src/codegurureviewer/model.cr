module Aws
  module CodeGuruReviewer
    module Model
      API_VERSION = "2019-09-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "codeguru-reviewer"
      ENDPOINT_PREFIX = "codeguru-reviewer"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-reviewer-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-reviewer-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codeguru-reviewer.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codeguru-reviewer.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_REPOSITORY = OperationModel.new(
        name: "AssociateRepository",
        http_method: "POST",
        request_uri: "/associations"
      )

      CREATE_CODE_REVIEW = OperationModel.new(
        name: "CreateCodeReview",
        http_method: "POST",
        request_uri: "/codereviews"
      )

      DESCRIBE_CODE_REVIEW = OperationModel.new(
        name: "DescribeCodeReview",
        http_method: "GET",
        request_uri: "/codereviews/{CodeReviewArn}"
      )

      DESCRIBE_RECOMMENDATION_FEEDBACK = OperationModel.new(
        name: "DescribeRecommendationFeedback",
        http_method: "GET",
        request_uri: "/feedback/{CodeReviewArn}"
      )

      DESCRIBE_REPOSITORY_ASSOCIATION = OperationModel.new(
        name: "DescribeRepositoryAssociation",
        http_method: "GET",
        request_uri: "/associations/{AssociationArn}"
      )

      DISASSOCIATE_REPOSITORY = OperationModel.new(
        name: "DisassociateRepository",
        http_method: "DELETE",
        request_uri: "/associations/{AssociationArn}"
      )

      LIST_CODE_REVIEWS = OperationModel.new(
        name: "ListCodeReviews",
        http_method: "GET",
        request_uri: "/codereviews"
      )

      LIST_RECOMMENDATION_FEEDBACK = OperationModel.new(
        name: "ListRecommendationFeedback",
        http_method: "GET",
        request_uri: "/feedback/{CodeReviewArn}/RecommendationFeedback"
      )

      LIST_RECOMMENDATIONS = OperationModel.new(
        name: "ListRecommendations",
        http_method: "GET",
        request_uri: "/codereviews/{CodeReviewArn}/Recommendations"
      )

      LIST_REPOSITORY_ASSOCIATIONS = OperationModel.new(
        name: "ListRepositoryAssociations",
        http_method: "GET",
        request_uri: "/associations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_RECOMMENDATION_FEEDBACK = OperationModel.new(
        name: "PutRecommendationFeedback",
        http_method: "PUT",
        request_uri: "/feedback"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )
    end
  end
end
