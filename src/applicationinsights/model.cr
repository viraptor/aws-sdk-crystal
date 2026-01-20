module Aws
  module ApplicationInsights
    module Model
      API_VERSION = "2018-11-25"
      TARGET_PREFIX = "EC2WindowsBarleyService"
      SIGNING_NAME = "applicationinsights"
      ENDPOINT_PREFIX = "applicationinsights"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://applicationinsights-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://applicationinsights-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://applicationinsights.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://applicationinsights.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_WORKLOAD = OperationModel.new(
        name: "AddWorkload",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMPONENT = OperationModel.new(
        name: "CreateComponent",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOG_PATTERN = OperationModel.new(
        name: "CreateLogPattern",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COMPONENT = OperationModel.new(
        name: "DeleteComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOG_PATTERN = OperationModel.new(
        name: "DeleteLogPattern",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION = OperationModel.new(
        name: "DescribeApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPONENT = OperationModel.new(
        name: "DescribeComponent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPONENT_CONFIGURATION = OperationModel.new(
        name: "DescribeComponentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMPONENT_CONFIGURATION_RECOMMENDATION = OperationModel.new(
        name: "DescribeComponentConfigurationRecommendation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOG_PATTERN = OperationModel.new(
        name: "DescribeLogPattern",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OBSERVATION = OperationModel.new(
        name: "DescribeObservation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROBLEM = OperationModel.new(
        name: "DescribeProblem",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROBLEM_OBSERVATIONS = OperationModel.new(
        name: "DescribeProblemObservations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKLOAD = OperationModel.new(
        name: "DescribeWorkload",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPONENTS = OperationModel.new(
        name: "ListComponents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONFIGURATION_HISTORY = OperationModel.new(
        name: "ListConfigurationHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_PATTERN_SETS = OperationModel.new(
        name: "ListLogPatternSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_PATTERNS = OperationModel.new(
        name: "ListLogPatterns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROBLEMS = OperationModel.new(
        name: "ListProblems",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKLOADS = OperationModel.new(
        name: "ListWorkloads",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_WORKLOAD = OperationModel.new(
        name: "RemoveWorkload",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COMPONENT = OperationModel.new(
        name: "UpdateComponent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COMPONENT_CONFIGURATION = OperationModel.new(
        name: "UpdateComponentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOG_PATTERN = OperationModel.new(
        name: "UpdateLogPattern",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROBLEM = OperationModel.new(
        name: "UpdateProblem",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKLOAD = OperationModel.new(
        name: "UpdateWorkload",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
