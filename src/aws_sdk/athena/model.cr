module AwsSdk
  module Athena
    module Model
      API_VERSION = "2017-05-18"
      TARGET_PREFIX = "AmazonAthena"
      SIGNING_NAME = "athena"
      ENDPOINT_PREFIX = "athena"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://athena-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://athena-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://athena.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://athena.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_NAMED_QUERY = OperationModel.new(
        name: "BatchGetNamedQuery",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_PREPARED_STATEMENT = OperationModel.new(
        name: "BatchGetPreparedStatement",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_QUERY_EXECUTION = OperationModel.new(
        name: "BatchGetQueryExecution",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CAPACITY_RESERVATION = OperationModel.new(
        name: "CancelCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAPACITY_RESERVATION = OperationModel.new(
        name: "CreateCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_CATALOG = OperationModel.new(
        name: "CreateDataCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NAMED_QUERY = OperationModel.new(
        name: "CreateNamedQuery",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NOTEBOOK = OperationModel.new(
        name: "CreateNotebook",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PREPARED_STATEMENT = OperationModel.new(
        name: "CreatePreparedStatement",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRESIGNED_NOTEBOOK_URL = OperationModel.new(
        name: "CreatePresignedNotebookUrl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORK_GROUP = OperationModel.new(
        name: "CreateWorkGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAPACITY_RESERVATION = OperationModel.new(
        name: "DeleteCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_CATALOG = OperationModel.new(
        name: "DeleteDataCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NAMED_QUERY = OperationModel.new(
        name: "DeleteNamedQuery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NOTEBOOK = OperationModel.new(
        name: "DeleteNotebook",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PREPARED_STATEMENT = OperationModel.new(
        name: "DeletePreparedStatement",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORK_GROUP = OperationModel.new(
        name: "DeleteWorkGroup",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_NOTEBOOK = OperationModel.new(
        name: "ExportNotebook",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALCULATION_EXECUTION = OperationModel.new(
        name: "GetCalculationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALCULATION_EXECUTION_CODE = OperationModel.new(
        name: "GetCalculationExecutionCode",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CALCULATION_EXECUTION_STATUS = OperationModel.new(
        name: "GetCalculationExecutionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_ASSIGNMENT_CONFIGURATION = OperationModel.new(
        name: "GetCapacityAssignmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_RESERVATION = OperationModel.new(
        name: "GetCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATA_CATALOG = OperationModel.new(
        name: "GetDataCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DATABASE = OperationModel.new(
        name: "GetDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NAMED_QUERY = OperationModel.new(
        name: "GetNamedQuery",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NOTEBOOK_METADATA = OperationModel.new(
        name: "GetNotebookMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PREPARED_STATEMENT = OperationModel.new(
        name: "GetPreparedStatement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_EXECUTION = OperationModel.new(
        name: "GetQueryExecution",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_RESULTS = OperationModel.new(
        name: "GetQueryResults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_QUERY_RUNTIME_STATISTICS = OperationModel.new(
        name: "GetQueryRuntimeStatistics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_DASHBOARD = OperationModel.new(
        name: "GetResourceDashboard",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SESSION = OperationModel.new(
        name: "GetSession",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SESSION_ENDPOINT = OperationModel.new(
        name: "GetSessionEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SESSION_STATUS = OperationModel.new(
        name: "GetSessionStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE_METADATA = OperationModel.new(
        name: "GetTableMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORK_GROUP = OperationModel.new(
        name: "GetWorkGroup",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_NOTEBOOK = OperationModel.new(
        name: "ImportNotebook",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_DPU_SIZES = OperationModel.new(
        name: "ListApplicationDPUSizes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CALCULATION_EXECUTIONS = OperationModel.new(
        name: "ListCalculationExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CAPACITY_RESERVATIONS = OperationModel.new(
        name: "ListCapacityReservations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATA_CATALOGS = OperationModel.new(
        name: "ListDataCatalogs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DATABASES = OperationModel.new(
        name: "ListDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENGINE_VERSIONS = OperationModel.new(
        name: "ListEngineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXECUTORS = OperationModel.new(
        name: "ListExecutors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NAMED_QUERIES = OperationModel.new(
        name: "ListNamedQueries",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NOTEBOOK_METADATA = OperationModel.new(
        name: "ListNotebookMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NOTEBOOK_SESSIONS = OperationModel.new(
        name: "ListNotebookSessions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PREPARED_STATEMENTS = OperationModel.new(
        name: "ListPreparedStatements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_QUERY_EXECUTIONS = OperationModel.new(
        name: "ListQueryExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SESSIONS = OperationModel.new(
        name: "ListSessions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLE_METADATA = OperationModel.new(
        name: "ListTableMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORK_GROUPS = OperationModel.new(
        name: "ListWorkGroups",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_CAPACITY_ASSIGNMENT_CONFIGURATION = OperationModel.new(
        name: "PutCapacityAssignmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      START_CALCULATION_EXECUTION = OperationModel.new(
        name: "StartCalculationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_QUERY_EXECUTION = OperationModel.new(
        name: "StartQueryExecution",
        http_method: "POST",
        request_uri: "/"
      )

      START_SESSION = OperationModel.new(
        name: "StartSession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_CALCULATION_EXECUTION = OperationModel.new(
        name: "StopCalculationExecution",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_QUERY_EXECUTION = OperationModel.new(
        name: "StopQueryExecution",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_SESSION = OperationModel.new(
        name: "TerminateSession",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CAPACITY_RESERVATION = OperationModel.new(
        name: "UpdateCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DATA_CATALOG = OperationModel.new(
        name: "UpdateDataCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NAMED_QUERY = OperationModel.new(
        name: "UpdateNamedQuery",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTEBOOK = OperationModel.new(
        name: "UpdateNotebook",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NOTEBOOK_METADATA = OperationModel.new(
        name: "UpdateNotebookMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PREPARED_STATEMENT = OperationModel.new(
        name: "UpdatePreparedStatement",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORK_GROUP = OperationModel.new(
        name: "UpdateWorkGroup",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
