module Aws
  module CloudSearch
    module Model
      API_VERSION = "2013-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cloudsearch"
      ENDPOINT_PREFIX = "cloudsearch"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudsearch-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudsearch-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudsearch.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cloudsearch.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BUILD_SUGGESTERS = OperationModel.new(
        name: "BuildSuggesters",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DEFINE_ANALYSIS_SCHEME = OperationModel.new(
        name: "DefineAnalysisScheme",
        http_method: "POST",
        request_uri: "/"
      )

      DEFINE_EXPRESSION = OperationModel.new(
        name: "DefineExpression",
        http_method: "POST",
        request_uri: "/"
      )

      DEFINE_INDEX_FIELD = OperationModel.new(
        name: "DefineIndexField",
        http_method: "POST",
        request_uri: "/"
      )

      DEFINE_SUGGESTER = OperationModel.new(
        name: "DefineSuggester",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ANALYSIS_SCHEME = OperationModel.new(
        name: "DeleteAnalysisScheme",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPRESSION = OperationModel.new(
        name: "DeleteExpression",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INDEX_FIELD = OperationModel.new(
        name: "DeleteIndexField",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUGGESTER = OperationModel.new(
        name: "DeleteSuggester",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ANALYSIS_SCHEMES = OperationModel.new(
        name: "DescribeAnalysisSchemes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AVAILABILITY_OPTIONS = OperationModel.new(
        name: "DescribeAvailabilityOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAIN_ENDPOINT_OPTIONS = OperationModel.new(
        name: "DescribeDomainEndpointOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAINS = OperationModel.new(
        name: "DescribeDomains",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPRESSIONS = OperationModel.new(
        name: "DescribeExpressions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INDEX_FIELDS = OperationModel.new(
        name: "DescribeIndexFields",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCALING_PARAMETERS = OperationModel.new(
        name: "DescribeScalingParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_ACCESS_POLICIES = OperationModel.new(
        name: "DescribeServiceAccessPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUGGESTERS = OperationModel.new(
        name: "DescribeSuggesters",
        http_method: "POST",
        request_uri: "/"
      )

      INDEX_DOCUMENTS = OperationModel.new(
        name: "IndexDocuments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMAIN_NAMES = OperationModel.new(
        name: "ListDomainNames",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AVAILABILITY_OPTIONS = OperationModel.new(
        name: "UpdateAvailabilityOptions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN_ENDPOINT_OPTIONS = OperationModel.new(
        name: "UpdateDomainEndpointOptions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCALING_PARAMETERS = OperationModel.new(
        name: "UpdateScalingParameters",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_ACCESS_POLICIES = OperationModel.new(
        name: "UpdateServiceAccessPolicies",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
