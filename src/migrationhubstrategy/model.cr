module Aws
  module MigrationHubStrategy
    module Model
      API_VERSION = "2020-02-19"
      TARGET_PREFIX = ""
      SIGNING_NAME = "migrationhub-strategy"
      ENDPOINT_PREFIX = "migrationhub-strategy"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-strategy-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-strategy-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://migrationhub-strategy.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://migrationhub-strategy.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      GET_APPLICATION_COMPONENT_DETAILS = OperationModel.new(
        name: "GetApplicationComponentDetails",
        http_method: "GET",
        request_uri: "/get-applicationcomponent-details/{applicationComponentId}"
      )

      GET_APPLICATION_COMPONENT_STRATEGIES = OperationModel.new(
        name: "GetApplicationComponentStrategies",
        http_method: "GET",
        request_uri: "/get-applicationcomponent-strategies/{applicationComponentId}"
      )

      GET_ASSESSMENT = OperationModel.new(
        name: "GetAssessment",
        http_method: "GET",
        request_uri: "/get-assessment/{id}"
      )

      GET_IMPORT_FILE_TASK = OperationModel.new(
        name: "GetImportFileTask",
        http_method: "GET",
        request_uri: "/get-import-file-task/{id}"
      )

      GET_LATEST_ASSESSMENT_ID = OperationModel.new(
        name: "GetLatestAssessmentId",
        http_method: "GET",
        request_uri: "/get-latest-assessment-id"
      )

      GET_PORTFOLIO_PREFERENCES = OperationModel.new(
        name: "GetPortfolioPreferences",
        http_method: "GET",
        request_uri: "/get-portfolio-preferences"
      )

      GET_PORTFOLIO_SUMMARY = OperationModel.new(
        name: "GetPortfolioSummary",
        http_method: "GET",
        request_uri: "/get-portfolio-summary"
      )

      GET_RECOMMENDATION_REPORT_DETAILS = OperationModel.new(
        name: "GetRecommendationReportDetails",
        http_method: "GET",
        request_uri: "/get-recommendation-report-details/{id}"
      )

      GET_SERVER_DETAILS = OperationModel.new(
        name: "GetServerDetails",
        http_method: "GET",
        request_uri: "/get-server-details/{serverId}"
      )

      GET_SERVER_STRATEGIES = OperationModel.new(
        name: "GetServerStrategies",
        http_method: "GET",
        request_uri: "/get-server-strategies/{serverId}"
      )

      LIST_ANALYZABLE_SERVERS = OperationModel.new(
        name: "ListAnalyzableServers",
        http_method: "POST",
        request_uri: "/list-analyzable-servers"
      )

      LIST_APPLICATION_COMPONENTS = OperationModel.new(
        name: "ListApplicationComponents",
        http_method: "POST",
        request_uri: "/list-applicationcomponents"
      )

      LIST_COLLECTORS = OperationModel.new(
        name: "ListCollectors",
        http_method: "GET",
        request_uri: "/list-collectors"
      )

      LIST_IMPORT_FILE_TASK = OperationModel.new(
        name: "ListImportFileTask",
        http_method: "GET",
        request_uri: "/list-import-file-task"
      )

      LIST_SERVERS = OperationModel.new(
        name: "ListServers",
        http_method: "POST",
        request_uri: "/list-servers"
      )

      PUT_PORTFOLIO_PREFERENCES = OperationModel.new(
        name: "PutPortfolioPreferences",
        http_method: "POST",
        request_uri: "/put-portfolio-preferences"
      )

      START_ASSESSMENT = OperationModel.new(
        name: "StartAssessment",
        http_method: "POST",
        request_uri: "/start-assessment"
      )

      START_IMPORT_FILE_TASK = OperationModel.new(
        name: "StartImportFileTask",
        http_method: "POST",
        request_uri: "/start-import-file-task"
      )

      START_RECOMMENDATION_REPORT_GENERATION = OperationModel.new(
        name: "StartRecommendationReportGeneration",
        http_method: "POST",
        request_uri: "/start-recommendation-report-generation"
      )

      STOP_ASSESSMENT = OperationModel.new(
        name: "StopAssessment",
        http_method: "POST",
        request_uri: "/stop-assessment"
      )

      UPDATE_APPLICATION_COMPONENT_CONFIG = OperationModel.new(
        name: "UpdateApplicationComponentConfig",
        http_method: "POST",
        request_uri: "/update-applicationcomponent-config/"
      )

      UPDATE_SERVER_CONFIG = OperationModel.new(
        name: "UpdateServerConfig",
        http_method: "POST",
        request_uri: "/update-server-config/"
      )
    end
  end
end
