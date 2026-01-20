module Aws
  module ElasticLoadBalancingV2
    module Model
      API_VERSION = "2015-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "elasticloadbalancing"
      ENDPOINT_PREFIX = "elasticloadbalancing"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticloadbalancing-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://elasticloadbalancing.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://elasticloadbalancing-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticloadbalancing.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://elasticloadbalancing.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_LISTENER_CERTIFICATES = OperationModel.new(
        name: "AddListenerCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TRUST_STORE_REVOCATIONS = OperationModel.new(
        name: "AddTrustStoreRevocations",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LISTENER = OperationModel.new(
        name: "CreateListener",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER = OperationModel.new(
        name: "CreateLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TARGET_GROUP = OperationModel.new(
        name: "CreateTargetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRUST_STORE = OperationModel.new(
        name: "CreateTrustStore",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LISTENER = OperationModel.new(
        name: "DeleteListener",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER = OperationModel.new(
        name: "DeleteLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SHARED_TRUST_STORE_ASSOCIATION = OperationModel.new(
        name: "DeleteSharedTrustStoreAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TARGET_GROUP = OperationModel.new(
        name: "DeleteTargetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRUST_STORE = OperationModel.new(
        name: "DeleteTrustStore",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TARGETS = OperationModel.new(
        name: "DeregisterTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_LIMITS = OperationModel.new(
        name: "DescribeAccountLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_RESERVATION = OperationModel.new(
        name: "DescribeCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LISTENER_ATTRIBUTES = OperationModel.new(
        name: "DescribeListenerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LISTENER_CERTIFICATES = OperationModel.new(
        name: "DescribeListenerCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LISTENERS = OperationModel.new(
        name: "DescribeListeners",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCER_ATTRIBUTES = OperationModel.new(
        name: "DescribeLoadBalancerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCERS = OperationModel.new(
        name: "DescribeLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RULES = OperationModel.new(
        name: "DescribeRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SSL_POLICIES = OperationModel.new(
        name: "DescribeSSLPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TARGET_GROUP_ATTRIBUTES = OperationModel.new(
        name: "DescribeTargetGroupAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TARGET_GROUPS = OperationModel.new(
        name: "DescribeTargetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TARGET_HEALTH = OperationModel.new(
        name: "DescribeTargetHealth",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUST_STORE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeTrustStoreAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUST_STORE_REVOCATIONS = OperationModel.new(
        name: "DescribeTrustStoreRevocations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUST_STORES = OperationModel.new(
        name: "DescribeTrustStores",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRUST_STORE_CA_CERTIFICATES_BUNDLE = OperationModel.new(
        name: "GetTrustStoreCaCertificatesBundle",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRUST_STORE_REVOCATION_CONTENT = OperationModel.new(
        name: "GetTrustStoreRevocationContent",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CAPACITY_RESERVATION = OperationModel.new(
        name: "ModifyCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IP_POOLS = OperationModel.new(
        name: "ModifyIpPools",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LISTENER = OperationModel.new(
        name: "ModifyListener",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LISTENER_ATTRIBUTES = OperationModel.new(
        name: "ModifyListenerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LOAD_BALANCER_ATTRIBUTES = OperationModel.new(
        name: "ModifyLoadBalancerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_RULE = OperationModel.new(
        name: "ModifyRule",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TARGET_GROUP = OperationModel.new(
        name: "ModifyTargetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TARGET_GROUP_ATTRIBUTES = OperationModel.new(
        name: "ModifyTargetGroupAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRUST_STORE = OperationModel.new(
        name: "ModifyTrustStore",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TARGETS = OperationModel.new(
        name: "RegisterTargets",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_LISTENER_CERTIFICATES = OperationModel.new(
        name: "RemoveListenerCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TRUST_STORE_REVOCATIONS = OperationModel.new(
        name: "RemoveTrustStoreRevocations",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IP_ADDRESS_TYPE = OperationModel.new(
        name: "SetIpAddressType",
        http_method: "POST",
        request_uri: "/"
      )

      SET_RULE_PRIORITIES = OperationModel.new(
        name: "SetRulePriorities",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SECURITY_GROUPS = OperationModel.new(
        name: "SetSecurityGroups",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SUBNETS = OperationModel.new(
        name: "SetSubnets",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
