module AwsSdk
  module ElasticBeanstalk
    module Model
      API_VERSION = "2010-12-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "elasticbeanstalk"
      ENDPOINT_PREFIX = "elasticbeanstalk"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticbeanstalk-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://elasticbeanstalk.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://elasticbeanstalk-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticbeanstalk.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://elasticbeanstalk.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ABORT_ENVIRONMENT_UPDATE = OperationModel.new(
        name: "AbortEnvironmentUpdate",
        http_method: "POST",
        request_uri: "/"
      )

      APPLY_ENVIRONMENT_MANAGED_ACTION = OperationModel.new(
        name: "ApplyEnvironmentManagedAction",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_ENVIRONMENT_OPERATIONS_ROLE = OperationModel.new(
        name: "AssociateEnvironmentOperationsRole",
        http_method: "POST",
        request_uri: "/"
      )

      CHECK_DNS_AVAILABILITY = OperationModel.new(
        name: "CheckDNSAvailability",
        http_method: "POST",
        request_uri: "/"
      )

      COMPOSE_ENVIRONMENTS = OperationModel.new(
        name: "ComposeEnvironments",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION_VERSION = OperationModel.new(
        name: "CreateApplicationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "CreateConfigurationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLATFORM_VERSION = OperationModel.new(
        name: "CreatePlatformVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STORAGE_LOCATION = OperationModel.new(
        name: "CreateStorageLocation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION_VERSION = OperationModel.new(
        name: "DeleteApplicationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "DeleteConfigurationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENVIRONMENT_CONFIGURATION = OperationModel.new(
        name: "DeleteEnvironmentConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PLATFORM_VERSION = OperationModel.new(
        name: "DeletePlatformVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ATTRIBUTES = OperationModel.new(
        name: "DescribeAccountAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_VERSIONS = OperationModel.new(
        name: "DescribeApplicationVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATIONS = OperationModel.new(
        name: "DescribeApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_OPTIONS = OperationModel.new(
        name: "DescribeConfigurationOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONFIGURATION_SETTINGS = OperationModel.new(
        name: "DescribeConfigurationSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENVIRONMENT_HEALTH = OperationModel.new(
        name: "DescribeEnvironmentHealth",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENVIRONMENT_MANAGED_ACTION_HISTORY = OperationModel.new(
        name: "DescribeEnvironmentManagedActionHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENVIRONMENT_MANAGED_ACTIONS = OperationModel.new(
        name: "DescribeEnvironmentManagedActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENVIRONMENT_RESOURCES = OperationModel.new(
        name: "DescribeEnvironmentResources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENVIRONMENTS = OperationModel.new(
        name: "DescribeEnvironments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCES_HEALTH = OperationModel.new(
        name: "DescribeInstancesHealth",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PLATFORM_VERSION = OperationModel.new(
        name: "DescribePlatformVersion",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ENVIRONMENT_OPERATIONS_ROLE = OperationModel.new(
        name: "DisassociateEnvironmentOperationsRole",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AVAILABLE_SOLUTION_STACKS = OperationModel.new(
        name: "ListAvailableSolutionStacks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PLATFORM_BRANCHES = OperationModel.new(
        name: "ListPlatformBranches",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PLATFORM_VERSIONS = OperationModel.new(
        name: "ListPlatformVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REBUILD_ENVIRONMENT = OperationModel.new(
        name: "RebuildEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_ENVIRONMENT_INFO = OperationModel.new(
        name: "RequestEnvironmentInfo",
        http_method: "POST",
        request_uri: "/"
      )

      RESTART_APP_SERVER = OperationModel.new(
        name: "RestartAppServer",
        http_method: "POST",
        request_uri: "/"
      )

      RETRIEVE_ENVIRONMENT_INFO = OperationModel.new(
        name: "RetrieveEnvironmentInfo",
        http_method: "POST",
        request_uri: "/"
      )

      SWAP_ENVIRONMENT_CNAM_ES = OperationModel.new(
        name: "SwapEnvironmentCNAMEs",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_ENVIRONMENT = OperationModel.new(
        name: "TerminateEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION_RESOURCE_LIFECYCLE = OperationModel.new(
        name: "UpdateApplicationResourceLifecycle",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION_VERSION = OperationModel.new(
        name: "UpdateApplicationVersion",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONFIGURATION_TEMPLATE = OperationModel.new(
        name: "UpdateConfigurationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "UpdateTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_CONFIGURATION_SETTINGS = OperationModel.new(
        name: "ValidateConfigurationSettings",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
