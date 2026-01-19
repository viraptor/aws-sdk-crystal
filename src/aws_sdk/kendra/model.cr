module AwsSdk
  module Kendra
    module Model
      API_VERSION = "2019-02-03"
      TARGET_PREFIX = "AWSKendraFrontendService"
      SIGNING_NAME = "kendra"
      ENDPOINT_PREFIX = "kendra"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kendra-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kendra-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://kendra.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://kendra.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ENTITIES_TO_EXPERIENCE = OperationModel.new(
        name: "AssociateEntitiesToExperience",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_PERSONAS_TO_ENTITIES = OperationModel.new(
        name: "AssociatePersonasToEntities",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_DOCUMENT = OperationModel.new(
        name: "BatchDeleteDocument",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_FEATURED_RESULTS_SET = OperationModel.new(
        name: "BatchDeleteFeaturedResultsSet",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_DOCUMENT_STATUS = OperationModel.new(
        name: "BatchGetDocumentStatus",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_PUT_DOCUMENT = OperationModel.new(
        name: "BatchPutDocument",
        http_method: "POST",
        request_uri: "/"
      )

      CLEAR_QUERY_SUGGESTIONS = OperationModel.new(
        name: "ClearQuerySuggestions",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCESS_CONTROL_CONFIGURATION = OperationModel.new(
        name: "CreateAccessControlConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPERIENCE = OperationModel.new(
        name: "CreateExperience",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FAQ = OperationModel.new(
        name: "CreateFaq",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FEATURED_RESULTS_SET = OperationModel.new(
        name: "CreateFeaturedResultsSet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_QUERY_SUGGESTIONS_BLOCK_LIST = OperationModel.new(
        name: "CreateQuerySuggestionsBlockList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_THESAURUS = OperationModel.new(
        name: "CreateThesaurus",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCESS_CONTROL_CONFIGURATION = OperationModel.new(
        name: "DeleteAccessControlConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EXPERIENCE = OperationModel.new(
        name: "DeleteExperience",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FAQ = OperationModel.new(
        name: "DeleteFaq",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PRINCIPAL_MAPPING = OperationModel.new(
        name: "DeletePrincipalMapping",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_QUERY_SUGGESTIONS_BLOCK_LIST = OperationModel.new(
        name: "DeleteQuerySuggestionsBlockList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_THESAURUS = OperationModel.new(
        name: "DeleteThesaurus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCESS_CONTROL_CONFIGURATION = OperationModel.new(
        name: "DescribeAccessControlConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_SOURCE = OperationModel.new(
        name: "DescribeDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPERIENCE = OperationModel.new(
        name: "DescribeExperience",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FAQ = OperationModel.new(
        name: "DescribeFaq",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FEATURED_RESULTS_SET = OperationModel.new(
        name: "DescribeFeaturedResultsSet",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INDEX = OperationModel.new(
        name: "DescribeIndex",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PRINCIPAL_MAPPING = OperationModel.new(
        name: "DescribePrincipalMapping",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_QUERY_SUGGESTIONS_BLOCK_LIST = OperationModel.new(
        name: "DescribeQuerySuggestionsBlockList",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_QUERY_SUGGESTIONS_CONFIG = OperationModel.new(
        name: "DescribeQuerySuggestionsConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_THESAURUS = OperationModel.new(
        name: "DescribeThesaurus",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ENTITIES_FROM_EXPERIENCE = OperationModel.new(
        name: "DisassociateEntitiesFromExperience",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_PERSONAS_FROM_ENTITIES = OperationModel.new(
        name: "DisassociatePersonasFromEntities",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_SUGGESTIONS = OperationModel.new(
        name: "GetQuerySuggestions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SNAPSHOTS = OperationModel.new(
        name: "GetSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCESS_CONTROL_CONFIGURATIONS = OperationModel.new(
        name: "ListAccessControlConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_SOURCE_SYNC_JOBS = OperationModel.new(
        name: "ListDataSourceSyncJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITY_PERSONAS = OperationModel.new(
        name: "ListEntityPersonas",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPERIENCE_ENTITIES = OperationModel.new(
        name: "ListExperienceEntities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPERIENCES = OperationModel.new(
        name: "ListExperiences",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FAQS = OperationModel.new(
        name: "ListFaqs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FEATURED_RESULTS_SETS = OperationModel.new(
        name: "ListFeaturedResultsSets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GROUPS_OLDER_THAN_ORDERING_ID = OperationModel.new(
        name: "ListGroupsOlderThanOrderingId",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INDICES = OperationModel.new(
        name: "ListIndices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUERY_SUGGESTIONS_BLOCK_LISTS = OperationModel.new(
        name: "ListQuerySuggestionsBlockLists",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_THESAURI = OperationModel.new(
        name: "ListThesauri",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_PRINCIPAL_MAPPING = OperationModel.new(
        name: "PutPrincipalMapping",
        http_method: "POST",
        request_uri: "/"
      )

      QUERY = OperationModel.new(
        name: "Query",
        http_method: "POST",
        request_uri: "/"
      )

      RETRIEVE = OperationModel.new(
        name: "Retrieve",
        http_method: "POST",
        request_uri: "/"
      )

      START_DATA_SOURCE_SYNC_JOB = OperationModel.new(
        name: "StartDataSourceSyncJob",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DATA_SOURCE_SYNC_JOB = OperationModel.new(
        name: "StopDataSourceSyncJob",
        http_method: "POST",
        request_uri: "/"
      )

      SUBMIT_FEEDBACK = OperationModel.new(
        name: "SubmitFeedback",
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

      UPDATE_ACCESS_CONTROL_CONFIGURATION = OperationModel.new(
        name: "UpdateAccessControlConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EXPERIENCE = OperationModel.new(
        name: "UpdateExperience",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FEATURED_RESULTS_SET = OperationModel.new(
        name: "UpdateFeaturedResultsSet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INDEX = OperationModel.new(
        name: "UpdateIndex",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_QUERY_SUGGESTIONS_BLOCK_LIST = OperationModel.new(
        name: "UpdateQuerySuggestionsBlockList",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_QUERY_SUGGESTIONS_CONFIG = OperationModel.new(
        name: "UpdateQuerySuggestionsConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_THESAURUS = OperationModel.new(
        name: "UpdateThesaurus",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
