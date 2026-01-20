module Aws
  module Glacier
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # This operation aborts a multipart upload identified by the upload ID. After the Abort Multipart
      # Upload request succeeds, you cannot upload any more parts to the multipart upload or complete the
      # multipart upload. Aborting a completed upload fails. However, aborting an already-aborted upload
      # will succeed, for a short time. For more information about uploading a part and completing a
      # multipart upload, see UploadMultipartPart and CompleteMultipartUpload . This operation is
      # idempotent. An AWS account has full permission to perform all operations (actions). However, AWS
      # Identity and Access Management (IAM) users don't have any permissions by default. You must grant
      # them explicit permission to perform specific actions. For more information, see Access Control Using
      # AWS Identity and Access Management (IAM) . For conceptual information and underlying REST API, see
      # Working with Archives in Amazon Glacier and Abort Multipart Upload in the Amazon Glacier Developer
      # Guide .

      def abort_multipart_upload(
        account_id : String,
        upload_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::AbortMultipartUploadInput.new(account_id: account_id, upload_id: upload_id, vault_name: vault_name)
        abort_multipart_upload(input)
      end

      def abort_multipart_upload(input : Types::AbortMultipartUploadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ABORT_MULTIPART_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation aborts the vault locking process if the vault lock is not in the Locked state. If the
      # vault lock is in the Locked state when this operation is requested, the operation returns an
      # AccessDeniedException error. Aborting the vault locking process removes the vault lock policy from
      # the specified vault. A vault lock is put into the InProgress state by calling InitiateVaultLock . A
      # vault lock is put into the Locked state by calling CompleteVaultLock . You can get the state of a
      # vault lock by calling GetVaultLock . For more information about the vault locking process, see
      # Amazon Glacier Vault Lock . For more information about vault lock policies, see Amazon Glacier
      # Access Control with Vault Lock Policies . This operation is idempotent. You can successfully invoke
      # this operation multiple times, if the vault lock is in the InProgress state or if there is no policy
      # associated with the vault.

      def abort_vault_lock(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::AbortVaultLockInput.new(account_id: account_id, vault_name: vault_name)
        abort_vault_lock(input)
      end

      def abort_vault_lock(input : Types::AbortVaultLockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ABORT_VAULT_LOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation adds the specified tags to a vault. Each tag is composed of a key and a value. Each
      # vault can have up to 10 tags. If your request would cause the tag limit for the vault to be
      # exceeded, the operation throws the LimitExceededException error. If a tag already exists on the
      # vault under a specified key, the existing key value will be overwritten. For more information about
      # tags, see Tagging Amazon Glacier Resources .

      def add_tags_to_vault(
        account_id : String,
        vault_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::AddTagsToVaultInput.new(account_id: account_id, vault_name: vault_name, tags: tags)
        add_tags_to_vault(input)
      end

      def add_tags_to_vault(input : Types::AddTagsToVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_TAGS_TO_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # You call this operation to inform Amazon Glacier (Glacier) that all the archive parts have been
      # uploaded and that Glacier can now assemble the archive from the uploaded parts. After assembling and
      # saving the archive to the vault, Glacier returns the URI path of the newly created archive resource.
      # Using the URI path, you can then access the archive. After you upload an archive, you should save
      # the archive ID returned to retrieve the archive at a later point. You can also get the vault
      # inventory to obtain a list of archive IDs in a vault. For more information, see InitiateJob . In the
      # request, you must include the computed SHA256 tree hash of the entire archive you have uploaded. For
      # information about computing a SHA256 tree hash, see Computing Checksums . On the server side,
      # Glacier also constructs the SHA256 tree hash of the assembled archive. If the values match, Glacier
      # saves the archive to the vault; otherwise, it returns an error, and the operation fails. The
      # ListParts operation returns a list of parts uploaded for a specific multipart upload. It includes
      # checksum information for each uploaded part that can be used to debug a bad checksum issue.
      # Additionally, Glacier also checks for any missing content ranges when assembling the archive, if
      # missing content ranges are found, Glacier returns an error and the operation fails. Complete
      # Multipart Upload is an idempotent operation. After your first successful complete multipart upload,
      # if you call the operation again within a short period, the operation will succeed and return the
      # same archive ID. This is useful in the event you experience a network issue that causes an aborted
      # connection or receive a 500 server error, in which case you can repeat your Complete Multipart
      # Upload request and get the same archive ID without creating duplicate archives. Note, however, that
      # after the multipart upload completes, you cannot call the List Parts operation and the multipart
      # upload will not appear in List Multipart Uploads response, even if idempotent complete is possible.
      # An AWS account has full permission to perform all operations (actions). However, AWS Identity and
      # Access Management (IAM) users don't have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see Access Control Using AWS Identity
      # and Access Management (IAM) . For conceptual information and underlying REST API, see Uploading
      # Large Archives in Parts (Multipart Upload) and Complete Multipart Upload in the Amazon Glacier
      # Developer Guide .

      def complete_multipart_upload(
        account_id : String,
        upload_id : String,
        vault_name : String,
        archive_size : String? = nil,
        checksum : String? = nil
      ) : Protocol::Request
        input = Types::CompleteMultipartUploadInput.new(account_id: account_id, upload_id: upload_id, vault_name: vault_name, archive_size: archive_size, checksum: checksum)
        complete_multipart_upload(input)
      end

      def complete_multipart_upload(input : Types::CompleteMultipartUploadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_MULTIPART_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation completes the vault locking process by transitioning the vault lock from the
      # InProgress state to the Locked state, which causes the vault lock policy to become unchangeable. A
      # vault lock is put into the InProgress state by calling InitiateVaultLock . You can obtain the state
      # of the vault lock by calling GetVaultLock . For more information about the vault locking process,
      # Amazon Glacier Vault Lock . This operation is idempotent. This request is always successful if the
      # vault lock is in the Locked state and the provided lock ID matches the lock ID originally used to
      # lock the vault. If an invalid lock ID is passed in the request when the vault lock is in the Locked
      # state, the operation returns an AccessDeniedException error. If an invalid lock ID is passed in the
      # request when the vault lock is in the InProgress state, the operation throws an InvalidParameter
      # error.

      def complete_vault_lock(
        account_id : String,
        lock_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::CompleteVaultLockInput.new(account_id: account_id, lock_id: lock_id, vault_name: vault_name)
        complete_vault_lock(input)
      end

      def complete_vault_lock(input : Types::CompleteVaultLockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_VAULT_LOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation creates a new vault with the specified name. The name of the vault must be unique
      # within a region for an AWS account. You can create up to 1,000 vaults per account. If you need to
      # create more vaults, contact Amazon Glacier. You must use the following guidelines when naming a
      # vault. Names can be between 1 and 255 characters long. Allowed characters are a-z, A-Z, 0-9, '_'
      # (underscore), '-' (hyphen), and '.' (period). This operation is idempotent. An AWS account has full
      # permission to perform all operations (actions). However, AWS Identity and Access Management (IAM)
      # users don't have any permissions by default. You must grant them explicit permission to perform
      # specific actions. For more information, see Access Control Using AWS Identity and Access Management
      # (IAM) . For conceptual information and underlying REST API, see Creating a Vault in Amazon Glacier
      # and Create Vault in the Amazon Glacier Developer Guide .

      def create_vault(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::CreateVaultInput.new(account_id: account_id, vault_name: vault_name)
        create_vault(input)
      end

      def create_vault(input : Types::CreateVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes an archive from a vault. Subsequent requests to initiate a retrieval of this
      # archive will fail. Archive retrievals that are in progress for this archive ID may or may not
      # succeed according to the following scenarios: If the archive retrieval job is actively preparing the
      # data for download when Amazon Glacier receives the delete archive request, the archival retrieval
      # operation might fail. If the archive retrieval job has successfully prepared the archive for
      # download when Amazon Glacier receives the delete archive request, you will be able to download the
      # output. This operation is idempotent. Attempting to delete an already-deleted archive does not
      # result in an error. An AWS account has full permission to perform all operations (actions). However,
      # AWS Identity and Access Management (IAM) users don't have any permissions by default. You must grant
      # them explicit permission to perform specific actions. For more information, see Access Control Using
      # AWS Identity and Access Management (IAM) . For conceptual information and underlying REST API, see
      # Deleting an Archive in Amazon Glacier and Delete Archive in the Amazon Glacier Developer Guide .

      def delete_archive(
        account_id : String,
        archive_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DeleteArchiveInput.new(account_id: account_id, archive_id: archive_id, vault_name: vault_name)
        delete_archive(input)
      end

      def delete_archive(input : Types::DeleteArchiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ARCHIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes a vault. Amazon Glacier will delete a vault only if there are no archives in
      # the vault as of the last inventory and there have been no writes to the vault since the last
      # inventory. If either of these conditions is not satisfied, the vault deletion fails (that is, the
      # vault is not removed) and Amazon Glacier returns an error. You can use DescribeVault to return the
      # number of archives in a vault, and you can use Initiate a Job (POST jobs) to initiate a new
      # inventory retrieval for a vault. The inventory contains the archive IDs you use to delete archives
      # using Delete Archive (DELETE archive) . This operation is idempotent. An AWS account has full
      # permission to perform all operations (actions). However, AWS Identity and Access Management (IAM)
      # users don't have any permissions by default. You must grant them explicit permission to perform
      # specific actions. For more information, see Access Control Using AWS Identity and Access Management
      # (IAM) . For conceptual information and underlying REST API, see Deleting a Vault in Amazon Glacier
      # and Delete Vault in the Amazon Glacier Developer Guide .

      def delete_vault(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DeleteVaultInput.new(account_id: account_id, vault_name: vault_name)
        delete_vault(input)
      end

      def delete_vault(input : Types::DeleteVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes the access policy associated with the specified vault. The operation is
      # eventually consistent; that is, it might take some time for Amazon Glacier to completely remove the
      # access policy, and you might still see the effect of the policy for a short time after you send the
      # delete request. This operation is idempotent. You can invoke delete multiple times, even if there is
      # no policy associated with the vault. For more information about vault access policies, see Amazon
      # Glacier Access Control with Vault Access Policies .

      def delete_vault_access_policy(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DeleteVaultAccessPolicyInput.new(account_id: account_id, vault_name: vault_name)
        delete_vault_access_policy(input)
      end

      def delete_vault_access_policy(input : Types::DeleteVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation deletes the notification configuration set for a vault. The operation is eventually
      # consistent; that is, it might take some time for Amazon Glacier to completely disable the
      # notifications and you might still receive some notifications for a short time after you send the
      # delete request. An AWS account has full permission to perform all operations (actions). However, AWS
      # Identity and Access Management (IAM) users don't have any permissions by default. You must grant
      # them explicit permission to perform specific actions. For more information, see Access Control Using
      # AWS Identity and Access Management (IAM) . For conceptual information and underlying REST API, see
      # Configuring Vault Notifications in Amazon Glacier and Delete Vault Notification Configuration in the
      # Amazon Glacier Developer Guide.

      def delete_vault_notifications(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DeleteVaultNotificationsInput.new(account_id: account_id, vault_name: vault_name)
        delete_vault_notifications(input)
      end

      def delete_vault_notifications(input : Types::DeleteVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a job you previously initiated, including the job
      # initiation date, the user who initiated the job, the job status code/message and the Amazon SNS
      # topic to notify after Amazon Glacier (Glacier) completes the job. For more information about
      # initiating a job, see InitiateJob . This operation enables you to check the status of your job.
      # However, it is strongly recommended that you set up an Amazon SNS topic and specify it in your
      # initiate job request so that Glacier can notify the topic after it completes the job. A job ID will
      # not expire for at least 24 hours after Glacier completes the job. An AWS account has full permission
      # to perform all operations (actions). However, AWS Identity and Access Management (IAM) users don't
      # have any permissions by default. You must grant them explicit permission to perform specific
      # actions. For more information, see Access Control Using AWS Identity and Access Management (IAM) .
      # For more information about using this operation, see the documentation for the underlying REST API
      # Describe Job in the Amazon Glacier Developer Guide .

      def describe_job(
        account_id : String,
        job_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DescribeJobInput.new(account_id: account_id, job_id: job_id, vault_name: vault_name)
        describe_job(input)
      end

      def describe_job(input : Types::DescribeJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns information about a vault, including the vault's Amazon Resource Name (ARN),
      # the date the vault was created, the number of archives it contains, and the total size of all the
      # archives in the vault. The number of archives and their total size are as of the last inventory
      # generation. This means that if you add or remove an archive from a vault, and then immediately use
      # Describe Vault, the change in contents will not be immediately reflected. If you want to retrieve
      # the latest inventory of the vault, use InitiateJob . Amazon Glacier generates vault inventories
      # approximately daily. For more information, see Downloading a Vault Inventory in Amazon Glacier . An
      # AWS account has full permission to perform all operations (actions). However, AWS Identity and
      # Access Management (IAM) users don't have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see Access Control Using AWS Identity
      # and Access Management (IAM) . For conceptual information and underlying REST API, see Retrieving
      # Vault Metadata in Amazon Glacier and Describe Vault in the Amazon Glacier Developer Guide .

      def describe_vault(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::DescribeVaultInput.new(account_id: account_id, vault_name: vault_name)
        describe_vault(input)
      end

      def describe_vault(input : Types::DescribeVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation returns the current data retrieval policy for the account and region specified in the
      # GET request. For more information about data retrieval policies, see Amazon Glacier Data Retrieval
      # Policies .

      def get_data_retrieval_policy(
        account_id : String
      ) : Protocol::Request
        input = Types::GetDataRetrievalPolicyInput.new(account_id: account_id)
        get_data_retrieval_policy(input)
      end

      def get_data_retrieval_policy(input : Types::GetDataRetrievalPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_RETRIEVAL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation downloads the output of the job you initiated using InitiateJob . Depending on the
      # job type you specified when you initiated the job, the output will be either the content of an
      # archive or a vault inventory. You can download all the job output or download a portion of the
      # output by specifying a byte range. In the case of an archive retrieval job, depending on the byte
      # range you specify, Amazon Glacier (Glacier) returns the checksum for the portion of the data. You
      # can compute the checksum on the client and verify that the values match to ensure the portion you
      # downloaded is the correct data. A job ID will not expire for at least 24 hours after Glacier
      # completes the job. That a byte range. For both archive and inventory retrieval jobs, you should
      # verify the downloaded size against the size returned in the headers from the Get Job Output
      # response. For archive retrieval jobs, you should also verify that the size is what you expected. If
      # you download a portion of the output, the expected size is based on the range of bytes you
      # specified. For example, if you specify a range of bytes=0-1048575 , you should verify your download
      # size is 1,048,576 bytes. If you download an entire archive, the expected size is the size of the
      # archive when you uploaded it to Amazon Glacier The expected size is also returned in the headers
      # from the Get Job Output response. In the case of an archive retrieval job, depending on the byte
      # range you specify, Glacier returns the checksum for the portion of the data. To ensure the portion
      # you downloaded is the correct data, compute the checksum on the client, verify that the values
      # match, and verify that the size is what you expected. A job ID does not expire for at least 24 hours
      # after Glacier completes the job. That is, you can download the job output within the 24 hours period
      # after Amazon Glacier completes the job. An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users don't have any permissions by
      # default. You must grant them explicit permission to perform specific actions. For more information,
      # see Access Control Using AWS Identity and Access Management (IAM) . For conceptual information and
      # the underlying REST API, see Downloading a Vault Inventory , Downloading an Archive , and Get Job
      # Output

      def get_job_output(
        account_id : String,
        job_id : String,
        vault_name : String,
        range : String? = nil
      ) : Protocol::Request
        input = Types::GetJobOutputInput.new(account_id: account_id, job_id: job_id, vault_name: vault_name, range: range)
        get_job_output(input)
      end

      def get_job_output(input : Types::GetJobOutputInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_OUTPUT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation retrieves the access-policy subresource set on the vault; for more information on
      # setting this subresource, see Set Vault Access Policy (PUT access-policy) . If there is no access
      # policy set on the vault, the operation returns a 404 Not found error. For more information about
      # vault access policies, see Amazon Glacier Access Control with Vault Access Policies .

      def get_vault_access_policy(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::GetVaultAccessPolicyInput.new(account_id: account_id, vault_name: vault_name)
        get_vault_access_policy(input)
      end

      def get_vault_access_policy(input : Types::GetVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation retrieves the following attributes from the lock-policy subresource set on the
      # specified vault: The vault lock policy set on the vault. The state of the vault lock, which is
      # either InProgess or Locked . When the lock ID expires. The lock ID is used to complete the vault
      # locking process. When the vault lock was initiated and put into the InProgress state. A vault lock
      # is put into the InProgress state by calling InitiateVaultLock . A vault lock is put into the Locked
      # state by calling CompleteVaultLock . You can abort the vault locking process by calling
      # AbortVaultLock . For more information about the vault locking process, Amazon Glacier Vault Lock .
      # If there is no vault lock policy set on the vault, the operation returns a 404 Not found error. For
      # more information about vault lock policies, Amazon Glacier Access Control with Vault Lock Policies .

      def get_vault_lock(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::GetVaultLockInput.new(account_id: account_id, vault_name: vault_name)
        get_vault_lock(input)
      end

      def get_vault_lock(input : Types::GetVaultLockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VAULT_LOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation retrieves the notification-configuration subresource of the specified vault. For
      # information about setting a notification configuration on a vault, see SetVaultNotifications . If a
      # notification configuration for a vault is not set, the operation returns a 404 Not Found error. For
      # more information about vault notifications, see Configuring Vault Notifications in Amazon Glacier .
      # An AWS account has full permission to perform all operations (actions). However, AWS Identity and
      # Access Management (IAM) users don't have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see Access Control Using AWS Identity
      # and Access Management (IAM) . For conceptual information and underlying REST API, see Configuring
      # Vault Notifications in Amazon Glacier and Get Vault Notification Configuration in the Amazon Glacier
      # Developer Guide .

      def get_vault_notifications(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::GetVaultNotificationsInput.new(account_id: account_id, vault_name: vault_name)
        get_vault_notifications(input)
      end

      def get_vault_notifications(input : Types::GetVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation initiates a job of the specified type, which can be a select, an archival retrieval,
      # or a vault retrieval. For more information about using this operation, see the documentation for the
      # underlying REST API Initiate a Job .

      def initiate_job(
        account_id : String,
        vault_name : String,
        job_parameters : Types::JobParameters? = nil
      ) : Protocol::Request
        input = Types::InitiateJobInput.new(account_id: account_id, vault_name: vault_name, job_parameters: job_parameters)
        initiate_job(input)
      end

      def initiate_job(input : Types::InitiateJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIATE_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation initiates a multipart upload. Amazon Glacier creates a multipart upload resource and
      # returns its ID in the response. The multipart upload ID is used in subsequent requests to upload
      # parts of an archive (see UploadMultipartPart ). When you initiate a multipart upload, you specify
      # the part size in number of bytes. The part size must be a megabyte (1024 KB) multiplied by a power
      # of 2-for example, 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608 (8 MB), and so on. The
      # minimum allowable part size is 1 MB, and the maximum is 4 GB. Every part you upload to this resource
      # (see UploadMultipartPart ), except the last one, must have the same size. The last one can be the
      # same size or smaller. For example, suppose you want to upload a 16.2 MB file. If you initiate the
      # multipart upload with a part size of 4 MB, you will upload four parts of 4 MB each and one part of
      # 0.2 MB. You don't need to know the size of the archive when you start a multipart upload because
      # Amazon Glacier does not require you to specify the overall archive size. After you complete the
      # multipart upload, Amazon Glacier (Glacier) removes the multipart upload resource referenced by the
      # ID. Glacier also removes the multipart upload resource if you cancel the multipart upload or it may
      # be removed if there is no activity for a period of 24 hours. An AWS account has full permission to
      # perform all operations (actions). However, AWS Identity and Access Management (IAM) users don't have
      # any permissions by default. You must grant them explicit permission to perform specific actions. For
      # more information, see Access Control Using AWS Identity and Access Management (IAM) . For conceptual
      # information and underlying REST API, see Uploading Large Archives in Parts (Multipart Upload) and
      # Initiate Multipart Upload in the Amazon Glacier Developer Guide .

      def initiate_multipart_upload(
        account_id : String,
        vault_name : String,
        archive_description : String? = nil,
        part_size : String? = nil
      ) : Protocol::Request
        input = Types::InitiateMultipartUploadInput.new(account_id: account_id, vault_name: vault_name, archive_description: archive_description, part_size: part_size)
        initiate_multipart_upload(input)
      end

      def initiate_multipart_upload(input : Types::InitiateMultipartUploadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIATE_MULTIPART_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation initiates the vault locking process by doing the following: Installing a vault lock
      # policy on the specified vault. Setting the lock state of vault lock to InProgress . Returning a lock
      # ID, which is used to complete the vault locking process. You can set one vault lock policy for each
      # vault and this policy can be up to 20 KB in size. For more information about vault lock policies,
      # see Amazon Glacier Access Control with Vault Lock Policies . You must complete the vault locking
      # process within 24 hours after the vault lock enters the InProgress state. After the 24 hour window
      # ends, the lock ID expires, the vault automatically exits the InProgress state, and the vault lock
      # policy is removed from the vault. You call CompleteVaultLock to complete the vault locking process
      # by setting the state of the vault lock to Locked . After a vault lock is in the Locked state, you
      # cannot initiate a new vault lock for the vault. You can abort the vault locking process by calling
      # AbortVaultLock . You can get the state of the vault lock by calling GetVaultLock . For more
      # information about the vault locking process, Amazon Glacier Vault Lock . If this operation is called
      # when the vault lock is in the InProgress state, the operation returns an AccessDeniedException
      # error. When the vault lock is in the InProgress state you must call AbortVaultLock before you can
      # initiate a new vault lock policy.

      def initiate_vault_lock(
        account_id : String,
        vault_name : String,
        policy : Types::VaultLockPolicy? = nil
      ) : Protocol::Request
        input = Types::InitiateVaultLockInput.new(account_id: account_id, vault_name: vault_name, policy: policy)
        initiate_vault_lock(input)
      end

      def initiate_vault_lock(input : Types::InitiateVaultLockInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INITIATE_VAULT_LOCK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists jobs for a vault, including jobs that are in-progress and jobs that have
      # recently finished. The List Job operation returns a list of these jobs sorted by job initiation
      # time. Amazon Glacier retains recently completed jobs for a period before deleting them; however, it
      # eventually removes completed jobs. The output of completed jobs can be retrieved. Retaining
      # completed jobs for a period of time after they have completed enables you to get a job output in the
      # event you miss the job completion notification or your first attempt to download it fails. For
      # example, suppose you start an archive retrieval job to download an archive. After the job completes,
      # you start to download the archive but encounter a network error. In this scenario, you can retry and
      # download the archive while the job exists. The List Jobs operation supports pagination. You should
      # always check the response Marker field. If there are no more jobs to list, the Marker field is set
      # to null . If there are more jobs to list, the Marker field is set to a non-null value, which you can
      # use to continue the pagination of the list. To return a list of jobs that begins at a specific job,
      # set the marker request parameter to the Marker value for that job that you obtained from a previous
      # List Jobs request. You can set a maximum limit for the number of jobs returned in the response by
      # specifying the limit parameter in the request. The default limit is 50. The number of jobs returned
      # might be fewer than the limit, but the number of returned jobs never exceeds the limit.
      # Additionally, you can filter the jobs list returned by specifying the optional statuscode parameter
      # or completed parameter, or both. Using the statuscode parameter, you can specify to return only jobs
      # that match either the InProgress , Succeeded , or Failed status. Using the completed parameter, you
      # can specify to return only jobs that were completed ( true ) or jobs that were not completed ( false
      # ). For more information about using this operation, see the documentation for the underlying REST
      # API List Jobs .

      def list_jobs(
        account_id : String,
        vault_name : String,
        completed : String? = nil,
        limit : String? = nil,
        marker : String? = nil,
        statuscode : String? = nil
      ) : Protocol::Request
        input = Types::ListJobsInput.new(account_id: account_id, vault_name: vault_name, completed: completed, limit: limit, marker: marker, statuscode: statuscode)
        list_jobs(input)
      end

      def list_jobs(input : Types::ListJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists in-progress multipart uploads for the specified vault. An in-progress multipart
      # upload is a multipart upload that has been initiated by an InitiateMultipartUpload request, but has
      # not yet been completed or aborted. The list returned in the List Multipart Upload response has no
      # guaranteed order. The List Multipart Uploads operation supports pagination. By default, this
      # operation returns up to 50 multipart uploads in the response. You should always check the response
      # for a marker at which to continue the list; if there are no more items the marker is null . To
      # return a list of multipart uploads that begins at a specific upload, set the marker request
      # parameter to the value you obtained from a previous List Multipart Upload request. You can also
      # limit the number of uploads returned in the response by specifying the limit parameter in the
      # request. Note the difference between this operation and listing parts ( ListParts ). The List
      # Multipart Uploads operation lists all multipart uploads for a vault and does not require a multipart
      # upload ID. The List Parts operation requires a multipart upload ID since parts are associated with a
      # single upload. An AWS account has full permission to perform all operations (actions). However, AWS
      # Identity and Access Management (IAM) users don't have any permissions by default. You must grant
      # them explicit permission to perform specific actions. For more information, see Access Control Using
      # AWS Identity and Access Management (IAM) . For conceptual information and the underlying REST API,
      # see Working with Archives in Amazon Glacier and List Multipart Uploads in the Amazon Glacier
      # Developer Guide .

      def list_multipart_uploads(
        account_id : String,
        vault_name : String,
        limit : String? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::ListMultipartUploadsInput.new(account_id: account_id, vault_name: vault_name, limit: limit, marker: marker)
        list_multipart_uploads(input)
      end

      def list_multipart_uploads(input : Types::ListMultipartUploadsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTIPART_UPLOADS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists the parts of an archive that have been uploaded in a specific multipart upload.
      # You can make this request at any time during an in-progress multipart upload before you complete the
      # upload (see CompleteMultipartUpload . List Parts returns an error for completed uploads. The list
      # returned in the List Parts response is sorted by part range. The List Parts operation supports
      # pagination. By default, this operation returns up to 50 uploaded parts in the response. You should
      # always check the response for a marker at which to continue the list; if there are no more items the
      # marker is null . To return a list of parts that begins at a specific part, set the marker request
      # parameter to the value you obtained from a previous List Parts request. You can also limit the
      # number of parts returned in the response by specifying the limit parameter in the request. An AWS
      # account has full permission to perform all operations (actions). However, AWS Identity and Access
      # Management (IAM) users don't have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see Access Control Using AWS Identity
      # and Access Management (IAM) . For conceptual information and the underlying REST API, see Working
      # with Archives in Amazon Glacier and List Parts in the Amazon Glacier Developer Guide .

      def list_parts(
        account_id : String,
        upload_id : String,
        vault_name : String,
        limit : String? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::ListPartsInput.new(account_id: account_id, upload_id: upload_id, vault_name: vault_name, limit: limit, marker: marker)
        list_parts(input)
      end

      def list_parts(input : Types::ListPartsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PARTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists the provisioned capacity units for the specified AWS account.

      def list_provisioned_capacity(
        account_id : String
      ) : Protocol::Request
        input = Types::ListProvisionedCapacityInput.new(account_id: account_id)
        list_provisioned_capacity(input)
      end

      def list_provisioned_capacity(input : Types::ListProvisionedCapacityInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROVISIONED_CAPACITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists all the tags attached to a vault. The operation returns an empty map if there
      # are no tags. For more information about tags, see Tagging Amazon Glacier Resources .

      def list_tags_for_vault(
        account_id : String,
        vault_name : String
      ) : Protocol::Request
        input = Types::ListTagsForVaultInput.new(account_id: account_id, vault_name: vault_name)
        list_tags_for_vault(input)
      end

      def list_tags_for_vault(input : Types::ListTagsForVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation lists all vaults owned by the calling user's account. The list returned in the
      # response is ASCII-sorted by vault name. By default, this operation returns up to 10 items. If there
      # are more vaults to list, the response marker field contains the vault Amazon Resource Name (ARN) at
      # which to continue the list with a new List Vaults request; otherwise, the marker field is null . To
      # return a list of vaults that begins at a specific vault, set the marker request parameter to the
      # vault ARN you obtained from a previous List Vaults request. You can also limit the number of vaults
      # returned in the response by specifying the limit parameter in the request. An AWS account has full
      # permission to perform all operations (actions). However, AWS Identity and Access Management (IAM)
      # users don't have any permissions by default. You must grant them explicit permission to perform
      # specific actions. For more information, see Access Control Using AWS Identity and Access Management
      # (IAM) . For conceptual information and underlying REST API, see Retrieving Vault Metadata in Amazon
      # Glacier and List Vaults in the Amazon Glacier Developer Guide .

      def list_vaults(
        account_id : String,
        limit : String? = nil,
        marker : String? = nil
      ) : Protocol::Request
        input = Types::ListVaultsInput.new(account_id: account_id, limit: limit, marker: marker)
        list_vaults(input)
      end

      def list_vaults(input : Types::ListVaultsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VAULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation purchases a provisioned capacity unit for an AWS account.

      def purchase_provisioned_capacity(
        account_id : String
      ) : Protocol::Request
        input = Types::PurchaseProvisionedCapacityInput.new(account_id: account_id)
        purchase_provisioned_capacity(input)
      end

      def purchase_provisioned_capacity(input : Types::PurchaseProvisionedCapacityInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PURCHASE_PROVISIONED_CAPACITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation removes one or more tags from the set of tags attached to a vault. For more
      # information about tags, see Tagging Amazon Glacier Resources . This operation is idempotent. The
      # operation will be successful, even if there are no tags attached to the vault.

      def remove_tags_from_vault(
        account_id : String,
        vault_name : String,
        tag_keys : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RemoveTagsFromVaultInput.new(account_id: account_id, vault_name: vault_name, tag_keys: tag_keys)
        remove_tags_from_vault(input)
      end

      def remove_tags_from_vault(input : Types::RemoveTagsFromVaultInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_TAGS_FROM_VAULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation sets and then enacts a data retrieval policy in the region specified in the PUT
      # request. You can set one policy per region for an AWS account. The policy is enacted within a few
      # minutes of a successful PUT operation. The set policy operation does not affect retrieval jobs that
      # were in progress before the policy was enacted. For more information about data retrieval policies,
      # see Amazon Glacier Data Retrieval Policies .

      def set_data_retrieval_policy(
        account_id : String,
        policy : Types::DataRetrievalPolicy? = nil
      ) : Protocol::Request
        input = Types::SetDataRetrievalPolicyInput.new(account_id: account_id, policy: policy)
        set_data_retrieval_policy(input)
      end

      def set_data_retrieval_policy(input : Types::SetDataRetrievalPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_DATA_RETRIEVAL_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation configures an access policy for a vault and will overwrite an existing policy. To
      # configure a vault access policy, send a PUT request to the access-policy subresource of the vault.
      # An access policy is specific to a vault and is also called a vault subresource. You can set one
      # access policy per vault and the policy can be up to 20 KB in size. For more information about vault
      # access policies, see Amazon Glacier Access Control with Vault Access Policies .

      def set_vault_access_policy(
        account_id : String,
        vault_name : String,
        policy : Types::VaultAccessPolicy? = nil
      ) : Protocol::Request
        input = Types::SetVaultAccessPolicyInput.new(account_id: account_id, vault_name: vault_name, policy: policy)
        set_vault_access_policy(input)
      end

      def set_vault_access_policy(input : Types::SetVaultAccessPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_VAULT_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation configures notifications that will be sent when specific events happen to a vault. By
      # default, you don't get any notifications. To configure vault notifications, send a PUT request to
      # the notification-configuration subresource of the vault. The request should include a JSON document
      # that provides an Amazon SNS topic and specific events for which you want Amazon Glacier to send
      # notifications to the topic. Amazon SNS topics must grant permission to the vault to be allowed to
      # publish notifications to the topic. You can configure a vault to publish a notification for the
      # following vault events: ArchiveRetrievalCompleted This event occurs when a job that was initiated
      # for an archive retrieval is completed ( InitiateJob ). The status of the completed job can be
      # "Succeeded" or "Failed". The notification sent to the SNS topic is the same output as returned from
      # DescribeJob . InventoryRetrievalCompleted This event occurs when a job that was initiated for an
      # inventory retrieval is completed ( InitiateJob ). The status of the completed job can be "Succeeded"
      # or "Failed". The notification sent to the SNS topic is the same output as returned from DescribeJob
      # . An AWS account has full permission to perform all operations (actions). However, AWS Identity and
      # Access Management (IAM) users don't have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see Access Control Using AWS Identity
      # and Access Management (IAM) . For conceptual information and underlying REST API, see Configuring
      # Vault Notifications in Amazon Glacier and Set Vault Notification Configuration in the Amazon Glacier
      # Developer Guide .

      def set_vault_notifications(
        account_id : String,
        vault_name : String,
        vault_notification_config : Types::VaultNotificationConfig? = nil
      ) : Protocol::Request
        input = Types::SetVaultNotificationsInput.new(account_id: account_id, vault_name: vault_name, vault_notification_config: vault_notification_config)
        set_vault_notifications(input)
      end

      def set_vault_notifications(input : Types::SetVaultNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SET_VAULT_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation adds an archive to a vault. This is a synchronous operation, and for a successful
      # upload, your data is durably persisted. Amazon Glacier returns the archive ID in the
      # x-amz-archive-id header of the response. You must use the archive ID to access your data in Amazon
      # Glacier. After you upload an archive, you should save the archive ID returned so that you can
      # retrieve or delete the archive later. Besides saving the archive ID, you can also index it and give
      # it a friendly name to allow for better searching. You can also use the optional archive description
      # field to specify how the archive is referred to in an external index of archives, such as you might
      # create in Amazon DynamoDB. You can also get the vault inventory to obtain a list of archive IDs in a
      # vault. For more information, see InitiateJob . You must provide a SHA256 tree hash of the data you
      # are uploading. For information about computing a SHA256 tree hash, see Computing Checksums . You can
      # optionally specify an archive description of up to 1,024 printable ASCII characters. You can get the
      # archive description when you either retrieve the archive or get the vault inventory. For more
      # information, see InitiateJob . Amazon Glacier does not interpret the description in any way. An
      # archive description does not need to be unique. You cannot use the description to retrieve or sort
      # the archive list. Archives are immutable. After you upload an archive, you cannot edit the archive
      # or its description. An AWS account has full permission to perform all operations (actions). However,
      # AWS Identity and Access Management (IAM) users don't have any permissions by default. You must grant
      # them explicit permission to perform specific actions. For more information, see Access Control Using
      # AWS Identity and Access Management (IAM) . For conceptual information and underlying REST API, see
      # Uploading an Archive in Amazon Glacier and Upload Archive in the Amazon Glacier Developer Guide .

      def upload_archive(
        account_id : String,
        vault_name : String,
        archive_description : String? = nil,
        body : Bytes? = nil,
        checksum : String? = nil
      ) : Protocol::Request
        input = Types::UploadArchiveInput.new(account_id: account_id, vault_name: vault_name, archive_description: archive_description, body: body, checksum: checksum)
        upload_archive(input)
      end

      def upload_archive(input : Types::UploadArchiveInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPLOAD_ARCHIVE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation uploads a part of an archive. You can upload archive parts in any order. You can also
      # upload them in parallel. You can upload up to 10,000 parts for a multipart upload. Amazon Glacier
      # rejects your upload part request if any of the following conditions is true: SHA256 tree hash does
      # not match To ensure that part data is not corrupted in transmission, you compute a SHA256 tree hash
      # of the part and include it in your request. Upon receiving the part data, Amazon Glacier also
      # computes a SHA256 tree hash. If these hash values don't match, the operation fails. For information
      # about computing a SHA256 tree hash, see Computing Checksums . Part size does not match The size of
      # each part except the last must match the size specified in the corresponding InitiateMultipartUpload
      # request. The size of the last part must be the same size as, or smaller than, the specified size. If
      # you upload a part whose size is smaller than the part size you specified in your initiate multipart
      # upload request and that part is not the last part, then the upload part request will succeed.
      # However, the subsequent Complete Multipart Upload request will fail. Range does not align The byte
      # range value in the request does not align with the part size specified in the corresponding initiate
      # request. For example, if you specify a part size of 4194304 bytes (4 MB), then 0 to 4194303 bytes (4
      # MB - 1) and 4194304 (4 MB) to 8388607 (8 MB - 1) are valid part ranges. However, if you set a range
      # value of 2 MB to 6 MB, the range does not align with the part size and the upload will fail. This
      # operation is idempotent. If you upload the same part multiple times, the data included in the most
      # recent request overwrites the previously uploaded data. An AWS account has full permission to
      # perform all operations (actions). However, AWS Identity and Access Management (IAM) users don't have
      # any permissions by default. You must grant them explicit permission to perform specific actions. For
      # more information, see Access Control Using AWS Identity and Access Management (IAM) . For conceptual
      # information and underlying REST API, see Uploading Large Archives in Parts (Multipart Upload) and
      # Upload Part in the Amazon Glacier Developer Guide .

      def upload_multipart_part(
        account_id : String,
        upload_id : String,
        vault_name : String,
        body : Bytes? = nil,
        checksum : String? = nil,
        range : String? = nil
      ) : Protocol::Request
        input = Types::UploadMultipartPartInput.new(account_id: account_id, upload_id: upload_id, vault_name: vault_name, body: body, checksum: checksum, range: range)
        upload_multipart_part(input)
      end

      def upload_multipart_part(input : Types::UploadMultipartPartInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPLOAD_MULTIPART_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
