require "json"
require "time"

module AwsSdk
  module PaymentCryptography
    module Types

      # You do not have sufficient access to perform this action. This exception is thrown when the caller
      # lacks the necessary IAM permissions to perform the requested operation. Verify that your IAM policy
      # includes the required permissions for the specific Amazon Web Services Payment Cryptography action
      # you're attempting.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input parameters for adding replication regions to a specific key.
      struct AddKeyReplicationRegionsInput
        include JSON::Serializable

        # The key identifier (ARN or alias) of the key for which to add replication regions. This key must
        # exist and be in a valid state for replication operations.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The list of Amazon Web Services Regions to add to the key's replication configuration. Each region
        # must be a valid Amazon Web Services Region where Amazon Web Services Payment Cryptography is
        # available. The key will be replicated to these regions, allowing cryptographic operations to be
        # performed closer to your applications.
        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)

        def initialize(
          @key_identifier : String,
          @replication_regions : Array(String)
        )
        end
      end

      # Output from adding replication regions to a key.
      struct AddKeyReplicationRegionsOutput
        include JSON::Serializable

        # The updated key metadata after adding the replication regions. This includes the current state of
        # the key and its replication configuration.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # Contains information about an alias.
      struct Alias
        include JSON::Serializable

        # A friendly name that you can use to refer to a key. The value must begin with alias/ . Do not
        # include confidential or sensitive information in this field. This field may be displayed in
        # plaintext in CloudTrail logs and other output.
        @[JSON::Field(key: "AliasName")]
        getter alias_name : String

        # The KeyARN of the key associated with the alias.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String?

        def initialize(
          @alias_name : String,
          @key_arn : String? = nil
        )
        end
      end

      # The metadata used to create the certificate signing request.
      struct CertificateSubjectType
        include JSON::Serializable

        # The name you provide to create the certificate signing request.
        @[JSON::Field(key: "CommonName")]
        getter common_name : String

        # The city you provide to create the certificate signing request.
        @[JSON::Field(key: "City")]
        getter city : String?

        # The country you provide to create the certificate signing request.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # The email address you provide to create the certificate signing request.
        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The organization you provide to create the certificate signing request.
        @[JSON::Field(key: "Organization")]
        getter organization : String?

        # The organization unit you provide to create the certificate signing request.
        @[JSON::Field(key: "OrganizationUnit")]
        getter organization_unit : String?

        # The state or province you provide to create the certificate signing request.
        @[JSON::Field(key: "StateOrProvince")]
        getter state_or_province : String?

        def initialize(
          @common_name : String,
          @city : String? = nil,
          @country : String? = nil,
          @email_address : String? = nil,
          @organization : String? = nil,
          @organization_unit : String? = nil,
          @state_or_province : String? = nil
        )
        end
      end

      # This request can cause an inconsistent state for the resource. The requested operation conflicts
      # with the current state of the resource. For example, attempting to delete a key that is currently
      # being used, or trying to create a resource that already exists.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateAliasInput
        include JSON::Serializable

        # A friendly name that you can use to refer to a key. An alias must begin with alias/ followed by a
        # name, for example alias/ExampleAlias . It can contain only alphanumeric characters, forward slashes
        # (/), underscores (_), and dashes (-). Don't include personal, confidential or sensitive information
        # in this field. This field may be displayed in plaintext in CloudTrail logs and other output.
        @[JSON::Field(key: "AliasName")]
        getter alias_name : String

        # The KeyARN of the key to associate with the alias.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String?

        def initialize(
          @alias_name : String,
          @key_arn : String? = nil
        )
        end
      end

      struct CreateAliasOutput
        include JSON::Serializable

        # The alias for the key.
        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias

        def initialize(
          @alias : Types::Alias
        )
        end
      end

      struct CreateKeyInput
        include JSON::Serializable

        # Specifies whether the key is exportable from the service.
        @[JSON::Field(key: "Exportable")]
        getter exportable : Bool

        # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
        # key. This data is immutable after the key is created.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # The intended cryptographic usage of keys derived from the ECC key pair to be created. After creating
        # an ECC key pair, you cannot change the intended cryptographic usage of keys derived from it using
        # ECDH.
        @[JSON::Field(key: "DeriveKeyUsage")]
        getter derive_key_usage : String?

        # Specifies whether to enable the key. If the key is enabled, it is activated for use within the
        # service. If the key is not enabled, then it is created but not activated. The default value is
        # enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. For TDES keys, the KCV is computed by encrypting 8
        # bytes, each with value of zero, with the key to be checked and retaining the 3 highest order bytes
        # of the encrypted result. For AES keys, the KCV is computed using a CMAC algorithm where the input
        # data is 16 bytes of zero and retaining the 3 highest order bytes of the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)?

        # Assigns one or more tags to the Amazon Web Services Payment Cryptography key. Use this parameter to
        # tag a key when it is created. To tag an existing Amazon Web Services Payment Cryptography key, use
        # the TagResource operation. Each tag consists of a tag key and a tag value. Both the tag key and the
        # tag value are required, but the tag value can be an empty (null) string. You can't have more than
        # one tag on an Amazon Web Services Payment Cryptography key with the same tag key. Don't include
        # personal, confidential or sensitive information in this field. This field may be displayed in
        # plaintext in CloudTrail logs and other output. Tagging or untagging an Amazon Web Services Payment
        # Cryptography key can allow or deny permission to the key.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @exportable : Bool,
          @key_attributes : Types::KeyAttributes,
          @derive_key_usage : String? = nil,
          @enabled : Bool? = nil,
          @key_check_value_algorithm : String? = nil,
          @replication_regions : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateKeyOutput
        include JSON::Serializable

        # The key material that contains all the key attributes.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      struct DeleteAliasInput
        include JSON::Serializable

        # A friendly name that you can use to refer Amazon Web Services Payment Cryptography key. This value
        # must begin with alias/ followed by a name, such as alias/ExampleAlias .
        @[JSON::Field(key: "AliasName")]
        getter alias_name : String

        def initialize(
          @alias_name : String
        )
        end
      end

      struct DeleteAliasOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKeyInput
        include JSON::Serializable

        # The KeyARN of the key that is scheduled for deletion.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The waiting period for key deletion. The default value is seven days.
        @[JSON::Field(key: "DeleteKeyInDays")]
        getter delete_key_in_days : Int32?

        def initialize(
          @key_identifier : String,
          @delete_key_in_days : Int32? = nil
        )
        end
      end

      struct DeleteKeyOutput
        include JSON::Serializable

        # The KeyARN of the key that is scheduled for deletion.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # The shared information used when deriving a key using ECDH.
      struct DiffieHellmanDerivationData
        include JSON::Serializable

        # A string containing information that binds the ECDH derived key to the two parties involved or to
        # the context of the key. It may include details like identities of the two parties deriving the key,
        # context of the operation, session IDs, and optionally a nonce. It must not contain zero bytes. It is
        # not recommended to reuse shared information for multiple ECDH key derivations, as it could result in
        # derived key material being the same across different derivations.
        @[JSON::Field(key: "SharedInformation")]
        getter shared_information : String?

        def initialize(
          @shared_information : String? = nil
        )
        end
      end

      # Input parameters for disabling default key replication regions for the account.
      struct DisableDefaultKeyReplicationRegionsInput
        include JSON::Serializable

        # The list of Amazon Web Services Regions to remove from the account's default replication regions.
        # New keys created after this operation will not automatically be replicated to these regions, though
        # existing keys with replication to these regions will be unaffected.
        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)

        def initialize(
          @replication_regions : Array(String)
        )
        end
      end

      # Output from disabling default key replication regions for the account.
      struct DisableDefaultKeyReplicationRegionsOutput
        include JSON::Serializable

        # The remaining list of regions where default key replication is still enabled for the account. This
        # reflects the account's default replication configuration after removing the specified regions.
        @[JSON::Field(key: "EnabledReplicationRegions")]
        getter enabled_replication_regions : Array(String)

        def initialize(
          @enabled_replication_regions : Array(String)
        )
        end
      end

      # Input parameters for enabling default key replication regions for the account.
      struct EnableDefaultKeyReplicationRegionsInput
        include JSON::Serializable

        # The list of Amazon Web Services Regions to enable as default replication regions for the Amazon Web
        # Services account for Multi-Region key replication . New keys created in this account will
        # automatically be replicated to these regions unless explicitly overridden during key creation.
        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)

        def initialize(
          @replication_regions : Array(String)
        )
        end
      end

      # Output from enabling default key replication regions for the account.
      struct EnableDefaultKeyReplicationRegionsOutput
        include JSON::Serializable

        # The complete list of regions where default key replication is now enabled for the account. This
        # includes both previously enabled regions and the newly added regions from this operation.
        @[JSON::Field(key: "EnabledReplicationRegions")]
        getter enabled_replication_regions : Array(String)

        def initialize(
          @enabled_replication_regions : Array(String)
        )
        end
      end

      # Parameter information for key material export using AS2805 key cryptogram format.
      struct ExportAs2805KeyCryptogram
        include JSON::Serializable

        # The cryptographic usage of the key under export.
        @[JSON::Field(key: "As2805KeyVariant")]
        getter as2805_key_variant : String

        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String

        def initialize(
          @as2805_key_variant : String,
          @wrapping_key_identifier : String
        )
        end
      end

      # The attributes for IPEK generation during export.
      struct ExportAttributes
        include JSON::Serializable

        # Parameter information for IPEK export.
        @[JSON::Field(key: "ExportDukptInitialKey")]
        getter export_dukpt_initial_key : Types::ExportDukptInitialKey?

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. Specify KCV for IPEK export only. For TDES keys,
        # the KCV is computed by encrypting 8 bytes, each with value of zero, with the key to be checked and
        # retaining the 3 highest order bytes of the encrypted result. For AES keys, the KCV is computed using
        # a CMAC algorithm where the input data is 16 bytes of zero and retaining the 3 highest order bytes of
        # the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        def initialize(
          @export_dukpt_initial_key : Types::ExportDukptInitialKey? = nil,
          @key_check_value_algorithm : String? = nil
        )
        end
      end

      # Key derivation parameter information for key material export using asymmetric ECDH key exchange
      # method.
      struct ExportDiffieHellmanTr31KeyBlock
        include JSON::Serializable

        # The keyARN of the CA that signed the PublicKeyCertificate for the client's receiving ECC key pair.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The shared information used when deriving a key using ECDH.
        @[JSON::Field(key: "DerivationData")]
        getter derivation_data : Types::DiffieHellmanDerivationData

        # The key algorithm of the shared derived ECDH key.
        @[JSON::Field(key: "DeriveKeyAlgorithm")]
        getter derive_key_algorithm : String

        # The key derivation function to use when deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationFunction")]
        getter key_derivation_function : String

        # The hash type to use when deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationHashAlgorithm")]
        getter key_derivation_hash_algorithm : String

        # The keyARN of the asymmetric ECC key created within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "PrivateKeyIdentifier")]
        getter private_key_identifier : String

        # The public key certificate of the client's receiving ECC key pair, in PEM format (base64 encoded),
        # to use for ECDH key derivation.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        @[JSON::Field(key: "KeyBlockHeaders")]
        getter key_block_headers : Types::KeyBlockHeaders?

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @derivation_data : Types::DiffieHellmanDerivationData,
          @derive_key_algorithm : String,
          @key_derivation_function : String,
          @key_derivation_hash_algorithm : String,
          @private_key_identifier : String,
          @public_key_certificate : String,
          @key_block_headers : Types::KeyBlockHeaders? = nil
        )
        end
      end

      # Parameter information for IPEK generation during export.
      struct ExportDukptInitialKey
        include JSON::Serializable

        # The KSN for IPEK generation using DUKPT. KSN must be padded before sending to Amazon Web Services
        # Payment Cryptography. KSN hex length should be 20 for a TDES_2KEY key or 24 for an AES key.
        @[JSON::Field(key: "KeySerialNumber")]
        getter key_serial_number : String

        def initialize(
          @key_serial_number : String
        )
        end
      end

      # Parameter information for key material export using asymmetric RSA wrap and unwrap key exchange
      # method.
      struct ExportKeyCryptogram
        include JSON::Serializable

        # The KeyARN of the certificate chain that signs the wrapping key certificate during RSA wrap and
        # unwrap key export.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The wrapping key certificate in PEM format (base64 encoded). Amazon Web Services Payment
        # Cryptography uses this certificate to wrap the key under export.
        @[JSON::Field(key: "WrappingKeyCertificate")]
        getter wrapping_key_certificate : String

        # The wrapping spec for the key under export.
        @[JSON::Field(key: "WrappingSpec")]
        getter wrapping_spec : String?

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @wrapping_key_certificate : String,
          @wrapping_spec : String? = nil
        )
        end
      end

      struct ExportKeyInput
        include JSON::Serializable

        # The KeyARN of the key under export from Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "ExportKeyIdentifier")]
        getter export_key_identifier : String

        # The key block format type, for example, TR-34 or TR-31, to use during key material export.
        @[JSON::Field(key: "KeyMaterial")]
        getter key_material : Types::ExportKeyMaterial

        # The attributes for IPEK generation during export.
        @[JSON::Field(key: "ExportAttributes")]
        getter export_attributes : Types::ExportAttributes?

        def initialize(
          @export_key_identifier : String,
          @key_material : Types::ExportKeyMaterial,
          @export_attributes : Types::ExportAttributes? = nil
        )
        end
      end

      # Parameter information for key material export from Amazon Web Services Payment Cryptography using
      # TR-31 or TR-34 or RSA wrap and unwrap key exchange method.
      struct ExportKeyMaterial
        include JSON::Serializable

        # Parameter information for key material export using AS2805 key cryptogram format.
        @[JSON::Field(key: "As2805KeyCryptogram")]
        getter as2805_key_cryptogram : Types::ExportAs2805KeyCryptogram?

        # Key derivation parameter information for key material export using asymmetric ECDH key exchange
        # method.
        @[JSON::Field(key: "DiffieHellmanTr31KeyBlock")]
        getter diffie_hellman_tr31_key_block : Types::ExportDiffieHellmanTr31KeyBlock?

        # Parameter information for key material export using asymmetric RSA wrap and unwrap key exchange
        # method
        @[JSON::Field(key: "KeyCryptogram")]
        getter key_cryptogram : Types::ExportKeyCryptogram?

        # Parameter information for key material export using symmetric TR-31 key exchange method.
        @[JSON::Field(key: "Tr31KeyBlock")]
        getter tr31_key_block : Types::ExportTr31KeyBlock?

        # Parameter information for key material export using the asymmetric TR-34 key exchange method.
        @[JSON::Field(key: "Tr34KeyBlock")]
        getter tr34_key_block : Types::ExportTr34KeyBlock?

        def initialize(
          @as2805_key_cryptogram : Types::ExportAs2805KeyCryptogram? = nil,
          @diffie_hellman_tr31_key_block : Types::ExportDiffieHellmanTr31KeyBlock? = nil,
          @key_cryptogram : Types::ExportKeyCryptogram? = nil,
          @tr31_key_block : Types::ExportTr31KeyBlock? = nil,
          @tr34_key_block : Types::ExportTr34KeyBlock? = nil
        )
        end
      end

      struct ExportKeyOutput
        include JSON::Serializable

        # The key material under export as a TR-34 WrappedKeyBlock or a TR-31 WrappedKeyBlock. or a RSA
        # WrappedKeyCryptogram.
        @[JSON::Field(key: "WrappedKey")]
        getter wrapped_key : Types::WrappedKey?

        def initialize(
          @wrapped_key : Types::WrappedKey? = nil
        )
        end
      end

      # Parameter information for key material export using symmetric TR-31 key exchange method.
      struct ExportTr31KeyBlock
        include JSON::Serializable

        # The KeyARN of the the wrapping key. This key encrypts or wraps the key under export for TR-31 key
        # block generation.
        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String

        # Optional metadata for export associated with the key material. This data is signed but transmitted
        # in clear text.
        @[JSON::Field(key: "KeyBlockHeaders")]
        getter key_block_headers : Types::KeyBlockHeaders?

        def initialize(
          @wrapping_key_identifier : String,
          @key_block_headers : Types::KeyBlockHeaders? = nil
        )
        end
      end

      # Parameter information for key material export using the asymmetric TR-34 key exchange method.
      struct ExportTr34KeyBlock
        include JSON::Serializable

        # The KeyARN of the certificate chain that signs the wrapping key certificate during TR-34 key export.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The format of key block that Amazon Web Services Payment Cryptography will use during key export.
        @[JSON::Field(key: "KeyBlockFormat")]
        getter key_block_format : String

        # The KeyARN of the wrapping key certificate. Amazon Web Services Payment Cryptography uses this
        # certificate to wrap the key under export.
        @[JSON::Field(key: "WrappingKeyCertificate")]
        getter wrapping_key_certificate : String

        # The export token to initiate key export from Amazon Web Services Payment Cryptography. It also
        # contains the signing key certificate that will sign the wrapped key during TR-34 key block
        # generation. Call GetParametersForExport to receive an export token. It expires after 30 days. You
        # can use the same export token to export multiple keys from the same service account.
        @[JSON::Field(key: "ExportToken")]
        getter export_token : String?

        # Optional metadata for export associated with the key material. This data is signed but transmitted
        # in clear text.
        @[JSON::Field(key: "KeyBlockHeaders")]
        getter key_block_headers : Types::KeyBlockHeaders?

        # A random number value that is unique to the TR-34 key block generated using 2 pass. The operation
        # will fail, if a random nonce value is not provided for a TR-34 key block generated using 2 pass.
        @[JSON::Field(key: "RandomNonce")]
        getter random_nonce : String?

        # The certificate used to sign the TR-34 key block.
        @[JSON::Field(key: "SigningKeyCertificate")]
        getter signing_key_certificate : String?

        # Key Identifier used for signing the export key
        @[JSON::Field(key: "SigningKeyIdentifier")]
        getter signing_key_identifier : String?

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @key_block_format : String,
          @wrapping_key_certificate : String,
          @export_token : String? = nil,
          @key_block_headers : Types::KeyBlockHeaders? = nil,
          @random_nonce : String? = nil,
          @signing_key_certificate : String? = nil,
          @signing_key_identifier : String? = nil
        )
        end
      end

      struct GetAliasInput
        include JSON::Serializable

        # The alias of the Amazon Web Services Payment Cryptography key.
        @[JSON::Field(key: "AliasName")]
        getter alias_name : String

        def initialize(
          @alias_name : String
        )
        end
      end

      struct GetAliasOutput
        include JSON::Serializable

        # The alias of the Amazon Web Services Payment Cryptography key.
        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias

        def initialize(
          @alias : Types::Alias
        )
        end
      end

      struct GetCertificateSigningRequestInput
        include JSON::Serializable

        # The metadata used to create the CSR.
        @[JSON::Field(key: "CertificateSubject")]
        getter certificate_subject : Types::CertificateSubjectType

        # Asymmetric key used for generating the certificate signing request
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The cryptographic algorithm used to sign your CSR.
        @[JSON::Field(key: "SigningAlgorithm")]
        getter signing_algorithm : String

        def initialize(
          @certificate_subject : Types::CertificateSubjectType,
          @key_identifier : String,
          @signing_algorithm : String
        )
        end
      end

      struct GetCertificateSigningRequestOutput
        include JSON::Serializable

        # The certificate signing request generated using the key pair associated with the key identifier.
        @[JSON::Field(key: "CertificateSigningRequest")]
        getter certificate_signing_request : String

        def initialize(
          @certificate_signing_request : String
        )
        end
      end

      # Input parameters for retrieving the account's default key replication regions. This operation
      # requires no input parameters.
      struct GetDefaultKeyReplicationRegionsInput
        include JSON::Serializable

        def initialize
        end
      end

      # Output containing the account's current default key replication configuration.
      struct GetDefaultKeyReplicationRegionsOutput
        include JSON::Serializable

        # The list of regions where default key replication is currently enabled for the account. New keys
        # created in this account will automatically be replicated to these regions unless explicitly
        # configured otherwise during key creation.
        @[JSON::Field(key: "EnabledReplicationRegions")]
        getter enabled_replication_regions : Array(String)

        def initialize(
          @enabled_replication_regions : Array(String)
        )
        end
      end

      struct GetKeyInput
        include JSON::Serializable

        # The KeyARN of the Amazon Web Services Payment Cryptography key.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        def initialize(
          @key_identifier : String
        )
        end
      end

      struct GetKeyOutput
        include JSON::Serializable

        # Contains the key metadata, including both immutable and mutable attributes for the key, but does not
        # include actual cryptographic key material.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      struct GetParametersForExportInput
        include JSON::Serializable

        # The key block format type (for example, TR-34 or TR-31) to use during key material export. Export
        # token is only required for a TR-34 key export, TR34_KEY_BLOCK . Export token is not required for
        # TR-31 key export.
        @[JSON::Field(key: "KeyMaterialType")]
        getter key_material_type : String

        # The signing key algorithm to generate a signing key certificate. This certificate signs the wrapped
        # key under export within the TR-34 key block. RSA_2048 is the only signing key algorithm allowed.
        @[JSON::Field(key: "SigningKeyAlgorithm")]
        getter signing_key_algorithm : String

        def initialize(
          @key_material_type : String,
          @signing_key_algorithm : String
        )
        end
      end

      struct GetParametersForExportOutput
        include JSON::Serializable

        # The export token to initiate key export from Amazon Web Services Payment Cryptography. The export
        # token expires after 30 days. You can use the same export token to export multiple keys from the same
        # service account.
        @[JSON::Field(key: "ExportToken")]
        getter export_token : String

        # The validity period of the export token.
        @[JSON::Field(key: "ParametersValidUntilTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter parameters_valid_until_timestamp : Time

        # The algorithm of the signing key certificate for use in TR-34 key block generation. RSA_2048 is the
        # only signing key algorithm allowed.
        @[JSON::Field(key: "SigningKeyAlgorithm")]
        getter signing_key_algorithm : String

        # The signing key certificate in PEM format (base64 encoded) of the public key for signature within
        # the TR-34 key block. The certificate expires after 30 days.
        @[JSON::Field(key: "SigningKeyCertificate")]
        getter signing_key_certificate : String

        # The root certificate authority (CA) that signed the signing key certificate in PEM format (base64
        # encoded).
        @[JSON::Field(key: "SigningKeyCertificateChain")]
        getter signing_key_certificate_chain : String

        def initialize(
          @export_token : String,
          @parameters_valid_until_timestamp : Time,
          @signing_key_algorithm : String,
          @signing_key_certificate : String,
          @signing_key_certificate_chain : String
        )
        end
      end

      struct GetParametersForImportInput
        include JSON::Serializable

        # The method to use for key material import. Import token is only required for TR-34 WrappedKeyBlock (
        # TR34_KEY_BLOCK ) and RSA WrappedKeyCryptogram ( KEY_CRYPTOGRAM ). Import token is not required for
        # TR-31, root public key cerificate or trusted public key certificate.
        @[JSON::Field(key: "KeyMaterialType")]
        getter key_material_type : String

        # The wrapping key algorithm to generate a wrapping key certificate. This certificate wraps the key
        # under import. At this time, RSA_2048 is the allowed algorithm for TR-34 WrappedKeyBlock import.
        # Additionally, RSA_2048 , RSA_3072 , RSA_4096 are the allowed algorithms for RSA WrappedKeyCryptogram
        # import.
        @[JSON::Field(key: "WrappingKeyAlgorithm")]
        getter wrapping_key_algorithm : String

        def initialize(
          @key_material_type : String,
          @wrapping_key_algorithm : String
        )
        end
      end

      struct GetParametersForImportOutput
        include JSON::Serializable

        # The import token to initiate key import into Amazon Web Services Payment Cryptography. The import
        # token expires after 30 days. You can use the same import token to import multiple keys to the same
        # service account.
        @[JSON::Field(key: "ImportToken")]
        getter import_token : String

        # The validity period of the import token.
        @[JSON::Field(key: "ParametersValidUntilTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter parameters_valid_until_timestamp : Time

        # The algorithm of the wrapping key for use within TR-34 WrappedKeyBlock or RSA WrappedKeyCryptogram.
        @[JSON::Field(key: "WrappingKeyAlgorithm")]
        getter wrapping_key_algorithm : String

        # The wrapping key certificate in PEM format (base64 encoded) of the wrapping key for use within the
        # TR-34 key block. The certificate expires in 30 days.
        @[JSON::Field(key: "WrappingKeyCertificate")]
        getter wrapping_key_certificate : String

        # The Amazon Web Services Payment Cryptography root certificate authority (CA) that signed the
        # wrapping key certificate in PEM format (base64 encoded).
        @[JSON::Field(key: "WrappingKeyCertificateChain")]
        getter wrapping_key_certificate_chain : String

        def initialize(
          @import_token : String,
          @parameters_valid_until_timestamp : Time,
          @wrapping_key_algorithm : String,
          @wrapping_key_certificate : String,
          @wrapping_key_certificate_chain : String
        )
        end
      end

      struct GetPublicKeyCertificateInput
        include JSON::Serializable

        # The KeyARN of the asymmetric key pair.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        def initialize(
          @key_identifier : String
        )
        end
      end

      struct GetPublicKeyCertificateOutput
        include JSON::Serializable

        # The public key component of the asymmetric key pair in a certificate PEM format (base64 encoded). It
        # is signed by the root certificate authority (CA). The certificate expires in 90 days.
        @[JSON::Field(key: "KeyCertificate")]
        getter key_certificate : String

        # The root certificate authority (CA) that signed the public key certificate in PEM format (base64
        # encoded) of the asymmetric key pair.
        @[JSON::Field(key: "KeyCertificateChain")]
        getter key_certificate_chain : String

        def initialize(
          @key_certificate : String,
          @key_certificate_chain : String
        )
        end
      end

      # Parameter information for key material import using AS2805 key cryptogram format.
      struct ImportAs2805KeyCryptogram
        include JSON::Serializable

        # The cryptographic usage of the key under import.
        @[JSON::Field(key: "As2805KeyVariant")]
        getter as2805_key_variant : String

        # Specified whether the key is exportable. This data is immutable after the key is imported.
        @[JSON::Field(key: "Exportable")]
        getter exportable : Bool

        # The key algorithm of the key under import.
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String

        @[JSON::Field(key: "KeyModesOfUse")]
        getter key_modes_of_use : Types::KeyModesOfUse

        # The wrapped key cryptogram under import.
        @[JSON::Field(key: "WrappedKeyCryptogram")]
        getter wrapped_key_cryptogram : String

        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String

        def initialize(
          @as2805_key_variant : String,
          @exportable : Bool,
          @key_algorithm : String,
          @key_modes_of_use : Types::KeyModesOfUse,
          @wrapped_key_cryptogram : String,
          @wrapping_key_identifier : String
        )
        end
      end

      # Key derivation parameter information for key material import using asymmetric ECDH key exchange
      # method.
      struct ImportDiffieHellmanTr31KeyBlock
        include JSON::Serializable

        # The keyARN of the CA that signed the PublicKeyCertificate for the client's receiving ECC key pair.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The shared information used when deriving a key using ECDH.
        @[JSON::Field(key: "DerivationData")]
        getter derivation_data : Types::DiffieHellmanDerivationData

        # The key algorithm of the shared derived ECDH key.
        @[JSON::Field(key: "DeriveKeyAlgorithm")]
        getter derive_key_algorithm : String

        # The key derivation function to use when deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationFunction")]
        getter key_derivation_function : String

        # The hash type to use when deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationHashAlgorithm")]
        getter key_derivation_hash_algorithm : String

        # The keyARN of the asymmetric ECC key created within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "PrivateKeyIdentifier")]
        getter private_key_identifier : String

        # The public key certificate of the client's receiving ECC key pair, in PEM format (base64 encoded),
        # to use for ECDH key derivation.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        # The ECDH wrapped key block to import.
        @[JSON::Field(key: "WrappedKeyBlock")]
        getter wrapped_key_block : String

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @derivation_data : Types::DiffieHellmanDerivationData,
          @derive_key_algorithm : String,
          @key_derivation_function : String,
          @key_derivation_hash_algorithm : String,
          @private_key_identifier : String,
          @public_key_certificate : String,
          @wrapped_key_block : String
        )
        end
      end

      # Parameter information for key material import using asymmetric RSA wrap and unwrap key exchange
      # method.
      struct ImportKeyCryptogram
        include JSON::Serializable

        # Specifies whether the key is exportable from the service.
        @[JSON::Field(key: "Exportable")]
        getter exportable : Bool

        # The import token that initiates key import using the asymmetric RSA wrap and unwrap key exchange
        # method into AWS Payment Cryptography. It expires after 30 days. You can use the same import token to
        # import multiple keys to the same service account.
        @[JSON::Field(key: "ImportToken")]
        getter import_token : String

        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # The RSA wrapped key cryptogram under import.
        @[JSON::Field(key: "WrappedKeyCryptogram")]
        getter wrapped_key_cryptogram : String

        # The wrapping spec for the wrapped key cryptogram.
        @[JSON::Field(key: "WrappingSpec")]
        getter wrapping_spec : String?

        def initialize(
          @exportable : Bool,
          @import_token : String,
          @key_attributes : Types::KeyAttributes,
          @wrapped_key_cryptogram : String,
          @wrapping_spec : String? = nil
        )
        end
      end

      struct ImportKeyInput
        include JSON::Serializable

        # The key or public key certificate type to use during key material import, for example TR-34 or
        # RootCertificatePublicKey.
        @[JSON::Field(key: "KeyMaterial")]
        getter key_material : Types::ImportKeyMaterial

        # Specifies whether import key is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. For TDES keys, the KCV is computed by encrypting 8
        # bytes, each with value of zero, with the key to be checked and retaining the 3 highest order bytes
        # of the encrypted result. For AES keys, the KCV is computed using a CMAC algorithm where the input
        # data is 16 bytes of zero and retaining the 3 highest order bytes of the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)?

        # Assigns one or more tags to the Amazon Web Services Payment Cryptography key. Use this parameter to
        # tag a key when it is imported. To tag an existing Amazon Web Services Payment Cryptography key, use
        # the TagResource operation. Each tag consists of a tag key and a tag value. Both the tag key and the
        # tag value are required, but the tag value can be an empty (null) string. You can't have more than
        # one tag on an Amazon Web Services Payment Cryptography key with the same tag key. If you specify an
        # existing tag key with a different tag value, Amazon Web Services Payment Cryptography replaces the
        # current tag value with the specified one. Don't include personal, confidential or sensitive
        # information in this field. This field may be displayed in plaintext in CloudTrail logs and other
        # output. Tagging or untagging an Amazon Web Services Payment Cryptography key can allow or deny
        # permission to the key.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @key_material : Types::ImportKeyMaterial,
          @enabled : Bool? = nil,
          @key_check_value_algorithm : String? = nil,
          @replication_regions : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Parameter information for key material import into Amazon Web Services Payment Cryptography using
      # TR-31 or TR-34 or RSA wrap and unwrap key exchange method.
      struct ImportKeyMaterial
        include JSON::Serializable

        # Parameter information for key material import using AS2805 key cryptogram format.
        @[JSON::Field(key: "As2805KeyCryptogram")]
        getter as2805_key_cryptogram : Types::ImportAs2805KeyCryptogram?

        # Key derivation parameter information for key material import using asymmetric ECDH key exchange
        # method.
        @[JSON::Field(key: "DiffieHellmanTr31KeyBlock")]
        getter diffie_hellman_tr31_key_block : Types::ImportDiffieHellmanTr31KeyBlock?

        # Parameter information for key material import using asymmetric RSA wrap and unwrap key exchange
        # method.
        @[JSON::Field(key: "KeyCryptogram")]
        getter key_cryptogram : Types::ImportKeyCryptogram?

        # Parameter information for root public key certificate import.
        @[JSON::Field(key: "RootCertificatePublicKey")]
        getter root_certificate_public_key : Types::RootCertificatePublicKey?

        # Parameter information for key material import using symmetric TR-31 key exchange method.
        @[JSON::Field(key: "Tr31KeyBlock")]
        getter tr31_key_block : Types::ImportTr31KeyBlock?

        # Parameter information for key material import using the asymmetric TR-34 key exchange method.
        @[JSON::Field(key: "Tr34KeyBlock")]
        getter tr34_key_block : Types::ImportTr34KeyBlock?

        # Parameter information for trusted public key certificate import.
        @[JSON::Field(key: "TrustedCertificatePublicKey")]
        getter trusted_certificate_public_key : Types::TrustedCertificatePublicKey?

        def initialize(
          @as2805_key_cryptogram : Types::ImportAs2805KeyCryptogram? = nil,
          @diffie_hellman_tr31_key_block : Types::ImportDiffieHellmanTr31KeyBlock? = nil,
          @key_cryptogram : Types::ImportKeyCryptogram? = nil,
          @root_certificate_public_key : Types::RootCertificatePublicKey? = nil,
          @tr31_key_block : Types::ImportTr31KeyBlock? = nil,
          @tr34_key_block : Types::ImportTr34KeyBlock? = nil,
          @trusted_certificate_public_key : Types::TrustedCertificatePublicKey? = nil
        )
        end
      end

      struct ImportKeyOutput
        include JSON::Serializable

        # The KeyARN of the key material imported within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # Parameter information for key material import using symmetric TR-31 key exchange method.
      struct ImportTr31KeyBlock
        include JSON::Serializable

        # The TR-31 wrapped key block to import.
        @[JSON::Field(key: "WrappedKeyBlock")]
        getter wrapped_key_block : String

        # The KeyARN of the key that will decrypt or unwrap a TR-31 key block during import.
        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String

        def initialize(
          @wrapped_key_block : String,
          @wrapping_key_identifier : String
        )
        end
      end

      # Parameter information for key material import using the asymmetric TR-34 key exchange method.
      struct ImportTr34KeyBlock
        include JSON::Serializable

        # The KeyARN of the certificate chain that signs the signing key certificate during TR-34 key import.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The key block format to use during key import. The only value allowed is X9_TR34_2012 .
        @[JSON::Field(key: "KeyBlockFormat")]
        getter key_block_format : String

        # The public key component in PEM certificate format of the private key that signs the KDH TR-34
        # WrappedKeyBlock.
        @[JSON::Field(key: "SigningKeyCertificate")]
        getter signing_key_certificate : String

        # The TR-34 wrapped key block to import.
        @[JSON::Field(key: "WrappedKeyBlock")]
        getter wrapped_key_block : String

        # The import token that initiates key import using the asymmetric TR-34 key exchange method into
        # Amazon Web Services Payment Cryptography. It expires after 30 days. You can use the same import
        # token to import multiple keys to the same service account.
        @[JSON::Field(key: "ImportToken")]
        getter import_token : String?

        # A random number value that is unique to the TR-34 key block generated using 2 pass. The operation
        # will fail, if a random nonce value is not provided for a TR-34 key block generated using 2 pass.
        @[JSON::Field(key: "RandomNonce")]
        getter random_nonce : String?

        # The certificate used to wrap the TR-34 key block.
        @[JSON::Field(key: "WrappingKeyCertificate")]
        getter wrapping_key_certificate : String?

        # Key Identifier used for unwrapping the import key
        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String?

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @key_block_format : String,
          @signing_key_certificate : String,
          @wrapped_key_block : String,
          @import_token : String? = nil,
          @random_nonce : String? = nil,
          @wrapping_key_certificate : String? = nil,
          @wrapping_key_identifier : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure. This indicates
      # a server-side error within the Amazon Web Services Payment Cryptography service. If this error
      # persists, contact support for assistance.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Metadata about an Amazon Web Services Payment Cryptography key.
      struct Key
        include JSON::Serializable

        # The date and time when the key was created.
        @[JSON::Field(key: "CreateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_timestamp : Time

        # Specifies whether the key is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Specifies whether the key is exportable. This data is immutable after the key is created.
        @[JSON::Field(key: "Exportable")]
        getter exportable : Bool

        # The Amazon Resource Name (ARN) of the key.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
        # key. This data is immutable after the key is created.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # The key check value (KCV) is used to check if all parties holding a given key have the same key or
        # to detect that a key has changed.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. For TDES keys, the KCV is computed by encrypting 8
        # bytes, each with value of zero, with the key to be checked and retaining the 3 highest order bytes
        # of the encrypted result. For AES keys, the KCV is computed using a CMAC algorithm where the input
        # data is 16 bytes of zero and retaining the 3 highest order bytes of the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String

        # The source of the key material. For keys created within Amazon Web Services Payment Cryptography,
        # the value is AWS_PAYMENT_CRYPTOGRAPHY . For keys imported into Amazon Web Services Payment
        # Cryptography, the value is EXTERNAL .
        @[JSON::Field(key: "KeyOrigin")]
        getter key_origin : String

        # The state of key that is being created or deleted.
        @[JSON::Field(key: "KeyState")]
        getter key_state : String

        # The date and time after which Amazon Web Services Payment Cryptography will delete the key. This
        # value is present only when KeyState is DELETE_PENDING and the key is scheduled for deletion.
        @[JSON::Field(key: "DeletePendingTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_pending_timestamp : Time?

        # The date and time after which Amazon Web Services Payment Cryptography will delete the key. This
        # value is present only when when the KeyState is DELETE_COMPLETE and the Amazon Web Services Payment
        # Cryptography key is deleted.
        @[JSON::Field(key: "DeleteTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter delete_timestamp : Time?

        # The cryptographic usage of an ECDH derived key as deﬁned in section A.5.2 of the TR-31 spec.
        @[JSON::Field(key: "DeriveKeyUsage")]
        getter derive_key_usage : String?

        # Indicates whether this key is a Multi-Region key and its role in the Multi-Region key hierarchy.
        # Multi-Region replication keys allow the same key material to be used across multiple Amazon Web
        # Services Regions. This field specifies whether the key is a Primary Region key (PRK) (which can be
        # replicated to other Amazon Web Services Regions) or a Replica Region key (RRK) (which is a copy of a
        # PRK in another Region). For more information, see Multi-Region key replication .
        @[JSON::Field(key: "MultiRegionKeyType")]
        getter multi_region_key_type : String?

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String?

        # Information about the replication status of the key across different Amazon Web Services Regions.
        # This field provides details about the current state of key replication, including any status
        # messages or operational information. It helps track the progress and health of key replication
        # operations.
        @[JSON::Field(key: "ReplicationStatus")]
        getter replication_status : Hash(String, Types::ReplicationStatusType)?

        # The date and time after which Amazon Web Services Payment Cryptography will start using the key
        # material for cryptographic operations.
        @[JSON::Field(key: "UsageStartTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter usage_start_timestamp : Time?

        # The date and time after which Amazon Web Services Payment Cryptography will stop using the key
        # material for cryptographic operations.
        @[JSON::Field(key: "UsageStopTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter usage_stop_timestamp : Time?

        # Indicates whether this key is using the account's default replication regions configuration for
        # Multi-Region key replication . When set to true , the key automatically replicates to the regions
        # specified in the account's default replication settings. When set to false , the key has a custom
        # replication configuration that overrides the account defaults.
        @[JSON::Field(key: "UsingDefaultReplicationRegions")]
        getter using_default_replication_regions : Bool?

        def initialize(
          @create_timestamp : Time,
          @enabled : Bool,
          @exportable : Bool,
          @key_arn : String,
          @key_attributes : Types::KeyAttributes,
          @key_check_value : String,
          @key_check_value_algorithm : String,
          @key_origin : String,
          @key_state : String,
          @delete_pending_timestamp : Time? = nil,
          @delete_timestamp : Time? = nil,
          @derive_key_usage : String? = nil,
          @multi_region_key_type : String? = nil,
          @primary_region : String? = nil,
          @replication_status : Hash(String, Types::ReplicationStatusType)? = nil,
          @usage_start_timestamp : Time? = nil,
          @usage_stop_timestamp : Time? = nil,
          @using_default_replication_regions : Bool? = nil
        )
        end
      end

      # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
      # key. This data is immutable after the key is created.
      struct KeyAttributes
        include JSON::Serializable

        # The key algorithm to be use during creation of an Amazon Web Services Payment Cryptography key. For
        # symmetric keys, Amazon Web Services Payment Cryptography supports AES and TDES algorithms. For
        # asymmetric keys, Amazon Web Services Payment Cryptography supports RSA and ECC_NIST algorithms.
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String

        # The type of Amazon Web Services Payment Cryptography key to create, which determines the
        # classiﬁcation of the cryptographic method and whether Amazon Web Services Payment Cryptography key
        # contains a symmetric key or an asymmetric key pair.
        @[JSON::Field(key: "KeyClass")]
        getter key_class : String

        # The list of cryptographic operations that you can perform using the key.
        @[JSON::Field(key: "KeyModesOfUse")]
        getter key_modes_of_use : Types::KeyModesOfUse

        # The cryptographic usage of an Amazon Web Services Payment Cryptography key as deﬁned in section
        # A.5.2 of the TR-31 spec.
        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : String

        def initialize(
          @key_algorithm : String,
          @key_class : String,
          @key_modes_of_use : Types::KeyModesOfUse,
          @key_usage : String
        )
        end
      end

      # Optional metadata for export associated with the key material. This data is signed but transmitted
      # in clear text.
      struct KeyBlockHeaders
        include JSON::Serializable

        # Specifies subsequent exportability of the key within the key block after it is received by the
        # receiving party. It can be used to further restrict exportability of the key after export from
        # Amazon Web Services Payment Cryptography. When set to EXPORTABLE , the key can be subsequently
        # exported by the receiver under a KEK using TR-31 or TR-34 key block export only. When set to
        # NON_EXPORTABLE , the key cannot be subsequently exported by the receiver. When set to SENSITIVE ,
        # the key can be exported by the receiver under a KEK using TR-31, TR-34, RSA wrap and unwrap
        # cryptogram or using a symmetric cryptogram key export method. For further information refer to ANSI
        # X9.143-2022 .
        @[JSON::Field(key: "KeyExportability")]
        getter key_exportability : String?

        @[JSON::Field(key: "KeyModesOfUse")]
        getter key_modes_of_use : Types::KeyModesOfUse?

        # Parameter used to indicate the version of the key carried in the key block or indicate the value
        # carried in the key block is a component of a key.
        @[JSON::Field(key: "KeyVersion")]
        getter key_version : String?

        # Parameter used to indicate the type of optional data in key block headers. Refer to ANSI X9.143-2022
        # for information on allowed data type for optional blocks. Optional block character limit is 112
        # characters. For each optional block, 2 characters are reserved for optional block ID and 2
        # characters reserved for optional block length. More than one optional blocks can be included as long
        # as the combined length does not increase 112 characters.
        @[JSON::Field(key: "OptionalBlocks")]
        getter optional_blocks : Hash(String, String)?

        def initialize(
          @key_exportability : String? = nil,
          @key_modes_of_use : Types::KeyModesOfUse? = nil,
          @key_version : String? = nil,
          @optional_blocks : Hash(String, String)? = nil
        )
        end
      end

      # The list of cryptographic operations that you can perform using the key. The modes of use are deﬁned
      # in section A.5.3 of the TR-31 spec.
      struct KeyModesOfUse
        include JSON::Serializable

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to decrypt data.
        @[JSON::Field(key: "Decrypt")]
        getter decrypt : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to derive new keys.
        @[JSON::Field(key: "DeriveKey")]
        getter derive_key : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to encrypt data.
        @[JSON::Field(key: "Encrypt")]
        getter encrypt : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to generate and verify
        # other card and PIN verification keys.
        @[JSON::Field(key: "Generate")]
        getter generate : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key has no special restrictions other
        # than the restrictions implied by KeyUsage .
        @[JSON::Field(key: "NoRestrictions")]
        getter no_restrictions : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used for signing.
        @[JSON::Field(key: "Sign")]
        getter sign : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to unwrap other keys.
        @[JSON::Field(key: "Unwrap")]
        getter unwrap : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to verify signatures.
        @[JSON::Field(key: "Verify")]
        getter verify : Bool?

        # Speciﬁes whether an Amazon Web Services Payment Cryptography key can be used to wrap other keys.
        @[JSON::Field(key: "Wrap")]
        getter wrap : Bool?

        def initialize(
          @decrypt : Bool? = nil,
          @derive_key : Bool? = nil,
          @encrypt : Bool? = nil,
          @generate : Bool? = nil,
          @no_restrictions : Bool? = nil,
          @sign : Bool? = nil,
          @unwrap : Bool? = nil,
          @verify : Bool? = nil,
          @wrap : Bool? = nil
        )
        end
      end

      # Metadata about an Amazon Web Services Payment Cryptography key.
      struct KeySummary
        include JSON::Serializable

        # Specifies whether the key is enabled.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Specifies whether the key is exportable. This data is immutable after the key is created.
        @[JSON::Field(key: "Exportable")]
        getter exportable : Bool

        # The Amazon Resource Name (ARN) of the key.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
        # key. This data is immutable after the key is created.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # The key check value (KCV) is used to check if all parties holding a given key have the same key or
        # to detect that a key has changed.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The state of an Amazon Web Services Payment Cryptography that is being created or deleted.
        @[JSON::Field(key: "KeyState")]
        getter key_state : String

        # Indicates whether this key is a Multi-Region key and its role in the Multi-Region key hierarchy.
        # Multi-Region replication keys allow the same key material to be used across multiple Amazon Web
        # Services Regions. This field specifies whether the key is a Primary Region key (PRK) (which can be
        # replicated to other Amazon Web Services Regions) or a Replica Region key (RRK) (which is a copy of a
        # PRK in another Region). For more information, see Multi-Region key replication .
        @[JSON::Field(key: "MultiRegionKeyType")]
        getter multi_region_key_type : String?

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String?

        def initialize(
          @enabled : Bool,
          @exportable : Bool,
          @key_arn : String,
          @key_attributes : Types::KeyAttributes,
          @key_check_value : String,
          @key_state : String,
          @multi_region_key_type : String? = nil,
          @primary_region : String? = nil
        )
        end
      end

      struct ListAliasesInput
        include JSON::Serializable

        # The keyARN for which you want to list all aliases.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String?

        # Use this parameter to specify the maximum number of items to return. When this value is present,
        # Amazon Web Services Payment Cryptography does not return more than the specified number of items,
        # but it might return fewer. This value is optional. If you include a value, it must be between 1 and
        # 100, inclusive. If you do not include a value, it defaults to 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter in a subsequent request after you receive a response with truncated results. Set
        # it to the value of NextToken from the truncated response you just received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @key_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAliasesOutput
        include JSON::Serializable

        # The list of aliases. Each alias describes the KeyArn contained within.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::Alias)

        # The token for the next set of results, or an empty or null value if there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @aliases : Array(Types::Alias),
          @next_token : String? = nil
        )
        end
      end

      struct ListKeysInput
        include JSON::Serializable

        # The key state of the keys you want to list.
        @[JSON::Field(key: "KeyState")]
        getter key_state : String?

        # Use this parameter to specify the maximum number of items to return. When this value is present,
        # Amazon Web Services Payment Cryptography does not return more than the specified number of items,
        # but it might return fewer. This value is optional. If you include a value, it must be between 1 and
        # 100, inclusive. If you do not include a value, it defaults to 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter in a subsequent request after you receive a response with truncated results. Set
        # it to the value of NextToken from the truncated response you just received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @key_state : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKeysOutput
        include JSON::Serializable

        # The list of keys created within the caller's Amazon Web Services account and Amazon Web Services
        # Region.
        @[JSON::Field(key: "Keys")]
        getter keys : Array(Types::KeySummary)

        # The token for the next set of results, or an empty or null value if there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @keys : Array(Types::KeySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The KeyARN of the key whose tags you are getting.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Use this parameter to specify the maximum number of items to return. When this value is present,
        # Amazon Web Services Payment Cryptography does not return more than the specified number of items,
        # but it might return fewer. This value is optional. If you include a value, it must be between 1 and
        # 100, inclusive. If you do not include a value, it defaults to 50.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter in a subsequent request after you receive a response with truncated results. Set
        # it to the value of NextToken from the truncated response you just received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags associated with a ResourceArn . Each tag will list the key-value pair contained
        # within that tag.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        # The token for the next set of results, or an empty or null value if there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @tags : Array(Types::Tag),
          @next_token : String? = nil
        )
        end
      end

      # Input parameters for removing replication regions from a specific key.
      struct RemoveKeyReplicationRegionsInput
        include JSON::Serializable

        # The key identifier (ARN or alias) of the key from which to remove replication regions. This key must
        # exist and have replication enabled in the specified regions.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The list of Amazon Web Services Regions to remove from the key's replication configuration. The key
        # will no longer be available for cryptographic operations in these regions after removal. Ensure no
        # active operations depend on the key in these regions before removal.
        @[JSON::Field(key: "ReplicationRegions")]
        getter replication_regions : Array(String)

        def initialize(
          @key_identifier : String,
          @replication_regions : Array(String)
        )
        end
      end

      # Output from removing replication regions from a key.
      struct RemoveKeyReplicationRegionsOutput
        include JSON::Serializable

        # The updated key metadata after removing the replication regions. This reflects the current state of
        # the key and its updated replication configuration.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # Represents the replication status information for a key in a replication region for Multi-Region key
      # replication . This structure contains details about the current state of key replication, including
      # any status messages and operational information about the replication process.
      struct ReplicationStatusType
        include JSON::Serializable

        # The current status of key replication in this Amazon Web Services Region. This field indicates
        # whether the key replication is in progress, completed successfully, or has encountered an error.
        # Possible values include states such as SYNCRHONIZED , IN_PROGRESS , DELETE_IN_PROGRESS , or FAILED .
        # This provides visibility into the replication process for monitoring and troubleshooting purposes.
        @[JSON::Field(key: "Status")]
        getter status : String

        # A message that provides additional information about the current replication status of the key. This
        # field contains details about any issues or progress updates related to key replication operations.
        # It may include information about replication failures, synchronization status, or other operational
        # details.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @status : String,
          @status_message : String? = nil
        )
        end
      end

      # The request was denied due to resource not found. The specified key, alias, or other resource does
      # not exist in your account or region. Verify that the resource identifier is correct and that the
      # resource exists in the expected region.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The identifier of the resource that was not found. This field contains the specific resource
        # identifier (such as a key ARN or alias name) that could not be located.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @resource_id : String? = nil
        )
        end
      end

      struct RestoreKeyInput
        include JSON::Serializable

        # The KeyARN of the key to be restored within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        def initialize(
          @key_identifier : String
        )
        end
      end

      struct RestoreKeyOutput
        include JSON::Serializable

        # The key material of the restored key. The KeyState will change to CREATE_COMPLETE and value for
        # DeletePendingTimestamp gets removed.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # Parameter information for root public key certificate import.
      struct RootCertificatePublicKey
        include JSON::Serializable

        # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
        # key. This data is immutable after the root public key is imported.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # Parameter information for root public key certificate import.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        def initialize(
          @key_attributes : Types::KeyAttributes,
          @public_key_certificate : String
        )
        end
      end

      # This request would cause a service quota to be exceeded. You have reached the maximum number of
      # keys, aliases, or other resources allowed in your account. Review your current usage and consider
      # deleting unused resources or requesting a quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service cannot complete the request. The Amazon Web Services Payment Cryptography service is
      # temporarily unavailable. This is typically a temporary condition - retry your request after a brief
      # delay.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct StartKeyUsageInput
        include JSON::Serializable

        # The KeyArn of the key.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        def initialize(
          @key_identifier : String
        )
        end
      end

      struct StartKeyUsageOutput
        include JSON::Serializable

        # The KeyARN of the Amazon Web Services Payment Cryptography key activated for use.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      struct StopKeyUsageInput
        include JSON::Serializable

        # The KeyArn of the key.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        def initialize(
          @key_identifier : String
        )
        end
      end

      struct StopKeyUsageOutput
        include JSON::Serializable

        # The KeyARN of the key.
        @[JSON::Field(key: "Key")]
        getter key : Types::Key

        def initialize(
          @key : Types::Key
        )
        end
      end

      # A structure that contains information about a tag.
      struct Tag
        include JSON::Serializable

        # The key of the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The KeyARN of the key whose tags are being updated.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tags. Each tag consists of a tag key and a tag value. The tag value can be an empty
        # (null) string. You can't have more than one tag on an Amazon Web Services Payment Cryptography key
        # with the same tag key. If you specify an existing tag key with a different tag value, Amazon Web
        # Services Payment Cryptography replaces the current tag value with the new one. Don't include
        # personal, confidential or sensitive information in this field. This field may be displayed in
        # plaintext in CloudTrail logs and other output. To use this parameter, you must have TagResource
        # permission in an IAM policy. Don't include personal, confidential or sensitive information in this
        # field. This field may be displayed in plaintext in CloudTrail logs and other output.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling. You have exceeded the rate limits for Amazon Web
      # Services Payment Cryptography API calls. Implement exponential backoff and retry logic in your
      # application to handle throttling gracefully.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter information for trusted public key certificate import.
      struct TrustedCertificatePublicKey
        include JSON::Serializable

        # The KeyARN of the root public key certificate or certificate chain that signs the trusted public key
        # certificate import.
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The role of the key, the algorithm it supports, and the cryptographic operations allowed with the
        # key. This data is immutable after a trusted public key is imported.
        @[JSON::Field(key: "KeyAttributes")]
        getter key_attributes : Types::KeyAttributes

        # Parameter information for trusted public key certificate import.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @key_attributes : Types::KeyAttributes,
          @public_key_certificate : String
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The KeyARN of the key whose tags are being removed.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tag keys. Don't include the tag values. If the Amazon Web Services Payment Cryptography
        # key doesn't have the specified tag key, Amazon Web Services Payment Cryptography doesn't throw an
        # exception or return a response. To confirm that the operation succeeded, use the ListTagsForResource
        # operation.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAliasInput
        include JSON::Serializable

        # The alias whose associated key is changing.
        @[JSON::Field(key: "AliasName")]
        getter alias_name : String

        # The KeyARN for the key that you are updating or removing from the alias.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String?

        def initialize(
          @alias_name : String,
          @key_arn : String? = nil
        )
        end
      end

      struct UpdateAliasOutput
        include JSON::Serializable

        # The alias name.
        @[JSON::Field(key: "Alias")]
        getter alias : Types::Alias

        def initialize(
          @alias : Types::Alias
        )
        end
      end

      # The request was denied due to an invalid request error. One or more parameters in your request are
      # invalid. Check the parameter values, formats, and constraints specified in the API documentation.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter information for generating a WrappedKeyBlock for key exchange.
      struct WrappedKey
        include JSON::Serializable

        # Parameter information for generating a wrapped key using TR-31 or TR-34 skey exchange method.
        @[JSON::Field(key: "KeyMaterial")]
        getter key_material : String

        # The key block format of a wrapped key.
        @[JSON::Field(key: "WrappedKeyMaterialFormat")]
        getter wrapped_key_material_format : String

        # The KeyARN of the wrapped key.
        @[JSON::Field(key: "WrappingKeyArn")]
        getter wrapping_key_arn : String

        # The key check value (KCV) is used to check if all parties holding a given key have the same key or
        # to detect that a key has changed.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String?

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. For TDES keys, the KCV is computed by encrypting 8
        # bytes, each with value of zero, with the key to be checked and retaining the 3 highest order bytes
        # of the encrypted result. For AES keys, the KCV is computed using a CMAC algorithm where the input
        # data is 16 bytes of zero and retaining the 3 highest order bytes of the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        def initialize(
          @key_material : String,
          @wrapped_key_material_format : String,
          @wrapping_key_arn : String,
          @key_check_value : String? = nil,
          @key_check_value_algorithm : String? = nil
        )
        end
      end
    end
  end
end
