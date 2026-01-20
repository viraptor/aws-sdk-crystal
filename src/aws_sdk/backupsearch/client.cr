module AwsSdk
  module BackupSearch
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # This operation retrieves metadata of a search job, including its progress.

      def get_search_job(
        search_job_identifier : String
      ) : Protocol::Request
        input = Types::GetSearchJobInput.new(search_job_identifier: search_job_identifier)
        get_search_job(input)
      end

      def get_search_job(input : Types::GetSearchJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEARCH_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation retrieves the metadata of an export job. An export job is an operation that transmits
      # the results of a search job to a specified S3 bucket in a .csv file. An export job allows you to
      # retain results of a search beyond the search job's scheduled retention of 7 days.

      def get_search_result_export_job(
        export_job_identifier : String
      ) : Protocol::Request
        input = Types::GetSearchResultExportJobInput.new(export_job_identifier: export_job_identifier)
        get_search_result_export_job(input)
      end

      def get_search_result_export_job(input : Types::GetSearchResultExportJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEARCH_RESULT_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of all backups (recovery points) in a paginated format that were
      # included in the search job. If a search does not display an expected backup in the results, you can
      # call this operation to display each backup included in the search. Any backups that were not
      # included because they have a FAILED status from a permissions issue will be displayed, along with a
      # status message. Only recovery points with a backup index that has a status of ACTIVE will be
      # included in search results. If the index has any other status, its status will be displayed along
      # with a status message.

      def list_search_job_backups(
        search_job_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSearchJobBackupsInput.new(search_job_identifier: search_job_identifier, max_results: max_results, next_token: next_token)
        list_search_job_backups(input)
      end

      def list_search_job_backups(input : Types::ListSearchJobBackupsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEARCH_JOB_BACKUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of a specified search job.

      def list_search_job_results(
        search_job_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSearchJobResultsInput.new(search_job_identifier: search_job_identifier, max_results: max_results, next_token: next_token)
        list_search_job_results(input)
      end

      def list_search_job_results(input : Types::ListSearchJobResultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEARCH_JOB_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns a list of search jobs belonging to an account.

      def list_search_jobs(
        by_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSearchJobsInput.new(by_status: by_status, max_results: max_results, next_token: next_token)
        list_search_jobs(input)
      end

      def list_search_jobs(input : Types::ListSearchJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEARCH_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation exports search results of a search job to a specified destination S3 bucket.

      def list_search_result_export_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_job_identifier : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListSearchResultExportJobsInput.new(max_results: max_results, next_token: next_token, search_job_identifier: search_job_identifier, status: status)
        list_search_result_export_jobs(input)
      end

      def list_search_result_export_jobs(input : Types::ListSearchResultExportJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEARCH_RESULT_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns the tags for a resource type.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a search job which returns recovery points filtered by SearchScope and items
      # filtered by ItemFilters. You can optionally include ClientToken, EncryptionKeyArn, Name, and/or
      # Tags.

      def start_search_job(
        search_scope : Types::SearchScope,
        client_token : String? = nil,
        encryption_key_arn : String? = nil,
        item_filters : Types::ItemFilters? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartSearchJobInput.new(search_scope: search_scope, client_token: client_token, encryption_key_arn: encryption_key_arn, item_filters: item_filters, name: name, tags: tags)
        start_search_job(input)
      end

      def start_search_job(input : Types::StartSearchJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SEARCH_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operations starts a job to export the results of search job to a designated S3 bucket.

      def start_search_result_export_job(
        export_specification : Types::ExportSpecification,
        search_job_identifier : String,
        client_token : String? = nil,
        role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartSearchResultExportJobInput.new(export_specification: export_specification, search_job_identifier: search_job_identifier, client_token: client_token, role_arn: role_arn, tags: tags)
        start_search_result_export_job(input)
      end

      def start_search_result_export_job(input : Types::StartSearchResultExportJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SEARCH_RESULT_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operations ends a search job. Only a search job with a status of RUNNING can be stopped.

      def stop_search_job(
        search_job_identifier : String
      ) : Protocol::Request
        input = Types::StopSearchJobInput.new(search_job_identifier: search_job_identifier)
        stop_search_job(input)
      end

      def stop_search_job(input : Types::StopSearchJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_SEARCH_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation puts tags on the resource you indicate.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation removes tags from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
