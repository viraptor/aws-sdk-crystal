module Aws
  module DirectoryService
    module Model
      API_VERSION = "2015-04-16"
      TARGET_PREFIX = "DirectoryService_20150416"
      SIGNING_NAME = "ds"
      ENDPOINT_PREFIX = "ds"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ds-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ds.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ds.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_SHARED_DIRECTORY = OperationModel.new(
        name: "AcceptSharedDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_IP_ROUTES = OperationModel.new(
        name: "AddIpRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_REGION = OperationModel.new(
        name: "AddRegion",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_SCHEMA_EXTENSION = OperationModel.new(
        name: "CancelSchemaExtension",
        http_method: "POST",
        request_uri: "/"
      )

      CONNECT_DIRECTORY = OperationModel.new(
        name: "ConnectDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ALIAS = OperationModel.new(
        name: "CreateAlias",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMPUTER = OperationModel.new(
        name: "CreateComputer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONDITIONAL_FORWARDER = OperationModel.new(
        name: "CreateConditionalForwarder",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DIRECTORY = OperationModel.new(
        name: "CreateDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HYBRID_AD = OperationModel.new(
        name: "CreateHybridAD",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOG_SUBSCRIPTION = OperationModel.new(
        name: "CreateLogSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MICROSOFT_AD = OperationModel.new(
        name: "CreateMicrosoftAD",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRUST = OperationModel.new(
        name: "CreateTrust",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AD_ASSESSMENT = OperationModel.new(
        name: "DeleteADAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONDITIONAL_FORWARDER = OperationModel.new(
        name: "DeleteConditionalForwarder",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DIRECTORY = OperationModel.new(
        name: "DeleteDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOG_SUBSCRIPTION = OperationModel.new(
        name: "DeleteLogSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRUST = OperationModel.new(
        name: "DeleteTrust",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_CERTIFICATE = OperationModel.new(
        name: "DeregisterCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_EVENT_TOPIC = OperationModel.new(
        name: "DeregisterEventTopic",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AD_ASSESSMENT = OperationModel.new(
        name: "DescribeADAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CA_ENROLLMENT_POLICY = OperationModel.new(
        name: "DescribeCAEnrollmentPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATE = OperationModel.new(
        name: "DescribeCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_AUTHENTICATION_SETTINGS = OperationModel.new(
        name: "DescribeClientAuthenticationSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONDITIONAL_FORWARDERS = OperationModel.new(
        name: "DescribeConditionalForwarders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECTORIES = OperationModel.new(
        name: "DescribeDirectories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECTORY_DATA_ACCESS = OperationModel.new(
        name: "DescribeDirectoryDataAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DOMAIN_CONTROLLERS = OperationModel.new(
        name: "DescribeDomainControllers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_TOPICS = OperationModel.new(
        name: "DescribeEventTopics",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HYBRID_AD_UPDATE = OperationModel.new(
        name: "DescribeHybridADUpdate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LDAPS_SETTINGS = OperationModel.new(
        name: "DescribeLDAPSSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGIONS = OperationModel.new(
        name: "DescribeRegions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SETTINGS = OperationModel.new(
        name: "DescribeSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SHARED_DIRECTORIES = OperationModel.new(
        name: "DescribeSharedDirectories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOTS = OperationModel.new(
        name: "DescribeSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUSTS = OperationModel.new(
        name: "DescribeTrusts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_UPDATE_DIRECTORY = OperationModel.new(
        name: "DescribeUpdateDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_CA_ENROLLMENT_POLICY = OperationModel.new(
        name: "DisableCAEnrollmentPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_CLIENT_AUTHENTICATION = OperationModel.new(
        name: "DisableClientAuthentication",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_DIRECTORY_DATA_ACCESS = OperationModel.new(
        name: "DisableDirectoryDataAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_LDAPS = OperationModel.new(
        name: "DisableLDAPS",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_RADIUS = OperationModel.new(
        name: "DisableRadius",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_SSO = OperationModel.new(
        name: "DisableSso",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_CA_ENROLLMENT_POLICY = OperationModel.new(
        name: "EnableCAEnrollmentPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_CLIENT_AUTHENTICATION = OperationModel.new(
        name: "EnableClientAuthentication",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_DIRECTORY_DATA_ACCESS = OperationModel.new(
        name: "EnableDirectoryDataAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_LDAPS = OperationModel.new(
        name: "EnableLDAPS",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_RADIUS = OperationModel.new(
        name: "EnableRadius",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_SSO = OperationModel.new(
        name: "EnableSso",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DIRECTORY_LIMITS = OperationModel.new(
        name: "GetDirectoryLimits",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SNAPSHOT_LIMITS = OperationModel.new(
        name: "GetSnapshotLimits",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AD_ASSESSMENTS = OperationModel.new(
        name: "ListADAssessments",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CERTIFICATES = OperationModel.new(
        name: "ListCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IP_ROUTES = OperationModel.new(
        name: "ListIpRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LOG_SUBSCRIPTIONS = OperationModel.new(
        name: "ListLogSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SCHEMA_EXTENSIONS = OperationModel.new(
        name: "ListSchemaExtensions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_CERTIFICATE = OperationModel.new(
        name: "RegisterCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_EVENT_TOPIC = OperationModel.new(
        name: "RegisterEventTopic",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_SHARED_DIRECTORY = OperationModel.new(
        name: "RejectSharedDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_IP_ROUTES = OperationModel.new(
        name: "RemoveIpRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_REGION = OperationModel.new(
        name: "RemoveRegion",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_USER_PASSWORD = OperationModel.new(
        name: "ResetUserPassword",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      SHARE_DIRECTORY = OperationModel.new(
        name: "ShareDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      START_AD_ASSESSMENT = OperationModel.new(
        name: "StartADAssessment",
        http_method: "POST",
        request_uri: "/"
      )

      START_SCHEMA_EXTENSION = OperationModel.new(
        name: "StartSchemaExtension",
        http_method: "POST",
        request_uri: "/"
      )

      UNSHARE_DIRECTORY = OperationModel.new(
        name: "UnshareDirectory",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONDITIONAL_FORWARDER = OperationModel.new(
        name: "UpdateConditionalForwarder",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DIRECTORY_SETUP = OperationModel.new(
        name: "UpdateDirectorySetup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HYBRID_AD = OperationModel.new(
        name: "UpdateHybridAD",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_NUMBER_OF_DOMAIN_CONTROLLERS = OperationModel.new(
        name: "UpdateNumberOfDomainControllers",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_RADIUS = OperationModel.new(
        name: "UpdateRadius",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SETTINGS = OperationModel.new(
        name: "UpdateSettings",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRUST = OperationModel.new(
        name: "UpdateTrust",
        http_method: "POST",
        request_uri: "/"
      )

      VERIFY_TRUST = OperationModel.new(
        name: "VerifyTrust",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
