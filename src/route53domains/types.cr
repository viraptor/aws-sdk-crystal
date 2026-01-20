require "json"
require "time"

module Aws
  module Route53Domains
    module Types

      # The AcceptDomainTransferFromAnotherAwsAccount request includes the following elements.

      struct AcceptDomainTransferFromAnotherAwsAccountRequest
        include JSON::Serializable

        # The name of the domain that was specified when another Amazon Web Services account submitted a
        # TransferDomainToAnotherAwsAccount request.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The password that was returned by the TransferDomainToAnotherAwsAccount request.

        @[JSON::Field(key: "Password")]
        getter password : String

        def initialize(
          @domain_name : String,
          @password : String
        )
        end
      end

      # The AcceptDomainTransferFromAnotherAwsAccount response includes the following element.

      struct AcceptDomainTransferFromAnotherAwsAccountResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct AssociateDelegationSignerToDomainRequest
        include JSON::Serializable

        # The name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The information about a key, including the algorithm, public key-value, and flags.

        @[JSON::Field(key: "SigningAttributes")]
        getter signing_attributes : Types::DnssecSigningAttributes

        def initialize(
          @domain_name : String,
          @signing_attributes : Types::DnssecSigningAttributes
        )
        end
      end


      struct AssociateDelegationSignerToDomainResponse
        include JSON::Serializable

        # The identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # Information for one billing record.

      struct BillingRecord
        include JSON::Serializable

        # The date that the operation was billed, in Unix format.

        @[JSON::Field(key: "BillDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter bill_date : Time?

        # The name of the domain that the billing record applies to. If the domain name contains characters
        # other than a-z, 0-9, and - (hyphen), such as an internationalized domain name, then this value is in
        # Punycode. For more information, see DNS Domain Name Format in the Amazon Route 53 Developer Guide .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Deprecated property. This field is retained in report structure for backwards compatibility, but
        # will appear blank.

        @[JSON::Field(key: "InvoiceId")]
        getter invoice_id : String?

        # The operation that you were charged for.

        @[JSON::Field(key: "Operation")]
        getter operation : String?

        # The price that you were charged for the operation, in US dollars. Example value: 12.0

        @[JSON::Field(key: "Price")]
        getter price : Float64?

        def initialize(
          @bill_date : Time? = nil,
          @domain_name : String? = nil,
          @invoice_id : String? = nil,
          @operation : String? = nil,
          @price : Float64? = nil
        )
        end
      end

      # The CancelDomainTransferToAnotherAwsAccount request includes the following element.

      struct CancelDomainTransferToAnotherAwsAccountRequest
        include JSON::Serializable

        # The name of the domain for which you want to cancel the transfer to another Amazon Web Services
        # account.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The CancelDomainTransferToAnotherAwsAccount response includes the following element.

      struct CancelDomainTransferToAnotherAwsAccountResponse
        include JSON::Serializable

        # The identifier that TransferDomainToAnotherAwsAccount returned to track the progress of the request.
        # Because the transfer request was canceled, the value is no longer valid, and you can't use
        # GetOperationDetail to query the operation status.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The CheckDomainAvailability request contains the following elements.

      struct CheckDomainAvailabilityRequest
        include JSON::Serializable

        # The name of the domain that you want to get availability for. The top-level domain (TLD), such as
        # .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see Domains that You Can
        # Register with Amazon Route 53 in the Amazon Route 53 Developer Guide . The domain name can contain
        # only the following characters: Letters a through z. Domain names are not case sensitive. Numbers 0
        # through 9. Hyphen (-). You can't specify a hyphen at the beginning or end of a label. Period (.) to
        # separate the labels in the name, such as the . in example.com . Internationalized domain names are
        # not supported for some top-level domains. To determine whether the TLD that you want to use supports
        # internationalized domain names, see Domains that You Can Register with Amazon Route 53 . For more
        # information, see Formatting Internationalized Domain Names .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Reserved for future use.

        @[JSON::Field(key: "IdnLangCode")]
        getter idn_lang_code : String?

        def initialize(
          @domain_name : String,
          @idn_lang_code : String? = nil
        )
        end
      end

      # The CheckDomainAvailability response includes the following elements.

      struct CheckDomainAvailabilityResponse
        include JSON::Serializable

        # Whether the domain name is available for registering. You can register only domains designated as
        # AVAILABLE . Valid values: AVAILABLE The domain name is available. AVAILABLE_RESERVED The domain name
        # is reserved under specific conditions. AVAILABLE_PREORDER The domain name is available and can be
        # preordered. DONT_KNOW The TLD registry didn't reply with a definitive answer about whether the
        # domain name is available. Route 53 can return this response for a variety of reasons, for example,
        # the registry is performing maintenance. Try again later. INVALID_NAME_FOR_TLD The TLD isn't valid.
        # For example, it can contain characters that aren't allowed. PENDING The TLD registry didn't return a
        # response in the expected amount of time. When the response is delayed, it usually takes just a few
        # extra seconds. You can resubmit the request immediately. RESERVED The domain name has been reserved
        # for another person or organization. UNAVAILABLE The domain name is not available.
        # UNAVAILABLE_PREMIUM The domain name is not available. UNAVAILABLE_RESTRICTED The domain name is
        # forbidden.

        @[JSON::Field(key: "Availability")]
        getter availability : String?

        def initialize(
          @availability : String? = nil
        )
        end
      end

      # The CheckDomainTransferability request contains the following elements.

      struct CheckDomainTransferabilityRequest
        include JSON::Serializable

        # The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as
        # .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see Domains that You Can
        # Register with Amazon Route 53 in the Amazon Route 53 Developer Guide . The domain name can contain
        # only the following characters: Letters a through z. Domain names are not case sensitive. Numbers 0
        # through 9. Hyphen (-). You can't specify a hyphen at the beginning or end of a label. Period (.) to
        # separate the labels in the name, such as the . in example.com .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # If the registrar for the top-level domain (TLD) requires an authorization code to transfer the
        # domain, the code that you got from the current registrar for the domain.

        @[JSON::Field(key: "AuthCode")]
        getter auth_code : String?

        def initialize(
          @domain_name : String,
          @auth_code : String? = nil
        )
        end
      end

      # The CheckDomainTransferability response includes the following elements.

      struct CheckDomainTransferabilityResponse
        include JSON::Serializable

        # Provides an explanation for when a domain can't be transferred.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A complex type that contains information about whether the specified domain can be transferred to
        # Route 53.

        @[JSON::Field(key: "Transferability")]
        getter transferability : Types::DomainTransferability?

        def initialize(
          @message : String? = nil,
          @transferability : Types::DomainTransferability? = nil
        )
        end
      end

      # Customer's consent for the owner change request.

      struct Consent
        include JSON::Serializable

        # Currency for the MaxPrice .

        @[JSON::Field(key: "Currency")]
        getter currency : String

        # Maximum amount the customer agreed to accept.

        @[JSON::Field(key: "MaxPrice")]
        getter max_price : Float64

        def initialize(
          @currency : String,
          @max_price : Float64
        )
        end
      end

      # ContactDetail includes the following elements.

      struct ContactDetail
        include JSON::Serializable

        # First line of the contact's address.

        @[JSON::Field(key: "AddressLine1")]
        getter address_line1 : String?

        # Second line of contact's address, if any.

        @[JSON::Field(key: "AddressLine2")]
        getter address_line2 : String?

        # The city of the contact's address.

        @[JSON::Field(key: "City")]
        getter city : String?

        # Indicates whether the contact is a person, company, association, or public organization. Note the
        # following: If you specify a value other than PERSON , you must also specify a value for
        # OrganizationName . For some TLDs, the privacy protection available depends on the value that you
        # specify for Contact Type . For the privacy protection settings for your TLD, see Domains that You
        # Can Register with Amazon Route 53 in the Amazon Route 53 Developer Guide For .es domains, the value
        # of ContactType must be PERSON for all three contacts.

        @[JSON::Field(key: "ContactType")]
        getter contact_type : String?

        # Code for the country of the contact's address.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String?

        # Email address of the contact.

        @[JSON::Field(key: "Email")]
        getter email : String?

        # A list of name-value pairs for parameters required by certain top-level domains.

        @[JSON::Field(key: "ExtraParams")]
        getter extra_params : Array(Types::ExtraParam)?

        # Fax number of the contact. Constraints: Phone number must be specified in the format "+[country
        # dialing code].[number including any area code]". For example, a US phone number might appear as
        # "+1.1234567890" .

        @[JSON::Field(key: "Fax")]
        getter fax : String?

        # First name of contact.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # Last name of contact.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # Name of the organization for contact types other than PERSON .

        @[JSON::Field(key: "OrganizationName")]
        getter organization_name : String?

        # The phone number of the contact. Constraints: Phone number must be specified in the format
        # "+[country dialing code].[number including any area code&gt;]". For example, a US phone number might
        # appear as "+1.1234567890" .

        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The state or province of the contact's city.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The zip or postal code of the contact's address.

        @[JSON::Field(key: "ZipCode")]
        getter zip_code : String?

        def initialize(
          @address_line1 : String? = nil,
          @address_line2 : String? = nil,
          @city : String? = nil,
          @contact_type : String? = nil,
          @country_code : String? = nil,
          @email : String? = nil,
          @extra_params : Array(Types::ExtraParam)? = nil,
          @fax : String? = nil,
          @first_name : String? = nil,
          @last_name : String? = nil,
          @organization_name : String? = nil,
          @phone_number : String? = nil,
          @state : String? = nil,
          @zip_code : String? = nil
        )
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # Name of the domain to be deleted.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DeleteDomainResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The DeleteTagsForDomainRequest includes the following elements.

      struct DeleteTagsForDomainRequest
        include JSON::Serializable

        # The domain for which you want to delete one or more tags.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of tag keys to delete.

        @[JSON::Field(key: "TagsToDelete")]
        getter tags_to_delete : Array(String)

        def initialize(
          @domain_name : String,
          @tags_to_delete : Array(String)
        )
        end
      end


      struct DeleteTagsForDomainResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableDomainAutoRenewRequest
        include JSON::Serializable

        # The name of the domain that you want to disable automatic renewal for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DisableDomainAutoRenewResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The DisableDomainTransferLock request includes the following element.

      struct DisableDomainTransferLockRequest
        include JSON::Serializable

        # The name of the domain that you want to remove the transfer lock for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The DisableDomainTransferLock response includes the following element.

      struct DisableDomainTransferLockResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct DisassociateDelegationSignerFromDomainRequest
        include JSON::Serializable

        # Name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # An internal identification number assigned to each DS record after it’s created. You can retrieve it
        # as part of DNSSEC information returned by GetDomainDetail .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @domain_name : String,
          @id : String
        )
        end
      end


      struct DisassociateDelegationSignerFromDomainResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # Information about the DNSSEC key. You get this from your DNS provider and then give it to Route 53
      # (by using AssociateDelegationSignerToDomain ) to pass it to the registry to establish the chain of
      # trust.

      struct DnssecKey
        include JSON::Serializable

        # The number of the public key’s cryptographic algorithm according to an IANA assignment. If Route 53
        # is your DNS service, set this to 13. For more information about enabling DNSSEC signing, see
        # Enabling DNSSEC signing and establishing a chain of trust .

        @[JSON::Field(key: "Algorithm")]
        getter algorithm : Int32?

        # The delegation signer digest. Digest is calculated from the public key provided using specified
        # digest algorithm and this digest is the actual value returned from the registry nameservers as the
        # value of DS records.

        @[JSON::Field(key: "Digest")]
        getter digest : String?

        # The number of the DS digest algorithm according to an IANA assignment. For more information, see
        # IANA for DNSSEC Delegation Signer (DS) Resource Record (RR) Type Digest Algorithms.

        @[JSON::Field(key: "DigestType")]
        getter digest_type : Int32?

        # Defines the type of key. It can be either a KSK (key-signing-key, value 257) or ZSK
        # (zone-signing-key, value 256). Using KSK is always encouraged. Only use ZSK if your DNS provider
        # isn't Route 53 and you don’t have KSK available. If you have KSK and ZSK keys, always use KSK to
        # create a delegations signer (DS) record. If you have ZSK keys only – use ZSK to create a DS record.

        @[JSON::Field(key: "Flags")]
        getter flags : Int32?

        # An ID assigned to each DS record created by AssociateDelegationSignerToDomain .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A numeric identification of the DNSKEY record referred to by this DS record.

        @[JSON::Field(key: "KeyTag")]
        getter key_tag : Int32?

        # The base64-encoded public key part of the key pair that is passed to the registry .

        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        def initialize(
          @algorithm : Int32? = nil,
          @digest : String? = nil,
          @digest_type : Int32? = nil,
          @flags : Int32? = nil,
          @id : String? = nil,
          @key_tag : Int32? = nil,
          @public_key : String? = nil
        )
        end
      end

      # This error is returned if you call AssociateDelegationSignerToDomain when the specified domain has
      # reached the maximum number of DS records. You can't add any additional DS records unless you delete
      # an existing one first.

      struct DnssecLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a delegation signer (DS) record that was created in the registry by
      # AssociateDelegationSignerToDomain .

      struct DnssecSigningAttributes
        include JSON::Serializable

        # Algorithm which was used to generate the digest from the public key.

        @[JSON::Field(key: "Algorithm")]
        getter algorithm : Int32?

        # Defines the type of key. It can be either a KSK (key-signing-key, value 257) or ZSK
        # (zone-signing-key, value 256). Using KSK is always encouraged. Only use ZSK if your DNS provider
        # isn't Route 53 and you don’t have KSK available. If you have KSK and ZSK keys, always use KSK to
        # create a delegations signer (DS) record. If you have ZSK keys only – use ZSK to create a DS record.

        @[JSON::Field(key: "Flags")]
        getter flags : Int32?

        # The base64-encoded public key part of the key pair that is passed to the registry.

        @[JSON::Field(key: "PublicKey")]
        getter public_key : String?

        def initialize(
          @algorithm : Int32? = nil,
          @flags : Int32? = nil,
          @public_key : String? = nil
        )
        end
      end

      # The number of domains has exceeded the allowed threshold for the account.

      struct DomainLimitExceeded
        include JSON::Serializable

        # The number of domains has exceeded the allowed threshold for the account.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the domain price associated with a TLD.

      struct DomainPrice
        include JSON::Serializable

        # The price for changing domain ownership.

        @[JSON::Field(key: "ChangeOwnershipPrice")]
        getter change_ownership_price : Types::PriceWithCurrency?

        # The name of the TLD for which the prices apply.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The price for domain registration with Route 53.

        @[JSON::Field(key: "RegistrationPrice")]
        getter registration_price : Types::PriceWithCurrency?

        # The price for renewing domain registration with Route 53.

        @[JSON::Field(key: "RenewalPrice")]
        getter renewal_price : Types::PriceWithCurrency?

        # The price for restoring the domain with Route 53.

        @[JSON::Field(key: "RestorationPrice")]
        getter restoration_price : Types::PriceWithCurrency?

        # The price for transferring the domain registration to Route 53.

        @[JSON::Field(key: "TransferPrice")]
        getter transfer_price : Types::PriceWithCurrency?

        def initialize(
          @change_ownership_price : Types::PriceWithCurrency? = nil,
          @name : String? = nil,
          @registration_price : Types::PriceWithCurrency? = nil,
          @renewal_price : Types::PriceWithCurrency? = nil,
          @restoration_price : Types::PriceWithCurrency? = nil,
          @transfer_price : Types::PriceWithCurrency? = nil
        )
        end
      end

      # Information about one suggested domain name.

      struct DomainSuggestion
        include JSON::Serializable

        # Whether the domain name is available for registering. You can register only the domains that are
        # designated as AVAILABLE . Valid values: AVAILABLE The domain name is available. AVAILABLE_RESERVED
        # The domain name is reserved under specific conditions. AVAILABLE_PREORDER The domain name is
        # available and can be preordered. DONT_KNOW The TLD registry didn't reply with a definitive answer
        # about whether the domain name is available. Route 53 can return this response for a variety of
        # reasons, for example, the registry is performing maintenance. Try again later. PENDING The TLD
        # registry didn't return a response in the expected amount of time. When the response is delayed, it
        # usually takes just a few extra seconds. You can resubmit the request immediately. RESERVED The
        # domain name has been reserved for another person or organization. UNAVAILABLE The domain name is not
        # available. UNAVAILABLE_PREMIUM The domain name is not available. UNAVAILABLE_RESTRICTED The domain
        # name is forbidden.

        @[JSON::Field(key: "Availability")]
        getter availability : String?

        # A suggested domain name.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        def initialize(
          @availability : String? = nil,
          @domain_name : String? = nil
        )
        end
      end

      # Summary information about one domain.

      struct DomainSummary
        include JSON::Serializable

        # Indicates whether the domain is automatically renewed upon expiration.

        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : Bool?

        # The name of the domain that the summary information applies to.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Expiration date of the domain in Unix time format and Coordinated Universal Time (UTC).

        @[JSON::Field(key: "Expiry", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry : Time?

        # Indicates whether a domain is locked from unauthorized transfer to another party.

        @[JSON::Field(key: "TransferLock")]
        getter transfer_lock : Bool?

        def initialize(
          @auto_renew : Bool? = nil,
          @domain_name : String? = nil,
          @expiry : Time? = nil,
          @transfer_lock : Bool? = nil
        )
        end
      end

      # A complex type that contains information about whether the specified domain can be transferred to
      # Route 53.

      struct DomainTransferability
        include JSON::Serializable


        @[JSON::Field(key: "Transferable")]
        getter transferable : String?

        def initialize(
          @transferable : String? = nil
        )
        end
      end

      # The request is already in progress for the domain.

      struct DuplicateRequest
        include JSON::Serializable

        # The request is already in progress for the domain.

        @[JSON::Field(key: "message")]
        getter message : String?

        # ID of the request operation.

        @[JSON::Field(key: "requestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct EnableDomainAutoRenewRequest
        include JSON::Serializable

        # The name of the domain that you want to enable automatic renewal for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct EnableDomainAutoRenewResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A request to set the transfer lock for the specified domain.

      struct EnableDomainTransferLockRequest
        include JSON::Serializable

        # The name of the domain that you want to set the transfer lock for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The EnableDomainTransferLock response includes the following elements.

      struct EnableDomainTransferLockResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To use this ID to query the operation status,
        # use GetOperationDetail.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # ExtraParam includes the following elements.

      struct ExtraParam
        include JSON::Serializable

        # The name of an additional parameter that is required by a top-level domain. Here are the top-level
        # domains that require additional parameters and the names of the parameters that they require:
        # .com.au and .net.au AU_ID_NUMBER AU_ID_TYPE Valid values include the following: ABN (Australian
        # business number) ACN (Australian company number) TM (Trademark number) .ca BRAND_NUMBER
        # CA_BUSINESS_ENTITY_TYPE Valid values include the following: BANK (Bank) COMMERCIAL_COMPANY
        # (Commercial company) COMPANY (Company) COOPERATION (Cooperation) COOPERATIVE (Cooperative) COOPRIX
        # (Cooprix) CORP (Corporation) CREDIT_UNION (Credit union) FOMIA (Federation of mutual insurance
        # associations) INC (Incorporated) LTD (Limited) LTEE (Limitée) LLC (Limited liability corporation)
        # LLP (Limited liability partnership) LTE (Lte.) MBA (Mutual benefit association) MIC (Mutual
        # insurance company) NFP (Not-for-profit corporation) SA (S.A.) SAVINGS_COMPANY (Savings company)
        # SAVINGS_UNION (Savings union) SARL (Société à responsabilité limitée) TRUST (Trust) ULC (Unlimited
        # liability corporation) CA_LEGAL_TYPE When ContactType is PERSON , valid values include the
        # following: ABO (Aboriginal Peoples indigenous to Canada) CCT (Canadian citizen) LGR (Legal
        # Representative of a Canadian Citizen or Permanent Resident) RES (Permanent resident of Canada) When
        # ContactType is a value other than PERSON , valid values include the following: ASS (Canadian
        # unincorporated association) CCO (Canadian corporation) EDU (Canadian educational institution) GOV
        # (Government or government entity in Canada) HOP (Canadian Hospital) INB (Indian Band recognized by
        # the Indian Act of Canada) LAM (Canadian Library, Archive, or Museum) MAJ (Her/His Majesty the
        # Queen/King) OMK (Official mark registered in Canada) PLT (Canadian Political Party) PRT (Partnership
        # Registered in Canada) TDM (Trademark registered in Canada) TRD (Canadian Trade Union) TRS (Trust
        # established in Canada) .es ES_IDENTIFICATION The value of ES_IDENTIFICATION depends on the following
        # values: The value of ES_LEGAL_FORM The value of ES_IDENTIFICATION_TYPE If ES_LEGAL_FORM is any value
        # other than INDIVIDUAL : Specify 1 letter + 8 numbers (CIF [Certificado de Identificación Fiscal])
        # Example: B12345678 If ES_LEGAL_FORM is INDIVIDUAL , the value that you specify for ES_IDENTIFICATION
        # depends on the value of ES_IDENTIFICATION_TYPE : If ES_IDENTIFICATION_TYPE is DNI_AND_NIF (for
        # Spanish contacts): Specify 8 numbers + 1 letter (DNI [Documento Nacional de Identidad], NIF [Número
        # de Identificación Fiscal]) Example: 12345678M If ES_IDENTIFICATION_TYPE is NIE (for foreigners with
        # legal residence): Specify 1 letter + 7 numbers + 1 letter ( NIE [Número de Identidad de Extranjero])
        # Example: Y1234567X If ES_IDENTIFICATION_TYPE is OTHER (for contacts outside of Spain): Specify a
        # passport number, drivers license number, or national identity card number ES_IDENTIFICATION_TYPE
        # Valid values include the following: DNI_AND_NIF (For Spanish contacts) NIE (For foreigners with
        # legal residence) OTHER (For contacts outside of Spain) ES_LEGAL_FORM Valid values include the
        # following: ASSOCIATION CENTRAL_GOVERNMENT_BODY CIVIL_SOCIETY COMMUNITY_OF_OWNERS COMMUNITY_PROPERTY
        # CONSULATE COOPERATIVE DESIGNATION_OF_ORIGIN_SUPERVISORY_COUNCIL ECONOMIC_INTEREST_GROUP EMBASSY
        # ENTITY_MANAGING_NATURAL_AREAS FARM_PARTNERSHIP FOUNDATION GENERAL_AND_LIMITED_PARTNERSHIP
        # GENERAL_PARTNERSHIP INDIVIDUAL LIMITED_COMPANY LOCAL_AUTHORITY LOCAL_PUBLIC_ENTITY
        # MUTUAL_INSURANCE_COMPANY NATIONAL_PUBLIC_ENTITY ORDER_OR_RELIGIOUS_INSTITUTION OTHERS (Only for
        # contacts outside of Spain) POLITICAL_PARTY PROFESSIONAL_ASSOCIATION PUBLIC_LAW_ASSOCIATION
        # PUBLIC_LIMITED_COMPANY REGIONAL_GOVERNMENT_BODY REGIONAL_PUBLIC_ENTITY SAVINGS_BANK SPANISH_OFFICE
        # SPORTS_ASSOCIATION SPORTS_FEDERATION SPORTS_LIMITED_COMPANY TEMPORARY_ALLIANCE_OF_ENTERPRISES
        # TRADE_UNION WORKER_OWNED_COMPANY WORKER_OWNED_LIMITED_COMPANY .eu EU_COUNTRY_OF_CITIZENSHIP .fi
        # BIRTH_DATE_IN_YYYY_MM_DD FI_BUSINESS_NUMBER FI_ID_NUMBER FI_NATIONALITY Valid values include the
        # following: FINNISH NOT_FINNISH FI_ORGANIZATION_TYPE Valid values include the following: COMPANY
        # CORPORATION GOVERNMENT INSTITUTION POLITICAL_PARTY PUBLIC_COMMUNITY TOWNSHIP .it IT_NATIONALITY
        # IT_PIN IT_REGISTRANT_ENTITY_TYPE Valid values include the following: FOREIGNERS FREELANCE_WORKERS
        # (Freelance workers and professionals) ITALIAN_COMPANIES (Italian companies and one-person companies)
        # NON_PROFIT_ORGANIZATIONS OTHER_SUBJECTS PUBLIC_ORGANIZATIONS .ru BIRTH_DATE_IN_YYYY_MM_DD
        # RU_PASSPORT_DATA .se BIRTH_COUNTRY SE_ID_NUMBER .sg SG_ID_NUMBER .uk, .co.uk, .me.uk, and .org.uk
        # UK_CONTACT_TYPE Valid values include the following: CRC (UK Corporation by Royal Charter) FCORP
        # (Non-UK Corporation) FIND (Non-UK Individual, representing self) FOTHER (Non-UK Entity that does not
        # fit into any other category) GOV (UK Government Body) IND (UK Individual (representing self)) IP (UK
        # Industrial/Provident Registered Company) LLP (UK Limited Liability Partnership) LTD (UK Limited
        # Company) OTHER (UK Entity that does not fit into any other category) PLC (UK Public Limited Company)
        # PTNR (UK Partnership) RCHAR (UK Registered Charity) SCH (UK School) STAT (UK Statutory Body) STRA
        # (UK Sole Trader) UK_COMPANY_NUMBER In addition, many TLDs require a VAT_NUMBER .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value that corresponds with the name of an extra parameter.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Information for the filtering of a list of domains returned by ListDomains .

      struct FilterCondition
        include JSON::Serializable

        # Name of the field which should be used for filtering the list of domains.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The operator values for filtering domain names. The values can be: LE : Less than, or equal to GE :
        # Greater than, or equal to BEGINS_WITH : Begins with

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # An array of strings presenting values to compare. Only 1 item in the list is currently supported.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end


      struct GetContactReachabilityStatusRequest
        include JSON::Serializable

        # The name of the domain for which you want to know whether the registrant contact has confirmed that
        # the email address is valid.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @domain_name : String? = nil
        )
        end
      end


      struct GetContactReachabilityStatusResponse
        include JSON::Serializable

        # The domain name for which you requested the reachability status.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # Whether the registrant contact has responded. Values include the following: PENDING We sent the
        # confirmation email and haven't received a response yet. DONE We sent the email and got confirmation
        # from the registrant contact. EXPIRED The time limit expired before the registrant contact responded.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @domain_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The GetDomainDetail request includes the following element.

      struct GetDomainDetailRequest
        include JSON::Serializable

        # The name of the domain that you want to get detailed information about.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The GetDomainDetail response includes the following elements.

      struct GetDomainDetailResponse
        include JSON::Serializable

        # Email address to contact to report incorrect contact information for a domain, to report that the
        # domain is being used to send spam, to report that someone is cybersquatting on a domain name, or
        # report some other type of abuse.

        @[JSON::Field(key: "AbuseContactEmail")]
        getter abuse_contact_email : String?

        # Phone number for reporting abuse.

        @[JSON::Field(key: "AbuseContactPhone")]
        getter abuse_contact_phone : String?

        # Provides details about the domain administrative contact.

        @[JSON::Field(key: "AdminContact")]
        getter admin_contact : Types::ContactDetail?

        # Specifies whether contact information is concealed from WHOIS queries. If the value is true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If the value is false , WHOIS queries return the information that you entered for
        # the admin contact.

        @[JSON::Field(key: "AdminPrivacy")]
        getter admin_privacy : Bool?

        # Specifies whether the domain registration is set to renew automatically.

        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : Bool?

        # Provides details about the domain billing contact.

        @[JSON::Field(key: "BillingContact")]
        getter billing_contact : Types::ContactDetail?

        # Specifies whether contact information is concealed from WHOIS queries. If the value is true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If the value is false , WHOIS queries return the information that you entered for
        # the billing contact.

        @[JSON::Field(key: "BillingPrivacy")]
        getter billing_privacy : Bool?

        # The date when the domain was created as found in the response to a WHOIS query. The date and time is
        # in Unix time format and Coordinated Universal time (UTC).

        @[JSON::Field(key: "CreationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # Deprecated.

        @[JSON::Field(key: "DnsSec")]
        getter dns_sec : String?

        # A complex type that contains information about the DNSSEC configuration.

        @[JSON::Field(key: "DnssecKeys")]
        getter dnssec_keys : Array(Types::DnssecKey)?

        # The name of a domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The date when the registration for the domain is set to expire. The date and time is in Unix time
        # format and Coordinated Universal time (UTC).

        @[JSON::Field(key: "ExpirationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # The name servers of the domain.

        @[JSON::Field(key: "Nameservers")]
        getter nameservers : Array(Types::Nameserver)?

        # Provides details about the domain registrant.

        @[JSON::Field(key: "RegistrantContact")]
        getter registrant_contact : Types::ContactDetail?

        # Specifies whether contact information is concealed from WHOIS queries. If the value is true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If the value is false , WHOIS queries return the information that you entered for
        # the registrant contact (domain owner).

        @[JSON::Field(key: "RegistrantPrivacy")]
        getter registrant_privacy : Bool?

        # Name of the registrar of the domain as identified in the registry.

        @[JSON::Field(key: "RegistrarName")]
        getter registrar_name : String?

        # Web address of the registrar.

        @[JSON::Field(key: "RegistrarUrl")]
        getter registrar_url : String?

        # Reserved for future use.

        @[JSON::Field(key: "RegistryDomainId")]
        getter registry_domain_id : String?

        # Reseller of the domain. Domains registered or transferred using Route 53 domains will have "Amazon"
        # as the reseller.

        @[JSON::Field(key: "Reseller")]
        getter reseller : String?

        # An array of domain name status codes, also known as Extensible Provisioning Protocol (EPP) status
        # codes. ICANN, the organization that maintains a central database of domain names, has developed a
        # set of domain name status codes that tell you the status of a variety of operations on a domain
        # name, for example, registering a domain name, transferring a domain name to another registrar,
        # renewing the registration for a domain name, and so on. All registrars use this same set of status
        # codes. For a current list of domain name status codes and an explanation of what each code means, go
        # to the ICANN website and search for epp status codes . (Search on the ICANN website; web searches
        # sometimes return an old version of the document.)

        @[JSON::Field(key: "StatusList")]
        getter status_list : Array(String)?

        # Provides details about the domain technical contact.

        @[JSON::Field(key: "TechContact")]
        getter tech_contact : Types::ContactDetail?

        # Specifies whether contact information is concealed from WHOIS queries. If the value is true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If the value is false , WHOIS queries return the information that you entered for
        # the technical contact.

        @[JSON::Field(key: "TechPrivacy")]
        getter tech_privacy : Bool?

        # The last updated date of the domain as found in the response to a WHOIS query. The date and time is
        # in Unix time format and Coordinated Universal time (UTC).

        @[JSON::Field(key: "UpdatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated_date : Time?

        # The fully qualified name of the WHOIS server that can answer the WHOIS query for the domain.

        @[JSON::Field(key: "WhoIsServer")]
        getter who_is_server : String?

        def initialize(
          @abuse_contact_email : String? = nil,
          @abuse_contact_phone : String? = nil,
          @admin_contact : Types::ContactDetail? = nil,
          @admin_privacy : Bool? = nil,
          @auto_renew : Bool? = nil,
          @billing_contact : Types::ContactDetail? = nil,
          @billing_privacy : Bool? = nil,
          @creation_date : Time? = nil,
          @dns_sec : String? = nil,
          @dnssec_keys : Array(Types::DnssecKey)? = nil,
          @domain_name : String? = nil,
          @expiration_date : Time? = nil,
          @nameservers : Array(Types::Nameserver)? = nil,
          @registrant_contact : Types::ContactDetail? = nil,
          @registrant_privacy : Bool? = nil,
          @registrar_name : String? = nil,
          @registrar_url : String? = nil,
          @registry_domain_id : String? = nil,
          @reseller : String? = nil,
          @status_list : Array(String)? = nil,
          @tech_contact : Types::ContactDetail? = nil,
          @tech_privacy : Bool? = nil,
          @updated_date : Time? = nil,
          @who_is_server : String? = nil
        )
        end
      end


      struct GetDomainSuggestionsRequest
        include JSON::Serializable

        # A domain name that you want to use as the basis for a list of possible domain names. The top-level
        # domain (TLD), such as .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see
        # Domains that You Can Register with Amazon Route 53 in the Amazon Route 53 Developer Guide . The
        # domain name can contain only the following characters: Letters a through z. Domain names are not
        # case sensitive. Numbers 0 through 9. Hyphen (-). You can't specify a hyphen at the beginning or end
        # of a label. Period (.) to separate the labels in the name, such as the . in example.com .
        # Internationalized domain names are not supported for some top-level domains. To determine whether
        # the TLD that you want to use supports internationalized domain names, see Domains that You Can
        # Register with Amazon Route 53 .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # If OnlyAvailable is true , Route 53 returns only domain names that are available. If OnlyAvailable
        # is false , Route 53 returns domain names without checking whether they're available to be
        # registered. To determine whether the domain is available, you can call checkDomainAvailability for
        # each suggestion.

        @[JSON::Field(key: "OnlyAvailable")]
        getter only_available : Bool

        # The number of suggested domain names that you want Route 53 to return. Specify a value between 1 and
        # 50.

        @[JSON::Field(key: "SuggestionCount")]
        getter suggestion_count : Int32

        def initialize(
          @domain_name : String,
          @only_available : Bool,
          @suggestion_count : Int32
        )
        end
      end


      struct GetDomainSuggestionsResponse
        include JSON::Serializable

        # A list of possible domain names. If you specified true for OnlyAvailable in the request, the list
        # contains only domains that are available for registration.

        @[JSON::Field(key: "SuggestionsList")]
        getter suggestions_list : Array(Types::DomainSuggestion)?

        def initialize(
          @suggestions_list : Array(Types::DomainSuggestion)? = nil
        )
        end
      end

      # The GetOperationDetail request includes the following element.

      struct GetOperationDetailRequest
        include JSON::Serializable

        # The identifier for the operation for which you want to get the status. Route 53 returned the
        # identifier in the response to the original request.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end

      # The GetOperationDetail response includes the following elements.

      struct GetOperationDetailResponse
        include JSON::Serializable

        # The name of a domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The date when the operation was last updated.

        @[JSON::Field(key: "LastUpdatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time?

        # Detailed information on the status including possible errors.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier for the operation.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The current status of the requested operation in the system.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Lists any outstanding operations that require customer action. Valid values are: PENDING_ACCEPTANCE
        # : The operation is waiting for acceptance from the account that is receiving the domain.
        # PENDING_CUSTOMER_ACTION : The operation is waiting for customer action, for example, returning an
        # email. PENDING_AUTHORIZATION : The operation is waiting for the form of authorization. For more
        # information, see ResendOperationAuthorization . PENDING_PAYMENT_VERIFICATION : The operation is
        # waiting for the payment method to validate. PENDING_SUPPORT_CASE : The operation includes a support
        # case and is waiting for its resolution.

        @[JSON::Field(key: "StatusFlag")]
        getter status_flag : String?

        # The date when the request was submitted.

        @[JSON::Field(key: "SubmittedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submitted_date : Time?

        # The type of operation that was requested.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @domain_name : String? = nil,
          @last_updated_date : Time? = nil,
          @message : String? = nil,
          @operation_id : String? = nil,
          @status : String? = nil,
          @status_flag : String? = nil,
          @submitted_date : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # The requested item is not acceptable. For example, for APIs that accept a domain name, the request
      # might specify a domain name that doesn't belong to the account that submitted the request. For
      # AcceptDomainTransferFromAnotherAwsAccount , the password might be invalid.

      struct InvalidInput
        include JSON::Serializable

        # The requested item is not acceptable. For example, for an OperationId it might refer to the ID of an
        # operation that is already completed. For a domain name, it might not be a valid domain name or
        # belong to the requester account.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The ListDomains request includes the following elements.

      struct ListDomainsRequest
        include JSON::Serializable

        # A complex type that contains information about the filters applied during the ListDomains request.
        # The filter conditions can include domain name and domain expiration.

        @[JSON::Field(key: "FilterConditions")]
        getter filter_conditions : Array(Types::FilterCondition)?

        # For an initial request for a list of domains, omit this element. If the number of domains that are
        # associated with the current Amazon Web Services account is greater than the value that you specified
        # for MaxItems , you can use Marker to return additional domains. Get the value of NextPageMarker from
        # the previous response, and submit another request that includes the value of NextPageMarker in the
        # Marker element. Constraints: The marker must match the value specified in the previous request.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Number of domains to be returned. Default: 20

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # A complex type that contains information about the requested ordering of domains in the returned
        # list.

        @[JSON::Field(key: "SortCondition")]
        getter sort_condition : Types::SortCondition?

        def initialize(
          @filter_conditions : Array(Types::FilterCondition)? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @sort_condition : Types::SortCondition? = nil
        )
        end
      end

      # The ListDomains response includes the following elements.

      struct ListDomainsResponse
        include JSON::Serializable

        # A list of domains.

        @[JSON::Field(key: "Domains")]
        getter domains : Array(Types::DomainSummary)?

        # If there are more domains than you specified for MaxItems in the request, submit another request and
        # include the value of NextPageMarker in the value of Marker .

        @[JSON::Field(key: "NextPageMarker")]
        getter next_page_marker : String?

        def initialize(
          @domains : Array(Types::DomainSummary)? = nil,
          @next_page_marker : String? = nil
        )
        end
      end

      # The ListOperations request includes the following elements.

      struct ListOperationsRequest
        include JSON::Serializable

        # For an initial request for a list of operations, omit this element. If the number of operations that
        # are not yet complete is greater than the value that you specified for MaxItems , you can use Marker
        # to return additional operations. Get the value of NextPageMarker from the previous response, and
        # submit another request that includes the value of NextPageMarker in the Marker element.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Number of domains to be returned. Default: 20

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The sort type for returned values.

        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # The sort order for returned values, either ascending or descending.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        # The status of the operations.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        # An optional parameter that lets you get information about all the operations that you submitted
        # after a specified date and time. Specify the date and time in Unix time format and Coordinated
        # Universal time (UTC).

        @[JSON::Field(key: "SubmittedSince", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submitted_since : Time?

        # An arrays of the domains operation types.

        @[JSON::Field(key: "Type")]
        getter type : Array(String)?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @status : Array(String)? = nil,
          @submitted_since : Time? = nil,
          @type : Array(String)? = nil
        )
        end
      end

      # The ListOperations response includes the following elements.

      struct ListOperationsResponse
        include JSON::Serializable

        # If there are more operations than you specified for MaxItems in the request, submit another request
        # and include the value of NextPageMarker in the value of Marker .

        @[JSON::Field(key: "NextPageMarker")]
        getter next_page_marker : String?

        # Lists summaries of the operations.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::OperationSummary)?

        def initialize(
          @next_page_marker : String? = nil,
          @operations : Array(Types::OperationSummary)? = nil
        )
        end
      end


      struct ListPricesRequest
        include JSON::Serializable

        # For an initial request for a list of prices, omit this element. If the number of prices that are not
        # yet complete is greater than the value that you specified for MaxItems , you can use Marker to
        # return additional prices. Get the value of NextPageMarker from the previous response, and submit
        # another request that includes the value of NextPageMarker in the Marker element. Used only for all
        # TLDs. If you specify a TLD, don't specify a Marker .

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # Number of Prices to be returned. Used only for all TLDs. If you specify a TLD, don't specify a
        # MaxItems .

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The TLD for which you want to receive the pricing information. For example. .net . If a Tld value is
        # not provided, a list of prices for all TLDs supported by Route 53 is returned.

        @[JSON::Field(key: "Tld")]
        getter tld : String?

        def initialize(
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @tld : String? = nil
        )
        end
      end


      struct ListPricesResponse
        include JSON::Serializable

        # If there are more prices than you specified for MaxItems in the request, submit another request and
        # include the value of NextPageMarker in the value of Marker . Used only for all TLDs. If you specify
        # a TLD, don't specify a NextPageMarker .

        @[JSON::Field(key: "NextPageMarker")]
        getter next_page_marker : String?

        # A complex type that includes all the pricing information. If you specify a TLD, this array contains
        # only the pricing for that TLD.

        @[JSON::Field(key: "Prices")]
        getter prices : Array(Types::DomainPrice)?

        def initialize(
          @next_page_marker : String? = nil,
          @prices : Array(Types::DomainPrice)? = nil
        )
        end
      end

      # The ListTagsForDomainRequest includes the following elements.

      struct ListTagsForDomainRequest
        include JSON::Serializable

        # The domain for which you want to get a list of tags.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The ListTagsForDomain response includes the following elements.

      struct ListTagsForDomainResponse
        include JSON::Serializable

        # A list of the tags that are associated with the specified domain.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end

      # Name server includes the following elements.

      struct Nameserver
        include JSON::Serializable

        # The fully qualified host name of the name server. Constraint: Maximum 255 characters

        @[JSON::Field(key: "Name")]
        getter name : String

        # Glue IP address of a name server entry. Glue IP addresses are required only when the name of the
        # name server is a subdomain of the domain. For example, if your domain is example.com and the name
        # server for the domain is ns.example.com, you need to specify the IP address for ns.example.com.
        # Constraints: The list can contain only one IPv4 and one IPv6 address.

        @[JSON::Field(key: "GlueIps")]
        getter glue_ips : Array(String)?

        def initialize(
          @name : String,
          @glue_ips : Array(String)? = nil
        )
        end
      end

      # The number of operations or jobs running exceeded the allowed threshold for the account.

      struct OperationLimitExceeded
        include JSON::Serializable

        # The number of operations or jobs running exceeded the allowed threshold for the account.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # OperationSummary includes the following elements.

      struct OperationSummary
        include JSON::Serializable

        # Name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # The date when the last change was made in Unix time format and Coordinated Universal Time (UTC).

        @[JSON::Field(key: "LastUpdatedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date : Time?

        # Message about the operation.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # Identifier returned to track the requested action.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # The current status of the requested operation in the system.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Automatically checks whether there are no outstanding operations on domains that need customer
        # attention. Valid values are: PENDING_ACCEPTANCE : The operation is waiting for acceptance from the
        # account that is receiving the domain. PENDING_CUSTOMER_ACTION : The operation is waiting for
        # customer action, for example, returning an email. PENDING_AUTHORIZATION : The operation is waiting
        # for the form of authorization. For more information, see ResendOperationAuthorization .
        # PENDING_PAYMENT_VERIFICATION : The operation is waiting for the payment method to validate.
        # PENDING_SUPPORT_CASE : The operation includes a support case and is waiting for its resolution.

        @[JSON::Field(key: "StatusFlag")]
        getter status_flag : String?

        # The date when the request was submitted.

        @[JSON::Field(key: "SubmittedDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submitted_date : Time?

        # Type of the action requested.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @domain_name : String? = nil,
          @last_updated_date : Time? = nil,
          @message : String? = nil,
          @operation_id : String? = nil,
          @status : String? = nil,
          @status_flag : String? = nil,
          @submitted_date : Time? = nil,
          @type : String? = nil
        )
        end
      end

      # Currency-specific price information.

      struct PriceWithCurrency
        include JSON::Serializable

        # The currency specifier.

        @[JSON::Field(key: "Currency")]
        getter currency : String

        # The price of a domain, in a specific currency.

        @[JSON::Field(key: "Price")]
        getter price : Float64

        def initialize(
          @currency : String,
          @price : Float64
        )
        end
      end


      struct PushDomainRequest
        include JSON::Serializable

        # Name of the domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # New IPS tag for the domain.

        @[JSON::Field(key: "Target")]
        getter target : String

        def initialize(
          @domain_name : String,
          @target : String
        )
        end
      end

      # The RegisterDomain request includes the following elements.

      struct RegisterDomainRequest
        include JSON::Serializable

        # Provides detailed contact information. For information about the values that you specify for each
        # element, see ContactDetail .

        @[JSON::Field(key: "AdminContact")]
        getter admin_contact : Types::ContactDetail

        # The domain name that you want to register. The top-level domain (TLD), such as .com, must be a TLD
        # that Route 53 supports. For a list of supported TLDs, see Domains that You Can Register with Amazon
        # Route 53 in the Amazon Route 53 Developer Guide . The domain name can contain only the following
        # characters: Letters a through z. Domain names are not case sensitive. Numbers 0 through 9. Hyphen
        # (-). You can't specify a hyphen at the beginning or end of a label. Period (.) to separate the
        # labels in the name, such as the . in example.com . Internationalized domain names are not supported
        # for some top-level domains. To determine whether the TLD that you want to use supports
        # internationalized domain names, see Domains that You Can Register with Amazon Route 53 . For more
        # information, see Formatting Internationalized Domain Names .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The number of years that you want to register the domain for. Domains are registered for a minimum
        # of one year. The maximum period depends on the top-level domain. For the range of valid values for
        # your domain, see Domains that You Can Register with Amazon Route 53 in the Amazon Route 53 Developer
        # Guide . Default: 1

        @[JSON::Field(key: "DurationInYears")]
        getter duration_in_years : Int32

        # Provides detailed contact information. For information about the values that you specify for each
        # element, see ContactDetail .

        @[JSON::Field(key: "RegistrantContact")]
        getter registrant_contact : Types::ContactDetail

        # Provides detailed contact information. For information about the values that you specify for each
        # element, see ContactDetail .

        @[JSON::Field(key: "TechContact")]
        getter tech_contact : Types::ContactDetail

        # Indicates whether the domain will be automatically renewed ( true ) or not ( false ). Auto renewal
        # only takes effect after the account is charged. Default: true

        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : Bool?

        # Provides detailed contact information. For information about the values that you specify for each
        # element, see ContactDetail .

        @[JSON::Field(key: "BillingContact")]
        getter billing_contact : Types::ContactDetail?

        # Reserved for future use.

        @[JSON::Field(key: "IdnLangCode")]
        getter idn_lang_code : String?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the admin contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts. Default: true

        @[JSON::Field(key: "PrivacyProtectAdminContact")]
        getter privacy_protect_admin_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the billing contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts.

        @[JSON::Field(key: "PrivacyProtectBillingContact")]
        getter privacy_protect_billing_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the registrant contact (the domain owner). You must specify the same privacy setting for the
        # administrative, billing, registrant, and technical contacts. Default: true

        @[JSON::Field(key: "PrivacyProtectRegistrantContact")]
        getter privacy_protect_registrant_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the technical contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts. Default: true

        @[JSON::Field(key: "PrivacyProtectTechContact")]
        getter privacy_protect_tech_contact : Bool?

        def initialize(
          @admin_contact : Types::ContactDetail,
          @domain_name : String,
          @duration_in_years : Int32,
          @registrant_contact : Types::ContactDetail,
          @tech_contact : Types::ContactDetail,
          @auto_renew : Bool? = nil,
          @billing_contact : Types::ContactDetail? = nil,
          @idn_lang_code : String? = nil,
          @privacy_protect_admin_contact : Bool? = nil,
          @privacy_protect_billing_contact : Bool? = nil,
          @privacy_protect_registrant_contact : Bool? = nil,
          @privacy_protect_tech_contact : Bool? = nil
        )
        end
      end

      # The RegisterDomain response includes the following element.

      struct RegisterDomainResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The RejectDomainTransferFromAnotherAwsAccount request includes the following element.

      struct RejectDomainTransferFromAnotherAwsAccountRequest
        include JSON::Serializable

        # The name of the domain that was specified when another Amazon Web Services account submitted a
        # TransferDomainToAnotherAwsAccount request.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The RejectDomainTransferFromAnotherAwsAccount response includes the following element.

      struct RejectDomainTransferFromAnotherAwsAccountResponse
        include JSON::Serializable

        # The identifier that TransferDomainToAnotherAwsAccount returned to track the progress of the request.
        # Because the transfer request was rejected, the value is no longer valid, and you can't use
        # GetOperationDetail to query the operation status.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # A RenewDomain request includes the number of years that you want to renew for and the current
      # expiration year.

      struct RenewDomainRequest
        include JSON::Serializable

        # The year when the registration for the domain is set to expire. This value must match the current
        # expiration date for the domain.

        @[JSON::Field(key: "CurrentExpiryYear")]
        getter current_expiry_year : Int32

        # The name of the domain that you want to renew.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The number of years that you want to renew the domain for. The maximum number of years depends on
        # the top-level domain. For the range of valid values for your domain, see Domains that You Can
        # Register with Amazon Route 53 in the Amazon Route 53 Developer Guide . Default: 1

        @[JSON::Field(key: "DurationInYears")]
        getter duration_in_years : Int32?

        def initialize(
          @current_expiry_year : Int32,
          @domain_name : String,
          @duration_in_years : Int32? = nil
        )
        end
      end


      struct RenewDomainResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct ResendContactReachabilityEmailRequest
        include JSON::Serializable

        # The name of the domain for which you want Route 53 to resend a confirmation email to the registrant
        # contact.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @domain_name : String? = nil
        )
        end
      end


      struct ResendContactReachabilityEmailResponse
        include JSON::Serializable

        # The domain name for which you requested a confirmation email.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The email address for the registrant contact at the time that we sent the verification email.

        @[JSON::Field(key: "emailAddress")]
        getter email_address : String?

        # True if the email address for the registrant contact has already been verified, and false otherwise.
        # If the email address has already been verified, we don't send another confirmation email.

        @[JSON::Field(key: "isAlreadyVerified")]
        getter is_already_verified : Bool?

        def initialize(
          @domain_name : String? = nil,
          @email_address : String? = nil,
          @is_already_verified : Bool? = nil
        )
        end
      end


      struct ResendOperationAuthorizationRequest
        include JSON::Serializable

        # Operation ID.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end

      # A request for the authorization code for the specified domain. To transfer a domain to another
      # registrar, you provide this value to the new registrar.

      struct RetrieveDomainAuthCodeRequest
        include JSON::Serializable

        # The name of the domain that you want to get an authorization code for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The RetrieveDomainAuthCode response includes the following element.

      struct RetrieveDomainAuthCodeResponse
        include JSON::Serializable

        # The authorization code for the domain.

        @[JSON::Field(key: "AuthCode")]
        getter auth_code : String?

        def initialize(
          @auth_code : String? = nil
        )
        end
      end

      # Information for sorting a list of domains.

      struct SortCondition
        include JSON::Serializable

        # Field to be used for sorting the list of domains. It can be either the name or the expiration for a
        # domain. Note that if filterCondition is used in the same ListDomains call, the field used for
        # sorting has to be the same as the field used for filtering.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The sort order for a list of domains. Either ascending (ASC) or descending (DES).

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @name : String,
          @sort_order : String
        )
        end
      end

      # The top-level domain does not support this operation.

      struct TLDRulesViolation
        include JSON::Serializable

        # The top-level domain does not support this operation.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Each tag includes the following elements.

      struct Tag
        include JSON::Serializable

        # The key (name) of a tag. Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@" Constraints: Each key can be
        # 1-128 characters long.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of a tag. Valid values: A-Z, a-z, 0-9, space, ".:/=+\-@" Constraints: Each value can be
        # 0-256 characters long.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The TransferDomain request includes the following elements.

      struct TransferDomainRequest
        include JSON::Serializable

        # Provides detailed contact information.

        @[JSON::Field(key: "AdminContact")]
        getter admin_contact : Types::ContactDetail

        # The name of the domain that you want to transfer to Route 53. The top-level domain (TLD), such as
        # .com, must be a TLD that Route 53 supports. For a list of supported TLDs, see Domains that You Can
        # Register with Amazon Route 53 in the Amazon Route 53 Developer Guide . The domain name can contain
        # only the following characters: Letters a through z. Domain names are not case sensitive. Numbers 0
        # through 9. Hyphen (-). You can't specify a hyphen at the beginning or end of a label. Period (.) to
        # separate the labels in the name, such as the . in example.com .

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The number of years that you want to register the domain for. Domains are registered for a minimum
        # of one year. The maximum period depends on the top-level domain. Default: 1

        @[JSON::Field(key: "DurationInYears")]
        getter duration_in_years : Int32

        # Provides detailed contact information.

        @[JSON::Field(key: "RegistrantContact")]
        getter registrant_contact : Types::ContactDetail

        # Provides detailed contact information.

        @[JSON::Field(key: "TechContact")]
        getter tech_contact : Types::ContactDetail

        # The authorization code for the domain. You get this value from the current registrar.

        @[JSON::Field(key: "AuthCode")]
        getter auth_code : String?

        # Indicates whether the domain will be automatically renewed (true) or not (false). Auto renewal only
        # takes effect after the account is charged. Default: true

        @[JSON::Field(key: "AutoRenew")]
        getter auto_renew : Bool?

        # Provides detailed contact information.

        @[JSON::Field(key: "BillingContact")]
        getter billing_contact : Types::ContactDetail?

        # Reserved for future use.

        @[JSON::Field(key: "IdnLangCode")]
        getter idn_lang_code : String?

        # Contains details for the host and glue IP addresses.

        @[JSON::Field(key: "Nameservers")]
        getter nameservers : Array(Types::Nameserver)?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information for the registrar, the phrase "REDACTED FOR PRIVACY",
        # or "On behalf of &lt;domain name&gt; owner.". While some domains may allow different privacy
        # settings per contact, we recommend specifying the same privacy setting for all contacts. Default:
        # true

        @[JSON::Field(key: "PrivacyProtectAdminContact")]
        getter privacy_protect_admin_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the billing contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts.

        @[JSON::Field(key: "PrivacyProtectBillingContact")]
        getter privacy_protect_billing_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the registrant contact (domain owner). You must specify the same privacy setting for the
        # administrative, billing, registrant, and technical contacts. Default: true

        @[JSON::Field(key: "PrivacyProtectRegistrantContact")]
        getter privacy_protect_registrant_contact : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the technical contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts. Default: true

        @[JSON::Field(key: "PrivacyProtectTechContact")]
        getter privacy_protect_tech_contact : Bool?

        def initialize(
          @admin_contact : Types::ContactDetail,
          @domain_name : String,
          @duration_in_years : Int32,
          @registrant_contact : Types::ContactDetail,
          @tech_contact : Types::ContactDetail,
          @auth_code : String? = nil,
          @auto_renew : Bool? = nil,
          @billing_contact : Types::ContactDetail? = nil,
          @idn_lang_code : String? = nil,
          @nameservers : Array(Types::Nameserver)? = nil,
          @privacy_protect_admin_contact : Bool? = nil,
          @privacy_protect_billing_contact : Bool? = nil,
          @privacy_protect_registrant_contact : Bool? = nil,
          @privacy_protect_tech_contact : Bool? = nil
        )
        end
      end

      # The TransferDomain response includes the following element.

      struct TransferDomainResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The TransferDomainToAnotherAwsAccount request includes the following elements.

      struct TransferDomainToAnotherAwsAccountRequest
        include JSON::Serializable

        # The account ID of the Amazon Web Services account that you want to transfer the domain to, for
        # example, 111122223333 .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The name of the domain that you want to transfer from the current Amazon Web Services account to
        # another account.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @account_id : String,
          @domain_name : String
        )
        end
      end

      # The TransferDomainToAnotherAwsAccount response includes the following elements.

      struct TransferDomainToAnotherAwsAccountResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        # To finish transferring a domain to another Amazon Web Services account, the account that the domain
        # is being transferred to must submit an AcceptDomainTransferFromAnotherAwsAccount request. The
        # request must include the value of the Password element that was returned in the
        # TransferDomainToAnotherAwsAccount response.

        @[JSON::Field(key: "Password")]
        getter password : String?

        def initialize(
          @operation_id : String? = nil,
          @password : String? = nil
        )
        end
      end

      # Amazon Route 53 does not support this top-level domain (TLD).

      struct UnsupportedTLD
        include JSON::Serializable

        # Amazon Route 53 does not support this top-level domain (TLD).

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The UpdateDomainContactPrivacy request includes the following elements.

      struct UpdateDomainContactPrivacyRequest
        include JSON::Serializable

        # The name of the domain that you want to update the privacy setting for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the admin contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts.

        @[JSON::Field(key: "AdminPrivacy")]
        getter admin_privacy : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the billing contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts.

        @[JSON::Field(key: "BillingPrivacy")]
        getter billing_privacy : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the registrant contact (domain owner). You must specify the same privacy setting for the
        # administrative, billing, registrant, and technical contacts.

        @[JSON::Field(key: "RegistrantPrivacy")]
        getter registrant_privacy : Bool?

        # Whether you want to conceal contact information from WHOIS queries. If you specify true , WHOIS
        # ("who is") queries return contact information either for Amazon Registrar or for our registrar
        # associate, Gandi. If you specify false , WHOIS queries return the information that you entered for
        # the technical contact. You must specify the same privacy setting for the administrative, billing,
        # registrant, and technical contacts.

        @[JSON::Field(key: "TechPrivacy")]
        getter tech_privacy : Bool?

        def initialize(
          @domain_name : String,
          @admin_privacy : Bool? = nil,
          @billing_privacy : Bool? = nil,
          @registrant_privacy : Bool? = nil,
          @tech_privacy : Bool? = nil
        )
        end
      end

      # The UpdateDomainContactPrivacy response includes the following element.

      struct UpdateDomainContactPrivacyResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To use this ID to query the operation status,
        # use GetOperationDetail.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The UpdateDomainContact request includes the following elements.

      struct UpdateDomainContactRequest
        include JSON::Serializable

        # The name of the domain that you want to update contact information for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Provides detailed contact information.

        @[JSON::Field(key: "AdminContact")]
        getter admin_contact : Types::ContactDetail?

        # Provides detailed contact information.

        @[JSON::Field(key: "BillingContact")]
        getter billing_contact : Types::ContactDetail?

        # Customer's consent for the owner change request. Required if the domain is not free (consent price
        # is more than $0.00).

        @[JSON::Field(key: "Consent")]
        getter consent : Types::Consent?

        # Provides detailed contact information.

        @[JSON::Field(key: "RegistrantContact")]
        getter registrant_contact : Types::ContactDetail?

        # Provides detailed contact information.

        @[JSON::Field(key: "TechContact")]
        getter tech_contact : Types::ContactDetail?

        def initialize(
          @domain_name : String,
          @admin_contact : Types::ContactDetail? = nil,
          @billing_contact : Types::ContactDetail? = nil,
          @consent : Types::Consent? = nil,
          @registrant_contact : Types::ContactDetail? = nil,
          @tech_contact : Types::ContactDetail? = nil
        )
        end
      end

      # The UpdateDomainContact response includes the following element.

      struct UpdateDomainContactResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # Replaces the current set of name servers for the domain with the specified set of name servers. If
      # you use Amazon Route 53 as your DNS service, specify the four name servers in the delegation set for
      # the hosted zone for the domain. If successful, this operation returns an operation ID that you can
      # use to track the progress and completion of the action. If the request is not completed
      # successfully, the domain registrant will be notified by email.

      struct UpdateDomainNameserversRequest
        include JSON::Serializable

        # The name of the domain that you want to change name servers for.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of new name servers for the domain.

        @[JSON::Field(key: "Nameservers")]
        getter nameservers : Array(Types::Nameserver)

        # The authorization key for .fi domains

        @[JSON::Field(key: "FIAuthKey")]
        getter fi_auth_key : String?

        def initialize(
          @domain_name : String,
          @nameservers : Array(Types::Nameserver),
          @fi_auth_key : String? = nil
        )
        end
      end

      # The UpdateDomainNameservers response includes the following element.

      struct UpdateDomainNameserversResponse
        include JSON::Serializable

        # Identifier for tracking the progress of the request. To query the operation status, use
        # GetOperationDetail .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The UpdateTagsForDomainRequest includes the following elements.

      struct UpdateTagsForDomainRequest
        include JSON::Serializable

        # The domain for which you want to add or update tags.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of the tag keys and values that you want to add or update. If you specify a key that already
        # exists, the corresponding value will be replaced.

        @[JSON::Field(key: "TagsToUpdate")]
        getter tags_to_update : Array(Types::Tag)?

        def initialize(
          @domain_name : String,
          @tags_to_update : Array(Types::Tag)? = nil
        )
        end
      end


      struct UpdateTagsForDomainResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The ViewBilling request includes the following elements.

      struct ViewBillingRequest
        include JSON::Serializable

        # The end date and time for the time period for which you want a list of billing records. Specify the
        # date and time in Unix time format and Coordinated Universal time (UTC).

        @[JSON::Field(key: "End", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end : Time?

        # For an initial request for a list of billing records, omit this element. If the number of billing
        # records that are associated with the current Amazon Web Services account during the specified period
        # is greater than the value that you specified for MaxItems , you can use Marker to return additional
        # billing records. Get the value of NextPageMarker from the previous response, and submit another
        # request that includes the value of NextPageMarker in the Marker element. Constraints: The marker
        # must match the value of NextPageMarker that was returned in the previous response.

        @[JSON::Field(key: "Marker")]
        getter marker : String?

        # The number of billing records to be returned. Default: 20

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The beginning date and time for the time period for which you want a list of billing records.
        # Specify the date and time in Unix time format and Coordinated Universal time (UTC).

        @[JSON::Field(key: "Start", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start : Time?

        def initialize(
          @end : Time? = nil,
          @marker : String? = nil,
          @max_items : Int32? = nil,
          @start : Time? = nil
        )
        end
      end

      # The ViewBilling response includes the following elements.

      struct ViewBillingResponse
        include JSON::Serializable

        # A summary of billing records.

        @[JSON::Field(key: "BillingRecords")]
        getter billing_records : Array(Types::BillingRecord)?

        # If there are more billing records than you specified for MaxItems in the request, submit another
        # request and include the value of NextPageMarker in the value of Marker .

        @[JSON::Field(key: "NextPageMarker")]
        getter next_page_marker : String?

        def initialize(
          @billing_records : Array(Types::BillingRecord)? = nil,
          @next_page_marker : String? = nil
        )
        end
      end
    end
  end
end
