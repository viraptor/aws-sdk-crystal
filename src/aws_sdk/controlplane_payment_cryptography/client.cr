module AwsSdk
  module PaymentCryptography
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

      # Adds replication Amazon Web Services Regions to an existing Amazon Web Services Payment Cryptography
      # key, enabling the key to be used for cryptographic operations in additional Amazon Web Services
      # Regions. Multi-Region key replication allow you to use the same key material across multiple Amazon
      # Web Services Regions, providing lower latency for applications distributed across regions. When you
      # add Replication Regions, Amazon Web Services Payment Cryptography securely replicates the key
      # material to the specified Amazon Web Services Regions. The key must be in an active state to add
      # Replication Regions. You can add multiple regions in a single operation, and the key will be
      # available for use in those regions once replication is complete. Cross-account use: This operation
      # can't be used across different Amazon Web Services accounts. Related operations:
      # RemoveKeyReplicationRegions EnableDefaultKeyReplicationRegions GetDefaultKeyReplicationRegions
      def add_key_replication_regions(
        key_identifier : String,
        replication_regions : Array(String)
      ) : Types::AddKeyReplicationRegionsOutput
        input = Types::AddKeyReplicationRegionsInput.new(key_identifier: key_identifier, replication_regions: replication_regions)
        add_key_replication_regions(input)
      end
      def add_key_replication_regions(input : Types::AddKeyReplicationRegionsInput) : Types::AddKeyReplicationRegionsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_KEY_REPLICATION_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddKeyReplicationRegionsOutput, "AddKeyReplicationRegions")
      end

      # Creates an alias , or a friendly name, for an Amazon Web Services Payment Cryptography key. You can
      # use an alias to identify a key in the console and when you call cryptographic operations such as
      # EncryptData or DecryptData . You can associate the alias with any key in the same Amazon Web
      # Services Region. Each alias is associated with only one key at a time, but a key can have multiple
      # aliases. You can't create an alias without a key. The alias must be unique in the account and Amazon
      # Web Services Region, but you can create another alias with the same name in a different Amazon Web
      # Services Region. To change the key that's associated with the alias, call UpdateAlias . To delete
      # the alias, call DeleteAlias . These operations don't affect the underlying key. To get the alias
      # that you created, call ListAliases . Cross-account use : This operation can't be used across
      # different Amazon Web Services accounts. Related operations: DeleteAlias GetAlias ListAliases
      # UpdateAlias
      def create_alias(
        alias_name : String,
        key_arn : String? = nil
      ) : Types::CreateAliasOutput
        input = Types::CreateAliasInput.new(alias_name: alias_name, key_arn: key_arn)
        create_alias(input)
      end
      def create_alias(input : Types::CreateAliasInput) : Types::CreateAliasOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAliasOutput, "CreateAlias")
      end

      # Creates an Amazon Web Services Payment Cryptography key, a logical representation of a cryptographic
      # key, that is unique in your account and Amazon Web Services Region. You use keys for cryptographic
      # functions such as encryption and decryption. In addition to the key material used in cryptographic
      # operations, an Amazon Web Services Payment Cryptography key includes metadata such as the key ARN,
      # key usage, key origin, creation date, description, and key state. When you create a key, you specify
      # both immutable and mutable data about the key. The immutable data contains key attributes that
      # define the scope and cryptographic operations that you can perform using the key, for example key
      # class (example: SYMMETRIC_KEY ), key algorithm (example: TDES_2KEY ), key usage (example:
      # TR31_P0_PIN_ENCRYPTION_KEY ) and key modes of use (example: Encrypt ). Amazon Web Services Payment
      # Cryptography binds key attributes to keys using key blocks when you store or export them. Amazon Web
      # Services Payment Cryptography stores the key contents wrapped and never stores or transmits them in
      # the clear. For information about valid combinations of key attributes, see Understanding key
      # attributes in the Amazon Web Services Payment Cryptography User Guide . The mutable data contained
      # within a key includes usage timestamp and key deletion timestamp and can be modified after creation.
      # You can use the CreateKey operation to generate an ECC (Elliptic Curve Cryptography) key pair used
      # for establishing an ECDH (Elliptic Curve Diffie-Hellman) key agreement between two parties. In the
      # ECDH key agreement process, both parties generate their own ECC key pair with key usage K3 and
      # exchange the public keys. Each party then use their private key, the received public key from the
      # other party, and the key derivation parameters including key derivation function, hash algorithm,
      # derivation data, and key algorithm to derive a shared key. To maintain the single-use principle of
      # cryptographic keys in payments, ECDH derived keys should not be used for multiple purposes, such as
      # a TR31_P0_PIN_ENCRYPTION_KEY and TR31_K1_KEY_BLOCK_PROTECTION_KEY . When creating ECC key pairs in
      # Amazon Web Services Payment Cryptography you can optionally set the DeriveKeyUsage parameter, which
      # defines the key usage bound to the symmetric key that will be derived using the ECC key pair.
      # Cross-account use : This operation can't be used across different Amazon Web Services accounts.
      # Related operations: DeleteKey GetKey ListKeys
      def create_key(
        exportable : Bool,
        key_attributes : Types::KeyAttributes,
        derive_key_usage : String? = nil,
        enabled : Bool? = nil,
        key_check_value_algorithm : String? = nil,
        replication_regions : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateKeyOutput
        input = Types::CreateKeyInput.new(exportable: exportable, key_attributes: key_attributes, derive_key_usage: derive_key_usage, enabled: enabled, key_check_value_algorithm: key_check_value_algorithm, replication_regions: replication_regions, tags: tags)
        create_key(input)
      end
      def create_key(input : Types::CreateKeyInput) : Types::CreateKeyOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateKeyOutput, "CreateKey")
      end

      # Deletes the alias, but doesn't affect the underlying key. Each key can have multiple aliases. To get
      # the aliases of all keys, use the UpdateAlias operation. To change the alias of a key, first use
      # DeleteAlias to delete the current alias and then use CreateAlias to create a new alias. To associate
      # an existing alias with a different key, call UpdateAlias . Cross-account use: This operation can't
      # be used across different Amazon Web Services accounts. Related operations: CreateAlias GetAlias
      # ListAliases UpdateAlias
      def delete_alias(
        alias_name : String
      ) : Types::DeleteAliasOutput
        input = Types::DeleteAliasInput.new(alias_name: alias_name)
        delete_alias(input)
      end
      def delete_alias(input : Types::DeleteAliasInput) : Types::DeleteAliasOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAliasOutput, "DeleteAlias")
      end

      # Deletes the key material and metadata associated with Amazon Web Services Payment Cryptography key.
      # Key deletion is irreversible. After a key is deleted, you can't perform cryptographic operations
      # using the key. For example, you can't decrypt data that was encrypted by a deleted Amazon Web
      # Services Payment Cryptography key, and the data may become unrecoverable. Because key deletion is
      # destructive, Amazon Web Services Payment Cryptography has a safety mechanism to prevent accidental
      # deletion of a key. When you call this operation, Amazon Web Services Payment Cryptography disables
      # the specified key but doesn't delete it until after a waiting period set using DeleteKeyInDays . The
      # default waiting period is 7 days. During the waiting period, the KeyState is DELETE_PENDING . After
      # the key is deleted, the KeyState is DELETE_COMPLETE . You should delete a key only when you are sure
      # that you don't need to use it anymore and no other parties are utilizing this key. If you aren't
      # sure, consider deactivating it instead by calling StopKeyUsage . Cross-account use: This operation
      # can't be used across different Amazon Web Services accounts. Related operations: RestoreKey
      # StartKeyUsage StopKeyUsage
      def delete_key(
        key_identifier : String,
        delete_key_in_days : Int32? = nil
      ) : Types::DeleteKeyOutput
        input = Types::DeleteKeyInput.new(key_identifier: key_identifier, delete_key_in_days: delete_key_in_days)
        delete_key(input)
      end
      def delete_key(input : Types::DeleteKeyInput) : Types::DeleteKeyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteKeyOutput, "DeleteKey")
      end

      # Disables Multi-Region key replication settings for the specified Amazon Web Services Regions in your
      # Amazon Web Services account, preventing new keys from being automatically replicated to those
      # regions. After disabling Multi-Region key replication for specific regions, new keys created in your
      # account will not be automatically replicated to those regions. You can still manually add
      # replication to those regions for individual keys using the AddKeyReplicationRegions operation. This
      # operation does not affect existing keys or their current replication configuration. Cross-account
      # use: This operation can't be used across different Amazon Web Services accounts. Related operations:
      # EnableDefaultKeyReplicationRegions GetDefaultKeyReplicationRegions
      def disable_default_key_replication_regions(
        replication_regions : Array(String)
      ) : Types::DisableDefaultKeyReplicationRegionsOutput
        input = Types::DisableDefaultKeyReplicationRegionsInput.new(replication_regions: replication_regions)
        disable_default_key_replication_regions(input)
      end
      def disable_default_key_replication_regions(input : Types::DisableDefaultKeyReplicationRegionsInput) : Types::DisableDefaultKeyReplicationRegionsOutput
        request = Protocol::JsonRpc.build_request(Model::DISABLE_DEFAULT_KEY_REPLICATION_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableDefaultKeyReplicationRegionsOutput, "DisableDefaultKeyReplicationRegions")
      end

      # Enables Multi-Region key replication settings for your Amazon Web Services account, causing new keys
      # to be automatically replicated to the specified Amazon Web Services Regions when created. When
      # Multi-Region key replication are enabled, any new keys created in your account will automatically be
      # replicated to these regions unless you explicitly override this behavior during key creation. This
      # simplifies key management for applications that operate across multiple regions. Existing keys are
      # not affected by this operation - only keys created after enabling default replication will be
      # automatically replicated. Cross-account use: This operation can't be used across different Amazon
      # Web Services accounts. Related operations: DisableDefaultKeyReplicationRegions
      # GetDefaultKeyReplicationRegions
      def enable_default_key_replication_regions(
        replication_regions : Array(String)
      ) : Types::EnableDefaultKeyReplicationRegionsOutput
        input = Types::EnableDefaultKeyReplicationRegionsInput.new(replication_regions: replication_regions)
        enable_default_key_replication_regions(input)
      end
      def enable_default_key_replication_regions(input : Types::EnableDefaultKeyReplicationRegionsInput) : Types::EnableDefaultKeyReplicationRegionsOutput
        request = Protocol::JsonRpc.build_request(Model::ENABLE_DEFAULT_KEY_REPLICATION_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableDefaultKeyReplicationRegionsOutput, "EnableDefaultKeyReplicationRegions")
      end

      # Exports a key from Amazon Web Services Payment Cryptography. Amazon Web Services Payment
      # Cryptography simplifies key exchange by replacing the existing paper-based approach with a modern
      # electronic approach. With ExportKey you can export symmetric keys using either symmetric and
      # asymmetric key exchange mechanisms. Using this operation, you can share your Amazon Web Services
      # Payment Cryptography generated keys with other service partners to perform cryptographic operations
      # outside of Amazon Web Services Payment Cryptography For symmetric key exchange, Amazon Web Services
      # Payment Cryptography uses the ANSI X9 TR-31 norm in accordance with PCI PIN guidelines. And for
      # asymmetric key exchange, Amazon Web Services Payment Cryptography supports ANSI X9 TR-34 norm, RSA
      # unwrap, and ECDH (Elliptic Curve Diffie-Hellman) key exchange mechanisms. Asymmetric key exchange
      # methods are typically used to establish bi-directional trust between the two parties exhanging keys
      # and are used for initial key exchange such as Key Encryption Key (KEK). After which you can export
      # working keys using symmetric method to perform various cryptographic operations within Amazon Web
      # Services Payment Cryptography. PCI requires specific minimum key strength of wrapping keys used to
      # protect the keys being exchanged electronically. These requirements can change when PCI standards
      # are revised. The rules specify that wrapping keys used for transport must be at least as strong as
      # the key being protected. For more information on recommended key strength of wrapping keys and key
      # exchange mechanism, see Importing and exporting keys in the Amazon Web Services Payment Cryptography
      # User Guide . You can also use ExportKey functionality to generate and export an IPEK (Initial Pin
      # Encryption Key) from Amazon Web Services Payment Cryptography using either TR-31 or TR-34 export key
      # exchange. IPEK is generated from BDK (Base Derivation Key) and ExportDukptInitialKey attribute KSN (
      # KeySerialNumber ). The generated IPEK does not persist within Amazon Web Services Payment
      # Cryptography and has to be re-generated each time during export. For key exchange using TR-31 or
      # TR-34 key blocks, you can also export optional blocks within the key block header which contain
      # additional attribute information about the key. The KeyVersion within KeyBlockHeaders indicates the
      # version of the key within the key block. Furthermore, KeyExportability within KeyBlockHeaders can be
      # used to further restrict exportability of the key after export from Amazon Web Services Payment
      # Cryptography. The OptionalBlocks contain the additional data related to the key. For information on
      # data type that can be included within optional blocks, refer to ASC X9.143-2022 . Data included in
      # key block headers is signed but transmitted in clear text. Sensitive or confidential information
      # should not be included in optional blocks. Refer to ASC X9.143-2022 standard for information on
      # allowed data type. To export initial keys (KEK) or IPEK using TR-34 Using this operation, you can
      # export initial key using TR-34 asymmetric key exchange. You can only export KEK generated within
      # Amazon Web Services Payment Cryptography. In TR-34 terminology, the sending party of the key is
      # called Key Distribution Host (KDH) and the receiving party of the key is called Key Receiving Device
      # (KRD). During key export process, KDH is Amazon Web Services Payment Cryptography which initiates
      # key export and KRD is the user receiving the key. To initiate TR-34 key export, the KRD must obtain
      # an export token by calling GetParametersForExport . This operation also generates a key pair for the
      # purpose of key export, signs the key and returns back the signing public key certificate (also known
      # as KDH signing certificate) and root certificate chain. The KDH uses the private key to sign the the
      # export payload and the signing public key certificate is provided to KRD to verify the signature.
      # The KRD can import the root certificate into its Hardware Security Module (HSM), as required. The
      # export token and the associated KDH signing certificate expires after 30 days. Next the KRD
      # generates a key pair for the the purpose of encrypting the KDH key and provides the public key
      # cerificate (also known as KRD wrapping certificate) back to KDH. The KRD will also import the root
      # cerificate chain into Amazon Web Services Payment Cryptography by calling ImportKey for
      # RootCertificatePublicKey . The KDH, Amazon Web Services Payment Cryptography, will use the KRD
      # wrapping cerificate to encrypt (wrap) the key under export and signs it with signing private key to
      # generate a TR-34 WrappedKeyBlock. For more information on TR-34 key export, see section Exporting
      # symmetric keys in the Amazon Web Services Payment Cryptography User Guide . Set the following
      # parameters: ExportAttributes : Specify export attributes in case of IPEK export. This parameter is
      # optional for KEK export. ExportKeyIdentifier : The KeyARN of the KEK or BDK (in case of IPEK) under
      # export. KeyMaterial : Use Tr34KeyBlock parameters. CertificateAuthorityPublicKeyIdentifier : The
      # KeyARN of the certificate chain that signed the KRD wrapping key certificate. ExportToken : Obtained
      # from KDH by calling GetParametersForImport . WrappingKeyCertificate : The public key certificate in
      # PEM format (base64 encoded) of the KRD wrapping key Amazon Web Services Payment Cryptography uses
      # for encryption of the TR-34 export payload. This certificate must be signed by the root certificate
      # (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web Services Payment Cryptography.
      # When this operation is successful, Amazon Web Services Payment Cryptography returns the KEK or IPEK
      # as a TR-34 WrappedKeyBlock. To export initial keys (KEK) or IPEK using RSA Wrap and Unwrap Using
      # this operation, you can export initial key using asymmetric RSA wrap and unwrap key exchange method.
      # To initiate export, generate an asymmetric key pair on the receiving HSM and obtain the public key
      # certificate in PEM format (base64 encoded) for the purpose of wrapping and the root certifiate
      # chain. Import the root certificate into Amazon Web Services Payment Cryptography by calling
      # ImportKey for RootCertificatePublicKey . Next call ExportKey and set the following parameters:
      # CertificateAuthorityPublicKeyIdentifier : The KeyARN of the certificate chain that signed wrapping
      # key certificate. KeyMaterial : Set to KeyCryptogram . WrappingKeyCertificate : The public key
      # certificate in PEM format (base64 encoded) obtained by the receiving HSM and signed by the root
      # certificate (CertificateAuthorityPublicKeyIdentifier) imported into Amazon Web Services Payment
      # Cryptography. The receiving HSM uses its private key component to unwrap the WrappedKeyCryptogram.
      # When this operation is successful, Amazon Web Services Payment Cryptography returns the
      # WrappedKeyCryptogram. To export working keys or IPEK using TR-31 Using this operation, you can
      # export working keys or IPEK using TR-31 symmetric key exchange. In TR-31, you must use an initial
      # key such as KEK to encrypt or wrap the key under export. To establish a KEK, you can use CreateKey
      # or ImportKey . Set the following parameters: ExportAttributes : Specify export attributes in case of
      # IPEK export. This parameter is optional for KEK export. ExportKeyIdentifier : The KeyARN of the KEK
      # or BDK (in case of IPEK) under export. KeyMaterial : Use Tr31KeyBlock parameters. To export working
      # keys using ECDH You can also use ECDH key agreement to export working keys in a TR-31 keyblock,
      # where the wrapping key is an ECDH derived key. To initiate a TR-31 key export using ECDH, both sides
      # must create an ECC key pair with key usage K3 and exchange public key certificates. In Amazon Web
      # Services Payment Cryptography, you can do this by calling CreateKey . If you have not already done
      # so, you must import the CA chain that issued the receiving public key certificate by calling
      # ImportKey with input RootCertificatePublicKey for root CA or TrustedPublicKey for intermediate CA.
      # You can then complete a TR-31 key export by deriving a shared wrapping key using the service ECC key
      # pair, public certificate of your ECC key pair outside of Amazon Web Services Payment Cryptography,
      # and the key derivation parameters including key derivation function, hash algorithm, derivation
      # data, key algorithm. KeyMaterial : Use DiffieHellmanTr31KeyBlock parameters. PrivateKeyIdentifier :
      # The KeyArn of the ECC key pair created within Amazon Web Services Payment Cryptography to derive a
      # shared KEK. PublicKeyCertificate : The public key certificate of the receiving ECC key pair in PEM
      # format (base64 encoded) to derive a shared KEK. CertificateAuthorityPublicKeyIdentifier : The keyARN
      # of the CA that signed the public key certificate of the receiving ECC key pair. When this operation
      # is successful, Amazon Web Services Payment Cryptography returns the working key as a TR-31
      # WrappedKeyBlock, where the wrapping key is the ECDH derived key. Cross-account use: This operation
      # can't be used across different Amazon Web Services accounts. Related operations:
      # GetParametersForExport ImportKey
      def export_key(
        export_key_identifier : String,
        key_material : Types::ExportKeyMaterial,
        export_attributes : Types::ExportAttributes? = nil
      ) : Types::ExportKeyOutput
        input = Types::ExportKeyInput.new(export_key_identifier: export_key_identifier, key_material: key_material, export_attributes: export_attributes)
        export_key(input)
      end
      def export_key(input : Types::ExportKeyInput) : Types::ExportKeyOutput
        request = Protocol::JsonRpc.build_request(Model::EXPORT_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportKeyOutput, "ExportKey")
      end

      # Gets the Amazon Web Services Payment Cryptography key associated with the alias. Cross-account use:
      # This operation can't be used across different Amazon Web Services accounts. Related operations:
      # CreateAlias DeleteAlias ListAliases UpdateAlias
      def get_alias(
        alias_name : String
      ) : Types::GetAliasOutput
        input = Types::GetAliasInput.new(alias_name: alias_name)
        get_alias(input)
      end
      def get_alias(input : Types::GetAliasInput) : Types::GetAliasOutput
        request = Protocol::JsonRpc.build_request(Model::GET_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAliasOutput, "GetAlias")
      end

      # Creates a certificate signing request (CSR) from a key pair.
      def get_certificate_signing_request(
        certificate_subject : Types::CertificateSubjectType,
        key_identifier : String,
        signing_algorithm : String
      ) : Types::GetCertificateSigningRequestOutput
        input = Types::GetCertificateSigningRequestInput.new(certificate_subject: certificate_subject, key_identifier: key_identifier, signing_algorithm: signing_algorithm)
        get_certificate_signing_request(input)
      end
      def get_certificate_signing_request(input : Types::GetCertificateSigningRequestInput) : Types::GetCertificateSigningRequestOutput
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATE_SIGNING_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificateSigningRequestOutput, "GetCertificateSigningRequest")
      end

      # Retrieves the list of Amazon Web Services Regions where Multi-Region key replication is currently
      # enabled for your Amazon Web Services account. This operation returns the current Multi-Region key
      # replication configuration. New keys created in your account will be automatically replicated to
      # these regions unless explicitly overridden during key creation. Cross-account use: This operation
      # can't be used across different Amazon Web Services accounts. Related operations:
      # EnableDefaultKeyReplicationRegions DisableDefaultKeyReplicationRegions
      def get_default_key_replication_regions : Types::GetDefaultKeyReplicationRegionsOutput
        input = Types::GetDefaultKeyReplicationRegionsInput.new
        get_default_key_replication_regions(input)
      end
      def get_default_key_replication_regions(input : Types::GetDefaultKeyReplicationRegionsInput) : Types::GetDefaultKeyReplicationRegionsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DEFAULT_KEY_REPLICATION_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDefaultKeyReplicationRegionsOutput, "GetDefaultKeyReplicationRegions")
      end

      # Gets the key metadata for an Amazon Web Services Payment Cryptography key, including the immutable
      # and mutable attributes specified when the key was created. Returns key metadata including
      # attributes, state, and timestamps, but does not return the actual cryptographic key material.
      # Cross-account use: This operation can't be used across different Amazon Web Services accounts.
      # Related operations: CreateKey DeleteKey ListKeys
      def get_key(
        key_identifier : String
      ) : Types::GetKeyOutput
        input = Types::GetKeyInput.new(key_identifier: key_identifier)
        get_key(input)
      end
      def get_key(input : Types::GetKeyInput) : Types::GetKeyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetKeyOutput, "GetKey")
      end

      # Gets the export token and the signing key certificate to initiate a TR-34 key export from Amazon Web
      # Services Payment Cryptography. The signing key certificate signs the wrapped key under export within
      # the TR-34 key payload. The export token and signing key certificate must be in place and operational
      # before calling ExportKey . The export token expires in 30 days. You can use the same export token to
      # export multiple keys from your service account. Cross-account use: This operation can't be used
      # across different Amazon Web Services accounts. Related operations: ExportKey GetParametersForImport
      def get_parameters_for_export(
        key_material_type : String,
        signing_key_algorithm : String
      ) : Types::GetParametersForExportOutput
        input = Types::GetParametersForExportInput.new(key_material_type: key_material_type, signing_key_algorithm: signing_key_algorithm)
        get_parameters_for_export(input)
      end
      def get_parameters_for_export(input : Types::GetParametersForExportInput) : Types::GetParametersForExportOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETERS_FOR_EXPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParametersForExportOutput, "GetParametersForExport")
      end

      # Gets the import token and the wrapping key certificate in PEM format (base64 encoded) to initiate a
      # TR-34 WrappedKeyBlock or a RSA WrappedKeyCryptogram import into Amazon Web Services Payment
      # Cryptography. The wrapping key certificate wraps the key under import. The import token and wrapping
      # key certificate must be in place and operational before calling ImportKey . The import token expires
      # in 30 days. You can use the same import token to import multiple keys into your service account.
      # Cross-account use: This operation can't be used across different Amazon Web Services accounts.
      # Related operations: GetParametersForExport ImportKey
      def get_parameters_for_import(
        key_material_type : String,
        wrapping_key_algorithm : String
      ) : Types::GetParametersForImportOutput
        input = Types::GetParametersForImportInput.new(key_material_type: key_material_type, wrapping_key_algorithm: wrapping_key_algorithm)
        get_parameters_for_import(input)
      end
      def get_parameters_for_import(input : Types::GetParametersForImportInput) : Types::GetParametersForImportOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETERS_FOR_IMPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParametersForImportOutput, "GetParametersForImport")
      end

      # Gets the public key certificate of the asymmetric key pair that exists within Amazon Web Services
      # Payment Cryptography. Unlike the private key of an asymmetric key, which never leaves Amazon Web
      # Services Payment Cryptography unencrypted, callers with GetPublicKeyCertificate permission can
      # download the public key certificate of the asymmetric key. You can share the public key certificate
      # to allow others to encrypt messages and verify signatures outside of Amazon Web Services Payment
      # Cryptography Cross-account use: This operation can't be used across different Amazon Web Services
      # accounts.
      def get_public_key_certificate(
        key_identifier : String
      ) : Types::GetPublicKeyCertificateOutput
        input = Types::GetPublicKeyCertificateInput.new(key_identifier: key_identifier)
        get_public_key_certificate(input)
      end
      def get_public_key_certificate(input : Types::GetPublicKeyCertificateInput) : Types::GetPublicKeyCertificateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PUBLIC_KEY_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPublicKeyCertificateOutput, "GetPublicKeyCertificate")
      end

      # Imports symmetric keys and public key certificates in PEM format (base64 encoded) into Amazon Web
      # Services Payment Cryptography. Amazon Web Services Payment Cryptography simplifies key exchange by
      # replacing the existing paper-based approach with a modern electronic approach. With ImportKey you
      # can import symmetric keys using either symmetric and asymmetric key exchange mechanisms. For
      # symmetric key exchange, Amazon Web Services Payment Cryptography uses the ANSI X9 TR-31 norm in
      # accordance with PCI PIN guidelines. And for asymmetric key exchange, Amazon Web Services Payment
      # Cryptography supports ANSI X9 TR-34 norm, RSA unwrap, and ECDH (Elliptic Curve Diffie-Hellman) key
      # exchange mechanisms. Asymmetric key exchange methods are typically used to establish bi-directional
      # trust between the two parties exhanging keys and are used for initial key exchange such as Key
      # Encryption Key (KEK) or Zone Master Key (ZMK). After which you can import working keys using
      # symmetric method to perform various cryptographic operations within Amazon Web Services Payment
      # Cryptography. PCI requires specific minimum key strength of wrapping keys used to protect the keys
      # being exchanged electronically. These requirements can change when PCI standards are revised. The
      # rules specify that wrapping keys used for transport must be at least as strong as the key being
      # protected. For more information on recommended key strength of wrapping keys and key exchange
      # mechanism, see Importing and exporting keys in the Amazon Web Services Payment Cryptography User
      # Guide . You can also import a root public key certificate , used to sign other public key
      # certificates, or a trusted public key certificate under an already established root public key
      # certificate. To import a public root key certificate Using this operation, you can import the public
      # component (in PEM cerificate format) of your private root key. You can use the imported public root
      # key certificate for digital signatures, for example signing wrapping key or signing key in TR-34,
      # within your Amazon Web Services Payment Cryptography account. Set the following parameters:
      # KeyMaterial : RootCertificatePublicKey KeyClass : PUBLIC_KEY KeyModesOfUse : Verify KeyUsage :
      # TR31_S0_ASYMMETRIC_KEY_FOR_DIGITAL_SIGNATURE PublicKeyCertificate : The public key certificate in
      # PEM format (base64 encoded) of the private root key under import. To import a trusted public key
      # certificate The root public key certificate must be in place and operational before you import a
      # trusted public key certificate. Set the following parameters: KeyMaterial :
      # TrustedCertificatePublicKey CertificateAuthorityPublicKeyIdentifier : KeyArn of the
      # RootCertificatePublicKey . KeyModesOfUse and KeyUsage : Corresponding to the cryptographic
      # operations such as wrap, sign, or encrypt that you will allow the trusted public key certificate to
      # perform. PublicKeyCertificate : The trusted public key certificate in PEM format (base64 encoded)
      # under import. To import initial keys (KEK or ZMK or similar) using TR-34 Using this operation, you
      # can import initial key using TR-34 asymmetric key exchange. In TR-34 terminology, the sending party
      # of the key is called Key Distribution Host (KDH) and the receiving party of the key is called Key
      # Receiving Device (KRD). During the key import process, KDH is the user who initiates the key import
      # and KRD is Amazon Web Services Payment Cryptography who receives the key. To initiate TR-34 key
      # import, the KDH must obtain an import token by calling GetParametersForImport . This operation
      # generates an encryption keypair for the purpose of key import, signs the key and returns back the
      # wrapping key certificate (also known as KRD wrapping certificate) and the root certificate chain.
      # The KDH must trust and install the KRD wrapping certificate on its HSM and use it to encrypt (wrap)
      # the KDH key during TR-34 WrappedKeyBlock generation. The import token and associated KRD wrapping
      # certificate expires after 30 days. Next the KDH generates a key pair for the purpose of signing the
      # encrypted KDH key and provides the public certificate of the signing key to Amazon Web Services
      # Payment Cryptography. The KDH will also need to import the root certificate chain of the KDH signing
      # certificate by calling ImportKey for RootCertificatePublicKey . For more information on TR-34 key
      # import, see section Importing symmetric keys in the Amazon Web Services Payment Cryptography User
      # Guide . Set the following parameters: KeyMaterial : Use Tr34KeyBlock parameters.
      # CertificateAuthorityPublicKeyIdentifier : The KeyARN of the certificate chain that signed the KDH
      # signing key certificate. ImportToken : Obtained from KRD by calling GetParametersForImport .
      # WrappedKeyBlock : The TR-34 wrapped key material from KDH. It contains the KDH key under import,
      # wrapped with KRD wrapping certificate and signed by KDH signing private key. This TR-34 key block is
      # typically generated by the KDH Hardware Security Module (HSM) outside of Amazon Web Services Payment
      # Cryptography. SigningKeyCertificate : The public key certificate in PEM format (base64 encoded) of
      # the KDH signing key generated under the root certificate (CertificateAuthorityPublicKeyIdentifier)
      # imported in Amazon Web Services Payment Cryptography. To import initial keys (KEK or ZMK or similar)
      # using RSA Wrap and Unwrap Using this operation, you can import initial key using asymmetric RSA wrap
      # and unwrap key exchange method. To initiate import, call GetParametersForImport with KeyMaterial set
      # to KEY_CRYPTOGRAM to generate an import token. This operation also generates an encryption keypair
      # for the purpose of key import, signs the key and returns back the wrapping key certificate in PEM
      # format (base64 encoded) and its root certificate chain. The import token and associated KRD wrapping
      # certificate expires after 30 days. You must trust and install the wrapping certificate and its
      # certificate chain on the sending HSM and use it to wrap the key under export for
      # WrappedKeyCryptogram generation. Next call ImportKey with KeyMaterial set to KEY_CRYPTOGRAM and
      # provide the ImportToken and KeyAttributes for the key under import. To import working keys using
      # TR-31 Amazon Web Services Payment Cryptography uses TR-31 symmetric key exchange norm to import
      # working keys. A KEK must be established within Amazon Web Services Payment Cryptography by using
      # TR-34 key import or by using CreateKey . To initiate a TR-31 key import, set the following
      # parameters: KeyMaterial : Use Tr31KeyBlock parameters. WrappedKeyBlock : The TR-31 wrapped key
      # material. It contains the key under import, encrypted using KEK. The TR-31 key block is typically
      # generated by a HSM outside of Amazon Web Services Payment Cryptography. WrappingKeyIdentifier : The
      # KeyArn of the KEK that Amazon Web Services Payment Cryptography uses to decrypt or unwrap the key
      # under import. To import working keys using ECDH You can also use ECDH key agreement to import
      # working keys as a TR-31 keyblock, where the wrapping key is an ECDH derived key. To initiate a TR-31
      # key import using ECDH, both sides must create an ECC key pair with key usage K3 and exchange public
      # key certificates. In Amazon Web Services Payment Cryptography, you can do this by calling CreateKey
      # and then GetPublicKeyCertificate to retrieve its public key certificate. Next, you can then generate
      # a TR-31 WrappedKeyBlock using your own ECC key pair, the public certificate of the service's ECC key
      # pair, and the key derivation parameters including key derivation function, hash algorithm,
      # derivation data, and key algorithm. If you have not already done so, you must import the CA chain
      # that issued the receiving public key certificate by calling ImportKey with input
      # RootCertificatePublicKey for root CA or TrustedPublicKey for intermediate CA. To complete the TR-31
      # key import, you can use the following parameters. It is important that the ECDH key derivation
      # parameters you use should match those used during import to derive the same shared wrapping key
      # within Amazon Web Services Payment Cryptography. KeyMaterial : Use DiffieHellmanTr31KeyBlock
      # parameters. PrivateKeyIdentifier : The KeyArn of the ECC key pair created within Amazon Web Services
      # Payment Cryptography to derive a shared KEK. PublicKeyCertificate : The public key certificate of
      # the receiving ECC key pair in PEM format (base64 encoded) to derive a shared KEK.
      # CertificateAuthorityPublicKeyIdentifier : The keyARN of the CA that signed the public key
      # certificate of the receiving ECC key pair. Cross-account use: This operation can't be used across
      # different Amazon Web Services accounts. Related operations: ExportKey GetParametersForImport
      def import_key(
        key_material : Types::ImportKeyMaterial,
        enabled : Bool? = nil,
        key_check_value_algorithm : String? = nil,
        replication_regions : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportKeyOutput
        input = Types::ImportKeyInput.new(key_material: key_material, enabled: enabled, key_check_value_algorithm: key_check_value_algorithm, replication_regions: replication_regions, tags: tags)
        import_key(input)
      end
      def import_key(input : Types::ImportKeyInput) : Types::ImportKeyOutput
        request = Protocol::JsonRpc.build_request(Model::IMPORT_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportKeyOutput, "ImportKey")
      end

      # Lists the aliases for all keys in the caller's Amazon Web Services account and Amazon Web Services
      # Region. You can filter the aliases by keyARN . For more information, see Using aliases in the Amazon
      # Web Services Payment Cryptography User Guide . This is a paginated operation, which means that each
      # response might contain only a subset of all the aliases. When the response contains only a subset of
      # aliases, it includes a NextToken value. Use this value in a subsequent ListAliases request to get
      # more aliases. When you receive a response with no NextToken (or an empty or null value), that means
      # there are no more aliases to get. Cross-account use: This operation can't be used across different
      # Amazon Web Services accounts. Related operations: CreateAlias DeleteAlias GetAlias UpdateAlias
      def list_aliases(
        key_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAliasesOutput
        input = Types::ListAliasesInput.new(key_arn: key_arn, max_results: max_results, next_token: next_token)
        list_aliases(input)
      end
      def list_aliases(input : Types::ListAliasesInput) : Types::ListAliasesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAliasesOutput, "ListAliases")
      end

      # Lists the keys in the caller's Amazon Web Services account and Amazon Web Services Region. You can
      # filter the list of keys. This is a paginated operation, which means that each response might contain
      # only a subset of all the keys. When the response contains only a subset of keys, it includes a
      # NextToken value. Use this value in a subsequent ListKeys request to get more keys. When you receive
      # a response with no NextToken (or an empty or null value), that means there are no more keys to get.
      # Cross-account use: This operation can't be used across different Amazon Web Services accounts.
      # Related operations: CreateKey DeleteKey GetKey
      def list_keys(
        key_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListKeysOutput
        input = Types::ListKeysInput.new(key_state: key_state, max_results: max_results, next_token: next_token)
        list_keys(input)
      end
      def list_keys(input : Types::ListKeysInput) : Types::ListKeysOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListKeysOutput, "ListKeys")
      end

      # Lists the tags for an Amazon Web Services resource. This is a paginated operation, which means that
      # each response might contain only a subset of all the tags. When the response contains only a subset
      # of tags, it includes a NextToken value. Use this value in a subsequent ListTagsForResource request
      # to get more tags. When you receive a response with no NextToken (or an empty or null value), that
      # means there are no more tags to get. Cross-account use: This operation can't be used across
      # different Amazon Web Services accounts. Related operations: TagResource UntagResource
      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Removes Replication Regions from an existing Amazon Web Services Payment Cryptography key, disabling
      # the key's availability for cryptographic operations in the specified Amazon Web Services Regions.
      # When you remove Replication Regions, the key material is securely deleted from those regions and can
      # no longer be used for cryptographic operations there. This operation is irreversible for the
      # specified Amazon Web Services Regions. For more information, see Multi-Region key replication .
      # Ensure that no active cryptographic operations or applications depend on the key in the regions
      # you're removing before performing this operation. Cross-account use: This operation can't be used
      # across different Amazon Web Services accounts. Related operations: AddKeyReplicationRegions
      # DisableDefaultKeyReplicationRegions
      def remove_key_replication_regions(
        key_identifier : String,
        replication_regions : Array(String)
      ) : Types::RemoveKeyReplicationRegionsOutput
        input = Types::RemoveKeyReplicationRegionsInput.new(key_identifier: key_identifier, replication_regions: replication_regions)
        remove_key_replication_regions(input)
      end
      def remove_key_replication_regions(input : Types::RemoveKeyReplicationRegionsInput) : Types::RemoveKeyReplicationRegionsOutput
        request = Protocol::JsonRpc.build_request(Model::REMOVE_KEY_REPLICATION_REGIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveKeyReplicationRegionsOutput, "RemoveKeyReplicationRegions")
      end

      # Cancels a scheduled key deletion during the waiting period. Use this operation to restore a Key that
      # is scheduled for deletion. During the waiting period, the KeyState is DELETE_PENDING and
      # deletePendingTimestamp contains the date and time after which the Key will be deleted. After Key is
      # restored, the KeyState is CREATE_COMPLETE , and the value for deletePendingTimestamp is removed.
      # Cross-account use: This operation can't be used across different Amazon Web Services accounts.
      # Related operations: DeleteKey StartKeyUsage StopKeyUsage
      def restore_key(
        key_identifier : String
      ) : Types::RestoreKeyOutput
        input = Types::RestoreKeyInput.new(key_identifier: key_identifier)
        restore_key(input)
      end
      def restore_key(input : Types::RestoreKeyInput) : Types::RestoreKeyOutput
        request = Protocol::JsonRpc.build_request(Model::RESTORE_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreKeyOutput, "RestoreKey")
      end

      # Enables an Amazon Web Services Payment Cryptography key, which makes it active for cryptographic
      # operations within Amazon Web Services Payment Cryptography Cross-account use: This operation can't
      # be used across different Amazon Web Services accounts. Related operations: StopKeyUsage
      def start_key_usage(
        key_identifier : String
      ) : Types::StartKeyUsageOutput
        input = Types::StartKeyUsageInput.new(key_identifier: key_identifier)
        start_key_usage(input)
      end
      def start_key_usage(input : Types::StartKeyUsageInput) : Types::StartKeyUsageOutput
        request = Protocol::JsonRpc.build_request(Model::START_KEY_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartKeyUsageOutput, "StartKeyUsage")
      end

      # Disables an Amazon Web Services Payment Cryptography key, which makes it inactive within Amazon Web
      # Services Payment Cryptography. You can use this operation instead of DeleteKey to deactivate a key.
      # You can enable the key in the future by calling StartKeyUsage . Cross-account use: This operation
      # can't be used across different Amazon Web Services accounts. Related operations: DeleteKey
      # StartKeyUsage
      def stop_key_usage(
        key_identifier : String
      ) : Types::StopKeyUsageOutput
        input = Types::StopKeyUsageInput.new(key_identifier: key_identifier)
        stop_key_usage(input)
      end
      def stop_key_usage(input : Types::StopKeyUsageInput) : Types::StopKeyUsageOutput
        request = Protocol::JsonRpc.build_request(Model::STOP_KEY_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopKeyUsageOutput, "StopKeyUsage")
      end

      # Adds or edits tags on an Amazon Web Services Payment Cryptography key. Tagging or untagging an
      # Amazon Web Services Payment Cryptography key can allow or deny permission to the key. Each tag
      # consists of a tag key and a tag value, both of which are case-sensitive strings. The tag value can
      # be an empty (null) string. To add a tag, specify a new tag key and a tag value. To edit a tag,
      # specify an existing tag key and a new tag value. You can also add tags to an Amazon Web Services
      # Payment Cryptography key when you create it with CreateKey . Cross-account use: This operation can't
      # be used across different Amazon Web Services accounts. Related operations: ListTagsForResource
      # UntagResource
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceOutput
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Deletes a tag from an Amazon Web Services Payment Cryptography key. Tagging or untagging an Amazon
      # Web Services Payment Cryptography key can allow or deny permission to the key. Cross-account use:
      # This operation can't be used across different Amazon Web Services accounts. Related operations:
      # ListTagsForResource TagResource
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Associates an existing Amazon Web Services Payment Cryptography alias with a different key. Each
      # alias is associated with only one Amazon Web Services Payment Cryptography key at a time, although a
      # key can have multiple aliases. The alias and the Amazon Web Services Payment Cryptography key must
      # be in the same Amazon Web Services account and Amazon Web Services Region Cross-account use: This
      # operation can't be used across different Amazon Web Services accounts. Related operations:
      # CreateAlias DeleteAlias GetAlias ListAliases
      def update_alias(
        alias_name : String,
        key_arn : String? = nil
      ) : Types::UpdateAliasOutput
        input = Types::UpdateAliasInput.new(alias_name: alias_name, key_arn: key_arn)
        update_alias(input)
      end
      def update_alias(input : Types::UpdateAliasInput) : Types::UpdateAliasOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ALIAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAliasOutput, "UpdateAlias")
      end
    end
  end
end
