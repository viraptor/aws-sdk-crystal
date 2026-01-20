module Aws
  module FSx
    module Model
      API_VERSION = "2018-03-01"
      TARGET_PREFIX = "AWSSimbaAPIService_v20180301"
      SIGNING_NAME = "fsx"
      ENDPOINT_PREFIX = "fsx"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fsx-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fsx-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://fsx.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://fsx.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_FILE_SYSTEM_ALIASES = OperationModel.new(
        name: "AssociateFileSystemAliases",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_DATA_REPOSITORY_TASK = OperationModel.new(
        name: "CancelDataRepositoryTask",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_BACKUP = OperationModel.new(
        name: "CopyBackup",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SNAPSHOT_AND_UPDATE_VOLUME = OperationModel.new(
        name: "CopySnapshotAndUpdateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AND_ATTACH_S3_ACCESS_POINT = OperationModel.new(
        name: "CreateAndAttachS3AccessPoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BACKUP = OperationModel.new(
        name: "CreateBackup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_REPOSITORY_ASSOCIATION = OperationModel.new(
        name: "CreateDataRepositoryAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DATA_REPOSITORY_TASK = OperationModel.new(
        name: "CreateDataRepositoryTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FILE_CACHE = OperationModel.new(
        name: "CreateFileCache",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FILE_SYSTEM = OperationModel.new(
        name: "CreateFileSystem",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FILE_SYSTEM_FROM_BACKUP = OperationModel.new(
        name: "CreateFileSystemFromBackup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STORAGE_VIRTUAL_MACHINE = OperationModel.new(
        name: "CreateStorageVirtualMachine",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOLUME = OperationModel.new(
        name: "CreateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOLUME_FROM_BACKUP = OperationModel.new(
        name: "CreateVolumeFromBackup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BACKUP = OperationModel.new(
        name: "DeleteBackup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DATA_REPOSITORY_ASSOCIATION = OperationModel.new(
        name: "DeleteDataRepositoryAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FILE_CACHE = OperationModel.new(
        name: "DeleteFileCache",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FILE_SYSTEM = OperationModel.new(
        name: "DeleteFileSystem",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STORAGE_VIRTUAL_MACHINE = OperationModel.new(
        name: "DeleteStorageVirtualMachine",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOLUME = OperationModel.new(
        name: "DeleteVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BACKUPS = OperationModel.new(
        name: "DescribeBackups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_REPOSITORY_ASSOCIATIONS = OperationModel.new(
        name: "DescribeDataRepositoryAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_REPOSITORY_TASKS = OperationModel.new(
        name: "DescribeDataRepositoryTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FILE_CACHES = OperationModel.new(
        name: "DescribeFileCaches",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FILE_SYSTEM_ALIASES = OperationModel.new(
        name: "DescribeFileSystemAliases",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FILE_SYSTEMS = OperationModel.new(
        name: "DescribeFileSystems",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_S3_ACCESS_POINT_ATTACHMENTS = OperationModel.new(
        name: "DescribeS3AccessPointAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SHARED_VPC_CONFIGURATION = OperationModel.new(
        name: "DescribeSharedVpcConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOTS = OperationModel.new(
        name: "DescribeSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STORAGE_VIRTUAL_MACHINES = OperationModel.new(
        name: "DescribeStorageVirtualMachines",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VOLUMES = OperationModel.new(
        name: "DescribeVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_AND_DELETE_S3_ACCESS_POINT = OperationModel.new(
        name: "DetachAndDeleteS3AccessPoint",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FILE_SYSTEM_ALIASES = OperationModel.new(
        name: "DisassociateFileSystemAliases",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_FILE_SYSTEM_NFS_V3_LOCKS = OperationModel.new(
        name: "ReleaseFileSystemNfsV3Locks",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_VOLUME_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreVolumeFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      START_MISCONFIGURED_STATE_RECOVERY = OperationModel.new(
        name: "StartMisconfiguredStateRecovery",
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

      UPDATE_DATA_REPOSITORY_ASSOCIATION = OperationModel.new(
        name: "UpdateDataRepositoryAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FILE_CACHE = OperationModel.new(
        name: "UpdateFileCache",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FILE_SYSTEM = OperationModel.new(
        name: "UpdateFileSystem",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SHARED_VPC_CONFIGURATION = OperationModel.new(
        name: "UpdateSharedVpcConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SNAPSHOT = OperationModel.new(
        name: "UpdateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STORAGE_VIRTUAL_MACHINE = OperationModel.new(
        name: "UpdateStorageVirtualMachine",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VOLUME = OperationModel.new(
        name: "UpdateVolume",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
