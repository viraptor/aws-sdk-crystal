module AwsSdk
  module S3
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # This operation aborts a multipart upload. After a multipart upload is aborted, no additional parts
      # can be uploaded using that upload ID. The storage consumed by any previously uploaded parts will be
      # freed. However, if any part uploads are currently in progress, those part uploads might or might not
      # succeed. As a result, it might be necessary to abort a given multipart upload multiple times in
      # order to completely free all storage consumed by all parts. To verify that all parts have been
      # removed and prevent getting charged for the part storage, you should call the ListParts API
      # operation and ensure that the parts list is empty. Directory buckets - If multipart uploads in a
      # directory bucket are in progress, you can't delete the bucket until all the in-progress multipart
      # uploads are aborted or completed. To delete these in-progress multipart uploads, use the
      # ListMultipartUploads operation to list the in-progress multipart uploads in the bucket and use the
      # AbortMultipartUpload operation to abort all the in-progress multipart uploads. Directory buckets -
      # For directory buckets, you must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket
      # .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests are not supported.
      # For more information about endpoints in Availability Zones, see Regional and Zonal endpoints for
      # directory buckets in Availability Zones in the Amazon S3 User Guide . For more information about
      # endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User
      # Guide . Permissions General purpose bucket permissions - For information about permissions required
      # to use the multipart upload, see Multipart Upload and Permissions in the Amazon S3 User Guide .
      # Directory bucket permissions - To grant access to this API operation on a directory bucket, we
      # recommend that you use the CreateSession API operation for session-based authorization.
      # Specifically, you grant the s3express:CreateSession permission to the directory bucket in a bucket
      # policy or an IAM identity-based policy. Then, you make the CreateSession API call on the bucket to
      # obtain a session token. With the session token in your request header, you can make API requests to
      # this operation. After the session token expires, you make another CreateSession API call to generate
      # a new session token for use. Amazon Web Services CLI or SDKs create session and refresh the session
      # token automatically to avoid service interruptions when a session expires. For more information
      # about authorization, see CreateSession . HTTP Host header syntax Directory buckets - The HTTP Host
      # header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The following
      # operations are related to AbortMultipartUpload : CreateMultipartUpload UploadPart
      # CompleteMultipartUpload ListParts ListMultipartUploads You must URL encode any signed header values
      # that contain spaces. For example, if your header value is my file.txt , containing two spaces after
      # my , you must URL encode this value to my%20%20file.txt .
      def abort_multipart_upload(
        bucket : String,
        key : String,
        upload_id : String,
        expected_bucket_owner : String? = nil,
        if_match_initiated_time : Time? = nil,
        request_payer : String? = nil
      ) : Types::AbortMultipartUploadOutput
        input = Types::AbortMultipartUploadRequest.new(bucket: bucket, key: key, upload_id: upload_id, expected_bucket_owner: expected_bucket_owner, if_match_initiated_time: if_match_initiated_time, request_payer: request_payer)
        abort_multipart_upload(input)
      end
      def abort_multipart_upload(input : Types::AbortMultipartUploadRequest) : Types::AbortMultipartUploadOutput
        request = Protocol::RestXml.build_request(Model::ABORT_MULTIPART_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::AbortMultipartUploadOutput, "AbortMultipartUpload")
      end

      # Completes a multipart upload by assembling previously uploaded parts. You first initiate the
      # multipart upload and then upload all parts using the UploadPart operation or the UploadPartCopy
      # operation. After successfully uploading all relevant parts of an upload, you call this
      # CompleteMultipartUpload operation to complete the upload. Upon receiving this request, Amazon S3
      # concatenates all the parts in ascending order by part number to create a new object. In the
      # CompleteMultipartUpload request, you must provide the parts list and ensure that the parts list is
      # complete. The CompleteMultipartUpload API operation concatenates the parts that you provide in the
      # list. For each part in the list, you must provide the PartNumber value and the ETag value that are
      # returned after that part was uploaded. The processing of a CompleteMultipartUpload request could
      # take several minutes to finalize. After Amazon S3 begins processing the request, it sends an HTTP
      # response header that specifies a 200 OK response. While processing is in progress, Amazon S3
      # periodically sends white space characters to keep the connection from timing out. A request could
      # fail after the initial 200 OK response has been sent. This means that a 200 OK response can contain
      # either a success or an error. The error response might be embedded in the 200 OK response. If you
      # call this API operation directly, make sure to design your application to parse the contents of the
      # response and handle it appropriately. If you use Amazon Web Services SDKs, SDKs handle this
      # condition. The SDKs detect the embedded error and apply error handling per your configuration
      # settings (including automatically retrying the request as appropriate). If the condition persists,
      # the SDKs throw an exception (or, for the SDKs that don't use exceptions, they return an error). Note
      # that if CompleteMultipartUpload fails, applications should be prepared to retry any failed requests
      # (including 500 error responses). For more information, see Amazon S3 Error Best Practices . You
      # can't use Content-Type: application/x-www-form-urlencoded for the CompleteMultipartUpload requests.
      # Also, if you don't provide a Content-Type header, CompleteMultipartUpload can still return a 200 OK
      # response. For more information about multipart uploads, see Uploading Objects Using Multipart Upload
      # in the Amazon S3 User Guide . Directory buckets - For directory buckets, you must make requests for
      # this API operation to the Zonal endpoint. These endpoints support virtual-hosted-style requests in
      # the format https:// amzn-s3-demo-bucket .s3express- zone-id . region-code .amazonaws.com/ key-name .
      # Path-style requests are not supported. For more information about endpoints in Availability Zones,
      # see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3 User
      # Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets in
      # Local Zones in the Amazon S3 User Guide . Permissions General purpose bucket permissions - For
      # information about permissions required to use the multipart upload API, see Multipart Upload and
      # Permissions in the Amazon S3 User Guide . If you provide an additional checksum value in your
      # MultipartUpload requests and the object is encrypted with Key Management Service, you must have
      # permission to use the kms:Decrypt action for the CompleteMultipartUpload request to succeed.
      # Directory bucket permissions - To grant access to this API operation on a directory bucket, we
      # recommend that you use the CreateSession API operation for session-based authorization.
      # Specifically, you grant the s3express:CreateSession permission to the directory bucket in a bucket
      # policy or an IAM identity-based policy. Then, you make the CreateSession API call on the bucket to
      # obtain a session token. With the session token in your request header, you can make API requests to
      # this operation. After the session token expires, you make another CreateSession API call to generate
      # a new session token for use. Amazon Web Services CLI or SDKs create session and refresh the session
      # token automatically to avoid service interruptions when a session expires. For more information
      # about authorization, see CreateSession . If the object is encrypted with SSE-KMS, you must also have
      # the kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based policies and KMS key
      # policies for the KMS key. Special errors Error Code: EntityTooSmall Description: Your proposed
      # upload is smaller than the minimum allowed object size. Each part must be at least 5 MB in size,
      # except the last part. HTTP Status Code: 400 Bad Request Error Code: InvalidPart Description: One or
      # more of the specified parts could not be found. The part might not have been uploaded, or the
      # specified ETag might not have matched the uploaded part's ETag. HTTP Status Code: 400 Bad Request
      # Error Code: InvalidPartOrder Description: The list of parts was not in ascending order. The parts
      # list must be specified in order by part number. HTTP Status Code: 400 Bad Request Error Code:
      # NoSuchUpload Description: The specified multipart upload does not exist. The upload ID might be
      # invalid, or the multipart upload might have been aborted or completed. HTTP Status Code: 404 Not
      # Found HTTP Host header syntax Directory buckets - The HTTP Host header syntax is Bucket-name
      # .s3express- zone-id . region-code .amazonaws.com . The following operations are related to
      # CompleteMultipartUpload : CreateMultipartUpload UploadPart AbortMultipartUpload ListParts
      # ListMultipartUploads You must URL encode any signed header values that contain spaces. For example,
      # if your header value is my file.txt , containing two spaces after my , you must URL encode this
      # value to my%20%20file.txt .
      def complete_multipart_upload(
        bucket : String,
        key : String,
        upload_id : String,
        checksum_crc32 : String? = nil,
        checksum_crc32_c : String? = nil,
        checksum_crc64_nvme : String? = nil,
        checksum_sha1 : String? = nil,
        checksum_sha256 : String? = nil,
        checksum_type : String? = nil,
        expected_bucket_owner : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        mpu_object_size : Int64? = nil,
        multipart_upload : Types::CompletedMultipartUpload? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil
      ) : Types::CompleteMultipartUploadOutput
        input = Types::CompleteMultipartUploadRequest.new(bucket: bucket, key: key, upload_id: upload_id, checksum_crc32: checksum_crc32, checksum_crc32_c: checksum_crc32_c, checksum_crc64_nvme: checksum_crc64_nvme, checksum_sha1: checksum_sha1, checksum_sha256: checksum_sha256, checksum_type: checksum_type, expected_bucket_owner: expected_bucket_owner, if_match: if_match, if_none_match: if_none_match, mpu_object_size: mpu_object_size, multipart_upload: multipart_upload, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5)
        complete_multipart_upload(input)
      end
      def complete_multipart_upload(input : Types::CompleteMultipartUploadRequest) : Types::CompleteMultipartUploadOutput
        request = Protocol::RestXml.build_request(Model::COMPLETE_MULTIPART_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CompleteMultipartUploadOutput, "CompleteMultipartUpload")
      end

      # Creates a copy of an object that is already stored in Amazon S3. End of support notice: As of
      # October 1, 2025, Amazon S3 has discontinued support for Email Grantee Access Control Lists (ACLs).
      # If you attempt to use an Email Grantee ACL in a request after October 1, 2025, the request will
      # receive an HTTP 405 (Method Not Allowed) error. This change affects the following Amazon Web
      # Services Regions: US East (N. Virginia), US West (N. California), US West (Oregon), Asia Pacific
      # (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland), and South America (São
      # Paulo). You can store individual objects of up to 50 TB in Amazon S3. You create a copy of your
      # object up to 5 GB in size in a single atomic action using this API. However, to copy an object
      # greater than 5 GB, you must use the multipart upload Upload Part - Copy (UploadPartCopy) API. For
      # more information, see Copy Object Using the REST Multipart Upload API . You can copy individual
      # objects between general purpose buckets, between directory buckets, and between general purpose
      # buckets and directory buckets. Amazon S3 supports copy operations using Multi-Region Access Points
      # only as a destination when using the Multi-Region Access Point ARN. Directory buckets - For
      # directory buckets, you must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket
      # .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests are not supported.
      # For more information about endpoints in Availability Zones, see Regional and Zonal endpoints for
      # directory buckets in Availability Zones in the Amazon S3 User Guide . For more information about
      # endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User
      # Guide . VPC endpoints don't support cross-Region requests (including copies). If you're using VPC
      # endpoints, your source and destination buckets should be in the same Amazon Web Services Region as
      # your VPC endpoint. Both the Region that you want to copy the object from and the Region that you
      # want to copy the object to must be enabled for your account. For more information about how to
      # enable a Region for your account, see Enable or disable a Region for standalone accounts in the
      # Amazon Web Services Account Management Guide . Amazon S3 transfer acceleration does not support
      # cross-Region copies. If you request a cross-Region copy using a transfer acceleration endpoint, you
      # get a 400 Bad Request error. For more information, see Transfer Acceleration . Authentication and
      # authorization All CopyObject requests must be authenticated and signed by using IAM credentials
      # (access key ID and secret access key for the IAM identities). All headers with the x-amz- prefix,
      # including x-amz-copy-source , must be signed. For more information, see REST Authentication .
      # Directory buckets - You must use the IAM credentials to authenticate and authorize your access to
      # the CopyObject API operation, instead of using the temporary security credentials through the
      # CreateSession API operation. Amazon Web Services CLI or SDKs handles authentication and
      # authorization on your behalf. Permissions You must have read access to the source object and write
      # access to the destination bucket. General purpose bucket permissions - You must have permissions in
      # an IAM policy based on the source and destination bucket types in a CopyObject operation. If the
      # source object is in a general purpose bucket, you must have s3:GetObject permission to read the
      # source object that is being copied. If the destination bucket is a general purpose bucket, you must
      # have s3:PutObject permission to write the object copy to the destination bucket. Directory bucket
      # permissions - You must have permissions in a bucket policy or an IAM identity-based policy based on
      # the source and destination bucket types in a CopyObject operation. If the source object that you
      # want to copy is in a directory bucket, you must have the s3express:CreateSession permission in the
      # Action element of a policy to read the object. By default, the session is in the ReadWrite mode. If
      # you want to restrict the access, you can explicitly set the s3express:SessionMode condition key to
      # ReadOnly on the copy source bucket. If the copy destination is a directory bucket, you must have the
      # s3express:CreateSession permission in the Action element of a policy to write the object to the
      # destination. The s3express:SessionMode condition key can't be set to ReadOnly on the copy
      # destination bucket. If the object is encrypted with SSE-KMS, you must also have the
      # kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based policies and KMS key policies
      # for the KMS key. For example policies, see Example bucket policies for S3 Express One Zone and
      # Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3 Express One
      # Zone in the Amazon S3 User Guide . Response and special errors When the request is an HTTP 1.1
      # request, the response is chunk encoded. When the request is not an HTTP 1.1 request, the response
      # would not contain the Content-Length . You always need to read the entire response body to check if
      # the copy succeeds. If the copy is successful, you receive a response with information about the
      # copied object. A copy request might return an error when Amazon S3 receives the copy request or
      # while Amazon S3 is copying the files. A 200 OK response can contain either a success or an error. If
      # the error occurs before the copy action starts, you receive a standard Amazon S3 error. If the error
      # occurs during the copy operation, the error response is embedded in the 200 OK response. For
      # example, in a cross-region copy, you may encounter throttling and receive a 200 OK response. For
      # more information, see Resolve the Error 200 response when copying objects to Amazon S3 . The 200 OK
      # status code means the copy was accepted, but it doesn't mean the copy is complete. Another example
      # is when you disconnect from Amazon S3 before the copy is complete, Amazon S3 might cancel the copy
      # and you may receive a 200 OK response. You must stay connected to Amazon S3 until the entire
      # response is successfully received and processed. If you call this API operation directly, make sure
      # to design your application to parse the content of the response and handle it appropriately. If you
      # use Amazon Web Services SDKs, SDKs handle this condition. The SDKs detect the embedded error and
      # apply error handling per your configuration settings (including automatically retrying the request
      # as appropriate). If the condition persists, the SDKs throw an exception (or, for the SDKs that don't
      # use exceptions, they return an error). Charge The copy request charge is based on the storage class
      # and Region that you specify for the destination object. The request can also result in a data
      # retrieval charge for the source if the source storage class bills for data retrieval. If the copy
      # source is in a different region, the data transfer is billed to the copy source account. For pricing
      # information, see Amazon S3 pricing . HTTP Host header syntax Directory buckets - The HTTP Host
      # header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . Amazon S3 on
      # Outposts - When you use this action with S3 on Outposts through the REST API, you must direct
      # requests to the S3 on Outposts hostname. The S3 on Outposts hostname takes the form AccessPointName
      # - AccountId . outpostID .s3-outposts. Region .amazonaws.com . The hostname isn't required when you
      # use the Amazon Web Services CLI or SDKs. The following operations are related to CopyObject :
      # PutObject GetObject You must URL encode any signed header values that contain spaces. For example,
      # if your header value is my file.txt , containing two spaces after my , you must URL encode this
      # value to my%20%20file.txt .
      def copy_object(
        bucket : String,
        copy_source : String,
        key : String,
        acl : String? = nil,
        bucket_key_enabled : Bool? = nil,
        cache_control : String? = nil,
        checksum_algorithm : String? = nil,
        content_disposition : String? = nil,
        content_encoding : String? = nil,
        content_language : String? = nil,
        content_type : String? = nil,
        copy_source_if_match : String? = nil,
        copy_source_if_modified_since : Time? = nil,
        copy_source_if_none_match : String? = nil,
        copy_source_if_unmodified_since : Time? = nil,
        copy_source_sse_customer_algorithm : String? = nil,
        copy_source_sse_customer_key : String? = nil,
        copy_source_sse_customer_key_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        expected_source_bucket_owner : String? = nil,
        expires : String? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write_acp : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        metadata : Hash(String, String)? = nil,
        metadata_directive : String? = nil,
        object_lock_legal_hold_status : String? = nil,
        object_lock_mode : String? = nil,
        object_lock_retain_until_date : Time? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        ssekms_encryption_context : String? = nil,
        ssekms_key_id : String? = nil,
        server_side_encryption : String? = nil,
        storage_class : String? = nil,
        tagging : String? = nil,
        tagging_directive : String? = nil,
        website_redirect_location : String? = nil
      ) : Types::CopyObjectOutput
        input = Types::CopyObjectRequest.new(bucket: bucket, copy_source: copy_source, key: key, acl: acl, bucket_key_enabled: bucket_key_enabled, cache_control: cache_control, checksum_algorithm: checksum_algorithm, content_disposition: content_disposition, content_encoding: content_encoding, content_language: content_language, content_type: content_type, copy_source_if_match: copy_source_if_match, copy_source_if_modified_since: copy_source_if_modified_since, copy_source_if_none_match: copy_source_if_none_match, copy_source_if_unmodified_since: copy_source_if_unmodified_since, copy_source_sse_customer_algorithm: copy_source_sse_customer_algorithm, copy_source_sse_customer_key: copy_source_sse_customer_key, copy_source_sse_customer_key_md5: copy_source_sse_customer_key_md5, expected_bucket_owner: expected_bucket_owner, expected_source_bucket_owner: expected_source_bucket_owner, expires: expires, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write_acp: grant_write_acp, if_match: if_match, if_none_match: if_none_match, metadata: metadata, metadata_directive: metadata_directive, object_lock_legal_hold_status: object_lock_legal_hold_status, object_lock_mode: object_lock_mode, object_lock_retain_until_date: object_lock_retain_until_date, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, ssekms_encryption_context: ssekms_encryption_context, ssekms_key_id: ssekms_key_id, server_side_encryption: server_side_encryption, storage_class: storage_class, tagging: tagging, tagging_directive: tagging_directive, website_redirect_location: website_redirect_location)
        copy_object(input)
      end
      def copy_object(input : Types::CopyObjectRequest) : Types::CopyObjectOutput
        request = Protocol::RestXml.build_request(Model::COPY_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CopyObjectOutput, "CopyObject")
      end

      # This action creates an Amazon S3 bucket. To create an Amazon S3 on Outposts bucket, see CreateBucket
      # . Creates a new S3 bucket. To create a bucket, you must set up Amazon S3 and have a valid Amazon Web
      # Services Access Key ID to authenticate requests. Anonymous requests are never allowed to create
      # buckets. By creating the bucket, you become the bucket owner. There are two types of buckets:
      # general purpose buckets and directory buckets. For more information about these bucket types, see
      # Creating, configuring, and working with Amazon S3 buckets in the Amazon S3 User Guide . General
      # purpose buckets - If you send your CreateBucket request to the s3.amazonaws.com global endpoint, the
      # request goes to the us-east-1 Region. So the signature calculations in Signature Version 4 must use
      # us-east-1 as the Region, even if the location constraint in the request specifies another Region
      # where the bucket is to be created. If you create a bucket in a Region other than US East (N.
      # Virginia), your application must be able to handle 307 redirect. For more information, see Virtual
      # hosting of buckets in the Amazon S3 User Guide . Directory buckets - For directory buckets, you must
      # make requests for this API operation to the Regional endpoint. These endpoints support path-style
      # requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name .
      # Virtual-hosted-style requests aren't supported. For more information about endpoints in Availability
      # Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3
      # User Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets
      # in Local Zones in the Amazon S3 User Guide . Permissions General purpose bucket permissions - In
      # addition to the s3:CreateBucket permission, the following permissions are required in a policy when
      # your CreateBucket request includes specific headers: Access control lists (ACLs) - In your
      # CreateBucket request, if you specify an access control list (ACL) and set it to public-read ,
      # public-read-write , authenticated-read , or if you explicitly specify any other custom ACLs, both
      # s3:CreateBucket and s3:PutBucketAcl permissions are required. In your CreateBucket request, if you
      # set the ACL to private , or if you don't specify any ACLs, only the s3:CreateBucket permission is
      # required. Object Lock - In your CreateBucket request, if you set x-amz-bucket-object-lock-enabled to
      # true, the s3:PutBucketObjectLockConfiguration and s3:PutBucketVersioning permissions are required.
      # S3 Object Ownership - If your CreateBucket request includes the x-amz-object-ownership header, then
      # the s3:PutBucketOwnershipControls permission is required. To set an ACL on a bucket as part of a
      # CreateBucket request, you must explicitly set S3 Object Ownership for the bucket to a different
      # value than the default, BucketOwnerEnforced . Additionally, if your desired bucket ACL grants public
      # access, you must first create the bucket (without the bucket ACL) and then explicitly disable Block
      # Public Access on the bucket before using PutBucketAcl to set the ACL. If you try to create a bucket
      # with a public ACL, the request will fail. For the majority of modern use cases in S3, we recommend
      # that you keep all Block Public Access settings enabled and keep ACLs disabled. If you would like to
      # share data with users outside of your account, you can use bucket policies as needed. For more
      # information, see Controlling ownership of objects and disabling ACLs for your bucket and Blocking
      # public access to your Amazon S3 storage in the Amazon S3 User Guide . S3 Block Public Access - If
      # your specific use case requires granting public access to your S3 resources, you can disable Block
      # Public Access. Specifically, you can create a new bucket with Block Public Access enabled, then
      # separately call the DeletePublicAccessBlock API. To use this operation, you must have the
      # s3:PutBucketPublicAccessBlock permission. For more information about S3 Block Public Access, see
      # Blocking public access to your Amazon S3 storage in the Amazon S3 User Guide . Directory bucket
      # permissions - You must have the s3express:CreateBucket permission in an IAM identity-based policy
      # instead of a bucket policy. Cross-account access to this API operation isn't supported. This
      # operation can only be performed by the Amazon Web Services account that owns the resource. For more
      # information about directory bucket policies and permissions, see Amazon Web Services Identity and
      # Access Management (IAM) for S3 Express One Zone in the Amazon S3 User Guide . The permissions for
      # ACLs, Object Lock, S3 Object Ownership, and S3 Block Public Access are not supported for directory
      # buckets. For directory buckets, all Block Public Access settings are enabled at the bucket level and
      # S3 Object Ownership is set to Bucket owner enforced (ACLs disabled). These settings can't be
      # modified. For more information about permissions for creating and working with directory buckets,
      # see Directory buckets in the Amazon S3 User Guide . For more information about supported S3 features
      # for directory buckets, see Features of S3 Express One Zone in the Amazon S3 User Guide . HTTP Host
      # header syntax Directory buckets - The HTTP Host header syntax is s3express-control. region-code
      # .amazonaws.com . The following operations are related to CreateBucket : PutObject DeleteBucket You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def create_bucket(
        bucket : String,
        acl : String? = nil,
        create_bucket_configuration : Types::CreateBucketConfiguration? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write : String? = nil,
        grant_write_acp : String? = nil,
        object_lock_enabled_for_bucket : Bool? = nil,
        object_ownership : String? = nil
      ) : Types::CreateBucketOutput
        input = Types::CreateBucketRequest.new(bucket: bucket, acl: acl, create_bucket_configuration: create_bucket_configuration, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write: grant_write, grant_write_acp: grant_write_acp, object_lock_enabled_for_bucket: object_lock_enabled_for_bucket, object_ownership: object_ownership)
        create_bucket(input)
      end
      def create_bucket(input : Types::CreateBucketRequest) : Types::CreateBucketOutput
        request = Protocol::RestXml.build_request(Model::CREATE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateBucketOutput, "CreateBucket")
      end

      # Creates an S3 Metadata V2 metadata configuration for a general purpose bucket. For more information,
      # see Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide . Permissions To use
      # this operation, you must have the following permissions. For more information, see Setting up
      # permissions for configuring metadata tables in the Amazon S3 User Guide . If you want to encrypt
      # your metadata tables with server-side encryption with Key Management Service (KMS) keys (SSE-KMS),
      # you need additional permissions in your KMS key policy. For more information, see Setting up
      # permissions for configuring metadata tables in the Amazon S3 User Guide . If you also want to
      # integrate your table bucket with Amazon Web Services analytics services so that you can query your
      # metadata table, you need additional permissions. For more information, see Integrating Amazon S3
      # Tables with Amazon Web Services analytics services in the Amazon S3 User Guide . To query your
      # metadata tables, you need additional permissions. For more information, see Permissions for querying
      # metadata tables in the Amazon S3 User Guide . s3:CreateBucketMetadataTableConfiguration The IAM
      # policy action name is the same for the V1 and V2 API operations. s3tables:CreateTableBucket
      # s3tables:CreateNamespace s3tables:GetTable s3tables:CreateTable s3tables:PutTablePolicy
      # s3tables:PutTableEncryption kms:DescribeKey The following operations are related to
      # CreateBucketMetadataConfiguration : DeleteBucketMetadataConfiguration GetBucketMetadataConfiguration
      # UpdateBucketMetadataInventoryTableConfiguration UpdateBucketMetadataJournalTableConfiguration You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def create_bucket_metadata_configuration(
        bucket : String,
        metadata_configuration : Types::MetadataConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::CreateBucketMetadataConfigurationRequest.new(bucket: bucket, metadata_configuration: metadata_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        create_bucket_metadata_configuration(input)
      end
      def create_bucket_metadata_configuration(input : Types::CreateBucketMetadataConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::CREATE_BUCKET_METADATA_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # We recommend that you create your S3 Metadata configurations by using the V2
      # CreateBucketMetadataConfiguration API operation. We no longer recommend using the V1
      # CreateBucketMetadataTableConfiguration API operation. If you created your S3 Metadata configuration
      # before July 15, 2025, we recommend that you delete and re-create your configuration by using
      # CreateBucketMetadataConfiguration so that you can expire journal table records and create a live
      # inventory table. Creates a V1 S3 Metadata configuration for a general purpose bucket. For more
      # information, see Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide .
      # Permissions To use this operation, you must have the following permissions. For more information,
      # see Setting up permissions for configuring metadata tables in the Amazon S3 User Guide . If you want
      # to encrypt your metadata tables with server-side encryption with Key Management Service (KMS) keys
      # (SSE-KMS), you need additional permissions. For more information, see Setting up permissions for
      # configuring metadata tables in the Amazon S3 User Guide . If you also want to integrate your table
      # bucket with Amazon Web Services analytics services so that you can query your metadata table, you
      # need additional permissions. For more information, see Integrating Amazon S3 Tables with Amazon Web
      # Services analytics services in the Amazon S3 User Guide . s3:CreateBucketMetadataTableConfiguration
      # s3tables:CreateNamespace s3tables:GetTable s3tables:CreateTable s3tables:PutTablePolicy The
      # following operations are related to CreateBucketMetadataTableConfiguration :
      # DeleteBucketMetadataTableConfiguration GetBucketMetadataTableConfiguration You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def create_bucket_metadata_table_configuration(
        bucket : String,
        metadata_table_configuration : Types::MetadataTableConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::CreateBucketMetadataTableConfigurationRequest.new(bucket: bucket, metadata_table_configuration: metadata_table_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        create_bucket_metadata_table_configuration(input)
      end
      def create_bucket_metadata_table_configuration(input : Types::CreateBucketMetadataTableConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::CREATE_BUCKET_METADATA_TABLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email Grantee
      # Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request after October
      # 1, 2025, the request will receive an HTTP 405 (Method Not Allowed) error. This change affects the
      # following Amazon Web Services Regions: US East (N. Virginia), US West (N. California), US West
      # (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland),
      # and South America (São Paulo). This action initiates a multipart upload and returns an upload ID.
      # This upload ID is used to associate all of the parts in the specific multipart upload. You specify
      # this upload ID in each of your subsequent upload part requests (see UploadPart ). You also include
      # this upload ID in the final request to either complete or abort the multipart upload request. For
      # more information about multipart uploads, see Multipart Upload Overview in the Amazon S3 User Guide
      # . After you initiate a multipart upload and upload one or more parts, to stop being charged for
      # storing the uploaded parts, you must either complete or abort the multipart upload. Amazon S3 frees
      # up the space used to store the parts and stops charging you for storing them only after you either
      # complete or abort a multipart upload. If you have configured a lifecycle rule to abort incomplete
      # multipart uploads, the created multipart upload must be completed within the number of days
      # specified in the bucket lifecycle configuration. Otherwise, the incomplete multipart upload becomes
      # eligible for an abort action and Amazon S3 aborts the multipart upload. For more information, see
      # Aborting Incomplete Multipart Uploads Using a Bucket Lifecycle Configuration . Directory buckets -
      # S3 Lifecycle is not supported by directory buckets. Directory buckets - For directory buckets, you
      # must make requests for this API operation to the Zonal endpoint. These endpoints support
      # virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket .s3express- zone-id .
      # region-code .amazonaws.com/ key-name . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . Request
      # signing For request signing, multipart upload is just a series of regular requests. You initiate a
      # multipart upload, send one or more requests to upload parts, and then complete the multipart upload
      # process. You sign each request individually. There is nothing special about signing multipart upload
      # requests. For more information about signing, see Authenticating Requests (Amazon Web Services
      # Signature Version 4) in the Amazon S3 User Guide . Permissions General purpose bucket permissions -
      # To perform a multipart upload with encryption using an Key Management Service (KMS) KMS key, the
      # requester must have permission to the kms:Decrypt and kms:GenerateDataKey actions on the key. The
      # requester must also have permissions for the kms:GenerateDataKey action for the
      # CreateMultipartUpload API. Then, the requester needs permissions for the kms:Decrypt action on the
      # UploadPart and UploadPartCopy APIs. These permissions are required because Amazon S3 must decrypt
      # and read data from the encrypted file parts before it completes the multipart upload. For more
      # information, see Multipart upload API and permissions and Protecting data using server-side
      # encryption with Amazon Web Services KMS in the Amazon S3 User Guide . Directory bucket permissions -
      # To grant access to this API operation on a directory bucket, we recommend that you use the
      # CreateSession API operation for session-based authorization. Specifically, you grant the
      # s3express:CreateSession permission to the directory bucket in a bucket policy or an IAM
      # identity-based policy. Then, you make the CreateSession API call on the bucket to obtain a session
      # token. With the session token in your request header, you can make API requests to this operation.
      # After the session token expires, you make another CreateSession API call to generate a new session
      # token for use. Amazon Web Services CLI or SDKs create session and refresh the session token
      # automatically to avoid service interruptions when a session expires. For more information about
      # authorization, see CreateSession . Encryption General purpose buckets - Server-side encryption is
      # for data encryption at rest. Amazon S3 encrypts your data as it writes it to disks in its data
      # centers and decrypts it when you access it. Amazon S3 automatically encrypts all new objects that
      # are uploaded to an S3 bucket. When doing a multipart upload, if you don't specify encryption
      # information in your request, the encryption setting of the uploaded parts is set to the default
      # encryption configuration of the destination bucket. By default, all buckets have a base level of
      # encryption configuration that uses server-side encryption with Amazon S3 managed keys (SSE-S3). If
      # the destination bucket has a default encryption configuration that uses server-side encryption with
      # an Key Management Service (KMS) key (SSE-KMS), or a customer-provided encryption key (SSE-C), Amazon
      # S3 uses the corresponding KMS key, or a customer-provided key to encrypt the uploaded parts. When
      # you perform a CreateMultipartUpload operation, if you want to use a different type of encryption
      # setting for the uploaded parts, you can request that Amazon S3 encrypts the object with a different
      # encryption key (such as an Amazon S3 managed key, a KMS key, or a customer-provided key). When the
      # encryption setting in your request is different from the default encryption configuration of the
      # destination bucket, the encryption setting in your request takes precedence. If you choose to
      # provide your own encryption key, the request headers you provide in UploadPart and UploadPartCopy
      # requests must match the headers you used in the CreateMultipartUpload request. Use KMS keys
      # (SSE-KMS) that include the Amazon Web Services managed key ( aws/s3 ) and KMS customer managed keys
      # stored in Key Management Service (KMS) – If you want Amazon Web Services to manage the keys used to
      # encrypt data, specify the following headers in the request. x-amz-server-side-encryption
      # x-amz-server-side-encryption-aws-kms-key-id x-amz-server-side-encryption-context If you specify
      # x-amz-server-side-encryption:aws:kms , but don't provide x-amz-server-side-encryption-aws-kms-key-id
      # , Amazon S3 uses the Amazon Web Services managed key ( aws/s3 key) in KMS to protect the data. To
      # perform a multipart upload with encryption by using an Amazon Web Services KMS key, the requester
      # must have permission to the kms:Decrypt and kms:GenerateDataKey* actions on the key. These
      # permissions are required because Amazon S3 must decrypt and read data from the encrypted file parts
      # before it completes the multipart upload. For more information, see Multipart upload API and
      # permissions and Protecting data using server-side encryption with Amazon Web Services KMS in the
      # Amazon S3 User Guide . If your Identity and Access Management (IAM) user or role is in the same
      # Amazon Web Services account as the KMS key, then you must have these permissions on the key policy.
      # If your IAM user or role is in a different account from the key, then you must have the permissions
      # on both the key policy and your IAM user or role. All GET and PUT requests for an object protected
      # by KMS fail if you don't make them by using Secure Sockets Layer (SSL), Transport Layer Security
      # (TLS), or Signature Version 4. For information about configuring any of the officially supported
      # Amazon Web Services SDKs and Amazon Web Services CLI, see Specifying the Signature Version in
      # Request Authentication in the Amazon S3 User Guide . For more information about server-side
      # encryption with KMS keys (SSE-KMS), see Protecting Data Using Server-Side Encryption with KMS keys
      # in the Amazon S3 User Guide . Use customer-provided encryption keys (SSE-C) – If you want to manage
      # your own encryption keys, provide all the following headers in the request.
      # x-amz-server-side-encryption-customer-algorithm x-amz-server-side-encryption-customer-key
      # x-amz-server-side-encryption-customer-key-MD5 For more information about server-side encryption with
      # customer-provided encryption keys (SSE-C), see Protecting data using server-side encryption with
      # customer-provided encryption keys (SSE-C) in the Amazon S3 User Guide . Directory buckets - For
      # directory buckets, there are only two supported options for server-side encryption: server-side
      # encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side encryption with KMS keys
      # (SSE-KMS) ( aws:kms ). We recommend that the bucket's default encryption uses the desired encryption
      # configuration and you don't override the bucket default encryption in your CreateSession requests or
      # PUT object requests. Then, new objects are automatically encrypted with the desired encryption
      # settings. For more information, see Protecting data with server-side encryption in the Amazon S3
      # User Guide . For more information about the encryption overriding behaviors in directory buckets,
      # see Specifying server-side encryption with KMS for new object uploads . In the Zonal endpoint API
      # calls (except CopyObject and UploadPartCopy ) using the REST API, the encryption request headers
      # must match the encryption settings that are specified in the CreateSession request. You can't
      # override the values of the encryption settings ( x-amz-server-side-encryption ,
      # x-amz-server-side-encryption-aws-kms-key-id , x-amz-server-side-encryption-context , and
      # x-amz-server-side-encryption-bucket-key-enabled ) that are specified in the CreateSession request.
      # You don't need to explicitly specify these encryption settings values in Zonal endpoint API calls,
      # and Amazon S3 will use the encryption settings values from the CreateSession request to protect new
      # objects in the directory bucket. When you use the CLI or the Amazon Web Services SDKs, for
      # CreateSession , the session token refreshes automatically to avoid service interruptions when a
      # session expires. The CLI or the Amazon Web Services SDKs use the bucket's default encryption
      # configuration for the CreateSession request. It's not supported to override the encryption settings
      # values in the CreateSession request. So in the Zonal endpoint API calls (except CopyObject and
      # UploadPartCopy ), the encryption request headers must match the default encryption configuration of
      # the directory bucket. For directory buckets, when you perform a CreateMultipartUpload operation and
      # an UploadPartCopy operation, the request headers you provide in the CreateMultipartUpload request
      # must match the default encryption configuration of the destination bucket. HTTP Host header syntax
      # Directory buckets - The HTTP Host header syntax is Bucket-name .s3express- zone-id . region-code
      # .amazonaws.com . The following operations are related to CreateMultipartUpload : UploadPart
      # CompleteMultipartUpload AbortMultipartUpload ListParts ListMultipartUploads You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def create_multipart_upload(
        bucket : String,
        key : String,
        acl : String? = nil,
        bucket_key_enabled : Bool? = nil,
        cache_control : String? = nil,
        checksum_algorithm : String? = nil,
        checksum_type : String? = nil,
        content_disposition : String? = nil,
        content_encoding : String? = nil,
        content_language : String? = nil,
        content_type : String? = nil,
        expected_bucket_owner : String? = nil,
        expires : String? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write_acp : String? = nil,
        metadata : Hash(String, String)? = nil,
        object_lock_legal_hold_status : String? = nil,
        object_lock_mode : String? = nil,
        object_lock_retain_until_date : Time? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        ssekms_encryption_context : String? = nil,
        ssekms_key_id : String? = nil,
        server_side_encryption : String? = nil,
        storage_class : String? = nil,
        tagging : String? = nil,
        website_redirect_location : String? = nil
      ) : Types::CreateMultipartUploadOutput
        input = Types::CreateMultipartUploadRequest.new(bucket: bucket, key: key, acl: acl, bucket_key_enabled: bucket_key_enabled, cache_control: cache_control, checksum_algorithm: checksum_algorithm, checksum_type: checksum_type, content_disposition: content_disposition, content_encoding: content_encoding, content_language: content_language, content_type: content_type, expected_bucket_owner: expected_bucket_owner, expires: expires, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write_acp: grant_write_acp, metadata: metadata, object_lock_legal_hold_status: object_lock_legal_hold_status, object_lock_mode: object_lock_mode, object_lock_retain_until_date: object_lock_retain_until_date, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, ssekms_encryption_context: ssekms_encryption_context, ssekms_key_id: ssekms_key_id, server_side_encryption: server_side_encryption, storage_class: storage_class, tagging: tagging, website_redirect_location: website_redirect_location)
        create_multipart_upload(input)
      end
      def create_multipart_upload(input : Types::CreateMultipartUploadRequest) : Types::CreateMultipartUploadOutput
        request = Protocol::RestXml.build_request(Model::CREATE_MULTIPART_UPLOAD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateMultipartUploadOutput, "CreateMultipartUpload")
      end

      # Creates a session that establishes temporary security credentials to support fast authentication and
      # authorization for the Zonal endpoint API operations on directory buckets. For more information about
      # Zonal endpoint API operations that include the Availability Zone in the request endpoint, see S3
      # Express One Zone APIs in the Amazon S3 User Guide . To make Zonal endpoint API requests on a
      # directory bucket, use the CreateSession API operation. Specifically, you grant
      # s3express:CreateSession permission to a bucket in a bucket policy or an IAM identity-based policy.
      # Then, you use IAM credentials to make the CreateSession API request on the bucket, which returns
      # temporary security credentials that include the access key ID, secret access key, session token, and
      # expiration. These credentials have associated permissions to access the Zonal endpoint API
      # operations. After the session is created, you don’t need to use other policies to grant permissions
      # to each Zonal endpoint API individually. Instead, in your Zonal endpoint API requests, you sign your
      # requests by applying the temporary security credentials of the session to the request headers and
      # following the SigV4 protocol for authentication. You also apply the session token to the
      # x-amz-s3session-token request header for authorization. Temporary security credentials are scoped to
      # the bucket and expire after 5 minutes. After the expiration time, any calls that you make with those
      # credentials will fail. You must use IAM credentials again to make a CreateSession API request that
      # generates a new set of temporary credentials for use. Temporary credentials cannot be extended or
      # refreshed beyond the original specified interval. If you use Amazon Web Services SDKs, SDKs handle
      # the session token refreshes automatically to avoid service interruptions when a session expires. We
      # recommend that you use the Amazon Web Services SDKs to initiate and manage requests to the
      # CreateSession API. For more information, see Performance guidelines and design patterns in the
      # Amazon S3 User Guide . You must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// bucket-name .s3express-
      # zone-id . region-code .amazonaws.com . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . CopyObject
      # API operation - Unlike other Zonal endpoint API operations, the CopyObject API operation doesn't use
      # the temporary security credentials returned from the CreateSession API operation for authentication
      # and authorization. For information about authentication and authorization of the CopyObject API
      # operation on directory buckets, see CopyObject . HeadBucket API operation - Unlike other Zonal
      # endpoint API operations, the HeadBucket API operation doesn't use the temporary security credentials
      # returned from the CreateSession API operation for authentication and authorization. For information
      # about authentication and authorization of the HeadBucket API operation on directory buckets, see
      # HeadBucket . Permissions To obtain temporary security credentials, you must create a bucket policy
      # or an IAM identity-based policy that grants s3express:CreateSession permission to the bucket. In a
      # policy, you can have the s3express:SessionMode condition key to control who can create a ReadWrite
      # or ReadOnly session. For more information about ReadWrite or ReadOnly sessions, see
      # x-amz-create-session-mode . For example policies, see Example bucket policies for S3 Express One
      # Zone and Amazon Web Services Identity and Access Management (IAM) identity-based policies for S3
      # Express One Zone in the Amazon S3 User Guide . To grant cross-account access to Zonal endpoint API
      # operations, the bucket policy should also grant both accounts the s3express:CreateSession
      # permission. If you want to encrypt objects with SSE-KMS, you must also have the kms:GenerateDataKey
      # and the kms:Decrypt permissions in IAM identity-based policies and KMS key policies for the target
      # KMS key. Encryption For directory buckets, there are only two supported options for server-side
      # encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) ( AES256 ) and server-side
      # encryption with KMS keys (SSE-KMS) ( aws:kms ). We recommend that the bucket's default encryption
      # uses the desired encryption configuration and you don't override the bucket default encryption in
      # your CreateSession requests or PUT object requests. Then, new objects are automatically encrypted
      # with the desired encryption settings. For more information, see Protecting data with server-side
      # encryption in the Amazon S3 User Guide . For more information about the encryption overriding
      # behaviors in directory buckets, see Specifying server-side encryption with KMS for new object
      # uploads . For Zonal endpoint (object-level) API operations except CopyObject and UploadPartCopy ,
      # you authenticate and authorize requests through CreateSession for low latency. To encrypt new
      # objects in a directory bucket with SSE-KMS, you must specify SSE-KMS as the directory bucket's
      # default encryption configuration with a KMS key (specifically, a customer managed key ). Then, when
      # a session is created for Zonal endpoint API operations, new objects are automatically encrypted and
      # decrypted with SSE-KMS and S3 Bucket Keys during the session. Only 1 customer managed key is
      # supported per directory bucket for the lifetime of the bucket. The Amazon Web Services managed key (
      # aws/s3 ) isn't supported. After you specify SSE-KMS as your bucket's default encryption
      # configuration with a customer managed key, you can't change the customer managed key for the
      # bucket's SSE-KMS configuration. In the Zonal endpoint API calls (except CopyObject and
      # UploadPartCopy ) using the REST API, you can't override the values of the encryption settings (
      # x-amz-server-side-encryption , x-amz-server-side-encryption-aws-kms-key-id ,
      # x-amz-server-side-encryption-context , and x-amz-server-side-encryption-bucket-key-enabled ) from
      # the CreateSession request. You don't need to explicitly specify these encryption settings values in
      # Zonal endpoint API calls, and Amazon S3 will use the encryption settings values from the
      # CreateSession request to protect new objects in the directory bucket. When you use the CLI or the
      # Amazon Web Services SDKs, for CreateSession , the session token refreshes automatically to avoid
      # service interruptions when a session expires. The CLI or the Amazon Web Services SDKs use the
      # bucket's default encryption configuration for the CreateSession request. It's not supported to
      # override the encryption settings values in the CreateSession request. Also, in the Zonal endpoint
      # API calls (except CopyObject and UploadPartCopy ), it's not supported to override the values of the
      # encryption settings from the CreateSession request. HTTP Host header syntax Directory buckets - The
      # HTTP Host header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def create_session(
        bucket : String,
        bucket_key_enabled : Bool? = nil,
        ssekms_encryption_context : String? = nil,
        ssekms_key_id : String? = nil,
        server_side_encryption : String? = nil,
        session_mode : String? = nil
      ) : Types::CreateSessionOutput
        input = Types::CreateSessionRequest.new(bucket: bucket, bucket_key_enabled: bucket_key_enabled, ssekms_encryption_context: ssekms_encryption_context, ssekms_key_id: ssekms_key_id, server_side_encryption: server_side_encryption, session_mode: session_mode)
        create_session(input)
      end
      def create_session(input : Types::CreateSessionRequest) : Types::CreateSessionOutput
        request = Protocol::RestXml.build_request(Model::CREATE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateSessionOutput, "CreateSession")
      end

      # Deletes the S3 bucket. All objects (including all object versions and delete markers) in the bucket
      # must be deleted before the bucket itself can be deleted. Directory buckets - If multipart uploads in
      # a directory bucket are in progress, you can't delete the bucket until all the in-progress multipart
      # uploads are aborted or completed. Directory buckets - For directory buckets, you must make requests
      # for this API operation to the Regional endpoint. These endpoints support path-style requests in the
      # format https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style
      # requests aren't supported. For more information about endpoints in Availability Zones, see Regional
      # and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3 User Guide . For
      # more information about endpoints in Local Zones, see Concepts for directory buckets in Local Zones
      # in the Amazon S3 User Guide . Permissions General purpose bucket permissions - You must have the
      # s3:DeleteBucket permission on the specified bucket in a policy. Directory bucket permissions - You
      # must have the s3express:DeleteBucket permission in an IAM identity-based policy instead of a bucket
      # policy. Cross-account access to this API operation isn't supported. This operation can only be
      # performed by the Amazon Web Services account that owns the resource. For more information about
      # directory bucket policies and permissions, see Amazon Web Services Identity and Access Management
      # (IAM) for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header syntax Directory
      # buckets - The HTTP Host header syntax is s3express-control. region-code .amazonaws.com . The
      # following operations are related to DeleteBucket : CreateBucket DeleteObject You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket(input)
      end
      def delete_bucket(input : Types::DeleteBucketRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes an analytics configuration for the
      # bucket (specified by the analytics configuration ID). To use this operation, you must have
      # permissions to perform the s3:PutAnalyticsConfiguration action. The bucket owner has this permission
      # by default. The bucket owner can grant this permission to others. For more information about
      # permissions, see Permissions Related to Bucket Subresource Operations and Managing Access
      # Permissions to Your Amazon S3 Resources . For information about the Amazon S3 analytics feature, see
      # Amazon S3 Analytics – Storage Class Analysis . The following operations are related to
      # DeleteBucketAnalyticsConfiguration : GetBucketAnalyticsConfiguration
      # ListBucketAnalyticsConfigurations PutBucketAnalyticsConfiguration You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_analytics_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketAnalyticsConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_analytics_configuration(input)
      end
      def delete_bucket_analytics_configuration(input : Types::DeleteBucketAnalyticsConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_ANALYTICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes the cors configuration information
      # set for the bucket. To use this operation, you must have permission to perform the s3:PutBucketCORS
      # action. The bucket owner has this permission by default and can grant this permission to others. For
      # information about cors , see Enabling Cross-Origin Resource Sharing in the Amazon S3 User Guide .
      # Related Resources PutBucketCors RESTOPTIONSobject You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def delete_bucket_cors(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketCorsRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_cors(input)
      end
      def delete_bucket_cors(input : Types::DeleteBucketCorsRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_CORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This implementation of the DELETE action resets the default encryption for the bucket as server-side
      # encryption with Amazon S3 managed keys (SSE-S3). General purpose buckets - For information about the
      # bucket default encryption feature, see Amazon S3 Bucket Default Encryption in the Amazon S3 User
      # Guide . Directory buckets - For directory buckets, there are only two supported options for
      # server-side encryption: SSE-S3 and SSE-KMS. For information about the default encryption
      # configuration in directory buckets, see Setting default server-side encryption behavior for
      # directory buckets . Permissions General purpose bucket permissions - The
      # s3:PutEncryptionConfiguration permission is required in a policy. The bucket owner has this
      # permission by default. The bucket owner can grant this permission to others. For more information
      # about permissions, see Permissions Related to Bucket Operations and Managing Access Permissions to
      # Your Amazon S3 Resources . Directory bucket permissions - To grant access to this API operation, you
      # must have the s3express:PutEncryptionConfiguration permission in an IAM identity-based policy
      # instead of a bucket policy. Cross-account access to this API operation isn't supported. This
      # operation can only be performed by the Amazon Web Services account that owns the resource. For more
      # information about directory bucket policies and permissions, see Amazon Web Services Identity and
      # Access Management (IAM) for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header
      # syntax Directory buckets - The HTTP Host header syntax is s3express-control. region-code
      # .amazonaws.com . The following operations are related to DeleteBucketEncryption :
      # PutBucketEncryption GetBucketEncryption You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def delete_bucket_encryption(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketEncryptionRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_encryption(input)
      end
      def delete_bucket_encryption(input : Types::DeleteBucketEncryptionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes the S3 Intelligent-Tiering
      # configuration from the specified bucket. The S3 Intelligent-Tiering storage class is designed to
      # optimize storage costs by automatically moving data to the most cost-effective storage access tier,
      # without performance impact or operational overhead. S3 Intelligent-Tiering delivers automatic cost
      # savings in three low latency and high throughput access tiers. To get the lowest storage cost on
      # data that can be accessed in minutes to hours, you can choose to activate additional archiving
      # capabilities. The S3 Intelligent-Tiering storage class is the ideal storage class for data with
      # unknown, changing, or unpredictable access patterns, independent of object size or retention period.
      # If the size of an object is less than 128 KB, it is not monitored and not eligible for auto-tiering.
      # Smaller objects can be stored, but they are always charged at the Frequent Access tier rates in the
      # S3 Intelligent-Tiering storage class. For more information, see Storage class for automatically
      # optimizing frequently and infrequently accessed objects . Operations related to
      # DeleteBucketIntelligentTieringConfiguration include: GetBucketIntelligentTieringConfiguration
      # PutBucketIntelligentTieringConfiguration ListBucketIntelligentTieringConfigurations You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_intelligent_tiering_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketIntelligentTieringConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_intelligent_tiering_configuration(input)
      end
      def delete_bucket_intelligent_tiering_configuration(input : Types::DeleteBucketIntelligentTieringConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_INTELLIGENT_TIERING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes an S3 Inventory configuration
      # (identified by the inventory ID) from the bucket. To use this operation, you must have permissions
      # to perform the s3:PutInventoryConfiguration action. The bucket owner has this permission by default.
      # The bucket owner can grant this permission to others. For more information about permissions, see
      # Permissions Related to Bucket Subresource Operations and Managing Access Permissions to Your Amazon
      # S3 Resources . For information about the Amazon S3 inventory feature, see Amazon S3 Inventory .
      # Operations related to DeleteBucketInventoryConfiguration include: GetBucketInventoryConfiguration
      # PutBucketInventoryConfiguration ListBucketInventoryConfigurations You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_inventory_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketInventoryConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_inventory_configuration(input)
      end
      def delete_bucket_inventory_configuration(input : Types::DeleteBucketInventoryConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_INVENTORY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the lifecycle configuration from the specified bucket. Amazon S3 removes all the lifecycle
      # configuration rules in the lifecycle subresource associated with the bucket. Your objects never
      # expire, and Amazon S3 no longer automatically deletes any objects on the basis of rules contained in
      # the deleted lifecycle configuration. Permissions General purpose bucket permissions - By default,
      # all Amazon S3 resources are private, including buckets, objects, and related subresources (for
      # example, lifecycle configuration and website configuration). Only the resource owner (that is, the
      # Amazon Web Services account that created it) can access the resource. The resource owner can
      # optionally grant access permissions to others by writing an access policy. For this operation, a
      # user must have the s3:PutLifecycleConfiguration permission. For more information about permissions,
      # see Managing Access Permissions to Your Amazon S3 Resources . Directory bucket permissions - You
      # must have the s3express:PutLifecycleConfiguration permission in an IAM identity-based policy to use
      # this operation. Cross-account access to this API operation isn't supported. The resource owner can
      # optionally grant access permissions to others by creating a role or user for them as long as they
      # are within the same account as the owner and resource. For more information about directory bucket
      # policies and permissions, see Authorizing Regional endpoint APIs with IAM in the Amazon S3 User
      # Guide . Directory buckets - For directory buckets, you must make requests for this API operation to
      # the Regional endpoint. These endpoints support path-style requests in the format
      # https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style requests
      # aren't supported. For more information about endpoints in Availability Zones, see Regional and Zonal
      # endpoints for directory buckets in Availability Zones in the Amazon S3 User Guide . For more
      # information about endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the
      # Amazon S3 User Guide . HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # s3express-control. region .amazonaws.com . For more information about the object expiration, see
      # Elements to Describe Lifecycle Actions . Related actions include: PutBucketLifecycleConfiguration
      # GetBucketLifecycleConfiguration You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def delete_bucket_lifecycle(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketLifecycleRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_lifecycle(input)
      end
      def delete_bucket_lifecycle(input : Types::DeleteBucketLifecycleRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_LIFECYCLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an S3 Metadata configuration from a general purpose bucket. For more information, see
      # Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide . You can use the V2
      # DeleteBucketMetadataConfiguration API operation with V1 or V2 metadata configurations. However, if
      # you try to use the V1 DeleteBucketMetadataTableConfiguration API operation with V2 configurations,
      # you will receive an HTTP 405 Method Not Allowed error. Permissions To use this operation, you must
      # have the s3:DeleteBucketMetadataTableConfiguration permission. For more information, see Setting up
      # permissions for configuring metadata tables in the Amazon S3 User Guide . The IAM policy action name
      # is the same for the V1 and V2 API operations. The following operations are related to
      # DeleteBucketMetadataConfiguration : CreateBucketMetadataConfiguration GetBucketMetadataConfiguration
      # UpdateBucketMetadataInventoryTableConfiguration UpdateBucketMetadataJournalTableConfiguration You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_metadata_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketMetadataConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_metadata_configuration(input)
      end
      def delete_bucket_metadata_configuration(input : Types::DeleteBucketMetadataConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_METADATA_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # We recommend that you delete your S3 Metadata configurations by using the V2
      # DeleteBucketMetadataTableConfiguration API operation. We no longer recommend using the V1
      # DeleteBucketMetadataTableConfiguration API operation. If you created your S3 Metadata configuration
      # before July 15, 2025, we recommend that you delete and re-create your configuration by using
      # CreateBucketMetadataConfiguration so that you can expire journal table records and create a live
      # inventory table. Deletes a V1 S3 Metadata configuration from a general purpose bucket. For more
      # information, see Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide . You can
      # use the V2 DeleteBucketMetadataConfiguration API operation with V1 or V2 metadata table
      # configurations. However, if you try to use the V1 DeleteBucketMetadataTableConfiguration API
      # operation with V2 configurations, you will receive an HTTP 405 Method Not Allowed error. Make sure
      # that you update your processes to use the new V2 API operations ( CreateBucketMetadataConfiguration
      # , GetBucketMetadataConfiguration , and DeleteBucketMetadataConfiguration ) instead of the V1 API
      # operations. Permissions To use this operation, you must have the
      # s3:DeleteBucketMetadataTableConfiguration permission. For more information, see Setting up
      # permissions for configuring metadata tables in the Amazon S3 User Guide . The following operations
      # are related to DeleteBucketMetadataTableConfiguration : CreateBucketMetadataTableConfiguration
      # GetBucketMetadataTableConfiguration You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def delete_bucket_metadata_table_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketMetadataTableConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_metadata_table_configuration(input)
      end
      def delete_bucket_metadata_table_configuration(input : Types::DeleteBucketMetadataTableConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_METADATA_TABLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes a metrics configuration for the
      # Amazon CloudWatch request metrics (specified by the metrics configuration ID) from the bucket. Note
      # that this doesn't include the daily storage metrics. To use this operation, you must have
      # permissions to perform the s3:PutMetricsConfiguration action. The bucket owner has this permission
      # by default. The bucket owner can grant this permission to others. For more information about
      # permissions, see Permissions Related to Bucket Subresource Operations and Managing Access
      # Permissions to Your Amazon S3 Resources . For information about CloudWatch request metrics for
      # Amazon S3, see Monitoring Metrics with Amazon CloudWatch . The following operations are related to
      # DeleteBucketMetricsConfiguration : GetBucketMetricsConfiguration PutBucketMetricsConfiguration
      # ListBucketMetricsConfigurations Monitoring Metrics with Amazon CloudWatch You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_metrics_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketMetricsConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_metrics_configuration(input)
      end
      def delete_bucket_metrics_configuration(input : Types::DeleteBucketMetricsConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Removes OwnershipControls for an Amazon S3
      # bucket. To use this operation, you must have the s3:PutBucketOwnershipControls permission. For more
      # information about Amazon S3 permissions, see Specifying Permissions in a Policy . For information
      # about Amazon S3 Object Ownership, see Using Object Ownership . The following operations are related
      # to DeleteBucketOwnershipControls : GetBucketOwnershipControls PutBucketOwnershipControls You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_ownership_controls(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketOwnershipControlsRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_ownership_controls(input)
      end
      def delete_bucket_ownership_controls(input : Types::DeleteBucketOwnershipControlsRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_OWNERSHIP_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the policy of a specified bucket. Directory buckets - For directory buckets, you must make
      # requests for this API operation to the Regional endpoint. These endpoints support path-style
      # requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name .
      # Virtual-hosted-style requests aren't supported. For more information about endpoints in Availability
      # Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3
      # User Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets
      # in Local Zones in the Amazon S3 User Guide . Permissions If you are using an identity other than the
      # root user of the Amazon Web Services account that owns the bucket, the calling identity must both
      # have the DeleteBucketPolicy permissions on the specified bucket and belong to the bucket owner's
      # account in order to use this operation. If you don't have DeleteBucketPolicy permissions, Amazon S3
      # returns a 403 Access Denied error. If you have the correct permissions, but you're not using an
      # identity that belongs to the bucket owner's account, Amazon S3 returns a 405 Method Not Allowed
      # error. To ensure that bucket owners don't inadvertently lock themselves out of their own buckets,
      # the root principal in a bucket owner's Amazon Web Services account can perform the GetBucketPolicy ,
      # PutBucketPolicy , and DeleteBucketPolicy API actions, even if their bucket policy explicitly denies
      # the root principal's access. Bucket owner root principals can only be blocked from performing these
      # API actions by VPC endpoint policies and Amazon Web Services Organizations policies. General purpose
      # bucket permissions - The s3:DeleteBucketPolicy permission is required in a policy. For more
      # information about general purpose buckets bucket policies, see Using Bucket Policies and User
      # Policies in the Amazon S3 User Guide . Directory bucket permissions - To grant access to this API
      # operation, you must have the s3express:DeleteBucketPolicy permission in an IAM identity-based policy
      # instead of a bucket policy. Cross-account access to this API operation isn't supported. This
      # operation can only be performed by the Amazon Web Services account that owns the resource. For more
      # information about directory bucket policies and permissions, see Amazon Web Services Identity and
      # Access Management (IAM) for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header
      # syntax Directory buckets - The HTTP Host header syntax is s3express-control. region-code
      # .amazonaws.com . The following operations are related to DeleteBucketPolicy CreateBucket
      # DeleteObject You must URL encode any signed header values that contain spaces. For example, if your
      # header value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def delete_bucket_policy(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketPolicyRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_policy(input)
      end
      def delete_bucket_policy(input : Types::DeleteBucketPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes the replication configuration from
      # the bucket. To use this operation, you must have permissions to perform the
      # s3:PutReplicationConfiguration action. The bucket owner has these permissions by default and can
      # grant it to others. For more information about permissions, see Permissions Related to Bucket
      # Subresource Operations and Managing Access Permissions to Your Amazon S3 Resources . It can take a
      # while for the deletion of a replication configuration to fully propagate. For information about
      # replication configuration, see Replication in the Amazon S3 User Guide . The following operations
      # are related to DeleteBucketReplication : PutBucketReplication GetBucketReplication You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_replication(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketReplicationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_replication(input)
      end
      def delete_bucket_replication(input : Types::DeleteBucketReplicationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Deletes tags from the general purpose bucket
      # if attribute based access control (ABAC) is not enabled for the bucket. When you enable ABAC for a
      # general purpose bucket , you can no longer use this operation for that bucket and must use
      # UntagResource instead. if ABAC is not enabled for the bucket. When you enable ABAC for a general
      # purpose bucket , you can no longer use this operation for that bucket and must use UntagResource
      # instead. To use this operation, you must have permission to perform the s3:PutBucketTagging action.
      # By default, the bucket owner has this permission and can grant this permission to others. The
      # following operations are related to DeleteBucketTagging : GetBucketTagging PutBucketTagging You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_tagging(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketTaggingRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_tagging(input)
      end
      def delete_bucket_tagging(input : Types::DeleteBucketTaggingRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. This action removes the website configuration
      # for a bucket. Amazon S3 returns a 200 OK response upon successfully deleting a website configuration
      # on the specified bucket. You will get a 200 OK response if the website configuration you are trying
      # to delete does not exist on the bucket. Amazon S3 returns a 404 response if the bucket specified in
      # the request does not exist. This DELETE action requires the S3:DeleteBucketWebsite permission. By
      # default, only the bucket owner can delete the website configuration attached to a bucket. However,
      # bucket owners can grant other users permission to delete the website configuration by writing a
      # bucket policy granting them the S3:DeleteBucketWebsite permission. For more information about
      # hosting websites, see Hosting Websites on Amazon S3 . The following operations are related to
      # DeleteBucketWebsite : GetBucketWebsite PutBucketWebsite You must URL encode any signed header values
      # that contain spaces. For example, if your header value is my file.txt , containing two spaces after
      # my , you must URL encode this value to my%20%20file.txt .
      def delete_bucket_website(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeleteBucketWebsiteRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_bucket_website(input)
      end
      def delete_bucket_website(input : Types::DeleteBucketWebsiteRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_BUCKET_WEBSITE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Removes an object from a bucket. The behavior depends on the bucket's versioning state: If bucket
      # versioning is not enabled, the operation permanently deletes the object. If bucket versioning is
      # enabled, the operation inserts a delete marker, which becomes the current version of the object. To
      # permanently delete an object in a versioned bucket, you must include the object’s versionId in the
      # request. For more information about versioning-enabled buckets, see Deleting object versions from a
      # versioning-enabled bucket . If bucket versioning is suspended, the operation removes the object that
      # has a null versionId , if there is one, and inserts a delete marker that becomes the current version
      # of the object. If there isn't an object with a null versionId , and all versions of the object have
      # a versionId , Amazon S3 does not remove the object and only inserts a delete marker. To permanently
      # delete an object that has a versionId , you must include the object’s versionId in the request. For
      # more information about versioning-suspended buckets, see Deleting objects from versioning-suspended
      # buckets . Directory buckets - S3 Versioning isn't enabled and supported for directory buckets. For
      # this API operation, only the null value of the version ID is supported by directory buckets. You can
      # only specify null to the versionId query parameter in the request. Directory buckets - For directory
      # buckets, you must make requests for this API operation to the Zonal endpoint. These endpoints
      # support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket .s3express- zone-id
      # . region-code .amazonaws.com/ key-name . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . To remove a
      # specific version, you must use the versionId query parameter. Using this query parameter permanently
      # deletes the version. If the object deleted is a delete marker, Amazon S3 sets the response header
      # x-amz-delete-marker to true. If the object you want to delete is in a bucket where the bucket
      # versioning configuration is MFA Delete enabled, you must include the x-amz-mfa request header in the
      # DELETE versionId request. Requests that include x-amz-mfa must use HTTPS. For more information about
      # MFA Delete, see Using MFA Delete in the Amazon S3 User Guide . To see sample requests that use
      # versioning, see Sample Request . Directory buckets - MFA delete is not supported by directory
      # buckets. You can delete objects by explicitly calling DELETE Object or calling ( PutBucketLifecycle
      # ) to enable Amazon S3 to remove them for you. If you want to block users or accounts from removing
      # or deleting objects from your bucket, you must deny them the s3:DeleteObject ,
      # s3:DeleteObjectVersion , and s3:PutLifeCycleConfiguration actions. Directory buckets - S3 Lifecycle
      # is not supported by directory buckets. Permissions General purpose bucket permissions - The
      # following permissions are required in your policies when your DeleteObjects request includes
      # specific headers. s3:DeleteObject - To delete an object from a bucket, you must always have the
      # s3:DeleteObject permission. s3:DeleteObjectVersion - To delete a specific version of an object from
      # a versioning-enabled bucket, you must have the s3:DeleteObjectVersion permission. If the
      # s3:DeleteObject or s3:DeleteObjectVersion permissions are explicitly denied in your bucket policy,
      # attempts to delete any unversioned objects result in a 403 Access Denied error. Directory bucket
      # permissions - To grant access to this API operation on a directory bucket, we recommend that you use
      # the CreateSession API operation for session-based authorization. Specifically, you grant the
      # s3express:CreateSession permission to the directory bucket in a bucket policy or an IAM
      # identity-based policy. Then, you make the CreateSession API call on the bucket to obtain a session
      # token. With the session token in your request header, you can make API requests to this operation.
      # After the session token expires, you make another CreateSession API call to generate a new session
      # token for use. Amazon Web Services CLI or SDKs create session and refresh the session token
      # automatically to avoid service interruptions when a session expires. For more information about
      # authorization, see CreateSession . HTTP Host header syntax Directory buckets - The HTTP Host header
      # syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The following action is
      # related to DeleteObject : PutObject You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt . The If-Match header is supported for both general
      # purpose and directory buckets. IfMatchLastModifiedTime and IfMatchSize is only supported for
      # directory buckets.
      def delete_object(
        bucket : String,
        key : String,
        bypass_governance_retention : Bool? = nil,
        expected_bucket_owner : String? = nil,
        if_match : String? = nil,
        if_match_last_modified_time : Time? = nil,
        if_match_size : Int64? = nil,
        mfa : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::DeleteObjectOutput
        input = Types::DeleteObjectRequest.new(bucket: bucket, key: key, bypass_governance_retention: bypass_governance_retention, expected_bucket_owner: expected_bucket_owner, if_match: if_match, if_match_last_modified_time: if_match_last_modified_time, if_match_size: if_match_size, mfa: mfa, request_payer: request_payer, version_id: version_id)
        delete_object(input)
      end
      def delete_object(input : Types::DeleteObjectRequest) : Types::DeleteObjectOutput
        request = Protocol::RestXml.build_request(Model::DELETE_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteObjectOutput, "DeleteObject")
      end

      # This operation is not supported for directory buckets. Removes the entire tag set from the specified
      # object. For more information about managing object tags, see Object Tagging . To use this operation,
      # you must have permission to perform the s3:DeleteObjectTagging action. To delete tags of a specific
      # object version, add the versionId query parameter in the request. You will need permission for the
      # s3:DeleteObjectVersionTagging action. The following operations are related to DeleteObjectTagging :
      # PutObjectTagging GetObjectTagging You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def delete_object_tagging(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        version_id : String? = nil
      ) : Types::DeleteObjectTaggingOutput
        input = Types::DeleteObjectTaggingRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, version_id: version_id)
        delete_object_tagging(input)
      end
      def delete_object_tagging(input : Types::DeleteObjectTaggingRequest) : Types::DeleteObjectTaggingOutput
        request = Protocol::RestXml.build_request(Model::DELETE_OBJECT_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteObjectTaggingOutput, "DeleteObjectTagging")
      end

      # This operation enables you to delete multiple objects from a bucket using a single HTTP request. If
      # you know the object keys that you want to delete, then this operation provides a suitable
      # alternative to sending individual delete requests, reducing per-request overhead. The request can
      # contain a list of up to 1,000 keys that you want to delete. In the XML, you provide the object key
      # names, and optionally, version IDs if you want to delete a specific version of the object from a
      # versioning-enabled bucket. For each key, Amazon S3 performs a delete operation and returns the
      # result of that delete, success or failure, in the response. If the object specified in the request
      # isn't found, Amazon S3 confirms the deletion by returning the result as deleted. Directory buckets -
      # S3 Versioning isn't enabled and supported for directory buckets. Directory buckets - For directory
      # buckets, you must make requests for this API operation to the Zonal endpoint. These endpoints
      # support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket .s3express- zone-id
      # . region-code .amazonaws.com/ key-name . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . The operation
      # supports two modes for the response: verbose and quiet. By default, the operation uses verbose mode
      # in which the response includes the result of deletion of each key in your request. In quiet mode the
      # response includes only keys where the delete operation encountered an error. For a successful
      # deletion in a quiet mode, the operation does not return any information about the delete in the
      # response body. When performing this action on an MFA Delete enabled bucket, that attempts to delete
      # any versioned objects, you must include an MFA token. If you do not provide one, the entire request
      # will fail, even if there are non-versioned objects you are trying to delete. If you provide an
      # invalid token, whether there are versioned keys in the request or not, the entire Multi-Object
      # Delete request will fail. For information about MFA Delete, see MFA Delete in the Amazon S3 User
      # Guide . Directory buckets - MFA delete is not supported by directory buckets. Permissions General
      # purpose bucket permissions - The following permissions are required in your policies when your
      # DeleteObjects request includes specific headers. s3:DeleteObject - To delete an object from a
      # bucket, you must always specify the s3:DeleteObject permission. s3:DeleteObjectVersion - To delete a
      # specific version of an object from a versioning-enabled bucket, you must specify the
      # s3:DeleteObjectVersion permission. If the s3:DeleteObject or s3:DeleteObjectVersion permissions are
      # explicitly denied in your bucket policy, attempts to delete any unversioned objects result in a 403
      # Access Denied error. Directory bucket permissions - To grant access to this API operation on a
      # directory bucket, we recommend that you use the CreateSession API operation for session-based
      # authorization. Specifically, you grant the s3express:CreateSession permission to the directory
      # bucket in a bucket policy or an IAM identity-based policy. Then, you make the CreateSession API call
      # on the bucket to obtain a session token. With the session token in your request header, you can make
      # API requests to this operation. After the session token expires, you make another CreateSession API
      # call to generate a new session token for use. Amazon Web Services CLI or SDKs create session and
      # refresh the session token automatically to avoid service interruptions when a session expires. For
      # more information about authorization, see CreateSession . Content-MD5 request header General purpose
      # bucket - The Content-MD5 request header is required for all Multi-Object Delete requests. Amazon S3
      # uses the header value to ensure that your request body has not been altered in transit. Directory
      # bucket - The Content-MD5 request header or a additional checksum request header (including
      # x-amz-checksum-crc32 , x-amz-checksum-crc32c , x-amz-checksum-sha1 , or x-amz-checksum-sha256 ) is
      # required for all Multi-Object Delete requests. HTTP Host header syntax Directory buckets - The HTTP
      # Host header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The following
      # operations are related to DeleteObjects : CreateMultipartUpload UploadPart CompleteMultipartUpload
      # ListParts AbortMultipartUpload You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def delete_objects(
        bucket : String,
        delete : Types::Delete,
        bypass_governance_retention : Bool? = nil,
        checksum_algorithm : String? = nil,
        expected_bucket_owner : String? = nil,
        mfa : String? = nil,
        request_payer : String? = nil
      ) : Types::DeleteObjectsOutput
        input = Types::DeleteObjectsRequest.new(bucket: bucket, delete: delete, bypass_governance_retention: bypass_governance_retention, checksum_algorithm: checksum_algorithm, expected_bucket_owner: expected_bucket_owner, mfa: mfa, request_payer: request_payer)
        delete_objects(input)
      end
      def delete_objects(input : Types::DeleteObjectsRequest) : Types::DeleteObjectsOutput
        request = Protocol::RestXml.build_request(Model::DELETE_OBJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteObjectsOutput, "DeleteObjects")
      end

      # This operation is not supported for directory buckets. Removes the PublicAccessBlock configuration
      # for an Amazon S3 bucket. This operation removes the bucket-level configuration only. The effective
      # public access behavior will still be governed by account-level settings (which may inherit from
      # organization-level policies). To use this operation, you must have the s3:PutBucketPublicAccessBlock
      # permission. For more information about permissions, see Permissions Related to Bucket Subresource
      # Operations and Managing Access Permissions to Your Amazon S3 Resources . The following operations
      # are related to DeletePublicAccessBlock : Using Amazon S3 Block Public Access GetPublicAccessBlock
      # PutPublicAccessBlock GetBucketPolicyStatus You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def delete_public_access_block(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::DeletePublicAccessBlockRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        delete_public_access_block(input)
      end
      def delete_public_access_block(input : Types::DeletePublicAccessBlockRequest) : Nil
        request = Protocol::RestXml.build_request(Model::DELETE_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Returns the attribute-based access control (ABAC) property of the general purpose bucket. If ABAC is
      # enabled on your bucket, you can use tags on the bucket for access control. For more information, see
      # Enabling ABAC in general purpose buckets .
      def get_bucket_abac(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketAbacOutput
        input = Types::GetBucketAbacRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_abac(input)
      end
      def get_bucket_abac(input : Types::GetBucketAbacRequest) : Types::GetBucketAbacOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_ABAC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketAbacOutput, "GetBucketAbac")
      end

      # This operation is not supported for directory buckets. This implementation of the GET action uses
      # the accelerate subresource to return the Transfer Acceleration state of a bucket, which is either
      # Enabled or Suspended . Amazon S3 Transfer Acceleration is a bucket-level feature that enables you to
      # perform faster data transfers to and from Amazon S3. To use this operation, you must have permission
      # to perform the s3:GetAccelerateConfiguration action. The bucket owner has this permission by
      # default. The bucket owner can grant this permission to others. For more information about
      # permissions, see Permissions Related to Bucket Subresource Operations and Managing Access
      # Permissions to your Amazon S3 Resources in the Amazon S3 User Guide . You set the Transfer
      # Acceleration state of an existing bucket to Enabled or Suspended by using the
      # PutBucketAccelerateConfiguration operation. A GET accelerate request does not return a state value
      # for a bucket that has no transfer acceleration state. A bucket has no Transfer Acceleration state if
      # a state has never been set on the bucket. For more information about transfer acceleration, see
      # Transfer Acceleration in the Amazon S3 User Guide. The following operations are related to
      # GetBucketAccelerateConfiguration : PutBucketAccelerateConfiguration You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_accelerate_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil
      ) : Types::GetBucketAccelerateConfigurationOutput
        input = Types::GetBucketAccelerateConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer)
        get_bucket_accelerate_configuration(input)
      end
      def get_bucket_accelerate_configuration(input : Types::GetBucketAccelerateConfigurationRequest) : Types::GetBucketAccelerateConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_ACCELERATE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketAccelerateConfigurationOutput, "GetBucketAccelerateConfiguration")
      end

      # This operation is not supported for directory buckets. This implementation of the GET action uses
      # the acl subresource to return the access control list (ACL) of a bucket. To use GET to return the
      # ACL of the bucket, you must have the READ_ACP access to the bucket. If READ_ACP permission is
      # granted to the anonymous user, you can return the ACL of the bucket without using an authorization
      # header. When you use this API operation with an access point, provide the alias of the access point
      # in place of the bucket name. When you use this API operation with an Object Lambda access point,
      # provide the alias of the Object Lambda access point in place of the bucket name. If the Object
      # Lambda access point alias in a request is not valid, the error code InvalidAccessPointAliasError is
      # returned. For more information about InvalidAccessPointAliasError , see List of Error Codes . If
      # your bucket uses the bucket owner enforced setting for S3 Object Ownership, requests to read ACLs
      # are still supported and return the bucket-owner-full-control ACL with the owner being the account
      # that created the bucket. For more information, see Controlling object ownership and disabling ACLs
      # in the Amazon S3 User Guide . You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt . The following operations are related to GetBucketAcl : ListObjects
      def get_bucket_acl(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketAclOutput
        input = Types::GetBucketAclRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_acl(input)
      end
      def get_bucket_acl(input : Types::GetBucketAclRequest) : Types::GetBucketAclOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketAclOutput, "GetBucketAcl")
      end

      # This operation is not supported for directory buckets. This implementation of the GET action returns
      # an analytics configuration (identified by the analytics configuration ID) from the bucket. To use
      # this operation, you must have permissions to perform the s3:GetAnalyticsConfiguration action. The
      # bucket owner has this permission by default. The bucket owner can grant this permission to others.
      # For more information about permissions, see Permissions Related to Bucket Subresource Operations and
      # Managing Access Permissions to Your Amazon S3 Resources in the Amazon S3 User Guide . For
      # information about Amazon S3 analytics feature, see Amazon S3 Analytics – Storage Class Analysis in
      # the Amazon S3 User Guide . The following operations are related to GetBucketAnalyticsConfiguration :
      # DeleteBucketAnalyticsConfiguration ListBucketAnalyticsConfigurations PutBucketAnalyticsConfiguration
      # You must URL encode any signed header values that contain spaces. For example, if your header value
      # is my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt
      # .
      def get_bucket_analytics_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketAnalyticsConfigurationOutput
        input = Types::GetBucketAnalyticsConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        get_bucket_analytics_configuration(input)
      end
      def get_bucket_analytics_configuration(input : Types::GetBucketAnalyticsConfigurationRequest) : Types::GetBucketAnalyticsConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_ANALYTICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketAnalyticsConfigurationOutput, "GetBucketAnalyticsConfiguration")
      end

      # This operation is not supported for directory buckets. Returns the Cross-Origin Resource Sharing
      # (CORS) configuration information set for the bucket. To use this operation, you must have permission
      # to perform the s3:GetBucketCORS action. By default, the bucket owner has this permission and can
      # grant it to others. When you use this API operation with an access point, provide the alias of the
      # access point in place of the bucket name. When you use this API operation with an Object Lambda
      # access point, provide the alias of the Object Lambda access point in place of the bucket name. If
      # the Object Lambda access point alias in a request is not valid, the error code
      # InvalidAccessPointAliasError is returned. For more information about InvalidAccessPointAliasError ,
      # see List of Error Codes . For more information about CORS, see Enabling Cross-Origin Resource
      # Sharing . The following operations are related to GetBucketCors : PutBucketCors DeleteBucketCors You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_cors(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketCorsOutput
        input = Types::GetBucketCorsRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_cors(input)
      end
      def get_bucket_cors(input : Types::GetBucketCorsRequest) : Types::GetBucketCorsOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_CORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketCorsOutput, "GetBucketCors")
      end

      # Returns the default encryption configuration for an Amazon S3 bucket. By default, all buckets have a
      # default encryption configuration that uses server-side encryption with Amazon S3 managed keys
      # (SSE-S3). This operation also returns the BucketKeyEnabled and BlockedEncryptionTypes statuses.
      # General purpose buckets - For information about the bucket default encryption feature, see Amazon S3
      # Bucket Default Encryption in the Amazon S3 User Guide . Directory buckets - For directory buckets,
      # there are only two supported options for server-side encryption: SSE-S3 and SSE-KMS. For information
      # about the default encryption configuration in directory buckets, see Setting default server-side
      # encryption behavior for directory buckets . Permissions General purpose bucket permissions - The
      # s3:GetEncryptionConfiguration permission is required in a policy. The bucket owner has this
      # permission by default. The bucket owner can grant this permission to others. For more information
      # about permissions, see Permissions Related to Bucket Operations and Managing Access Permissions to
      # Your Amazon S3 Resources . Directory bucket permissions - To grant access to this API operation, you
      # must have the s3express:GetEncryptionConfiguration permission in an IAM identity-based policy
      # instead of a bucket policy. Cross-account access to this API operation isn't supported. This
      # operation can only be performed by the Amazon Web Services account that owns the resource. For more
      # information about directory bucket policies and permissions, see Amazon Web Services Identity and
      # Access Management (IAM) for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header
      # syntax Directory buckets - The HTTP Host header syntax is s3express-control. region-code
      # .amazonaws.com . The following operations are related to GetBucketEncryption : PutBucketEncryption
      # DeleteBucketEncryption You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def get_bucket_encryption(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketEncryptionOutput
        input = Types::GetBucketEncryptionRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_encryption(input)
      end
      def get_bucket_encryption(input : Types::GetBucketEncryptionRequest) : Types::GetBucketEncryptionOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketEncryptionOutput, "GetBucketEncryption")
      end

      # This operation is not supported for directory buckets. Gets the S3 Intelligent-Tiering configuration
      # from the specified bucket. The S3 Intelligent-Tiering storage class is designed to optimize storage
      # costs by automatically moving data to the most cost-effective storage access tier, without
      # performance impact or operational overhead. S3 Intelligent-Tiering delivers automatic cost savings
      # in three low latency and high throughput access tiers. To get the lowest storage cost on data that
      # can be accessed in minutes to hours, you can choose to activate additional archiving capabilities.
      # The S3 Intelligent-Tiering storage class is the ideal storage class for data with unknown, changing,
      # or unpredictable access patterns, independent of object size or retention period. If the size of an
      # object is less than 128 KB, it is not monitored and not eligible for auto-tiering. Smaller objects
      # can be stored, but they are always charged at the Frequent Access tier rates in the S3
      # Intelligent-Tiering storage class. For more information, see Storage class for automatically
      # optimizing frequently and infrequently accessed objects . Operations related to
      # GetBucketIntelligentTieringConfiguration include: DeleteBucketIntelligentTieringConfiguration
      # PutBucketIntelligentTieringConfiguration ListBucketIntelligentTieringConfigurations You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_intelligent_tiering_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketIntelligentTieringConfigurationOutput
        input = Types::GetBucketIntelligentTieringConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        get_bucket_intelligent_tiering_configuration(input)
      end
      def get_bucket_intelligent_tiering_configuration(input : Types::GetBucketIntelligentTieringConfigurationRequest) : Types::GetBucketIntelligentTieringConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_INTELLIGENT_TIERING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketIntelligentTieringConfigurationOutput, "GetBucketIntelligentTieringConfiguration")
      end

      # This operation is not supported for directory buckets. Returns an S3 Inventory configuration
      # (identified by the inventory configuration ID) from the bucket. To use this operation, you must have
      # permissions to perform the s3:GetInventoryConfiguration action. The bucket owner has this permission
      # by default and can grant this permission to others. For more information about permissions, see
      # Permissions Related to Bucket Subresource Operations and Managing Access Permissions to Your Amazon
      # S3 Resources . For information about the Amazon S3 inventory feature, see Amazon S3 Inventory . The
      # following operations are related to GetBucketInventoryConfiguration :
      # DeleteBucketInventoryConfiguration ListBucketInventoryConfigurations PutBucketInventoryConfiguration
      # You must URL encode any signed header values that contain spaces. For example, if your header value
      # is my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt
      # .
      def get_bucket_inventory_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketInventoryConfigurationOutput
        input = Types::GetBucketInventoryConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        get_bucket_inventory_configuration(input)
      end
      def get_bucket_inventory_configuration(input : Types::GetBucketInventoryConfigurationRequest) : Types::GetBucketInventoryConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_INVENTORY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketInventoryConfigurationOutput, "GetBucketInventoryConfiguration")
      end

      # For an updated version of this API, see GetBucketLifecycleConfiguration . If you configured a bucket
      # lifecycle using the filter element, you should see the updated version of this topic. This topic is
      # provided for backward compatibility. This operation is not supported for directory buckets. Returns
      # the lifecycle configuration information set on the bucket. For information about lifecycle
      # configuration, see Object Lifecycle Management . To use this operation, you must have permission to
      # perform the s3:GetLifecycleConfiguration action. The bucket owner has this permission by default.
      # The bucket owner can grant this permission to others. For more information about permissions, see
      # Permissions Related to Bucket Subresource Operations and Managing Access Permissions to Your Amazon
      # S3 Resources . GetBucketLifecycle has the following special error: Error code:
      # NoSuchLifecycleConfiguration Description: The lifecycle configuration does not exist. HTTP Status
      # Code: 404 Not Found SOAP Fault Code Prefix: Client The following operations are related to
      # GetBucketLifecycle : GetBucketLifecycleConfiguration PutBucketLifecycle DeleteBucketLifecycle You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_lifecycle(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketLifecycleOutput
        input = Types::GetBucketLifecycleRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_lifecycle(input)
      end
      def get_bucket_lifecycle(input : Types::GetBucketLifecycleRequest) : Types::GetBucketLifecycleOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_LIFECYCLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketLifecycleOutput, "GetBucketLifecycle")
      end

      # Returns the lifecycle configuration information set on the bucket. For information about lifecycle
      # configuration, see Object Lifecycle Management . Bucket lifecycle configuration now supports
      # specifying a lifecycle rule using an object key name prefix, one or more object tags, object size,
      # or any combination of these. Accordingly, this section describes the latest API, which is compatible
      # with the new functionality. The previous version of the API supported filtering based only on an
      # object key name prefix, which is supported for general purpose buckets for backward compatibility.
      # For the related API description, see GetBucketLifecycle . Lifecyle configurations for directory
      # buckets only support expiring objects and cancelling multipart uploads. Expiring of versioned
      # objects, transitions and tag filters are not supported. Permissions General purpose bucket
      # permissions - By default, all Amazon S3 resources are private, including buckets, objects, and
      # related subresources (for example, lifecycle configuration and website configuration). Only the
      # resource owner (that is, the Amazon Web Services account that created it) can access the resource.
      # The resource owner can optionally grant access permissions to others by writing an access policy.
      # For this operation, a user must have the s3:GetLifecycleConfiguration permission. For more
      # information about permissions, see Managing Access Permissions to Your Amazon S3 Resources .
      # Directory bucket permissions - You must have the s3express:GetLifecycleConfiguration permission in
      # an IAM identity-based policy to use this operation. Cross-account access to this API operation isn't
      # supported. The resource owner can optionally grant access permissions to others by creating a role
      # or user for them as long as they are within the same account as the owner and resource. For more
      # information about directory bucket policies and permissions, see Authorizing Regional endpoint APIs
      # with IAM in the Amazon S3 User Guide . Directory buckets - For directory buckets, you must make
      # requests for this API operation to the Regional endpoint. These endpoints support path-style
      # requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name .
      # Virtual-hosted-style requests aren't supported. For more information about endpoints in Availability
      # Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3
      # User Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets
      # in Local Zones in the Amazon S3 User Guide . HTTP Host header syntax Directory buckets - The HTTP
      # Host header syntax is s3express-control. region .amazonaws.com . GetBucketLifecycleConfiguration has
      # the following special error: Error code: NoSuchLifecycleConfiguration Description: The lifecycle
      # configuration does not exist. HTTP Status Code: 404 Not Found SOAP Fault Code Prefix: Client The
      # following operations are related to GetBucketLifecycleConfiguration : GetBucketLifecycle
      # PutBucketLifecycle DeleteBucketLifecycle You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def get_bucket_lifecycle_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketLifecycleConfigurationOutput
        input = Types::GetBucketLifecycleConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_lifecycle_configuration(input)
      end
      def get_bucket_lifecycle_configuration(input : Types::GetBucketLifecycleConfigurationRequest) : Types::GetBucketLifecycleConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_LIFECYCLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketLifecycleConfigurationOutput, "GetBucketLifecycleConfiguration")
      end

      # Using the GetBucketLocation operation is no longer a best practice. To return the Region that a
      # bucket resides in, we recommend that you use the HeadBucket operation instead. For backward
      # compatibility, Amazon S3 continues to support the GetBucketLocation operation. Returns the Region
      # the bucket resides in. You set the bucket's Region using the LocationConstraint request parameter in
      # a CreateBucket request. For more information, see CreateBucket . In a bucket's home Region, calls to
      # the GetBucketLocation operation are governed by the bucket's policy. In other Regions, the bucket
      # policy doesn't apply, which means that cross-account access won't be authorized. However, calls to
      # the HeadBucket operation always return the bucket’s location through an HTTP response header,
      # whether access to the bucket is authorized or not. Therefore, we recommend using the HeadBucket
      # operation for bucket Region discovery and to avoid using the GetBucketLocation operation. When you
      # use this API operation with an access point, provide the alias of the access point in place of the
      # bucket name. When you use this API operation with an Object Lambda access point, provide the alias
      # of the Object Lambda access point in place of the bucket name. If the Object Lambda access point
      # alias in a request is not valid, the error code InvalidAccessPointAliasError is returned. For more
      # information about InvalidAccessPointAliasError , see List of Error Codes . This operation is not
      # supported for directory buckets. The following operations are related to GetBucketLocation :
      # GetObject CreateBucket You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def get_bucket_location(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketLocationOutput
        input = Types::GetBucketLocationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_location(input)
      end
      def get_bucket_location(input : Types::GetBucketLocationRequest) : Types::GetBucketLocationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketLocationOutput, "GetBucketLocation")
      end

      # This operation is not supported for directory buckets. Returns the logging status of a bucket and
      # the permissions users have to view and modify that status. The following operations are related to
      # GetBucketLogging : CreateBucket PutBucketLogging You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def get_bucket_logging(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketLoggingOutput
        input = Types::GetBucketLoggingRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_logging(input)
      end
      def get_bucket_logging(input : Types::GetBucketLoggingRequest) : Types::GetBucketLoggingOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketLoggingOutput, "GetBucketLogging")
      end

      # Retrieves the S3 Metadata configuration for a general purpose bucket. For more information, see
      # Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide . You can use the V2
      # GetBucketMetadataConfiguration API operation with V1 or V2 metadata configurations. However, if you
      # try to use the V1 GetBucketMetadataTableConfiguration API operation with V2 configurations, you will
      # receive an HTTP 405 Method Not Allowed error. Permissions To use this operation, you must have the
      # s3:GetBucketMetadataTableConfiguration permission. For more information, see Setting up permissions
      # for configuring metadata tables in the Amazon S3 User Guide . The IAM policy action name is the same
      # for the V1 and V2 API operations. The following operations are related to
      # GetBucketMetadataConfiguration : CreateBucketMetadataConfiguration DeleteBucketMetadataConfiguration
      # UpdateBucketMetadataInventoryTableConfiguration UpdateBucketMetadataJournalTableConfiguration You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_metadata_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketMetadataConfigurationOutput
        input = Types::GetBucketMetadataConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_metadata_configuration(input)
      end
      def get_bucket_metadata_configuration(input : Types::GetBucketMetadataConfigurationRequest) : Types::GetBucketMetadataConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_METADATA_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketMetadataConfigurationOutput, "GetBucketMetadataConfiguration")
      end

      # We recommend that you retrieve your S3 Metadata configurations by using the V2
      # GetBucketMetadataTableConfiguration API operation. We no longer recommend using the V1
      # GetBucketMetadataTableConfiguration API operation. If you created your S3 Metadata configuration
      # before July 15, 2025, we recommend that you delete and re-create your configuration by using
      # CreateBucketMetadataConfiguration so that you can expire journal table records and create a live
      # inventory table. Retrieves the V1 S3 Metadata configuration for a general purpose bucket. For more
      # information, see Accelerating data discovery with S3 Metadata in the Amazon S3 User Guide . You can
      # use the V2 GetBucketMetadataConfiguration API operation with V1 or V2 metadata table configurations.
      # However, if you try to use the V1 GetBucketMetadataTableConfiguration API operation with V2
      # configurations, you will receive an HTTP 405 Method Not Allowed error. Make sure that you update
      # your processes to use the new V2 API operations ( CreateBucketMetadataConfiguration ,
      # GetBucketMetadataConfiguration , and DeleteBucketMetadataConfiguration ) instead of the V1 API
      # operations. Permissions To use this operation, you must have the
      # s3:GetBucketMetadataTableConfiguration permission. For more information, see Setting up permissions
      # for configuring metadata tables in the Amazon S3 User Guide . The following operations are related
      # to GetBucketMetadataTableConfiguration : CreateBucketMetadataTableConfiguration
      # DeleteBucketMetadataTableConfiguration You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def get_bucket_metadata_table_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketMetadataTableConfigurationOutput
        input = Types::GetBucketMetadataTableConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_metadata_table_configuration(input)
      end
      def get_bucket_metadata_table_configuration(input : Types::GetBucketMetadataTableConfigurationRequest) : Types::GetBucketMetadataTableConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_METADATA_TABLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketMetadataTableConfigurationOutput, "GetBucketMetadataTableConfiguration")
      end

      # This operation is not supported for directory buckets. Gets a metrics configuration (specified by
      # the metrics configuration ID) from the bucket. Note that this doesn't include the daily storage
      # metrics. To use this operation, you must have permissions to perform the s3:GetMetricsConfiguration
      # action. The bucket owner has this permission by default. The bucket owner can grant this permission
      # to others. For more information about permissions, see Permissions Related to Bucket Subresource
      # Operations and Managing Access Permissions to Your Amazon S3 Resources . For information about
      # CloudWatch request metrics for Amazon S3, see Monitoring Metrics with Amazon CloudWatch . The
      # following operations are related to GetBucketMetricsConfiguration : PutBucketMetricsConfiguration
      # DeleteBucketMetricsConfiguration ListBucketMetricsConfigurations Monitoring Metrics with Amazon
      # CloudWatch You must URL encode any signed header values that contain spaces. For example, if your
      # header value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def get_bucket_metrics_configuration(
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketMetricsConfigurationOutput
        input = Types::GetBucketMetricsConfigurationRequest.new(bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        get_bucket_metrics_configuration(input)
      end
      def get_bucket_metrics_configuration(input : Types::GetBucketMetricsConfigurationRequest) : Types::GetBucketMetricsConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketMetricsConfigurationOutput, "GetBucketMetricsConfiguration")
      end

      # This operation is not supported for directory buckets. No longer used, see
      # GetBucketNotificationConfiguration .
      def get_bucket_notification(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::NotificationConfigurationDeprecated
        input = Types::GetBucketNotificationConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_notification(input)
      end
      def get_bucket_notification(input : Types::GetBucketNotificationConfigurationRequest) : Types::NotificationConfigurationDeprecated
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::NotificationConfigurationDeprecated, "GetBucketNotification")
      end

      # This operation is not supported for directory buckets. Returns the notification configuration of a
      # bucket. If notifications are not enabled on the bucket, the action returns an empty
      # NotificationConfiguration element. By default, you must be the bucket owner to read the notification
      # configuration of a bucket. However, the bucket owner can use a bucket policy to grant permission to
      # other users to read this configuration with the s3:GetBucketNotification permission. When you use
      # this API operation with an access point, provide the alias of the access point in place of the
      # bucket name. When you use this API operation with an Object Lambda access point, provide the alias
      # of the Object Lambda access point in place of the bucket name. If the Object Lambda access point
      # alias in a request is not valid, the error code InvalidAccessPointAliasError is returned. For more
      # information about InvalidAccessPointAliasError , see List of Error Codes . For more information
      # about setting and reading the notification configuration on a bucket, see Setting Up Notification of
      # Bucket Events . For more information about bucket policies, see Using Bucket Policies . The
      # following action is related to GetBucketNotification : PutBucketNotification You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_notification_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::NotificationConfiguration
        input = Types::GetBucketNotificationConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_notification_configuration(input)
      end
      def get_bucket_notification_configuration(input : Types::GetBucketNotificationConfigurationRequest) : Types::NotificationConfiguration
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_NOTIFICATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::NotificationConfiguration, "GetBucketNotificationConfiguration")
      end

      # This operation is not supported for directory buckets. Retrieves OwnershipControls for an Amazon S3
      # bucket. To use this operation, you must have the s3:GetBucketOwnershipControls permission. For more
      # information about Amazon S3 permissions, see Specifying permissions in a policy . A bucket doesn't
      # have OwnershipControls settings in the following cases: The bucket was created before the
      # BucketOwnerEnforced ownership setting was introduced and you've never explicitly applied this value
      # You've manually deleted the bucket ownership control value using the DeleteBucketOwnershipControls
      # API operation. By default, Amazon S3 sets OwnershipControls for all newly created buckets. For
      # information about Amazon S3 Object Ownership, see Using Object Ownership . The following operations
      # are related to GetBucketOwnershipControls : PutBucketOwnershipControls DeleteBucketOwnershipControls
      # You must URL encode any signed header values that contain spaces. For example, if your header value
      # is my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt
      # .
      def get_bucket_ownership_controls(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketOwnershipControlsOutput
        input = Types::GetBucketOwnershipControlsRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_ownership_controls(input)
      end
      def get_bucket_ownership_controls(input : Types::GetBucketOwnershipControlsRequest) : Types::GetBucketOwnershipControlsOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_OWNERSHIP_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketOwnershipControlsOutput, "GetBucketOwnershipControls")
      end

      # Returns the policy of a specified bucket. Directory buckets - For directory buckets, you must make
      # requests for this API operation to the Regional endpoint. These endpoints support path-style
      # requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name .
      # Virtual-hosted-style requests aren't supported. For more information about endpoints in Availability
      # Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3
      # User Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets
      # in Local Zones in the Amazon S3 User Guide . Permissions If you are using an identity other than the
      # root user of the Amazon Web Services account that owns the bucket, the calling identity must both
      # have the GetBucketPolicy permissions on the specified bucket and belong to the bucket owner's
      # account in order to use this operation. If you don't have GetBucketPolicy permissions, Amazon S3
      # returns a 403 Access Denied error. If you have the correct permissions, but you're not using an
      # identity that belongs to the bucket owner's account, Amazon S3 returns a 405 Method Not Allowed
      # error. To ensure that bucket owners don't inadvertently lock themselves out of their own buckets,
      # the root principal in a bucket owner's Amazon Web Services account can perform the GetBucketPolicy ,
      # PutBucketPolicy , and DeleteBucketPolicy API actions, even if their bucket policy explicitly denies
      # the root principal's access. Bucket owner root principals can only be blocked from performing these
      # API actions by VPC endpoint policies and Amazon Web Services Organizations policies. General purpose
      # bucket permissions - The s3:GetBucketPolicy permission is required in a policy. For more information
      # about general purpose buckets bucket policies, see Using Bucket Policies and User Policies in the
      # Amazon S3 User Guide . Directory bucket permissions - To grant access to this API operation, you
      # must have the s3express:GetBucketPolicy permission in an IAM identity-based policy instead of a
      # bucket policy. Cross-account access to this API operation isn't supported. This operation can only
      # be performed by the Amazon Web Services account that owns the resource. For more information about
      # directory bucket policies and permissions, see Amazon Web Services Identity and Access Management
      # (IAM) for S3 Express One Zone in the Amazon S3 User Guide . Example bucket policies General purpose
      # buckets example bucket policies - See Bucket policy examples in the Amazon S3 User Guide . Directory
      # bucket example bucket policies - See Example bucket policies for S3 Express One Zone in the Amazon
      # S3 User Guide . HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # s3express-control. region-code .amazonaws.com . The following action is related to GetBucketPolicy :
      # GetObject You must URL encode any signed header values that contain spaces. For example, if your
      # header value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def get_bucket_policy(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketPolicyOutput
        input = Types::GetBucketPolicyRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_policy(input)
      end
      def get_bucket_policy(input : Types::GetBucketPolicyRequest) : Types::GetBucketPolicyOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketPolicyOutput, "GetBucketPolicy")
      end

      # This operation is not supported for directory buckets. Retrieves the policy status for an Amazon S3
      # bucket, indicating whether the bucket is public. In order to use this operation, you must have the
      # s3:GetBucketPolicyStatus permission. For more information about Amazon S3 permissions, see
      # Specifying Permissions in a Policy . For more information about when Amazon S3 considers a bucket
      # public, see The Meaning of "Public" . The following operations are related to GetBucketPolicyStatus
      # : Using Amazon S3 Block Public Access GetPublicAccessBlock PutPublicAccessBlock
      # DeletePublicAccessBlock You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def get_bucket_policy_status(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketPolicyStatusOutput
        input = Types::GetBucketPolicyStatusRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_policy_status(input)
      end
      def get_bucket_policy_status(input : Types::GetBucketPolicyStatusRequest) : Types::GetBucketPolicyStatusOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_POLICY_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketPolicyStatusOutput, "GetBucketPolicyStatus")
      end

      # This operation is not supported for directory buckets. Returns the replication configuration of a
      # bucket. It can take a while to propagate the put or delete a replication configuration to all Amazon
      # S3 systems. Therefore, a get request soon after put or delete can return a wrong result. For
      # information about replication configuration, see Replication in the Amazon S3 User Guide . This
      # action requires permissions for the s3:GetReplicationConfiguration action. For more information
      # about permissions, see Using Bucket Policies and User Policies . If you include the Filter element
      # in a replication configuration, you must also include the DeleteMarkerReplication and Priority
      # elements. The response also returns those elements. For information about GetBucketReplication
      # errors, see List of replication-related error codes The following operations are related to
      # GetBucketReplication : PutBucketReplication DeleteBucketReplication You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_replication(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketReplicationOutput
        input = Types::GetBucketReplicationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_replication(input)
      end
      def get_bucket_replication(input : Types::GetBucketReplicationRequest) : Types::GetBucketReplicationOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketReplicationOutput, "GetBucketReplication")
      end

      # This operation is not supported for directory buckets. Returns the request payment configuration of
      # a bucket. To use this version of the operation, you must be the bucket owner. For more information,
      # see Requester Pays Buckets . The following operations are related to GetBucketRequestPayment :
      # ListObjects You must URL encode any signed header values that contain spaces. For example, if your
      # header value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def get_bucket_request_payment(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketRequestPaymentOutput
        input = Types::GetBucketRequestPaymentRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_request_payment(input)
      end
      def get_bucket_request_payment(input : Types::GetBucketRequestPaymentRequest) : Types::GetBucketRequestPaymentOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_REQUEST_PAYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketRequestPaymentOutput, "GetBucketRequestPayment")
      end

      # This operation is not supported for directory buckets. Returns the tag set associated with the
      # general purpose bucket. if ABAC is not enabled for the bucket. When you enable ABAC for a general
      # purpose bucket , you can no longer use this operation for that bucket and must use
      # ListTagsForResource instead. To use this operation, you must have permission to perform the
      # s3:GetBucketTagging action. By default, the bucket owner has this permission and can grant this
      # permission to others. GetBucketTagging has the following special error: Error code: NoSuchTagSet
      # Description: There is no tag set associated with the bucket. The following operations are related to
      # GetBucketTagging : PutBucketTagging DeleteBucketTagging You must URL encode any signed header values
      # that contain spaces. For example, if your header value is my file.txt , containing two spaces after
      # my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_tagging(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketTaggingOutput
        input = Types::GetBucketTaggingRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_tagging(input)
      end
      def get_bucket_tagging(input : Types::GetBucketTaggingRequest) : Types::GetBucketTaggingOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketTaggingOutput, "GetBucketTagging")
      end

      # This operation is not supported for directory buckets. Returns the versioning state of a bucket. To
      # retrieve the versioning state of a bucket, you must be the bucket owner. This implementation also
      # returns the MFA Delete status of the versioning state. If the MFA Delete status is enabled , the
      # bucket owner must use an authentication device to change the versioning state of the bucket. The
      # following operations are related to GetBucketVersioning : GetObject PutObject DeleteObject You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_versioning(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketVersioningOutput
        input = Types::GetBucketVersioningRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_versioning(input)
      end
      def get_bucket_versioning(input : Types::GetBucketVersioningRequest) : Types::GetBucketVersioningOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_VERSIONING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketVersioningOutput, "GetBucketVersioning")
      end

      # This operation is not supported for directory buckets. Returns the website configuration for a
      # bucket. To host website on Amazon S3, you can configure a bucket as website by adding a website
      # configuration. For more information about hosting websites, see Hosting Websites on Amazon S3 . This
      # GET action requires the S3:GetBucketWebsite permission. By default, only the bucket owner can read
      # the bucket website configuration. However, bucket owners can allow other users to read the website
      # configuration by writing a bucket policy granting them the S3:GetBucketWebsite permission. The
      # following operations are related to GetBucketWebsite : DeleteBucketWebsite PutBucketWebsite You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_bucket_website(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetBucketWebsiteOutput
        input = Types::GetBucketWebsiteRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_bucket_website(input)
      end
      def get_bucket_website(input : Types::GetBucketWebsiteRequest) : Types::GetBucketWebsiteOutput
        request = Protocol::RestXml.build_request(Model::GET_BUCKET_WEBSITE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetBucketWebsiteOutput, "GetBucketWebsite")
      end

      # Retrieves an object from Amazon S3. In the GetObject request, specify the full key name for the
      # object. General purpose buckets - Both the virtual-hosted-style requests and the path-style requests
      # are supported. For a virtual hosted-style request example, if you have the object
      # photos/2006/February/sample.jpg , specify the object key name as /photos/2006/February/sample.jpg .
      # For a path-style request example, if you have the object photos/2006/February/sample.jpg in the
      # bucket named examplebucket , specify the object key name as
      # /examplebucket/photos/2006/February/sample.jpg . For more information about request types, see HTTP
      # Host Header Bucket Specification in the Amazon S3 User Guide . Directory buckets - Only
      # virtual-hosted-style requests are supported. For a virtual hosted-style request example, if you have
      # the object photos/2006/February/sample.jpg in the bucket named amzn-s3-demo-bucket--usw2-az1--x-s3 ,
      # specify the object key name as /photos/2006/February/sample.jpg . Also, when you make requests to
      # this API operation, your requests are sent to the Zonal endpoint. These endpoints support
      # virtual-hosted-style requests in the format https:// bucket-name .s3express- zone-id . region-code
      # .amazonaws.com/ key-name . Path-style requests are not supported. For more information about
      # endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . Permissions
      # General purpose bucket permissions - You must have the required permissions in a policy. To use
      # GetObject , you must have the READ access to the object (or version). If you grant READ access to
      # the anonymous user, the GetObject operation returns the object without using an authorization
      # header. For more information, see Specifying permissions in a policy in the Amazon S3 User Guide .
      # If you include a versionId in your request header, you must have the s3:GetObjectVersion permission
      # to access a specific version of an object. The s3:GetObject permission is not required in this
      # scenario. If you request the current version of an object without a specific versionId in the
      # request header, only the s3:GetObject permission is required. The s3:GetObjectVersion permission is
      # not required in this scenario. If the object that you request doesn’t exist, the error that Amazon
      # S3 returns depends on whether you also have the s3:ListBucket permission. If you have the
      # s3:ListBucket permission on the bucket, Amazon S3 returns an HTTP status code 404 Not Found error.
      # If you don’t have the s3:ListBucket permission, Amazon S3 returns an HTTP status code 403 Access
      # Denied error. Directory bucket permissions - To grant access to this API operation on a directory
      # bucket, we recommend that you use the CreateSession API operation for session-based authorization.
      # Specifically, you grant the s3express:CreateSession permission to the directory bucket in a bucket
      # policy or an IAM identity-based policy. Then, you make the CreateSession API call on the bucket to
      # obtain a session token. With the session token in your request header, you can make API requests to
      # this operation. After the session token expires, you make another CreateSession API call to generate
      # a new session token for use. Amazon Web Services CLI or SDKs create session and refresh the session
      # token automatically to avoid service interruptions when a session expires. For more information
      # about authorization, see CreateSession . If the object is encrypted using SSE-KMS, you must also
      # have the kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based policies and KMS key
      # policies for the KMS key. Storage classes If the object you are retrieving is stored in the S3
      # Glacier Flexible Retrieval storage class, the S3 Glacier Deep Archive storage class, the S3
      # Intelligent-Tiering Archive Access tier, or the S3 Intelligent-Tiering Deep Archive Access tier,
      # before you can retrieve the object you must first restore a copy using RestoreObject . Otherwise,
      # this operation returns an InvalidObjectState error. For information about restoring archived
      # objects, see Restoring Archived Objects in the Amazon S3 User Guide . Directory buckets - Directory
      # buckets only support EXPRESS_ONEZONE (the S3 Express One Zone storage class) in Availability Zones
      # and ONEZONE_IA (the S3 One Zone-Infrequent Access storage class) in Dedicated Local Zones.
      # Unsupported storage class values won't write a destination object and will respond with the HTTP
      # status code 400 Bad Request . Encryption Encryption request headers, like
      # x-amz-server-side-encryption , should not be sent for the GetObject requests, if your object uses
      # server-side encryption with Amazon S3 managed encryption keys (SSE-S3), server-side encryption with
      # Key Management Service (KMS) keys (SSE-KMS), or dual-layer server-side encryption with Amazon Web
      # Services KMS keys (DSSE-KMS). If you include the header in your GetObject requests for the object
      # that uses these types of keys, you’ll get an HTTP 400 Bad Request error. Directory buckets - For
      # directory buckets, there are only two supported options for server-side encryption: SSE-S3 and
      # SSE-KMS. SSE-C isn't supported. For more information, see Protecting data with server-side
      # encryption in the Amazon S3 User Guide . Overriding response header values through the request There
      # are times when you want to override certain response header values of a GetObject response. For
      # example, you might override the Content-Disposition response header value through your GetObject
      # request. You can override values for a set of response headers. These modified response header
      # values are included only in a successful response, that is, when the HTTP status code 200 OK is
      # returned. The headers you can override using the following query parameters in the request are a
      # subset of the headers that Amazon S3 accepts when you create an object. The response headers that
      # you can override for the GetObject response are Cache-Control , Content-Disposition ,
      # Content-Encoding , Content-Language , Content-Type , and Expires . To override values for a set of
      # response headers in the GetObject response, you can use the following query parameters in the
      # request. response-cache-control response-content-disposition response-content-encoding
      # response-content-language response-content-type response-expires When you use these parameters, you
      # must sign the request by using either an Authorization header or a presigned URL. These parameters
      # cannot be used with an unsigned (anonymous) request. HTTP Host header syntax Directory buckets - The
      # HTTP Host header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The
      # following operations are related to GetObject : ListBuckets GetObjectAcl You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_object(
        bucket : String,
        key : String,
        checksum_mode : String? = nil,
        expected_bucket_owner : String? = nil,
        if_match : String? = nil,
        if_modified_since : Time? = nil,
        if_none_match : String? = nil,
        if_unmodified_since : Time? = nil,
        part_number : Int32? = nil,
        range : String? = nil,
        request_payer : String? = nil,
        response_cache_control : String? = nil,
        response_content_disposition : String? = nil,
        response_content_encoding : String? = nil,
        response_content_language : String? = nil,
        response_content_type : String? = nil,
        response_expires : Time? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectOutput
        input = Types::GetObjectRequest.new(bucket: bucket, key: key, checksum_mode: checksum_mode, expected_bucket_owner: expected_bucket_owner, if_match: if_match, if_modified_since: if_modified_since, if_none_match: if_none_match, if_unmodified_since: if_unmodified_since, part_number: part_number, range: range, request_payer: request_payer, response_cache_control: response_cache_control, response_content_disposition: response_content_disposition, response_content_encoding: response_content_encoding, response_content_language: response_content_language, response_content_type: response_content_type, response_expires: response_expires, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, version_id: version_id)
        get_object(input)
      end
      def get_object(input : Types::GetObjectRequest) : Types::GetObjectOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectOutput, "GetObject")
      end

      # This operation is not supported for directory buckets. Returns the access control list (ACL) of an
      # object. To use this operation, you must have s3:GetObjectAcl permissions or READ_ACP access to the
      # object. For more information, see Mapping of ACL permissions and access policy permissions in the
      # Amazon S3 User Guide This functionality is not supported for Amazon S3 on Outposts. By default, GET
      # returns ACL information about the current version of an object. To return ACL information about a
      # different version, use the versionId subresource. If your bucket uses the bucket owner enforced
      # setting for S3 Object Ownership, requests to read ACLs are still supported and return the
      # bucket-owner-full-control ACL with the owner being the account that created the bucket. For more
      # information, see Controlling object ownership and disabling ACLs in the Amazon S3 User Guide . The
      # following operations are related to GetObjectAcl : GetObject GetObjectAttributes DeleteObject
      # PutObject You must URL encode any signed header values that contain spaces. For example, if your
      # header value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def get_object_acl(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectAclOutput
        input = Types::GetObjectAclRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, version_id: version_id)
        get_object_acl(input)
      end
      def get_object_acl(input : Types::GetObjectAclRequest) : Types::GetObjectAclOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectAclOutput, "GetObjectAcl")
      end

      # Retrieves all of the metadata from an object without returning the object itself. This operation is
      # useful if you're interested only in an object's metadata. GetObjectAttributes combines the
      # functionality of HeadObject and ListParts . All of the data returned with both of those individual
      # calls can be returned with a single call to GetObjectAttributes . Directory buckets - For directory
      # buckets, you must make requests for this API operation to the Zonal endpoint. These endpoints
      # support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket .s3express- zone-id
      # . region-code .amazonaws.com/ key-name . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . Permissions
      # General purpose bucket permissions - To use GetObjectAttributes , you must have READ access to the
      # object. The other permissions that you need to use this operation depend on whether the bucket is
      # versioned and if a version ID is passed in the GetObjectAttributes request. If you pass a version ID
      # in your request, you need both the s3:GetObjectVersion and s3:GetObjectVersionAttributes
      # permissions. If you do not pass a version ID in your request, you need the s3:GetObject and
      # s3:GetObjectAttributes permissions. For more information, see Specifying Permissions in a Policy in
      # the Amazon S3 User Guide . If the object that you request does not exist, the error Amazon S3
      # returns depends on whether you also have the s3:ListBucket permission. If you have the s3:ListBucket
      # permission on the bucket, Amazon S3 returns an HTTP status code 404 Not Found ("no such key") error.
      # If you don't have the s3:ListBucket permission, Amazon S3 returns an HTTP status code 403 Forbidden
      # ("access denied") error. Directory bucket permissions - To grant access to this API operation on a
      # directory bucket, we recommend that you use the CreateSession API operation for session-based
      # authorization. Specifically, you grant the s3express:CreateSession permission to the directory
      # bucket in a bucket policy or an IAM identity-based policy. Then, you make the CreateSession API call
      # on the bucket to obtain a session token. With the session token in your request header, you can make
      # API requests to this operation. After the session token expires, you make another CreateSession API
      # call to generate a new session token for use. Amazon Web Services CLI or SDKs create session and
      # refresh the session token automatically to avoid service interruptions when a session expires. For
      # more information about authorization, see CreateSession . If the object is encrypted with SSE-KMS,
      # you must also have the kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based
      # policies and KMS key policies for the KMS key. Encryption Encryption request headers, like
      # x-amz-server-side-encryption , should not be sent for HEAD requests if your object uses server-side
      # encryption with Key Management Service (KMS) keys (SSE-KMS), dual-layer server-side encryption with
      # Amazon Web Services KMS keys (DSSE-KMS), or server-side encryption with Amazon S3 managed encryption
      # keys (SSE-S3). The x-amz-server-side-encryption header is used when you PUT an object to S3 and want
      # to specify the encryption method. If you include this header in a GET request for an object that
      # uses these types of keys, you’ll get an HTTP 400 Bad Request error. It's because the encryption
      # method can't be changed when you retrieve the object. If you encrypted an object when you stored the
      # object in Amazon S3 by using server-side encryption with customer-provided encryption keys (SSE-C),
      # then when you retrieve the metadata from the object, you must use the following headers. These
      # headers provide the server with the encryption key required to retrieve the object's metadata. The
      # headers are: x-amz-server-side-encryption-customer-algorithm
      # x-amz-server-side-encryption-customer-key x-amz-server-side-encryption-customer-key-MD5 For more
      # information about SSE-C, see Server-Side Encryption (Using Customer-Provided Encryption Keys) in the
      # Amazon S3 User Guide . Directory bucket permissions - For directory buckets, there are only two
      # supported options for server-side encryption: server-side encryption with Amazon S3 managed keys
      # (SSE-S3) ( AES256 ) and server-side encryption with KMS keys (SSE-KMS) ( aws:kms ). We recommend
      # that the bucket's default encryption uses the desired encryption configuration and you don't
      # override the bucket default encryption in your CreateSession requests or PUT object requests. Then,
      # new objects are automatically encrypted with the desired encryption settings. For more information,
      # see Protecting data with server-side encryption in the Amazon S3 User Guide . For more information
      # about the encryption overriding behaviors in directory buckets, see Specifying server-side
      # encryption with KMS for new object uploads . Versioning Directory buckets - S3 Versioning isn't
      # enabled and supported for directory buckets. For this API operation, only the null value of the
      # version ID is supported by directory buckets. You can only specify null to the versionId query
      # parameter in the request. Conditional request headers Consider the following when using request
      # headers: If both of the If-Match and If-Unmodified-Since headers are present in the request as
      # follows, then Amazon S3 returns the HTTP status code 200 OK and the data requested: If-Match
      # condition evaluates to true . If-Unmodified-Since condition evaluates to false . For more
      # information about conditional requests, see RFC 7232 . If both of the If-None-Match and
      # If-Modified-Since headers are present in the request as follows, then Amazon S3 returns the HTTP
      # status code 304 Not Modified : If-None-Match condition evaluates to false . If-Modified-Since
      # condition evaluates to true . For more information about conditional requests, see RFC 7232 . HTTP
      # Host header syntax Directory buckets - The HTTP Host header syntax is Bucket-name .s3express-
      # zone-id . region-code .amazonaws.com . The following actions are related to GetObjectAttributes :
      # GetObject GetObjectAcl GetObjectLegalHold GetObjectLockConfiguration GetObjectRetention
      # GetObjectTagging HeadObject ListParts You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def get_object_attributes(
        bucket : String,
        key : String,
        object_attributes : Array(String),
        expected_bucket_owner : String? = nil,
        max_parts : Int32? = nil,
        part_number_marker : Int32? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectAttributesOutput
        input = Types::GetObjectAttributesRequest.new(bucket: bucket, key: key, object_attributes: object_attributes, expected_bucket_owner: expected_bucket_owner, max_parts: max_parts, part_number_marker: part_number_marker, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, version_id: version_id)
        get_object_attributes(input)
      end
      def get_object_attributes(input : Types::GetObjectAttributesRequest) : Types::GetObjectAttributesOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectAttributesOutput, "GetObjectAttributes")
      end

      # This operation is not supported for directory buckets. Gets an object's current legal hold status.
      # For more information, see Locking Objects . This functionality is not supported for Amazon S3 on
      # Outposts. The following action is related to GetObjectLegalHold : GetObjectAttributes You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_object_legal_hold(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectLegalHoldOutput
        input = Types::GetObjectLegalHoldRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, version_id: version_id)
        get_object_legal_hold(input)
      end
      def get_object_legal_hold(input : Types::GetObjectLegalHoldRequest) : Types::GetObjectLegalHoldOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_LEGAL_HOLD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectLegalHoldOutput, "GetObjectLegalHold")
      end

      # This operation is not supported for directory buckets. Gets the Object Lock configuration for a
      # bucket. The rule specified in the Object Lock configuration will be applied by default to every new
      # object placed in the specified bucket. For more information, see Locking Objects . The following
      # action is related to GetObjectLockConfiguration : GetObjectAttributes You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_object_lock_configuration(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetObjectLockConfigurationOutput
        input = Types::GetObjectLockConfigurationRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_object_lock_configuration(input)
      end
      def get_object_lock_configuration(input : Types::GetObjectLockConfigurationRequest) : Types::GetObjectLockConfigurationOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_LOCK_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectLockConfigurationOutput, "GetObjectLockConfiguration")
      end

      # This operation is not supported for directory buckets. Retrieves an object's retention settings. For
      # more information, see Locking Objects . This functionality is not supported for Amazon S3 on
      # Outposts. The following action is related to GetObjectRetention : GetObjectAttributes You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_object_retention(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectRetentionOutput
        input = Types::GetObjectRetentionRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, version_id: version_id)
        get_object_retention(input)
      end
      def get_object_retention(input : Types::GetObjectRetentionRequest) : Types::GetObjectRetentionOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_RETENTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectRetentionOutput, "GetObjectRetention")
      end

      # This operation is not supported for directory buckets. Returns the tag-set of an object. You send
      # the GET request against the tagging subresource associated with the object. To use this operation,
      # you must have permission to perform the s3:GetObjectTagging action. By default, the GET action
      # returns information about current version of an object. For a versioned bucket, you can have
      # multiple versions of an object in your bucket. To retrieve tags of any other version, use the
      # versionId query parameter. You also need permission for the s3:GetObjectVersionTagging action. By
      # default, the bucket owner has this permission and can grant this permission to others. For
      # information about the Amazon S3 object tagging feature, see Object Tagging . The following actions
      # are related to GetObjectTagging : DeleteObjectTagging GetObjectAttributes PutObjectTagging You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def get_object_tagging(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::GetObjectTaggingOutput
        input = Types::GetObjectTaggingRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, version_id: version_id)
        get_object_tagging(input)
      end
      def get_object_tagging(input : Types::GetObjectTaggingRequest) : Types::GetObjectTaggingOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectTaggingOutput, "GetObjectTagging")
      end

      # This operation is not supported for directory buckets. Returns torrent files from a bucket.
      # BitTorrent can save you bandwidth when you're distributing large files. You can get torrent only for
      # objects that are less than 5 GB in size, and that are not encrypted using server-side encryption
      # with a customer-provided encryption key. To use GET, you must have READ access to the object. This
      # functionality is not supported for Amazon S3 on Outposts. The following action is related to
      # GetObjectTorrent : GetObject You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def get_object_torrent(
        bucket : String,
        key : String,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil
      ) : Types::GetObjectTorrentOutput
        input = Types::GetObjectTorrentRequest.new(bucket: bucket, key: key, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer)
        get_object_torrent(input)
      end
      def get_object_torrent(input : Types::GetObjectTorrentRequest) : Types::GetObjectTorrentOutput
        request = Protocol::RestXml.build_request(Model::GET_OBJECT_TORRENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetObjectTorrentOutput, "GetObjectTorrent")
      end

      # This operation is not supported for directory buckets. Retrieves the PublicAccessBlock configuration
      # for an Amazon S3 bucket. This operation returns the bucket-level configuration only. To understand
      # the effective public access behavior, you must also consider account-level settings (which may
      # inherit from organization-level policies). To use this operation, you must have the
      # s3:GetBucketPublicAccessBlock permission. For more information about Amazon S3 permissions, see
      # Specifying Permissions in a Policy . When Amazon S3 evaluates the PublicAccessBlock configuration
      # for a bucket or an object, it checks the PublicAccessBlock configuration for both the bucket (or the
      # bucket that contains the object) and the bucket owner's account. Account-level settings
      # automatically inherit from organization-level policies when present. If the PublicAccessBlock
      # settings are different between the bucket and the account, Amazon S3 uses the most restrictive
      # combination of the bucket-level and account-level settings. For more information about when Amazon
      # S3 considers a bucket or an object public, see The Meaning of "Public" . The following operations
      # are related to GetPublicAccessBlock : Using Amazon S3 Block Public Access PutPublicAccessBlock
      # GetPublicAccessBlock DeletePublicAccessBlock You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def get_public_access_block(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::GetPublicAccessBlockOutput
        input = Types::GetPublicAccessBlockRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        get_public_access_block(input)
      end
      def get_public_access_block(input : Types::GetPublicAccessBlockRequest) : Types::GetPublicAccessBlockOutput
        request = Protocol::RestXml.build_request(Model::GET_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetPublicAccessBlockOutput, "GetPublicAccessBlock")
      end

      # You can use this operation to determine if a bucket exists and if you have permission to access it.
      # The action returns a 200 OK HTTP status code if the bucket exists and you have permission to access
      # it. You can make a HeadBucket call on any bucket name to any Region in the partition, and regardless
      # of the permissions on the bucket, you will receive a response header with the correct bucket
      # location so that you can then make a proper, signed request to the appropriate Regional endpoint. If
      # the bucket doesn't exist or you don't have permission to access it, the HEAD request returns a
      # generic 400 Bad Request , 403 Forbidden , or 404 Not Found HTTP status code. A message body isn't
      # included, so you can't determine the exception beyond these HTTP response codes. Authentication and
      # authorization General purpose buckets - Request to public buckets that grant the s3:ListBucket
      # permission publicly do not need to be signed. All other HeadBucket requests must be authenticated
      # and signed by using IAM credentials (access key ID and secret access key for the IAM identities).
      # All headers with the x-amz- prefix, including x-amz-copy-source , must be signed. For more
      # information, see REST Authentication . Directory buckets - You must use IAM credentials to
      # authenticate and authorize your access to the HeadBucket API operation, instead of using the
      # temporary security credentials through the CreateSession API operation. Amazon Web Services CLI or
      # SDKs handles authentication and authorization on your behalf. Permissions General purpose bucket
      # permissions - To use this operation, you must have permissions to perform the s3:ListBucket action.
      # The bucket owner has this permission by default and can grant this permission to others. For more
      # information about permissions, see Managing access permissions to your Amazon S3 resources in the
      # Amazon S3 User Guide . Directory bucket permissions - You must have the s3express:CreateSession
      # permission in the Action element of a policy. By default, the session is in the ReadWrite mode. If
      # you want to restrict the access, you can explicitly set the s3express:SessionMode condition key to
      # ReadOnly on the bucket. For more information about example bucket policies, see Example bucket
      # policies for S3 Express One Zone and Amazon Web Services Identity and Access Management (IAM)
      # identity-based policies for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header
      # syntax Directory buckets - The HTTP Host header syntax is Bucket-name .s3express- zone-id .
      # region-code .amazonaws.com . You must make requests for this API operation to the Zonal endpoint.
      # These endpoints support virtual-hosted-style requests in the format https:// bucket-name .s3express-
      # zone-id . region-code .amazonaws.com . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def head_bucket(
        bucket : String,
        expected_bucket_owner : String? = nil
      ) : Types::HeadBucketOutput
        input = Types::HeadBucketRequest.new(bucket: bucket, expected_bucket_owner: expected_bucket_owner)
        head_bucket(input)
      end
      def head_bucket(input : Types::HeadBucketRequest) : Types::HeadBucketOutput
        request = Protocol::RestXml.build_request(Model::HEAD_BUCKET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::HeadBucketOutput, "HeadBucket")
      end

      # The HEAD operation retrieves metadata from an object without returning the object itself. This
      # operation is useful if you're interested only in an object's metadata. A HEAD request has the same
      # options as a GET operation on an object. The response is identical to the GET response except that
      # there is no response body. Because of this, if the HEAD request generates an error, it returns a
      # generic code, such as 400 Bad Request , 403 Forbidden , 404 Not Found , 405 Method Not Allowed , 412
      # Precondition Failed , or 304 Not Modified . It's not possible to retrieve the exact exception of
      # these error codes. Request headers are limited to 8 KB in size. For more information, see Common
      # Request Headers . Permissions General purpose bucket permissions - To use HEAD , you must have the
      # s3:GetObject permission. You need the relevant read object (or version) permission for this
      # operation. For more information, see Actions, resources, and condition keys for Amazon S3 in the
      # Amazon S3 User Guide . For more information about the permissions to S3 API operations by S3
      # resource types, see Required permissions for Amazon S3 API operations in the Amazon S3 User Guide .
      # If the object you request doesn't exist, the error that Amazon S3 returns depends on whether you
      # also have the s3:ListBucket permission. If you have the s3:ListBucket permission on the bucket,
      # Amazon S3 returns an HTTP status code 404 Not Found error. If you don’t have the s3:ListBucket
      # permission, Amazon S3 returns an HTTP status code 403 Forbidden error. Directory bucket permissions
      # - To grant access to this API operation on a directory bucket, we recommend that you use the
      # CreateSession API operation for session-based authorization. Specifically, you grant the
      # s3express:CreateSession permission to the directory bucket in a bucket policy or an IAM
      # identity-based policy. Then, you make the CreateSession API call on the bucket to obtain a session
      # token. With the session token in your request header, you can make API requests to this operation.
      # After the session token expires, you make another CreateSession API call to generate a new session
      # token for use. Amazon Web Services CLI or SDKs create session and refresh the session token
      # automatically to avoid service interruptions when a session expires. For more information about
      # authorization, see CreateSession . If you enable x-amz-checksum-mode in the request and the object
      # is encrypted with Amazon Web Services Key Management Service (Amazon Web Services KMS), you must
      # also have the kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based policies and KMS
      # key policies for the KMS key to retrieve the checksum of the object. Encryption Encryption request
      # headers, like x-amz-server-side-encryption , should not be sent for HEAD requests if your object
      # uses server-side encryption with Key Management Service (KMS) keys (SSE-KMS), dual-layer server-side
      # encryption with Amazon Web Services KMS keys (DSSE-KMS), or server-side encryption with Amazon S3
      # managed encryption keys (SSE-S3). The x-amz-server-side-encryption header is used when you PUT an
      # object to S3 and want to specify the encryption method. If you include this header in a HEAD request
      # for an object that uses these types of keys, you’ll get an HTTP 400 Bad Request error. It's because
      # the encryption method can't be changed when you retrieve the object. If you encrypt an object by
      # using server-side encryption with customer-provided encryption keys (SSE-C) when you store the
      # object in Amazon S3, then when you retrieve the metadata from the object, you must use the following
      # headers to provide the encryption key for the server to be able to retrieve the object's metadata.
      # The headers are: x-amz-server-side-encryption-customer-algorithm
      # x-amz-server-side-encryption-customer-key x-amz-server-side-encryption-customer-key-MD5 For more
      # information about SSE-C, see Server-Side Encryption (Using Customer-Provided Encryption Keys) in the
      # Amazon S3 User Guide . Directory bucket - For directory buckets, there are only two supported
      # options for server-side encryption: SSE-S3 and SSE-KMS. SSE-C isn't supported. For more information,
      # see Protecting data with server-side encryption in the Amazon S3 User Guide . Versioning If the
      # current version of the object is a delete marker, Amazon S3 behaves as if the object was deleted and
      # includes x-amz-delete-marker: true in the response. If the specified version is a delete marker, the
      # response returns a 405 Method Not Allowed error and the Last-Modified: timestamp response header.
      # Directory buckets - Delete marker is not supported for directory buckets. Directory buckets - S3
      # Versioning isn't enabled and supported for directory buckets. For this API operation, only the null
      # value of the version ID is supported by directory buckets. You can only specify null to the
      # versionId query parameter in the request. HTTP Host header syntax Directory buckets - The HTTP Host
      # header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . For directory
      # buckets, you must make requests for this API operation to the Zonal endpoint. These endpoints
      # support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket .s3express- zone-id
      # . region-code .amazonaws.com/ key-name . Path-style requests are not supported. For more information
      # about endpoints in Availability Zones, see Regional and Zonal endpoints for directory buckets in
      # Availability Zones in the Amazon S3 User Guide . For more information about endpoints in Local
      # Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User Guide . The following
      # actions are related to HeadObject : GetObject GetObjectAttributes You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def head_object(
        bucket : String,
        key : String,
        checksum_mode : String? = nil,
        expected_bucket_owner : String? = nil,
        if_match : String? = nil,
        if_modified_since : Time? = nil,
        if_none_match : String? = nil,
        if_unmodified_since : Time? = nil,
        part_number : Int32? = nil,
        range : String? = nil,
        request_payer : String? = nil,
        response_cache_control : String? = nil,
        response_content_disposition : String? = nil,
        response_content_encoding : String? = nil,
        response_content_language : String? = nil,
        response_content_type : String? = nil,
        response_expires : Time? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        version_id : String? = nil
      ) : Types::HeadObjectOutput
        input = Types::HeadObjectRequest.new(bucket: bucket, key: key, checksum_mode: checksum_mode, expected_bucket_owner: expected_bucket_owner, if_match: if_match, if_modified_since: if_modified_since, if_none_match: if_none_match, if_unmodified_since: if_unmodified_since, part_number: part_number, range: range, request_payer: request_payer, response_cache_control: response_cache_control, response_content_disposition: response_content_disposition, response_content_encoding: response_content_encoding, response_content_language: response_content_language, response_content_type: response_content_type, response_expires: response_expires, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, version_id: version_id)
        head_object(input)
      end
      def head_object(input : Types::HeadObjectRequest) : Types::HeadObjectOutput
        request = Protocol::RestXml.build_request(Model::HEAD_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::HeadObjectOutput, "HeadObject")
      end

      # This operation is not supported for directory buckets. Lists the analytics configurations for the
      # bucket. You can have up to 1,000 analytics configurations per bucket. This action supports list
      # pagination and does not return more than 100 configurations at a time. You should always check the
      # IsTruncated element in the response. If there are no more configurations to list, IsTruncated is set
      # to false. If there are more configurations to list, IsTruncated is set to true, and there will be a
      # value in NextContinuationToken . You use the NextContinuationToken value to continue the pagination
      # of the list by passing the value in continuation-token in the request to GET the next page. To use
      # this operation, you must have permissions to perform the s3:GetAnalyticsConfiguration action. The
      # bucket owner has this permission by default. The bucket owner can grant this permission to others.
      # For more information about permissions, see Permissions Related to Bucket Subresource Operations and
      # Managing Access Permissions to Your Amazon S3 Resources . For information about Amazon S3 analytics
      # feature, see Amazon S3 Analytics – Storage Class Analysis . The following operations are related to
      # ListBucketAnalyticsConfigurations : GetBucketAnalyticsConfiguration
      # DeleteBucketAnalyticsConfiguration PutBucketAnalyticsConfiguration You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_bucket_analytics_configurations(
        bucket : String,
        continuation_token : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Types::ListBucketAnalyticsConfigurationsOutput
        input = Types::ListBucketAnalyticsConfigurationsRequest.new(bucket: bucket, continuation_token: continuation_token, expected_bucket_owner: expected_bucket_owner)
        list_bucket_analytics_configurations(input)
      end
      def list_bucket_analytics_configurations(input : Types::ListBucketAnalyticsConfigurationsRequest) : Types::ListBucketAnalyticsConfigurationsOutput
        request = Protocol::RestXml.build_request(Model::LIST_BUCKET_ANALYTICS_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListBucketAnalyticsConfigurationsOutput, "ListBucketAnalyticsConfigurations")
      end

      # This operation is not supported for directory buckets. Lists the S3 Intelligent-Tiering
      # configuration from the specified bucket. The S3 Intelligent-Tiering storage class is designed to
      # optimize storage costs by automatically moving data to the most cost-effective storage access tier,
      # without performance impact or operational overhead. S3 Intelligent-Tiering delivers automatic cost
      # savings in three low latency and high throughput access tiers. To get the lowest storage cost on
      # data that can be accessed in minutes to hours, you can choose to activate additional archiving
      # capabilities. The S3 Intelligent-Tiering storage class is the ideal storage class for data with
      # unknown, changing, or unpredictable access patterns, independent of object size or retention period.
      # If the size of an object is less than 128 KB, it is not monitored and not eligible for auto-tiering.
      # Smaller objects can be stored, but they are always charged at the Frequent Access tier rates in the
      # S3 Intelligent-Tiering storage class. For more information, see Storage class for automatically
      # optimizing frequently and infrequently accessed objects . Operations related to
      # ListBucketIntelligentTieringConfigurations include: DeleteBucketIntelligentTieringConfiguration
      # PutBucketIntelligentTieringConfiguration GetBucketIntelligentTieringConfiguration You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_bucket_intelligent_tiering_configurations(
        bucket : String,
        continuation_token : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Types::ListBucketIntelligentTieringConfigurationsOutput
        input = Types::ListBucketIntelligentTieringConfigurationsRequest.new(bucket: bucket, continuation_token: continuation_token, expected_bucket_owner: expected_bucket_owner)
        list_bucket_intelligent_tiering_configurations(input)
      end
      def list_bucket_intelligent_tiering_configurations(input : Types::ListBucketIntelligentTieringConfigurationsRequest) : Types::ListBucketIntelligentTieringConfigurationsOutput
        request = Protocol::RestXml.build_request(Model::LIST_BUCKET_INTELLIGENT_TIERING_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListBucketIntelligentTieringConfigurationsOutput, "ListBucketIntelligentTieringConfigurations")
      end

      # This operation is not supported for directory buckets. Returns a list of S3 Inventory configurations
      # for the bucket. You can have up to 1,000 inventory configurations per bucket. This action supports
      # list pagination and does not return more than 100 configurations at a time. Always check the
      # IsTruncated element in the response. If there are no more configurations to list, IsTruncated is set
      # to false. If there are more configurations to list, IsTruncated is set to true, and there is a value
      # in NextContinuationToken . You use the NextContinuationToken value to continue the pagination of the
      # list by passing the value in continuation-token in the request to GET the next page. To use this
      # operation, you must have permissions to perform the s3:GetInventoryConfiguration action. The bucket
      # owner has this permission by default. The bucket owner can grant this permission to others. For more
      # information about permissions, see Permissions Related to Bucket Subresource Operations and Managing
      # Access Permissions to Your Amazon S3 Resources . For information about the Amazon S3 inventory
      # feature, see Amazon S3 Inventory The following operations are related to
      # ListBucketInventoryConfigurations : GetBucketInventoryConfiguration
      # DeleteBucketInventoryConfiguration PutBucketInventoryConfiguration You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_bucket_inventory_configurations(
        bucket : String,
        continuation_token : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Types::ListBucketInventoryConfigurationsOutput
        input = Types::ListBucketInventoryConfigurationsRequest.new(bucket: bucket, continuation_token: continuation_token, expected_bucket_owner: expected_bucket_owner)
        list_bucket_inventory_configurations(input)
      end
      def list_bucket_inventory_configurations(input : Types::ListBucketInventoryConfigurationsRequest) : Types::ListBucketInventoryConfigurationsOutput
        request = Protocol::RestXml.build_request(Model::LIST_BUCKET_INVENTORY_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListBucketInventoryConfigurationsOutput, "ListBucketInventoryConfigurations")
      end

      # This operation is not supported for directory buckets. Lists the metrics configurations for the
      # bucket. The metrics configurations are only for the request metrics of the bucket and do not provide
      # information on daily storage metrics. You can have up to 1,000 configurations per bucket. This
      # action supports list pagination and does not return more than 100 configurations at a time. Always
      # check the IsTruncated element in the response. If there are no more configurations to list,
      # IsTruncated is set to false. If there are more configurations to list, IsTruncated is set to true,
      # and there is a value in NextContinuationToken . You use the NextContinuationToken value to continue
      # the pagination of the list by passing the value in continuation-token in the request to GET the next
      # page. To use this operation, you must have permissions to perform the s3:GetMetricsConfiguration
      # action. The bucket owner has this permission by default. The bucket owner can grant this permission
      # to others. For more information about permissions, see Permissions Related to Bucket Subresource
      # Operations and Managing Access Permissions to Your Amazon S3 Resources . For more information about
      # metrics configurations and CloudWatch request metrics, see Monitoring Metrics with Amazon CloudWatch
      # . The following operations are related to ListBucketMetricsConfigurations :
      # PutBucketMetricsConfiguration GetBucketMetricsConfiguration DeleteBucketMetricsConfiguration You
      # must URL encode any signed header values that contain spaces. For example, if your header value is
      # my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_bucket_metrics_configurations(
        bucket : String,
        continuation_token : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Types::ListBucketMetricsConfigurationsOutput
        input = Types::ListBucketMetricsConfigurationsRequest.new(bucket: bucket, continuation_token: continuation_token, expected_bucket_owner: expected_bucket_owner)
        list_bucket_metrics_configurations(input)
      end
      def list_bucket_metrics_configurations(input : Types::ListBucketMetricsConfigurationsRequest) : Types::ListBucketMetricsConfigurationsOutput
        request = Protocol::RestXml.build_request(Model::LIST_BUCKET_METRICS_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListBucketMetricsConfigurationsOutput, "ListBucketMetricsConfigurations")
      end

      # This operation is not supported for directory buckets. Returns a list of all buckets owned by the
      # authenticated sender of the request. To grant IAM permission to use this operation, you must add the
      # s3:ListAllMyBuckets policy action. For information about Amazon S3 buckets, see Creating,
      # configuring, and working with Amazon S3 buckets . We strongly recommend using only paginated
      # ListBuckets requests. Unpaginated ListBuckets requests are only supported for Amazon Web Services
      # accounts set to the default general purpose bucket quota of 10,000. If you have an approved general
      # purpose bucket quota above 10,000, you must send paginated ListBuckets requests to list your
      # account’s buckets. All unpaginated ListBuckets requests will be rejected for Amazon Web Services
      # accounts with a general purpose bucket quota greater than 10,000. You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_buckets(
        bucket_region : String? = nil,
        continuation_token : String? = nil,
        max_buckets : Int32? = nil,
        prefix : String? = nil
      ) : Types::ListBucketsOutput
        input = Types::ListBucketsRequest.new(bucket_region: bucket_region, continuation_token: continuation_token, max_buckets: max_buckets, prefix: prefix)
        list_buckets(input)
      end
      def list_buckets(input : Types::ListBucketsRequest) : Types::ListBucketsOutput
        request = Protocol::RestXml.build_request(Model::LIST_BUCKETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListBucketsOutput, "ListBuckets")
      end

      # Returns a list of all Amazon S3 directory buckets owned by the authenticated sender of the request.
      # For more information about directory buckets, see Directory buckets in the Amazon S3 User Guide .
      # Directory buckets - For directory buckets, you must make requests for this API operation to the
      # Regional endpoint. These endpoints support path-style requests in the format
      # https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style requests
      # aren't supported. For more information about endpoints in Availability Zones, see Regional and Zonal
      # endpoints for directory buckets in Availability Zones in the Amazon S3 User Guide . For more
      # information about endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the
      # Amazon S3 User Guide . Permissions You must have the s3express:ListAllMyDirectoryBuckets permission
      # in an IAM identity-based policy instead of a bucket policy. Cross-account access to this API
      # operation isn't supported. This operation can only be performed by the Amazon Web Services account
      # that owns the resource. For more information about directory bucket policies and permissions, see
      # Amazon Web Services Identity and Access Management (IAM) for S3 Express One Zone in the Amazon S3
      # User Guide . HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # s3express-control. region .amazonaws.com . The BucketRegion response element is not part of the
      # ListDirectoryBuckets Response Syntax. You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def list_directory_buckets(
        continuation_token : String? = nil,
        max_directory_buckets : Int32? = nil
      ) : Types::ListDirectoryBucketsOutput
        input = Types::ListDirectoryBucketsRequest.new(continuation_token: continuation_token, max_directory_buckets: max_directory_buckets)
        list_directory_buckets(input)
      end
      def list_directory_buckets(input : Types::ListDirectoryBucketsRequest) : Types::ListDirectoryBucketsOutput
        request = Protocol::RestXml.build_request(Model::LIST_DIRECTORY_BUCKETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListDirectoryBucketsOutput, "ListDirectoryBuckets")
      end

      # This operation lists in-progress multipart uploads in a bucket. An in-progress multipart upload is a
      # multipart upload that has been initiated by the CreateMultipartUpload request, but has not yet been
      # completed or aborted. Directory buckets - If multipart uploads in a directory bucket are in
      # progress, you can't delete the bucket until all the in-progress multipart uploads are aborted or
      # completed. To delete these in-progress multipart uploads, use the ListMultipartUploads operation to
      # list the in-progress multipart uploads in the bucket and use the AbortMultipartUpload operation to
      # abort all the in-progress multipart uploads. The ListMultipartUploads operation returns a maximum of
      # 1,000 multipart uploads in the response. The limit of 1,000 multipart uploads is also the default
      # value. You can further limit the number of uploads in a response by specifying the max-uploads
      # request parameter. If there are more than 1,000 multipart uploads that satisfy your
      # ListMultipartUploads request, the response returns an IsTruncated element with the value of true , a
      # NextKeyMarker element, and a NextUploadIdMarker element. To list the remaining multipart uploads,
      # you need to make subsequent ListMultipartUploads requests. In these requests, include two query
      # parameters: key-marker and upload-id-marker . Set the value of key-marker to the NextKeyMarker value
      # from the previous response. Similarly, set the value of upload-id-marker to the NextUploadIdMarker
      # value from the previous response. Directory buckets - The upload-id-marker element and the
      # NextUploadIdMarker element aren't supported by directory buckets. To list the additional multipart
      # uploads, you only need to set the value of key-marker to the NextKeyMarker value from the previous
      # response. For more information about multipart uploads, see Uploading Objects Using Multipart Upload
      # in the Amazon S3 User Guide . Directory buckets - For directory buckets, you must make requests for
      # this API operation to the Zonal endpoint. These endpoints support virtual-hosted-style requests in
      # the format https:// amzn-s3-demo-bucket .s3express- zone-id . region-code .amazonaws.com/ key-name .
      # Path-style requests are not supported. For more information about endpoints in Availability Zones,
      # see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3 User
      # Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets in
      # Local Zones in the Amazon S3 User Guide . Permissions General purpose bucket permissions - For
      # information about permissions required to use the multipart upload API, see Multipart Upload and
      # Permissions in the Amazon S3 User Guide . Directory bucket permissions - To grant access to this API
      # operation on a directory bucket, we recommend that you use the CreateSession API operation for
      # session-based authorization. Specifically, you grant the s3express:CreateSession permission to the
      # directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
      # CreateSession API call on the bucket to obtain a session token. With the session token in your
      # request header, you can make API requests to this operation. After the session token expires, you
      # make another CreateSession API call to generate a new session token for use. Amazon Web Services CLI
      # or SDKs create session and refresh the session token automatically to avoid service interruptions
      # when a session expires. For more information about authorization, see CreateSession . Sorting of
      # multipart uploads in response General purpose bucket - In the ListMultipartUploads response, the
      # multipart uploads are sorted based on two criteria: Key-based sorting - Multipart uploads are
      # initially sorted in ascending order based on their object keys. Time-based sorting - For uploads
      # that share the same object key, they are further sorted in ascending order based on the upload
      # initiation time. Among uploads with the same key, the one that was initiated first will appear
      # before the ones that were initiated later. Directory bucket - In the ListMultipartUploads response,
      # the multipart uploads aren't sorted lexicographically based on the object keys. HTTP Host header
      # syntax Directory buckets - The HTTP Host header syntax is Bucket-name .s3express- zone-id .
      # region-code .amazonaws.com . The following operations are related to ListMultipartUploads :
      # CreateMultipartUpload UploadPart CompleteMultipartUpload ListParts AbortMultipartUpload You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_multipart_uploads(
        bucket : String,
        delimiter : String? = nil,
        encoding_type : String? = nil,
        expected_bucket_owner : String? = nil,
        key_marker : String? = nil,
        max_uploads : Int32? = nil,
        prefix : String? = nil,
        request_payer : String? = nil,
        upload_id_marker : String? = nil
      ) : Types::ListMultipartUploadsOutput
        input = Types::ListMultipartUploadsRequest.new(bucket: bucket, delimiter: delimiter, encoding_type: encoding_type, expected_bucket_owner: expected_bucket_owner, key_marker: key_marker, max_uploads: max_uploads, prefix: prefix, request_payer: request_payer, upload_id_marker: upload_id_marker)
        list_multipart_uploads(input)
      end
      def list_multipart_uploads(input : Types::ListMultipartUploadsRequest) : Types::ListMultipartUploadsOutput
        request = Protocol::RestXml.build_request(Model::LIST_MULTIPART_UPLOADS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListMultipartUploadsOutput, "ListMultipartUploads")
      end

      # This operation is not supported for directory buckets. Returns metadata about all versions of the
      # objects in a bucket. You can also use request parameters as selection criteria to return metadata
      # about a subset of all the object versions. To use this operation, you must have permission to
      # perform the s3:ListBucketVersions action. Be aware of the name difference. A 200 OK response can
      # contain valid or invalid XML. Make sure to design your application to parse the contents of the
      # response and handle it appropriately. To use this operation, you must have READ access to the
      # bucket. The following operations are related to ListObjectVersions : ListObjectsV2 GetObject
      # PutObject DeleteObject You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def list_object_versions(
        bucket : String,
        delimiter : String? = nil,
        encoding_type : String? = nil,
        expected_bucket_owner : String? = nil,
        key_marker : String? = nil,
        max_keys : Int32? = nil,
        optional_object_attributes : Array(String)? = nil,
        prefix : String? = nil,
        request_payer : String? = nil,
        version_id_marker : String? = nil
      ) : Types::ListObjectVersionsOutput
        input = Types::ListObjectVersionsRequest.new(bucket: bucket, delimiter: delimiter, encoding_type: encoding_type, expected_bucket_owner: expected_bucket_owner, key_marker: key_marker, max_keys: max_keys, optional_object_attributes: optional_object_attributes, prefix: prefix, request_payer: request_payer, version_id_marker: version_id_marker)
        list_object_versions(input)
      end
      def list_object_versions(input : Types::ListObjectVersionsRequest) : Types::ListObjectVersionsOutput
        request = Protocol::RestXml.build_request(Model::LIST_OBJECT_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListObjectVersionsOutput, "ListObjectVersions")
      end

      # This operation is not supported for directory buckets. Returns some or all (up to 1,000) of the
      # objects in a bucket. You can use the request parameters as selection criteria to return a subset of
      # the objects in a bucket. A 200 OK response can contain valid or invalid XML. Be sure to design your
      # application to parse the contents of the response and handle it appropriately. This action has been
      # revised. We recommend that you use the newer version, ListObjectsV2 , when developing applications.
      # For backward compatibility, Amazon S3 continues to support ListObjects . The following operations
      # are related to ListObjects : ListObjectsV2 GetObject PutObject CreateBucket ListBuckets You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def list_objects(
        bucket : String,
        delimiter : String? = nil,
        encoding_type : String? = nil,
        expected_bucket_owner : String? = nil,
        marker : String? = nil,
        max_keys : Int32? = nil,
        optional_object_attributes : Array(String)? = nil,
        prefix : String? = nil,
        request_payer : String? = nil
      ) : Types::ListObjectsOutput
        input = Types::ListObjectsRequest.new(bucket: bucket, delimiter: delimiter, encoding_type: encoding_type, expected_bucket_owner: expected_bucket_owner, marker: marker, max_keys: max_keys, optional_object_attributes: optional_object_attributes, prefix: prefix, request_payer: request_payer)
        list_objects(input)
      end
      def list_objects(input : Types::ListObjectsRequest) : Types::ListObjectsOutput
        request = Protocol::RestXml.build_request(Model::LIST_OBJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListObjectsOutput, "ListObjects")
      end

      # Returns some or all (up to 1,000) of the objects in a bucket with each request. You can use the
      # request parameters as selection criteria to return a subset of the objects in a bucket. A 200 OK
      # response can contain valid or invalid XML. Make sure to design your application to parse the
      # contents of the response and handle it appropriately. For more information about listing objects,
      # see Listing object keys programmatically in the Amazon S3 User Guide . To get a list of your
      # buckets, see ListBuckets . General purpose bucket - For general purpose buckets, ListObjectsV2
      # doesn't return prefixes that are related only to in-progress multipart uploads. Directory buckets -
      # For directory buckets, ListObjectsV2 response includes the prefixes that are related only to
      # in-progress multipart uploads. Directory buckets - For directory buckets, you must make requests for
      # this API operation to the Zonal endpoint. These endpoints support virtual-hosted-style requests in
      # the format https:// amzn-s3-demo-bucket .s3express- zone-id . region-code .amazonaws.com/ key-name .
      # Path-style requests are not supported. For more information about endpoints in Availability Zones,
      # see Regional and Zonal endpoints for directory buckets in Availability Zones in the Amazon S3 User
      # Guide . For more information about endpoints in Local Zones, see Concepts for directory buckets in
      # Local Zones in the Amazon S3 User Guide . Permissions General purpose bucket permissions - To use
      # this operation, you must have READ access to the bucket. You must have permission to perform the
      # s3:ListBucket action. The bucket owner has this permission by default and can grant this permission
      # to others. For more information about permissions, see Permissions Related to Bucket Subresource
      # Operations and Managing Access Permissions to Your Amazon S3 Resources in the Amazon S3 User Guide .
      # Directory bucket permissions - To grant access to this API operation on a directory bucket, we
      # recommend that you use the CreateSession API operation for session-based authorization.
      # Specifically, you grant the s3express:CreateSession permission to the directory bucket in a bucket
      # policy or an IAM identity-based policy. Then, you make the CreateSession API call on the bucket to
      # obtain a session token. With the session token in your request header, you can make API requests to
      # this operation. After the session token expires, you make another CreateSession API call to generate
      # a new session token for use. Amazon Web Services CLI or SDKs create session and refresh the session
      # token automatically to avoid service interruptions when a session expires. For more information
      # about authorization, see CreateSession . Sorting order of returned objects General purpose bucket -
      # For general purpose buckets, ListObjectsV2 returns objects in lexicographical order based on their
      # key names. Directory bucket - For directory buckets, ListObjectsV2 does not return objects in
      # lexicographical order. HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # Bucket-name .s3express- zone-id . region-code .amazonaws.com . This section describes the latest
      # revision of this action. We recommend that you use this revised API operation for application
      # development. For backward compatibility, Amazon S3 continues to support the prior version of this
      # API operation, ListObjects . The following operations are related to ListObjectsV2 : GetObject
      # PutObject CreateBucket You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def list_objects_v2(
        bucket : String,
        continuation_token : String? = nil,
        delimiter : String? = nil,
        encoding_type : String? = nil,
        expected_bucket_owner : String? = nil,
        fetch_owner : Bool? = nil,
        max_keys : Int32? = nil,
        optional_object_attributes : Array(String)? = nil,
        prefix : String? = nil,
        request_payer : String? = nil,
        start_after : String? = nil
      ) : Types::ListObjectsV2Output
        input = Types::ListObjectsV2Request.new(bucket: bucket, continuation_token: continuation_token, delimiter: delimiter, encoding_type: encoding_type, expected_bucket_owner: expected_bucket_owner, fetch_owner: fetch_owner, max_keys: max_keys, optional_object_attributes: optional_object_attributes, prefix: prefix, request_payer: request_payer, start_after: start_after)
        list_objects_v2(input)
      end
      def list_objects_v2(input : Types::ListObjectsV2Request) : Types::ListObjectsV2Output
        request = Protocol::RestXml.build_request(Model::LIST_OBJECTS_V2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListObjectsV2Output, "ListObjectsV2")
      end

      # Lists the parts that have been uploaded for a specific multipart upload. To use this operation, you
      # must provide the upload ID in the request. You obtain this uploadID by sending the initiate
      # multipart upload request through CreateMultipartUpload . The ListParts request returns a maximum of
      # 1,000 uploaded parts. The limit of 1,000 parts is also the default value. You can restrict the
      # number of parts in a response by specifying the max-parts request parameter. If your multipart
      # upload consists of more than 1,000 parts, the response returns an IsTruncated field with the value
      # of true , and a NextPartNumberMarker element. To list remaining uploaded parts, in subsequent
      # ListParts requests, include the part-number-marker query string parameter and set its value to the
      # NextPartNumberMarker field value from the previous response. For more information on multipart
      # uploads, see Uploading Objects Using Multipart Upload in the Amazon S3 User Guide . Directory
      # buckets - For directory buckets, you must make requests for this API operation to the Zonal
      # endpoint. These endpoints support virtual-hosted-style requests in the format https://
      # amzn-s3-demo-bucket .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests
      # are not supported. For more information about endpoints in Availability Zones, see Regional and
      # Zonal endpoints for directory buckets in Availability Zones in the Amazon S3 User Guide . For more
      # information about endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the
      # Amazon S3 User Guide . Permissions General purpose bucket permissions - For information about
      # permissions required to use the multipart upload API, see Multipart Upload and Permissions in the
      # Amazon S3 User Guide . If the upload was created using server-side encryption with Key Management
      # Service (KMS) keys (SSE-KMS) or dual-layer server-side encryption with Amazon Web Services KMS keys
      # (DSSE-KMS), you must have permission to the kms:Decrypt action for the ListParts request to succeed.
      # Directory bucket permissions - To grant access to this API operation on a directory bucket, we
      # recommend that you use the CreateSession API operation for session-based authorization.
      # Specifically, you grant the s3express:CreateSession permission to the directory bucket in a bucket
      # policy or an IAM identity-based policy. Then, you make the CreateSession API call on the bucket to
      # obtain a session token. With the session token in your request header, you can make API requests to
      # this operation. After the session token expires, you make another CreateSession API call to generate
      # a new session token for use. Amazon Web Services CLI or SDKs create session and refresh the session
      # token automatically to avoid service interruptions when a session expires. For more information
      # about authorization, see CreateSession . HTTP Host header syntax Directory buckets - The HTTP Host
      # header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The following
      # operations are related to ListParts : CreateMultipartUpload UploadPart CompleteMultipartUpload
      # AbortMultipartUpload GetObjectAttributes ListMultipartUploads You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def list_parts(
        bucket : String,
        key : String,
        upload_id : String,
        expected_bucket_owner : String? = nil,
        max_parts : Int32? = nil,
        part_number_marker : Int32? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil
      ) : Types::ListPartsOutput
        input = Types::ListPartsRequest.new(bucket: bucket, key: key, upload_id: upload_id, expected_bucket_owner: expected_bucket_owner, max_parts: max_parts, part_number_marker: part_number_marker, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5)
        list_parts(input)
      end
      def list_parts(input : Types::ListPartsRequest) : Types::ListPartsOutput
        request = Protocol::RestXml.build_request(Model::LIST_PARTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListPartsOutput, "ListParts")
      end

      # Sets the attribute-based access control (ABAC) property of the general purpose bucket. You must have
      # s3:PutBucketABAC permission to perform this action. When you enable ABAC, you can use tags for
      # access control on your buckets. Additionally, when ABAC is enabled, you must use the TagResource and
      # UntagResource actions to manage tags on your buckets. You can nolonger use the PutBucketTagging and
      # DeleteBucketTagging actions to tag your bucket. For more information, see Enabling ABAC in general
      # purpose buckets .
      def put_bucket_abac(
        abac_status : Types::AbacStatus,
        bucket : String,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketAbacRequest.new(abac_status: abac_status, bucket: bucket, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_abac(input)
      end
      def put_bucket_abac(input : Types::PutBucketAbacRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_ABAC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets the accelerate configuration of an
      # existing bucket. Amazon S3 Transfer Acceleration is a bucket-level feature that enables you to
      # perform faster data transfers to Amazon S3. To use this operation, you must have permission to
      # perform the s3:PutAccelerateConfiguration action. The bucket owner has this permission by default.
      # The bucket owner can grant this permission to others. For more information about permissions, see
      # Permissions Related to Bucket Subresource Operations and Managing Access Permissions to Your Amazon
      # S3 Resources . The Transfer Acceleration state of a bucket can be set to one of the following two
      # values: Enabled – Enables accelerated data transfers to the bucket. Suspended – Disables accelerated
      # data transfers to the bucket. The GetBucketAccelerateConfiguration action returns the transfer
      # acceleration state of a bucket. After setting the Transfer Acceleration state of a bucket to
      # Enabled, it might take up to thirty minutes before the data transfer rates to the bucket increase.
      # The name of the bucket used for Transfer Acceleration must be DNS-compliant and must not contain
      # periods ("."). For more information about transfer acceleration, see Transfer Acceleration . The
      # following operations are related to PutBucketAccelerateConfiguration :
      # GetBucketAccelerateConfiguration CreateBucket You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def put_bucket_accelerate_configuration(
        accelerate_configuration : Types::AccelerateConfiguration,
        bucket : String,
        checksum_algorithm : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketAccelerateConfigurationRequest.new(accelerate_configuration: accelerate_configuration, bucket: bucket, checksum_algorithm: checksum_algorithm, expected_bucket_owner: expected_bucket_owner)
        put_bucket_accelerate_configuration(input)
      end
      def put_bucket_accelerate_configuration(input : Types::PutBucketAccelerateConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_ACCELERATE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email Grantee
      # Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request after October
      # 1, 2025, the request will receive an HTTP 405 (Method Not Allowed) error. This change affects the
      # following Amazon Web Services Regions: US East (N. Virginia), US West (N. California), US West
      # (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland),
      # and South America (São Paulo). This operation is not supported for directory buckets. Sets the
      # permissions on an existing bucket using access control lists (ACL). For more information, see Using
      # ACLs . To set the ACL of a bucket, you must have the WRITE_ACP permission. You can use one of the
      # following two ways to set a bucket's permissions: Specify the ACL in the request body Specify
      # permissions using request headers You cannot specify access permission using both the body and the
      # request headers. Depending on your application needs, you may choose to set the ACL on a bucket
      # using either the request body or the headers. For example, if you have an existing application that
      # updates a bucket ACL using the request body, then you can continue to use that approach. If your
      # bucket uses the bucket owner enforced setting for S3 Object Ownership, ACLs are disabled and no
      # longer affect permissions. You must use policies to grant access to your bucket and the objects in
      # it. Requests to set ACLs or update ACLs fail and return the AccessControlListNotSupported error
      # code. Requests to read ACLs are still supported. For more information, see Controlling object
      # ownership in the Amazon S3 User Guide . Permissions You can set access permissions by using one of
      # the following methods: Specify a canned ACL with the x-amz-acl request header. Amazon S3 supports a
      # set of predefined ACLs, known as canned ACLs . Each canned ACL has a predefined set of grantees and
      # permissions. Specify the canned ACL name as the value of x-amz-acl . If you use this header, you
      # cannot use other access control-specific headers in your request. For more information, see Canned
      # ACL . Specify access permissions explicitly with the x-amz-grant-read , x-amz-grant-read-acp ,
      # x-amz-grant-write-acp , and x-amz-grant-full-control headers. When using these headers, you specify
      # explicit access permissions and grantees (Amazon Web Services accounts or Amazon S3 groups) who will
      # receive the permission. If you use these ACL-specific headers, you cannot use the x-amz-acl header
      # to set a canned ACL. These parameters map to the set of permissions that Amazon S3 supports in an
      # ACL. For more information, see Access Control List (ACL) Overview . You specify each grantee as a
      # type=value pair, where the type is one of the following: id – if the value specified is the
      # canonical user ID of an Amazon Web Services account uri – if you are granting permissions to a
      # predefined group emailAddress – if the value specified is the email address of an Amazon Web
      # Services account Using email addresses to specify a grantee is only supported in the following
      # Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West (Oregon) Asia
      # Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South America (São
      # Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and Endpoints in
      # the Amazon Web Services General Reference. For example, the following x-amz-grant-write header
      # grants create, overwrite, and delete objects permission to LogDelivery group predefined by Amazon S3
      # and two Amazon Web Services accounts identified by their email addresses. x-amz-grant-write:
      # uri="http://acs.amazonaws.com/groups/s3/LogDelivery", id="111122223333", id="555566667777" You can
      # use either a canned ACL or specify access permissions explicitly. You cannot do both. Grantee Values
      # You can specify the person (grantee) to whom you're assigning access rights (using request elements)
      # in the following ways. For examples of how to specify these grantee values in JSON format, see the
      # Amazon Web Services CLI example in Enabling Amazon S3 server access logging in the Amazon S3 User
      # Guide . By the person's ID: &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
      # &lt;/Grantee&gt; DisplayName is optional and ignored in the request By URI: &lt;Grantee
      # xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;
      # By Email address: &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;&amp;&lt;/Grantee&gt;
      # The grantee is resolved to the CanonicalUser and, in a response to a GET Object acl request, appears
      # as the CanonicalUser. Using email addresses to specify a grantee is only supported in the following
      # Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West (Oregon) Asia
      # Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South America (São
      # Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and Endpoints in
      # the Amazon Web Services General Reference. The following operations are related to PutBucketAcl :
      # CreateBucket DeleteBucket GetObjectAcl You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def put_bucket_acl(
        bucket : String,
        acl : String? = nil,
        access_control_policy : Types::AccessControlPolicy? = nil,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write : String? = nil,
        grant_write_acp : String? = nil
      ) : Nil
        input = Types::PutBucketAclRequest.new(bucket: bucket, acl: acl, access_control_policy: access_control_policy, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write: grant_write, grant_write_acp: grant_write_acp)
        put_bucket_acl(input)
      end
      def put_bucket_acl(input : Types::PutBucketAclRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets an analytics configuration for the
      # bucket (specified by the analytics configuration ID). You can have up to 1,000 analytics
      # configurations per bucket. You can choose to have storage class analysis export analysis reports
      # sent to a comma-separated values (CSV) flat file. See the DataExport request element. Reports are
      # updated daily and are based on the object filters that you configure. When selecting data export,
      # you specify a destination bucket and an optional destination prefix where the file is written. You
      # can export the data to a destination bucket in a different account. However, the destination bucket
      # must be in the same Region as the bucket that you are making the PUT analytics configuration to. For
      # more information, see Amazon S3 Analytics – Storage Class Analysis . You must create a bucket policy
      # on the destination bucket where the exported file is written to grant permissions to Amazon S3 to
      # write objects to the bucket. For an example policy, see Granting Permissions for Amazon S3 Inventory
      # and Storage Class Analysis . To use this operation, you must have permissions to perform the
      # s3:PutAnalyticsConfiguration action. The bucket owner has this permission by default. The bucket
      # owner can grant this permission to others. For more information about permissions, see Permissions
      # Related to Bucket Subresource Operations and Managing Access Permissions to Your Amazon S3 Resources
      # . PutBucketAnalyticsConfiguration has the following special errors: HTTP Error: HTTP 400 Bad Request
      # Code: InvalidArgument Cause: Invalid argument. HTTP Error: HTTP 400 Bad Request Code:
      # TooManyConfigurations Cause: You are attempting to create a new configuration but have already
      # reached the 1,000-configuration limit. HTTP Error: HTTP 403 Forbidden Code: AccessDenied Cause: You
      # are not the owner of the specified bucket, or you do not have the s3:PutAnalyticsConfiguration
      # bucket permission to set the configuration on the bucket. The following operations are related to
      # PutBucketAnalyticsConfiguration : GetBucketAnalyticsConfiguration DeleteBucketAnalyticsConfiguration
      # ListBucketAnalyticsConfigurations You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def put_bucket_analytics_configuration(
        analytics_configuration : Types::AnalyticsConfiguration,
        bucket : String,
        id : String,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketAnalyticsConfigurationRequest.new(analytics_configuration: analytics_configuration, bucket: bucket, id: id, expected_bucket_owner: expected_bucket_owner)
        put_bucket_analytics_configuration(input)
      end
      def put_bucket_analytics_configuration(input : Types::PutBucketAnalyticsConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_ANALYTICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets the cors configuration for your bucket.
      # If the configuration exists, Amazon S3 replaces it. To use this operation, you must be allowed to
      # perform the s3:PutBucketCORS action. By default, the bucket owner has this permission and can grant
      # it to others. You set this configuration on a bucket so that the bucket can service cross-origin
      # requests. For example, you might want to enable a request whose origin is http://www.example.com to
      # access your Amazon S3 bucket at my.example.bucket.com by using the browser's XMLHttpRequest
      # capability. To enable cross-origin resource sharing (CORS) on a bucket, you add the cors subresource
      # to the bucket. The cors subresource is an XML document in which you configure rules that identify
      # origins and the HTTP methods that can be executed on your bucket. The document is limited to 64 KB
      # in size. When Amazon S3 receives a cross-origin request (or a pre-flight OPTIONS request) against a
      # bucket, it evaluates the cors configuration on the bucket and uses the first CORSRule rule that
      # matches the incoming browser request to enable a cross-origin request. For a rule to match, the
      # following conditions must be met: The request's Origin header must match AllowedOrigin elements. The
      # request method (for example, GET, PUT, HEAD, and so on) or the Access-Control-Request-Method header
      # in case of a pre-flight OPTIONS request must be one of the AllowedMethod elements. Every header
      # specified in the Access-Control-Request-Headers request header of a pre-flight request must match an
      # AllowedHeader element. For more information about CORS, go to Enabling Cross-Origin Resource Sharing
      # in the Amazon S3 User Guide . The following operations are related to PutBucketCors : GetBucketCors
      # DeleteBucketCors RESTOPTIONSobject You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def put_bucket_cors(
        bucket : String,
        cors_configuration : Types::CORSConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketCorsRequest.new(bucket: bucket, cors_configuration: cors_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_cors(input)
      end
      def put_bucket_cors(input : Types::PutBucketCorsRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_CORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation configures default encryption and Amazon S3 Bucket Keys for an existing bucket. You
      # can also block encryption types using this operation. Directory buckets - For directory buckets, you
      # must make requests for this API operation to the Regional endpoint. These endpoints support
      # path-style requests in the format https://s3express-control. region-code .amazonaws.com/ bucket-name
      # . Virtual-hosted-style requests aren't supported. For more information about endpoints in
      # Availability Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones in
      # the Amazon S3 User Guide . For more information about endpoints in Local Zones, see Concepts for
      # directory buckets in Local Zones in the Amazon S3 User Guide . By default, all buckets have a
      # default encryption configuration that uses server-side encryption with Amazon S3 managed keys
      # (SSE-S3). General purpose buckets You can optionally configure default encryption for a bucket by
      # using server-side encryption with Key Management Service (KMS) keys (SSE-KMS) or dual-layer
      # server-side encryption with Amazon Web Services KMS keys (DSSE-KMS). If you specify default
      # encryption by using SSE-KMS, you can also configure Amazon S3 Bucket Keys . For information about
      # the bucket default encryption feature, see Amazon S3 Bucket Default Encryption in the Amazon S3 User
      # Guide . If you use PutBucketEncryption to set your default bucket encryption to SSE-KMS, you should
      # verify that your KMS key ID is correct. Amazon S3 doesn't validate the KMS key ID provided in
      # PutBucketEncryption requests. Directory buckets - You can optionally configure default encryption
      # for a bucket by using server-side encryption with Key Management Service (KMS) keys (SSE-KMS). We
      # recommend that the bucket's default encryption uses the desired encryption configuration and you
      # don't override the bucket default encryption in your CreateSession requests or PUT object requests.
      # Then, new objects are automatically encrypted with the desired encryption settings. For more
      # information about the encryption overriding behaviors in directory buckets, see Specifying
      # server-side encryption with KMS for new object uploads . Your SSE-KMS configuration can only support
      # 1 customer managed key per directory bucket's lifetime. The Amazon Web Services managed key ( aws/s3
      # ) isn't supported. S3 Bucket Keys are always enabled for GET and PUT operations in a directory
      # bucket and can’t be disabled. S3 Bucket Keys aren't supported, when you copy SSE-KMS encrypted
      # objects from general purpose buckets to directory buckets, from directory buckets to general purpose
      # buckets, or between directory buckets, through CopyObject , UploadPartCopy , the Copy operation in
      # Batch Operations , or the import jobs . In this case, Amazon S3 makes a call to KMS every time a
      # copy request is made for a KMS-encrypted object. When you specify an KMS customer managed key for
      # encryption in your directory bucket, only use the key ID or key ARN. The key alias format of the KMS
      # key isn't supported. For directory buckets, if you use PutBucketEncryption to set your default
      # bucket encryption to SSE-KMS, Amazon S3 validates the KMS key ID provided in PutBucketEncryption
      # requests. If you're specifying a customer managed KMS key, we recommend using a fully qualified KMS
      # key ARN. If you use a KMS key alias instead, then KMS resolves the key within the requester’s
      # account. This behavior can result in data that's encrypted with a KMS key that belongs to the
      # requester, and not the bucket owner. Also, this action requires Amazon Web Services Signature
      # Version 4. For more information, see Authenticating Requests (Amazon Web Services Signature Version
      # 4) . Permissions General purpose bucket permissions - The s3:PutEncryptionConfiguration permission
      # is required in a policy. The bucket owner has this permission by default. The bucket owner can grant
      # this permission to others. For more information about permissions, see Permissions Related to Bucket
      # Operations and Managing Access Permissions to Your Amazon S3 Resources in the Amazon S3 User Guide .
      # Directory bucket permissions - To grant access to this API operation, you must have the
      # s3express:PutEncryptionConfiguration permission in an IAM identity-based policy instead of a bucket
      # policy. Cross-account access to this API operation isn't supported. This operation can only be
      # performed by the Amazon Web Services account that owns the resource. For more information about
      # directory bucket policies and permissions, see Amazon Web Services Identity and Access Management
      # (IAM) for S3 Express One Zone in the Amazon S3 User Guide . To set a directory bucket default
      # encryption with SSE-KMS, you must also have the kms:GenerateDataKey and the kms:Decrypt permissions
      # in IAM identity-based policies and KMS key policies for the target KMS key. HTTP Host header syntax
      # Directory buckets - The HTTP Host header syntax is s3express-control. region-code .amazonaws.com .
      # The following operations are related to PutBucketEncryption : GetBucketEncryption
      # DeleteBucketEncryption You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def put_bucket_encryption(
        bucket : String,
        server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketEncryptionRequest.new(bucket: bucket, server_side_encryption_configuration: server_side_encryption_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_encryption(input)
      end
      def put_bucket_encryption(input : Types::PutBucketEncryptionRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_ENCRYPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Puts a S3 Intelligent-Tiering configuration
      # to the specified bucket. You can have up to 1,000 S3 Intelligent-Tiering configurations per bucket.
      # The S3 Intelligent-Tiering storage class is designed to optimize storage costs by automatically
      # moving data to the most cost-effective storage access tier, without performance impact or
      # operational overhead. S3 Intelligent-Tiering delivers automatic cost savings in three low latency
      # and high throughput access tiers. To get the lowest storage cost on data that can be accessed in
      # minutes to hours, you can choose to activate additional archiving capabilities. The S3
      # Intelligent-Tiering storage class is the ideal storage class for data with unknown, changing, or
      # unpredictable access patterns, independent of object size or retention period. If the size of an
      # object is less than 128 KB, it is not monitored and not eligible for auto-tiering. Smaller objects
      # can be stored, but they are always charged at the Frequent Access tier rates in the S3
      # Intelligent-Tiering storage class. For more information, see Storage class for automatically
      # optimizing frequently and infrequently accessed objects . Operations related to
      # PutBucketIntelligentTieringConfiguration include: DeleteBucketIntelligentTieringConfiguration
      # GetBucketIntelligentTieringConfiguration ListBucketIntelligentTieringConfigurations You only need S3
      # Intelligent-Tiering enabled on a bucket if you want to automatically move objects stored in the S3
      # Intelligent-Tiering storage class to the Archive Access or Deep Archive Access tier.
      # PutBucketIntelligentTieringConfiguration has the following special errors: HTTP 400 Bad Request
      # Error Code: InvalidArgument Cause: Invalid Argument HTTP 400 Bad Request Error Code:
      # TooManyConfigurations Cause: You are attempting to create a new configuration but have already
      # reached the 1,000-configuration limit. HTTP 403 Forbidden Error Cause: You are not the owner of the
      # specified bucket, or you do not have the s3:PutIntelligentTieringConfiguration bucket permission to
      # set the configuration on the bucket. You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def put_bucket_intelligent_tiering_configuration(
        bucket : String,
        id : String,
        intelligent_tiering_configuration : Types::IntelligentTieringConfiguration,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketIntelligentTieringConfigurationRequest.new(bucket: bucket, id: id, intelligent_tiering_configuration: intelligent_tiering_configuration, expected_bucket_owner: expected_bucket_owner)
        put_bucket_intelligent_tiering_configuration(input)
      end
      def put_bucket_intelligent_tiering_configuration(input : Types::PutBucketIntelligentTieringConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_INTELLIGENT_TIERING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. This implementation of the PUT action adds an
      # S3 Inventory configuration (identified by the inventory ID) to the bucket. You can have up to 1,000
      # inventory configurations per bucket. Amazon S3 inventory generates inventories of the objects in the
      # bucket on a daily or weekly basis, and the results are published to a flat file. The bucket that is
      # inventoried is called the source bucket, and the bucket where the inventory flat file is stored is
      # called the destination bucket. The destination bucket must be in the same Amazon Web Services Region
      # as the source bucket. When you configure an inventory for a source bucket, you specify the
      # destination bucket where you want the inventory to be stored, and whether to generate the inventory
      # daily or weekly. You can also configure what object metadata to include and whether to inventory all
      # object versions or only current versions. For more information, see Amazon S3 Inventory in the
      # Amazon S3 User Guide. You must create a bucket policy on the destination bucket to grant permissions
      # to Amazon S3 to write objects to the bucket in the defined location. For an example policy, see
      # Granting Permissions for Amazon S3 Inventory and Storage Class Analysis . Permissions To use this
      # operation, you must have permission to perform the s3:PutInventoryConfiguration action. The bucket
      # owner has this permission by default and can grant this permission to others. The
      # s3:PutInventoryConfiguration permission allows a user to create an S3 Inventory report that includes
      # all object metadata fields available and to specify the destination bucket to store the inventory. A
      # user with read access to objects in the destination bucket can also access all object metadata
      # fields that are available in the inventory report. To restrict access to an inventory report, see
      # Restricting access to an Amazon S3 Inventory report in the Amazon S3 User Guide . For more
      # information about the metadata fields available in S3 Inventory, see Amazon S3 Inventory lists in
      # the Amazon S3 User Guide . For more information about permissions, see Permissions related to bucket
      # subresource operations and Identity and access management in Amazon S3 in the Amazon S3 User Guide .
      # PutBucketInventoryConfiguration has the following special errors: HTTP 400 Bad Request Error Code:
      # InvalidArgument Cause: Invalid Argument HTTP 400 Bad Request Error Code: TooManyConfigurations
      # Cause: You are attempting to create a new configuration but have already reached the
      # 1,000-configuration limit. HTTP 403 Forbidden Error Cause: You are not the owner of the specified
      # bucket, or you do not have the s3:PutInventoryConfiguration bucket permission to set the
      # configuration on the bucket. The following operations are related to PutBucketInventoryConfiguration
      # : GetBucketInventoryConfiguration DeleteBucketInventoryConfiguration
      # ListBucketInventoryConfigurations You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def put_bucket_inventory_configuration(
        bucket : String,
        id : String,
        inventory_configuration : Types::InventoryConfiguration,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketInventoryConfigurationRequest.new(bucket: bucket, id: id, inventory_configuration: inventory_configuration, expected_bucket_owner: expected_bucket_owner)
        put_bucket_inventory_configuration(input)
      end
      def put_bucket_inventory_configuration(input : Types::PutBucketInventoryConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_INVENTORY_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. For an updated version of this API, see
      # PutBucketLifecycleConfiguration . This version has been deprecated. Existing lifecycle
      # configurations will work. For new lifecycle configurations, use the updated API. This operation is
      # not supported for directory buckets. Creates a new lifecycle configuration for the bucket or
      # replaces an existing lifecycle configuration. For information about lifecycle configuration, see
      # Object Lifecycle Management in the Amazon S3 User Guide . By default, all Amazon S3 resources,
      # including buckets, objects, and related subresources (for example, lifecycle configuration and
      # website configuration) are private. Only the resource owner, the Amazon Web Services account that
      # created the resource, can access it. The resource owner can optionally grant access permissions to
      # others by writing an access policy. For this operation, users must get the
      # s3:PutLifecycleConfiguration permission. You can also explicitly deny permissions. Explicit denial
      # also supersedes any other permissions. If you want to prevent users or accounts from removing or
      # deleting objects from your bucket, you must deny them permissions for the following actions:
      # s3:DeleteObject s3:DeleteObjectVersion s3:PutLifecycleConfiguration For more information about
      # permissions, see Managing Access Permissions to your Amazon S3 Resources in the Amazon S3 User Guide
      # . For more examples of transitioning objects to storage classes such as STANDARD_IA or ONEZONE_IA,
      # see Examples of Lifecycle Configuration . The following operations are related to PutBucketLifecycle
      # : GetBucketLifecycle (Deprecated) GetBucketLifecycleConfiguration RestoreObject By default, a
      # resource owner—in this case, a bucket owner, which is the Amazon Web Services account that created
      # the bucket—can perform any of the operations. A resource owner can also grant others permission to
      # perform the operation. For more information, see the following topics in the Amazon S3 User Guide:
      # Specifying Permissions in a Policy Managing Access Permissions to your Amazon S3 Resources You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_lifecycle(
        bucket : String,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        lifecycle_configuration : Types::LifecycleConfiguration? = nil
      ) : Nil
        input = Types::PutBucketLifecycleRequest.new(bucket: bucket, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, lifecycle_configuration: lifecycle_configuration)
        put_bucket_lifecycle(input)
      end
      def put_bucket_lifecycle(input : Types::PutBucketLifecycleRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_LIFECYCLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a new lifecycle configuration for the bucket or replaces an existing lifecycle
      # configuration. Keep in mind that this will overwrite an existing lifecycle configuration, so if you
      # want to retain any configuration details, they must be included in the new lifecycle configuration.
      # For information about lifecycle configuration, see Managing your storage lifecycle . Bucket
      # lifecycle configuration now supports specifying a lifecycle rule using an object key name prefix,
      # one or more object tags, object size, or any combination of these. Accordingly, this section
      # describes the latest API. The previous version of the API supported filtering based only on an
      # object key name prefix, which is supported for backward compatibility. For the related API
      # description, see PutBucketLifecycle . Rules Permissions HTTP Host header syntax You specify the
      # lifecycle configuration in your request body. The lifecycle configuration is specified as XML
      # consisting of one or more rules. An Amazon S3 Lifecycle configuration can have up to 1,000 rules.
      # This limit is not adjustable. Bucket lifecycle configuration supports specifying a lifecycle rule
      # using an object key name prefix, one or more object tags, object size, or any combination of these.
      # Accordingly, this section describes the latest API. The previous version of the API supported
      # filtering based only on an object key name prefix, which is supported for backward compatibility for
      # general purpose buckets. For the related API description, see PutBucketLifecycle . Lifecyle
      # configurations for directory buckets only support expiring objects and cancelling multipart uploads.
      # Expiring of versioned objects,transitions and tag filters are not supported. A lifecycle rule
      # consists of the following: A filter identifying a subset of objects to which the rule applies. The
      # filter can be based on a key name prefix, object tags, object size, or any combination of these. A
      # status indicating whether the rule is in effect. One or more lifecycle transition and expiration
      # actions that you want Amazon S3 to perform on the objects identified by the filter. If the state of
      # your bucket is versioning-enabled or versioning-suspended, you can have many versions of the same
      # object (one current version and zero or more noncurrent versions). Amazon S3 provides predefined
      # actions that you can specify for current and noncurrent object versions. For more information, see
      # Object Lifecycle Management and Lifecycle Configuration Elements . General purpose bucket
      # permissions - By default, all Amazon S3 resources are private, including buckets, objects, and
      # related subresources (for example, lifecycle configuration and website configuration). Only the
      # resource owner (that is, the Amazon Web Services account that created it) can access the resource.
      # The resource owner can optionally grant access permissions to others by writing an access policy.
      # For this operation, a user must have the s3:PutLifecycleConfiguration permission. You can also
      # explicitly deny permissions. An explicit deny also supersedes any other permissions. If you want to
      # block users or accounts from removing or deleting objects from your bucket, you must deny them
      # permissions for the following actions: s3:DeleteObject s3:DeleteObjectVersion
      # s3:PutLifecycleConfiguration For more information about permissions, see Managing Access Permissions
      # to Your Amazon S3 Resources . Directory bucket permissions - You must have the
      # s3express:PutLifecycleConfiguration permission in an IAM identity-based policy to use this
      # operation. Cross-account access to this API operation isn't supported. The resource owner can
      # optionally grant access permissions to others by creating a role or user for them as long as they
      # are within the same account as the owner and resource. For more information about directory bucket
      # policies and permissions, see Authorizing Regional endpoint APIs with IAM in the Amazon S3 User
      # Guide . Directory buckets - For directory buckets, you must make requests for this API operation to
      # the Regional endpoint. These endpoints support path-style requests in the format
      # https://s3express-control. region-code .amazonaws.com/ bucket-name . Virtual-hosted-style requests
      # aren't supported. For more information about endpoints in Availability Zones, see Regional and Zonal
      # endpoints for directory buckets in Availability Zones in the Amazon S3 User Guide . For more
      # information about endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the
      # Amazon S3 User Guide . Directory buckets - The HTTP Host header syntax is s3express-control. region
      # .amazonaws.com . The following operations are related to PutBucketLifecycleConfiguration :
      # GetBucketLifecycleConfiguration DeleteBucketLifecycle You must URL encode any signed header values
      # that contain spaces. For example, if your header value is my file.txt , containing two spaces after
      # my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_lifecycle_configuration(
        bucket : String,
        checksum_algorithm : String? = nil,
        expected_bucket_owner : String? = nil,
        lifecycle_configuration : Types::BucketLifecycleConfiguration? = nil,
        transition_default_minimum_object_size : String? = nil
      ) : Types::PutBucketLifecycleConfigurationOutput
        input = Types::PutBucketLifecycleConfigurationRequest.new(bucket: bucket, checksum_algorithm: checksum_algorithm, expected_bucket_owner: expected_bucket_owner, lifecycle_configuration: lifecycle_configuration, transition_default_minimum_object_size: transition_default_minimum_object_size)
        put_bucket_lifecycle_configuration(input)
      end
      def put_bucket_lifecycle_configuration(input : Types::PutBucketLifecycleConfigurationRequest) : Types::PutBucketLifecycleConfigurationOutput
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_LIFECYCLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutBucketLifecycleConfigurationOutput, "PutBucketLifecycleConfiguration")
      end

      # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email Grantee
      # Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request after October
      # 1, 2025, the request will receive an HTTP 405 (Method Not Allowed) error. This change affects the
      # following Amazon Web Services Regions: US East (N. Virginia), US West (N. California), US West
      # (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland),
      # and South America (São Paulo). This operation is not supported for directory buckets. Set the
      # logging parameters for a bucket and to specify permissions for who can view and modify the logging
      # parameters. All logs are saved to buckets in the same Amazon Web Services Region as the source
      # bucket. To set the logging status of a bucket, you must be the bucket owner. The bucket owner is
      # automatically granted FULL_CONTROL to all logs. You use the Grantee request element to grant access
      # to other people. The Permissions request element specifies the kind of access the grantee has to the
      # logs. If the target bucket for log delivery uses the bucket owner enforced setting for S3 Object
      # Ownership, you can't use the Grantee request element to grant access to others. Permissions can only
      # be granted using policies. For more information, see Permissions for server access log delivery in
      # the Amazon S3 User Guide . Grantee Values You can specify the person (grantee) to whom you're
      # assigning access rights (by using request elements) in the following ways. For examples of how to
      # specify these grantee values in JSON format, see the Amazon Web Services CLI example in Enabling
      # Amazon S3 server access logging in the Amazon S3 User Guide . By the person's ID: &lt;Grantee
      # xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
      # &lt;/Grantee&gt; DisplayName is optional and ignored in the request. By Email address: &lt;Grantee
      # xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;&lt;/Grantee&gt;
      # The grantee is resolved to the CanonicalUser and, in a response to a GETObjectAcl request, appears
      # as the CanonicalUser. By URI: &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;
      # To enable logging, you use LoggingEnabled and its children request elements. To disable logging, you
      # use an empty BucketLoggingStatus request element: &lt;BucketLoggingStatus
      # xmlns="http://doc.s3.amazonaws.com/2006-03-01" /&gt; For more information about server access
      # logging, see Server Access Logging in the Amazon S3 User Guide . For more information about creating
      # a bucket, see CreateBucket . For more information about returning the logging status of a bucket,
      # see GetBucketLogging . The following operations are related to PutBucketLogging : PutObject
      # DeleteBucket CreateBucket GetBucketLogging You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def put_bucket_logging(
        bucket : String,
        bucket_logging_status : Types::BucketLoggingStatus,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketLoggingRequest.new(bucket: bucket, bucket_logging_status: bucket_logging_status, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_logging(input)
      end
      def put_bucket_logging(input : Types::PutBucketLoggingRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_LOGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets a metrics configuration (specified by
      # the metrics configuration ID) for the bucket. You can have up to 1,000 metrics configurations per
      # bucket. If you're updating an existing metrics configuration, note that this is a full replacement
      # of the existing metrics configuration. If you don't include the elements you want to keep, they are
      # erased. To use this operation, you must have permissions to perform the s3:PutMetricsConfiguration
      # action. The bucket owner has this permission by default. The bucket owner can grant this permission
      # to others. For more information about permissions, see Permissions Related to Bucket Subresource
      # Operations and Managing Access Permissions to Your Amazon S3 Resources . For information about
      # CloudWatch request metrics for Amazon S3, see Monitoring Metrics with Amazon CloudWatch . The
      # following operations are related to PutBucketMetricsConfiguration : DeleteBucketMetricsConfiguration
      # GetBucketMetricsConfiguration ListBucketMetricsConfigurations PutBucketMetricsConfiguration has the
      # following special error: Error code: TooManyConfigurations Description: You are attempting to create
      # a new configuration but have already reached the 1,000-configuration limit. HTTP Status Code: HTTP
      # 400 Bad Request You must URL encode any signed header values that contain spaces. For example, if
      # your header value is my file.txt , containing two spaces after my , you must URL encode this value
      # to my%20%20file.txt .
      def put_bucket_metrics_configuration(
        bucket : String,
        id : String,
        metrics_configuration : Types::MetricsConfiguration,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketMetricsConfigurationRequest.new(bucket: bucket, id: id, metrics_configuration: metrics_configuration, expected_bucket_owner: expected_bucket_owner)
        put_bucket_metrics_configuration(input)
      end
      def put_bucket_metrics_configuration(input : Types::PutBucketMetricsConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_METRICS_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. No longer used, see the
      # PutBucketNotificationConfiguration operation.
      def put_bucket_notification(
        bucket : String,
        notification_configuration : Types::NotificationConfigurationDeprecated,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketNotificationRequest.new(bucket: bucket, notification_configuration: notification_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_notification(input)
      end
      def put_bucket_notification(input : Types::PutBucketNotificationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Enables notifications of specified events for
      # a bucket. For more information about event notifications, see Configuring Event Notifications .
      # Using this API, you can replace an existing notification configuration. The configuration is an XML
      # file that defines the event types that you want Amazon S3 to publish and the destination where you
      # want Amazon S3 to publish an event notification when it detects an event of the specified type. By
      # default, your bucket has no event notifications configured. That is, the notification configuration
      # will be an empty NotificationConfiguration . &lt;NotificationConfiguration&gt;
      # &lt;/NotificationConfiguration&gt; This action replaces the existing notification configuration with
      # the configuration you include in the request body. After Amazon S3 receives this request, it first
      # verifies that any Amazon Simple Notification Service (Amazon SNS) or Amazon Simple Queue Service
      # (Amazon SQS) destination exists, and that the bucket owner has permission to publish to it by
      # sending a test notification. In the case of Lambda destinations, Amazon S3 verifies that the Lambda
      # function permissions grant Amazon S3 permission to invoke the function from the Amazon S3 bucket.
      # For more information, see Configuring Notifications for Amazon S3 Events . You can disable
      # notifications by adding the empty NotificationConfiguration element. For more information about the
      # number of event notification configurations that you can create per bucket, see Amazon S3 service
      # quotas in Amazon Web Services General Reference . By default, only the bucket owner can configure
      # notifications on a bucket. However, bucket owners can use a bucket policy to grant permission to
      # other users to set this configuration with the required s3:PutBucketNotification permission. The PUT
      # notification is an atomic operation. For example, suppose your notification configuration includes
      # SNS topic, SQS queue, and Lambda function configurations. When you send a PUT request with this
      # configuration, Amazon S3 sends test messages to your SNS topic. If the message fails, the entire PUT
      # action will fail, and Amazon S3 will not add the configuration to your bucket. If the configuration
      # in the request body includes only one TopicConfiguration specifying only the
      # s3:ReducedRedundancyLostObject event type, the response will also include the
      # x-amz-sns-test-message-id header containing the message ID of the test notification sent to the
      # topic. The following action is related to PutBucketNotificationConfiguration :
      # GetBucketNotificationConfiguration You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def put_bucket_notification_configuration(
        bucket : String,
        notification_configuration : Types::NotificationConfiguration,
        expected_bucket_owner : String? = nil,
        skip_destination_validation : Bool? = nil
      ) : Nil
        input = Types::PutBucketNotificationConfigurationRequest.new(bucket: bucket, notification_configuration: notification_configuration, expected_bucket_owner: expected_bucket_owner, skip_destination_validation: skip_destination_validation)
        put_bucket_notification_configuration(input)
      end
      def put_bucket_notification_configuration(input : Types::PutBucketNotificationConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_NOTIFICATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Creates or modifies OwnershipControls for an
      # Amazon S3 bucket. To use this operation, you must have the s3:PutBucketOwnershipControls permission.
      # For more information about Amazon S3 permissions, see Specifying permissions in a policy . For
      # information about Amazon S3 Object Ownership, see Using object ownership . The following operations
      # are related to PutBucketOwnershipControls : GetBucketOwnershipControls DeleteBucketOwnershipControls
      # You must URL encode any signed header values that contain spaces. For example, if your header value
      # is my file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt
      # .
      def put_bucket_ownership_controls(
        bucket : String,
        ownership_controls : Types::OwnershipControls,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketOwnershipControlsRequest.new(bucket: bucket, ownership_controls: ownership_controls, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_ownership_controls(input)
      end
      def put_bucket_ownership_controls(input : Types::PutBucketOwnershipControlsRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_OWNERSHIP_CONTROLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Applies an Amazon S3 bucket policy to an Amazon S3 bucket. Directory buckets - For directory
      # buckets, you must make requests for this API operation to the Regional endpoint. These endpoints
      # support path-style requests in the format https://s3express-control. region-code .amazonaws.com/
      # bucket-name . Virtual-hosted-style requests aren't supported. For more information about endpoints
      # in Availability Zones, see Regional and Zonal endpoints for directory buckets in Availability Zones
      # in the Amazon S3 User Guide . For more information about endpoints in Local Zones, see Concepts for
      # directory buckets in Local Zones in the Amazon S3 User Guide . Permissions If you are using an
      # identity other than the root user of the Amazon Web Services account that owns the bucket, the
      # calling identity must both have the PutBucketPolicy permissions on the specified bucket and belong
      # to the bucket owner's account in order to use this operation. If you don't have PutBucketPolicy
      # permissions, Amazon S3 returns a 403 Access Denied error. If you have the correct permissions, but
      # you're not using an identity that belongs to the bucket owner's account, Amazon S3 returns a 405
      # Method Not Allowed error. To ensure that bucket owners don't inadvertently lock themselves out of
      # their own buckets, the root principal in a bucket owner's Amazon Web Services account can perform
      # the GetBucketPolicy , PutBucketPolicy , and DeleteBucketPolicy API actions, even if their bucket
      # policy explicitly denies the root principal's access. Bucket owner root principals can only be
      # blocked from performing these API actions by VPC endpoint policies and Amazon Web Services
      # Organizations policies. General purpose bucket permissions - The s3:PutBucketPolicy permission is
      # required in a policy. For more information about general purpose buckets bucket policies, see Using
      # Bucket Policies and User Policies in the Amazon S3 User Guide . Directory bucket permissions - To
      # grant access to this API operation, you must have the s3express:PutBucketPolicy permission in an IAM
      # identity-based policy instead of a bucket policy. Cross-account access to this API operation isn't
      # supported. This operation can only be performed by the Amazon Web Services account that owns the
      # resource. For more information about directory bucket policies and permissions, see Amazon Web
      # Services Identity and Access Management (IAM) for S3 Express One Zone in the Amazon S3 User Guide .
      # Example bucket policies General purpose buckets example bucket policies - See Bucket policy examples
      # in the Amazon S3 User Guide . Directory bucket example bucket policies - See Example bucket policies
      # for S3 Express One Zone in the Amazon S3 User Guide . HTTP Host header syntax Directory buckets -
      # The HTTP Host header syntax is s3express-control. region-code .amazonaws.com . The following
      # operations are related to PutBucketPolicy : CreateBucket DeleteBucket You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_policy(
        bucket : String,
        policy : String,
        checksum_algorithm : String? = nil,
        confirm_remove_self_bucket_access : Bool? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketPolicyRequest.new(bucket: bucket, policy: policy, checksum_algorithm: checksum_algorithm, confirm_remove_self_bucket_access: confirm_remove_self_bucket_access, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_policy(input)
      end
      def put_bucket_policy(input : Types::PutBucketPolicyRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Creates a replication configuration or
      # replaces an existing one. For more information, see Replication in the Amazon S3 User Guide .
      # Specify the replication configuration in the request body. In the replication configuration, you
      # provide the name of the destination bucket or buckets where you want Amazon S3 to replicate objects,
      # the IAM role that Amazon S3 can assume to replicate objects on your behalf, and other relevant
      # information. You can invoke this request for a specific Amazon Web Services Region by using the
      # aws:RequestedRegion condition key. A replication configuration must include at least one rule, and
      # can contain a maximum of 1,000. Each rule identifies a subset of objects to replicate by filtering
      # the objects in the source bucket. To choose additional subsets of objects to replicate, add a rule
      # for each subset. To specify a subset of the objects in the source bucket to apply a replication rule
      # to, add the Filter element as a child of the Rule element. You can filter objects based on an object
      # key prefix, one or more object tags, or both. When you add the Filter element in the configuration,
      # you must also add the following elements: DeleteMarkerReplication , Status , and Priority . If you
      # are using an earlier version of the replication configuration, Amazon S3 handles replication of
      # delete markers differently. For more information, see Backward Compatibility . For information about
      # enabling versioning on a bucket, see Using Versioning . Handling Replication of Encrypted Objects By
      # default, Amazon S3 doesn't replicate objects that are stored at rest using server-side encryption
      # with KMS keys. To replicate Amazon Web Services KMS-encrypted objects, add the following:
      # SourceSelectionCriteria , SseKmsEncryptedObjects , Status , EncryptionConfiguration , and
      # ReplicaKmsKeyID . For information about replication configuration, see Replicating Objects Created
      # with SSE Using KMS keys . For information on PutBucketReplication errors, see List of
      # replication-related error codes Permissions To create a PutBucketReplication request, you must have
      # s3:PutReplicationConfiguration permissions for the bucket. By default, a resource owner, in this
      # case the Amazon Web Services account that created the bucket, can perform this operation. The
      # resource owner can also grant others permissions to perform the operation. For more information
      # about permissions, see Specifying Permissions in a Policy and Managing Access Permissions to Your
      # Amazon S3 Resources . To perform this operation, the user or role performing the action must have
      # the iam:PassRole permission. The following operations are related to PutBucketReplication :
      # GetBucketReplication DeleteBucketReplication You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def put_bucket_replication(
        bucket : String,
        replication_configuration : Types::ReplicationConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        token : String? = nil
      ) : Nil
        input = Types::PutBucketReplicationRequest.new(bucket: bucket, replication_configuration: replication_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, token: token)
        put_bucket_replication(input)
      end
      def put_bucket_replication(input : Types::PutBucketReplicationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets the request payment configuration for a
      # bucket. By default, the bucket owner pays for downloads from the bucket. This configuration
      # parameter enables the bucket owner (only) to specify that the person requesting the download will be
      # charged for the download. For more information, see Requester Pays Buckets . The following
      # operations are related to PutBucketRequestPayment : CreateBucket GetBucketRequestPayment You must
      # URL encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_request_payment(
        bucket : String,
        request_payment_configuration : Types::RequestPaymentConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketRequestPaymentRequest.new(bucket: bucket, request_payment_configuration: request_payment_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_request_payment(input)
      end
      def put_bucket_request_payment(input : Types::PutBucketRequestPaymentRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_REQUEST_PAYMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets the tags for a general purpose bucket if
      # attribute based access control (ABAC) is not enabled for the bucket. When you enable ABAC for a
      # general purpose bucket , you can no longer use this operation for that bucket and must use the
      # TagResource or UntagResource operations instead. Use tags to organize your Amazon Web Services bill
      # to reflect your own cost structure. To do this, sign up to get your Amazon Web Services account bill
      # with tag key values included. Then, to see the cost of combined resources, organize your billing
      # information according to resources with the same tag key values. For example, you can tag several
      # resources with a specific application name, and then organize your billing information to see the
      # total cost of that application across several services. For more information, see Cost Allocation
      # and Tagging and Using Cost Allocation in Amazon S3 Bucket Tags . When this operation sets the tags
      # for a bucket, it will overwrite any current tags the bucket already has. You cannot use this
      # operation to add tags to an existing list of tags. To use this operation, you must have permissions
      # to perform the s3:PutBucketTagging action. The bucket owner has this permission by default and can
      # grant this permission to others. For more information about permissions, see Permissions Related to
      # Bucket Subresource Operations and Managing Access Permissions to Your Amazon S3 Resources .
      # PutBucketTagging has the following special errors. For more Amazon S3 errors see, Error Responses .
      # InvalidTag - The tag provided was not a valid tag. This error can occur if the tag did not pass
      # input validation. For more information, see Using Cost Allocation in Amazon S3 Bucket Tags .
      # MalformedXML - The XML provided does not match the schema. OperationAborted - A conflicting
      # conditional action is currently in progress against this resource. Please try again. InternalError -
      # The service was unable to apply the provided tag to the bucket. The following operations are related
      # to PutBucketTagging : GetBucketTagging DeleteBucketTagging You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_tagging(
        bucket : String,
        tagging : Types::Tagging,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketTaggingRequest.new(bucket: bucket, tagging: tagging, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_tagging(input)
      end
      def put_bucket_tagging(input : Types::PutBucketTaggingRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. When you enable versioning on a bucket for
      # the first time, it might take a short amount of time for the change to be fully propagated. While
      # this change is propagating, you might encounter intermittent HTTP 404 NoSuchKey errors for requests
      # to objects created or updated after enabling versioning. We recommend that you wait for 15 minutes
      # after enabling versioning before issuing write operations ( PUT or DELETE ) on objects in the
      # bucket. Sets the versioning state of an existing bucket. You can set the versioning state with one
      # of the following values: Enabled —Enables versioning for the objects in the bucket. All objects
      # added to the bucket receive a unique version ID. Suspended —Disables versioning for the objects in
      # the bucket. All objects added to the bucket receive the version ID null. If the versioning state has
      # never been set on a bucket, it has no versioning state; a GetBucketVersioning request does not
      # return a versioning state value. In order to enable MFA Delete, you must be the bucket owner. If you
      # are the bucket owner and want to enable MFA Delete in the bucket versioning configuration, you must
      # include the x-amz-mfa request header and the Status and the MfaDelete request elements in a request
      # to set the versioning state of the bucket. If you have an object expiration lifecycle configuration
      # in your non-versioned bucket and you want to maintain the same permanent delete behavior when you
      # enable versioning, you must add a noncurrent expiration policy. The noncurrent expiration lifecycle
      # configuration will manage the deletes of the noncurrent object versions in the version-enabled
      # bucket. (A version-enabled bucket maintains one current and zero or more noncurrent object
      # versions.) For more information, see Lifecycle and Versioning . The following operations are related
      # to PutBucketVersioning : CreateBucket DeleteBucket GetBucketVersioning You must URL encode any
      # signed header values that contain spaces. For example, if your header value is my file.txt ,
      # containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_versioning(
        bucket : String,
        versioning_configuration : Types::VersioningConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        mfa : String? = nil
      ) : Nil
        input = Types::PutBucketVersioningRequest.new(bucket: bucket, versioning_configuration: versioning_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, mfa: mfa)
        put_bucket_versioning(input)
      end
      def put_bucket_versioning(input : Types::PutBucketVersioningRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_VERSIONING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # This operation is not supported for directory buckets. Sets the configuration of the website that is
      # specified in the website subresource. To configure a bucket as a website, you can add this
      # subresource on the bucket with website configuration information such as the file name of the index
      # document and any redirect rules. For more information, see Hosting Websites on Amazon S3 . This PUT
      # action requires the S3:PutBucketWebsite permission. By default, only the bucket owner can configure
      # the website attached to a bucket; however, bucket owners can allow other users to set the website
      # configuration by writing a bucket policy that grants them the S3:PutBucketWebsite permission. To
      # redirect all website requests sent to the bucket's website endpoint, you add a website configuration
      # with the following elements. Because all requests are sent to another website, you don't need to
      # provide index document name for the bucket. WebsiteConfiguration RedirectAllRequestsTo HostName
      # Protocol If you want granular control over redirects, you can use the following elements to add
      # routing rules that describe conditions for redirecting requests and information about the redirect
      # destination. In this case, the website configuration must provide an index document for the bucket,
      # because some requests might not be redirected. WebsiteConfiguration IndexDocument Suffix
      # ErrorDocument Key RoutingRules RoutingRule Condition HttpErrorCodeReturnedEquals KeyPrefixEquals
      # Redirect Protocol HostName ReplaceKeyPrefixWith ReplaceKeyWith HttpRedirectCode Amazon S3 has a
      # limitation of 50 routing rules per website configuration. If you require more than 50 routing rules,
      # you can use object redirect. For more information, see Configuring an Object Redirect in the Amazon
      # S3 User Guide . The maximum request length is limited to 128 KB. You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def put_bucket_website(
        bucket : String,
        website_configuration : Types::WebsiteConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutBucketWebsiteRequest.new(bucket: bucket, website_configuration: website_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_bucket_website(input)
      end
      def put_bucket_website(input : Types::PutBucketWebsiteRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_BUCKET_WEBSITE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email Grantee
      # Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request after October
      # 1, 2025, the request will receive an HTTP 405 (Method Not Allowed) error. This change affects the
      # following Amazon Web Services Regions: US East (N. Virginia), US West (N. California), US West
      # (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland),
      # and South America (São Paulo). Adds an object to a bucket. Amazon S3 never adds partial objects; if
      # you receive a success response, Amazon S3 added the entire object to the bucket. You cannot use
      # PutObject to only update a single piece of metadata for an existing object. You must put the entire
      # object with updated metadata if you want to update some values. If your bucket uses the bucket owner
      # enforced setting for Object Ownership, ACLs are disabled and no longer affect permissions. All
      # objects written to the bucket by any account will be owned by the bucket owner. Directory buckets -
      # For directory buckets, you must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket
      # .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests are not supported.
      # For more information about endpoints in Availability Zones, see Regional and Zonal endpoints for
      # directory buckets in Availability Zones in the Amazon S3 User Guide . For more information about
      # endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User
      # Guide . Amazon S3 is a distributed system. If it receives multiple write requests for the same
      # object simultaneously, it overwrites all but the last object written. However, Amazon S3 provides
      # features that can modify this behavior: S3 Object Lock - To prevent objects from being deleted or
      # overwritten, you can use Amazon S3 Object Lock in the Amazon S3 User Guide . This functionality is
      # not supported for directory buckets. If-None-Match - Uploads the object only if the object key name
      # does not already exist in the specified bucket. Otherwise, Amazon S3 returns a 412 Precondition
      # Failed error. If a conflicting operation occurs during the upload, S3 returns a 409
      # ConditionalRequestConflict response. On a 409 failure, retry the upload. Expects the * character
      # (asterisk). For more information, see Add preconditions to S3 operations with conditional requests
      # in the Amazon S3 User Guide or RFC 7232 . This functionality is not supported for S3 on Outposts. S3
      # Versioning - When you enable versioning for a bucket, if Amazon S3 receives multiple write requests
      # for the same object simultaneously, it stores all versions of the objects. For each write request
      # that is made to the same object, Amazon S3 automatically generates a unique version ID of that
      # object being stored in Amazon S3. You can retrieve, replace, or delete any version of the object.
      # For more information about versioning, see Adding Objects to Versioning-Enabled Buckets in the
      # Amazon S3 User Guide . For information about returning the versioning state of a bucket, see
      # GetBucketVersioning . This functionality is not supported for directory buckets. Permissions General
      # purpose bucket permissions - The following permissions are required in your policies when your
      # PutObject request includes specific headers. s3:PutObject - To successfully complete the PutObject
      # request, you must always have the s3:PutObject permission on a bucket to add an object to it.
      # s3:PutObjectAcl - To successfully change the objects ACL of your PutObject request, you must have
      # the s3:PutObjectAcl . s3:PutObjectTagging - To successfully set the tag-set with your PutObject
      # request, you must have the s3:PutObjectTagging . Directory bucket permissions - To grant access to
      # this API operation on a directory bucket, we recommend that you use the CreateSession API operation
      # for session-based authorization. Specifically, you grant the s3express:CreateSession permission to
      # the directory bucket in a bucket policy or an IAM identity-based policy. Then, you make the
      # CreateSession API call on the bucket to obtain a session token. With the session token in your
      # request header, you can make API requests to this operation. After the session token expires, you
      # make another CreateSession API call to generate a new session token for use. Amazon Web Services CLI
      # or SDKs create session and refresh the session token automatically to avoid service interruptions
      # when a session expires. For more information about authorization, see CreateSession . If the object
      # is encrypted with SSE-KMS, you must also have the kms:GenerateDataKey and kms:Decrypt permissions in
      # IAM identity-based policies and KMS key policies for the KMS key. Data integrity with Content-MD5
      # General purpose bucket - To ensure that data is not corrupted traversing the network, use the
      # Content-MD5 header. When you use this header, Amazon S3 checks the object against the provided MD5
      # value and, if they do not match, Amazon S3 returns an error. Alternatively, when the object's ETag
      # is its MD5 digest, you can calculate the MD5 while putting the object to Amazon S3 and compare the
      # returned ETag to the calculated MD5 value. Directory bucket - This functionality is not supported
      # for directory buckets. HTTP Host header syntax Directory buckets - The HTTP Host header syntax is
      # Bucket-name .s3express- zone-id . region-code .amazonaws.com . For more information about related
      # Amazon S3 APIs, see the following: CopyObject DeleteObject You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def put_object(
        bucket : String,
        key : String,
        acl : String? = nil,
        body : Bytes? = nil,
        bucket_key_enabled : Bool? = nil,
        cache_control : String? = nil,
        checksum_algorithm : String? = nil,
        checksum_crc32 : String? = nil,
        checksum_crc32_c : String? = nil,
        checksum_crc64_nvme : String? = nil,
        checksum_sha1 : String? = nil,
        checksum_sha256 : String? = nil,
        content_disposition : String? = nil,
        content_encoding : String? = nil,
        content_language : String? = nil,
        content_length : Int64? = nil,
        content_md5 : String? = nil,
        content_type : String? = nil,
        expected_bucket_owner : String? = nil,
        expires : String? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write_acp : String? = nil,
        if_match : String? = nil,
        if_none_match : String? = nil,
        metadata : Hash(String, String)? = nil,
        object_lock_legal_hold_status : String? = nil,
        object_lock_mode : String? = nil,
        object_lock_retain_until_date : Time? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        ssekms_encryption_context : String? = nil,
        ssekms_key_id : String? = nil,
        server_side_encryption : String? = nil,
        storage_class : String? = nil,
        tagging : String? = nil,
        website_redirect_location : String? = nil,
        write_offset_bytes : Int64? = nil
      ) : Types::PutObjectOutput
        input = Types::PutObjectRequest.new(bucket: bucket, key: key, acl: acl, body: body, bucket_key_enabled: bucket_key_enabled, cache_control: cache_control, checksum_algorithm: checksum_algorithm, checksum_crc32: checksum_crc32, checksum_crc32_c: checksum_crc32_c, checksum_crc64_nvme: checksum_crc64_nvme, checksum_sha1: checksum_sha1, checksum_sha256: checksum_sha256, content_disposition: content_disposition, content_encoding: content_encoding, content_language: content_language, content_length: content_length, content_md5: content_md5, content_type: content_type, expected_bucket_owner: expected_bucket_owner, expires: expires, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write_acp: grant_write_acp, if_match: if_match, if_none_match: if_none_match, metadata: metadata, object_lock_legal_hold_status: object_lock_legal_hold_status, object_lock_mode: object_lock_mode, object_lock_retain_until_date: object_lock_retain_until_date, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, ssekms_encryption_context: ssekms_encryption_context, ssekms_key_id: ssekms_key_id, server_side_encryption: server_side_encryption, storage_class: storage_class, tagging: tagging, website_redirect_location: website_redirect_location, write_offset_bytes: write_offset_bytes)
        put_object(input)
      end
      def put_object(input : Types::PutObjectRequest) : Types::PutObjectOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectOutput, "PutObject")
      end

      # End of support notice: As of October 1, 2025, Amazon S3 has discontinued support for Email Grantee
      # Access Control Lists (ACLs). If you attempt to use an Email Grantee ACL in a request after October
      # 1, 2025, the request will receive an HTTP 405 (Method Not Allowed) error. This change affects the
      # following Amazon Web Services Regions: US East (N. Virginia), US West (N. California), US West
      # (Oregon), Asia Pacific (Singapore), Asia Pacific (Sydney), Asia Pacific (Tokyo), Europe (Ireland),
      # and South America (São Paulo). This operation is not supported for directory buckets. Uses the acl
      # subresource to set the access control list (ACL) permissions for a new or existing object in an S3
      # bucket. You must have the WRITE_ACP permission to set the ACL of an object. For more information,
      # see What permissions can I grant? in the Amazon S3 User Guide . This functionality is not supported
      # for Amazon S3 on Outposts. Depending on your application needs, you can choose to set the ACL on an
      # object using either the request body or the headers. For example, if you have an existing
      # application that updates a bucket ACL using the request body, you can continue to use that approach.
      # For more information, see Access Control List (ACL) Overview in the Amazon S3 User Guide . If your
      # bucket uses the bucket owner enforced setting for S3 Object Ownership, ACLs are disabled and no
      # longer affect permissions. You must use policies to grant access to your bucket and the objects in
      # it. Requests to set ACLs or update ACLs fail and return the AccessControlListNotSupported error
      # code. Requests to read ACLs are still supported. For more information, see Controlling object
      # ownership in the Amazon S3 User Guide . Permissions You can set access permissions using one of the
      # following methods: Specify a canned ACL with the x-amz-acl request header. Amazon S3 supports a set
      # of predefined ACLs, known as canned ACLs. Each canned ACL has a predefined set of grantees and
      # permissions. Specify the canned ACL name as the value of x-amz-ac l. If you use this header, you
      # cannot use other access control-specific headers in your request. For more information, see Canned
      # ACL . Specify access permissions explicitly with the x-amz-grant-read , x-amz-grant-read-acp ,
      # x-amz-grant-write-acp , and x-amz-grant-full-control headers. When using these headers, you specify
      # explicit access permissions and grantees (Amazon Web Services accounts or Amazon S3 groups) who will
      # receive the permission. If you use these ACL-specific headers, you cannot use x-amz-acl header to
      # set a canned ACL. These parameters map to the set of permissions that Amazon S3 supports in an ACL.
      # For more information, see Access Control List (ACL) Overview . You specify each grantee as a
      # type=value pair, where the type is one of the following: id – if the value specified is the
      # canonical user ID of an Amazon Web Services account uri – if you are granting permissions to a
      # predefined group emailAddress – if the value specified is the email address of an Amazon Web
      # Services account Using email addresses to specify a grantee is only supported in the following
      # Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West (Oregon) Asia
      # Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South America (São
      # Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and Endpoints in
      # the Amazon Web Services General Reference. For example, the following x-amz-grant-read header grants
      # list objects permission to the two Amazon Web Services accounts identified by their email addresses.
      # x-amz-grant-read: emailAddress="xyz@amazon.com", emailAddress="abc@amazon.com" You can use either a
      # canned ACL or specify access permissions explicitly. You cannot do both. Grantee Values You can
      # specify the person (grantee) to whom you're assigning access rights (using request elements) in the
      # following ways. For examples of how to specify these grantee values in JSON format, see the Amazon
      # Web Services CLI example in Enabling Amazon S3 server access logging in the Amazon S3 User Guide .
      # By the person's ID: &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="CanonicalUser"&gt;&lt;ID&gt;&lt;&gt;ID&lt;&gt;&lt;/ID&gt;&lt;DisplayName&gt;&lt;&gt;GranteesEmail&lt;&gt;&lt;/DisplayName&gt;
      # &lt;/Grantee&gt; DisplayName is optional and ignored in the request. By URI: &lt;Grantee
      # xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="Group"&gt;&lt;URI&gt;&lt;&gt;http://acs.amazonaws.com/groups/global/AuthenticatedUsers&lt;&gt;&lt;/URI&gt;&lt;/Grantee&gt;
      # By Email address: &lt;Grantee xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      # xsi:type="AmazonCustomerByEmail"&gt;&lt;EmailAddress&gt;&lt;&gt;Grantees@email.com&lt;&gt;&lt;/EmailAddress&gt;lt;/Grantee&gt;
      # The grantee is resolved to the CanonicalUser and, in a response to a GET Object acl request, appears
      # as the CanonicalUser. Using email addresses to specify a grantee is only supported in the following
      # Amazon Web Services Regions: US East (N. Virginia) US West (N. California) US West (Oregon) Asia
      # Pacific (Singapore) Asia Pacific (Sydney) Asia Pacific (Tokyo) Europe (Ireland) South America (São
      # Paulo) For a list of all the Amazon S3 supported Regions and endpoints, see Regions and Endpoints in
      # the Amazon Web Services General Reference. Versioning The ACL of an object is set at the object
      # version level. By default, PUT sets the ACL of the current version of an object. To set the ACL of a
      # different version, use the versionId subresource. The following operations are related to
      # PutObjectAcl : CopyObject GetObject You must URL encode any signed header values that contain
      # spaces. For example, if your header value is my file.txt , containing two spaces after my , you must
      # URL encode this value to my%20%20file.txt .
      def put_object_acl(
        bucket : String,
        key : String,
        acl : String? = nil,
        access_control_policy : Types::AccessControlPolicy? = nil,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        grant_full_control : String? = nil,
        grant_read : String? = nil,
        grant_read_acp : String? = nil,
        grant_write : String? = nil,
        grant_write_acp : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::PutObjectAclOutput
        input = Types::PutObjectAclRequest.new(bucket: bucket, key: key, acl: acl, access_control_policy: access_control_policy, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, grant_full_control: grant_full_control, grant_read: grant_read, grant_read_acp: grant_read_acp, grant_write: grant_write, grant_write_acp: grant_write_acp, request_payer: request_payer, version_id: version_id)
        put_object_acl(input)
      end
      def put_object_acl(input : Types::PutObjectAclRequest) : Types::PutObjectAclOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectAclOutput, "PutObjectAcl")
      end

      # This operation is not supported for directory buckets. Applies a legal hold configuration to the
      # specified object. For more information, see Locking Objects . This functionality is not supported
      # for Amazon S3 on Outposts. You must URL encode any signed header values that contain spaces. For
      # example, if your header value is my file.txt , containing two spaces after my , you must URL encode
      # this value to my%20%20file.txt .
      def put_object_legal_hold(
        bucket : String,
        key : String,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        legal_hold : Types::ObjectLockLegalHold? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::PutObjectLegalHoldOutput
        input = Types::PutObjectLegalHoldRequest.new(bucket: bucket, key: key, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, legal_hold: legal_hold, request_payer: request_payer, version_id: version_id)
        put_object_legal_hold(input)
      end
      def put_object_legal_hold(input : Types::PutObjectLegalHoldRequest) : Types::PutObjectLegalHoldOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT_LEGAL_HOLD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectLegalHoldOutput, "PutObjectLegalHold")
      end

      # This operation is not supported for directory buckets. Places an Object Lock configuration on the
      # specified bucket. The rule specified in the Object Lock configuration will be applied by default to
      # every new object placed in the specified bucket. For more information, see Locking Objects . The
      # DefaultRetention settings require both a mode and a period. The DefaultRetention period can be
      # either Days or Years but you must select one. You cannot specify Days and Years at the same time.
      # You can enable Object Lock for new or existing buckets. For more information, see Configuring Object
      # Lock . You must URL encode any signed header values that contain spaces. For example, if your header
      # value is my file.txt , containing two spaces after my , you must URL encode this value to
      # my%20%20file.txt .
      def put_object_lock_configuration(
        bucket : String,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        object_lock_configuration : Types::ObjectLockConfiguration? = nil,
        request_payer : String? = nil,
        token : String? = nil
      ) : Types::PutObjectLockConfigurationOutput
        input = Types::PutObjectLockConfigurationRequest.new(bucket: bucket, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, object_lock_configuration: object_lock_configuration, request_payer: request_payer, token: token)
        put_object_lock_configuration(input)
      end
      def put_object_lock_configuration(input : Types::PutObjectLockConfigurationRequest) : Types::PutObjectLockConfigurationOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT_LOCK_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectLockConfigurationOutput, "PutObjectLockConfiguration")
      end

      # This operation is not supported for directory buckets. Places an Object Retention configuration on
      # an object. For more information, see Locking Objects . Users or accounts require the
      # s3:PutObjectRetention permission in order to place an Object Retention configuration on objects.
      # Bypassing a Governance Retention configuration requires the s3:BypassGovernanceRetention permission.
      # This functionality is not supported for Amazon S3 on Outposts. You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def put_object_retention(
        bucket : String,
        key : String,
        bypass_governance_retention : Bool? = nil,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        retention : Types::ObjectLockRetention? = nil,
        version_id : String? = nil
      ) : Types::PutObjectRetentionOutput
        input = Types::PutObjectRetentionRequest.new(bucket: bucket, key: key, bypass_governance_retention: bypass_governance_retention, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, retention: retention, version_id: version_id)
        put_object_retention(input)
      end
      def put_object_retention(input : Types::PutObjectRetentionRequest) : Types::PutObjectRetentionOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT_RETENTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectRetentionOutput, "PutObjectRetention")
      end

      # This operation is not supported for directory buckets. Sets the supplied tag-set to an object that
      # already exists in a bucket. A tag is a key-value pair. For more information, see Object Tagging .
      # You can associate tags with an object by sending a PUT request against the tagging subresource that
      # is associated with the object. You can retrieve tags by sending a GET request. For more information,
      # see GetObjectTagging . For tagging-related restrictions related to characters and encodings, see Tag
      # Restrictions . Note that Amazon S3 limits the maximum number of tags to 10 tags per object. To use
      # this operation, you must have permission to perform the s3:PutObjectTagging action. By default, the
      # bucket owner has this permission and can grant this permission to others. To put tags of any other
      # version, use the versionId query parameter. You also need permission for the
      # s3:PutObjectVersionTagging action. PutObjectTagging has the following special errors. For more
      # Amazon S3 errors see, Error Responses . InvalidTag - The tag provided was not a valid tag. This
      # error can occur if the tag did not pass input validation. For more information, see Object Tagging .
      # MalformedXML - The XML provided does not match the schema. OperationAborted - A conflicting
      # conditional action is currently in progress against this resource. Please try again. InternalError -
      # The service was unable to apply the provided tag to the object. The following operations are related
      # to PutObjectTagging : GetObjectTagging DeleteObjectTagging You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def put_object_tagging(
        bucket : String,
        key : String,
        tagging : Types::Tagging,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        version_id : String? = nil
      ) : Types::PutObjectTaggingOutput
        input = Types::PutObjectTaggingRequest.new(bucket: bucket, key: key, tagging: tagging, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, version_id: version_id)
        put_object_tagging(input)
      end
      def put_object_tagging(input : Types::PutObjectTaggingRequest) : Types::PutObjectTaggingOutput
        request = Protocol::RestXml.build_request(Model::PUT_OBJECT_TAGGING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::PutObjectTaggingOutput, "PutObjectTagging")
      end

      # This operation is not supported for directory buckets. Creates or modifies the PublicAccessBlock
      # configuration for an Amazon S3 bucket. To use this operation, you must have the
      # s3:PutBucketPublicAccessBlock permission. For more information about Amazon S3 permissions, see
      # Specifying Permissions in a Policy . When Amazon S3 evaluates the PublicAccessBlock configuration
      # for a bucket or an object, it checks the PublicAccessBlock configuration for both the bucket (or the
      # bucket that contains the object) and the bucket owner's account. Account-level settings
      # automatically inherit from organization-level policies when present. If the PublicAccessBlock
      # configurations are different between the bucket and the account, Amazon S3 uses the most restrictive
      # combination of the bucket-level and account-level settings. For more information about when Amazon
      # S3 considers a bucket or an object public, see The Meaning of "Public" . The following operations
      # are related to PutPublicAccessBlock : GetPublicAccessBlock DeletePublicAccessBlock
      # GetBucketPolicyStatus Using Amazon S3 Block Public Access You must URL encode any signed header
      # values that contain spaces. For example, if your header value is my file.txt , containing two spaces
      # after my , you must URL encode this value to my%20%20file.txt .
      def put_public_access_block(
        bucket : String,
        public_access_block_configuration : Types::PublicAccessBlockConfiguration,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::PutPublicAccessBlockRequest.new(bucket: bucket, public_access_block_configuration: public_access_block_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        put_public_access_block(input)
      end
      def put_public_access_block(input : Types::PutPublicAccessBlockRequest) : Nil
        request = Protocol::RestXml.build_request(Model::PUT_PUBLIC_ACCESS_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Renames an existing object in a directory bucket that uses the S3 Express One Zone storage class.
      # You can use RenameObject by specifying an existing object’s name as the source and the new name of
      # the object as the destination within the same directory bucket. RenameObject is only supported for
      # objects stored in the S3 Express One Zone storage class. To prevent overwriting an object, you can
      # use the If-None-Match conditional header. If-None-Match - Renames the object only if an object with
      # the specified name does not already exist in the directory bucket. If you don't want to overwrite an
      # existing object, you can add the If-None-Match conditional header with the value ‘*’ in the
      # RenameObject request. Amazon S3 then returns a 412 Precondition Failed error if the object with the
      # specified name already exists. For more information, see RFC 7232 . Permissions To grant access to
      # the RenameObject operation on a directory bucket, we recommend that you use the CreateSession
      # operation for session-based authorization. Specifically, you grant the s3express:CreateSession
      # permission to the directory bucket in a bucket policy or an IAM identity-based policy. Then, you
      # make the CreateSession API call on the directory bucket to obtain a session token. With the session
      # token in your request header, you can make API requests to this operation. After the session token
      # expires, you make another CreateSession API call to generate a new session token for use. The Amazon
      # Web Services CLI and SDKs will create and manage your session including refreshing the session token
      # automatically to avoid service interruptions when a session expires. In your bucket policy, you can
      # specify the s3express:SessionMode condition key to control who can create a ReadWrite or ReadOnly
      # session. A ReadWrite session is required for executing all the Zonal endpoint API operations,
      # including RenameObject . For more information about authorization, see CreateSession . To learn more
      # about Zonal endpoint API operations, see Authorizing Zonal endpoint API operations with
      # CreateSession in the Amazon S3 User Guide . HTTP Host header syntax Directory buckets - The HTTP
      # Host header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def rename_object(
        bucket : String,
        key : String,
        rename_source : String,
        client_token : String? = nil,
        destination_if_match : String? = nil,
        destination_if_modified_since : Time? = nil,
        destination_if_none_match : String? = nil,
        destination_if_unmodified_since : Time? = nil,
        source_if_match : String? = nil,
        source_if_modified_since : Time? = nil,
        source_if_none_match : String? = nil,
        source_if_unmodified_since : Time? = nil
      ) : Types::RenameObjectOutput
        input = Types::RenameObjectRequest.new(bucket: bucket, key: key, rename_source: rename_source, client_token: client_token, destination_if_match: destination_if_match, destination_if_modified_since: destination_if_modified_since, destination_if_none_match: destination_if_none_match, destination_if_unmodified_since: destination_if_unmodified_since, source_if_match: source_if_match, source_if_modified_since: source_if_modified_since, source_if_none_match: source_if_none_match, source_if_unmodified_since: source_if_unmodified_since)
        rename_object(input)
      end
      def rename_object(input : Types::RenameObjectRequest) : Types::RenameObjectOutput
        request = Protocol::RestXml.build_request(Model::RENAME_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::RenameObjectOutput, "RenameObject")
      end

      # This operation is not supported for directory buckets. Restores an archived copy of an object back
      # into Amazon S3 This functionality is not supported for Amazon S3 on Outposts. This action performs
      # the following types of requests: restore an archive - Restore an archived object For more
      # information about the S3 structure in the request body, see the following: PutObject Managing Access
      # with ACLs in the Amazon S3 User Guide Protecting Data Using Server-Side Encryption in the Amazon S3
      # User Guide Permissions To use this operation, you must have permissions to perform the
      # s3:RestoreObject action. The bucket owner has this permission by default and can grant this
      # permission to others. For more information about permissions, see Permissions Related to Bucket
      # Subresource Operations and Managing Access Permissions to Your Amazon S3 Resources in the Amazon S3
      # User Guide . Restoring objects Objects that you archive to the S3 Glacier Flexible Retrieval or S3
      # Glacier Deep Archive storage class, and S3 Intelligent-Tiering Archive or S3 Intelligent-Tiering
      # Deep Archive tiers, are not accessible in real time. For objects in the S3 Glacier Flexible
      # Retrieval or S3 Glacier Deep Archive storage classes, you must first initiate a restore request, and
      # then wait until a temporary copy of the object is available. If you want a permanent copy of the
      # object, create a copy of it in the Amazon S3 Standard storage class in your S3 bucket. To access an
      # archived object, you must restore the object for the duration (number of days) that you specify. For
      # objects in the Archive Access or Deep Archive Access tiers of S3 Intelligent-Tiering, you must first
      # initiate a restore request, and then wait until the object is moved into the Frequent Access tier.
      # To restore a specific object version, you can provide a version ID. If you don't provide a version
      # ID, Amazon S3 restores the current version. When restoring an archived object, you can specify one
      # of the following data access tier options in the Tier element of the request body: Expedited -
      # Expedited retrievals allow you to quickly access your data stored in the S3 Glacier Flexible
      # Retrieval storage class or S3 Intelligent-Tiering Archive tier when occasional urgent requests for
      # restoring archives are required. For all but the largest archived objects (250 MB+), data accessed
      # using Expedited retrievals is typically made available within 1–5 minutes. Provisioned capacity
      # ensures that retrieval capacity for Expedited retrievals is available when you need it. Expedited
      # retrievals and provisioned capacity are not available for objects stored in the S3 Glacier Deep
      # Archive storage class or S3 Intelligent-Tiering Deep Archive tier. Standard - Standard retrievals
      # allow you to access any of your archived objects within several hours. This is the default option
      # for retrieval requests that do not specify the retrieval option. Standard retrievals typically
      # finish within 3–5 hours for objects stored in the S3 Glacier Flexible Retrieval storage class or S3
      # Intelligent-Tiering Archive tier. They typically finish within 12 hours for objects stored in the S3
      # Glacier Deep Archive storage class or S3 Intelligent-Tiering Deep Archive tier. Standard retrievals
      # are free for objects stored in S3 Intelligent-Tiering. Bulk - Bulk retrievals free for objects
      # stored in the S3 Glacier Flexible Retrieval and S3 Intelligent-Tiering storage classes, enabling you
      # to retrieve large amounts, even petabytes, of data at no cost. Bulk retrievals typically finish
      # within 5–12 hours for objects stored in the S3 Glacier Flexible Retrieval storage class or S3
      # Intelligent-Tiering Archive tier. Bulk retrievals are also the lowest-cost retrieval option when
      # restoring objects from S3 Glacier Deep Archive. They typically finish within 48 hours for objects
      # stored in the S3 Glacier Deep Archive storage class or S3 Intelligent-Tiering Deep Archive tier. For
      # more information about archive retrieval options and provisioned capacity for Expedited data access,
      # see Restoring Archived Objects in the Amazon S3 User Guide . You can use Amazon S3 restore speed
      # upgrade to change the restore speed to a faster speed while it is in progress. For more information,
      # see Upgrading the speed of an in-progress restore in the Amazon S3 User Guide . To get the status of
      # object restoration, you can send a HEAD request. Operations return the x-amz-restore header, which
      # provides information about the restoration status, in the response. You can use Amazon S3 event
      # notifications to notify you when a restore is initiated or completed. For more information, see
      # Configuring Amazon S3 Event Notifications in the Amazon S3 User Guide . After restoring an archived
      # object, you can update the restoration period by reissuing the request with a new period. Amazon S3
      # updates the restoration period relative to the current time and charges only for the request-there
      # are no data transfer charges. You cannot update the restoration period when Amazon S3 is actively
      # processing your current restore request for the object. If your bucket has a lifecycle configuration
      # with a rule that includes an expiration action, the object expiration overrides the life span that
      # you specify in a restore request. For example, if you restore an object copy for 10 days, but the
      # object is scheduled to expire in 3 days, Amazon S3 deletes the object in 3 days. For more
      # information about lifecycle configuration, see PutBucketLifecycleConfiguration and Object Lifecycle
      # Management in Amazon S3 User Guide . Responses A successful action returns either the 200 OK or 202
      # Accepted status code. If the object is not previously restored, then Amazon S3 returns 202 Accepted
      # in the response. If the object is previously restored, Amazon S3 returns 200 OK in the response.
      # Special errors: Code: RestoreAlreadyInProgress Cause: Object restore is already in progress. HTTP
      # Status Code: 409 Conflict SOAP Fault Code Prefix: Client Code: GlacierExpeditedRetrievalNotAvailable
      # Cause: expedited retrievals are currently not available. Try again later. (Returned if there is
      # insufficient capacity to process the Expedited request. This error applies only to Expedited
      # retrievals and not to S3 Standard or Bulk retrievals.) HTTP Status Code: 503 SOAP Fault Code Prefix:
      # N/A The following operations are related to RestoreObject : PutBucketLifecycleConfiguration
      # GetBucketNotificationConfiguration You must URL encode any signed header values that contain spaces.
      # For example, if your header value is my file.txt , containing two spaces after my , you must URL
      # encode this value to my%20%20file.txt .
      def restore_object(
        bucket : String,
        key : String,
        checksum_algorithm : String? = nil,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        restore_request : Types::RestoreRequest? = nil,
        version_id : String? = nil
      ) : Types::RestoreObjectOutput
        input = Types::RestoreObjectRequest.new(bucket: bucket, key: key, checksum_algorithm: checksum_algorithm, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, restore_request: restore_request, version_id: version_id)
        restore_object(input)
      end
      def restore_object(input : Types::RestoreObjectRequest) : Types::RestoreObjectOutput
        request = Protocol::RestXml.build_request(Model::RESTORE_OBJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::RestoreObjectOutput, "RestoreObject")
      end

      # This operation is not supported for directory buckets. This action filters the contents of an Amazon
      # S3 object based on a simple structured query language (SQL) statement. In the request, along with
      # the SQL expression, you must also specify a data serialization format (JSON, CSV, or Apache Parquet)
      # of the object. Amazon S3 uses this format to parse object data into records, and returns only
      # records that match the specified SQL expression. You must also specify the data serialization format
      # for the response. This functionality is not supported for Amazon S3 on Outposts. For more
      # information about Amazon S3 Select, see Selecting Content from Objects and SELECT Command in the
      # Amazon S3 User Guide . Permissions You must have the s3:GetObject permission for this operation.
      # Amazon S3 Select does not support anonymous access. For more information about permissions, see
      # Specifying Permissions in a Policy in the Amazon S3 User Guide . Object Data Formats You can use
      # Amazon S3 Select to query objects that have the following format properties: CSV, JSON, and Parquet
      # - Objects must be in CSV, JSON, or Parquet format. UTF-8 - UTF-8 is the only encoding type Amazon S3
      # Select supports. GZIP or BZIP2 - CSV and JSON files can be compressed using GZIP or BZIP2. GZIP and
      # BZIP2 are the only compression formats that Amazon S3 Select supports for CSV and JSON files. Amazon
      # S3 Select supports columnar compression for Parquet using GZIP or Snappy. Amazon S3 Select does not
      # support whole-object compression for Parquet objects. Server-side encryption - Amazon S3 Select
      # supports querying objects that are protected with server-side encryption. For objects that are
      # encrypted with customer-provided encryption keys (SSE-C), you must use HTTPS, and you must use the
      # headers that are documented in the GetObject . For more information about SSE-C, see Server-Side
      # Encryption (Using Customer-Provided Encryption Keys) in the Amazon S3 User Guide . For objects that
      # are encrypted with Amazon S3 managed keys (SSE-S3) and Amazon Web Services KMS keys (SSE-KMS),
      # server-side encryption is handled transparently, so you don't need to specify anything. For more
      # information about server-side encryption, including SSE-S3 and SSE-KMS, see Protecting Data Using
      # Server-Side Encryption in the Amazon S3 User Guide . Working with the Response Body Given the
      # response size is unknown, Amazon S3 Select streams the response as a series of messages and includes
      # a Transfer-Encoding header with chunked as its value in the response. For more information, see
      # Appendix: SelectObjectContent Response . GetObject Support The SelectObjectContent action does not
      # support the following GetObject functionality. For more information, see GetObject . Range :
      # Although you can specify a scan range for an Amazon S3 Select request (see
      # SelectObjectContentRequest - ScanRange in the request parameters), you cannot specify the range of
      # bytes of an object to return. The GLACIER , DEEP_ARCHIVE , and REDUCED_REDUNDANCY storage classes,
      # or the ARCHIVE_ACCESS and DEEP_ARCHIVE_ACCESS access tiers of the INTELLIGENT_TIERING storage class:
      # You cannot query objects in the GLACIER , DEEP_ARCHIVE , or REDUCED_REDUNDANCY storage classes, nor
      # objects in the ARCHIVE_ACCESS or DEEP_ARCHIVE_ACCESS access tiers of the INTELLIGENT_TIERING storage
      # class. For more information about storage classes, see Using Amazon S3 storage classes in the Amazon
      # S3 User Guide . Special Errors For a list of special errors for this operation, see List of SELECT
      # Object Content Error Codes The following operations are related to SelectObjectContent : GetObject
      # GetBucketLifecycleConfiguration PutBucketLifecycleConfiguration You must URL encode any signed
      # header values that contain spaces. For example, if your header value is my file.txt , containing two
      # spaces after my , you must URL encode this value to my%20%20file.txt .
      def select_object_content(
        bucket : String,
        expression : String,
        expression_type : String,
        input_serialization : Types::InputSerialization,
        key : String,
        output_serialization : Types::OutputSerialization,
        expected_bucket_owner : String? = nil,
        request_progress : Types::RequestProgress? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil,
        scan_range : Types::ScanRange? = nil
      ) : Types::SelectObjectContentOutput
        input = Types::SelectObjectContentRequest.new(bucket: bucket, expression: expression, expression_type: expression_type, input_serialization: input_serialization, key: key, output_serialization: output_serialization, expected_bucket_owner: expected_bucket_owner, request_progress: request_progress, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5, scan_range: scan_range)
        select_object_content(input)
      end
      def select_object_content(input : Types::SelectObjectContentRequest) : Types::SelectObjectContentOutput
        request = Protocol::RestXml.build_request(Model::SELECT_OBJECT_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::SelectObjectContentOutput, "SelectObjectContent")
      end

      # Enables or disables a live inventory table for an S3 Metadata configuration on a general purpose
      # bucket. For more information, see Accelerating data discovery with S3 Metadata in the Amazon S3 User
      # Guide . Permissions To use this operation, you must have the following permissions. For more
      # information, see Setting up permissions for configuring metadata tables in the Amazon S3 User Guide
      # . If you want to encrypt your inventory table with server-side encryption with Key Management
      # Service (KMS) keys (SSE-KMS), you need additional permissions in your KMS key policy. For more
      # information, see Setting up permissions for configuring metadata tables in the Amazon S3 User Guide
      # . s3:UpdateBucketMetadataInventoryTableConfiguration s3tables:CreateTableBucket
      # s3tables:CreateNamespace s3tables:GetTable s3tables:CreateTable s3tables:PutTablePolicy
      # s3tables:PutTableEncryption kms:DescribeKey The following operations are related to
      # UpdateBucketMetadataInventoryTableConfiguration : CreateBucketMetadataConfiguration
      # DeleteBucketMetadataConfiguration GetBucketMetadataConfiguration
      # UpdateBucketMetadataJournalTableConfiguration You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def update_bucket_metadata_inventory_table_configuration(
        bucket : String,
        inventory_table_configuration : Types::InventoryTableConfigurationUpdates,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::UpdateBucketMetadataInventoryTableConfigurationRequest.new(bucket: bucket, inventory_table_configuration: inventory_table_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        update_bucket_metadata_inventory_table_configuration(input)
      end
      def update_bucket_metadata_inventory_table_configuration(input : Types::UpdateBucketMetadataInventoryTableConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::UPDATE_BUCKET_METADATA_INVENTORY_TABLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Enables or disables journal table record expiration for an S3 Metadata configuration on a general
      # purpose bucket. For more information, see Accelerating data discovery with S3 Metadata in the Amazon
      # S3 User Guide . Permissions To use this operation, you must have the
      # s3:UpdateBucketMetadataJournalTableConfiguration permission. For more information, see Setting up
      # permissions for configuring metadata tables in the Amazon S3 User Guide . The following operations
      # are related to UpdateBucketMetadataJournalTableConfiguration : CreateBucketMetadataConfiguration
      # DeleteBucketMetadataConfiguration GetBucketMetadataConfiguration
      # UpdateBucketMetadataInventoryTableConfiguration You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def update_bucket_metadata_journal_table_configuration(
        bucket : String,
        journal_table_configuration : Types::JournalTableConfigurationUpdates,
        checksum_algorithm : String? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil
      ) : Nil
        input = Types::UpdateBucketMetadataJournalTableConfigurationRequest.new(bucket: bucket, journal_table_configuration: journal_table_configuration, checksum_algorithm: checksum_algorithm, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner)
        update_bucket_metadata_journal_table_configuration(input)
      end
      def update_bucket_metadata_journal_table_configuration(input : Types::UpdateBucketMetadataJournalTableConfigurationRequest) : Nil
        request = Protocol::RestXml.build_request(Model::UPDATE_BUCKET_METADATA_JOURNAL_TABLE_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end

      # Uploads a part in a multipart upload. In this operation, you provide new data as a part of an object
      # in your request. However, you have an option to specify your existing Amazon S3 object as a data
      # source for the part you are uploading. To upload a part from an existing object, you use the
      # UploadPartCopy operation. You must initiate a multipart upload (see CreateMultipartUpload ) before
      # you can upload any part. In response to your initiate request, Amazon S3 returns an upload ID, a
      # unique identifier that you must include in your upload part request. Part numbers can be any number
      # from 1 to 10,000, inclusive. A part number uniquely identifies a part and also defines its position
      # within the object being created. If you upload a new part using the same part number that was used
      # with a previous part, the previously uploaded part is overwritten. For information about maximum and
      # minimum part sizes and other multipart upload specifications, see Multipart upload limits in the
      # Amazon S3 User Guide . After you initiate multipart upload and upload one or more parts, you must
      # either complete or abort multipart upload in order to stop getting charged for storage of the
      # uploaded parts. Only after you either complete or abort multipart upload, Amazon S3 frees up the
      # parts storage and stops charging you for the parts storage. For more information on multipart
      # uploads, go to Multipart Upload Overview in the Amazon S3 User Guide . Directory buckets - For
      # directory buckets, you must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket
      # .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests are not supported.
      # For more information about endpoints in Availability Zones, see Regional and Zonal endpoints for
      # directory buckets in Availability Zones in the Amazon S3 User Guide . For more information about
      # endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User
      # Guide . Permissions General purpose bucket permissions - To perform a multipart upload with
      # encryption using an Key Management Service key, the requester must have permission to the
      # kms:Decrypt and kms:GenerateDataKey actions on the key. The requester must also have permissions for
      # the kms:GenerateDataKey action for the CreateMultipartUpload API. Then, the requester needs
      # permissions for the kms:Decrypt action on the UploadPart and UploadPartCopy APIs. These permissions
      # are required because Amazon S3 must decrypt and read data from the encrypted file parts before it
      # completes the multipart upload. For more information about KMS permissions, see Protecting data
      # using server-side encryption with KMS in the Amazon S3 User Guide . For information about the
      # permissions required to use the multipart upload API, see Multipart upload and permissions and
      # Multipart upload API and permissions in the Amazon S3 User Guide . Directory bucket permissions - To
      # grant access to this API operation on a directory bucket, we recommend that you use the
      # CreateSession API operation for session-based authorization. Specifically, you grant the
      # s3express:CreateSession permission to the directory bucket in a bucket policy or an IAM
      # identity-based policy. Then, you make the CreateSession API call on the bucket to obtain a session
      # token. With the session token in your request header, you can make API requests to this operation.
      # After the session token expires, you make another CreateSession API call to generate a new session
      # token for use. Amazon Web Services CLI or SDKs create session and refresh the session token
      # automatically to avoid service interruptions when a session expires. For more information about
      # authorization, see CreateSession . If the object is encrypted with SSE-KMS, you must also have the
      # kms:GenerateDataKey and kms:Decrypt permissions in IAM identity-based policies and KMS key policies
      # for the KMS key. Data integrity General purpose bucket - To ensure that data is not corrupted
      # traversing the network, specify the Content-MD5 header in the upload part request. Amazon S3 checks
      # the part data against the provided MD5 value. If they do not match, Amazon S3 returns an error. If
      # the upload request is signed with Signature Version 4, then Amazon Web Services S3 uses the
      # x-amz-content-sha256 header as a checksum instead of Content-MD5 . For more information see
      # Authenticating Requests: Using the Authorization Header (Amazon Web Services Signature Version 4) .
      # Directory buckets - MD5 is not supported by directory buckets. You can use checksum algorithms to
      # check object integrity. Encryption General purpose bucket - Server-side encryption is for data
      # encryption at rest. Amazon S3 encrypts your data as it writes it to disks in its data centers and
      # decrypts it when you access it. You have mutually exclusive options to protect data using
      # server-side encryption in Amazon S3, depending on how you choose to manage the encryption keys.
      # Specifically, the encryption key options are Amazon S3 managed keys (SSE-S3), Amazon Web Services
      # KMS keys (SSE-KMS), and Customer-Provided Keys (SSE-C). Amazon S3 encrypts data with server-side
      # encryption using Amazon S3 managed keys (SSE-S3) by default. You can optionally tell Amazon S3 to
      # encrypt data at rest using server-side encryption with other key options. The option you use depends
      # on whether you want to use KMS keys (SSE-KMS) or provide your own encryption key (SSE-C).
      # Server-side encryption is supported by the S3 Multipart Upload operations. Unless you are using a
      # customer-provided encryption key (SSE-C), you don't need to specify the encryption parameters in
      # each UploadPart request. Instead, you only need to specify the server-side encryption parameters in
      # the initial Initiate Multipart request. For more information, see CreateMultipartUpload . If you
      # have server-side encryption with customer-provided keys (SSE-C) blocked for your general purpose
      # bucket, you will get an HTTP 403 Access Denied error when you specify the SSE-C request headers
      # while writing new data to your bucket. For more information, see Blocking or unblocking SSE-C for a
      # general purpose bucket . If you request server-side encryption using a customer-provided encryption
      # key (SSE-C) in your initiate multipart upload request, you must provide identical encryption
      # information in each part upload using the following request headers.
      # x-amz-server-side-encryption-customer-algorithm x-amz-server-side-encryption-customer-key
      # x-amz-server-side-encryption-customer-key-MD5 For more information, see Using Server-Side Encryption
      # in the Amazon S3 User Guide . Directory buckets - For directory buckets, there are only two
      # supported options for server-side encryption: server-side encryption with Amazon S3 managed keys
      # (SSE-S3) ( AES256 ) and server-side encryption with KMS keys (SSE-KMS) ( aws:kms ). Special errors
      # Error Code: NoSuchUpload Description: The specified multipart upload does not exist. The upload ID
      # might be invalid, or the multipart upload might have been aborted or completed. HTTP Status Code:
      # 404 Not Found SOAP Fault Code Prefix: Client HTTP Host header syntax Directory buckets - The HTTP
      # Host header syntax is Bucket-name .s3express- zone-id . region-code .amazonaws.com . The following
      # operations are related to UploadPart : CreateMultipartUpload CompleteMultipartUpload
      # AbortMultipartUpload ListParts ListMultipartUploads You must URL encode any signed header values
      # that contain spaces. For example, if your header value is my file.txt , containing two spaces after
      # my , you must URL encode this value to my%20%20file.txt .
      def upload_part(
        bucket : String,
        key : String,
        part_number : Int32,
        upload_id : String,
        body : Bytes? = nil,
        checksum_algorithm : String? = nil,
        checksum_crc32 : String? = nil,
        checksum_crc32_c : String? = nil,
        checksum_crc64_nvme : String? = nil,
        checksum_sha1 : String? = nil,
        checksum_sha256 : String? = nil,
        content_length : Int64? = nil,
        content_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil
      ) : Types::UploadPartOutput
        input = Types::UploadPartRequest.new(bucket: bucket, key: key, part_number: part_number, upload_id: upload_id, body: body, checksum_algorithm: checksum_algorithm, checksum_crc32: checksum_crc32, checksum_crc32_c: checksum_crc32_c, checksum_crc64_nvme: checksum_crc64_nvme, checksum_sha1: checksum_sha1, checksum_sha256: checksum_sha256, content_length: content_length, content_md5: content_md5, expected_bucket_owner: expected_bucket_owner, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5)
        upload_part(input)
      end
      def upload_part(input : Types::UploadPartRequest) : Types::UploadPartOutput
        request = Protocol::RestXml.build_request(Model::UPLOAD_PART, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UploadPartOutput, "UploadPart")
      end

      # Uploads a part by copying data from an existing object as data source. To specify the data source,
      # you add the request header x-amz-copy-source in your request. To specify a byte range, you add the
      # request header x-amz-copy-source-range in your request. For information about maximum and minimum
      # part sizes and other multipart upload specifications, see Multipart upload limits in the Amazon S3
      # User Guide . Instead of copying data from an existing object as part data, you might use the
      # UploadPart action to upload new data as a part of an object in your request. You must initiate a
      # multipart upload before you can upload any part. In response to your initiate request, Amazon S3
      # returns the upload ID, a unique identifier that you must include in your upload part request. For
      # conceptual information about multipart uploads, see Uploading Objects Using Multipart Upload in the
      # Amazon S3 User Guide . For information about copying objects using a single atomic action vs. a
      # multipart upload, see Operations on Objects in the Amazon S3 User Guide . Directory buckets - For
      # directory buckets, you must make requests for this API operation to the Zonal endpoint. These
      # endpoints support virtual-hosted-style requests in the format https:// amzn-s3-demo-bucket
      # .s3express- zone-id . region-code .amazonaws.com/ key-name . Path-style requests are not supported.
      # For more information about endpoints in Availability Zones, see Regional and Zonal endpoints for
      # directory buckets in Availability Zones in the Amazon S3 User Guide . For more information about
      # endpoints in Local Zones, see Concepts for directory buckets in Local Zones in the Amazon S3 User
      # Guide . Authentication and authorization All UploadPartCopy requests must be authenticated and
      # signed by using IAM credentials (access key ID and secret access key for the IAM identities). All
      # headers with the x-amz- prefix, including x-amz-copy-source , must be signed. For more information,
      # see REST Authentication . Directory buckets - You must use IAM credentials to authenticate and
      # authorize your access to the UploadPartCopy API operation, instead of using the temporary security
      # credentials through the CreateSession API operation. Amazon Web Services CLI or SDKs handles
      # authentication and authorization on your behalf. Permissions You must have READ access to the source
      # object and WRITE access to the destination bucket. General purpose bucket permissions - You must
      # have the permissions in a policy based on the bucket types of your source bucket and destination
      # bucket in an UploadPartCopy operation. If the source object is in a general purpose bucket, you must
      # have the s3:GetObject permission to read the source object that is being copied. If the destination
      # bucket is a general purpose bucket, you must have the s3:PutObject permission to write the object
      # copy to the destination bucket. To perform a multipart upload with encryption using an Key
      # Management Service key, the requester must have permission to the kms:Decrypt and
      # kms:GenerateDataKey actions on the key. The requester must also have permissions for the
      # kms:GenerateDataKey action for the CreateMultipartUpload API. Then, the requester needs permissions
      # for the kms:Decrypt action on the UploadPart and UploadPartCopy APIs. These permissions are required
      # because Amazon S3 must decrypt and read data from the encrypted file parts before it completes the
      # multipart upload. For more information about KMS permissions, see Protecting data using server-side
      # encryption with KMS in the Amazon S3 User Guide . For information about the permissions required to
      # use the multipart upload API, see Multipart upload and permissions and Multipart upload API and
      # permissions in the Amazon S3 User Guide . Directory bucket permissions - You must have permissions
      # in a bucket policy or an IAM identity-based policy based on the source and destination bucket types
      # in an UploadPartCopy operation. If the source object that you want to copy is in a directory bucket,
      # you must have the s3express:CreateSession permission in the Action element of a policy to read the
      # object. By default, the session is in the ReadWrite mode. If you want to restrict the access, you
      # can explicitly set the s3express:SessionMode condition key to ReadOnly on the copy source bucket. If
      # the copy destination is a directory bucket, you must have the s3express:CreateSession permission in
      # the Action element of a policy to write the object to the destination. The s3express:SessionMode
      # condition key cannot be set to ReadOnly on the copy destination. If the object is encrypted with
      # SSE-KMS, you must also have the kms:GenerateDataKey and kms:Decrypt permissions in IAM
      # identity-based policies and KMS key policies for the KMS key. For example policies, see Example
      # bucket policies for S3 Express One Zone and Amazon Web Services Identity and Access Management (IAM)
      # identity-based policies for S3 Express One Zone in the Amazon S3 User Guide . Encryption General
      # purpose buckets - For information about using server-side encryption with customer-provided
      # encryption keys with the UploadPartCopy operation, see CopyObject and UploadPart . If you have
      # server-side encryption with customer-provided keys (SSE-C) blocked for your general purpose bucket,
      # you will get an HTTP 403 Access Denied error when you specify the SSE-C request headers while
      # writing new data to your bucket. For more information, see Blocking or unblocking SSE-C for a
      # general purpose bucket . Directory buckets - For directory buckets, there are only two supported
      # options for server-side encryption: server-side encryption with Amazon S3 managed keys (SSE-S3) (
      # AES256 ) and server-side encryption with KMS keys (SSE-KMS) ( aws:kms ). For more information, see
      # Protecting data with server-side encryption in the Amazon S3 User Guide . For directory buckets,
      # when you perform a CreateMultipartUpload operation and an UploadPartCopy operation, the request
      # headers you provide in the CreateMultipartUpload request must match the default encryption
      # configuration of the destination bucket. S3 Bucket Keys aren't supported, when you copy SSE-KMS
      # encrypted objects from general purpose buckets to directory buckets, from directory buckets to
      # general purpose buckets, or between directory buckets, through UploadPartCopy . In this case, Amazon
      # S3 makes a call to KMS every time a copy request is made for a KMS-encrypted object. Special errors
      # Error Code: NoSuchUpload Description: The specified multipart upload does not exist. The upload ID
      # might be invalid, or the multipart upload might have been aborted or completed. HTTP Status Code:
      # 404 Not Found Error Code: InvalidRequest Description: The specified copy source is not supported as
      # a byte-range copy source. HTTP Status Code: 400 Bad Request HTTP Host header syntax Directory
      # buckets - The HTTP Host header syntax is Bucket-name .s3express- zone-id . region-code
      # .amazonaws.com . The following operations are related to UploadPartCopy : CreateMultipartUpload
      # UploadPart CompleteMultipartUpload AbortMultipartUpload ListParts ListMultipartUploads You must URL
      # encode any signed header values that contain spaces. For example, if your header value is my
      # file.txt , containing two spaces after my , you must URL encode this value to my%20%20file.txt .
      def upload_part_copy(
        bucket : String,
        copy_source : String,
        key : String,
        part_number : Int32,
        upload_id : String,
        copy_source_if_match : String? = nil,
        copy_source_if_modified_since : Time? = nil,
        copy_source_if_none_match : String? = nil,
        copy_source_if_unmodified_since : Time? = nil,
        copy_source_range : String? = nil,
        copy_source_sse_customer_algorithm : String? = nil,
        copy_source_sse_customer_key : String? = nil,
        copy_source_sse_customer_key_md5 : String? = nil,
        expected_bucket_owner : String? = nil,
        expected_source_bucket_owner : String? = nil,
        request_payer : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key : String? = nil,
        sse_customer_key_md5 : String? = nil
      ) : Types::UploadPartCopyOutput
        input = Types::UploadPartCopyRequest.new(bucket: bucket, copy_source: copy_source, key: key, part_number: part_number, upload_id: upload_id, copy_source_if_match: copy_source_if_match, copy_source_if_modified_since: copy_source_if_modified_since, copy_source_if_none_match: copy_source_if_none_match, copy_source_if_unmodified_since: copy_source_if_unmodified_since, copy_source_range: copy_source_range, copy_source_sse_customer_algorithm: copy_source_sse_customer_algorithm, copy_source_sse_customer_key: copy_source_sse_customer_key, copy_source_sse_customer_key_md5: copy_source_sse_customer_key_md5, expected_bucket_owner: expected_bucket_owner, expected_source_bucket_owner: expected_source_bucket_owner, request_payer: request_payer, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key: sse_customer_key, sse_customer_key_md5: sse_customer_key_md5)
        upload_part_copy(input)
      end
      def upload_part_copy(input : Types::UploadPartCopyRequest) : Types::UploadPartCopyOutput
        request = Protocol::RestXml.build_request(Model::UPLOAD_PART_COPY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UploadPartCopyOutput, "UploadPartCopy")
      end

      # This operation is not supported for directory buckets. Passes transformed objects to a GetObject
      # operation when using Object Lambda access points. For information about Object Lambda access points,
      # see Transforming objects with Object Lambda access points in the Amazon S3 User Guide . This
      # operation supports metadata that can be returned by GetObject , in addition to RequestRoute ,
      # RequestToken , StatusCode , ErrorCode , and ErrorMessage . The GetObject response metadata is
      # supported so that the WriteGetObjectResponse caller, typically an Lambda function, can provide the
      # same metadata when it internally invokes GetObject . When WriteGetObjectResponse is called by a
      # customer-owned Lambda function, the metadata returned to the end user GetObject call might differ
      # from what Amazon S3 would normally return. You can include any number of metadata headers. When
      # including a metadata header, it should be prefaced with x-amz-meta . For example,
      # x-amz-meta-my-custom-header: MyCustomValue . The primary use case for this is to forward GetObject
      # metadata. Amazon Web Services provides some prebuilt Lambda functions that you can use with S3
      # Object Lambda to detect and redact personally identifiable information (PII) and decompress S3
      # objects. These Lambda functions are available in the Amazon Web Services Serverless Application
      # Repository, and can be selected through the Amazon Web Services Management Console when you create
      # your Object Lambda access point. Example 1: PII Access Control - This Lambda function uses Amazon
      # Comprehend, a natural language processing (NLP) service using machine learning to find insights and
      # relationships in text. It automatically detects personally identifiable information (PII) such as
      # names, addresses, dates, credit card numbers, and social security numbers from documents in your
      # Amazon S3 bucket. Example 2: PII Redaction - This Lambda function uses Amazon Comprehend, a natural
      # language processing (NLP) service using machine learning to find insights and relationships in text.
      # It automatically redacts personally identifiable information (PII) such as names, addresses, dates,
      # credit card numbers, and social security numbers from documents in your Amazon S3 bucket. Example 3:
      # Decompression - The Lambda function S3ObjectLambdaDecompression, is equipped to decompress objects
      # stored in S3 in one of six compressed file formats including bzip2, gzip, snappy, zlib, zstandard
      # and ZIP. For information on how to view and use these functions, see Using Amazon Web Services built
      # Lambda functions in the Amazon S3 User Guide . You must URL encode any signed header values that
      # contain spaces. For example, if your header value is my file.txt , containing two spaces after my ,
      # you must URL encode this value to my%20%20file.txt .
      def write_get_object_response(
        request_route : String,
        request_token : String,
        accept_ranges : String? = nil,
        body : Bytes? = nil,
        bucket_key_enabled : Bool? = nil,
        cache_control : String? = nil,
        checksum_crc32 : String? = nil,
        checksum_crc32_c : String? = nil,
        checksum_crc64_nvme : String? = nil,
        checksum_sha1 : String? = nil,
        checksum_sha256 : String? = nil,
        content_disposition : String? = nil,
        content_encoding : String? = nil,
        content_language : String? = nil,
        content_length : Int64? = nil,
        content_range : String? = nil,
        content_type : String? = nil,
        delete_marker : Bool? = nil,
        e_tag : String? = nil,
        error_code : String? = nil,
        error_message : String? = nil,
        expiration : String? = nil,
        expires : String? = nil,
        last_modified : Time? = nil,
        metadata : Hash(String, String)? = nil,
        missing_meta : Int32? = nil,
        object_lock_legal_hold_status : String? = nil,
        object_lock_mode : String? = nil,
        object_lock_retain_until_date : Time? = nil,
        parts_count : Int32? = nil,
        replication_status : String? = nil,
        request_charged : String? = nil,
        restore : String? = nil,
        sse_customer_algorithm : String? = nil,
        sse_customer_key_md5 : String? = nil,
        ssekms_key_id : String? = nil,
        server_side_encryption : String? = nil,
        status_code : Int32? = nil,
        storage_class : String? = nil,
        tag_count : Int32? = nil,
        version_id : String? = nil
      ) : Nil
        input = Types::WriteGetObjectResponseRequest.new(request_route: request_route, request_token: request_token, accept_ranges: accept_ranges, body: body, bucket_key_enabled: bucket_key_enabled, cache_control: cache_control, checksum_crc32: checksum_crc32, checksum_crc32_c: checksum_crc32_c, checksum_crc64_nvme: checksum_crc64_nvme, checksum_sha1: checksum_sha1, checksum_sha256: checksum_sha256, content_disposition: content_disposition, content_encoding: content_encoding, content_language: content_language, content_length: content_length, content_range: content_range, content_type: content_type, delete_marker: delete_marker, e_tag: e_tag, error_code: error_code, error_message: error_message, expiration: expiration, expires: expires, last_modified: last_modified, metadata: metadata, missing_meta: missing_meta, object_lock_legal_hold_status: object_lock_legal_hold_status, object_lock_mode: object_lock_mode, object_lock_retain_until_date: object_lock_retain_until_date, parts_count: parts_count, replication_status: replication_status, request_charged: request_charged, restore: restore, sse_customer_algorithm: sse_customer_algorithm, sse_customer_key_md5: sse_customer_key_md5, ssekms_key_id: ssekms_key_id, server_side_encryption: server_side_encryption, status_code: status_code, storage_class: storage_class, tag_count: tag_count, version_id: version_id)
        write_get_object_response(input)
      end
      def write_get_object_response(input : Types::WriteGetObjectResponseRequest) : Nil
        request = Protocol::RestXml.build_request(Model::WRITE_GET_OBJECT_RESPONSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
