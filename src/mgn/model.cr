module Aws
  module Mgn
    module Model
      API_VERSION = "2020-02-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mgn"
      ENDPOINT_PREFIX = "mgn"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgn-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgn-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgn.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mgn.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ARCHIVE_APPLICATION = OperationModel.new(
        name: "ArchiveApplication",
        http_method: "POST",
        request_uri: "/ArchiveApplication"
      )

      ARCHIVE_WAVE = OperationModel.new(
        name: "ArchiveWave",
        http_method: "POST",
        request_uri: "/ArchiveWave"
      )

      ASSOCIATE_APPLICATIONS = OperationModel.new(
        name: "AssociateApplications",
        http_method: "POST",
        request_uri: "/AssociateApplications"
      )

      ASSOCIATE_SOURCE_SERVERS = OperationModel.new(
        name: "AssociateSourceServers",
        http_method: "POST",
        request_uri: "/AssociateSourceServers"
      )

      CHANGE_SERVER_LIFE_CYCLE_STATE = OperationModel.new(
        name: "ChangeServerLifeCycleState",
        http_method: "POST",
        request_uri: "/ChangeServerLifeCycleState"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/CreateApplication"
      )

      CREATE_CONNECTOR = OperationModel.new(
        name: "CreateConnector",
        http_method: "POST",
        request_uri: "/CreateConnector"
      )

      CREATE_LAUNCH_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "CreateLaunchConfigurationTemplate",
        http_method: "POST",
        request_uri: "/CreateLaunchConfigurationTemplate"
      )

      CREATE_REPLICATION_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "CreateReplicationConfigurationTemplate",
        http_method: "POST",
        request_uri: "/CreateReplicationConfigurationTemplate"
      )

      CREATE_WAVE = OperationModel.new(
        name: "CreateWave",
        http_method: "POST",
        request_uri: "/CreateWave"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/DeleteApplication"
      )

      DELETE_CONNECTOR = OperationModel.new(
        name: "DeleteConnector",
        http_method: "POST",
        request_uri: "/DeleteConnector"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "POST",
        request_uri: "/DeleteJob"
      )

      DELETE_LAUNCH_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "DeleteLaunchConfigurationTemplate",
        http_method: "POST",
        request_uri: "/DeleteLaunchConfigurationTemplate"
      )

      DELETE_REPLICATION_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "DeleteReplicationConfigurationTemplate",
        http_method: "POST",
        request_uri: "/DeleteReplicationConfigurationTemplate"
      )

      DELETE_SOURCE_SERVER = OperationModel.new(
        name: "DeleteSourceServer",
        http_method: "POST",
        request_uri: "/DeleteSourceServer"
      )

      DELETE_VCENTER_CLIENT = OperationModel.new(
        name: "DeleteVcenterClient",
        http_method: "POST",
        request_uri: "/DeleteVcenterClient"
      )

      DELETE_WAVE = OperationModel.new(
        name: "DeleteWave",
        http_method: "POST",
        request_uri: "/DeleteWave"
      )

      DESCRIBE_JOB_LOG_ITEMS = OperationModel.new(
        name: "DescribeJobLogItems",
        http_method: "POST",
        request_uri: "/DescribeJobLogItems"
      )

      DESCRIBE_JOBS = OperationModel.new(
        name: "DescribeJobs",
        http_method: "POST",
        request_uri: "/DescribeJobs"
      )

      DESCRIBE_LAUNCH_CONFIGURATION_TEMPLATES = OperationModel.new(
        name: "DescribeLaunchConfigurationTemplates",
        http_method: "POST",
        request_uri: "/DescribeLaunchConfigurationTemplates"
      )

      DESCRIBE_REPLICATION_CONFIGURATION_TEMPLATES = OperationModel.new(
        name: "DescribeReplicationConfigurationTemplates",
        http_method: "POST",
        request_uri: "/DescribeReplicationConfigurationTemplates"
      )

      DESCRIBE_SOURCE_SERVERS = OperationModel.new(
        name: "DescribeSourceServers",
        http_method: "POST",
        request_uri: "/DescribeSourceServers"
      )

      DESCRIBE_VCENTER_CLIENTS = OperationModel.new(
        name: "DescribeVcenterClients",
        http_method: "GET",
        request_uri: "/DescribeVcenterClients"
      )

      DISASSOCIATE_APPLICATIONS = OperationModel.new(
        name: "DisassociateApplications",
        http_method: "POST",
        request_uri: "/DisassociateApplications"
      )

      DISASSOCIATE_SOURCE_SERVERS = OperationModel.new(
        name: "DisassociateSourceServers",
        http_method: "POST",
        request_uri: "/DisassociateSourceServers"
      )

      DISCONNECT_FROM_SERVICE = OperationModel.new(
        name: "DisconnectFromService",
        http_method: "POST",
        request_uri: "/DisconnectFromService"
      )

      FINALIZE_CUTOVER = OperationModel.new(
        name: "FinalizeCutover",
        http_method: "POST",
        request_uri: "/FinalizeCutover"
      )

      GET_LAUNCH_CONFIGURATION = OperationModel.new(
        name: "GetLaunchConfiguration",
        http_method: "POST",
        request_uri: "/GetLaunchConfiguration"
      )

      GET_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "GetReplicationConfiguration",
        http_method: "POST",
        request_uri: "/GetReplicationConfiguration"
      )

      INITIALIZE_SERVICE = OperationModel.new(
        name: "InitializeService",
        http_method: "POST",
        request_uri: "/InitializeService"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "POST",
        request_uri: "/ListApplications"
      )

      LIST_CONNECTORS = OperationModel.new(
        name: "ListConnectors",
        http_method: "POST",
        request_uri: "/ListConnectors"
      )

      LIST_EXPORT_ERRORS = OperationModel.new(
        name: "ListExportErrors",
        http_method: "POST",
        request_uri: "/ListExportErrors"
      )

      LIST_EXPORTS = OperationModel.new(
        name: "ListExports",
        http_method: "POST",
        request_uri: "/ListExports"
      )

      LIST_IMPORT_ERRORS = OperationModel.new(
        name: "ListImportErrors",
        http_method: "POST",
        request_uri: "/ListImportErrors"
      )

      LIST_IMPORTS = OperationModel.new(
        name: "ListImports",
        http_method: "POST",
        request_uri: "/ListImports"
      )

      LIST_MANAGED_ACCOUNTS = OperationModel.new(
        name: "ListManagedAccounts",
        http_method: "POST",
        request_uri: "/ListManagedAccounts"
      )

      LIST_SOURCE_SERVER_ACTIONS = OperationModel.new(
        name: "ListSourceServerActions",
        http_method: "POST",
        request_uri: "/ListSourceServerActions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_TEMPLATE_ACTIONS = OperationModel.new(
        name: "ListTemplateActions",
        http_method: "POST",
        request_uri: "/ListTemplateActions"
      )

      LIST_WAVES = OperationModel.new(
        name: "ListWaves",
        http_method: "POST",
        request_uri: "/ListWaves"
      )

      MARK_AS_ARCHIVED = OperationModel.new(
        name: "MarkAsArchived",
        http_method: "POST",
        request_uri: "/MarkAsArchived"
      )

      PAUSE_REPLICATION = OperationModel.new(
        name: "PauseReplication",
        http_method: "POST",
        request_uri: "/PauseReplication"
      )

      PUT_SOURCE_SERVER_ACTION = OperationModel.new(
        name: "PutSourceServerAction",
        http_method: "POST",
        request_uri: "/PutSourceServerAction"
      )

      PUT_TEMPLATE_ACTION = OperationModel.new(
        name: "PutTemplateAction",
        http_method: "POST",
        request_uri: "/PutTemplateAction"
      )

      REMOVE_SOURCE_SERVER_ACTION = OperationModel.new(
        name: "RemoveSourceServerAction",
        http_method: "POST",
        request_uri: "/RemoveSourceServerAction"
      )

      REMOVE_TEMPLATE_ACTION = OperationModel.new(
        name: "RemoveTemplateAction",
        http_method: "POST",
        request_uri: "/RemoveTemplateAction"
      )

      RESUME_REPLICATION = OperationModel.new(
        name: "ResumeReplication",
        http_method: "POST",
        request_uri: "/ResumeReplication"
      )

      RETRY_DATA_REPLICATION = OperationModel.new(
        name: "RetryDataReplication",
        http_method: "POST",
        request_uri: "/RetryDataReplication"
      )

      START_CUTOVER = OperationModel.new(
        name: "StartCutover",
        http_method: "POST",
        request_uri: "/StartCutover"
      )

      START_EXPORT = OperationModel.new(
        name: "StartExport",
        http_method: "POST",
        request_uri: "/StartExport"
      )

      START_IMPORT = OperationModel.new(
        name: "StartImport",
        http_method: "POST",
        request_uri: "/StartImport"
      )

      START_REPLICATION = OperationModel.new(
        name: "StartReplication",
        http_method: "POST",
        request_uri: "/StartReplication"
      )

      START_TEST = OperationModel.new(
        name: "StartTest",
        http_method: "POST",
        request_uri: "/StartTest"
      )

      STOP_REPLICATION = OperationModel.new(
        name: "StopReplication",
        http_method: "POST",
        request_uri: "/StopReplication"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TERMINATE_TARGET_INSTANCES = OperationModel.new(
        name: "TerminateTargetInstances",
        http_method: "POST",
        request_uri: "/TerminateTargetInstances"
      )

      UNARCHIVE_APPLICATION = OperationModel.new(
        name: "UnarchiveApplication",
        http_method: "POST",
        request_uri: "/UnarchiveApplication"
      )

      UNARCHIVE_WAVE = OperationModel.new(
        name: "UnarchiveWave",
        http_method: "POST",
        request_uri: "/UnarchiveWave"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/UpdateApplication"
      )

      UPDATE_CONNECTOR = OperationModel.new(
        name: "UpdateConnector",
        http_method: "POST",
        request_uri: "/UpdateConnector"
      )

      UPDATE_LAUNCH_CONFIGURATION = OperationModel.new(
        name: "UpdateLaunchConfiguration",
        http_method: "POST",
        request_uri: "/UpdateLaunchConfiguration"
      )

      UPDATE_LAUNCH_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "UpdateLaunchConfigurationTemplate",
        http_method: "POST",
        request_uri: "/UpdateLaunchConfigurationTemplate"
      )

      UPDATE_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "UpdateReplicationConfiguration",
        http_method: "POST",
        request_uri: "/UpdateReplicationConfiguration"
      )

      UPDATE_REPLICATION_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "UpdateReplicationConfigurationTemplate",
        http_method: "POST",
        request_uri: "/UpdateReplicationConfigurationTemplate"
      )

      UPDATE_SOURCE_SERVER = OperationModel.new(
        name: "UpdateSourceServer",
        http_method: "POST",
        request_uri: "/UpdateSourceServer"
      )

      UPDATE_SOURCE_SERVER_REPLICATION_TYPE = OperationModel.new(
        name: "UpdateSourceServerReplicationType",
        http_method: "POST",
        request_uri: "/UpdateSourceServerReplicationType"
      )

      UPDATE_WAVE = OperationModel.new(
        name: "UpdateWave",
        http_method: "POST",
        request_uri: "/UpdateWave"
      )
    end
  end
end
