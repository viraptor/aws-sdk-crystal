module AwsSdk
  module Redshift
    module Model
      API_VERSION = "2012-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "redshift"
      ENDPOINT_PREFIX = "redshift"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://redshift.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://redshift-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://redshift.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://redshift.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_RESERVED_NODE_EXCHANGE = OperationModel.new(
        name: "AcceptReservedNodeExchange",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_PARTNER = OperationModel.new(
        name: "AddPartner",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DATA_SHARE_CONSUMER = OperationModel.new(
        name: "AssociateDataShareConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_CLUSTER_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "AuthorizeClusterSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_DATA_SHARE = OperationModel.new(
        name: "AuthorizeDataShare",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_ENDPOINT_ACCESS = OperationModel.new(
        name: "AuthorizeEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_SNAPSHOT_ACCESS = OperationModel.new(
        name: "AuthorizeSnapshotAccess",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_CLUSTER_SNAPSHOTS = OperationModel.new(
        name: "BatchDeleteClusterSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_MODIFY_CLUSTER_SNAPSHOTS = OperationModel.new(
        name: "BatchModifyClusterSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_RESIZE = OperationModel.new(
        name: "CancelResize",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CopyClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AUTHENTICATION_PROFILE = OperationModel.new(
        name: "CreateAuthenticationProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "CreateClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER_SECURITY_GROUP = OperationModel.new(
        name: "CreateClusterSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CreateClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER_SUBNET_GROUP = OperationModel.new(
        name: "CreateClusterSubnetGroup",
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

      CREATE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "CreateEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HSM_CLIENT_CERTIFICATE = OperationModel.new(
        name: "CreateHsmClientCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HSM_CONFIGURATION = OperationModel.new(
        name: "CreateHsmConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTEGRATION = OperationModel.new(
        name: "CreateIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REDSHIFT_IDC_APPLICATION = OperationModel.new(
        name: "CreateRedshiftIdcApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SCHEDULED_ACTION = OperationModel.new(
        name: "CreateScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT_COPY_GRANT = OperationModel.new(
        name: "CreateSnapshotCopyGrant",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "CreateSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USAGE_LIMIT = OperationModel.new(
        name: "CreateUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      DEAUTHORIZE_DATA_SHARE = OperationModel.new(
        name: "DeauthorizeDataShare",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTHENTICATION_PROFILE = OperationModel.new(
        name: "DeleteAuthenticationProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "DeleteClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER_SECURITY_GROUP = OperationModel.new(
        name: "DeleteClusterSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "DeleteClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER_SUBNET_GROUP = OperationModel.new(
        name: "DeleteClusterSubnetGroup",
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

      DELETE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "DeleteEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HSM_CLIENT_CERTIFICATE = OperationModel.new(
        name: "DeleteHsmClientCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HSM_CONFIGURATION = OperationModel.new(
        name: "DeleteHsmConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTEGRATION = OperationModel.new(
        name: "DeleteIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTNER = OperationModel.new(
        name: "DeletePartner",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REDSHIFT_IDC_APPLICATION = OperationModel.new(
        name: "DeleteRedshiftIdcApplication",
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

      DELETE_SNAPSHOT_COPY_GRANT = OperationModel.new(
        name: "DeleteSnapshotCopyGrant",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "DeleteSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USAGE_LIMIT = OperationModel.new(
        name: "DeleteUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_NAMESPACE = OperationModel.new(
        name: "DeregisterNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ATTRIBUTES = OperationModel.new(
        name: "DescribeAccountAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AUTHENTICATION_PROFILES = OperationModel.new(
        name: "DescribeAuthenticationProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_DB_REVISIONS = OperationModel.new(
        name: "DescribeClusterDbRevisions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeClusterParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_PARAMETERS = OperationModel.new(
        name: "DescribeClusterParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_SECURITY_GROUPS = OperationModel.new(
        name: "DescribeClusterSecurityGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_SNAPSHOTS = OperationModel.new(
        name: "DescribeClusterSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_SUBNET_GROUPS = OperationModel.new(
        name: "DescribeClusterSubnetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_TRACKS = OperationModel.new(
        name: "DescribeClusterTracks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER_VERSIONS = OperationModel.new(
        name: "DescribeClusterVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTERS = OperationModel.new(
        name: "DescribeClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOM_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "DescribeCustomDomainAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_SHARES = OperationModel.new(
        name: "DescribeDataShares",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_SHARES_FOR_CONSUMER = OperationModel.new(
        name: "DescribeDataSharesForConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DATA_SHARES_FOR_PRODUCER = OperationModel.new(
        name: "DescribeDataSharesForProducer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DEFAULT_CLUSTER_PARAMETERS = OperationModel.new(
        name: "DescribeDefaultClusterParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_ACCESS = OperationModel.new(
        name: "DescribeEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENDPOINT_AUTHORIZATION = OperationModel.new(
        name: "DescribeEndpointAuthorization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_CATEGORIES = OperationModel.new(
        name: "DescribeEventCategories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeEventSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HSM_CLIENT_CERTIFICATES = OperationModel.new(
        name: "DescribeHsmClientCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HSM_CONFIGURATIONS = OperationModel.new(
        name: "DescribeHsmConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INBOUND_INTEGRATIONS = OperationModel.new(
        name: "DescribeInboundIntegrations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INTEGRATIONS = OperationModel.new(
        name: "DescribeIntegrations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOGGING_STATUS = OperationModel.new(
        name: "DescribeLoggingStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NODE_CONFIGURATION_OPTIONS = OperationModel.new(
        name: "DescribeNodeConfigurationOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORDERABLE_CLUSTER_OPTIONS = OperationModel.new(
        name: "DescribeOrderableClusterOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARTNERS = OperationModel.new(
        name: "DescribePartners",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REDSHIFT_IDC_APPLICATIONS = OperationModel.new(
        name: "DescribeRedshiftIdcApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_NODE_EXCHANGE_STATUS = OperationModel.new(
        name: "DescribeReservedNodeExchangeStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_NODE_OFFERINGS = OperationModel.new(
        name: "DescribeReservedNodeOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_NODES = OperationModel.new(
        name: "DescribeReservedNodes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESIZE = OperationModel.new(
        name: "DescribeResize",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEDULED_ACTIONS = OperationModel.new(
        name: "DescribeScheduledActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOT_COPY_GRANTS = OperationModel.new(
        name: "DescribeSnapshotCopyGrants",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOT_SCHEDULES = OperationModel.new(
        name: "DescribeSnapshotSchedules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STORAGE = OperationModel.new(
        name: "DescribeStorage",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TABLE_RESTORE_STATUS = OperationModel.new(
        name: "DescribeTableRestoreStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USAGE_LIMITS = OperationModel.new(
        name: "DescribeUsageLimits",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_LOGGING = OperationModel.new(
        name: "DisableLogging",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_SNAPSHOT_COPY = OperationModel.new(
        name: "DisableSnapshotCopy",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DATA_SHARE_CONSUMER = OperationModel.new(
        name: "DisassociateDataShareConsumer",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_LOGGING = OperationModel.new(
        name: "EnableLogging",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_SNAPSHOT_COPY = OperationModel.new(
        name: "EnableSnapshotCopy",
        http_method: "POST",
        request_uri: "/"
      )

      FAILOVER_PRIMARY_COMPUTE = OperationModel.new(
        name: "FailoverPrimaryCompute",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLUSTER_CREDENTIALS = OperationModel.new(
        name: "GetClusterCredentials",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLUSTER_CREDENTIALS_WITH_IAM = OperationModel.new(
        name: "GetClusterCredentialsWithIAM",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDENTITY_CENTER_AUTH_TOKEN = OperationModel.new(
        name: "GetIdentityCenterAuthToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVED_NODE_EXCHANGE_CONFIGURATION_OPTIONS = OperationModel.new(
        name: "GetReservedNodeExchangeConfigurationOptions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVED_NODE_EXCHANGE_OFFERINGS = OperationModel.new(
        name: "GetReservedNodeExchangeOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_RECOMMENDATIONS = OperationModel.new(
        name: "ListRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_AQUA_CONFIGURATION = OperationModel.new(
        name: "ModifyAquaConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_AUTHENTICATION_PROFILE = OperationModel.new(
        name: "ModifyAuthenticationProfile",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER = OperationModel.new(
        name: "ModifyCluster",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_DB_REVISION = OperationModel.new(
        name: "ModifyClusterDbRevision",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_IAM_ROLES = OperationModel.new(
        name: "ModifyClusterIamRoles",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_MAINTENANCE = OperationModel.new(
        name: "ModifyClusterMaintenance",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "ModifyClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "ModifyClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "ModifyClusterSnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLUSTER_SUBNET_GROUP = OperationModel.new(
        name: "ModifyClusterSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CUSTOM_DOMAIN_ASSOCIATION = OperationModel.new(
        name: "ModifyCustomDomainAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ENDPOINT_ACCESS = OperationModel.new(
        name: "ModifyEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "ModifyEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INTEGRATION = OperationModel.new(
        name: "ModifyIntegration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LAKEHOUSE_CONFIGURATION = OperationModel.new(
        name: "ModifyLakehouseConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REDSHIFT_IDC_APPLICATION = OperationModel.new(
        name: "ModifyRedshiftIdcApplication",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SCHEDULED_ACTION = OperationModel.new(
        name: "ModifyScheduledAction",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SNAPSHOT_COPY_RETENTION_PERIOD = OperationModel.new(
        name: "ModifySnapshotCopyRetentionPeriod",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SNAPSHOT_SCHEDULE = OperationModel.new(
        name: "ModifySnapshotSchedule",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_USAGE_LIMIT = OperationModel.new(
        name: "ModifyUsageLimit",
        http_method: "POST",
        request_uri: "/"
      )

      PAUSE_CLUSTER = OperationModel.new(
        name: "PauseCluster",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_RESERVED_NODE_OFFERING = OperationModel.new(
        name: "PurchaseReservedNodeOffering",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_CLUSTER = OperationModel.new(
        name: "RebootCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_NAMESPACE = OperationModel.new(
        name: "RegisterNamespace",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_DATA_SHARE = OperationModel.new(
        name: "RejectDataShare",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "ResetClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      RESIZE_CLUSTER = OperationModel.new(
        name: "ResizeCluster",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_FROM_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "RestoreFromClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_TABLE_FROM_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "RestoreTableFromClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      RESUME_CLUSTER = OperationModel.new(
        name: "ResumeCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_CLUSTER_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "RevokeClusterSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_ENDPOINT_ACCESS = OperationModel.new(
        name: "RevokeEndpointAccess",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_SNAPSHOT_ACCESS = OperationModel.new(
        name: "RevokeSnapshotAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ROTATE_ENCRYPTION_KEY = OperationModel.new(
        name: "RotateEncryptionKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARTNER_STATUS = OperationModel.new(
        name: "UpdatePartnerStatus",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
