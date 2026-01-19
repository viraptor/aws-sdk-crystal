module AwsSdk
  module Support
    module Model
      API_VERSION = "2013-04-15"
      TARGET_PREFIX = "AWSSupport_20130415"
      SIGNING_NAME = "support"
      ENDPOINT_PREFIX = "support"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"String"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"Boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"Boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"String"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.us-east-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.cn-north-1.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"cn-north-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.us-iso-east-1.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://support.us-isob-east-1.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingName":"support","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://support-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://support-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://support.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://support.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_ATTACHMENTS_TO_SET = OperationModel.new(
        name: "AddAttachmentsToSet",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_COMMUNICATION_TO_CASE = OperationModel.new(
        name: "AddCommunicationToCase",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CASE = OperationModel.new(
        name: "CreateCase",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ATTACHMENT = OperationModel.new(
        name: "DescribeAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CASES = OperationModel.new(
        name: "DescribeCases",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COMMUNICATIONS = OperationModel.new(
        name: "DescribeCommunications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CREATE_CASE_OPTIONS = OperationModel.new(
        name: "DescribeCreateCaseOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICES = OperationModel.new(
        name: "DescribeServices",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SEVERITY_LEVELS = OperationModel.new(
        name: "DescribeSeverityLevels",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUPPORTED_LANGUAGES = OperationModel.new(
        name: "DescribeSupportedLanguages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTED_ADVISOR_CHECK_REFRESH_STATUSES = OperationModel.new(
        name: "DescribeTrustedAdvisorCheckRefreshStatuses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTED_ADVISOR_CHECK_RESULT = OperationModel.new(
        name: "DescribeTrustedAdvisorCheckResult",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTED_ADVISOR_CHECK_SUMMARIES = OperationModel.new(
        name: "DescribeTrustedAdvisorCheckSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTED_ADVISOR_CHECKS = OperationModel.new(
        name: "DescribeTrustedAdvisorChecks",
        http_method: "POST",
        request_uri: "/"
      )

      REFRESH_TRUSTED_ADVISOR_CHECK = OperationModel.new(
        name: "RefreshTrustedAdvisorCheck",
        http_method: "POST",
        request_uri: "/"
      )

      RESOLVE_CASE = OperationModel.new(
        name: "ResolveCase",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
