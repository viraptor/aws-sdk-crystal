module AwsSdk
  module CleanRooms
    module Model
      API_VERSION = "2022-02-17"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cleanrooms"
      ENDPOINT_PREFIX = "cleanrooms"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cleanrooms.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_COLLABORATION_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "BatchGetCollaborationAnalysisTemplate",
        http_method: "POST",
        request_uri: "/collaborations/{collaborationIdentifier}/batch-analysistemplates"
      )

      BATCH_GET_SCHEMA = OperationModel.new(
        name: "BatchGetSchema",
        http_method: "POST",
        request_uri: "/collaborations/{collaborationIdentifier}/batch-schema"
      )

      BATCH_GET_SCHEMA_ANALYSIS_RULE = OperationModel.new(
        name: "BatchGetSchemaAnalysisRule",
        http_method: "POST",
        request_uri: "/collaborations/{collaborationIdentifier}/batch-schema-analysis-rule"
      )

      CREATE_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "CreateAnalysisTemplate",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/analysistemplates"
      )

      CREATE_COLLABORATION = OperationModel.new(
        name: "CreateCollaboration",
        http_method: "POST",
        request_uri: "/collaborations"
      )

      CREATE_COLLABORATION_CHANGE_REQUEST = OperationModel.new(
        name: "CreateCollaborationChangeRequest",
        http_method: "POST",
        request_uri: "/collaborations/{collaborationIdentifier}/changeRequests"
      )

      CREATE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION = OperationModel.new(
        name: "CreateConfiguredAudienceModelAssociation",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/configuredaudiencemodelassociations"
      )

      CREATE_CONFIGURED_TABLE = OperationModel.new(
        name: "CreateConfiguredTable",
        http_method: "POST",
        request_uri: "/configuredTables"
      )

      CREATE_CONFIGURED_TABLE_ANALYSIS_RULE = OperationModel.new(
        name: "CreateConfiguredTableAnalysisRule",
        http_method: "POST",
        request_uri: "/configuredTables/{configuredTableIdentifier}/analysisRule"
      )

      CREATE_CONFIGURED_TABLE_ASSOCIATION = OperationModel.new(
        name: "CreateConfiguredTableAssociation",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations"
      )

      CREATE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE = OperationModel.new(
        name: "CreateConfiguredTableAssociationAnalysisRule",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}/analysisRule"
      )

      CREATE_ID_MAPPING_TABLE = OperationModel.new(
        name: "CreateIdMappingTable",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables"
      )

      CREATE_ID_NAMESPACE_ASSOCIATION = OperationModel.new(
        name: "CreateIdNamespaceAssociation",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/idnamespaceassociations"
      )

      CREATE_MEMBERSHIP = OperationModel.new(
        name: "CreateMembership",
        http_method: "POST",
        request_uri: "/memberships"
      )

      CREATE_PRIVACY_BUDGET_TEMPLATE = OperationModel.new(
        name: "CreatePrivacyBudgetTemplate",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgettemplates"
      )

      DELETE_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "DeleteAnalysisTemplate",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/analysistemplates/{analysisTemplateIdentifier}"
      )

      DELETE_COLLABORATION = OperationModel.new(
        name: "DeleteCollaboration",
        http_method: "DELETE",
        request_uri: "/collaborations/{collaborationIdentifier}"
      )

      DELETE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION = OperationModel.new(
        name: "DeleteConfiguredAudienceModelAssociation",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/configuredaudiencemodelassociations/{configuredAudienceModelAssociationIdentifier}"
      )

      DELETE_CONFIGURED_TABLE = OperationModel.new(
        name: "DeleteConfiguredTable",
        http_method: "DELETE",
        request_uri: "/configuredTables/{configuredTableIdentifier}"
      )

      DELETE_CONFIGURED_TABLE_ANALYSIS_RULE = OperationModel.new(
        name: "DeleteConfiguredTableAnalysisRule",
        http_method: "DELETE",
        request_uri: "/configuredTables/{configuredTableIdentifier}/analysisRule/{analysisRuleType}"
      )

      DELETE_CONFIGURED_TABLE_ASSOCIATION = OperationModel.new(
        name: "DeleteConfiguredTableAssociation",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}"
      )

      DELETE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE = OperationModel.new(
        name: "DeleteConfiguredTableAssociationAnalysisRule",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}/analysisRule/{analysisRuleType}"
      )

      DELETE_ID_MAPPING_TABLE = OperationModel.new(
        name: "DeleteIdMappingTable",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables/{idMappingTableIdentifier}"
      )

      DELETE_ID_NAMESPACE_ASSOCIATION = OperationModel.new(
        name: "DeleteIdNamespaceAssociation",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/idnamespaceassociations/{idNamespaceAssociationIdentifier}"
      )

      DELETE_MEMBER = OperationModel.new(
        name: "DeleteMember",
        http_method: "DELETE",
        request_uri: "/collaborations/{collaborationIdentifier}/member/{accountId}"
      )

      DELETE_MEMBERSHIP = OperationModel.new(
        name: "DeleteMembership",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}"
      )

      DELETE_PRIVACY_BUDGET_TEMPLATE = OperationModel.new(
        name: "DeletePrivacyBudgetTemplate",
        http_method: "DELETE",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgettemplates/{privacyBudgetTemplateIdentifier}"
      )

      GET_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "GetAnalysisTemplate",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/analysistemplates/{analysisTemplateIdentifier}"
      )

      GET_COLLABORATION = OperationModel.new(
        name: "GetCollaboration",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}"
      )

      GET_COLLABORATION_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "GetCollaborationAnalysisTemplate",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/analysistemplates/{analysisTemplateArn}"
      )

      GET_COLLABORATION_CHANGE_REQUEST = OperationModel.new(
        name: "GetCollaborationChangeRequest",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/changeRequests/{changeRequestIdentifier}"
      )

      GET_COLLABORATION_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION = OperationModel.new(
        name: "GetCollaborationConfiguredAudienceModelAssociation",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/configuredaudiencemodelassociations/{configuredAudienceModelAssociationIdentifier}"
      )

      GET_COLLABORATION_ID_NAMESPACE_ASSOCIATION = OperationModel.new(
        name: "GetCollaborationIdNamespaceAssociation",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/idnamespaceassociations/{idNamespaceAssociationIdentifier}"
      )

      GET_COLLABORATION_PRIVACY_BUDGET_TEMPLATE = OperationModel.new(
        name: "GetCollaborationPrivacyBudgetTemplate",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/privacybudgettemplates/{privacyBudgetTemplateIdentifier}"
      )

      GET_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION = OperationModel.new(
        name: "GetConfiguredAudienceModelAssociation",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configuredaudiencemodelassociations/{configuredAudienceModelAssociationIdentifier}"
      )

      GET_CONFIGURED_TABLE = OperationModel.new(
        name: "GetConfiguredTable",
        http_method: "GET",
        request_uri: "/configuredTables/{configuredTableIdentifier}"
      )

      GET_CONFIGURED_TABLE_ANALYSIS_RULE = OperationModel.new(
        name: "GetConfiguredTableAnalysisRule",
        http_method: "GET",
        request_uri: "/configuredTables/{configuredTableIdentifier}/analysisRule/{analysisRuleType}"
      )

      GET_CONFIGURED_TABLE_ASSOCIATION = OperationModel.new(
        name: "GetConfiguredTableAssociation",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}"
      )

      GET_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE = OperationModel.new(
        name: "GetConfiguredTableAssociationAnalysisRule",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}/analysisRule/{analysisRuleType}"
      )

      GET_ID_MAPPING_TABLE = OperationModel.new(
        name: "GetIdMappingTable",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables/{idMappingTableIdentifier}"
      )

      GET_ID_NAMESPACE_ASSOCIATION = OperationModel.new(
        name: "GetIdNamespaceAssociation",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/idnamespaceassociations/{idNamespaceAssociationIdentifier}"
      )

      GET_MEMBERSHIP = OperationModel.new(
        name: "GetMembership",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}"
      )

      GET_PRIVACY_BUDGET_TEMPLATE = OperationModel.new(
        name: "GetPrivacyBudgetTemplate",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgettemplates/{privacyBudgetTemplateIdentifier}"
      )

      GET_PROTECTED_JOB = OperationModel.new(
        name: "GetProtectedJob",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/protectedJobs/{protectedJobIdentifier}"
      )

      GET_PROTECTED_QUERY = OperationModel.new(
        name: "GetProtectedQuery",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/protectedQueries/{protectedQueryIdentifier}"
      )

      GET_SCHEMA = OperationModel.new(
        name: "GetSchema",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/schemas/{name}"
      )

      GET_SCHEMA_ANALYSIS_RULE = OperationModel.new(
        name: "GetSchemaAnalysisRule",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/schemas/{name}/analysisRule/{type}"
      )

      LIST_ANALYSIS_TEMPLATES = OperationModel.new(
        name: "ListAnalysisTemplates",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/analysistemplates"
      )

      LIST_COLLABORATION_ANALYSIS_TEMPLATES = OperationModel.new(
        name: "ListCollaborationAnalysisTemplates",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/analysistemplates"
      )

      LIST_COLLABORATION_CHANGE_REQUESTS = OperationModel.new(
        name: "ListCollaborationChangeRequests",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/changeRequests"
      )

      LIST_COLLABORATION_CONFIGURED_AUDIENCE_MODEL_ASSOCIATIONS = OperationModel.new(
        name: "ListCollaborationConfiguredAudienceModelAssociations",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/configuredaudiencemodelassociations"
      )

      LIST_COLLABORATION_ID_NAMESPACE_ASSOCIATIONS = OperationModel.new(
        name: "ListCollaborationIdNamespaceAssociations",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/idnamespaceassociations"
      )

      LIST_COLLABORATION_PRIVACY_BUDGET_TEMPLATES = OperationModel.new(
        name: "ListCollaborationPrivacyBudgetTemplates",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/privacybudgettemplates"
      )

      LIST_COLLABORATION_PRIVACY_BUDGETS = OperationModel.new(
        name: "ListCollaborationPrivacyBudgets",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/privacybudgets"
      )

      LIST_COLLABORATIONS = OperationModel.new(
        name: "ListCollaborations",
        http_method: "GET",
        request_uri: "/collaborations"
      )

      LIST_CONFIGURED_AUDIENCE_MODEL_ASSOCIATIONS = OperationModel.new(
        name: "ListConfiguredAudienceModelAssociations",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configuredaudiencemodelassociations"
      )

      LIST_CONFIGURED_TABLE_ASSOCIATIONS = OperationModel.new(
        name: "ListConfiguredTableAssociations",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations"
      )

      LIST_CONFIGURED_TABLES = OperationModel.new(
        name: "ListConfiguredTables",
        http_method: "GET",
        request_uri: "/configuredTables"
      )

      LIST_ID_MAPPING_TABLES = OperationModel.new(
        name: "ListIdMappingTables",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables"
      )

      LIST_ID_NAMESPACE_ASSOCIATIONS = OperationModel.new(
        name: "ListIdNamespaceAssociations",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/idnamespaceassociations"
      )

      LIST_MEMBERS = OperationModel.new(
        name: "ListMembers",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/members"
      )

      LIST_MEMBERSHIPS = OperationModel.new(
        name: "ListMemberships",
        http_method: "GET",
        request_uri: "/memberships"
      )

      LIST_PRIVACY_BUDGET_TEMPLATES = OperationModel.new(
        name: "ListPrivacyBudgetTemplates",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgettemplates"
      )

      LIST_PRIVACY_BUDGETS = OperationModel.new(
        name: "ListPrivacyBudgets",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgets"
      )

      LIST_PROTECTED_JOBS = OperationModel.new(
        name: "ListProtectedJobs",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/protectedJobs"
      )

      LIST_PROTECTED_QUERIES = OperationModel.new(
        name: "ListProtectedQueries",
        http_method: "GET",
        request_uri: "/memberships/{membershipIdentifier}/protectedQueries"
      )

      LIST_SCHEMAS = OperationModel.new(
        name: "ListSchemas",
        http_method: "GET",
        request_uri: "/collaborations/{collaborationIdentifier}/schemas"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      POPULATE_ID_MAPPING_TABLE = OperationModel.new(
        name: "PopulateIdMappingTable",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables/{idMappingTableIdentifier}/populate"
      )

      PREVIEW_PRIVACY_IMPACT = OperationModel.new(
        name: "PreviewPrivacyImpact",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/previewprivacyimpact"
      )

      START_PROTECTED_JOB = OperationModel.new(
        name: "StartProtectedJob",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/protectedJobs"
      )

      START_PROTECTED_QUERY = OperationModel.new(
        name: "StartProtectedQuery",
        http_method: "POST",
        request_uri: "/memberships/{membershipIdentifier}/protectedQueries"
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

      UPDATE_ANALYSIS_TEMPLATE = OperationModel.new(
        name: "UpdateAnalysisTemplate",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/analysistemplates/{analysisTemplateIdentifier}"
      )

      UPDATE_COLLABORATION = OperationModel.new(
        name: "UpdateCollaboration",
        http_method: "PATCH",
        request_uri: "/collaborations/{collaborationIdentifier}"
      )

      UPDATE_COLLABORATION_CHANGE_REQUEST = OperationModel.new(
        name: "UpdateCollaborationChangeRequest",
        http_method: "PATCH",
        request_uri: "/collaborations/{collaborationIdentifier}/changeRequests/{changeRequestIdentifier}"
      )

      UPDATE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION = OperationModel.new(
        name: "UpdateConfiguredAudienceModelAssociation",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/configuredaudiencemodelassociations/{configuredAudienceModelAssociationIdentifier}"
      )

      UPDATE_CONFIGURED_TABLE = OperationModel.new(
        name: "UpdateConfiguredTable",
        http_method: "PATCH",
        request_uri: "/configuredTables/{configuredTableIdentifier}"
      )

      UPDATE_CONFIGURED_TABLE_ANALYSIS_RULE = OperationModel.new(
        name: "UpdateConfiguredTableAnalysisRule",
        http_method: "PATCH",
        request_uri: "/configuredTables/{configuredTableIdentifier}/analysisRule/{analysisRuleType}"
      )

      UPDATE_CONFIGURED_TABLE_ASSOCIATION = OperationModel.new(
        name: "UpdateConfiguredTableAssociation",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}"
      )

      UPDATE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE = OperationModel.new(
        name: "UpdateConfiguredTableAssociationAnalysisRule",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/configuredTableAssociations/{configuredTableAssociationIdentifier}/analysisRule/{analysisRuleType}"
      )

      UPDATE_ID_MAPPING_TABLE = OperationModel.new(
        name: "UpdateIdMappingTable",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/idmappingtables/{idMappingTableIdentifier}"
      )

      UPDATE_ID_NAMESPACE_ASSOCIATION = OperationModel.new(
        name: "UpdateIdNamespaceAssociation",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/idnamespaceassociations/{idNamespaceAssociationIdentifier}"
      )

      UPDATE_MEMBERSHIP = OperationModel.new(
        name: "UpdateMembership",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}"
      )

      UPDATE_PRIVACY_BUDGET_TEMPLATE = OperationModel.new(
        name: "UpdatePrivacyBudgetTemplate",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/privacybudgettemplates/{privacyBudgetTemplateIdentifier}"
      )

      UPDATE_PROTECTED_JOB = OperationModel.new(
        name: "UpdateProtectedJob",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/protectedJobs/{protectedJobIdentifier}"
      )

      UPDATE_PROTECTED_QUERY = OperationModel.new(
        name: "UpdateProtectedQuery",
        http_method: "PATCH",
        request_uri: "/memberships/{membershipIdentifier}/protectedQueries/{protectedQueryIdentifier}"
      )
    end
  end
end
