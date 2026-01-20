require "json"
require "time"

module Aws
  module ACMPCA
    module Types

      # Contains information about the certificate subject. The Subject field in the certificate identifies
      # the entity that owns or controls the public key in the certificate. The entity can be a user,
      # computer, device, or service. The Subject must contain an X.500 distinguished name (DN). A DN is a
      # sequence of relative distinguished names (RDNs). The RDNs are separated by commas in the
      # certificate.

      struct ASN1Subject
        include JSON::Serializable

        # For CA and end-entity certificates in a private PKI, the common name (CN) can be any string within
        # the length limit. Note: In publicly trusted certificates, the common name must be a fully qualified
        # domain name (FQDN) associated with the certificate subject.

        @[JSON::Field(key: "CommonName")]
        getter common_name : String?

        # Two-digit code that specifies the country in which the certificate subject located.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # Contains a sequence of one or more X.500 relative distinguished names (RDNs), each of which consists
        # of an object identifier (OID) and a value. For more information, see NIST’s definition of Object
        # Identifier (OID) . Custom attributes cannot be used in combination with standard attributes.

        @[JSON::Field(key: "CustomAttributes")]
        getter custom_attributes : Array(Types::CustomAttribute)?

        # Disambiguating information for the certificate subject.

        @[JSON::Field(key: "DistinguishedNameQualifier")]
        getter distinguished_name_qualifier : String?

        # Typically a qualifier appended to the name of an individual. Examples include Jr. for junior, Sr.
        # for senior, and III for third.

        @[JSON::Field(key: "GenerationQualifier")]
        getter generation_qualifier : String?

        # First name.

        @[JSON::Field(key: "GivenName")]
        getter given_name : String?

        # Concatenation that typically contains the first letter of the GivenName , the first letter of the
        # middle name if one exists, and the first letter of the Surname .

        @[JSON::Field(key: "Initials")]
        getter initials : String?

        # The locality (such as a city or town) in which the certificate subject is located.

        @[JSON::Field(key: "Locality")]
        getter locality : String?

        # Legal name of the organization with which the certificate subject is affiliated.

        @[JSON::Field(key: "Organization")]
        getter organization : String?

        # A subdivision or unit of the organization (such as sales or finance) with which the certificate
        # subject is affiliated.

        @[JSON::Field(key: "OrganizationalUnit")]
        getter organizational_unit : String?

        # Typically a shortened version of a longer GivenName . For example, Jonathan is often shortened to
        # John. Elizabeth is often shortened to Beth, Liz, or Eliza.

        @[JSON::Field(key: "Pseudonym")]
        getter pseudonym : String?

        # The certificate serial number.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # State in which the subject of the certificate is located.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Family name. In the US and the UK, for example, the surname of an individual is ordered last. In
        # Asian cultures the surname is typically ordered first.

        @[JSON::Field(key: "Surname")]
        getter surname : String?

        # A title such as Mr. or Ms., which is pre-pended to the name to refer formally to the certificate
        # subject.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @common_name : String? = nil,
          @country : String? = nil,
          @custom_attributes : Array(Types::CustomAttribute)? = nil,
          @distinguished_name_qualifier : String? = nil,
          @generation_qualifier : String? = nil,
          @given_name : String? = nil,
          @initials : String? = nil,
          @locality : String? = nil,
          @organization : String? = nil,
          @organizational_unit : String? = nil,
          @pseudonym : String? = nil,
          @serial_number : String? = nil,
          @state : String? = nil,
          @surname : String? = nil,
          @title : String? = nil
        )
        end
      end

      # Provides access information used by the authorityInfoAccess and subjectInfoAccess extensions
      # described in RFC 5280 .

      struct AccessDescription
        include JSON::Serializable

        # The location of AccessDescription information.

        @[JSON::Field(key: "AccessLocation")]
        getter access_location : Types::GeneralName

        # The type and format of AccessDescription information.

        @[JSON::Field(key: "AccessMethod")]
        getter access_method : Types::AccessMethod

        def initialize(
          @access_location : Types::GeneralName,
          @access_method : Types::AccessMethod
        )
        end
      end

      # Describes the type and format of extension access. Only one of CustomObjectIdentifier or
      # AccessMethodType may be provided. Providing both results in InvalidArgsException .

      struct AccessMethod
        include JSON::Serializable

        # Specifies the AccessMethod .

        @[JSON::Field(key: "AccessMethodType")]
        getter access_method_type : String?

        # An object identifier (OID) specifying the AccessMethod . The OID must satisfy the regular expression
        # shown below. For more information, see NIST's definition of Object Identifier (OID) .

        @[JSON::Field(key: "CustomObjectIdentifier")]
        getter custom_object_identifier : String?

        def initialize(
          @access_method_type : String? = nil,
          @custom_object_identifier : String? = nil
        )
        end
      end

      # Contains X.509 certificate information to be placed in an issued certificate. An APIPassthrough or
      # APICSRPassthrough template variant must be selected, or else this parameter is ignored. If
      # conflicting or duplicate certificate information is supplied from other sources, Amazon Web Services
      # Private CA applies order of operation rules to determine what information is used.

      struct ApiPassthrough
        include JSON::Serializable

        # Specifies X.509 extension information for a certificate.

        @[JSON::Field(key: "Extensions")]
        getter extensions : Types::Extensions?


        @[JSON::Field(key: "Subject")]
        getter subject : Types::ASN1Subject?

        def initialize(
          @extensions : Types::Extensions? = nil,
          @subject : Types::ASN1Subject? = nil
        )
        end
      end

      # Contains information about your private certificate authority (CA). Your private CA can issue and
      # revoke X.509 digital certificates. Digital certificates verify that the entity named in the
      # certificate Subject field owns or controls the public key contained in the Subject Public Key Info
      # field. Call the CreateCertificateAuthority action to create your private CA. You must then call the
      # GetCertificateAuthorityCertificate action to retrieve a private CA certificate signing request
      # (CSR). Sign the CSR with your Amazon Web Services Private CA-hosted or on-premises root or
      # subordinate CA certificate. Call the ImportCertificateAuthorityCertificate action to import the
      # signed certificate into Certificate Manager (ACM).

      struct CertificateAuthority
        include JSON::Serializable

        # Amazon Resource Name (ARN) for your private certificate authority (CA). The format is
        # 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Your private CA configuration.

        @[JSON::Field(key: "CertificateAuthorityConfiguration")]
        getter certificate_authority_configuration : Types::CertificateAuthorityConfiguration?

        # Date and time at which your private CA was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Reason the request to create your private CA failed.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # Defines a cryptographic key management compliance standard for handling and protecting CA keys.
        # Default: FIPS_140_2_LEVEL_3_OR_HIGHER Starting January 26, 2023, Amazon Web Services Private CA
        # protects all CA private keys in non-China regions using hardware security modules (HSMs) that comply
        # with FIPS PUB 140-2 Level 3. For information about security standard support in different Amazon Web
        # Services Regions, see Storage and security compliance of Amazon Web Services Private CA private keys
        # .

        @[JSON::Field(key: "KeyStorageSecurityStandard")]
        getter key_storage_security_standard : String?

        # Date and time at which your private CA was last updated.

        @[JSON::Field(key: "LastStateChangeAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_state_change_at : Time?

        # Date and time after which your private CA certificate is not valid.

        @[JSON::Field(key: "NotAfter", converter: Aws::Runtime::UnixTimestampConverter)]
        getter not_after : Time?

        # Date and time before which your private CA certificate is not valid.

        @[JSON::Field(key: "NotBefore", converter: Aws::Runtime::UnixTimestampConverter)]
        getter not_before : Time?

        # The Amazon Web Services account ID that owns the certificate authority.

        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The period during which a deleted CA can be restored. For more information, see the
        # PermanentDeletionTimeInDays parameter of the DeleteCertificateAuthorityRequest action.

        @[JSON::Field(key: "RestorableUntil", converter: Aws::Runtime::UnixTimestampConverter)]
        getter restorable_until : Time?

        # Information about the Online Certificate Status Protocol (OCSP) configuration or certificate
        # revocation list (CRL) created and maintained by your private CA.

        @[JSON::Field(key: "RevocationConfiguration")]
        getter revocation_configuration : Types::RevocationConfiguration?

        # Serial number of your private CA.

        @[JSON::Field(key: "Serial")]
        getter serial : String?

        # Status of your private CA.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Type of your private CA.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Specifies whether the CA issues general-purpose certificates that typically require a revocation
        # mechanism, or short-lived certificates that may optionally omit revocation because they expire
        # quickly. Short-lived certificate validity is limited to seven days. The default value is
        # GENERAL_PURPOSE.

        @[JSON::Field(key: "UsageMode")]
        getter usage_mode : String?

        def initialize(
          @arn : String? = nil,
          @certificate_authority_configuration : Types::CertificateAuthorityConfiguration? = nil,
          @created_at : Time? = nil,
          @failure_reason : String? = nil,
          @key_storage_security_standard : String? = nil,
          @last_state_change_at : Time? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @owner_account : String? = nil,
          @restorable_until : Time? = nil,
          @revocation_configuration : Types::RevocationConfiguration? = nil,
          @serial : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @usage_mode : String? = nil
        )
        end
      end

      # Contains configuration information for your private certificate authority (CA). This includes
      # information about the class of public key algorithm and the key pair that your private CA creates
      # when it issues a certificate. It also includes the signature algorithm that it uses when issuing
      # certificates, and its X.500 distinguished name. You must specify this information when you call the
      # CreateCertificateAuthority action.

      struct CertificateAuthorityConfiguration
        include JSON::Serializable

        # Type of the public key algorithm and size, in bits, of the key pair that your CA creates when it
        # issues a certificate. When you create a subordinate CA, you must use a key algorithm supported by
        # the parent CA.

        @[JSON::Field(key: "KeyAlgorithm")]
        getter key_algorithm : String

        # Name of the algorithm your private CA uses to sign certificate requests. This parameter should not
        # be confused with the SigningAlgorithm parameter used to sign certificates when they are issued.

        @[JSON::Field(key: "SigningAlgorithm")]
        getter signing_algorithm : String

        # Structure that contains X.500 distinguished name information for your private CA.

        @[JSON::Field(key: "Subject")]
        getter subject : Types::ASN1Subject

        # Specifies information to be added to the extension section of the certificate signing request (CSR).

        @[JSON::Field(key: "CsrExtensions")]
        getter csr_extensions : Types::CsrExtensions?

        def initialize(
          @key_algorithm : String,
          @signing_algorithm : String,
          @subject : Types::ASN1Subject,
          @csr_extensions : Types::CsrExtensions? = nil
        )
        end
      end

      # The certificate authority certificate you are importing does not comply with conditions specified in
      # the certificate that signed it.

      struct CertificateMismatchException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A previous update to your private CA is still ongoing.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateCertificateAuthorityAuditReportRequest
        include JSON::Serializable

        # The format in which to create the report. This can be either JSON or CSV .

        @[JSON::Field(key: "AuditReportResponseFormat")]
        getter audit_report_response_format : String

        # The Amazon Resource Name (ARN) of the CA to be audited. This is of the form: arn:aws:acm-pca: region
        # : account :certificate-authority/ 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The name of the S3 bucket that will contain the audit report.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        def initialize(
          @audit_report_response_format : String,
          @certificate_authority_arn : String,
          @s3_bucket_name : String
        )
        end
      end


      struct CreateCertificateAuthorityAuditReportResponse
        include JSON::Serializable

        # An alphanumeric string that contains a report identifier.

        @[JSON::Field(key: "AuditReportId")]
        getter audit_report_id : String?

        # The key that uniquely identifies the report file in your S3 bucket.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @audit_report_id : String? = nil,
          @s3_key : String? = nil
        )
        end
      end


      struct CreateCertificateAuthorityRequest
        include JSON::Serializable

        # Name and bit size of the private key algorithm, the name of the signing algorithm, and X.500
        # certificate subject information.

        @[JSON::Field(key: "CertificateAuthorityConfiguration")]
        getter certificate_authority_configuration : Types::CertificateAuthorityConfiguration

        # The type of the certificate authority.

        @[JSON::Field(key: "CertificateAuthorityType")]
        getter certificate_authority_type : String

        # Custom string that can be used to distinguish between calls to the CreateCertificateAuthority
        # action. Idempotency tokens for CreateCertificateAuthority time out after five minutes. Therefore, if
        # you call CreateCertificateAuthority multiple times with the same idempotency token within five
        # minutes, Amazon Web Services Private CA recognizes that you are requesting only certificate
        # authority and will issue only one. If you change the idempotency token for each call, Amazon Web
        # Services Private CA recognizes that you are requesting multiple certificate authorities.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Specifies a cryptographic key management compliance standard for handling and protecting CA keys.
        # Default: FIPS_140_2_LEVEL_3_OR_HIGHER Some Amazon Web Services Regions don't support the default
        # value. When you create a CA in these Regions, you must use CCPC_LEVEL_1_OR_HIGHER for the
        # KeyStorageSecurityStandard parameter. If you don't, the operation returns an InvalidArgsException
        # with this message: "A certificate authority cannot be created in this region with the specified
        # security standard." For information about security standard support in different Amazon Web Services
        # Regions, see Storage and security compliance of Amazon Web Services Private CA private keys .

        @[JSON::Field(key: "KeyStorageSecurityStandard")]
        getter key_storage_security_standard : String?

        # Contains information to enable support for Online Certificate Status Protocol (OCSP), certificate
        # revocation list (CRL), both protocols, or neither. By default, both certificate validation
        # mechanisms are disabled. The following requirements apply to revocation configurations. A
        # configuration disabling CRLs or OCSP must contain only the Enabled=False parameter, and will fail if
        # other parameters such as CustomCname or ExpirationInDays are included. In a CRL configuration, the
        # S3BucketName parameter must conform to Amazon S3 bucket naming rules . A configuration containing a
        # custom Canonical Name (CNAME) parameter for CRLs or OCSP must conform to RFC2396 restrictions on the
        # use of special characters in a CNAME. In a CRL or OCSP configuration, the value of a CNAME parameter
        # must not include a protocol prefix such as "http://" or "https://". For more information, see the
        # OcspConfiguration and CrlConfiguration types.

        @[JSON::Field(key: "RevocationConfiguration")]
        getter revocation_configuration : Types::RevocationConfiguration?

        # Key-value pairs that will be attached to the new private CA. You can associate up to 50 tags with a
        # private CA. For information using tags with IAM to manage permissions, see Controlling Access Using
        # IAM Tags .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether the CA issues general-purpose certificates that typically require a revocation
        # mechanism, or short-lived certificates that may optionally omit revocation because they expire
        # quickly. Short-lived certificate validity is limited to seven days. The default value is
        # GENERAL_PURPOSE.

        @[JSON::Field(key: "UsageMode")]
        getter usage_mode : String?

        def initialize(
          @certificate_authority_configuration : Types::CertificateAuthorityConfiguration,
          @certificate_authority_type : String,
          @idempotency_token : String? = nil,
          @key_storage_security_standard : String? = nil,
          @revocation_configuration : Types::RevocationConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil,
          @usage_mode : String? = nil
        )
        end
      end


      struct CreateCertificateAuthorityResponse
        include JSON::Serializable

        # If successful, the Amazon Resource Name (ARN) of the certificate authority (CA). This is of the
        # form: arn:aws:acm-pca: region : account :certificate-authority/ 12345678-1234-1234-1234-123456789012
        # .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        def initialize(
          @certificate_authority_arn : String? = nil
        )
        end
      end


      struct CreatePermissionRequest
        include JSON::Serializable

        # The actions that the specified Amazon Web Services service principal can use. These include
        # IssueCertificate , GetCertificate , and ListPermissions .

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)

        # The Amazon Resource Name (ARN) of the CA that grants the permissions. You can find the ARN by
        # calling the ListCertificateAuthorities action. This must have the following form: arn:aws:acm-pca:
        # region : account :certificate-authority/ 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The Amazon Web Services service or identity that receives the permission. At this time, the only
        # valid principal is acm.amazonaws.com .

        @[JSON::Field(key: "Principal")]
        getter principal : String

        # The ID of the calling account.

        @[JSON::Field(key: "SourceAccount")]
        getter source_account : String?

        def initialize(
          @actions : Array(String),
          @certificate_authority_arn : String,
          @principal : String,
          @source_account : String? = nil
        )
        end
      end

      # Contains configuration information for a certificate revocation list (CRL). Your private certificate
      # authority (CA) creates base CRLs. Delta CRLs are not supported. You can enable CRLs for your new or
      # an existing private CA by setting the Enabled parameter to true . Your private CA writes CRLs to an
      # S3 bucket that you specify in the S3BucketName parameter. You can hide the name of your bucket by
      # specifying a value for the CustomCname parameter. Your private CA by default copies the CNAME or the
      # S3 bucket name to the CRL Distribution Points extension of each certificate it issues. If you want
      # to configure this default behavior to be something different, you can set the
      # CrlDistributionPointExtensionConfiguration parameter. Your S3 bucket policy must give write
      # permission to Amazon Web Services Private CA. Amazon Web Services Private CA assets that are stored
      # in Amazon S3 can be protected with encryption. For more information, see Encrypting Your CRLs . Your
      # private CA uses the value in the ExpirationInDays parameter to calculate the nextUpdate field in the
      # CRL. The CRL is refreshed prior to a certificate's expiration date or when a certificate is revoked.
      # When a certificate is revoked, it appears in the CRL until the certificate expires, and then in one
      # additional CRL after expiration, and it always appears in the audit report. A CRL is typically
      # updated approximately 30 minutes after a certificate is revoked. If for any reason a CRL update
      # fails, Amazon Web Services Private CA makes further attempts every 15 minutes. CRLs contain the
      # following fields: Version : The current version number defined in RFC 5280 is V2. The integer value
      # is 0x1. Signature Algorithm : The name of the algorithm used to sign the CRL. Issuer : The X.500
      # distinguished name of your private CA that issued the CRL. Last Update : The issue date and time of
      # this CRL. Next Update : The day and time by which the next CRL will be issued. Revoked Certificates
      # : List of revoked certificates. Each list item contains the following information. Serial Number :
      # The serial number, in hexadecimal format, of the revoked certificate. Revocation Date : Date and
      # time the certificate was revoked. CRL Entry Extensions : Optional extensions for the CRL entry.
      # X509v3 CRL Reason Code : Reason the certificate was revoked. CRL Extensions : Optional extensions
      # for the CRL. X509v3 Authority Key Identifier : Identifies the public key associated with the private
      # key used to sign the certificate. X509v3 CRL Number: : Decimal sequence number for the CRL.
      # Signature Algorithm : Algorithm used by your private CA to sign the CRL. Signature Value : Signature
      # computed over the CRL. Certificate revocation lists created by Amazon Web Services Private CA are
      # DER-encoded. You can use the following OpenSSL command to list a CRL. openssl crl -inform DER -text
      # -in crl_path -noout For more information, see Planning a certificate revocation list (CRL) in the
      # Amazon Web Services Private Certificate Authority User Guide

      struct CrlConfiguration
        include JSON::Serializable

        # Boolean value that specifies whether certificate revocation lists (CRLs) are enabled. You can use
        # this value to enable certificate revocation for a new CA when you call the
        # CreateCertificateAuthority action or for an existing CA when you call the UpdateCertificateAuthority
        # action.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Configures the behavior of the CRL Distribution Point extension for certificates issued by your
        # certificate authority. If this field is not provided, then the CRl Distribution Point Extension will
        # be present and contain the default CRL URL.

        @[JSON::Field(key: "CrlDistributionPointExtensionConfiguration")]
        getter crl_distribution_point_extension_configuration : Types::CrlDistributionPointExtensionConfiguration?

        # Specifies whether to create a complete or partitioned CRL. This setting determines the maximum
        # number of certificates that the certificate authority can issue and revoke. For more information,
        # see Amazon Web Services Private CA quotas . COMPLETE - The default setting. Amazon Web Services
        # Private CA maintains a single CRL ﬁle for all unexpired certiﬁcates issued by a CA that have been
        # revoked for any reason. Each certiﬁcate that Amazon Web Services Private CA issues is bound to a
        # speciﬁc CRL through its CRL distribution point (CDP) extension, deﬁned in RFC 5280 . PARTITIONED -
        # Compared to complete CRLs, partitioned CRLs dramatically increase the number of certiﬁcates your
        # private CA can issue. When using partitioned CRLs, you must validate that the CRL's associated
        # issuing distribution point (IDP) URI matches the certiﬁcate's CDP URI to ensure the right CRL has
        # been fetched. Amazon Web Services Private CA marks the IDP extension as critical, which your client
        # must be able to process.

        @[JSON::Field(key: "CrlType")]
        getter crl_type : String?

        # Name inserted into the certificate CRL Distribution Points extension that enables the use of an
        # alias for the CRL distribution point. Use this value if you don't want the name of your S3 bucket to
        # be public. The content of a Canonical Name (CNAME) record must conform to RFC2396 restrictions on
        # the use of special characters in URIs. Additionally, the value of the CNAME must not include a
        # protocol prefix such as "http://" or "https://".

        @[JSON::Field(key: "CustomCname")]
        getter custom_cname : String?

        # Designates a custom ﬁle path in S3 for CRL(s). For example, http://&lt;CustomName&gt;/
        # &lt;CustomPath&gt;/&lt;CrlPartition_GUID&gt;.crl .

        @[JSON::Field(key: "CustomPath")]
        getter custom_path : String?

        # Validity period of the CRL in days.

        @[JSON::Field(key: "ExpirationInDays")]
        getter expiration_in_days : Int32?

        # Name of the S3 bucket that contains the CRL. If you do not provide a value for the CustomCname
        # argument, the name of your S3 bucket is placed into the CRL Distribution Points extension of the
        # issued certificate. You can change the name of your bucket by calling the UpdateCertificateAuthority
        # operation. You must specify a bucket policy that allows Amazon Web Services Private CA to write the
        # CRL to your bucket. The S3BucketName parameter must conform to the S3 bucket naming rules .

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # Determines whether the CRL will be publicly readable or privately held in the CRL Amazon S3 bucket.
        # If you choose PUBLIC_READ, the CRL will be accessible over the public internet. If you choose
        # BUCKET_OWNER_FULL_CONTROL, only the owner of the CRL S3 bucket can access the CRL, and your PKI
        # clients may need an alternative method of access. If no value is specified, the default is
        # PUBLIC_READ . Note: This default can cause CA creation to fail in some circumstances. If you have
        # have enabled the Block Public Access (BPA) feature in your S3 account, then you must specify the
        # value of this parameter as BUCKET_OWNER_FULL_CONTROL , and not doing so results in an error. If you
        # have disabled BPA in S3, then you can specify either BUCKET_OWNER_FULL_CONTROL or PUBLIC_READ as the
        # value. For more information, see Blocking public access to the S3 bucket .

        @[JSON::Field(key: "S3ObjectAcl")]
        getter s3_object_acl : String?

        def initialize(
          @enabled : Bool,
          @crl_distribution_point_extension_configuration : Types::CrlDistributionPointExtensionConfiguration? = nil,
          @crl_type : String? = nil,
          @custom_cname : String? = nil,
          @custom_path : String? = nil,
          @expiration_in_days : Int32? = nil,
          @s3_bucket_name : String? = nil,
          @s3_object_acl : String? = nil
        )
        end
      end

      # Contains configuration information for the default behavior of the CRL Distribution Point (CDP)
      # extension in certificates issued by your CA. This extension contains a link to download the CRL, so
      # you can check whether a certificate has been revoked. To choose whether you want this extension
      # omitted or not in certificates issued by your CA, you can set the OmitExtension parameter.

      struct CrlDistributionPointExtensionConfiguration
        include JSON::Serializable

        # Configures whether the CRL Distribution Point extension should be populated with the default URL to
        # the CRL. If set to true , then the CDP extension will not be present in any certificates issued by
        # that CA unless otherwise specified through CSR or API passthrough. Only set this if you have another
        # way to distribute the CRL Distribution Points ffor certificates issued by your CA, such as the
        # Matter Distributed Compliance Ledger This configuration cannot be enabled with a custom CNAME set.

        @[JSON::Field(key: "OmitExtension")]
        getter omit_extension : Bool

        def initialize(
          @omit_extension : Bool
        )
        end
      end

      # Describes the certificate extensions to be added to the certificate signing request (CSR).

      struct CsrExtensions
        include JSON::Serializable

        # Indicates the purpose of the certificate and of the key contained in the certificate.

        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : Types::KeyUsage?

        # For CA certificates, provides a path to additional information pertaining to the CA, such as
        # revocation and policy. For more information, see Subject Information Access in RFC 5280.

        @[JSON::Field(key: "SubjectInformationAccess")]
        getter subject_information_access : Array(Types::AccessDescription)?

        def initialize(
          @key_usage : Types::KeyUsage? = nil,
          @subject_information_access : Array(Types::AccessDescription)? = nil
        )
        end
      end

      # Defines the X.500 relative distinguished name (RDN).

      struct CustomAttribute
        include JSON::Serializable

        # Specifies the object identifier (OID) of the attribute type of the relative distinguished name
        # (RDN).

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String

        # Specifies the attribute value of relative distinguished name (RDN).

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @object_identifier : String,
          @value : String
        )
        end
      end

      # Specifies the X.509 extension information for a certificate. Extensions present in CustomExtensions
      # follow the ApiPassthrough template rules .

      struct CustomExtension
        include JSON::Serializable

        # Specifies the object identifier (OID) of the X.509 extension. For more information, see the Global
        # OID reference database.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String

        # Specifies the base64-encoded value of the X.509 extension.

        @[JSON::Field(key: "Value")]
        getter value : String

        # Specifies the critical flag of the X.509 extension.

        @[JSON::Field(key: "Critical")]
        getter critical : Bool?

        def initialize(
          @object_identifier : String,
          @value : String,
          @critical : Bool? = nil
        )
        end
      end


      struct DeleteCertificateAuthorityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must have the following form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The number of days to make a CA restorable after it has been deleted. This can be anywhere from 7 to
        # 30 days, with 30 being the default.

        @[JSON::Field(key: "PermanentDeletionTimeInDays")]
        getter permanent_deletion_time_in_days : Int32?

        def initialize(
          @certificate_authority_arn : String,
          @permanent_deletion_time_in_days : Int32? = nil
        )
        end
      end


      struct DeletePermissionRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the private CA that issued the permissions. You can find the
        # CA's ARN by calling the ListCertificateAuthorities action. This must have the following form:
        # arn:aws:acm-pca: region : account :certificate-authority/ 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The Amazon Web Services service or identity that will have its CA permissions revoked. At this time,
        # the only valid service principal is acm.amazonaws.com

        @[JSON::Field(key: "Principal")]
        getter principal : String

        # The Amazon Web Services account that calls this action.

        @[JSON::Field(key: "SourceAccount")]
        getter source_account : String?

        def initialize(
          @certificate_authority_arn : String,
          @principal : String,
          @source_account : String? = nil
        )
        end
      end


      struct DeletePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the private CA that will have its policy deleted. You can find
        # the CA's ARN by calling the ListCertificateAuthorities action. The ARN value must have the form
        # arn:aws:acm-pca:region:account:certificate-authority/01234567-89ab-cdef-0123-0123456789ab .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DescribeCertificateAuthorityAuditReportRequest
        include JSON::Serializable

        # The report ID returned by calling the CreateCertificateAuthorityAuditReport action.

        @[JSON::Field(key: "AuditReportId")]
        getter audit_report_id : String

        # The Amazon Resource Name (ARN) of the private CA. This must be of the form: arn:aws:acm-pca: region
        # : account :certificate-authority/ 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @audit_report_id : String,
          @certificate_authority_arn : String
        )
        end
      end


      struct DescribeCertificateAuthorityAuditReportResponse
        include JSON::Serializable

        # Specifies whether report creation is in progress, has succeeded, or has failed.

        @[JSON::Field(key: "AuditReportStatus")]
        getter audit_report_status : String?

        # The date and time at which the report was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Name of the S3 bucket that contains the report.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String?

        # S3 key that uniquely identifies the report file in your S3 bucket.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @audit_report_status : String? = nil,
          @created_at : Time? = nil,
          @s3_bucket_name : String? = nil,
          @s3_key : String? = nil
        )
        end
      end


      struct DescribeCertificateAuthorityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @certificate_authority_arn : String
        )
        end
      end


      struct DescribeCertificateAuthorityResponse
        include JSON::Serializable

        # A CertificateAuthority structure that contains information about your private CA.

        @[JSON::Field(key: "CertificateAuthority")]
        getter certificate_authority : Types::CertificateAuthority?

        def initialize(
          @certificate_authority : Types::CertificateAuthority? = nil
        )
        end
      end

      # Describes an Electronic Data Interchange (EDI) entity as described in as defined in Subject
      # Alternative Name in RFC 5280.

      struct EdiPartyName
        include JSON::Serializable

        # Specifies the party name.

        @[JSON::Field(key: "PartyName")]
        getter party_name : String

        # Specifies the name assigner.

        @[JSON::Field(key: "NameAssigner")]
        getter name_assigner : String?

        def initialize(
          @party_name : String,
          @name_assigner : String? = nil
        )
        end
      end

      # Specifies additional purposes for which the certified public key may be used other than basic
      # purposes indicated in the KeyUsage extension.

      struct ExtendedKeyUsage
        include JSON::Serializable

        # Specifies a custom ExtendedKeyUsage with an object identifier (OID).

        @[JSON::Field(key: "ExtendedKeyUsageObjectIdentifier")]
        getter extended_key_usage_object_identifier : String?

        # Specifies a standard ExtendedKeyUsage as defined as in RFC 5280 .

        @[JSON::Field(key: "ExtendedKeyUsageType")]
        getter extended_key_usage_type : String?

        def initialize(
          @extended_key_usage_object_identifier : String? = nil,
          @extended_key_usage_type : String? = nil
        )
        end
      end

      # Contains X.509 extension information for a certificate.

      struct Extensions
        include JSON::Serializable

        # Contains a sequence of one or more policy information terms, each of which consists of an object
        # identifier (OID) and optional qualifiers. For more information, see NIST's definition of Object
        # Identifier (OID) . In an end-entity certificate, these terms indicate the policy under which the
        # certificate was issued and the purposes for which it may be used. In a CA certificate, these terms
        # limit the set of policies for certification paths that include this certificate.

        @[JSON::Field(key: "CertificatePolicies")]
        getter certificate_policies : Array(Types::PolicyInformation)?

        # Contains a sequence of one or more X.509 extensions, each of which consists of an object identifier
        # (OID), a base64-encoded value, and the critical flag. For more information, see the Global OID
        # reference database.

        @[JSON::Field(key: "CustomExtensions")]
        getter custom_extensions : Array(Types::CustomExtension)?

        # Specifies additional purposes for which the certified public key may be used other than basic
        # purposes indicated in the KeyUsage extension.

        @[JSON::Field(key: "ExtendedKeyUsage")]
        getter extended_key_usage : Array(Types::ExtendedKeyUsage)?


        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : Types::KeyUsage?

        # The subject alternative name extension allows identities to be bound to the subject of the
        # certificate. These identities may be included in addition to or in place of the identity in the
        # subject field of the certificate.

        @[JSON::Field(key: "SubjectAlternativeNames")]
        getter subject_alternative_names : Array(Types::GeneralName)?

        def initialize(
          @certificate_policies : Array(Types::PolicyInformation)? = nil,
          @custom_extensions : Array(Types::CustomExtension)? = nil,
          @extended_key_usage : Array(Types::ExtendedKeyUsage)? = nil,
          @key_usage : Types::KeyUsage? = nil,
          @subject_alternative_names : Array(Types::GeneralName)? = nil
        )
        end
      end

      # Describes an ASN.1 X.400 GeneralName as defined in RFC 5280 . Only one of the following naming
      # options should be provided. Providing more than one option results in an InvalidArgsException error.

      struct GeneralName
        include JSON::Serializable


        @[JSON::Field(key: "DirectoryName")]
        getter directory_name : Types::ASN1Subject?

        # Represents GeneralName as a DNS name.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # Represents GeneralName as an EdiPartyName object.

        @[JSON::Field(key: "EdiPartyName")]
        getter edi_party_name : Types::EdiPartyName?

        # Represents GeneralName as an IPv4 or IPv6 address.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Represents GeneralName using an OtherName object.

        @[JSON::Field(key: "OtherName")]
        getter other_name : Types::OtherName?

        # Represents GeneralName as an object identifier (OID).

        @[JSON::Field(key: "RegisteredId")]
        getter registered_id : String?

        # Represents GeneralName as an RFC 822 email address.

        @[JSON::Field(key: "Rfc822Name")]
        getter rfc822_name : String?

        # Represents GeneralName as a URI.

        @[JSON::Field(key: "UniformResourceIdentifier")]
        getter uniform_resource_identifier : String?

        def initialize(
          @directory_name : Types::ASN1Subject? = nil,
          @dns_name : String? = nil,
          @edi_party_name : Types::EdiPartyName? = nil,
          @ip_address : String? = nil,
          @other_name : Types::OtherName? = nil,
          @registered_id : String? = nil,
          @rfc822_name : String? = nil,
          @uniform_resource_identifier : String? = nil
        )
        end
      end


      struct GetCertificateAuthorityCertificateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of your private CA. This is of the form: arn:aws:acm-pca: region :
        # account :certificate-authority/ 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @certificate_authority_arn : String
        )
        end
      end


      struct GetCertificateAuthorityCertificateResponse
        include JSON::Serializable

        # Base64-encoded certificate authority (CA) certificate.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # Base64-encoded certificate chain that includes any intermediate certificates and chains up to root
        # certificate that you used to sign your private CA certificate. The chain does not include your
        # private CA certificate. If this is a root CA, the value will be null.

        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        def initialize(
          @certificate : String? = nil,
          @certificate_chain : String? = nil
        )
        end
      end


      struct GetCertificateAuthorityCsrRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called the CreateCertificateAuthority
        # action. This must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @certificate_authority_arn : String
        )
        end
      end


      struct GetCertificateAuthorityCsrResponse
        include JSON::Serializable

        # The base64 PEM-encoded certificate signing request (CSR) for your private CA certificate.

        @[JSON::Field(key: "Csr")]
        getter csr : String?

        def initialize(
          @csr : String? = nil
        )
        end
      end


      struct GetCertificateRequest
        include JSON::Serializable

        # The ARN of the issued certificate. The ARN contains the certificate serial number and must be in the
        # following form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012 /certificate/ 286535153982981100925020015808220737245

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012 .

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @certificate_arn : String,
          @certificate_authority_arn : String
        )
        end
      end


      struct GetCertificateResponse
        include JSON::Serializable

        # The base64 PEM-encoded certificate specified by the CertificateArn parameter.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The base64 PEM-encoded certificate chain that chains up to the root CA certificate that you used to
        # sign your private CA certificate.

        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        def initialize(
          @certificate : String? = nil,
          @certificate_chain : String? = nil
        )
        end
      end


      struct GetPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the private CA that will have its policy retrieved. You can find
        # the CA's ARN by calling the ListCertificateAuthorities action.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetPolicyResponse
        include JSON::Serializable

        # The policy attached to the private CA as a JSON document.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct ImportCertificateAuthorityCertificateRequest
        include JSON::Serializable

        # The PEM-encoded certificate for a private CA. This may be a self-signed certificate in the case of a
        # root CA, or it may be signed by another CA that you control.

        @[JSON::Field(key: "Certificate")]
        getter certificate : Bytes

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # A PEM-encoded file that contains all of your certificates, other than the certificate you're
        # importing, chaining up to your root CA. Your Amazon Web Services Private CA-hosted or on-premises
        # root certificate is the last in the chain, and each certificate in the chain signs the one
        # preceding. This parameter must be supplied when you import a subordinate CA. When you import a root
        # CA, there is no chain.

        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : Bytes?

        def initialize(
          @certificate : Bytes,
          @certificate_authority_arn : String,
          @certificate_chain : Bytes? = nil
        )
        end
      end

      # One or more of the specified arguments was not valid.

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

      # The token specified in the NextToken argument is not valid. Use the token returned from your
      # previous call to ListCertificateAuthorities .

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource policy is invalid or is missing a required statement. For general information about IAM
      # policy and statement structure, see Overview of JSON Policies .

      struct InvalidPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request action cannot be performed or is prohibited.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The state of the private CA does not allow this action to occur.

      struct InvalidStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The tag associated with the CA is not valid. The invalid argument is contained in the message field.

      struct InvalidTagException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct IssueCertificateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The certificate signing request (CSR) for the certificate you want to issue. As an example, you can
        # use the following OpenSSL command to create the CSR and a 2048 bit RSA private key. openssl req -new
        # -newkey rsa:2048 -days 365 -keyout private/test_cert_priv_key.pem -out csr/test_cert_.csr If you
        # have a configuration file, you can then use the following OpenSSL command. The usr_cert block in the
        # configuration file contains your X509 version 3 extensions. openssl req -new -config openssl_rsa.cnf
        # -extensions usr_cert -newkey rsa:2048 -days 365 -keyout private/test_cert_priv_key.pem -out
        # csr/test_cert_.csr Note: A CSR must provide either a subject name or a subject alternative name or
        # the request will be rejected.

        @[JSON::Field(key: "Csr")]
        getter csr : Bytes

        # The name of the algorithm that will be used to sign the certificate to be issued. This parameter
        # should not be confused with the SigningAlgorithm parameter used to sign a CSR in the
        # CreateCertificateAuthority action. The specified signing algorithm family (RSA or ECDSA) must match
        # the algorithm family of the CA's secret key.

        @[JSON::Field(key: "SigningAlgorithm")]
        getter signing_algorithm : String

        # Information describing the end of the validity period of the certificate. This parameter sets the
        # “Not After” date for the certificate. Certificate validity is the period of time during which a
        # certificate is valid. Validity can be expressed as an explicit date and time when the certificate
        # expires, or as a span of time after issuance, stated in days, months, or years. For more
        # information, see Validity in RFC 5280. This value is unaffected when ValidityNotBefore is also
        # specified. For example, if Validity is set to 20 days in the future, the certificate will expire 20
        # days from issuance time regardless of the ValidityNotBefore value. The end of the validity period
        # configured on a certificate must not exceed the limit set on its parents in the CA hierarchy.

        @[JSON::Field(key: "Validity")]
        getter validity : Types::Validity

        # Specifies X.509 certificate information to be included in the issued certificate. An APIPassthrough
        # or APICSRPassthrough template variant must be selected, or else this parameter is ignored. For more
        # information about using these templates, see Understanding Certificate Templates . If conflicting or
        # duplicate certificate information is supplied during certificate issuance, Amazon Web Services
        # Private CA applies order of operation rules to determine what information is used.

        @[JSON::Field(key: "ApiPassthrough")]
        getter api_passthrough : Types::ApiPassthrough?

        # Alphanumeric string that can be used to distinguish between calls to the IssueCertificate action.
        # Idempotency tokens for IssueCertificate time out after five minutes. Therefore, if you call
        # IssueCertificate multiple times with the same idempotency token within five minutes, Amazon Web
        # Services Private CA recognizes that you are requesting only one certificate and will issue only one.
        # If you change the idempotency token for each call, Amazon Web Services Private CA recognizes that
        # you are requesting multiple certificates.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Specifies a custom configuration template to use when issuing a certificate. If this parameter is
        # not provided, Amazon Web Services Private CA defaults to the EndEntityCertificate/V1 template. For
        # CA certificates, you should choose the shortest path length that meets your needs. The path length
        # is indicated by the PathLen N portion of the ARN, where N is the CA depth . Note: The CA depth
        # configured on a subordinate CA certificate must not exceed the limit set by its parents in the CA
        # hierarchy. For a list of TemplateArn values supported by Amazon Web Services Private CA, see
        # Understanding Certificate Templates .

        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # Information describing the start of the validity period of the certificate. This parameter sets the
        # “Not Before" date for the certificate. By default, when issuing a certificate, Amazon Web Services
        # Private CA sets the "Not Before" date to the issuance time minus 60 minutes. This compensates for
        # clock inconsistencies across computer systems. The ValidityNotBefore parameter can be used to
        # customize the “Not Before” value. Unlike the Validity parameter, the ValidityNotBefore parameter is
        # optional. The ValidityNotBefore value is expressed as an explicit date and time, using the Validity
        # type value ABSOLUTE . For more information, see Validity in this API reference and Validity in RFC
        # 5280.

        @[JSON::Field(key: "ValidityNotBefore")]
        getter validity_not_before : Types::Validity?

        def initialize(
          @certificate_authority_arn : String,
          @csr : Bytes,
          @signing_algorithm : String,
          @validity : Types::Validity,
          @api_passthrough : Types::ApiPassthrough? = nil,
          @idempotency_token : String? = nil,
          @template_arn : String? = nil,
          @validity_not_before : Types::Validity? = nil
        )
        end
      end


      struct IssueCertificateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the issued certificate and the certificate serial number. This is
        # of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012 /certificate/ 286535153982981100925020015808220737245

        @[JSON::Field(key: "CertificateArn")]
        getter certificate_arn : String?

        def initialize(
          @certificate_arn : String? = nil
        )
        end
      end

      # Defines one or more purposes for which the key contained in the certificate can be used. Default
      # value for each option is false.

      struct KeyUsage
        include JSON::Serializable

        # Key can be used to sign CRLs.

        @[JSON::Field(key: "CRLSign")]
        getter crl_sign : Bool?

        # Key can be used to decipher data.

        @[JSON::Field(key: "DataEncipherment")]
        getter data_encipherment : Bool?

        # Key can be used only to decipher data.

        @[JSON::Field(key: "DecipherOnly")]
        getter decipher_only : Bool?

        # Key can be used for digital signing.

        @[JSON::Field(key: "DigitalSignature")]
        getter digital_signature : Bool?

        # Key can be used only to encipher data.

        @[JSON::Field(key: "EncipherOnly")]
        getter encipher_only : Bool?

        # Key can be used in a key-agreement protocol.

        @[JSON::Field(key: "KeyAgreement")]
        getter key_agreement : Bool?

        # Key can be used to sign certificates.

        @[JSON::Field(key: "KeyCertSign")]
        getter key_cert_sign : Bool?

        # Key can be used to encipher data.

        @[JSON::Field(key: "KeyEncipherment")]
        getter key_encipherment : Bool?

        # Key can be used for non-repudiation.

        @[JSON::Field(key: "NonRepudiation")]
        getter non_repudiation : Bool?

        def initialize(
          @crl_sign : Bool? = nil,
          @data_encipherment : Bool? = nil,
          @decipher_only : Bool? = nil,
          @digital_signature : Bool? = nil,
          @encipher_only : Bool? = nil,
          @key_agreement : Bool? = nil,
          @key_cert_sign : Bool? = nil,
          @key_encipherment : Bool? = nil,
          @non_repudiation : Bool? = nil
        )
        end
      end

      # An Amazon Web Services Private CA quota has been exceeded. See the exception message returned to
      # determine the quota that was exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListCertificateAuthoritiesRequest
        include JSON::Serializable

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items. Although the maximum value is 1000, the action only returns a maximum of 100
        # items.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Use this parameter to filter the returned set of certificate authorities based on their owner. The
        # default is SELF.

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end


      struct ListCertificateAuthoritiesResponse
        include JSON::Serializable

        # Summary information about each certificate authority you have created.

        @[JSON::Field(key: "CertificateAuthorities")]
        getter certificate_authorities : Array(Types::CertificateAuthority)?

        # When the list is truncated, this value is present and should be used for the NextToken parameter in
        # a subsequent pagination request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificate_authorities : Array(Types::CertificateAuthority)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionsRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the private CA to inspect. You can find the ARN by calling the
        # ListCertificateAuthorities action. This must be of the form:
        # arn:aws:acm-pca:region:account:certificate-authority/12345678-1234-1234-1234-123456789012 You can
        # get a private CA's ARN by running the ListCertificateAuthorities action.

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # When paginating results, use this parameter to specify the maximum number of items to return in the
        # response. If additional items exist beyond the number you specify, the NextToken element is sent in
        # the response. Use this NextToken value in a subsequent request to retrieve additional items.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When paginating results, use this parameter in a subsequent request after you receive a response
        # with truncated results. Set it to the value of NextToken from the response you just received.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificate_authority_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPermissionsResponse
        include JSON::Serializable

        # When the list is truncated, this value is present and should be used for the NextToken parameter in
        # a subsequent pagination request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Summary information about each permission assigned by the specified private CA, including the action
        # enabled, the policy provided, and the time of creation.

        @[JSON::Field(key: "Permissions")]
        getter permissions : Array(Types::Permission)?

        def initialize(
          @next_token : String? = nil,
          @permissions : Array(Types::Permission)? = nil
        )
        end
      end


      struct ListTagsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called the CreateCertificateAuthority
        # action. This must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response. If additional items exist beyond the number you specify, the NextToken element is sent in
        # the response. Use this NextToken value in a subsequent request to retrieve additional items.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of NextToken from the response you just received.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificate_authority_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsResponse
        include JSON::Serializable

        # When the list is truncated, this value is present and should be used for the NextToken parameter in
        # a subsequent pagination request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags associated with your private CA.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The current action was prevented because it would lock the caller out from performing subsequent
      # actions. Verify that the specified parameters would not result in the caller being denied access to
      # the resource.

      struct LockoutPreventedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The certificate signing request is invalid.

      struct MalformedCSRException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more fields in the certificate are invalid.

      struct MalformedCertificateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information to enable and configure Online Certificate Status Protocol (OCSP) for
      # validating certificate revocation status. When you revoke a certificate, OCSP responses may take up
      # to 60 minutes to reflect the new status.

      struct OcspConfiguration
        include JSON::Serializable

        # Flag enabling use of the Online Certificate Status Protocol (OCSP) for validating certificate
        # revocation status.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # By default, Amazon Web Services Private CA injects an Amazon Web Services domain into certificates
        # being validated by the Online Certificate Status Protocol (OCSP). A customer can alternatively use
        # this object to define a CNAME specifying a customized OCSP domain. The content of a Canonical Name
        # (CNAME) record must conform to RFC2396 restrictions on the use of special characters in URIs.
        # Additionally, the value of the CNAME must not include a protocol prefix such as "http://" or
        # "https://". For more information, see Customizing Online Certificate Status Protocol (OCSP) in the
        # Amazon Web Services Private Certificate Authority User Guide .

        @[JSON::Field(key: "OcspCustomCname")]
        getter ocsp_custom_cname : String?

        def initialize(
          @enabled : Bool,
          @ocsp_custom_cname : String? = nil
        )
        end
      end

      # Defines a custom ASN.1 X.400 GeneralName using an object identifier (OID) and value. The OID must
      # satisfy the regular expression shown below. For more information, see NIST's definition of Object
      # Identifier (OID) .

      struct OtherName
        include JSON::Serializable

        # Specifies an OID.

        @[JSON::Field(key: "TypeId")]
        getter type_id : String

        # Specifies an OID value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type_id : String,
          @value : String
        )
        end
      end

      # Permissions designate which private CA actions can be performed by an Amazon Web Services service or
      # entity. In order for ACM to automatically renew private certificates, you must give the ACM service
      # principal all available permissions ( IssueCertificate , GetCertificate , and ListPermissions ).
      # Permissions can be assigned with the CreatePermission action, removed with the DeletePermission
      # action, and listed with the ListPermissions action.

      struct Permission
        include JSON::Serializable

        # The private CA actions that can be performed by the designated Amazon Web Services service.

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)?

        # The Amazon Resource Number (ARN) of the private CA from which the permission was issued.

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # The time at which the permission was created.

        @[JSON::Field(key: "CreatedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The name of the policy that is associated with the permission.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The Amazon Web Services service or entity that holds the permission. At this time, the only valid
        # principal is acm.amazonaws.com .

        @[JSON::Field(key: "Principal")]
        getter principal : String?

        # The ID of the account that assigned the permission.

        @[JSON::Field(key: "SourceAccount")]
        getter source_account : String?

        def initialize(
          @actions : Array(String)? = nil,
          @certificate_authority_arn : String? = nil,
          @created_at : Time? = nil,
          @policy : String? = nil,
          @principal : String? = nil,
          @source_account : String? = nil
        )
        end
      end

      # The designated permission has already been given to the user.

      struct PermissionAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines the X.509 CertificatePolicies extension.

      struct PolicyInformation
        include JSON::Serializable

        # Specifies the object identifier (OID) of the certificate policy under which the certificate was
        # issued. For more information, see NIST's definition of Object Identifier (OID) .

        @[JSON::Field(key: "CertPolicyId")]
        getter cert_policy_id : String

        # Modifies the given CertPolicyId with a qualifier. Amazon Web Services Private CA supports the
        # certification practice statement (CPS) qualifier.

        @[JSON::Field(key: "PolicyQualifiers")]
        getter policy_qualifiers : Array(Types::PolicyQualifierInfo)?

        def initialize(
          @cert_policy_id : String,
          @policy_qualifiers : Array(Types::PolicyQualifierInfo)? = nil
        )
        end
      end

      # Modifies the CertPolicyId of a PolicyInformation object with a qualifier. Amazon Web Services
      # Private CA supports the certification practice statement (CPS) qualifier.

      struct PolicyQualifierInfo
        include JSON::Serializable

        # Identifies the qualifier modifying a CertPolicyId .

        @[JSON::Field(key: "PolicyQualifierId")]
        getter policy_qualifier_id : String

        # Defines the qualifier type. Amazon Web Services Private CA supports the use of a URI for a CPS
        # qualifier in this field.

        @[JSON::Field(key: "Qualifier")]
        getter qualifier : Types::Qualifier

        def initialize(
          @policy_qualifier_id : String,
          @qualifier : Types::Qualifier
        )
        end
      end


      struct PutPolicyRequest
        include JSON::Serializable

        # The path and file name of a JSON-formatted IAM policy to attach to the specified private CA
        # resource. If this policy does not contain all required statements or if it includes any statement
        # that is not allowed, the PutPolicy action returns an InvalidPolicyException . For information about
        # IAM policy and statement structure, see Overview of JSON Policies .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Number (ARN) of the private CA to associate with the policy. The ARN of the CA
        # can be found by calling the ListCertificateAuthorities action.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end

      # Defines a PolicyInformation qualifier. Amazon Web Services Private CA supports the certification
      # practice statement (CPS) qualifier defined in RFC 5280.

      struct Qualifier
        include JSON::Serializable

        # Contains a pointer to a certification practice statement (CPS) published by the CA.

        @[JSON::Field(key: "CpsUri")]
        getter cps_uri : String

        def initialize(
          @cps_uri : String
        )
        end
      end

      # Your request has already been completed.

      struct RequestAlreadyProcessedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request has failed for an unspecified reason.

      struct RequestFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your request is already in progress.

      struct RequestInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A resource such as a private CA, S3 bucket, certificate, audit report, or policy cannot be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RestoreCertificateAuthorityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called the CreateCertificateAuthority
        # action. This must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        def initialize(
          @certificate_authority_arn : String
        )
        end
      end

      # Certificate revocation information used by the CreateCertificateAuthority and
      # UpdateCertificateAuthority actions. Your private certificate authority (CA) can configure Online
      # Certificate Status Protocol (OCSP) support and/or maintain a certificate revocation list (CRL). OCSP
      # returns validation information about certificates as requested by clients, and a CRL contains an
      # updated list of certificates revoked by your CA. For more information, see RevokeCertificate and
      # Setting up a certificate revocation method in the Amazon Web Services Private Certificate Authority
      # User Guide .

      struct RevocationConfiguration
        include JSON::Serializable

        # Configuration of the certificate revocation list (CRL), if any, maintained by your private CA. A CRL
        # is typically updated approximately 30 minutes after a certificate is revoked. If for any reason a
        # CRL update fails, Amazon Web Services Private CA makes further attempts every 15 minutes.

        @[JSON::Field(key: "CrlConfiguration")]
        getter crl_configuration : Types::CrlConfiguration?

        # Configuration of Online Certificate Status Protocol (OCSP) support, if any, maintained by your
        # private CA. When you revoke a certificate, OCSP responses may take up to 60 minutes to reflect the
        # new status.

        @[JSON::Field(key: "OcspConfiguration")]
        getter ocsp_configuration : Types::OcspConfiguration?

        def initialize(
          @crl_configuration : Types::CrlConfiguration? = nil,
          @ocsp_configuration : Types::OcspConfiguration? = nil
        )
        end
      end


      struct RevokeCertificateRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the private CA that issued the certificate to be revoked. This must be
        # of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # Serial number of the certificate to be revoked. This must be in hexadecimal format. You can retrieve
        # the serial number by calling GetCertificate with the Amazon Resource Name (ARN) of the certificate
        # you want and the ARN of your private CA. The GetCertificate action retrieves the certificate in the
        # PEM format. You can use the following OpenSSL command to list the certificate in text format and
        # copy the hexadecimal serial number. openssl x509 -in file_path -text -noout You can also copy the
        # serial number from the console or use the DescribeCertificate action in the Certificate Manager API
        # Reference .

        @[JSON::Field(key: "CertificateSerial")]
        getter certificate_serial : String

        # Specifies why you revoked the certificate.

        @[JSON::Field(key: "RevocationReason")]
        getter revocation_reason : String

        def initialize(
          @certificate_authority_arn : String,
          @certificate_serial : String,
          @revocation_reason : String
        )
        end
      end

      # Tags are labels that you can use to identify and organize your private CAs. Each tag consists of a
      # key and an optional value. You can associate up to 50 tags with a private CA. To add one or more
      # tags to a private CA, call the TagCertificateAuthority action. To remove a tag, call the
      # UntagCertificateAuthority action.

      struct Tag
        include JSON::Serializable

        # Key (name) of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagCertificateAuthorityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # List of tags to be associated with the CA.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @certificate_authority_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # You can associate up to 50 tags with a private CA. Exception information is contained in the
      # exception message field.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagCertificateAuthorityRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateCertificateAuthority . This
        # must be of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # List of tags to be removed from the CA.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @certificate_authority_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct UpdateCertificateAuthorityRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the private CA that issued the certificate to be revoked. This must be
        # of the form: arn:aws:acm-pca: region : account :certificate-authority/
        # 12345678-1234-1234-1234-123456789012

        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # Contains information to enable support for Online Certificate Status Protocol (OCSP), certificate
        # revocation list (CRL), both protocols, or neither. If you don't supply this parameter, existing
        # capibilites remain unchanged. For more information, see the OcspConfiguration and CrlConfiguration
        # types. The following requirements apply to revocation configurations. A configuration disabling CRLs
        # or OCSP must contain only the Enabled=False parameter, and will fail if other parameters such as
        # CustomCname or ExpirationInDays are included. In a CRL configuration, the S3BucketName parameter
        # must conform to Amazon S3 bucket naming rules . A configuration containing a custom Canonical Name
        # (CNAME) parameter for CRLs or OCSP must conform to RFC2396 restrictions on the use of special
        # characters in a CNAME. In a CRL or OCSP configuration, the value of a CNAME parameter must not
        # include a protocol prefix such as "http://" or "https://". If you update the S3BucketName of
        # CrlConfiguration , you can break revocation for existing certificates. In other words, if you call
        # UpdateCertificateAuthority to update the CRL configuration's S3 bucket name, Amazon Web Services
        # Private CA only writes CRLs to the new S3 bucket. Certificates issued prior to this point will have
        # the old S3 bucket name in your CRL Distribution Point (CDP) extension, essentially breaking
        # revocation. If you must update the S3 bucket, you'll need to reissue old certificates to keep the
        # revocation working. Alternatively, you can use a CustomCname in your CRL configuration if you might
        # need to change the S3 bucket name in the future.

        @[JSON::Field(key: "RevocationConfiguration")]
        getter revocation_configuration : Types::RevocationConfiguration?

        # Status of your private CA.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @certificate_authority_arn : String,
          @revocation_configuration : Types::RevocationConfiguration? = nil,
          @status : String? = nil
        )
        end
      end

      # Validity specifies the period of time during which a certificate is valid. Validity can be expressed
      # as an explicit date and time when the validity of a certificate starts or expires, or as a span of
      # time after issuance, stated in days, months, or years. For more information, see Validity in RFC
      # 5280. Amazon Web Services Private CA API consumes the Validity data type differently in two distinct
      # parameters of the IssueCertificate action. The required parameter IssueCertificate : Validity
      # specifies the end of a certificate's validity period. The optional parameter IssueCertificate :
      # ValidityNotBefore specifies a customized starting time for the validity period.

      struct Validity
        include JSON::Serializable

        # Determines how Amazon Web Services Private CA interprets the Value parameter, an integer. Supported
        # validity types include those listed below. Type definitions with values include a sample input value
        # and the resulting output. END_DATE : The specific date and time when the certificate will expire,
        # expressed using UTCTime (YYMMDDHHMMSS) or GeneralizedTime (YYYYMMDDHHMMSS) format. When UTCTime is
        # used, if the year field (YY) is greater than or equal to 50, the year is interpreted as 19YY. If the
        # year field is less than 50, the year is interpreted as 20YY. Sample input value: 491231235959
        # (UTCTime format) Output expiration date/time: 12/31/2049 23:59:59 ABSOLUTE : The specific date and
        # time when the validity of a certificate will start or expire, expressed in seconds since the Unix
        # Epoch. Sample input value: 2524608000 Output expiration date/time: 01/01/2050 00:00:00 DAYS , MONTHS
        # , YEARS : The relative time from the moment of issuance until the certificate will expire, expressed
        # in days, months, or years. Example if DAYS , issued on 10/12/2020 at 12:34:54 UTC: Sample input
        # value: 90 Output expiration date: 01/10/2020 12:34:54 UTC The minimum validity duration for a
        # certificate using relative time ( DAYS ) is one day. The minimum validity for a certificate using
        # absolute time ( ABSOLUTE or END_DATE ) is one second.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A long integer interpreted according to the value of Type , below.

        @[JSON::Field(key: "Value")]
        getter value : Int64

        def initialize(
          @type : String,
          @value : Int64
        )
        end
      end
    end
  end
end
