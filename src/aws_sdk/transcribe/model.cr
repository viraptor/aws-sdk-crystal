module AwsSdk
  module Transcribe
    module Model
      API_VERSION = "2017-10-26"
      TARGET_PREFIX = "Transcribe"
      SIGNING_NAME = "transcribe"
      ENDPOINT_PREFIX = "transcribe"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://transcribe-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}],"endpoint":{"url":"https://fips.transcribe.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://fips.transcribe.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://transcribe-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://transcribe.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"cn-north-1"]}],"endpoint":{"url":"https://cn.transcribe.cn-north-1.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"cn-northwest-1"]}],"endpoint":{"url":"https://cn.transcribe.cn-northwest-1.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://transcribe.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CALL_ANALYTICS_CATEGORY = OperationModel.new(
        name: "CreateCallAnalyticsCategory",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LANGUAGE_MODEL = OperationModel.new(
        name: "CreateLanguageModel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MEDICAL_VOCABULARY = OperationModel.new(
        name: "CreateMedicalVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOCABULARY = OperationModel.new(
        name: "CreateVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOCABULARY_FILTER = OperationModel.new(
        name: "CreateVocabularyFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CALL_ANALYTICS_CATEGORY = OperationModel.new(
        name: "DeleteCallAnalyticsCategory",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CALL_ANALYTICS_JOB = OperationModel.new(
        name: "DeleteCallAnalyticsJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LANGUAGE_MODEL = OperationModel.new(
        name: "DeleteLanguageModel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MEDICAL_SCRIBE_JOB = OperationModel.new(
        name: "DeleteMedicalScribeJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MEDICAL_TRANSCRIPTION_JOB = OperationModel.new(
        name: "DeleteMedicalTranscriptionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MEDICAL_VOCABULARY = OperationModel.new(
        name: "DeleteMedicalVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSCRIPTION_JOB = OperationModel.new(
        name: "DeleteTranscriptionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOCABULARY = OperationModel.new(
        name: "DeleteVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOCABULARY_FILTER = OperationModel.new(
        name: "DeleteVocabularyFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LANGUAGE_MODEL = OperationModel.new(
        name: "DescribeLanguageModel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALL_ANALYTICS_CATEGORY = OperationModel.new(
        name: "GetCallAnalyticsCategory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALL_ANALYTICS_JOB = OperationModel.new(
        name: "GetCallAnalyticsJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MEDICAL_SCRIBE_JOB = OperationModel.new(
        name: "GetMedicalScribeJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MEDICAL_TRANSCRIPTION_JOB = OperationModel.new(
        name: "GetMedicalTranscriptionJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MEDICAL_VOCABULARY = OperationModel.new(
        name: "GetMedicalVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSCRIPTION_JOB = OperationModel.new(
        name: "GetTranscriptionJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VOCABULARY = OperationModel.new(
        name: "GetVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VOCABULARY_FILTER = OperationModel.new(
        name: "GetVocabularyFilter",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CALL_ANALYTICS_CATEGORIES = OperationModel.new(
        name: "ListCallAnalyticsCategories",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CALL_ANALYTICS_JOBS = OperationModel.new(
        name: "ListCallAnalyticsJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LANGUAGE_MODELS = OperationModel.new(
        name: "ListLanguageModels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEDICAL_SCRIBE_JOBS = OperationModel.new(
        name: "ListMedicalScribeJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEDICAL_TRANSCRIPTION_JOBS = OperationModel.new(
        name: "ListMedicalTranscriptionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEDICAL_VOCABULARIES = OperationModel.new(
        name: "ListMedicalVocabularies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRANSCRIPTION_JOBS = OperationModel.new(
        name: "ListTranscriptionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOCABULARIES = OperationModel.new(
        name: "ListVocabularies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOCABULARY_FILTERS = OperationModel.new(
        name: "ListVocabularyFilters",
        http_method: "POST",
        request_uri: "/"
      )

      START_CALL_ANALYTICS_JOB = OperationModel.new(
        name: "StartCallAnalyticsJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_MEDICAL_SCRIBE_JOB = OperationModel.new(
        name: "StartMedicalScribeJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_MEDICAL_TRANSCRIPTION_JOB = OperationModel.new(
        name: "StartMedicalTranscriptionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_TRANSCRIPTION_JOB = OperationModel.new(
        name: "StartTranscriptionJob",
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

      UPDATE_CALL_ANALYTICS_CATEGORY = OperationModel.new(
        name: "UpdateCallAnalyticsCategory",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MEDICAL_VOCABULARY = OperationModel.new(
        name: "UpdateMedicalVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VOCABULARY = OperationModel.new(
        name: "UpdateVocabulary",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VOCABULARY_FILTER = OperationModel.new(
        name: "UpdateVocabularyFilter",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
