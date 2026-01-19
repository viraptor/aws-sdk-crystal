module AwsSdk
  module VPCLattice
    module Model
      API_VERSION = "2022-11-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "vpc-lattice"
      ENDPOINT_PREFIX = "vpc-lattice"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://vpc-lattice-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://vpc-lattice-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://vpc-lattice.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://vpc-lattice.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_UPDATE_RULE = OperationModel.new(
        name: "BatchUpdateRule",
        http_method: "PATCH",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules"
      )

      CREATE_ACCESS_LOG_SUBSCRIPTION = OperationModel.new(
        name: "CreateAccessLogSubscription",
        http_method: "POST",
        request_uri: "/accesslogsubscriptions"
      )

      CREATE_LISTENER = OperationModel.new(
        name: "CreateListener",
        http_method: "POST",
        request_uri: "/services/{serviceIdentifier}/listeners"
      )

      CREATE_RESOURCE_CONFIGURATION = OperationModel.new(
        name: "CreateResourceConfiguration",
        http_method: "POST",
        request_uri: "/resourceconfigurations"
      )

      CREATE_RESOURCE_GATEWAY = OperationModel.new(
        name: "CreateResourceGateway",
        http_method: "POST",
        request_uri: "/resourcegateways"
      )

      CREATE_RULE = OperationModel.new(
        name: "CreateRule",
        http_method: "POST",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/services"
      )

      CREATE_SERVICE_NETWORK = OperationModel.new(
        name: "CreateServiceNetwork",
        http_method: "POST",
        request_uri: "/servicenetworks"
      )

      CREATE_SERVICE_NETWORK_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "CreateServiceNetworkResourceAssociation",
        http_method: "POST",
        request_uri: "/servicenetworkresourceassociations"
      )

      CREATE_SERVICE_NETWORK_SERVICE_ASSOCIATION = OperationModel.new(
        name: "CreateServiceNetworkServiceAssociation",
        http_method: "POST",
        request_uri: "/servicenetworkserviceassociations"
      )

      CREATE_SERVICE_NETWORK_VPC_ASSOCIATION = OperationModel.new(
        name: "CreateServiceNetworkVpcAssociation",
        http_method: "POST",
        request_uri: "/servicenetworkvpcassociations"
      )

      CREATE_TARGET_GROUP = OperationModel.new(
        name: "CreateTargetGroup",
        http_method: "POST",
        request_uri: "/targetgroups"
      )

      DELETE_ACCESS_LOG_SUBSCRIPTION = OperationModel.new(
        name: "DeleteAccessLogSubscription",
        http_method: "DELETE",
        request_uri: "/accesslogsubscriptions/{accessLogSubscriptionIdentifier}"
      )

      DELETE_AUTH_POLICY = OperationModel.new(
        name: "DeleteAuthPolicy",
        http_method: "DELETE",
        request_uri: "/authpolicy/{resourceIdentifier}"
      )

      DELETE_DOMAIN_VERIFICATION = OperationModel.new(
        name: "DeleteDomainVerification",
        http_method: "DELETE",
        request_uri: "/domainverifications/{domainVerificationIdentifier}"
      )

      DELETE_LISTENER = OperationModel.new(
        name: "DeleteListener",
        http_method: "DELETE",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}"
      )

      DELETE_RESOURCE_CONFIGURATION = OperationModel.new(
        name: "DeleteResourceConfiguration",
        http_method: "DELETE",
        request_uri: "/resourceconfigurations/{resourceConfigurationIdentifier}"
      )

      DELETE_RESOURCE_ENDPOINT_ASSOCIATION = OperationModel.new(
        name: "DeleteResourceEndpointAssociation",
        http_method: "DELETE",
        request_uri: "/resourceendpointassociations/{resourceEndpointAssociationIdentifier}"
      )

      DELETE_RESOURCE_GATEWAY = OperationModel.new(
        name: "DeleteResourceGateway",
        http_method: "DELETE",
        request_uri: "/resourcegateways/{resourceGatewayIdentifier}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      DELETE_RULE = OperationModel.new(
        name: "DeleteRule",
        http_method: "DELETE",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules/{ruleIdentifier}"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "DELETE",
        request_uri: "/services/{serviceIdentifier}"
      )

      DELETE_SERVICE_NETWORK = OperationModel.new(
        name: "DeleteServiceNetwork",
        http_method: "DELETE",
        request_uri: "/servicenetworks/{serviceNetworkIdentifier}"
      )

      DELETE_SERVICE_NETWORK_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "DeleteServiceNetworkResourceAssociation",
        http_method: "DELETE",
        request_uri: "/servicenetworkresourceassociations/{serviceNetworkResourceAssociationIdentifier}"
      )

      DELETE_SERVICE_NETWORK_SERVICE_ASSOCIATION = OperationModel.new(
        name: "DeleteServiceNetworkServiceAssociation",
        http_method: "DELETE",
        request_uri: "/servicenetworkserviceassociations/{serviceNetworkServiceAssociationIdentifier}"
      )

      DELETE_SERVICE_NETWORK_VPC_ASSOCIATION = OperationModel.new(
        name: "DeleteServiceNetworkVpcAssociation",
        http_method: "DELETE",
        request_uri: "/servicenetworkvpcassociations/{serviceNetworkVpcAssociationIdentifier}"
      )

      DELETE_TARGET_GROUP = OperationModel.new(
        name: "DeleteTargetGroup",
        http_method: "DELETE",
        request_uri: "/targetgroups/{targetGroupIdentifier}"
      )

      DEREGISTER_TARGETS = OperationModel.new(
        name: "DeregisterTargets",
        http_method: "POST",
        request_uri: "/targetgroups/{targetGroupIdentifier}/deregistertargets"
      )

      GET_ACCESS_LOG_SUBSCRIPTION = OperationModel.new(
        name: "GetAccessLogSubscription",
        http_method: "GET",
        request_uri: "/accesslogsubscriptions/{accessLogSubscriptionIdentifier}"
      )

      GET_AUTH_POLICY = OperationModel.new(
        name: "GetAuthPolicy",
        http_method: "GET",
        request_uri: "/authpolicy/{resourceIdentifier}"
      )

      GET_DOMAIN_VERIFICATION = OperationModel.new(
        name: "GetDomainVerification",
        http_method: "GET",
        request_uri: "/domainverifications/{domainVerificationIdentifier}"
      )

      GET_LISTENER = OperationModel.new(
        name: "GetListener",
        http_method: "GET",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}"
      )

      GET_RESOURCE_CONFIGURATION = OperationModel.new(
        name: "GetResourceConfiguration",
        http_method: "GET",
        request_uri: "/resourceconfigurations/{resourceConfigurationIdentifier}"
      )

      GET_RESOURCE_GATEWAY = OperationModel.new(
        name: "GetResourceGateway",
        http_method: "GET",
        request_uri: "/resourcegateways/{resourceGatewayIdentifier}"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      GET_RULE = OperationModel.new(
        name: "GetRule",
        http_method: "GET",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules/{ruleIdentifier}"
      )

      GET_SERVICE = OperationModel.new(
        name: "GetService",
        http_method: "GET",
        request_uri: "/services/{serviceIdentifier}"
      )

      GET_SERVICE_NETWORK = OperationModel.new(
        name: "GetServiceNetwork",
        http_method: "GET",
        request_uri: "/servicenetworks/{serviceNetworkIdentifier}"
      )

      GET_SERVICE_NETWORK_RESOURCE_ASSOCIATION = OperationModel.new(
        name: "GetServiceNetworkResourceAssociation",
        http_method: "GET",
        request_uri: "/servicenetworkresourceassociations/{serviceNetworkResourceAssociationIdentifier}"
      )

      GET_SERVICE_NETWORK_SERVICE_ASSOCIATION = OperationModel.new(
        name: "GetServiceNetworkServiceAssociation",
        http_method: "GET",
        request_uri: "/servicenetworkserviceassociations/{serviceNetworkServiceAssociationIdentifier}"
      )

      GET_SERVICE_NETWORK_VPC_ASSOCIATION = OperationModel.new(
        name: "GetServiceNetworkVpcAssociation",
        http_method: "GET",
        request_uri: "/servicenetworkvpcassociations/{serviceNetworkVpcAssociationIdentifier}"
      )

      GET_TARGET_GROUP = OperationModel.new(
        name: "GetTargetGroup",
        http_method: "GET",
        request_uri: "/targetgroups/{targetGroupIdentifier}"
      )

      LIST_ACCESS_LOG_SUBSCRIPTIONS = OperationModel.new(
        name: "ListAccessLogSubscriptions",
        http_method: "GET",
        request_uri: "/accesslogsubscriptions"
      )

      LIST_DOMAIN_VERIFICATIONS = OperationModel.new(
        name: "ListDomainVerifications",
        http_method: "GET",
        request_uri: "/domainverifications"
      )

      LIST_LISTENERS = OperationModel.new(
        name: "ListListeners",
        http_method: "GET",
        request_uri: "/services/{serviceIdentifier}/listeners"
      )

      LIST_RESOURCE_CONFIGURATIONS = OperationModel.new(
        name: "ListResourceConfigurations",
        http_method: "GET",
        request_uri: "/resourceconfigurations"
      )

      LIST_RESOURCE_ENDPOINT_ASSOCIATIONS = OperationModel.new(
        name: "ListResourceEndpointAssociations",
        http_method: "GET",
        request_uri: "/resourceendpointassociations"
      )

      LIST_RESOURCE_GATEWAYS = OperationModel.new(
        name: "ListResourceGateways",
        http_method: "GET",
        request_uri: "/resourcegateways"
      )

      LIST_RULES = OperationModel.new(
        name: "ListRules",
        http_method: "GET",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules"
      )

      LIST_SERVICE_NETWORK_RESOURCE_ASSOCIATIONS = OperationModel.new(
        name: "ListServiceNetworkResourceAssociations",
        http_method: "GET",
        request_uri: "/servicenetworkresourceassociations"
      )

      LIST_SERVICE_NETWORK_SERVICE_ASSOCIATIONS = OperationModel.new(
        name: "ListServiceNetworkServiceAssociations",
        http_method: "GET",
        request_uri: "/servicenetworkserviceassociations"
      )

      LIST_SERVICE_NETWORK_VPC_ASSOCIATIONS = OperationModel.new(
        name: "ListServiceNetworkVpcAssociations",
        http_method: "GET",
        request_uri: "/servicenetworkvpcassociations"
      )

      LIST_SERVICE_NETWORK_VPC_ENDPOINT_ASSOCIATIONS = OperationModel.new(
        name: "ListServiceNetworkVpcEndpointAssociations",
        http_method: "GET",
        request_uri: "/servicenetworkvpcendpointassociations"
      )

      LIST_SERVICE_NETWORKS = OperationModel.new(
        name: "ListServiceNetworks",
        http_method: "GET",
        request_uri: "/servicenetworks"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "GET",
        request_uri: "/services"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TARGET_GROUPS = OperationModel.new(
        name: "ListTargetGroups",
        http_method: "GET",
        request_uri: "/targetgroups"
      )

      LIST_TARGETS = OperationModel.new(
        name: "ListTargets",
        http_method: "POST",
        request_uri: "/targetgroups/{targetGroupIdentifier}/listtargets"
      )

      PUT_AUTH_POLICY = OperationModel.new(
        name: "PutAuthPolicy",
        http_method: "PUT",
        request_uri: "/authpolicy/{resourceIdentifier}"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "PUT",
        request_uri: "/resourcepolicy/{resourceArn}"
      )

      REGISTER_TARGETS = OperationModel.new(
        name: "RegisterTargets",
        http_method: "POST",
        request_uri: "/targetgroups/{targetGroupIdentifier}/registertargets"
      )

      START_DOMAIN_VERIFICATION = OperationModel.new(
        name: "StartDomainVerification",
        http_method: "POST",
        request_uri: "/domainverifications"
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

      UPDATE_ACCESS_LOG_SUBSCRIPTION = OperationModel.new(
        name: "UpdateAccessLogSubscription",
        http_method: "PATCH",
        request_uri: "/accesslogsubscriptions/{accessLogSubscriptionIdentifier}"
      )

      UPDATE_LISTENER = OperationModel.new(
        name: "UpdateListener",
        http_method: "PATCH",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}"
      )

      UPDATE_RESOURCE_CONFIGURATION = OperationModel.new(
        name: "UpdateResourceConfiguration",
        http_method: "PATCH",
        request_uri: "/resourceconfigurations/{resourceConfigurationIdentifier}"
      )

      UPDATE_RESOURCE_GATEWAY = OperationModel.new(
        name: "UpdateResourceGateway",
        http_method: "PATCH",
        request_uri: "/resourcegateways/{resourceGatewayIdentifier}"
      )

      UPDATE_RULE = OperationModel.new(
        name: "UpdateRule",
        http_method: "PATCH",
        request_uri: "/services/{serviceIdentifier}/listeners/{listenerIdentifier}/rules/{ruleIdentifier}"
      )

      UPDATE_SERVICE = OperationModel.new(
        name: "UpdateService",
        http_method: "PATCH",
        request_uri: "/services/{serviceIdentifier}"
      )

      UPDATE_SERVICE_NETWORK = OperationModel.new(
        name: "UpdateServiceNetwork",
        http_method: "PATCH",
        request_uri: "/servicenetworks/{serviceNetworkIdentifier}"
      )

      UPDATE_SERVICE_NETWORK_VPC_ASSOCIATION = OperationModel.new(
        name: "UpdateServiceNetworkVpcAssociation",
        http_method: "PATCH",
        request_uri: "/servicenetworkvpcassociations/{serviceNetworkVpcAssociationIdentifier}"
      )

      UPDATE_TARGET_GROUP = OperationModel.new(
        name: "UpdateTargetGroup",
        http_method: "PATCH",
        request_uri: "/targetgroups/{targetGroupIdentifier}"
      )
    end
  end
end
