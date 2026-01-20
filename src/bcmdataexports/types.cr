require "json"
require "time"

module Aws
  module BCMDataExports
    module Types

      # Includes basic information for a data column such as its description, name, and type.

      struct Column
        include JSON::Serializable

        # The description for a column.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The column name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The kind of data a column stores.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateExportRequest
        include JSON::Serializable

        # The details of the export, including data query, name, description, and destination configuration.

        @[JSON::Field(key: "Export")]
        getter export : Types::Export

        # An optional list of tags to associate with the specified export. Each tag consists of a key and a
        # value, and each key must be unique for the resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @export : Types::Export,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end


      struct CreateExportResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        def initialize(
          @export_arn : String? = nil
        )
        end
      end

      # The SQL query of column selections and row filters from the data table you want.

      struct DataQuery
        include JSON::Serializable

        # The query statement.

        @[JSON::Field(key: "QueryStatement")]
        getter query_statement : String

        # The table configuration.

        @[JSON::Field(key: "TableConfigurations")]
        getter table_configurations : Hash(String, Hash(String, String))?

        def initialize(
          @query_statement : String,
          @table_configurations : Hash(String, Hash(String, String))? = nil
        )
        end
      end


      struct DeleteExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        def initialize(
          @export_arn : String
        )
        end
      end


      struct DeleteExportResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        def initialize(
          @export_arn : String? = nil
        )
        end
      end

      # The destinations used for data exports.

      struct DestinationConfigurations
        include JSON::Serializable

        # An object that describes the destination of the data exports file.

        @[JSON::Field(key: "S3Destination")]
        getter s3_destination : Types::S3Destination

        def initialize(
          @s3_destination : Types::S3Destination
        )
        end
      end

      # The reference for the data export update.

      struct ExecutionReference
        include JSON::Serializable

        # The ID for this specific execution.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String

        # The status of this specific execution.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : Types::ExecutionStatus

        def initialize(
          @execution_id : String,
          @execution_status : Types::ExecutionStatus
        )
        end
      end

      # The status of the execution.

      struct ExecutionStatus
        include JSON::Serializable

        # The time when the execution was completed.

        @[JSON::Field(key: "CompletedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter completed_at : Time?

        # The time when the execution was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time when the execution was last updated.

        @[JSON::Field(key: "LastUpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The code for the status of the execution.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # The reason for the failed status.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @status_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The details that are available for an export.

      struct Export
        include JSON::Serializable

        # The data query for this specific data export.

        @[JSON::Field(key: "DataQuery")]
        getter data_query : Types::DataQuery

        # The destination configuration for this specific data export.

        @[JSON::Field(key: "DestinationConfigurations")]
        getter destination_configurations : Types::DestinationConfigurations

        # The name of this specific data export.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The cadence for Amazon Web Services to update the export in your S3 bucket.

        @[JSON::Field(key: "RefreshCadence")]
        getter refresh_cadence : Types::RefreshCadence

        # The description for this specific data export.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        def initialize(
          @data_query : Types::DataQuery,
          @destination_configurations : Types::DestinationConfigurations,
          @name : String,
          @refresh_cadence : Types::RefreshCadence,
          @description : String? = nil,
          @export_arn : String? = nil
        )
        end
      end

      # The reference details for a given export.

      struct ExportReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        # The name of this specific data export.

        @[JSON::Field(key: "ExportName")]
        getter export_name : String

        # The status of this specific data export.

        @[JSON::Field(key: "ExportStatus")]
        getter export_status : Types::ExportStatus

        def initialize(
          @export_arn : String,
          @export_name : String,
          @export_status : Types::ExportStatus
        )
        end
      end

      # The status of the data export.

      struct ExportStatus
        include JSON::Serializable

        # The timestamp of when the export was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The timestamp of when the export was last generated.

        @[JSON::Field(key: "LastRefreshedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_refreshed_at : Time?

        # The timestamp of when the export was updated.

        @[JSON::Field(key: "LastUpdatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The status code for the request.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # The description for the status code.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @created_at : Time? = nil,
          @last_refreshed_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @status_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetExecutionRequest
        include JSON::Serializable

        # The ID for this specific execution.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String

        # The Amazon Resource Name (ARN) of the Export object that generated this specific execution.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        def initialize(
          @execution_id : String,
          @export_arn : String
        )
        end
      end


      struct GetExecutionResponse
        include JSON::Serializable

        # The ID for this specific execution.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The status of this specific execution.

        @[JSON::Field(key: "ExecutionStatus")]
        getter execution_status : Types::ExecutionStatus?

        # The export data for this specific execution. This export data is a snapshot from when the execution
        # was generated. The data could be different from the current export data if the export was updated
        # since the execution was generated.

        @[JSON::Field(key: "Export")]
        getter export : Types::Export?

        def initialize(
          @execution_id : String? = nil,
          @execution_status : Types::ExecutionStatus? = nil,
          @export : Types::Export? = nil
        )
        end
      end


      struct GetExportRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        def initialize(
          @export_arn : String
        )
        end
      end


      struct GetExportResponse
        include JSON::Serializable

        # The data for this specific export.

        @[JSON::Field(key: "Export")]
        getter export : Types::Export?

        # The status of this specific export.

        @[JSON::Field(key: "ExportStatus")]
        getter export_status : Types::ExportStatus?

        def initialize(
          @export : Types::Export? = nil,
          @export_status : Types::ExportStatus? = nil
        )
        end
      end


      struct GetTableRequest
        include JSON::Serializable

        # The name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # TableProperties are additional configurations you can provide to change the data and schema of a
        # table. Each table can have different TableProperties. Tables are not required to have any
        # TableProperties. Each table property has a default value that it assumes if not specified.

        @[JSON::Field(key: "TableProperties")]
        getter table_properties : Hash(String, String)?

        def initialize(
          @table_name : String,
          @table_properties : Hash(String, String)? = nil
        )
        end
      end


      struct GetTableResponse
        include JSON::Serializable

        # The table description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The schema of the table.

        @[JSON::Field(key: "Schema")]
        getter schema : Array(Types::Column)?

        # The name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # TableProperties are additional configurations you can provide to change the data and schema of a
        # table. Each table can have different TableProperties. Tables are not required to have any
        # TableProperties. Each table property has a default value that it assumes if not specified.

        @[JSON::Field(key: "TableProperties")]
        getter table_properties : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @schema : Array(Types::Column)? = nil,
          @table_name : String? = nil,
          @table_properties : Hash(String, String)? = nil
        )
        end
      end

      # An error on the server occurred during the processing of your request. Try again later.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListExecutionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        # The maximum number of objects that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutionsResponse
        include JSON::Serializable

        # The list of executions.

        @[JSON::Field(key: "Executions")]
        getter executions : Array(Types::ExecutionReference)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @executions : Array(Types::ExecutionReference)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportsRequest
        include JSON::Serializable

        # The maximum number of objects that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExportsResponse
        include JSON::Serializable

        # The details of the exports, including name and export status.

        @[JSON::Field(key: "Exports")]
        getter exports : Array(Types::ExportReference)?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @exports : Array(Types::ExportReference)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTablesRequest
        include JSON::Serializable

        # The maximum number of objects that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTablesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of tables.

        @[JSON::Field(key: "Tables")]
        getter tables : Array(Types::Table)?

        def initialize(
          @next_token : String? = nil,
          @tables : Array(Types::Table)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The maximum number of objects that are returned for the request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An optional list of tags to associate with the specified export. Each tag consists of a key and a
        # value, and each key must be unique for the resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)?

        def initialize(
          @next_token : String? = nil,
          @resource_tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      # The cadence for Amazon Web Services to update the data export in your S3 bucket.

      struct RefreshCadence
        include JSON::Serializable

        # The frequency that data exports are updated. The export refreshes each time the source data updates,
        # up to three times daily.

        @[JSON::Field(key: "Frequency")]
        getter frequency : String

        def initialize(
          @frequency : String
        )
        end
      end

      # The specified Amazon Resource Name (ARN) in the request doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The identifier of the resource that was not found.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource that was not found.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The tag structure that contains a tag key and value.

      struct ResourceTag
        include JSON::Serializable

        # The key that's associated with the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value that's associated with the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys of a
      # data exports file.

      struct S3Destination
        include JSON::Serializable

        # The name of the Amazon S3 bucket used as the destination of a data export file.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The output configuration for the data export.

        @[JSON::Field(key: "S3OutputConfigurations")]
        getter s3_output_configurations : Types::S3OutputConfigurations

        # The S3 path prefix you want prepended to the name of your data export.

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String

        # The S3 bucket Region.

        @[JSON::Field(key: "S3Region")]
        getter s3_region : String

        def initialize(
          @s3_bucket : String,
          @s3_output_configurations : Types::S3OutputConfigurations,
          @s3_prefix : String,
          @s3_region : String
        )
        end
      end

      # The compression type, file format, and overwrite preference for the data export.

      struct S3OutputConfigurations
        include JSON::Serializable

        # The compression type for the data export.

        @[JSON::Field(key: "Compression")]
        getter compression : String

        # The file format for the data export.

        @[JSON::Field(key: "Format")]
        getter format : String

        # The output type for the data export.

        @[JSON::Field(key: "OutputType")]
        getter output_type : String

        # The rule to follow when generating a version of the data export file. You have the choice to
        # overwrite the previous version or to be delivered in addition to the previous versions. Overwriting
        # exports can save on Amazon S3 storage costs. Creating new export versions allows you to track the
        # changes in cost and usage data over time.

        @[JSON::Field(key: "Overwrite")]
        getter overwrite : String

        def initialize(
          @compression : String,
          @format : String,
          @output_type : String,
          @overwrite : String
        )
        end
      end

      # You've reached the limit on the number of resources you can create, or exceeded the size of an
      # individual resource.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota code that was exceeded.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The service code that exceeded quota. It will always be “AWSBillingAndCostManagementDataExports”.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The identifier of the resource that exceeded quota.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource that exceeded quota.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The details for the data export table.

      struct Table
        include JSON::Serializable

        # The description for the table.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the table.

        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The properties for the table.

        @[JSON::Field(key: "TableProperties")]
        getter table_properties : Array(Types::TablePropertyDescription)?

        def initialize(
          @description : String? = nil,
          @table_name : String? = nil,
          @table_properties : Array(Types::TablePropertyDescription)? = nil
        )
        end
      end

      # The properties for the data export table.

      struct TablePropertyDescription
        include JSON::Serializable

        # The default value for the table.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # The description for the table.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the table.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The valid values for the table.

        @[JSON::Field(key: "ValidValues")]
        getter valid_values : Array(String)?

        def initialize(
          @default_value : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @valid_values : Array(String)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to associate with the resource. Each tag consists of a key and a value, and each key must
        # be unique for the resource.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::ResourceTag)

        def initialize(
          @resource_arn : String,
          @resource_tags : Array(Types::ResourceTag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The quota code that exceeded the throttling limit.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The service code that exceeded the throttling limit. It will always be
        # “AWSBillingAndCostManagementDataExports”.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The unique identifier for the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys that are associated with the resource ARN.

        @[JSON::Field(key: "ResourceTagKeys")]
        getter resource_tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @resource_tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateExportRequest
        include JSON::Serializable

        # The name and query details for the export.

        @[JSON::Field(key: "Export")]
        getter export : Types::Export

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        def initialize(
          @export : Types::Export,
          @export_arn : String
        )
        end
      end


      struct UpdateExportResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for this export.

        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        def initialize(
          @export_arn : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The list of fields that are invalid.

        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # The reason for the validation exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by the Amazon Web Services service in a specified
      # field.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message with the reason for the validation exception error.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The field name where the invalid entry was detected.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
