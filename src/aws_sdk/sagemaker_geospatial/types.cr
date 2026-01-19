require "json"
require "time"

module AwsSdk
  module SageMakerGeospatial
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The geographic extent of the Earth Observation job.
      struct AreaOfInterest
        include JSON::Serializable

        # A GeoJSON object representing the geographic extent in the coordinate space.
        @[JSON::Field(key: "AreaOfInterestGeometry")]
        getter area_of_interest_geometry : Types::AreaOfInterestGeometry?

        def initialize(
          @area_of_interest_geometry : Types::AreaOfInterestGeometry? = nil
        )
        end
      end

      # A GeoJSON object representing the geographic extent in the coordinate space.
      struct AreaOfInterestGeometry
        include JSON::Serializable

        # The structure representing the MultiPolygon Geometry.
        @[JSON::Field(key: "MultiPolygonGeometry")]
        getter multi_polygon_geometry : Types::MultiPolygonGeometryInput?

        # The structure representing Polygon Geometry.
        @[JSON::Field(key: "PolygonGeometry")]
        getter polygon_geometry : Types::PolygonGeometryInput?

        def initialize(
          @multi_polygon_geometry : Types::MultiPolygonGeometryInput? = nil,
          @polygon_geometry : Types::PolygonGeometryInput? = nil
        )
        end
      end

      # The structure containing the asset properties.
      struct AssetValue
        include JSON::Serializable

        # Link to the asset object.
        @[JSON::Field(key: "Href")]
        getter href : String?

        def initialize(
          @href : String? = nil
        )
        end
      end

      # Input structure for the BandMath operation type. Defines Predefined and CustomIndices to be computed
      # using BandMath.
      struct BandMathConfigInput
        include JSON::Serializable

        # CustomIndices that are computed.
        @[JSON::Field(key: "CustomIndices")]
        getter custom_indices : Types::CustomIndicesInput?

        # One or many of the supported predefined indices to compute. Allowed values: NDVI , EVI2 , MSAVI ,
        # NDWI , NDMI , NDSI , and WDRVI .
        @[JSON::Field(key: "PredefinedIndices")]
        getter predefined_indices : Array(String)?

        def initialize(
          @custom_indices : Types::CustomIndicesInput? = nil,
          @predefined_indices : Array(String)? = nil
        )
        end
      end

      # Input structure for CloudMasking operation type.
      struct CloudMaskingConfigInput
        include JSON::Serializable

        def initialize
        end
      end

      # Input structure for Cloud Removal Operation type
      struct CloudRemovalConfigInput
        include JSON::Serializable

        # The name of the algorithm used for cloud removal.
        @[JSON::Field(key: "AlgorithmName")]
        getter algorithm_name : String?

        # The interpolation value you provide for cloud removal.
        @[JSON::Field(key: "InterpolationValue")]
        getter interpolation_value : String?

        # TargetBands to be returned in the output of CloudRemoval operation.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        def initialize(
          @algorithm_name : String? = nil,
          @interpolation_value : String? = nil,
          @target_bands : Array(String)? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # Input object defining the custom BandMath indices to compute.
      struct CustomIndicesInput
        include JSON::Serializable

        # A list of BandMath indices to compute.
        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteEarthObservationJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Earth Observation job being deleted.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteEarthObservationJobOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteVectorEnrichmentJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job being deleted.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DeleteVectorEnrichmentJobOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The structure representing the errors in an EarthObservationJob.
      struct EarthObservationJobErrorDetails
        include JSON::Serializable

        # A detailed message describing the error in an Earth Observation job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of error in an Earth Observation job.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The structure representing the EoCloudCover filter.
      struct EoCloudCoverInput
        include JSON::Serializable

        # Lower bound for EoCloudCover.
        @[JSON::Field(key: "LowerBound")]
        getter lower_bound : Float64

        # Upper bound for EoCloudCover.
        @[JSON::Field(key: "UpperBound")]
        getter upper_bound : Float64

        def initialize(
          @lower_bound : Float64,
          @upper_bound : Float64
        )
        end
      end

      struct ExportEarthObservationJobInput
        include JSON::Serializable

        # The input Amazon Resource Name (ARN) of the Earth Observation job being exported.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # An object containing information about the output file.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfigInput

        # A unique token that guarantees that the call to this API is idempotent.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The source images provided to the Earth Observation job being exported.
        @[JSON::Field(key: "ExportSourceImages")]
        getter export_source_images : Bool?

        def initialize(
          @arn : String,
          @execution_role_arn : String,
          @output_config : Types::OutputConfigInput,
          @client_token : String? = nil,
          @export_source_images : Bool? = nil
        )
        end
      end

      struct ExportEarthObservationJobOutput
        include JSON::Serializable

        # The output Amazon Resource Name (ARN) of the Earth Observation job being exported.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The status of the results of the Earth Observation job being exported.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String

        # An object containing information about the output file.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfigInput

        # The source images provided to the Earth Observation job being exported.
        @[JSON::Field(key: "ExportSourceImages")]
        getter export_source_images : Bool?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @execution_role_arn : String,
          @export_status : String,
          @output_config : Types::OutputConfigInput,
          @export_source_images : Bool? = nil
        )
        end
      end

      # The structure for returning the export error details in a GetEarthObservationJob.
      struct ExportErrorDetails
        include JSON::Serializable

        # The structure for returning the export error details while exporting results of an Earth Observation
        # job.
        @[JSON::Field(key: "ExportResults")]
        getter export_results : Types::ExportErrorDetailsOutput?

        # The structure for returning the export error details while exporting the source images of an Earth
        # Observation job.
        @[JSON::Field(key: "ExportSourceImages")]
        getter export_source_images : Types::ExportErrorDetailsOutput?

        def initialize(
          @export_results : Types::ExportErrorDetailsOutput? = nil,
          @export_source_images : Types::ExportErrorDetailsOutput? = nil
        )
        end
      end

      # The structure representing the errors in an export EarthObservationJob operation.
      struct ExportErrorDetailsOutput
        include JSON::Serializable

        # A detailed message describing the error in an export EarthObservationJob operation.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of error in an export EarthObservationJob operation.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The structure containing the Amazon S3 path to export the Earth Observation job output.
      struct ExportS3DataInput
        include JSON::Serializable

        # The URL to the Amazon S3 data input.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @kms_key_id : String? = nil
        )
        end
      end

      struct ExportVectorEnrichmentJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the IAM rolewith permission to upload to the location in
        # OutputConfig.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # Output location information for exporting Vector Enrichment Job results.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::ExportVectorEnrichmentJobOutputConfig

        # A unique token that guarantees that the call to this API is idempotent.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @arn : String,
          @execution_role_arn : String,
          @output_config : Types::ExportVectorEnrichmentJobOutputConfig,
          @client_token : String? = nil
        )
        end
      end

      struct ExportVectorEnrichmentJobOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job being exported.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The Amazon Resource Name (ARN) of the IAM role with permission to upload to the location in
        # OutputConfig.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The status of the results the Vector Enrichment job being exported.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String

        # Output location information for exporting Vector Enrichment Job results.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::ExportVectorEnrichmentJobOutputConfig

        def initialize(
          @arn : String,
          @creation_time : Time,
          @execution_role_arn : String,
          @export_status : String,
          @output_config : Types::ExportVectorEnrichmentJobOutputConfig
        )
        end
      end

      # An object containing information about the output file.
      struct ExportVectorEnrichmentJobOutputConfig
        include JSON::Serializable

        # The input structure for Amazon S3 data; representing the Amazon S3 location of the input data
        # objects.
        @[JSON::Field(key: "S3Data")]
        getter s3_data : Types::VectorEnrichmentJobS3Data

        def initialize(
          @s3_data : Types::VectorEnrichmentJobS3Data
        )
        end
      end

      # The structure representing the filters supported by a RasterDataCollection.
      struct Filter
        include JSON::Serializable

        # The name of the filter.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of the filter being used.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The maximum value of the filter.
        @[JSON::Field(key: "Maximum")]
        getter maximum : Float64?

        # The minimum value of the filter.
        @[JSON::Field(key: "Minimum")]
        getter minimum : Float64?

        def initialize(
          @name : String,
          @type : String,
          @maximum : Float64? = nil,
          @minimum : Float64? = nil
        )
        end
      end

      # Input configuration information for the geomosaic.
      struct GeoMosaicConfigInput
        include JSON::Serializable

        # The name of the algorithm being used for geomosaic.
        @[JSON::Field(key: "AlgorithmName")]
        getter algorithm_name : String?

        # The target bands for geomosaic.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        def initialize(
          @algorithm_name : String? = nil,
          @target_bands : Array(String)? = nil
        )
        end
      end

      # The structure representing a Geometry in terms of Type and Coordinates as per GeoJson spec.
      struct Geometry
        include JSON::Serializable

        # The coordinates of the GeoJson Geometry.
        @[JSON::Field(key: "Coordinates")]
        getter coordinates : Array(Array(Array(Float64)))

        # GeoJson Geometry types like Polygon and MultiPolygon.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @coordinates : Array(Array(Array(Float64))),
          @type : String
        )
        end
      end

      struct GetEarthObservationJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Earth Observation job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetEarthObservationJobOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Earth Observation job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time of the initiated Earth Observation job.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of Earth Observation job, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # Input data for the Earth Observation job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::InputConfigOutput

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::JobConfigInput

        # The name of the Earth Observation job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of a previously initiated Earth Observation job.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Details about the errors generated during the Earth Observation job.
        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::EarthObservationJobErrorDetails?

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # Details about the errors generated during ExportEarthObservationJob.
        @[JSON::Field(key: "ExportErrorDetails")]
        getter export_error_details : Types::ExportErrorDetails?

        # The status of the Earth Observation job.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String?

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Bands available in the output of an operation.
        @[JSON::Field(key: "OutputBands")]
        getter output_bands : Array(Types::OutputBand)?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @input_config : Types::InputConfigOutput,
          @job_config : Types::JobConfigInput,
          @name : String,
          @status : String,
          @error_details : Types::EarthObservationJobErrorDetails? = nil,
          @execution_role_arn : String? = nil,
          @export_error_details : Types::ExportErrorDetails? = nil,
          @export_status : String? = nil,
          @kms_key_id : String? = nil,
          @output_bands : Array(Types::OutputBand)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetRasterDataCollectionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the raster data collection.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetRasterDataCollectionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the raster data collection.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A description of the raster data collection.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The URL of the description page.
        @[JSON::Field(key: "DescriptionPageUrl")]
        getter description_page_url : String

        # The list of image source bands in the raster data collection.
        @[JSON::Field(key: "ImageSourceBands")]
        getter image_source_bands : Array(String)

        # The name of the raster data collection.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The filters supported by the raster data collection.
        @[JSON::Field(key: "SupportedFilters")]
        getter supported_filters : Array(Types::Filter)

        # The raster data collection type.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @description : String,
          @description_page_url : String,
          @image_source_bands : Array(String),
          @name : String,
          @supported_filters : Array(Types::Filter),
          @type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetTileInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the tile operation.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The particular assets or bands to tile.
        @[JSON::Field(key: "ImageAssets")]
        getter image_assets : Array(String)

        # Determines what part of the Earth Observation job to tile. 'INPUT' or 'OUTPUT' are the valid
        # options.
        @[JSON::Field(key: "Target")]
        getter target : String

        # The x coordinate of the tile input.
        @[JSON::Field(key: "x")]
        getter x : Int32

        # The y coordinate of the tile input.
        @[JSON::Field(key: "y")]
        getter y : Int32

        # The z coordinate of the tile input.
        @[JSON::Field(key: "z")]
        getter z : Int32

        # The Amazon Resource Name (ARN) of the IAM role that you specify.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # Determines whether or not to return a valid data mask.
        @[JSON::Field(key: "ImageMask")]
        getter image_mask : Bool?

        # The output data type of the tile operation.
        @[JSON::Field(key: "OutputDataType")]
        getter output_data_type : String?

        # The data format of the output tile. The formats include .npy, .png and .jpg.
        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String?

        # Property filters for the imagery to tile.
        @[JSON::Field(key: "PropertyFilters")]
        getter property_filters : String?

        # Time range filter applied to imagery to find the images to tile.
        @[JSON::Field(key: "TimeRangeFilter")]
        getter time_range_filter : String?

        def initialize(
          @arn : String,
          @image_assets : Array(String),
          @target : String,
          @x : Int32,
          @y : Int32,
          @z : Int32,
          @execution_role_arn : String? = nil,
          @image_mask : Bool? = nil,
          @output_data_type : String? = nil,
          @output_format : String? = nil,
          @property_filters : String? = nil,
          @time_range_filter : String? = nil
        )
        end
      end

      struct GetTileOutput
        include JSON::Serializable

        # The output binary file.
        @[JSON::Field(key: "BinaryFile")]
        getter binary_file : Bytes?

        def initialize(
          @binary_file : Bytes? = nil
        )
        end
      end

      struct GetVectorEnrichmentJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct GetVectorEnrichmentJobOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of the Vector Enrichment job, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # Input configuration information for the Vector Enrichment job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::VectorEnrichmentJobInputConfig

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::VectorEnrichmentJobConfig

        # The name of the Vector Enrichment job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the initiated Vector Enrichment job.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The type of the Vector Enrichment job being initiated.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Details about the errors generated during the Vector Enrichment job.
        @[JSON::Field(key: "ErrorDetails")]
        getter error_details : Types::VectorEnrichmentJobErrorDetails?

        # Details about the errors generated during the ExportVectorEnrichmentJob.
        @[JSON::Field(key: "ExportErrorDetails")]
        getter export_error_details : Types::VectorEnrichmentJobExportErrorDetails?

        # The export status of the Vector Enrichment job being initiated.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String?

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @execution_role_arn : String,
          @input_config : Types::VectorEnrichmentJobInputConfig,
          @job_config : Types::VectorEnrichmentJobConfig,
          @name : String,
          @status : String,
          @type : String,
          @error_details : Types::VectorEnrichmentJobErrorDetails? = nil,
          @export_error_details : Types::VectorEnrichmentJobExportErrorDetails? = nil,
          @export_status : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Input configuration information.
      struct InputConfigInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the previous Earth Observation job.
        @[JSON::Field(key: "PreviousEarthObservationJobArn")]
        getter previous_earth_observation_job_arn : String?

        # The structure representing the RasterDataCollection Query consisting of the Area of Interest,
        # RasterDataCollectionArn,TimeRange and Property Filters.
        @[JSON::Field(key: "RasterDataCollectionQuery")]
        getter raster_data_collection_query : Types::RasterDataCollectionQueryInput?

        def initialize(
          @previous_earth_observation_job_arn : String? = nil,
          @raster_data_collection_query : Types::RasterDataCollectionQueryInput? = nil
        )
        end
      end

      # The InputConfig for an EarthObservationJob response.
      struct InputConfigOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the previous Earth Observation job.
        @[JSON::Field(key: "PreviousEarthObservationJobArn")]
        getter previous_earth_observation_job_arn : String?

        # The structure representing the RasterDataCollection Query consisting of the Area of Interest,
        # RasterDataCollectionArn, RasterDataCollectionName, TimeRange, and Property Filters.
        @[JSON::Field(key: "RasterDataCollectionQuery")]
        getter raster_data_collection_query : Types::RasterDataCollectionQueryOutput?

        def initialize(
          @previous_earth_observation_job_arn : String? = nil,
          @raster_data_collection_query : Types::RasterDataCollectionQueryOutput? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # The structure representing the items in the response for SearchRasterDataCollection.
      struct ItemSource
        include JSON::Serializable

        # The searchable date and time of the item, in UTC.
        @[JSON::Field(key: "DateTime")]
        getter date_time : Time

        # The item Geometry in GeoJson format.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry

        # A unique Id for the source item.
        @[JSON::Field(key: "Id")]
        getter id : String

        # This is a dictionary of Asset Objects data associated with the Item that can be downloaded or
        # streamed, each with a unique key.
        @[JSON::Field(key: "Assets")]
        getter assets : Hash(String, Types::AssetValue)?

        # This field contains additional properties of the item.
        @[JSON::Field(key: "Properties")]
        getter properties : Types::Properties?

        def initialize(
          @date_time : Time,
          @geometry : Types::Geometry,
          @id : String,
          @assets : Hash(String, Types::AssetValue)? = nil,
          @properties : Types::Properties? = nil
        )
        end
      end

      # The input structure for the JobConfig in an EarthObservationJob.
      struct JobConfigInput
        include JSON::Serializable

        # An object containing information about the job configuration for BandMath.
        @[JSON::Field(key: "BandMathConfig")]
        getter band_math_config : Types::BandMathConfigInput?

        # An object containing information about the job configuration for cloud masking.
        @[JSON::Field(key: "CloudMaskingConfig")]
        getter cloud_masking_config : Types::CloudMaskingConfigInput?

        # An object containing information about the job configuration for cloud removal.
        @[JSON::Field(key: "CloudRemovalConfig")]
        getter cloud_removal_config : Types::CloudRemovalConfigInput?

        # An object containing information about the job configuration for geomosaic.
        @[JSON::Field(key: "GeoMosaicConfig")]
        getter geo_mosaic_config : Types::GeoMosaicConfigInput?

        # An object containing information about the job configuration for land cover segmentation.
        @[JSON::Field(key: "LandCoverSegmentationConfig")]
        getter land_cover_segmentation_config : Types::LandCoverSegmentationConfigInput?

        # An object containing information about the job configuration for resampling.
        @[JSON::Field(key: "ResamplingConfig")]
        getter resampling_config : Types::ResamplingConfigInput?

        # An object containing information about the job configuration for a Stacking Earth Observation job.
        @[JSON::Field(key: "StackConfig")]
        getter stack_config : Types::StackConfigInput?

        # An object containing information about the job configuration for temporal statistics.
        @[JSON::Field(key: "TemporalStatisticsConfig")]
        getter temporal_statistics_config : Types::TemporalStatisticsConfigInput?

        # An object containing information about the job configuration for zonal statistics.
        @[JSON::Field(key: "ZonalStatisticsConfig")]
        getter zonal_statistics_config : Types::ZonalStatisticsConfigInput?

        def initialize(
          @band_math_config : Types::BandMathConfigInput? = nil,
          @cloud_masking_config : Types::CloudMaskingConfigInput? = nil,
          @cloud_removal_config : Types::CloudRemovalConfigInput? = nil,
          @geo_mosaic_config : Types::GeoMosaicConfigInput? = nil,
          @land_cover_segmentation_config : Types::LandCoverSegmentationConfigInput? = nil,
          @resampling_config : Types::ResamplingConfigInput? = nil,
          @stack_config : Types::StackConfigInput? = nil,
          @temporal_statistics_config : Types::TemporalStatisticsConfigInput? = nil,
          @zonal_statistics_config : Types::ZonalStatisticsConfigInput? = nil
        )
        end
      end

      # The input structure for Land Cover Operation type.
      struct LandCoverSegmentationConfigInput
        include JSON::Serializable

        def initialize
        end
      end

      # The structure representing Land Cloud Cover property for Landsat data collection.
      struct LandsatCloudCoverLandInput
        include JSON::Serializable

        # The minimum value for Land Cloud Cover property filter. This will filter items having Land Cloud
        # Cover greater than or equal to this value.
        @[JSON::Field(key: "LowerBound")]
        getter lower_bound : Float64

        # The maximum value for Land Cloud Cover property filter. This will filter items having Land Cloud
        # Cover less than or equal to this value.
        @[JSON::Field(key: "UpperBound")]
        getter upper_bound : Float64

        def initialize(
          @lower_bound : Float64,
          @upper_bound : Float64
        )
        end
      end

      struct ListEarthObservationJobInput
        include JSON::Serializable

        # The total number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The parameter by which to sort the results.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # An optional value that specifies whether you want the results sorted in Ascending or Descending
        # order.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        # A filter that retrieves only jobs with a specific status.
        @[JSON::Field(key: "StatusEquals")]
        getter status_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end

      struct ListEarthObservationJobOutput
        include JSON::Serializable

        # Contains summary information about the Earth Observation jobs.
        @[JSON::Field(key: "EarthObservationJobSummaries")]
        getter earth_observation_job_summaries : Array(Types::ListEarthObservationJobOutputConfig)

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @earth_observation_job_summaries : Array(Types::ListEarthObservationJobOutputConfig),
          @next_token : String? = nil
        )
        end
      end

      # An object containing information about the output file.
      struct ListEarthObservationJobOutputConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the list of the Earth Observation jobs.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of the session, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The names of the Earth Observation jobs in the list.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The operation type for an Earth Observation job.
        @[JSON::Field(key: "OperationType")]
        getter operation_type : String

        # The status of the list of the Earth Observation jobs.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @name : String,
          @operation_type : String,
          @status : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListRasterDataCollectionsInput
        include JSON::Serializable

        # The total number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListRasterDataCollectionsOutput
        include JSON::Serializable

        # Contains summary information about the raster data collection.
        @[JSON::Field(key: "RasterDataCollectionSummaries")]
        getter raster_data_collection_summaries : Array(Types::RasterDataCollectionMetadata)

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @raster_data_collection_summaries : Array(Types::RasterDataCollectionMetadata),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to tag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListVectorEnrichmentJobInput
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The parameter by which to sort the results.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # An optional value that specifies whether you want the results sorted in Ascending or Descending
        # order.
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        # A filter that retrieves only jobs with a specific status.
        @[JSON::Field(key: "StatusEquals")]
        getter status_equals : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status_equals : String? = nil
        )
        end
      end

      struct ListVectorEnrichmentJobOutput
        include JSON::Serializable

        # Contains summary information about the Vector Enrichment jobs.
        @[JSON::Field(key: "VectorEnrichmentJobSummaries")]
        getter vector_enrichment_job_summaries : Array(Types::ListVectorEnrichmentJobOutputConfig)

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @vector_enrichment_job_summaries : Array(Types::ListVectorEnrichmentJobOutputConfig),
          @next_token : String? = nil
        )
        end
      end

      # An object containing information about the output file.
      struct ListVectorEnrichmentJobOutputConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the list of the Vector Enrichment jobs.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of the session, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The names of the Vector Enrichment jobs in the list.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the Vector Enrichment jobs list.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The type of the list of Vector Enrichment jobs.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @name : String,
          @status : String,
          @type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The input structure for Map Matching operation type.
      struct MapMatchingConfig
        include JSON::Serializable

        # The field name for the data that describes the identifier representing a collection of GPS points
        # belonging to an individual trace.
        @[JSON::Field(key: "IdAttributeName")]
        getter id_attribute_name : String

        # The name of the timestamp attribute.
        @[JSON::Field(key: "TimestampAttributeName")]
        getter timestamp_attribute_name : String

        # The name of the X-attribute
        @[JSON::Field(key: "XAttributeName")]
        getter x_attribute_name : String

        # The name of the Y-attribute
        @[JSON::Field(key: "YAttributeName")]
        getter y_attribute_name : String

        def initialize(
          @id_attribute_name : String,
          @timestamp_attribute_name : String,
          @x_attribute_name : String,
          @y_attribute_name : String
        )
        end
      end

      # The structure representing Polygon Geometry based on the GeoJson spec .
      struct MultiPolygonGeometryInput
        include JSON::Serializable

        # The coordinates of the multipolygon geometry.
        @[JSON::Field(key: "Coordinates")]
        getter coordinates : Array(Array(Array(Array(Float64))))

        def initialize(
          @coordinates : Array(Array(Array(Array(Float64))))
        )
        end
      end

      # Represents an arithmetic operation to compute spectral index.
      struct Operation
        include JSON::Serializable

        # Textual representation of the math operation; Equation used to compute the spectral index.
        @[JSON::Field(key: "Equation")]
        getter equation : String

        # The name of the operation.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of the operation.
        @[JSON::Field(key: "OutputType")]
        getter output_type : String?

        def initialize(
          @equation : String,
          @name : String,
          @output_type : String? = nil
        )
        end
      end

      # A single EarthObservationJob output band.
      struct OutputBand
        include JSON::Serializable

        # The name of the band.
        @[JSON::Field(key: "BandName")]
        getter band_name : String

        # The datatype of the output band.
        @[JSON::Field(key: "OutputDataType")]
        getter output_data_type : String

        def initialize(
          @band_name : String,
          @output_data_type : String
        )
        end
      end

      # The response structure for an OutputConfig returned by an ExportEarthObservationJob.
      struct OutputConfigInput
        include JSON::Serializable

        # Path to Amazon S3 storage location for the output configuration file.
        @[JSON::Field(key: "S3Data")]
        getter s3_data : Types::ExportS3DataInput

        def initialize(
          @s3_data : Types::ExportS3DataInput
        )
        end
      end

      # OutputResolution Configuration indicating the target resolution for the output of Resampling
      # operation.
      struct OutputResolutionResamplingInput
        include JSON::Serializable

        # User Defined Resolution for the output of Resampling operation defined by value and unit.
        @[JSON::Field(key: "UserDefined")]
        getter user_defined : Types::UserDefined

        def initialize(
          @user_defined : Types::UserDefined
        )
        end
      end

      # The input structure representing Output Resolution for Stacking Operation.
      struct OutputResolutionStackInput
        include JSON::Serializable

        # A string value representing Predefined Output Resolution for a stacking operation. Allowed values
        # are HIGHEST , LOWEST , and AVERAGE .
        @[JSON::Field(key: "Predefined")]
        getter predefined : String?

        # The structure representing User Output Resolution for a Stacking operation defined as a value and
        # unit.
        @[JSON::Field(key: "UserDefined")]
        getter user_defined : Types::UserDefined?

        def initialize(
          @predefined : String? = nil,
          @user_defined : Types::UserDefined? = nil
        )
        end
      end

      # The input structure for specifying Platform. Platform refers to the unique name of the specific
      # platform the instrument is attached to. For satellites it is the name of the satellite, eg.
      # landsat-8 (Landsat-8), sentinel-2a.
      struct PlatformInput
        include JSON::Serializable

        # The value of the platform.
        @[JSON::Field(key: "Value")]
        getter value : String

        # The ComparisonOperator to use with PlatformInput.
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        def initialize(
          @value : String,
          @comparison_operator : String? = nil
        )
        end
      end

      # The structure representing Polygon Geometry based on the GeoJson spec .
      struct PolygonGeometryInput
        include JSON::Serializable

        # Coordinates representing a Polygon based on the GeoJson spec .
        @[JSON::Field(key: "Coordinates")]
        getter coordinates : Array(Array(Array(Float64)))

        def initialize(
          @coordinates : Array(Array(Array(Float64)))
        )
        end
      end

      # Properties associated with the Item.
      struct Properties
        include JSON::Serializable

        # Estimate of cloud cover.
        @[JSON::Field(key: "EoCloudCover")]
        getter eo_cloud_cover : Float64?

        # Land cloud cover for Landsat Data Collection.
        @[JSON::Field(key: "LandsatCloudCoverLand")]
        getter landsat_cloud_cover_land : Float64?

        # Platform property. Platform refers to the unique name of the specific platform the instrument is
        # attached to. For satellites it is the name of the satellite, eg. landsat-8 (Landsat-8), sentinel-2a.
        @[JSON::Field(key: "Platform")]
        getter platform : String?

        # The angle from the sensor between nadir (straight down) and the scene center. Measured in degrees
        # (0-90).
        @[JSON::Field(key: "ViewOffNadir")]
        getter view_off_nadir : Float64?

        # The sun azimuth angle. From the scene center point on the ground, this is the angle between truth
        # north and the sun. Measured clockwise in degrees (0-360).
        @[JSON::Field(key: "ViewSunAzimuth")]
        getter view_sun_azimuth : Float64?

        # The sun elevation angle. The angle from the tangent of the scene center point to the sun. Measured
        # from the horizon in degrees (-90-90). Negative values indicate the sun is below the horizon, e.g.
        # sun elevation of -10° means the data was captured during nautical twilight .
        @[JSON::Field(key: "ViewSunElevation")]
        getter view_sun_elevation : Float64?

        def initialize(
          @eo_cloud_cover : Float64? = nil,
          @landsat_cloud_cover_land : Float64? = nil,
          @platform : String? = nil,
          @view_off_nadir : Float64? = nil,
          @view_sun_azimuth : Float64? = nil,
          @view_sun_elevation : Float64? = nil
        )
        end
      end

      # Represents a single searchable property to search on.
      struct Property
        include JSON::Serializable

        # The structure representing EoCloudCover property filter containing a lower bound and upper bound.
        @[JSON::Field(key: "EoCloudCover")]
        getter eo_cloud_cover : Types::EoCloudCoverInput?

        # The structure representing Land Cloud Cover property filter for Landsat collection containing a
        # lower bound and upper bound.
        @[JSON::Field(key: "LandsatCloudCoverLand")]
        getter landsat_cloud_cover_land : Types::LandsatCloudCoverLandInput?

        # The structure representing Platform property filter consisting of value and comparison operator.
        @[JSON::Field(key: "Platform")]
        getter platform : Types::PlatformInput?

        # The structure representing ViewOffNadir property filter containing a lower bound and upper bound.
        @[JSON::Field(key: "ViewOffNadir")]
        getter view_off_nadir : Types::ViewOffNadirInput?

        # The structure representing ViewSunAzimuth property filter containing a lower bound and upper bound.
        @[JSON::Field(key: "ViewSunAzimuth")]
        getter view_sun_azimuth : Types::ViewSunAzimuthInput?

        # The structure representing ViewSunElevation property filter containing a lower bound and upper
        # bound.
        @[JSON::Field(key: "ViewSunElevation")]
        getter view_sun_elevation : Types::ViewSunElevationInput?

        def initialize(
          @eo_cloud_cover : Types::EoCloudCoverInput? = nil,
          @landsat_cloud_cover_land : Types::LandsatCloudCoverLandInput? = nil,
          @platform : Types::PlatformInput? = nil,
          @view_off_nadir : Types::ViewOffNadirInput? = nil,
          @view_sun_azimuth : Types::ViewSunAzimuthInput? = nil,
          @view_sun_elevation : Types::ViewSunElevationInput? = nil
        )
        end
      end

      # The structure representing a single PropertyFilter.
      struct PropertyFilter
        include JSON::Serializable

        # Represents a single property to match with when searching a raster data collection.
        @[JSON::Field(key: "Property")]
        getter property : Types::Property

        def initialize(
          @property : Types::Property
        )
        end
      end

      # A list of PropertyFilter objects.
      struct PropertyFilters
        include JSON::Serializable

        # The Logical Operator used to combine the Property Filters.
        @[JSON::Field(key: "LogicalOperator")]
        getter logical_operator : String?

        # A list of Property Filters.
        @[JSON::Field(key: "Properties")]
        getter properties : Array(Types::PropertyFilter)?

        def initialize(
          @logical_operator : String? = nil,
          @properties : Array(Types::PropertyFilter)? = nil
        )
        end
      end

      # Response object containing details for a specific RasterDataCollection.
      struct RasterDataCollectionMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the raster data collection.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A description of the raster data collection.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The name of the raster data collection.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The list of filters supported by the raster data collection.
        @[JSON::Field(key: "SupportedFilters")]
        getter supported_filters : Array(Types::Filter)

        # The type of raster data collection.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The description URL of the raster data collection.
        @[JSON::Field(key: "DescriptionPageUrl")]
        getter description_page_url : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @description : String,
          @name : String,
          @supported_filters : Array(Types::Filter),
          @type : String,
          @description_page_url : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The input structure for Raster Data Collection Query containing the Area of Interest, TimeRange
      # Filters, and Property Filters.
      struct RasterDataCollectionQueryInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the raster data collection.
        @[JSON::Field(key: "RasterDataCollectionArn")]
        getter raster_data_collection_arn : String

        # The TimeRange Filter used in the RasterDataCollection Query.
        @[JSON::Field(key: "TimeRangeFilter")]
        getter time_range_filter : Types::TimeRangeFilterInput

        # The area of interest being queried for the raster data collection.
        @[JSON::Field(key: "AreaOfInterest")]
        getter area_of_interest : Types::AreaOfInterest?

        # The list of Property filters used in the Raster Data Collection Query.
        @[JSON::Field(key: "PropertyFilters")]
        getter property_filters : Types::PropertyFilters?

        def initialize(
          @raster_data_collection_arn : String,
          @time_range_filter : Types::TimeRangeFilterInput,
          @area_of_interest : Types::AreaOfInterest? = nil,
          @property_filters : Types::PropertyFilters? = nil
        )
        end
      end

      # The output structure contains the Raster Data Collection Query input along with some additional
      # metadata.
      struct RasterDataCollectionQueryOutput
        include JSON::Serializable

        # The ARN of the Raster Data Collection against which the search is done.
        @[JSON::Field(key: "RasterDataCollectionArn")]
        getter raster_data_collection_arn : String

        # The name of the raster data collection.
        @[JSON::Field(key: "RasterDataCollectionName")]
        getter raster_data_collection_name : String

        # The TimeRange filter used in the search.
        @[JSON::Field(key: "TimeRangeFilter")]
        getter time_range_filter : Types::TimeRangeFilterOutput

        # The Area of Interest used in the search.
        @[JSON::Field(key: "AreaOfInterest")]
        getter area_of_interest : Types::AreaOfInterest?

        # Property filters used in the search.
        @[JSON::Field(key: "PropertyFilters")]
        getter property_filters : Types::PropertyFilters?

        def initialize(
          @raster_data_collection_arn : String,
          @raster_data_collection_name : String,
          @time_range_filter : Types::TimeRangeFilterOutput,
          @area_of_interest : Types::AreaOfInterest? = nil,
          @property_filters : Types::PropertyFilters? = nil
        )
        end
      end

      # This is a RasterDataCollectionQueryInput containing AreaOfInterest, Time Range filter and Property
      # filters.
      struct RasterDataCollectionQueryWithBandFilterInput
        include JSON::Serializable

        # The TimeRange Filter used in the search query.
        @[JSON::Field(key: "TimeRangeFilter")]
        getter time_range_filter : Types::TimeRangeFilterInput

        # The Area of interest to be used in the search query.
        @[JSON::Field(key: "AreaOfInterest")]
        getter area_of_interest : Types::AreaOfInterest?

        # The list of Bands to be displayed in the result for each item.
        @[JSON::Field(key: "BandFilter")]
        getter band_filter : Array(String)?

        # The Property Filters used in the search query.
        @[JSON::Field(key: "PropertyFilters")]
        getter property_filters : Types::PropertyFilters?

        def initialize(
          @time_range_filter : Types::TimeRangeFilterInput,
          @area_of_interest : Types::AreaOfInterest? = nil,
          @band_filter : Array(String)? = nil,
          @property_filters : Types::PropertyFilters? = nil
        )
        end
      end

      # The structure representing input for resampling operation.
      struct ResamplingConfigInput
        include JSON::Serializable

        # The structure representing output resolution (in target georeferenced units) of the result of
        # resampling operation.
        @[JSON::Field(key: "OutputResolution")]
        getter output_resolution : Types::OutputResolutionResamplingInput

        # The name of the algorithm used for resampling.
        @[JSON::Field(key: "AlgorithmName")]
        getter algorithm_name : String?

        # Bands used in the operation. If no target bands are specified, it uses all bands available in the
        # input.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        def initialize(
          @output_resolution : Types::OutputResolutionResamplingInput,
          @algorithm_name : String? = nil,
          @target_bands : Array(String)? = nil
        )
        end
      end

      # The request references a resource which does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource that was not found.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # The input structure for Reverse Geocoding operation type.
      struct ReverseGeocodingConfig
        include JSON::Serializable

        # The field name for the data that describes x-axis coordinate, eg. longitude of a point.
        @[JSON::Field(key: "XAttributeName")]
        getter x_attribute_name : String

        # The field name for the data that describes y-axis coordinate, eg. latitude of a point.
        @[JSON::Field(key: "YAttributeName")]
        getter y_attribute_name : String

        def initialize(
          @x_attribute_name : String,
          @y_attribute_name : String
        )
        end
      end

      struct SearchRasterDataCollectionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the raster data collection.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # RasterDataCollectionQuery consisting of AreaOfInterest(AOI) , PropertyFilters and
        # TimeRangeFilterInput used in SearchRasterDataCollection .
        @[JSON::Field(key: "RasterDataCollectionQuery")]
        getter raster_data_collection_query : Types::RasterDataCollectionQueryWithBandFilterInput

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @raster_data_collection_query : Types::RasterDataCollectionQueryWithBandFilterInput,
          @next_token : String? = nil
        )
        end
      end

      struct SearchRasterDataCollectionOutput
        include JSON::Serializable

        # Approximate number of results in the response.
        @[JSON::Field(key: "ApproximateResultCount")]
        getter approximate_result_count : Int32

        # List of items matching the Raster DataCollectionQuery.
        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ItemSource)?

        # If the previous response was truncated, you receive this token. Use it in your next request to
        # receive the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @approximate_result_count : Int32,
          @items : Array(Types::ItemSource)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # You have exceeded the service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # The input structure for Stacking Operation.
      struct StackConfigInput
        include JSON::Serializable

        # The structure representing output resolution (in target georeferenced units) of the result of
        # stacking operation.
        @[JSON::Field(key: "OutputResolution")]
        getter output_resolution : Types::OutputResolutionStackInput?

        # A list of bands to be stacked in the specified order. When the parameter is not provided, all the
        # available bands in the data collection are stacked in the alphabetical order of their asset names.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        def initialize(
          @output_resolution : Types::OutputResolutionStackInput? = nil,
          @target_bands : Array(String)? = nil
        )
        end
      end

      struct StartEarthObservationJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # Input configuration information for the Earth Observation job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::InputConfigInput

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::JobConfigInput

        # The name of the Earth Observation job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique token that guarantees that the call to this API is idempotent.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @execution_role_arn : String,
          @input_config : Types::InputConfigInput,
          @job_config : Types::JobConfigInput,
          @name : String,
          @client_token : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartEarthObservationJobOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Earth Observation job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of the session, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::JobConfigInput

        # The name of the Earth Observation job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the Earth Observation job.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Input configuration information for the Earth Observation job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::InputConfigOutput?

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @execution_role_arn : String,
          @job_config : Types::JobConfigInput,
          @name : String,
          @status : String,
          @input_config : Types::InputConfigOutput? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartVectorEnrichmentJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # Input configuration information for the Vector Enrichment job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::VectorEnrichmentJobInputConfig

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::VectorEnrichmentJobConfig

        # The name of the Vector Enrichment job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique token that guarantees that the call to this API is idempotent.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @execution_role_arn : String,
          @input_config : Types::VectorEnrichmentJobInputConfig,
          @job_config : Types::VectorEnrichmentJobConfig,
          @name : String,
          @client_token : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartVectorEnrichmentJobOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The creation time.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # The duration of the Vector Enrichment job, in seconds.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32

        # The Amazon Resource Name (ARN) of the IAM role that you specified for the job.
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # Input configuration information for starting the Vector Enrichment job.
        @[JSON::Field(key: "InputConfig")]
        getter input_config : Types::VectorEnrichmentJobInputConfig

        # An object containing information about the job configuration.
        @[JSON::Field(key: "JobConfig")]
        getter job_config : Types::VectorEnrichmentJobConfig

        # The name of the Vector Enrichment job.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The status of the Vector Enrichment job being started.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The type of the Vector Enrichment job.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @duration_in_seconds : Int32,
          @execution_role_arn : String,
          @input_config : Types::VectorEnrichmentJobInputConfig,
          @job_config : Types::VectorEnrichmentJobConfig,
          @name : String,
          @status : String,
          @type : String,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StopEarthObservationJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Earth Observation job being stopped.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StopEarthObservationJobOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct StopVectorEnrichmentJobInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Vector Enrichment job.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct StopVectorEnrichmentJobOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to tag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Each tag consists of a key and a value.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The structure representing the configuration for Temporal Statistics operation.
      struct TemporalStatisticsConfigInput
        include JSON::Serializable

        # The list of the statistics method options.
        @[JSON::Field(key: "Statistics")]
        getter statistics : Array(String)

        # The input for the temporal statistics grouping by time frequency option.
        @[JSON::Field(key: "GroupBy")]
        getter group_by : String?

        # The list of target band names for the temporal statistic to calculate.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        def initialize(
          @statistics : Array(String),
          @group_by : String? = nil,
          @target_bands : Array(String)? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # The input for the time-range filter.
      struct TimeRangeFilterInput
        include JSON::Serializable

        # The end time for the time-range filter.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The start time for the time-range filter.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # The output structure of the time range filter.
      struct TimeRangeFilterOutput
        include JSON::Serializable

        # The ending time for the time range filter.
        @[JSON::Field(key: "EndTime")]
        getter end_time : Time

        # The starting time for the time range filter.
        @[JSON::Field(key: "StartTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to untag.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Keys of the tags you want to remove.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The output resolution (in target georeferenced units) of the result of the operation
      struct UserDefined
        include JSON::Serializable

        # The units for output resolution of the result.
        @[JSON::Field(key: "Unit")]
        getter unit : String

        # The value for output resolution of the result.
        @[JSON::Field(key: "Value")]
        getter value : Float64

        def initialize(
          @unit : String,
          @value : Float64
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil
        )
        end
      end

      # It contains configs such as ReverseGeocodingConfig and MapMatchingConfig.
      struct VectorEnrichmentJobConfig
        include JSON::Serializable

        # The input structure for Map Matching operation type.
        @[JSON::Field(key: "MapMatchingConfig")]
        getter map_matching_config : Types::MapMatchingConfig?

        # The input structure for Reverse Geocoding operation type.
        @[JSON::Field(key: "ReverseGeocodingConfig")]
        getter reverse_geocoding_config : Types::ReverseGeocodingConfig?

        def initialize(
          @map_matching_config : Types::MapMatchingConfig? = nil,
          @reverse_geocoding_config : Types::ReverseGeocodingConfig? = nil
        )
        end
      end

      # The input structure for the data source that represents the storage type of the input data objects.
      struct VectorEnrichmentJobDataSourceConfigInput
        include JSON::Serializable

        # The input structure for the Amazon S3 data that represents the Amazon S3 location of the input data
        # objects.
        @[JSON::Field(key: "S3Data")]
        getter s3_data : Types::VectorEnrichmentJobS3Data?

        def initialize(
          @s3_data : Types::VectorEnrichmentJobS3Data? = nil
        )
        end
      end

      # VectorEnrichmentJob error details in response from GetVectorEnrichmentJob.
      struct VectorEnrichmentJobErrorDetails
        include JSON::Serializable

        # A message that you define and then is processed and rendered by the Vector Enrichment job when the
        # error occurs.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The type of error generated during the Vector Enrichment job.
        @[JSON::Field(key: "ErrorType")]
        getter error_type : String?

        def initialize(
          @error_message : String? = nil,
          @error_type : String? = nil
        )
        end
      end

      # VectorEnrichmentJob export error details in response from GetVectorEnrichmentJob.
      struct VectorEnrichmentJobExportErrorDetails
        include JSON::Serializable

        # The message providing details about the errors generated during the Vector Enrichment job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output error details for an Export operation on a Vector Enrichment job.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The input structure for the InputConfig in a VectorEnrichmentJob.
      struct VectorEnrichmentJobInputConfig
        include JSON::Serializable

        # The input structure for the data source that represents the storage type of the input data objects.
        @[JSON::Field(key: "DataSourceConfig")]
        getter data_source_config : Types::VectorEnrichmentJobDataSourceConfigInput

        # The input structure that defines the data source file type.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : String

        def initialize(
          @data_source_config : Types::VectorEnrichmentJobDataSourceConfigInput,
          @document_type : String
        )
        end
      end

      # The Amazon S3 data for the Vector Enrichment job.
      struct VectorEnrichmentJobS3Data
        include JSON::Serializable

        # The URL to the Amazon S3 data for the Vector Enrichment job.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The Key Management Service key ID for server-side encryption.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # The input structure for specifying ViewOffNadir property filter. ViewOffNadir refers to the angle
      # from the sensor between nadir (straight down) and the scene center. Measured in degrees (0-90).
      struct ViewOffNadirInput
        include JSON::Serializable

        # The minimum value for ViewOffNadir property filter. This filters items having ViewOffNadir greater
        # than or equal to this value.
        @[JSON::Field(key: "LowerBound")]
        getter lower_bound : Float64

        # The maximum value for ViewOffNadir property filter. This filters items having ViewOffNadir lesser
        # than or equal to this value.
        @[JSON::Field(key: "UpperBound")]
        getter upper_bound : Float64

        def initialize(
          @lower_bound : Float64,
          @upper_bound : Float64
        )
        end
      end

      # The input structure for specifying ViewSunAzimuth property filter. ViewSunAzimuth refers to the Sun
      # azimuth angle. From the scene center point on the ground, this is the angle between truth north and
      # the sun. Measured clockwise in degrees (0-360).
      struct ViewSunAzimuthInput
        include JSON::Serializable

        # The minimum value for ViewSunAzimuth property filter. This filters items having ViewSunAzimuth
        # greater than or equal to this value.
        @[JSON::Field(key: "LowerBound")]
        getter lower_bound : Float64

        # The maximum value for ViewSunAzimuth property filter. This filters items having ViewSunAzimuth
        # lesser than or equal to this value.
        @[JSON::Field(key: "UpperBound")]
        getter upper_bound : Float64

        def initialize(
          @lower_bound : Float64,
          @upper_bound : Float64
        )
        end
      end

      # The input structure for specifying ViewSunElevation angle property filter.
      struct ViewSunElevationInput
        include JSON::Serializable

        # The lower bound to view the sun elevation.
        @[JSON::Field(key: "LowerBound")]
        getter lower_bound : Float64

        # The upper bound to view the sun elevation.
        @[JSON::Field(key: "UpperBound")]
        getter upper_bound : Float64

        def initialize(
          @lower_bound : Float64,
          @upper_bound : Float64
        )
        end
      end

      # The structure representing input configuration of ZonalStatistics operation.
      struct ZonalStatisticsConfigInput
        include JSON::Serializable

        # List of zonal statistics to compute.
        @[JSON::Field(key: "Statistics")]
        getter statistics : Array(String)

        # The Amazon S3 path pointing to the GeoJSON containing the polygonal zones.
        @[JSON::Field(key: "ZoneS3Path")]
        getter zone_s3_path : String

        # Bands used in the operation. If no target bands are specified, it uses all bands available input.
        @[JSON::Field(key: "TargetBands")]
        getter target_bands : Array(String)?

        # The Amazon Resource Name (ARN) or an ID of a Amazon Web Services Key Management Service (Amazon Web
        # Services KMS) key that Amazon SageMaker uses to decrypt your output artifacts with Amazon S3
        # server-side encryption. The SageMaker execution role must have kms:GenerateDataKey permission. The
        # KmsKeyId can be any of the following formats: // KMS Key ID "1234abcd-12ab-34cd-56ef-1234567890ab"
        # // Amazon Resource Name (ARN) of a KMS Key
        # "arn:aws:kms:&lt;region&gt;:&lt;account&gt;:key/&lt;key-id-12ab-34cd-56ef-1234567890ab&gt;" For more
        # information about key identifiers, see Key identifiers (KeyID) in the Amazon Web Services Key
        # Management Service (Amazon Web Services KMS) documentation.
        @[JSON::Field(key: "ZoneS3PathKmsKeyId")]
        getter zone_s3_path_kms_key_id : String?

        def initialize(
          @statistics : Array(String),
          @zone_s3_path : String,
          @target_bands : Array(String)? = nil,
          @zone_s3_path_kms_key_id : String? = nil
        )
        end
      end
    end
  end
end
