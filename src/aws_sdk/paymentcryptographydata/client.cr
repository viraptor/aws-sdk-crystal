module AwsSdk
  module PaymentCryptographyData
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

      # Decrypts ciphertext data to plaintext using a symmetric (TDES, AES), asymmetric (RSA), or derived
      # (DUKPT or EMV) encryption key scheme. For more information, see Decrypt data in the Amazon Web
      # Services Payment Cryptography User Guide . You can use an decryption key generated within Amazon Web
      # Services Payment Cryptography, or you can import your own decryption key by calling ImportKey . For
      # this operation, the key must have KeyModesOfUse set to Decrypt . In asymmetric decryption, Amazon
      # Web Services Payment Cryptography decrypts the ciphertext using the private component of the
      # asymmetric encryption key pair. For data encryption outside of Amazon Web Services Payment
      # Cryptography, you can export the public component of the asymmetric key pair by calling
      # GetPublicCertificate . This operation also supports dynamic keys, allowing you to pass a dynamic
      # decryption key as a TR-31 WrappedKeyBlock. This can be used when key material is frequently rotated,
      # such as during every card transaction, and there is need to avoid importing short-lived keys into
      # Amazon Web Services Payment Cryptography. To decrypt using dynamic keys, the keyARN is the Key
      # Encryption Key (KEK) of the TR-31 wrapped decryption key material. The incoming wrapped key shall
      # have a key purpose of D0 with a mode of use of B or D. For more information, see Using Dynamic Keys
      # in the Amazon Web Services Payment Cryptography User Guide . For symmetric and DUKPT decryption,
      # Amazon Web Services Payment Cryptography supports TDES and AES algorithms. For EMV decryption,
      # Amazon Web Services Payment Cryptography supports TDES algorithms. For asymmetric decryption, Amazon
      # Web Services Payment Cryptography supports RSA . When you use TDES or TDES DUKPT, the ciphertext
      # data length must be a multiple of 8 bytes. For AES or AES DUKPT, the ciphertext data length must be
      # a multiple of 16 bytes. For RSA, it sould be equal to the key size unless padding is enabled. For
      # information about valid keys for this operation, see Understanding key attributes and Key types for
      # specific data operations in the Amazon Web Services Payment Cryptography User Guide . Cross-account
      # use : This operation can't be used across different Amazon Web Services accounts. Related
      # operations: EncryptData GetPublicCertificate ImportKey

      def decrypt_data(
        cipher_text : String,
        decryption_attributes : Types::EncryptionDecryptionAttributes,
        key_identifier : String,
        wrapped_key : Types::WrappedKey? = nil
      ) : Protocol::Request
        input = Types::DecryptDataInput.new(cipher_text: cipher_text, decryption_attributes: decryption_attributes, key_identifier: key_identifier, wrapped_key: wrapped_key)
        decrypt_data(input)
      end

      def decrypt_data(input : Types::DecryptDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DECRYPT_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Encrypts plaintext data to ciphertext using a symmetric (TDES, AES), asymmetric (RSA), or derived
      # (DUKPT or EMV) encryption key scheme. For more information, see Encrypt data in the Amazon Web
      # Services Payment Cryptography User Guide . You can generate an encryption key within Amazon Web
      # Services Payment Cryptography by calling CreateKey . You can import your own encryption key by
      # calling ImportKey . For this operation, the key must have KeyModesOfUse set to Encrypt . In
      # asymmetric encryption, plaintext is encrypted using public component. You can import the public
      # component of an asymmetric key pair created outside Amazon Web Services Payment Cryptography by
      # calling ImportKey . This operation also supports dynamic keys, allowing you to pass a dynamic
      # encryption key as a TR-31 WrappedKeyBlock. This can be used when key material is frequently rotated,
      # such as during every card transaction, and there is need to avoid importing short-lived keys into
      # Amazon Web Services Payment Cryptography. To encrypt using dynamic keys, the keyARN is the Key
      # Encryption Key (KEK) of the TR-31 wrapped encryption key material. The incoming wrapped key shall
      # have a key purpose of D0 with a mode of use of B or D. For more information, see Using Dynamic Keys
      # in the Amazon Web Services Payment Cryptography User Guide . For symmetric and DUKPT encryption,
      # Amazon Web Services Payment Cryptography supports TDES and AES algorithms. For EMV encryption,
      # Amazon Web Services Payment Cryptography supports TDES algorithms.For asymmetric encryption, Amazon
      # Web Services Payment Cryptography supports RSA . When you use TDES or TDES DUKPT, the plaintext data
      # length must be a multiple of 8 bytes. For AES or AES DUKPT, the plaintext data length must be a
      # multiple of 16 bytes. For RSA, it sould be equal to the key size unless padding is enabled. To
      # encrypt using DUKPT, you must already have a BDK (Base Derivation Key) key in your account with
      # KeyModesOfUse set to DeriveKey , or you can generate a new DUKPT key by calling CreateKey . To
      # encrypt using EMV, you must already have an IMK (Issuer Master Key) key in your account with
      # KeyModesOfUse set to DeriveKey . For information about valid keys for this operation, see
      # Understanding key attributes and Key types for specific data operations in the Amazon Web Services
      # Payment Cryptography User Guide . Cross-account use : This operation can't be used across different
      # Amazon Web Services accounts. Related operations: DecryptData GetPublicCertificate ImportKey
      # ReEncryptData

      def encrypt_data(
        encryption_attributes : Types::EncryptionDecryptionAttributes,
        key_identifier : String,
        plain_text : String,
        wrapped_key : Types::WrappedKey? = nil
      ) : Protocol::Request
        input = Types::EncryptDataInput.new(encryption_attributes: encryption_attributes, key_identifier: key_identifier, plain_text: plain_text, wrapped_key: wrapped_key)
        encrypt_data(input)
      end

      def encrypt_data(input : Types::EncryptDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENCRYPT_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Establishes node-to-node initialization between payment processing nodes such as an acquirer, issuer
      # or payment network using Australian Standard 2805 (AS2805). During node-to-node initialization, both
      # communicating nodes must validate that they possess the correct Key Encrypting Keys (KEKs) before
      # proceeding with session key exchange. In AS2805, the sending KEK (KEKs) of one node corresponds to
      # the receiving KEK (KEKr) of its partner node. Each node uses its KEK to encrypt and decrypt session
      # keys exchanged between the nodes. A KEK can be created or imported into Amazon Web Services Payment
      # Cryptography using either the CreateKey or ImportKey operations. The node initiating communication
      # can use GenerateAS2805KekValidation to generate a combined KEK validation request and KEK validation
      # response to send to the partnering node for validation. When invoked, the API internally generates a
      # random sending key encrypted under KEKs and provides a receiving key encrypted under KEKr as
      # response. The initiating node sends the response returned by this API to its partner for validation.
      # For information about valid keys for this operation, see Understanding key attributes and Key types
      # for specific data operations in the Amazon Web Services Payment Cryptography User Guide .
      # Cross-account use : This operation can't be used across different Amazon Web Services accounts.

      def generate_as2805_kek_validation(
        kek_validation_type : Types::As2805KekValidationType,
        key_identifier : String,
        random_key_send_variant_mask : String
      ) : Protocol::Request
        input = Types::GenerateAs2805KekValidationInput.new(kek_validation_type: kek_validation_type, key_identifier: key_identifier, random_key_send_variant_mask: random_key_send_variant_mask)
        generate_as2805_kek_validation(input)
      end

      def generate_as2805_kek_validation(input : Types::GenerateAs2805KekValidationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_AS2805_KEK_VALIDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates card-related validation data using algorithms such as Card Verification Values (CVV/CVV2),
      # Dynamic Card Verification Values (dCVV/dCVV2), or Card Security Codes (CSC). For more information,
      # see Generate card data in the Amazon Web Services Payment Cryptography User Guide . This operation
      # generates a CVV or CSC value that is printed on a payment credit or debit card during card
      # production. The CVV or CSC, PAN (Primary Account Number) and expiration date of the card are
      # required to check its validity during transaction processing. To begin this operation, a CVK (Card
      # Verification Key) encryption key is required. You can use CreateKey or ImportKey to establish a CVK
      # within Amazon Web Services Payment Cryptography. The KeyModesOfUse should be set to Generate and
      # Verify for a CVK encryption key. For information about valid keys for this operation, see
      # Understanding key attributes and Key types for specific data operations in the Amazon Web Services
      # Payment Cryptography User Guide . Cross-account use : This operation can't be used across different
      # Amazon Web Services accounts. Related operations: ImportKey VerifyCardValidationData

      def generate_card_validation_data(
        generation_attributes : Types::CardGenerationAttributes,
        key_identifier : String,
        primary_account_number : String,
        validation_data_length : Int32? = nil
      ) : Protocol::Request
        input = Types::GenerateCardValidationDataInput.new(generation_attributes: generation_attributes, key_identifier: key_identifier, primary_account_number: primary_account_number, validation_data_length: validation_data_length)
        generate_card_validation_data(input)
      end

      def generate_card_validation_data(input : Types::GenerateCardValidationDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_CARD_VALIDATION_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a Message Authentication Code (MAC) cryptogram within Amazon Web Services Payment
      # Cryptography. You can use this operation to authenticate card-related data by using known data
      # values to generate MAC for data validation between the sending and receiving parties. This operation
      # uses message data, a secret encryption key and MAC algorithm to generate a unique MAC value for
      # transmission. The receiving party of the MAC must use the same message data, secret encryption key
      # and MAC algorithm to reproduce another MAC value for comparision. You can use this operation to
      # generate a DUPKT, CMAC, HMAC or EMV MAC by setting generation attributes and algorithm to the
      # associated values. The MAC generation encryption key must have valid values for KeyUsage such as
      # TR31_M7_HMAC_KEY for HMAC generation, and the key must have KeyModesOfUse set to Generate . For
      # information about valid keys for this operation, see Understanding key attributes and Key types for
      # specific data operations in the Amazon Web Services Payment Cryptography User Guide . Cross-account
      # use : This operation can't be used across different Amazon Web Services accounts. Related
      # operations: VerifyMac

      def generate_mac(
        generation_attributes : Types::MacAttributes,
        key_identifier : String,
        message_data : String,
        mac_length : Int32? = nil
      ) : Protocol::Request
        input = Types::GenerateMacInput.new(generation_attributes: generation_attributes, key_identifier: key_identifier, message_data: message_data, mac_length: mac_length)
        generate_mac(input)
      end

      def generate_mac(input : Types::GenerateMacInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_MAC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates an issuer script mac for EMV payment cards that use offline PINs as the cardholder
      # verification method (CVM). This operation generates an authenticated issuer script response by
      # appending the incoming message data (APDU command) with the target encrypted PIN block in ISO2
      # format. The command structure and method to send the issuer script update to the card is not defined
      # by this operation and is typically determined by the applicable payment card scheme. The primary
      # inputs to this operation include the incoming new encrypted pinblock, PIN encryption key (PEK),
      # issuer master key (IMK), primary account number (PAN), and the payment card derivation method. The
      # operation uses two issuer master keys - secure messaging for confidentiality (IMK-SMC) and secure
      # messaging for integrity (IMK-SMI). The SMC key is used to internally derive a key to secure the pin,
      # while SMI key is used to internally derive a key to authenticate the script reponse as per the EMV
      # 4.4 - Book 2 - Security and Key Management specification. This operation supports Amex, EMV2000,
      # EMVCommon, Mastercard and Visa derivation methods, each requiring specific input parameters. Users
      # must follow the specific derivation method and input parameters defined by the respective payment
      # card scheme. Use GenerateMac operation when sending a script update to an EMV card that does not
      # involve PIN change. When assigning IAM permissions, it is important to understand that EncryptData
      # using EMV keys and GenerateMac perform similar functions to this command. Cross-account use : This
      # operation can't be used across different Amazon Web Services accounts. Related operations:
      # EncryptData GenerateMac

      def generate_mac_emv_pin_change(
        derivation_method_attributes : Types::DerivationMethodAttributes,
        message_data : String,
        new_encrypted_pin_block : String,
        new_pin_pek_identifier : String,
        pin_block_format : String,
        secure_messaging_confidentiality_key_identifier : String,
        secure_messaging_integrity_key_identifier : String
      ) : Protocol::Request
        input = Types::GenerateMacEmvPinChangeInput.new(derivation_method_attributes: derivation_method_attributes, message_data: message_data, new_encrypted_pin_block: new_encrypted_pin_block, new_pin_pek_identifier: new_pin_pek_identifier, pin_block_format: pin_block_format, secure_messaging_confidentiality_key_identifier: secure_messaging_confidentiality_key_identifier, secure_messaging_integrity_key_identifier: secure_messaging_integrity_key_identifier)
        generate_mac_emv_pin_change(input)
      end

      def generate_mac_emv_pin_change(input : Types::GenerateMacEmvPinChangeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_MAC_EMV_PIN_CHANGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates pin-related data such as PIN, PIN Verification Value (PVV), PIN Block, and PIN Offset
      # during new card issuance or reissuance. For more information, see Generate PIN data in the Amazon
      # Web Services Payment Cryptography User Guide . PIN data is never transmitted in clear to or from
      # Amazon Web Services Payment Cryptography. This operation generates PIN, PVV, or PIN Offset and then
      # encrypts it using Pin Encryption Key (PEK) to create an EncryptedPinBlock for transmission from
      # Amazon Web Services Payment Cryptography. This operation uses a separate Pin Verification Key (PVK)
      # for VISA PVV generation. Using ECDH key exchange, you can receive cardholder selectable PINs into
      # Amazon Web Services Payment Cryptography. The ECDH derived key protects the incoming PIN block. You
      # can also use it for reveal PIN, wherein the generated PIN block is protected by the ECDH derived key
      # before transmission from Amazon Web Services Payment Cryptography. For more information on
      # establishing ECDH derived keys, see the Generating keys in the Amazon Web Services Payment
      # Cryptography User Guide . For information about valid keys for this operation, see Understanding key
      # attributes and Key types for specific data operations in the Amazon Web Services Payment
      # Cryptography User Guide . Cross-account use : This operation can't be used across different Amazon
      # Web Services accounts. Related operations: GenerateCardValidationData TranslatePinData VerifyPinData

      def generate_pin_data(
        encryption_key_identifier : String,
        generation_attributes : Types::PinGenerationAttributes,
        generation_key_identifier : String,
        pin_block_format : String,
        encryption_wrapped_key : Types::WrappedKey? = nil,
        pin_data_length : Int32? = nil,
        primary_account_number : String? = nil
      ) : Protocol::Request
        input = Types::GeneratePinDataInput.new(encryption_key_identifier: encryption_key_identifier, generation_attributes: generation_attributes, generation_key_identifier: generation_key_identifier, pin_block_format: pin_block_format, encryption_wrapped_key: encryption_wrapped_key, pin_data_length: pin_data_length, primary_account_number: primary_account_number)
        generate_pin_data(input)
      end

      def generate_pin_data(input : Types::GeneratePinDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_PIN_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Re-encrypt ciphertext using DUKPT or Symmetric data encryption keys. You can either generate an
      # encryption key within Amazon Web Services Payment Cryptography by calling CreateKey or import your
      # own encryption key by calling ImportKey . The KeyArn for use with this operation must be in a
      # compatible key state with KeyModesOfUse set to Encrypt . This operation also supports dynamic keys,
      # allowing you to pass a dynamic encryption key as a TR-31 WrappedKeyBlock. This can be used when key
      # material is frequently rotated, such as during every card transaction, and there is need to avoid
      # importing short-lived keys into Amazon Web Services Payment Cryptography. To re-encrypt using
      # dynamic keys, the keyARN is the Key Encryption Key (KEK) of the TR-31 wrapped encryption key
      # material. The incoming wrapped key shall have a key purpose of D0 with a mode of use of B or D. For
      # more information, see Using Dynamic Keys in the Amazon Web Services Payment Cryptography User Guide
      # . For symmetric and DUKPT encryption, Amazon Web Services Payment Cryptography supports TDES and AES
      # algorithms. To encrypt using DUKPT, a DUKPT key must already exist within your account with
      # KeyModesOfUse set to DeriveKey or a new DUKPT can be generated by calling CreateKey . For
      # information about valid keys for this operation, see Understanding key attributes and Key types for
      # specific data operations in the Amazon Web Services Payment Cryptography User Guide . Cross-account
      # use : This operation can't be used across different Amazon Web Services accounts. Related
      # operations: DecryptData EncryptData GetPublicCertificate ImportKey

      def re_encrypt_data(
        cipher_text : String,
        incoming_encryption_attributes : Types::ReEncryptionAttributes,
        incoming_key_identifier : String,
        outgoing_encryption_attributes : Types::ReEncryptionAttributes,
        outgoing_key_identifier : String,
        incoming_wrapped_key : Types::WrappedKey? = nil,
        outgoing_wrapped_key : Types::WrappedKey? = nil
      ) : Protocol::Request
        input = Types::ReEncryptDataInput.new(cipher_text: cipher_text, incoming_encryption_attributes: incoming_encryption_attributes, incoming_key_identifier: incoming_key_identifier, outgoing_encryption_attributes: outgoing_encryption_attributes, outgoing_key_identifier: outgoing_key_identifier, incoming_wrapped_key: incoming_wrapped_key, outgoing_wrapped_key: outgoing_wrapped_key)
        re_encrypt_data(input)
      end

      def re_encrypt_data(input : Types::ReEncryptDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RE_ENCRYPT_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Translates an cryptographic key between different wrapping keys without importing the key into
      # Amazon Web Services Payment Cryptography. This operation can be used when key material is frequently
      # rotated, such as during every card transaction, and there is a need to avoid importing short-lived
      # keys into Amazon Web Services Payment Cryptography. It translates short-lived transaction keys such
      # as PEK generated for each transaction and wrapped with an ECDH derived wrapping key to another KEK
      # wrapping key. Before using this operation, you must first request the public key certificate of the
      # ECC key pair generated within Amazon Web Services Payment Cryptography to establish an ECDH key
      # agreement. In TranslateKeyData , the service uses its own ECC key pair, public certificate of
      # receiving ECC key pair, and the key derivation parameters to generate a derived key. The service
      # uses this derived key to unwrap the incoming transaction key received as a TR31WrappedKeyBlock and
      # re-wrap using a user provided KEK to generate an outgoing Tr31WrappedKeyBlock. For information about
      # valid keys for this operation, see Understanding key attributes and Key types for specific data
      # operations in the Amazon Web Services Payment Cryptography User Guide . Cross-account use : This
      # operation can't be used across different Amazon Web Services accounts. Related operations: CreateKey
      # GetPublicCertificate ImportKey

      def translate_key_material(
        incoming_key_material : Types::IncomingKeyMaterial,
        outgoing_key_material : Types::OutgoingKeyMaterial,
        key_check_value_algorithm : String? = nil
      ) : Protocol::Request
        input = Types::TranslateKeyMaterialInput.new(incoming_key_material: incoming_key_material, outgoing_key_material: outgoing_key_material, key_check_value_algorithm: key_check_value_algorithm)
        translate_key_material(input)
      end

      def translate_key_material(input : Types::TranslateKeyMaterialInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TRANSLATE_KEY_MATERIAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Translates encrypted PIN block from and to ISO 9564 formats 0,1,3,4. For more information, see
      # Translate PIN data in the Amazon Web Services Payment Cryptography User Guide . PIN block
      # translation involves changing a PIN block from one encryption key to another and optionally change
      # its format. PIN block translation occurs entirely within the HSM boundary and PIN data never enters
      # or leaves Amazon Web Services Payment Cryptography in clear text. The encryption key transformation
      # can be from PEK (Pin Encryption Key) to BDK (Base Derivation Key) for DUKPT or from BDK for DUKPT to
      # PEK. Amazon Web Services Payment Cryptography also supports use of dynamic keys and ECDH (Elliptic
      # Curve Diffie-Hellman) based key exchange for this operation. Dynamic keys allow you to pass a PEK as
      # a TR-31 WrappedKeyBlock. They can be used when key material is frequently rotated, such as during
      # every card transaction, and there is need to avoid importing short-lived keys into Amazon Web
      # Services Payment Cryptography. To translate PIN block using dynamic keys, the keyARN is the Key
      # Encryption Key (KEK) of the TR-31 wrapped PEK. The incoming wrapped key shall have a key purpose of
      # P0 with a mode of use of B or D. For more information, see Using Dynamic Keys in the Amazon Web
      # Services Payment Cryptography User Guide . Using ECDH key exchange, you can receive cardholder
      # selectable PINs into Amazon Web Services Payment Cryptography. The ECDH derived key protects the
      # incoming PIN block, which is translated to a PEK encrypted PIN block for use within the service. You
      # can also use ECDH for reveal PIN, wherein the service translates the PIN block from PEK to a ECDH
      # derived encryption key. For more information on establishing ECDH derived keys, see the Creating
      # keys in the Amazon Web Services Payment Cryptography User Guide . The allowed combinations of PIN
      # block format translations are guided by PCI. It is important to note that not all encrypted PIN
      # block formats (example, format 1) require PAN (Primary Account Number) as input. And as such, PIN
      # block format that requires PAN (example, formats 0,3,4) cannot be translated to a format (format 1)
      # that does not require a PAN for generation. For information about valid keys for this operation, see
      # Understanding key attributes and Key types for specific data operations in the Amazon Web Services
      # Payment Cryptography User Guide . Amazon Web Services Payment Cryptography currently supports ISO
      # PIN block 4 translation for PIN block built using legacy PAN length. That is, PAN is the right most
      # 12 digits excluding the check digits. Cross-account use : This operation can't be used across
      # different Amazon Web Services accounts. Related operations: GeneratePinData VerifyPinData

      def translate_pin_data(
        encrypted_pin_block : String,
        incoming_key_identifier : String,
        incoming_translation_attributes : Types::TranslationIsoFormats,
        outgoing_key_identifier : String,
        outgoing_translation_attributes : Types::TranslationIsoFormats,
        incoming_as2805_attributes : Types::As2805PekDerivationAttributes? = nil,
        incoming_dukpt_attributes : Types::DukptDerivationAttributes? = nil,
        incoming_wrapped_key : Types::WrappedKey? = nil,
        outgoing_dukpt_attributes : Types::DukptDerivationAttributes? = nil,
        outgoing_wrapped_key : Types::WrappedKey? = nil
      ) : Protocol::Request
        input = Types::TranslatePinDataInput.new(encrypted_pin_block: encrypted_pin_block, incoming_key_identifier: incoming_key_identifier, incoming_translation_attributes: incoming_translation_attributes, outgoing_key_identifier: outgoing_key_identifier, outgoing_translation_attributes: outgoing_translation_attributes, incoming_as2805_attributes: incoming_as2805_attributes, incoming_dukpt_attributes: incoming_dukpt_attributes, incoming_wrapped_key: incoming_wrapped_key, outgoing_dukpt_attributes: outgoing_dukpt_attributes, outgoing_wrapped_key: outgoing_wrapped_key)
        translate_pin_data(input)
      end

      def translate_pin_data(input : Types::TranslatePinDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TRANSLATE_PIN_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies Authorization Request Cryptogram (ARQC) for a EMV chip payment card authorization. For more
      # information, see Verify auth request cryptogram in the Amazon Web Services Payment Cryptography User
      # Guide . ARQC generation is done outside of Amazon Web Services Payment Cryptography and is typically
      # generated on a point of sale terminal for an EMV chip card to obtain payment authorization during
      # transaction time. For ARQC verification, you must first import the ARQC generated outside of Amazon
      # Web Services Payment Cryptography by calling ImportKey . This operation uses the imported ARQC and
      # an major encryption key (DUKPT) created by calling CreateKey to either provide a boolean ARQC
      # verification result or provide an APRC (Authorization Response Cryptogram) response using Method 1
      # or Method 2. The ARPC_METHOD_1 uses AuthResponseCode to generate ARPC and ARPC_METHOD_2 uses
      # CardStatusUpdate to generate ARPC. For information about valid keys for this operation, see
      # Understanding key attributes and Key types for specific data operations in the Amazon Web Services
      # Payment Cryptography User Guide . Cross-account use : This operation can't be used across different
      # Amazon Web Services accounts. Related operations: VerifyCardValidationData VerifyPinData

      def verify_auth_request_cryptogram(
        auth_request_cryptogram : String,
        key_identifier : String,
        major_key_derivation_mode : String,
        session_key_derivation_attributes : Types::SessionKeyDerivation,
        transaction_data : String,
        auth_response_attributes : Types::CryptogramAuthResponse? = nil
      ) : Protocol::Request
        input = Types::VerifyAuthRequestCryptogramInput.new(auth_request_cryptogram: auth_request_cryptogram, key_identifier: key_identifier, major_key_derivation_mode: major_key_derivation_mode, session_key_derivation_attributes: session_key_derivation_attributes, transaction_data: transaction_data, auth_response_attributes: auth_response_attributes)
        verify_auth_request_cryptogram(input)
      end

      def verify_auth_request_cryptogram(input : Types::VerifyAuthRequestCryptogramInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_AUTH_REQUEST_CRYPTOGRAM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies card-related validation data using algorithms such as Card Verification Values (CVV/CVV2),
      # Dynamic Card Verification Values (dCVV/dCVV2) and Card Security Codes (CSC). For more information,
      # see Verify card data in the Amazon Web Services Payment Cryptography User Guide . This operation
      # validates the CVV or CSC codes that is printed on a payment credit or debit card during card payment
      # transaction. The input values are typically provided as part of an inbound transaction to an issuer
      # or supporting platform partner. Amazon Web Services Payment Cryptography uses CVV or CSC, PAN
      # (Primary Account Number) and expiration date of the card to check its validity during transaction
      # processing. In this operation, the CVK (Card Verification Key) encryption key for use with card data
      # verification is same as the one in used for GenerateCardValidationData . For information about valid
      # keys for this operation, see Understanding key attributes and Key types for specific data operations
      # in the Amazon Web Services Payment Cryptography User Guide . Cross-account use : This operation
      # can't be used across different Amazon Web Services accounts. Related operations:
      # GenerateCardValidationData VerifyAuthRequestCryptogram VerifyPinData

      def verify_card_validation_data(
        key_identifier : String,
        primary_account_number : String,
        validation_data : String,
        verification_attributes : Types::CardVerificationAttributes
      ) : Protocol::Request
        input = Types::VerifyCardValidationDataInput.new(key_identifier: key_identifier, primary_account_number: primary_account_number, validation_data: validation_data, verification_attributes: verification_attributes)
        verify_card_validation_data(input)
      end

      def verify_card_validation_data(input : Types::VerifyCardValidationDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_CARD_VALIDATION_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies a Message Authentication Code (MAC). You can use this operation to verify MAC for message
      # data authentication such as . In this operation, you must use the same message data, secret
      # encryption key and MAC algorithm that was used to generate MAC. You can use this operation to verify
      # a DUPKT, CMAC, HMAC or EMV MAC by setting generation attributes and algorithm to the associated
      # values. For information about valid keys for this operation, see Understanding key attributes and
      # Key types for specific data operations in the Amazon Web Services Payment Cryptography User Guide .
      # Cross-account use : This operation can't be used across different Amazon Web Services accounts.
      # Related operations: GenerateMac

      def verify_mac(
        key_identifier : String,
        mac : String,
        message_data : String,
        verification_attributes : Types::MacAttributes,
        mac_length : Int32? = nil
      ) : Protocol::Request
        input = Types::VerifyMacInput.new(key_identifier: key_identifier, mac: mac, message_data: message_data, verification_attributes: verification_attributes, mac_length: mac_length)
        verify_mac(input)
      end

      def verify_mac(input : Types::VerifyMacInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_MAC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies pin-related data such as PIN and PIN Offset using algorithms including VISA PVV and
      # IBM3624. For more information, see Verify PIN data in the Amazon Web Services Payment Cryptography
      # User Guide . This operation verifies PIN data for user payment card. A card holder PIN data is never
      # transmitted in clear to or from Amazon Web Services Payment Cryptography. This operation uses PIN
      # Verification Key (PVK) for PIN or PIN Offset generation and then encrypts it using PIN Encryption
      # Key (PEK) to create an EncryptedPinBlock for transmission from Amazon Web Services Payment
      # Cryptography. For information about valid keys for this operation, see Understanding key attributes
      # and Key types for specific data operations in the Amazon Web Services Payment Cryptography User
      # Guide . Cross-account use : This operation can't be used across different Amazon Web Services
      # accounts. Related operations: GeneratePinData TranslatePinData

      def verify_pin_data(
        encrypted_pin_block : String,
        encryption_key_identifier : String,
        pin_block_format : String,
        verification_attributes : Types::PinVerificationAttributes,
        verification_key_identifier : String,
        dukpt_attributes : Types::DukptAttributes? = nil,
        encryption_wrapped_key : Types::WrappedKey? = nil,
        pin_data_length : Int32? = nil,
        primary_account_number : String? = nil
      ) : Protocol::Request
        input = Types::VerifyPinDataInput.new(encrypted_pin_block: encrypted_pin_block, encryption_key_identifier: encryption_key_identifier, pin_block_format: pin_block_format, verification_attributes: verification_attributes, verification_key_identifier: verification_key_identifier, dukpt_attributes: dukpt_attributes, encryption_wrapped_key: encryption_wrapped_key, pin_data_length: pin_data_length, primary_account_number: primary_account_number)
        verify_pin_data(input)
      end

      def verify_pin_data(input : Types::VerifyPinDataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VERIFY_PIN_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
