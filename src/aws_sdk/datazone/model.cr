module AwsSdk
  module DataZone
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "datazone"
      ENDPOINT_PREFIX = "datazone"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datazone-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://datazone.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datazone-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://datazone.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_PREDICTIONS = OperationModel.new(
        name: "AcceptPredictions",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}/accept-predictions"
      )

      ACCEPT_SUBSCRIPTION_REQUEST = OperationModel.new(
        name: "AcceptSubscriptionRequest",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests/{identifier}/accept"
      )

      ADD_ENTITY_OWNER = OperationModel.new(
        name: "AddEntityOwner",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/addOwner"
      )

      ADD_POLICY_GRANT = OperationModel.new(
        name: "AddPolicyGrant",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/policies/managed/{entityType}/{entityIdentifier}/addGrant"
      )

      ASSOCIATE_ENVIRONMENT_ROLE = OperationModel.new(
        name: "AssociateEnvironmentRole",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/roles/{environmentRoleArn}"
      )

      ASSOCIATE_GOVERNED_TERMS = OperationModel.new(
        name: "AssociateGovernedTerms",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/associate-governed-terms"
      )

      BATCH_GET_ATTRIBUTES_METADATA = OperationModel.new(
        name: "BatchGetAttributesMetadata",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/attributes-metadata"
      )

      BATCH_PUT_ATTRIBUTES_METADATA = OperationModel.new(
        name: "BatchPutAttributesMetadata",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/attributes-metadata"
      )

      CANCEL_METADATA_GENERATION_RUN = OperationModel.new(
        name: "CancelMetadataGenerationRun",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/metadata-generation-runs/{identifier}/cancel"
      )

      CANCEL_SUBSCRIPTION = OperationModel.new(
        name: "CancelSubscription",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/subscriptions/{identifier}/cancel"
      )

      CREATE_ACCOUNT_POOL = OperationModel.new(
        name: "CreateAccountPool",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools"
      )

      CREATE_ASSET = OperationModel.new(
        name: "CreateAsset",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/assets"
      )

      CREATE_ASSET_FILTER = OperationModel.new(
        name: "CreateAssetFilter",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{assetIdentifier}/filters"
      )

      CREATE_ASSET_REVISION = OperationModel.new(
        name: "CreateAssetRevision",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}/revisions"
      )

      CREATE_ASSET_TYPE = OperationModel.new(
        name: "CreateAssetType",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/asset-types"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/connections"
      )

      CREATE_DATA_PRODUCT = OperationModel.new(
        name: "CreateDataProduct",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/data-products"
      )

      CREATE_DATA_PRODUCT_REVISION = OperationModel.new(
        name: "CreateDataProductRevision",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/data-products/{identifier}/revisions"
      )

      CREATE_DATA_SOURCE = OperationModel.new(
        name: "CreateDataSource",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/v2/domains"
      )

      CREATE_DOMAIN_UNIT = OperationModel.new(
        name: "CreateDomainUnit",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/domain-units"
      )

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/environments"
      )

      CREATE_ENVIRONMENT_ACTION = OperationModel.new(
        name: "CreateEnvironmentAction",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/actions"
      )

      CREATE_ENVIRONMENT_BLUEPRINT = OperationModel.new(
        name: "CreateEnvironmentBlueprint",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprints"
      )

      CREATE_ENVIRONMENT_PROFILE = OperationModel.new(
        name: "CreateEnvironmentProfile",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/environment-profiles"
      )

      CREATE_FORM_TYPE = OperationModel.new(
        name: "CreateFormType",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/form-types"
      )

      CREATE_GLOSSARY = OperationModel.new(
        name: "CreateGlossary",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/glossaries"
      )

      CREATE_GLOSSARY_TERM = OperationModel.new(
        name: "CreateGlossaryTerm",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/glossary-terms"
      )

      CREATE_GROUP_PROFILE = OperationModel.new(
        name: "CreateGroupProfile",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/group-profiles"
      )

      CREATE_LISTING_CHANGE_SET = OperationModel.new(
        name: "CreateListingChangeSet",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/listings/change-set"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/projects"
      )

      CREATE_PROJECT_MEMBERSHIP = OperationModel.new(
        name: "CreateProjectMembership",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{projectIdentifier}/createMembership"
      )

      CREATE_PROJECT_PROFILE = OperationModel.new(
        name: "CreateProjectProfile",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/project-profiles"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/rules"
      )

      CREATE_SUBSCRIPTION_GRANT = OperationModel.new(
        name: "CreateSubscriptionGrant",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-grants"
      )

      CREATE_SUBSCRIPTION_REQUEST = OperationModel.new(
        name: "CreateSubscriptionRequest",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests"
      )

      CREATE_SUBSCRIPTION_TARGET = OperationModel.new(
        name: "CreateSubscriptionTarget",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/subscription-targets"
      )

      CREATE_USER_PROFILE = OperationModel.new(
        name: "CreateUserProfile",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/user-profiles"
      )

      DELETE_ACCOUNT_POOL = OperationModel.new(
        name: "DeleteAccountPool",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools/{identifier}"
      )

      DELETE_ASSET = OperationModel.new(
        name: "DeleteAsset",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}"
      )

      DELETE_ASSET_FILTER = OperationModel.new(
        name: "DeleteAssetFilter",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{assetIdentifier}/filters/{identifier}"
      )

      DELETE_ASSET_TYPE = OperationModel.new(
        name: "DeleteAssetType",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/asset-types/{identifier}"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/connections/{identifier}"
      )

      DELETE_DATA_PRODUCT = OperationModel.new(
        name: "DeleteDataProduct",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/data-products/{identifier}"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources/{identifier}"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "DELETE",
        request_uri: "/v2/domains/{identifier}"
      )

      DELETE_DOMAIN_UNIT = OperationModel.new(
        name: "DeleteDomainUnit",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/domain-units/{identifier}"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{identifier}"
      )

      DELETE_ENVIRONMENT_ACTION = OperationModel.new(
        name: "DeleteEnvironmentAction",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/actions/{identifier}"
      )

      DELETE_ENVIRONMENT_BLUEPRINT = OperationModel.new(
        name: "DeleteEnvironmentBlueprint",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprints/{identifier}"
      )

      DELETE_ENVIRONMENT_BLUEPRINT_CONFIGURATION = OperationModel.new(
        name: "DeleteEnvironmentBlueprintConfiguration",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprint-configurations/{environmentBlueprintIdentifier}"
      )

      DELETE_ENVIRONMENT_PROFILE = OperationModel.new(
        name: "DeleteEnvironmentProfile",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environment-profiles/{identifier}"
      )

      DELETE_FORM_TYPE = OperationModel.new(
        name: "DeleteFormType",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/form-types/{formTypeIdentifier}"
      )

      DELETE_GLOSSARY = OperationModel.new(
        name: "DeleteGlossary",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/glossaries/{identifier}"
      )

      DELETE_GLOSSARY_TERM = OperationModel.new(
        name: "DeleteGlossaryTerm",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/glossary-terms/{identifier}"
      )

      DELETE_LISTING = OperationModel.new(
        name: "DeleteListing",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/listings/{identifier}"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{identifier}"
      )

      DELETE_PROJECT_MEMBERSHIP = OperationModel.new(
        name: "DeleteProjectMembership",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{projectIdentifier}/deleteMembership"
      )

      DELETE_PROJECT_PROFILE = OperationModel.new(
        name: "DeleteProjectProfile",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/project-profiles/{identifier}"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/rules/{identifier}"
      )

      DELETE_SUBSCRIPTION_GRANT = OperationModel.new(
        name: "DeleteSubscriptionGrant",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-grants/{identifier}"
      )

      DELETE_SUBSCRIPTION_REQUEST = OperationModel.new(
        name: "DeleteSubscriptionRequest",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests/{identifier}"
      )

      DELETE_SUBSCRIPTION_TARGET = OperationModel.new(
        name: "DeleteSubscriptionTarget",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/subscription-targets/{identifier}"
      )

      DELETE_TIME_SERIES_DATA_POINTS = OperationModel.new(
        name: "DeleteTimeSeriesDataPoints",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/time-series-data-points"
      )

      DISASSOCIATE_ENVIRONMENT_ROLE = OperationModel.new(
        name: "DisassociateEnvironmentRole",
        http_method: "DELETE",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/roles/{environmentRoleArn}"
      )

      DISASSOCIATE_GOVERNED_TERMS = OperationModel.new(
        name: "DisassociateGovernedTerms",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/disassociate-governed-terms"
      )

      GET_ACCOUNT_POOL = OperationModel.new(
        name: "GetAccountPool",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools/{identifier}"
      )

      GET_ASSET = OperationModel.new(
        name: "GetAsset",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}"
      )

      GET_ASSET_FILTER = OperationModel.new(
        name: "GetAssetFilter",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{assetIdentifier}/filters/{identifier}"
      )

      GET_ASSET_TYPE = OperationModel.new(
        name: "GetAssetType",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/asset-types/{identifier}"
      )

      GET_CONNECTION = OperationModel.new(
        name: "GetConnection",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/connections/{identifier}"
      )

      GET_DATA_EXPORT_CONFIGURATION = OperationModel.new(
        name: "GetDataExportConfiguration",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-export-configuration"
      )

      GET_DATA_PRODUCT = OperationModel.new(
        name: "GetDataProduct",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-products/{identifier}"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources/{identifier}"
      )

      GET_DATA_SOURCE_RUN = OperationModel.new(
        name: "GetDataSourceRun",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-source-runs/{identifier}"
      )

      GET_DOMAIN = OperationModel.new(
        name: "GetDomain",
        http_method: "GET",
        request_uri: "/v2/domains/{identifier}"
      )

      GET_DOMAIN_UNIT = OperationModel.new(
        name: "GetDomainUnit",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/domain-units/{identifier}"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{identifier}"
      )

      GET_ENVIRONMENT_ACTION = OperationModel.new(
        name: "GetEnvironmentAction",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/actions/{identifier}"
      )

      GET_ENVIRONMENT_BLUEPRINT = OperationModel.new(
        name: "GetEnvironmentBlueprint",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprints/{identifier}"
      )

      GET_ENVIRONMENT_BLUEPRINT_CONFIGURATION = OperationModel.new(
        name: "GetEnvironmentBlueprintConfiguration",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprint-configurations/{environmentBlueprintIdentifier}"
      )

      GET_ENVIRONMENT_CREDENTIALS = OperationModel.new(
        name: "GetEnvironmentCredentials",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/credentials"
      )

      GET_ENVIRONMENT_PROFILE = OperationModel.new(
        name: "GetEnvironmentProfile",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-profiles/{identifier}"
      )

      GET_FORM_TYPE = OperationModel.new(
        name: "GetFormType",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/form-types/{formTypeIdentifier}"
      )

      GET_GLOSSARY = OperationModel.new(
        name: "GetGlossary",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/glossaries/{identifier}"
      )

      GET_GLOSSARY_TERM = OperationModel.new(
        name: "GetGlossaryTerm",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/glossary-terms/{identifier}"
      )

      GET_GROUP_PROFILE = OperationModel.new(
        name: "GetGroupProfile",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/group-profiles/{groupIdentifier}"
      )

      GET_IAM_PORTAL_LOGIN_URL = OperationModel.new(
        name: "GetIamPortalLoginUrl",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/get-portal-login-url"
      )

      GET_JOB_RUN = OperationModel.new(
        name: "GetJobRun",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/jobRuns/{identifier}"
      )

      GET_LINEAGE_EVENT = OperationModel.new(
        name: "GetLineageEvent",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/lineage/events/{identifier}"
      )

      GET_LINEAGE_NODE = OperationModel.new(
        name: "GetLineageNode",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/lineage/nodes/{identifier}"
      )

      GET_LISTING = OperationModel.new(
        name: "GetListing",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/listings/{identifier}"
      )

      GET_METADATA_GENERATION_RUN = OperationModel.new(
        name: "GetMetadataGenerationRun",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/metadata-generation-runs/{identifier}"
      )

      GET_PROJECT = OperationModel.new(
        name: "GetProject",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{identifier}"
      )

      GET_PROJECT_PROFILE = OperationModel.new(
        name: "GetProjectProfile",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/project-profiles/{identifier}"
      )

      GET_RULE = OperationModel.new(
        name: "GetRule",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/rules/{identifier}"
      )

      GET_SUBSCRIPTION = OperationModel.new(
        name: "GetSubscription",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscriptions/{identifier}"
      )

      GET_SUBSCRIPTION_GRANT = OperationModel.new(
        name: "GetSubscriptionGrant",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-grants/{identifier}"
      )

      GET_SUBSCRIPTION_REQUEST_DETAILS = OperationModel.new(
        name: "GetSubscriptionRequestDetails",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests/{identifier}"
      )

      GET_SUBSCRIPTION_TARGET = OperationModel.new(
        name: "GetSubscriptionTarget",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/subscription-targets/{identifier}"
      )

      GET_TIME_SERIES_DATA_POINT = OperationModel.new(
        name: "GetTimeSeriesDataPoint",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/time-series-data-points/{identifier}"
      )

      GET_USER_PROFILE = OperationModel.new(
        name: "GetUserProfile",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/user-profiles/{userIdentifier}"
      )

      LIST_ACCOUNT_POOLS = OperationModel.new(
        name: "ListAccountPools",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools"
      )

      LIST_ACCOUNTS_IN_ACCOUNT_POOL = OperationModel.new(
        name: "ListAccountsInAccountPool",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools/{identifier}/accounts"
      )

      LIST_ASSET_FILTERS = OperationModel.new(
        name: "ListAssetFilters",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{assetIdentifier}/filters"
      )

      LIST_ASSET_REVISIONS = OperationModel.new(
        name: "ListAssetRevisions",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}/revisions"
      )

      LIST_CONNECTIONS = OperationModel.new(
        name: "ListConnections",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/connections"
      )

      LIST_DATA_PRODUCT_REVISIONS = OperationModel.new(
        name: "ListDataProductRevisions",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-products/{identifier}/revisions"
      )

      LIST_DATA_SOURCE_RUN_ACTIVITIES = OperationModel.new(
        name: "ListDataSourceRunActivities",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-source-runs/{identifier}/activities"
      )

      LIST_DATA_SOURCE_RUNS = OperationModel.new(
        name: "ListDataSourceRuns",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources/{dataSourceIdentifier}/runs"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources"
      )

      LIST_DOMAIN_UNITS_FOR_PARENT = OperationModel.new(
        name: "ListDomainUnitsForParent",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/domain-units"
      )

      LIST_DOMAINS = OperationModel.new(
        name: "ListDomains",
        http_method: "GET",
        request_uri: "/v2/domains"
      )

      LIST_ENTITY_OWNERS = OperationModel.new(
        name: "ListEntityOwners",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/owners"
      )

      LIST_ENVIRONMENT_ACTIONS = OperationModel.new(
        name: "ListEnvironmentActions",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/actions"
      )

      LIST_ENVIRONMENT_BLUEPRINT_CONFIGURATIONS = OperationModel.new(
        name: "ListEnvironmentBlueprintConfigurations",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprint-configurations"
      )

      LIST_ENVIRONMENT_BLUEPRINTS = OperationModel.new(
        name: "ListEnvironmentBlueprints",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprints"
      )

      LIST_ENVIRONMENT_PROFILES = OperationModel.new(
        name: "ListEnvironmentProfiles",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environment-profiles"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments"
      )

      LIST_JOB_RUNS = OperationModel.new(
        name: "ListJobRuns",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/jobs/{jobIdentifier}/runs"
      )

      LIST_LINEAGE_EVENTS = OperationModel.new(
        name: "ListLineageEvents",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/lineage/events"
      )

      LIST_LINEAGE_NODE_HISTORY = OperationModel.new(
        name: "ListLineageNodeHistory",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/lineage/nodes/{identifier}/history"
      )

      LIST_METADATA_GENERATION_RUNS = OperationModel.new(
        name: "ListMetadataGenerationRuns",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/metadata-generation-runs"
      )

      LIST_NOTIFICATIONS = OperationModel.new(
        name: "ListNotifications",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/notifications"
      )

      LIST_POLICY_GRANTS = OperationModel.new(
        name: "ListPolicyGrants",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/policies/managed/{entityType}/{entityIdentifier}/grants"
      )

      LIST_PROJECT_MEMBERSHIPS = OperationModel.new(
        name: "ListProjectMemberships",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{projectIdentifier}/memberships"
      )

      LIST_PROJECT_PROFILES = OperationModel.new(
        name: "ListProjectProfiles",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/project-profiles"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/projects"
      )

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/list-rules/{targetType}/{targetIdentifier}"
      )

      LIST_SUBSCRIPTION_GRANTS = OperationModel.new(
        name: "ListSubscriptionGrants",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-grants"
      )

      LIST_SUBSCRIPTION_REQUESTS = OperationModel.new(
        name: "ListSubscriptionRequests",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests"
      )

      LIST_SUBSCRIPTION_TARGETS = OperationModel.new(
        name: "ListSubscriptionTargets",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/subscription-targets"
      )

      LIST_SUBSCRIPTIONS = OperationModel.new(
        name: "ListSubscriptions",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/subscriptions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TIME_SERIES_DATA_POINTS = OperationModel.new(
        name: "ListTimeSeriesDataPoints",
        http_method: "GET",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/time-series-data-points"
      )

      POST_LINEAGE_EVENT = OperationModel.new(
        name: "PostLineageEvent",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/lineage/events"
      )

      POST_TIME_SERIES_DATA_POINTS = OperationModel.new(
        name: "PostTimeSeriesDataPoints",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/time-series-data-points"
      )

      PUT_DATA_EXPORT_CONFIGURATION = OperationModel.new(
        name: "PutDataExportConfiguration",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/data-export-configuration"
      )

      PUT_ENVIRONMENT_BLUEPRINT_CONFIGURATION = OperationModel.new(
        name: "PutEnvironmentBlueprintConfiguration",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprint-configurations/{environmentBlueprintIdentifier}"
      )

      REJECT_PREDICTIONS = OperationModel.new(
        name: "RejectPredictions",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{identifier}/reject-predictions"
      )

      REJECT_SUBSCRIPTION_REQUEST = OperationModel.new(
        name: "RejectSubscriptionRequest",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests/{identifier}/reject"
      )

      REMOVE_ENTITY_OWNER = OperationModel.new(
        name: "RemoveEntityOwner",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/entities/{entityType}/{entityIdentifier}/removeOwner"
      )

      REMOVE_POLICY_GRANT = OperationModel.new(
        name: "RemovePolicyGrant",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/policies/managed/{entityType}/{entityIdentifier}/removeGrant"
      )

      REVOKE_SUBSCRIPTION = OperationModel.new(
        name: "RevokeSubscription",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/subscriptions/{identifier}/revoke"
      )

      SEARCH = OperationModel.new(
        name: "Search",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/search"
      )

      SEARCH_GROUP_PROFILES = OperationModel.new(
        name: "SearchGroupProfiles",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/search-group-profiles"
      )

      SEARCH_LISTINGS = OperationModel.new(
        name: "SearchListings",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/listings/search"
      )

      SEARCH_TYPES = OperationModel.new(
        name: "SearchTypes",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/types-search"
      )

      SEARCH_USER_PROFILES = OperationModel.new(
        name: "SearchUserProfiles",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/search-user-profiles"
      )

      START_DATA_SOURCE_RUN = OperationModel.new(
        name: "StartDataSourceRun",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources/{dataSourceIdentifier}/runs"
      )

      START_METADATA_GENERATION_RUN = OperationModel.new(
        name: "StartMetadataGenerationRun",
        http_method: "POST",
        request_uri: "/v2/domains/{domainIdentifier}/metadata-generation-runs"
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

      UPDATE_ACCOUNT_POOL = OperationModel.new(
        name: "UpdateAccountPool",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/account-pools/{identifier}"
      )

      UPDATE_ASSET_FILTER = OperationModel.new(
        name: "UpdateAssetFilter",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/assets/{assetIdentifier}/filters/{identifier}"
      )

      UPDATE_CONNECTION = OperationModel.new(
        name: "UpdateConnection",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/connections/{identifier}"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/data-sources/{identifier}"
      )

      UPDATE_DOMAIN = OperationModel.new(
        name: "UpdateDomain",
        http_method: "PUT",
        request_uri: "/v2/domains/{identifier}"
      )

      UPDATE_DOMAIN_UNIT = OperationModel.new(
        name: "UpdateDomainUnit",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/domain-units/{identifier}"
      )

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{identifier}"
      )

      UPDATE_ENVIRONMENT_ACTION = OperationModel.new(
        name: "UpdateEnvironmentAction",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/actions/{identifier}"
      )

      UPDATE_ENVIRONMENT_BLUEPRINT = OperationModel.new(
        name: "UpdateEnvironmentBlueprint",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/environment-blueprints/{identifier}"
      )

      UPDATE_ENVIRONMENT_PROFILE = OperationModel.new(
        name: "UpdateEnvironmentProfile",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/environment-profiles/{identifier}"
      )

      UPDATE_GLOSSARY = OperationModel.new(
        name: "UpdateGlossary",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/glossaries/{identifier}"
      )

      UPDATE_GLOSSARY_TERM = OperationModel.new(
        name: "UpdateGlossaryTerm",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/glossary-terms/{identifier}"
      )

      UPDATE_GROUP_PROFILE = OperationModel.new(
        name: "UpdateGroupProfile",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/group-profiles/{groupIdentifier}"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/projects/{identifier}"
      )

      UPDATE_PROJECT_PROFILE = OperationModel.new(
        name: "UpdateProjectProfile",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/project-profiles/{identifier}"
      )

      UPDATE_ROOT_DOMAIN_UNIT_OWNER = OperationModel.new(
        name: "UpdateRootDomainUnitOwner",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/root-domain-unit-owner"
      )

      UPDATE_RULE = OperationModel.new(
        name: "UpdateRule",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/rules/{identifier}"
      )

      UPDATE_SUBSCRIPTION_GRANT_STATUS = OperationModel.new(
        name: "UpdateSubscriptionGrantStatus",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-grants/{identifier}/status/{assetIdentifier}"
      )

      UPDATE_SUBSCRIPTION_REQUEST = OperationModel.new(
        name: "UpdateSubscriptionRequest",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/subscription-requests/{identifier}"
      )

      UPDATE_SUBSCRIPTION_TARGET = OperationModel.new(
        name: "UpdateSubscriptionTarget",
        http_method: "PATCH",
        request_uri: "/v2/domains/{domainIdentifier}/environments/{environmentIdentifier}/subscription-targets/{identifier}"
      )

      UPDATE_USER_PROFILE = OperationModel.new(
        name: "UpdateUserProfile",
        http_method: "PUT",
        request_uri: "/v2/domains/{domainIdentifier}/user-profiles/{userIdentifier}"
      )
    end
  end
end
