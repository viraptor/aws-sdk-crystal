module AwsSdk
  module GlobalAccelerator
    module Model
      API_VERSION = "2018-08-08"
      TARGET_PREFIX = "GlobalAccelerator_V20180706"
      SIGNING_NAME = "globalaccelerator"
      ENDPOINT_PREFIX = "globalaccelerator"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://globalaccelerator-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://globalaccelerator-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://globalaccelerator.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://globalaccelerator.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_CUSTOM_ROUTING_ENDPOINTS = OperationModel.new(
        name: "AddCustomRoutingEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_ENDPOINTS = OperationModel.new(
        name: "AddEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      ADVERTISE_BYOIP_CIDR = OperationModel.new(
        name: "AdvertiseByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOW_CUSTOM_ROUTING_TRAFFIC = OperationModel.new(
        name: "AllowCustomRoutingTraffic",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACCELERATOR = OperationModel.new(
        name: "CreateAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CROSS_ACCOUNT_ATTACHMENT = OperationModel.new(
        name: "CreateCrossAccountAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_ROUTING_ACCELERATOR = OperationModel.new(
        name: "CreateCustomRoutingAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_ROUTING_ENDPOINT_GROUP = OperationModel.new(
        name: "CreateCustomRoutingEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_ROUTING_LISTENER = OperationModel.new(
        name: "CreateCustomRoutingListener",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT_GROUP = OperationModel.new(
        name: "CreateEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LISTENER = OperationModel.new(
        name: "CreateListener",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCELERATOR = OperationModel.new(
        name: "DeleteAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CROSS_ACCOUNT_ATTACHMENT = OperationModel.new(
        name: "DeleteCrossAccountAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_ROUTING_ACCELERATOR = OperationModel.new(
        name: "DeleteCustomRoutingAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_ROUTING_ENDPOINT_GROUP = OperationModel.new(
        name: "DeleteCustomRoutingEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_ROUTING_LISTENER = OperationModel.new(
        name: "DeleteCustomRoutingListener",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT_GROUP = OperationModel.new(
        name: "DeleteEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LISTENER = OperationModel.new(
        name: "DeleteListener",
        http_method: "POST",
        request_uri: "/"
      )

      DENY_CUSTOM_ROUTING_TRAFFIC = OperationModel.new(
        name: "DenyCustomRoutingTraffic",
        http_method: "POST",
        request_uri: "/"
      )

      DEPROVISION_BYOIP_CIDR = OperationModel.new(
        name: "DeprovisionByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCELERATOR = OperationModel.new(
        name: "DescribeAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCELERATOR_ATTRIBUTES = OperationModel.new(
        name: "DescribeAcceleratorAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CROSS_ACCOUNT_ATTACHMENT = OperationModel.new(
        name: "DescribeCrossAccountAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_ROUTING_ACCELERATOR = OperationModel.new(
        name: "DescribeCustomRoutingAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_ROUTING_ACCELERATOR_ATTRIBUTES = OperationModel.new(
        name: "DescribeCustomRoutingAcceleratorAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_ROUTING_ENDPOINT_GROUP = OperationModel.new(
        name: "DescribeCustomRoutingEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_ROUTING_LISTENER = OperationModel.new(
        name: "DescribeCustomRoutingListener",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_GROUP = OperationModel.new(
        name: "DescribeEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LISTENER = OperationModel.new(
        name: "DescribeListener",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCELERATORS = OperationModel.new(
        name: "ListAccelerators",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BYOIP_CIDRS = OperationModel.new(
        name: "ListByoipCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CROSS_ACCOUNT_ATTACHMENTS = OperationModel.new(
        name: "ListCrossAccountAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CROSS_ACCOUNT_RESOURCE_ACCOUNTS = OperationModel.new(
        name: "ListCrossAccountResourceAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CROSS_ACCOUNT_RESOURCES = OperationModel.new(
        name: "ListCrossAccountResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ROUTING_ACCELERATORS = OperationModel.new(
        name: "ListCustomRoutingAccelerators",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ROUTING_ENDPOINT_GROUPS = OperationModel.new(
        name: "ListCustomRoutingEndpointGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ROUTING_LISTENERS = OperationModel.new(
        name: "ListCustomRoutingListeners",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ROUTING_PORT_MAPPINGS = OperationModel.new(
        name: "ListCustomRoutingPortMappings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_ROUTING_PORT_MAPPINGS_BY_DESTINATION = OperationModel.new(
        name: "ListCustomRoutingPortMappingsByDestination",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINT_GROUPS = OperationModel.new(
        name: "ListEndpointGroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LISTENERS = OperationModel.new(
        name: "ListListeners",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_BYOIP_CIDR = OperationModel.new(
        name: "ProvisionByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_CUSTOM_ROUTING_ENDPOINTS = OperationModel.new(
        name: "RemoveCustomRoutingEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_ENDPOINTS = OperationModel.new(
        name: "RemoveEndpoints",
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

      UPDATE_ACCELERATOR = OperationModel.new(
        name: "UpdateAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCELERATOR_ATTRIBUTES = OperationModel.new(
        name: "UpdateAcceleratorAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CROSS_ACCOUNT_ATTACHMENT = OperationModel.new(
        name: "UpdateCrossAccountAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CUSTOM_ROUTING_ACCELERATOR = OperationModel.new(
        name: "UpdateCustomRoutingAccelerator",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CUSTOM_ROUTING_ACCELERATOR_ATTRIBUTES = OperationModel.new(
        name: "UpdateCustomRoutingAcceleratorAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CUSTOM_ROUTING_LISTENER = OperationModel.new(
        name: "UpdateCustomRoutingListener",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENDPOINT_GROUP = OperationModel.new(
        name: "UpdateEndpointGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LISTENER = OperationModel.new(
        name: "UpdateListener",
        http_method: "POST",
        request_uri: "/"
      )

      WITHDRAW_BYOIP_CIDR = OperationModel.new(
        name: "WithdrawByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
