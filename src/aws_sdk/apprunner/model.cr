module AwsSdk
  module AppRunner
    module Model
      API_VERSION = "2020-05-15"
      TARGET_PREFIX = "AppRunner"
      SIGNING_NAME = "apprunner"
      ENDPOINT_PREFIX = "apprunner"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apprunner-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apprunner-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://apprunner.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://apprunner.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CUSTOM_DOMAIN = OperationModel.new(
        name: "AssociateCustomDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTO_SCALING_CONFIGURATION = OperationModel.new(
        name: "CreateAutoScalingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_OBSERVABILITY_CONFIGURATION = OperationModel.new(
        name: "CreateObservabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_CONNECTOR = OperationModel.new(
        name: "CreateVpcConnector",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_INGRESS_CONNECTION = OperationModel.new(
        name: "CreateVpcIngressConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTO_SCALING_CONFIGURATION = OperationModel.new(
        name: "DeleteAutoScalingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_OBSERVABILITY_CONFIGURATION = OperationModel.new(
        name: "DeleteObservabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_CONNECTOR = OperationModel.new(
        name: "DeleteVpcConnector",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_INGRESS_CONNECTION = OperationModel.new(
        name: "DeleteVpcIngressConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTO_SCALING_CONFIGURATION = OperationModel.new(
        name: "DescribeAutoScalingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_DOMAINS = OperationModel.new(
        name: "DescribeCustomDomains",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OBSERVABILITY_CONFIGURATION = OperationModel.new(
        name: "DescribeObservabilityConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE = OperationModel.new(
        name: "DescribeService",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_CONNECTOR = OperationModel.new(
        name: "DescribeVpcConnector",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_INGRESS_CONNECTION = OperationModel.new(
        name: "DescribeVpcIngressConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CUSTOM_DOMAIN = OperationModel.new(
        name: "DisassociateCustomDomain",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTO_SCALING_CONFIGURATIONS = OperationModel.new(
        name: "ListAutoScalingConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTIONS = OperationModel.new(
        name: "ListConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OBSERVABILITY_CONFIGURATIONS = OperationModel.new(
        name: "ListObservabilityConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_OPERATIONS = OperationModel.new(
        name: "ListOperations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES = OperationModel.new(
        name: "ListServices",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICES_FOR_AUTO_SCALING_CONFIGURATION = OperationModel.new(
        name: "ListServicesForAutoScalingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VPC_CONNECTORS = OperationModel.new(
        name: "ListVpcConnectors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VPC_INGRESS_CONNECTIONS = OperationModel.new(
        name: "ListVpcIngressConnections",
        http_method: "POST",
        request_uri: "/"
      )

      PAUSE_SERVICE = OperationModel.new(
        name: "PauseService",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_SERVICE = OperationModel.new(
        name: "ResumeService",
        http_method: "POST",
        request_uri: "/"
      )

      START_DEPLOYMENT = OperationModel.new(
        name: "StartDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEFAULT_AUTO_SCALING_CONFIGURATION = OperationModel.new(
        name: "UpdateDefaultAutoScalingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE = OperationModel.new(
        name: "UpdateService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VPC_INGRESS_CONNECTION = OperationModel.new(
        name: "UpdateVpcIngressConnection",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
