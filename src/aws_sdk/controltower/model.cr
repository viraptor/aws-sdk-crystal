module AwsSdk
  module ControlTower
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "controltower"
      ENDPOINT_PREFIX = "controltower"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://controltower-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://controltower-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://controltower.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://controltower.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_LANDING_ZONE = OperationModel.new(
        name: "CreateLandingZone",
        http_method: "POST",
        request_uri: "/create-landingzone"
      )

      DELETE_LANDING_ZONE = OperationModel.new(
        name: "DeleteLandingZone",
        http_method: "POST",
        request_uri: "/delete-landingzone"
      )

      DISABLE_BASELINE = OperationModel.new(
        name: "DisableBaseline",
        http_method: "POST",
        request_uri: "/disable-baseline"
      )

      DISABLE_CONTROL = OperationModel.new(
        name: "DisableControl",
        http_method: "POST",
        request_uri: "/disable-control"
      )

      ENABLE_BASELINE = OperationModel.new(
        name: "EnableBaseline",
        http_method: "POST",
        request_uri: "/enable-baseline"
      )

      ENABLE_CONTROL = OperationModel.new(
        name: "EnableControl",
        http_method: "POST",
        request_uri: "/enable-control"
      )

      GET_BASELINE = OperationModel.new(
        name: "GetBaseline",
        http_method: "POST",
        request_uri: "/get-baseline"
      )

      GET_BASELINE_OPERATION = OperationModel.new(
        name: "GetBaselineOperation",
        http_method: "POST",
        request_uri: "/get-baseline-operation"
      )

      GET_CONTROL_OPERATION = OperationModel.new(
        name: "GetControlOperation",
        http_method: "POST",
        request_uri: "/get-control-operation"
      )

      GET_ENABLED_BASELINE = OperationModel.new(
        name: "GetEnabledBaseline",
        http_method: "POST",
        request_uri: "/get-enabled-baseline"
      )

      GET_ENABLED_CONTROL = OperationModel.new(
        name: "GetEnabledControl",
        http_method: "POST",
        request_uri: "/get-enabled-control"
      )

      GET_LANDING_ZONE = OperationModel.new(
        name: "GetLandingZone",
        http_method: "POST",
        request_uri: "/get-landingzone"
      )

      GET_LANDING_ZONE_OPERATION = OperationModel.new(
        name: "GetLandingZoneOperation",
        http_method: "POST",
        request_uri: "/get-landingzone-operation"
      )

      LIST_BASELINES = OperationModel.new(
        name: "ListBaselines",
        http_method: "POST",
        request_uri: "/list-baselines"
      )

      LIST_CONTROL_OPERATIONS = OperationModel.new(
        name: "ListControlOperations",
        http_method: "POST",
        request_uri: "/list-control-operations"
      )

      LIST_ENABLED_BASELINES = OperationModel.new(
        name: "ListEnabledBaselines",
        http_method: "POST",
        request_uri: "/list-enabled-baselines"
      )

      LIST_ENABLED_CONTROLS = OperationModel.new(
        name: "ListEnabledControls",
        http_method: "POST",
        request_uri: "/list-enabled-controls"
      )

      LIST_LANDING_ZONE_OPERATIONS = OperationModel.new(
        name: "ListLandingZoneOperations",
        http_method: "POST",
        request_uri: "/list-landingzone-operations"
      )

      LIST_LANDING_ZONES = OperationModel.new(
        name: "ListLandingZones",
        http_method: "POST",
        request_uri: "/list-landingzones"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      RESET_ENABLED_BASELINE = OperationModel.new(
        name: "ResetEnabledBaseline",
        http_method: "POST",
        request_uri: "/reset-enabled-baseline"
      )

      RESET_ENABLED_CONTROL = OperationModel.new(
        name: "ResetEnabledControl",
        http_method: "POST",
        request_uri: "/reset-enabled-control"
      )

      RESET_LANDING_ZONE = OperationModel.new(
        name: "ResetLandingZone",
        http_method: "POST",
        request_uri: "/reset-landingzone"
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

      UPDATE_ENABLED_BASELINE = OperationModel.new(
        name: "UpdateEnabledBaseline",
        http_method: "POST",
        request_uri: "/update-enabled-baseline"
      )

      UPDATE_ENABLED_CONTROL = OperationModel.new(
        name: "UpdateEnabledControl",
        http_method: "POST",
        request_uri: "/update-enabled-control"
      )

      UPDATE_LANDING_ZONE = OperationModel.new(
        name: "UpdateLandingZone",
        http_method: "POST",
        request_uri: "/update-landingzone"
      )
    end
  end
end
