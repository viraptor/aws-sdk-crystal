module AwsSdk
  module ACM
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

      # Adds one or more tags to an ACM certificate. Tags are labels that you can use to identify and
      # organize your Amazon Web Services resources. Each tag consists of a key and an optional value . You
      # specify the certificate on input by its Amazon Resource Name (ARN). You specify the tag by using a
      # key-value pair. You can apply a tag to just one certificate if you want to identify a specific
      # characteristic of that certificate, or you can apply the same tag to multiple certificates if you
      # want to filter for a common relationship among those certificates. Similarly, you can apply the same
      # tag to multiple resources if you want to specify a relationship among those resources. For example,
      # you can add the same tag to an ACM certificate and an Elastic Load Balancing load balancer to
      # indicate that they are both used by the same website. For more information, see Tagging ACM
      # certificates . To remove one or more tags, use the RemoveTagsFromCertificate action. To view all of
      # the tags that have been applied to the certificate, use the ListTagsForCertificate action.

      def add_tags_to_certificate(
        certificate_arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::AddTagsToCertificateRequest.new(certificate_arn: certificate_arn, tags: tags)
        add_tags_to_certificate(input)
      end

      def add_tags_to_certificate(input : Types::AddTagsToCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a certificate and its associated private key. If this action succeeds, the certificate no
      # longer appears in the list that can be displayed by calling the ListCertificates action or be
      # retrieved by calling the GetCertificate action. The certificate will not be available for use by
      # Amazon Web Services services integrated with ACM. You cannot delete an ACM certificate that is being
      # used by another Amazon Web Services service. To delete a certificate that is in use, the certificate
      # association must first be removed.

      def delete_certificate(
        certificate_arn : String
      ) : Nil

        input = Types::DeleteCertificateRequest.new(certificate_arn: certificate_arn)
        delete_certificate(input)
      end

      def delete_certificate(input : Types::DeleteCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns detailed metadata about the specified ACM certificate. If you have just created a
      # certificate using the RequestCertificate action, there is a delay of several seconds before you can
      # retrieve information about it.

      def describe_certificate(
        certificate_arn : String
      ) : Types::DescribeCertificateResponse

        input = Types::DescribeCertificateRequest.new(certificate_arn: certificate_arn)
        describe_certificate(input)
      end

      def describe_certificate(input : Types::DescribeCertificateRequest) : Types::DescribeCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificateResponse, "DescribeCertificate")
      end

      # Exports a private certificate issued by a private certificate authority (CA) or public certificate
      # for use anywhere. The exported file contains the certificate, the certificate chain, and the
      # encrypted private key associated with the public key that is embedded in the certificate. For
      # security, you must assign a passphrase for the private key when exporting it. For information about
      # exporting and formatting a certificate using the ACM console or CLI, see Export a private
      # certificate and Export a public certificate .

      def export_certificate(
        certificate_arn : String,
        passphrase : Bytes
      ) : Types::ExportCertificateResponse

        input = Types::ExportCertificateRequest.new(certificate_arn: certificate_arn, passphrase: passphrase)
        export_certificate(input)
      end

      def export_certificate(input : Types::ExportCertificateRequest) : Types::ExportCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportCertificateResponse, "ExportCertificate")
      end

      # Returns the account configuration options associated with an Amazon Web Services account.


      def get_account_configuration : Types::GetAccountConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_CONFIGURATION, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountConfigurationResponse, "GetAccountConfiguration")
      end

      # Retrieves a certificate and its certificate chain. The certificate may be either a public or private
      # certificate issued using the ACM RequestCertificate action, or a certificate imported into ACM using
      # the ImportCertificate action. The chain consists of the certificate of the issuing CA and the
      # intermediate certificates of any other subordinate CAs. All of the certificates are base64 encoded.
      # You can use OpenSSL to decode the certificates and inspect individual fields.

      def get_certificate(
        certificate_arn : String
      ) : Types::GetCertificateResponse

        input = Types::GetCertificateRequest.new(certificate_arn: certificate_arn)
        get_certificate(input)
      end

      def get_certificate(input : Types::GetCertificateRequest) : Types::GetCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificateResponse, "GetCertificate")
      end

      # Imports a certificate into Certificate Manager (ACM) to use with services that are integrated with
      # ACM. Note that integrated services allow only certificate types and keys they support to be
      # associated with their resources. Further, their support differs depending on whether the certificate
      # is imported into IAM or into ACM. For more information, see the documentation for each service. For
      # more information about importing certificates into ACM, see Importing Certificates in the
      # Certificate Manager User Guide . ACM does not provide managed renewal for certificates that you
      # import. Note the following guidelines when importing third party certificates: You must enter the
      # private key that matches the certificate you are importing. The private key must be unencrypted. You
      # cannot import a private key that is protected by a password or a passphrase. The private key must be
      # no larger than 5 KB (5,120 bytes). The certificate, private key, and certificate chain must be
      # PEM-encoded. The current time must be between the Not Before and Not After certificate fields. The
      # Issuer field must not be empty. The OCSP authority URL, if present, must not exceed 1000 characters.
      # To import a new certificate, omit the CertificateArn argument. Include this argument only when you
      # want to replace a previously imported certificate. When you import a certificate by using the CLI,
      # you must specify the certificate, the certificate chain, and the private key by their file names
      # preceded by fileb:// . For example, you can specify a certificate saved in the C:\temp folder as
      # fileb://C:\temp\certificate_to_import.pem . If you are making an HTTP or HTTPS Query request,
      # include these arguments as BLOBs. When you import a certificate by using an SDK, you must specify
      # the certificate, the certificate chain, and the private key files in the manner required by the
      # programming language you're using. The cryptographic algorithm of an imported certificate must match
      # the algorithm of the signing CA. For example, if the signing CA key type is RSA, then the
      # certificate key type must also be RSA. This operation returns the Amazon Resource Name (ARN) of the
      # imported certificate.

      def import_certificate(
        certificate : Bytes,
        private_key : Bytes,
        certificate_arn : String? = nil,
        certificate_chain : Bytes? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportCertificateResponse

        input = Types::ImportCertificateRequest.new(certificate: certificate, private_key: private_key, certificate_arn: certificate_arn, certificate_chain: certificate_chain, tags: tags)
        import_certificate(input)
      end

      def import_certificate(input : Types::ImportCertificateRequest) : Types::ImportCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportCertificateResponse, "ImportCertificate")
      end

      # Retrieves a list of certificate ARNs and domain names. You can request that only certificates that
      # match a specific status be listed. You can also filter by specific attributes of the certificate.
      # Default filtering returns only RSA_2048 certificates. For more information, see Filters .

      def list_certificates(
        certificate_statuses : Array(String)? = nil,
        includes : Types::Filters? = nil,
        max_items : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListCertificatesResponse

        input = Types::ListCertificatesRequest.new(certificate_statuses: certificate_statuses, includes: includes, max_items: max_items, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_certificates(input)
      end

      def list_certificates(input : Types::ListCertificatesRequest) : Types::ListCertificatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CERTIFICATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCertificatesResponse, "ListCertificates")
      end

      # Lists the tags that have been applied to the ACM certificate. Use the certificate's Amazon Resource
      # Name (ARN) to specify the certificate. To add a tag to an ACM certificate, use the
      # AddTagsToCertificate action. To delete a tag, use the RemoveTagsFromCertificate action.

      def list_tags_for_certificate(
        certificate_arn : String
      ) : Types::ListTagsForCertificateResponse

        input = Types::ListTagsForCertificateRequest.new(certificate_arn: certificate_arn)
        list_tags_for_certificate(input)
      end

      def list_tags_for_certificate(input : Types::ListTagsForCertificateRequest) : Types::ListTagsForCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForCertificateResponse, "ListTagsForCertificate")
      end

      # Adds or modifies account-level configurations in ACM. The supported configuration option is
      # DaysBeforeExpiry . This option specifies the number of days prior to certificate expiration when ACM
      # starts generating EventBridge events. ACM sends one event per day per certificate until the
      # certificate expires. By default, accounts receive events starting 45 days before certificate
      # expiration.

      def put_account_configuration(
        idempotency_token : String,
        expiry_events : Types::ExpiryEventsConfiguration? = nil
      ) : Nil

        input = Types::PutAccountConfigurationRequest.new(idempotency_token: idempotency_token, expiry_events: expiry_events)
        put_account_configuration(input)
      end

      def put_account_configuration(input : Types::PutAccountConfigurationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_ACCOUNT_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Remove one or more tags from an ACM certificate. A tag consists of a key-value pair. If you do not
      # specify the value portion of the tag when calling this function, the tag will be removed regardless
      # of value. If you specify a value, the tag is removed only if it is associated with the specified
      # value. To add tags to a certificate, use the AddTagsToCertificate action. To view all of the tags
      # that have been applied to a specific ACM certificate, use the ListTagsForCertificate action.

      def remove_tags_from_certificate(
        certificate_arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::RemoveTagsFromCertificateRequest.new(certificate_arn: certificate_arn, tags: tags)
        remove_tags_from_certificate(input)
      end

      def remove_tags_from_certificate(input : Types::RemoveTagsFromCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Renews an eligible ACM certificate . In order to renew your Amazon Web Services Private CA
      # certificates with ACM, you must first grant the ACM service principal permission to do so . For more
      # information, see Testing Managed Renewal in the ACM User Guide.

      def renew_certificate(
        certificate_arn : String
      ) : Nil

        input = Types::RenewCertificateRequest.new(certificate_arn: certificate_arn)
        renew_certificate(input)
      end

      def renew_certificate(input : Types::RenewCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::RENEW_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Requests an ACM certificate for use with other Amazon Web Services services. To request an ACM
      # certificate, you must specify a fully qualified domain name (FQDN) in the DomainName parameter. You
      # can also specify additional FQDNs in the SubjectAlternativeNames parameter. If you are requesting a
      # private certificate, domain validation is not required. If you are requesting a public certificate,
      # each domain name that you specify must be validated to verify that you own or control the domain.
      # You can use DNS validation or email validation . We recommend that you use DNS validation. ACM
      # behavior differs from the RFC 6125 specification of the certificate validation process. ACM first
      # checks for a Subject Alternative Name, and, if it finds one, ignores the common name (CN). After
      # successful completion of the RequestCertificate action, there is a delay of several seconds before
      # you can retrieve information about the new certificate.

      def request_certificate(
        domain_name : String,
        certificate_authority_arn : String? = nil,
        domain_validation_options : Array(Types::DomainValidationOption)? = nil,
        idempotency_token : String? = nil,
        key_algorithm : String? = nil,
        managed_by : String? = nil,
        options : Types::CertificateOptions? = nil,
        subject_alternative_names : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil,
        validation_method : String? = nil
      ) : Types::RequestCertificateResponse

        input = Types::RequestCertificateRequest.new(domain_name: domain_name, certificate_authority_arn: certificate_authority_arn, domain_validation_options: domain_validation_options, idempotency_token: idempotency_token, key_algorithm: key_algorithm, managed_by: managed_by, options: options, subject_alternative_names: subject_alternative_names, tags: tags, validation_method: validation_method)
        request_certificate(input)
      end

      def request_certificate(input : Types::RequestCertificateRequest) : Types::RequestCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::REQUEST_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RequestCertificateResponse, "RequestCertificate")
      end

      # Resends the email that requests domain ownership validation. The domain owner or an authorized
      # representative must approve the ACM certificate before it can be issued. The certificate can be
      # approved by clicking a link in the mail to navigate to the Amazon certificate approval website and
      # then clicking I Approve . However, the validation email can be blocked by spam filters. Therefore,
      # if you do not receive the original mail, you can request that the mail be resent within 72 hours of
      # requesting the ACM certificate. If more than 72 hours have elapsed since your original request or
      # since your last attempt to resend validation mail, you must request a new certificate. For more
      # information about setting up your contact email addresses, see Configure Email for your Domain .

      def resend_validation_email(
        certificate_arn : String,
        domain : String,
        validation_domain : String
      ) : Nil

        input = Types::ResendValidationEmailRequest.new(certificate_arn: certificate_arn, domain: domain, validation_domain: validation_domain)
        resend_validation_email(input)
      end

      def resend_validation_email(input : Types::ResendValidationEmailRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESEND_VALIDATION_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Revokes a public ACM certificate. You can only revoke certificates that have been previously
      # exported.

      def revoke_certificate(
        certificate_arn : String,
        revocation_reason : String
      ) : Types::RevokeCertificateResponse

        input = Types::RevokeCertificateRequest.new(certificate_arn: certificate_arn, revocation_reason: revocation_reason)
        revoke_certificate(input)
      end

      def revoke_certificate(input : Types::RevokeCertificateRequest) : Types::RevokeCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::REVOKE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RevokeCertificateResponse, "RevokeCertificate")
      end

      # Updates a certificate. You can use this function to specify whether to opt in to or out of recording
      # your certificate in a certificate transparency log and exporting. For more information, see Opting
      # Out of Certificate Transparency Logging and Certificate Manager Exportable Managed Certificates .

      def update_certificate_options(
        certificate_arn : String,
        options : Types::CertificateOptions
      ) : Nil

        input = Types::UpdateCertificateOptionsRequest.new(certificate_arn: certificate_arn, options: options)
        update_certificate_options(input)
      end

      def update_certificate_options(input : Types::UpdateCertificateOptionsRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CERTIFICATE_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
