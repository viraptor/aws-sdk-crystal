module Aws
  module Snowball
    module Model
      API_VERSION = "2016-06-30"
      TARGET_PREFIX = "AWSIESnowballJobManagementService"
      SIGNING_NAME = "snowball"
      ENDPOINT_PREFIX = "snowball"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://snowball-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://snowball-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://snowball.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://snowball.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_CLUSTER = OperationModel.new(
        name: "CancelCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_JOB = OperationModel.new(
        name: "CancelJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ADDRESS = OperationModel.new(
        name: "CreateAddress",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LONG_TERM_PRICING = OperationModel.new(
        name: "CreateLongTermPricing",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RETURN_SHIPPING_LABEL = OperationModel.new(
        name: "CreateReturnShippingLabel",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADDRESS = OperationModel.new(
        name: "DescribeAddress",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADDRESSES = OperationModel.new(
        name: "DescribeAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTER = OperationModel.new(
        name: "DescribeCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_JOB = OperationModel.new(
        name: "DescribeJob",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RETURN_SHIPPING_LABEL = OperationModel.new(
        name: "DescribeReturnShippingLabel",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_MANIFEST = OperationModel.new(
        name: "GetJobManifest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_JOB_UNLOCK_CODE = OperationModel.new(
        name: "GetJobUnlockCode",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SNOWBALL_USAGE = OperationModel.new(
        name: "GetSnowballUsage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SOFTWARE_UPDATES = OperationModel.new(
        name: "GetSoftwareUpdates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTER_JOBS = OperationModel.new(
        name: "ListClusterJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_COMPATIBLE_IMAGES = OperationModel.new(
        name: "ListCompatibleImages",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_LONG_TERM_PRICING = OperationModel.new(
        name: "ListLongTermPricing",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PICKUP_LOCATIONS = OperationModel.new(
        name: "ListPickupLocations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SERVICE_VERSIONS = OperationModel.new(
        name: "ListServiceVersions",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_JOB = OperationModel.new(
        name: "UpdateJob",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_JOB_SHIPMENT_STATE = OperationModel.new(
        name: "UpdateJobShipmentState",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LONG_TERM_PRICING = OperationModel.new(
        name: "UpdateLongTermPricing",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
