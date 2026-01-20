module Aws
  module ARCZonalShift
    module Model
      API_VERSION = "2022-10-30"
      TARGET_PREFIX = ""
      SIGNING_NAME = "arc-zonal-shift"
      ENDPOINT_PREFIX = "arc-zonal-shift"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://arc-zonal-shift-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://arc-zonal-shift-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://arc-zonal-shift.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://arc-zonal-shift.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_PRACTICE_RUN = OperationModel.new(
        name: "CancelPracticeRun",
        http_method: "DELETE",
        request_uri: "/practiceruns/{zonalShiftId}"
      )

      CANCEL_ZONAL_SHIFT = OperationModel.new(
        name: "CancelZonalShift",
        http_method: "DELETE",
        request_uri: "/zonalshifts/{zonalShiftId}"
      )

      CREATE_PRACTICE_RUN_CONFIGURATION = OperationModel.new(
        name: "CreatePracticeRunConfiguration",
        http_method: "POST",
        request_uri: "/configuration"
      )

      DELETE_PRACTICE_RUN_CONFIGURATION = OperationModel.new(
        name: "DeletePracticeRunConfiguration",
        http_method: "DELETE",
        request_uri: "/configuration/{resourceIdentifier}"
      )

      GET_AUTOSHIFT_OBSERVER_NOTIFICATION_STATUS = OperationModel.new(
        name: "GetAutoshiftObserverNotificationStatus",
        http_method: "GET",
        request_uri: "/autoshift-observer-notification"
      )

      GET_MANAGED_RESOURCE = OperationModel.new(
        name: "GetManagedResource",
        http_method: "GET",
        request_uri: "/managedresources/{resourceIdentifier}"
      )

      LIST_AUTOSHIFTS = OperationModel.new(
        name: "ListAutoshifts",
        http_method: "GET",
        request_uri: "/autoshifts"
      )

      LIST_MANAGED_RESOURCES = OperationModel.new(
        name: "ListManagedResources",
        http_method: "GET",
        request_uri: "/managedresources"
      )

      LIST_ZONAL_SHIFTS = OperationModel.new(
        name: "ListZonalShifts",
        http_method: "GET",
        request_uri: "/zonalshifts"
      )

      START_PRACTICE_RUN = OperationModel.new(
        name: "StartPracticeRun",
        http_method: "POST",
        request_uri: "/practiceruns"
      )

      START_ZONAL_SHIFT = OperationModel.new(
        name: "StartZonalShift",
        http_method: "POST",
        request_uri: "/zonalshifts"
      )

      UPDATE_AUTOSHIFT_OBSERVER_NOTIFICATION_STATUS = OperationModel.new(
        name: "UpdateAutoshiftObserverNotificationStatus",
        http_method: "PUT",
        request_uri: "/autoshift-observer-notification"
      )

      UPDATE_PRACTICE_RUN_CONFIGURATION = OperationModel.new(
        name: "UpdatePracticeRunConfiguration",
        http_method: "PATCH",
        request_uri: "/configuration/{resourceIdentifier}"
      )

      UPDATE_ZONAL_AUTOSHIFT_CONFIGURATION = OperationModel.new(
        name: "UpdateZonalAutoshiftConfiguration",
        http_method: "PUT",
        request_uri: "/managedresources/{resourceIdentifier}"
      )

      UPDATE_ZONAL_SHIFT = OperationModel.new(
        name: "UpdateZonalShift",
        http_method: "PATCH",
        request_uri: "/zonalshifts/{zonalShiftId}"
      )
    end
  end
end
