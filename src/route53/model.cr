module Aws
  module Route53
    module Model
      API_VERSION = "2013-04-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "route53"
      ENDPOINT_PREFIX = "route53"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53-fips.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53-fips.global.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53.global.api.amazonwebservices.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.us-gov.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.us-gov.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53.us-gov.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53.us-gov.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.c2s.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-iso-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.sc2s.sgov.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isob-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.cloud.adc-e.uk","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eu-isoe-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.csp.hci.ic.gov","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-isof-south-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://route53.amazonaws.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://route53.global.api.amazonwebservices.eu","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"eusc-de-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-fips.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53-fips.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://route53.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://route53.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_KEY_SIGNING_KEY = OperationModel.new(
        name: "ActivateKeySigningKey",
        http_method: "POST",
        request_uri: "/2013-04-01/keysigningkey/{HostedZoneId}/{Name}/activate"
      )

      ASSOCIATE_VPC_WITH_HOSTED_ZONE = OperationModel.new(
        name: "AssociateVPCWithHostedZone",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/associatevpc"
      )

      CHANGE_CIDR_COLLECTION = OperationModel.new(
        name: "ChangeCidrCollection",
        http_method: "POST",
        request_uri: "/2013-04-01/cidrcollection/{CidrCollectionId}"
      )

      CHANGE_RESOURCE_RECORD_SETS = OperationModel.new(
        name: "ChangeResourceRecordSets",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/rrset/"
      )

      CHANGE_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ChangeTagsForResource",
        http_method: "POST",
        request_uri: "/2013-04-01/tags/{ResourceType}/{ResourceId}"
      )

      CREATE_CIDR_COLLECTION = OperationModel.new(
        name: "CreateCidrCollection",
        http_method: "POST",
        request_uri: "/2013-04-01/cidrcollection"
      )

      CREATE_HEALTH_CHECK = OperationModel.new(
        name: "CreateHealthCheck",
        http_method: "POST",
        request_uri: "/2013-04-01/healthcheck"
      )

      CREATE_HOSTED_ZONE = OperationModel.new(
        name: "CreateHostedZone",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone"
      )

      CREATE_KEY_SIGNING_KEY = OperationModel.new(
        name: "CreateKeySigningKey",
        http_method: "POST",
        request_uri: "/2013-04-01/keysigningkey"
      )

      CREATE_QUERY_LOGGING_CONFIG = OperationModel.new(
        name: "CreateQueryLoggingConfig",
        http_method: "POST",
        request_uri: "/2013-04-01/queryloggingconfig"
      )

      CREATE_REUSABLE_DELEGATION_SET = OperationModel.new(
        name: "CreateReusableDelegationSet",
        http_method: "POST",
        request_uri: "/2013-04-01/delegationset"
      )

      CREATE_TRAFFIC_POLICY = OperationModel.new(
        name: "CreateTrafficPolicy",
        http_method: "POST",
        request_uri: "/2013-04-01/trafficpolicy"
      )

      CREATE_TRAFFIC_POLICY_INSTANCE = OperationModel.new(
        name: "CreateTrafficPolicyInstance",
        http_method: "POST",
        request_uri: "/2013-04-01/trafficpolicyinstance"
      )

      CREATE_TRAFFIC_POLICY_VERSION = OperationModel.new(
        name: "CreateTrafficPolicyVersion",
        http_method: "POST",
        request_uri: "/2013-04-01/trafficpolicy/{Id}"
      )

      CREATE_VPC_ASSOCIATION_AUTHORIZATION = OperationModel.new(
        name: "CreateVPCAssociationAuthorization",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
      )

      DEACTIVATE_KEY_SIGNING_KEY = OperationModel.new(
        name: "DeactivateKeySigningKey",
        http_method: "POST",
        request_uri: "/2013-04-01/keysigningkey/{HostedZoneId}/{Name}/deactivate"
      )

      DELETE_CIDR_COLLECTION = OperationModel.new(
        name: "DeleteCidrCollection",
        http_method: "DELETE",
        request_uri: "/2013-04-01/cidrcollection/{CidrCollectionId}"
      )

      DELETE_HEALTH_CHECK = OperationModel.new(
        name: "DeleteHealthCheck",
        http_method: "DELETE",
        request_uri: "/2013-04-01/healthcheck/{HealthCheckId}"
      )

      DELETE_HOSTED_ZONE = OperationModel.new(
        name: "DeleteHostedZone",
        http_method: "DELETE",
        request_uri: "/2013-04-01/hostedzone/{Id}"
      )

      DELETE_KEY_SIGNING_KEY = OperationModel.new(
        name: "DeleteKeySigningKey",
        http_method: "DELETE",
        request_uri: "/2013-04-01/keysigningkey/{HostedZoneId}/{Name}"
      )

      DELETE_QUERY_LOGGING_CONFIG = OperationModel.new(
        name: "DeleteQueryLoggingConfig",
        http_method: "DELETE",
        request_uri: "/2013-04-01/queryloggingconfig/{Id}"
      )

      DELETE_REUSABLE_DELEGATION_SET = OperationModel.new(
        name: "DeleteReusableDelegationSet",
        http_method: "DELETE",
        request_uri: "/2013-04-01/delegationset/{Id}"
      )

      DELETE_TRAFFIC_POLICY = OperationModel.new(
        name: "DeleteTrafficPolicy",
        http_method: "DELETE",
        request_uri: "/2013-04-01/trafficpolicy/{Id}/{Version}"
      )

      DELETE_TRAFFIC_POLICY_INSTANCE = OperationModel.new(
        name: "DeleteTrafficPolicyInstance",
        http_method: "DELETE",
        request_uri: "/2013-04-01/trafficpolicyinstance/{Id}"
      )

      DELETE_VPC_ASSOCIATION_AUTHORIZATION = OperationModel.new(
        name: "DeleteVPCAssociationAuthorization",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/deauthorizevpcassociation"
      )

      DISABLE_HOSTED_ZONE_DNSSEC = OperationModel.new(
        name: "DisableHostedZoneDNSSEC",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/disable-dnssec"
      )

      DISASSOCIATE_VPC_FROM_HOSTED_ZONE = OperationModel.new(
        name: "DisassociateVPCFromHostedZone",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/disassociatevpc"
      )

      ENABLE_HOSTED_ZONE_DNSSEC = OperationModel.new(
        name: "EnableHostedZoneDNSSEC",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/enable-dnssec"
      )

      GET_ACCOUNT_LIMIT = OperationModel.new(
        name: "GetAccountLimit",
        http_method: "GET",
        request_uri: "/2013-04-01/accountlimit/{Type}"
      )

      GET_CHANGE = OperationModel.new(
        name: "GetChange",
        http_method: "GET",
        request_uri: "/2013-04-01/change/{Id}"
      )

      GET_CHECKER_IP_RANGES = OperationModel.new(
        name: "GetCheckerIpRanges",
        http_method: "GET",
        request_uri: "/2013-04-01/checkeripranges"
      )

      GET_DNSSEC = OperationModel.new(
        name: "GetDNSSEC",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzone/{Id}/dnssec"
      )

      GET_GEO_LOCATION = OperationModel.new(
        name: "GetGeoLocation",
        http_method: "GET",
        request_uri: "/2013-04-01/geolocation"
      )

      GET_HEALTH_CHECK = OperationModel.new(
        name: "GetHealthCheck",
        http_method: "GET",
        request_uri: "/2013-04-01/healthcheck/{HealthCheckId}"
      )

      GET_HEALTH_CHECK_COUNT = OperationModel.new(
        name: "GetHealthCheckCount",
        http_method: "GET",
        request_uri: "/2013-04-01/healthcheckcount"
      )

      GET_HEALTH_CHECK_LAST_FAILURE_REASON = OperationModel.new(
        name: "GetHealthCheckLastFailureReason",
        http_method: "GET",
        request_uri: "/2013-04-01/healthcheck/{HealthCheckId}/lastfailurereason"
      )

      GET_HEALTH_CHECK_STATUS = OperationModel.new(
        name: "GetHealthCheckStatus",
        http_method: "GET",
        request_uri: "/2013-04-01/healthcheck/{HealthCheckId}/status"
      )

      GET_HOSTED_ZONE = OperationModel.new(
        name: "GetHostedZone",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzone/{Id}"
      )

      GET_HOSTED_ZONE_COUNT = OperationModel.new(
        name: "GetHostedZoneCount",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzonecount"
      )

      GET_HOSTED_ZONE_LIMIT = OperationModel.new(
        name: "GetHostedZoneLimit",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzonelimit/{Id}/{Type}"
      )

      GET_QUERY_LOGGING_CONFIG = OperationModel.new(
        name: "GetQueryLoggingConfig",
        http_method: "GET",
        request_uri: "/2013-04-01/queryloggingconfig/{Id}"
      )

      GET_REUSABLE_DELEGATION_SET = OperationModel.new(
        name: "GetReusableDelegationSet",
        http_method: "GET",
        request_uri: "/2013-04-01/delegationset/{Id}"
      )

      GET_REUSABLE_DELEGATION_SET_LIMIT = OperationModel.new(
        name: "GetReusableDelegationSetLimit",
        http_method: "GET",
        request_uri: "/2013-04-01/reusabledelegationsetlimit/{Id}/{Type}"
      )

      GET_TRAFFIC_POLICY = OperationModel.new(
        name: "GetTrafficPolicy",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicy/{Id}/{Version}"
      )

      GET_TRAFFIC_POLICY_INSTANCE = OperationModel.new(
        name: "GetTrafficPolicyInstance",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicyinstance/{Id}"
      )

      GET_TRAFFIC_POLICY_INSTANCE_COUNT = OperationModel.new(
        name: "GetTrafficPolicyInstanceCount",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicyinstancecount"
      )

      LIST_CIDR_BLOCKS = OperationModel.new(
        name: "ListCidrBlocks",
        http_method: "GET",
        request_uri: "/2013-04-01/cidrcollection/{CidrCollectionId}/cidrblocks"
      )

      LIST_CIDR_COLLECTIONS = OperationModel.new(
        name: "ListCidrCollections",
        http_method: "GET",
        request_uri: "/2013-04-01/cidrcollection"
      )

      LIST_CIDR_LOCATIONS = OperationModel.new(
        name: "ListCidrLocations",
        http_method: "GET",
        request_uri: "/2013-04-01/cidrcollection/{CidrCollectionId}"
      )

      LIST_GEO_LOCATIONS = OperationModel.new(
        name: "ListGeoLocations",
        http_method: "GET",
        request_uri: "/2013-04-01/geolocations"
      )

      LIST_HEALTH_CHECKS = OperationModel.new(
        name: "ListHealthChecks",
        http_method: "GET",
        request_uri: "/2013-04-01/healthcheck"
      )

      LIST_HOSTED_ZONES = OperationModel.new(
        name: "ListHostedZones",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzone"
      )

      LIST_HOSTED_ZONES_BY_NAME = OperationModel.new(
        name: "ListHostedZonesByName",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzonesbyname"
      )

      LIST_HOSTED_ZONES_BY_VPC = OperationModel.new(
        name: "ListHostedZonesByVPC",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzonesbyvpc"
      )

      LIST_QUERY_LOGGING_CONFIGS = OperationModel.new(
        name: "ListQueryLoggingConfigs",
        http_method: "GET",
        request_uri: "/2013-04-01/queryloggingconfig"
      )

      LIST_RESOURCE_RECORD_SETS = OperationModel.new(
        name: "ListResourceRecordSets",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzone/{Id}/rrset"
      )

      LIST_REUSABLE_DELEGATION_SETS = OperationModel.new(
        name: "ListReusableDelegationSets",
        http_method: "GET",
        request_uri: "/2013-04-01/delegationset"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2013-04-01/tags/{ResourceType}/{ResourceId}"
      )

      LIST_TAGS_FOR_RESOURCES = OperationModel.new(
        name: "ListTagsForResources",
        http_method: "POST",
        request_uri: "/2013-04-01/tags/{ResourceType}"
      )

      LIST_TRAFFIC_POLICIES = OperationModel.new(
        name: "ListTrafficPolicies",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicies"
      )

      LIST_TRAFFIC_POLICY_INSTANCES = OperationModel.new(
        name: "ListTrafficPolicyInstances",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicyinstances"
      )

      LIST_TRAFFIC_POLICY_INSTANCES_BY_HOSTED_ZONE = OperationModel.new(
        name: "ListTrafficPolicyInstancesByHostedZone",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicyinstances/hostedzone"
      )

      LIST_TRAFFIC_POLICY_INSTANCES_BY_POLICY = OperationModel.new(
        name: "ListTrafficPolicyInstancesByPolicy",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicyinstances/trafficpolicy"
      )

      LIST_TRAFFIC_POLICY_VERSIONS = OperationModel.new(
        name: "ListTrafficPolicyVersions",
        http_method: "GET",
        request_uri: "/2013-04-01/trafficpolicies/{Id}/versions"
      )

      LIST_VPC_ASSOCIATION_AUTHORIZATIONS = OperationModel.new(
        name: "ListVPCAssociationAuthorizations",
        http_method: "GET",
        request_uri: "/2013-04-01/hostedzone/{Id}/authorizevpcassociation"
      )

      TEST_DNS_ANSWER = OperationModel.new(
        name: "TestDNSAnswer",
        http_method: "GET",
        request_uri: "/2013-04-01/testdnsanswer"
      )

      UPDATE_HEALTH_CHECK = OperationModel.new(
        name: "UpdateHealthCheck",
        http_method: "POST",
        request_uri: "/2013-04-01/healthcheck/{HealthCheckId}"
      )

      UPDATE_HOSTED_ZONE_COMMENT = OperationModel.new(
        name: "UpdateHostedZoneComment",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}"
      )

      UPDATE_HOSTED_ZONE_FEATURES = OperationModel.new(
        name: "UpdateHostedZoneFeatures",
        http_method: "POST",
        request_uri: "/2013-04-01/hostedzone/{Id}/features"
      )

      UPDATE_TRAFFIC_POLICY_COMMENT = OperationModel.new(
        name: "UpdateTrafficPolicyComment",
        http_method: "POST",
        request_uri: "/2013-04-01/trafficpolicy/{Id}/{Version}"
      )

      UPDATE_TRAFFIC_POLICY_INSTANCE = OperationModel.new(
        name: "UpdateTrafficPolicyInstance",
        http_method: "POST",
        request_uri: "/2013-04-01/trafficpolicyinstance/{Id}"
      )
    end
  end
end
