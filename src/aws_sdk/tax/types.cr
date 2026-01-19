require "json"
require "time"

module AwsSdk
  module TaxSettings
    module Types

      # The access is denied for the Amazon Web ServicesSupport API.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An object with your accountId and TRN information.
      struct AccountDetails
        include JSON::Serializable

        # List of unique account identifiers.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The meta data information associated with the account.
        @[JSON::Field(key: "accountMetaData")]
        getter account_meta_data : Types::AccountMetaData?

        # Tax inheritance information associated with the account.
        @[JSON::Field(key: "taxInheritanceDetails")]
        getter tax_inheritance_details : Types::TaxInheritanceDetails?

        # Your TRN information. Instead of having full legal address, here TRN information will have
        # jurisdiction details (for example, country code and state/region/province if applicable).
        @[JSON::Field(key: "taxRegistration")]
        getter tax_registration : Types::TaxRegistrationWithJurisdiction?

        def initialize(
          @account_id : String? = nil,
          @account_meta_data : Types::AccountMetaData? = nil,
          @tax_inheritance_details : Types::TaxInheritanceDetails? = nil,
          @tax_registration : Types::TaxRegistrationWithJurisdiction? = nil
        )
        end
      end

      # The meta data information associated with the account.
      struct AccountMetaData
        include JSON::Serializable

        # The Amazon Web Services accounts name.
        @[JSON::Field(key: "accountName")]
        getter account_name : String?

        @[JSON::Field(key: "address")]
        getter address : Types::Address?

        # Address roles associated with the account containing country code information.
        @[JSON::Field(key: "addressRoleMap")]
        getter address_role_map : Hash(String, Types::Jurisdiction)?

        # The type of address associated with the legal profile.
        @[JSON::Field(key: "addressType")]
        getter address_type : String?

        # Seller information associated with the account.
        @[JSON::Field(key: "seller")]
        getter seller : String?

        def initialize(
          @account_name : String? = nil,
          @address : Types::Address? = nil,
          @address_role_map : Hash(String, Types::Jurisdiction)? = nil,
          @address_type : String? = nil,
          @seller : String? = nil
        )
        end
      end

      # Additional tax information associated with your tax registration number (TRN). Depending on the TRN
      # for a specific country, you might need to specify this information when you set your TRN. You can
      # only specify one of the following parameters and the value can't be empty. The parameter that you
      # specify must match the country for the TRN, if available. For example, if you set a TRN in Canada
      # for specific provinces, you must also specify the canadaAdditionalInfo parameter.
      struct AdditionalInfoRequest
        include JSON::Serializable

        # Additional tax information associated with your TRN in Canada.
        @[JSON::Field(key: "canadaAdditionalInfo")]
        getter canada_additional_info : Types::CanadaAdditionalInfo?

        # Additional tax information to specify for a TRN in Egypt.
        @[JSON::Field(key: "egyptAdditionalInfo")]
        getter egypt_additional_info : Types::EgyptAdditionalInfo?

        # Additional tax information to specify for a TRN in Estonia.
        @[JSON::Field(key: "estoniaAdditionalInfo")]
        getter estonia_additional_info : Types::EstoniaAdditionalInfo?

        # Additional tax information to specify for a TRN in Georgia.
        @[JSON::Field(key: "georgiaAdditionalInfo")]
        getter georgia_additional_info : Types::GeorgiaAdditionalInfo?

        # Additional tax information to specify for a TRN in Greece.
        @[JSON::Field(key: "greeceAdditionalInfo")]
        getter greece_additional_info : Types::GreeceAdditionalInfo?

        @[JSON::Field(key: "indonesiaAdditionalInfo")]
        getter indonesia_additional_info : Types::IndonesiaAdditionalInfo?

        # Additional tax information to specify for a TRN in Israel.
        @[JSON::Field(key: "israelAdditionalInfo")]
        getter israel_additional_info : Types::IsraelAdditionalInfo?

        # Additional tax information to specify for a TRN in Italy.
        @[JSON::Field(key: "italyAdditionalInfo")]
        getter italy_additional_info : Types::ItalyAdditionalInfo?

        # Additional tax information to specify for a TRN in Kenya.
        @[JSON::Field(key: "kenyaAdditionalInfo")]
        getter kenya_additional_info : Types::KenyaAdditionalInfo?

        # Additional tax information to specify for a TRN in Malaysia.
        @[JSON::Field(key: "malaysiaAdditionalInfo")]
        getter malaysia_additional_info : Types::MalaysiaAdditionalInfo?

        # Additional tax information associated with your TRN in Poland.
        @[JSON::Field(key: "polandAdditionalInfo")]
        getter poland_additional_info : Types::PolandAdditionalInfo?

        # Additional tax information to specify for a TRN in Romania.
        @[JSON::Field(key: "romaniaAdditionalInfo")]
        getter romania_additional_info : Types::RomaniaAdditionalInfo?

        # Additional tax information associated with your TRN in Saudi Arabia.
        @[JSON::Field(key: "saudiArabiaAdditionalInfo")]
        getter saudi_arabia_additional_info : Types::SaudiArabiaAdditionalInfo?

        # Additional tax information to specify for a TRN in South Korea.
        @[JSON::Field(key: "southKoreaAdditionalInfo")]
        getter south_korea_additional_info : Types::SouthKoreaAdditionalInfo?

        # Additional tax information to specify for a TRN in Spain.
        @[JSON::Field(key: "spainAdditionalInfo")]
        getter spain_additional_info : Types::SpainAdditionalInfo?

        # Additional tax information to specify for a TRN in Turkey.
        @[JSON::Field(key: "turkeyAdditionalInfo")]
        getter turkey_additional_info : Types::TurkeyAdditionalInfo?

        # Additional tax information associated with your TRN in Ukraine.
        @[JSON::Field(key: "ukraineAdditionalInfo")]
        getter ukraine_additional_info : Types::UkraineAdditionalInfo?

        # Additional tax information to specify for a TRN in Uzbekistan.
        @[JSON::Field(key: "uzbekistanAdditionalInfo")]
        getter uzbekistan_additional_info : Types::UzbekistanAdditionalInfo?

        # Additional tax information to specify for a TRN in Vietnam.
        @[JSON::Field(key: "vietnamAdditionalInfo")]
        getter vietnam_additional_info : Types::VietnamAdditionalInfo?

        def initialize(
          @canada_additional_info : Types::CanadaAdditionalInfo? = nil,
          @egypt_additional_info : Types::EgyptAdditionalInfo? = nil,
          @estonia_additional_info : Types::EstoniaAdditionalInfo? = nil,
          @georgia_additional_info : Types::GeorgiaAdditionalInfo? = nil,
          @greece_additional_info : Types::GreeceAdditionalInfo? = nil,
          @indonesia_additional_info : Types::IndonesiaAdditionalInfo? = nil,
          @israel_additional_info : Types::IsraelAdditionalInfo? = nil,
          @italy_additional_info : Types::ItalyAdditionalInfo? = nil,
          @kenya_additional_info : Types::KenyaAdditionalInfo? = nil,
          @malaysia_additional_info : Types::MalaysiaAdditionalInfo? = nil,
          @poland_additional_info : Types::PolandAdditionalInfo? = nil,
          @romania_additional_info : Types::RomaniaAdditionalInfo? = nil,
          @saudi_arabia_additional_info : Types::SaudiArabiaAdditionalInfo? = nil,
          @south_korea_additional_info : Types::SouthKoreaAdditionalInfo? = nil,
          @spain_additional_info : Types::SpainAdditionalInfo? = nil,
          @turkey_additional_info : Types::TurkeyAdditionalInfo? = nil,
          @ukraine_additional_info : Types::UkraineAdditionalInfo? = nil,
          @uzbekistan_additional_info : Types::UzbekistanAdditionalInfo? = nil,
          @vietnam_additional_info : Types::VietnamAdditionalInfo? = nil
        )
        end
      end

      # Additional tax information associated with your TRN. The Tax Settings API returns country-specific
      # information in the response when any additional information is present with your TRN for the
      # following countries.
      struct AdditionalInfoResponse
        include JSON::Serializable

        # Additional tax information associated with your TRN in Brazil. The Tax Settings API returns this
        # information in your response when any additional information is present with your TRN in Brazil.
        @[JSON::Field(key: "brazilAdditionalInfo")]
        getter brazil_additional_info : Types::BrazilAdditionalInfo?

        # Additional tax information associated with your TRN in Canada.
        @[JSON::Field(key: "canadaAdditionalInfo")]
        getter canada_additional_info : Types::CanadaAdditionalInfo?

        # Additional tax information to specify for a TRN in Egypt.
        @[JSON::Field(key: "egyptAdditionalInfo")]
        getter egypt_additional_info : Types::EgyptAdditionalInfo?

        # Additional tax information associated with your TRN in Estonia.
        @[JSON::Field(key: "estoniaAdditionalInfo")]
        getter estonia_additional_info : Types::EstoniaAdditionalInfo?

        # Additional tax information associated with your TRN in Georgia.
        @[JSON::Field(key: "georgiaAdditionalInfo")]
        getter georgia_additional_info : Types::GeorgiaAdditionalInfo?

        # Additional tax information to specify for a TRN in Greece.
        @[JSON::Field(key: "greeceAdditionalInfo")]
        getter greece_additional_info : Types::GreeceAdditionalInfo?

        # Additional tax information in India.
        @[JSON::Field(key: "indiaAdditionalInfo")]
        getter india_additional_info : Types::IndiaAdditionalInfo?

        # Additional tax information associated with your TRN in Indonesia.
        @[JSON::Field(key: "indonesiaAdditionalInfo")]
        getter indonesia_additional_info : Types::IndonesiaAdditionalInfo?

        # Additional tax information associated with your TRN in Israel.
        @[JSON::Field(key: "israelAdditionalInfo")]
        getter israel_additional_info : Types::IsraelAdditionalInfo?

        # Additional tax information associated with your TRN in Italy.
        @[JSON::Field(key: "italyAdditionalInfo")]
        getter italy_additional_info : Types::ItalyAdditionalInfo?

        # Additional tax information associated with your TRN in Kenya.
        @[JSON::Field(key: "kenyaAdditionalInfo")]
        getter kenya_additional_info : Types::KenyaAdditionalInfo?

        # Additional tax information associated with your TRN in Malaysia.
        @[JSON::Field(key: "malaysiaAdditionalInfo")]
        getter malaysia_additional_info : Types::MalaysiaAdditionalInfo?

        # Additional tax information associated with your TRN in Poland.
        @[JSON::Field(key: "polandAdditionalInfo")]
        getter poland_additional_info : Types::PolandAdditionalInfo?

        # Additional tax information to specify for a TRN in Romania.
        @[JSON::Field(key: "romaniaAdditionalInfo")]
        getter romania_additional_info : Types::RomaniaAdditionalInfo?

        # Additional tax information associated with your TRN in Saudi Arabia.
        @[JSON::Field(key: "saudiArabiaAdditionalInfo")]
        getter saudi_arabia_additional_info : Types::SaudiArabiaAdditionalInfo?

        # Additional tax information associated with your TRN in South Korea.
        @[JSON::Field(key: "southKoreaAdditionalInfo")]
        getter south_korea_additional_info : Types::SouthKoreaAdditionalInfo?

        # Additional tax information associated with your TRN in Spain.
        @[JSON::Field(key: "spainAdditionalInfo")]
        getter spain_additional_info : Types::SpainAdditionalInfo?

        # Additional tax information associated with your TRN in Turkey.
        @[JSON::Field(key: "turkeyAdditionalInfo")]
        getter turkey_additional_info : Types::TurkeyAdditionalInfo?

        # Additional tax information associated with your TRN in Ukraine.
        @[JSON::Field(key: "ukraineAdditionalInfo")]
        getter ukraine_additional_info : Types::UkraineAdditionalInfo?

        # Additional tax information associated with your TRN in Uzbekistan.
        @[JSON::Field(key: "uzbekistanAdditionalInfo")]
        getter uzbekistan_additional_info : Types::UzbekistanAdditionalInfo?

        # Additional tax information to specify for a TRN in Vietnam.
        @[JSON::Field(key: "vietnamAdditionalInfo")]
        getter vietnam_additional_info : Types::VietnamAdditionalInfo?

        def initialize(
          @brazil_additional_info : Types::BrazilAdditionalInfo? = nil,
          @canada_additional_info : Types::CanadaAdditionalInfo? = nil,
          @egypt_additional_info : Types::EgyptAdditionalInfo? = nil,
          @estonia_additional_info : Types::EstoniaAdditionalInfo? = nil,
          @georgia_additional_info : Types::GeorgiaAdditionalInfo? = nil,
          @greece_additional_info : Types::GreeceAdditionalInfo? = nil,
          @india_additional_info : Types::IndiaAdditionalInfo? = nil,
          @indonesia_additional_info : Types::IndonesiaAdditionalInfo? = nil,
          @israel_additional_info : Types::IsraelAdditionalInfo? = nil,
          @italy_additional_info : Types::ItalyAdditionalInfo? = nil,
          @kenya_additional_info : Types::KenyaAdditionalInfo? = nil,
          @malaysia_additional_info : Types::MalaysiaAdditionalInfo? = nil,
          @poland_additional_info : Types::PolandAdditionalInfo? = nil,
          @romania_additional_info : Types::RomaniaAdditionalInfo? = nil,
          @saudi_arabia_additional_info : Types::SaudiArabiaAdditionalInfo? = nil,
          @south_korea_additional_info : Types::SouthKoreaAdditionalInfo? = nil,
          @spain_additional_info : Types::SpainAdditionalInfo? = nil,
          @turkey_additional_info : Types::TurkeyAdditionalInfo? = nil,
          @ukraine_additional_info : Types::UkraineAdditionalInfo? = nil,
          @uzbekistan_additional_info : Types::UzbekistanAdditionalInfo? = nil,
          @vietnam_additional_info : Types::VietnamAdditionalInfo? = nil
        )
        end
      end

      # The details of the address associated with the TRN information.
      struct Address
        include JSON::Serializable

        # The first line of the address.
        @[JSON::Field(key: "addressLine1")]
        getter address_line1 : String

        # The city that the address is in.
        @[JSON::Field(key: "city")]
        getter city : String

        # The country code for the country that the address is in.
        @[JSON::Field(key: "countryCode")]
        getter country_code : String

        # The postal code associated with the address.
        @[JSON::Field(key: "postalCode")]
        getter postal_code : String

        # The second line of the address, if applicable.
        @[JSON::Field(key: "addressLine2")]
        getter address_line2 : String?

        # The third line of the address, if applicable. Currently, the Tax Settings API accepts the
        # addressLine3 parameter only for Saudi Arabia. When you specify a TRN in Saudi Arabia, you must enter
        # the addressLine3 and specify the building number for the address. For example, you might enter 1234
        # .
        @[JSON::Field(key: "addressLine3")]
        getter address_line3 : String?

        # The district or county the address is located. For addresses in Brazil, this parameter uses the name
        # of the neighborhood. When you set a TRN in Brazil, use districtOrCounty for the neighborhood name.
        @[JSON::Field(key: "districtOrCounty")]
        getter district_or_county : String?

        # The state, region, or province that the address is located. This field is only required for Canada,
        # India, United Arab Emirates, Romania, and Brazil (CPF). It is optional for all other countries. If
        # this is required for tax settings, use the same name as shown on the Tax Settings page.
        @[JSON::Field(key: "stateOrRegion")]
        getter state_or_region : String?

        def initialize(
          @address_line1 : String,
          @city : String,
          @country_code : String,
          @postal_code : String,
          @address_line2 : String? = nil,
          @address_line3 : String? = nil,
          @district_or_county : String? = nil,
          @state_or_region : String? = nil
        )
        end
      end

      # Failed to upload the tax exemption document to Amazon Web ServicesSupport case.
      struct AttachmentUploadException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The address domain associate with the tax information.
      struct Authority
        include JSON::Serializable

        # The country code for the country that the address is in.
        @[JSON::Field(key: "country")]
        getter country : String

        # The state that the address is located.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @country : String,
          @state : String? = nil
        )
        end
      end

      # The error object for representing failures in the BatchDeleteTaxRegistration operation.
      struct BatchDeleteTaxRegistrationError
        include JSON::Serializable

        # The unique account identifier for the account whose tax registration couldn't be deleted during the
        # BatchDeleteTaxRegistration operation.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The error message for an individual failure in the BatchDeleteTaxRegistration operation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The error code for an individual failure in BatchDeleteTaxRegistration operation.
        @[JSON::Field(key: "code")]
        getter code : String?

        def initialize(
          @account_id : String,
          @message : String,
          @code : String? = nil
        )
        end
      end

      struct BatchDeleteTaxRegistrationRequest
        include JSON::Serializable

        # List of unique account identifiers.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      struct BatchDeleteTaxRegistrationResponse
        include JSON::Serializable

        # The list of errors for the accounts the TRN information could not be deleted for.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDeleteTaxRegistrationError)

        def initialize(
          @errors : Array(Types::BatchDeleteTaxRegistrationError)
        )
        end
      end

      struct BatchGetTaxExemptionsRequest
        include JSON::Serializable

        # List of unique account identifiers.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end

      struct BatchGetTaxExemptionsResponse
        include JSON::Serializable

        # The list of accounts that failed to get tax exemptions.
        @[JSON::Field(key: "failedAccounts")]
        getter failed_accounts : Array(String)?

        # The tax exemption details map of accountId and tax exemption details.
        @[JSON::Field(key: "taxExemptionDetailsMap")]
        getter tax_exemption_details_map : Hash(String, Types::TaxExemptionDetails)?

        def initialize(
          @failed_accounts : Array(String)? = nil,
          @tax_exemption_details_map : Hash(String, Types::TaxExemptionDetails)? = nil
        )
        end
      end

      # The error object for representing failures in the BatchPutTaxRegistration operation.
      struct BatchPutTaxRegistrationError
        include JSON::Serializable

        # The unique account identifier for the account that the tax registration couldn't be added, or
        # updated during the BatchPutTaxRegistration operation.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The error message for an individual failure in the BatchPutTaxRegistration operation.
        @[JSON::Field(key: "message")]
        getter message : String

        # The error code for an individual failure in the BatchPutTaxRegistration operation.
        @[JSON::Field(key: "code")]
        getter code : String?

        def initialize(
          @account_id : String,
          @message : String,
          @code : String? = nil
        )
        end
      end

      struct BatchPutTaxRegistrationRequest
        include JSON::Serializable

        # List of unique account identifiers.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # Your TRN information that will be stored to the accounts mentioned in putEntries .
        @[JSON::Field(key: "taxRegistrationEntry")]
        getter tax_registration_entry : Types::TaxRegistrationEntry

        def initialize(
          @account_ids : Array(String),
          @tax_registration_entry : Types::TaxRegistrationEntry
        )
        end
      end

      struct BatchPutTaxRegistrationResponse
        include JSON::Serializable

        # List of errors for the accounts the TRN information could not be added or updated to.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchPutTaxRegistrationError)

        # The status of your TRN stored in the system after processing. Based on the validation occurring on
        # the TRN, the status can be Verified , Pending or Rejected .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @errors : Array(Types::BatchPutTaxRegistrationError),
          @status : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Brazil.
      struct BrazilAdditionalInfo
        include JSON::Serializable

        # The Cadastro de Contribuintes Mobiliários (CCM) code for your TRN in Brazil. This only applies for a
        # CNPJ tax type for the São Paulo municipality.
        @[JSON::Field(key: "ccmCode")]
        getter ccm_code : String?

        # Legal nature of business, based on your TRN in Brazil. This only applies for a CNPJ tax type.
        @[JSON::Field(key: "legalNatureCode")]
        getter legal_nature_code : String?

        def initialize(
          @ccm_code : String? = nil,
          @legal_nature_code : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Canada .
      struct CanadaAdditionalInfo
        include JSON::Serializable

        # The Quebec Sales Tax ID number. Leave blank if you do not have a Quebec Sales Tax ID number.
        @[JSON::Field(key: "canadaQuebecSalesTaxNumber")]
        getter canada_quebec_sales_tax_number : String?

        # Manitoba Retail Sales Tax ID number. Customers purchasing Amazon Web Services services for resale in
        # Manitoba must provide a valid Retail Sales Tax ID number for Manitoba. Leave this blank if you do
        # not have a Retail Sales Tax ID number in Manitoba or are not purchasing Amazon Web Services services
        # for resale.
        @[JSON::Field(key: "canadaRetailSalesTaxNumber")]
        getter canada_retail_sales_tax_number : String?

        # The value for this parameter must be true if the provincialSalesTaxId value is provided for a TRN in
        # British Columbia, Saskatchewan, or Manitoba provinces. To claim a provincial sales tax (PST) and
        # retail sales tax (RST) reseller exemption, you must confirm that purchases from this account were
        # made for resale. Otherwise, remove the PST or RST number from the provincialSalesTaxId parameter
        # from your request.
        @[JSON::Field(key: "isResellerAccount")]
        getter is_reseller_account : Bool?

        # The provincial sales tax ID for your TRN in Canada. This parameter can represent the following:
        # Provincial sales tax ID number for British Columbia and Saskatchewan provinces Manitoba retail sales
        # tax ID number for Manitoba province Quebec sales tax ID number for Quebec province The Tax Setting
        # API only accepts this parameter if the TRN is specified for the previous provinces. For other
        # provinces, the Tax Settings API doesn't accept this parameter.
        @[JSON::Field(key: "provincialSalesTaxId")]
        getter provincial_sales_tax_id : String?

        def initialize(
          @canada_quebec_sales_tax_number : String? = nil,
          @canada_retail_sales_tax_number : String? = nil,
          @is_reseller_account : Bool? = nil,
          @provincial_sales_tax_id : String? = nil
        )
        end
      end

      # You've exceeded the Amazon Web ServicesSupport case creation limit for your account.
      struct CaseCreationLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The exception when the input is creating conflict with the given state.
      struct ConflictException
        include JSON::Serializable

        # 409
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error_code : String,
          @message : String
        )
        end
      end

      struct DeleteSupplementalTaxRegistrationRequest
        include JSON::Serializable

        # The unique authority Id for the supplemental TRN information that needs to be deleted.
        @[JSON::Field(key: "authorityId")]
        getter authority_id : String

        def initialize(
          @authority_id : String
        )
        end
      end

      struct DeleteSupplementalTaxRegistrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteTaxRegistrationRequest
        include JSON::Serializable

        # Unique account identifier for the TRN information that needs to be deleted. If this isn't passed,
        # the account ID corresponding to the credentials of the API caller will be used for this parameter.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      struct DeleteTaxRegistrationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The location of the Amazon S3 bucket that you specify to download your tax documents to.
      struct DestinationS3Location
        include JSON::Serializable

        # The name of your Amazon S3 bucket that you specify to download your tax documents to.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The Amazon S3 object prefix that you specify for your tax document file.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String,
          @prefix : String? = nil
        )
        end
      end

      # Additional tax information to specify for a TRN in Egypt.
      struct EgyptAdditionalInfo
        include JSON::Serializable

        # The unique identification number provided by the Egypt Tax Authority.
        @[JSON::Field(key: "uniqueIdentificationNumber")]
        getter unique_identification_number : String?

        # The expiration date of the unique identification number provided by the Egypt Tax Authority.
        @[JSON::Field(key: "uniqueIdentificationNumberExpirationDate")]
        getter unique_identification_number_expiration_date : String?

        def initialize(
          @unique_identification_number : String? = nil,
          @unique_identification_number_expiration_date : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Estonia.
      struct EstoniaAdditionalInfo
        include JSON::Serializable

        # Registry commercial code (RCC) for your TRN in Estonia. This value is an eight-numeric string, such
        # as 12345678 .
        @[JSON::Field(key: "registryCommercialCode")]
        getter registry_commercial_code : String

        def initialize(
          @registry_commercial_code : String
        )
        end
      end

      # The exemption certificate.
      struct ExemptionCertificate
        include JSON::Serializable

        # The exemption certificate file content.
        @[JSON::Field(key: "documentFile")]
        getter document_file : Bytes

        # The exemption certificate file name.
        @[JSON::Field(key: "documentName")]
        getter document_name : String

        def initialize(
          @document_file : Bytes,
          @document_name : String
        )
        end
      end

      # Additional tax information associated with your TRN in Georgia.
      struct GeorgiaAdditionalInfo
        include JSON::Serializable

        # The legal person or physical person assigned to this TRN in Georgia.
        @[JSON::Field(key: "personType")]
        getter person_type : String

        def initialize(
          @person_type : String
        )
        end
      end

      struct GetTaxExemptionTypesRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetTaxExemptionTypesResponse
        include JSON::Serializable

        # The supported types of tax exemptions.
        @[JSON::Field(key: "taxExemptionTypes")]
        getter tax_exemption_types : Array(Types::TaxExemptionType)?

        def initialize(
          @tax_exemption_types : Array(Types::TaxExemptionType)? = nil
        )
        end
      end

      struct GetTaxInheritanceRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetTaxInheritanceResponse
        include JSON::Serializable

        # The tax inheritance status.
        @[JSON::Field(key: "heritageStatus")]
        getter heritage_status : String?

        def initialize(
          @heritage_status : String? = nil
        )
        end
      end

      struct GetTaxRegistrationDocumentRequest
        include JSON::Serializable

        # The metadata for your tax document.
        @[JSON::Field(key: "taxDocumentMetadata")]
        getter tax_document_metadata : Types::TaxDocumentMetadata

        # The Amazon S3 bucket that you specify to download your tax documents to.
        @[JSON::Field(key: "destinationS3Location")]
        getter destination_s3_location : Types::DestinationS3Location?

        def initialize(
          @tax_document_metadata : Types::TaxDocumentMetadata,
          @destination_s3_location : Types::DestinationS3Location? = nil
        )
        end
      end

      struct GetTaxRegistrationDocumentResponse
        include JSON::Serializable

        # The file path of the Amazon S3 bucket where you want to download your tax document to.
        @[JSON::Field(key: "destinationFilePath")]
        getter destination_file_path : String?

        # The Amazon S3 presigned URL of the tax registration document.
        @[JSON::Field(key: "presignedS3Url")]
        getter presigned_s3_url : String?

        def initialize(
          @destination_file_path : String? = nil,
          @presigned_s3_url : String? = nil
        )
        end
      end

      struct GetTaxRegistrationRequest
        include JSON::Serializable

        # Your unique account identifier.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @account_id : String? = nil
        )
        end
      end

      struct GetTaxRegistrationResponse
        include JSON::Serializable

        # TRN information of the account mentioned in the request.
        @[JSON::Field(key: "taxRegistration")]
        getter tax_registration : Types::TaxRegistration?

        def initialize(
          @tax_registration : Types::TaxRegistration? = nil
        )
        end
      end

      # Additional tax information to specify for a TRN in Greece.
      struct GreeceAdditionalInfo
        include JSON::Serializable

        # The code of contracting authority for e-invoicing.
        @[JSON::Field(key: "contractingAuthorityCode")]
        getter contracting_authority_code : String?

        def initialize(
          @contracting_authority_code : String? = nil
        )
        end
      end

      # Additional tax information in India.
      struct IndiaAdditionalInfo
        include JSON::Serializable

        # India pan information associated with the account.
        @[JSON::Field(key: "pan")]
        getter pan : String?

        def initialize(
          @pan : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Indonesia.
      struct IndonesiaAdditionalInfo
        include JSON::Serializable

        # VAT-exempt customers have a Directorate General of Taxation (DGT) exemption letter or certificate
        # (Surat Keterangan Bebas) decision number. Non-collected VAT have a DGT letter or certificate (Surat
        # Keterangan Tidak Dipungut).
        @[JSON::Field(key: "decisionNumber")]
        getter decision_number : String?

        # Exception code if you are designated by Directorate General of Taxation (DGT) as a VAT collector,
        # non-collected VAT, or VAT-exempt customer.
        @[JSON::Field(key: "ppnExceptionDesignationCode")]
        getter ppn_exception_designation_code : String?

        # The tax registration number type.
        @[JSON::Field(key: "taxRegistrationNumberType")]
        getter tax_registration_number_type : String?

        def initialize(
          @decision_number : String? = nil,
          @ppn_exception_designation_code : String? = nil,
          @tax_registration_number_type : String? = nil
        )
        end
      end

      # The exception thrown when an unexpected error occurs when processing a request.
      struct InternalServerException
        include JSON::Serializable

        # 500
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error_code : String,
          @message : String
        )
        end
      end

      # Additional tax information associated with your TRN in Israel.
      struct IsraelAdditionalInfo
        include JSON::Serializable

        # Customer type for your TRN in Israel. The value can be Business or Individual . Use Business for
        # entities such as not-for-profit and financial institutions.
        @[JSON::Field(key: "customerType")]
        getter customer_type : String

        # Dealer type for your TRN in Israel. If you're not a local authorized dealer with an Israeli VAT ID,
        # specify your tax identification number so that Amazon Web Services can send you a compliant tax
        # invoice.
        @[JSON::Field(key: "dealerType")]
        getter dealer_type : String

        def initialize(
          @customer_type : String,
          @dealer_type : String
        )
        end
      end

      # Additional tax information associated with your TRN in Italy.
      struct ItalyAdditionalInfo
        include JSON::Serializable

        # The tender procedure identification code.
        @[JSON::Field(key: "cigNumber")]
        getter cig_number : String?

        # Additional tax information to specify for a TRN in Italy. This is managed by the Interministerial
        # Committee for Economic Planning (CIPE) which characterizes every public investment project
        # (Individual Project Code).
        @[JSON::Field(key: "cupNumber")]
        getter cup_number : String?

        # Additional tax information to specify for a TRN in Italy. Use CodiceDestinatario to receive your
        # invoices via web service (API) or FTP.
        @[JSON::Field(key: "sdiAccountId")]
        getter sdi_account_id : String?

        # List of service tax codes for your TRN in Italy. You can use your customer tax code as part of a VAT
        # Group.
        @[JSON::Field(key: "taxCode")]
        getter tax_code : String?

        def initialize(
          @cig_number : String? = nil,
          @cup_number : String? = nil,
          @sdi_account_id : String? = nil,
          @tax_code : String? = nil
        )
        end
      end

      # The jurisdiction details of the TRN information of the customers. This doesn't contain full legal
      # address, and contains only country code and state/region/province.
      struct Jurisdiction
        include JSON::Serializable

        # The country code of the jurisdiction.
        @[JSON::Field(key: "countryCode")]
        getter country_code : String

        # The state, region, or province associated with the country of the jurisdiction, if applicable.
        @[JSON::Field(key: "stateOrRegion")]
        getter state_or_region : String?

        def initialize(
          @country_code : String,
          @state_or_region : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Kenya.
      struct KenyaAdditionalInfo
        include JSON::Serializable

        # The legal person or physical person assigned to this TRN in Kenya.
        @[JSON::Field(key: "personType")]
        getter person_type : String

        def initialize(
          @person_type : String
        )
        end
      end

      struct ListSupplementalTaxRegistrationsRequest
        include JSON::Serializable

        # The number of taxRegistrations results you want in one response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSupplementalTaxRegistrationsResponse
        include JSON::Serializable

        # The list of supplemental tax registrations.
        @[JSON::Field(key: "taxRegistrations")]
        getter tax_registrations : Array(Types::SupplementalTaxRegistration)

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tax_registrations : Array(Types::SupplementalTaxRegistration),
          @next_token : String? = nil
        )
        end
      end

      struct ListTaxExemptionsRequest
        include JSON::Serializable

        # The number of results you want in one response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTaxExemptionsResponse
        include JSON::Serializable

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The tax exemption details map of accountId and tax exemption details.
        @[JSON::Field(key: "taxExemptionDetailsMap")]
        getter tax_exemption_details_map : Hash(String, Types::TaxExemptionDetails)?

        def initialize(
          @next_token : String? = nil,
          @tax_exemption_details_map : Hash(String, Types::TaxExemptionDetails)? = nil
        )
        end
      end

      struct ListTaxRegistrationsRequest
        include JSON::Serializable

        # Number of accountDetails results you want in one response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTaxRegistrationsResponse
        include JSON::Serializable

        # The list of account details. This contains account Ids and TRN Information for each of the linked
        # accounts.
        @[JSON::Field(key: "accountDetails")]
        getter account_details : Array(Types::AccountDetails)

        # The token to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_details : Array(Types::AccountDetails),
          @next_token : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Malaysia.
      struct MalaysiaAdditionalInfo
        include JSON::Serializable

        # The tax registration number (TRN) in Malaysia. For individual, you can specify the
        # taxInformationNumber in MalaysiaAdditionalInfo with NRIC type, and a valid MyKad or NRIC number. For
        # business, you must specify a businessRegistrationNumber in MalaysiaAdditionalInfo with a TIN type
        # and tax identification number. For business resellers, you must specify a businessRegistrationNumber
        # and taxInformationNumber in MalaysiaAdditionalInfo with a sales and service tax (SST) type and a
        # valid SST number. For business resellers with service codes, you must specify
        # businessRegistrationNumber , taxInformationNumber , and distinct serviceTaxCodes in
        # MalaysiaAdditionalInfo with a SST type and valid sales and service tax (SST) number. By using this
        # API operation, Amazon Web Services registers your self-declaration that you’re an authorized
        # business reseller registered with the Royal Malaysia Customs Department (RMCD), and have a valid SST
        # number.
        @[JSON::Field(key: "businessRegistrationNumber")]
        getter business_registration_number : String?

        # List of service tax codes for your TRN in Malaysia.
        @[JSON::Field(key: "serviceTaxCodes")]
        getter service_tax_codes : Array(String)?

        # The tax information number in Malaysia. For individual, you can specify the taxInformationNumber in
        # MalaysiaAdditionalInfo with NRIC type, and a valid MyKad or NRIC number. For business resellers, you
        # must specify a businessRegistrationNumber and taxInformationNumber in MalaysiaAdditionalInfo with a
        # sales and service tax (SST) type and a valid SST number. For business resellers with service codes,
        # you must specify businessRegistrationNumber , taxInformationNumber , and distinct serviceTaxCodes in
        # MalaysiaAdditionalInfo with a SST type and valid sales and service tax (SST) number. By using this
        # API operation, Amazon Web Services registers your self-declaration that you’re an authorized
        # business reseller registered with the Royal Malaysia Customs Department (RMCD), and have a valid SST
        # number.
        @[JSON::Field(key: "taxInformationNumber")]
        getter tax_information_number : String?

        def initialize(
          @business_registration_number : String? = nil,
          @service_tax_codes : Array(String)? = nil,
          @tax_information_number : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Poland.
      struct PolandAdditionalInfo
        include JSON::Serializable

        # The individual tax registration number (NIP). Individual NIP is valid for other taxes excluding VAT
        # purposes.
        @[JSON::Field(key: "individualRegistrationNumber")]
        getter individual_registration_number : String?

        # True if your business is a member of a VAT group with a NIP active for VAT purposes. Otherwise, this
        # is false.
        @[JSON::Field(key: "isGroupVatEnabled")]
        getter is_group_vat_enabled : Bool?

        def initialize(
          @individual_registration_number : String? = nil,
          @is_group_vat_enabled : Bool? = nil
        )
        end
      end

      struct PutSupplementalTaxRegistrationRequest
        include JSON::Serializable

        # The supplemental TRN information that will be stored for the caller account ID.
        @[JSON::Field(key: "taxRegistrationEntry")]
        getter tax_registration_entry : Types::SupplementalTaxRegistrationEntry

        def initialize(
          @tax_registration_entry : Types::SupplementalTaxRegistrationEntry
        )
        end
      end

      struct PutSupplementalTaxRegistrationResponse
        include JSON::Serializable

        # Unique authority ID for the supplemental TRN information that was stored.
        @[JSON::Field(key: "authorityId")]
        getter authority_id : String

        # The status of the supplemental TRN stored in the system after processing. Based on the validation
        # occurring on the TRN, the status can be Verified , Pending , Rejected , or Deleted .
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @authority_id : String,
          @status : String
        )
        end
      end

      struct PutTaxExemptionRequest
        include JSON::Serializable

        # The list of unique account identifiers.
        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        @[JSON::Field(key: "authority")]
        getter authority : Types::Authority

        @[JSON::Field(key: "exemptionCertificate")]
        getter exemption_certificate : Types::ExemptionCertificate

        # The exemption type. Use the supported tax exemption type description.
        @[JSON::Field(key: "exemptionType")]
        getter exemption_type : String

        def initialize(
          @account_ids : Array(String),
          @authority : Types::Authority,
          @exemption_certificate : Types::ExemptionCertificate,
          @exemption_type : String
        )
        end
      end

      struct PutTaxExemptionResponse
        include JSON::Serializable

        # The customer support case ID.
        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        def initialize(
          @case_id : String? = nil
        )
        end
      end

      struct PutTaxInheritanceRequest
        include JSON::Serializable

        # The tax inheritance status.
        @[JSON::Field(key: "heritageStatus")]
        getter heritage_status : String?

        def initialize(
          @heritage_status : String? = nil
        )
        end
      end

      struct PutTaxInheritanceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct PutTaxRegistrationRequest
        include JSON::Serializable

        # Your TRN information that will be stored to the account mentioned in accountId .
        @[JSON::Field(key: "taxRegistrationEntry")]
        getter tax_registration_entry : Types::TaxRegistrationEntry

        # Your unique account identifier.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        def initialize(
          @tax_registration_entry : Types::TaxRegistrationEntry,
          @account_id : String? = nil
        )
        end
      end

      struct PutTaxRegistrationResponse
        include JSON::Serializable

        # The status of your TRN stored in the system after processing. Based on the validation occurring on
        # the TRN, the status can be Verified , Pending or Rejected .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The exception thrown when the input doesn't have a resource associated to it.
      struct ResourceNotFoundException
        include JSON::Serializable

        # 404
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @error_code : String,
          @message : String
        )
        end
      end

      # Additional tax information to specify for a TRN in Romania.
      struct RomaniaAdditionalInfo
        include JSON::Serializable

        # The tax registration number type. The value can be TaxRegistrationNumber or LocalRegistrationNumber
        # .
        @[JSON::Field(key: "taxRegistrationNumberType")]
        getter tax_registration_number_type : String

        def initialize(
          @tax_registration_number_type : String
        )
        end
      end

      # Additional tax information associated with your TRN in Saudi Arabia.
      struct SaudiArabiaAdditionalInfo
        include JSON::Serializable

        # The tax registration number type.
        @[JSON::Field(key: "taxRegistrationNumberType")]
        getter tax_registration_number_type : String?

        def initialize(
          @tax_registration_number_type : String? = nil
        )
        end
      end

      # The Amazon S3 bucket in your account where your tax document is located.
      struct SourceS3Location
        include JSON::Serializable

        # The name of your Amazon S3 bucket that your tax document is located.
        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The object key of your tax document object in Amazon S3.
        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Additional tax information associated with your TRN in South Korea.
      struct SouthKoreaAdditionalInfo
        include JSON::Serializable

        # The business legal name based on the most recently uploaded tax registration certificate.
        @[JSON::Field(key: "businessRepresentativeName")]
        getter business_representative_name : String

        # Item of business based on the most recently uploaded tax registration certificate.
        @[JSON::Field(key: "itemOfBusiness")]
        getter item_of_business : String

        # Line of business based on the most recently uploaded tax registration certificate.
        @[JSON::Field(key: "lineOfBusiness")]
        getter line_of_business : String

        def initialize(
          @business_representative_name : String,
          @item_of_business : String,
          @line_of_business : String
        )
        end
      end

      # Additional tax information associated with your TRN in Spain.
      struct SpainAdditionalInfo
        include JSON::Serializable

        # The registration type in Spain.
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        def initialize(
          @registration_type : String
        )
        end
      end

      # Supplemental TRN details.
      struct SupplementalTaxRegistration
        include JSON::Serializable

        @[JSON::Field(key: "address")]
        getter address : Types::Address

        # Unique authority ID for the supplemental TRN.
        @[JSON::Field(key: "authorityId")]
        getter authority_id : String

        # The legal name associated with your TRN registration.
        @[JSON::Field(key: "legalName")]
        getter legal_name : String

        # The supplemental TRN unique identifier.
        @[JSON::Field(key: "registrationId")]
        getter registration_id : String

        # Type of supplemental TRN. Currently, this can only be VAT.
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        # The status of your TRN.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @address : Types::Address,
          @authority_id : String,
          @legal_name : String,
          @registration_id : String,
          @registration_type : String,
          @status : String
        )
        end
      end

      # The supplemental TRN information to provide when adding or updating a supplemental TRN.
      struct SupplementalTaxRegistrationEntry
        include JSON::Serializable

        @[JSON::Field(key: "address")]
        getter address : Types::Address

        # The legal name associated with your TRN registration.
        @[JSON::Field(key: "legalName")]
        getter legal_name : String

        # The supplemental TRN unique identifier.
        @[JSON::Field(key: "registrationId")]
        getter registration_id : String

        # Type of supplemental TRN. Currently, this can only be VAT.
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        def initialize(
          @address : Types::Address,
          @legal_name : String,
          @registration_id : String,
          @registration_type : String
        )
        end
      end

      # The metadata for your tax document.
      struct TaxDocumentMetadata
        include JSON::Serializable

        # The tax document access token, which contains information that the Tax Settings API uses to locate
        # the tax document. If you update your tax registration, the existing taxDocumentAccessToken won't be
        # valid. To get the latest token, call the GetTaxRegistration or ListTaxRegistrations API operation.
        # This token is valid for 24 hours.
        @[JSON::Field(key: "taxDocumentAccessToken")]
        getter tax_document_access_token : String

        # The name of your tax document.
        @[JSON::Field(key: "taxDocumentName")]
        getter tax_document_name : String

        def initialize(
          @tax_document_access_token : String,
          @tax_document_name : String
        )
        end
      end

      # The tax exemption.
      struct TaxExemption
        include JSON::Serializable

        # The address domain associate with tax exemption.
        @[JSON::Field(key: "authority")]
        getter authority : Types::Authority

        # The tax exemption type.
        @[JSON::Field(key: "taxExemptionType")]
        getter tax_exemption_type : Types::TaxExemptionType

        # The tax exemption effective date.
        @[JSON::Field(key: "effectiveDate")]
        getter effective_date : Time?

        # The tax exemption expiration date.
        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # The tax exemption status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The tax exemption recording time in the TaxSettings system.
        @[JSON::Field(key: "systemEffectiveDate")]
        getter system_effective_date : Time?

        def initialize(
          @authority : Types::Authority,
          @tax_exemption_type : Types::TaxExemptionType,
          @effective_date : Time? = nil,
          @expiration_date : Time? = nil,
          @status : String? = nil,
          @system_effective_date : Time? = nil
        )
        end
      end

      # The tax exemption details.
      struct TaxExemptionDetails
        include JSON::Serializable

        # The indicator if the tax exemption is inherited from the consolidated billing family management
        # account.
        @[JSON::Field(key: "heritageObtainedDetails")]
        getter heritage_obtained_details : Bool?

        # The consolidated billing family management account the tax exemption inherited from.
        @[JSON::Field(key: "heritageObtainedParentEntity")]
        getter heritage_obtained_parent_entity : String?

        # The reason of the heritage inheritance.
        @[JSON::Field(key: "heritageObtainedReason")]
        getter heritage_obtained_reason : String?

        # Tax exemptions.
        @[JSON::Field(key: "taxExemptions")]
        getter tax_exemptions : Array(Types::TaxExemption)?

        def initialize(
          @heritage_obtained_details : Bool? = nil,
          @heritage_obtained_parent_entity : String? = nil,
          @heritage_obtained_reason : String? = nil,
          @tax_exemptions : Array(Types::TaxExemption)? = nil
        )
        end
      end

      # The tax exemption type.
      struct TaxExemptionType
        include JSON::Serializable

        # The tax exemption's applicable jurisdictions.
        @[JSON::Field(key: "applicableJurisdictions")]
        getter applicable_jurisdictions : Array(Types::Authority)?

        # The tax exemption's type description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The tax exemption's type display name.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @applicable_jurisdictions : Array(Types::Authority)? = nil,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      # Tax inheritance information associated with the account.
      struct TaxInheritanceDetails
        include JSON::Serializable

        # Tax inheritance reason information associated with the account.
        @[JSON::Field(key: "inheritanceObtainedReason")]
        getter inheritance_obtained_reason : String?

        # Tax inheritance parent account information associated with the account.
        @[JSON::Field(key: "parentEntityId")]
        getter parent_entity_id : String?

        def initialize(
          @inheritance_obtained_reason : String? = nil,
          @parent_entity_id : String? = nil
        )
        end
      end

      # Your TRN information.
      struct TaxRegistration
        include JSON::Serializable

        # The legal address associated with your TRN registration.
        @[JSON::Field(key: "legalAddress")]
        getter legal_address : Types::Address

        # The legal name associated with your TRN registration.
        @[JSON::Field(key: "legalName")]
        getter legal_name : String

        # Your tax registration unique identifier.
        @[JSON::Field(key: "registrationId")]
        getter registration_id : String

        # Type of your tax registration.
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        # The status of your TRN. This can be either Verified , Pending , Deleted , or Rejected .
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional tax information associated with your TRN.
        @[JSON::Field(key: "additionalTaxInformation")]
        getter additional_tax_information : Types::AdditionalInfoResponse?

        # The email address to receive VAT invoices.
        @[JSON::Field(key: "certifiedEmailId")]
        getter certified_email_id : String?

        # The industry that describes your business. For business-to-business (B2B) customers, specify
        # Business. For business-to-consumer (B2C) customers, specify Individual. For business-to-government
        # (B2G), specify Government. Note that certain values may not applicable for the request country.
        # Please refer to country specific information in API document.
        @[JSON::Field(key: "sector")]
        getter sector : String?

        # The metadata for your tax document.
        @[JSON::Field(key: "taxDocumentMetadatas")]
        getter tax_document_metadatas : Array(Types::TaxDocumentMetadata)?

        def initialize(
          @legal_address : Types::Address,
          @legal_name : String,
          @registration_id : String,
          @registration_type : String,
          @status : String,
          @additional_tax_information : Types::AdditionalInfoResponse? = nil,
          @certified_email_id : String? = nil,
          @sector : String? = nil,
          @tax_document_metadatas : Array(Types::TaxDocumentMetadata)? = nil
        )
        end
      end

      # The tax registration document.
      struct TaxRegistrationDocFile
        include JSON::Serializable

        # The tax registration document content.
        @[JSON::Field(key: "fileContent")]
        getter file_content : Bytes

        # The tax registration document name.
        @[JSON::Field(key: "fileName")]
        getter file_name : String

        def initialize(
          @file_content : Bytes,
          @file_name : String
        )
        end
      end

      # Tax registration document information.
      struct TaxRegistrationDocument
        include JSON::Serializable

        # The tax registration document.
        @[JSON::Field(key: "file")]
        getter file : Types::TaxRegistrationDocFile?

        # The Amazon S3 location where your tax registration document is stored.
        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::SourceS3Location?

        def initialize(
          @file : Types::TaxRegistrationDocFile? = nil,
          @s3_location : Types::SourceS3Location? = nil
        )
        end
      end

      # The TRN information you provide when you add a new TRN, or update.
      struct TaxRegistrationEntry
        include JSON::Serializable

        # Your tax registration unique identifier.
        @[JSON::Field(key: "registrationId")]
        getter registration_id : String

        # Your tax registration type. This can be either VAT or GST .
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        # Additional tax information associated with your TRN. You only need to specify this parameter if
        # Amazon Web Services collects any additional information for your country within
        # AdditionalInfoRequest .
        @[JSON::Field(key: "additionalTaxInformation")]
        getter additional_tax_information : Types::AdditionalInfoRequest?

        # The email address to receive VAT invoices.
        @[JSON::Field(key: "certifiedEmailId")]
        getter certified_email_id : String?

        # The legal address associated with your TRN. If you're setting a TRN in Brazil for the CNPJ tax type,
        # you don't need to specify the legal address. For TRNs in other countries and for CPF tax types
        # Brazil, you must specify the legal address.
        @[JSON::Field(key: "legalAddress")]
        getter legal_address : Types::Address?

        # The legal name associated with your TRN. If you're setting a TRN in Brazil, you don't need to
        # specify the legal name. For TRNs in other countries, you must specify the legal name.
        @[JSON::Field(key: "legalName")]
        getter legal_name : String?

        # The industry that describes your business. For business-to-business (B2B) customers, specify
        # Business. For business-to-consumer (B2C) customers, specify Individual. For business-to-government
        # (B2G), specify Government.Note that certain values may not applicable for the request country.
        # Please refer to country specific information in API document.
        @[JSON::Field(key: "sector")]
        getter sector : String?

        # Additional details needed to verify your TRN information in Brazil. You only need to specify this
        # parameter when you set a TRN in Brazil that is the CPF tax type. Don't specify this parameter to set
        # a TRN in Brazil of the CNPJ tax type or to set a TRN for another country.
        @[JSON::Field(key: "verificationDetails")]
        getter verification_details : Types::VerificationDetails?

        def initialize(
          @registration_id : String,
          @registration_type : String,
          @additional_tax_information : Types::AdditionalInfoRequest? = nil,
          @certified_email_id : String? = nil,
          @legal_address : Types::Address? = nil,
          @legal_name : String? = nil,
          @sector : String? = nil,
          @verification_details : Types::VerificationDetails? = nil
        )
        end
      end

      # Your TRN information with jurisdiction details. This doesn't contain the full legal address
      # associated with the TRN information.
      struct TaxRegistrationWithJurisdiction
        include JSON::Serializable

        # The jurisdiction associated with your TRN information.
        @[JSON::Field(key: "jurisdiction")]
        getter jurisdiction : Types::Jurisdiction

        # The legal name associated with your TRN information.
        @[JSON::Field(key: "legalName")]
        getter legal_name : String

        # Your tax registration unique identifier.
        @[JSON::Field(key: "registrationId")]
        getter registration_id : String

        # The type of your tax registration. This can be either VAT or GST .
        @[JSON::Field(key: "registrationType")]
        getter registration_type : String

        # The status of your TRN. This can be either Verified , Pending , Deleted , or Rejected .
        @[JSON::Field(key: "status")]
        getter status : String

        # Additional tax information associated with your TRN.
        @[JSON::Field(key: "additionalTaxInformation")]
        getter additional_tax_information : Types::AdditionalInfoResponse?

        # The email address to receive VAT invoices.
        @[JSON::Field(key: "certifiedEmailId")]
        getter certified_email_id : String?

        # The industry that describes your business. For business-to-business (B2B) customers, specify
        # Business. For business-to-consumer (B2C) customers, specify Individual. For business-to-government
        # (B2G), specify Government.Note that certain values may not applicable for the request country.
        # Please refer to country specific information in API document.
        @[JSON::Field(key: "sector")]
        getter sector : String?

        # The metadata for your tax document.
        @[JSON::Field(key: "taxDocumentMetadatas")]
        getter tax_document_metadatas : Array(Types::TaxDocumentMetadata)?

        def initialize(
          @jurisdiction : Types::Jurisdiction,
          @legal_name : String,
          @registration_id : String,
          @registration_type : String,
          @status : String,
          @additional_tax_information : Types::AdditionalInfoResponse? = nil,
          @certified_email_id : String? = nil,
          @sector : String? = nil,
          @tax_document_metadatas : Array(Types::TaxDocumentMetadata)? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Turkey.
      struct TurkeyAdditionalInfo
        include JSON::Serializable

        # The industry information that tells the Tax Settings API if you're subject to additional withholding
        # taxes. This information required for business-to-business (B2B) customers. This information is
        # conditionally mandatory for B2B customers who are subject to KDV tax.
        @[JSON::Field(key: "industries")]
        getter industries : String?

        # The Registered Electronic Mail (REM) that is used to send notarized communication. This parameter is
        # optional for business-to-business (B2B) and business-to-government (B2G) customers. It's not
        # required for business-to-consumer (B2C) customers.
        @[JSON::Field(key: "kepEmailId")]
        getter kep_email_id : String?

        # Secondary tax ID (“harcama birimi VKN”si”). If one isn't provided, we will use your VKN as the
        # secondary ID.
        @[JSON::Field(key: "secondaryTaxId")]
        getter secondary_tax_id : String?

        # The tax office where you're registered. You can enter this information as a string. The Tax Settings
        # API will add this information to your invoice. This parameter is required for business-to-business
        # (B2B) and business-to-government customers. It's not required for business-to-consumer (B2C)
        # customers.
        @[JSON::Field(key: "taxOffice")]
        getter tax_office : String?

        def initialize(
          @industries : String? = nil,
          @kep_email_id : String? = nil,
          @secondary_tax_id : String? = nil,
          @tax_office : String? = nil
        )
        end
      end

      # Additional tax information associated with your TRN in Ukraine.
      struct UkraineAdditionalInfo
        include JSON::Serializable

        # The tax registration type.
        @[JSON::Field(key: "ukraineTrnType")]
        getter ukraine_trn_type : String

        def initialize(
          @ukraine_trn_type : String
        )
        end
      end

      # Additional tax information to specify for a TRN in Uzbekistan.
      struct UzbekistanAdditionalInfo
        include JSON::Serializable

        # The tax registration number type. The tax registration number type valid values are Business and
        # Individual .
        @[JSON::Field(key: "taxRegistrationNumberType")]
        getter tax_registration_number_type : String?

        # The unique 12-digit number issued to identify VAT-registered identities in Uzbekistan.
        @[JSON::Field(key: "vatRegistrationNumber")]
        getter vat_registration_number : String?

        def initialize(
          @tax_registration_number_type : String? = nil,
          @vat_registration_number : String? = nil
        )
        end
      end

      # The exception when the input doesn't pass validation for at least one of the input parameters.
      struct ValidationException
        include JSON::Serializable

        # 400
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        @[JSON::Field(key: "message")]
        getter message : String

        # 400
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @error_code : String,
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The information about the specified parameter in the request that caused an error.
      struct ValidationExceptionField
        include JSON::Serializable

        # The name of the parameter that caused a ValidationException error.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Required information to verify your TRN.
      struct VerificationDetails
        include JSON::Serializable

        # Date of birth to verify your submitted TRN. Use the YYYY-MM-DD format.
        @[JSON::Field(key: "dateOfBirth")]
        getter date_of_birth : String?

        # The tax registration document, which is required for specific countries such as Bangladesh, Kenya,
        # South Korea and Spain.
        @[JSON::Field(key: "taxRegistrationDocuments")]
        getter tax_registration_documents : Array(Types::TaxRegistrationDocument)?

        def initialize(
          @date_of_birth : String? = nil,
          @tax_registration_documents : Array(Types::TaxRegistrationDocument)? = nil
        )
        end
      end

      # Additional tax information to specify for a TRN in Vietnam.
      struct VietnamAdditionalInfo
        include JSON::Serializable

        # The electronic transaction code number on the tax return document. This field must be provided for
        # successful API operation.
        @[JSON::Field(key: "electronicTransactionCodeNumber")]
        getter electronic_transaction_code_number : String?

        # The enterprise identification number for tax registration. This field must be provided for
        # successful API operation.
        @[JSON::Field(key: "enterpriseIdentificationNumber")]
        getter enterprise_identification_number : String?

        # The payment voucher number on the tax return payment document. This field must be provided for
        # successful API operation.
        @[JSON::Field(key: "paymentVoucherNumber")]
        getter payment_voucher_number : String?

        # The date on the tax return payment document. This field must be provided for successful API
        # operation.
        @[JSON::Field(key: "paymentVoucherNumberDate")]
        getter payment_voucher_number_date : String?

        def initialize(
          @electronic_transaction_code_number : String? = nil,
          @enterprise_identification_number : String? = nil,
          @payment_voucher_number : String? = nil,
          @payment_voucher_number_date : String? = nil
        )
        end
      end
    end
  end
end
