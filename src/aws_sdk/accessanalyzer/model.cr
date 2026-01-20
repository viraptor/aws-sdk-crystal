module AwsSdk
  module AccessAnalyzer
    module Model
      API_VERSION = "2019-11-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "access-analyzer"
      ENDPOINT_PREFIX = "access-analyzer"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://access-analyzer-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://access-analyzer.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://access-analyzer-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://access-analyzer.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://access-analyzer.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      APPLY_ARCHIVE_RULE = OperationModel.new(
        name: "ApplyArchiveRule",
        http_method: "PUT",
        request_uri: "/archive-rule"
      )

      CANCEL_POLICY_GENERATION = OperationModel.new(
        name: "CancelPolicyGeneration",
        http_method: "PUT",
        request_uri: "/policy/generation/{jobId}"
      )

      CHECK_ACCESS_NOT_GRANTED = OperationModel.new(
        name: "CheckAccessNotGranted",
        http_method: "POST",
        request_uri: "/policy/check-access-not-granted"
      )

      CHECK_NO_NEW_ACCESS = OperationModel.new(
        name: "CheckNoNewAccess",
        http_method: "POST",
        request_uri: "/policy/check-no-new-access"
      )

      CHECK_NO_PUBLIC_ACCESS = OperationModel.new(
        name: "CheckNoPublicAccess",
        http_method: "POST",
        request_uri: "/policy/check-no-public-access"
      )

      CREATE_ACCESS_PREVIEW = OperationModel.new(
        name: "CreateAccessPreview",
        http_method: "PUT",
        request_uri: "/access-preview"
      )

      CREATE_ANALYZER = OperationModel.new(
        name: "CreateAnalyzer",
        http_method: "PUT",
        request_uri: "/analyzer"
      )

      CREATE_ARCHIVE_RULE = OperationModel.new(
        name: "CreateArchiveRule",
        http_method: "PUT",
        request_uri: "/analyzer/{analyzerName}/archive-rule"
      )

      DELETE_ANALYZER = OperationModel.new(
        name: "DeleteAnalyzer",
        http_method: "DELETE",
        request_uri: "/analyzer/{analyzerName}"
      )

      DELETE_ARCHIVE_RULE = OperationModel.new(
        name: "DeleteArchiveRule",
        http_method: "DELETE",
        request_uri: "/analyzer/{analyzerName}/archive-rule/{ruleName}"
      )

      GENERATE_FINDING_RECOMMENDATION = OperationModel.new(
        name: "GenerateFindingRecommendation",
        http_method: "POST",
        request_uri: "/recommendation/{id}"
      )

      GET_ACCESS_PREVIEW = OperationModel.new(
        name: "GetAccessPreview",
        http_method: "GET",
        request_uri: "/access-preview/{accessPreviewId}"
      )

      GET_ANALYZED_RESOURCE = OperationModel.new(
        name: "GetAnalyzedResource",
        http_method: "GET",
        request_uri: "/analyzed-resource"
      )

      GET_ANALYZER = OperationModel.new(
        name: "GetAnalyzer",
        http_method: "GET",
        request_uri: "/analyzer/{analyzerName}"
      )

      GET_ARCHIVE_RULE = OperationModel.new(
        name: "GetArchiveRule",
        http_method: "GET",
        request_uri: "/analyzer/{analyzerName}/archive-rule/{ruleName}"
      )

      GET_FINDING = OperationModel.new(
        name: "GetFinding",
        http_method: "GET",
        request_uri: "/finding/{id}"
      )

      GET_FINDING_RECOMMENDATION = OperationModel.new(
        name: "GetFindingRecommendation",
        http_method: "GET",
        request_uri: "/recommendation/{id}"
      )

      GET_FINDING_V2 = OperationModel.new(
        name: "GetFindingV2",
        http_method: "GET",
        request_uri: "/findingv2/{id}"
      )

      GET_FINDINGS_STATISTICS = OperationModel.new(
        name: "GetFindingsStatistics",
        http_method: "POST",
        request_uri: "/analyzer/findings/statistics"
      )

      GET_GENERATED_POLICY = OperationModel.new(
        name: "GetGeneratedPolicy",
        http_method: "GET",
        request_uri: "/policy/generation/{jobId}"
      )

      LIST_ACCESS_PREVIEW_FINDINGS = OperationModel.new(
        name: "ListAccessPreviewFindings",
        http_method: "POST",
        request_uri: "/access-preview/{accessPreviewId}"
      )

      LIST_ACCESS_PREVIEWS = OperationModel.new(
        name: "ListAccessPreviews",
        http_method: "GET",
        request_uri: "/access-preview"
      )

      LIST_ANALYZED_RESOURCES = OperationModel.new(
        name: "ListAnalyzedResources",
        http_method: "POST",
        request_uri: "/analyzed-resource"
      )

      LIST_ANALYZERS = OperationModel.new(
        name: "ListAnalyzers",
        http_method: "GET",
        request_uri: "/analyzer"
      )

      LIST_ARCHIVE_RULES = OperationModel.new(
        name: "ListArchiveRules",
        http_method: "GET",
        request_uri: "/analyzer/{analyzerName}/archive-rule"
      )

      LIST_FINDINGS = OperationModel.new(
        name: "ListFindings",
        http_method: "POST",
        request_uri: "/finding"
      )

      LIST_FINDINGS_V2 = OperationModel.new(
        name: "ListFindingsV2",
        http_method: "POST",
        request_uri: "/findingv2"
      )

      LIST_POLICY_GENERATIONS = OperationModel.new(
        name: "ListPolicyGenerations",
        http_method: "GET",
        request_uri: "/policy/generation"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_POLICY_GENERATION = OperationModel.new(
        name: "StartPolicyGeneration",
        http_method: "PUT",
        request_uri: "/policy/generation"
      )

      START_RESOURCE_SCAN = OperationModel.new(
        name: "StartResourceScan",
        http_method: "POST",
        request_uri: "/resource/scan"
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

      UPDATE_ANALYZER = OperationModel.new(
        name: "UpdateAnalyzer",
        http_method: "PUT",
        request_uri: "/analyzer/{analyzerName}"
      )

      UPDATE_ARCHIVE_RULE = OperationModel.new(
        name: "UpdateArchiveRule",
        http_method: "PUT",
        request_uri: "/analyzer/{analyzerName}/archive-rule/{ruleName}"
      )

      UPDATE_FINDINGS = OperationModel.new(
        name: "UpdateFindings",
        http_method: "PUT",
        request_uri: "/finding"
      )

      VALIDATE_POLICY = OperationModel.new(
        name: "ValidatePolicy",
        http_method: "POST",
        request_uri: "/policy/validation"
      )
    end
  end
end
