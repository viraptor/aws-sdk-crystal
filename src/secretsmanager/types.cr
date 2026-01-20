require "json"
require "time"

module Aws
  module SecretsManager
    module Types

      # The error Secrets Manager encountered while retrieving an individual secret as part of
      # BatchGetSecretValue .

      struct APIErrorType
        include JSON::Serializable

        # The error Secrets Manager encountered while retrieving an individual secret as part of
        # BatchGetSecretValue , for example ResourceNotFoundException , InvalidParameterException ,
        # InvalidRequestException , DecryptionFailure , or AccessDeniedException .

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A message describing the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN or name of the secret.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil,
          @secret_id : String? = nil
        )
        end
      end


      struct BatchGetSecretValueRequest
        include JSON::Serializable

        # The filters to choose which secrets to retrieve. You must include Filters or SecretIdList , but not
        # both.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The number of results to include in the response. If there are more results available, in the
        # response, Secrets Manager includes NextToken . To get the next results, call BatchGetSecretValue
        # again with the value from NextToken . To use this parameter, you must also use the Filters
        # parameter.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates where the output should continue from, if a previous call did not show all
        # results. To get the next results, call BatchGetSecretValue again with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARN or names of the secrets to retrieve. You must include Filters or SecretIdList , but not
        # both.

        @[JSON::Field(key: "SecretIdList")]
        getter secret_id_list : Array(String)?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @secret_id_list : Array(String)? = nil
        )
        end
      end


      struct BatchGetSecretValueResponse
        include JSON::Serializable

        # A list of errors Secrets Manager encountered while attempting to retrieve individual secrets.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::APIErrorType)?

        # Secrets Manager includes this value if there's more output available than what is included in the
        # current response. This can occur even when the response includes no values at all, such as when you
        # ask for a filtered view of a long list. To get the next results, call BatchGetSecretValue again with
        # this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of secret values.

        @[JSON::Field(key: "SecretValues")]
        getter secret_values : Array(Types::SecretValueEntry)?

        def initialize(
          @errors : Array(Types::APIErrorType)? = nil,
          @next_token : String? = nil,
          @secret_values : Array(Types::SecretValueEntry)? = nil
        )
        end
      end


      struct CancelRotateSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret. For an ARN, we recommend that you specify a complete ARN rather than
        # a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct CancelRotateSecretResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the version of the secret created during the rotation. This version might
        # not be complete, and should be evaluated for possible deletion. We recommend that you remove the
        # VersionStage value AWSPENDING from this version so that Secrets Manager can delete it. Failing to
        # clean up a cancelled rotation can block you from starting future rotations.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct CreateSecretRequest
        include JSON::Serializable

        # The name of the new secret. The secret name can contain ASCII letters, numbers, and the following
        # characters: /_+=.@- Do not end your secret name with a hyphen followed by six characters. If you do
        # so, you risk confusion and unexpected results when searching for a secret by partial ARN. Secrets
        # Manager automatically adds a hyphen and six random characters after the secret name at the end of
        # the ARN.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of Regions and KMS keys to replicate secrets.

        @[JSON::Field(key: "AddReplicaRegions")]
        getter add_replica_regions : Array(Types::ReplicaRegionType)?

        # If you include SecretString or SecretBinary , then Secrets Manager creates an initial version for
        # the secret, and this parameter specifies the unique identifier for the new version. If you use the
        # Amazon Web Services CLI or one of the Amazon Web Services SDKs to call this operation, then you can
        # leave this parameter empty. The CLI or SDK generates a random UUID for you and includes it as the
        # value for this parameter in the request. If you generate a raw HTTP request to the Secrets Manager
        # service endpoint, then you must generate a ClientRequestToken and include it in the request. This
        # value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation
        # of duplicate versions if there are failures and retries during a rotation. We recommend that you
        # generate a UUID-type value to ensure uniqueness of your versions within the specified secret. If the
        # ClientRequestToken value isn't already associated with a version of the secret then a new version of
        # the secret is created. If a version with this value already exists and the version SecretString and
        # SecretBinary values are the same as those in the request, then the request is ignored. If a version
        # with this value already exists and that version's SecretString and SecretBinary values are different
        # from those in the request, then the request fails because you cannot modify an existing version.
        # Instead, use PutSecretValue to create a new version. This value becomes the VersionId of the new
        # version.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the secret.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies whether to overwrite a secret with the same name in the destination Region. By default,
        # secrets aren't overwritten.

        @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
        getter force_overwrite_replica_secret : Bool?

        # The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt the secret value in
        # the secret. An alias is always prefixed by alias/ , for example alias/aws/secretsmanager . For more
        # information, see About aliases . To use a KMS key in a different account, use the key ARN or the
        # alias ARN. If you don't specify this value, then Secrets Manager uses the key aws/secretsmanager .
        # If that key doesn't yet exist, then Secrets Manager creates it for you automatically the first time
        # it encrypts the secret value. If the secret is in a different Amazon Web Services account from the
        # credentials calling the API, then you can't use aws/secretsmanager to encrypt the secret, and you
        # must create and use a customer managed KMS key.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The binary data to encrypt and store in the new version of the secret. We recommend that you store
        # your binary data in a file and then pass the contents of the file as a parameter. Either
        # SecretString or SecretBinary must have a value, but not both. This parameter is not available in the
        # Secrets Manager console. Sensitive: This field contains sensitive information, so the service does
        # not include it in CloudTrail log entries. If you create your own log entries, you must also avoid
        # logging the information in this field.

        @[JSON::Field(key: "SecretBinary")]
        getter secret_binary : Bytes?

        # The text data to encrypt and store in this new version of the secret. We recommend you use a JSON
        # structure of key/value pairs for your secret value. Either SecretString or SecretBinary must have a
        # value, but not both. If you create a secret by using the Secrets Manager console then Secrets
        # Manager puts the protected secret text in only the SecretString parameter. The Secrets Manager
        # console stores the information as a JSON structure of key/value pairs that a Lambda rotation
        # function can parse. Sensitive: This field contains sensitive information, so the service does not
        # include it in CloudTrail log entries. If you create your own log entries, you must also avoid
        # logging the information in this field.

        @[JSON::Field(key: "SecretString")]
        getter secret_string : String?

        # A list of tags to attach to the secret. Each tag is a key and value pair of strings in a JSON text
        # string, for example:
        # [{"Key":"CostCenter","Value":"12345"},{"Key":"environment","Value":"production"}] Secrets Manager
        # tag key names are case sensitive. A tag with the key "ABC" is a different tag from one with key
        # "abc". If you check tags in permissions policies as part of your security strategy, then adding or
        # removing a tag can change permissions. If the completion of this operation would result in you
        # losing your permissions for this secret, then Secrets Manager blocks the operation and returns an
        # Access Denied error. For more information, see Control access to secrets using tags and Limit access
        # to identities with tags that match secrets' tags . For information about how to format a JSON
        # parameter for the various command line tool environments, see Using JSON for Parameters . If your
        # command-line tool or SDK requires quotation marks around the parameter, you should use single quotes
        # to avoid confusion with the double quotes required in the JSON text. For tag quotas and naming
        # restrictions, see Service quotas for Tagging in the Amazon Web Services General Reference guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The exact string that identifies the partner that holds the external secret. For more information,
        # see Using Secrets Manager managed external secrets .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String,
          @add_replica_regions : Array(Types::ReplicaRegionType)? = nil,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @force_overwrite_replica_secret : Bool? = nil,
          @kms_key_id : String? = nil,
          @secret_binary : Bytes? = nil,
          @secret_string : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateSecretResponse
        include JSON::Serializable

        # The ARN of the new secret. The ARN includes the name of the secret followed by six random
        # characters. This ensures that if you create a new secret with the same name as a deleted secret,
        # then users with access to the old secret don't get access to the new secret because the ARNs are
        # different.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the new secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A list of the replicas of this secret and their status: Failed , which indicates that the replica
        # was not created. InProgress , which indicates that Secrets Manager is in the process of creating the
        # replica. InSync , which indicates that the replica was created.

        @[JSON::Field(key: "ReplicationStatus")]
        getter replication_status : Array(Types::ReplicationStatusType)?

        # The unique identifier associated with the version of the new secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @replication_status : Array(Types::ReplicationStatusType)? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Secrets Manager can't decrypt the protected secret text using the provided KMS key.

      struct DecryptionFailure
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The ARN or name of the secret to delete the attached resource-based policy for. For an ARN, we
        # recommend that you specify a complete ARN rather than a partial ARN. See Finding a secret from a
        # partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        # The ARN of the secret that the resource-based policy was deleted for.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret that the resource-based policy was deleted for.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret to delete. For an ARN, we recommend that you specify a complete ARN
        # rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # Specifies whether to delete the secret without any recovery window. You can't use both this
        # parameter and RecoveryWindowInDays in the same call. If you don't use either, then by default
        # Secrets Manager uses a 30 day recovery window. Secrets Manager performs the actual deletion with an
        # asynchronous background process, so there might be a short delay before the secret is permanently
        # deleted. If you delete a secret and then immediately create a secret with the same name, use
        # appropriate back off and retry logic. If you forcibly delete an already deleted or nonexistent
        # secret, the operation does not return ResourceNotFoundException . Use this parameter with caution.
        # This parameter causes the operation to skip the normal recovery window before the permanent deletion
        # that Secrets Manager would normally impose with the RecoveryWindowInDays parameter. If you delete a
        # secret with the ForceDeleteWithoutRecovery parameter, then you have no opportunity to recover the
        # secret. You lose the secret permanently.

        @[JSON::Field(key: "ForceDeleteWithoutRecovery")]
        getter force_delete_without_recovery : Bool?

        # The number of days from 7 to 30 that Secrets Manager waits before permanently deleting the secret.
        # You can't use both this parameter and ForceDeleteWithoutRecovery in the same call. If you don't use
        # either, then by default Secrets Manager uses a 30 day recovery window.

        @[JSON::Field(key: "RecoveryWindowInDays")]
        getter recovery_window_in_days : Int64?

        def initialize(
          @secret_id : String,
          @force_delete_without_recovery : Bool? = nil,
          @recovery_window_in_days : Int64? = nil
        )
        end
      end


      struct DeleteSecretResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The date and time after which this secret Secrets Manager can permanently delete this secret, and it
        # can no longer be restored. This value is the date and time of the delete request plus the number of
        # days in RecoveryWindowInDays .

        @[JSON::Field(key: "DeletionDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter deletion_date : Time?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @deletion_date : Time? = nil,
          @name : String? = nil
        )
        end
      end


      struct DescribeSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret. For an ARN, we recommend that you specify a complete ARN rather than
        # a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct DescribeSecretResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The date the secret was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The date the secret is scheduled for deletion. If it is not scheduled for deletion, this field is
        # omitted. When you delete a secret, Secrets Manager requires a recovery window of at least 7 days
        # before deleting the secret. Some time after the deleted date, Secrets Manager deletes the secret,
        # including all of its versions. If a secret is scheduled for deletion, then its details, including
        # the encrypted secret value, is not accessible. To cancel a scheduled deletion and restore access to
        # the secret, use RestoreSecret .

        @[JSON::Field(key: "DeletedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter deleted_date : Time?

        # The description of the secret.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The metadata needed to successfully rotate a managed external secret. A list of key value pairs in
        # JSON format specified by the partner. For more information about the required information, see
        # Managed external secrets partners .

        @[JSON::Field(key: "ExternalSecretRotationMetadata")]
        getter external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)?

        # The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret held by a
        # third-party partner. For more information, see Security and permissions .

        @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
        getter external_secret_rotation_role_arn : String?

        # The key ID or alias ARN of the KMS key that Secrets Manager uses to encrypt the secret value. If the
        # secret is encrypted with the Amazon Web Services managed key aws/secretsmanager , this field is
        # omitted. Secrets created using the console use an KMS key ID.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The date that the secret was last accessed in the Region. This field is omitted if the secret has
        # never been retrieved in the Region.

        @[JSON::Field(key: "LastAccessedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_date : Time?

        # The last date and time that this secret was modified in any way.

        @[JSON::Field(key: "LastChangedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_changed_date : Time?

        # The last date and time that Secrets Manager rotated the secret. If the secret isn't configured for
        # rotation or rotation has been disabled, Secrets Manager returns null.

        @[JSON::Field(key: "LastRotatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_rotated_date : Time?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The next rotation is scheduled to occur on or before this date. If the secret isn't configured for
        # rotation or rotation has been disabled, Secrets Manager returns null. If rotation fails, Secrets
        # Manager retries the entire rotation process multiple times. If rotation is unsuccessful, this date
        # may be in the past. This date represents the latest date that rotation will occur, but it is not an
        # approximate rotation date. In some cases, for example if you turn off automatic rotation and then
        # turn it back on, the next rotation may occur much sooner than this date.

        @[JSON::Field(key: "NextRotationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter next_rotation_date : Time?

        # The ID of the service that created this secret. For more information, see Secrets managed by other
        # Amazon Web Services services .

        @[JSON::Field(key: "OwningService")]
        getter owning_service : String?

        # The Region the secret is in. If a secret is replicated to other Regions, the replicas are listed in
        # ReplicationStatus .

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String?

        # A list of the replicas of this secret and their status: Failed , which indicates that the replica
        # was not created. InProgress , which indicates that Secrets Manager is in the process of creating the
        # replica. InSync , which indicates that the replica was created.

        @[JSON::Field(key: "ReplicationStatus")]
        getter replication_status : Array(Types::ReplicationStatusType)?

        # Specifies whether automatic rotation is turned on for this secret. If the secret has never been
        # configured for rotation, Secrets Manager returns null. To turn on rotation, use RotateSecret . To
        # turn off rotation, use CancelRotateSecret .

        @[JSON::Field(key: "RotationEnabled")]
        getter rotation_enabled : Bool?

        # The ARN of the Lambda function that Secrets Manager invokes to rotate the secret.

        @[JSON::Field(key: "RotationLambdaARN")]
        getter rotation_lambda_arn : String?

        # The rotation schedule and Lambda function for this secret. If the secret previously had rotation
        # turned on, but it is now turned off, this field shows the previous rotation schedule and rotation
        # function. If the secret never had rotation turned on, this field is omitted.

        @[JSON::Field(key: "RotationRules")]
        getter rotation_rules : Types::RotationRulesType?

        # The list of tags attached to the secret. To add tags to a secret, use TagResource . To remove tags,
        # use UntagResource .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The exact string that identifies the partner that holds the external secret. For more information,
        # see Using Secrets Manager managed external secrets .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # A list of the versions of the secret that have staging labels attached. Versions that don't have
        # staging labels are considered deprecated and Secrets Manager can delete them. Secrets Manager uses
        # staging labels to indicate the status of a secret version during rotation. The three staging labels
        # for rotation are: AWSCURRENT , which indicates the current version of the secret. AWSPENDING , which
        # indicates the version of the secret that contains new secret information that will become the next
        # current version when rotation finishes. During rotation, Secrets Manager creates an AWSPENDING
        # version ID before creating the new secret version. To check if a secret version exists, call
        # GetSecretValue . AWSPREVIOUS , which indicates the previous current version of the secret. You can
        # use this as the last known good version. For more information about rotation and staging labels, see
        # How rotation works .

        @[JSON::Field(key: "VersionIdsToStages")]
        getter version_ids_to_stages : Hash(String, Array(String))?

        def initialize(
          @arn : String? = nil,
          @created_date : Time? = nil,
          @deleted_date : Time? = nil,
          @description : String? = nil,
          @external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)? = nil,
          @external_secret_rotation_role_arn : String? = nil,
          @kms_key_id : String? = nil,
          @last_accessed_date : Time? = nil,
          @last_changed_date : Time? = nil,
          @last_rotated_date : Time? = nil,
          @name : String? = nil,
          @next_rotation_date : Time? = nil,
          @owning_service : String? = nil,
          @primary_region : String? = nil,
          @replication_status : Array(Types::ReplicationStatusType)? = nil,
          @rotation_enabled : Bool? = nil,
          @rotation_lambda_arn : String? = nil,
          @rotation_rules : Types::RotationRulesType? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @version_ids_to_stages : Hash(String, Array(String))? = nil
        )
        end
      end

      # Secrets Manager can't encrypt the protected secret text using the provided KMS key. Check that the
      # KMS key is available, enabled, and not in an invalid state. For more information, see Key state:
      # Effect on your KMS key .

      struct EncryptionFailure
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The metadata needed to successfully rotate a managed external secret. A list of key value pairs in
      # JSON format specified by the partner. For more information, see Managed external secret partners .

      struct ExternalSecretRotationMetadataItem
        include JSON::Serializable

        # The key that identifies the item.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the specified item.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Allows you to add filters when you use the search function in Secrets Manager. For more information,
      # see Find secrets in Secrets Manager .

      struct Filter
        include JSON::Serializable

        # The following are keys you can use: description : Prefix match, not case-sensitive. name : Prefix
        # match, case-sensitive. tag-key : Prefix match, case-sensitive. tag-value : Prefix match,
        # case-sensitive. primary-region : Prefix match, case-sensitive. owning-service : Prefix match,
        # case-sensitive. all : Breaks the filter value string into words and then searches all attributes for
        # matches. Not case-sensitive.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The keyword to filter for. You can prefix your search value with an exclamation mark ( ! ) in order
        # to perform negation filters.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetRandomPasswordRequest
        include JSON::Serializable

        # A string of the characters that you don't want in the password.

        @[JSON::Field(key: "ExcludeCharacters")]
        getter exclude_characters : String?

        # Specifies whether to exclude lowercase letters from the password. If you don't include this switch,
        # the password can contain lowercase letters.

        @[JSON::Field(key: "ExcludeLowercase")]
        getter exclude_lowercase : Bool?

        # Specifies whether to exclude numbers from the password. If you don't include this switch, the
        # password can contain numbers.

        @[JSON::Field(key: "ExcludeNumbers")]
        getter exclude_numbers : Bool?

        # Specifies whether to exclude the following punctuation characters from the password: ! " # $ % &amp;
        # ' ( ) * + , - . / : ; &lt; = &gt; ? @ [ \ ] ^ _ ` { | } ~ . If you don't include this switch, the
        # password can contain punctuation.

        @[JSON::Field(key: "ExcludePunctuation")]
        getter exclude_punctuation : Bool?

        # Specifies whether to exclude uppercase letters from the password. If you don't include this switch,
        # the password can contain uppercase letters.

        @[JSON::Field(key: "ExcludeUppercase")]
        getter exclude_uppercase : Bool?

        # Specifies whether to include the space character. If you include this switch, the password can
        # contain space characters.

        @[JSON::Field(key: "IncludeSpace")]
        getter include_space : Bool?

        # The length of the password. If you don't include this parameter, the default length is 32
        # characters.

        @[JSON::Field(key: "PasswordLength")]
        getter password_length : Int64?

        # Specifies whether to include at least one upper and lowercase letter, one number, and one
        # punctuation. If you don't include this switch, the password contains at least one of every character
        # type.

        @[JSON::Field(key: "RequireEachIncludedType")]
        getter require_each_included_type : Bool?

        def initialize(
          @exclude_characters : String? = nil,
          @exclude_lowercase : Bool? = nil,
          @exclude_numbers : Bool? = nil,
          @exclude_punctuation : Bool? = nil,
          @exclude_uppercase : Bool? = nil,
          @include_space : Bool? = nil,
          @password_length : Int64? = nil,
          @require_each_included_type : Bool? = nil
        )
        end
      end


      struct GetRandomPasswordResponse
        include JSON::Serializable

        # A string with the password.

        @[JSON::Field(key: "RandomPassword")]
        getter random_password : String?

        def initialize(
          @random_password : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The ARN or name of the secret to retrieve the attached resource-based policy for. For an ARN, we
        # recommend that you specify a complete ARN rather than a partial ARN. See Finding a secret from a
        # partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # The ARN of the secret that the resource-based policy was retrieved for.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret that the resource-based policy was retrieved for.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A JSON-formatted string that contains the permissions policy attached to the secret. For more
        # information about permissions policies, see Authentication and access control for Secrets Manager .

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end


      struct GetSecretValueRequest
        include JSON::Serializable

        # The ARN or name of the secret to retrieve. To retrieve a secret from another account, you must use
        # an ARN. For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See
        # Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # The unique identifier of the version of the secret to retrieve. If you include both this parameter
        # and VersionStage , the two parameters must refer to the same secret version. If you don't specify
        # either a VersionStage or VersionId , then Secrets Manager returns the AWSCURRENT version. This value
        # is typically a UUID-type value with 32 hexadecimal digits.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        # The staging label of the version of the secret to retrieve. Secrets Manager uses staging labels to
        # keep track of different versions during the rotation process. If you include both this parameter and
        # VersionId , the two parameters must refer to the same secret version. If you don't specify either a
        # VersionStage or VersionId , Secrets Manager returns the AWSCURRENT version.

        @[JSON::Field(key: "VersionStage")]
        getter version_stage : String?

        def initialize(
          @secret_id : String,
          @version_id : String? = nil,
          @version_stage : String? = nil
        )
        end
      end


      struct GetSecretValueResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The date and time that this version of the secret was created. If you don't specify which version in
        # VersionId or VersionStage , then Secrets Manager uses the AWSCURRENT version.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The friendly name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The decrypted secret value, if the secret value was originally provided as binary data in the form
        # of a byte array. When you retrieve a SecretBinary using the HTTP API, the Python SDK, or the Amazon
        # Web Services CLI, the value is Base64-encoded. Otherwise, it is not encoded. If the secret was
        # created by using the Secrets Manager console, or if the secret value was originally provided as a
        # string, then this field is omitted. The secret value appears in SecretString instead. Sensitive:
        # This field contains sensitive information, so the service does not include it in CloudTrail log
        # entries. If you create your own log entries, you must also avoid logging the information in this
        # field.

        @[JSON::Field(key: "SecretBinary")]
        getter secret_binary : Bytes?

        # The decrypted secret value, if the secret value was originally provided as a string or through the
        # Secrets Manager console. If this secret was created by using the console, then Secrets Manager
        # stores the information as a JSON structure of key/value pairs. Sensitive: This field contains
        # sensitive information, so the service does not include it in CloudTrail log entries. If you create
        # your own log entries, you must also avoid logging the information in this field.

        @[JSON::Field(key: "SecretString")]
        getter secret_string : String?

        # The unique identifier of this version of the secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        # A list of all of the staging labels currently attached to this version of the secret.

        @[JSON::Field(key: "VersionStages")]
        getter version_stages : Array(String)?

        def initialize(
          @arn : String? = nil,
          @created_date : Time? = nil,
          @name : String? = nil,
          @secret_binary : Bytes? = nil,
          @secret_string : String? = nil,
          @version_id : String? = nil,
          @version_stages : Array(String)? = nil
        )
        end
      end

      # An error occurred on the server side.

      struct InternalServiceError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The NextToken value is invalid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The parameter name or value is invalid.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A parameter value is not valid for the current state of the resource. Possible causes: The secret is
      # scheduled for deletion. You tried to enable rotation on a secret that doesn't already have a Lambda
      # function ARN configured and you didn't include such an ARN as a parameter in this call. The secret
      # is managed by another service, and you must use that service to update it. For more information, see
      # Secrets managed by other Amazon Web Services services .

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because it would exceed one of the Secrets Manager quotas.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListSecretVersionIdsRequest
        include JSON::Serializable

        # The ARN or name of the secret whose versions you want to list. For an ARN, we recommend that you
        # specify a complete ARN rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # Specifies whether to include versions of secrets that don't have any staging labels attached to
        # them. Versions without staging labels are considered deprecated and are subject to deletion by
        # Secrets Manager. By default, versions without staging labels aren't included.

        @[JSON::Field(key: "IncludeDeprecated")]
        getter include_deprecated : Bool?

        # The number of results to include in the response. If there are more results available, in the
        # response, Secrets Manager includes NextToken . To get the next results, call ListSecretVersionIds
        # again with the value from NextToken .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates where the output should continue from, if a previous call did not show all
        # results. To get the next results, call ListSecretVersionIds again with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @secret_id : String,
          @include_deprecated : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSecretVersionIdsResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Secrets Manager includes this value if there's more output available than what is included in the
        # current response. This can occur even when the response includes no values at all, such as when you
        # ask for a filtered view of a long list. To get the next results, call ListSecretVersionIds again
        # with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the versions of the secret.

        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::SecretVersionsListEntry)?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @versions : Array(Types::SecretVersionsListEntry)? = nil
        )
        end
      end


      struct ListSecretsRequest
        include JSON::Serializable

        # The filters to apply to the list of secrets.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # Specifies whether to include secrets scheduled for deletion. By default, secrets scheduled for
        # deletion aren't included.

        @[JSON::Field(key: "IncludePlannedDeletion")]
        getter include_planned_deletion : Bool?

        # The number of results to include in the response. If there are more results available, in the
        # response, Secrets Manager includes NextToken . To get the next results, call ListSecrets again with
        # the value from NextToken .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates where the output should continue from, if a previous call did not show all
        # results. To get the next results, call ListSecrets again with this value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If not specified, secrets are listed by CreatedDate .

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Secrets are listed by CreatedDate .

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @include_planned_deletion : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListSecretsResponse
        include JSON::Serializable

        # Secrets Manager includes this value if there's more output available than what is included in the
        # current response. This can occur even when the response includes no values at all, such as when you
        # ask for a filtered view of a long list. To get the next results, call ListSecrets again with this
        # value.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the secrets in the account.

        @[JSON::Field(key: "SecretList")]
        getter secret_list : Array(Types::SecretListEntry)?

        def initialize(
          @next_token : String? = nil,
          @secret_list : Array(Types::SecretListEntry)? = nil
        )
        end
      end

      # The resource policy has syntax errors.

      struct MalformedPolicyDocumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request failed because you did not complete all the prerequisite steps.

      struct PreconditionNotMetException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The BlockPublicPolicy parameter is set to true, and the resource policy did not prevent broad access
      # to the secret.

      struct PublicPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # A JSON-formatted string for an Amazon Web Services resource-based policy. For example policies, see
        # Permissions policy examples .

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String

        # The ARN or name of the secret to attach the resource-based policy. For an ARN, we recommend that you
        # specify a complete ARN rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # Specifies whether to block resource-based policies that allow broad access to the secret, for
        # example those that use a wildcard for the principal. By default, public policies aren't blocked.
        # Resource policy validation and the BlockPublicPolicy parameter help protect your resources by
        # preventing public access from being granted through the resource policies that are directly attached
        # to your secrets. In addition to using these features, carefully inspect the following policies to
        # confirm that they do not grant public access: Identity-based policies attached to associated Amazon
        # Web Services principals (for example, IAM roles) Resource-based policies attached to associated
        # Amazon Web Services resources (for example, Key Management Service (KMS) keys) To review permissions
        # to your secrets, see Determine who has permissions to your secrets .

        @[JSON::Field(key: "BlockPublicPolicy")]
        getter block_public_policy : Bool?

        def initialize(
          @resource_policy : String,
          @secret_id : String,
          @block_public_policy : Bool? = nil
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct PutSecretValueRequest
        include JSON::Serializable

        # The ARN or name of the secret to add a new version to. For an ARN, we recommend that you specify a
        # complete ARN rather than a partial ARN. See Finding a secret from a partial ARN . If the secret
        # doesn't already exist, use CreateSecret instead.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # A unique identifier for the new version of the secret. If you use the Amazon Web Services CLI or one
        # of the Amazon Web Services SDKs to call this operation, then you can leave this parameter empty. The
        # CLI or SDK generates a random UUID for you and includes it as the value for this parameter in the
        # request. If you generate a raw HTTP request to the Secrets Manager service endpoint, then you must
        # generate a ClientRequestToken and include it in the request. This value helps ensure idempotency.
        # Secrets Manager uses this value to prevent the accidental creation of duplicate versions if there
        # are failures and retries during a rotation. We recommend that you generate a UUID-type value to
        # ensure uniqueness of your versions within the specified secret. If the ClientRequestToken value
        # isn't already associated with a version of the secret then a new version of the secret is created.
        # If a version with this value already exists and that version's SecretString or SecretBinary values
        # are the same as those in the request then the request is ignored. The operation is idempotent. If a
        # version with this value already exists and the version of the SecretString and SecretBinary values
        # are different from those in the request, then the request fails because you can't modify a secret
        # version. You can only create new versions to store new secret values. This value becomes the
        # VersionId of the new version.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # A unique identifier that indicates the source of the request. Required for secret rotations using an
        # IAM assumed role or cross-account rotation, in which you rotate a secret in one account by using a
        # Lambda rotation function in another account. In both cases, the rotation function assumes an IAM
        # role to call Secrets Manager, and then Secrets Manager validates the identity using the token. For
        # more information, see How rotation works and Rotation by Lambda functions . Sensitive: This field
        # contains sensitive information, so the service does not include it in CloudTrail log entries. If you
        # create your own log entries, you must also avoid logging the information in this field.

        @[JSON::Field(key: "RotationToken")]
        getter rotation_token : String?

        # The binary data to encrypt and store in the new version of the secret. To use this parameter in the
        # command-line tools, we recommend that you store your binary data in a file and then pass the
        # contents of the file as a parameter. You must include SecretBinary or SecretString , but not both.
        # You can't access this value from the Secrets Manager console. Sensitive: This field contains
        # sensitive information, so the service does not include it in CloudTrail log entries. If you create
        # your own log entries, you must also avoid logging the information in this field.

        @[JSON::Field(key: "SecretBinary")]
        getter secret_binary : Bytes?

        # The text to encrypt and store in the new version of the secret. You must include SecretBinary or
        # SecretString , but not both. We recommend you create the secret string as JSON key/value pairs, as
        # shown in the example. Sensitive: This field contains sensitive information, so the service does not
        # include it in CloudTrail log entries. If you create your own log entries, you must also avoid
        # logging the information in this field.

        @[JSON::Field(key: "SecretString")]
        getter secret_string : String?

        # A list of staging labels to attach to this version of the secret. Secrets Manager uses staging
        # labels to track versions of a secret through the rotation process. If you specify a staging label
        # that's already associated with a different version of the same secret, then Secrets Manager removes
        # the label from the other version and attaches it to this version. If you specify AWSCURRENT , and it
        # is already attached to another version, then Secrets Manager also moves the staging label
        # AWSPREVIOUS to the version that AWSCURRENT was removed from. If you don't include VersionStages ,
        # then Secrets Manager automatically moves the staging label AWSCURRENT to this version.

        @[JSON::Field(key: "VersionStages")]
        getter version_stages : Array(String)?

        def initialize(
          @secret_id : String,
          @client_request_token : String? = nil,
          @rotation_token : String? = nil,
          @secret_binary : Bytes? = nil,
          @secret_string : String? = nil,
          @version_stages : Array(String)? = nil
        )
        end
      end


      struct PutSecretValueResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the version of the secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        # The list of staging labels that are currently attached to this version of the secret. Secrets
        # Manager uses staging labels to track a version as it progresses through the secret rotation process.

        @[JSON::Field(key: "VersionStages")]
        getter version_stages : Array(String)?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @version_id : String? = nil,
          @version_stages : Array(String)? = nil
        )
        end
      end


      struct RemoveRegionsFromReplicationRequest
        include JSON::Serializable

        # The Regions of the replicas to remove.

        @[JSON::Field(key: "RemoveReplicaRegions")]
        getter remove_replica_regions : Array(String)

        # The ARN or name of the secret.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @remove_replica_regions : Array(String),
          @secret_id : String
        )
        end
      end


      struct RemoveRegionsFromReplicationResponse
        include JSON::Serializable

        # The ARN of the primary secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The status of replicas for this secret after you remove Regions.

        @[JSON::Field(key: "ReplicationStatus")]
        getter replication_status : Array(Types::ReplicationStatusType)?

        def initialize(
          @arn : String? = nil,
          @replication_status : Array(Types::ReplicationStatusType)? = nil
        )
        end
      end

      # A custom type that specifies a Region and the KmsKeyId for a replica secret.

      struct ReplicaRegionType
        include JSON::Serializable

        # The ARN, key ID, or alias of the KMS key to encrypt the secret. If you don't include this field,
        # Secrets Manager uses aws/secretsmanager .

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A Region code. For a list of Region codes, see Name and code of Regions .

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @kms_key_id : String? = nil,
          @region : String? = nil
        )
        end
      end


      struct ReplicateSecretToRegionsRequest
        include JSON::Serializable

        # A list of Regions in which to replicate the secret.

        @[JSON::Field(key: "AddReplicaRegions")]
        getter add_replica_regions : Array(Types::ReplicaRegionType)

        # The ARN or name of the secret to replicate.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # Specifies whether to overwrite a secret with the same name in the destination Region. By default,
        # secrets aren't overwritten.

        @[JSON::Field(key: "ForceOverwriteReplicaSecret")]
        getter force_overwrite_replica_secret : Bool?

        def initialize(
          @add_replica_regions : Array(Types::ReplicaRegionType),
          @secret_id : String,
          @force_overwrite_replica_secret : Bool? = nil
        )
        end
      end


      struct ReplicateSecretToRegionsResponse
        include JSON::Serializable

        # The ARN of the primary secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The status of replication.

        @[JSON::Field(key: "ReplicationStatus")]
        getter replication_status : Array(Types::ReplicationStatusType)?

        def initialize(
          @arn : String? = nil,
          @replication_status : Array(Types::ReplicationStatusType)? = nil
        )
        end
      end

      # A replication object consisting of a RegionReplicationStatus object and includes a Region, KMSKeyId,
      # status, and status message.

      struct ReplicationStatusType
        include JSON::Serializable

        # Can be an ARN , Key ID , or Alias .

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The date that the secret was last accessed in the Region. This field is omitted if the secret has
        # never been retrieved in the Region.

        @[JSON::Field(key: "LastAccessedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_date : Time?

        # The Region where replication occurs.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The status can be InProgress , Failed , or InSync .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status message such as " Secret with this name already exists in this region ".

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @kms_key_id : String? = nil,
          @last_accessed_date : Time? = nil,
          @region : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # A resource with the ID you requested already exists.

      struct ResourceExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Secrets Manager can't find the resource that you asked for.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RestoreSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret to restore. For an ARN, we recommend that you specify a complete ARN
        # rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct RestoreSecretResponse
        include JSON::Serializable

        # The ARN of the secret that was restored.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret that was restored.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct RotateSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret to rotate. For an ARN, we recommend that you specify a complete ARN
        # rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # A unique identifier for the new version of the secret. You only need to specify this value if you
        # implement your own retry logic and you want to ensure that Secrets Manager doesn't attempt to create
        # a secret version twice. If you use the Amazon Web Services CLI or one of the Amazon Web Services
        # SDKs to call this operation, then you can leave this parameter empty. The CLI or SDK generates a
        # random UUID for you and includes it as the value for this parameter in the request. If you generate
        # a raw HTTP request to the Secrets Manager service endpoint, then you must generate a
        # ClientRequestToken and include it in the request. This value helps ensure idempotency. Secrets
        # Manager uses this value to prevent the accidental creation of duplicate versions if there are
        # failures and retries during a rotation. We recommend that you generate a UUID-type value to ensure
        # uniqueness of your versions within the specified secret.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The metadata needed to successfully rotate a managed external secret. A list of key value pairs in
        # JSON format specified by the partner. For more information about the required information, see Using
        # Secrets Manager managed external secrets

        @[JSON::Field(key: "ExternalSecretRotationMetadata")]
        getter external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)?

        # The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret held by a
        # third-party partner. For more information, see Security and permissions .

        @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
        getter external_secret_rotation_role_arn : String?

        # Specifies whether to rotate the secret immediately or wait until the next scheduled rotation window.
        # The rotation schedule is defined in RotateSecretRequest$RotationRules . The default for
        # RotateImmediately is true . If you don't specify this value, Secrets Manager rotates the secret
        # immediately. If you set RotateImmediately to false , Secrets Manager tests the rotation
        # configuration by running the testSecret step of the Lambda rotation function. This test creates an
        # AWSPENDING version of the secret and then removes it. When changing an existing rotation schedule
        # and setting RotateImmediately to false : If using AutomaticallyAfterDays or a ScheduleExpression
        # with rate() , the previously scheduled rotation might still occur. To prevent unintended rotations,
        # use a ScheduleExpression with cron() for granular control over rotation windows. Rotation is an
        # asynchronous process. For more information, see How rotation works .

        @[JSON::Field(key: "RotateImmediately")]
        getter rotate_immediately : Bool?

        # For secrets that use a Lambda rotation function to rotate, the ARN of the Lambda rotation function.
        # For secrets that use managed rotation , omit this field. For more information, see Managed rotation
        # in the Secrets Manager User Guide .

        @[JSON::Field(key: "RotationLambdaARN")]
        getter rotation_lambda_arn : String?

        # A structure that defines the rotation configuration for this secret. When changing an existing
        # rotation schedule and setting RotateImmediately to false : If using AutomaticallyAfterDays or a
        # ScheduleExpression with rate() , the previously scheduled rotation might still occur. To prevent
        # unintended rotations, use a ScheduleExpression with cron() for granular control over rotation
        # windows.

        @[JSON::Field(key: "RotationRules")]
        getter rotation_rules : Types::RotationRulesType?

        def initialize(
          @secret_id : String,
          @client_request_token : String? = nil,
          @external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)? = nil,
          @external_secret_rotation_role_arn : String? = nil,
          @rotate_immediately : Bool? = nil,
          @rotation_lambda_arn : String? = nil,
          @rotation_rules : Types::RotationRulesType? = nil
        )
        end
      end


      struct RotateSecretResponse
        include JSON::Serializable

        # The ARN of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the new version of the secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # A structure that defines the rotation configuration for the secret.

      struct RotationRulesType
        include JSON::Serializable

        # The number of days between rotations of the secret. You can use this value to check that your secret
        # meets your compliance guidelines for how often secrets must be rotated. If you use this field to set
        # the rotation schedule, Secrets Manager calculates the next rotation date based on the previous
        # rotation. Manually updating the secret value by calling PutSecretValue or UpdateSecret is considered
        # a valid rotation. In DescribeSecret and ListSecrets , this value is calculated from the rotation
        # schedule after every successful rotation. In RotateSecret , you can set the rotation schedule in
        # RotationRules with AutomaticallyAfterDays or ScheduleExpression , but not both. To set a rotation
        # schedule in hours, use ScheduleExpression .

        @[JSON::Field(key: "AutomaticallyAfterDays")]
        getter automatically_after_days : Int64?

        # The length of the rotation window in hours, for example 3h for a three hour window. Secrets Manager
        # rotates your secret at any time during this window. The window must not extend into the next
        # rotation window or the next UTC day. The window starts according to the ScheduleExpression . If you
        # don't specify a Duration , for a ScheduleExpression in hours, the window automatically closes after
        # one hour. For a ScheduleExpression in days, the window automatically closes at the end of the UTC
        # day. For more information, including examples, see Schedule expressions in Secrets Manager rotation
        # in the Secrets Manager Users Guide .

        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # A cron() or rate() expression that defines the schedule for rotating your secret. Secrets Manager
        # rotation schedules use UTC time zone. Secrets Manager rotates your secret any time during a rotation
        # window. Secrets Manager rate() expressions represent the interval in hours or days that you want to
        # rotate your secret, for example rate(12 hours) or rate(10 days) . You can rotate a secret as often
        # as every four hours. If you use a rate() expression, the rotation window starts at midnight. For a
        # rate in hours, the default rotation window closes after one hour. For a rate in days, the default
        # rotation window closes at the end of the day. You can set the Duration to change the rotation
        # window. The rotation window must not extend into the next UTC day or into the next rotation window.
        # You can use a cron() expression to create a rotation schedule that is more detailed than a rotation
        # interval. For more information, including examples, see Schedule expressions in Secrets Manager
        # rotation in the Secrets Manager Users Guide . For a cron expression that represents a schedule in
        # hours, the default rotation window closes after one hour. For a cron expression that represents a
        # schedule in days, the default rotation window closes at the end of the day. You can set the Duration
        # to change the rotation window. The rotation window must not extend into the next UTC day or into the
        # next rotation window.

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        def initialize(
          @automatically_after_days : Int64? = nil,
          @duration : String? = nil,
          @schedule_expression : String? = nil
        )
        end
      end

      # A structure that contains the details about a secret. It does not include the encrypted SecretString
      # and SecretBinary values. To get those values, use GetSecretValue .

      struct SecretListEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The date and time when a secret was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The date and time the deletion of the secret occurred. Not present on active secrets. The secret can
        # be recovered until the number of days in the recovery window has passed, as specified in the
        # RecoveryWindowInDays parameter of the DeleteSecret operation.

        @[JSON::Field(key: "DeletedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter deleted_date : Time?

        # The user-provided description of the secret.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The metadata needed to successfully rotate a managed external secret. A list of key value pairs in
        # JSON format specified by the partner. For more information about the required information, see
        # Managed external secrets partners .

        @[JSON::Field(key: "ExternalSecretRotationMetadata")]
        getter external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)?

        # The role that Secrets Manager assumes to call APIs required to perform the rotation. For more
        # information about the required information, see Managed external secrets partners .

        @[JSON::Field(key: "ExternalSecretRotationRoleArn")]
        getter external_secret_rotation_role_arn : String?

        # The ARN of the KMS key that Secrets Manager uses to encrypt the secret value. If the secret is
        # encrypted with the Amazon Web Services managed key aws/secretsmanager , this field is omitted.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The date that the secret was last accessed in the Region. This field is omitted if the secret has
        # never been retrieved in the Region.

        @[JSON::Field(key: "LastAccessedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_date : Time?

        # The last date and time that this secret was modified in any way.

        @[JSON::Field(key: "LastChangedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_changed_date : Time?

        # The most recent date and time that the Secrets Manager rotation process was successfully completed.
        # This value is null if the secret hasn't ever rotated.

        @[JSON::Field(key: "LastRotatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_rotated_date : Time?

        # The friendly name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The next rotation is scheduled to occur on or before this date. If the secret isn't configured for
        # rotation or rotation has been disabled, Secrets Manager returns null.

        @[JSON::Field(key: "NextRotationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter next_rotation_date : Time?

        # Returns the name of the service that created the secret.

        @[JSON::Field(key: "OwningService")]
        getter owning_service : String?

        # The Region where Secrets Manager originated the secret.

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String?

        # Indicates whether automatic, scheduled rotation is enabled for this secret.

        @[JSON::Field(key: "RotationEnabled")]
        getter rotation_enabled : Bool?

        # The ARN of an Amazon Web Services Lambda function invoked by Secrets Manager to rotate and expire
        # the secret either automatically per the schedule or manually by a call to RotateSecret .

        @[JSON::Field(key: "RotationLambdaARN")]
        getter rotation_lambda_arn : String?

        # A structure that defines the rotation configuration for the secret.

        @[JSON::Field(key: "RotationRules")]
        getter rotation_rules : Types::RotationRulesType?

        # A list of all of the currently assigned SecretVersionStage staging labels and the SecretVersionId
        # attached to each one. Staging labels are used to keep track of the different versions during the
        # rotation process. A version that does not have any SecretVersionStage is considered deprecated and
        # subject to deletion. Such versions are not included in this list.

        @[JSON::Field(key: "SecretVersionsToStages")]
        getter secret_versions_to_stages : Hash(String, Array(String))?

        # The list of user-defined tags associated with the secret. To add tags to a secret, use TagResource .
        # To remove tags, use UntagResource .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The exact string that identifies the third-party partner that holds the external secret. For more
        # information, see Managed external secret partners .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @created_date : Time? = nil,
          @deleted_date : Time? = nil,
          @description : String? = nil,
          @external_secret_rotation_metadata : Array(Types::ExternalSecretRotationMetadataItem)? = nil,
          @external_secret_rotation_role_arn : String? = nil,
          @kms_key_id : String? = nil,
          @last_accessed_date : Time? = nil,
          @last_changed_date : Time? = nil,
          @last_rotated_date : Time? = nil,
          @name : String? = nil,
          @next_rotation_date : Time? = nil,
          @owning_service : String? = nil,
          @primary_region : String? = nil,
          @rotation_enabled : Bool? = nil,
          @rotation_lambda_arn : String? = nil,
          @rotation_rules : Types::RotationRulesType? = nil,
          @secret_versions_to_stages : Hash(String, Array(String))? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that contains the secret value and other details for a secret.

      struct SecretValueEntry
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The date the secret was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The friendly name of the secret.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The decrypted secret value, if the secret value was originally provided as binary data in the form
        # of a byte array. The parameter represents the binary data as a base64-encoded string.

        @[JSON::Field(key: "SecretBinary")]
        getter secret_binary : Bytes?

        # The decrypted secret value, if the secret value was originally provided as a string or through the
        # Secrets Manager console.

        @[JSON::Field(key: "SecretString")]
        getter secret_string : String?

        # The unique version identifier of this version of the secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        # A list of all of the staging labels currently attached to this version of the secret.

        @[JSON::Field(key: "VersionStages")]
        getter version_stages : Array(String)?

        def initialize(
          @arn : String? = nil,
          @created_date : Time? = nil,
          @name : String? = nil,
          @secret_binary : Bytes? = nil,
          @secret_string : String? = nil,
          @version_id : String? = nil,
          @version_stages : Array(String)? = nil
        )
        end
      end

      # A structure that contains information about one version of a secret.

      struct SecretVersionsListEntry
        include JSON::Serializable

        # The date and time this version of the secret was created.

        @[JSON::Field(key: "CreatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date : Time?

        # The KMS keys used to encrypt the secret version.

        @[JSON::Field(key: "KmsKeyIds")]
        getter kms_key_ids : Array(String)?

        # The date that this version of the secret was last accessed. Note that the resolution of this field
        # is at the date level and does not include the time.

        @[JSON::Field(key: "LastAccessedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_accessed_date : Time?

        # The unique version identifier of this version of the secret.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        # An array of staging labels that are currently associated with this version of the secret.

        @[JSON::Field(key: "VersionStages")]
        getter version_stages : Array(String)?

        def initialize(
          @created_date : Time? = nil,
          @kms_key_ids : Array(String)? = nil,
          @last_accessed_date : Time? = nil,
          @version_id : String? = nil,
          @version_stages : Array(String)? = nil
        )
        end
      end


      struct StopReplicationToReplicaRequest
        include JSON::Serializable

        # The name of the secret or the replica ARN. The replica ARN is the same as the original primary
        # secret ARN expect the Region is changed to the replica Region.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        def initialize(
          @secret_id : String
        )
        end
      end


      struct StopReplicationToReplicaResponse
        include JSON::Serializable

        # The ARN of the promoted secret. The ARN is the same as the original primary secret except the Region
        # is changed.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # A structure that contains information about a tag.

      struct Tag
        include JSON::Serializable

        # The key identifier, or name, of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The string value associated with the key of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The identifier for the secret to attach tags to. You can specify either the Amazon Resource Name
        # (ARN) or the friendly name of the secret. For an ARN, we recommend that you specify a complete ARN
        # rather than a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # The tags to attach to the secret as a JSON text string argument. Each element in the list consists
        # of a Key and a Value . For storing multiple values, we recommend that you use a JSON text string
        # argument and specify key/value pairs. For more information, see Specifying parameter values for the
        # Amazon Web Services CLI in the Amazon Web Services CLI User Guide.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @secret_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN or name of the secret. For an ARN, we recommend that you specify a complete ARN rather than
        # a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # A list of tag key names to remove from the secret. You don't specify the value. Both the key and its
        # associated value are removed. This parameter requires a JSON text string argument. For storing
        # multiple values, we recommend that you use a JSON text string argument and specify key/value pairs.
        # For more information, see Specifying parameter values for the Amazon Web Services CLI in the Amazon
        # Web Services CLI User Guide.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @secret_id : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateSecretRequest
        include JSON::Serializable

        # The ARN or name of the secret. For an ARN, we recommend that you specify a complete ARN rather than
        # a partial ARN. See Finding a secret from a partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # If you include SecretString or SecretBinary , then Secrets Manager creates a new version for the
        # secret, and this parameter specifies the unique identifier for the new version. If you use the
        # Amazon Web Services CLI or one of the Amazon Web Services SDKs to call this operation, then you can
        # leave this parameter empty. The CLI or SDK generates a random UUID for you and includes it as the
        # value for this parameter in the request. If you generate a raw HTTP request to the Secrets Manager
        # service endpoint, then you must generate a ClientRequestToken and include it in the request. This
        # value helps ensure idempotency. Secrets Manager uses this value to prevent the accidental creation
        # of duplicate versions if there are failures and retries during a rotation. We recommend that you
        # generate a UUID-type value to ensure uniqueness of your versions within the specified secret.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description of the secret.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt new secret versions as
        # well as any existing versions with the staging labels AWSCURRENT , AWSPENDING , or AWSPREVIOUS . If
        # you don't have kms:Encrypt permission to the new key, Secrets Manager does not re-encrypt existing
        # secret versions with the new key. For more information about versions and staging labels, see
        # Concepts: Version . A key alias is always prefixed by alias/ , for example alias/aws/secretsmanager
        # . For more information, see About aliases . If you set this to an empty string, Secrets Manager uses
        # the Amazon Web Services managed key aws/secretsmanager . If this key doesn't already exist in your
        # account, then Secrets Manager creates it for you automatically. All users and roles in the Amazon
        # Web Services account automatically have access to use aws/secretsmanager . Creating
        # aws/secretsmanager can result in a one-time significant delay in returning the result. You can only
        # use the Amazon Web Services managed key aws/secretsmanager if you call this operation using
        # credentials from the same Amazon Web Services account that owns the secret. If the secret is in a
        # different account, then you must use a customer managed key and provide the ARN of that KMS key in
        # this field. The user making the call must have permissions to both the secret and the KMS key in
        # their respective accounts.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The binary data to encrypt and store in the new version of the secret. We recommend that you store
        # your binary data in a file and then pass the contents of the file as a parameter. Either
        # SecretBinary or SecretString must have a value, but not both. You can't access this parameter in the
        # Secrets Manager console. Sensitive: This field contains sensitive information, so the service does
        # not include it in CloudTrail log entries. If you create your own log entries, you must also avoid
        # logging the information in this field.

        @[JSON::Field(key: "SecretBinary")]
        getter secret_binary : Bytes?

        # The text data to encrypt and store in the new version of the secret. We recommend you use a JSON
        # structure of key/value pairs for your secret value. Either SecretBinary or SecretString must have a
        # value, but not both. Sensitive: This field contains sensitive information, so the service does not
        # include it in CloudTrail log entries. If you create your own log entries, you must also avoid
        # logging the information in this field.

        @[JSON::Field(key: "SecretString")]
        getter secret_string : String?

        # The exact string that identifies the third-party partner that holds the external secret. For more
        # information, see Managed external secret partners .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @secret_id : String,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @secret_binary : Bytes? = nil,
          @secret_string : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateSecretResponse
        include JSON::Serializable

        # The ARN of the secret that was updated.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret that was updated.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # If Secrets Manager created a new version of the secret during this operation, then VersionId
        # contains the unique identifier of the new version.

        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @version_id : String? = nil
        )
        end
      end


      struct UpdateSecretVersionStageRequest
        include JSON::Serializable

        # The ARN or the name of the secret with the version and staging labelsto modify. For an ARN, we
        # recommend that you specify a complete ARN rather than a partial ARN. See Finding a secret from a
        # partial ARN .

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String

        # The staging label to add to this version.

        @[JSON::Field(key: "VersionStage")]
        getter version_stage : String

        # The ID of the version to add the staging label to. To remove a label from a version, then do not
        # specify this parameter. If the staging label is already attached to a different version of the
        # secret, then you must also specify the RemoveFromVersionId parameter.

        @[JSON::Field(key: "MoveToVersionId")]
        getter move_to_version_id : String?

        # The ID of the version that the staging label is to be removed from. If the staging label you are
        # trying to attach to one version is already attached to a different version, then you must include
        # this parameter and specify the version that the label is to be removed from. If the label is
        # attached and you either do not specify this parameter, or the version ID does not match, then the
        # operation fails.

        @[JSON::Field(key: "RemoveFromVersionId")]
        getter remove_from_version_id : String?

        def initialize(
          @secret_id : String,
          @version_stage : String,
          @move_to_version_id : String? = nil,
          @remove_from_version_id : String? = nil
        )
        end
      end


      struct UpdateSecretVersionStageResponse
        include JSON::Serializable

        # The ARN of the secret that was updated.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The name of the secret that was updated.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct ValidateResourcePolicyRequest
        include JSON::Serializable

        # A JSON-formatted string that contains an Amazon Web Services resource-based policy. The policy in
        # the string identifies who can access or manage this secret and its versions. For example policies,
        # see Permissions policy examples .

        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String

        # The ARN or name of the secret with the resource-based policy you want to validate.

        @[JSON::Field(key: "SecretId")]
        getter secret_id : String?

        def initialize(
          @resource_policy : String,
          @secret_id : String? = nil
        )
        end
      end


      struct ValidateResourcePolicyResponse
        include JSON::Serializable

        # True if your policy passes validation, otherwise false.

        @[JSON::Field(key: "PolicyValidationPassed")]
        getter policy_validation_passed : Bool?

        # Validation errors if your policy didn't pass validation.

        @[JSON::Field(key: "ValidationErrors")]
        getter validation_errors : Array(Types::ValidationErrorsEntry)?

        def initialize(
          @policy_validation_passed : Bool? = nil,
          @validation_errors : Array(Types::ValidationErrorsEntry)? = nil
        )
        end
      end

      # Displays errors that occurred during validation of the resource policy.

      struct ValidationErrorsEntry
        include JSON::Serializable

        # Checks the name of the policy.

        @[JSON::Field(key: "CheckName")]
        getter check_name : String?

        # Displays error messages if validation encounters problems during validation of the resource policy.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @check_name : String? = nil,
          @error_message : String? = nil
        )
        end
      end
    end
  end
end
