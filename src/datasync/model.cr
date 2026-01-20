module Aws
  module DataSync
    module Model
      API_VERSION = "2018-11-09"
      TARGET_PREFIX = "FmrsService"
      SIGNING_NAME = "datasync"
      ENDPOINT_PREFIX = "datasync"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datasync-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datasync-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://datasync.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://datasync.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_TASK_EXECUTION = OperationModel.new(
        name: "CancelTaskExecution",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AGENT = OperationModel.new(
        name: "CreateAgent",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_AZURE_BLOB = OperationModel.new(
        name: "CreateLocationAzureBlob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_EFS = OperationModel.new(
        name: "CreateLocationEfs",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_FSX_LUSTRE = OperationModel.new(
        name: "CreateLocationFsxLustre",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_FSX_ONTAP = OperationModel.new(
        name: "CreateLocationFsxOntap",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_FSX_OPEN_ZFS = OperationModel.new(
        name: "CreateLocationFsxOpenZfs",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_FSX_WINDOWS = OperationModel.new(
        name: "CreateLocationFsxWindows",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_HDFS = OperationModel.new(
        name: "CreateLocationHdfs",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_NFS = OperationModel.new(
        name: "CreateLocationNfs",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_OBJECT_STORAGE = OperationModel.new(
        name: "CreateLocationObjectStorage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_S3 = OperationModel.new(
        name: "CreateLocationS3",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCATION_SMB = OperationModel.new(
        name: "CreateLocationSmb",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TASK = OperationModel.new(
        name: "CreateTask",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AGENT = OperationModel.new(
        name: "DeleteAgent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCATION = OperationModel.new(
        name: "DeleteLocation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TASK = OperationModel.new(
        name: "DeleteTask",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGENT = OperationModel.new(
        name: "DescribeAgent",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_AZURE_BLOB = OperationModel.new(
        name: "DescribeLocationAzureBlob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_EFS = OperationModel.new(
        name: "DescribeLocationEfs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_FSX_LUSTRE = OperationModel.new(
        name: "DescribeLocationFsxLustre",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_FSX_ONTAP = OperationModel.new(
        name: "DescribeLocationFsxOntap",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_FSX_OPEN_ZFS = OperationModel.new(
        name: "DescribeLocationFsxOpenZfs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_FSX_WINDOWS = OperationModel.new(
        name: "DescribeLocationFsxWindows",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_HDFS = OperationModel.new(
        name: "DescribeLocationHdfs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_NFS = OperationModel.new(
        name: "DescribeLocationNfs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_OBJECT_STORAGE = OperationModel.new(
        name: "DescribeLocationObjectStorage",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_S3 = OperationModel.new(
        name: "DescribeLocationS3",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATION_SMB = OperationModel.new(
        name: "DescribeLocationSmb",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TASK = OperationModel.new(
        name: "DescribeTask",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TASK_EXECUTION = OperationModel.new(
        name: "DescribeTaskExecution",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AGENTS = OperationModel.new(
        name: "ListAgents",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOCATIONS = OperationModel.new(
        name: "ListLocations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASK_EXECUTIONS = OperationModel.new(
        name: "ListTaskExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TASKS = OperationModel.new(
        name: "ListTasks",
        http_method: "POST",
        request_uri: "/"
      )

      START_TASK_EXECUTION = OperationModel.new(
        name: "StartTaskExecution",
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

      UPDATE_AGENT = OperationModel.new(
        name: "UpdateAgent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_AZURE_BLOB = OperationModel.new(
        name: "UpdateLocationAzureBlob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_EFS = OperationModel.new(
        name: "UpdateLocationEfs",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_FSX_LUSTRE = OperationModel.new(
        name: "UpdateLocationFsxLustre",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_FSX_ONTAP = OperationModel.new(
        name: "UpdateLocationFsxOntap",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_FSX_OPEN_ZFS = OperationModel.new(
        name: "UpdateLocationFsxOpenZfs",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_FSX_WINDOWS = OperationModel.new(
        name: "UpdateLocationFsxWindows",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_HDFS = OperationModel.new(
        name: "UpdateLocationHdfs",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_NFS = OperationModel.new(
        name: "UpdateLocationNfs",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_OBJECT_STORAGE = OperationModel.new(
        name: "UpdateLocationObjectStorage",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_S3 = OperationModel.new(
        name: "UpdateLocationS3",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOCATION_SMB = OperationModel.new(
        name: "UpdateLocationSmb",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TASK = OperationModel.new(
        name: "UpdateTask",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TASK_EXECUTION = OperationModel.new(
        name: "UpdateTaskExecution",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
