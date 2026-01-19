require "json"
require "time"

module AwsSdk
  module ACM
    module Types

      # You do not have access required to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AddTagsToCertificateRequest
        include JSON::Serializable

        # String that contains the ARN of the ACM certificate to which the tag is to be applied. This must be
        # of the form: arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For
        # more information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # The key-value pair that defines the tag. The tag value is optional.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @certificate_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Contains metadata about an ACM certificate. This structure is returned in the response to a
      # DescribeCertificate request.
      struct CertificateDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate. For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The Amazon Resource Name (ARN) of the private certificate authority (CA) that issued the
        # certificate. This has the following format:
        # arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The time at which the certificate was requested.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The fully qualified domain name for the certificate, such as www.example.com or example.com.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Contains information about the initial validation of each domain name that occurs as a result of the
        # RequestCertificate request. This field exists only when the certificate type is AMAZON_ISSUED .
        @[JSON::Field(key: "DomainValidationOptions")]
        getter domain_validation_options : Array(Types::DomainValidation)?

        # Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a purpose
        # for which the certificate public key can be used and consists of a name and an object identifier
        # (OID).
        @[JSON::Field(key: "ExtendedKeyUsages")]
        getter extended_key_usages : Array(Types::ExtendedKeyUsage)?

        # The reason the certificate request failed. This value exists only when the certificate status is
        # FAILED . For more information, see Certificate Request Failed in the Certificate Manager User Guide
        # .
        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The date and time when the certificate was imported. This value exists only when the certificate
        # type is IMPORTED .
        @[JSON::Field(key: "ImportedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter imported_at : Time?

        # A list of ARNs for the Amazon Web Services resources that are using the certificate. A certificate
        # can be used by multiple Amazon Web Services resources.
        @[JSON::Field(key: "InUseBy")]
        getter in_use_by : Array(String)?

        # The time at which the certificate was issued. This value exists only when the certificate type is
        # AMAZON_ISSUED .
        @[JSON::Field(key: "IssuedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter issued_at : Time?

        # The name of the certificate authority that issued and signed the certificate.
        @[JSON::Field(key: "Issuer")]
        getter issuer : String?

        # The algorithm that was used to generate the public-private key pair.
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String?

        # A list of Key Usage X.509 v3 extension objects. Each object is a string value that identifies the
        # purpose of the public key contained in the certificate. Possible extension values include
        # DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
        @[JSON::Field(key: "KeyUsages")]
        getter key_usages : Array(Types::KeyUsage)?

        # Identifies the Amazon Web Services service that manages the certificate issued by ACM.
        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # The time after which the certificate is not valid.
        @[JSON::Field(key: "NotAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_after : Time?

        # The time before which the certificate is not valid.
        @[JSON::Field(key: "NotBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_before : Time?

        # Value that specifies whether to add the certificate to a transparency log. Certificate transparency
        # makes it possible to detect SSL certificates that have been mistakenly or maliciously issued. A
        # browser might respond to certificate that has not been logged by showing an error message. The logs
        # are cryptographically secure.
        @[JSON::Field(key: "Options")]
        getter options : Types::CertificateOptions?

        # Specifies whether the certificate is eligible for renewal. At this time, only exported private
        # certificates can be renewed with the RenewCertificate command.
        @[JSON::Field(key: "RenewalEligibility")]
        getter renewal_eligibility : String?

        # Contains information about the status of ACM's managed renewal for the certificate. This field
        # exists only when the certificate type is AMAZON_ISSUED .
        @[JSON::Field(key: "RenewalSummary")]
        getter renewal_summary : Types::RenewalSummary?

        # The reason the certificate was revoked. This value exists only when the certificate status is
        # REVOKED .
        @[JSON::Field(key: "RevocationReason")]
        getter revocation_reason : String?

        # The time at which the certificate was revoked. This value exists only when the certificate status is
        # REVOKED .
        @[JSON::Field(key: "RevokedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter revoked_at : Time?

        # The serial number of the certificate.
        @[JSON::Field(key: "Serial")]
        getter serial : String?

        # The algorithm that was used to sign the certificate.
        @[JSON::Field(key: "SignatureAlgorithm")]
        getter signature_algorithm : String?

        # The status of the certificate. A certificate enters status PENDING_VALIDATION upon being requested,
        # unless it fails for any of the reasons given in the troubleshooting topic Certificate request fails
        # . ACM makes repeated attempts to validate a certificate for 72 hours and then times out. If a
        # certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the request, correct the issue with
        # DNS validation or Email validation , and try again. If validation succeeds, the certificate enters
        # status ISSUED.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the entity that is associated with the public key contained in the certificate.
        @[JSON::Field(key: "Subject")]
        getter subject : String?

        # One or more domain names (subject alternative names) included in the certificate. This list contains
        # the domain names that are bound to the public key that is contained in the certificate. The subject
        # alternative names include the canonical domain name (CN) of the certificate and additional domain
        # names that can be used to connect to the website.
        @[JSON::Field(key: "SubjectAlternativeNames")]
        getter subject_alternative_names : Array(String)?

        # The source of the certificate. For certificates provided by ACM, this value is AMAZON_ISSUED . For
        # certificates that you imported with ImportCertificate , this value is IMPORTED . ACM does not
        # provide managed renewal for imported certificates. For more information about the differences
        # between certificates that you import and those that ACM provides, see Importing Certificates in the
        # Certificate Manager User Guide .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_authority_arn : String? = nil,
          @created_at : Time? = nil,
          @domain_name : String? = nil,
          @domain_validation_options : Array(Types::DomainValidation)? = nil,
          @extended_key_usages : Array(Types::ExtendedKeyUsage)? = nil,
          @failure_reason : String? = nil,
          @imported_at : Time? = nil,
          @in_use_by : Array(String)? = nil,
          @issued_at : Time? = nil,
          @issuer : String? = nil,
          @key_algorithm : String? = nil,
          @key_usages : Array(Types::KeyUsage)? = nil,
          @managed_by : String? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @options : Types::CertificateOptions? = nil,
          @renewal_eligibility : String? = nil,
          @renewal_summary : Types::RenewalSummary? = nil,
          @revocation_reason : String? = nil,
          @revoked_at : Time? = nil,
          @serial : String? = nil,
          @signature_algorithm : String? = nil,
          @status : String? = nil,
          @subject : String? = nil,
          @subject_alternative_names : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Structure that contains options for your certificate. You can use this structure to specify whether
      # to opt in to or out of certificate transparency logging and export your certificate. Some browsers
      # require that public certificates issued for your domain be recorded in a log. Certificates that are
      # not logged typically generate a browser error. Transparency makes it possible for you to detect
      # SSL/TLS certificates that have been mistakenly or maliciously issued for your domain. For general
      # information, see Certificate Transparency Logging . You can export public ACM certificates to use
      # with Amazon Web Services services as well as outside Amazon Web Services Cloud. For more
      # information, see Certificate Manager exportable public certificate .
      struct CertificateOptions
        include JSON::Serializable

        # You can opt out of certificate transparency logging by specifying the DISABLED option. Opt in by
        # specifying ENABLED .
        @[JSON::Field(key: "CertificateTransparencyLoggingPreference")]
        getter certificate_transparency_logging_preference : String?

        # You can opt in to allow the export of your certificates by specifying ENABLED .
        @[JSON::Field(key: "Export")]
        getter export : String?

        def initialize(
          @certificate_transparency_logging_preference : String? = nil,
          @export : String? = nil
        )
        end
      end

      # This structure is returned in the response object of ListCertificates action.
      struct CertificateSummary
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the certificate. This is of the form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The time at which the certificate was requested.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Fully qualified domain name (FQDN), such as www.example.com or example.com, for the certificate.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String?

        # Indicates if export is enabled for the certificate.
        @[JSON::Field(key: "ExportOption")]
        getter export_option : String?

        # Indicates whether the certificate has been exported. This value exists only when the certificate
        # type is PRIVATE .
        @[JSON::Field(key: "Exported")]
        getter exported : Bool?

        # Contains a list of Extended Key Usage X.509 v3 extension objects. Each object specifies a purpose
        # for which the certificate public key can be used and consists of a name and an object identifier
        # (OID).
        @[JSON::Field(key: "ExtendedKeyUsages")]
        getter extended_key_usages : Array(String)?

        # When called by ListCertificates , indicates whether the full list of subject alternative names has
        # been included in the response. If false, the response includes all of the subject alternative names
        # included in the certificate. If true, the response only includes the first 100 subject alternative
        # names included in the certificate. To display the full list of subject alternative names, use
        # DescribeCertificate .
        @[JSON::Field(key: "HasAdditionalSubjectAlternativeNames")]
        getter has_additional_subject_alternative_names : Bool?

        # The date and time when the certificate was imported. This value exists only when the certificate
        # type is IMPORTED .
        @[JSON::Field(key: "ImportedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter imported_at : Time?

        # Indicates whether the certificate is currently in use by any Amazon Web Services resources.
        @[JSON::Field(key: "InUse")]
        getter in_use : Bool?

        # The time at which the certificate was issued. This value exists only when the certificate type is
        # AMAZON_ISSUED .
        @[JSON::Field(key: "IssuedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter issued_at : Time?

        # The algorithm that was used to generate the public-private key pair.
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String?

        # A list of Key Usage X.509 v3 extension objects. Each object is a string value that identifies the
        # purpose of the public key contained in the certificate. Possible extension values include
        # DIGITAL_SIGNATURE, KEY_ENCHIPHERMENT, NON_REPUDIATION, and more.
        @[JSON::Field(key: "KeyUsages")]
        getter key_usages : Array(String)?

        # Identifies the Amazon Web Services service that manages the certificate issued by ACM.
        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # The time after which the certificate is not valid.
        @[JSON::Field(key: "NotAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_after : Time?

        # The time before which the certificate is not valid.
        @[JSON::Field(key: "NotBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_before : Time?

        # Specifies whether the certificate is eligible for renewal. At this time, only exported private
        # certificates can be renewed with the RenewCertificate command.
        @[JSON::Field(key: "RenewalEligibility")]
        getter renewal_eligibility : String?

        # The time at which the certificate was revoked. This value exists only when the certificate status is
        # REVOKED .
        @[JSON::Field(key: "RevokedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter revoked_at : Time?

        # The status of the certificate. A certificate enters status PENDING_VALIDATION upon being requested,
        # unless it fails for any of the reasons given in the troubleshooting topic Certificate request fails
        # . ACM makes repeated attempts to validate a certificate for 72 hours and then times out. If a
        # certificate shows status FAILED or VALIDATION_TIMED_OUT, delete the request, correct the issue with
        # DNS validation or Email validation , and try again. If validation succeeds, the certificate enters
        # status ISSUED.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # One or more domain names (subject alternative names) included in the certificate. This list contains
        # the domain names that are bound to the public key that is contained in the certificate. The subject
        # alternative names include the canonical domain name (CN) of the certificate and additional domain
        # names that can be used to connect to the website. When called by ListCertificates , this parameter
        # will only return the first 100 subject alternative names included in the certificate. To display the
        # full list of subject alternative names, use DescribeCertificate .
        @[JSON::Field(key: "SubjectAlternativeNameSummaries")]
        getter subject_alternative_name_summaries : Array(String)?

        # The source of the certificate. For certificates provided by ACM, this value is AMAZON_ISSUED . For
        # certificates that you imported with ImportCertificate , this value is IMPORTED . ACM does not
        # provide managed renewal for imported certificates. For more information about the differences
        # between certificates that you import and those that ACM provides, see Importing Certificates in the
        # Certificate Manager User Guide .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @certificate_arn : String? = nil,
          @created_at : Time? = nil,
          @domain_name : String? = nil,
          @export_option : String? = nil,
          @exported : Bool? = nil,
          @extended_key_usages : Array(String)? = nil,
          @has_additional_subject_alternative_names : Bool? = nil,
          @imported_at : Time? = nil,
          @in_use : Bool? = nil,
          @issued_at : Time? = nil,
          @key_algorithm : String? = nil,
          @key_usages : Array(String)? = nil,
          @managed_by : String? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @renewal_eligibility : String? = nil,
          @revoked_at : Time? = nil,
          @status : String? = nil,
          @subject_alternative_name_summaries : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # You are trying to update a resource or configuration that is already being created or updated. Wait
      # for the previous operation to finish and try again.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteCertificateRequest
        include JSON::Serializable

        # String that contains the ARN of the ACM certificate to be deleted. This must be of the form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      struct DescribeCertificateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ACM certificate. The ARN must have the following form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      struct DescribeCertificateResponse
        include JSON::Serializable

        # Metadata about an ACM certificate.
        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::CertificateDetail?

        def initialize(
          @certificate : Types::CertificateDetail? = nil
        )
        end
      end

      # Contains information about the validation of each domain name in the certificate.
      struct DomainValidation
        include JSON::Serializable

        # A fully qualified domain name (FQDN) in the certificate. For example, www.example.com or example.com
        # .
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Contains information for HTTP-based domain validation of certificates requested through Amazon
        # CloudFront and issued by ACM. This field exists only when the certificate type is AMAZON_ISSUED and
        # the validation method is HTTP .
        @[JSON::Field(key: "HttpRedirect")]
        getter http_redirect : Types::HttpRedirect?

        # Contains the CNAME record that you add to your DNS database for domain validation. For more
        # information, see Use DNS to Validate Domain Ownership . The CNAME information that you need does not
        # include the name of your domain. If you include your domain name in the DNS database CNAME record,
        # validation fails. For example, if the name is _a79865eb4cd1a6ab990a45779b4e0b96.yourdomain.com ,
        # only _a79865eb4cd1a6ab990a45779b4e0b96 must be used.
        @[JSON::Field(key: "ResourceRecord")]
        getter resource_record : Types::ResourceRecord?

        # The domain name that ACM used to send domain validation emails.
        @[JSON::Field(key: "ValidationDomain")]
        getter validation_domain : String?

        # A list of email addresses that ACM used to send domain validation emails.
        @[JSON::Field(key: "ValidationEmails")]
        getter validation_emails : Array(String)?

        # Specifies the domain validation method.
        @[JSON::Field(key: "ValidationMethod")]
        getter validation_method : String?

        # The validation status of the domain name. This can be one of the following values:
        # PENDING_VALIDATION SUCCESS FAILED
        @[JSON::Field(key: "ValidationStatus")]
        getter validation_status : String?

        def initialize(
          @domain_name : String,
          @http_redirect : Types::HttpRedirect? = nil,
          @resource_record : Types::ResourceRecord? = nil,
          @validation_domain : String? = nil,
          @validation_emails : Array(String)? = nil,
          @validation_method : String? = nil,
          @validation_status : String? = nil
        )
        end
      end

      # Contains information about the domain names that you want ACM to use to send you emails that enable
      # you to validate domain ownership.
      struct DomainValidationOption
        include JSON::Serializable

        # A fully qualified domain name (FQDN) in the certificate request.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The domain name that you want ACM to use to send you validation emails. This domain name is the
        # suffix of the email addresses that you want ACM to use. This must be the same as the DomainName
        # value or a superdomain of the DomainName value. For example, if you request a certificate for
        # testing.example.com , you can specify example.com for this value. In that case, ACM sends domain
        # validation emails to the following five addresses: admin@example.com administrator@example.com
        # hostmaster@example.com postmaster@example.com webmaster@example.com
        @[JSON::Field(key: "ValidationDomain")]
        getter validation_domain : String

        def initialize(
          @domain_name : String,
          @validation_domain : String
        )
        end
      end

      # Object containing expiration events options associated with an Amazon Web Services account.
      struct ExpiryEventsConfiguration
        include JSON::Serializable

        # Specifies the number of days prior to certificate expiration when ACM starts generating EventBridge
        # events. ACM sends one event per day per certificate until the certificate expires. By default,
        # accounts receive events starting 45 days before certificate expiration.
        @[JSON::Field(key: "DaysBeforeExpiry")]
        getter days_before_expiry : Int32?

        def initialize(
          @days_before_expiry : Int32? = nil
        )
        end
      end

      struct ExportCertificateRequest
        include JSON::Serializable

        # An Amazon Resource Name (ARN) of the issued certificate. This must be of the form:
        # arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # Passphrase to associate with the encrypted exported private key. When creating your passphrase, you
        # can use any ASCII character except #, $, or %. If you want to later decrypt the private key, you
        # must have the passphrase. You can use the following OpenSSL command to decrypt a private key. After
        # entering the command, you are prompted for the passphrase. openssl rsa -in encrypted_key.pem -out
        # decrypted_key.pem
        @[JSON::Field(key: "Passphrase")]
        getter passphrase : Bytes

        def initialize(
          @certificate_arn : String,
          @passphrase : Bytes
        )
        end
      end

      struct ExportCertificateResponse
        include JSON::Serializable

        # The base64 PEM-encoded certificate.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The base64 PEM-encoded certificate chain. This does not include the certificate that you are
        # exporting.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        # The encrypted private key associated with the public key in the certificate. The key is output in
        # PKCS #8 format and is base64 PEM-encoded.
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        def initialize(
          @certificate : String? = nil,
          @certificate_chain : String? = nil,
          @private_key : String? = nil
        )
        end
      end

      # The Extended Key Usage X.509 v3 extension defines one or more purposes for which the public key can
      # be used. This is in addition to or in place of the basic purposes specified by the Key Usage
      # extension.
      struct ExtendedKeyUsage
        include JSON::Serializable

        # The name of an Extended Key Usage value.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # An object identifier (OID) for the extension value. OIDs are strings of numbers separated by
        # periods. The following OIDs are defined in RFC 3280 and RFC 5280. 1.3.6.1.5.5.7.3.1
        # (TLS_WEB_SERVER_AUTHENTICATION) 1.3.6.1.5.5.7.3.2 (TLS_WEB_CLIENT_AUTHENTICATION) 1.3.6.1.5.5.7.3.3
        # (CODE_SIGNING) 1.3.6.1.5.5.7.3.4 (EMAIL_PROTECTION) 1.3.6.1.5.5.7.3.8 (TIME_STAMPING)
        # 1.3.6.1.5.5.7.3.9 (OCSP_SIGNING) 1.3.6.1.5.5.7.3.5 (IPSEC_END_SYSTEM) 1.3.6.1.5.5.7.3.6
        # (IPSEC_TUNNEL) 1.3.6.1.5.5.7.3.7 (IPSEC_USER)
        @[JSON::Field(key: "OID")]
        getter oid : String?

        def initialize(
          @name : String? = nil,
          @oid : String? = nil
        )
        end
      end

      # This structure can be used in the ListCertificates action to filter the output of the certificate
      # list.
      struct Filters
        include JSON::Serializable

        # Specify ENABLED or DISABLED to identify certificates that can be exported.
        @[JSON::Field(key: "exportOption")]
        getter export_option : String?

        # Specify one or more ExtendedKeyUsage extension values.
        @[JSON::Field(key: "extendedKeyUsage")]
        getter extended_key_usage : Array(String)?

        # Specify one or more algorithms that can be used to generate key pairs. Default filtering returns
        # only RSA_1024 and RSA_2048 certificates that have at least one domain. To return other certificate
        # types, provide the desired type signatures in a comma-separated list. For example, "keyTypes":
        # ["RSA_2048","RSA_4096"] returns both RSA_2048 and RSA_4096 certificates.
        @[JSON::Field(key: "keyTypes")]
        getter key_types : Array(String)?

        # Specify one or more KeyUsage extension values.
        @[JSON::Field(key: "keyUsage")]
        getter key_usage : Array(String)?

        # Identifies the Amazon Web Services service that manages the certificate issued by ACM.
        @[JSON::Field(key: "managedBy")]
        getter managed_by : String?

        def initialize(
          @export_option : String? = nil,
          @extended_key_usage : Array(String)? = nil,
          @key_types : Array(String)? = nil,
          @key_usage : Array(String)? = nil,
          @managed_by : String? = nil
        )
        end
      end

      struct GetAccountConfigurationResponse
        include JSON::Serializable

        # Expiration events configuration options associated with the Amazon Web Services account.
        @[JSON::Field(key: "ExpiryEvents")]
        getter expiry_events : Types::ExpiryEventsConfiguration?

        def initialize(
          @expiry_events : Types::ExpiryEventsConfiguration? = nil
        )
        end
      end

      struct GetCertificateRequest
        include JSON::Serializable

        # String that contains a certificate ARN in the following format:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      struct GetCertificateResponse
        include JSON::Serializable

        # The ACM-issued certificate corresponding to the ARN specified as input.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # Certificates forming the requested certificate's chain of trust. The chain consists of the
        # certificate of the issuing CA and the intermediate certificates of any other subordinate CAs.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        def initialize(
          @certificate : String? = nil,
          @certificate_chain : String? = nil
        )
        end
      end

      # Contains information for HTTP-based domain validation of certificates requested through Amazon
      # CloudFront and issued by ACM. This field exists only when the certificate type is AMAZON_ISSUED and
      # the validation method is HTTP .
      struct HttpRedirect
        include JSON::Serializable

        # The URL including the domain to be validated. The certificate authority sends GET requests here
        # during validation.
        @[JSON::Field(key: "RedirectFrom")]
        getter redirect_from : String?

        # The URL hosting the validation token. RedirectFrom must return this content or redirect here.
        @[JSON::Field(key: "RedirectTo")]
        getter redirect_to : String?

        def initialize(
          @redirect_from : String? = nil,
          @redirect_to : String? = nil
        )
        end
      end

      struct ImportCertificateRequest
        include JSON::Serializable

        # The certificate to import.
        @[JSON::Field(key: "Certificate")]
        getter certificate : Bytes

        # The private key that matches the public key in the certificate.
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : Bytes

        # The Amazon Resource Name (ARN) of an imported certificate to replace. To import a new certificate,
        # omit this field.
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        # The PEM encoded certificate chain.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : Bytes?

        # One or more resource tags to associate with the imported certificate. Note: You cannot apply tags
        # when reimporting a certificate.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate : Bytes,
          @private_key : Bytes,
          @certificate_arn : String? = nil,
          @certificate_chain : Bytes? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportCertificateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the imported certificate.
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        def initialize(
          @certificate_arn : String? = nil
        )
        end
      end

      # One or more of request parameters specified is not valid.
      struct InvalidArgsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested Amazon Resource Name (ARN) does not refer to an existing resource.
      struct InvalidArnException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more values in the DomainValidationOption structure is incorrect.
      struct InvalidDomainValidationOptionsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An input parameter was invalid.
      struct InvalidParameterException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Processing has reached an invalid state.
      struct InvalidStateException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or both of the values that make up the key-value pair is not valid. For example, you cannot
      # specify a tag value that begins with aws: .
      struct InvalidTagException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Key Usage X.509 v3 extension defines the purpose of the public key contained in the certificate.
      struct KeyUsage
        include JSON::Serializable

        # A string value that contains a Key Usage extension name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # An ACM quota has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListCertificatesRequest
        include JSON::Serializable

        # Filter the certificate list by status value.
        @[JSON::Field(key: "CertificateStatuses")]
        getter certificate_statuses : Array(String)?

        # Filter the certificate list. For more information, see the Filters structure.
        @[JSON::Field(key: "Includes")]
        getter includes : Types::Filters?

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response. If additional items exist beyond the number you specify, the NextToken element is sent in
        # the response. Use this NextToken value in a subsequent request to retrieve additional items.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # Use this parameter only when paginating results and only in a subsequent request after you receive a
        # response with truncated results. Set it to the value of NextToken from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the field to sort results by. If you specify SortBy , you must also specify SortOrder .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        # Specifies the order of sorted results. If you specify SortOrder , you must also specify SortBy .
        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @certificate_statuses : Array(String)? = nil,
          @includes : Types::Filters? = nil,
          @max_items : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      struct ListCertificatesResponse
        include JSON::Serializable

        # A list of ACM certificates.
        @[JSON::Field(key: "CertificateSummaryList")]
        getter certificate_summary_list : Array(Types::CertificateSummary)?

        # When the list is truncated, this value is present and contains the value to use for the NextToken
        # parameter in a subsequent pagination request.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificate_summary_list : Array(Types::CertificateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForCertificateRequest
        include JSON::Serializable

        # String that contains the ARN of the ACM certificate for which you want to list the tags. This must
        # have the following form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      struct ListTagsForCertificateResponse
        include JSON::Serializable

        # The key-value pairs that define the applied tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct PutAccountConfigurationRequest
        include JSON::Serializable

        # Customer-chosen string used to distinguish between calls to PutAccountConfiguration . Idempotency
        # tokens time out after one hour. If you call PutAccountConfiguration multiple times with the same
        # unexpired idempotency token, ACM treats it as the same request and returns the original result. If
        # you change the idempotency token for each call, ACM treats each call as a new request.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # Specifies expiration events associated with an account.
        @[JSON::Field(key: "ExpiryEvents")]
        getter expiry_events : Types::ExpiryEventsConfiguration?

        def initialize(
          @idempotency_token : String,
          @expiry_events : Types::ExpiryEventsConfiguration? = nil
        )
        end
      end

      struct RemoveTagsFromCertificateRequest
        include JSON::Serializable

        # String that contains the ARN of the ACM Certificate with one or more tags that you want to remove.
        # This must be of the form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # The key-value pair that defines the tag to remove.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @certificate_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct RenewCertificateRequest
        include JSON::Serializable

        # String that contains the ARN of the ACM certificate to be renewed. This must be of the form:
        # arn:aws:acm:region:123456789012:certificate/12345678-1234-1234-1234-123456789012 For more
        # information about ARNs, see Amazon Resource Names (ARNs) .
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      # Contains information about the status of ACM's managed renewal for the certificate. This structure
      # exists only when the certificate type is AMAZON_ISSUED .
      struct RenewalSummary
        include JSON::Serializable

        # Contains information about the validation of each domain name in the certificate, as it pertains to
        # ACM's managed renewal . This is different from the initial validation that occurs as a result of the
        # RequestCertificate request. This field exists only when the certificate type is AMAZON_ISSUED .
        @[JSON::Field(key: "DomainValidationOptions")]
        getter domain_validation_options : Array(Types::DomainValidation)

        # The status of ACM's managed renewal of the certificate.
        @[JSON::Field(key: "RenewalStatus")]
        getter renewal_status : String

        # The time at which the renewal summary was last updated.
        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The reason that a renewal request was unsuccessful.
        @[JSON::Field(key: "RenewalStatusReason")]
        getter renewal_status_reason : String?

        def initialize(
          @domain_validation_options : Array(Types::DomainValidation),
          @renewal_status : String,
          @updated_at : Time,
          @renewal_status_reason : String? = nil
        )
        end
      end

      struct RequestCertificateRequest
        include JSON::Serializable

        # Fully qualified domain name (FQDN), such as www.example.com, that you want to secure with an ACM
        # certificate. Use an asterisk (*) to create a wildcard certificate that protects several sites in the
        # same domain. For example, *.example.com protects www.example.com, site.example.com, and
        # images.example.com. In compliance with RFC 5280 , the length of the domain name (technically, the
        # Common Name) that you provide cannot exceed 64 octets (characters), including periods. To add a
        # longer domain name, specify it in the Subject Alternative Name field, which supports names up to 253
        # octets in length.
        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The Amazon Resource Name (ARN) of the private certificate authority (CA) that will be used to issue
        # the certificate. If you do not provide an ARN and you are trying to request a private certificate,
        # ACM will attempt to issue a public certificate. For more information about private CAs, see the
        # Amazon Web Services Private Certificate Authority user guide. The ARN must have the following form:
        # arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The domain name that you want ACM to use to send you emails so that you can validate domain
        # ownership.
        @[JSON::Field(key: "DomainValidationOptions")]
        getter domain_validation_options : Array(Types::DomainValidationOption)?

        # Customer chosen string that can be used to distinguish between calls to RequestCertificate .
        # Idempotency tokens time out after one hour. Therefore, if you call RequestCertificate multiple times
        # with the same idempotency token within one hour, ACM recognizes that you are requesting only one
        # certificate and will issue only one. If you change the idempotency token for each call, ACM
        # recognizes that you are requesting multiple certificates.
        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Specifies the algorithm of the public and private key pair that your certificate uses to encrypt
        # data. RSA is the default key algorithm for ACM certificates. Elliptic Curve Digital Signature
        # Algorithm (ECDSA) keys are smaller, offering security comparable to RSA keys but with greater
        # computing efficiency. However, ECDSA is not supported by all network clients. Some Amazon Web
        # Services services may require RSA keys, or only support ECDSA keys of a particular size, while
        # others allow the use of either RSA and ECDSA keys to ensure that compatibility is not broken. Check
        # the requirements for the Amazon Web Services service where you plan to deploy your certificate. For
        # more information about selecting an algorithm, see Key algorithms . Algorithms supported for an ACM
        # certificate request include: RSA_2048 EC_prime256v1 EC_secp384r1 Other listed algorithms are for
        # imported certificates only. When you request a private PKI certificate signed by a CA from Amazon
        # Web Services Private CA, the specified signing algorithm family (RSA or ECDSA) must match the
        # algorithm family of the CA's secret key. Default: RSA_2048
        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String?

        # Identifies the Amazon Web Services service that manages the certificate issued by ACM.
        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # You can use this parameter to specify whether to add the certificate to a certificate transparency
        # log and export your certificate. Certificate transparency makes it possible to detect SSL/TLS
        # certificates that have been mistakenly or maliciously issued. Certificates that have not been logged
        # typically produce an error message in a browser. For more information, see Opting Out of Certificate
        # Transparency Logging . You can export public ACM certificates to use with Amazon Web Services
        # services as well as outside the Amazon Web Services Cloud. For more information, see Certificate
        # Manager exportable public certificate .
        @[JSON::Field(key: "Options")]
        getter options : Types::CertificateOptions?

        # Additional FQDNs to be included in the Subject Alternative Name extension of the ACM certificate.
        # For example, add the name www.example.net to a certificate for which the DomainName field is
        # www.example.com if users can reach your site by using either name. The maximum number of domain
        # names that you can add to an ACM certificate is 100. However, the initial quota is 10 domain names.
        # If you need more than 10 names, you must request a quota increase. For more information, see Quotas
        # . The maximum length of a SAN DNS name is 253 octets. The name is made up of multiple labels
        # separated by periods. No label can be longer than 63 octets. Consider the following examples: (63
        # octets).(63 octets).(63 octets).(61 octets) is legal because the total length is 253 octets
        # (63+1+63+1+63+1+61) and no label exceeds 63 octets. (64 octets).(63 octets).(63 octets).(61 octets)
        # is not legal because the total length exceeds 253 octets (64+1+63+1+63+1+61) and the first label
        # exceeds 63 octets. (63 octets).(63 octets).(63 octets).(62 octets) is not legal because the total
        # length of the DNS name (63+1+63+1+63+1+62) exceeds 253 octets.
        @[JSON::Field(key: "SubjectAlternativeNames")]
        getter subject_alternative_names : Array(String)?

        # One or more resource tags to associate with the certificate.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The method you want to use if you are requesting a public certificate to validate that you own or
        # control domain. You can validate with DNS or validate with email . We recommend that you use DNS
        # validation.
        @[JSON::Field(key: "ValidationMethod")]
        getter validation_method : String?

        def initialize(
          @domain_name : String,
          @certificate_authority_arn : String? = nil,
          @domain_validation_options : Array(Types::DomainValidationOption)? = nil,
          @idempotency_token : String? = nil,
          @key_algorithm : String? = nil,
          @managed_by : String? = nil,
          @options : Types::CertificateOptions? = nil,
          @subject_alternative_names : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @validation_method : String? = nil
        )
        end
      end

      struct RequestCertificateResponse
        include JSON::Serializable

        # String that contains the ARN of the issued certificate. This must be of the form:
        # arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        def initialize(
          @certificate_arn : String? = nil
        )
        end
      end

      # The certificate request is in process and the certificate in your account has not yet been issued.
      struct RequestInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ResendValidationEmailRequest
        include JSON::Serializable

        # String that contains the ARN of the requested certificate. The certificate ARN is generated and
        # returned by the RequestCertificate action as soon as the request is made. By default, using this
        # parameter causes email to be sent to all top-level domains you specified in the certificate request.
        # The ARN must be of the form:
        # arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # The fully qualified domain name (FQDN) of the certificate that needs to be validated.
        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The base validation domain that will act as the suffix of the email addresses that are used to send
        # the emails. This must be the same as the Domain value or a superdomain of the Domain value. For
        # example, if you requested a certificate for site.subdomain.example.com and specify a
        # ValidationDomain of subdomain.example.com , ACM sends email to the domain registrant, technical
        # contact, and administrative contact in WHOIS and the following five addresses:
        # admin@subdomain.example.com administrator@subdomain.example.com hostmaster@subdomain.example.com
        # postmaster@subdomain.example.com webmaster@subdomain.example.com
        @[JSON::Field(key: "ValidationDomain")]
        getter validation_domain : String

        def initialize(
          @certificate_arn : String,
          @domain : String,
          @validation_domain : String
        )
        end
      end

      # The certificate is in use by another Amazon Web Services service in the caller's account. Remove the
      # association and try again.
      struct ResourceInUseException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified certificate cannot be found in the caller's account or the caller's account cannot be
      # found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains a DNS record value that you can use to validate ownership or control of a domain. This is
      # used by the DescribeCertificate action.
      struct ResourceRecord
        include JSON::Serializable

        # The name of the DNS record to create in your domain. This is supplied by ACM.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of DNS record. Currently this can be CNAME .
        @[JSON::Field(key: "Type")]
        getter type : String

        # The value of the CNAME record to add to your DNS database. This is supplied by ACM.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @type : String,
          @value : String
        )
        end
      end

      struct RevokeCertificateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the public or private certificate that will be revoked. The ARN
        # must have the following form:
        # arn:aws:acm:region:account:certificate/12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # Specifies why you revoked the certificate.
        @[JSON::Field(key: "RevocationReason")]
        getter revocation_reason : String

        def initialize(
          @certificate_arn : String,
          @revocation_reason : String
        )
        end
      end

      struct RevokeCertificateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the public or private certificate that was revoked.
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        def initialize(
          @certificate_arn : String? = nil
        )
        end
      end

      # A key-value pair that identifies or specifies metadata about an ACM resource.
      struct Tag
        include JSON::Serializable

        # The key of the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      # A specified tag did not comply with an existing tag policy and was rejected.
      struct TagPolicyException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied because it exceeded a quota.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request contains too many tags. Try the request again with fewer tags.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateCertificateOptionsRequest
        include JSON::Serializable

        # ARN of the requested certificate to update. This must be of the form: arn:aws:acm:us-east-1: account
        # :certificate/ 12345678-1234-1234-1234-123456789012
        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # Use to update the options for your certificate. Currently, you can specify whether to add your
        # certificate to a transparency log or export your certificate. Certificate transparency makes it
        # possible to detect SSL/TLS certificates that have been mistakenly or maliciously issued.
        # Certificates that have not been logged typically produce an error message in a browser.
        @[JSON::Field(key: "Options")]
        getter options : Types::CertificateOptions

        def initialize(
          @certificate_arn : String,
          @options : Types::CertificateOptions
        )
        end
      end

      # The supplied input failed to satisfy constraints of an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
