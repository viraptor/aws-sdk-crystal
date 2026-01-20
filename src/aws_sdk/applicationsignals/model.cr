module AwsSdk
  module ApplicationSignals
    module Model
      API_VERSION = "2024-04-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "application-signals"
      ENDPOINT_PREFIX = "application-signals"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://application-signals-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://application-signals.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_SERVICE_LEVEL_OBJECTIVE_BUDGET_REPORT = OperationModel.new(
        name: "BatchGetServiceLevelObjectiveBudgetReport",
        http_method: "POST",
        request_uri: "/budget-report"
      )

      BATCH_UPDATE_EXCLUSION_WINDOWS = OperationModel.new(
        name: "BatchUpdateExclusionWindows",
        http_method: "PATCH",
        request_uri: "/exclusion-windows"
      )

      CREATE_SERVICE_LEVEL_OBJECTIVE = OperationModel.new(
        name: "CreateServiceLevelObjective",
        http_method: "POST",
        request_uri: "/slo"
      )

      DELETE_GROUPING_CONFIGURATION = OperationModel.new(
        name: "DeleteGroupingConfiguration",
        http_method: "DELETE",
        request_uri: "/grouping-configuration"
      )

      DELETE_SERVICE_LEVEL_OBJECTIVE = OperationModel.new(
        name: "DeleteServiceLevelObjective",
        http_method: "DELETE",
        request_uri: "/slo/{Id}"
      )

      GET_SERVICE = OperationModel.new(
        name: "GetService",
        http_method: "POST",
        request_uri: "/service"
      )

      GET_SERVICE_LEVEL_OBJECTIVE = OperationModel.new(
        name: "GetServiceLevelObjective",
        http_method: "GET",
        request_uri: "/slo/{Id}"
      )

      LIST_AUDIT_FINDINGS = OperationModel.new(
        name: "ListAuditFindings",
        http_method: "POST",
        request_uri: "/auditFindings"
      )

      LIST_ENTITY_EVENTS = OperationModel.new(
        name: "ListEntityEvents",
        http_method: "POST",
        request_uri: "/events"
      )

      LIST_GROUPING_ATTRIBUTE_DEFINITIONS = OperationModel.new(
        name: "ListGroupingAttributeDefinitions",
        http_method: "POST",
        request_uri: "/grouping-attribute-definitions"
      )

      LIST_SERVICE_DEPENDENCIES = OperationModel.new(
        name: "ListServiceDependencies",
        http_method: "POST",
        request_uri: "/service-dependencies"
      )

      LIST_SERVICE_DEPENDENTS = OperationModel.new(
        name: "ListServiceDependents",
        http_method: "POST",
        request_uri: "/service-dependents"
      )

      LIST_SERVICE_LEVEL_OBJECTIVE_EXCLUSION_WINDOWS = OperationModel.new(
        name: "ListServiceLevelObjectiveExclusionWindows",
        http_method: "GET",
        request_uri: "/slo/{Id}/exclusion-windows"
      )

      LIST_SERVICE_LEVEL_OBJECTIVES = OperationModel.new(
        name: "ListServiceLevelObjectives",
        http_method: "POST",
        request_uri: "/slos"
      )

      LIST_SERVICE_OPERATIONS = OperationModel.new(
        name: "ListServiceOperations",
        http_method: "POST",
        request_uri: "/service-operations"
      )

      LIST_SERVICE_STATES = OperationModel.new(
        name: "ListServiceStates",
        http_method: "POST",
        request_uri: "/service/states"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "GET",
        request_uri: "/services"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      PUT_GROUPING_CONFIGURATION = OperationModel.new(
        name: "PutGroupingConfiguration",
        http_method: "PUT",
        request_uri: "/grouping-configuration"
      )

      START_DISCOVERY = OperationModel.new(
        name: "StartDiscovery",
        http_method: "POST",
        request_uri: "/start-discovery"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/untag-resource"
      )

      UPDATE_SERVICE_LEVEL_OBJECTIVE = OperationModel.new(
        name: "UpdateServiceLevelObjective",
        http_method: "PATCH",
        request_uri: "/slo/{Id}"
      )
    end
  end
end
