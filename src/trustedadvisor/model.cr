module Aws
  module TrustedAdvisor
    module Model
      API_VERSION = "2022-09-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "trustedadvisor"
      ENDPOINT_PREFIX = "trustedadvisor"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://trustedadvisor-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://trustedadvisor-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://trustedadvisor.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://trustedadvisor.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_UPDATE_RECOMMENDATION_RESOURCE_EXCLUSION = OperationModel.new(
        name: "BatchUpdateRecommendationResourceExclusion",
        http_method: "PUT",
        request_uri: "/v1/batch-update-recommendation-resource-exclusion"
      )

      GET_ORGANIZATION_RECOMMENDATION = OperationModel.new(
        name: "GetOrganizationRecommendation",
        http_method: "GET",
        request_uri: "/v1/organization-recommendations/{organizationRecommendationIdentifier}"
      )

      GET_RECOMMENDATION = OperationModel.new(
        name: "GetRecommendation",
        http_method: "GET",
        request_uri: "/v1/recommendations/{recommendationIdentifier}"
      )

      LIST_CHECKS = OperationModel.new(
        name: "ListChecks",
        http_method: "GET",
        request_uri: "/v1/checks"
      )

      LIST_ORGANIZATION_RECOMMENDATION_ACCOUNTS = OperationModel.new(
        name: "ListOrganizationRecommendationAccounts",
        http_method: "GET",
        request_uri: "/v1/organization-recommendations/{organizationRecommendationIdentifier}/accounts"
      )

      LIST_ORGANIZATION_RECOMMENDATION_RESOURCES = OperationModel.new(
        name: "ListOrganizationRecommendationResources",
        http_method: "GET",
        request_uri: "/v1/organization-recommendations/{organizationRecommendationIdentifier}/resources"
      )

      LIST_ORGANIZATION_RECOMMENDATIONS = OperationModel.new(
        name: "ListOrganizationRecommendations",
        http_method: "GET",
        request_uri: "/v1/organization-recommendations"
      )

      LIST_RECOMMENDATION_RESOURCES = OperationModel.new(
        name: "ListRecommendationResources",
        http_method: "GET",
        request_uri: "/v1/recommendations/{recommendationIdentifier}/resources"
      )

      LIST_RECOMMENDATIONS = OperationModel.new(
        name: "ListRecommendations",
        http_method: "GET",
        request_uri: "/v1/recommendations"
      )

      UPDATE_ORGANIZATION_RECOMMENDATION_LIFECYCLE = OperationModel.new(
        name: "UpdateOrganizationRecommendationLifecycle",
        http_method: "PUT",
        request_uri: "/v1/organization-recommendations/{organizationRecommendationIdentifier}/lifecycle"
      )

      UPDATE_RECOMMENDATION_LIFECYCLE = OperationModel.new(
        name: "UpdateRecommendationLifecycle",
        http_method: "PUT",
        request_uri: "/v1/recommendations/{recommendationIdentifier}/lifecycle"
      )
    end
  end
end
