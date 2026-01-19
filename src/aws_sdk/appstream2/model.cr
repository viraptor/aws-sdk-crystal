module AwsSdk
  module AppStream
    module Model
      API_VERSION = "2016-12-01"
      TARGET_PREFIX = "PhotonAdminProxyService"
      SIGNING_NAME = "appstream"
      ENDPOINT_PREFIX = "appstream2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appstream2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appstream2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://appstream2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":["aws",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://appstream2.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":["aws-us-gov",{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]}]}],"endpoint":{"url":"https://appstream2.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://appstream2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_APP_BLOCK_BUILDER_APP_BLOCK = OperationModel.new(
        name: "AssociateAppBlockBuilderAppBlock",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_APPLICATION_FLEET = OperationModel.new(
        name: "AssociateApplicationFleet",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_APPLICATION_TO_ENTITLEMENT = OperationModel.new(
        name: "AssociateApplicationToEntitlement",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_FLEET = OperationModel.new(
        name: "AssociateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SOFTWARE_TO_IMAGE_BUILDER = OperationModel.new(
        name: "AssociateSoftwareToImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_ASSOCIATE_USER_STACK = OperationModel.new(
        name: "BatchAssociateUserStack",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DISASSOCIATE_USER_STACK = OperationModel.new(
        name: "BatchDisassociateUserStack",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_IMAGE = OperationModel.new(
        name: "CopyImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP_BLOCK = OperationModel.new(
        name: "CreateAppBlock",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP_BLOCK_BUILDER = OperationModel.new(
        name: "CreateAppBlockBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APP_BLOCK_BUILDER_STREAMING_URL = OperationModel.new(
        name: "CreateAppBlockBuilderStreamingURL",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DIRECTORY_CONFIG = OperationModel.new(
        name: "CreateDirectoryConfig",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ENTITLEMENT = OperationModel.new(
        name: "CreateEntitlement",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EXPORT_IMAGE_TASK = OperationModel.new(
        name: "CreateExportImageTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE_BUILDER = OperationModel.new(
        name: "CreateImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE_BUILDER_STREAMING_URL = OperationModel.new(
        name: "CreateImageBuilderStreamingURL",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMPORTED_IMAGE = OperationModel.new(
        name: "CreateImportedImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STACK = OperationModel.new(
        name: "CreateStack",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STREAMING_URL = OperationModel.new(
        name: "CreateStreamingURL",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_THEME_FOR_STACK = OperationModel.new(
        name: "CreateThemeForStack",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_UPDATED_IMAGE = OperationModel.new(
        name: "CreateUpdatedImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USAGE_REPORT_SUBSCRIPTION = OperationModel.new(
        name: "CreateUsageReportSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APP_BLOCK = OperationModel.new(
        name: "DeleteAppBlock",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APP_BLOCK_BUILDER = OperationModel.new(
        name: "DeleteAppBlockBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DIRECTORY_CONFIG = OperationModel.new(
        name: "DeleteDirectoryConfig",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ENTITLEMENT = OperationModel.new(
        name: "DeleteEntitlement",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEET = OperationModel.new(
        name: "DeleteFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE = OperationModel.new(
        name: "DeleteImage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE_BUILDER = OperationModel.new(
        name: "DeleteImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE_PERMISSIONS = OperationModel.new(
        name: "DeleteImagePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_STACK = OperationModel.new(
        name: "DeleteStack",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_THEME_FOR_STACK = OperationModel.new(
        name: "DeleteThemeForStack",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USAGE_REPORT_SUBSCRIPTION = OperationModel.new(
        name: "DeleteUsageReportSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP_BLOCK_BUILDER_APP_BLOCK_ASSOCIATIONS = OperationModel.new(
        name: "DescribeAppBlockBuilderAppBlockAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP_BLOCK_BUILDERS = OperationModel.new(
        name: "DescribeAppBlockBuilders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP_BLOCKS = OperationModel.new(
        name: "DescribeAppBlocks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APP_LICENSE_USAGE = OperationModel.new(
        name: "DescribeAppLicenseUsage",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_FLEET_ASSOCIATIONS = OperationModel.new(
        name: "DescribeApplicationFleetAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATIONS = OperationModel.new(
        name: "DescribeApplications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECTORY_CONFIGS = OperationModel.new(
        name: "DescribeDirectoryConfigs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENTITLEMENTS = OperationModel.new(
        name: "DescribeEntitlements",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEETS = OperationModel.new(
        name: "DescribeFleets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_BUILDERS = OperationModel.new(
        name: "DescribeImageBuilders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_PERMISSIONS = OperationModel.new(
        name: "DescribeImagePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGES = OperationModel.new(
        name: "DescribeImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SESSIONS = OperationModel.new(
        name: "DescribeSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SOFTWARE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeSoftwareAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STACKS = OperationModel.new(
        name: "DescribeStacks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_THEME_FOR_STACK = OperationModel.new(
        name: "DescribeThemeForStack",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USAGE_REPORT_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeUsageReportSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_STACK_ASSOCIATIONS = OperationModel.new(
        name: "DescribeUserStackAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USERS = OperationModel.new(
        name: "DescribeUsers",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_USER = OperationModel.new(
        name: "DisableUser",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_APP_BLOCK_BUILDER_APP_BLOCK = OperationModel.new(
        name: "DisassociateAppBlockBuilderAppBlock",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_APPLICATION_FLEET = OperationModel.new(
        name: "DisassociateApplicationFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_APPLICATION_FROM_ENTITLEMENT = OperationModel.new(
        name: "DisassociateApplicationFromEntitlement",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_FLEET = OperationModel.new(
        name: "DisassociateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SOFTWARE_FROM_IMAGE_BUILDER = OperationModel.new(
        name: "DisassociateSoftwareFromImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_USER = OperationModel.new(
        name: "EnableUser",
        http_method: "POST",
        request_uri: "/"
      )

      EXPIRE_SESSION = OperationModel.new(
        name: "ExpireSession",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EXPORT_IMAGE_TASK = OperationModel.new(
        name: "GetExportImageTask",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATED_FLEETS = OperationModel.new(
        name: "ListAssociatedFleets",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATED_STACKS = OperationModel.new(
        name: "ListAssociatedStacks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ENTITLED_APPLICATIONS = OperationModel.new(
        name: "ListEntitledApplications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_EXPORT_IMAGE_TASKS = OperationModel.new(
        name: "ListExportImageTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      START_APP_BLOCK_BUILDER = OperationModel.new(
        name: "StartAppBlockBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      START_FLEET = OperationModel.new(
        name: "StartFleet",
        http_method: "POST",
        request_uri: "/"
      )

      START_IMAGE_BUILDER = OperationModel.new(
        name: "StartImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      START_SOFTWARE_DEPLOYMENT_TO_IMAGE_BUILDER = OperationModel.new(
        name: "StartSoftwareDeploymentToImageBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_APP_BLOCK_BUILDER = OperationModel.new(
        name: "StopAppBlockBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_FLEET = OperationModel.new(
        name: "StopFleet",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_IMAGE_BUILDER = OperationModel.new(
        name: "StopImageBuilder",
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

      UPDATE_APP_BLOCK_BUILDER = OperationModel.new(
        name: "UpdateAppBlockBuilder",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DIRECTORY_CONFIG = OperationModel.new(
        name: "UpdateDirectoryConfig",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENTITLEMENT = OperationModel.new(
        name: "UpdateEntitlement",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_FLEET = OperationModel.new(
        name: "UpdateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_IMAGE_PERMISSIONS = OperationModel.new(
        name: "UpdateImagePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_STACK = OperationModel.new(
        name: "UpdateStack",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_THEME_FOR_STACK = OperationModel.new(
        name: "UpdateThemeForStack",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
