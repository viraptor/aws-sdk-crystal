module AwsSdk
  module KeyspacesStreams
    module Model
      API_VERSION = "2024-09-09"
      TARGET_PREFIX = "KeyspacesStreams"
      SIGNING_NAME = "cassandra"
      ENDPOINT_PREFIX = "cassandra-streams"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://cassandra-streams-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://cassandra-streams.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      GET_RECORDS = OperationModel.new(
        name: "GetRecords",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SHARD_ITERATOR = OperationModel.new(
        name: "GetShardIterator",
        http_method: "POST",
        request_uri: "/"
      )

      GET_STREAM = OperationModel.new(
        name: "GetStream",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_STREAMS = OperationModel.new(
        name: "ListStreams",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
