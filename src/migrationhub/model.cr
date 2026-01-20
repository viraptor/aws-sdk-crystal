module Aws
  module MigrationHub
    module Model
      API_VERSION = "2017-05-31"
      TARGET_PREFIX = "AWSMigrationHub"
      SIGNING_NAME = "mgh"
      ENDPOINT_PREFIX = "mgh"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgh-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgh-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://mgh.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://mgh.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_CREATED_ARTIFACT = OperationModel.new(
        name: "AssociateCreatedArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DISCOVERED_RESOURCE = OperationModel.new(
        name: "AssociateDiscoveredResource",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SOURCE_RESOURCE = OperationModel.new(
        name: "AssociateSourceResource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PROGRESS_UPDATE_STREAM = OperationModel.new(
        name: "CreateProgressUpdateStream",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PROGRESS_UPDATE_STREAM = OperationModel.new(
        name: "DeleteProgressUpdateStream",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_APPLICATION_STATE = OperationModel.new(
        name: "DescribeApplicationState",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MIGRATION_TASK = OperationModel.new(
        name: "DescribeMigrationTask",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CREATED_ARTIFACT = OperationModel.new(
        name: "DisassociateCreatedArtifact",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_DISCOVERED_RESOURCE = OperationModel.new(
        name: "DisassociateDiscoveredResource",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SOURCE_RESOURCE = OperationModel.new(
        name: "DisassociateSourceResource",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_MIGRATION_TASK = OperationModel.new(
        name: "ImportMigrationTask",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPLICATION_STATES = OperationModel.new(
        name: "ListApplicationStates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CREATED_ARTIFACTS = OperationModel.new(
        name: "ListCreatedArtifacts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DISCOVERED_RESOURCES = OperationModel.new(
        name: "ListDiscoveredResources",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MIGRATION_TASK_UPDATES = OperationModel.new(
        name: "ListMigrationTaskUpdates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_MIGRATION_TASKS = OperationModel.new(
        name: "ListMigrationTasks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PROGRESS_UPDATE_STREAMS = OperationModel.new(
        name: "ListProgressUpdateStreams",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SOURCE_RESOURCES = OperationModel.new(
        name: "ListSourceResources",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_APPLICATION_STATE = OperationModel.new(
        name: "NotifyApplicationState",
        http_method: "POST",
        request_uri: "/"
      )

      NOTIFY_MIGRATION_TASK_STATE = OperationModel.new(
        name: "NotifyMigrationTaskState",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RESOURCE_ATTRIBUTES = OperationModel.new(
        name: "PutResourceAttributes",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
