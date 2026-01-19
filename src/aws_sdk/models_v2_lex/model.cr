module AwsSdk
  module LexModelsV2
    module Model
      API_VERSION = "2020-08-07"
      TARGET_PREFIX = ""
      SIGNING_NAME = "lex"
      ENDPOINT_PREFIX = "models-v2-lex"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://models-v2-lex-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://models-v2-lex-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://models-v2-lex.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://models-v2-lex.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_CUSTOM_VOCABULARY_ITEM = OperationModel.new(
        name: "BatchCreateCustomVocabularyItem",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary/DEFAULT/batchcreate"
      )

      BATCH_DELETE_CUSTOM_VOCABULARY_ITEM = OperationModel.new(
        name: "BatchDeleteCustomVocabularyItem",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary/DEFAULT/batchdelete"
      )

      BATCH_UPDATE_CUSTOM_VOCABULARY_ITEM = OperationModel.new(
        name: "BatchUpdateCustomVocabularyItem",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary/DEFAULT/batchupdate"
      )

      BUILD_BOT_LOCALE = OperationModel.new(
        name: "BuildBotLocale",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/"
      )

      CREATE_BOT = OperationModel.new(
        name: "CreateBot",
        http_method: "PUT",
        request_uri: "/bots/"
      )

      CREATE_BOT_ALIAS = OperationModel.new(
        name: "CreateBotAlias",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botaliases/"
      )

      CREATE_BOT_LOCALE = OperationModel.new(
        name: "CreateBotLocale",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/"
      )

      CREATE_BOT_REPLICA = OperationModel.new(
        name: "CreateBotReplica",
        http_method: "PUT",
        request_uri: "/bots/{botId}/replicas/"
      )

      CREATE_BOT_VERSION = OperationModel.new(
        name: "CreateBotVersion",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/"
      )

      CREATE_EXPORT = OperationModel.new(
        name: "CreateExport",
        http_method: "PUT",
        request_uri: "/exports/"
      )

      CREATE_INTENT = OperationModel.new(
        name: "CreateIntent",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/"
      )

      CREATE_RESOURCE_POLICY = OperationModel.new(
        name: "CreateResourcePolicy",
        http_method: "POST",
        request_uri: "/policy/{resourceArn}/"
      )

      CREATE_RESOURCE_POLICY_STATEMENT = OperationModel.new(
        name: "CreateResourcePolicyStatement",
        http_method: "POST",
        request_uri: "/policy/{resourceArn}/statements/"
      )

      CREATE_SLOT = OperationModel.new(
        name: "CreateSlot",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/slots/"
      )

      CREATE_SLOT_TYPE = OperationModel.new(
        name: "CreateSlotType",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/slottypes/"
      )

      CREATE_TEST_SET_DISCREPANCY_REPORT = OperationModel.new(
        name: "CreateTestSetDiscrepancyReport",
        http_method: "POST",
        request_uri: "/testsets/{testSetId}/testsetdiscrepancy"
      )

      CREATE_UPLOAD_URL = OperationModel.new(
        name: "CreateUploadUrl",
        http_method: "POST",
        request_uri: "/createuploadurl/"
      )

      DELETE_BOT = OperationModel.new(
        name: "DeleteBot",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/"
      )

      DELETE_BOT_ALIAS = OperationModel.new(
        name: "DeleteBotAlias",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botaliases/{botAliasId}/"
      )

      DELETE_BOT_LOCALE = OperationModel.new(
        name: "DeleteBotLocale",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/"
      )

      DELETE_BOT_REPLICA = OperationModel.new(
        name: "DeleteBotReplica",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/replicas/{replicaRegion}/"
      )

      DELETE_BOT_VERSION = OperationModel.new(
        name: "DeleteBotVersion",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/"
      )

      DELETE_CUSTOM_VOCABULARY = OperationModel.new(
        name: "DeleteCustomVocabulary",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary"
      )

      DELETE_EXPORT = OperationModel.new(
        name: "DeleteExport",
        http_method: "DELETE",
        request_uri: "/exports/{exportId}/"
      )

      DELETE_IMPORT = OperationModel.new(
        name: "DeleteImport",
        http_method: "DELETE",
        request_uri: "/imports/{importId}/"
      )

      DELETE_INTENT = OperationModel.new(
        name: "DeleteIntent",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/policy/{resourceArn}/"
      )

      DELETE_RESOURCE_POLICY_STATEMENT = OperationModel.new(
        name: "DeleteResourcePolicyStatement",
        http_method: "DELETE",
        request_uri: "/policy/{resourceArn}/statements/{statementId}/"
      )

      DELETE_SLOT = OperationModel.new(
        name: "DeleteSlot",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/slots/{slotId}/"
      )

      DELETE_SLOT_TYPE = OperationModel.new(
        name: "DeleteSlotType",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/slottypes/{slotTypeId}/"
      )

      DELETE_TEST_SET = OperationModel.new(
        name: "DeleteTestSet",
        http_method: "DELETE",
        request_uri: "/testsets/{testSetId}"
      )

      DELETE_UTTERANCES = OperationModel.new(
        name: "DeleteUtterances",
        http_method: "DELETE",
        request_uri: "/bots/{botId}/utterances/"
      )

      DESCRIBE_BOT = OperationModel.new(
        name: "DescribeBot",
        http_method: "GET",
        request_uri: "/bots/{botId}/"
      )

      DESCRIBE_BOT_ALIAS = OperationModel.new(
        name: "DescribeBotAlias",
        http_method: "GET",
        request_uri: "/bots/{botId}/botaliases/{botAliasId}/"
      )

      DESCRIBE_BOT_LOCALE = OperationModel.new(
        name: "DescribeBotLocale",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/"
      )

      DESCRIBE_BOT_RECOMMENDATION = OperationModel.new(
        name: "DescribeBotRecommendation",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/{botRecommendationId}/"
      )

      DESCRIBE_BOT_REPLICA = OperationModel.new(
        name: "DescribeBotReplica",
        http_method: "GET",
        request_uri: "/bots/{botId}/replicas/{replicaRegion}/"
      )

      DESCRIBE_BOT_RESOURCE_GENERATION = OperationModel.new(
        name: "DescribeBotResourceGeneration",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/generations/{generationId}"
      )

      DESCRIBE_BOT_VERSION = OperationModel.new(
        name: "DescribeBotVersion",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/"
      )

      DESCRIBE_CUSTOM_VOCABULARY_METADATA = OperationModel.new(
        name: "DescribeCustomVocabularyMetadata",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary/DEFAULT/metadata"
      )

      DESCRIBE_EXPORT = OperationModel.new(
        name: "DescribeExport",
        http_method: "GET",
        request_uri: "/exports/{exportId}/"
      )

      DESCRIBE_IMPORT = OperationModel.new(
        name: "DescribeImport",
        http_method: "GET",
        request_uri: "/imports/{importId}/"
      )

      DESCRIBE_INTENT = OperationModel.new(
        name: "DescribeIntent",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "GET",
        request_uri: "/policy/{resourceArn}/"
      )

      DESCRIBE_SLOT = OperationModel.new(
        name: "DescribeSlot",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/slots/{slotId}/"
      )

      DESCRIBE_SLOT_TYPE = OperationModel.new(
        name: "DescribeSlotType",
        http_method: "GET",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/slottypes/{slotTypeId}/"
      )

      DESCRIBE_TEST_EXECUTION = OperationModel.new(
        name: "DescribeTestExecution",
        http_method: "GET",
        request_uri: "/testexecutions/{testExecutionId}"
      )

      DESCRIBE_TEST_SET = OperationModel.new(
        name: "DescribeTestSet",
        http_method: "GET",
        request_uri: "/testsets/{testSetId}"
      )

      DESCRIBE_TEST_SET_DISCREPANCY_REPORT = OperationModel.new(
        name: "DescribeTestSetDiscrepancyReport",
        http_method: "GET",
        request_uri: "/testsetdiscrepancy/{testSetDiscrepancyReportId}"
      )

      DESCRIBE_TEST_SET_GENERATION = OperationModel.new(
        name: "DescribeTestSetGeneration",
        http_method: "GET",
        request_uri: "/testsetgenerations/{testSetGenerationId}"
      )

      GENERATE_BOT_ELEMENT = OperationModel.new(
        name: "GenerateBotElement",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/generate"
      )

      GET_TEST_EXECUTION_ARTIFACTS_URL = OperationModel.new(
        name: "GetTestExecutionArtifactsUrl",
        http_method: "GET",
        request_uri: "/testexecutions/{testExecutionId}/artifacturl"
      )

      LIST_AGGREGATED_UTTERANCES = OperationModel.new(
        name: "ListAggregatedUtterances",
        http_method: "POST",
        request_uri: "/bots/{botId}/aggregatedutterances/"
      )

      LIST_BOT_ALIAS_REPLICAS = OperationModel.new(
        name: "ListBotAliasReplicas",
        http_method: "POST",
        request_uri: "/bots/{botId}/replicas/{replicaRegion}/botaliases/"
      )

      LIST_BOT_ALIASES = OperationModel.new(
        name: "ListBotAliases",
        http_method: "POST",
        request_uri: "/bots/{botId}/botaliases/"
      )

      LIST_BOT_LOCALES = OperationModel.new(
        name: "ListBotLocales",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/"
      )

      LIST_BOT_RECOMMENDATIONS = OperationModel.new(
        name: "ListBotRecommendations",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/"
      )

      LIST_BOT_REPLICAS = OperationModel.new(
        name: "ListBotReplicas",
        http_method: "POST",
        request_uri: "/bots/{botId}/replicas/"
      )

      LIST_BOT_RESOURCE_GENERATIONS = OperationModel.new(
        name: "ListBotResourceGenerations",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/generations"
      )

      LIST_BOT_VERSION_REPLICAS = OperationModel.new(
        name: "ListBotVersionReplicas",
        http_method: "POST",
        request_uri: "/bots/{botId}/replicas/{replicaRegion}/botversions/"
      )

      LIST_BOT_VERSIONS = OperationModel.new(
        name: "ListBotVersions",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/"
      )

      LIST_BOTS = OperationModel.new(
        name: "ListBots",
        http_method: "POST",
        request_uri: "/bots/"
      )

      LIST_BUILT_IN_INTENTS = OperationModel.new(
        name: "ListBuiltInIntents",
        http_method: "POST",
        request_uri: "/builtins/locales/{localeId}/intents/"
      )

      LIST_BUILT_IN_SLOT_TYPES = OperationModel.new(
        name: "ListBuiltInSlotTypes",
        http_method: "POST",
        request_uri: "/builtins/locales/{localeId}/slottypes/"
      )

      LIST_CUSTOM_VOCABULARY_ITEMS = OperationModel.new(
        name: "ListCustomVocabularyItems",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/customvocabulary/DEFAULT/list"
      )

      LIST_EXPORTS = OperationModel.new(
        name: "ListExports",
        http_method: "POST",
        request_uri: "/exports/"
      )

      LIST_IMPORTS = OperationModel.new(
        name: "ListImports",
        http_method: "POST",
        request_uri: "/imports/"
      )

      LIST_INTENT_METRICS = OperationModel.new(
        name: "ListIntentMetrics",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/intentmetrics"
      )

      LIST_INTENT_PATHS = OperationModel.new(
        name: "ListIntentPaths",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/intentpaths"
      )

      LIST_INTENT_STAGE_METRICS = OperationModel.new(
        name: "ListIntentStageMetrics",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/intentstagemetrics"
      )

      LIST_INTENTS = OperationModel.new(
        name: "ListIntents",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/"
      )

      LIST_RECOMMENDED_INTENTS = OperationModel.new(
        name: "ListRecommendedIntents",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/{botRecommendationId}/intents"
      )

      LIST_SESSION_ANALYTICS_DATA = OperationModel.new(
        name: "ListSessionAnalyticsData",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/sessions"
      )

      LIST_SESSION_METRICS = OperationModel.new(
        name: "ListSessionMetrics",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/sessionmetrics"
      )

      LIST_SLOT_TYPES = OperationModel.new(
        name: "ListSlotTypes",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/slottypes/"
      )

      LIST_SLOTS = OperationModel.new(
        name: "ListSlots",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/slots/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceARN}"
      )

      LIST_TEST_EXECUTION_RESULT_ITEMS = OperationModel.new(
        name: "ListTestExecutionResultItems",
        http_method: "POST",
        request_uri: "/testexecutions/{testExecutionId}/results"
      )

      LIST_TEST_EXECUTIONS = OperationModel.new(
        name: "ListTestExecutions",
        http_method: "POST",
        request_uri: "/testexecutions"
      )

      LIST_TEST_SET_RECORDS = OperationModel.new(
        name: "ListTestSetRecords",
        http_method: "POST",
        request_uri: "/testsets/{testSetId}/records"
      )

      LIST_TEST_SETS = OperationModel.new(
        name: "ListTestSets",
        http_method: "POST",
        request_uri: "/testsets"
      )

      LIST_UTTERANCE_ANALYTICS_DATA = OperationModel.new(
        name: "ListUtteranceAnalyticsData",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/utterances"
      )

      LIST_UTTERANCE_METRICS = OperationModel.new(
        name: "ListUtteranceMetrics",
        http_method: "POST",
        request_uri: "/bots/{botId}/analytics/utterancemetrics"
      )

      SEARCH_ASSOCIATED_TRANSCRIPTS = OperationModel.new(
        name: "SearchAssociatedTranscripts",
        http_method: "POST",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/{botRecommendationId}/associatedtranscripts"
      )

      START_BOT_RECOMMENDATION = OperationModel.new(
        name: "StartBotRecommendation",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/"
      )

      START_BOT_RESOURCE_GENERATION = OperationModel.new(
        name: "StartBotResourceGeneration",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/startgeneration"
      )

      START_IMPORT = OperationModel.new(
        name: "StartImport",
        http_method: "PUT",
        request_uri: "/imports/"
      )

      START_TEST_EXECUTION = OperationModel.new(
        name: "StartTestExecution",
        http_method: "POST",
        request_uri: "/testsets/{testSetId}/testexecutions"
      )

      START_TEST_SET_GENERATION = OperationModel.new(
        name: "StartTestSetGeneration",
        http_method: "PUT",
        request_uri: "/testsetgenerations"
      )

      STOP_BOT_RECOMMENDATION = OperationModel.new(
        name: "StopBotRecommendation",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/{botRecommendationId}/stopbotrecommendation"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceARN}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceARN}"
      )

      UPDATE_BOT = OperationModel.new(
        name: "UpdateBot",
        http_method: "PUT",
        request_uri: "/bots/{botId}/"
      )

      UPDATE_BOT_ALIAS = OperationModel.new(
        name: "UpdateBotAlias",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botaliases/{botAliasId}/"
      )

      UPDATE_BOT_LOCALE = OperationModel.new(
        name: "UpdateBotLocale",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/"
      )

      UPDATE_BOT_RECOMMENDATION = OperationModel.new(
        name: "UpdateBotRecommendation",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/botrecommendations/{botRecommendationId}/"
      )

      UPDATE_EXPORT = OperationModel.new(
        name: "UpdateExport",
        http_method: "PUT",
        request_uri: "/exports/{exportId}/"
      )

      UPDATE_INTENT = OperationModel.new(
        name: "UpdateIntent",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/"
      )

      UPDATE_RESOURCE_POLICY = OperationModel.new(
        name: "UpdateResourcePolicy",
        http_method: "PUT",
        request_uri: "/policy/{resourceArn}/"
      )

      UPDATE_SLOT = OperationModel.new(
        name: "UpdateSlot",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/intents/{intentId}/slots/{slotId}/"
      )

      UPDATE_SLOT_TYPE = OperationModel.new(
        name: "UpdateSlotType",
        http_method: "PUT",
        request_uri: "/bots/{botId}/botversions/{botVersion}/botlocales/{localeId}/slottypes/{slotTypeId}/"
      )

      UPDATE_TEST_SET = OperationModel.new(
        name: "UpdateTestSet",
        http_method: "PUT",
        request_uri: "/testsets/{testSetId}"
      )
    end
  end
end
