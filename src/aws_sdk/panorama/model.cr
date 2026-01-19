module AwsSdk
  module Panorama
    module Model
      API_VERSION = "2019-07-24"
      TARGET_PREFIX = ""
      SIGNING_NAME = "panorama"
      ENDPOINT_PREFIX = "panorama"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://panorama-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://panorama-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://panorama.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://panorama.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_APPLICATION_INSTANCE = OperationModel.new(
        name: "CreateApplicationInstance",
        http_method: "POST",
        request_uri: "/application-instances"
      )

      CREATE_JOB_FOR_DEVICES = OperationModel.new(
        name: "CreateJobForDevices",
        http_method: "POST",
        request_uri: "/jobs"
      )

      CREATE_NODE_FROM_TEMPLATE_JOB = OperationModel.new(
        name: "CreateNodeFromTemplateJob",
        http_method: "POST",
        request_uri: "/packages/template-job"
      )

      CREATE_PACKAGE = OperationModel.new(
        name: "CreatePackage",
        http_method: "POST",
        request_uri: "/packages"
      )

      CREATE_PACKAGE_IMPORT_JOB = OperationModel.new(
        name: "CreatePackageImportJob",
        http_method: "POST",
        request_uri: "/packages/import-jobs"
      )

      DELETE_DEVICE = OperationModel.new(
        name: "DeleteDevice",
        http_method: "DELETE",
        request_uri: "/devices/{DeviceId}"
      )

      DELETE_PACKAGE = OperationModel.new(
        name: "DeletePackage",
        http_method: "DELETE",
        request_uri: "/packages/{PackageId}"
      )

      DEREGISTER_PACKAGE_VERSION = OperationModel.new(
        name: "DeregisterPackageVersion",
        http_method: "DELETE",
        request_uri: "/packages/{PackageId}/versions/{PackageVersion}/patch/{PatchVersion}"
      )

      DESCRIBE_APPLICATION_INSTANCE = OperationModel.new(
        name: "DescribeApplicationInstance",
        http_method: "GET",
        request_uri: "/application-instances/{ApplicationInstanceId}"
      )

      DESCRIBE_APPLICATION_INSTANCE_DETAILS = OperationModel.new(
        name: "DescribeApplicationInstanceDetails",
        http_method: "GET",
        request_uri: "/application-instances/{ApplicationInstanceId}/details"
      )

      DESCRIBE_DEVICE = OperationModel.new(
        name: "DescribeDevice",
        http_method: "GET",
        request_uri: "/devices/{DeviceId}"
      )

      DESCRIBE_DEVICE_JOB = OperationModel.new(
        name: "DescribeDeviceJob",
        http_method: "GET",
        request_uri: "/jobs/{JobId}"
      )

      DESCRIBE_NODE = OperationModel.new(
        name: "DescribeNode",
        http_method: "GET",
        request_uri: "/nodes/{NodeId}"
      )

      DESCRIBE_NODE_FROM_TEMPLATE_JOB = OperationModel.new(
        name: "DescribeNodeFromTemplateJob",
        http_method: "GET",
        request_uri: "/packages/template-job/{JobId}"
      )

      DESCRIBE_PACKAGE = OperationModel.new(
        name: "DescribePackage",
        http_method: "GET",
        request_uri: "/packages/metadata/{PackageId}"
      )

      DESCRIBE_PACKAGE_IMPORT_JOB = OperationModel.new(
        name: "DescribePackageImportJob",
        http_method: "GET",
        request_uri: "/packages/import-jobs/{JobId}"
      )

      DESCRIBE_PACKAGE_VERSION = OperationModel.new(
        name: "DescribePackageVersion",
        http_method: "GET",
        request_uri: "/packages/metadata/{PackageId}/versions/{PackageVersion}"
      )

      LIST_APPLICATION_INSTANCE_DEPENDENCIES = OperationModel.new(
        name: "ListApplicationInstanceDependencies",
        http_method: "GET",
        request_uri: "/application-instances/{ApplicationInstanceId}/package-dependencies"
      )

      LIST_APPLICATION_INSTANCE_NODE_INSTANCES = OperationModel.new(
        name: "ListApplicationInstanceNodeInstances",
        http_method: "GET",
        request_uri: "/application-instances/{ApplicationInstanceId}/node-instances"
      )

      LIST_APPLICATION_INSTANCES = OperationModel.new(
        name: "ListApplicationInstances",
        http_method: "GET",
        request_uri: "/application-instances"
      )

      LIST_DEVICES = OperationModel.new(
        name: "ListDevices",
        http_method: "GET",
        request_uri: "/devices"
      )

      LIST_DEVICES_JOBS = OperationModel.new(
        name: "ListDevicesJobs",
        http_method: "GET",
        request_uri: "/jobs"
      )

      LIST_NODE_FROM_TEMPLATE_JOBS = OperationModel.new(
        name: "ListNodeFromTemplateJobs",
        http_method: "GET",
        request_uri: "/packages/template-job"
      )

      LIST_NODES = OperationModel.new(
        name: "ListNodes",
        http_method: "GET",
        request_uri: "/nodes"
      )

      LIST_PACKAGE_IMPORT_JOBS = OperationModel.new(
        name: "ListPackageImportJobs",
        http_method: "GET",
        request_uri: "/packages/import-jobs"
      )

      LIST_PACKAGES = OperationModel.new(
        name: "ListPackages",
        http_method: "GET",
        request_uri: "/packages"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PROVISION_DEVICE = OperationModel.new(
        name: "ProvisionDevice",
        http_method: "POST",
        request_uri: "/devices"
      )

      REGISTER_PACKAGE_VERSION = OperationModel.new(
        name: "RegisterPackageVersion",
        http_method: "PUT",
        request_uri: "/packages/{PackageId}/versions/{PackageVersion}/patch/{PatchVersion}"
      )

      REMOVE_APPLICATION_INSTANCE = OperationModel.new(
        name: "RemoveApplicationInstance",
        http_method: "DELETE",
        request_uri: "/application-instances/{ApplicationInstanceId}"
      )

      SIGNAL_APPLICATION_INSTANCE_NODE_INSTANCES = OperationModel.new(
        name: "SignalApplicationInstanceNodeInstances",
        http_method: "PUT",
        request_uri: "/application-instances/{ApplicationInstanceId}/node-signals"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_DEVICE_METADATA = OperationModel.new(
        name: "UpdateDeviceMetadata",
        http_method: "PUT",
        request_uri: "/devices/{DeviceId}"
      )
    end
  end
end
