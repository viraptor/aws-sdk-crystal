module AwsSdk
  module IoTFleetWise
    module Model
      API_VERSION = "2021-06-17"
      TARGET_PREFIX = "IoTAutobahnControlPlane"
      SIGNING_NAME = "iotfleetwise"
      ENDPOINT_PREFIX = "iotfleetwise"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotfleetwise-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotfleetwise-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://iotfleetwise.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://iotfleetwise.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_VEHICLE_FLEET = OperationModel.new(
        name: "AssociateVehicleFleet",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_CREATE_VEHICLE = OperationModel.new(
        name: "BatchCreateVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_UPDATE_VEHICLE = OperationModel.new(
        name: "BatchUpdateVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAMPAIGN = OperationModel.new(
        name: "CreateCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DECODER_MANIFEST = OperationModel.new(
        name: "CreateDecoderManifest",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MODEL_MANIFEST = OperationModel.new(
        name: "CreateModelManifest",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SIGNAL_CATALOG = OperationModel.new(
        name: "CreateSignalCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STATE_TEMPLATE = OperationModel.new(
        name: "CreateStateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VEHICLE = OperationModel.new(
        name: "CreateVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAMPAIGN = OperationModel.new(
        name: "DeleteCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DECODER_MANIFEST = OperationModel.new(
        name: "DeleteDecoderManifest",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET = OperationModel.new(
        name: "DeleteFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MODEL_MANIFEST = OperationModel.new(
        name: "DeleteModelManifest",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SIGNAL_CATALOG = OperationModel.new(
        name: "DeleteSignalCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STATE_TEMPLATE = OperationModel.new(
        name: "DeleteStateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VEHICLE = OperationModel.new(
        name: "DeleteVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_VEHICLE_FLEET = OperationModel.new(
        name: "DisassociateVehicleFleet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAMPAIGN = OperationModel.new(
        name: "GetCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DECODER_MANIFEST = OperationModel.new(
        name: "GetDecoderManifest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "GetEncryptionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FLEET = OperationModel.new(
        name: "GetFleet",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOGGING_OPTIONS = OperationModel.new(
        name: "GetLoggingOptions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MODEL_MANIFEST = OperationModel.new(
        name: "GetModelManifest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGISTER_ACCOUNT_STATUS = OperationModel.new(
        name: "GetRegisterAccountStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SIGNAL_CATALOG = OperationModel.new(
        name: "GetSignalCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATE_TEMPLATE = OperationModel.new(
        name: "GetStateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VEHICLE = OperationModel.new(
        name: "GetVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VEHICLE_STATUS = OperationModel.new(
        name: "GetVehicleStatus",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_DECODER_MANIFEST = OperationModel.new(
        name: "ImportDecoderManifest",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_SIGNAL_CATALOG = OperationModel.new(
        name: "ImportSignalCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CAMPAIGNS = OperationModel.new(
        name: "ListCampaigns",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DECODER_MANIFEST_NETWORK_INTERFACES = OperationModel.new(
        name: "ListDecoderManifestNetworkInterfaces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DECODER_MANIFEST_SIGNALS = OperationModel.new(
        name: "ListDecoderManifestSignals",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DECODER_MANIFESTS = OperationModel.new(
        name: "ListDecoderManifests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLEETS = OperationModel.new(
        name: "ListFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FLEETS_FOR_VEHICLE = OperationModel.new(
        name: "ListFleetsForVehicle",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_MANIFEST_NODES = OperationModel.new(
        name: "ListModelManifestNodes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MODEL_MANIFESTS = OperationModel.new(
        name: "ListModelManifests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SIGNAL_CATALOG_NODES = OperationModel.new(
        name: "ListSignalCatalogNodes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SIGNAL_CATALOGS = OperationModel.new(
        name: "ListSignalCatalogs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STATE_TEMPLATES = OperationModel.new(
        name: "ListStateTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VEHICLES = OperationModel.new(
        name: "ListVehicles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VEHICLES_IN_FLEET = OperationModel.new(
        name: "ListVehiclesInFleet",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ENCRYPTION_CONFIGURATION = OperationModel.new(
        name: "PutEncryptionConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LOGGING_OPTIONS = OperationModel.new(
        name: "PutLoggingOptions",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_ACCOUNT = OperationModel.new(
        name: "RegisterAccount",
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

      UPDATE_CAMPAIGN = OperationModel.new(
        name: "UpdateCampaign",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DECODER_MANIFEST = OperationModel.new(
        name: "UpdateDecoderManifest",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET = OperationModel.new(
        name: "UpdateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MODEL_MANIFEST = OperationModel.new(
        name: "UpdateModelManifest",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SIGNAL_CATALOG = OperationModel.new(
        name: "UpdateSignalCatalog",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STATE_TEMPLATE = OperationModel.new(
        name: "UpdateStateTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VEHICLE = OperationModel.new(
        name: "UpdateVehicle",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
