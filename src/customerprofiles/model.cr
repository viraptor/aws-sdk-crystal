module Aws
  module CustomerProfiles
    module Model
      API_VERSION = "2020-08-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "profile"
      ENDPOINT_PREFIX = "profile"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://profile-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://profile-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://profile.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://profile.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_PROFILE_KEY = OperationModel.new(
        name: "AddProfileKey",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/keys"
      )

      BATCH_GET_CALCULATED_ATTRIBUTE_FOR_PROFILE = OperationModel.new(
        name: "BatchGetCalculatedAttributeForProfile",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/calculated-attributes/{CalculatedAttributeName}/batch-get-for-profiles"
      )

      BATCH_GET_PROFILE = OperationModel.new(
        name: "BatchGetProfile",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/batch-get-profiles"
      )

      CREATE_CALCULATED_ATTRIBUTE_DEFINITION = OperationModel.new(
        name: "CreateCalculatedAttributeDefinition",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/calculated-attributes/{CalculatedAttributeName}"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/domains/{DomainName}"
      )

      CREATE_DOMAIN_LAYOUT = OperationModel.new(
        name: "CreateDomainLayout",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/layouts/{LayoutDefinitionName}"
      )

      CREATE_EVENT_STREAM = OperationModel.new(
        name: "CreateEventStream",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/event-streams/{EventStreamName}"
      )

      CREATE_EVENT_TRIGGER = OperationModel.new(
        name: "CreateEventTrigger",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/event-triggers/{EventTriggerName}"
      )

      CREATE_INTEGRATION_WORKFLOW = OperationModel.new(
        name: "CreateIntegrationWorkflow",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/workflows/integrations"
      )

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles"
      )

      CREATE_RECOMMENDER = OperationModel.new(
        name: "CreateRecommender",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}"
      )

      CREATE_SEGMENT_DEFINITION = OperationModel.new(
        name: "CreateSegmentDefinition",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/segment-definitions/{SegmentDefinitionName}"
      )

      CREATE_SEGMENT_ESTIMATE = OperationModel.new(
        name: "CreateSegmentEstimate",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/segment-estimates"
      )

      CREATE_SEGMENT_SNAPSHOT = OperationModel.new(
        name: "CreateSegmentSnapshot",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/segments/{SegmentDefinitionName}/snapshots"
      )

      CREATE_UPLOAD_JOB = OperationModel.new(
        name: "CreateUploadJob",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/upload-jobs"
      )

      DELETE_CALCULATED_ATTRIBUTE_DEFINITION = OperationModel.new(
        name: "DeleteCalculatedAttributeDefinition",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/calculated-attributes/{CalculatedAttributeName}"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}"
      )

      DELETE_DOMAIN_LAYOUT = OperationModel.new(
        name: "DeleteDomainLayout",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/layouts/{LayoutDefinitionName}"
      )

      DELETE_DOMAIN_OBJECT_TYPE = OperationModel.new(
        name: "DeleteDomainObjectType",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/domain-object-types/{ObjectTypeName}"
      )

      DELETE_EVENT_STREAM = OperationModel.new(
        name: "DeleteEventStream",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/event-streams/{EventStreamName}"
      )

      DELETE_EVENT_TRIGGER = OperationModel.new(
        name: "DeleteEventTrigger",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/event-triggers/{EventTriggerName}"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/integrations/delete"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/delete"
      )

      DELETE_PROFILE_KEY = OperationModel.new(
        name: "DeleteProfileKey",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/keys/delete"
      )

      DELETE_PROFILE_OBJECT = OperationModel.new(
        name: "DeleteProfileObject",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/objects/delete"
      )

      DELETE_PROFILE_OBJECT_TYPE = OperationModel.new(
        name: "DeleteProfileObjectType",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}"
      )

      DELETE_RECOMMENDER = OperationModel.new(
        name: "DeleteRecommender",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}"
      )

      DELETE_SEGMENT_DEFINITION = OperationModel.new(
        name: "DeleteSegmentDefinition",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/segment-definitions/{SegmentDefinitionName}"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "DELETE",
        request_uri: "/domains/{DomainName}/workflows/{WorkflowId}"
      )

      DETECT_PROFILE_OBJECT_TYPE = OperationModel.new(
        name: "DetectProfileObjectType",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/detect/object-types"
      )

      GET_AUTO_MERGING_PREVIEW = OperationModel.new(
        name: "GetAutoMergingPreview",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/identity-resolution-jobs/auto-merging-preview"
      )

      GET_CALCULATED_ATTRIBUTE_DEFINITION = OperationModel.new(
        name: "GetCalculatedAttributeDefinition",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/calculated-attributes/{CalculatedAttributeName}"
      )

      GET_CALCULATED_ATTRIBUTE_FOR_PROFILE = OperationModel.new(
        name: "GetCalculatedAttributeForProfile",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/profile/{ProfileId}/calculated-attributes/{CalculatedAttributeName}"
      )

      GET_DOMAIN = OperationModel.new(
        name: "GetDomain",
        http_method: "GET",
        request_uri: "/domains/{DomainName}"
      )

      GET_DOMAIN_LAYOUT = OperationModel.new(
        name: "GetDomainLayout",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/layouts/{LayoutDefinitionName}"
      )

      GET_DOMAIN_OBJECT_TYPE = OperationModel.new(
        name: "GetDomainObjectType",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/domain-object-types/{ObjectTypeName}"
      )

      GET_EVENT_STREAM = OperationModel.new(
        name: "GetEventStream",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/event-streams/{EventStreamName}"
      )

      GET_EVENT_TRIGGER = OperationModel.new(
        name: "GetEventTrigger",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/event-triggers/{EventTriggerName}"
      )

      GET_IDENTITY_RESOLUTION_JOB = OperationModel.new(
        name: "GetIdentityResolutionJob",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/identity-resolution-jobs/{JobId}"
      )

      GET_INTEGRATION = OperationModel.new(
        name: "GetIntegration",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/integrations"
      )

      GET_MATCHES = OperationModel.new(
        name: "GetMatches",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/matches"
      )

      GET_OBJECT_TYPE_ATTRIBUTE_STATISTICS = OperationModel.new(
        name: "GetObjectTypeAttributeStatistics",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}/attributes/{AttributeName}/statistics"
      )

      GET_PROFILE_HISTORY_RECORD = OperationModel.new(
        name: "GetProfileHistoryRecord",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/profiles/{ProfileId}/history-records/{Id}"
      )

      GET_PROFILE_OBJECT_TYPE = OperationModel.new(
        name: "GetProfileObjectType",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}"
      )

      GET_PROFILE_OBJECT_TYPE_TEMPLATE = OperationModel.new(
        name: "GetProfileObjectTypeTemplate",
        http_method: "GET",
        request_uri: "/templates/{TemplateId}"
      )

      GET_PROFILE_RECOMMENDATIONS = OperationModel.new(
        name: "GetProfileRecommendations",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/{ProfileId}/recommendations"
      )

      GET_RECOMMENDER = OperationModel.new(
        name: "GetRecommender",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}"
      )

      GET_SEGMENT_DEFINITION = OperationModel.new(
        name: "GetSegmentDefinition",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/segment-definitions/{SegmentDefinitionName}"
      )

      GET_SEGMENT_ESTIMATE = OperationModel.new(
        name: "GetSegmentEstimate",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/segment-estimates/{EstimateId}"
      )

      GET_SEGMENT_MEMBERSHIP = OperationModel.new(
        name: "GetSegmentMembership",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/segments/{SegmentDefinitionName}/membership"
      )

      GET_SEGMENT_SNAPSHOT = OperationModel.new(
        name: "GetSegmentSnapshot",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/segments/{SegmentDefinitionName}/snapshots/{SnapshotId}"
      )

      GET_SIMILAR_PROFILES = OperationModel.new(
        name: "GetSimilarProfiles",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/matches"
      )

      GET_UPLOAD_JOB = OperationModel.new(
        name: "GetUploadJob",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/upload-jobs/{JobId}"
      )

      GET_UPLOAD_JOB_PATH = OperationModel.new(
        name: "GetUploadJobPath",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/upload-jobs/{JobId}/path"
      )

      GET_WORKFLOW = OperationModel.new(
        name: "GetWorkflow",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/workflows/{WorkflowId}"
      )

      GET_WORKFLOW_STEPS = OperationModel.new(
        name: "GetWorkflowSteps",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/workflows/{WorkflowId}/steps"
      )

      LIST_ACCOUNT_INTEGRATIONS = OperationModel.new(
        name: "ListAccountIntegrations",
        http_method: "POST",
        request_uri: "/integrations"
      )

      LIST_CALCULATED_ATTRIBUTE_DEFINITIONS = OperationModel.new(
        name: "ListCalculatedAttributeDefinitions",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/calculated-attributes"
      )

      LIST_CALCULATED_ATTRIBUTES_FOR_PROFILE = OperationModel.new(
        name: "ListCalculatedAttributesForProfile",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/profile/{ProfileId}/calculated-attributes"
      )

      LIST_DOMAIN_LAYOUTS = OperationModel.new(
        name: "ListDomainLayouts",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/layouts"
      )

      LIST_DOMAIN_OBJECT_TYPES = OperationModel.new(
        name: "ListDomainObjectTypes",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/domain-object-types"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "GET",
        request_uri: "/domains"
      )

      LIST_EVENT_STREAMS = OperationModel.new(
        name: "ListEventStreams",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/event-streams"
      )

      LIST_EVENT_TRIGGERS = OperationModel.new(
        name: "ListEventTriggers",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/event-triggers"
      )

      LIST_IDENTITY_RESOLUTION_JOBS = OperationModel.new(
        name: "ListIdentityResolutionJobs",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/identity-resolution-jobs"
      )

      LIST_INTEGRATIONS = OperationModel.new(
        name: "ListIntegrations",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/integrations"
      )

      LIST_OBJECT_TYPE_ATTRIBUTE_VALUES = OperationModel.new(
        name: "ListObjectTypeAttributeValues",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}/attributes/{AttributeName}/values"
      )

      LIST_OBJECT_TYPE_ATTRIBUTES = OperationModel.new(
        name: "ListObjectTypeAttributes",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}/attributes"
      )

      LIST_PROFILE_ATTRIBUTE_VALUES = OperationModel.new(
        name: "ListProfileAttributeValues",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/profile-attributes/{AttributeName}/values"
      )

      LIST_PROFILE_HISTORY_RECORDS = OperationModel.new(
        name: "ListProfileHistoryRecords",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/history-records"
      )

      LIST_PROFILE_OBJECT_TYPE_TEMPLATES = OperationModel.new(
        name: "ListProfileObjectTypeTemplates",
        http_method: "GET",
        request_uri: "/templates"
      )

      LIST_PROFILE_OBJECT_TYPES = OperationModel.new(
        name: "ListProfileObjectTypes",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/object-types"
      )

      LIST_PROFILE_OBJECTS = OperationModel.new(
        name: "ListProfileObjects",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/objects"
      )

      LIST_RECOMMENDER_RECIPES = OperationModel.new(
        name: "ListRecommenderRecipes",
        http_method: "GET",
        request_uri: "/recommender-recipes"
      )

      LIST_RECOMMENDERS = OperationModel.new(
        name: "ListRecommenders",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/recommenders"
      )

      LIST_RULE_BASED_MATCHES = OperationModel.new(
        name: "ListRuleBasedMatches",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/profiles/ruleBasedMatches"
      )

      LIST_SEGMENT_DEFINITIONS = OperationModel.new(
        name: "ListSegmentDefinitions",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/segment-definitions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_UPLOAD_JOBS = OperationModel.new(
        name: "ListUploadJobs",
        http_method: "GET",
        request_uri: "/domains/{DomainName}/upload-jobs"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/workflows"
      )

      MERGE_PROFILES = OperationModel.new(
        name: "MergeProfiles",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/objects/merge"
      )

      PUT_DOMAIN_OBJECT_TYPE = OperationModel.new(
        name: "PutDomainObjectType",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/domain-object-types/{ObjectTypeName}"
      )

      PUT_INTEGRATION = OperationModel.new(
        name: "PutIntegration",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/integrations"
      )

      PUT_PROFILE_OBJECT = OperationModel.new(
        name: "PutProfileObject",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/profiles/objects"
      )

      PUT_PROFILE_OBJECT_TYPE = OperationModel.new(
        name: "PutProfileObjectType",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/object-types/{ObjectTypeName}"
      )

      SEARCH_PROFILES = OperationModel.new(
        name: "SearchProfiles",
        http_method: "POST",
        request_uri: "/domains/{DomainName}/profiles/search"
      )

      START_RECOMMENDER = OperationModel.new(
        name: "StartRecommender",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}/start"
      )

      START_UPLOAD_JOB = OperationModel.new(
        name: "StartUploadJob",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/upload-jobs/{JobId}"
      )

      STOP_RECOMMENDER = OperationModel.new(
        name: "StopRecommender",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}/stop"
      )

      STOP_UPLOAD_JOB = OperationModel.new(
        name: "StopUploadJob",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/upload-jobs/{JobId}/stop"
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

      UPDATE_CALCULATED_ATTRIBUTE_DEFINITION = OperationModel.new(
        name: "UpdateCalculatedAttributeDefinition",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/calculated-attributes/{CalculatedAttributeName}"
      )

      UPDATE_DOMAIN = OperationModel.new(
        name: "UpdateDomain",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}"
      )

      UPDATE_DOMAIN_LAYOUT = OperationModel.new(
        name: "UpdateDomainLayout",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/layouts/{LayoutDefinitionName}"
      )

      UPDATE_EVENT_TRIGGER = OperationModel.new(
        name: "UpdateEventTrigger",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/event-triggers/{EventTriggerName}"
      )

      UPDATE_PROFILE = OperationModel.new(
        name: "UpdateProfile",
        http_method: "PUT",
        request_uri: "/domains/{DomainName}/profiles"
      )

      UPDATE_RECOMMENDER = OperationModel.new(
        name: "UpdateRecommender",
        http_method: "PATCH",
        request_uri: "/domains/{DomainName}/recommenders/{RecommenderName}"
      )
    end
  end
end
