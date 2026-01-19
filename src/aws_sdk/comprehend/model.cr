module AwsSdk
  module Comprehend
    module Model
      API_VERSION = "2017-11-27"
      TARGET_PREFIX = "Comprehend_20171127"
      SIGNING_NAME = "comprehend"
      ENDPOINT_PREFIX = "comprehend"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehend-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehend-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://comprehend.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://comprehend.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DETECT_DOMINANT_LANGUAGE = OperationModel.new(
        name: "BatchDetectDominantLanguage",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DETECT_ENTITIES = OperationModel.new(
        name: "BatchDetectEntities",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DETECT_KEY_PHRASES = OperationModel.new(
        name: "BatchDetectKeyPhrases",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DETECT_SENTIMENT = OperationModel.new(
        name: "BatchDetectSentiment",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DETECT_SYNTAX = OperationModel.new(
        name: "BatchDetectSyntax",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DETECT_TARGETED_SENTIMENT = OperationModel.new(
        name: "BatchDetectTargetedSentiment",
        http_method: "POST",
        request_uri: "/"
      )

      CLASSIFY_DOCUMENT = OperationModel.new(
        name: "ClassifyDocument",
        http_method: "POST",
        request_uri: "/"
      )

      CONTAINS_PII_ENTITIES = OperationModel.new(
        name: "ContainsPiiEntities",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOCUMENT_CLASSIFIER = OperationModel.new(
        name: "CreateDocumentClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT = OperationModel.new(
        name: "CreateEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENTITY_RECOGNIZER = OperationModel.new(
        name: "CreateEntityRecognizer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLYWHEEL = OperationModel.new(
        name: "CreateFlywheel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOCUMENT_CLASSIFIER = OperationModel.new(
        name: "DeleteDocumentClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT = OperationModel.new(
        name: "DeleteEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENTITY_RECOGNIZER = OperationModel.new(
        name: "DeleteEntityRecognizer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLYWHEEL = OperationModel.new(
        name: "DeleteFlywheel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOCUMENT_CLASSIFICATION_JOB = OperationModel.new(
        name: "DescribeDocumentClassificationJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOCUMENT_CLASSIFIER = OperationModel.new(
        name: "DescribeDocumentClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMINANT_LANGUAGE_DETECTION_JOB = OperationModel.new(
        name: "DescribeDominantLanguageDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT = OperationModel.new(
        name: "DescribeEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "DescribeEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITY_RECOGNIZER = OperationModel.new(
        name: "DescribeEntityRecognizer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS_DETECTION_JOB = OperationModel.new(
        name: "DescribeEventsDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLYWHEEL = OperationModel.new(
        name: "DescribeFlywheel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLYWHEEL_ITERATION = OperationModel.new(
        name: "DescribeFlywheelIteration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_KEY_PHRASES_DETECTION_JOB = OperationModel.new(
        name: "DescribeKeyPhrasesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PII_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "DescribePiiEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESOURCE_POLICY = OperationModel.new(
        name: "DescribeResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "DescribeSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TARGETED_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "DescribeTargetedSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TOPICS_DETECTION_JOB = OperationModel.new(
        name: "DescribeTopicsDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_DOMINANT_LANGUAGE = OperationModel.new(
        name: "DetectDominantLanguage",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_ENTITIES = OperationModel.new(
        name: "DetectEntities",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_KEY_PHRASES = OperationModel.new(
        name: "DetectKeyPhrases",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_PII_ENTITIES = OperationModel.new(
        name: "DetectPiiEntities",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_SENTIMENT = OperationModel.new(
        name: "DetectSentiment",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_SYNTAX = OperationModel.new(
        name: "DetectSyntax",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_TARGETED_SENTIMENT = OperationModel.new(
        name: "DetectTargetedSentiment",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_TOXIC_CONTENT = OperationModel.new(
        name: "DetectToxicContent",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_MODEL = OperationModel.new(
        name: "ImportModel",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENT_CLASSIFICATION_JOBS = OperationModel.new(
        name: "ListDocumentClassificationJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENT_CLASSIFIER_SUMMARIES = OperationModel.new(
        name: "ListDocumentClassifierSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOCUMENT_CLASSIFIERS = OperationModel.new(
        name: "ListDocumentClassifiers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DOMINANT_LANGUAGE_DETECTION_JOBS = OperationModel.new(
        name: "ListDominantLanguageDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINTS = OperationModel.new(
        name: "ListEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITIES_DETECTION_JOBS = OperationModel.new(
        name: "ListEntitiesDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITY_RECOGNIZER_SUMMARIES = OperationModel.new(
        name: "ListEntityRecognizerSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITY_RECOGNIZERS = OperationModel.new(
        name: "ListEntityRecognizers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENTS_DETECTION_JOBS = OperationModel.new(
        name: "ListEventsDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLYWHEEL_ITERATION_HISTORY = OperationModel.new(
        name: "ListFlywheelIterationHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLYWHEELS = OperationModel.new(
        name: "ListFlywheels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_KEY_PHRASES_DETECTION_JOBS = OperationModel.new(
        name: "ListKeyPhrasesDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PII_ENTITIES_DETECTION_JOBS = OperationModel.new(
        name: "ListPiiEntitiesDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SENTIMENT_DETECTION_JOBS = OperationModel.new(
        name: "ListSentimentDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TARGETED_SENTIMENT_DETECTION_JOBS = OperationModel.new(
        name: "ListTargetedSentimentDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TOPICS_DETECTION_JOBS = OperationModel.new(
        name: "ListTopicsDetectionJobs",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      START_DOCUMENT_CLASSIFICATION_JOB = OperationModel.new(
        name: "StartDocumentClassificationJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_DOMINANT_LANGUAGE_DETECTION_JOB = OperationModel.new(
        name: "StartDominantLanguageDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "StartEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_EVENTS_DETECTION_JOB = OperationModel.new(
        name: "StartEventsDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_FLYWHEEL_ITERATION = OperationModel.new(
        name: "StartFlywheelIteration",
        http_method: "POST",
        request_uri: "/"
      )

      START_KEY_PHRASES_DETECTION_JOB = OperationModel.new(
        name: "StartKeyPhrasesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_PII_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "StartPiiEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "StartSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_TARGETED_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "StartTargetedSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_TOPICS_DETECTION_JOB = OperationModel.new(
        name: "StartTopicsDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DOMINANT_LANGUAGE_DETECTION_JOB = OperationModel.new(
        name: "StopDominantLanguageDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "StopEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_EVENTS_DETECTION_JOB = OperationModel.new(
        name: "StopEventsDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_KEY_PHRASES_DETECTION_JOB = OperationModel.new(
        name: "StopKeyPhrasesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PII_ENTITIES_DETECTION_JOB = OperationModel.new(
        name: "StopPiiEntitiesDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "StopSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TARGETED_SENTIMENT_DETECTION_JOB = OperationModel.new(
        name: "StopTargetedSentimentDetectionJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TRAINING_DOCUMENT_CLASSIFIER = OperationModel.new(
        name: "StopTrainingDocumentClassifier",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_TRAINING_ENTITY_RECOGNIZER = OperationModel.new(
        name: "StopTrainingEntityRecognizer",
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

      UPDATE_ENDPOINT = OperationModel.new(
        name: "UpdateEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLYWHEEL = OperationModel.new(
        name: "UpdateFlywheel",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
