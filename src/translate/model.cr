module Aws
  module Translate
    module Model
      API_VERSION = "2017-07-01"
      TARGET_PREFIX = "AWSShineFrontendService_20170701"
      SIGNING_NAME = "translate"
      ENDPOINT_PREFIX = "translate"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://translate-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://translate-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://translate.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://translate.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_PARALLEL_DATA = OperationModel.new(
        name: "CreateParallelData",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARALLEL_DATA = OperationModel.new(
        name: "DeleteParallelData",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TERMINOLOGY = OperationModel.new(
        name: "DeleteTerminology",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TEXT_TRANSLATION_JOB = OperationModel.new(
        name: "DescribeTextTranslationJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARALLEL_DATA = OperationModel.new(
        name: "GetParallelData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TERMINOLOGY = OperationModel.new(
        name: "GetTerminology",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_TERMINOLOGY = OperationModel.new(
        name: "ImportTerminology",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LANGUAGES = OperationModel.new(
        name: "ListLanguages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARALLEL_DATA = OperationModel.new(
        name: "ListParallelData",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TERMINOLOGIES = OperationModel.new(
        name: "ListTerminologies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TEXT_TRANSLATION_JOBS = OperationModel.new(
        name: "ListTextTranslationJobs",
        http_method: "POST",
        request_uri: "/"
      )

      START_TEXT_TRANSLATION_JOB = OperationModel.new(
        name: "StartTextTranslationJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TEXT_TRANSLATION_JOB = OperationModel.new(
        name: "StopTextTranslationJob",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSLATE_DOCUMENT = OperationModel.new(
        name: "TranslateDocument",
        http_method: "POST",
        request_uri: "/"
      )

      TRANSLATE_TEXT = OperationModel.new(
        name: "TranslateText",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARALLEL_DATA = OperationModel.new(
        name: "UpdateParallelData",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
