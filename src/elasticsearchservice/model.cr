module Aws
  module ElasticsearchService
    module Model
      API_VERSION = "2015-01-01"
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

      ACCEPT_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION = OperationModel.new(
        name: "AcceptInboundCrossClusterSearchConnection",
        http_method: "PUT",
        request_uri: "/2015-01-01/es/ccs/inboundConnection/{ConnectionId}/accept"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/2015-01-01/tags"
      )

      ASSOCIATE_PACKAGE = OperationModel.new(
        name: "AssociatePackage",
        http_method: "POST",
        request_uri: "/2015-01-01/packages/associate/{PackageID}/{DomainName}"
      )

      AUTHORIZE_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "AuthorizeVpcEndpointAccess",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain/{DomainName}/authorizeVpcEndpointAccess"
      )

      CANCEL_DOMAIN_CONFIG_CHANGE = OperationModel.new(
        name: "CancelDomainConfigChange",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain/{DomainName}/config/cancel"
      )

      CANCEL_ELASTICSEARCH_SERVICE_SOFTWARE_UPDATE = OperationModel.new(
        name: "CancelElasticsearchServiceSoftwareUpdate",
        http_method: "POST",
        request_uri: "/2015-01-01/es/serviceSoftwareUpdate/cancel"
      )

      CREATE_ELASTICSEARCH_DOMAIN = OperationModel.new(
        name: "CreateElasticsearchDomain",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain"
      )

      CREATE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTION = OperationModel.new(
        name: "CreateOutboundCrossClusterSearchConnection",
        http_method: "POST",
        request_uri: "/2015-01-01/es/ccs/outboundConnection"
      )

      CREATE_PACKAGE = OperationModel.new(
        name: "CreatePackage",
        http_method: "POST",
        request_uri: "/2015-01-01/packages"
      )

      CREATE_VPC_ENDPOINT = OperationModel.new(
        name: "CreateVpcEndpoint",
        http_method: "POST",
        request_uri: "/2015-01-01/es/vpcEndpoints"
      )

      DELETE_ELASTICSEARCH_DOMAIN = OperationModel.new(
        name: "DeleteElasticsearchDomain",
        http_method: "DELETE",
        request_uri: "/2015-01-01/es/domain/{DomainName}"
      )

      DELETE_ELASTICSEARCH_SERVICE_ROLE = OperationModel.new(
        name: "DeleteElasticsearchServiceRole",
        http_method: "DELETE",
        request_uri: "/2015-01-01/es/role"
      )

      DELETE_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION = OperationModel.new(
        name: "DeleteInboundCrossClusterSearchConnection",
        http_method: "DELETE",
        request_uri: "/2015-01-01/es/ccs/inboundConnection/{ConnectionId}"
      )

      DELETE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTION = OperationModel.new(
        name: "DeleteOutboundCrossClusterSearchConnection",
        http_method: "DELETE",
        request_uri: "/2015-01-01/es/ccs/outboundConnection/{ConnectionId}"
      )

      DELETE_PACKAGE = OperationModel.new(
        name: "DeletePackage",
        http_method: "DELETE",
        request_uri: "/2015-01-01/packages/{PackageID}"
      )

      DELETE_VPC_ENDPOINT = OperationModel.new(
        name: "DeleteVpcEndpoint",
        http_method: "DELETE",
        request_uri: "/2015-01-01/es/vpcEndpoints/{VpcEndpointId}"
      )

      DESCRIBE_DOMAIN_AUTO_TUNES = OperationModel.new(
        name: "DescribeDomainAutoTunes",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}/autoTunes"
      )

      DESCRIBE_DOMAIN_CHANGE_PROGRESS = OperationModel.new(
        name: "DescribeDomainChangeProgress",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}/progress"
      )

      DESCRIBE_ELASTICSEARCH_DOMAIN = OperationModel.new(
        name: "DescribeElasticsearchDomain",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}"
      )

      DESCRIBE_ELASTICSEARCH_DOMAIN_CONFIG = OperationModel.new(
        name: "DescribeElasticsearchDomainConfig",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}/config"
      )

      DESCRIBE_ELASTICSEARCH_DOMAINS = OperationModel.new(
        name: "DescribeElasticsearchDomains",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain-info"
      )

      DESCRIBE_ELASTICSEARCH_INSTANCE_TYPE_LIMITS = OperationModel.new(
        name: "DescribeElasticsearchInstanceTypeLimits",
        http_method: "GET",
        request_uri: "/2015-01-01/es/instanceTypeLimits/{ElasticsearchVersion}/{InstanceType}"
      )

      DESCRIBE_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTIONS = OperationModel.new(
        name: "DescribeInboundCrossClusterSearchConnections",
        http_method: "POST",
        request_uri: "/2015-01-01/es/ccs/inboundConnection/search"
      )

      DESCRIBE_OUTBOUND_CROSS_CLUSTER_SEARCH_CONNECTIONS = OperationModel.new(
        name: "DescribeOutboundCrossClusterSearchConnections",
        http_method: "POST",
        request_uri: "/2015-01-01/es/ccs/outboundConnection/search"
      )

      DESCRIBE_PACKAGES = OperationModel.new(
        name: "DescribePackages",
        http_method: "POST",
        request_uri: "/2015-01-01/packages/describe"
      )

      DESCRIBE_RESERVED_ELASTICSEARCH_INSTANCE_OFFERINGS = OperationModel.new(
        name: "DescribeReservedElasticsearchInstanceOfferings",
        http_method: "GET",
        request_uri: "/2015-01-01/es/reservedInstanceOfferings"
      )

      DESCRIBE_RESERVED_ELASTICSEARCH_INSTANCES = OperationModel.new(
        name: "DescribeReservedElasticsearchInstances",
        http_method: "GET",
        request_uri: "/2015-01-01/es/reservedInstances"
      )

      DESCRIBE_VPC_ENDPOINTS = OperationModel.new(
        name: "DescribeVpcEndpoints",
        http_method: "POST",
        request_uri: "/2015-01-01/es/vpcEndpoints/describe"
      )

      DISSOCIATE_PACKAGE = OperationModel.new(
        name: "DissociatePackage",
        http_method: "POST",
        request_uri: "/2015-01-01/packages/dissociate/{PackageID}/{DomainName}"
      )

      GET_COMPATIBLE_ELASTICSEARCH_VERSIONS = OperationModel.new(
        name: "GetCompatibleElasticsearchVersions",
        http_method: "GET",
        request_uri: "/2015-01-01/es/compatibleVersions"
      )

      GET_PACKAGE_VERSION_HISTORY = OperationModel.new(
        name: "GetPackageVersionHistory",
        http_method: "GET",
        request_uri: "/2015-01-01/packages/{PackageID}/history"
      )

      GET_UPGRADE_HISTORY = OperationModel.new(
        name: "GetUpgradeHistory",
        http_method: "GET",
        request_uri: "/2015-01-01/es/upgradeDomain/{DomainName}/history"
      )

      GET_UPGRADE_STATUS = OperationModel.new(
        name: "GetUpgradeStatus",
        http_method: "GET",
        request_uri: "/2015-01-01/es/upgradeDomain/{DomainName}/status"
      )

      LIST_DOMAIN_NAMES = OperationModel.new(
        name: "ListDomainNames",
        http_method: "GET",
        request_uri: "/2015-01-01/domain"
      )

      LIST_DOMAINS_FOR_PACKAGE = OperationModel.new(
        name: "ListDomainsForPackage",
        http_method: "GET",
        request_uri: "/2015-01-01/packages/{PackageID}/domains"
      )

      LIST_ELASTICSEARCH_INSTANCE_TYPES = OperationModel.new(
        name: "ListElasticsearchInstanceTypes",
        http_method: "GET",
        request_uri: "/2015-01-01/es/instanceTypes/{ElasticsearchVersion}"
      )

      LIST_ELASTICSEARCH_VERSIONS = OperationModel.new(
        name: "ListElasticsearchVersions",
        http_method: "GET",
        request_uri: "/2015-01-01/es/versions"
      )

      LIST_PACKAGES_FOR_DOMAIN = OperationModel.new(
        name: "ListPackagesForDomain",
        http_method: "GET",
        request_uri: "/2015-01-01/domain/{DomainName}/packages"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "GET",
        request_uri: "/2015-01-01/tags/"
      )

      LIST_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "ListVpcEndpointAccess",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}/listVpcEndpointAccess"
      )

      LIST_VPC_ENDPOINTS = OperationModel.new(
        name: "ListVpcEndpoints",
        http_method: "GET",
        request_uri: "/2015-01-01/es/vpcEndpoints"
      )

      LIST_VPC_ENDPOINTS_FOR_DOMAIN = OperationModel.new(
        name: "ListVpcEndpointsForDomain",
        http_method: "GET",
        request_uri: "/2015-01-01/es/domain/{DomainName}/vpcEndpoints"
      )

      PURCHASE_RESERVED_ELASTICSEARCH_INSTANCE_OFFERING = OperationModel.new(
        name: "PurchaseReservedElasticsearchInstanceOffering",
        http_method: "POST",
        request_uri: "/2015-01-01/es/purchaseReservedInstanceOffering"
      )

      REJECT_INBOUND_CROSS_CLUSTER_SEARCH_CONNECTION = OperationModel.new(
        name: "RejectInboundCrossClusterSearchConnection",
        http_method: "PUT",
        request_uri: "/2015-01-01/es/ccs/inboundConnection/{ConnectionId}/reject"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/2015-01-01/tags-removal"
      )

      REVOKE_VPC_ENDPOINT_ACCESS = OperationModel.new(
        name: "RevokeVpcEndpointAccess",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain/{DomainName}/revokeVpcEndpointAccess"
      )

      START_ELASTICSEARCH_SERVICE_SOFTWARE_UPDATE = OperationModel.new(
        name: "StartElasticsearchServiceSoftwareUpdate",
        http_method: "POST",
        request_uri: "/2015-01-01/es/serviceSoftwareUpdate/start"
      )

      UPDATE_ELASTICSEARCH_DOMAIN_CONFIG = OperationModel.new(
        name: "UpdateElasticsearchDomainConfig",
        http_method: "POST",
        request_uri: "/2015-01-01/es/domain/{DomainName}/config"
      )

      UPDATE_PACKAGE = OperationModel.new(
        name: "UpdatePackage",
        http_method: "POST",
        request_uri: "/2015-01-01/packages/update"
      )

      UPDATE_VPC_ENDPOINT = OperationModel.new(
        name: "UpdateVpcEndpoint",
        http_method: "POST",
        request_uri: "/2015-01-01/es/vpcEndpoints/update"
      )

      UPGRADE_ELASTICSEARCH_DOMAIN = OperationModel.new(
        name: "UpgradeElasticsearchDomain",
        http_method: "POST",
        request_uri: "/2015-01-01/es/upgradeDomain"
      )
    end
  end
end
