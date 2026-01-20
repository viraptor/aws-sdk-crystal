require "json"
require "time"

module AwsSdk
  module ApplicationCostProfiler
    module Types

      # You do not have permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteReportDefinitionRequest
        include JSON::Serializable

        # Required. ID of the report to delete.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct DeleteReportDefinitionResult
        include JSON::Serializable

        # ID of the report that was deleted.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end


      struct GetReportDefinitionRequest
        include JSON::Serializable

        # ID of the report to retrieve.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct GetReportDefinitionResult
        include JSON::Serializable

        # Timestamp (milliseconds) when this report definition was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Amazon Simple Storage Service (Amazon S3) location where the report is uploaded.

        @[JSON::Field(key: "destinationS3Location")]
        getter destination_s3_location : Types::S3Location

        # Format of the generated report.

        @[JSON::Field(key: "format")]
        getter format : String

        # Timestamp (milliseconds) when this report definition was last updated.

        @[JSON::Field(key: "lastUpdated")]
        getter last_updated : Time

        # Description of the report.

        @[JSON::Field(key: "reportDescription")]
        getter report_description : String

        # Cadence used to generate the report.

        @[JSON::Field(key: "reportFrequency")]
        getter report_frequency : String

        # ID of the report retrieved.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @created_at : Time,
          @destination_s3_location : Types::S3Location,
          @format : String,
          @last_updated : Time,
          @report_description : String,
          @report_frequency : String,
          @report_id : String
        )
        end
      end


      struct ImportApplicationUsageRequest
        include JSON::Serializable

        # Amazon S3 location to import application usage data from.

        @[JSON::Field(key: "sourceS3Location")]
        getter source_s3_location : Types::SourceS3Location

        def initialize(
          @source_s3_location : Types::SourceS3Location
        )
        end
      end


      struct ImportApplicationUsageResult
        include JSON::Serializable

        # ID of the import request.

        @[JSON::Field(key: "importId")]
        getter import_id : String

        def initialize(
          @import_id : String
        )
        end
      end

      # An internal server error occurred. Retry your request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListReportDefinitionsRequest
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReportDefinitionsResult
        include JSON::Serializable

        # The value of the next token, if it exists. Null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The retrieved reports.

        @[JSON::Field(key: "reportDefinitions")]
        getter report_definitions : Array(Types::ReportDefinition)?

        def initialize(
          @next_token : String? = nil,
          @report_definitions : Array(Types::ReportDefinition)? = nil
        )
        end
      end


      struct PutReportDefinitionRequest
        include JSON::Serializable

        # Required. Amazon Simple Storage Service (Amazon S3) location where Application Cost Profiler uploads
        # the report.

        @[JSON::Field(key: "destinationS3Location")]
        getter destination_s3_location : Types::S3Location

        # Required. The format to use for the generated report.

        @[JSON::Field(key: "format")]
        getter format : String

        # Required. Description of the report.

        @[JSON::Field(key: "reportDescription")]
        getter report_description : String

        # Required. The cadence to generate the report.

        @[JSON::Field(key: "reportFrequency")]
        getter report_frequency : String

        # Required. ID of the report. You can choose any valid string matching the pattern for the ID.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @destination_s3_location : Types::S3Location,
          @format : String,
          @report_description : String,
          @report_frequency : String,
          @report_id : String
        )
        end
      end


      struct PutReportDefinitionResult
        include JSON::Serializable

        # ID of the report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end

      # The configuration of a report in AWS Application Cost Profiler.

      struct ReportDefinition
        include JSON::Serializable

        # Timestamp (milliseconds) when this report definition was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The location in Amazon Simple Storage Service (Amazon S3) the reports should be saved to.

        @[JSON::Field(key: "destinationS3Location")]
        getter destination_s3_location : Types::S3Location?

        # The format used for the generated reports.

        @[JSON::Field(key: "format")]
        getter format : String?

        # Timestamp (milliseconds) when this report definition was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Description of the report

        @[JSON::Field(key: "reportDescription")]
        getter report_description : String?

        # The cadence at which the report is generated.

        @[JSON::Field(key: "reportFrequency")]
        getter report_frequency : String?

        # The ID of the report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @created_at : Time? = nil,
          @destination_s3_location : Types::S3Location? = nil,
          @format : String? = nil,
          @last_updated_at : Time? = nil,
          @report_description : String? = nil,
          @report_frequency : String? = nil,
          @report_id : String? = nil
        )
        end
      end

      # Represents the Amazon Simple Storage Service (Amazon S3) location where AWS Application Cost
      # Profiler reports are generated and then written to.

      struct S3Location
        include JSON::Serializable

        # Name of the S3 bucket.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # Prefix for the location to write to.

        @[JSON::Field(key: "prefix")]
        getter prefix : String

        def initialize(
          @bucket : String,
          @prefix : String
        )
        end
      end

      # Your request exceeds one or more of the service quotas.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the Amazon Simple Storage Service (Amazon S3) location where usage data is read from.

      struct SourceS3Location
        include JSON::Serializable

        # Name of the bucket.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # Key of the object.

        @[JSON::Field(key: "key")]
        getter key : String

        # Region of the bucket. Only required for Regions that are disabled by default. For more infomration
        # about Regions that are disabled by default, see Enabling a Region in the AWS General Reference guide
        # .

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @bucket : String,
          @key : String,
          @region : String? = nil
        )
        end
      end

      # The calls to AWS Application Cost Profiler API are throttled. The request was denied.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UpdateReportDefinitionRequest
        include JSON::Serializable

        # Required. Amazon Simple Storage Service (Amazon S3) location where Application Cost Profiler uploads
        # the report.

        @[JSON::Field(key: "destinationS3Location")]
        getter destination_s3_location : Types::S3Location

        # Required. The format to use for the generated report.

        @[JSON::Field(key: "format")]
        getter format : String

        # Required. Description of the report.

        @[JSON::Field(key: "reportDescription")]
        getter report_description : String

        # Required. The cadence to generate the report.

        @[JSON::Field(key: "reportFrequency")]
        getter report_frequency : String

        # Required. ID of the report to update.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @destination_s3_location : Types::S3Location,
          @format : String,
          @report_description : String,
          @report_frequency : String,
          @report_id : String
        )
        end
      end


      struct UpdateReportDefinitionResult
        include JSON::Serializable

        # ID of the report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints for the API.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
