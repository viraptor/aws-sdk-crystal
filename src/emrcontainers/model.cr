module Aws
  module EMRContainers
    module Model
      API_VERSION = "2020-10-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "emr-containers"
      ENDPOINT_PREFIX = "emr-containers"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://emr-containers-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-east-1"]}],"endpoint":{"url":"https://emr-containers.us-gov-east-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://emr-containers.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://emr-containers-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://emr-containers.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://emr-containers.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_JOB_RUN = OperationModel.new(
        name: "CancelJobRun",
        http_method: "DELETE",
        request_uri: "/virtualclusters/{virtualClusterId}/jobruns/{jobRunId}"
      )

      CREATE_JOB_TEMPLATE = OperationModel.new(
        name: "CreateJobTemplate",
        http_method: "POST",
        request_uri: "/jobtemplates"
      )

      CREATE_MANAGED_ENDPOINT = OperationModel.new(
        name: "CreateManagedEndpoint",
        http_method: "POST",
        request_uri: "/virtualclusters/{virtualClusterId}/endpoints"
      )

      CREATE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "CreateSecurityConfiguration",
        http_method: "POST",
        request_uri: "/securityconfigurations"
      )

      CREATE_VIRTUAL_CLUSTER = OperationModel.new(
        name: "CreateVirtualCluster",
        http_method: "POST",
        request_uri: "/virtualclusters"
      )

      DELETE_JOB_TEMPLATE = OperationModel.new(
        name: "DeleteJobTemplate",
        http_method: "DELETE",
        request_uri: "/jobtemplates/{templateId}"
      )

      DELETE_MANAGED_ENDPOINT = OperationModel.new(
        name: "DeleteManagedEndpoint",
        http_method: "DELETE",
        request_uri: "/virtualclusters/{virtualClusterId}/endpoints/{endpointId}"
      )

      DELETE_VIRTUAL_CLUSTER = OperationModel.new(
        name: "DeleteVirtualCluster",
        http_method: "DELETE",
        request_uri: "/virtualclusters/{virtualClusterId}"
      )

      DESCRIBE_JOB_RUN = OperationModel.new(
        name: "DescribeJobRun",
        http_method: "GET",
        request_uri: "/virtualclusters/{virtualClusterId}/jobruns/{jobRunId}"
      )

      DESCRIBE_JOB_TEMPLATE = OperationModel.new(
        name: "DescribeJobTemplate",
        http_method: "GET",
        request_uri: "/jobtemplates/{templateId}"
      )

      DESCRIBE_MANAGED_ENDPOINT = OperationModel.new(
        name: "DescribeManagedEndpoint",
        http_method: "GET",
        request_uri: "/virtualclusters/{virtualClusterId}/endpoints/{endpointId}"
      )

      DESCRIBE_SECURITY_CONFIGURATION = OperationModel.new(
        name: "DescribeSecurityConfiguration",
        http_method: "GET",
        request_uri: "/securityconfigurations/{securityConfigurationId}"
      )

      DESCRIBE_VIRTUAL_CLUSTER = OperationModel.new(
        name: "DescribeVirtualCluster",
        http_method: "GET",
        request_uri: "/virtualclusters/{virtualClusterId}"
      )

      GET_MANAGED_ENDPOINT_SESSION_CREDENTIALS = OperationModel.new(
        name: "GetManagedEndpointSessionCredentials",
        http_method: "POST",
        request_uri: "/virtualclusters/{virtualClusterId}/endpoints/{endpointId}/credentials"
      )

      LIST_JOB_RUNS = OperationModel.new(
        name: "ListJobRuns",
        http_method: "GET",
        request_uri: "/virtualclusters/{virtualClusterId}/jobruns"
      )

      LIST_JOB_TEMPLATES = OperationModel.new(
        name: "ListJobTemplates",
        http_method: "GET",
        request_uri: "/jobtemplates"
      )

      LIST_MANAGED_ENDPOINTS = OperationModel.new(
        name: "ListManagedEndpoints",
        http_method: "GET",
        request_uri: "/virtualclusters/{virtualClusterId}/endpoints"
      )

      LIST_SECURITY_CONFIGURATIONS = OperationModel.new(
        name: "ListSecurityConfigurations",
        http_method: "GET",
        request_uri: "/securityconfigurations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      LIST_VIRTUAL_CLUSTERS = OperationModel.new(
        name: "ListVirtualClusters",
        http_method: "GET",
        request_uri: "/virtualclusters"
      )

      START_JOB_RUN = OperationModel.new(
        name: "StartJobRun",
        http_method: "POST",
        request_uri: "/virtualclusters/{virtualClusterId}/jobruns"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )
    end
  end
end
