module AwsSdk
  module TaxSettings
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

      # Deletes tax registration for multiple accounts in batch. This can be used to delete tax
      # registrations for up to five accounts in one batch. This API operation can't be used to delete your
      # tax registration in Brazil. Use the Payment preferences page in the Billing and Cost Management
      # console instead.

      def batch_delete_tax_registration(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteTaxRegistrationRequest.new(account_ids: account_ids)
        batch_delete_tax_registration(input)
      end

      def batch_delete_tax_registration(input : Types::BatchDeleteTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the active tax exemptions for a given list of accounts. The IAM action is tax:GetExemptions .

      def batch_get_tax_exemptions(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetTaxExemptionsRequest.new(account_ids: account_ids)
        batch_get_tax_exemptions(input)
      end

      def batch_get_tax_exemptions(input : Types::BatchGetTaxExemptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_TAX_EXEMPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tax registration for multiple accounts in batch. This can be used to add or update
      # tax registrations for up to five accounts in one batch. You can't set a TRN if there's a pending
      # TRN. You'll need to delete the pending TRN first. To call this API operation for specific countries,
      # see the following country-specific requirements. Bangladesh You must specify the tax registration
      # certificate document in the taxRegistrationDocuments field of the VerificationDetails object. Brazil
      # You must complete the tax registration process in the Payment preferences page in the Billing and
      # Cost Management console. After your TRN and billing address are verified, you can call this API
      # operation. For Amazon Web Services accounts created through Organizations, you can call this API
      # operation when you don't have a billing address. Georgia The valid personType values are Physical
      # Person and Business . Indonesia PutTaxRegistration : The use of this operation to submit tax
      # information is subject to the Amazon Web Services service terms . By submitting, you’re providing
      # consent for Amazon Web Services to validate NIK, NPWP, and NITKU data, provided by you with the
      # Directorate General of Taxes of Indonesia in accordance with the Minister of Finance Regulation
      # (PMK) Number 112/PMK.03/2022. BatchPutTaxRegistration : The use of this operation to submit tax
      # information is subject to the Amazon Web Services service terms . By submitting, you’re providing
      # consent for Amazon Web Services to validate NIK, NPWP, and NITKU data, provided by you with the
      # Directorate General of Taxes of Indonesia in accordance with the Minister of Finance Regulation
      # (PMK) Number 112/PMK.03/2022, through our third-party partner PT Achilles Advanced Management
      # (OnlinePajak). You must specify the taxRegistrationNumberType in the indonesiaAdditionalInfo field
      # of the additionalTaxInformation object. If you specify decisionNumber , you must specify the
      # ppnExceptionDesignationCode in the indonesiaAdditionalInfo field of the additionalTaxInformation
      # object. If the taxRegistrationNumberType is set to NPWP or NITKU, valid values for
      # ppnExceptionDesignationCode are either 01 , 02 , 03 , 07 , or 08 . For other
      # taxRegistrationNumberType values, ppnExceptionDesignationCode must be either 01 , 07 , or 08 . If
      # ppnExceptionDesignationCode is 07 , you must specify the decisionNumber in the
      # indonesiaAdditionalInfo field of the additionalTaxInformation object. Kenya You must specify the
      # personType in the kenyaAdditionalInfo field of the additionalTaxInformation object. If the
      # personType is Physical Person , you must specify the tax registration certificate document in the
      # taxRegistrationDocuments field of the VerificationDetails object. Malaysia The sector valid values
      # are Business and Individual . RegistrationType valid values are NRIC for individual, and TIN and
      # sales and service tax (SST) for Business. For individual, you can specify the taxInformationNumber
      # in MalaysiaAdditionalInfo with NRIC type, and a valid MyKad or NRIC number. For business, you must
      # specify a businessRegistrationNumber in MalaysiaAdditionalInfo with a TIN type and tax
      # identification number. For business resellers, you must specify a businessRegistrationNumber and
      # taxInformationNumber in MalaysiaAdditionalInfo with a sales and service tax (SST) type and a valid
      # SST number. For business resellers with service codes, you must specify businessRegistrationNumber ,
      # taxInformationNumber , and distinct serviceTaxCodes in MalaysiaAdditionalInfo with a SST type and
      # valid sales and service tax (SST) number. By using this API operation, Amazon Web Services registers
      # your self-declaration that you’re an authorized business reseller registered with the Royal Malaysia
      # Customs Department (RMCD), and have a valid SST number. Amazon Web Services reserves the right to
      # seek additional information and/or take other actions to support your self-declaration as
      # appropriate. Amazon Web Services is currently registered under the following service tax codes. You
      # must include at least one of the service tax codes in the service tax code strings to declare
      # yourself as an authorized registered business reseller. Taxable service and service tax codes:
      # Consultancy - 9907061674 Training or coaching service - 9907071685 IT service - 9907101676 Digital
      # services and electronic medium - 9907121690 Nepal The sector valid values are Business and
      # Individual . Saudi Arabia For address , you must specify addressLine3 . South Korea You must specify
      # the certifiedEmailId and legalName in the TaxRegistrationEntry object. Use Korean characters for
      # legalName . You must specify the businessRepresentativeName , itemOfBusiness , and lineOfBusiness in
      # the southKoreaAdditionalInfo field of the additionalTaxInformation object. Use Korean characters for
      # these fields. You must specify the tax registration certificate document in the
      # taxRegistrationDocuments field of the VerificationDetails object. For the address object, use Korean
      # characters for addressLine1 , addressLine2 city , postalCode , and stateOrRegion . Spain You must
      # specify the registrationType in the spainAdditionalInfo field of the additionalTaxInformation
      # object. If the registrationType is Local , you must specify the tax registration certificate
      # document in the taxRegistrationDocuments field of the VerificationDetails object. Turkey You must
      # specify the sector in the taxRegistrationEntry object. If your sector is Business , Individual , or
      # Government : Specify the taxOffice . If your sector is Individual , don't enter this value.
      # (Optional) Specify the kepEmailId . If your sector is Individual , don't enter this value. Note: In
      # the Tax Settings page of the Billing console, Government appears as Public institutions If your
      # sector is Business and you're subject to KDV tax, you must specify your industry in the industries
      # field. For address , you must specify districtOrCounty . Ukraine The sector valid values are
      # Business and Individual .

      def batch_put_tax_registration(
        account_ids : Array(String),
        tax_registration_entry : Types::TaxRegistrationEntry
      ) : Protocol::Request
        input = Types::BatchPutTaxRegistrationRequest.new(account_ids: account_ids, tax_registration_entry: tax_registration_entry)
        batch_put_tax_registration(input)
      end

      def batch_put_tax_registration(input : Types::BatchPutTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a supplemental tax registration for a single account.

      def delete_supplemental_tax_registration(
        authority_id : String
      ) : Protocol::Request
        input = Types::DeleteSupplementalTaxRegistrationRequest.new(authority_id: authority_id)
        delete_supplemental_tax_registration(input)
      end

      def delete_supplemental_tax_registration(input : Types::DeleteSupplementalTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUPPLEMENTAL_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes tax registration for a single account. This API operation can't be used to delete your tax
      # registration in Brazil. Use the Payment preferences page in the Billing and Cost Management console
      # instead.

      def delete_tax_registration(
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTaxRegistrationRequest.new(account_id: account_id)
        delete_tax_registration(input)
      end

      def delete_tax_registration(input : Types::DeleteTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get supported tax exemption types. The IAM action is tax:GetExemptions .

      def get_tax_exemption_types : Protocol::Request
        input = Types::GetTaxExemptionTypesRequest.new
        get_tax_exemption_types(input)
      end

      def get_tax_exemption_types(input : Types::GetTaxExemptionTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAX_EXEMPTION_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The get account tax inheritance status.

      def get_tax_inheritance : Protocol::Request
        input = Types::GetTaxInheritanceRequest.new
        get_tax_inheritance(input)
      end

      def get_tax_inheritance(input : Types::GetTaxInheritanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAX_INHERITANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves tax registration for a single account.

      def get_tax_registration(
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetTaxRegistrationRequest.new(account_id: account_id)
        get_tax_registration(input)
      end

      def get_tax_registration(input : Types::GetTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Downloads your tax documents to the Amazon S3 bucket that you specify in your request.

      def get_tax_registration_document(
        tax_document_metadata : Types::TaxDocumentMetadata,
        destination_s3_location : Types::DestinationS3Location? = nil
      ) : Protocol::Request
        input = Types::GetTaxRegistrationDocumentRequest.new(tax_document_metadata: tax_document_metadata, destination_s3_location: destination_s3_location)
        get_tax_registration_document(input)
      end

      def get_tax_registration_document(input : Types::GetTaxRegistrationDocumentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAX_REGISTRATION_DOCUMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves supplemental tax registrations for a single account.

      def list_supplemental_tax_registrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSupplementalTaxRegistrationsRequest.new(max_results: max_results, next_token: next_token)
        list_supplemental_tax_registrations(input)
      end

      def list_supplemental_tax_registrations(input : Types::ListSupplementalTaxRegistrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUPPLEMENTAL_TAX_REGISTRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tax exemption of accounts listed in a consolidated billing family. The IAM action is
      # tax:GetExemptions .

      def list_tax_exemptions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTaxExemptionsRequest.new(max_results: max_results, next_token: next_token)
        list_tax_exemptions(input)
      end

      def list_tax_exemptions(input : Types::ListTaxExemptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAX_EXEMPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tax registration of accounts listed in a consolidated billing family. This can be used
      # to retrieve up to 100 accounts' tax registrations in one call (default 50).

      def list_tax_registrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTaxRegistrationsRequest.new(max_results: max_results, next_token: next_token)
        list_tax_registrations(input)
      end

      def list_tax_registrations(input : Types::ListTaxRegistrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAX_REGISTRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stores supplemental tax registration for a single account.

      def put_supplemental_tax_registration(
        tax_registration_entry : Types::SupplementalTaxRegistrationEntry
      ) : Protocol::Request
        input = Types::PutSupplementalTaxRegistrationRequest.new(tax_registration_entry: tax_registration_entry)
        put_supplemental_tax_registration(input)
      end

      def put_supplemental_tax_registration(input : Types::PutSupplementalTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SUPPLEMENTAL_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the tax exemption for a single account or all accounts listed in a consolidated billing family.
      # The IAM action is tax:UpdateExemptions .

      def put_tax_exemption(
        account_ids : Array(String),
        authority : Types::Authority,
        exemption_certificate : Types::ExemptionCertificate,
        exemption_type : String
      ) : Protocol::Request
        input = Types::PutTaxExemptionRequest.new(account_ids: account_ids, authority: authority, exemption_certificate: exemption_certificate, exemption_type: exemption_type)
        put_tax_exemption(input)
      end

      def put_tax_exemption(input : Types::PutTaxExemptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TAX_EXEMPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The updated tax inheritance status.

      def put_tax_inheritance(
        heritage_status : String? = nil
      ) : Protocol::Request
        input = Types::PutTaxInheritanceRequest.new(heritage_status: heritage_status)
        put_tax_inheritance(input)
      end

      def put_tax_inheritance(input : Types::PutTaxInheritanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TAX_INHERITANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tax registration for a single account. You can't set a TRN if there's a pending TRN.
      # You'll need to delete the pending TRN first. To call this API operation for specific countries, see
      # the following country-specific requirements. Bangladesh You must specify the tax registration
      # certificate document in the taxRegistrationDocuments field of the VerificationDetails object. Brazil
      # You must complete the tax registration process in the Payment preferences page in the Billing and
      # Cost Management console. After your TRN and billing address are verified, you can call this API
      # operation. For Amazon Web Services accounts created through Organizations, you can call this API
      # operation when you don't have a billing address. Georgia The valid personType values are Physical
      # Person and Business . Indonesia PutTaxRegistration : The use of this operation to submit tax
      # information is subject to the Amazon Web Services service terms . By submitting, you’re providing
      # consent for Amazon Web Services to validate NIK, NPWP, and NITKU data, provided by you with the
      # Directorate General of Taxes of Indonesia in accordance with the Minister of Finance Regulation
      # (PMK) Number 112/PMK.03/2022. BatchPutTaxRegistration : The use of this operation to submit tax
      # information is subject to the Amazon Web Services service terms . By submitting, you’re providing
      # consent for Amazon Web Services to validate NIK, NPWP, and NITKU data, provided by you with the
      # Directorate General of Taxes of Indonesia in accordance with the Minister of Finance Regulation
      # (PMK) Number 112/PMK.03/2022, through our third-party partner PT Achilles Advanced Management
      # (OnlinePajak). You must specify the taxRegistrationNumberType in the indonesiaAdditionalInfo field
      # of the additionalTaxInformation object. If you specify decisionNumber , you must specify the
      # ppnExceptionDesignationCode in the indonesiaAdditionalInfo field of the additionalTaxInformation
      # object. If the taxRegistrationNumberType is set to NPWP or NITKU, valid values for
      # ppnExceptionDesignationCode are either 01 , 02 , 03 , 07 , or 08 . For other
      # taxRegistrationNumberType values, ppnExceptionDesignationCode must be either 01 , 07 , or 08 . If
      # ppnExceptionDesignationCode is 07 , you must specify the decisionNumber in the
      # indonesiaAdditionalInfo field of the additionalTaxInformation object. Kenya You must specify the
      # personType in the kenyaAdditionalInfo field of the additionalTaxInformation object. If the
      # personType is Physical Person , you must specify the tax registration certificate document in the
      # taxRegistrationDocuments field of the VerificationDetails object. Malaysia The sector valid values
      # are Business and Individual . RegistrationType valid values are NRIC for individual, and TIN and
      # sales and service tax (SST) for Business. For individual, you can specify the taxInformationNumber
      # in MalaysiaAdditionalInfo with NRIC type, and a valid MyKad or NRIC number. For business, you must
      # specify a businessRegistrationNumber in MalaysiaAdditionalInfo with a TIN type and tax
      # identification number. For business resellers, you must specify a businessRegistrationNumber and
      # taxInformationNumber in MalaysiaAdditionalInfo with a sales and service tax (SST) type and a valid
      # SST number. For business resellers with service codes, you must specify businessRegistrationNumber ,
      # taxInformationNumber , and distinct serviceTaxCodes in MalaysiaAdditionalInfo with a SST type and
      # valid sales and service tax (SST) number. By using this API operation, Amazon Web Services registers
      # your self-declaration that you’re an authorized business reseller registered with the Royal Malaysia
      # Customs Department (RMCD), and have a valid SST number. Amazon Web Services reserves the right to
      # seek additional information and/or take other actions to support your self-declaration as
      # appropriate. Amazon Web Services is currently registered under the following service tax codes. You
      # must include at least one of the service tax codes in the service tax code strings to declare
      # yourself as an authorized registered business reseller. Taxable service and service tax codes:
      # Consultancy - 9907061674 Training or coaching service - 9907071685 IT service - 9907101676 Digital
      # services and electronic medium - 9907121690 Nepal The sector valid values are Business and
      # Individual . Saudi Arabia For address , you must specify addressLine3 . South Korea You must specify
      # the certifiedEmailId and legalName in the TaxRegistrationEntry object. Use Korean characters for
      # legalName . You must specify the businessRepresentativeName , itemOfBusiness , and lineOfBusiness in
      # the southKoreaAdditionalInfo field of the additionalTaxInformation object. Use Korean characters for
      # these fields. You must specify the tax registration certificate document in the
      # taxRegistrationDocuments field of the VerificationDetails object. For the address object, use Korean
      # characters for addressLine1 , addressLine2 city , postalCode , and stateOrRegion . Spain You must
      # specify the registrationType in the spainAdditionalInfo field of the additionalTaxInformation
      # object. If the registrationType is Local , you must specify the tax registration certificate
      # document in the taxRegistrationDocuments field of the VerificationDetails object. Turkey You must
      # specify the sector in the taxRegistrationEntry object. If your sector is Business , Individual , or
      # Government : Specify the taxOffice . If your sector is Individual , don't enter this value.
      # (Optional) Specify the kepEmailId . If your sector is Individual , don't enter this value. Note: In
      # the Tax Settings page of the Billing console, Government appears as Public institutions If your
      # sector is Business and you're subject to KDV tax, you must specify your industry in the industries
      # field. For address , you must specify districtOrCounty . Ukraine The sector valid values are
      # Business and Individual .

      def put_tax_registration(
        tax_registration_entry : Types::TaxRegistrationEntry,
        account_id : String? = nil
      ) : Protocol::Request
        input = Types::PutTaxRegistrationRequest.new(tax_registration_entry: tax_registration_entry, account_id: account_id)
        put_tax_registration(input)
      end

      def put_tax_registration(input : Types::PutTaxRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_TAX_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
