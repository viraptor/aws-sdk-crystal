require "json"
require "time"

module AwsSdk
  module Signer
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct AddProfilePermissionRequest
        include JSON::Serializable

        # For cross-account signing. Grant a designated account permission to perform one or more of the
        # following actions. Each action is associated with a specific API's operations. For more information
        # about cross-account signing, see Using cross-account signing with signing profiles in the AWS Signer
        # Developer Guide . You can designate the following actions to an account. signer:StartSigningJob .
        # This action isn't supported for container image workflows. For details, see StartSigningJob .
        # signer:SignPayload . This action isn't supported for AWS Lambda workflows. For details, see
        # SignPayload signer:GetSigningProfile . For details, see GetSigningProfile . signer:RevokeSignature .
        # For details, see RevokeSignature .

        @[JSON::Field(key: "action")]
        getter action : String

        # The AWS principal receiving cross-account permissions. This may be an IAM role or another AWS
        # account ID.

        @[JSON::Field(key: "principal")]
        getter principal : String

        # The human-readable name of the signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # A unique identifier for the cross-account permission statement.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        # The version of the signing profile.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # A unique identifier for the current profile revision.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @action : String,
          @principal : String,
          @profile_name : String,
          @statement_id : String,
          @profile_version : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct AddProfilePermissionResponse
        include JSON::Serializable

        # A unique identifier for the current profile revision.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @revision_id : String? = nil
        )
        end
      end

      # The request contains invalid parameters for the ARN or tags. This exception also occurs when you
      # call a tagging API on a cancelled signing profile.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct CancelSigningProfileRequest
        include JSON::Serializable

        # The name of the signing profile to be canceled.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        def initialize(
          @profile_name : String
        )
        end
      end

      # The resource encountered a conflicting state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct DescribeSigningJobRequest
        include JSON::Serializable

        # The ID of the signing job on input.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeSigningJobResponse
        include JSON::Serializable

        # Date and time that the signing job was completed.

        @[JSON::Field(key: "completedAt")]
        getter completed_at : Time?

        # Date and time that the signing job was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ID of the signing job on output.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The IAM entity that initiated the signing job.

        @[JSON::Field(key: "jobInvoker")]
        getter job_invoker : String?

        # The AWS account ID of the job owner.

        @[JSON::Field(key: "jobOwner")]
        getter job_owner : String?

        # A list of any overrides that were applied to the signing operation.

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::SigningPlatformOverrides?

        # A human-readable name for the signing platform associated with the signing job.

        @[JSON::Field(key: "platformDisplayName")]
        getter platform_display_name : String?

        # The microcontroller platform to which your signed code image will be distributed.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # The name of the profile that initiated the signing operation.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String?

        # The version of the signing profile used to initiate the signing job.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # The IAM principal that requested the signing job.

        @[JSON::Field(key: "requestedBy")]
        getter requested_by : String?

        # A revocation record if the signature generated by the signing job has been revoked. Contains a
        # timestamp and the ID of the IAM entity that revoked the signature.

        @[JSON::Field(key: "revocationRecord")]
        getter revocation_record : Types::SigningJobRevocationRecord?

        # Thr expiration timestamp for the signature generated by the signing job.

        @[JSON::Field(key: "signatureExpiresAt")]
        getter signature_expires_at : Time?

        # Name of the S3 bucket where the signed code image is saved by AWS Signer.

        @[JSON::Field(key: "signedObject")]
        getter signed_object : Types::SignedObject?

        # The Amazon Resource Name (ARN) of your code signing certificate.

        @[JSON::Field(key: "signingMaterial")]
        getter signing_material : Types::SigningMaterial?

        # Map of user-assigned key-value pairs used during signing. These values contain any information that
        # you specified for use in your signing job.

        @[JSON::Field(key: "signingParameters")]
        getter signing_parameters : Hash(String, String)?

        # The object that contains the name of your S3 bucket or your raw code.

        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        # Status of the signing job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # String value that contains the status reason.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @completed_at : Time? = nil,
          @created_at : Time? = nil,
          @job_id : String? = nil,
          @job_invoker : String? = nil,
          @job_owner : String? = nil,
          @overrides : Types::SigningPlatformOverrides? = nil,
          @platform_display_name : String? = nil,
          @platform_id : String? = nil,
          @profile_name : String? = nil,
          @profile_version : String? = nil,
          @requested_by : String? = nil,
          @revocation_record : Types::SigningJobRevocationRecord? = nil,
          @signature_expires_at : Time? = nil,
          @signed_object : Types::SignedObject? = nil,
          @signing_material : Types::SigningMaterial? = nil,
          @signing_parameters : Hash(String, String)? = nil,
          @source : Types::Source? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Points to an S3Destination object that contains information about your S3 bucket.

      struct Destination
        include JSON::Serializable

        # The S3Destination object.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Destination?

        def initialize(
          @s3 : Types::S3Destination? = nil
        )
        end
      end

      # The encryption algorithm options that are available to a code-signing job.

      struct EncryptionAlgorithmOptions
        include JSON::Serializable

        # The set of accepted encryption algorithms that are allowed in a code-signing job.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)

        # The default encryption algorithm that is used by a code-signing job.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String

        def initialize(
          @allowed_values : Array(String),
          @default_value : String
        )
        end
      end


      struct GetRevocationStatusRequest
        include JSON::Serializable

        # A list of composite signed hashes that identify certificates. A certificate identifier consists of a
        # subject certificate TBS hash (signed by the parent CA) combined with a parent CA TBS hash (signed by
        # the parent CA’s CA). Root certificates are defined as their own CA. The following example shows how
        # to calculate a hash for this parameter using OpenSSL commands: openssl asn1parse -in childCert.pem
        # -strparse 4 -out childCert.tbs openssl sha384 &lt; childCert.tbs -binary &gt; childCertTbsHash
        # openssl asn1parse -in parentCert.pem -strparse 4 -out parentCert.tbs openssl sha384 &lt;
        # parentCert.tbs -binary &gt; parentCertTbsHash xxd -p childCertTbsHash &gt; certificateHash.hex xxd
        # -p parentCertTbsHash &gt;&gt; certificateHash.hex cat certificateHash.hex | tr -d '\n'

        @[JSON::Field(key: "certificateHashes")]
        getter certificate_hashes : Array(String)

        # The ARN of a signing job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The ID of a signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String

        # The version of a signing profile.

        @[JSON::Field(key: "profileVersionArn")]
        getter profile_version_arn : String

        # The timestamp of the signature that validates the profile or job.

        @[JSON::Field(key: "signatureTimestamp")]
        getter signature_timestamp : Time

        def initialize(
          @certificate_hashes : Array(String),
          @job_arn : String,
          @platform_id : String,
          @profile_version_arn : String,
          @signature_timestamp : Time
        )
        end
      end


      struct GetRevocationStatusResponse
        include JSON::Serializable

        # A list of revoked entities (including zero or more of the signing profile ARN, signing job ARN, and
        # certificate hashes) supplied as input to the API.

        @[JSON::Field(key: "revokedEntities")]
        getter revoked_entities : Array(String)?

        def initialize(
          @revoked_entities : Array(String)? = nil
        )
        end
      end


      struct GetSigningPlatformRequest
        include JSON::Serializable

        # The ID of the target signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String

        def initialize(
          @platform_id : String
        )
        end
      end


      struct GetSigningPlatformResponse
        include JSON::Serializable

        # The category type of the target signing platform.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The display name of the target signing platform.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The maximum size (in MB) of the payload that can be signed by the target platform.

        @[JSON::Field(key: "maxSizeInMB")]
        getter max_size_in_mb : Int32?

        # A list of partner entities that use the target signing platform.

        @[JSON::Field(key: "partner")]
        getter partner : String?

        # The ID of the target signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # A flag indicating whether signatures generated for the signing platform can be revoked.

        @[JSON::Field(key: "revocationSupported")]
        getter revocation_supported : Bool?

        # A list of configurations applied to the target platform at signing.

        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration?

        # The format of the target platform's signing image.

        @[JSON::Field(key: "signingImageFormat")]
        getter signing_image_format : Types::SigningImageFormat?

        # The validation template that is used by the target signing platform.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @category : String? = nil,
          @display_name : String? = nil,
          @max_size_in_mb : Int32? = nil,
          @partner : String? = nil,
          @platform_id : String? = nil,
          @revocation_supported : Bool? = nil,
          @signing_configuration : Types::SigningConfiguration? = nil,
          @signing_image_format : Types::SigningImageFormat? = nil,
          @target : String? = nil
        )
        end
      end


      struct GetSigningProfileRequest
        include JSON::Serializable

        # The name of the target signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # The AWS account ID of the profile owner.

        @[JSON::Field(key: "profileOwner")]
        getter profile_owner : String?

        def initialize(
          @profile_name : String,
          @profile_owner : String? = nil
        )
        end
      end


      struct GetSigningProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the signing profile.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A list of overrides applied by the target signing profile for signing operations.

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::SigningPlatformOverrides?

        # A human-readable name for the signing platform associated with the signing profile.

        @[JSON::Field(key: "platformDisplayName")]
        getter platform_display_name : String?

        # The ID of the platform that is used by the target signing profile.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # The name of the target signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String?

        # The current version of the signing profile.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # The signing profile ARN, including the profile version.

        @[JSON::Field(key: "profileVersionArn")]
        getter profile_version_arn : String?


        @[JSON::Field(key: "revocationRecord")]
        getter revocation_record : Types::SigningProfileRevocationRecord?


        @[JSON::Field(key: "signatureValidityPeriod")]
        getter signature_validity_period : Types::SignatureValidityPeriod?

        # The ARN of the certificate that the target profile uses for signing operations.

        @[JSON::Field(key: "signingMaterial")]
        getter signing_material : Types::SigningMaterial?

        # A map of key-value pairs for signing operations that is attached to the target signing profile.

        @[JSON::Field(key: "signingParameters")]
        getter signing_parameters : Hash(String, String)?

        # The status of the target signing profile.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Reason for the status of the target signing profile.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # A list of tags associated with the signing profile.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @overrides : Types::SigningPlatformOverrides? = nil,
          @platform_display_name : String? = nil,
          @platform_id : String? = nil,
          @profile_name : String? = nil,
          @profile_version : String? = nil,
          @profile_version_arn : String? = nil,
          @revocation_record : Types::SigningProfileRevocationRecord? = nil,
          @signature_validity_period : Types::SignatureValidityPeriod? = nil,
          @signing_material : Types::SigningMaterial? = nil,
          @signing_parameters : Hash(String, String)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The hash algorithms that are available to a code-signing job.

      struct HashAlgorithmOptions
        include JSON::Serializable

        # The set of accepted hash algorithms allowed in a code-signing job.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)

        # The default hash algorithm that is used in a code-signing job.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String

        def initialize(
          @allowed_values : Array(String),
          @default_value : String
        )
        end
      end

      # An internal error occurred.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct ListProfilePermissionsRequest
        include JSON::Serializable

        # Name of the signing profile containing the cross-account permissions.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # String for specifying the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @profile_name : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfilePermissionsResponse
        include JSON::Serializable

        # String for specifying the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # List of permissions associated with the Signing Profile.

        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::Permission)?

        # Total size of the policy associated with the Signing Profile in bytes.

        @[JSON::Field(key: "policySizeBytes")]
        getter policy_size_bytes : Int32?

        # The identifier for the current revision of profile permissions.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::Permission)? = nil,
          @policy_size_bytes : Int32? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct ListSigningJobsRequest
        include JSON::Serializable

        # Filters results to return only signing jobs with revoked signatures.

        @[JSON::Field(key: "isRevoked")]
        getter is_revoked : Bool?

        # Filters results to return only signing jobs initiated by a specified IAM entity.

        @[JSON::Field(key: "jobInvoker")]
        getter job_invoker : String?

        # Specifies the maximum number of items to return in the response. Use this parameter when paginating
        # results. If additional items exist beyond the number you specify, the nextToken element is set in
        # the response. Use the nextToken value in a subsequent request to retrieve additional items.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # String for specifying the next set of paginated results to return. After you receive a response with
        # truncated results, use this parameter in a subsequent request. Set it to the value of nextToken from
        # the response that you just received.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ID of microcontroller platform that you specified for the distribution of your code image.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # The IAM principal that requested the signing job.

        @[JSON::Field(key: "requestedBy")]
        getter requested_by : String?

        # Filters results to return only signing jobs with signatures expiring after a specified timestamp.

        @[JSON::Field(key: "signatureExpiresAfter")]
        getter signature_expires_after : Time?

        # Filters results to return only signing jobs with signatures expiring before a specified timestamp.

        @[JSON::Field(key: "signatureExpiresBefore")]
        getter signature_expires_before : Time?

        # A status value with which to filter your results.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @is_revoked : Bool? = nil,
          @job_invoker : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @platform_id : String? = nil,
          @requested_by : String? = nil,
          @signature_expires_after : Time? = nil,
          @signature_expires_before : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListSigningJobsResponse
        include JSON::Serializable

        # A list of your signing jobs.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::SigningJob)?

        # String for specifying the next set of paginated results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::SigningJob)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSigningPlatformsRequest
        include JSON::Serializable

        # The category type of a signing platform.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The maximum number of results to be returned by this operation.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Value for specifying the next set of paginated results to return. After you receive a response with
        # truncated results, use this parameter in a subsequent request. Set it to the value of nextToken from
        # the response that you just received.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Any partner entities connected to a signing platform.

        @[JSON::Field(key: "partner")]
        getter partner : String?

        # The validation template that is used by the target signing platform.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @category : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @partner : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct ListSigningPlatformsResponse
        include JSON::Serializable

        # Value for specifying the next set of paginated results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of all platforms that match the request parameters.

        @[JSON::Field(key: "platforms")]
        getter platforms : Array(Types::SigningPlatform)?

        def initialize(
          @next_token : String? = nil,
          @platforms : Array(Types::SigningPlatform)? = nil
        )
        end
      end


      struct ListSigningProfilesRequest
        include JSON::Serializable

        # Designates whether to include profiles with the status of CANCELED .

        @[JSON::Field(key: "includeCanceled")]
        getter include_canceled : Bool?

        # The maximum number of profiles to be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Value for specifying the next set of paginated results to return. After you receive a response with
        # truncated results, use this parameter in a subsequent request. Set it to the value of nextToken from
        # the response that you just received.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filters results to return only signing jobs initiated for a specified signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # Filters results to return only signing jobs with statuses in the specified list.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(String)?

        def initialize(
          @include_canceled : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @platform_id : String? = nil,
          @statuses : Array(String)? = nil
        )
        end
      end


      struct ListSigningProfilesResponse
        include JSON::Serializable

        # Value for specifying the next set of paginated results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of profiles that are available in the AWS account. This includes profiles with the status of
        # CANCELED if the includeCanceled parameter is set to true .

        @[JSON::Field(key: "profiles")]
        getter profiles : Array(Types::SigningProfile)?

        def initialize(
          @next_token : String? = nil,
          @profiles : Array(Types::SigningProfile)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the signing profile.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the signing profile.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The signing profile was not found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A cross-account permission for a signing profile.

      struct Permission
        include JSON::Serializable

        # An AWS Signer action permitted as part of cross-account permissions.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The AWS principal that has been granted a cross-account permission.

        @[JSON::Field(key: "principal")]
        getter principal : String?

        # The signing profile version that a permission applies to.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # A unique identifier for a cross-account permission statement.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String?

        def initialize(
          @action : String? = nil,
          @principal : String? = nil,
          @profile_version : String? = nil,
          @statement_id : String? = nil
        )
        end
      end


      struct PutSigningProfileRequest
        include JSON::Serializable

        # The ID of the signing platform to be created.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String

        # The name of the signing profile to be created.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # A subfield of platform . This specifies any different configuration options that you want to apply
        # to the chosen platform (such as a different hash-algorithm or signing-algorithm ).

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::SigningPlatformOverrides?

        # The default validity period override for any signature generated using this signing profile. If
        # unspecified, the default is 135 months.

        @[JSON::Field(key: "signatureValidityPeriod")]
        getter signature_validity_period : Types::SignatureValidityPeriod?

        # The AWS Certificate Manager certificate that will be used to sign code with the new signing profile.

        @[JSON::Field(key: "signingMaterial")]
        getter signing_material : Types::SigningMaterial?

        # Map of key-value pairs for signing. These can include any information that you want to use during
        # signing.

        @[JSON::Field(key: "signingParameters")]
        getter signing_parameters : Hash(String, String)?

        # Tags to be associated with the signing profile that is being created.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @platform_id : String,
          @profile_name : String,
          @overrides : Types::SigningPlatformOverrides? = nil,
          @signature_validity_period : Types::SignatureValidityPeriod? = nil,
          @signing_material : Types::SigningMaterial? = nil,
          @signing_parameters : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutSigningProfileResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signing profile created.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The version of the signing profile being created.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # The signing profile ARN, including the profile version.

        @[JSON::Field(key: "profileVersionArn")]
        getter profile_version_arn : String?

        def initialize(
          @arn : String? = nil,
          @profile_version : String? = nil,
          @profile_version_arn : String? = nil
        )
        end
      end


      struct RemoveProfilePermissionRequest
        include JSON::Serializable

        # A human-readable name for the signing profile with permissions to be removed.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # An identifier for the current revision of the signing profile permissions.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        # A unique identifier for the cross-account permissions statement.

        @[JSON::Field(key: "statementId")]
        getter statement_id : String

        def initialize(
          @profile_name : String,
          @revision_id : String,
          @statement_id : String
        )
        end
      end


      struct RemoveProfilePermissionResponse
        include JSON::Serializable

        # An identifier for the current revision of the profile permissions.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @revision_id : String? = nil
        )
        end
      end

      # A specified resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct RevokeSignatureRequest
        include JSON::Serializable

        # ID of the signing job to be revoked.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The reason for revoking the signing job.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # AWS account ID of the job owner.

        @[JSON::Field(key: "jobOwner")]
        getter job_owner : String?

        def initialize(
          @job_id : String,
          @reason : String,
          @job_owner : String? = nil
        )
        end
      end


      struct RevokeSigningProfileRequest
        include JSON::Serializable

        # A timestamp for when revocation of a Signing Profile should become effective. Signatures generated
        # using the signing profile after this timestamp are not trusted.

        @[JSON::Field(key: "effectiveTime")]
        getter effective_time : Time

        # The name of the signing profile to be revoked.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # The version of the signing profile to be revoked.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String

        # The reason for revoking a signing profile.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @effective_time : Time,
          @profile_name : String,
          @profile_version : String,
          @reason : String
        )
        end
      end

      # The name and prefix of the Amazon S3 bucket where AWS Signer saves your signed objects.

      struct S3Destination
        include JSON::Serializable

        # Name of the S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # An S3 prefix that you can use to limit responses to those that begin with the specified prefix.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # The Amazon S3 bucket name and key where Signer saved your signed code image.

      struct S3SignedObject
        include JSON::Serializable

        # Name of the S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Key name that uniquely identifies a signed code image in your bucket.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @bucket_name : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Information about the Amazon S3 bucket where you saved your unsigned code.

      struct S3Source
        include JSON::Serializable

        # Name of the S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # Key name of the bucket object that contains your unsigned code.

        @[JSON::Field(key: "key")]
        getter key : String

        # Version of your source image in your version enabled S3 bucket.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @bucket_name : String,
          @key : String,
          @version : String
        )
        end
      end

      # The client is making a request that exceeds service limits.

      struct ServiceLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct SignPayloadRequest
        include JSON::Serializable

        # Specifies the object digest (hash) to sign.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # Payload content type. The single valid type is application/vnd.cncf.notary.payload.v1+json .

        @[JSON::Field(key: "payloadFormat")]
        getter payload_format : String

        # The name of the signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # The AWS account ID of the profile owner.

        @[JSON::Field(key: "profileOwner")]
        getter profile_owner : String?

        def initialize(
          @payload : Bytes,
          @payload_format : String,
          @profile_name : String,
          @profile_owner : String? = nil
        )
        end
      end


      struct SignPayloadResponse
        include JSON::Serializable

        # Unique identifier of the signing job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The AWS account ID of the job owner.

        @[JSON::Field(key: "jobOwner")]
        getter job_owner : String?

        # Information including the signing profile ARN and the signing job ID.

        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # A cryptographic signature.

        @[JSON::Field(key: "signature")]
        getter signature : Bytes?

        def initialize(
          @job_id : String? = nil,
          @job_owner : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @signature : Bytes? = nil
        )
        end
      end

      # The validity period for a signing job.

      struct SignatureValidityPeriod
        include JSON::Serializable

        # The time unit for signature validity.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The numerical value of the time unit for signature validity.

        @[JSON::Field(key: "value")]
        getter value : Int32?

        def initialize(
          @type : String? = nil,
          @value : Int32? = nil
        )
        end
      end

      # Points to an S3SignedObject object that contains information about your signed code image.

      struct SignedObject
        include JSON::Serializable

        # The S3SignedObject .

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3SignedObject?

        def initialize(
          @s3 : Types::S3SignedObject? = nil
        )
        end
      end

      # The configuration of a signing operation.

      struct SigningConfiguration
        include JSON::Serializable

        # The encryption algorithm options that are available for a code-signing job.

        @[JSON::Field(key: "encryptionAlgorithmOptions")]
        getter encryption_algorithm_options : Types::EncryptionAlgorithmOptions

        # The hash algorithm options that are available for a code-signing job.

        @[JSON::Field(key: "hashAlgorithmOptions")]
        getter hash_algorithm_options : Types::HashAlgorithmOptions

        def initialize(
          @encryption_algorithm_options : Types::EncryptionAlgorithmOptions,
          @hash_algorithm_options : Types::HashAlgorithmOptions
        )
        end
      end

      # A signing configuration that overrides the default encryption or hash algorithm of a signing job.

      struct SigningConfigurationOverrides
        include JSON::Serializable

        # A specified override of the default encryption algorithm that is used in a code-signing job.

        @[JSON::Field(key: "encryptionAlgorithm")]
        getter encryption_algorithm : String?

        # A specified override of the default hash algorithm that is used in a code-signing job.

        @[JSON::Field(key: "hashAlgorithm")]
        getter hash_algorithm : String?

        def initialize(
          @encryption_algorithm : String? = nil,
          @hash_algorithm : String? = nil
        )
        end
      end

      # The image format of a AWS Signer platform or profile.

      struct SigningImageFormat
        include JSON::Serializable

        # The default format of a signing image.

        @[JSON::Field(key: "defaultFormat")]
        getter default_format : String

        # The supported formats of a signing image.

        @[JSON::Field(key: "supportedFormats")]
        getter supported_formats : Array(String)

        def initialize(
          @default_format : String,
          @supported_formats : Array(String)
        )
        end
      end

      # Contains information about a signing job.

      struct SigningJob
        include JSON::Serializable

        # The date and time that the signing job was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Indicates whether the signing job is revoked.

        @[JSON::Field(key: "isRevoked")]
        getter is_revoked : Bool?

        # The ID of the signing job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The AWS account ID of the job invoker.

        @[JSON::Field(key: "jobInvoker")]
        getter job_invoker : String?

        # The AWS account ID of the job owner.

        @[JSON::Field(key: "jobOwner")]
        getter job_owner : String?

        # The name of a signing platform.

        @[JSON::Field(key: "platformDisplayName")]
        getter platform_display_name : String?

        # The unique identifier for a signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # The name of the signing profile that created a signing job.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String?

        # The version of the signing profile that created a signing job.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # The time when the signature of a signing job expires.

        @[JSON::Field(key: "signatureExpiresAt")]
        getter signature_expires_at : Time?

        # A SignedObject structure that contains information about a signing job's signed code image.

        @[JSON::Field(key: "signedObject")]
        getter signed_object : Types::SignedObject?

        # A SigningMaterial object that contains the Amazon Resource Name (ARN) of the certificate used for
        # the signing job.

        @[JSON::Field(key: "signingMaterial")]
        getter signing_material : Types::SigningMaterial?

        # A Source that contains information about a signing job's code image source.

        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        # The status of the signing job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @is_revoked : Bool? = nil,
          @job_id : String? = nil,
          @job_invoker : String? = nil,
          @job_owner : String? = nil,
          @platform_display_name : String? = nil,
          @platform_id : String? = nil,
          @profile_name : String? = nil,
          @profile_version : String? = nil,
          @signature_expires_at : Time? = nil,
          @signed_object : Types::SignedObject? = nil,
          @signing_material : Types::SigningMaterial? = nil,
          @source : Types::Source? = nil,
          @status : String? = nil
        )
        end
      end

      # Revocation information for a signing job.

      struct SigningJobRevocationRecord
        include JSON::Serializable

        # A caller-supplied reason for revocation.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The time of revocation.

        @[JSON::Field(key: "revokedAt")]
        getter revoked_at : Time?

        # The identity of the revoker.

        @[JSON::Field(key: "revokedBy")]
        getter revoked_by : String?

        def initialize(
          @reason : String? = nil,
          @revoked_at : Time? = nil,
          @revoked_by : String? = nil
        )
        end
      end

      # The ACM certificate that is used to sign your code.

      struct SigningMaterial
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificates that is used to sign your code.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      # Contains information about the signing configurations and parameters that are used to perform a
      # code-signing job.

      struct SigningPlatform
        include JSON::Serializable

        # The category of a signing platform.

        @[JSON::Field(key: "category")]
        getter category : String?

        # The display name of a signing platform.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The maximum size (in MB) of code that can be signed by a signing platform.

        @[JSON::Field(key: "maxSizeInMB")]
        getter max_size_in_mb : Int32?

        # Any partner entities linked to a signing platform.

        @[JSON::Field(key: "partner")]
        getter partner : String?

        # The ID of a signing platform.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # Indicates whether revocation is supported for the platform.

        @[JSON::Field(key: "revocationSupported")]
        getter revocation_supported : Bool?

        # The configuration of a signing platform. This includes the designated hash algorithm and encryption
        # algorithm of a signing platform.

        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfiguration?


        @[JSON::Field(key: "signingImageFormat")]
        getter signing_image_format : Types::SigningImageFormat?

        # The types of targets that can be signed by a signing platform.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @category : String? = nil,
          @display_name : String? = nil,
          @max_size_in_mb : Int32? = nil,
          @partner : String? = nil,
          @platform_id : String? = nil,
          @revocation_supported : Bool? = nil,
          @signing_configuration : Types::SigningConfiguration? = nil,
          @signing_image_format : Types::SigningImageFormat? = nil,
          @target : String? = nil
        )
        end
      end

      # Any overrides that are applied to the signing configuration of a signing platform.

      struct SigningPlatformOverrides
        include JSON::Serializable

        # A signing configuration that overrides the default encryption or hash algorithm of a signing job.

        @[JSON::Field(key: "signingConfiguration")]
        getter signing_configuration : Types::SigningConfigurationOverrides?

        # A signed image is a JSON object. When overriding the default signing platform configuration, a
        # customer can select either of two signing formats, JSONEmbedded or JSONDetached . (A third format
        # value, JSON , is reserved for future use.) With JSONEmbedded , the signing image has the payload
        # embedded in it. With JSONDetached , the payload is not be embedded in the signing image.

        @[JSON::Field(key: "signingImageFormat")]
        getter signing_image_format : String?

        def initialize(
          @signing_configuration : Types::SigningConfigurationOverrides? = nil,
          @signing_image_format : String? = nil
        )
        end
      end

      # Contains information about the ACM certificates and signing configuration parameters that can be
      # used by a given code signing user.

      struct SigningProfile
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the signing profile.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the signing platform.

        @[JSON::Field(key: "platformDisplayName")]
        getter platform_display_name : String?

        # The ID of a platform that is available for use by a signing profile.

        @[JSON::Field(key: "platformId")]
        getter platform_id : String?

        # The name of the signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String?

        # The version of a signing profile.

        @[JSON::Field(key: "profileVersion")]
        getter profile_version : String?

        # The ARN of a signing profile, including the profile version.

        @[JSON::Field(key: "profileVersionArn")]
        getter profile_version_arn : String?

        # The validity period for a signing job created using this signing profile.

        @[JSON::Field(key: "signatureValidityPeriod")]
        getter signature_validity_period : Types::SignatureValidityPeriod?

        # The ACM certificate that is available for use by a signing profile.

        @[JSON::Field(key: "signingMaterial")]
        getter signing_material : Types::SigningMaterial?

        # The parameters that are available for use by a Signer user.

        @[JSON::Field(key: "signingParameters")]
        getter signing_parameters : Hash(String, String)?

        # The status of a signing profile.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of tags associated with the signing profile.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @platform_display_name : String? = nil,
          @platform_id : String? = nil,
          @profile_name : String? = nil,
          @profile_version : String? = nil,
          @profile_version_arn : String? = nil,
          @signature_validity_period : Types::SignatureValidityPeriod? = nil,
          @signing_material : Types::SigningMaterial? = nil,
          @signing_parameters : Hash(String, String)? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Revocation information for a signing profile.

      struct SigningProfileRevocationRecord
        include JSON::Serializable

        # The time when revocation becomes effective.

        @[JSON::Field(key: "revocationEffectiveFrom")]
        getter revocation_effective_from : Time?

        # The time when the signing profile was revoked.

        @[JSON::Field(key: "revokedAt")]
        getter revoked_at : Time?

        # The identity of the revoker.

        @[JSON::Field(key: "revokedBy")]
        getter revoked_by : String?

        def initialize(
          @revocation_effective_from : Time? = nil,
          @revoked_at : Time? = nil,
          @revoked_by : String? = nil
        )
        end
      end

      # An S3Source object that contains information about the S3 bucket where you saved your unsigned code.

      struct Source
        include JSON::Serializable

        # The S3Source object.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3Source?

        def initialize(
          @s3 : Types::S3Source? = nil
        )
        end
      end


      struct StartSigningJobRequest
        include JSON::Serializable

        # String that identifies the signing request. All calls after the first that use this token return the
        # same response as the first call.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String

        # The S3 bucket in which to save your signed object. The destination contains the name of your bucket
        # and an optional prefix.

        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination

        # The name of the signing profile.

        @[JSON::Field(key: "profileName")]
        getter profile_name : String

        # The S3 bucket that contains the object to sign or a BLOB that contains your raw code.

        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # The AWS account ID of the signing profile owner.

        @[JSON::Field(key: "profileOwner")]
        getter profile_owner : String?

        def initialize(
          @client_request_token : String,
          @destination : Types::Destination,
          @profile_name : String,
          @source : Types::Source,
          @profile_owner : String? = nil
        )
        end
      end


      struct StartSigningJobResponse
        include JSON::Serializable

        # The ID of your signing job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The AWS account ID of the signing job owner.

        @[JSON::Field(key: "jobOwner")]
        getter job_owner : String?

        def initialize(
          @job_id : String? = nil,
          @job_owner : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the signing profile.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # One or more tags to be associated with the signing profile.

        @[JSON::Field(key: "tags")]
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

      # The request was denied due to request throttling. Instead of this error, TooManyRequestsException
      # should be used.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The allowed number of job-signing requests has been exceeded. This error supersedes the error
      # ThrottlingException .

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the signing profile.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of tag keys to be removed from the signing profile.

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

      # You signing certificate could not be validated.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "code")]
        getter code : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end
    end
  end
end
