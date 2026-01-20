module Aws
  module CloudTrail
    module Model
      API_VERSION = "2013-11-01"
      TARGET_PREFIX = "com.amazonaws.cloudtrail.v20131101.CloudTrail_20131101"
      SIGNING_NAME = "cloudtrail"
      ENDPOINT_PREFIX = "cloudtrail"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudtrail-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://cloudtrail.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://cloudtrail.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cloudtrail-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://cloudtrail.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://cloudtrail.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_QUERY = OperationModel.new(
        name: "CancelQuery",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DASHBOARD = OperationModel.new(
        name: "CreateDashboard",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVENT_DATA_STORE = OperationModel.new(
        name: "CreateEventDataStore",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAIL = OperationModel.new(
        name: "CreateTrail",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DASHBOARD = OperationModel.new(
        name: "DeleteDashboard",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_DATA_STORE = OperationModel.new(
        name: "DeleteEventDataStore",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAIL = OperationModel.new(
        name: "DeleteTrail",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_ORGANIZATION_DELEGATED_ADMIN = OperationModel.new(
        name: "DeregisterOrganizationDelegatedAdmin",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_QUERY = OperationModel.new(
        name: "DescribeQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAILS = OperationModel.new(
        name: "DescribeTrails",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_FEDERATION = OperationModel.new(
        name: "DisableFederation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_FEDERATION = OperationModel.new(
        name: "EnableFederation",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_QUERY = OperationModel.new(
        name: "GenerateQuery",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CHANNEL = OperationModel.new(
        name: "GetChannel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DASHBOARD = OperationModel.new(
        name: "GetDashboard",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_CONFIGURATION = OperationModel.new(
        name: "GetEventConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_DATA_STORE = OperationModel.new(
        name: "GetEventDataStore",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EVENT_SELECTORS = OperationModel.new(
        name: "GetEventSelectors",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IMPORT = OperationModel.new(
        name: "GetImport",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSIGHT_SELECTORS = OperationModel.new(
        name: "GetInsightSelectors",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_RESULTS = OperationModel.new(
        name: "GetQueryResults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRAIL = OperationModel.new(
        name: "GetTrail",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRAIL_STATUS = OperationModel.new(
        name: "GetTrailStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DASHBOARDS = OperationModel.new(
        name: "ListDashboards",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EVENT_DATA_STORES = OperationModel.new(
        name: "ListEventDataStores",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMPORT_FAILURES = OperationModel.new(
        name: "ListImportFailures",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMPORTS = OperationModel.new(
        name: "ListImports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSIGHTS_DATA = OperationModel.new(
        name: "ListInsightsData",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSIGHTS_METRIC_DATA = OperationModel.new(
        name: "ListInsightsMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PUBLIC_KEYS = OperationModel.new(
        name: "ListPublicKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUERIES = OperationModel.new(
        name: "ListQueries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRAILS = OperationModel.new(
        name: "ListTrails",
        http_method: "POST",
        request_uri: "/"
      )

      LOOKUP_EVENTS = OperationModel.new(
        name: "LookupEvents",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EVENT_CONFIGURATION = OperationModel.new(
        name: "PutEventConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_EVENT_SELECTORS = OperationModel.new(
        name: "PutEventSelectors",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INSIGHT_SELECTORS = OperationModel.new(
        name: "PutInsightSelectors",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_ORGANIZATION_DELEGATED_ADMIN = OperationModel.new(
        name: "RegisterOrganizationDelegatedAdmin",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_EVENT_DATA_STORE = OperationModel.new(
        name: "RestoreEventDataStore",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_SAMPLE_QUERIES = OperationModel.new(
        name: "SearchSampleQueries",
        http_method: "POST",
        request_uri: "/"
      )

      START_DASHBOARD_REFRESH = OperationModel.new(
        name: "StartDashboardRefresh",
        http_method: "POST",
        request_uri: "/"
      )

      START_EVENT_DATA_STORE_INGESTION = OperationModel.new(
        name: "StartEventDataStoreIngestion",
        http_method: "POST",
        request_uri: "/"
      )

      START_IMPORT = OperationModel.new(
        name: "StartImport",
        http_method: "POST",
        request_uri: "/"
      )

      START_LOGGING = OperationModel.new(
        name: "StartLogging",
        http_method: "POST",
        request_uri: "/"
      )

      START_QUERY = OperationModel.new(
        name: "StartQuery",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_EVENT_DATA_STORE_INGESTION = OperationModel.new(
        name: "StopEventDataStoreIngestion",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_IMPORT = OperationModel.new(
        name: "StopImport",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_LOGGING = OperationModel.new(
        name: "StopLogging",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DASHBOARD = OperationModel.new(
        name: "UpdateDashboard",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_EVENT_DATA_STORE = OperationModel.new(
        name: "UpdateEventDataStore",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRAIL = OperationModel.new(
        name: "UpdateTrail",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
