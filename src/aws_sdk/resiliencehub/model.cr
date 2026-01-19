module AwsSdk
  module Resiliencehub
    module Model
      API_VERSION = "2020-04-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "resiliencehub"
      ENDPOINT_PREFIX = "resiliencehub"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resiliencehub-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resiliencehub-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://resiliencehub.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://resiliencehub.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_RESOURCE_GROUPING_RECOMMENDATIONS = OperationModel.new(
        name: "AcceptResourceGroupingRecommendations",
        http_method: "POST",
        request_uri: "/accept-resource-grouping-recommendations"
      )

      ADD_DRAFT_APP_VERSION_RESOURCE_MAPPINGS = OperationModel.new(
        name: "AddDraftAppVersionResourceMappings",
        http_method: "POST",
        request_uri: "/add-draft-app-version-resource-mappings"
      )

      BATCH_UPDATE_RECOMMENDATION_STATUS = OperationModel.new(
        name: "BatchUpdateRecommendationStatus",
        http_method: "POST",
        request_uri: "/batch-update-recommendation-status"
      )

      CREATE_APP = OperationModel.new(
        name: "CreateApp",
        http_method: "POST",
        request_uri: "/create-app"
      )

      CREATE_APP_VERSION_APP_COMPONENT = OperationModel.new(
        name: "CreateAppVersionAppComponent",
        http_method: "POST",
        request_uri: "/create-app-version-app-component"
      )

      CREATE_APP_VERSION_RESOURCE = OperationModel.new(
        name: "CreateAppVersionResource",
        http_method: "POST",
        request_uri: "/create-app-version-resource"
      )

      CREATE_RECOMMENDATION_TEMPLATE = OperationModel.new(
        name: "CreateRecommendationTemplate",
        http_method: "POST",
        request_uri: "/create-recommendation-template"
      )

      CREATE_RESILIENCY_POLICY = OperationModel.new(
        name: "CreateResiliencyPolicy",
        http_method: "POST",
        request_uri: "/create-resiliency-policy"
      )

      DELETE_APP = OperationModel.new(
        name: "DeleteApp",
        http_method: "POST",
        request_uri: "/delete-app"
      )

      DELETE_APP_ASSESSMENT = OperationModel.new(
        name: "DeleteAppAssessment",
        http_method: "POST",
        request_uri: "/delete-app-assessment"
      )

      DELETE_APP_INPUT_SOURCE = OperationModel.new(
        name: "DeleteAppInputSource",
        http_method: "POST",
        request_uri: "/delete-app-input-source"
      )

      DELETE_APP_VERSION_APP_COMPONENT = OperationModel.new(
        name: "DeleteAppVersionAppComponent",
        http_method: "POST",
        request_uri: "/delete-app-version-app-component"
      )

      DELETE_APP_VERSION_RESOURCE = OperationModel.new(
        name: "DeleteAppVersionResource",
        http_method: "POST",
        request_uri: "/delete-app-version-resource"
      )

      DELETE_RECOMMENDATION_TEMPLATE = OperationModel.new(
        name: "DeleteRecommendationTemplate",
        http_method: "POST",
        request_uri: "/delete-recommendation-template"
      )

      DELETE_RESILIENCY_POLICY = OperationModel.new(
        name: "DeleteResiliencyPolicy",
        http_method: "POST",
        request_uri: "/delete-resiliency-policy"
      )

      DESCRIBE_APP = OperationModel.new(
        name: "DescribeApp",
        http_method: "POST",
        request_uri: "/describe-app"
      )

      DESCRIBE_APP_ASSESSMENT = OperationModel.new(
        name: "DescribeAppAssessment",
        http_method: "POST",
        request_uri: "/describe-app-assessment"
      )

      DESCRIBE_APP_VERSION = OperationModel.new(
        name: "DescribeAppVersion",
        http_method: "POST",
        request_uri: "/describe-app-version"
      )

      DESCRIBE_APP_VERSION_APP_COMPONENT = OperationModel.new(
        name: "DescribeAppVersionAppComponent",
        http_method: "POST",
        request_uri: "/describe-app-version-app-component"
      )

      DESCRIBE_APP_VERSION_RESOURCE = OperationModel.new(
        name: "DescribeAppVersionResource",
        http_method: "POST",
        request_uri: "/describe-app-version-resource"
      )

      DESCRIBE_APP_VERSION_RESOURCES_RESOLUTION_STATUS = OperationModel.new(
        name: "DescribeAppVersionResourcesResolutionStatus",
        http_method: "POST",
        request_uri: "/describe-app-version-resources-resolution-status"
      )

      DESCRIBE_APP_VERSION_TEMPLATE = OperationModel.new(
        name: "DescribeAppVersionTemplate",
        http_method: "POST",
        request_uri: "/describe-app-version-template"
      )

      DESCRIBE_DRAFT_APP_VERSION_RESOURCES_IMPORT_STATUS = OperationModel.new(
        name: "DescribeDraftAppVersionResourcesImportStatus",
        http_method: "POST",
        request_uri: "/describe-draft-app-version-resources-import-status"
      )

      DESCRIBE_METRICS_EXPORT = OperationModel.new(
        name: "DescribeMetricsExport",
        http_method: "POST",
        request_uri: "/describe-metrics-export"
      )

      DESCRIBE_RESILIENCY_POLICY = OperationModel.new(
        name: "DescribeResiliencyPolicy",
        http_method: "POST",
        request_uri: "/describe-resiliency-policy"
      )

      DESCRIBE_RESOURCE_GROUPING_RECOMMENDATION_TASK = OperationModel.new(
        name: "DescribeResourceGroupingRecommendationTask",
        http_method: "POST",
        request_uri: "/describe-resource-grouping-recommendation-task"
      )

      IMPORT_RESOURCES_TO_DRAFT_APP_VERSION = OperationModel.new(
        name: "ImportResourcesToDraftAppVersion",
        http_method: "POST",
        request_uri: "/import-resources-to-draft-app-version"
      )

      LIST_ALARM_RECOMMENDATIONS = OperationModel.new(
        name: "ListAlarmRecommendations",
        http_method: "POST",
        request_uri: "/list-alarm-recommendations"
      )

      LIST_APP_ASSESSMENT_COMPLIANCE_DRIFTS = OperationModel.new(
        name: "ListAppAssessmentComplianceDrifts",
        http_method: "POST",
        request_uri: "/list-app-assessment-compliance-drifts"
      )

      LIST_APP_ASSESSMENT_RESOURCE_DRIFTS = OperationModel.new(
        name: "ListAppAssessmentResourceDrifts",
        http_method: "POST",
        request_uri: "/list-app-assessment-resource-drifts"
      )

      LIST_APP_ASSESSMENTS = OperationModel.new(
        name: "ListAppAssessments",
        http_method: "GET",
        request_uri: "/list-app-assessments"
      )

      LIST_APP_COMPONENT_COMPLIANCES = OperationModel.new(
        name: "ListAppComponentCompliances",
        http_method: "POST",
        request_uri: "/list-app-component-compliances"
      )

      LIST_APP_COMPONENT_RECOMMENDATIONS = OperationModel.new(
        name: "ListAppComponentRecommendations",
        http_method: "POST",
        request_uri: "/list-app-component-recommendations"
      )

      LIST_APP_INPUT_SOURCES = OperationModel.new(
        name: "ListAppInputSources",
        http_method: "POST",
        request_uri: "/list-app-input-sources"
      )

      LIST_APP_VERSION_APP_COMPONENTS = OperationModel.new(
        name: "ListAppVersionAppComponents",
        http_method: "POST",
        request_uri: "/list-app-version-app-components"
      )

      LIST_APP_VERSION_RESOURCE_MAPPINGS = OperationModel.new(
        name: "ListAppVersionResourceMappings",
        http_method: "POST",
        request_uri: "/list-app-version-resource-mappings"
      )

      LIST_APP_VERSION_RESOURCES = OperationModel.new(
        name: "ListAppVersionResources",
        http_method: "POST",
        request_uri: "/list-app-version-resources"
      )

      LIST_APP_VERSIONS = OperationModel.new(
        name: "ListAppVersions",
        http_method: "POST",
        request_uri: "/list-app-versions"
      )

      LIST_APPS = OperationModel.new(
        name: "ListApps",
        http_method: "GET",
        request_uri: "/list-apps"
      )

      LIST_METRICS = OperationModel.new(
        name: "ListMetrics",
        http_method: "POST",
        request_uri: "/list-metrics"
      )

      LIST_RECOMMENDATION_TEMPLATES = OperationModel.new(
        name: "ListRecommendationTemplates",
        http_method: "GET",
        request_uri: "/list-recommendation-templates"
      )

      LIST_RESILIENCY_POLICIES = OperationModel.new(
        name: "ListResiliencyPolicies",
        http_method: "GET",
        request_uri: "/list-resiliency-policies"
      )

      LIST_RESOURCE_GROUPING_RECOMMENDATIONS = OperationModel.new(
        name: "ListResourceGroupingRecommendations",
        http_method: "GET",
        request_uri: "/list-resource-grouping-recommendations"
      )

      LIST_SOP_RECOMMENDATIONS = OperationModel.new(
        name: "ListSopRecommendations",
        http_method: "POST",
        request_uri: "/list-sop-recommendations"
      )

      LIST_SUGGESTED_RESILIENCY_POLICIES = OperationModel.new(
        name: "ListSuggestedResiliencyPolicies",
        http_method: "GET",
        request_uri: "/list-suggested-resiliency-policies"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TEST_RECOMMENDATIONS = OperationModel.new(
        name: "ListTestRecommendations",
        http_method: "POST",
        request_uri: "/list-test-recommendations"
      )

      LIST_UNSUPPORTED_APP_VERSION_RESOURCES = OperationModel.new(
        name: "ListUnsupportedAppVersionResources",
        http_method: "POST",
        request_uri: "/list-unsupported-app-version-resources"
      )

      PUBLISH_APP_VERSION = OperationModel.new(
        name: "PublishAppVersion",
        http_method: "POST",
        request_uri: "/publish-app-version"
      )

      PUT_DRAFT_APP_VERSION_TEMPLATE = OperationModel.new(
        name: "PutDraftAppVersionTemplate",
        http_method: "POST",
        request_uri: "/put-draft-app-version-template"
      )

      REJECT_RESOURCE_GROUPING_RECOMMENDATIONS = OperationModel.new(
        name: "RejectResourceGroupingRecommendations",
        http_method: "POST",
        request_uri: "/reject-resource-grouping-recommendations"
      )

      REMOVE_DRAFT_APP_VERSION_RESOURCE_MAPPINGS = OperationModel.new(
        name: "RemoveDraftAppVersionResourceMappings",
        http_method: "POST",
        request_uri: "/remove-draft-app-version-resource-mappings"
      )

      RESOLVE_APP_VERSION_RESOURCES = OperationModel.new(
        name: "ResolveAppVersionResources",
        http_method: "POST",
        request_uri: "/resolve-app-version-resources"
      )

      START_APP_ASSESSMENT = OperationModel.new(
        name: "StartAppAssessment",
        http_method: "POST",
        request_uri: "/start-app-assessment"
      )

      START_METRICS_EXPORT = OperationModel.new(
        name: "StartMetricsExport",
        http_method: "POST",
        request_uri: "/start-metrics-export"
      )

      START_RESOURCE_GROUPING_RECOMMENDATION_TASK = OperationModel.new(
        name: "StartResourceGroupingRecommendationTask",
        http_method: "POST",
        request_uri: "/start-resource-grouping-recommendation-task"
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

      UPDATE_APP = OperationModel.new(
        name: "UpdateApp",
        http_method: "POST",
        request_uri: "/update-app"
      )

      UPDATE_APP_VERSION = OperationModel.new(
        name: "UpdateAppVersion",
        http_method: "POST",
        request_uri: "/update-app-version"
      )

      UPDATE_APP_VERSION_APP_COMPONENT = OperationModel.new(
        name: "UpdateAppVersionAppComponent",
        http_method: "POST",
        request_uri: "/update-app-version-app-component"
      )

      UPDATE_APP_VERSION_RESOURCE = OperationModel.new(
        name: "UpdateAppVersionResource",
        http_method: "POST",
        request_uri: "/update-app-version-resource"
      )

      UPDATE_RESILIENCY_POLICY = OperationModel.new(
        name: "UpdateResiliencyPolicy",
        http_method: "POST",
        request_uri: "/update-resiliency-policy"
      )
    end
  end
end
