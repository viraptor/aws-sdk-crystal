module AwsSdk
  module MediaPackage
    module Model
      API_VERSION = "2017-10-12"
      TARGET_PREFIX = ""
      SIGNING_NAME = "mediapackage"
      ENDPOINT_PREFIX = "mediapackage"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mediapackage.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mediapackage.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CONFIGURE_LOGS = OperationModel.new(
        name: "ConfigureLogs",
        http_method: "PUT",
        request_uri: "/channels/{id}/configure_logs"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/channels"
      )

      CREATE_HARVEST_JOB = OperationModel.new(
        name: "CreateHarvestJob",
        http_method: "POST",
        request_uri: "/harvest_jobs"
      )

      CREATE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "CreateOriginEndpoint",
        http_method: "POST",
        request_uri: "/origin_endpoints"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "DELETE",
        request_uri: "/channels/{id}"
      )

      DELETE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "DeleteOriginEndpoint",
        http_method: "DELETE",
        request_uri: "/origin_endpoints/{id}"
      )

      DESCRIBE_CHANNEL = OperationModel.new(
        name: "DescribeChannel",
        http_method: "GET",
        request_uri: "/channels/{id}"
      )

      DESCRIBE_HARVEST_JOB = OperationModel.new(
        name: "DescribeHarvestJob",
        http_method: "GET",
        request_uri: "/harvest_jobs/{id}"
      )

      DESCRIBE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "DescribeOriginEndpoint",
        http_method: "GET",
        request_uri: "/origin_endpoints/{id}"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "GET",
        request_uri: "/channels"
      )

      LIST_HARVEST_JOBS = OperationModel.new(
        name: "ListHarvestJobs",
        http_method: "GET",
        request_uri: "/harvest_jobs"
      )

      LIST_ORIGIN_ENDPOINTS = OperationModel.new(
        name: "ListOriginEndpoints",
        http_method: "GET",
        request_uri: "/origin_endpoints"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resource-arn}"
      )

      ROTATE_CHANNEL_CREDENTIALS = OperationModel.new(
        name: "RotateChannelCredentials",
        http_method: "PUT",
        request_uri: "/channels/{id}/credentials"
      )

      ROTATE_INGEST_ENDPOINT_CREDENTIALS = OperationModel.new(
        name: "RotateIngestEndpointCredentials",
        http_method: "PUT",
        request_uri: "/channels/{id}/ingest_endpoints/{ingest_endpoint_id}/credentials"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resource-arn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resource-arn}"
      )

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "PUT",
        request_uri: "/channels/{id}"
      )

      UPDATE_ORIGIN_ENDPOINT = OperationModel.new(
        name: "UpdateOriginEndpoint",
        http_method: "PUT",
        request_uri: "/origin_endpoints/{id}"
      )
    end
  end
end
