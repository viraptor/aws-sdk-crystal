module AwsSdk
  module EFS
    module Model
      API_VERSION = "2015-02-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "elasticfilesystem"
      ENDPOINT_PREFIX = "elasticfilesystem"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://efs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticfilesystem-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticfilesystem-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticfilesystem.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://elasticfilesystem.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACCESS_POINT = OperationModel.new(
        name: "CreateAccessPoint",
        http_method: "POST",
        request_uri: "/2015-02-01/access-points"
      )

      CREATE_FILE_SYSTEM = OperationModel.new(
        name: "CreateFileSystem",
        http_method: "POST",
        request_uri: "/2015-02-01/file-systems"
      )

      CREATE_MOUNT_TARGET = OperationModel.new(
        name: "CreateMountTarget",
        http_method: "POST",
        request_uri: "/2015-02-01/mount-targets"
      )

      CREATE_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "CreateReplicationConfiguration",
        http_method: "POST",
        request_uri: "/2015-02-01/file-systems/{SourceFileSystemId}/replication-configuration"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/2015-02-01/create-tags/{FileSystemId}"
      )

      DELETE_ACCESS_POINT = OperationModel.new(
        name: "DeleteAccessPoint",
        http_method: "DELETE",
        request_uri: "/2015-02-01/access-points/{AccessPointId}"
      )

      DELETE_FILE_SYSTEM = OperationModel.new(
        name: "DeleteFileSystem",
        http_method: "DELETE",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}"
      )

      DELETE_FILE_SYSTEM_POLICY = OperationModel.new(
        name: "DeleteFileSystemPolicy",
        http_method: "DELETE",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/policy"
      )

      DELETE_MOUNT_TARGET = OperationModel.new(
        name: "DeleteMountTarget",
        http_method: "DELETE",
        request_uri: "/2015-02-01/mount-targets/{MountTargetId}"
      )

      DELETE_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "DeleteReplicationConfiguration",
        http_method: "DELETE",
        request_uri: "/2015-02-01/file-systems/{SourceFileSystemId}/replication-configuration"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/2015-02-01/delete-tags/{FileSystemId}"
      )

      DESCRIBE_ACCESS_POINTS = OperationModel.new(
        name: "DescribeAccessPoints",
        http_method: "GET",
        request_uri: "/2015-02-01/access-points"
      )

      DESCRIBE_ACCOUNT_PREFERENCES = OperationModel.new(
        name: "DescribeAccountPreferences",
        http_method: "GET",
        request_uri: "/2015-02-01/account-preferences"
      )

      DESCRIBE_BACKUP_POLICY = OperationModel.new(
        name: "DescribeBackupPolicy",
        http_method: "GET",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/backup-policy"
      )

      DESCRIBE_FILE_SYSTEM_POLICY = OperationModel.new(
        name: "DescribeFileSystemPolicy",
        http_method: "GET",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/policy"
      )

      DESCRIBE_FILE_SYSTEMS = OperationModel.new(
        name: "DescribeFileSystems",
        http_method: "GET",
        request_uri: "/2015-02-01/file-systems"
      )

      DESCRIBE_LIFECYCLE_CONFIGURATION = OperationModel.new(
        name: "DescribeLifecycleConfiguration",
        http_method: "GET",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/lifecycle-configuration"
      )

      DESCRIBE_MOUNT_TARGET_SECURITY_GROUPS = OperationModel.new(
        name: "DescribeMountTargetSecurityGroups",
        http_method: "GET",
        request_uri: "/2015-02-01/mount-targets/{MountTargetId}/security-groups"
      )

      DESCRIBE_MOUNT_TARGETS = OperationModel.new(
        name: "DescribeMountTargets",
        http_method: "GET",
        request_uri: "/2015-02-01/mount-targets"
      )

      DESCRIBE_REPLICATION_CONFIGURATIONS = OperationModel.new(
        name: "DescribeReplicationConfigurations",
        http_method: "GET",
        request_uri: "/2015-02-01/file-systems/replication-configurations"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "GET",
        request_uri: "/2015-02-01/tags/{FileSystemId}/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/2015-02-01/resource-tags/{ResourceId}"
      )

      MODIFY_MOUNT_TARGET_SECURITY_GROUPS = OperationModel.new(
        name: "ModifyMountTargetSecurityGroups",
        http_method: "PUT",
        request_uri: "/2015-02-01/mount-targets/{MountTargetId}/security-groups"
      )

      PUT_ACCOUNT_PREFERENCES = OperationModel.new(
        name: "PutAccountPreferences",
        http_method: "PUT",
        request_uri: "/2015-02-01/account-preferences"
      )

      PUT_BACKUP_POLICY = OperationModel.new(
        name: "PutBackupPolicy",
        http_method: "PUT",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/backup-policy"
      )

      PUT_FILE_SYSTEM_POLICY = OperationModel.new(
        name: "PutFileSystemPolicy",
        http_method: "PUT",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/policy"
      )

      PUT_LIFECYCLE_CONFIGURATION = OperationModel.new(
        name: "PutLifecycleConfiguration",
        http_method: "PUT",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/lifecycle-configuration"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/2015-02-01/resource-tags/{ResourceId}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/2015-02-01/resource-tags/{ResourceId}"
      )

      UPDATE_FILE_SYSTEM = OperationModel.new(
        name: "UpdateFileSystem",
        http_method: "PUT",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}"
      )

      UPDATE_FILE_SYSTEM_PROTECTION = OperationModel.new(
        name: "UpdateFileSystemProtection",
        http_method: "PUT",
        request_uri: "/2015-02-01/file-systems/{FileSystemId}/protection"
      )
    end
  end
end
