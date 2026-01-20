module AwsSdk
  module OpenSearch
    module Model
      API_VERSION = "2021-01-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "es"
      ENDPOINT_PREFIX = "es"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://es-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://es-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://aos.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-cn",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://aos.{Region}.api.amazonwebservices.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://aos.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://es.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://es.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_INBOUND_CONNECTION = OperationModel.new(
        name: "AcceptInboundConnection",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/cc/inboundConnection/{ConnectionId}/accept"
      )

      ADD_DATA_SOURCE = OperationModel.new(
        name: "AddDataSource",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dataSource"
      )

      ADD_DIRECT_QUERY_DATA_SOURCE = OperationModel.new(
        name: "AddDirectQueryDataSource",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/directQueryDataSource"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/2021-01-01/tags"
      )

      ASSOCIATE_PACKAGE = OperationModel.new(
        name: "AssociatePackage",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/associate/{PackageID}/{DomainName}"
      )

      ASSOCIATE_PACKAGES = OperationModel.new(
        name: "AssociatePackages",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/associateMultiple"
      )

      AUTHORIZE_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "AuthorizeVpcEndpointAccess",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/authorizeVpcEndpointAccess"
      )

      CANCEL_DOMAIN_CONFIG_CHANGE = OperationModel.new(
        name: "CancelDomainConfigChange",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/config/cancel"
      )

      CANCEL_SERVICE_SOFTWARE_UPDATE = OperationModel.new(
        name: "CancelServiceSoftwareUpdate",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/serviceSoftwareUpdate/cancel"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/application"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain"
      )

      CREATE_INDEX = OperationModel.new(
        name: "CreateIndex",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/index"
      )

      CREATE_OUTBOUND_CONNECTION = OperationModel.new(
        name: "CreateOutboundConnection",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/cc/outboundConnection"
      )

      CREATE_PACKAGE = OperationModel.new(
        name: "CreatePackage",
        http_method: "POST",
        request_uri: "/2021-01-01/packages"
      )

      CREATE_VPC_ENDPOINT = OperationModel.new(
        name: "CreateVpcEndpoint",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/vpcEndpoints"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/application/{id}"
      )

      DELETE_DATA_SOURCE = OperationModel.new(
        name: "DeleteDataSource",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dataSource/{DataSourceName}"
      )

      DELETE_DIRECT_QUERY_DATA_SOURCE = OperationModel.new(
        name: "DeleteDirectQueryDataSource",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/directQueryDataSource/{DataSourceName}"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}"
      )

      DELETE_INBOUND_CONNECTION = OperationModel.new(
        name: "DeleteInboundConnection",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/cc/inboundConnection/{ConnectionId}"
      )

      DELETE_INDEX = OperationModel.new(
        name: "DeleteIndex",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/index/{IndexName}"
      )

      DELETE_OUTBOUND_CONNECTION = OperationModel.new(
        name: "DeleteOutboundConnection",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/cc/outboundConnection/{ConnectionId}"
      )

      DELETE_PACKAGE = OperationModel.new(
        name: "DeletePackage",
        http_method: "DELETE",
        request_uri: "/2021-01-01/packages/{PackageID}"
      )

      DELETE_VPC_ENDPOINT = OperationModel.new(
        name: "DeleteVpcEndpoint",
        http_method: "DELETE",
        request_uri: "/2021-01-01/opensearch/vpcEndpoints/{VpcEndpointId}"
      )

      DESCRIBE_DOMAIN = OperationModel.new(
        name: "DescribeDomain",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}"
      )

      DESCRIBE_DOMAIN_AUTO_TUNES = OperationModel.new(
        name: "DescribeDomainAutoTunes",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/autoTunes"
      )

      DESCRIBE_DOMAIN_CHANGE_PROGRESS = OperationModel.new(
        name: "DescribeDomainChangeProgress",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/progress"
      )

      DESCRIBE_DOMAIN_CONFIG = OperationModel.new(
        name: "DescribeDomainConfig",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/config"
      )

      DESCRIBE_DOMAIN_HEALTH = OperationModel.new(
        name: "DescribeDomainHealth",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/health"
      )

      DESCRIBE_DOMAIN_NODES = OperationModel.new(
        name: "DescribeDomainNodes",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/nodes"
      )

      DESCRIBE_DOMAINS = OperationModel.new(
        name: "DescribeDomains",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain-info"
      )

      DESCRIBE_DRY_RUN_PROGRESS = OperationModel.new(
        name: "DescribeDryRunProgress",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dryRun"
      )

      DESCRIBE_INBOUND_CONNECTIONS = OperationModel.new(
        name: "DescribeInboundConnections",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/cc/inboundConnection/search"
      )

      DESCRIBE_INSTANCE_TYPE_LIMITS = OperationModel.new(
        name: "DescribeInstanceTypeLimits",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/instanceTypeLimits/{EngineVersion}/{InstanceType}"
      )

      DESCRIBE_OUTBOUND_CONNECTIONS = OperationModel.new(
        name: "DescribeOutboundConnections",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/cc/outboundConnection/search"
      )

      DESCRIBE_PACKAGES = OperationModel.new(
        name: "DescribePackages",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/describe"
      )

      DESCRIBE_RESERVED_INSTANCE_OFFERINGS = OperationModel.new(
        name: "DescribeReservedInstanceOfferings",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/reservedInstanceOfferings"
      )

      DESCRIBE_RESERVED_INSTANCES = OperationModel.new(
        name: "DescribeReservedInstances",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/reservedInstances"
      )

      DESCRIBE_VPC_ENDPOINTS = OperationModel.new(
        name: "DescribeVpcEndpoints",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/vpcEndpoints/describe"
      )

      DISSOCIATE_PACKAGE = OperationModel.new(
        name: "DissociatePackage",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/dissociate/{PackageID}/{DomainName}"
      )

      DISSOCIATE_PACKAGES = OperationModel.new(
        name: "DissociatePackages",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/dissociateMultiple"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/application/{id}"
      )

      GET_COMPATIBLE_VERSIONS = OperationModel.new(
        name: "GetCompatibleVersions",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/compatibleVersions"
      )

      GET_DATA_SOURCE = OperationModel.new(
        name: "GetDataSource",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dataSource/{DataSourceName}"
      )

      GET_DEFAULT_APPLICATION_SETTING = OperationModel.new(
        name: "GetDefaultApplicationSetting",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/defaultApplicationSetting"
      )

      GET_DIRECT_QUERY_DATA_SOURCE = OperationModel.new(
        name: "GetDirectQueryDataSource",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/directQueryDataSource/{DataSourceName}"
      )

      GET_DOMAIN_MAINTENANCE_STATUS = OperationModel.new(
        name: "GetDomainMaintenanceStatus",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/domainMaintenance"
      )

      GET_INDEX = OperationModel.new(
        name: "GetIndex",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/index/{IndexName}"
      )

      GET_PACKAGE_VERSION_HISTORY = OperationModel.new(
        name: "GetPackageVersionHistory",
        http_method: "GET",
        request_uri: "/2021-01-01/packages/{PackageID}/history"
      )

      GET_UPGRADE_HISTORY = OperationModel.new(
        name: "GetUpgradeHistory",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/upgradeDomain/{DomainName}/history"
      )

      GET_UPGRADE_STATUS = OperationModel.new(
        name: "GetUpgradeStatus",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/upgradeDomain/{DomainName}/status"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/list-applications"
      )

      LIST_DATA_SOURCES = OperationModel.new(
        name: "ListDataSources",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dataSource"
      )

      LIST_DIRECT_QUERY_DATA_SOURCES = OperationModel.new(
        name: "ListDirectQueryDataSources",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/directQueryDataSource"
      )

      LIST_DOMAIN_MAINTENANCES = OperationModel.new(
        name: "ListDomainMaintenances",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/domainMaintenances"
      )

      LIST_DOMAIN_NAMES = OperationModel.new(
        name: "ListDomainNames",
        http_method: "GET",
        request_uri: "/2021-01-01/domain"
      )

      LIST_DOMAINS_FOR_PACKAGE = OperationModel.new(
        name: "ListDomainsForPackage",
        http_method: "GET",
        request_uri: "/2021-01-01/packages/{PackageID}/domains"
      )

      LIST_INSTANCE_TYPE_DETAILS = OperationModel.new(
        name: "ListInstanceTypeDetails",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/instanceTypeDetails/{EngineVersion}"
      )

      LIST_PACKAGES_FOR_DOMAIN = OperationModel.new(
        name: "ListPackagesForDomain",
        http_method: "GET",
        request_uri: "/2021-01-01/domain/{DomainName}/packages"
      )

      LIST_SCHEDULED_ACTIONS = OperationModel.new(
        name: "ListScheduledActions",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/scheduledActions"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "GET",
        request_uri: "/2021-01-01/tags/"
      )

      LIST_VERSIONS = OperationModel.new(
        name: "ListVersions",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/versions"
      )

      LIST_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "ListVpcEndpointAccess",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/listVpcEndpointAccess"
      )

      LIST_VPC_ENDPOINTS = OperationModel.new(
        name: "ListVpcEndpoints",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/vpcEndpoints"
      )

      LIST_VPC_ENDPOINTS_FOR_DOMAIN = OperationModel.new(
        name: "ListVpcEndpointsForDomain",
        http_method: "GET",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/vpcEndpoints"
      )

      PURCHASE_RESERVED_INSTANCE_OFFERING = OperationModel.new(
        name: "PurchaseReservedInstanceOffering",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/purchaseReservedInstanceOffering"
      )

      PUT_DEFAULT_APPLICATION_SETTING = OperationModel.new(
        name: "PutDefaultApplicationSetting",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/defaultApplicationSetting"
      )

      REJECT_INBOUND_CONNECTION = OperationModel.new(
        name: "RejectInboundConnection",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/cc/inboundConnection/{ConnectionId}/reject"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/2021-01-01/tags-removal"
      )

      REVOKE_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "RevokeVpcEndpointAccess",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/revokeVpcEndpointAccess"
      )

      START_DOMAIN_MAINTENANCE = OperationModel.new(
        name: "StartDomainMaintenance",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/domainMaintenance"
      )

      START_SERVICE_SOFTWARE_UPDATE = OperationModel.new(
        name: "StartServiceSoftwareUpdate",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/serviceSoftwareUpdate/start"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/application/{id}"
      )

      UPDATE_DATA_SOURCE = OperationModel.new(
        name: "UpdateDataSource",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/dataSource/{DataSourceName}"
      )

      UPDATE_DIRECT_QUERY_DATA_SOURCE = OperationModel.new(
        name: "UpdateDirectQueryDataSource",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/directQueryDataSource/{DataSourceName}"
      )

      UPDATE_DOMAIN_CONFIG = OperationModel.new(
        name: "UpdateDomainConfig",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/config"
      )

      UPDATE_INDEX = OperationModel.new(
        name: "UpdateIndex",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/index/{IndexName}"
      )

      UPDATE_PACKAGE = OperationModel.new(
        name: "UpdatePackage",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/update"
      )

      UPDATE_PACKAGE_SCOPE = OperationModel.new(
        name: "UpdatePackageScope",
        http_method: "POST",
        request_uri: "/2021-01-01/packages/updateScope"
      )

      UPDATE_SCHEDULED_ACTION = OperationModel.new(
        name: "UpdateScheduledAction",
        http_method: "PUT",
        request_uri: "/2021-01-01/opensearch/domain/{DomainName}/scheduledAction/update"
      )

      UPDATE_VPC_ENDPOINT = OperationModel.new(
        name: "UpdateVpcEndpoint",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/vpcEndpoints/update"
      )

      UPGRADE_DOMAIN = OperationModel.new(
        name: "UpgradeDomain",
        http_method: "POST",
        request_uri: "/2021-01-01/opensearch/upgradeDomain"
      )
    end
  end
end
