module Aws
  module B2bi
    module Model
      API_VERSION = "2022-06-23"
      TARGET_PREFIX = "B2BI"
      SIGNING_NAME = "b2bi"
      ENDPOINT_PREFIX = "b2bi"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://b2bi-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://b2bi-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://b2bi.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://b2bi.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CAPABILITY = OperationModel.new(
        name: "CreateCapability",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARTNERSHIP = OperationModel.new(
        name: "CreatePartnership",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STARTER_MAPPING_TEMPLATE = OperationModel.new(
        name: "CreateStarterMappingTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSFORMER = OperationModel.new(
        name: "CreateTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAPABILITY = OperationModel.new(
        name: "DeleteCapability",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARTNERSHIP = OperationModel.new(
        name: "DeletePartnership",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSFORMER = OperationModel.new(
        name: "DeleteTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      GENERATE_MAPPING = OperationModel.new(
        name: "GenerateMapping",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPABILITY = OperationModel.new(
        name: "GetCapability",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PARTNERSHIP = OperationModel.new(
        name: "GetPartnership",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PROFILE = OperationModel.new(
        name: "GetProfile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSFORMER = OperationModel.new(
        name: "GetTransformer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSFORMER_JOB = OperationModel.new(
        name: "GetTransformerJob",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CAPABILITIES = OperationModel.new(
        name: "ListCapabilities",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PARTNERSHIPS = OperationModel.new(
        name: "ListPartnerships",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROFILES = OperationModel.new(
        name: "ListProfiles",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TRANSFORMERS = OperationModel.new(
        name: "ListTransformers",
        http_method: "POST",
        request_uri: "/"
      )

      START_TRANSFORMER_JOB = OperationModel.new(
        name: "StartTransformerJob",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_CONVERSION = OperationModel.new(
        name: "TestConversion",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_MAPPING = OperationModel.new(
        name: "TestMapping",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_PARSING = OperationModel.new(
        name: "TestParsing",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CAPABILITY = OperationModel.new(
        name: "UpdateCapability",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARTNERSHIP = OperationModel.new(
        name: "UpdatePartnership",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PROFILE = OperationModel.new(
        name: "UpdateProfile",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_TRANSFORMER = OperationModel.new(
        name: "UpdateTransformer",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
