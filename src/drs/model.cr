module Aws
  module Drs
    module Model
      API_VERSION = "2020-02-26"
      TARGET_PREFIX = ""
      SIGNING_NAME = "drs"
      ENDPOINT_PREFIX = "drs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://drs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://drs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://drs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://drs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_SOURCE_NETWORK_STACK = OperationModel.new(
        name: "AssociateSourceNetworkStack",
        http_method: "POST",
        request_uri: "/AssociateSourceNetworkStack"
      )

      CREATE_EXTENDED_SOURCE_SERVER = OperationModel.new(
        name: "CreateExtendedSourceServer",
        http_method: "POST",
        request_uri: "/CreateExtendedSourceServer"
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

      CREATE_SOURCE_NETWORK = OperationModel.new(
        name: "CreateSourceNetwork",
        http_method: "POST",
        request_uri: "/CreateSourceNetwork"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "POST",
        request_uri: "/DeleteJob"
      )

      DELETE_LAUNCH_ACTION = OperationModel.new(
        name: "DeleteLaunchAction",
        http_method: "POST",
        request_uri: "/DeleteLaunchAction"
      )

      DELETE_LAUNCH_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "DeleteLaunchConfigurationTemplate",
        http_method: "POST",
        request_uri: "/DeleteLaunchConfigurationTemplate"
      )

      DELETE_RECOVERY_INSTANCE = OperationModel.new(
        name: "DeleteRecoveryInstance",
        http_method: "POST",
        request_uri: "/DeleteRecoveryInstance"
      )

      DELETE_REPLICATION_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "DeleteReplicationConfigurationTemplate",
        http_method: "POST",
        request_uri: "/DeleteReplicationConfigurationTemplate"
      )

      DELETE_SOURCE_NETWORK = OperationModel.new(
        name: "DeleteSourceNetwork",
        http_method: "POST",
        request_uri: "/DeleteSourceNetwork"
      )

      DELETE_SOURCE_SERVER = OperationModel.new(
        name: "DeleteSourceServer",
        http_method: "POST",
        request_uri: "/DeleteSourceServer"
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

      DESCRIBE_RECOVERY_INSTANCES = OperationModel.new(
        name: "DescribeRecoveryInstances",
        http_method: "POST",
        request_uri: "/DescribeRecoveryInstances"
      )

      DESCRIBE_RECOVERY_SNAPSHOTS = OperationModel.new(
        name: "DescribeRecoverySnapshots",
        http_method: "POST",
        request_uri: "/DescribeRecoverySnapshots"
      )

      DESCRIBE_REPLICATION_CONFIGURATION_TEMPLATES = OperationModel.new(
        name: "DescribeReplicationConfigurationTemplates",
        http_method: "POST",
        request_uri: "/DescribeReplicationConfigurationTemplates"
      )

      DESCRIBE_SOURCE_NETWORKS = OperationModel.new(
        name: "DescribeSourceNetworks",
        http_method: "POST",
        request_uri: "/DescribeSourceNetworks"
      )

      DESCRIBE_SOURCE_SERVERS = OperationModel.new(
        name: "DescribeSourceServers",
        http_method: "POST",
        request_uri: "/DescribeSourceServers"
      )

      DISCONNECT_RECOVERY_INSTANCE = OperationModel.new(
        name: "DisconnectRecoveryInstance",
        http_method: "POST",
        request_uri: "/DisconnectRecoveryInstance"
      )

      DISCONNECT_SOURCE_SERVER = OperationModel.new(
        name: "DisconnectSourceServer",
        http_method: "POST",
        request_uri: "/DisconnectSourceServer"
      )

      EXPORT_SOURCE_NETWORK_CFN_TEMPLATE = OperationModel.new(
        name: "ExportSourceNetworkCfnTemplate",
        http_method: "POST",
        request_uri: "/ExportSourceNetworkCfnTemplate"
      )

      GET_FAILBACK_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "GetFailbackReplicationConfiguration",
        http_method: "POST",
        request_uri: "/GetFailbackReplicationConfiguration"
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

      LIST_EXTENSIBLE_SOURCE_SERVERS = OperationModel.new(
        name: "ListExtensibleSourceServers",
        http_method: "POST",
        request_uri: "/ListExtensibleSourceServers"
      )

      LIST_LAUNCH_ACTIONS = OperationModel.new(
        name: "ListLaunchActions",
        http_method: "POST",
        request_uri: "/ListLaunchActions"
      )

      LIST_STAGING_ACCOUNTS = OperationModel.new(
        name: "ListStagingAccounts",
        http_method: "GET",
        request_uri: "/ListStagingAccounts"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_LAUNCH_ACTION = OperationModel.new(
        name: "PutLaunchAction",
        http_method: "POST",
        request_uri: "/PutLaunchAction"
      )

      RETRY_DATA_REPLICATION = OperationModel.new(
        name: "RetryDataReplication",
        http_method: "POST",
        request_uri: "/RetryDataReplication"
      )

      REVERSE_REPLICATION = OperationModel.new(
        name: "ReverseReplication",
        http_method: "POST",
        request_uri: "/ReverseReplication"
      )

      START_FAILBACK_LAUNCH = OperationModel.new(
        name: "StartFailbackLaunch",
        http_method: "POST",
        request_uri: "/StartFailbackLaunch"
      )

      START_RECOVERY = OperationModel.new(
        name: "StartRecovery",
        http_method: "POST",
        request_uri: "/StartRecovery"
      )

      START_REPLICATION = OperationModel.new(
        name: "StartReplication",
        http_method: "POST",
        request_uri: "/StartReplication"
      )

      START_SOURCE_NETWORK_RECOVERY = OperationModel.new(
        name: "StartSourceNetworkRecovery",
        http_method: "POST",
        request_uri: "/StartSourceNetworkRecovery"
      )

      START_SOURCE_NETWORK_REPLICATION = OperationModel.new(
        name: "StartSourceNetworkReplication",
        http_method: "POST",
        request_uri: "/StartSourceNetworkReplication"
      )

      STOP_FAILBACK = OperationModel.new(
        name: "StopFailback",
        http_method: "POST",
        request_uri: "/StopFailback"
      )

      STOP_REPLICATION = OperationModel.new(
        name: "StopReplication",
        http_method: "POST",
        request_uri: "/StopReplication"
      )

      STOP_SOURCE_NETWORK_REPLICATION = OperationModel.new(
        name: "StopSourceNetworkReplication",
        http_method: "POST",
        request_uri: "/StopSourceNetworkReplication"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      TERMINATE_RECOVERY_INSTANCES = OperationModel.new(
        name: "TerminateRecoveryInstances",
        http_method: "POST",
        request_uri: "/TerminateRecoveryInstances"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_FAILBACK_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "UpdateFailbackReplicationConfiguration",
        http_method: "POST",
        request_uri: "/UpdateFailbackReplicationConfiguration"
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
    end
  end
end
