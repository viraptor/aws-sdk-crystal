module AwsSdk
  module Rekognition
    module Model
      API_VERSION = "2016-06-27"
      TARGET_PREFIX = "RekognitionService"
      SIGNING_NAME = "rekognition"
      ENDPOINT_PREFIX = "rekognition"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rekognition-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rekognition-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rekognition.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://rekognition.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_FACES = OperationModel.new(
        name: "AssociateFaces",
        http_method: "POST",
        request_uri: "/"
      )

      COMPARE_FACES = OperationModel.new(
        name: "CompareFaces",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_PROJECT_VERSION = OperationModel.new(
        name: "CopyProjectVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COLLECTION = OperationModel.new(
        name: "CreateCollection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FACE_LIVENESS_SESSION = OperationModel.new(
        name: "CreateFaceLivenessSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROJECT_VERSION = OperationModel.new(
        name: "CreateProjectVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STREAM_PROCESSOR = OperationModel.new(
        name: "CreateStreamProcessor",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COLLECTION = OperationModel.new(
        name: "DeleteCollection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FACES = OperationModel.new(
        name: "DeleteFaces",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT_POLICY = OperationModel.new(
        name: "DeleteProjectPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROJECT_VERSION = OperationModel.new(
        name: "DeleteProjectVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STREAM_PROCESSOR = OperationModel.new(
        name: "DeleteStreamProcessor",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COLLECTION = OperationModel.new(
        name: "DescribeCollection",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROJECT_VERSIONS = OperationModel.new(
        name: "DescribeProjectVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROJECTS = OperationModel.new(
        name: "DescribeProjects",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STREAM_PROCESSOR = OperationModel.new(
        name: "DescribeStreamProcessor",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_CUSTOM_LABELS = OperationModel.new(
        name: "DetectCustomLabels",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_FACES = OperationModel.new(
        name: "DetectFaces",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_LABELS = OperationModel.new(
        name: "DetectLabels",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_MODERATION_LABELS = OperationModel.new(
        name: "DetectModerationLabels",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_PROTECTIVE_EQUIPMENT = OperationModel.new(
        name: "DetectProtectiveEquipment",
        http_method: "POST",
        request_uri: "/"
      )

      DETECT_TEXT = OperationModel.new(
        name: "DetectText",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FACES = OperationModel.new(
        name: "DisassociateFaces",
        http_method: "POST",
        request_uri: "/"
      )

      DISTRIBUTE_DATASET_ENTRIES = OperationModel.new(
        name: "DistributeDatasetEntries",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CELEBRITY_INFO = OperationModel.new(
        name: "GetCelebrityInfo",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CELEBRITY_RECOGNITION = OperationModel.new(
        name: "GetCelebrityRecognition",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTENT_MODERATION = OperationModel.new(
        name: "GetContentModeration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FACE_DETECTION = OperationModel.new(
        name: "GetFaceDetection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FACE_LIVENESS_SESSION_RESULTS = OperationModel.new(
        name: "GetFaceLivenessSessionResults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FACE_SEARCH = OperationModel.new(
        name: "GetFaceSearch",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LABEL_DETECTION = OperationModel.new(
        name: "GetLabelDetection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MEDIA_ANALYSIS_JOB = OperationModel.new(
        name: "GetMediaAnalysisJob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PERSON_TRACKING = OperationModel.new(
        name: "GetPersonTracking",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SEGMENT_DETECTION = OperationModel.new(
        name: "GetSegmentDetection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TEXT_DETECTION = OperationModel.new(
        name: "GetTextDetection",
        http_method: "POST",
        request_uri: "/"
      )

      INDEX_FACES = OperationModel.new(
        name: "IndexFaces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COLLECTIONS = OperationModel.new(
        name: "ListCollections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASET_ENTRIES = OperationModel.new(
        name: "ListDatasetEntries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATASET_LABELS = OperationModel.new(
        name: "ListDatasetLabels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FACES = OperationModel.new(
        name: "ListFaces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MEDIA_ANALYSIS_JOBS = OperationModel.new(
        name: "ListMediaAnalysisJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROJECT_POLICIES = OperationModel.new(
        name: "ListProjectPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STREAM_PROCESSORS = OperationModel.new(
        name: "ListStreamProcessors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PROJECT_POLICY = OperationModel.new(
        name: "PutProjectPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RECOGNIZE_CELEBRITIES = OperationModel.new(
        name: "RecognizeCelebrities",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_FACES = OperationModel.new(
        name: "SearchFaces",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_FACES_BY_IMAGE = OperationModel.new(
        name: "SearchFacesByImage",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_USERS = OperationModel.new(
        name: "SearchUsers",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_USERS_BY_IMAGE = OperationModel.new(
        name: "SearchUsersByImage",
        http_method: "POST",
        request_uri: "/"
      )

      START_CELEBRITY_RECOGNITION = OperationModel.new(
        name: "StartCelebrityRecognition",
        http_method: "POST",
        request_uri: "/"
      )

      START_CONTENT_MODERATION = OperationModel.new(
        name: "StartContentModeration",
        http_method: "POST",
        request_uri: "/"
      )

      START_FACE_DETECTION = OperationModel.new(
        name: "StartFaceDetection",
        http_method: "POST",
        request_uri: "/"
      )

      START_FACE_SEARCH = OperationModel.new(
        name: "StartFaceSearch",
        http_method: "POST",
        request_uri: "/"
      )

      START_LABEL_DETECTION = OperationModel.new(
        name: "StartLabelDetection",
        http_method: "POST",
        request_uri: "/"
      )

      START_MEDIA_ANALYSIS_JOB = OperationModel.new(
        name: "StartMediaAnalysisJob",
        http_method: "POST",
        request_uri: "/"
      )

      START_PERSON_TRACKING = OperationModel.new(
        name: "StartPersonTracking",
        http_method: "POST",
        request_uri: "/"
      )

      START_PROJECT_VERSION = OperationModel.new(
        name: "StartProjectVersion",
        http_method: "POST",
        request_uri: "/"
      )

      START_SEGMENT_DETECTION = OperationModel.new(
        name: "StartSegmentDetection",
        http_method: "POST",
        request_uri: "/"
      )

      START_STREAM_PROCESSOR = OperationModel.new(
        name: "StartStreamProcessor",
        http_method: "POST",
        request_uri: "/"
      )

      START_TEXT_DETECTION = OperationModel.new(
        name: "StartTextDetection",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_PROJECT_VERSION = OperationModel.new(
        name: "StopProjectVersion",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_STREAM_PROCESSOR = OperationModel.new(
        name: "StopStreamProcessor",
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

      UPDATE_DATASET_ENTRIES = OperationModel.new(
        name: "UpdateDatasetEntries",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STREAM_PROCESSOR = OperationModel.new(
        name: "UpdateStreamProcessor",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
