module Aws
  module Health
    module Model
      API_VERSION = "2016-08-04"
      TARGET_PREFIX = "AWSHealth_20160804"
      SIGNING_NAME = "health"
      ENDPOINT_PREFIX = "health"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]},{"fn":"isSet","argv":[{"ref":"Region"}]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://health-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://health.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://health-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://health-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://health.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"aws-global"]}],"endpoint":{"url":"https://global.health.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"health","signingRegion":"us-east-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"aws-cn-global"]}],"endpoint":{"url":"https://global.health.amazonaws.com.cn","properties":{"authSchemes":[{"name":"sigv4","signingName":"health","signingRegion":"cn-northwest-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://health.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DESCRIBE_AFFECTED_ACCOUNTS_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeAffectedAccountsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AFFECTED_ENTITIES = OperationModel.new(
        name: "DescribeAffectedEntities",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AFFECTED_ENTITIES_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeAffectedEntitiesForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITY_AGGREGATES = OperationModel.new(
        name: "DescribeEntityAggregates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITY_AGGREGATES_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeEntityAggregatesForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_AGGREGATES = OperationModel.new(
        name: "DescribeEventAggregates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_DETAILS = OperationModel.new(
        name: "DescribeEventDetails",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_DETAILS_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeEventDetailsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_TYPES = OperationModel.new(
        name: "DescribeEventTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeEventsForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HEALTH_SERVICE_STATUS_FOR_ORGANIZATION = OperationModel.new(
        name: "DescribeHealthServiceStatusForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_HEALTH_SERVICE_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "DisableHealthServiceAccessForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_HEALTH_SERVICE_ACCESS_FOR_ORGANIZATION = OperationModel.new(
        name: "EnableHealthServiceAccessForOrganization",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
