module AwsSdk
  module MedicalImaging
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

      # Copy an image set.

      def copy_image_set(
        copy_image_set_information : Types::CopyImageSetInformation,
        datastore_id : String,
        source_image_set_id : String,
        force : Bool? = nil,
        promote_to_primary : Bool? = nil
      ) : Protocol::Request
        input = Types::CopyImageSetRequest.new(copy_image_set_information: copy_image_set_information, datastore_id: datastore_id, source_image_set_id: source_image_set_id, force: force, promote_to_primary: promote_to_primary)
        copy_image_set(input)
      end

      def copy_image_set(input : Types::CopyImageSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COPY_IMAGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a data store.

      def create_datastore(
        client_token : String,
        datastore_name : String? = nil,
        kms_key_arn : String? = nil,
        lambda_authorizer_arn : String? = nil,
        lossless_storage_format : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDatastoreRequest.new(client_token: client_token, datastore_name: datastore_name, kms_key_arn: kms_key_arn, lambda_authorizer_arn: lambda_authorizer_arn, lossless_storage_format: lossless_storage_format, tags: tags)
        create_datastore(input)
      end

      def create_datastore(input : Types::CreateDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a data store. Before a data store can be deleted, you must first delete all image sets within
      # it.

      def delete_datastore(
        datastore_id : String
      ) : Protocol::Request
        input = Types::DeleteDatastoreRequest.new(datastore_id: datastore_id)
        delete_datastore(input)
      end

      def delete_datastore(input : Types::DeleteDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an image set.

      def delete_image_set(
        datastore_id : String,
        image_set_id : String
      ) : Protocol::Request
        input = Types::DeleteImageSetRequest.new(datastore_id: datastore_id, image_set_id: image_set_id)
        delete_image_set(input)
      end

      def delete_image_set(input : Types::DeleteImageSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IMAGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the import job properties to learn more about the job or job progress. The jobStatus refers to
      # the execution of the import job. Therefore, an import job can return a jobStatus as COMPLETED even
      # if validation issues are discovered during the import process. If a jobStatus returns as COMPLETED ,
      # we still recommend you review the output manifests written to S3, as they provide details on the
      # success or failure of individual P10 object imports.

      def get_dicom_import_job(
        datastore_id : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetDICOMImportJobRequest.new(datastore_id: datastore_id, job_id: job_id)
        get_dicom_import_job(input)
      end

      def get_dicom_import_job(input : Types::GetDICOMImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DICOM_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get data store properties.

      def get_datastore(
        datastore_id : String
      ) : Protocol::Request
        input = Types::GetDatastoreRequest.new(datastore_id: datastore_id)
        get_datastore(input)
      end

      def get_datastore(input : Types::GetDatastoreRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATASTORE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an image frame (pixel data) for an image set.

      def get_image_frame(
        datastore_id : String,
        image_frame_information : Types::ImageFrameInformation,
        image_set_id : String
      ) : Protocol::Request
        input = Types::GetImageFrameRequest.new(datastore_id: datastore_id, image_frame_information: image_frame_information, image_set_id: image_set_id)
        get_image_frame(input)
      end

      def get_image_frame(input : Types::GetImageFrameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_FRAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get image set properties.

      def get_image_set(
        datastore_id : String,
        image_set_id : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::GetImageSetRequest.new(datastore_id: datastore_id, image_set_id: image_set_id, version_id: version_id)
        get_image_set(input)
      end

      def get_image_set(input : Types::GetImageSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get metadata attributes for an image set.

      def get_image_set_metadata(
        datastore_id : String,
        image_set_id : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::GetImageSetMetadataRequest.new(datastore_id: datastore_id, image_set_id: image_set_id, version_id: version_id)
        get_image_set_metadata(input)
      end

      def get_image_set_metadata(input : Types::GetImageSetMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMAGE_SET_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List import jobs created for a specific data store.

      def list_dicom_import_jobs(
        datastore_id : String,
        job_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDICOMImportJobsRequest.new(datastore_id: datastore_id, job_status: job_status, max_results: max_results, next_token: next_token)
        list_dicom_import_jobs(input)
      end

      def list_dicom_import_jobs(input : Types::ListDICOMImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DICOM_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List data stores.

      def list_datastores(
        datastore_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDatastoresRequest.new(datastore_status: datastore_status, max_results: max_results, next_token: next_token)
        list_datastores(input)
      end

      def list_datastores(input : Types::ListDatastoresRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATASTORES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List image set versions.

      def list_image_set_versions(
        datastore_id : String,
        image_set_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImageSetVersionsRequest.new(datastore_id: datastore_id, image_set_id: image_set_id, max_results: max_results, next_token: next_token)
        list_image_set_versions(input)
      end

      def list_image_set_versions(input : Types::ListImageSetVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMAGE_SET_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags associated with a medical imaging resource.

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

      # Search image sets based on defined input attributes. SearchImageSets accepts a single search query
      # parameter and returns a paginated response of all image sets that have the matching criteria. All
      # date range queries must be input as (lowerBound, upperBound) . By default, SearchImageSets uses the
      # updatedAt field for sorting in descending order from newest to oldest.

      def search_image_sets(
        datastore_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::SearchCriteria? = nil
      ) : Protocol::Request
        input = Types::SearchImageSetsRequest.new(datastore_id: datastore_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria)
        search_image_sets(input)
      end

      def search_image_sets(input : Types::SearchImageSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_IMAGE_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start importing bulk data into an ACTIVE data store. The import job imports DICOM P10 files found in
      # the S3 prefix specified by the inputS3Uri parameter. The import job stores processing results in the
      # file specified by the outputS3Uri parameter.

      def start_dicom_import_job(
        client_token : String,
        data_access_role_arn : String,
        datastore_id : String,
        input_s3_uri : String,
        output_s3_uri : String,
        input_owner_account_id : String? = nil,
        job_name : String? = nil
      ) : Protocol::Request
        input = Types::StartDICOMImportJobRequest.new(client_token: client_token, data_access_role_arn: data_access_role_arn, datastore_id: datastore_id, input_s3_uri: input_s3_uri, output_s3_uri: output_s3_uri, input_owner_account_id: input_owner_account_id, job_name: job_name)
        start_dicom_import_job(input)
      end

      def start_dicom_import_job(input : Types::StartDICOMImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DICOM_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a user-specifed key and value tag to a medical imaging resource.

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

      # Removes tags from a medical imaging resource.

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

      # Update image set metadata attributes.

      def update_image_set_metadata(
        datastore_id : String,
        image_set_id : String,
        latest_version_id : String,
        update_image_set_metadata_updates : Types::MetadataUpdates,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateImageSetMetadataRequest.new(datastore_id: datastore_id, image_set_id: image_set_id, latest_version_id: latest_version_id, update_image_set_metadata_updates: update_image_set_metadata_updates, force: force)
        update_image_set_metadata(input)
      end

      def update_image_set_metadata(input : Types::UpdateImageSetMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IMAGE_SET_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
