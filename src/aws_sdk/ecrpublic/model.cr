module AwsSdk
  module ECRPUBLIC
    module Model
      API_VERSION = "2020-10-30"
      TARGET_PREFIX = "SpencerFrontendService"
      SIGNING_NAME = "ecr-public"
      ENDPOINT_PREFIX = "api.ecr-public"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.ecr-public-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.ecr-public-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://ecr-public.{Region}.api.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://api.ecr-public.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.ecr-public.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CHECK_LAYER_AVAILABILITY = OperationModel.new(
        name: "BatchCheckLayerAvailability",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DELETE_IMAGE = OperationModel.new(
        name: "BatchDeleteImage",
        http_method: "POST",
        request_uri: "/"
      )

      COMPLETE_LAYER_UPLOAD = OperationModel.new(
        name: "CompleteLayerUpload",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY = OperationModel.new(
        name: "CreateRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY = OperationModel.new(
        name: "DeleteRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY_POLICY = OperationModel.new(
        name: "DeleteRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_TAGS = OperationModel.new(
        name: "DescribeImageTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGES = OperationModel.new(
        name: "DescribeImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRIES = OperationModel.new(
        name: "DescribeRegistries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPOSITORIES = OperationModel.new(
        name: "DescribeRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTHORIZATION_TOKEN = OperationModel.new(
        name: "GetAuthorizationToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGISTRY_CATALOG_DATA = OperationModel.new(
        name: "GetRegistryCatalogData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_CATALOG_DATA = OperationModel.new(
        name: "GetRepositoryCatalogData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_POLICY = OperationModel.new(
        name: "GetRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      INITIATE_LAYER_UPLOAD = OperationModel.new(
        name: "InitiateLayerUpload",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IMAGE = OperationModel.new(
        name: "PutImage",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REGISTRY_CATALOG_DATA = OperationModel.new(
        name: "PutRegistryCatalogData",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REPOSITORY_CATALOG_DATA = OperationModel.new(
        name: "PutRepositoryCatalogData",
        http_method: "POST",
        request_uri: "/"
      )

      SET_REPOSITORY_POLICY = OperationModel.new(
        name: "SetRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_LAYER_PART = OperationModel.new(
        name: "UploadLayerPart",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
