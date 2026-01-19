module AwsSdk
  module LakeFormation
    module Model
      API_VERSION = "2017-03-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "lakeformation"
      ENDPOINT_PREFIX = "lakeformation"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lakeformation-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lakeformation-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lakeformation.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://lakeformation.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_LF_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddLFTagsToResource",
        http_method: "POST",
        request_uri: "/AddLFTagsToResource"
      )

      ASSUME_DECORATED_ROLE_WITH_SAML = OperationModel.new(
        name: "AssumeDecoratedRoleWithSAML",
        http_method: "POST",
        request_uri: "/AssumeDecoratedRoleWithSAML"
      )

      BATCH_GRANT_PERMISSIONS = OperationModel.new(
        name: "BatchGrantPermissions",
        http_method: "POST",
        request_uri: "/BatchGrantPermissions"
      )

      BATCH_REVOKE_PERMISSIONS = OperationModel.new(
        name: "BatchRevokePermissions",
        http_method: "POST",
        request_uri: "/BatchRevokePermissions"
      )

      CANCEL_TRANSACTION = OperationModel.new(
        name: "CancelTransaction",
        http_method: "POST",
        request_uri: "/CancelTransaction"
      )

      COMMIT_TRANSACTION = OperationModel.new(
        name: "CommitTransaction",
        http_method: "POST",
        request_uri: "/CommitTransaction"
      )

      CREATE_DATA_CELLS_FILTER = OperationModel.new(
        name: "CreateDataCellsFilter",
        http_method: "POST",
        request_uri: "/CreateDataCellsFilter"
      )

      CREATE_LF_TAG = OperationModel.new(
        name: "CreateLFTag",
        http_method: "POST",
        request_uri: "/CreateLFTag"
      )

      CREATE_LF_TAG_EXPRESSION = OperationModel.new(
        name: "CreateLFTagExpression",
        http_method: "POST",
        request_uri: "/CreateLFTagExpression"
      )

      CREATE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "CreateLakeFormationIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/CreateLakeFormationIdentityCenterConfiguration"
      )

      CREATE_LAKE_FORMATION_OPT_IN = OperationModel.new(
        name: "CreateLakeFormationOptIn",
        http_method: "POST",
        request_uri: "/CreateLakeFormationOptIn"
      )

      DELETE_DATA_CELLS_FILTER = OperationModel.new(
        name: "DeleteDataCellsFilter",
        http_method: "POST",
        request_uri: "/DeleteDataCellsFilter"
      )

      DELETE_LF_TAG = OperationModel.new(
        name: "DeleteLFTag",
        http_method: "POST",
        request_uri: "/DeleteLFTag"
      )

      DELETE_LF_TAG_EXPRESSION = OperationModel.new(
        name: "DeleteLFTagExpression",
        http_method: "POST",
        request_uri: "/DeleteLFTagExpression"
      )

      DELETE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "DeleteLakeFormationIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/DeleteLakeFormationIdentityCenterConfiguration"
      )

      DELETE_LAKE_FORMATION_OPT_IN = OperationModel.new(
        name: "DeleteLakeFormationOptIn",
        http_method: "POST",
        request_uri: "/DeleteLakeFormationOptIn"
      )

      DELETE_OBJECTS_ON_CANCEL = OperationModel.new(
        name: "DeleteObjectsOnCancel",
        http_method: "POST",
        request_uri: "/DeleteObjectsOnCancel"
      )

      DEREGISTER_RESOURCE = OperationModel.new(
        name: "DeregisterResource",
        http_method: "POST",
        request_uri: "/DeregisterResource"
      )

      DESCRIBE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "DescribeLakeFormationIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/DescribeLakeFormationIdentityCenterConfiguration"
      )

      DESCRIBE_RESOURCE = OperationModel.new(
        name: "DescribeResource",
        http_method: "POST",
        request_uri: "/DescribeResource"
      )

      DESCRIBE_TRANSACTION = OperationModel.new(
        name: "DescribeTransaction",
        http_method: "POST",
        request_uri: "/DescribeTransaction"
      )

      EXTEND_TRANSACTION = OperationModel.new(
        name: "ExtendTransaction",
        http_method: "POST",
        request_uri: "/ExtendTransaction"
      )

      GET_DATA_CELLS_FILTER = OperationModel.new(
        name: "GetDataCellsFilter",
        http_method: "POST",
        request_uri: "/GetDataCellsFilter"
      )

      GET_DATA_LAKE_PRINCIPAL = OperationModel.new(
        name: "GetDataLakePrincipal",
        http_method: "POST",
        request_uri: "/GetDataLakePrincipal"
      )

      GET_DATA_LAKE_SETTINGS = OperationModel.new(
        name: "GetDataLakeSettings",
        http_method: "POST",
        request_uri: "/GetDataLakeSettings"
      )

      GET_EFFECTIVE_PERMISSIONS_FOR_PATH = OperationModel.new(
        name: "GetEffectivePermissionsForPath",
        http_method: "POST",
        request_uri: "/GetEffectivePermissionsForPath"
      )

      GET_LF_TAG = OperationModel.new(
        name: "GetLFTag",
        http_method: "POST",
        request_uri: "/GetLFTag"
      )

      GET_LF_TAG_EXPRESSION = OperationModel.new(
        name: "GetLFTagExpression",
        http_method: "POST",
        request_uri: "/GetLFTagExpression"
      )

      GET_QUERY_STATE = OperationModel.new(
        name: "GetQueryState",
        http_method: "POST",
        request_uri: "/GetQueryState"
      )

      GET_QUERY_STATISTICS = OperationModel.new(
        name: "GetQueryStatistics",
        http_method: "POST",
        request_uri: "/GetQueryStatistics"
      )

      GET_RESOURCE_LF_TAGS = OperationModel.new(
        name: "GetResourceLFTags",
        http_method: "POST",
        request_uri: "/GetResourceLFTags"
      )

      GET_TABLE_OBJECTS = OperationModel.new(
        name: "GetTableObjects",
        http_method: "POST",
        request_uri: "/GetTableObjects"
      )

      GET_TEMPORARY_DATA_LOCATION_CREDENTIALS = OperationModel.new(
        name: "GetTemporaryDataLocationCredentials",
        http_method: "POST",
        request_uri: "/GetTemporaryDataLocationCredentials"
      )

      GET_TEMPORARY_GLUE_PARTITION_CREDENTIALS = OperationModel.new(
        name: "GetTemporaryGluePartitionCredentials",
        http_method: "POST",
        request_uri: "/GetTemporaryGluePartitionCredentials"
      )

      GET_TEMPORARY_GLUE_TABLE_CREDENTIALS = OperationModel.new(
        name: "GetTemporaryGlueTableCredentials",
        http_method: "POST",
        request_uri: "/GetTemporaryGlueTableCredentials"
      )

      GET_WORK_UNIT_RESULTS = OperationModel.new(
        name: "GetWorkUnitResults",
        http_method: "POST",
        request_uri: "/GetWorkUnitResults"
      )

      GET_WORK_UNITS = OperationModel.new(
        name: "GetWorkUnits",
        http_method: "POST",
        request_uri: "/GetWorkUnits"
      )

      GRANT_PERMISSIONS = OperationModel.new(
        name: "GrantPermissions",
        http_method: "POST",
        request_uri: "/GrantPermissions"
      )

      LIST_DATA_CELLS_FILTER = OperationModel.new(
        name: "ListDataCellsFilter",
        http_method: "POST",
        request_uri: "/ListDataCellsFilter"
      )

      LIST_LF_TAG_EXPRESSIONS = OperationModel.new(
        name: "ListLFTagExpressions",
        http_method: "POST",
        request_uri: "/ListLFTagExpressions"
      )

      LIST_LF_TAGS = OperationModel.new(
        name: "ListLFTags",
        http_method: "POST",
        request_uri: "/ListLFTags"
      )

      LIST_LAKE_FORMATION_OPT_INS = OperationModel.new(
        name: "ListLakeFormationOptIns",
        http_method: "POST",
        request_uri: "/ListLakeFormationOptIns"
      )

      LIST_PERMISSIONS = OperationModel.new(
        name: "ListPermissions",
        http_method: "POST",
        request_uri: "/ListPermissions"
      )

      LIST_RESOURCES = OperationModel.new(
        name: "ListResources",
        http_method: "POST",
        request_uri: "/ListResources"
      )

      LIST_TABLE_STORAGE_OPTIMIZERS = OperationModel.new(
        name: "ListTableStorageOptimizers",
        http_method: "POST",
        request_uri: "/ListTableStorageOptimizers"
      )

      LIST_TRANSACTIONS = OperationModel.new(
        name: "ListTransactions",
        http_method: "POST",
        request_uri: "/ListTransactions"
      )

      PUT_DATA_LAKE_SETTINGS = OperationModel.new(
        name: "PutDataLakeSettings",
        http_method: "POST",
        request_uri: "/PutDataLakeSettings"
      )

      REGISTER_RESOURCE = OperationModel.new(
        name: "RegisterResource",
        http_method: "POST",
        request_uri: "/RegisterResource"
      )

      REMOVE_LF_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveLFTagsFromResource",
        http_method: "POST",
        request_uri: "/RemoveLFTagsFromResource"
      )

      REVOKE_PERMISSIONS = OperationModel.new(
        name: "RevokePermissions",
        http_method: "POST",
        request_uri: "/RevokePermissions"
      )

      SEARCH_DATABASES_BY_LF_TAGS = OperationModel.new(
        name: "SearchDatabasesByLFTags",
        http_method: "POST",
        request_uri: "/SearchDatabasesByLFTags"
      )

      SEARCH_TABLES_BY_LF_TAGS = OperationModel.new(
        name: "SearchTablesByLFTags",
        http_method: "POST",
        request_uri: "/SearchTablesByLFTags"
      )

      START_QUERY_PLANNING = OperationModel.new(
        name: "StartQueryPlanning",
        http_method: "POST",
        request_uri: "/StartQueryPlanning"
      )

      START_TRANSACTION = OperationModel.new(
        name: "StartTransaction",
        http_method: "POST",
        request_uri: "/StartTransaction"
      )

      UPDATE_DATA_CELLS_FILTER = OperationModel.new(
        name: "UpdateDataCellsFilter",
        http_method: "POST",
        request_uri: "/UpdateDataCellsFilter"
      )

      UPDATE_LF_TAG = OperationModel.new(
        name: "UpdateLFTag",
        http_method: "POST",
        request_uri: "/UpdateLFTag"
      )

      UPDATE_LF_TAG_EXPRESSION = OperationModel.new(
        name: "UpdateLFTagExpression",
        http_method: "POST",
        request_uri: "/UpdateLFTagExpression"
      )

      UPDATE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION = OperationModel.new(
        name: "UpdateLakeFormationIdentityCenterConfiguration",
        http_method: "POST",
        request_uri: "/UpdateLakeFormationIdentityCenterConfiguration"
      )

      UPDATE_RESOURCE = OperationModel.new(
        name: "UpdateResource",
        http_method: "POST",
        request_uri: "/UpdateResource"
      )

      UPDATE_TABLE_OBJECTS = OperationModel.new(
        name: "UpdateTableObjects",
        http_method: "POST",
        request_uri: "/UpdateTableObjects"
      )

      UPDATE_TABLE_STORAGE_OPTIMIZER = OperationModel.new(
        name: "UpdateTableStorageOptimizer",
        http_method: "POST",
        request_uri: "/UpdateTableStorageOptimizer"
      )
    end
  end
end
