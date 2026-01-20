module Aws
  module RedshiftServerless
    module Model
      API_VERSION = "2021-04-21"
      TARGET_PREFIX = "RedshiftServerless"
      SIGNING_NAME = "redshift-serverless"
      ENDPOINT_PREFIX = "redshift-serverless"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-serverless-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-serverless-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-serverless.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://redshift-serverless.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CONVERT_RECOVERY_POINT_TO_SNAPSHOT = OperationModel.new(
        name: "ConvertRecoveryPointToSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOM_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "CreateCustomDomainAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENDPOINT_ACCESS = OperationModel.new(
        name: "CreateEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NAMESPACE = OperationModel.new(
        name: "CreateNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESERVATION = OperationModel.new(
        name: "CreateReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEDULED_ACTION = OperationModel.new(
        name: "CreateScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT_COPY_CONFIGURATION = OperationModel.new(
        name: "CreateSnapshotCopyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USAGE_LIMIT = OperationModel.new(
        name: "CreateUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKGROUP = OperationModel.new(
        name: "CreateWorkgroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOM_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "DeleteCustomDomainAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENDPOINT_ACCESS = OperationModel.new(
        name: "DeleteEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NAMESPACE = OperationModel.new(
        name: "DeleteNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SCHEDULED_ACTION = OperationModel.new(
        name: "DeleteScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT_COPY_CONFIGURATION = OperationModel.new(
        name: "DeleteSnapshotCopyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USAGE_LIMIT = OperationModel.new(
        name: "DeleteUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKGROUP = OperationModel.new(
        name: "DeleteWorkgroup",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CREDENTIALS = OperationModel.new(
        name: "GetCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CUSTOM_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "GetCustomDomainAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENDPOINT_ACCESS = OperationModel.new(
        name: "GetEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_CENTER_AUTH_TOKEN = OperationModel.new(
        name: "GetIdentityCenterAuthToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NAMESPACE = OperationModel.new(
        name: "GetNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RECOVERY_POINT = OperationModel.new(
        name: "GetRecoveryPoint",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVATION = OperationModel.new(
        name: "GetReservation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVATION_OFFERING = OperationModel.new(
        name: "GetReservationOffering",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SCHEDULED_ACTION = OperationModel.new(
        name: "GetScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SNAPSHOT = OperationModel.new(
        name: "GetSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TABLE_RESTORE_STATUS = OperationModel.new(
        name: "GetTableRestoreStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRACK = OperationModel.new(
        name: "GetTrack",
        http_method: "POST",
        request_uri: "/"
      )

      GET_USAGE_LIMIT = OperationModel.new(
        name: "GetUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKGROUP = OperationModel.new(
        name: "GetWorkgroup",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CUSTOM_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "ListCustomDomainAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENDPOINT_ACCESS = OperationModel.new(
        name: "ListEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MANAGED_WORKGROUPS = OperationModel.new(
        name: "ListManagedWorkgroups",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_NAMESPACES = OperationModel.new(
        name: "ListNamespaces",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECOVERY_POINTS = OperationModel.new(
        name: "ListRecoveryPoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESERVATION_OFFERINGS = OperationModel.new(
        name: "ListReservationOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RESERVATIONS = OperationModel.new(
        name: "ListReservations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEDULED_ACTIONS = OperationModel.new(
        name: "ListScheduledActions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SNAPSHOT_COPY_CONFIGURATIONS = OperationModel.new(
        name: "ListSnapshotCopyConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SNAPSHOTS = OperationModel.new(
        name: "ListSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TABLE_RESTORE_STATUS = OperationModel.new(
        name: "ListTableRestoreStatus",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRACKS = OperationModel.new(
        name: "ListTracks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USAGE_LIMITS = OperationModel.new(
        name: "ListUsageLimits",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKGROUPS = OperationModel.new(
        name: "ListWorkgroups",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_FROM_RECOVERY_POINT = OperationModel.new(
        name: "RestoreFromRecoveryPoint",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_TABLE_FROM_RECOVERY_POINT = OperationModel.new(
        name: "RestoreTableFromRecoveryPoint",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_TABLE_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreTableFromSnapshot",
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

      UPDATE_CUSTOM_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "UpdateCustomDomainAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENDPOINT_ACCESS = OperationModel.new(
        name: "UpdateEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LAKEHOUSE_CONFIGURATION = OperationModel.new(
        name: "UpdateLakehouseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NAMESPACE = OperationModel.new(
        name: "UpdateNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SCHEDULED_ACTION = OperationModel.new(
        name: "UpdateScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SNAPSHOT = OperationModel.new(
        name: "UpdateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SNAPSHOT_COPY_CONFIGURATION = OperationModel.new(
        name: "UpdateSnapshotCopyConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USAGE_LIMIT = OperationModel.new(
        name: "UpdateUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WORKGROUP = OperationModel.new(
        name: "UpdateWorkgroup",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
