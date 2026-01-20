module AwsSdk
  module ComputeOptimizer
    module Model
      API_VERSION = "2019-11-01"
      TARGET_PREFIX = "ComputeOptimizerService"
      SIGNING_NAME = "compute-optimizer"
      ENDPOINT_PREFIX = "compute-optimizer"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://compute-optimizer-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://compute-optimizer-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://compute-optimizer.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://compute-optimizer.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DELETE_RECOMMENDATION_PREFERENCES = OperationModel.new(
        name: "DeleteRecommendationPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RECOMMENDATION_EXPORT_JOBS = OperationModel.new(
        name: "DescribeRecommendationExportJobs",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_AUTO_SCALING_GROUP_RECOMMENDATIONS = OperationModel.new(
        name: "ExportAutoScalingGroupRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_EBS_VOLUME_RECOMMENDATIONS = OperationModel.new(
        name: "ExportEBSVolumeRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_EC2_INSTANCE_RECOMMENDATIONS = OperationModel.new(
        name: "ExportEC2InstanceRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_ECS_SERVICE_RECOMMENDATIONS = OperationModel.new(
        name: "ExportECSServiceRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_IDLE_RECOMMENDATIONS = OperationModel.new(
        name: "ExportIdleRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_LAMBDA_FUNCTION_RECOMMENDATIONS = OperationModel.new(
        name: "ExportLambdaFunctionRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_LICENSE_RECOMMENDATIONS = OperationModel.new(
        name: "ExportLicenseRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_RDS_DATABASE_RECOMMENDATIONS = OperationModel.new(
        name: "ExportRDSDatabaseRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AUTO_SCALING_GROUP_RECOMMENDATIONS = OperationModel.new(
        name: "GetAutoScalingGroupRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EBS_VOLUME_RECOMMENDATIONS = OperationModel.new(
        name: "GetEBSVolumeRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EC2_INSTANCE_RECOMMENDATIONS = OperationModel.new(
        name: "GetEC2InstanceRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EC2_RECOMMENDATION_PROJECTED_METRICS = OperationModel.new(
        name: "GetEC2RecommendationProjectedMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ECS_SERVICE_RECOMMENDATION_PROJECTED_METRICS = OperationModel.new(
        name: "GetECSServiceRecommendationProjectedMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ECS_SERVICE_RECOMMENDATIONS = OperationModel.new(
        name: "GetECSServiceRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EFFECTIVE_RECOMMENDATION_PREFERENCES = OperationModel.new(
        name: "GetEffectiveRecommendationPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENROLLMENT_STATUS = OperationModel.new(
        name: "GetEnrollmentStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENROLLMENT_STATUSES_FOR_ORGANIZATION = OperationModel.new(
        name: "GetEnrollmentStatusesForOrganization",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IDLE_RECOMMENDATIONS = OperationModel.new(
        name: "GetIdleRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LAMBDA_FUNCTION_RECOMMENDATIONS = OperationModel.new(
        name: "GetLambdaFunctionRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LICENSE_RECOMMENDATIONS = OperationModel.new(
        name: "GetLicenseRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RDS_DATABASE_RECOMMENDATION_PROJECTED_METRICS = OperationModel.new(
        name: "GetRDSDatabaseRecommendationProjectedMetrics",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RDS_DATABASE_RECOMMENDATIONS = OperationModel.new(
        name: "GetRDSDatabaseRecommendations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RECOMMENDATION_PREFERENCES = OperationModel.new(
        name: "GetRecommendationPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RECOMMENDATION_SUMMARIES = OperationModel.new(
        name: "GetRecommendationSummaries",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_RECOMMENDATION_PREFERENCES = OperationModel.new(
        name: "PutRecommendationPreferences",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ENROLLMENT_STATUS = OperationModel.new(
        name: "UpdateEnrollmentStatus",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
