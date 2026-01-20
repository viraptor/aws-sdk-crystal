module Aws
  module StorageGateway
    module Model
      API_VERSION = "2013-06-30"
      TARGET_PREFIX = "StorageGateway_20130630"
      SIGNING_NAME = "storagegateway"
      ENDPOINT_PREFIX = "storagegateway"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://storagegateway-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://storagegateway-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://storagegateway.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://storagegateway.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACTIVATE_GATEWAY = OperationModel.new(
        name: "ActivateGateway",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_CACHE = OperationModel.new(
        name: "AddCache",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_UPLOAD_BUFFER = OperationModel.new(
        name: "AddUploadBuffer",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_WORKING_STORAGE = OperationModel.new(
        name: "AddWorkingStorage",
        http_method: "POST",
        request_uri: "/"
      )

      ASSIGN_TAPE_POOL = OperationModel.new(
        name: "AssignTapePool",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_FILE_SYSTEM = OperationModel.new(
        name: "AssociateFileSystem",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_VOLUME = OperationModel.new(
        name: "AttachVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_ARCHIVAL = OperationModel.new(
        name: "CancelArchival",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CACHE_REPORT = OperationModel.new(
        name: "CancelCacheReport",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_RETRIEVAL = OperationModel.new(
        name: "CancelRetrieval",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CACHEDI_SCSI_VOLUME = OperationModel.new(
        name: "CreateCachediSCSIVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NFS_FILE_SHARE = OperationModel.new(
        name: "CreateNFSFileShare",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SMB_FILE_SHARE = OperationModel.new(
        name: "CreateSMBFileShare",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT_FROM_VOLUME_RECOVERY_POINT = OperationModel.new(
        name: "CreateSnapshotFromVolumeRecoveryPoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STOREDI_SCSI_VOLUME = OperationModel.new(
        name: "CreateStorediSCSIVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAPE_POOL = OperationModel.new(
        name: "CreateTapePool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAPE_WITH_BARCODE = OperationModel.new(
        name: "CreateTapeWithBarcode",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAPES = OperationModel.new(
        name: "CreateTapes",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTOMATIC_TAPE_CREATION_POLICY = OperationModel.new(
        name: "DeleteAutomaticTapeCreationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BANDWIDTH_RATE_LIMIT = OperationModel.new(
        name: "DeleteBandwidthRateLimit",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CACHE_REPORT = OperationModel.new(
        name: "DeleteCacheReport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CHAP_CREDENTIALS = OperationModel.new(
        name: "DeleteChapCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FILE_SHARE = OperationModel.new(
        name: "DeleteFileShare",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GATEWAY = OperationModel.new(
        name: "DeleteGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "DeleteSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAPE = OperationModel.new(
        name: "DeleteTape",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAPE_ARCHIVE = OperationModel.new(
        name: "DeleteTapeArchive",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAPE_POOL = OperationModel.new(
        name: "DeleteTapePool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOLUME = OperationModel.new(
        name: "DeleteVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AVAILABILITY_MONITOR_TEST = OperationModel.new(
        name: "DescribeAvailabilityMonitorTest",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BANDWIDTH_RATE_LIMIT = OperationModel.new(
        name: "DescribeBandwidthRateLimit",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BANDWIDTH_RATE_LIMIT_SCHEDULE = OperationModel.new(
        name: "DescribeBandwidthRateLimitSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE = OperationModel.new(
        name: "DescribeCache",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_REPORT = OperationModel.new(
        name: "DescribeCacheReport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHEDI_SCSI_VOLUMES = OperationModel.new(
        name: "DescribeCachediSCSIVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CHAP_CREDENTIALS = OperationModel.new(
        name: "DescribeChapCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FILE_SYSTEM_ASSOCIATIONS = OperationModel.new(
        name: "DescribeFileSystemAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GATEWAY_INFORMATION = OperationModel.new(
        name: "DescribeGatewayInformation",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAINTENANCE_START_TIME = OperationModel.new(
        name: "DescribeMaintenanceStartTime",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NFS_FILE_SHARES = OperationModel.new(
        name: "DescribeNFSFileShares",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SMB_FILE_SHARES = OperationModel.new(
        name: "DescribeSMBFileShares",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SMB_SETTINGS = OperationModel.new(
        name: "DescribeSMBSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "DescribeSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STOREDI_SCSI_VOLUMES = OperationModel.new(
        name: "DescribeStorediSCSIVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAPE_ARCHIVES = OperationModel.new(
        name: "DescribeTapeArchives",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAPE_RECOVERY_POINTS = OperationModel.new(
        name: "DescribeTapeRecoveryPoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAPES = OperationModel.new(
        name: "DescribeTapes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_UPLOAD_BUFFER = OperationModel.new(
        name: "DescribeUploadBuffer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VTL_DEVICES = OperationModel.new(
        name: "DescribeVTLDevices",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKING_STORAGE = OperationModel.new(
        name: "DescribeWorkingStorage",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_VOLUME = OperationModel.new(
        name: "DetachVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_GATEWAY = OperationModel.new(
        name: "DisableGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FILE_SYSTEM = OperationModel.new(
        name: "DisassociateFileSystem",
        http_method: "POST",
        request_uri: "/"
      )

      EVICT_FILES_FAILING_UPLOAD = OperationModel.new(
        name: "EvictFilesFailingUpload",
        http_method: "POST",
        request_uri: "/"
      )

      JOIN_DOMAIN = OperationModel.new(
        name: "JoinDomain",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTOMATIC_TAPE_CREATION_POLICIES = OperationModel.new(
        name: "ListAutomaticTapeCreationPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CACHE_REPORTS = OperationModel.new(
        name: "ListCacheReports",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FILE_SHARES = OperationModel.new(
        name: "ListFileShares",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FILE_SYSTEM_ASSOCIATIONS = OperationModel.new(
        name: "ListFileSystemAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GATEWAYS = OperationModel.new(
        name: "ListGateways",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOCAL_DISKS = OperationModel.new(
        name: "ListLocalDisks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAPE_POOLS = OperationModel.new(
        name: "ListTapePools",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAPES = OperationModel.new(
        name: "ListTapes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOLUME_INITIATORS = OperationModel.new(
        name: "ListVolumeInitiators",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOLUME_RECOVERY_POINTS = OperationModel.new(
        name: "ListVolumeRecoveryPoints",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOLUMES = OperationModel.new(
        name: "ListVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_WHEN_UPLOADED = OperationModel.new(
        name: "NotifyWhenUploaded",
        http_method: "POST",
        request_uri: "/"
      )

      REFRESH_CACHE = OperationModel.new(
        name: "RefreshCache",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_CACHE = OperationModel.new(
        name: "ResetCache",
        http_method: "POST",
        request_uri: "/"
      )

      RETRIEVE_TAPE_ARCHIVE = OperationModel.new(
        name: "RetrieveTapeArchive",
        http_method: "POST",
        request_uri: "/"
      )

      RETRIEVE_TAPE_RECOVERY_POINT = OperationModel.new(
        name: "RetrieveTapeRecoveryPoint",
        http_method: "POST",
        request_uri: "/"
      )

      SET_LOCAL_CONSOLE_PASSWORD = OperationModel.new(
        name: "SetLocalConsolePassword",
        http_method: "POST",
        request_uri: "/"
      )

      SET_SMB_GUEST_PASSWORD = OperationModel.new(
        name: "SetSMBGuestPassword",
        http_method: "POST",
        request_uri: "/"
      )

      SHUTDOWN_GATEWAY = OperationModel.new(
        name: "ShutdownGateway",
        http_method: "POST",
        request_uri: "/"
      )

      START_AVAILABILITY_MONITOR_TEST = OperationModel.new(
        name: "StartAvailabilityMonitorTest",
        http_method: "POST",
        request_uri: "/"
      )

      START_CACHE_REPORT = OperationModel.new(
        name: "StartCacheReport",
        http_method: "POST",
        request_uri: "/"
      )

      START_GATEWAY = OperationModel.new(
        name: "StartGateway",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AUTOMATIC_TAPE_CREATION_POLICY = OperationModel.new(
        name: "UpdateAutomaticTapeCreationPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BANDWIDTH_RATE_LIMIT = OperationModel.new(
        name: "UpdateBandwidthRateLimit",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BANDWIDTH_RATE_LIMIT_SCHEDULE = OperationModel.new(
        name: "UpdateBandwidthRateLimitSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CHAP_CREDENTIALS = OperationModel.new(
        name: "UpdateChapCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FILE_SYSTEM_ASSOCIATION = OperationModel.new(
        name: "UpdateFileSystemAssociation",
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

      UPDATE_MAINTENANCE_START_TIME = OperationModel.new(
        name: "UpdateMaintenanceStartTime",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NFS_FILE_SHARE = OperationModel.new(
        name: "UpdateNFSFileShare",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SMB_FILE_SHARE = OperationModel.new(
        name: "UpdateSMBFileShare",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SMB_FILE_SHARE_VISIBILITY = OperationModel.new(
        name: "UpdateSMBFileShareVisibility",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SMB_LOCAL_GROUPS = OperationModel.new(
        name: "UpdateSMBLocalGroups",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SMB_SECURITY_STRATEGY = OperationModel.new(
        name: "UpdateSMBSecurityStrategy",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "UpdateSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VTL_DEVICE_TYPE = OperationModel.new(
        name: "UpdateVTLDeviceType",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
