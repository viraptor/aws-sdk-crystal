module AwsSdk
  module Synthetics
    module Model
      API_VERSION = "2017-10-11"
      TARGET_PREFIX = ""
      SIGNING_NAME = "synthetics"
      ENDPOINT_PREFIX = "synthetics"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://synthetics-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://synthetics-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://synthetics.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://synthetics.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_RESOURCE = OperationModel.new(
        name: "AssociateResource",
        http_method: "PATCH",
        request_uri: "/group/{groupIdentifier}/associate"
      )

      CREATE_CANARY = OperationModel.new(
        name: "CreateCanary",
        http_method: "POST",
        request_uri: "/canary"
      )

      CREATE_GROUP = OperationModel.new(
        name: "CreateGroup",
        http_method: "POST",
        request_uri: "/group"
      )

      DELETE_CANARY = OperationModel.new(
        name: "DeleteCanary",
        http_method: "DELETE",
        request_uri: "/canary/{name}"
      )

      DELETE_GROUP = OperationModel.new(
        name: "DeleteGroup",
        http_method: "DELETE",
        request_uri: "/group/{groupIdentifier}"
      )

      DESCRIBE_CANARIES = OperationModel.new(
        name: "DescribeCanaries",
        http_method: "POST",
        request_uri: "/canaries"
      )

      DESCRIBE_CANARIES_LAST_RUN = OperationModel.new(
        name: "DescribeCanariesLastRun",
        http_method: "POST",
        request_uri: "/canaries/last-run"
      )

      DESCRIBE_RUNTIME_VERSIONS = OperationModel.new(
        name: "DescribeRuntimeVersions",
        http_method: "POST",
        request_uri: "/runtime-versions"
      )

      DISASSOCIATE_RESOURCE = OperationModel.new(
        name: "DisassociateResource",
        http_method: "PATCH",
        request_uri: "/group/{groupIdentifier}/disassociate"
      )

      GET_CANARY = OperationModel.new(
        name: "GetCanary",
        http_method: "GET",
        request_uri: "/canary/{name}"
      )

      GET_CANARY_RUNS = OperationModel.new(
        name: "GetCanaryRuns",
        http_method: "POST",
        request_uri: "/canary/{name}/runs"
      )

      GET_GROUP = OperationModel.new(
        name: "GetGroup",
        http_method: "GET",
        request_uri: "/group/{groupIdentifier}"
      )

      LIST_ASSOCIATED_GROUPS = OperationModel.new(
        name: "ListAssociatedGroups",
        http_method: "POST",
        request_uri: "/resource/{resourceArn}/groups"
      )

      LIST_GROUP_RESOURCES = OperationModel.new(
        name: "ListGroupResources",
        http_method: "POST",
        request_uri: "/group/{groupIdentifier}/resources"
      )

      LIST_GROUPS = OperationModel.new(
        name: "ListGroups",
        http_method: "POST",
        request_uri: "/groups"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_CANARY = OperationModel.new(
        name: "StartCanary",
        http_method: "POST",
        request_uri: "/canary/{name}/start"
      )

      START_CANARY_DRY_RUN = OperationModel.new(
        name: "StartCanaryDryRun",
        http_method: "POST",
        request_uri: "/canary/{name}/dry-run/start"
      )

      STOP_CANARY = OperationModel.new(
        name: "StopCanary",
        http_method: "POST",
        request_uri: "/canary/{name}/stop"
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

      UPDATE_CANARY = OperationModel.new(
        name: "UpdateCanary",
        http_method: "PATCH",
        request_uri: "/canary/{name}"
      )
    end
  end
end
