require "json"
require "time"

module AwsSdk
  module BackupSearch
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        # User does not have sufficient access to perform this action.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # This filters by recovery points within the CreatedAfter and CreatedBefore timestamps.
      struct BackupCreationTimeFilter
        include JSON::Serializable

        # This timestamp includes recovery points only created after the specified time.
        @[JSON::Field(key: "CreatedAfter")]
        getter created_after : Time?

        # This timestamp includes recovery points only created before the specified time.
        @[JSON::Field(key: "CreatedBefore")]
        getter created_before : Time?

        def initialize(
          @created_after : Time? = nil,
          @created_before : Time? = nil
        )
        end
      end

      # This exception occurs when a conflict with a previous successful operation is detected. This
      # generally occurs when the previous operation did not have time to propagate to the host serving the
      # current request. A retry (with appropriate backoff logic) is the recommended response to this
      # exception.
      struct ConflictException
        include JSON::Serializable

        # Updating or deleting a resource can cause an inconsistent state.
        @[JSON::Field(key: "message")]
        getter message : String

        # Identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # This contains information results retrieved from a search job that may not have completed.
      struct CurrentSearchProgress
        include JSON::Serializable

        # This number is the sum of all items that match the item filters in a search job in progress.
        @[JSON::Field(key: "ItemsMatchedCount")]
        getter items_matched_count : Int64?

        # This number is the sum of all items that have been scanned so far during a search job.
        @[JSON::Field(key: "ItemsScannedCount")]
        getter items_scanned_count : Int64?

        # This number is the sum of all backups that have been scanned so far during a search job.
        @[JSON::Field(key: "RecoveryPointsScannedCount")]
        getter recovery_points_scanned_count : Int32?

        def initialize(
          @items_matched_count : Int64? = nil,
          @items_scanned_count : Int64? = nil,
          @recovery_points_scanned_count : Int32? = nil
        )
        end
      end

      # This contains arrays of objects, which may include CreationTimes time condition objects, FilePaths
      # string objects, LastModificationTimes time condition objects,
      struct EBSItemFilter
        include JSON::Serializable

        # You can include 1 to 10 values. If one is included, the results will return only items that match.
        # If more than one is included, the results will return all items that match any of the included
        # values.
        @[JSON::Field(key: "CreationTimes")]
        getter creation_times : Array(Types::TimeCondition)?

        # You can include 1 to 10 values. If one file path is included, the results will return only items
        # that match the file path. If more than one file path is included, the results will return all items
        # that match any of the file paths.
        @[JSON::Field(key: "FilePaths")]
        getter file_paths : Array(Types::StringCondition)?

        # You can include 1 to 10 values. If one is included, the results will return only items that match.
        # If more than one is included, the results will return all items that match any of the included
        # values.
        @[JSON::Field(key: "LastModificationTimes")]
        getter last_modification_times : Array(Types::TimeCondition)?

        # You can include 1 to 10 values. If one is included, the results will return only items that match.
        # If more than one is included, the results will return all items that match any of the included
        # values.
        @[JSON::Field(key: "Sizes")]
        getter sizes : Array(Types::LongCondition)?

        def initialize(
          @creation_times : Array(Types::TimeCondition)? = nil,
          @file_paths : Array(Types::StringCondition)? = nil,
          @last_modification_times : Array(Types::TimeCondition)? = nil,
          @sizes : Array(Types::LongCondition)? = nil
        )
        end
      end

      # These are the items returned in the results of a search of Amazon EBS backup metadata.
      struct EBSResultItem
        include JSON::Serializable

        # These are one or more items in the results that match values for the Amazon Resource Name (ARN) of
        # recovery points returned in a search of Amazon EBS backup metadata.
        @[JSON::Field(key: "BackupResourceArn")]
        getter backup_resource_arn : String?

        # The name of the backup vault.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # These are one or more items in the results that match values for creation times returned in a search
        # of Amazon EBS backup metadata.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # These are one or more items in the results that match values for file paths returned in a search of
        # Amazon EBS backup metadata.
        @[JSON::Field(key: "FilePath")]
        getter file_path : String?

        # These are one or more items in the results that match values for file sizes returned in a search of
        # Amazon EBS backup metadata.
        @[JSON::Field(key: "FileSize")]
        getter file_size : Int64?

        # These are one or more items in the results that match values for file systems returned in a search
        # of Amazon EBS backup metadata.
        @[JSON::Field(key: "FileSystemIdentifier")]
        getter file_system_identifier : String?

        # These are one or more items in the results that match values for Last Modified Time returned in a
        # search of Amazon EBS backup metadata.
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # These are one or more items in the results that match values for the Amazon Resource Name (ARN) of
        # source resources returned in a search of Amazon EBS backup metadata.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        def initialize(
          @backup_resource_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_time : Time? = nil,
          @file_path : String? = nil,
          @file_size : Int64? = nil,
          @file_system_identifier : String? = nil,
          @last_modified_time : Time? = nil,
          @source_resource_arn : String? = nil
        )
        end
      end

      # This is the summary of an export job.
      struct ExportJobSummary
        include JSON::Serializable

        # This is the unique string that identifies a specific export job.
        @[JSON::Field(key: "ExportJobIdentifier")]
        getter export_job_identifier : String

        # This is a timestamp of the time the export job compeleted.
        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # This is a timestamp of the time the export job was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # This is the unique ARN (Amazon Resource Name) that belongs to the new export job.
        @[JSON::Field(key: "ExportJobArn")]
        getter export_job_arn : String?

        # The unique string that identifies the Amazon Resource Name (ARN) of the specified search job.
        @[JSON::Field(key: "SearchJobArn")]
        getter search_job_arn : String?

        # The status of the export job is one of the following: CREATED ; RUNNING ; FAILED ; or COMPLETED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A status message is a string that is returned for an export job. A status message is included for
        # any status other than COMPLETED without issues.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @export_job_identifier : String,
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @export_job_arn : String? = nil,
          @search_job_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # This contains the export specification object.
      struct ExportSpecification
        include JSON::Serializable

        # This specifies the destination Amazon S3 bucket for the export job. And, if included, it also
        # specifies the destination prefix.
        @[JSON::Field(key: "s3ExportSpecification")]
        getter s3_export_specification : Types::S3ExportSpecification?

        def initialize(
          @s3_export_specification : Types::S3ExportSpecification? = nil
        )
        end
      end

      struct GetSearchJobInput
        include JSON::Serializable

        # Required unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        def initialize(
          @search_job_identifier : String
        )
        end
      end

      struct GetSearchJobOutput
        include JSON::Serializable

        # The date and time that a search job was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CompletionTime is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time

        # Item Filters represent all input item properties specified when the search was created.
        @[JSON::Field(key: "ItemFilters")]
        getter item_filters : Types::ItemFilters

        # The unique string that identifies the Amazon Resource Name (ARN) of the specified search job.
        @[JSON::Field(key: "SearchJobArn")]
        getter search_job_arn : String

        # The unique string that identifies the specified search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        # The search scope is all backup properties input into a search.
        @[JSON::Field(key: "SearchScope")]
        getter search_scope : Types::SearchScope

        # The current status of the specified search job. A search job may have one of the following statuses:
        # RUNNING ; COMPLETED ; STOPPED ; FAILED ; TIMED_OUT ; or EXPIRED .
        @[JSON::Field(key: "Status")]
        getter status : String

        # The date and time that a search job completed, in Unix format and Coordinated Universal Time (UTC).
        # The value of CompletionTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # Returns numbers representing BackupsScannedCount, ItemsScanned, and ItemsMatched.
        @[JSON::Field(key: "CurrentSearchProgress")]
        getter current_search_progress : Types::CurrentSearchProgress?

        # The encryption key for the specified search job. Example:
        # arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab .
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # Returned name of the specified search job.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Returned summary of the specified search job scope, including: TotalBackupsToScanCount, the number
        # of recovery points returned by the search. TotalItemsToScanCount, the number of items returned by
        # the search.
        @[JSON::Field(key: "SearchScopeSummary")]
        getter search_scope_summary : Types::SearchScopeSummary?

        # A status message will be returned for either a earch job with a status of ERRORED or a status of
        # COMPLETED jobs with issues. For example, a message may say that a search contained recovery points
        # unable to be scanned because of a permissions issue.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time,
          @item_filters : Types::ItemFilters,
          @search_job_arn : String,
          @search_job_identifier : String,
          @search_scope : Types::SearchScope,
          @status : String,
          @completion_time : Time? = nil,
          @current_search_progress : Types::CurrentSearchProgress? = nil,
          @encryption_key_arn : String? = nil,
          @name : String? = nil,
          @search_scope_summary : Types::SearchScopeSummary? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetSearchResultExportJobInput
        include JSON::Serializable

        # This is the unique string that identifies a specific export job. Required for this operation.
        @[JSON::Field(key: "ExportJobIdentifier")]
        getter export_job_identifier : String

        def initialize(
          @export_job_identifier : String
        )
        end
      end

      struct GetSearchResultExportJobOutput
        include JSON::Serializable

        # This is the unique string that identifies the specified export job.
        @[JSON::Field(key: "ExportJobIdentifier")]
        getter export_job_identifier : String

        # The date and time that an export job completed, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # The date and time that an export job was created, in Unix format and Coordinated Universal Time
        # (UTC). The value of CreationTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The unique Amazon Resource Name (ARN) that uniquely identifies the export job.
        @[JSON::Field(key: "ExportJobArn")]
        getter export_job_arn : String?

        # The export specification consists of the destination S3 bucket to which the search results were
        # exported, along with the destination prefix.
        @[JSON::Field(key: "ExportSpecification")]
        getter export_specification : Types::ExportSpecification?

        # The unique string that identifies the Amazon Resource Name (ARN) of the specified search job.
        @[JSON::Field(key: "SearchJobArn")]
        getter search_job_arn : String?

        # This is the current status of the export job.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A status message is a string that is returned for search job with a status of FAILED , along with
        # steps to remedy and retry the operation.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @export_job_identifier : String,
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @export_job_arn : String? = nil,
          @export_specification : Types::ExportSpecification? = nil,
          @search_job_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An internal server error occurred. Retry your request.
      struct InternalServerException
        include JSON::Serializable

        # Unexpected error during processing of request.
        @[JSON::Field(key: "message")]
        getter message : String

        # Retry the call after number of seconds.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Item Filters represent all input item properties specified when the search was created. Contains
      # either EBSItemFilters or S3ItemFilters
      struct ItemFilters
        include JSON::Serializable

        # This array can contain CreationTimes, FilePaths, LastModificationTimes, or Sizes objects.
        @[JSON::Field(key: "EBSItemFilters")]
        getter ebs_item_filters : Array(Types::EBSItemFilter)?

        # This array can contain CreationTimes, ETags, ObjectKeys, Sizes, or VersionIds objects.
        @[JSON::Field(key: "S3ItemFilters")]
        getter s3_item_filters : Array(Types::S3ItemFilter)?

        def initialize(
          @ebs_item_filters : Array(Types::EBSItemFilter)? = nil,
          @s3_item_filters : Array(Types::S3ItemFilter)? = nil
        )
        end
      end

      struct ListSearchJobBackupsInput
        include JSON::Serializable

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned backups included in a search job. For example, if
        # a request is made to return MaxResults number of backups, NextToken allows you to return more items
        # in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @search_job_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchJobBackupsOutput
        include JSON::Serializable

        # The recovery points returned the results of a search job
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::SearchJobBackupsResult)

        # The next item following a partial list of returned backups included in a search job. For example, if
        # a request is made to return MaxResults number of backups, NextToken allows you to return more items
        # in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::SearchJobBackupsResult),
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchJobResultsInput
        include JSON::Serializable

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned search job results. For example, if a request is
        # made to return MaxResults number of search job results, NextToken allows you to return more items in
        # your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @search_job_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchJobResultsOutput
        include JSON::Serializable

        # The results consist of either EBSResultItem or S3ResultItem.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::ResultItem)

        # The next item following a partial list of search job results. For example, if a request is made to
        # return MaxResults number of backups, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::ResultItem),
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchJobsInput
        include JSON::Serializable

        # Include this parameter to filter list by search job status.
        @[JSON::Field(key: "Status")]
        getter by_status : String?

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned search jobs. For example, if a request is made to
        # return MaxResults number of backups, NextToken allows you to return more items in your list starting
        # at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @by_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchJobsOutput
        include JSON::Serializable

        # The search jobs among the list, with details of the returned search jobs.
        @[JSON::Field(key: "SearchJobs")]
        getter search_jobs : Array(Types::SearchJobSummary)

        # The next item following a partial list of returned backups included in a search job. For example, if
        # a request is made to return MaxResults number of backups, NextToken allows you to return more items
        # in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @search_jobs : Array(Types::SearchJobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSearchResultExportJobsInput
        include JSON::Serializable

        # The maximum number of resource list items to be returned.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned backups included in a search job. For example, if
        # a request is made to return MaxResults number of backups, NextToken allows you to return more items
        # in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String?

        # The search jobs to be included in the export job can be filtered by including this parameter.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @search_job_identifier : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListSearchResultExportJobsOutput
        include JSON::Serializable

        # The operation returns the included export jobs.
        @[JSON::Field(key: "ExportJobs")]
        getter export_jobs : Array(Types::ExportJobSummary)

        # The next item following a partial list of returned backups included in a search job. For example, if
        # a request is made to return MaxResults number of backups, NextToken allows you to return more items
        # in your list starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_jobs : Array(Types::ExportJobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the resource.&gt;
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # List of tags returned by the operation.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The long condition contains a Value and can optionally contain an Operator .
      struct LongCondition
        include JSON::Serializable

        # The value of an item included in one of the search item filters.
        @[JSON::Field(key: "Value")]
        getter value : Int64

        # A string that defines what values will be returned. If this is included, avoid combinations of
        # operators that will return all possible values. For example, including both EQUALS_TO and
        # NOT_EQUALS_TO with a value of 4 will return all values.
        @[JSON::Field(key: "Operator")]
        getter operator : String?

        def initialize(
          @value : Int64,
          @operator : String? = nil
        )
        end
      end

      # The resource was not found for this request. Confirm the resource information, such as the ARN or
      # type is correct and exists, then retry the request.
      struct ResourceNotFoundException
        include JSON::Serializable

        # Request references a resource which does not exist.
        @[JSON::Field(key: "message")]
        getter message : String

        # Hypothetical identifier of the resource affected.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Hypothetical type of the resource affected.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # This is an object representing the item returned in the results of a search for a specific resource
      # type.
      struct ResultItem
        include JSON::Serializable

        # These are items returned in the search results of an Amazon EBS search.
        @[JSON::Field(key: "EBSResultItem")]
        getter ebs_result_item : Types::EBSResultItem?

        # These are items returned in the search results of an Amazon S3 search.
        @[JSON::Field(key: "S3ResultItem")]
        getter s3_result_item : Types::S3ResultItem?

        def initialize(
          @ebs_result_item : Types::EBSResultItem? = nil,
          @s3_result_item : Types::S3ResultItem? = nil
        )
        end
      end

      # This specification contains a required string of the destination bucket; optionally, you can include
      # the destination prefix.
      struct S3ExportSpecification
        include JSON::Serializable

        # This specifies the destination Amazon S3 bucket for the export job.
        @[JSON::Field(key: "DestinationBucket")]
        getter destination_bucket : String

        # This specifies the prefix for the destination Amazon S3 bucket for the export job.
        @[JSON::Field(key: "DestinationPrefix")]
        getter destination_prefix : String?

        def initialize(
          @destination_bucket : String,
          @destination_prefix : String? = nil
        )
        end
      end

      # This contains arrays of objects, which may include ObjectKeys, Sizes, CreationTimes, VersionIds,
      # and/or Etags.
      struct S3ItemFilter
        include JSON::Serializable

        # You can include 1 to 10 values. If one value is included, the results will return only items that
        # match the value. If more than one value is included, the results will return all items that match
        # any of the values.
        @[JSON::Field(key: "CreationTimes")]
        getter creation_times : Array(Types::TimeCondition)?

        # You can include 1 to 10 values. If one value is included, the results will return only items that
        # match the value. If more than one value is included, the results will return all items that match
        # any of the values.
        @[JSON::Field(key: "ETags")]
        getter e_tags : Array(Types::StringCondition)?

        # You can include 1 to 10 values. If one value is included, the results will return only items that
        # match the value. If more than one value is included, the results will return all items that match
        # any of the values.
        @[JSON::Field(key: "ObjectKeys")]
        getter object_keys : Array(Types::StringCondition)?

        # You can include 1 to 10 values. If one value is included, the results will return only items that
        # match the value. If more than one value is included, the results will return all items that match
        # any of the values.
        @[JSON::Field(key: "Sizes")]
        getter sizes : Array(Types::LongCondition)?

        # You can include 1 to 10 values. If one value is included, the results will return only items that
        # match the value. If more than one value is included, the results will return all items that match
        # any of the values.
        @[JSON::Field(key: "VersionIds")]
        getter version_ids : Array(Types::StringCondition)?

        def initialize(
          @creation_times : Array(Types::TimeCondition)? = nil,
          @e_tags : Array(Types::StringCondition)? = nil,
          @object_keys : Array(Types::StringCondition)? = nil,
          @sizes : Array(Types::LongCondition)? = nil,
          @version_ids : Array(Types::StringCondition)? = nil
        )
        end
      end

      # These are the items returned in the results of a search of Amazon S3 backup metadata.
      struct S3ResultItem
        include JSON::Serializable

        # These are items in the returned results that match recovery point Amazon Resource Names (ARN) input
        # during a search of Amazon S3 backup metadata.
        @[JSON::Field(key: "BackupResourceArn")]
        getter backup_resource_arn : String?

        # The name of the backup vault.
        @[JSON::Field(key: "BackupVaultName")]
        getter backup_vault_name : String?

        # These are one or more items in the returned results that match values for item creation time input
        # during a search of Amazon S3 backup metadata.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # These are one or more items in the returned results that match values for ETags input during a
        # search of Amazon S3 backup metadata.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        # This is one or more items returned in the results of a search of Amazon S3 backup metadata that
        # match the values input for object key.
        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String?

        # These are items in the returned results that match values for object size(s) input during a search
        # of Amazon S3 backup metadata.
        @[JSON::Field(key: "ObjectSize")]
        getter object_size : Int64?

        # These are items in the returned results that match source Amazon Resource Names (ARN) input during a
        # search of Amazon S3 backup metadata.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        # These are one or more items in the returned results that match values for version IDs input during a
        # search of Amazon S3 backup metadata.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @backup_resource_arn : String? = nil,
          @backup_vault_name : String? = nil,
          @creation_time : Time? = nil,
          @e_tag : String? = nil,
          @object_key : String? = nil,
          @object_size : Int64? = nil,
          @source_resource_arn : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # This contains the information about recovery points returned in results of a search job.
      struct SearchJobBackupsResult
        include JSON::Serializable

        # This is the creation time of the backup (recovery point).
        @[JSON::Field(key: "BackupCreationTime")]
        getter backup_creation_time : Time?

        # The Amazon Resource Name (ARN) that uniquely identifies the backup resources.
        @[JSON::Field(key: "BackupResourceArn")]
        getter backup_resource_arn : String?

        # This is the creation time of the backup index.
        @[JSON::Field(key: "IndexCreationTime")]
        getter index_creation_time : Time?

        # This is the resource type of the search.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The Amazon Resource Name (ARN) that uniquely identifies the source resources.
        @[JSON::Field(key: "SourceResourceArn")]
        getter source_resource_arn : String?

        # This is the status of the search job backup result.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # This is the status message included with the results.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @backup_creation_time : Time? = nil,
          @backup_resource_arn : String? = nil,
          @index_creation_time : Time? = nil,
          @resource_type : String? = nil,
          @source_resource_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # This is information pertaining to a search job.
      struct SearchJobSummary
        include JSON::Serializable

        # This is the completion time of the search job.
        @[JSON::Field(key: "CompletionTime")]
        getter completion_time : Time?

        # This is the creation time of the search job.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # This is the name of the search job.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique string that identifies the Amazon Resource Name (ARN) of the specified search job.
        @[JSON::Field(key: "SearchJobArn")]
        getter search_job_arn : String?

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String?

        # Returned summary of the specified search job scope, including: TotalBackupsToScanCount, the number
        # of recovery points returned by the search. TotalItemsToScanCount, the number of items returned by
        # the search.
        @[JSON::Field(key: "SearchScopeSummary")]
        getter search_scope_summary : Types::SearchScopeSummary?

        # This is the status of the search job.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A status message will be returned for either a earch job with a status of ERRORED or a status of
        # COMPLETED jobs with issues. For example, a message may say that a search contained recovery points
        # unable to be scanned because of a permissions issue.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @completion_time : Time? = nil,
          @creation_time : Time? = nil,
          @name : String? = nil,
          @search_job_arn : String? = nil,
          @search_job_identifier : String? = nil,
          @search_scope_summary : Types::SearchScopeSummary? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The search scope is all backup properties input into a search.
      struct SearchScope
        include JSON::Serializable

        # The resource types included in a search. Eligible resource types include S3 and EBS.
        @[JSON::Field(key: "BackupResourceTypes")]
        getter backup_resource_types : Array(String)

        # The Amazon Resource Name (ARN) that uniquely identifies the backup resources.
        @[JSON::Field(key: "BackupResourceArns")]
        getter backup_resource_arns : Array(String)?

        # This is the time a backup resource was created.
        @[JSON::Field(key: "BackupResourceCreationTime")]
        getter backup_resource_creation_time : Types::BackupCreationTimeFilter?

        # These are one or more tags on the backup (recovery point).
        @[JSON::Field(key: "BackupResourceTags")]
        getter backup_resource_tags : Hash(String, String)?

        # The Amazon Resource Name (ARN) that uniquely identifies the source resources.
        @[JSON::Field(key: "SourceResourceArns")]
        getter source_resource_arns : Array(String)?

        def initialize(
          @backup_resource_types : Array(String),
          @backup_resource_arns : Array(String)? = nil,
          @backup_resource_creation_time : Types::BackupCreationTimeFilter? = nil,
          @backup_resource_tags : Hash(String, String)? = nil,
          @source_resource_arns : Array(String)? = nil
        )
        end
      end

      # The summary of the specified search job scope, including: TotalBackupsToScanCount, the number of
      # recovery points returned by the search. TotalItemsToScanCount, the number of items returned by the
      # search.
      struct SearchScopeSummary
        include JSON::Serializable

        # This is the count of the total number of items that will be scanned in a search.
        @[JSON::Field(key: "TotalItemsToScanCount")]
        getter total_items_to_scan_count : Int64?

        # This is the count of the total number of backups that will be scanned in a search.
        @[JSON::Field(key: "TotalRecoveryPointsToScanCount")]
        getter total_recovery_points_to_scan_count : Int32?

        def initialize(
          @total_items_to_scan_count : Int64? = nil,
          @total_recovery_points_to_scan_count : Int32? = nil
        )
        end
      end

      # The request denied due to exceeding the quota limits permitted.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        # This request was not successful due to a service quota exceeding limits.
        @[JSON::Field(key: "message")]
        getter message : String

        # This is the code specific to the quota type.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # Identifier of the resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # Type of resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # This is the code unique to the originating service with the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      struct StartSearchJobInput
        include JSON::Serializable

        # This object can contain BackupResourceTypes, BackupResourceArns, BackupResourceCreationTime,
        # BackupResourceTags, and SourceResourceArns to filter the recovery points returned by the search job.
        @[JSON::Field(key: "SearchScope")]
        getter search_scope : Types::SearchScope

        # Include this parameter to allow multiple identical calls for idempotency. A client token is valid
        # for 8 hours after the first request that uses it is completed. After this time, any request with the
        # same token is treated as a new request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The encryption key for the specified search job.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String?

        # Item Filters represent all input item properties specified when the search was created. Contains
        # either EBSItemFilters or S3ItemFilters
        @[JSON::Field(key: "ItemFilters")]
        getter item_filters : Types::ItemFilters?

        # Include alphanumeric characters to create a name for this search job.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # List of tags returned by the operation.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @search_scope : Types::SearchScope,
          @client_token : String? = nil,
          @encryption_key_arn : String? = nil,
          @item_filters : Types::ItemFilters? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartSearchJobOutput
        include JSON::Serializable

        # The date and time that a job was created, in Unix format and Coordinated Universal Time (UTC). The
        # value of CompletionTime is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The unique string that identifies the Amazon Resource Name (ARN) of the specified search job.
        @[JSON::Field(key: "SearchJobArn")]
        getter search_job_arn : String?

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String?

        def initialize(
          @creation_time : Time? = nil,
          @search_job_arn : String? = nil,
          @search_job_identifier : String? = nil
        )
        end
      end

      struct StartSearchResultExportJobInput
        include JSON::Serializable

        # This specification contains a required string of the destination bucket; optionally, you can include
        # the destination prefix.
        @[JSON::Field(key: "ExportSpecification")]
        getter export_specification : Types::ExportSpecification

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        # Include this parameter to allow multiple identical calls for idempotency. A client token is valid
        # for 8 hours after the first request that uses it is completed. After this time, any request with the
        # same token is treated as a new request.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # This parameter specifies the role ARN used to start the search results export jobs.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Optional tags to include. A tag is a key-value pair you can use to manage, filter, and search for
        # your resources. Allowed characters include UTF-8 letters, numbers, spaces, and the following
        # characters: + - = . _ : /.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @export_specification : Types::ExportSpecification,
          @search_job_identifier : String,
          @client_token : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartSearchResultExportJobOutput
        include JSON::Serializable

        # This is the unique identifier that specifies the new export job.
        @[JSON::Field(key: "ExportJobIdentifier")]
        getter export_job_identifier : String

        # This is the unique ARN (Amazon Resource Name) that belongs to the new export job.
        @[JSON::Field(key: "ExportJobArn")]
        getter export_job_arn : String?

        def initialize(
          @export_job_identifier : String,
          @export_job_arn : String? = nil
        )
        end
      end

      struct StopSearchJobInput
        include JSON::Serializable

        # The unique string that specifies the search job.
        @[JSON::Field(key: "SearchJobIdentifier")]
        getter search_job_identifier : String

        def initialize(
          @search_job_identifier : String
        )
        end
      end

      struct StopSearchJobOutput
        include JSON::Serializable

        def initialize
        end
      end

      # This contains the value of the string and can contain one or more operators.
      struct StringCondition
        include JSON::Serializable

        # The value of the string.
        @[JSON::Field(key: "Value")]
        getter value : String

        # A string that defines what values will be returned. If this is included, avoid combinations of
        # operators that will return all possible values. For example, including both EQUALS_TO and
        # NOT_EQUALS_TO with a value of 4 will return all values.
        @[JSON::Field(key: "Operator")]
        getter operator : String?

        def initialize(
          @value : String,
          @operator : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the resource. This is the resource that will
        # have the indicated tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Required tags to include. A tag is a key-value pair you can use to manage, filter, and search for
        # your resources. Allowed characters include UTF-8 letters, numbers, spaces, and the following
        # characters: + - = . _ : /.
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        # Request was unsuccessful due to request throttling.
        @[JSON::Field(key: "message")]
        getter message : String

        # This is the code unique to the originating service with the quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # Retry the call after number of seconds.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # This is the code unique to the originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # A time condition denotes a creation time, last modification time, or other time.
      struct TimeCondition
        include JSON::Serializable

        # This is the timestamp value of the time condition.
        @[JSON::Field(key: "Value")]
        getter value : Time

        # A string that defines what values will be returned. If this is included, avoid combinations of
        # operators that will return all possible values. For example, including both EQUALS_TO and
        # NOT_EQUALS_TO with a value of 4 will return all values.
        @[JSON::Field(key: "Operator")]
        getter operator : String?

        def initialize(
          @value : Time,
          @operator : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the resource where you want to remove tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # This required parameter contains the tag keys you want to remove from the source.
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

      # The input fails to satisfy the constraints specified by a service.
      struct ValidationException
        include JSON::Serializable

        # The input fails to satisfy the constraints specified by an Amazon service.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
