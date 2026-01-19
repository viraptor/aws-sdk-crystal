require "json"

module AwsSdk
  module PaymentCryptographyData
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameters to derive the confidentiality and integrity keys for a payment card using Amex derivation
      # method.
      struct AmexAttributes
        include JSON::Serializable

        # The transaction counter of the current transaction that is provided by the terminal during
        # transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # The keyArn of the issuer master key for cryptogram (IMK-AC) for the payment card.
        @[JSON::Field(key: "AuthorizationRequestKeyIdentifier")]
        getter authorization_request_key_identifier : String

        # The method to use when deriving the master key for a payment card using Amex derivation.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The encrypted pinblock of the old pin stored on the chip card.
        @[JSON::Field(key: "CurrentPinAttributes")]
        getter current_pin_attributes : Types::CurrentPinAttributes?

        def initialize(
          @application_transaction_counter : String,
          @authorization_request_key_identifier : String,
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String,
          @current_pin_attributes : Types::CurrentPinAttributes? = nil
        )
        end
      end

      # Card data parameters that are required to generate a Card Security Code (CSC2) for an AMEX payment
      # card.
      struct AmexCardSecurityCodeVersion1
        include JSON::Serializable

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        def initialize(
          @card_expiry_date : String
        )
        end
      end

      # Card data parameters that are required to generate a Card Security Code (CSC2) for an AMEX payment
      # card.
      struct AmexCardSecurityCodeVersion2
        include JSON::Serializable

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        # The service code of the AMEX payment card. This is different from the Card Security Code (CSC).
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @card_expiry_date : String,
          @service_code : String
        )
        end
      end

      # Parameter information for generating a random key for KEK validation to perform node-to-node
      # initialization.
      struct As2805KekValidationType
        include JSON::Serializable

        # Parameter information for generating a KEK validation request during node-to-node initialization.
        @[JSON::Field(key: "KekValidationRequest")]
        getter kek_validation_request : Types::KekValidationRequest?

        # Parameter information for generating a KEK validation response during node-to-node initialization.
        @[JSON::Field(key: "KekValidationResponse")]
        getter kek_validation_response : Types::KekValidationResponse?

        def initialize(
          @kek_validation_request : Types::KekValidationRequest? = nil,
          @kek_validation_response : Types::KekValidationResponse? = nil
        )
        end
      end

      # Parameter information to use a PEK derived using AS2805.
      struct As2805PekDerivationAttributes
        include JSON::Serializable

        # The system trace audit number for the transaction.
        @[JSON::Field(key: "SystemTraceAuditNumber")]
        getter system_trace_audit_number : String

        # The transaction amount for the transaction.
        @[JSON::Field(key: "TransactionAmount")]
        getter transaction_amount : String

        def initialize(
          @system_trace_audit_number : String,
          @transaction_amount : String
        )
        end
      end

      # Parameters for plaintext encryption using asymmetric keys.
      struct AsymmetricEncryptionAttributes
        include JSON::Serializable

        # The padding to be included with the data.
        @[JSON::Field(key: "PaddingType")]
        getter padding_type : String?

        def initialize(
          @padding_type : String? = nil
        )
        end
      end

      # Card data parameters that are required to generate Card Verification Values (CVV/CVV2), Dynamic Card
      # Verification Values (dCVV/dCVV2), or Card Security Codes (CSC).
      struct CardGenerationAttributes
        include JSON::Serializable

        @[JSON::Field(key: "AmexCardSecurityCodeVersion1")]
        getter amex_card_security_code_version1 : Types::AmexCardSecurityCodeVersion1?

        # Card data parameters that are required to generate a Card Security Code (CSC2) for an AMEX payment
        # card.
        @[JSON::Field(key: "AmexCardSecurityCodeVersion2")]
        getter amex_card_security_code_version2 : Types::AmexCardSecurityCodeVersion2?

        # Card data parameters that are required to generate a cardholder verification value for the payment
        # card.
        @[JSON::Field(key: "CardHolderVerificationValue")]
        getter card_holder_verification_value : Types::CardHolderVerificationValue?

        # Card data parameters that are required to generate Card Verification Value (CVV) for the payment
        # card.
        @[JSON::Field(key: "CardVerificationValue1")]
        getter card_verification_value1 : Types::CardVerificationValue1?

        # Card data parameters that are required to generate Card Verification Value (CVV2) for the payment
        # card.
        @[JSON::Field(key: "CardVerificationValue2")]
        getter card_verification_value2 : Types::CardVerificationValue2?

        # Card data parameters that are required to generate CDynamic Card Verification Code (dCVC) for the
        # payment card.
        @[JSON::Field(key: "DynamicCardVerificationCode")]
        getter dynamic_card_verification_code : Types::DynamicCardVerificationCode?

        # Card data parameters that are required to generate CDynamic Card Verification Value (dCVV) for the
        # payment card.
        @[JSON::Field(key: "DynamicCardVerificationValue")]
        getter dynamic_card_verification_value : Types::DynamicCardVerificationValue?

        def initialize(
          @amex_card_security_code_version1 : Types::AmexCardSecurityCodeVersion1? = nil,
          @amex_card_security_code_version2 : Types::AmexCardSecurityCodeVersion2? = nil,
          @card_holder_verification_value : Types::CardHolderVerificationValue? = nil,
          @card_verification_value1 : Types::CardVerificationValue1? = nil,
          @card_verification_value2 : Types::CardVerificationValue2? = nil,
          @dynamic_card_verification_code : Types::DynamicCardVerificationCode? = nil,
          @dynamic_card_verification_value : Types::DynamicCardVerificationValue? = nil
        )
        end
      end

      # Card data parameters that are required to generate a cardholder verification value for the payment
      # card.
      struct CardHolderVerificationValue
        include JSON::Serializable

        # The transaction counter value that comes from a point of sale terminal.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # A random number generated by the issuer.
        @[JSON::Field(key: "UnpredictableNumber")]
        getter unpredictable_number : String

        def initialize(
          @application_transaction_counter : String,
          @pan_sequence_number : String,
          @unpredictable_number : String
        )
        end
      end

      # Card data parameters that are requried to verify Card Verification Values (CVV/CVV2), Dynamic Card
      # Verification Values (dCVV/dCVV2), or Card Security Codes (CSC).
      struct CardVerificationAttributes
        include JSON::Serializable

        @[JSON::Field(key: "AmexCardSecurityCodeVersion1")]
        getter amex_card_security_code_version1 : Types::AmexCardSecurityCodeVersion1?

        # Card data parameters that are required to verify a Card Security Code (CSC2) for an AMEX payment
        # card.
        @[JSON::Field(key: "AmexCardSecurityCodeVersion2")]
        getter amex_card_security_code_version2 : Types::AmexCardSecurityCodeVersion2?

        # Card data parameters that are required to verify a cardholder verification value for the payment
        # card.
        @[JSON::Field(key: "CardHolderVerificationValue")]
        getter card_holder_verification_value : Types::CardHolderVerificationValue?

        # Card data parameters that are required to verify Card Verification Value (CVV) for the payment card.
        @[JSON::Field(key: "CardVerificationValue1")]
        getter card_verification_value1 : Types::CardVerificationValue1?

        # Card data parameters that are required to verify Card Verification Value (CVV2) for the payment
        # card.
        @[JSON::Field(key: "CardVerificationValue2")]
        getter card_verification_value2 : Types::CardVerificationValue2?

        # Card data parameters that are required to verify CDynamic Card Verification Code (dCVC) for the
        # payment card.
        @[JSON::Field(key: "DiscoverDynamicCardVerificationCode")]
        getter discover_dynamic_card_verification_code : Types::DiscoverDynamicCardVerificationCode?

        # Card data parameters that are required to verify CDynamic Card Verification Code (dCVC) for the
        # payment card.
        @[JSON::Field(key: "DynamicCardVerificationCode")]
        getter dynamic_card_verification_code : Types::DynamicCardVerificationCode?

        # Card data parameters that are required to verify CDynamic Card Verification Value (dCVV) for the
        # payment card.
        @[JSON::Field(key: "DynamicCardVerificationValue")]
        getter dynamic_card_verification_value : Types::DynamicCardVerificationValue?

        def initialize(
          @amex_card_security_code_version1 : Types::AmexCardSecurityCodeVersion1? = nil,
          @amex_card_security_code_version2 : Types::AmexCardSecurityCodeVersion2? = nil,
          @card_holder_verification_value : Types::CardHolderVerificationValue? = nil,
          @card_verification_value1 : Types::CardVerificationValue1? = nil,
          @card_verification_value2 : Types::CardVerificationValue2? = nil,
          @discover_dynamic_card_verification_code : Types::DiscoverDynamicCardVerificationCode? = nil,
          @dynamic_card_verification_code : Types::DynamicCardVerificationCode? = nil,
          @dynamic_card_verification_value : Types::DynamicCardVerificationValue? = nil
        )
        end
      end

      # Card data parameters that are required to verify CVV (Card Verification Value) for the payment card.
      struct CardVerificationValue1
        include JSON::Serializable

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        # The service code of the payment card. This is different from Card Security Code (CSC).
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @card_expiry_date : String,
          @service_code : String
        )
        end
      end

      # Card data parameters that are required to verify Card Verification Value (CVV2) for the payment
      # card.
      struct CardVerificationValue2
        include JSON::Serializable

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        def initialize(
          @card_expiry_date : String
        )
        end
      end

      # Parameters that are required for Authorization Response Cryptogram (ARPC) generation after
      # Authorization Request Cryptogram (ARQC) verification is successful.
      struct CryptogramAuthResponse
        include JSON::Serializable

        # Parameters that are required for ARPC response generation using method1 after ARQC verification is
        # successful.
        @[JSON::Field(key: "ArpcMethod1")]
        getter arpc_method1 : Types::CryptogramVerificationArpcMethod1?

        # Parameters that are required for ARPC response generation using method2 after ARQC verification is
        # successful.
        @[JSON::Field(key: "ArpcMethod2")]
        getter arpc_method2 : Types::CryptogramVerificationArpcMethod2?

        def initialize(
          @arpc_method1 : Types::CryptogramVerificationArpcMethod1? = nil,
          @arpc_method2 : Types::CryptogramVerificationArpcMethod2? = nil
        )
        end
      end

      # Parameters that are required for ARPC response generation using method1 after ARQC verification is
      # successful.
      struct CryptogramVerificationArpcMethod1
        include JSON::Serializable

        # The auth code used to calculate APRC after ARQC verification is successful. This is the same auth
        # code used for ARQC generation outside of Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "AuthResponseCode")]
        getter auth_response_code : String

        def initialize(
          @auth_response_code : String
        )
        end
      end

      # Parameters that are required for ARPC response generation using method2 after ARQC verification is
      # successful.
      struct CryptogramVerificationArpcMethod2
        include JSON::Serializable

        # The data indicating whether the issuer approves or declines an online transaction using an EMV chip
        # card.
        @[JSON::Field(key: "CardStatusUpdate")]
        getter card_status_update : String

        # The proprietary authentication data used by issuer for communication during online transaction using
        # an EMV chip card.
        @[JSON::Field(key: "ProprietaryAuthenticationData")]
        getter proprietary_authentication_data : String?

        def initialize(
          @card_status_update : String,
          @proprietary_authentication_data : String? = nil
        )
        end
      end

      # The parameter values of the current PIN to be changed on the EMV chip card.
      struct CurrentPinAttributes
        include JSON::Serializable

        # The encrypted pinblock of the current pin stored on the chip card.
        @[JSON::Field(key: "CurrentEncryptedPinBlock")]
        getter current_encrypted_pin_block : String

        # The keyArn of the current PIN PEK.
        @[JSON::Field(key: "CurrentPinPekIdentifier")]
        getter current_pin_pek_identifier : String

        def initialize(
          @current_encrypted_pin_block : String,
          @current_pin_pek_identifier : String
        )
        end
      end

      struct DecryptDataInput
        include JSON::Serializable

        # The ciphertext to decrypt.
        @[JSON::Field(key: "CipherText")]
        getter cipher_text : String

        # The encryption key type and attributes for ciphertext decryption.
        @[JSON::Field(key: "DecryptionAttributes")]
        getter decryption_attributes : Types::EncryptionDecryptionAttributes

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for ciphertext
        # decryption. When a WrappedKeyBlock is provided, this value will be the identifier to the key
        # wrapping key. Otherwise, it is the key identifier used to perform the operation.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The WrappedKeyBlock containing the encryption key for ciphertext decryption.
        @[JSON::Field(key: "WrappedKey")]
        getter wrapped_key : Types::WrappedKey?

        def initialize(
          @cipher_text : String,
          @decryption_attributes : Types::EncryptionDecryptionAttributes,
          @key_identifier : String,
          @wrapped_key : Types::WrappedKey? = nil
        )
        end
      end

      struct DecryptDataOutput
        include JSON::Serializable

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for ciphertext
        # decryption.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The decrypted plaintext data in hexBinary format.
        @[JSON::Field(key: "PlainText")]
        getter plain_text : String

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @plain_text : String
        )
        end
      end

      # Parameters to derive the payment card specific confidentiality and integrity keys.
      struct DerivationMethodAttributes
        include JSON::Serializable

        # Parameters to derive the confidentiality and integrity keys for a payment card using Amex derivation
        # method.
        @[JSON::Field(key: "Amex")]
        getter amex : Types::AmexAttributes?

        # Parameters to derive the confidentiality and integrity keys for a payment card using Emv2000
        # derivation method.
        @[JSON::Field(key: "Emv2000")]
        getter emv2000 : Types::Emv2000Attributes?

        # Parameters to derive the confidentiality and integrity keys for a payment card using Emv common
        # derivation method.
        @[JSON::Field(key: "EmvCommon")]
        getter emv_common : Types::EmvCommonAttributes?

        # Parameters to derive the confidentiality and integrity keys for a payment card using Mastercard
        # derivation method.
        @[JSON::Field(key: "Mastercard")]
        getter mastercard : Types::MasterCardAttributes?

        # Parameters to derive the confidentiality and integrity keys for a a payment card using Visa
        # derivation method.
        @[JSON::Field(key: "Visa")]
        getter visa : Types::VisaAttributes?

        def initialize(
          @amex : Types::AmexAttributes? = nil,
          @emv2000 : Types::Emv2000Attributes? = nil,
          @emv_common : Types::EmvCommonAttributes? = nil,
          @mastercard : Types::MasterCardAttributes? = nil,
          @visa : Types::VisaAttributes? = nil
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

      # Parameters that are required to generate or verify dCVC (Dynamic Card Verification Code).
      struct DiscoverDynamicCardVerificationCode
        include JSON::Serializable

        # The transaction counter value that comes from the terminal.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        # A random number that is generated by the issuer.
        @[JSON::Field(key: "UnpredictableNumber")]
        getter unpredictable_number : String

        def initialize(
          @application_transaction_counter : String,
          @card_expiry_date : String,
          @unpredictable_number : String
        )
        end
      end

      # Parameters that are used for Derived Unique Key Per Transaction (DUKPT) derivation algorithm.
      struct DukptAttributes
        include JSON::Serializable

        # The key type derived using DUKPT from a Base Derivation Key (BDK) and Key Serial Number (KSN). This
        # must be less than or equal to the strength of the BDK. For example, you can't use AES_128 as a
        # derivation type for a BDK of AES_128 or TDES_2KEY .
        @[JSON::Field(key: "DukptDerivationType")]
        getter dukpt_derivation_type : String

        # The unique identifier known as Key Serial Number (KSN) that comes from an encrypting device using
        # DUKPT encryption method. The KSN is derived from the encrypting device unique identifier and an
        # internal transaction counter.
        @[JSON::Field(key: "KeySerialNumber")]
        getter key_serial_number : String

        def initialize(
          @dukpt_derivation_type : String,
          @key_serial_number : String
        )
        end
      end

      # Parameters required for encryption or decryption of data using DUKPT.
      struct DukptDerivationAttributes
        include JSON::Serializable

        # The unique identifier known as Key Serial Number (KSN) that comes from an encrypting device using
        # DUKPT encryption method. The KSN is derived from the encrypting device unique identifier and an
        # internal transaction counter.
        @[JSON::Field(key: "KeySerialNumber")]
        getter key_serial_number : String

        # The key type derived using DUKPT from a Base Derivation Key (BDK) and Key Serial Number (KSN). This
        # must be less than or equal to the strength of the BDK. For example, you can't use AES_128 as a
        # derivation type for a BDK of AES_128 or TDES_2KEY
        @[JSON::Field(key: "DukptKeyDerivationType")]
        getter dukpt_key_derivation_type : String?

        # The type of use of DUKPT, which can be for incoming data decryption, outgoing data encryption, or
        # both.
        @[JSON::Field(key: "DukptKeyVariant")]
        getter dukpt_key_variant : String?

        def initialize(
          @key_serial_number : String,
          @dukpt_key_derivation_type : String? = nil,
          @dukpt_key_variant : String? = nil
        )
        end
      end

      # Parameters that are required to encrypt plaintext data using DUKPT.
      struct DukptEncryptionAttributes
        include JSON::Serializable

        # The unique identifier known as Key Serial Number (KSN) that comes from an encrypting device using
        # DUKPT encryption method. The KSN is derived from the encrypting device unique identifier and an
        # internal transaction counter.
        @[JSON::Field(key: "KeySerialNumber")]
        getter key_serial_number : String

        # The key type encrypted using DUKPT from a Base Derivation Key (BDK) and Key Serial Number (KSN).
        # This must be less than or equal to the strength of the BDK. For example, you can't use AES_128 as a
        # derivation type for a BDK of AES_128 or TDES_2KEY
        @[JSON::Field(key: "DukptKeyDerivationType")]
        getter dukpt_key_derivation_type : String?

        # The type of use of DUKPT, which can be incoming data decryption, outgoing data encryption, or both.
        @[JSON::Field(key: "DukptKeyVariant")]
        getter dukpt_key_variant : String?

        # An input used to provide the intial state. If no value is provided, Amazon Web Services Payment
        # Cryptography defaults it to zero.
        @[JSON::Field(key: "InitializationVector")]
        getter initialization_vector : String?

        # The block cipher method to use for encryption. The default is CBC.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @key_serial_number : String,
          @dukpt_key_derivation_type : String? = nil,
          @dukpt_key_variant : String? = nil,
          @initialization_vector : String? = nil,
          @mode : String? = nil
        )
        end
      end

      # Parameters that are required to generate or verify Dynamic Card Verification Value (dCVV).
      struct DynamicCardVerificationCode
        include JSON::Serializable

        # The transaction counter value that comes from the terminal.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The data on the two tracks of magnetic cards used for financial transactions. This includes the
        # cardholder name, PAN, expiration date, bank ID (BIN) and several other numbers the issuing bank uses
        # to validate the data received.
        @[JSON::Field(key: "TrackData")]
        getter track_data : String

        # A random number generated by the issuer.
        @[JSON::Field(key: "UnpredictableNumber")]
        getter unpredictable_number : String

        def initialize(
          @application_transaction_counter : String,
          @pan_sequence_number : String,
          @track_data : String,
          @unpredictable_number : String
        )
        end
      end

      # Parameters that are required to generate or verify Dynamic Card Verification Value (dCVV).
      struct DynamicCardVerificationValue
        include JSON::Serializable

        # The transaction counter value that comes from the terminal.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # The expiry date of a payment card.
        @[JSON::Field(key: "CardExpiryDate")]
        getter card_expiry_date : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The service code of the payment card. This is different from Card Security Code (CSC).
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @application_transaction_counter : String,
          @card_expiry_date : String,
          @pan_sequence_number : String,
          @service_code : String
        )
        end
      end

      # Parameters required to establish ECDH based key exchange.
      struct EcdhDerivationAttributes
        include JSON::Serializable

        # The keyArn of the certificate that signed the client's PublicKeyCertificate .
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        # The key algorithm of the derived ECDH key.
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String

        # The key derivation function to use for deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationFunction")]
        getter key_derivation_function : String

        # The hash type to use for deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationHashAlgorithm")]
        getter key_derivation_hash_algorithm : String

        # The client's public key certificate in PEM format (base64 encoded) to use for ECDH key derivation.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        # A byte string containing information that binds the ECDH derived key to the two parties involved or
        # to the context of the key. It may include details like identities of the two parties deriving the
        # key, context of the operation, session IDs, and optionally a nonce. It must not contain zero bytes,
        # and re-using shared information for multiple ECDH key derivations is not recommended.
        @[JSON::Field(key: "SharedInformation")]
        getter shared_information : String

        def initialize(
          @certificate_authority_public_key_identifier : String,
          @key_algorithm : String,
          @key_derivation_function : String,
          @key_derivation_hash_algorithm : String,
          @public_key_certificate : String,
          @shared_information : String
        )
        end
      end

      # Parameters to derive the confidentiality and integrity keys for a payment card using EMV2000 deruv.
      struct Emv2000Attributes
        include JSON::Serializable

        # The transaction counter of the current transaction that is provided by the terminal during
        # transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # The method to use when deriving the master key for the payment card.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @application_transaction_counter : String,
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters to derive the confidentiality and integrity keys for an Emv common payment card.
      struct EmvCommonAttributes
        include JSON::Serializable

        # The application cryptogram for the current transaction that is provided by the terminal during
        # transaction processing.
        @[JSON::Field(key: "ApplicationCryptogram")]
        getter application_cryptogram : String

        # The method to use when deriving the master key for the payment card.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # The block cipher method to use for encryption.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # Specifies if PIN block length should be added to front of the pin block. If value is set to
        # FRONT_OF_PIN_BLOCK , then PIN block padding type should be ISO_IEC_7816_4 .
        @[JSON::Field(key: "PinBlockLengthPosition")]
        getter pin_block_length_position : String

        # The padding to be added to the PIN block prior to encryption. Padding type should be ISO_IEC_7816_4
        # , if PinBlockLengthPosition is set to FRONT_OF_PIN_BLOCK . No padding is required, if
        # PinBlockLengthPosition is set to NONE .
        @[JSON::Field(key: "PinBlockPaddingType")]
        getter pin_block_padding_type : String

        # The Primary Account Number (PAN) of the cardholder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @application_cryptogram : String,
          @major_key_derivation_mode : String,
          @mode : String,
          @pan_sequence_number : String,
          @pin_block_length_position : String,
          @pin_block_padding_type : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters for plaintext encryption using EMV keys.
      struct EmvEncryptionAttributes
        include JSON::Serializable

        # The EMV derivation mode to use for ICC master key derivation as per EMV version 4.3 book 2.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card and
        # associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The derivation value used to derive the ICC session key. It is typically the application transaction
        # counter value padded with zeros or previous ARQC value padded with zeros as per EMV version 4.3 book
        # 2.
        @[JSON::Field(key: "SessionDerivationData")]
        getter session_derivation_data : String

        # An input used to provide the intial state. If no value is provided, Amazon Web Services Payment
        # Cryptography defaults it to zero.
        @[JSON::Field(key: "InitializationVector")]
        getter initialization_vector : String?

        # The block cipher method to use for encryption.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        def initialize(
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String,
          @session_derivation_data : String,
          @initialization_vector : String? = nil,
          @mode : String? = nil
        )
        end
      end

      struct EncryptDataInput
        include JSON::Serializable

        # The encryption key type and attributes for plaintext encryption.
        @[JSON::Field(key: "EncryptionAttributes")]
        getter encryption_attributes : Types::EncryptionDecryptionAttributes

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for plaintext
        # encryption. When a WrappedKeyBlock is provided, this value will be the identifier to the key
        # wrapping key. Otherwise, it is the key identifier used to perform the operation.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The plaintext to be encrypted. For encryption using asymmetric keys, plaintext data length is
        # constrained by encryption key strength that you define in KeyAlgorithm and padding type that you
        # define in AsymmetricEncryptionAttributes . For more information, see Encrypt data in the Amazon Web
        # Services Payment Cryptography User Guide .
        @[JSON::Field(key: "PlainText")]
        getter plain_text : String

        # The WrappedKeyBlock containing the encryption key for plaintext encryption.
        @[JSON::Field(key: "WrappedKey")]
        getter wrapped_key : Types::WrappedKey?

        def initialize(
          @encryption_attributes : Types::EncryptionDecryptionAttributes,
          @key_identifier : String,
          @plain_text : String,
          @wrapped_key : Types::WrappedKey? = nil
        )
        end
      end

      struct EncryptDataOutput
        include JSON::Serializable

        # The encrypted ciphertext.
        @[JSON::Field(key: "CipherText")]
        getter cipher_text : String

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for plaintext
        # encryption.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String?

        def initialize(
          @cipher_text : String,
          @key_arn : String,
          @key_check_value : String? = nil
        )
        end
      end

      # Parameters that are required to perform encryption and decryption operations.
      struct EncryptionDecryptionAttributes
        include JSON::Serializable

        @[JSON::Field(key: "Asymmetric")]
        getter asymmetric : Types::AsymmetricEncryptionAttributes?

        @[JSON::Field(key: "Dukpt")]
        getter dukpt : Types::DukptEncryptionAttributes?

        # Parameters for plaintext encryption using EMV keys.
        @[JSON::Field(key: "Emv")]
        getter emv : Types::EmvEncryptionAttributes?

        # Parameters that are required to perform encryption and decryption using symmetric keys.
        @[JSON::Field(key: "Symmetric")]
        getter symmetric : Types::SymmetricEncryptionAttributes?

        def initialize(
          @asymmetric : Types::AsymmetricEncryptionAttributes? = nil,
          @dukpt : Types::DukptEncryptionAttributes? = nil,
          @emv : Types::EmvEncryptionAttributes? = nil,
          @symmetric : Types::SymmetricEncryptionAttributes? = nil
        )
        end
      end

      struct GenerateAs2805KekValidationInput
        include JSON::Serializable

        # Parameter information for generating a random key for KEK validation to perform node-to-node
        # initialization.
        @[JSON::Field(key: "KekValidationType")]
        getter kek_validation_type : Types::As2805KekValidationType

        # The keyARN of sending KEK that Amazon Web Services Payment Cryptography uses for node-to-node
        # initialization
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The key variant to use for generating a random key for KEK validation during node-to-node
        # initialization.
        @[JSON::Field(key: "RandomKeySendVariantMask")]
        getter random_key_send_variant_mask : String

        def initialize(
          @kek_validation_type : Types::As2805KekValidationType,
          @key_identifier : String,
          @random_key_send_variant_mask : String
        )
        end
      end

      struct GenerateAs2805KekValidationOutput
        include JSON::Serializable

        # The keyARN of sending KEK that Amazon Web Services Payment Cryptography validates for node-to-node
        # initialization
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the sending KEK that Amazon Web Services Payment Cryptography validates
        # for node-to-node initialization.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The random key generated for receiving KEK validation. The initiating node sends this key to its
        # partner node for validation.
        @[JSON::Field(key: "RandomKeyReceive")]
        getter random_key_receive : String

        # The random key generated for sending KEK validation.
        @[JSON::Field(key: "RandomKeySend")]
        getter random_key_send : String

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @random_key_receive : String,
          @random_key_send : String
        )
        end
      end

      struct GenerateCardValidationDataInput
        include JSON::Serializable

        # The algorithm for generating CVV or CSC values for the card within Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "GenerationAttributes")]
        getter generation_attributes : Types::CardGenerationAttributes

        # The keyARN of the CVK encryption key that Amazon Web Services Payment Cryptography uses to generate
        # card data.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card that
        # associates the card with a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The length of the CVV or CSC to be generated. The default value is 3.
        @[JSON::Field(key: "ValidationDataLength")]
        getter validation_data_length : Int32?

        def initialize(
          @generation_attributes : Types::CardGenerationAttributes,
          @key_identifier : String,
          @primary_account_number : String,
          @validation_data_length : Int32? = nil
        )
        end
      end

      struct GenerateCardValidationDataOutput
        include JSON::Serializable

        # The keyARN of the CVK encryption key that Amazon Web Services Payment Cryptography uses to generate
        # CVV or CSC.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The CVV or CSC value that Amazon Web Services Payment Cryptography generates for the card.
        @[JSON::Field(key: "ValidationData")]
        getter validation_data : String

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @validation_data : String
        )
        end
      end

      struct GenerateMacEmvPinChangeInput
        include JSON::Serializable

        # The attributes and data values to derive payment card specific confidentiality and integrity keys.
        @[JSON::Field(key: "DerivationMethodAttributes")]
        getter derivation_method_attributes : Types::DerivationMethodAttributes

        # The message data is the APDU command from the card reader or terminal. The target encrypted PIN
        # block, after translation to ISO2 format, is appended to this message data to generate an issuer
        # script response.
        @[JSON::Field(key: "MessageData")]
        getter message_data : String

        # The incoming new encrypted PIN block data for offline pin change on an EMV card.
        @[JSON::Field(key: "NewEncryptedPinBlock")]
        getter new_encrypted_pin_block : String

        # The keyARN of the PEK protecting the incoming new encrypted PIN block.
        @[JSON::Field(key: "NewPinPekIdentifier")]
        getter new_pin_pek_identifier : String

        # The PIN encoding format of the incoming new encrypted PIN block as specified in ISO 9564.
        @[JSON::Field(key: "PinBlockFormat")]
        getter pin_block_format : String

        # The keyARN of the issuer master key (IMK-SMC) used to protect the PIN block data in the issuer
        # script response.
        @[JSON::Field(key: "SecureMessagingConfidentialityKeyIdentifier")]
        getter secure_messaging_confidentiality_key_identifier : String

        # The keyARN of the issuer master key (IMK-SMI) used to authenticate the issuer script response.
        @[JSON::Field(key: "SecureMessagingIntegrityKeyIdentifier")]
        getter secure_messaging_integrity_key_identifier : String

        def initialize(
          @derivation_method_attributes : Types::DerivationMethodAttributes,
          @message_data : String,
          @new_encrypted_pin_block : String,
          @new_pin_pek_identifier : String,
          @pin_block_format : String,
          @secure_messaging_confidentiality_key_identifier : String,
          @secure_messaging_integrity_key_identifier : String
        )
        end
      end

      struct GenerateMacEmvPinChangeOutput
        include JSON::Serializable

        # Returns the incoming new encrpted PIN block.
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # Returns the mac of the issuer script containing message data and appended target encrypted pin block
        # in ISO2 format.
        @[JSON::Field(key: "Mac")]
        getter mac : String

        # Returns the keyArn of the PEK protecting the incoming new encrypted PIN block.
        @[JSON::Field(key: "NewPinPekArn")]
        getter new_pin_pek_arn : String

        # The key check value (KCV) of the PEK uprotecting the incoming new encrypted PIN block.
        @[JSON::Field(key: "NewPinPekKeyCheckValue")]
        getter new_pin_pek_key_check_value : String

        # Returns the keyArn of the IMK-SMC used by the operation.
        @[JSON::Field(key: "SecureMessagingConfidentialityKeyArn")]
        getter secure_messaging_confidentiality_key_arn : String

        # The key check value (KCV) of the SMC issuer master key used by the operation.
        @[JSON::Field(key: "SecureMessagingConfidentialityKeyCheckValue")]
        getter secure_messaging_confidentiality_key_check_value : String

        # Returns the keyArn of the IMK-SMI used by the operation.
        @[JSON::Field(key: "SecureMessagingIntegrityKeyArn")]
        getter secure_messaging_integrity_key_arn : String

        # The key check value (KCV) of the SMI issuer master key used by the operation.
        @[JSON::Field(key: "SecureMessagingIntegrityKeyCheckValue")]
        getter secure_messaging_integrity_key_check_value : String

        # The attribute values used for Amex and Visa derivation methods.
        @[JSON::Field(key: "VisaAmexDerivationOutputs")]
        getter visa_amex_derivation_outputs : Types::VisaAmexDerivationOutputs?

        def initialize(
          @encrypted_pin_block : String,
          @mac : String,
          @new_pin_pek_arn : String,
          @new_pin_pek_key_check_value : String,
          @secure_messaging_confidentiality_key_arn : String,
          @secure_messaging_confidentiality_key_check_value : String,
          @secure_messaging_integrity_key_arn : String,
          @secure_messaging_integrity_key_check_value : String,
          @visa_amex_derivation_outputs : Types::VisaAmexDerivationOutputs? = nil
        )
        end
      end

      struct GenerateMacInput
        include JSON::Serializable

        # The attributes and data values to use for MAC generation within Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "GenerationAttributes")]
        getter generation_attributes : Types::MacAttributes

        # The keyARN of the MAC generation encryption key.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The data for which a MAC is under generation. This value must be hexBinary.
        @[JSON::Field(key: "MessageData")]
        getter message_data : String

        # The length of a MAC under generation.
        @[JSON::Field(key: "MacLength")]
        getter mac_length : Int32?

        def initialize(
          @generation_attributes : Types::MacAttributes,
          @key_identifier : String,
          @message_data : String,
          @mac_length : Int32? = nil
        )
        end
      end

      struct GenerateMacOutput
        include JSON::Serializable

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for MAC
        # generation.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The MAC cryptogram generated within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "Mac")]
        getter mac : String

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @mac : String
        )
        end
      end

      struct GeneratePinDataInput
        include JSON::Serializable

        # The keyARN of the PEK that Amazon Web Services Payment Cryptography uses to encrypt the PIN Block.
        # For ECDH, it is the keyARN of the asymmetric ECC key.
        @[JSON::Field(key: "EncryptionKeyIdentifier")]
        getter encryption_key_identifier : String

        # The attributes and values to use for PIN, PVV, or PIN Offset generation.
        @[JSON::Field(key: "GenerationAttributes")]
        getter generation_attributes : Types::PinGenerationAttributes

        # The keyARN of the PEK that Amazon Web Services Payment Cryptography uses for pin data generation.
        @[JSON::Field(key: "GenerationKeyIdentifier")]
        getter generation_key_identifier : String

        # The PIN encoding format for pin data generation as specified in ISO 9564. Amazon Web Services
        # Payment Cryptography supports ISO_Format_0 , ISO_Format_3 and ISO_Format_4 . The ISO_Format_0 PIN
        # block format is equivalent to the ANSI X9.8, VISA-1, and ECI-1 PIN block formats. It is similar to a
        # VISA-4 PIN block format. It supports a PIN from 4 to 12 digits in length. The ISO_Format_3 PIN block
        # format is the same as ISO_Format_0 except that the fill digits are random values from 10 to 15. The
        # ISO_Format_4 PIN block format is the only one supporting AES encryption.
        @[JSON::Field(key: "PinBlockFormat")]
        getter pin_block_format : String

        @[JSON::Field(key: "EncryptionWrappedKey")]
        getter encryption_wrapped_key : Types::WrappedKey?

        # The length of PIN under generation.
        @[JSON::Field(key: "PinDataLength")]
        getter pin_data_length : Int32?

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card that
        # associates the card with a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String?

        def initialize(
          @encryption_key_identifier : String,
          @generation_attributes : Types::PinGenerationAttributes,
          @generation_key_identifier : String,
          @pin_block_format : String,
          @encryption_wrapped_key : Types::WrappedKey? = nil,
          @pin_data_length : Int32? = nil,
          @primary_account_number : String? = nil
        )
        end
      end

      struct GeneratePinDataOutput
        include JSON::Serializable

        # The PIN block encrypted under PEK from Amazon Web Services Payment Cryptography. The encrypted PIN
        # block is a composite of PAN (Primary Account Number) and PIN (Personal Identification Number),
        # generated in accordance with ISO 9564 standard.
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # The keyARN of the PEK that Amazon Web Services Payment Cryptography uses for encrypted pin block
        # generation. For ECDH, it is the keyARN of the asymmetric ECC key.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "EncryptionKeyCheckValue")]
        getter encryption_key_check_value : String

        # The keyARN of the pin data generation key that Amazon Web Services Payment Cryptography uses for
        # PIN, PVV or PIN Offset generation.
        @[JSON::Field(key: "GenerationKeyArn")]
        getter generation_key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "GenerationKeyCheckValue")]
        getter generation_key_check_value : String

        # The attributes and values Amazon Web Services Payment Cryptography uses for pin data generation.
        @[JSON::Field(key: "PinData")]
        getter pin_data : Types::PinData

        def initialize(
          @encrypted_pin_block : String,
          @encryption_key_arn : String,
          @encryption_key_check_value : String,
          @generation_key_arn : String,
          @generation_key_check_value : String,
          @pin_data : Types::PinData
        )
        end
      end

      # Parameters that are required to generate or verify Ibm3624 natural PIN.
      struct Ibm3624NaturalPin
        include JSON::Serializable

        # The decimalization table to use for IBM 3624 PIN algorithm. The table is used to convert the
        # algorithm intermediate result from hexadecimal characters to decimal.
        @[JSON::Field(key: "DecimalizationTable")]
        getter decimalization_table : String

        # The unique data for cardholder identification.
        @[JSON::Field(key: "PinValidationData")]
        getter pin_validation_data : String

        # The padding character for validation data.
        @[JSON::Field(key: "PinValidationDataPadCharacter")]
        getter pin_validation_data_pad_character : String

        def initialize(
          @decimalization_table : String,
          @pin_validation_data : String,
          @pin_validation_data_pad_character : String
        )
        end
      end

      # Parameters that are required to generate or verify Ibm3624 PIN from offset PIN.
      struct Ibm3624PinFromOffset
        include JSON::Serializable

        # The decimalization table to use for IBM 3624 PIN algorithm. The table is used to convert the
        # algorithm intermediate result from hexadecimal characters to decimal.
        @[JSON::Field(key: "DecimalizationTable")]
        getter decimalization_table : String

        # The PIN offset value.
        @[JSON::Field(key: "PinOffset")]
        getter pin_offset : String

        # The unique data for cardholder identification.
        @[JSON::Field(key: "PinValidationData")]
        getter pin_validation_data : String

        # The padding character for validation data.
        @[JSON::Field(key: "PinValidationDataPadCharacter")]
        getter pin_validation_data_pad_character : String

        def initialize(
          @decimalization_table : String,
          @pin_offset : String,
          @pin_validation_data : String,
          @pin_validation_data_pad_character : String
        )
        end
      end

      # Pparameters that are required to generate or verify Ibm3624 PIN offset PIN.
      struct Ibm3624PinOffset
        include JSON::Serializable

        # The decimalization table to use for IBM 3624 PIN algorithm. The table is used to convert the
        # algorithm intermediate result from hexadecimal characters to decimal.
        @[JSON::Field(key: "DecimalizationTable")]
        getter decimalization_table : String

        # The encrypted PIN block data. According to ISO 9564 standard, a PIN Block is an encoded
        # representation of a payment card Personal Account Number (PAN) and the cardholder Personal
        # Identification Number (PIN).
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # The unique data for cardholder identification.
        @[JSON::Field(key: "PinValidationData")]
        getter pin_validation_data : String

        # The padding character for validation data.
        @[JSON::Field(key: "PinValidationDataPadCharacter")]
        getter pin_validation_data_pad_character : String

        def initialize(
          @decimalization_table : String,
          @encrypted_pin_block : String,
          @pin_validation_data : String,
          @pin_validation_data_pad_character : String
        )
        end
      end

      # Parameters that are required to generate or verify Ibm3624 PIN verification PIN.
      struct Ibm3624PinVerification
        include JSON::Serializable

        # The decimalization table to use for IBM 3624 PIN algorithm. The table is used to convert the
        # algorithm intermediate result from hexadecimal characters to decimal.
        @[JSON::Field(key: "DecimalizationTable")]
        getter decimalization_table : String

        # The PIN offset value.
        @[JSON::Field(key: "PinOffset")]
        getter pin_offset : String

        # The unique data for cardholder identification.
        @[JSON::Field(key: "PinValidationData")]
        getter pin_validation_data : String

        # The padding character for validation data.
        @[JSON::Field(key: "PinValidationDataPadCharacter")]
        getter pin_validation_data_pad_character : String

        def initialize(
          @decimalization_table : String,
          @pin_offset : String,
          @pin_validation_data : String,
          @pin_validation_data_pad_character : String
        )
        end
      end

      # Parameters that are required to generate or verify Ibm3624 random PIN.
      struct Ibm3624RandomPin
        include JSON::Serializable

        # The decimalization table to use for IBM 3624 PIN algorithm. The table is used to convert the
        # algorithm intermediate result from hexadecimal characters to decimal.
        @[JSON::Field(key: "DecimalizationTable")]
        getter decimalization_table : String

        # The unique data for cardholder identification.
        @[JSON::Field(key: "PinValidationData")]
        getter pin_validation_data : String

        # The padding character for validation data.
        @[JSON::Field(key: "PinValidationDataPadCharacter")]
        getter pin_validation_data_pad_character : String

        def initialize(
          @decimalization_table : String,
          @pin_validation_data : String,
          @pin_validation_data_pad_character : String
        )
        end
      end

      # Parameter information of a TR31KeyBlock wrapped using an ECDH derived key.
      struct IncomingDiffieHellmanTr31KeyBlock
        include JSON::Serializable

        # The keyArn of the certificate that signed the client's PublicKeyCertificate .
        @[JSON::Field(key: "CertificateAuthorityPublicKeyIdentifier")]
        getter certificate_authority_public_key_identifier : String

        @[JSON::Field(key: "DerivationData")]
        getter derivation_data : Types::DiffieHellmanDerivationData

        # The key algorithm of the derived ECDH key.
        @[JSON::Field(key: "DeriveKeyAlgorithm")]
        getter derive_key_algorithm : String

        # The key derivation function to use for deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationFunction")]
        getter key_derivation_function : String

        # The hash type to use for deriving a key using ECDH.
        @[JSON::Field(key: "KeyDerivationHashAlgorithm")]
        getter key_derivation_hash_algorithm : String

        # The keyARN of the asymmetric ECC key pair.
        @[JSON::Field(key: "PrivateKeyIdentifier")]
        getter private_key_identifier : String

        # The client's public key certificate in PEM format (base64 encoded) to use for ECDH key derivation.
        @[JSON::Field(key: "PublicKeyCertificate")]
        getter public_key_certificate : String

        # The WrappedKeyBlock containing the transaction key wrapped using an ECDH dervied key.
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

      # Parameter information of the incoming WrappedKeyBlock containing the transaction key.
      struct IncomingKeyMaterial
        include JSON::Serializable

        # Parameter information of the TR31WrappedKeyBlock containing the transaction key wrapped using an
        # ECDH dervied key.
        @[JSON::Field(key: "DiffieHellmanTr31KeyBlock")]
        getter diffie_hellman_tr31_key_block : Types::IncomingDiffieHellmanTr31KeyBlock?

        def initialize(
          @diffie_hellman_tr31_key_block : Types::IncomingDiffieHellmanTr31KeyBlock? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Parameter information for generating a KEK validation request during node-to-node initialization.
      struct KekValidationRequest
        include JSON::Serializable

        # The key derivation algorithm to use for generating a KEK validation request.
        @[JSON::Field(key: "DeriveKeyAlgorithm")]
        getter derive_key_algorithm : String

        def initialize(
          @derive_key_algorithm : String
        )
        end
      end

      # Parameter information for generating a KEK validation response during node-to-node initialization.
      struct KekValidationResponse
        include JSON::Serializable

        # The random key for generating a KEK validation response.
        @[JSON::Field(key: "RandomKeySend")]
        getter random_key_send : String

        def initialize(
          @random_key_send : String
        )
        end
      end

      # Parameters required for DUKPT MAC generation and verification.
      struct MacAlgorithmDukpt
        include JSON::Serializable

        # The type of use of DUKPT, which can be MAC generation, MAC verification, or both.
        @[JSON::Field(key: "DukptKeyVariant")]
        getter dukpt_key_variant : String

        # The unique identifier known as Key Serial Number (KSN) that comes from an encrypting device using
        # DUKPT encryption method. The KSN is derived from the encrypting device unique identifier and an
        # internal transaction counter.
        @[JSON::Field(key: "KeySerialNumber")]
        getter key_serial_number : String

        # The key type derived using DUKPT from a Base Derivation Key (BDK) and Key Serial Number (KSN). This
        # must be less than or equal to the strength of the BDK. For example, you can't use AES_128 as a
        # derivation type for a BDK of AES_128 or TDES_2KEY .
        @[JSON::Field(key: "DukptDerivationType")]
        getter dukpt_derivation_type : String?

        def initialize(
          @dukpt_key_variant : String,
          @key_serial_number : String,
          @dukpt_derivation_type : String? = nil
        )
        end
      end

      # Parameters that are required for EMV MAC generation and verification.
      struct MacAlgorithmEmv
        include JSON::Serializable

        # The method to use when deriving the master key for EMV MAC generation or verification.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card and
        # associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The method of deriving a session key for EMV MAC generation or verification.
        @[JSON::Field(key: "SessionKeyDerivationMode")]
        getter session_key_derivation_mode : String

        # Parameters that are required to generate session key for EMV generation and verification.
        @[JSON::Field(key: "SessionKeyDerivationValue")]
        getter session_key_derivation_value : Types::SessionKeyDerivationValue

        def initialize(
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String,
          @session_key_derivation_mode : String,
          @session_key_derivation_value : Types::SessionKeyDerivationValue
        )
        end
      end

      # Parameters that are required for DUKPT, HMAC, or EMV MAC generation or verification.
      struct MacAttributes
        include JSON::Serializable

        # The encryption algorithm for MAC generation or verification.
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String?

        # Parameters that are required for MAC generation or verification using DUKPT CMAC algorithm.
        @[JSON::Field(key: "DukptCmac")]
        getter dukpt_cmac : Types::MacAlgorithmDukpt?

        # Parameters that are required for MAC generation or verification using DUKPT ISO 9797 algorithm1.
        @[JSON::Field(key: "DukptIso9797Algorithm1")]
        getter dukpt_iso9797_algorithm1 : Types::MacAlgorithmDukpt?

        # Parameters that are required for MAC generation or verification using DUKPT ISO 9797 algorithm3.
        @[JSON::Field(key: "DukptIso9797Algorithm3")]
        getter dukpt_iso9797_algorithm3 : Types::MacAlgorithmDukpt?

        # Parameters that are required for MAC generation or verification using EMV MAC algorithm.
        @[JSON::Field(key: "EmvMac")]
        getter emv_mac : Types::MacAlgorithmEmv?

        def initialize(
          @algorithm : String? = nil,
          @dukpt_cmac : Types::MacAlgorithmDukpt? = nil,
          @dukpt_iso9797_algorithm1 : Types::MacAlgorithmDukpt? = nil,
          @dukpt_iso9797_algorithm3 : Types::MacAlgorithmDukpt? = nil,
          @emv_mac : Types::MacAlgorithmEmv? = nil
        )
        end
      end

      # Parameters to derive the confidentiality and integrity keys for a Mastercard payment card.
      struct MasterCardAttributes
        include JSON::Serializable

        # The application cryptogram for the current transaction that is provided by the terminal during
        # transaction processing.
        @[JSON::Field(key: "ApplicationCryptogram")]
        getter application_cryptogram : String

        # The method to use when deriving the master key for the payment card.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @application_cryptogram : String,
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameter information of the outgoing TR31WrappedKeyBlock containing the transaction key.
      struct OutgoingKeyMaterial
        include JSON::Serializable

        # Parameter information of the TR31WrappedKeyBlock containing the transaction key wrapped using a KEK.
        @[JSON::Field(key: "Tr31KeyBlock")]
        getter tr31_key_block : Types::OutgoingTr31KeyBlock?

        def initialize(
          @tr31_key_block : Types::OutgoingTr31KeyBlock? = nil
        )
        end
      end

      # Parameter information of the TR31WrappedKeyBlock containing the transaction key wrapped using a KEK.
      struct OutgoingTr31KeyBlock
        include JSON::Serializable

        # The keyARN of the KEK used to wrap the transaction key.
        @[JSON::Field(key: "WrappingKeyIdentifier")]
        getter wrapping_key_identifier : String

        def initialize(
          @wrapping_key_identifier : String
        )
        end
      end

      # Parameters that are required to generate, translate, or verify PIN data.
      struct PinData
        include JSON::Serializable

        # The PIN offset value.
        @[JSON::Field(key: "PinOffset")]
        getter pin_offset : String?

        # The unique data to identify a cardholder. In most cases, this is the same as cardholder's Primary
        # Account Number (PAN). If a value is not provided, it defaults to PAN.
        @[JSON::Field(key: "VerificationValue")]
        getter verification_value : String?

        def initialize(
          @pin_offset : String? = nil,
          @verification_value : String? = nil
        )
        end
      end

      # Parameters that are required for PIN data generation.
      struct PinGenerationAttributes
        include JSON::Serializable

        # Parameters that are required to generate or verify Ibm3624 natural PIN.
        @[JSON::Field(key: "Ibm3624NaturalPin")]
        getter ibm3624_natural_pin : Types::Ibm3624NaturalPin?

        # Parameters that are required to generate or verify Ibm3624 PIN from offset PIN.
        @[JSON::Field(key: "Ibm3624PinFromOffset")]
        getter ibm3624_pin_from_offset : Types::Ibm3624PinFromOffset?

        # Parameters that are required to generate or verify Ibm3624 PIN offset PIN.
        @[JSON::Field(key: "Ibm3624PinOffset")]
        getter ibm3624_pin_offset : Types::Ibm3624PinOffset?

        # Parameters that are required to generate or verify Ibm3624 random PIN.
        @[JSON::Field(key: "Ibm3624RandomPin")]
        getter ibm3624_random_pin : Types::Ibm3624RandomPin?

        # Parameters that are required to generate or verify Visa PIN.
        @[JSON::Field(key: "VisaPin")]
        getter visa_pin : Types::VisaPin?

        # Parameters that are required to generate or verify Visa PIN Verification Value (PVV).
        @[JSON::Field(key: "VisaPinVerificationValue")]
        getter visa_pin_verification_value : Types::VisaPinVerificationValue?

        def initialize(
          @ibm3624_natural_pin : Types::Ibm3624NaturalPin? = nil,
          @ibm3624_pin_from_offset : Types::Ibm3624PinFromOffset? = nil,
          @ibm3624_pin_offset : Types::Ibm3624PinOffset? = nil,
          @ibm3624_random_pin : Types::Ibm3624RandomPin? = nil,
          @visa_pin : Types::VisaPin? = nil,
          @visa_pin_verification_value : Types::VisaPinVerificationValue? = nil
        )
        end
      end

      # Parameters that are required for PIN data verification.
      struct PinVerificationAttributes
        include JSON::Serializable

        # Parameters that are required to generate or verify Ibm3624 PIN.
        @[JSON::Field(key: "Ibm3624Pin")]
        getter ibm3624_pin : Types::Ibm3624PinVerification?

        # Parameters that are required to generate or verify Visa PIN.
        @[JSON::Field(key: "VisaPin")]
        getter visa_pin : Types::VisaPinVerification?

        def initialize(
          @ibm3624_pin : Types::Ibm3624PinVerification? = nil,
          @visa_pin : Types::VisaPinVerification? = nil
        )
        end
      end

      struct ReEncryptDataInput
        include JSON::Serializable

        # Ciphertext to be encrypted. The minimum allowed length is 16 bytes and maximum allowed length is
        # 4096 bytes.
        @[JSON::Field(key: "CipherText")]
        getter cipher_text : String

        # The attributes and values for incoming ciphertext.
        @[JSON::Field(key: "IncomingEncryptionAttributes")]
        getter incoming_encryption_attributes : Types::ReEncryptionAttributes

        # The keyARN of the encryption key of incoming ciphertext data. When a WrappedKeyBlock is provided,
        # this value will be the identifier to the key wrapping key. Otherwise, it is the key identifier used
        # to perform the operation.
        @[JSON::Field(key: "IncomingKeyIdentifier")]
        getter incoming_key_identifier : String

        # The attributes and values for outgoing ciphertext data after encryption by Amazon Web Services
        # Payment Cryptography.
        @[JSON::Field(key: "OutgoingEncryptionAttributes")]
        getter outgoing_encryption_attributes : Types::ReEncryptionAttributes

        # The keyARN of the encryption key of outgoing ciphertext data after encryption by Amazon Web Services
        # Payment Cryptography.
        @[JSON::Field(key: "OutgoingKeyIdentifier")]
        getter outgoing_key_identifier : String

        # The WrappedKeyBlock containing the encryption key of incoming ciphertext data.
        @[JSON::Field(key: "IncomingWrappedKey")]
        getter incoming_wrapped_key : Types::WrappedKey?

        # The WrappedKeyBlock containing the encryption key of outgoing ciphertext data after encryption by
        # Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "OutgoingWrappedKey")]
        getter outgoing_wrapped_key : Types::WrappedKey?

        def initialize(
          @cipher_text : String,
          @incoming_encryption_attributes : Types::ReEncryptionAttributes,
          @incoming_key_identifier : String,
          @outgoing_encryption_attributes : Types::ReEncryptionAttributes,
          @outgoing_key_identifier : String,
          @incoming_wrapped_key : Types::WrappedKey? = nil,
          @outgoing_wrapped_key : Types::WrappedKey? = nil
        )
        end
      end

      struct ReEncryptDataOutput
        include JSON::Serializable

        # The encrypted ciphertext.
        @[JSON::Field(key: "CipherText")]
        getter cipher_text : String

        # The keyARN (Amazon Resource Name) of the encryption key that Amazon Web Services Payment
        # Cryptography uses for plaintext encryption.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        def initialize(
          @cipher_text : String,
          @key_arn : String,
          @key_check_value : String
        )
        end
      end

      # Parameters that are required to perform reencryption operation.
      struct ReEncryptionAttributes
        include JSON::Serializable

        @[JSON::Field(key: "Dukpt")]
        getter dukpt : Types::DukptEncryptionAttributes?

        # Parameters that are required to encrypt data using symmetric keys.
        @[JSON::Field(key: "Symmetric")]
        getter symmetric : Types::SymmetricEncryptionAttributes?

        def initialize(
          @dukpt : Types::DukptEncryptionAttributes? = nil,
          @symmetric : Types::SymmetricEncryptionAttributes? = nil
        )
        end
      end

      # The request was denied due to an invalid resource error.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The resource that is missing.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        def initialize(
          @resource_id : String? = nil
        )
        end
      end

      # Parameters to derive session key for an Amex payment card.
      struct SessionKeyAmex
        include JSON::Serializable

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters to derive a session key for Authorization Response Cryptogram (ARQC) verification.
      struct SessionKeyDerivation
        include JSON::Serializable

        # Parameters to derive session key for an Amex payment card for ARQC verification.
        @[JSON::Field(key: "Amex")]
        getter amex : Types::SessionKeyAmex?

        # Parameters to derive session key for an Emv2000 payment card for ARQC verification.
        @[JSON::Field(key: "Emv2000")]
        getter emv2000 : Types::SessionKeyEmv2000?

        # Parameters to derive session key for an Emv common payment card for ARQC verification.
        @[JSON::Field(key: "EmvCommon")]
        getter emv_common : Types::SessionKeyEmvCommon?

        # Parameters to derive session key for a Mastercard payment card for ARQC verification.
        @[JSON::Field(key: "Mastercard")]
        getter mastercard : Types::SessionKeyMastercard?

        # Parameters to derive session key for a Visa payment cardfor ARQC verification.
        @[JSON::Field(key: "Visa")]
        getter visa : Types::SessionKeyVisa?

        def initialize(
          @amex : Types::SessionKeyAmex? = nil,
          @emv2000 : Types::SessionKeyEmv2000? = nil,
          @emv_common : Types::SessionKeyEmvCommon? = nil,
          @mastercard : Types::SessionKeyMastercard? = nil,
          @visa : Types::SessionKeyVisa? = nil
        )
        end
      end

      # Parameters to derive session key value using a MAC EMV algorithm.
      struct SessionKeyDerivationValue
        include JSON::Serializable

        # The cryptogram provided by the terminal during transaction processing.
        @[JSON::Field(key: "ApplicationCryptogram")]
        getter application_cryptogram : String?

        # The transaction counter that is provided by the terminal during transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String?

        def initialize(
          @application_cryptogram : String? = nil,
          @application_transaction_counter : String? = nil
        )
        end
      end

      # Parameters to derive session key for an Emv2000 payment card for ARQC verification.
      struct SessionKeyEmv2000
        include JSON::Serializable

        # The transaction counter that is provided by the terminal during transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @application_transaction_counter : String,
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters to derive session key for an Emv common payment card for ARQC verification.
      struct SessionKeyEmvCommon
        include JSON::Serializable

        # The transaction counter that is provided by the terminal during transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @application_transaction_counter : String,
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters to derive session key for Mastercard payment card for ARQC verification.
      struct SessionKeyMastercard
        include JSON::Serializable

        # The transaction counter that is provided by the terminal during transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # A random number generated by the issuer.
        @[JSON::Field(key: "UnpredictableNumber")]
        getter unpredictable_number : String

        def initialize(
          @application_transaction_counter : String,
          @pan_sequence_number : String,
          @primary_account_number : String,
          @unpredictable_number : String
        )
        end
      end

      # Parameters to derive session key for Visa payment card for ARQC verification.
      struct SessionKeyVisa
        include JSON::Serializable

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN).
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @pan_sequence_number : String,
          @primary_account_number : String
        )
        end
      end

      # Parameters requried to encrypt plaintext data using symmetric keys.
      struct SymmetricEncryptionAttributes
        include JSON::Serializable

        # The block cipher method to use for encryption.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # An input used to provide the intial state. If no value is provided, Amazon Web Services Payment
        # Cryptography defaults it to zero.
        @[JSON::Field(key: "InitializationVector")]
        getter initialization_vector : String?

        # The padding to be included with the data.
        @[JSON::Field(key: "PaddingType")]
        getter padding_type : String?

        def initialize(
          @mode : String,
          @initialization_vector : String? = nil,
          @padding_type : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct TranslateKeyMaterialInput
        include JSON::Serializable

        # Parameter information of the TR31WrappedKeyBlock containing the transaction key.
        @[JSON::Field(key: "IncomingKeyMaterial")]
        getter incoming_key_material : Types::IncomingKeyMaterial

        # Parameter information of the wrapping key used to wrap the transaction key in the outgoing
        # TR31WrappedKeyBlock.
        @[JSON::Field(key: "OutgoingKeyMaterial")]
        getter outgoing_key_material : Types::OutgoingKeyMaterial

        # The key check value (KCV) algorithm used for calculating the KCV of the derived key.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        def initialize(
          @incoming_key_material : Types::IncomingKeyMaterial,
          @outgoing_key_material : Types::OutgoingKeyMaterial,
          @key_check_value_algorithm : String? = nil
        )
        end
      end

      struct TranslateKeyMaterialOutput
        include JSON::Serializable

        # The outgoing KEK wrapped TR31WrappedKeyBlock.
        @[JSON::Field(key: "WrappedKey")]
        getter wrapped_key : Types::WrappedWorkingKey

        def initialize(
          @wrapped_key : Types::WrappedWorkingKey
        )
        end
      end

      struct TranslatePinDataInput
        include JSON::Serializable

        # The encrypted PIN block data that Amazon Web Services Payment Cryptography translates.
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # The keyARN of the encryption key under which incoming PIN block data is encrypted. This key type can
        # be PEK or BDK. For dynamic keys, it is the keyARN of KEK of the TR-31 wrapped PEK. For ECDH, it is
        # the keyARN of the asymmetric ECC key.
        @[JSON::Field(key: "IncomingKeyIdentifier")]
        getter incoming_key_identifier : String

        # The format of the incoming PIN block data for translation within Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "IncomingTranslationAttributes")]
        getter incoming_translation_attributes : Types::TranslationIsoFormats

        # The keyARN of the encryption key for encrypting outgoing PIN block data. This key type can be PEK or
        # BDK. For ECDH, it is the keyARN of the asymmetric ECC key.
        @[JSON::Field(key: "OutgoingKeyIdentifier")]
        getter outgoing_key_identifier : String

        # The format of the outgoing PIN block data after translation by Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "OutgoingTranslationAttributes")]
        getter outgoing_translation_attributes : Types::TranslationIsoFormats

        # The attributes and values to use for incoming AS2805 encryption key for PIN block translation.
        @[JSON::Field(key: "IncomingAs2805Attributes")]
        getter incoming_as2805_attributes : Types::As2805PekDerivationAttributes?

        # The attributes and values to use for incoming DUKPT encryption key for PIN block translation.
        @[JSON::Field(key: "IncomingDukptAttributes")]
        getter incoming_dukpt_attributes : Types::DukptDerivationAttributes?

        # The WrappedKeyBlock containing the encryption key under which incoming PIN block data is encrypted.
        @[JSON::Field(key: "IncomingWrappedKey")]
        getter incoming_wrapped_key : Types::WrappedKey?

        # The attributes and values to use for outgoing DUKPT encryption key after PIN block translation.
        @[JSON::Field(key: "OutgoingDukptAttributes")]
        getter outgoing_dukpt_attributes : Types::DukptDerivationAttributes?

        # The WrappedKeyBlock containing the encryption key for encrypting outgoing PIN block data.
        @[JSON::Field(key: "OutgoingWrappedKey")]
        getter outgoing_wrapped_key : Types::WrappedKey?

        def initialize(
          @encrypted_pin_block : String,
          @incoming_key_identifier : String,
          @incoming_translation_attributes : Types::TranslationIsoFormats,
          @outgoing_key_identifier : String,
          @outgoing_translation_attributes : Types::TranslationIsoFormats,
          @incoming_as2805_attributes : Types::As2805PekDerivationAttributes? = nil,
          @incoming_dukpt_attributes : Types::DukptDerivationAttributes? = nil,
          @incoming_wrapped_key : Types::WrappedKey? = nil,
          @outgoing_dukpt_attributes : Types::DukptDerivationAttributes? = nil,
          @outgoing_wrapped_key : Types::WrappedKey? = nil
        )
        end
      end

      struct TranslatePinDataOutput
        include JSON::Serializable

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses to encrypt
        # outgoing PIN block data after translation.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The outgoing encrypted PIN block data after translation.
        @[JSON::Field(key: "PinBlock")]
        getter pin_block : String

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @pin_block : String
        )
        end
      end

      # Parameters that are required for translation between ISO9564 PIN block formats 0,1,3,4.
      struct TranslationIsoFormats
        include JSON::Serializable

        # Parameters that are required for AS2805 PIN format 0 translation.
        @[JSON::Field(key: "As2805Format0")]
        getter as2805_format0 : Types::TranslationPinDataAs2805Format0?

        # Parameters that are required for ISO9564 PIN format 0 translation.
        @[JSON::Field(key: "IsoFormat0")]
        getter iso_format0 : Types::TranslationPinDataIsoFormat034?

        # Parameters that are required for ISO9564 PIN format 1 translation.
        @[JSON::Field(key: "IsoFormat1")]
        getter iso_format1 : Types::TranslationPinDataIsoFormat1?

        # Parameters that are required for ISO9564 PIN format 3 translation.
        @[JSON::Field(key: "IsoFormat3")]
        getter iso_format3 : Types::TranslationPinDataIsoFormat034?

        # Parameters that are required for ISO9564 PIN format 4 translation.
        @[JSON::Field(key: "IsoFormat4")]
        getter iso_format4 : Types::TranslationPinDataIsoFormat034?

        def initialize(
          @as2805_format0 : Types::TranslationPinDataAs2805Format0? = nil,
          @iso_format0 : Types::TranslationPinDataIsoFormat034? = nil,
          @iso_format1 : Types::TranslationPinDataIsoFormat1? = nil,
          @iso_format3 : Types::TranslationPinDataIsoFormat034? = nil,
          @iso_format4 : Types::TranslationPinDataIsoFormat034? = nil
        )
        end
      end

      # Parameters that are required for translation between AS2805 PIN format 0 translation.
      struct TranslationPinDataAs2805Format0
        include JSON::Serializable

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @primary_account_number : String
        )
        end
      end

      # Parameters that are required for translation between ISO9564 PIN format 0,3,4 translation.
      struct TranslationPinDataIsoFormat034
        include JSON::Serializable

        # The Primary Account Number (PAN) of the cardholder. A PAN is a unique identifier for a payment
        # credit or debit card and associates the card to a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        def initialize(
          @primary_account_number : String
        )
        end
      end

      # Parameters that are required for ISO9564 PIN format 1 translation.
      struct TranslationPinDataIsoFormat1
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to an invalid request error.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The request was denied due to an invalid request error.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The request was denied due to an invalid request error.
      struct ValidationExceptionField
        include JSON::Serializable

        # The request was denied due to an invalid request error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The request was denied due to an invalid request error.
        @[JSON::Field(key: "path")]
        getter path : String

        def initialize(
          @message : String,
          @path : String
        )
        end
      end

      # This request failed verification.
      struct VerificationFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason for the exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        def initialize(
          @message : String,
          @reason : String
        )
        end
      end

      struct VerifyAuthRequestCryptogramInput
        include JSON::Serializable

        # The auth request cryptogram imported into Amazon Web Services Payment Cryptography for ARQC
        # verification using a major encryption key and transaction data.
        @[JSON::Field(key: "AuthRequestCryptogram")]
        getter auth_request_cryptogram : String

        # The keyARN of the major encryption key that Amazon Web Services Payment Cryptography uses for ARQC
        # verification.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The method to use when deriving the major encryption key for ARQC verification within Amazon Web
        # Services Payment Cryptography. The same key derivation mode was used for ARQC generation outside of
        # Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # The attributes and values to use for deriving a session key for ARQC verification within Amazon Web
        # Services Payment Cryptography. The same attributes were used for ARQC generation outside of Amazon
        # Web Services Payment Cryptography.
        @[JSON::Field(key: "SessionKeyDerivationAttributes")]
        getter session_key_derivation_attributes : Types::SessionKeyDerivation

        # The transaction data that Amazon Web Services Payment Cryptography uses for ARQC verification. The
        # same transaction is used for ARQC generation outside of Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "TransactionData")]
        getter transaction_data : String

        # The attributes and values for auth request cryptogram verification. These parameters are required in
        # case using ARPC Method 1 or Method 2 for ARQC verification.
        @[JSON::Field(key: "AuthResponseAttributes")]
        getter auth_response_attributes : Types::CryptogramAuthResponse?

        def initialize(
          @auth_request_cryptogram : String,
          @key_identifier : String,
          @major_key_derivation_mode : String,
          @session_key_derivation_attributes : Types::SessionKeyDerivation,
          @transaction_data : String,
          @auth_response_attributes : Types::CryptogramAuthResponse? = nil
        )
        end
      end

      struct VerifyAuthRequestCryptogramOutput
        include JSON::Serializable

        # The keyARN of the major encryption key that Amazon Web Services Payment Cryptography uses for ARQC
        # verification.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The result for ARQC verification or ARPC generation within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "AuthResponseValue")]
        getter auth_response_value : String?

        def initialize(
          @key_arn : String,
          @key_check_value : String,
          @auth_response_value : String? = nil
        )
        end
      end

      struct VerifyCardValidationDataInput
        include JSON::Serializable

        # The keyARN of the CVK encryption key that Amazon Web Services Payment Cryptography uses to verify
        # card data.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card that
        # associates the card with a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The CVV or CSC value for use for card data verification within Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "ValidationData")]
        getter validation_data : String

        # The algorithm to use for verification of card data within Amazon Web Services Payment Cryptography.
        @[JSON::Field(key: "VerificationAttributes")]
        getter verification_attributes : Types::CardVerificationAttributes

        def initialize(
          @key_identifier : String,
          @primary_account_number : String,
          @validation_data : String,
          @verification_attributes : Types::CardVerificationAttributes
        )
        end
      end

      struct VerifyCardValidationDataOutput
        include JSON::Serializable

        # The keyARN of the CVK encryption key that Amazon Web Services Payment Cryptography uses to verify
        # CVV or CSC.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        def initialize(
          @key_arn : String,
          @key_check_value : String
        )
        end
      end

      struct VerifyMacInput
        include JSON::Serializable

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses to verify MAC
        # data.
        @[JSON::Field(key: "KeyIdentifier")]
        getter key_identifier : String

        # The MAC being verified.
        @[JSON::Field(key: "Mac")]
        getter mac : String

        # The data on for which MAC is under verification. This value must be hexBinary.
        @[JSON::Field(key: "MessageData")]
        getter message_data : String

        # The attributes and data values to use for MAC verification within Amazon Web Services Payment
        # Cryptography.
        @[JSON::Field(key: "VerificationAttributes")]
        getter verification_attributes : Types::MacAttributes

        # The length of the MAC.
        @[JSON::Field(key: "MacLength")]
        getter mac_length : Int32?

        def initialize(
          @key_identifier : String,
          @mac : String,
          @message_data : String,
          @verification_attributes : Types::MacAttributes,
          @mac_length : Int32? = nil
        )
        end
      end

      struct VerifyMacOutput
        include JSON::Serializable

        # The keyARN of the encryption key that Amazon Web Services Payment Cryptography uses for MAC
        # verification.
        @[JSON::Field(key: "KeyArn")]
        getter key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        def initialize(
          @key_arn : String,
          @key_check_value : String
        )
        end
      end

      struct VerifyPinDataInput
        include JSON::Serializable

        # The encrypted PIN block data that Amazon Web Services Payment Cryptography verifies.
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # The keyARN of the encryption key under which the PIN block data is encrypted. This key type can be
        # PEK or BDK.
        @[JSON::Field(key: "EncryptionKeyIdentifier")]
        getter encryption_key_identifier : String

        # The PIN encoding format for pin data generation as specified in ISO 9564. Amazon Web Services
        # Payment Cryptography supports ISO_Format_0 and ISO_Format_3 . The ISO_Format_0 PIN block format is
        # equivalent to the ANSI X9.8, VISA-1, and ECI-1 PIN block formats. It is similar to a VISA-4 PIN
        # block format. It supports a PIN from 4 to 12 digits in length. The ISO_Format_3 PIN block format is
        # the same as ISO_Format_0 except that the fill digits are random values from 10 to 15.
        @[JSON::Field(key: "PinBlockFormat")]
        getter pin_block_format : String

        # The attributes and values for PIN data verification.
        @[JSON::Field(key: "VerificationAttributes")]
        getter verification_attributes : Types::PinVerificationAttributes

        # The keyARN of the PIN verification key.
        @[JSON::Field(key: "VerificationKeyIdentifier")]
        getter verification_key_identifier : String

        # The attributes and values for the DUKPT encrypted PIN block data.
        @[JSON::Field(key: "DukptAttributes")]
        getter dukpt_attributes : Types::DukptAttributes?

        @[JSON::Field(key: "EncryptionWrappedKey")]
        getter encryption_wrapped_key : Types::WrappedKey?

        # The length of PIN being verified.
        @[JSON::Field(key: "PinDataLength")]
        getter pin_data_length : Int32?

        # The Primary Account Number (PAN), a unique identifier for a payment credit or debit card that
        # associates the card with a specific account holder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String?

        def initialize(
          @encrypted_pin_block : String,
          @encryption_key_identifier : String,
          @pin_block_format : String,
          @verification_attributes : Types::PinVerificationAttributes,
          @verification_key_identifier : String,
          @dukpt_attributes : Types::DukptAttributes? = nil,
          @encryption_wrapped_key : Types::WrappedKey? = nil,
          @pin_data_length : Int32? = nil,
          @primary_account_number : String? = nil
        )
        end
      end

      struct VerifyPinDataOutput
        include JSON::Serializable

        # The keyARN of the PEK that Amazon Web Services Payment Cryptography uses for encrypted pin block
        # generation.
        @[JSON::Field(key: "EncryptionKeyArn")]
        getter encryption_key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "EncryptionKeyCheckValue")]
        getter encryption_key_check_value : String

        # The keyARN of the PIN encryption key that Amazon Web Services Payment Cryptography uses for PIN or
        # PIN Offset verification.
        @[JSON::Field(key: "VerificationKeyArn")]
        getter verification_key_arn : String

        # The key check value (KCV) of the encryption key. The KCV is used to check if all parties holding a
        # given key have the same key or to detect that a key has changed. Amazon Web Services Payment
        # Cryptography computes the KCV according to the CMAC specification.
        @[JSON::Field(key: "VerificationKeyCheckValue")]
        getter verification_key_check_value : String

        def initialize(
          @encryption_key_arn : String,
          @encryption_key_check_value : String,
          @verification_key_arn : String,
          @verification_key_check_value : String
        )
        end
      end

      # The attributes values used for Amex and Visa derivation methods.
      struct VisaAmexDerivationOutputs
        include JSON::Serializable

        # The keyArn of the issuer master key for cryptogram (IMK-AC) used by the operation.
        @[JSON::Field(key: "AuthorizationRequestKeyArn")]
        getter authorization_request_key_arn : String

        # The key check value (KCV) of the issuer master key for cryptogram (IMK-AC) used by the operation.
        @[JSON::Field(key: "AuthorizationRequestKeyCheckValue")]
        getter authorization_request_key_check_value : String

        # The keyArn of the current PIN PEK.
        @[JSON::Field(key: "CurrentPinPekArn")]
        getter current_pin_pek_arn : String?

        # The key check value (KCV) of the current PIN PEK.
        @[JSON::Field(key: "CurrentPinPekKeyCheckValue")]
        getter current_pin_pek_key_check_value : String?

        def initialize(
          @authorization_request_key_arn : String,
          @authorization_request_key_check_value : String,
          @current_pin_pek_arn : String? = nil,
          @current_pin_pek_key_check_value : String? = nil
        )
        end
      end

      # Parameters to derive the confidentiality and integrity keys for a Visa payment card.
      struct VisaAttributes
        include JSON::Serializable

        # The transaction counter of the current transaction that is provided by the terminal during
        # transaction processing.
        @[JSON::Field(key: "ApplicationTransactionCounter")]
        getter application_transaction_counter : String

        # The keyArn of the issuer master key for cryptogram (IMK-AC) for the payment card.
        @[JSON::Field(key: "AuthorizationRequestKeyIdentifier")]
        getter authorization_request_key_identifier : String

        # The method to use when deriving the master key for the payment card.
        @[JSON::Field(key: "MajorKeyDerivationMode")]
        getter major_key_derivation_mode : String

        # A number that identifies and differentiates payment cards with the same Primary Account Number
        # (PAN). Typically 00 is used, if no value is provided by the terminal.
        @[JSON::Field(key: "PanSequenceNumber")]
        getter pan_sequence_number : String

        # The Primary Account Number (PAN) of the cardholder.
        @[JSON::Field(key: "PrimaryAccountNumber")]
        getter primary_account_number : String

        # The encrypted pinblock of the old pin stored on the chip card.
        @[JSON::Field(key: "CurrentPinAttributes")]
        getter current_pin_attributes : Types::CurrentPinAttributes?

        def initialize(
          @application_transaction_counter : String,
          @authorization_request_key_identifier : String,
          @major_key_derivation_mode : String,
          @pan_sequence_number : String,
          @primary_account_number : String,
          @current_pin_attributes : Types::CurrentPinAttributes? = nil
        )
        end
      end

      # Parameters that are required to generate or verify Visa PIN.
      struct VisaPin
        include JSON::Serializable

        # The value for PIN verification index. It is used in the Visa PIN algorithm to calculate the PVV (PIN
        # Verification Value).
        @[JSON::Field(key: "PinVerificationKeyIndex")]
        getter pin_verification_key_index : Int32

        def initialize(
          @pin_verification_key_index : Int32
        )
        end
      end

      # Parameters that are required to generate or verify Visa PIN.
      struct VisaPinVerification
        include JSON::Serializable

        # The value for PIN verification index. It is used in the Visa PIN algorithm to calculate the PVV (PIN
        # Verification Value).
        @[JSON::Field(key: "PinVerificationKeyIndex")]
        getter pin_verification_key_index : Int32

        # Parameters that are required to generate or verify Visa PVV (PIN Verification Value).
        @[JSON::Field(key: "VerificationValue")]
        getter verification_value : String

        def initialize(
          @pin_verification_key_index : Int32,
          @verification_value : String
        )
        end
      end

      # Parameters that are required to generate or verify Visa PVV (PIN Verification Value).
      struct VisaPinVerificationValue
        include JSON::Serializable

        # The encrypted PIN block data to verify.
        @[JSON::Field(key: "EncryptedPinBlock")]
        getter encrypted_pin_block : String

        # The value for PIN verification index. It is used in the Visa PIN algorithm to calculate the PVV (PIN
        # Verification Value).
        @[JSON::Field(key: "PinVerificationKeyIndex")]
        getter pin_verification_key_index : Int32

        def initialize(
          @encrypted_pin_block : String,
          @pin_verification_key_index : Int32
        )
        end
      end

      # Parameter information of a WrappedKeyBlock for encryption key exchange.
      struct WrappedKey
        include JSON::Serializable

        # Parameter information of a WrappedKeyBlock for encryption key exchange.
        @[JSON::Field(key: "WrappedKeyMaterial")]
        getter wrapped_key_material : Types::WrappedKeyMaterial

        # The algorithm that Amazon Web Services Payment Cryptography uses to calculate the key check value
        # (KCV). It is used to validate the key integrity. For TDES keys, the KCV is computed by encrypting 8
        # bytes, each with value of zero, with the key to be checked and retaining the 3 highest order bytes
        # of the encrypted result. For AES keys, the KCV is computed using a CMAC algorithm where the input
        # data is 16 bytes of zero and retaining the 3 highest order bytes of the encrypted result.
        @[JSON::Field(key: "KeyCheckValueAlgorithm")]
        getter key_check_value_algorithm : String?

        def initialize(
          @wrapped_key_material : Types::WrappedKeyMaterial,
          @key_check_value_algorithm : String? = nil
        )
        end
      end

      # Parameter information of a WrappedKeyBlock for encryption key exchange.
      struct WrappedKeyMaterial
        include JSON::Serializable

        # The parameter information for deriving a ECDH shared key.
        @[JSON::Field(key: "DiffieHellmanSymmetricKey")]
        getter diffie_hellman_symmetric_key : Types::EcdhDerivationAttributes?

        # The TR-31 wrapped key block.
        @[JSON::Field(key: "Tr31KeyBlock")]
        getter tr31_key_block : String?

        def initialize(
          @diffie_hellman_symmetric_key : Types::EcdhDerivationAttributes? = nil,
          @tr31_key_block : String? = nil
        )
        end
      end

      # The parameter information of the outgoing wrapped key block.
      struct WrappedWorkingKey
        include JSON::Serializable

        # The key check value (KCV) of the key contained within the outgoing TR31WrappedKeyBlock. The KCV is
        # used to check if all parties holding a given key have the same key or to detect that a key has
        # changed. For more information on KCV, see KCV in the Amazon Web Services Payment Cryptography User
        # Guide .
        @[JSON::Field(key: "KeyCheckValue")]
        getter key_check_value : String

        # The wrapped key block of the outgoing transaction key.
        @[JSON::Field(key: "WrappedKeyMaterial")]
        getter wrapped_key_material : String

        # The key block format of the wrapped key.
        @[JSON::Field(key: "WrappedKeyMaterialFormat")]
        getter wrapped_key_material_format : String

        def initialize(
          @key_check_value : String,
          @wrapped_key_material : String,
          @wrapped_key_material_format : String
        )
        end
      end
    end
  end
end
