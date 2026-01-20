module Aws
  module MediaLive
    module Model
      API_VERSION = "2017-10-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "medialive"
      ENDPOINT_PREFIX = "medialive"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://medialive-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://medialive-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://medialive.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://medialive.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_INPUT_DEVICE_TRANSFER = OperationModel.new(
        name: "AcceptInputDeviceTransfer",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/accept"
      )

      BATCH_DELETE = OperationModel.new(
        name: "BatchDelete",
        http_method: "POST",
        request_uri: "/prod/batch/delete"
      )

      BATCH_START = OperationModel.new(
        name: "BatchStart",
        http_method: "POST",
        request_uri: "/prod/batch/start"
      )

      BATCH_STOP = OperationModel.new(
        name: "BatchStop",
        http_method: "POST",
        request_uri: "/prod/batch/stop"
      )

      BATCH_UPDATE_SCHEDULE = OperationModel.new(
        name: "BatchUpdateSchedule",
        http_method: "PUT",
        request_uri: "/prod/channels/{channelId}/schedule"
      )

      CANCEL_INPUT_DEVICE_TRANSFER = OperationModel.new(
        name: "CancelInputDeviceTransfer",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/cancel"
      )

      CLAIM_DEVICE = OperationModel.new(
        name: "ClaimDevice",
        http_method: "POST",
        request_uri: "/prod/claimDevice"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/prod/channels"
      )

      CREATE_CHANNEL_PLACEMENT_GROUP = OperationModel.new(
        name: "CreateChannelPlacementGroup",
        http_method: "POST",
        request_uri: "/prod/clusters/{clusterId}/channelplacementgroups"
      )

      CREATE_CLOUD_WATCH_ALARM_TEMPLATE = OperationModel.new(
        name: "CreateCloudWatchAlarmTemplate",
        http_method: "POST",
        request_uri: "/prod/cloudwatch-alarm-templates"
      )

      CREATE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP = OperationModel.new(
        name: "CreateCloudWatchAlarmTemplateGroup",
        http_method: "POST",
        request_uri: "/prod/cloudwatch-alarm-template-groups"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/prod/clusters"
      )

      CREATE_EVENT_BRIDGE_RULE_TEMPLATE = OperationModel.new(
        name: "CreateEventBridgeRuleTemplate",
        http_method: "POST",
        request_uri: "/prod/eventbridge-rule-templates"
      )

      CREATE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP = OperationModel.new(
        name: "CreateEventBridgeRuleTemplateGroup",
        http_method: "POST",
        request_uri: "/prod/eventbridge-rule-template-groups"
      )

      CREATE_INPUT = OperationModel.new(
        name: "CreateInput",
        http_method: "POST",
        request_uri: "/prod/inputs"
      )

      CREATE_INPUT_SECURITY_GROUP = OperationModel.new(
        name: "CreateInputSecurityGroup",
        http_method: "POST",
        request_uri: "/prod/inputSecurityGroups"
      )

      CREATE_MULTIPLEX = OperationModel.new(
        name: "CreateMultiplex",
        http_method: "POST",
        request_uri: "/prod/multiplexes"
      )

      CREATE_MULTIPLEX_PROGRAM = OperationModel.new(
        name: "CreateMultiplexProgram",
        http_method: "POST",
        request_uri: "/prod/multiplexes/{multiplexId}/programs"
      )

      CREATE_NETWORK = OperationModel.new(
        name: "CreateNetwork",
        http_method: "POST",
        request_uri: "/prod/networks"
      )

      CREATE_NODE = OperationModel.new(
        name: "CreateNode",
        http_method: "POST",
        request_uri: "/prod/clusters/{clusterId}/nodes"
      )

      CREATE_NODE_REGISTRATION_SCRIPT = OperationModel.new(
        name: "CreateNodeRegistrationScript",
        http_method: "POST",
        request_uri: "/prod/clusters/{clusterId}/nodeRegistrationScript"
      )

      CREATE_PARTNER_INPUT = OperationModel.new(
        name: "CreatePartnerInput",
        http_method: "POST",
        request_uri: "/prod/inputs/{inputId}/partners"
      )

      CREATE_SDI_SOURCE = OperationModel.new(
        name: "CreateSdiSource",
        http_method: "POST",
        request_uri: "/prod/sdiSources"
      )

      CREATE_SIGNAL_MAP = OperationModel.new(
        name: "CreateSignalMap",
        http_method: "POST",
        request_uri: "/prod/signal-maps"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/prod/tags/{resource-arn}"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/prod/channels/{channelId}"
      )

      DELETE_CHANNEL_PLACEMENT_GROUP = OperationModel.new(
        name: "DeleteChannelPlacementGroup",
        http_method: "DELETE",
        request_uri: "/prod/clusters/{clusterId}/channelplacementgroups/{channelPlacementGroupId}"
      )

      DELETE_CLOUD_WATCH_ALARM_TEMPLATE = OperationModel.new(
        name: "DeleteCloudWatchAlarmTemplate",
        http_method: "DELETE",
        request_uri: "/prod/cloudwatch-alarm-templates/{identifier}"
      )

      DELETE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP = OperationModel.new(
        name: "DeleteCloudWatchAlarmTemplateGroup",
        http_method: "DELETE",
        request_uri: "/prod/cloudwatch-alarm-template-groups/{identifier}"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/prod/clusters/{clusterId}"
      )

      DELETE_EVENT_BRIDGE_RULE_TEMPLATE = OperationModel.new(
        name: "DeleteEventBridgeRuleTemplate",
        http_method: "DELETE",
        request_uri: "/prod/eventbridge-rule-templates/{identifier}"
      )

      DELETE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP = OperationModel.new(
        name: "DeleteEventBridgeRuleTemplateGroup",
        http_method: "DELETE",
        request_uri: "/prod/eventbridge-rule-template-groups/{identifier}"
      )

      DELETE_INPUT = OperationModel.new(
        name: "DeleteInput",
        http_method: "DELETE",
        request_uri: "/prod/inputs/{inputId}"
      )

      DELETE_INPUT_SECURITY_GROUP = OperationModel.new(
        name: "DeleteInputSecurityGroup",
        http_method: "DELETE",
        request_uri: "/prod/inputSecurityGroups/{inputSecurityGroupId}"
      )

      DELETE_MULTIPLEX = OperationModel.new(
        name: "DeleteMultiplex",
        http_method: "DELETE",
        request_uri: "/prod/multiplexes/{multiplexId}"
      )

      DELETE_MULTIPLEX_PROGRAM = OperationModel.new(
        name: "DeleteMultiplexProgram",
        http_method: "DELETE",
        request_uri: "/prod/multiplexes/{multiplexId}/programs/{programName}"
      )

      DELETE_NETWORK = OperationModel.new(
        name: "DeleteNetwork",
        http_method: "DELETE",
        request_uri: "/prod/networks/{networkId}"
      )

      DELETE_NODE = OperationModel.new(
        name: "DeleteNode",
        http_method: "DELETE",
        request_uri: "/prod/clusters/{clusterId}/nodes/{nodeId}"
      )

      DELETE_RESERVATION = OperationModel.new(
        name: "DeleteReservation",
        http_method: "DELETE",
        request_uri: "/prod/reservations/{reservationId}"
      )

      DELETE_SCHEDULE = OperationModel.new(
        name: "DeleteSchedule",
        http_method: "DELETE",
        request_uri: "/prod/channels/{channelId}/schedule"
      )

      DELETE_SDI_SOURCE = OperationModel.new(
        name: "DeleteSdiSource",
        http_method: "DELETE",
        request_uri: "/prod/sdiSources/{sdiSourceId}"
      )

      DELETE_SIGNAL_MAP = OperationModel.new(
        name: "DeleteSignalMap",
        http_method: "DELETE",
        request_uri: "/prod/signal-maps/{identifier}"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "DELETE",
        request_uri: "/prod/tags/{resource-arn}"
      )

      DESCRIBE_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "DescribeAccountConfiguration",
        http_method: "GET",
        request_uri: "/prod/accountConfiguration"
      )

      DESCRIBE_CHANNEL = OperationModel.new(
        name: "DescribeChannel",
        http_method: "GET",
        request_uri: "/prod/channels/{channelId}"
      )

      DESCRIBE_CHANNEL_PLACEMENT_GROUP = OperationModel.new(
        name: "DescribeChannelPlacementGroup",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}/channelplacementgroups/{channelPlacementGroupId}"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}"
      )

      DESCRIBE_INPUT = OperationModel.new(
        name: "DescribeInput",
        http_method: "GET",
        request_uri: "/prod/inputs/{inputId}"
      )

      DESCRIBE_INPUT_DEVICE = OperationModel.new(
        name: "DescribeInputDevice",
        http_method: "GET",
        request_uri: "/prod/inputDevices/{inputDeviceId}"
      )

      DESCRIBE_INPUT_DEVICE_THUMBNAIL = OperationModel.new(
        name: "DescribeInputDeviceThumbnail",
        http_method: "GET",
        request_uri: "/prod/inputDevices/{inputDeviceId}/thumbnailData"
      )

      DESCRIBE_INPUT_SECURITY_GROUP = OperationModel.new(
        name: "DescribeInputSecurityGroup",
        http_method: "GET",
        request_uri: "/prod/inputSecurityGroups/{inputSecurityGroupId}"
      )

      DESCRIBE_MULTIPLEX = OperationModel.new(
        name: "DescribeMultiplex",
        http_method: "GET",
        request_uri: "/prod/multiplexes/{multiplexId}"
      )

      DESCRIBE_MULTIPLEX_PROGRAM = OperationModel.new(
        name: "DescribeMultiplexProgram",
        http_method: "GET",
        request_uri: "/prod/multiplexes/{multiplexId}/programs/{programName}"
      )

      DESCRIBE_NETWORK = OperationModel.new(
        name: "DescribeNetwork",
        http_method: "GET",
        request_uri: "/prod/networks/{networkId}"
      )

      DESCRIBE_NODE = OperationModel.new(
        name: "DescribeNode",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}/nodes/{nodeId}"
      )

      DESCRIBE_OFFERING = OperationModel.new(
        name: "DescribeOffering",
        http_method: "GET",
        request_uri: "/prod/offerings/{offeringId}"
      )

      DESCRIBE_RESERVATION = OperationModel.new(
        name: "DescribeReservation",
        http_method: "GET",
        request_uri: "/prod/reservations/{reservationId}"
      )

      DESCRIBE_SCHEDULE = OperationModel.new(
        name: "DescribeSchedule",
        http_method: "GET",
        request_uri: "/prod/channels/{channelId}/schedule"
      )

      DESCRIBE_SDI_SOURCE = OperationModel.new(
        name: "DescribeSdiSource",
        http_method: "GET",
        request_uri: "/prod/sdiSources/{sdiSourceId}"
      )

      DESCRIBE_THUMBNAILS = OperationModel.new(
        name: "DescribeThumbnails",
        http_method: "GET",
        request_uri: "/prod/channels/{channelId}/thumbnails"
      )

      GET_CLOUD_WATCH_ALARM_TEMPLATE = OperationModel.new(
        name: "GetCloudWatchAlarmTemplate",
        http_method: "GET",
        request_uri: "/prod/cloudwatch-alarm-templates/{identifier}"
      )

      GET_CLOUD_WATCH_ALARM_TEMPLATE_GROUP = OperationModel.new(
        name: "GetCloudWatchAlarmTemplateGroup",
        http_method: "GET",
        request_uri: "/prod/cloudwatch-alarm-template-groups/{identifier}"
      )

      GET_EVENT_BRIDGE_RULE_TEMPLATE = OperationModel.new(
        name: "GetEventBridgeRuleTemplate",
        http_method: "GET",
        request_uri: "/prod/eventbridge-rule-templates/{identifier}"
      )

      GET_EVENT_BRIDGE_RULE_TEMPLATE_GROUP = OperationModel.new(
        name: "GetEventBridgeRuleTemplateGroup",
        http_method: "GET",
        request_uri: "/prod/eventbridge-rule-template-groups/{identifier}"
      )

      GET_SIGNAL_MAP = OperationModel.new(
        name: "GetSignalMap",
        http_method: "GET",
        request_uri: "/prod/signal-maps/{identifier}"
      )

      LIST_ALERTS = OperationModel.new(
        name: "ListAlerts",
        http_method: "GET",
        request_uri: "/prod/channels/{channelId}/alerts"
      )

      LIST_CHANNEL_PLACEMENT_GROUPS = OperationModel.new(
        name: "ListChannelPlacementGroups",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}/channelplacementgroups"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/prod/channels"
      )

      LIST_CLOUD_WATCH_ALARM_TEMPLATE_GROUPS = OperationModel.new(
        name: "ListCloudWatchAlarmTemplateGroups",
        http_method: "GET",
        request_uri: "/prod/cloudwatch-alarm-template-groups"
      )

      LIST_CLOUD_WATCH_ALARM_TEMPLATES = OperationModel.new(
        name: "ListCloudWatchAlarmTemplates",
        http_method: "GET",
        request_uri: "/prod/cloudwatch-alarm-templates"
      )

      LIST_CLUSTER_ALERTS = OperationModel.new(
        name: "ListClusterAlerts",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}/alerts"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/prod/clusters"
      )

      LIST_EVENT_BRIDGE_RULE_TEMPLATE_GROUPS = OperationModel.new(
        name: "ListEventBridgeRuleTemplateGroups",
        http_method: "GET",
        request_uri: "/prod/eventbridge-rule-template-groups"
      )

      LIST_EVENT_BRIDGE_RULE_TEMPLATES = OperationModel.new(
        name: "ListEventBridgeRuleTemplates",
        http_method: "GET",
        request_uri: "/prod/eventbridge-rule-templates"
      )

      LIST_INPUT_DEVICE_TRANSFERS = OperationModel.new(
        name: "ListInputDeviceTransfers",
        http_method: "GET",
        request_uri: "/prod/inputDeviceTransfers"
      )

      LIST_INPUT_DEVICES = OperationModel.new(
        name: "ListInputDevices",
        http_method: "GET",
        request_uri: "/prod/inputDevices"
      )

      LIST_INPUT_SECURITY_GROUPS = OperationModel.new(
        name: "ListInputSecurityGroups",
        http_method: "GET",
        request_uri: "/prod/inputSecurityGroups"
      )

      LIST_INPUTS = OperationModel.new(
        name: "ListInputs",
        http_method: "GET",
        request_uri: "/prod/inputs"
      )

      LIST_MULTIPLEX_ALERTS = OperationModel.new(
        name: "ListMultiplexAlerts",
        http_method: "GET",
        request_uri: "/prod/multiplexes/{multiplexId}/alerts"
      )

      LIST_MULTIPLEX_PROGRAMS = OperationModel.new(
        name: "ListMultiplexPrograms",
        http_method: "GET",
        request_uri: "/prod/multiplexes/{multiplexId}/programs"
      )

      LIST_MULTIPLEXES = OperationModel.new(
        name: "ListMultiplexes",
        http_method: "GET",
        request_uri: "/prod/multiplexes"
      )

      LIST_NETWORKS = OperationModel.new(
        name: "ListNetworks",
        http_method: "GET",
        request_uri: "/prod/networks"
      )

      LIST_NODES = OperationModel.new(
        name: "ListNodes",
        http_method: "GET",
        request_uri: "/prod/clusters/{clusterId}/nodes"
      )

      LIST_OFFERINGS = OperationModel.new(
        name: "ListOfferings",
        http_method: "GET",
        request_uri: "/prod/offerings"
      )

      LIST_RESERVATIONS = OperationModel.new(
        name: "ListReservations",
        http_method: "GET",
        request_uri: "/prod/reservations"
      )

      LIST_SDI_SOURCES = OperationModel.new(
        name: "ListSdiSources",
        http_method: "GET",
        request_uri: "/prod/sdiSources"
      )

      LIST_SIGNAL_MAPS = OperationModel.new(
        name: "ListSignalMaps",
        http_method: "GET",
        request_uri: "/prod/signal-maps"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/prod/tags/{resource-arn}"
      )

      LIST_VERSIONS = OperationModel.new(
        name: "ListVersions",
        http_method: "GET",
        request_uri: "/prod/versions"
      )

      PURCHASE_OFFERING = OperationModel.new(
        name: "PurchaseOffering",
        http_method: "POST",
        request_uri: "/prod/offerings/{offeringId}/purchase"
      )

      REBOOT_INPUT_DEVICE = OperationModel.new(
        name: "RebootInputDevice",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/reboot"
      )

      REJECT_INPUT_DEVICE_TRANSFER = OperationModel.new(
        name: "RejectInputDeviceTransfer",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/reject"
      )

      RESTART_CHANNEL_PIPELINES = OperationModel.new(
        name: "RestartChannelPipelines",
        http_method: "POST",
        request_uri: "/prod/channels/{channelId}/restartChannelPipelines"
      )

      START_CHANNEL = OperationModel.new(
        name: "StartChannel",
        http_method: "POST",
        request_uri: "/prod/channels/{channelId}/start"
      )

      START_DELETE_MONITOR_DEPLOYMENT = OperationModel.new(
        name: "StartDeleteMonitorDeployment",
        http_method: "DELETE",
        request_uri: "/prod/signal-maps/{identifier}/monitor-deployment"
      )

      START_INPUT_DEVICE = OperationModel.new(
        name: "StartInputDevice",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/start"
      )

      START_INPUT_DEVICE_MAINTENANCE_WINDOW = OperationModel.new(
        name: "StartInputDeviceMaintenanceWindow",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/startInputDeviceMaintenanceWindow"
      )

      START_MONITOR_DEPLOYMENT = OperationModel.new(
        name: "StartMonitorDeployment",
        http_method: "POST",
        request_uri: "/prod/signal-maps/{identifier}/monitor-deployment"
      )

      START_MULTIPLEX = OperationModel.new(
        name: "StartMultiplex",
        http_method: "POST",
        request_uri: "/prod/multiplexes/{multiplexId}/start"
      )

      START_UPDATE_SIGNAL_MAP = OperationModel.new(
        name: "StartUpdateSignalMap",
        http_method: "PATCH",
        request_uri: "/prod/signal-maps/{identifier}"
      )

      STOP_CHANNEL = OperationModel.new(
        name: "StopChannel",
        http_method: "POST",
        request_uri: "/prod/channels/{channelId}/stop"
      )

      STOP_INPUT_DEVICE = OperationModel.new(
        name: "StopInputDevice",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/stop"
      )

      STOP_MULTIPLEX = OperationModel.new(
        name: "StopMultiplex",
        http_method: "POST",
        request_uri: "/prod/multiplexes/{multiplexId}/stop"
      )

      TRANSFER_INPUT_DEVICE = OperationModel.new(
        name: "TransferInputDevice",
        http_method: "POST",
        request_uri: "/prod/inputDevices/{inputDeviceId}/transfer"
      )

      UPDATE_ACCOUNT_CONFIGURATION = OperationModel.new(
        name: "UpdateAccountConfiguration",
        http_method: "PUT",
        request_uri: "/prod/accountConfiguration"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/prod/channels/{channelId}"
      )

      UPDATE_CHANNEL_CLASS = OperationModel.new(
        name: "UpdateChannelClass",
        http_method: "PUT",
        request_uri: "/prod/channels/{channelId}/channelClass"
      )

      UPDATE_CHANNEL_PLACEMENT_GROUP = OperationModel.new(
        name: "UpdateChannelPlacementGroup",
        http_method: "PUT",
        request_uri: "/prod/clusters/{clusterId}/channelplacementgroups/{channelPlacementGroupId}"
      )

      UPDATE_CLOUD_WATCH_ALARM_TEMPLATE = OperationModel.new(
        name: "UpdateCloudWatchAlarmTemplate",
        http_method: "PATCH",
        request_uri: "/prod/cloudwatch-alarm-templates/{identifier}"
      )

      UPDATE_CLOUD_WATCH_ALARM_TEMPLATE_GROUP = OperationModel.new(
        name: "UpdateCloudWatchAlarmTemplateGroup",
        http_method: "PATCH",
        request_uri: "/prod/cloudwatch-alarm-template-groups/{identifier}"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "PUT",
        request_uri: "/prod/clusters/{clusterId}"
      )

      UPDATE_EVENT_BRIDGE_RULE_TEMPLATE = OperationModel.new(
        name: "UpdateEventBridgeRuleTemplate",
        http_method: "PATCH",
        request_uri: "/prod/eventbridge-rule-templates/{identifier}"
      )

      UPDATE_EVENT_BRIDGE_RULE_TEMPLATE_GROUP = OperationModel.new(
        name: "UpdateEventBridgeRuleTemplateGroup",
        http_method: "PATCH",
        request_uri: "/prod/eventbridge-rule-template-groups/{identifier}"
      )

      UPDATE_INPUT = OperationModel.new(
        name: "UpdateInput",
        http_method: "PUT",
        request_uri: "/prod/inputs/{inputId}"
      )

      UPDATE_INPUT_DEVICE = OperationModel.new(
        name: "UpdateInputDevice",
        http_method: "PUT",
        request_uri: "/prod/inputDevices/{inputDeviceId}"
      )

      UPDATE_INPUT_SECURITY_GROUP = OperationModel.new(
        name: "UpdateInputSecurityGroup",
        http_method: "PUT",
        request_uri: "/prod/inputSecurityGroups/{inputSecurityGroupId}"
      )

      UPDATE_MULTIPLEX = OperationModel.new(
        name: "UpdateMultiplex",
        http_method: "PUT",
        request_uri: "/prod/multiplexes/{multiplexId}"
      )

      UPDATE_MULTIPLEX_PROGRAM = OperationModel.new(
        name: "UpdateMultiplexProgram",
        http_method: "PUT",
        request_uri: "/prod/multiplexes/{multiplexId}/programs/{programName}"
      )

      UPDATE_NETWORK = OperationModel.new(
        name: "UpdateNetwork",
        http_method: "PUT",
        request_uri: "/prod/networks/{networkId}"
      )

      UPDATE_NODE = OperationModel.new(
        name: "UpdateNode",
        http_method: "PUT",
        request_uri: "/prod/clusters/{clusterId}/nodes/{nodeId}"
      )

      UPDATE_NODE_STATE = OperationModel.new(
        name: "UpdateNodeState",
        http_method: "PUT",
        request_uri: "/prod/clusters/{clusterId}/nodes/{nodeId}/state"
      )

      UPDATE_RESERVATION = OperationModel.new(
        name: "UpdateReservation",
        http_method: "PUT",
        request_uri: "/prod/reservations/{reservationId}"
      )

      UPDATE_SDI_SOURCE = OperationModel.new(
        name: "UpdateSdiSource",
        http_method: "PUT",
        request_uri: "/prod/sdiSources/{sdiSourceId}"
      )
    end
  end
end
