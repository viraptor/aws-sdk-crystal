module AwsSdk
  module ElasticLoadBalancing
    module Model
      API_VERSION = "2012-06-01"
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

      ADD_TAGS = OperationModel.new(
        name: "AddTags",
        http_method: "POST",
        request_uri: "/"
      )

      APPLY_SECURITY_GROUPS_TO_LOAD_BALANCER = OperationModel.new(
        name: "ApplySecurityGroupsToLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_LOAD_BALANCER_TO_SUBNETS = OperationModel.new(
        name: "AttachLoadBalancerToSubnets",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIGURE_HEALTH_CHECK = OperationModel.new(
        name: "ConfigureHealthCheck",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP_COOKIE_STICKINESS_POLICY = OperationModel.new(
        name: "CreateAppCookieStickinessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LB_COOKIE_STICKINESS_POLICY = OperationModel.new(
        name: "CreateLBCookieStickinessPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER = OperationModel.new(
        name: "CreateLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER_LISTENERS = OperationModel.new(
        name: "CreateLoadBalancerListeners",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER_POLICY = OperationModel.new(
        name: "CreateLoadBalancerPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER = OperationModel.new(
        name: "DeleteLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER_LISTENERS = OperationModel.new(
        name: "DeleteLoadBalancerListeners",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER_POLICY = OperationModel.new(
        name: "DeleteLoadBalancerPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_INSTANCES_FROM_LOAD_BALANCER = OperationModel.new(
        name: "DeregisterInstancesFromLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_LIMITS = OperationModel.new(
        name: "DescribeAccountLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_HEALTH = OperationModel.new(
        name: "DescribeInstanceHealth",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCER_ATTRIBUTES = OperationModel.new(
        name: "DescribeLoadBalancerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCER_POLICIES = OperationModel.new(
        name: "DescribeLoadBalancerPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCER_POLICY_TYPES = OperationModel.new(
        name: "DescribeLoadBalancerPolicyTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOAD_BALANCERS = OperationModel.new(
        name: "DescribeLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_LOAD_BALANCER_FROM_SUBNETS = OperationModel.new(
        name: "DetachLoadBalancerFromSubnets",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_AVAILABILITY_ZONES_FOR_LOAD_BALANCER = OperationModel.new(
        name: "DisableAvailabilityZonesForLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_AVAILABILITY_ZONES_FOR_LOAD_BALANCER = OperationModel.new(
        name: "EnableAvailabilityZonesForLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LOAD_BALANCER_ATTRIBUTES = OperationModel.new(
        name: "ModifyLoadBalancerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_INSTANCES_WITH_LOAD_BALANCER = OperationModel.new(
        name: "RegisterInstancesWithLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS = OperationModel.new(
        name: "RemoveTags",
        http_method: "POST",
        request_uri: "/"
      )

      SET_LOAD_BALANCER_LISTENER_SSL_CERTIFICATE = OperationModel.new(
        name: "SetLoadBalancerListenerSSLCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      SET_LOAD_BALANCER_POLICIES_FOR_BACKEND_SERVER = OperationModel.new(
        name: "SetLoadBalancerPoliciesForBackendServer",
        http_method: "POST",
        request_uri: "/"
      )

      SET_LOAD_BALANCER_POLICIES_OF_LISTENER = OperationModel.new(
        name: "SetLoadBalancerPoliciesOfListener",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
