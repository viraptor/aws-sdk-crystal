module AwsSdk
  module Signer
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

      # Adds cross-account permissions to a signing profile.
      def add_profile_permission(
        action : String,
        principal : String,
        profile_name : String,
        statement_id : String,
        profile_version : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::AddProfilePermissionRequest.new(action: action, principal: principal, profile_name: profile_name, statement_id: statement_id, profile_version: profile_version, revision_id: revision_id)
        add_profile_permission(input)
      end
      def add_profile_permission(input : Types::AddProfilePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_PROFILE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the state of an ACTIVE signing profile to CANCELED . A canceled profile is still viewable
      # with the ListSigningProfiles operation, but it cannot perform new signing jobs. See Data Retention
      # for more information on scheduled deletion of a canceled signing profile.
      def cancel_signing_profile(
        profile_name : String
      ) : Protocol::Request
        input = Types::CancelSigningProfileRequest.new(profile_name: profile_name)
        cancel_signing_profile(input)
      end
      def cancel_signing_profile(input : Types::CancelSigningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SIGNING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific code signing job. You specify the job by using the jobId value
      # that is returned by the StartSigningJob operation.
      def describe_signing_job(
        job_id : String
      ) : Protocol::Request
        input = Types::DescribeSigningJobRequest.new(job_id: job_id)
        describe_signing_job(input)
      end
      def describe_signing_job(input : Types::DescribeSigningJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SIGNING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the revocation status of one or more of the signing profile, signing job, and signing
      # certificate.
      def get_revocation_status(
        certificate_hashes : Array(String),
        job_arn : String,
        platform_id : String,
        profile_version_arn : String,
        signature_timestamp : Time
      ) : Protocol::Request
        input = Types::GetRevocationStatusRequest.new(certificate_hashes: certificate_hashes, job_arn: job_arn, platform_id: platform_id, profile_version_arn: profile_version_arn, signature_timestamp: signature_timestamp)
        get_revocation_status(input)
      end
      def get_revocation_status(input : Types::GetRevocationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVOCATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information on a specific signing platform.
      def get_signing_platform(
        platform_id : String
      ) : Protocol::Request
        input = Types::GetSigningPlatformRequest.new(platform_id: platform_id)
        get_signing_platform(input)
      end
      def get_signing_platform(input : Types::GetSigningPlatformRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIGNING_PLATFORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information on a specific signing profile.
      def get_signing_profile(
        profile_name : String,
        profile_owner : String? = nil
      ) : Protocol::Request
        input = Types::GetSigningProfileRequest.new(profile_name: profile_name, profile_owner: profile_owner)
        get_signing_profile(input)
      end
      def get_signing_profile(input : Types::GetSigningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SIGNING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the cross-account permissions associated with a signing profile.
      def list_profile_permissions(
        profile_name : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProfilePermissionsRequest.new(profile_name: profile_name, next_token: next_token)
        list_profile_permissions(input)
      end
      def list_profile_permissions(input : Types::ListProfilePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all your signing jobs. You can use the maxResults parameter to limit the number of signing
      # jobs that are returned in the response. If additional jobs remain to be listed, AWS Signer returns a
      # nextToken value. Use this value in subsequent calls to ListSigningJobs to fetch the remaining
      # values. You can continue calling ListSigningJobs with your maxResults parameter and with new values
      # that Signer returns in the nextToken parameter until all of your signing jobs have been returned.
      def list_signing_jobs(
        is_revoked : Bool? = nil,
        job_invoker : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        platform_id : String? = nil,
        requested_by : String? = nil,
        signature_expires_after : Time? = nil,
        signature_expires_before : Time? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListSigningJobsRequest.new(is_revoked: is_revoked, job_invoker: job_invoker, max_results: max_results, next_token: next_token, platform_id: platform_id, requested_by: requested_by, signature_expires_after: signature_expires_after, signature_expires_before: signature_expires_before, status: status)
        list_signing_jobs(input)
      end
      def list_signing_jobs(input : Types::ListSigningJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIGNING_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all signing platforms available in AWS Signer that match the request parameters. If additional
      # jobs remain to be listed, Signer returns a nextToken value. Use this value in subsequent calls to
      # ListSigningJobs to fetch the remaining values. You can continue calling ListSigningJobs with your
      # maxResults parameter and with new values that Signer returns in the nextToken parameter until all of
      # your signing jobs have been returned.
      def list_signing_platforms(
        category : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        partner : String? = nil,
        target : String? = nil
      ) : Protocol::Request
        input = Types::ListSigningPlatformsRequest.new(category: category, max_results: max_results, next_token: next_token, partner: partner, target: target)
        list_signing_platforms(input)
      end
      def list_signing_platforms(input : Types::ListSigningPlatformsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIGNING_PLATFORMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all available signing profiles in your AWS account. Returns only profiles with an ACTIVE
      # status unless the includeCanceled request field is set to true . If additional jobs remain to be
      # listed, AWS Signer returns a nextToken value. Use this value in subsequent calls to ListSigningJobs
      # to fetch the remaining values. You can continue calling ListSigningJobs with your maxResults
      # parameter and with new values that Signer returns in the nextToken parameter until all of your
      # signing jobs have been returned.
      def list_signing_profiles(
        include_canceled : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        platform_id : String? = nil,
        statuses : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListSigningProfilesRequest.new(include_canceled: include_canceled, max_results: max_results, next_token: next_token, platform_id: platform_id, statuses: statuses)
        list_signing_profiles(input)
      end
      def list_signing_profiles(input : Types::ListSigningProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SIGNING_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags associated with a signing profile resource.
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

      # Creates a signing profile. A signing profile is a code-signing template that can be used to carry
      # out a pre-defined signing job.
      def put_signing_profile(
        platform_id : String,
        profile_name : String,
        overrides : Types::SigningPlatformOverrides? = nil,
        signature_validity_period : Types::SignatureValidityPeriod? = nil,
        signing_material : Types::SigningMaterial? = nil,
        signing_parameters : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PutSigningProfileRequest.new(platform_id: platform_id, profile_name: profile_name, overrides: overrides, signature_validity_period: signature_validity_period, signing_material: signing_material, signing_parameters: signing_parameters, tags: tags)
        put_signing_profile(input)
      end
      def put_signing_profile(input : Types::PutSigningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SIGNING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes cross-account permissions from a signing profile.
      def remove_profile_permission(
        profile_name : String,
        revision_id : String,
        statement_id : String
      ) : Protocol::Request
        input = Types::RemoveProfilePermissionRequest.new(profile_name: profile_name, revision_id: revision_id, statement_id: statement_id)
        remove_profile_permission(input)
      end
      def remove_profile_permission(input : Types::RemoveProfilePermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_PROFILE_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the state of a signing job to REVOKED . This indicates that the signature is no longer
      # valid.
      def revoke_signature(
        job_id : String,
        reason : String,
        job_owner : String? = nil
      ) : Protocol::Request
        input = Types::RevokeSignatureRequest.new(job_id: job_id, reason: reason, job_owner: job_owner)
        revoke_signature(input)
      end
      def revoke_signature(input : Types::RevokeSignatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_SIGNATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the state of a signing profile to REVOKED . This indicates that signatures generated using
      # the signing profile after an effective start date are no longer valid. A revoked profile is still
      # viewable with the ListSigningProfiles operation, but it cannot perform new signing jobs. See Data
      # Retention for more information on scheduled deletion of a revoked signing profile.
      def revoke_signing_profile(
        effective_time : Time,
        profile_name : String,
        profile_version : String,
        reason : String
      ) : Protocol::Request
        input = Types::RevokeSigningProfileRequest.new(effective_time: effective_time, profile_name: profile_name, profile_version: profile_version, reason: reason)
        revoke_signing_profile(input)
      end
      def revoke_signing_profile(input : Types::RevokeSigningProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_SIGNING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Signs a binary payload and returns a signature envelope.
      def sign_payload(
        payload : Bytes,
        payload_format : String,
        profile_name : String,
        profile_owner : String? = nil
      ) : Protocol::Request
        input = Types::SignPayloadRequest.new(payload: payload, payload_format: payload_format, profile_name: profile_name, profile_owner: profile_owner)
        sign_payload(input)
      end
      def sign_payload(input : Types::SignPayloadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SIGN_PAYLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a signing job to be performed on the code provided. Signing jobs are viewable by the
      # ListSigningJobs operation. Note the following requirements: You must create an Amazon S3 source
      # bucket. For more information, see Creating a Bucket in the Amazon S3 Getting Started Guide . Your S3
      # source bucket must be version enabled. You must create an S3 destination bucket. AWS Signer uses
      # your S3 destination bucket to write your signed code. You specify the name of the source and
      # destination buckets when calling the StartSigningJob operation. You must ensure the S3 buckets are
      # from the same Region as the signing profile. Cross-Region signing isn't supported. You must also
      # specify a request token that identifies your request to Signer. You can call the DescribeSigningJob
      # and the ListSigningJobs actions after you call StartSigningJob . For a Java example that shows how
      # to use this action, see StartSigningJob .
      def start_signing_job(
        client_request_token : String,
        destination : Types::Destination,
        profile_name : String,
        source : Types::Source,
        profile_owner : String? = nil
      ) : Protocol::Request
        input = Types::StartSigningJobRequest.new(client_request_token: client_request_token, destination: destination, profile_name: profile_name, source: source, profile_owner: profile_owner)
        start_signing_job(input)
      end
      def start_signing_job(input : Types::StartSigningJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SIGNING_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to a signing profile. Tags are labels that you can use to identify and
      # organize your AWS resources. Each tag consists of a key and an optional value. To specify the
      # signing profile, use its Amazon Resource Name (ARN). To specify the tag, use a key-value pair.
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

      # Removes one or more tags from a signing profile. To remove the tags, specify a list of tag keys.
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
