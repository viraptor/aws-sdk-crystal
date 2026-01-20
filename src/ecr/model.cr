module Aws
  module ECR
    module Model
      API_VERSION = "2015-09-21"
      TARGET_PREFIX = "AmazonEC2ContainerRegistry_V20150921"
      SIGNING_NAME = "ecr"
      ENDPOINT_PREFIX = "api.ecr"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-cn"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-b"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-e"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-iso-f"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-eusc"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.ecr-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://api.ecr.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
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

      BATCH_GET_IMAGE = OperationModel.new(
        name: "BatchGetImage",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_REPOSITORY_SCANNING_CONFIGURATION = OperationModel.new(
        name: "BatchGetRepositoryScanningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      COMPLETE_LAYER_UPLOAD = OperationModel.new(
        name: "CompleteLayerUpload",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PULL_THROUGH_CACHE_RULE = OperationModel.new(
        name: "CreatePullThroughCacheRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY = OperationModel.new(
        name: "CreateRepository",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY_CREATION_TEMPLATE = OperationModel.new(
        name: "CreateRepositoryCreationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LIFECYCLE_POLICY = OperationModel.new(
        name: "DeleteLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PULL_THROUGH_CACHE_RULE = OperationModel.new(
        name: "DeletePullThroughCacheRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REGISTRY_POLICY = OperationModel.new(
        name: "DeleteRegistryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY = OperationModel.new(
        name: "DeleteRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY_CREATION_TEMPLATE = OperationModel.new(
        name: "DeleteRepositoryCreationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY_POLICY = OperationModel.new(
        name: "DeleteRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SIGNING_CONFIGURATION = OperationModel.new(
        name: "DeleteSigningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_PULL_TIME_UPDATE_EXCLUSION = OperationModel.new(
        name: "DeregisterPullTimeUpdateExclusion",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_REPLICATION_STATUS = OperationModel.new(
        name: "DescribeImageReplicationStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_SCAN_FINDINGS = OperationModel.new(
        name: "DescribeImageScanFindings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_SIGNING_STATUS = OperationModel.new(
        name: "DescribeImageSigningStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGES = OperationModel.new(
        name: "DescribeImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PULL_THROUGH_CACHE_RULES = OperationModel.new(
        name: "DescribePullThroughCacheRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGISTRY = OperationModel.new(
        name: "DescribeRegistry",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPOSITORIES = OperationModel.new(
        name: "DescribeRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPOSITORY_CREATION_TEMPLATES = OperationModel.new(
        name: "DescribeRepositoryCreationTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACCOUNT_SETTING = OperationModel.new(
        name: "GetAccountSetting",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTHORIZATION_TOKEN = OperationModel.new(
        name: "GetAuthorizationToken",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DOWNLOAD_URL_FOR_LAYER = OperationModel.new(
        name: "GetDownloadUrlForLayer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LIFECYCLE_POLICY = OperationModel.new(
        name: "GetLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LIFECYCLE_POLICY_PREVIEW = OperationModel.new(
        name: "GetLifecyclePolicyPreview",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGISTRY_POLICY = OperationModel.new(
        name: "GetRegistryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REGISTRY_SCANNING_CONFIGURATION = OperationModel.new(
        name: "GetRegistryScanningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_POLICY = OperationModel.new(
        name: "GetRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SIGNING_CONFIGURATION = OperationModel.new(
        name: "GetSigningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      INITIATE_LAYER_UPLOAD = OperationModel.new(
        name: "InitiateLayerUpload",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMAGE_REFERRERS = OperationModel.new(
        name: "ListImageReferrers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMAGES = OperationModel.new(
        name: "ListImages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PULL_TIME_UPDATE_EXCLUSIONS = OperationModel.new(
        name: "ListPullTimeUpdateExclusions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_ACCOUNT_SETTING = OperationModel.new(
        name: "PutAccountSetting",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IMAGE = OperationModel.new(
        name: "PutImage",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IMAGE_SCANNING_CONFIGURATION = OperationModel.new(
        name: "PutImageScanningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_IMAGE_TAG_MUTABILITY = OperationModel.new(
        name: "PutImageTagMutability",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_LIFECYCLE_POLICY = OperationModel.new(
        name: "PutLifecyclePolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REGISTRY_POLICY = OperationModel.new(
        name: "PutRegistryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REGISTRY_SCANNING_CONFIGURATION = OperationModel.new(
        name: "PutRegistryScanningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REPLICATION_CONFIGURATION = OperationModel.new(
        name: "PutReplicationConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_SIGNING_CONFIGURATION = OperationModel.new(
        name: "PutSigningConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_PULL_TIME_UPDATE_EXCLUSION = OperationModel.new(
        name: "RegisterPullTimeUpdateExclusion",
        http_method: "POST",
        request_uri: "/"
      )

      SET_REPOSITORY_POLICY = OperationModel.new(
        name: "SetRepositoryPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      START_IMAGE_SCAN = OperationModel.new(
        name: "StartImageScan",
        http_method: "POST",
        request_uri: "/"
      )

      START_LIFECYCLE_POLICY_PREVIEW = OperationModel.new(
        name: "StartLifecyclePolicyPreview",
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

      UPDATE_IMAGE_STORAGE_CLASS = OperationModel.new(
        name: "UpdateImageStorageClass",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_THROUGH_CACHE_RULE = OperationModel.new(
        name: "UpdatePullThroughCacheRule",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPOSITORY_CREATION_TEMPLATE = OperationModel.new(
        name: "UpdateRepositoryCreationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      UPLOAD_LAYER_PART = OperationModel.new(
        name: "UploadLayerPart",
        http_method: "POST",
        request_uri: "/"
      )

      VALIDATE_PULL_THROUGH_CACHE_RULE = OperationModel.new(
        name: "ValidatePullThroughCacheRule",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
