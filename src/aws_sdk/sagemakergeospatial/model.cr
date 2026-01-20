module AwsSdk
  module SageMakerGeospatial
    module Model
      API_VERSION = "2020-05-27"
      TARGET_PREFIX = ""
      SIGNING_NAME = "sagemaker-geospatial"
      ENDPOINT_PREFIX = "sagemaker-geospatial"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://sagemaker-geospatial-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://sagemaker-geospatial-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://sagemaker-geospatial.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://sagemaker-geospatial.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      DELETE_EARTH_OBSERVATION_JOB = OperationModel.new(
        name: "DeleteEarthObservationJob",
        http_method: "DELETE",
        request_uri: "/earth-observation-jobs/{Arn}"
      )

      DELETE_VECTOR_ENRICHMENT_JOB = OperationModel.new(
        name: "DeleteVectorEnrichmentJob",
        http_method: "DELETE",
        request_uri: "/vector-enrichment-jobs/{Arn}"
      )

      EXPORT_EARTH_OBSERVATION_JOB = OperationModel.new(
        name: "ExportEarthObservationJob",
        http_method: "POST",
        request_uri: "/export-earth-observation-job"
      )

      EXPORT_VECTOR_ENRICHMENT_JOB = OperationModel.new(
        name: "ExportVectorEnrichmentJob",
        http_method: "POST",
        request_uri: "/export-vector-enrichment-jobs"
      )

      GET_EARTH_OBSERVATION_JOB = OperationModel.new(
        name: "GetEarthObservationJob",
        http_method: "GET",
        request_uri: "/earth-observation-jobs/{Arn}"
      )

      GET_RASTER_DATA_COLLECTION = OperationModel.new(
        name: "GetRasterDataCollection",
        http_method: "GET",
        request_uri: "/raster-data-collection/{Arn}"
      )

      GET_TILE = OperationModel.new(
        name: "GetTile",
        http_method: "GET",
        request_uri: "/tile/{z}/{x}/{y}"
      )

      GET_VECTOR_ENRICHMENT_JOB = OperationModel.new(
        name: "GetVectorEnrichmentJob",
        http_method: "GET",
        request_uri: "/vector-enrichment-jobs/{Arn}"
      )

      LIST_EARTH_OBSERVATION_JOBS = OperationModel.new(
        name: "ListEarthObservationJobs",
        http_method: "POST",
        request_uri: "/list-earth-observation-jobs"
      )

      LIST_RASTER_DATA_COLLECTIONS = OperationModel.new(
        name: "ListRasterDataCollections",
        http_method: "GET",
        request_uri: "/raster-data-collections"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      LIST_VECTOR_ENRICHMENT_JOBS = OperationModel.new(
        name: "ListVectorEnrichmentJobs",
        http_method: "POST",
        request_uri: "/list-vector-enrichment-jobs"
      )

      SEARCH_RASTER_DATA_COLLECTION = OperationModel.new(
        name: "SearchRasterDataCollection",
        http_method: "POST",
        request_uri: "/search-raster-data-collection"
      )

      START_EARTH_OBSERVATION_JOB = OperationModel.new(
        name: "StartEarthObservationJob",
        http_method: "POST",
        request_uri: "/earth-observation-jobs"
      )

      START_VECTOR_ENRICHMENT_JOB = OperationModel.new(
        name: "StartVectorEnrichmentJob",
        http_method: "POST",
        request_uri: "/vector-enrichment-jobs"
      )

      STOP_EARTH_OBSERVATION_JOB = OperationModel.new(
        name: "StopEarthObservationJob",
        http_method: "POST",
        request_uri: "/earth-observation-jobs/stop"
      )

      STOP_VECTOR_ENRICHMENT_JOB = OperationModel.new(
        name: "StopVectorEnrichmentJob",
        http_method: "POST",
        request_uri: "/vector-enrichment-jobs/stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "PUT",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )
    end
  end
end
