module AwsSdk
  module IoTSiteWise
    module Model
      API_VERSION = "2019-12-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "iotsitewise"
      ENDPOINT_PREFIX = "iotsitewise"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotsitewise-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotsitewise-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotsitewise.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iotsitewise.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ASSETS = OperationModel.new(
        name: "AssociateAssets",
        http_method: "POST",
        request_uri: "/assets/{assetId}/associate"
      )

      ASSOCIATE_TIME_SERIES_TO_ASSET_PROPERTY = OperationModel.new(
        name: "AssociateTimeSeriesToAssetProperty",
        http_method: "POST",
        request_uri: "/timeseries/associate/"
      )

      BATCH_ASSOCIATE_PROJECT_ASSETS = OperationModel.new(
        name: "BatchAssociateProjectAssets",
        http_method: "POST",
        request_uri: "/projects/{projectId}/assets/associate"
      )

      BATCH_DISASSOCIATE_PROJECT_ASSETS = OperationModel.new(
        name: "BatchDisassociateProjectAssets",
        http_method: "POST",
        request_uri: "/projects/{projectId}/assets/disassociate"
      )

      BATCH_GET_ASSET_PROPERTY_AGGREGATES = OperationModel.new(
        name: "BatchGetAssetPropertyAggregates",
        http_method: "POST",
        request_uri: "/properties/batch/aggregates"
      )

      BATCH_GET_ASSET_PROPERTY_VALUE = OperationModel.new(
        name: "BatchGetAssetPropertyValue",
        http_method: "POST",
        request_uri: "/properties/batch/latest"
      )

      BATCH_GET_ASSET_PROPERTY_VALUE_HISTORY = OperationModel.new(
        name: "BatchGetAssetPropertyValueHistory",
        http_method: "POST",
        request_uri: "/properties/batch/history"
      )

      BATCH_PUT_ASSET_PROPERTY_VALUE = OperationModel.new(
        name: "BatchPutAssetPropertyValue",
        http_method: "POST",
        request_uri: "/properties"
      )

      CREATE_ACCESS_POLICY = OperationModel.new(
        name: "CreateAccessPolicy",
        http_method: "POST",
        request_uri: "/access-policies"
      )

      CREATE_ASSET = OperationModel.new(
        name: "CreateAsset",
        http_method: "POST",
        request_uri: "/assets"
      )

      CREATE_ASSET_MODEL = OperationModel.new(
        name: "CreateAssetModel",
        http_method: "POST",
        request_uri: "/asset-models"
      )

      CREATE_ASSET_MODEL_COMPOSITE_MODEL = OperationModel.new(
        name: "CreateAssetModelCompositeModel",
        http_method: "POST",
        request_uri: "/asset-models/{assetModelId}/composite-models"
      )

      CREATE_BULK_IMPORT_JOB = OperationModel.new(
        name: "CreateBulkImportJob",
        http_method: "POST",
        request_uri: "/jobs"
      )

      CREATE_COMPUTATION_MODEL = OperationModel.new(
        name: "CreateComputationModel",
        http_method: "POST",
        request_uri: "/computation-models"
      )

      CREATE_DASHBOARD = OperationModel.new(
        name: "CreateDashboard",
        http_method: "POST",
        request_uri: "/dashboards"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/datasets"
      )

      CREATE_GATEWAY = OperationModel.new(
        name: "CreateGateway",
        http_method: "POST",
        request_uri: "/20200301/gateways"
      )

      CREATE_PORTAL = OperationModel.new(
        name: "CreatePortal",
        http_method: "POST",
        request_uri: "/portals"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/projects"
      )

      DELETE_ACCESS_POLICY = OperationModel.new(
        name: "DeleteAccessPolicy",
        http_method: "DELETE",
        request_uri: "/access-policies/{accessPolicyId}"
      )

      DELETE_ASSET = OperationModel.new(
        name: "DeleteAsset",
        http_method: "DELETE",
        request_uri: "/assets/{assetId}"
      )

      DELETE_ASSET_MODEL = OperationModel.new(
        name: "DeleteAssetModel",
        http_method: "DELETE",
        request_uri: "/asset-models/{assetModelId}"
      )

      DELETE_ASSET_MODEL_COMPOSITE_MODEL = OperationModel.new(
        name: "DeleteAssetModelCompositeModel",
        http_method: "DELETE",
        request_uri: "/asset-models/{assetModelId}/composite-models/{assetModelCompositeModelId}"
      )

      DELETE_ASSET_MODEL_INTERFACE_RELATIONSHIP = OperationModel.new(
        name: "DeleteAssetModelInterfaceRelationship",
        http_method: "DELETE",
        request_uri: "/asset-models/{assetModelId}/interface/{interfaceAssetModelId}/asset-model-interface-relationship"
      )

      DELETE_COMPUTATION_MODEL = OperationModel.new(
        name: "DeleteComputationModel",
        http_method: "DELETE",
        request_uri: "/computation-models/{computationModelId}"
      )

      DELETE_DASHBOARD = OperationModel.new(
        name: "DeleteDashboard",
        http_method: "DELETE",
        request_uri: "/dashboards/{dashboardId}"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "DELETE",
        request_uri: "/datasets/{datasetId}"
      )

      DELETE_GATEWAY = OperationModel.new(
        name: "DeleteGateway",
        http_method: "DELETE",
        request_uri: "/20200301/gateways/{gatewayId}"
      )

      DELETE_PORTAL = OperationModel.new(
        name: "DeletePortal",
        http_method: "DELETE",
        request_uri: "/portals/{portalId}"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "DELETE",
        request_uri: "/projects/{projectId}"
      )

      DELETE_TIME_SERIES = OperationModel.new(
        name: "DeleteTimeSeries",
        http_method: "POST",
        request_uri: "/timeseries/delete/"
      )

      DESCRIBE_ACCESS_POLICY = OperationModel.new(
        name: "DescribeAccessPolicy",
        http_method: "GET",
        request_uri: "/access-policies/{accessPolicyId}"
      )

      DESCRIBE_ACTION = OperationModel.new(
        name: "DescribeAction",
        http_method: "GET",
        request_uri: "/actions/{actionId}"
      )

      DESCRIBE_ASSET = OperationModel.new(
        name: "DescribeAsset",
        http_method: "GET",
        request_uri: "/assets/{assetId}"
      )

      DESCRIBE_ASSET_COMPOSITE_MODEL = OperationModel.new(
        name: "DescribeAssetCompositeModel",
        http_method: "GET",
        request_uri: "/assets/{assetId}/composite-models/{assetCompositeModelId}"
      )

      DESCRIBE_ASSET_MODEL = OperationModel.new(
        name: "DescribeAssetModel",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}"
      )

      DESCRIBE_ASSET_MODEL_COMPOSITE_MODEL = OperationModel.new(
        name: "DescribeAssetModelCompositeModel",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}/composite-models/{assetModelCompositeModelId}"
      )

      DESCRIBE_ASSET_MODEL_INTERFACE_RELATIONSHIP = OperationModel.new(
        name: "DescribeAssetModelInterfaceRelationship",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}/interface/{interfaceAssetModelId}/asset-model-interface-relationship"
      )

      DESCRIBE_ASSET_PROPERTY = OperationModel.new(
        name: "DescribeAssetProperty",
        http_method: "GET",
        request_uri: "/assets/{assetId}/properties/{propertyId}"
      )

      DESCRIBE_BULK_IMPORT_JOB = OperationModel.new(
        name: "DescribeBulkImportJob",
        http_method: "GET",
        request_uri: "/jobs/{jobId}"
      )

      DESCRIBE_COMPUTATION_MODEL = OperationModel.new(
        name: "DescribeComputationModel",
        http_method: "GET",
        request_uri: "/computation-models/{computationModelId}"
      )

      DESCRIBE_COMPUTATION_MODEL_EXECUTION_SUMMARY = OperationModel.new(
        name: "DescribeComputationModelExecutionSummary",
        http_method: "GET",
        request_uri: "/computation-models/{computationModelId}/execution-summary"
      )

      DESCRIBE_DASHBOARD = OperationModel.new(
        name: "DescribeDashboard",
        http_method: "GET",
        request_uri: "/dashboards/{dashboardId}"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "GET",
        request_uri: "/datasets/{datasetId}"
      )

      DESCRIBE_DEFAULT_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "DescribeDefaultEncryptionConfiguration",
        http_method: "GET",
        request_uri: "/configuration/account/encryption"
      )

      DESCRIBE_EXECUTION = OperationModel.new(
        name: "DescribeExecution",
        http_method: "GET",
        request_uri: "/executions/{executionId}"
      )

      DESCRIBE_GATEWAY = OperationModel.new(
        name: "DescribeGateway",
        http_method: "GET",
        request_uri: "/20200301/gateways/{gatewayId}"
      )

      DESCRIBE_GATEWAY_CAPABILITY_CONFIGURATION = OperationModel.new(
        name: "DescribeGatewayCapabilityConfiguration",
        http_method: "GET",
        request_uri: "/20200301/gateways/{gatewayId}/capability/{capabilityNamespace}"
      )

      DESCRIBE_LOGGING_OPTIONS = OperationModel.new(
        name: "DescribeLoggingOptions",
        http_method: "GET",
        request_uri: "/logging"
      )

      DESCRIBE_PORTAL = OperationModel.new(
        name: "DescribePortal",
        http_method: "GET",
        request_uri: "/portals/{portalId}"
      )

      DESCRIBE_PROJECT = OperationModel.new(
        name: "DescribeProject",
        http_method: "GET",
        request_uri: "/projects/{projectId}"
      )

      DESCRIBE_STORAGE_CONFIGURATION = OperationModel.new(
        name: "DescribeStorageConfiguration",
        http_method: "GET",
        request_uri: "/configuration/account/storage"
      )

      DESCRIBE_TIME_SERIES = OperationModel.new(
        name: "DescribeTimeSeries",
        http_method: "GET",
        request_uri: "/timeseries/describe/"
      )

      DISASSOCIATE_ASSETS = OperationModel.new(
        name: "DisassociateAssets",
        http_method: "POST",
        request_uri: "/assets/{assetId}/disassociate"
      )

      DISASSOCIATE_TIME_SERIES_FROM_ASSET_PROPERTY = OperationModel.new(
        name: "DisassociateTimeSeriesFromAssetProperty",
        http_method: "POST",
        request_uri: "/timeseries/disassociate/"
      )

      EXECUTE_ACTION = OperationModel.new(
        name: "ExecuteAction",
        http_method: "POST",
        request_uri: "/actions"
      )

      EXECUTE_QUERY = OperationModel.new(
        name: "ExecuteQuery",
        http_method: "POST",
        request_uri: "/queries/execution"
      )

      GET_ASSET_PROPERTY_AGGREGATES = OperationModel.new(
        name: "GetAssetPropertyAggregates",
        http_method: "GET",
        request_uri: "/properties/aggregates"
      )

      GET_ASSET_PROPERTY_VALUE = OperationModel.new(
        name: "GetAssetPropertyValue",
        http_method: "GET",
        request_uri: "/properties/latest"
      )

      GET_ASSET_PROPERTY_VALUE_HISTORY = OperationModel.new(
        name: "GetAssetPropertyValueHistory",
        http_method: "GET",
        request_uri: "/properties/history"
      )

      GET_INTERPOLATED_ASSET_PROPERTY_VALUES = OperationModel.new(
        name: "GetInterpolatedAssetPropertyValues",
        http_method: "GET",
        request_uri: "/properties/interpolated"
      )

      INVOKE_ASSISTANT = OperationModel.new(
        name: "InvokeAssistant",
        http_method: "POST",
        request_uri: "/assistant/invocation"
      )

      LIST_ACCESS_POLICIES = OperationModel.new(
        name: "ListAccessPolicies",
        http_method: "GET",
        request_uri: "/access-policies"
      )

      LIST_ACTIONS = OperationModel.new(
        name: "ListActions",
        http_method: "GET",
        request_uri: "/actions"
      )

      LIST_ASSET_MODEL_COMPOSITE_MODELS = OperationModel.new(
        name: "ListAssetModelCompositeModels",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}/composite-models"
      )

      LIST_ASSET_MODEL_PROPERTIES = OperationModel.new(
        name: "ListAssetModelProperties",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}/properties"
      )

      LIST_ASSET_MODELS = OperationModel.new(
        name: "ListAssetModels",
        http_method: "GET",
        request_uri: "/asset-models"
      )

      LIST_ASSET_PROPERTIES = OperationModel.new(
        name: "ListAssetProperties",
        http_method: "GET",
        request_uri: "/assets/{assetId}/properties"
      )

      LIST_ASSET_RELATIONSHIPS = OperationModel.new(
        name: "ListAssetRelationships",
        http_method: "GET",
        request_uri: "/assets/{assetId}/assetRelationships"
      )

      LIST_ASSETS = OperationModel.new(
        name: "ListAssets",
        http_method: "GET",
        request_uri: "/assets"
      )

      LIST_ASSOCIATED_ASSETS = OperationModel.new(
        name: "ListAssociatedAssets",
        http_method: "GET",
        request_uri: "/assets/{assetId}/hierarchies"
      )

      LIST_BULK_IMPORT_JOBS = OperationModel.new(
        name: "ListBulkImportJobs",
        http_method: "GET",
        request_uri: "/jobs"
      )

      LIST_COMPOSITION_RELATIONSHIPS = OperationModel.new(
        name: "ListCompositionRelationships",
        http_method: "GET",
        request_uri: "/asset-models/{assetModelId}/composition-relationships"
      )

      LIST_COMPUTATION_MODEL_DATA_BINDING_USAGES = OperationModel.new(
        name: "ListComputationModelDataBindingUsages",
        http_method: "POST",
        request_uri: "/computation-models/data-binding-usages"
      )

      LIST_COMPUTATION_MODEL_RESOLVE_TO_RESOURCES = OperationModel.new(
        name: "ListComputationModelResolveToResources",
        http_method: "GET",
        request_uri: "/computation-models/{computationModelId}/resolve-to-resources"
      )

      LIST_COMPUTATION_MODELS = OperationModel.new(
        name: "ListComputationModels",
        http_method: "GET",
        request_uri: "/computation-models"
      )

      LIST_DASHBOARDS = OperationModel.new(
        name: "ListDashboards",
        http_method: "GET",
        request_uri: "/dashboards"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "GET",
        request_uri: "/datasets"
      )

      LIST_EXECUTIONS = OperationModel.new(
        name: "ListExecutions",
        http_method: "GET",
        request_uri: "/executions"
      )

      LIST_GATEWAYS = OperationModel.new(
        name: "ListGateways",
        http_method: "GET",
        request_uri: "/20200301/gateways"
      )

      LIST_INTERFACE_RELATIONSHIPS = OperationModel.new(
        name: "ListInterfaceRelationships",
        http_method: "GET",
        request_uri: "/interface/{interfaceAssetModelId}/asset-models"
      )

      LIST_PORTALS = OperationModel.new(
        name: "ListPortals",
        http_method: "GET",
        request_uri: "/portals"
      )

      LIST_PROJECT_ASSETS = OperationModel.new(
        name: "ListProjectAssets",
        http_method: "GET",
        request_uri: "/projects/{projectId}/assets"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "GET",
        request_uri: "/projects"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      LIST_TIME_SERIES = OperationModel.new(
        name: "ListTimeSeries",
        http_method: "GET",
        request_uri: "/timeseries/"
      )

      PUT_ASSET_MODEL_INTERFACE_RELATIONSHIP = OperationModel.new(
        name: "PutAssetModelInterfaceRelationship",
        http_method: "PUT",
        request_uri: "/asset-models/{assetModelId}/interface/{interfaceAssetModelId}/asset-model-interface-relationship"
      )

      PUT_DEFAULT_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "PutDefaultEncryptionConfiguration",
        http_method: "POST",
        request_uri: "/configuration/account/encryption"
      )

      PUT_LOGGING_OPTIONS = OperationModel.new(
        name: "PutLoggingOptions",
        http_method: "PUT",
        request_uri: "/logging"
      )

      PUT_STORAGE_CONFIGURATION = OperationModel.new(
        name: "PutStorageConfiguration",
        http_method: "POST",
        request_uri: "/configuration/account/storage"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags"
      )

      UPDATE_ACCESS_POLICY = OperationModel.new(
        name: "UpdateAccessPolicy",
        http_method: "PUT",
        request_uri: "/access-policies/{accessPolicyId}"
      )

      UPDATE_ASSET = OperationModel.new(
        name: "UpdateAsset",
        http_method: "PUT",
        request_uri: "/assets/{assetId}"
      )

      UPDATE_ASSET_MODEL = OperationModel.new(
        name: "UpdateAssetModel",
        http_method: "PUT",
        request_uri: "/asset-models/{assetModelId}"
      )

      UPDATE_ASSET_MODEL_COMPOSITE_MODEL = OperationModel.new(
        name: "UpdateAssetModelCompositeModel",
        http_method: "PUT",
        request_uri: "/asset-models/{assetModelId}/composite-models/{assetModelCompositeModelId}"
      )

      UPDATE_ASSET_PROPERTY = OperationModel.new(
        name: "UpdateAssetProperty",
        http_method: "PUT",
        request_uri: "/assets/{assetId}/properties/{propertyId}"
      )

      UPDATE_COMPUTATION_MODEL = OperationModel.new(
        name: "UpdateComputationModel",
        http_method: "POST",
        request_uri: "/computation-models/{computationModelId}"
      )

      UPDATE_DASHBOARD = OperationModel.new(
        name: "UpdateDashboard",
        http_method: "PUT",
        request_uri: "/dashboards/{dashboardId}"
      )

      UPDATE_DATASET = OperationModel.new(
        name: "UpdateDataset",
        http_method: "PUT",
        request_uri: "/datasets/{datasetId}"
      )

      UPDATE_GATEWAY = OperationModel.new(
        name: "UpdateGateway",
        http_method: "PUT",
        request_uri: "/20200301/gateways/{gatewayId}"
      )

      UPDATE_GATEWAY_CAPABILITY_CONFIGURATION = OperationModel.new(
        name: "UpdateGatewayCapabilityConfiguration",
        http_method: "POST",
        request_uri: "/20200301/gateways/{gatewayId}/capability"
      )

      UPDATE_PORTAL = OperationModel.new(
        name: "UpdatePortal",
        http_method: "PUT",
        request_uri: "/portals/{portalId}"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "PUT",
        request_uri: "/projects/{projectId}"
      )
    end
  end
end
