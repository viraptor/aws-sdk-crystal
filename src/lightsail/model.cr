module Aws
  module Lightsail
    module Model
      API_VERSION = "2016-11-28"
      TARGET_PREFIX = "Lightsail_20161128"
      SIGNING_NAME = "lightsail"
      ENDPOINT_PREFIX = "lightsail"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lightsail-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lightsail-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://lightsail.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://lightsail.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ALLOCATE_STATIC_IP = OperationModel.new(
        name: "AllocateStaticIp",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_CERTIFICATE_TO_DISTRIBUTION = OperationModel.new(
        name: "AttachCertificateToDistribution",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_DISK = OperationModel.new(
        name: "AttachDisk",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_INSTANCES_TO_LOAD_BALANCER = OperationModel.new(
        name: "AttachInstancesToLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_LOAD_BALANCER_TLS_CERTIFICATE = OperationModel.new(
        name: "AttachLoadBalancerTlsCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_STATIC_IP = OperationModel.new(
        name: "AttachStaticIp",
        http_method: "POST",
        request_uri: "/"
      )

      CLOSE_INSTANCE_PUBLIC_PORTS = OperationModel.new(
        name: "CloseInstancePublicPorts",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SNAPSHOT = OperationModel.new(
        name: "CopySnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BUCKET = OperationModel.new(
        name: "CreateBucket",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BUCKET_ACCESS_KEY = OperationModel.new(
        name: "CreateBucketAccessKey",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CERTIFICATE = OperationModel.new(
        name: "CreateCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLOUD_FORMATION_STACK = OperationModel.new(
        name: "CreateCloudFormationStack",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTACT_METHOD = OperationModel.new(
        name: "CreateContactMethod",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTAINER_SERVICE = OperationModel.new(
        name: "CreateContainerService",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTAINER_SERVICE_DEPLOYMENT = OperationModel.new(
        name: "CreateContainerServiceDeployment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONTAINER_SERVICE_REGISTRY_LOGIN = OperationModel.new(
        name: "CreateContainerServiceRegistryLogin",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DISK = OperationModel.new(
        name: "CreateDisk",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DISK_FROM_SNAPSHOT = OperationModel.new(
        name: "CreateDiskFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DISK_SNAPSHOT = OperationModel.new(
        name: "CreateDiskSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DISTRIBUTION = OperationModel.new(
        name: "CreateDistribution",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN = OperationModel.new(
        name: "CreateDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DOMAIN_ENTRY = OperationModel.new(
        name: "CreateDomainEntry",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GUI_SESSION_ACCESS_DETAILS = OperationModel.new(
        name: "CreateGUISessionAccessDetails",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_SNAPSHOT = OperationModel.new(
        name: "CreateInstanceSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCES = OperationModel.new(
        name: "CreateInstances",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCES_FROM_SNAPSHOT = OperationModel.new(
        name: "CreateInstancesFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_KEY_PAIR = OperationModel.new(
        name: "CreateKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER = OperationModel.new(
        name: "CreateLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOAD_BALANCER_TLS_CERTIFICATE = OperationModel.new(
        name: "CreateLoadBalancerTlsCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RELATIONAL_DATABASE = OperationModel.new(
        name: "CreateRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RELATIONAL_DATABASE_FROM_SNAPSHOT = OperationModel.new(
        name: "CreateRelationalDatabaseFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RELATIONAL_DATABASE_SNAPSHOT = OperationModel.new(
        name: "CreateRelationalDatabaseSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ALARM = OperationModel.new(
        name: "DeleteAlarm",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AUTO_SNAPSHOT = OperationModel.new(
        name: "DeleteAutoSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUCKET = OperationModel.new(
        name: "DeleteBucket",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BUCKET_ACCESS_KEY = OperationModel.new(
        name: "DeleteBucketAccessKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CERTIFICATE = OperationModel.new(
        name: "DeleteCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTACT_METHOD = OperationModel.new(
        name: "DeleteContactMethod",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER_IMAGE = OperationModel.new(
        name: "DeleteContainerImage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONTAINER_SERVICE = OperationModel.new(
        name: "DeleteContainerService",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DISK = OperationModel.new(
        name: "DeleteDisk",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DISK_SNAPSHOT = OperationModel.new(
        name: "DeleteDiskSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DISTRIBUTION = OperationModel.new(
        name: "DeleteDistribution",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN = OperationModel.new(
        name: "DeleteDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DOMAIN_ENTRY = OperationModel.new(
        name: "DeleteDomainEntry",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE = OperationModel.new(
        name: "DeleteInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_SNAPSHOT = OperationModel.new(
        name: "DeleteInstanceSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_KEY_PAIR = OperationModel.new(
        name: "DeleteKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_KNOWN_HOST_KEYS = OperationModel.new(
        name: "DeleteKnownHostKeys",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER = OperationModel.new(
        name: "DeleteLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOAD_BALANCER_TLS_CERTIFICATE = OperationModel.new(
        name: "DeleteLoadBalancerTlsCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RELATIONAL_DATABASE = OperationModel.new(
        name: "DeleteRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_RELATIONAL_DATABASE_SNAPSHOT = OperationModel.new(
        name: "DeleteRelationalDatabaseSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_CERTIFICATE_FROM_DISTRIBUTION = OperationModel.new(
        name: "DetachCertificateFromDistribution",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_DISK = OperationModel.new(
        name: "DetachDisk",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_INSTANCES_FROM_LOAD_BALANCER = OperationModel.new(
        name: "DetachInstancesFromLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_STATIC_IP = OperationModel.new(
        name: "DetachStaticIp",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ADD_ON = OperationModel.new(
        name: "DisableAddOn",
        http_method: "POST",
        request_uri: "/"
      )

      DOWNLOAD_DEFAULT_KEY_PAIR = OperationModel.new(
        name: "DownloadDefaultKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ADD_ON = OperationModel.new(
        name: "EnableAddOn",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_SNAPSHOT = OperationModel.new(
        name: "ExportSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACTIVE_NAMES = OperationModel.new(
        name: "GetActiveNames",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ALARMS = OperationModel.new(
        name: "GetAlarms",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTO_SNAPSHOTS = OperationModel.new(
        name: "GetAutoSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLUEPRINTS = OperationModel.new(
        name: "GetBlueprints",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BUCKET_ACCESS_KEYS = OperationModel.new(
        name: "GetBucketAccessKeys",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BUCKET_BUNDLES = OperationModel.new(
        name: "GetBucketBundles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BUCKET_METRIC_DATA = OperationModel.new(
        name: "GetBucketMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BUCKETS = OperationModel.new(
        name: "GetBuckets",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BUNDLES = OperationModel.new(
        name: "GetBundles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CERTIFICATES = OperationModel.new(
        name: "GetCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLOUD_FORMATION_STACK_RECORDS = OperationModel.new(
        name: "GetCloudFormationStackRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTACT_METHODS = OperationModel.new(
        name: "GetContactMethods",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_API_METADATA = OperationModel.new(
        name: "GetContainerAPIMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_IMAGES = OperationModel.new(
        name: "GetContainerImages",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_LOG = OperationModel.new(
        name: "GetContainerLog",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_SERVICE_DEPLOYMENTS = OperationModel.new(
        name: "GetContainerServiceDeployments",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_SERVICE_METRIC_DATA = OperationModel.new(
        name: "GetContainerServiceMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_SERVICE_POWERS = OperationModel.new(
        name: "GetContainerServicePowers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONTAINER_SERVICES = OperationModel.new(
        name: "GetContainerServices",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COST_ESTIMATE = OperationModel.new(
        name: "GetCostEstimate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISK = OperationModel.new(
        name: "GetDisk",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISK_SNAPSHOT = OperationModel.new(
        name: "GetDiskSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISK_SNAPSHOTS = OperationModel.new(
        name: "GetDiskSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISKS = OperationModel.new(
        name: "GetDisks",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISTRIBUTION_BUNDLES = OperationModel.new(
        name: "GetDistributionBundles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISTRIBUTION_LATEST_CACHE_RESET = OperationModel.new(
        name: "GetDistributionLatestCacheReset",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISTRIBUTION_METRIC_DATA = OperationModel.new(
        name: "GetDistributionMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DISTRIBUTIONS = OperationModel.new(
        name: "GetDistributions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOMAIN = OperationModel.new(
        name: "GetDomain",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOMAINS = OperationModel.new(
        name: "GetDomains",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXPORT_SNAPSHOT_RECORDS = OperationModel.new(
        name: "GetExportSnapshotRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE = OperationModel.new(
        name: "GetInstance",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_ACCESS_DETAILS = OperationModel.new(
        name: "GetInstanceAccessDetails",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_METRIC_DATA = OperationModel.new(
        name: "GetInstanceMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_PORT_STATES = OperationModel.new(
        name: "GetInstancePortStates",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_SNAPSHOT = OperationModel.new(
        name: "GetInstanceSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_SNAPSHOTS = OperationModel.new(
        name: "GetInstanceSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_STATE = OperationModel.new(
        name: "GetInstanceState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCES = OperationModel.new(
        name: "GetInstances",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KEY_PAIR = OperationModel.new(
        name: "GetKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      GET_KEY_PAIRS = OperationModel.new(
        name: "GetKeyPairs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOAD_BALANCER = OperationModel.new(
        name: "GetLoadBalancer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOAD_BALANCER_METRIC_DATA = OperationModel.new(
        name: "GetLoadBalancerMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOAD_BALANCER_TLS_CERTIFICATES = OperationModel.new(
        name: "GetLoadBalancerTlsCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOAD_BALANCER_TLS_POLICIES = OperationModel.new(
        name: "GetLoadBalancerTlsPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LOAD_BALANCERS = OperationModel.new(
        name: "GetLoadBalancers",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPERATION = OperationModel.new(
        name: "GetOperation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPERATIONS = OperationModel.new(
        name: "GetOperations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OPERATIONS_FOR_RESOURCE = OperationModel.new(
        name: "GetOperationsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGIONS = OperationModel.new(
        name: "GetRegions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE = OperationModel.new(
        name: "GetRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_BLUEPRINTS = OperationModel.new(
        name: "GetRelationalDatabaseBlueprints",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_BUNDLES = OperationModel.new(
        name: "GetRelationalDatabaseBundles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_EVENTS = OperationModel.new(
        name: "GetRelationalDatabaseEvents",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_LOG_EVENTS = OperationModel.new(
        name: "GetRelationalDatabaseLogEvents",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_LOG_STREAMS = OperationModel.new(
        name: "GetRelationalDatabaseLogStreams",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_MASTER_USER_PASSWORD = OperationModel.new(
        name: "GetRelationalDatabaseMasterUserPassword",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_METRIC_DATA = OperationModel.new(
        name: "GetRelationalDatabaseMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_PARAMETERS = OperationModel.new(
        name: "GetRelationalDatabaseParameters",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_SNAPSHOT = OperationModel.new(
        name: "GetRelationalDatabaseSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASE_SNAPSHOTS = OperationModel.new(
        name: "GetRelationalDatabaseSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RELATIONAL_DATABASES = OperationModel.new(
        name: "GetRelationalDatabases",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SETUP_HISTORY = OperationModel.new(
        name: "GetSetupHistory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATIC_IP = OperationModel.new(
        name: "GetStaticIp",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STATIC_IPS = OperationModel.new(
        name: "GetStaticIps",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_KEY_PAIR = OperationModel.new(
        name: "ImportKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      IS_VPC_PEERED = OperationModel.new(
        name: "IsVpcPeered",
        http_method: "POST",
        request_uri: "/"
      )

      OPEN_INSTANCE_PUBLIC_PORTS = OperationModel.new(
        name: "OpenInstancePublicPorts",
        http_method: "POST",
        request_uri: "/"
      )

      PEER_VPC = OperationModel.new(
        name: "PeerVpc",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ALARM = OperationModel.new(
        name: "PutAlarm",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_INSTANCE_PUBLIC_PORTS = OperationModel.new(
        name: "PutInstancePublicPorts",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_INSTANCE = OperationModel.new(
        name: "RebootInstance",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_RELATIONAL_DATABASE = OperationModel.new(
        name: "RebootRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_CONTAINER_IMAGE = OperationModel.new(
        name: "RegisterContainerImage",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_STATIC_IP = OperationModel.new(
        name: "ReleaseStaticIp",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_DISTRIBUTION_CACHE = OperationModel.new(
        name: "ResetDistributionCache",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_CONTACT_METHOD_VERIFICATION = OperationModel.new(
        name: "SendContactMethodVerification",
        http_method: "POST",
        request_uri: "/"
      )

      SET_IP_ADDRESS_TYPE = OperationModel.new(
        name: "SetIpAddressType",
        http_method: "POST",
        request_uri: "/"
      )

      SET_RESOURCE_ACCESS_FOR_BUCKET = OperationModel.new(
        name: "SetResourceAccessForBucket",
        http_method: "POST",
        request_uri: "/"
      )

      SETUP_INSTANCE_HTTPS = OperationModel.new(
        name: "SetupInstanceHttps",
        http_method: "POST",
        request_uri: "/"
      )

      START_GUI_SESSION = OperationModel.new(
        name: "StartGUISession",
        http_method: "POST",
        request_uri: "/"
      )

      START_INSTANCE = OperationModel.new(
        name: "StartInstance",
        http_method: "POST",
        request_uri: "/"
      )

      START_RELATIONAL_DATABASE = OperationModel.new(
        name: "StartRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_GUI_SESSION = OperationModel.new(
        name: "StopGUISession",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_INSTANCE = OperationModel.new(
        name: "StopInstance",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_RELATIONAL_DATABASE = OperationModel.new(
        name: "StopRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_ALARM = OperationModel.new(
        name: "TestAlarm",
        http_method: "POST",
        request_uri: "/"
      )

      UNPEER_VPC = OperationModel.new(
        name: "UnpeerVpc",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BUCKET = OperationModel.new(
        name: "UpdateBucket",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_BUCKET_BUNDLE = OperationModel.new(
        name: "UpdateBucketBundle",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONTAINER_SERVICE = OperationModel.new(
        name: "UpdateContainerService",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DISTRIBUTION = OperationModel.new(
        name: "UpdateDistribution",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DISTRIBUTION_BUNDLE = OperationModel.new(
        name: "UpdateDistributionBundle",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DOMAIN_ENTRY = OperationModel.new(
        name: "UpdateDomainEntry",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INSTANCE_METADATA_OPTIONS = OperationModel.new(
        name: "UpdateInstanceMetadataOptions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LOAD_BALANCER_ATTRIBUTE = OperationModel.new(
        name: "UpdateLoadBalancerAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RELATIONAL_DATABASE = OperationModel.new(
        name: "UpdateRelationalDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RELATIONAL_DATABASE_PARAMETERS = OperationModel.new(
        name: "UpdateRelationalDatabaseParameters",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
