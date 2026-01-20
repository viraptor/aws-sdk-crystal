module AwsSdk
  module ConnectCases
    module Model
      API_VERSION = "2022-10-03"
      TARGET_PREFIX = ""
      SIGNING_NAME = "cases"
      ENDPOINT_PREFIX = "cases"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cases-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cases-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cases.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://cases.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_CASE_RULE = OperationModel.new(
        name: "BatchGetCaseRule",
        http_method: "POST",
        request_uri: "/domains/{domainId}/rules-batch"
      )

      BATCH_GET_FIELD = OperationModel.new(
        name: "BatchGetField",
        http_method: "POST",
        request_uri: "/domains/{domainId}/fields-batch"
      )

      BATCH_PUT_FIELD_OPTIONS = OperationModel.new(
        name: "BatchPutFieldOptions",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/fields/{fieldId}/options"
      )

      CREATE_CASE = OperationModel.new(
        name: "CreateCase",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases"
      )

      CREATE_CASE_RULE = OperationModel.new(
        name: "CreateCaseRule",
        http_method: "POST",
        request_uri: "/domains/{domainId}/case-rules"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/domains"
      )

      CREATE_FIELD = OperationModel.new(
        name: "CreateField",
        http_method: "POST",
        request_uri: "/domains/{domainId}/fields"
      )

      CREATE_LAYOUT = OperationModel.new(
        name: "CreateLayout",
        http_method: "POST",
        request_uri: "/domains/{domainId}/layouts"
      )

      CREATE_RELATED_ITEM = OperationModel.new(
        name: "CreateRelatedItem",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases/{caseId}/related-items/"
      )

      CREATE_TEMPLATE = OperationModel.new(
        name: "CreateTemplate",
        http_method: "POST",
        request_uri: "/domains/{domainId}/templates"
      )

      DELETE_CASE = OperationModel.new(
        name: "DeleteCase",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/cases/{caseId}"
      )

      DELETE_CASE_RULE = OperationModel.new(
        name: "DeleteCaseRule",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/case-rules/{caseRuleId}"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}"
      )

      DELETE_FIELD = OperationModel.new(
        name: "DeleteField",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/fields/{fieldId}"
      )

      DELETE_LAYOUT = OperationModel.new(
        name: "DeleteLayout",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/layouts/{layoutId}"
      )

      DELETE_RELATED_ITEM = OperationModel.new(
        name: "DeleteRelatedItem",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/cases/{caseId}/related-items/{relatedItemId}"
      )

      DELETE_TEMPLATE = OperationModel.new(
        name: "DeleteTemplate",
        http_method: "DELETE",
        request_uri: "/domains/{domainId}/templates/{templateId}"
      )

      GET_CASE = OperationModel.new(
        name: "GetCase",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases/{caseId}"
      )

      GET_CASE_AUDIT_EVENTS = OperationModel.new(
        name: "GetCaseAuditEvents",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases/{caseId}/audit-history"
      )

      GET_CASE_EVENT_CONFIGURATION = OperationModel.new(
        name: "GetCaseEventConfiguration",
        http_method: "POST",
        request_uri: "/domains/{domainId}/case-event-configuration"
      )

      GET_DOMAIN = OperationModel.new(
        name: "GetDomain",
        http_method: "POST",
        request_uri: "/domains/{domainId}"
      )

      GET_LAYOUT = OperationModel.new(
        name: "GetLayout",
        http_method: "POST",
        request_uri: "/domains/{domainId}/layouts/{layoutId}"
      )

      GET_TEMPLATE = OperationModel.new(
        name: "GetTemplate",
        http_method: "POST",
        request_uri: "/domains/{domainId}/templates/{templateId}"
      )

      LIST_CASE_RULES = OperationModel.new(
        name: "ListCaseRules",
        http_method: "POST",
        request_uri: "/domains/{domainId}/rules-list/"
      )

      LIST_CASES_FOR_CONTACT = OperationModel.new(
        name: "ListCasesForContact",
        http_method: "POST",
        request_uri: "/domains/{domainId}/list-cases-for-contact"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "POST",
        request_uri: "/domains-list"
      )

      LIST_FIELD_OPTIONS = OperationModel.new(
        name: "ListFieldOptions",
        http_method: "POST",
        request_uri: "/domains/{domainId}/fields/{fieldId}/options-list"
      )

      LIST_FIELDS = OperationModel.new(
        name: "ListFields",
        http_method: "POST",
        request_uri: "/domains/{domainId}/fields-list"
      )

      LIST_LAYOUTS = OperationModel.new(
        name: "ListLayouts",
        http_method: "POST",
        request_uri: "/domains/{domainId}/layouts-list"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{arn}"
      )

      LIST_TEMPLATES = OperationModel.new(
        name: "ListTemplates",
        http_method: "POST",
        request_uri: "/domains/{domainId}/templates-list"
      )

      PUT_CASE_EVENT_CONFIGURATION = OperationModel.new(
        name: "PutCaseEventConfiguration",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/case-event-configuration"
      )

      SEARCH_ALL_RELATED_ITEMS = OperationModel.new(
        name: "SearchAllRelatedItems",
        http_method: "POST",
        request_uri: "/domains/{domainId}/related-items-search"
      )

      SEARCH_CASES = OperationModel.new(
        name: "SearchCases",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases-search"
      )

      SEARCH_RELATED_ITEMS = OperationModel.new(
        name: "SearchRelatedItems",
        http_method: "POST",
        request_uri: "/domains/{domainId}/cases/{caseId}/related-items-search"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{arn}"
      )

      UPDATE_CASE = OperationModel.new(
        name: "UpdateCase",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/cases/{caseId}"
      )

      UPDATE_CASE_RULE = OperationModel.new(
        name: "UpdateCaseRule",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/case-rules/{caseRuleId}"
      )

      UPDATE_FIELD = OperationModel.new(
        name: "UpdateField",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/fields/{fieldId}"
      )

      UPDATE_LAYOUT = OperationModel.new(
        name: "UpdateLayout",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/layouts/{layoutId}"
      )

      UPDATE_TEMPLATE = OperationModel.new(
        name: "UpdateTemplate",
        http_method: "PUT",
        request_uri: "/domains/{domainId}/templates/{templateId}"
      )
    end
  end
end
