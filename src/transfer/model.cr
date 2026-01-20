module Aws
  module Transfer
    module Model
      API_VERSION = "2018-11-05"
      TARGET_PREFIX = "TransferService"
      SIGNING_NAME = "transfer"
      ENDPOINT_PREFIX = "transfer"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://transfer-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://transfer-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://transfer.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://transfer.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ACCESS = OperationModel.new(
        name: "CreateAccess",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_AGREEMENT = OperationModel.new(
        name: "CreateAgreement",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTOR = OperationModel.new(
        name: "CreateConnector",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVER = OperationModel.new(
        name: "CreateServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WEB_APP = OperationModel.new(
        name: "CreateWebApp",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKFLOW = OperationModel.new(
        name: "CreateWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACCESS = OperationModel.new(
        name: "DeleteAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_AGREEMENT = OperationModel.new(
        name: "DeleteAgreement",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CERTIFICATE = OperationModel.new(
        name: "DeleteCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTOR = OperationModel.new(
        name: "DeleteConnector",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HOST_KEY = OperationModel.new(
        name: "DeleteHostKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVER = OperationModel.new(
        name: "DeleteServer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SSH_PUBLIC_KEY = OperationModel.new(
        name: "DeleteSshPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEB_APP = OperationModel.new(
        name: "DeleteWebApp",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WEB_APP_CUSTOMIZATION = OperationModel.new(
        name: "DeleteWebAppCustomization",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKFLOW = OperationModel.new(
        name: "DeleteWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCESS = OperationModel.new(
        name: "DescribeAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGREEMENT = OperationModel.new(
        name: "DescribeAgreement",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CERTIFICATE = OperationModel.new(
        name: "DescribeCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTOR = OperationModel.new(
        name: "DescribeConnector",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXECUTION = OperationModel.new(
        name: "DescribeExecution",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HOST_KEY = OperationModel.new(
        name: "DescribeHostKey",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PROFILE = OperationModel.new(
        name: "DescribeProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_POLICY = OperationModel.new(
        name: "DescribeSecurityPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVER = OperationModel.new(
        name: "DescribeServer",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER = OperationModel.new(
        name: "DescribeUser",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WEB_APP = OperationModel.new(
        name: "DescribeWebApp",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WEB_APP_CUSTOMIZATION = OperationModel.new(
        name: "DescribeWebAppCustomization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_WORKFLOW = OperationModel.new(
        name: "DescribeWorkflow",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CERTIFICATE = OperationModel.new(
        name: "ImportCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_HOST_KEY = OperationModel.new(
        name: "ImportHostKey",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_SSH_PUBLIC_KEY = OperationModel.new(
        name: "ImportSshPublicKey",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ACCESSES = OperationModel.new(
        name: "ListAccesses",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AGREEMENTS = OperationModel.new(
        name: "ListAgreements",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CERTIFICATES = OperationModel.new(
        name: "ListCertificates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTORS = OperationModel.new(
        name: "ListConnectors",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXECUTIONS = OperationModel.new(
        name: "ListExecutions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FILE_TRANSFER_RESULTS = OperationModel.new(
        name: "ListFileTransferResults",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HOST_KEYS = OperationModel.new(
        name: "ListHostKeys",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROFILES = OperationModel.new(
        name: "ListProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SECURITY_POLICIES = OperationModel.new(
        name: "ListSecurityPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVERS = OperationModel.new(
        name: "ListServers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_USERS = OperationModel.new(
        name: "ListUsers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WEB_APPS = OperationModel.new(
        name: "ListWebApps",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKFLOWS = OperationModel.new(
        name: "ListWorkflows",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_WORKFLOW_STEP_STATE = OperationModel.new(
        name: "SendWorkflowStepState",
        http_method: "POST",
        request_uri: "/"
      )

      START_DIRECTORY_LISTING = OperationModel.new(
        name: "StartDirectoryListing",
        http_method: "POST",
        request_uri: "/"
      )

      START_FILE_TRANSFER = OperationModel.new(
        name: "StartFileTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      START_REMOTE_DELETE = OperationModel.new(
        name: "StartRemoteDelete",
        http_method: "POST",
        request_uri: "/"
      )

      START_REMOTE_MOVE = OperationModel.new(
        name: "StartRemoteMove",
        http_method: "POST",
        request_uri: "/"
      )

      START_SERVER = OperationModel.new(
        name: "StartServer",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_SERVER = OperationModel.new(
        name: "StopServer",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_CONNECTION = OperationModel.new(
        name: "TestConnection",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_IDENTITY_PROVIDER = OperationModel.new(
        name: "TestIdentityProvider",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ACCESS = OperationModel.new(
        name: "UpdateAccess",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_AGREEMENT = OperationModel.new(
        name: "UpdateAgreement",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CERTIFICATE = OperationModel.new(
        name: "UpdateCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECTOR = OperationModel.new(
        name: "UpdateConnector",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_HOST_KEY = OperationModel.new(
        name: "UpdateHostKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROFILE = OperationModel.new(
        name: "UpdateProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SERVER = OperationModel.new(
        name: "UpdateServer",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WEB_APP = OperationModel.new(
        name: "UpdateWebApp",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_WEB_APP_CUSTOMIZATION = OperationModel.new(
        name: "UpdateWebAppCustomization",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
