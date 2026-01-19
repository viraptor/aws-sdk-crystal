module AwsSdk
  module ServiceDiscovery
    module Model
      API_VERSION = "2017-03-14"
      TARGET_PREFIX = "Route53AutoNaming_v20170314"
      SIGNING_NAME = "servicediscovery"
      ENDPOINT_PREFIX = "servicediscovery"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicediscovery-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://servicediscovery-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://servicediscovery.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-cn",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://servicediscovery.{Region}.amazonaws.com.cn","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://servicediscovery.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://servicediscovery.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://servicediscovery.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_HTTP_NAMESPACE = OperationModel.new(
        name: "CreateHttpNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRIVATE_DNS_NAMESPACE = OperationModel.new(
        name: "CreatePrivateDnsNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PUBLIC_DNS_NAMESPACE = OperationModel.new(
        name: "CreatePublicDnsNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVICE = OperationModel.new(
        name: "CreateService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NAMESPACE = OperationModel.new(
        name: "DeleteNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE = OperationModel.new(
        name: "DeleteService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVICE_ATTRIBUTES = OperationModel.new(
        name: "DeleteServiceAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_INSTANCE = OperationModel.new(
        name: "DeregisterInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DISCOVER_INSTANCES = OperationModel.new(
        name: "DiscoverInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DISCOVER_INSTANCES_REVISION = OperationModel.new(
        name: "DiscoverInstancesRevision",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE = OperationModel.new(
        name: "GetInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCES_HEALTH_STATUS = OperationModel.new(
        name: "GetInstancesHealthStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NAMESPACE = OperationModel.new(
        name: "GetNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPERATION = OperationModel.new(
        name: "GetOperation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE = OperationModel.new(
        name: "GetService",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERVICE_ATTRIBUTES = OperationModel.new(
        name: "GetServiceAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCES = OperationModel.new(
        name: "ListInstances",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NAMESPACES = OperationModel.new(
        name: "ListNamespaces",
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

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_INSTANCE = OperationModel.new(
        name: "RegisterInstance",
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

      UPDATE_HTTP_NAMESPACE = OperationModel.new(
        name: "UpdateHttpNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INSTANCE_CUSTOM_HEALTH_STATUS = OperationModel.new(
        name: "UpdateInstanceCustomHealthStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PRIVATE_DNS_NAMESPACE = OperationModel.new(
        name: "UpdatePrivateDnsNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PUBLIC_DNS_NAMESPACE = OperationModel.new(
        name: "UpdatePublicDnsNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE = OperationModel.new(
        name: "UpdateService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVICE_ATTRIBUTES = OperationModel.new(
        name: "UpdateServiceAttributes",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
