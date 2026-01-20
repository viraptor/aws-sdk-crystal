module Aws
  module BackupSearch
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "backup-search"
      ENDPOINT_PREFIX = "backup-search"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://backup-search-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://backup-search.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      GET_SEARCH_JOB = OperationModel.new(
        name: "GetSearchJob",
        http_method: "GET",
        request_uri: "/search-jobs/{SearchJobIdentifier}"
      )

      GET_SEARCH_RESULT_EXPORT_JOB = OperationModel.new(
        name: "GetSearchResultExportJob",
        http_method: "GET",
        request_uri: "/export-search-jobs/{ExportJobIdentifier}"
      )

      LIST_SEARCH_JOB_BACKUPS = OperationModel.new(
        name: "ListSearchJobBackups",
        http_method: "GET",
        request_uri: "/search-jobs/{SearchJobIdentifier}/backups"
      )

      LIST_SEARCH_JOB_RESULTS = OperationModel.new(
        name: "ListSearchJobResults",
        http_method: "GET",
        request_uri: "/search-jobs/{SearchJobIdentifier}/search-results"
      )

      LIST_SEARCH_JOBS = OperationModel.new(
        name: "ListSearchJobs",
        http_method: "GET",
        request_uri: "/search-jobs"
      )

      LIST_SEARCH_RESULT_EXPORT_JOBS = OperationModel.new(
        name: "ListSearchResultExportJobs",
        http_method: "GET",
        request_uri: "/export-search-jobs"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      START_SEARCH_JOB = OperationModel.new(
        name: "StartSearchJob",
        http_method: "PUT",
        request_uri: "/search-jobs"
      )

      START_SEARCH_RESULT_EXPORT_JOB = OperationModel.new(
        name: "StartSearchResultExportJob",
        http_method: "PUT",
        request_uri: "/export-search-jobs"
      )

      STOP_SEARCH_JOB = OperationModel.new(
        name: "StopSearchJob",
        http_method: "PUT",
        request_uri: "/search-jobs/{SearchJobIdentifier}/actions/cancel"
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
    end
  end
end
