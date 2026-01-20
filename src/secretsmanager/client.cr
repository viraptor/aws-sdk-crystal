module Aws
  module SecretsManager
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Retrieves the contents of the encrypted fields SecretString or SecretBinary for up to 20 secrets. To
      # retrieve a single secret, call GetSecretValue . To choose which secrets to retrieve, you can specify
      # a list of secrets by name or ARN, or you can use filters. If Secrets Manager encounters errors such
      # as AccessDeniedException while attempting to retrieve any of the secrets, you can see the errors in
      # Errors in the response. Secrets Manager generates CloudTrail GetSecretValue log entries for each
      # secret you request when you call this action. Do not include sensitive information in request
      # parameters because it might be logged. For more information, see Logging Secrets Manager events with
      # CloudTrail . Required permissions: secretsmanager:BatchGetSecretValue , and you must have
      # secretsmanager:GetSecretValue for each secret. If you use filters, you must also have
      # secretsmanager:ListSecrets . If the secrets are encrypted using customer-managed keys instead of the
      # Amazon Web Services managed key aws/secretsmanager , then you also need kms:Decrypt permissions for
      # the keys. For more information, see IAM policy actions for Secrets Manager and Authentication and
      # access control in Secrets Manager .

      def batch_get_secret_value(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        secret_id_list : Array(String)? = nil
      ) : Types::BatchGetSecretValueResponse

        input = Types::BatchGetSecretValueRequest.new(filters: filters, max_results: max_results, next_token: next_token, secret_id_list: secret_id_list)
        batch_get_secret_value(input)
      end

      def batch_get_secret_value(input : Types::BatchGetSecretValueRequest) : Types::BatchGetSecretValueResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_SECRET_VALUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetSecretValueResponse, "BatchGetSecretValue")
      end

      # Turns off automatic rotation, and if a rotation is currently in progress, cancels the rotation. If
      # you cancel a rotation in progress, it can leave the VersionStage labels in an unexpected state. You
      # might need to remove the staging label AWSPENDING from the partially created version. You also need
      # to determine whether to roll back to the previous version of the secret by moving the staging label
      # AWSCURRENT to the version that has AWSPENDING . To determine which version has a specific staging
      # label, call ListSecretVersionIds . Then use UpdateSecretVersionStage to change staging labels. For
      # more information, see How rotation works . To turn on automatic rotation again, call RotateSecret .
      # Secrets Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters because it might be logged. For more information, see Logging
      # Secrets Manager events with CloudTrail . Required permissions: secretsmanager:CancelRotateSecret .
      # For more information, see IAM policy actions for Secrets Manager and Authentication and access
      # control in Secrets Manager .

      def cancel_rotate_secret(
        secret_id : String
      ) : Types::CancelRotateSecretResponse

        input = Types::CancelRotateSecretRequest.new(secret_id: secret_id)
        cancel_rotate_secret(input)
      end

      def cancel_rotate_secret(input : Types::CancelRotateSecretRequest) : Types::CancelRotateSecretResponse
        request = Protocol::JsonRpc.build_request(Model::CANCEL_ROTATE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelRotateSecretResponse, "CancelRotateSecret")
      end

      # Creates a new secret. A secret can be a password, a set of credentials such as a user name and
      # password, an OAuth token, or other secret information that you store in an encrypted form in Secrets
      # Manager. The secret also includes the connection information to access a database or other service,
      # which Secrets Manager doesn't encrypt. A secret in Secrets Manager consists of both the protected
      # secret data and the important information needed to manage the secret. For secrets that use managed
      # rotation , you need to create the secret through the managing service. For more information, see
      # Secrets Manager secrets managed by other Amazon Web Services services . For information about
      # creating a secret in the console, see Create a secret . To create a secret, you can provide the
      # secret value to be encrypted in either the SecretString parameter or the SecretBinary parameter, but
      # not both. If you include SecretString or SecretBinary then Secrets Manager creates an initial secret
      # version and automatically attaches the staging label AWSCURRENT to it. For database credentials you
      # want to rotate, for Secrets Manager to be able to rotate the secret, you must make sure the JSON you
      # store in the SecretString matches the JSON structure of a database secret . If you don't specify an
      # KMS encryption key, Secrets Manager uses the Amazon Web Services managed key aws/secretsmanager . If
      # this key doesn't already exist in your account, then Secrets Manager creates it for you
      # automatically. All users and roles in the Amazon Web Services account automatically have access to
      # use aws/secretsmanager . Creating aws/secretsmanager can result in a one-time significant delay in
      # returning the result. If the secret is in a different Amazon Web Services account from the
      # credentials calling the API, then you can't use aws/secretsmanager to encrypt the secret, and you
      # must create and use a customer managed KMS key. Secrets Manager generates a CloudTrail log entry
      # when you call this action. Do not include sensitive information in request parameters except
      # SecretBinary or SecretString because it might be logged. For more information, see Logging Secrets
      # Manager events with CloudTrail . Required permissions: secretsmanager:CreateSecret . If you include
      # tags in the secret, you also need secretsmanager:TagResource . To add replica Regions, you must also
      # have secretsmanager:ReplicateSecretToRegions . For more information, see IAM policy actions for
      # Secrets Manager and Authentication and access control in Secrets Manager . To encrypt the secret
      # with a KMS key other than aws/secretsmanager , you need kms:GenerateDataKey and kms:Decrypt
      # permission to the key. When you enter commands in a command shell, there is a risk of the command
      # history being accessed or utilities having access to your command parameters. This is a concern if
      # the command includes the value of a secret. Learn how to Mitigate the risks of using command-line
      # tools to store Secrets Manager secrets .

      def create_secret(
        name : String,
        add_replica_regions : Array(Types::ReplicaRegionType)? = nil,
        client_request_token : String? = nil,
        description : String? = nil,
        force_overwrite_replica_secret : Bool? = nil,
        kms_key_id : String? = nil,
        secret_binary : Bytes? = nil,
        secret_string : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil
      ) : Types::CreateSecretResponse

        input = Types::CreateSecretRequest.new(name: name, add_replica_regions: add_replica_regions, client_request_token: client_request_token, description: description, force_overwrite_replica_secret: force_overwrite_replica_secret, kms_key_id: kms_key_id, secret_binary: secret_binary, secret_string: secret_string, tags: tags, type: type)
        create_secret(input)
      end

      def create_secret(input : Types::CreateSecretRequest) : Types::CreateSecretResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSecretResponse, "CreateSecret")
      end

      # Deletes the resource-based permission policy attached to the secret. To attach a policy to a secret,
      # use PutResourcePolicy . Secrets Manager generates a CloudTrail log entry when you call this action.
      # Do not include sensitive information in request parameters because it might be logged. For more
      # information, see Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:DeleteResourcePolicy . For more information, see IAM policy actions for Secrets
      # Manager and Authentication and access control in Secrets Manager .

      def delete_resource_policy(
        secret_id : String
      ) : Types::DeleteResourcePolicyResponse

        input = Types::DeleteResourcePolicyRequest.new(secret_id: secret_id)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Deletes a secret and all of its versions. You can specify a recovery window during which you can
      # restore the secret. The minimum recovery window is 7 days. The default recovery window is 30 days.
      # Secrets Manager attaches a DeletionDate stamp to the secret that specifies the end of the recovery
      # window. At the end of the recovery window, Secrets Manager deletes the secret permanently. You can't
      # delete a primary secret that is replicated to other Regions. You must first delete the replicas
      # using RemoveRegionsFromReplication , and then delete the primary secret. When you delete a replica,
      # it is deleted immediately. You can't directly delete a version of a secret. Instead, you remove all
      # staging labels from the version using UpdateSecretVersionStage . This marks the version as
      # deprecated, and then Secrets Manager can automatically delete the version in the background. To
      # determine whether an application still uses a secret, you can create an Amazon CloudWatch alarm to
      # alert you to any attempts to access a secret during the recovery window. For more information, see
      # Monitor secrets scheduled for deletion . Secrets Manager performs the permanent secret deletion at
      # the end of the waiting period as a background task with low priority. There is no guarantee of a
      # specific time after the recovery window for the permanent delete to occur. At any time before
      # recovery window ends, you can use RestoreSecret to remove the DeletionDate and cancel the deletion
      # of the secret. When a secret is scheduled for deletion, you cannot retrieve the secret value. You
      # must first cancel the deletion with RestoreSecret and then you can retrieve the secret. Secrets
      # Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters because it might be logged. For more information, see Logging
      # Secrets Manager events with CloudTrail . Required permissions: secretsmanager:DeleteSecret . For
      # more information, see IAM policy actions for Secrets Manager and Authentication and access control
      # in Secrets Manager .

      def delete_secret(
        secret_id : String,
        force_delete_without_recovery : Bool? = nil,
        recovery_window_in_days : Int64? = nil
      ) : Types::DeleteSecretResponse

        input = Types::DeleteSecretRequest.new(secret_id: secret_id, force_delete_without_recovery: force_delete_without_recovery, recovery_window_in_days: recovery_window_in_days)
        delete_secret(input)
      end

      def delete_secret(input : Types::DeleteSecretRequest) : Types::DeleteSecretResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSecretResponse, "DeleteSecret")
      end

      # Retrieves the details of a secret. It does not include the encrypted secret value. Secrets Manager
      # only returns fields that have a value in the response. Secrets Manager generates a CloudTrail log
      # entry when you call this action. Do not include sensitive information in request parameters because
      # it might be logged. For more information, see Logging Secrets Manager events with CloudTrail .
      # Required permissions: secretsmanager:DescribeSecret . For more information, see IAM policy actions
      # for Secrets Manager and Authentication and access control in Secrets Manager .

      def describe_secret(
        secret_id : String
      ) : Types::DescribeSecretResponse

        input = Types::DescribeSecretRequest.new(secret_id: secret_id)
        describe_secret(input)
      end

      def describe_secret(input : Types::DescribeSecretRequest) : Types::DescribeSecretResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSecretResponse, "DescribeSecret")
      end

      # Generates a random password. We recommend that you specify the maximum length and include every
      # character type that the system you are generating a password for can support. By default, Secrets
      # Manager uses uppercase and lowercase letters, numbers, and the following characters in passwords:
      # !\"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\\]^_`{|}~ Secrets Manager generates a CloudTrail log entry when
      # you call this action. Required permissions: secretsmanager:GetRandomPassword . For more information,
      # see IAM policy actions for Secrets Manager and Authentication and access control in Secrets Manager
      # .

      def get_random_password(
        exclude_characters : String? = nil,
        exclude_lowercase : Bool? = nil,
        exclude_numbers : Bool? = nil,
        exclude_punctuation : Bool? = nil,
        exclude_uppercase : Bool? = nil,
        include_space : Bool? = nil,
        password_length : Int64? = nil,
        require_each_included_type : Bool? = nil
      ) : Types::GetRandomPasswordResponse

        input = Types::GetRandomPasswordRequest.new(exclude_characters: exclude_characters, exclude_lowercase: exclude_lowercase, exclude_numbers: exclude_numbers, exclude_punctuation: exclude_punctuation, exclude_uppercase: exclude_uppercase, include_space: include_space, password_length: password_length, require_each_included_type: require_each_included_type)
        get_random_password(input)
      end

      def get_random_password(input : Types::GetRandomPasswordRequest) : Types::GetRandomPasswordResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RANDOM_PASSWORD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRandomPasswordResponse, "GetRandomPassword")
      end

      # Retrieves the JSON text of the resource-based policy document attached to the secret. For more
      # information about permissions policies attached to a secret, see Permissions policies attached to a
      # secret . Secrets Manager generates a CloudTrail log entry when you call this action. Do not include
      # sensitive information in request parameters because it might be logged. For more information, see
      # Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:GetResourcePolicy . For more information, see IAM policy actions for Secrets Manager
      # and Authentication and access control in Secrets Manager .

      def get_resource_policy(
        secret_id : String
      ) : Types::GetResourcePolicyResponse

        input = Types::GetResourcePolicyRequest.new(secret_id: secret_id)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Types::GetResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePolicyResponse, "GetResourcePolicy")
      end

      # Retrieves the contents of the encrypted fields SecretString or SecretBinary from the specified
      # version of a secret, whichever contains content. To retrieve the values for a group of secrets, call
      # BatchGetSecretValue . We recommend that you cache your secret values by using client-side caching.
      # Caching secrets improves speed and reduces your costs. For more information, see Cache secrets for
      # your applications . To retrieve the previous version of a secret, use VersionStage and specify
      # AWSPREVIOUS. To revert to the previous version of a secret, call UpdateSecretVersionStage . Secrets
      # Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters because it might be logged. For more information, see Logging
      # Secrets Manager events with CloudTrail . Required permissions: secretsmanager:GetSecretValue . If
      # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
      # aws/secretsmanager , then you also need kms:Decrypt permissions for that key. For more information,
      # see IAM policy actions for Secrets Manager and Authentication and access control in Secrets Manager
      # .

      def get_secret_value(
        secret_id : String,
        version_id : String? = nil,
        version_stage : String? = nil
      ) : Types::GetSecretValueResponse

        input = Types::GetSecretValueRequest.new(secret_id: secret_id, version_id: version_id, version_stage: version_stage)
        get_secret_value(input)
      end

      def get_secret_value(input : Types::GetSecretValueRequest) : Types::GetSecretValueResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SECRET_VALUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSecretValueResponse, "GetSecretValue")
      end

      # Lists the versions of a secret. Secrets Manager uses staging labels to indicate the different
      # versions of a secret. For more information, see Secrets Manager concepts: Versions . To list the
      # secrets in the account, use ListSecrets . Secrets Manager generates a CloudTrail log entry when you
      # call this action. Do not include sensitive information in request parameters because it might be
      # logged. For more information, see Logging Secrets Manager events with CloudTrail . Required
      # permissions: secretsmanager:ListSecretVersionIds . For more information, see IAM policy actions for
      # Secrets Manager and Authentication and access control in Secrets Manager .

      def list_secret_version_ids(
        secret_id : String,
        include_deprecated : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSecretVersionIdsResponse

        input = Types::ListSecretVersionIdsRequest.new(secret_id: secret_id, include_deprecated: include_deprecated, max_results: max_results, next_token: next_token)
        list_secret_version_ids(input)
      end

      def list_secret_version_ids(input : Types::ListSecretVersionIdsRequest) : Types::ListSecretVersionIdsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SECRET_VERSION_IDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecretVersionIdsResponse, "ListSecretVersionIds")
      end

      # Lists the secrets that are stored by Secrets Manager in the Amazon Web Services account, not
      # including secrets that are marked for deletion. To see secrets marked for deletion, use the Secrets
      # Manager console. All Secrets Manager operations are eventually consistent. ListSecrets might not
      # reflect changes from the last five minutes. You can get more recent information for a specific
      # secret by calling DescribeSecret . To list the versions of a secret, use ListSecretVersionIds . To
      # retrieve the values for the secrets, call BatchGetSecretValue or GetSecretValue . For information
      # about finding secrets in the console, see Find secrets in Secrets Manager . Secrets Manager
      # generates a CloudTrail log entry when you call this action. Do not include sensitive information in
      # request parameters because it might be logged. For more information, see Logging Secrets Manager
      # events with CloudTrail . Required permissions: secretsmanager:ListSecrets . For more information,
      # see IAM policy actions for Secrets Manager and Authentication and access control in Secrets Manager
      # .

      def list_secrets(
        filters : Array(Types::Filter)? = nil,
        include_planned_deletion : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListSecretsResponse

        input = Types::ListSecretsRequest.new(filters: filters, include_planned_deletion: include_planned_deletion, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_secrets(input)
      end

      def list_secrets(input : Types::ListSecretsRequest) : Types::ListSecretsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SECRETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecretsResponse, "ListSecrets")
      end

      # Attaches a resource-based permission policy to a secret. A resource-based policy is optional. For
      # more information, see Authentication and access control for Secrets Manager For information about
      # attaching a policy in the console, see Attach a permissions policy to a secret . Secrets Manager
      # generates a CloudTrail log entry when you call this action. Do not include sensitive information in
      # request parameters because it might be logged. For more information, see Logging Secrets Manager
      # events with CloudTrail . Required permissions: secretsmanager:PutResourcePolicy . For more
      # information, see IAM policy actions for Secrets Manager and Authentication and access control in
      # Secrets Manager .

      def put_resource_policy(
        resource_policy : String,
        secret_id : String,
        block_public_policy : Bool? = nil
      ) : Types::PutResourcePolicyResponse

        input = Types::PutResourcePolicyRequest.new(resource_policy: resource_policy, secret_id: secret_id, block_public_policy: block_public_policy)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Creates a new version of your secret by creating a new encrypted value and attaching it to the
      # secret. version can contain a new SecretString value or a new SecretBinary value. Do not call
      # PutSecretValue at a sustained rate of more than once every 10 minutes. When you update the secret
      # value, Secrets Manager creates a new version of the secret. Secrets Manager keeps 100 of the most
      # recent versions, but it keeps all secret versions created in the last 24 hours. If you call
      # PutSecretValue more than once every 10 minutes, you will create more versions than Secrets Manager
      # removes, and you will reach the quota for secret versions. You can specify the staging labels to
      # attach to the new version in VersionStages . If you don't include VersionStages , then Secrets
      # Manager automatically moves the staging label AWSCURRENT to this version. If this operation creates
      # the first version for the secret, then Secrets Manager automatically attaches the staging label
      # AWSCURRENT to it. If this operation moves the staging label AWSCURRENT from another version to this
      # version, then Secrets Manager also automatically moves the staging label AWSPREVIOUS to the version
      # that AWSCURRENT was removed from. This operation is idempotent. If you call this operation with a
      # ClientRequestToken that matches an existing version's VersionId, and you specify the same secret
      # data, the operation succeeds but does nothing. However, if the secret data is different, then the
      # operation fails because you can't modify an existing version; you can only create new ones. Secrets
      # Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters except SecretBinary , SecretString , or RotationToken because it
      # might be logged. For more information, see Logging Secrets Manager events with CloudTrail . Required
      # permissions: secretsmanager:PutSecretValue . For more information, see IAM policy actions for
      # Secrets Manager and Authentication and access control in Secrets Manager . When you enter commands
      # in a command shell, there is a risk of the command history being accessed or utilities having access
      # to your command parameters. This is a concern if the command includes the value of a secret. Learn
      # how to Mitigate the risks of using command-line tools to store Secrets Manager secrets .

      def put_secret_value(
        secret_id : String,
        client_request_token : String? = nil,
        rotation_token : String? = nil,
        secret_binary : Bytes? = nil,
        secret_string : String? = nil,
        version_stages : Array(String)? = nil
      ) : Types::PutSecretValueResponse

        input = Types::PutSecretValueRequest.new(secret_id: secret_id, client_request_token: client_request_token, rotation_token: rotation_token, secret_binary: secret_binary, secret_string: secret_string, version_stages: version_stages)
        put_secret_value(input)
      end

      def put_secret_value(input : Types::PutSecretValueRequest) : Types::PutSecretValueResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SECRET_VALUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutSecretValueResponse, "PutSecretValue")
      end

      # For a secret that is replicated to other Regions, deletes the secret replicas from the Regions you
      # specify. Secrets Manager generates a CloudTrail log entry when you call this action. Do not include
      # sensitive information in request parameters because it might be logged. For more information, see
      # Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:RemoveRegionsFromReplication . For more information, see IAM policy actions for
      # Secrets Manager and Authentication and access control in Secrets Manager .

      def remove_regions_from_replication(
        remove_replica_regions : Array(String),
        secret_id : String
      ) : Types::RemoveRegionsFromReplicationResponse

        input = Types::RemoveRegionsFromReplicationRequest.new(remove_replica_regions: remove_replica_regions, secret_id: secret_id)
        remove_regions_from_replication(input)
      end

      def remove_regions_from_replication(input : Types::RemoveRegionsFromReplicationRequest) : Types::RemoveRegionsFromReplicationResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_REGIONS_FROM_REPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveRegionsFromReplicationResponse, "RemoveRegionsFromReplication")
      end

      # Replicates the secret to a new Regions. See Multi-Region secrets . Secrets Manager generates a
      # CloudTrail log entry when you call this action. Do not include sensitive information in request
      # parameters because it might be logged. For more information, see Logging Secrets Manager events with
      # CloudTrail . Required permissions: secretsmanager:ReplicateSecretToRegions . If the primary secret
      # is encrypted with a KMS key other than aws/secretsmanager , you also need kms:Decrypt permission to
      # the key. To encrypt the replicated secret with a KMS key other than aws/secretsmanager , you need
      # kms:GenerateDataKey and kms:Encrypt to the key. For more information, see IAM policy actions for
      # Secrets Manager and Authentication and access control in Secrets Manager .

      def replicate_secret_to_regions(
        add_replica_regions : Array(Types::ReplicaRegionType),
        secret_id : String,
        force_overwrite_replica_secret : Bool? = nil
      ) : Types::ReplicateSecretToRegionsResponse

        input = Types::ReplicateSecretToRegionsRequest.new(add_replica_regions: add_replica_regions, secret_id: secret_id, force_overwrite_replica_secret: force_overwrite_replica_secret)
        replicate_secret_to_regions(input)
      end

      def replicate_secret_to_regions(input : Types::ReplicateSecretToRegionsRequest) : Types::ReplicateSecretToRegionsResponse
        request = Protocol::JsonRpc.build_request(Model::REPLICATE_SECRET_TO_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ReplicateSecretToRegionsResponse, "ReplicateSecretToRegions")
      end

      # Cancels the scheduled deletion of a secret by removing the DeletedDate time stamp. You can access a
      # secret again after it has been restored. Secrets Manager generates a CloudTrail log entry when you
      # call this action. Do not include sensitive information in request parameters because it might be
      # logged. For more information, see Logging Secrets Manager events with CloudTrail . Required
      # permissions: secretsmanager:RestoreSecret . For more information, see IAM policy actions for Secrets
      # Manager and Authentication and access control in Secrets Manager .

      def restore_secret(
        secret_id : String
      ) : Types::RestoreSecretResponse

        input = Types::RestoreSecretRequest.new(secret_id: secret_id)
        restore_secret(input)
      end

      def restore_secret(input : Types::RestoreSecretRequest) : Types::RestoreSecretResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreSecretResponse, "RestoreSecret")
      end

      # Configures and starts the asynchronous process of rotating the secret. For information about
      # rotation, see Rotate secrets in the Secrets Manager User Guide . If you include the configuration
      # parameters, the operation sets the values for the secret and then immediately starts a rotation. If
      # you don't include the configuration parameters, the operation starts a rotation with the values
      # already stored in the secret. When rotation is successful, the AWSPENDING staging label might be
      # attached to the same version as the AWSCURRENT version, or it might not be attached to any version.
      # If the AWSPENDING staging label is present but not attached to the same version as AWSCURRENT , then
      # any later invocation of RotateSecret assumes that a previous rotation request is still in progress
      # and returns an error. When rotation is unsuccessful, the AWSPENDING staging label might be attached
      # to an empty secret version. For more information, see Troubleshoot rotation in the Secrets Manager
      # User Guide . Secrets Manager generates a CloudTrail log entry when you call this action. Do not
      # include sensitive information in request parameters because it might be logged. For more
      # information, see Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:RotateSecret . For more information, see IAM policy actions for Secrets Manager and
      # Authentication and access control in Secrets Manager . You also need lambda:InvokeFunction
      # permissions on the rotation function. For more information, see Permissions for rotation .

      def rotate_secret(
        secret_id : String,
        client_request_token : String? = nil,
        external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)? = nil,
        external_secret_rotation_role_arn : String? = nil,
        rotate_immediately : Bool? = nil,
        rotation_lambda_arn : String? = nil,
        rotation_rules : Types::RotationRulesType? = nil
      ) : Types::RotateSecretResponse

        input = Types::RotateSecretRequest.new(secret_id: secret_id, client_request_token: client_request_token, external_secret_rotation_metadata: external_secret_rotation_metadata, external_secret_rotation_role_arn: external_secret_rotation_role_arn, rotate_immediately: rotate_immediately, rotation_lambda_arn: rotation_lambda_arn, rotation_rules: rotation_rules)
        rotate_secret(input)
      end

      def rotate_secret(input : Types::RotateSecretRequest) : Types::RotateSecretResponse
        request = Protocol::JsonRpc.build_request(Model::ROTATE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RotateSecretResponse, "RotateSecret")
      end

      # Removes the link between the replica secret and the primary secret and promotes the replica to a
      # primary secret in the replica Region. You must call this operation from the Region in which you want
      # to promote the replica to a primary secret. Secrets Manager generates a CloudTrail log entry when
      # you call this action. Do not include sensitive information in request parameters because it might be
      # logged. For more information, see Logging Secrets Manager events with CloudTrail . Required
      # permissions: secretsmanager:StopReplicationToReplica . For more information, see IAM policy actions
      # for Secrets Manager and Authentication and access control in Secrets Manager .

      def stop_replication_to_replica(
        secret_id : String
      ) : Types::StopReplicationToReplicaResponse

        input = Types::StopReplicationToReplicaRequest.new(secret_id: secret_id)
        stop_replication_to_replica(input)
      end

      def stop_replication_to_replica(input : Types::StopReplicationToReplicaRequest) : Types::StopReplicationToReplicaResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_REPLICATION_TO_REPLICA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopReplicationToReplicaResponse, "StopReplicationToReplica")
      end

      # Attaches tags to a secret. Tags consist of a key name and a value. Tags are part of the secret's
      # metadata. They are not associated with specific versions of the secret. This operation appends tags
      # to the existing list of tags. For tag quotas and naming restrictions, see Service quotas for Tagging
      # in the Amazon Web Services General Reference guide . If you use tags as part of your security
      # strategy, then adding or removing a tag can change permissions. If successfully completing this
      # operation would result in you losing your permissions for this secret, then the operation is blocked
      # and returns an Access Denied error. Secrets Manager generates a CloudTrail log entry when you call
      # this action. Do not include sensitive information in request parameters because it might be logged.
      # For more information, see Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:TagResource . For more information, see IAM policy actions for Secrets Manager and
      # Authentication and access control in Secrets Manager .

      def tag_resource(
        secret_id : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::TagResourceRequest.new(secret_id: secret_id, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes specific tags from a secret. This operation is idempotent. If a requested tag is not
      # attached to the secret, no error is returned and the secret metadata is unchanged. If you use tags
      # as part of your security strategy, then removing a tag can change permissions. If successfully
      # completing this operation would result in you losing your permissions for this secret, then the
      # operation is blocked and returns an Access Denied error. Secrets Manager generates a CloudTrail log
      # entry when you call this action. Do not include sensitive information in request parameters because
      # it might be logged. For more information, see Logging Secrets Manager events with CloudTrail .
      # Required permissions: secretsmanager:UntagResource . For more information, see IAM policy actions
      # for Secrets Manager and Authentication and access control in Secrets Manager .

      def untag_resource(
        secret_id : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagResourceRequest.new(secret_id: secret_id, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Modifies the details of a secret, including metadata and the secret value. To change the secret
      # value, you can also use PutSecretValue . To change the rotation configuration of a secret, use
      # RotateSecret instead. To change a secret so that it is managed by another service, you need to
      # recreate the secret in that service. See Secrets Manager secrets managed by other Amazon Web
      # Services services . We recommend you avoid calling UpdateSecret at a sustained rate of more than
      # once every 10 minutes. When you call UpdateSecret to update the secret value, Secrets Manager
      # creates a new version of the secret. Secrets Manager removes outdated versions when there are more
      # than 100, but it does not remove versions created less than 24 hours ago. If you update the secret
      # value more than once every 10 minutes, you create more versions than Secrets Manager removes, and
      # you will reach the quota for secret versions. If you include SecretString or SecretBinary to create
      # a new secret version, Secrets Manager automatically moves the staging label AWSCURRENT to the new
      # version. Then it attaches the label AWSPREVIOUS to the version that AWSCURRENT was removed from. If
      # you call this operation with a ClientRequestToken that matches an existing version's VersionId , the
      # operation results in an error. You can't modify an existing version, you can only create a new
      # version. To remove a version, remove all staging labels from it. See UpdateSecretVersionStage .
      # Secrets Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters except SecretBinary or SecretString because it might be logged.
      # For more information, see Logging Secrets Manager events with CloudTrail . Required permissions:
      # secretsmanager:UpdateSecret . For more information, see IAM policy actions for Secrets Manager and
      # Authentication and access control in Secrets Manager . If you use a customer managed key, you must
      # also have kms:GenerateDataKey , kms:Encrypt , and kms:Decrypt permissions on the key. If you change
      # the KMS key and you don't have kms:Encrypt permission to the new key, Secrets Manager does not
      # re-encrypt existing secret versions with the new key. For more information, see Secret encryption
      # and decryption . When you enter commands in a command shell, there is a risk of the command history
      # being accessed or utilities having access to your command parameters. This is a concern if the
      # command includes the value of a secret. Learn how to Mitigate the risks of using command-line tools
      # to store Secrets Manager secrets .

      def update_secret(
        secret_id : String,
        client_request_token : String? = nil,
        description : String? = nil,
        kms_key_id : String? = nil,
        secret_binary : Bytes? = nil,
        secret_string : String? = nil,
        type : String? = nil
      ) : Types::UpdateSecretResponse

        input = Types::UpdateSecretRequest.new(secret_id: secret_id, client_request_token: client_request_token, description: description, kms_key_id: kms_key_id, secret_binary: secret_binary, secret_string: secret_string, type: type)
        update_secret(input)
      end

      def update_secret(input : Types::UpdateSecretRequest) : Types::UpdateSecretResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SECRET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSecretResponse, "UpdateSecret")
      end

      # Modifies the staging labels attached to a version of a secret. Secrets Manager uses staging labels
      # to track a version as it progresses through the secret rotation process. Each staging label can be
      # attached to only one version at a time. To add a staging label to a version when it is already
      # attached to another version, Secrets Manager first removes it from the other version first and then
      # attaches it to this one. For more information about versions and staging labels, see Concepts:
      # Version . The staging labels that you specify in the VersionStage parameter are added to the
      # existing list of staging labels for the version. You can move the AWSCURRENT staging label to this
      # version by including it in this call. Whenever you move AWSCURRENT , Secrets Manager automatically
      # moves the label AWSPREVIOUS to the version that AWSCURRENT was removed from. If this action results
      # in the last label being removed from a version, then the version is considered to be 'deprecated'
      # and can be deleted by Secrets Manager. Secrets Manager generates a CloudTrail log entry when you
      # call this action. Do not include sensitive information in request parameters because it might be
      # logged. For more information, see Logging Secrets Manager events with CloudTrail . Required
      # permissions: secretsmanager:UpdateSecretVersionStage . For more information, see IAM policy actions
      # for Secrets Manager and Authentication and access control in Secrets Manager .

      def update_secret_version_stage(
        secret_id : String,
        version_stage : String,
        move_to_version_id : String? = nil,
        remove_from_version_id : String? = nil
      ) : Types::UpdateSecretVersionStageResponse

        input = Types::UpdateSecretVersionStageRequest.new(secret_id: secret_id, version_stage: version_stage, move_to_version_id: move_to_version_id, remove_from_version_id: remove_from_version_id)
        update_secret_version_stage(input)
      end

      def update_secret_version_stage(input : Types::UpdateSecretVersionStageRequest) : Types::UpdateSecretVersionStageResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SECRET_VERSION_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSecretVersionStageResponse, "UpdateSecretVersionStage")
      end

      # Validates that a resource policy does not grant a wide range of principals access to your secret. A
      # resource-based policy is optional for secrets. The API performs three checks when validating the
      # policy: Sends a call to Zelkova , an automated reasoning engine, to ensure your resource policy does
      # not allow broad access to your secret, for example policies that use a wildcard for the principal.
      # Checks for correct syntax in a policy. Verifies the policy does not lock out a caller. Secrets
      # Manager generates a CloudTrail log entry when you call this action. Do not include sensitive
      # information in request parameters because it might be logged. For more information, see Logging
      # Secrets Manager events with CloudTrail . Required permissions: secretsmanager:ValidateResourcePolicy
      # and secretsmanager:PutResourcePolicy . For more information, see IAM policy actions for Secrets
      # Manager and Authentication and access control in Secrets Manager .

      def validate_resource_policy(
        resource_policy : String,
        secret_id : String? = nil
      ) : Types::ValidateResourcePolicyResponse

        input = Types::ValidateResourcePolicyRequest.new(resource_policy: resource_policy, secret_id: secret_id)
        validate_resource_policy(input)
      end

      def validate_resource_policy(input : Types::ValidateResourcePolicyRequest) : Types::ValidateResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::VALIDATE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ValidateResourcePolicyResponse, "ValidateResourcePolicy")
      end
    end
  end
end
