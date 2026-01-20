module AwsSdk
  module BackupGateway
    module Model
      API_VERSION = "2021-01-01"
      TARGET_PREFIX = "BackupOnPremises_v20210101"
      SIGNING_NAME = "backup-gateway"
      ENDPOINT_PREFIX = "backup-gateway"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup-gateway-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup-gateway-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://backup-gateway.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://backup-gateway.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_GATEWAY_TO_SERVER = OperationModel.new(
        name: "AssociateGatewayToServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GATEWAY = OperationModel.new(
        name: "CreateGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GATEWAY = OperationModel.new(
        name: "DeleteGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HYPERVISOR = OperationModel.new(
        name: "DeleteHypervisor",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_GATEWAY_FROM_SERVER = OperationModel.new(
        name: "DisassociateGatewayFromServer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BANDWIDTH_RATE_LIMIT_SCHEDULE = OperationModel.new(
        name: "GetBandwidthRateLimitSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GATEWAY = OperationModel.new(
        name: "GetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HYPERVISOR = OperationModel.new(
        name: "GetHypervisor",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HYPERVISOR_PROPERTY_MAPPINGS = OperationModel.new(
        name: "GetHypervisorPropertyMappings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VIRTUAL_MACHINE = OperationModel.new(
        name: "GetVirtualMachine",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_HYPERVISOR_CONFIGURATION = OperationModel.new(
        name: "ImportHypervisorConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GATEWAYS = OperationModel.new(
        name: "ListGateways",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HYPERVISORS = OperationModel.new(
        name: "ListHypervisors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VIRTUAL_MACHINES = OperationModel.new(
        name: "ListVirtualMachines",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_BANDWIDTH_RATE_LIMIT_SCHEDULE = OperationModel.new(
        name: "PutBandwidthRateLimitSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_HYPERVISOR_PROPERTY_MAPPINGS = OperationModel.new(
        name: "PutHypervisorPropertyMappings",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_MAINTENANCE_START_TIME = OperationModel.new(
        name: "PutMaintenanceStartTime",
        http_method: "POST",
        request_uri: "/"
      )

      START_VIRTUAL_MACHINES_METADATA_SYNC = OperationModel.new(
        name: "StartVirtualMachinesMetadataSync",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_HYPERVISOR_CONFIGURATION = OperationModel.new(
        name: "TestHypervisorConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GATEWAY_INFORMATION = OperationModel.new(
        name: "UpdateGatewayInformation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_GATEWAY_SOFTWARE_NOW = OperationModel.new(
        name: "UpdateGatewaySoftwareNow",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HYPERVISOR = OperationModel.new(
        name: "UpdateHypervisor",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
