require "json"
require "time"

module AwsSdk
  module PcaConnectorAd
    module Types

      # An access control entry allows or denies Active Directory groups based on their security identifiers
      # (SIDs) from enrolling and/or autoenrolling with the template.
      struct AccessControlEntry
        include JSON::Serializable

        # Permissions to allow or deny an Active Directory group to enroll or autoenroll certificates issued
        # against a template.
        @[JSON::Field(key: "AccessRights")]
        getter access_rights : Types::AccessRights?

        # The date and time that the Access Control Entry was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Name of the Active Directory group. This name does not need to match the group name in Active
        # Directory.
        @[JSON::Field(key: "GroupDisplayName")]
        getter group_display_name : String?

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String?

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The date and time that the Access Control Entry was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @access_rights : Types::AccessRights? = nil,
          @created_at : Time? = nil,
          @group_display_name : String? = nil,
          @group_security_identifier : String? = nil,
          @template_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Summary of group access control entries that allow or deny Active Directory groups based on their
      # security identifiers (SIDs) from enrolling and/or autofenrolling with the template.
      struct AccessControlEntrySummary
        include JSON::Serializable

        # Allow or deny an Active Directory group from enrolling and autoenrolling certificates issued against
        # a template.
        @[JSON::Field(key: "AccessRights")]
        getter access_rights : Types::AccessRights?

        # The date and time that the Access Control Entry was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Name of the Active Directory group. This name does not need to match the group name in Active
        # Directory.
        @[JSON::Field(key: "GroupDisplayName")]
        getter group_display_name : String?

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String?

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        # The date and time that the Access Control Entry was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @access_rights : Types::AccessRights? = nil,
          @created_at : Time? = nil,
          @group_display_name : String? = nil,
          @group_security_identifier : String? = nil,
          @template_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # You can receive this error if you attempt to create a resource share when you don't have the
      # required permissions. This can be caused by insufficient permissions in policies attached to your
      # Amazon Web Services Identity and Access Management (IAM) principal. It can also happen because of
      # restrictions in place from an Amazon Web Services Organizations service control policy (SCP) that
      # affects your Amazon Web Services account.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Allow or deny permissions for an Active Directory group to enroll or autoenroll certificates for a
      # template.
      struct AccessRights
        include JSON::Serializable

        # Allow or deny an Active Directory group from autoenrolling certificates issued against a template.
        # The Active Directory group must be allowed to enroll to allow autoenrollment
        @[JSON::Field(key: "AutoEnroll")]
        getter auto_enroll : String?

        # Allow or deny an Active Directory group from enrolling certificates issued against a template.
        @[JSON::Field(key: "Enroll")]
        getter enroll : String?

        def initialize(
          @auto_enroll : String? = nil,
          @enroll : String? = nil
        )
        end
      end

      # Application policies describe what the certificate can be used for.
      struct ApplicationPolicies
        include JSON::Serializable

        # Application policies describe what the certificate can be used for.
        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::ApplicationPolicy)

        # Marks the application policy extension as critical.
        @[JSON::Field(key: "Critical")]
        getter critical : Bool?

        def initialize(
          @policies : Array(Types::ApplicationPolicy),
          @critical : Bool? = nil
        )
        end
      end

      # Application policies describe what the certificate can be used for.
      struct ApplicationPolicy
        include JSON::Serializable

        # The object identifier (OID) of an application policy.
        @[JSON::Field(key: "PolicyObjectIdentifier")]
        getter policy_object_identifier : String?

        # The type of application policy
        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @policy_object_identifier : String? = nil,
          @policy_type : String? = nil
        )
        end
      end

      # Information describing the end of the validity period of the certificate. This parameter sets the
      # “Not After” date for the certificate. Certificate validity is the period of time during which a
      # certificate is valid. Validity can be expressed as an explicit date and time when the certificate
      # expires, or as a span of time after issuance, stated in days, months, or years. For more
      # information, see Validity in RFC 5280. This value is unaffected when ValidityNotBefore is also
      # specified. For example, if Validity is set to 20 days in the future, the certificate will expire 20
      # days from issuance time regardless of the ValidityNotBefore value.
      struct CertificateValidity
        include JSON::Serializable

        # Renewal period is the period of time before certificate expiration when a new certificate will be
        # requested.
        @[JSON::Field(key: "RenewalPeriod")]
        getter renewal_period : Types::ValidityPeriod

        # Information describing the end of the validity period of the certificate. This parameter sets the
        # “Not After” date for the certificate. Certificate validity is the period of time during which a
        # certificate is valid. Validity can be expressed as an explicit date and time when the certificate
        # expires, or as a span of time after issuance, stated in days, months, or years. For more
        # information, see Validity in RFC 5280. This value is unaffected when ValidityNotBefore is also
        # specified. For example, if Validity is set to 20 days in the future, the certificate will expire 20
        # days from issuance time regardless of the ValidityNotBefore value.
        @[JSON::Field(key: "ValidityPeriod")]
        getter validity_period : Types::ValidityPeriod

        def initialize(
          @renewal_period : Types::ValidityPeriod,
          @validity_period : Types::ValidityPeriod
        )
        end
      end

      # This request cannot be completed for one of the following reasons because the requested resource was
      # being concurrently modified by another request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The identifier of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type, which can be one of Connector , Template , TemplateGroupAccessControlEntry ,
        # ServicePrincipalName , or DirectoryRegistration .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Amazon Web Services Private CA Connector for Active Directory is a service that links your Active
      # Directory with Amazon Web Services Private CA. The connector brokers the exchange of certificates
      # from Amazon Web Services Private CA to domain-joined users and machines managed with Active
      # Directory.
      struct Connector
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the certificate authority being used.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # Certificate enrollment endpoint for Active Directory domain-joined objects reach out to when
        # requesting certificates.
        @[JSON::Field(key: "CertificateEnrollmentPolicyServerEndpoint")]
        getter certificate_enrollment_policy_server_endpoint : String?

        # The date and time that the connector was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Status of the connector. Status can be creating, active, deleting, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the connector status if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The date and time that the connector was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        # Information of the VPC and security group(s) used with the connector.
        @[JSON::Field(key: "VpcInformation")]
        getter vpc_information : Types::VpcInformation?

        def initialize(
          @arn : String? = nil,
          @certificate_authority_arn : String? = nil,
          @certificate_enrollment_policy_server_endpoint : String? = nil,
          @created_at : Time? = nil,
          @directory_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil,
          @vpc_information : Types::VpcInformation? = nil
        )
        end
      end

      # Summary description of the Amazon Web Services Private CA AD connectors belonging to an Amazon Web
      # Services account.
      struct ConnectorSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) of the certificate authority being used.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String?

        # Certificate enrollment endpoint for Active Directory domain-joined objects to request certificates.
        @[JSON::Field(key: "CertificateEnrollmentPolicyServerEndpoint")]
        getter certificate_enrollment_policy_server_endpoint : String?

        # The date and time that the connector was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Status of the connector. Status can be creating, active, deleting, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the connector status if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The date and time that the connector was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        # Information of the VPC and security group(s) used with the connector.
        @[JSON::Field(key: "VpcInformation")]
        getter vpc_information : Types::VpcInformation?

        def initialize(
          @arn : String? = nil,
          @certificate_authority_arn : String? = nil,
          @certificate_enrollment_policy_server_endpoint : String? = nil,
          @created_at : Time? = nil,
          @directory_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil,
          @vpc_information : Types::VpcInformation? = nil
        )
        end
      end

      struct CreateConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate authority being used.
        @[JSON::Field(key: "CertificateAuthorityArn")]
        getter certificate_authority_arn : String

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # Information about your VPC and security groups used with the connector.
        @[JSON::Field(key: "VpcInformation")]
        getter vpc_information : Types::VpcInformation

        # Idempotency token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Metadata assigned to a connector consisting of a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @certificate_authority_arn : String,
          @directory_id : String,
          @vpc_information : Types::VpcInformation,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateConnectorResponse
        include JSON::Serializable

        # If successful, the Amazon Resource Name (ARN) of the connector for Active Directory.
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        def initialize(
          @connector_arn : String? = nil
        )
        end
      end

      struct CreateDirectoryRegistrationRequest
        include JSON::Serializable

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # Idempotency token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Metadata assigned to a directory registration consisting of a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @directory_id : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDirectoryRegistrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String?

        def initialize(
          @directory_registration_arn : String? = nil
        )
        end
      end

      struct CreateServicePrincipalNameRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        # Idempotency token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @connector_arn : String,
          @directory_registration_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateTemplateGroupAccessControlEntryRequest
        include JSON::Serializable

        # Allow or deny permissions for an Active Directory group to enroll or autoenroll certificates for a
        # template.
        @[JSON::Field(key: "AccessRights")]
        getter access_rights : Types::AccessRights

        # Name of the Active Directory group. This name does not need to match the group name in Active
        # Directory.
        @[JSON::Field(key: "GroupDisplayName")]
        getter group_display_name : String

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # Idempotency token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @access_rights : Types::AccessRights,
          @group_display_name : String,
          @group_security_identifier : String,
          @template_arn : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateTemplateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "Definition")]
        getter definition : Types::TemplateDefinition

        # Name of the template. The template name must be unique.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Idempotency token.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Metadata assigned to a template consisting of a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @connector_arn : String,
          @definition : Types::TemplateDefinition,
          @name : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTemplateResponse
        include JSON::Serializable

        # If successful, the Amazon Resource Name (ARN) of the template.
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String?

        def initialize(
          @template_arn : String? = nil
        )
        end
      end

      struct DeleteConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        def initialize(
          @connector_arn : String
        )
        end
      end

      struct DeleteDirectoryRegistrationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        def initialize(
          @directory_registration_arn : String
        )
        end
      end

      struct DeleteServicePrincipalNameRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        def initialize(
          @connector_arn : String,
          @directory_registration_arn : String
        )
        end
      end

      struct DeleteTemplateGroupAccessControlEntryRequest
        include JSON::Serializable

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @group_security_identifier : String,
          @template_arn : String
        )
        end
      end

      struct DeleteTemplateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @template_arn : String
        )
        end
      end

      # The directory registration represents the authorization of the connector service with a directory.
      struct DirectoryRegistration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the directory registration was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Status of the directory registration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the directory registration status if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The date and time that the directory registration was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @directory_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The directory registration represents the authorization of the connector service with the Active
      # Directory.
      struct DirectoryRegistrationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the directory registration was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The identifier of the Active Directory.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # Status of the directory registration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the directory registration status if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The date and time that the directory registration was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @directory_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Template configurations for v2 template schema.
      struct EnrollmentFlagsV2
        include JSON::Serializable

        # Allow renewal using the same key.
        @[JSON::Field(key: "EnableKeyReuseOnNtTokenKeysetStorageFull")]
        getter enable_key_reuse_on_nt_token_keyset_storage_full : Bool?

        # Include symmetric algorithms allowed by the subject.
        @[JSON::Field(key: "IncludeSymmetricAlgorithms")]
        getter include_symmetric_algorithms : Bool?

        # This flag instructs the CA to not include the security extension szOID_NTDS_CA_SECURITY_EXT
        # (OID:1.3.6.1.4.1.311.25.2), as specified in [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in
        # the issued certificate. This addresses a Windows Kerberos elevation-of-privilege vulnerability.
        @[JSON::Field(key: "NoSecurityExtension")]
        getter no_security_extension : Bool?

        # Delete expired or revoked certificates instead of archiving them.
        @[JSON::Field(key: "RemoveInvalidCertificateFromPersonalStore")]
        getter remove_invalid_certificate_from_personal_store : Bool?

        # Require user interaction when the subject is enrolled and the private key associated with the
        # certificate is used.
        @[JSON::Field(key: "UserInteractionRequired")]
        getter user_interaction_required : Bool?

        def initialize(
          @enable_key_reuse_on_nt_token_keyset_storage_full : Bool? = nil,
          @include_symmetric_algorithms : Bool? = nil,
          @no_security_extension : Bool? = nil,
          @remove_invalid_certificate_from_personal_store : Bool? = nil,
          @user_interaction_required : Bool? = nil
        )
        end
      end

      # Template configurations for v3 template schema.
      struct EnrollmentFlagsV3
        include JSON::Serializable

        # Allow renewal using the same key.
        @[JSON::Field(key: "EnableKeyReuseOnNtTokenKeysetStorageFull")]
        getter enable_key_reuse_on_nt_token_keyset_storage_full : Bool?

        # Include symmetric algorithms allowed by the subject.
        @[JSON::Field(key: "IncludeSymmetricAlgorithms")]
        getter include_symmetric_algorithms : Bool?

        # This flag instructs the CA to not include the security extension szOID_NTDS_CA_SECURITY_EXT
        # (OID:1.3.6.1.4.1.311.25.2), as specified in [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in
        # the issued certificate. This addresses a Windows Kerberos elevation-of-privilege vulnerability.
        @[JSON::Field(key: "NoSecurityExtension")]
        getter no_security_extension : Bool?

        # Delete expired or revoked certificates instead of archiving them.
        @[JSON::Field(key: "RemoveInvalidCertificateFromPersonalStore")]
        getter remove_invalid_certificate_from_personal_store : Bool?

        # Require user interaction when the subject is enrolled and the private key associated with the
        # certificate is used.
        @[JSON::Field(key: "UserInteractionRequired")]
        getter user_interaction_required : Bool?

        def initialize(
          @enable_key_reuse_on_nt_token_keyset_storage_full : Bool? = nil,
          @include_symmetric_algorithms : Bool? = nil,
          @no_security_extension : Bool? = nil,
          @remove_invalid_certificate_from_personal_store : Bool? = nil,
          @user_interaction_required : Bool? = nil
        )
        end
      end

      # Template configurations for v4 template schema.
      struct EnrollmentFlagsV4
        include JSON::Serializable

        # Allow renewal using the same key.
        @[JSON::Field(key: "EnableKeyReuseOnNtTokenKeysetStorageFull")]
        getter enable_key_reuse_on_nt_token_keyset_storage_full : Bool?

        # Include symmetric algorithms allowed by the subject.
        @[JSON::Field(key: "IncludeSymmetricAlgorithms")]
        getter include_symmetric_algorithms : Bool?

        # This flag instructs the CA to not include the security extension szOID_NTDS_CA_SECURITY_EXT
        # (OID:1.3.6.1.4.1.311.25.2), as specified in [MS-WCCE] sections 2.2.2.7.7.4 and 3.2.2.6.2.1.4.5.9, in
        # the issued certificate. This addresses a Windows Kerberos elevation-of-privilege vulnerability.
        @[JSON::Field(key: "NoSecurityExtension")]
        getter no_security_extension : Bool?

        # Delete expired or revoked certificates instead of archiving them.
        @[JSON::Field(key: "RemoveInvalidCertificateFromPersonalStore")]
        getter remove_invalid_certificate_from_personal_store : Bool?

        # Require user interaction when the subject is enrolled and the private key associated with the
        # certificate is used.
        @[JSON::Field(key: "UserInteractionRequired")]
        getter user_interaction_required : Bool?

        def initialize(
          @enable_key_reuse_on_nt_token_keyset_storage_full : Bool? = nil,
          @include_symmetric_algorithms : Bool? = nil,
          @no_security_extension : Bool? = nil,
          @remove_invalid_certificate_from_personal_store : Bool? = nil,
          @user_interaction_required : Bool? = nil
        )
        end
      end

      # Certificate extensions for v2 template schema
      struct ExtensionsV2
        include JSON::Serializable

        # The key usage extension defines the purpose (e.g., encipherment, signature, certificate signing) of
        # the key contained in the certificate.
        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : Types::KeyUsage

        # Application policies specify what the certificate is used for and its purpose.
        @[JSON::Field(key: "ApplicationPolicies")]
        getter application_policies : Types::ApplicationPolicies?

        def initialize(
          @key_usage : Types::KeyUsage,
          @application_policies : Types::ApplicationPolicies? = nil
        )
        end
      end

      # Certificate extensions for v3 template schema
      struct ExtensionsV3
        include JSON::Serializable

        # The key usage extension defines the purpose (e.g., encipherment, signature, certificate signing) of
        # the key contained in the certificate.
        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : Types::KeyUsage

        # Application policies specify what the certificate is used for and its purpose.
        @[JSON::Field(key: "ApplicationPolicies")]
        getter application_policies : Types::ApplicationPolicies?

        def initialize(
          @key_usage : Types::KeyUsage,
          @application_policies : Types::ApplicationPolicies? = nil
        )
        end
      end

      # Certificate extensions for v4 template schema
      struct ExtensionsV4
        include JSON::Serializable

        # The key usage extension defines the purpose (e.g., encipherment, signature) of the key contained in
        # the certificate.
        @[JSON::Field(key: "KeyUsage")]
        getter key_usage : Types::KeyUsage

        # Application policies specify what the certificate is used for and its purpose.
        @[JSON::Field(key: "ApplicationPolicies")]
        getter application_policies : Types::ApplicationPolicies?

        def initialize(
          @key_usage : Types::KeyUsage,
          @application_policies : Types::ApplicationPolicies? = nil
        )
        end
      end

      # General flags for v2 template schema that defines if the template is for a machine or a user and if
      # the template can be issued using autoenrollment.
      struct GeneralFlagsV2
        include JSON::Serializable

        # Allows certificate issuance using autoenrollment. Set to TRUE to allow autoenrollment.
        @[JSON::Field(key: "AutoEnrollment")]
        getter auto_enrollment : Bool?

        # Defines if the template is for machines or users. Set to TRUE if the template is for machines. Set
        # to FALSE if the template is for users.
        @[JSON::Field(key: "MachineType")]
        getter machine_type : Bool?

        def initialize(
          @auto_enrollment : Bool? = nil,
          @machine_type : Bool? = nil
        )
        end
      end

      # General flags for v3 template schema that defines if the template is for a machine or a user and if
      # the template can be issued using autoenrollment.
      struct GeneralFlagsV3
        include JSON::Serializable

        # Allows certificate issuance using autoenrollment. Set to TRUE to allow autoenrollment.
        @[JSON::Field(key: "AutoEnrollment")]
        getter auto_enrollment : Bool?

        # Defines if the template is for machines or users. Set to TRUE if the template is for machines. Set
        # to FALSE if the template is for users
        @[JSON::Field(key: "MachineType")]
        getter machine_type : Bool?

        def initialize(
          @auto_enrollment : Bool? = nil,
          @machine_type : Bool? = nil
        )
        end
      end

      # General flags for v4 template schema that defines if the template is for a machine or a user and if
      # the template can be issued using autoenrollment.
      struct GeneralFlagsV4
        include JSON::Serializable

        # Allows certificate issuance using autoenrollment. Set to TRUE to allow autoenrollment.
        @[JSON::Field(key: "AutoEnrollment")]
        getter auto_enrollment : Bool?

        # Defines if the template is for machines or users. Set to TRUE if the template is for machines. Set
        # to FALSE if the template is for users
        @[JSON::Field(key: "MachineType")]
        getter machine_type : Bool?

        def initialize(
          @auto_enrollment : Bool? = nil,
          @machine_type : Bool? = nil
        )
        end
      end

      struct GetConnectorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        def initialize(
          @connector_arn : String
        )
        end
      end

      struct GetConnectorResponse
        include JSON::Serializable

        # A structure that contains information about your connector.
        @[JSON::Field(key: "Connector")]
        getter connector : Types::Connector?

        def initialize(
          @connector : Types::Connector? = nil
        )
        end
      end

      struct GetDirectoryRegistrationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        def initialize(
          @directory_registration_arn : String
        )
        end
      end

      struct GetDirectoryRegistrationResponse
        include JSON::Serializable

        # The directory registration represents the authorization of the connector service with a directory.
        @[JSON::Field(key: "DirectoryRegistration")]
        getter directory_registration : Types::DirectoryRegistration?

        def initialize(
          @directory_registration : Types::DirectoryRegistration? = nil
        )
        end
      end

      struct GetServicePrincipalNameRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        def initialize(
          @connector_arn : String,
          @directory_registration_arn : String
        )
        end
      end

      struct GetServicePrincipalNameResponse
        include JSON::Serializable

        # The service principal name that the connector uses to authenticate with Active Directory.
        @[JSON::Field(key: "ServicePrincipalName")]
        getter service_principal_name : Types::ServicePrincipalName?

        def initialize(
          @service_principal_name : Types::ServicePrincipalName? = nil
        )
        end
      end

      struct GetTemplateGroupAccessControlEntryRequest
        include JSON::Serializable

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @group_security_identifier : String,
          @template_arn : String
        )
        end
      end

      struct GetTemplateGroupAccessControlEntryResponse
        include JSON::Serializable

        # An access control entry allows or denies an Active Directory group from enrolling and/or
        # autoenrolling with a template.
        @[JSON::Field(key: "AccessControlEntry")]
        getter access_control_entry : Types::AccessControlEntry?

        def initialize(
          @access_control_entry : Types::AccessControlEntry? = nil
        )
        end
      end

      struct GetTemplateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        def initialize(
          @template_arn : String
        )
        end
      end

      struct GetTemplateResponse
        include JSON::Serializable

        # A certificate template that the connector uses to issue certificates from a private CA.
        @[JSON::Field(key: "Template")]
        getter template : Types::Template?

        def initialize(
          @template : Types::Template? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure with an internal
      # server.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The key usage extension defines the purpose (e.g., encipherment, signature) of the key contained in
      # the certificate.
      struct KeyUsage
        include JSON::Serializable

        # The key usage flags represent the purpose (e.g., encipherment, signature) of the key contained in
        # the certificate.
        @[JSON::Field(key: "UsageFlags")]
        getter usage_flags : Types::KeyUsageFlags

        # Sets the key usage extension to critical.
        @[JSON::Field(key: "Critical")]
        getter critical : Bool?

        def initialize(
          @usage_flags : Types::KeyUsageFlags,
          @critical : Bool? = nil
        )
        end
      end

      # The key usage flags represent the purpose (e.g., encipherment, signature) of the key contained in
      # the certificate.
      struct KeyUsageFlags
        include JSON::Serializable

        # DataEncipherment is asserted when the subject public key is used for directly enciphering raw user
        # data without the use of an intermediate symmetric cipher.
        @[JSON::Field(key: "DataEncipherment")]
        getter data_encipherment : Bool?

        # The digitalSignature is asserted when the subject public key is used for verifying digital
        # signatures.
        @[JSON::Field(key: "DigitalSignature")]
        getter digital_signature : Bool?

        # KeyAgreement is asserted when the subject public key is used for key agreement.
        @[JSON::Field(key: "KeyAgreement")]
        getter key_agreement : Bool?

        # KeyEncipherment is asserted when the subject public key is used for enciphering private or secret
        # keys, i.e., for key transport.
        @[JSON::Field(key: "KeyEncipherment")]
        getter key_encipherment : Bool?

        # NonRepudiation is asserted when the subject public key is used to verify digital signatures.
        @[JSON::Field(key: "NonRepudiation")]
        getter non_repudiation : Bool?

        def initialize(
          @data_encipherment : Bool? = nil,
          @digital_signature : Bool? = nil,
          @key_agreement : Bool? = nil,
          @key_encipherment : Bool? = nil,
          @non_repudiation : Bool? = nil
        )
        end
      end

      # The key usage property defines the purpose of the private key contained in the certificate. You can
      # specify specific purposes using property flags or all by using property type ALL.
      struct KeyUsageProperty
        include JSON::Serializable

        # You can specify key usage for encryption, key agreement, and signature. You can use property flags
        # or property type but not both.
        @[JSON::Field(key: "PropertyFlags")]
        getter property_flags : Types::KeyUsagePropertyFlags?

        # You can specify all key usages using property type ALL. You can use property type or property flags
        # but not both.
        @[JSON::Field(key: "PropertyType")]
        getter property_type : String?

        def initialize(
          @property_flags : Types::KeyUsagePropertyFlags? = nil,
          @property_type : String? = nil
        )
        end
      end

      # Specifies key usage.
      struct KeyUsagePropertyFlags
        include JSON::Serializable

        # Allows key for encryption and decryption.
        @[JSON::Field(key: "Decrypt")]
        getter decrypt : Bool?

        # Allows key exchange without encryption.
        @[JSON::Field(key: "KeyAgreement")]
        getter key_agreement : Bool?

        # Allow key use for digital signature.
        @[JSON::Field(key: "Sign")]
        getter sign : Bool?

        def initialize(
          @decrypt : Bool? = nil,
          @key_agreement : Bool? = nil,
          @sign : Bool? = nil
        )
        end
      end

      struct ListConnectorsRequest
        include JSON::Serializable

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectorsResponse
        include JSON::Serializable

        # Summary information about each connector you have created.
        @[JSON::Field(key: "Connectors")]
        getter connectors : Array(Types::ConnectorSummary)?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connectors : Array(Types::ConnectorSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDirectoryRegistrationsRequest
        include JSON::Serializable

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDirectoryRegistrationsResponse
        include JSON::Serializable

        # Summary information about each directory registration you have created.
        @[JSON::Field(key: "DirectoryRegistrations")]
        getter directory_registrations : Array(Types::DirectoryRegistrationSummary)?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_registrations : Array(Types::DirectoryRegistrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicePrincipalNamesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_registration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicePrincipalNamesResponse
        include JSON::Serializable

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The service principal name, if any, that the connector uses to authenticate with Active Directory.
        @[JSON::Field(key: "ServicePrincipalNames")]
        getter service_principal_names : Array(Types::ServicePrincipalNameSummary)?

        def initialize(
          @next_token : String? = nil,
          @service_principal_names : Array(Types::ServicePrincipalNameSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you created the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags, if any, that are associated with your resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTemplateGroupAccessControlEntriesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @template_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTemplateGroupAccessControlEntriesResponse
        include JSON::Serializable

        # An access control entry grants or denies permission to an Active Directory group to enroll
        # certificates for a template.
        @[JSON::Field(key: "AccessControlEntries")]
        getter access_control_entries : Array(Types::AccessControlEntrySummary)?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_control_entries : Array(Types::AccessControlEntrySummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTemplatesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String

        # Use this parameter when paginating results to specify the maximum number of items to return in the
        # response on each page. If additional items exist beyond the number you specify, the NextToken
        # element is sent in the response. Use this NextToken value in a subsequent request to retrieve
        # additional items.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTemplatesResponse
        include JSON::Serializable

        # Use this parameter when paginating results in a subsequent request after you receive a response with
        # truncated results. Set it to the value of the NextToken parameter from the response you just
        # received.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Custom configuration templates used when issuing a certificate.
        @[JSON::Field(key: "Templates")]
        getter templates : Array(Types::TemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @templates : Array(Types::TemplateSummary)? = nil
        )
        end
      end

      # Defines the attributes of the private key.
      struct PrivateKeyAttributesV2
        include JSON::Serializable

        # Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or "SIGNATURE" value.
        @[JSON::Field(key: "KeySpec")]
        getter key_spec : String

        # Set the minimum key length of the private key.
        @[JSON::Field(key: "MinimalKeyLength")]
        getter minimal_key_length : Int32

        # Defines the cryptographic providers used to generate the private key.
        @[JSON::Field(key: "CryptoProviders")]
        getter crypto_providers : Array(String)?

        def initialize(
          @key_spec : String,
          @minimal_key_length : Int32,
          @crypto_providers : Array(String)? = nil
        )
        end
      end

      # Defines the attributes of the private key.
      struct PrivateKeyAttributesV3
        include JSON::Serializable

        # Defines the algorithm used to generate the private key.
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String

        # Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or "SIGNATURE" value.
        @[JSON::Field(key: "KeySpec")]
        getter key_spec : String

        # The key usage property defines the purpose of the private key contained in the certificate. You can
        # specify specific purposes using property flags or all by using property type ALL.
        @[JSON::Field(key: "KeyUsageProperty")]
        getter key_usage_property : Types::KeyUsageProperty

        # Set the minimum key length of the private key.
        @[JSON::Field(key: "MinimalKeyLength")]
        getter minimal_key_length : Int32

        # Defines the cryptographic providers used to generate the private key.
        @[JSON::Field(key: "CryptoProviders")]
        getter crypto_providers : Array(String)?

        def initialize(
          @algorithm : String,
          @key_spec : String,
          @key_usage_property : Types::KeyUsageProperty,
          @minimal_key_length : Int32,
          @crypto_providers : Array(String)? = nil
        )
        end
      end

      # Defines the attributes of the private key.
      struct PrivateKeyAttributesV4
        include JSON::Serializable

        # Defines the purpose of the private key. Set it to "KEY_EXCHANGE" or "SIGNATURE" value.
        @[JSON::Field(key: "KeySpec")]
        getter key_spec : String

        # Set the minimum key length of the private key.
        @[JSON::Field(key: "MinimalKeyLength")]
        getter minimal_key_length : Int32

        # Defines the algorithm used to generate the private key.
        @[JSON::Field(key: "Algorithm")]
        getter algorithm : String?

        # Defines the cryptographic providers used to generate the private key.
        @[JSON::Field(key: "CryptoProviders")]
        getter crypto_providers : Array(String)?

        # The key usage property defines the purpose of the private key contained in the certificate. You can
        # specify specific purposes using property flags or all by using property type ALL.
        @[JSON::Field(key: "KeyUsageProperty")]
        getter key_usage_property : Types::KeyUsageProperty?

        def initialize(
          @key_spec : String,
          @minimal_key_length : Int32,
          @algorithm : String? = nil,
          @crypto_providers : Array(String)? = nil,
          @key_usage_property : Types::KeyUsageProperty? = nil
        )
        end
      end

      # Private key flags for v2 templates specify the client compatibility, if the private key can be
      # exported, and if user input is required when using a private key.
      struct PrivateKeyFlagsV2
        include JSON::Serializable

        # Defines the minimum client compatibility.
        @[JSON::Field(key: "ClientVersion")]
        getter client_version : String

        # Allows the private key to be exported.
        @[JSON::Field(key: "ExportableKey")]
        getter exportable_key : Bool?

        # Require user input when using the private key for enrollment.
        @[JSON::Field(key: "StrongKeyProtectionRequired")]
        getter strong_key_protection_required : Bool?

        def initialize(
          @client_version : String,
          @exportable_key : Bool? = nil,
          @strong_key_protection_required : Bool? = nil
        )
        end
      end

      # Private key flags for v3 templates specify the client compatibility, if the private key can be
      # exported, if user input is required when using a private key, and if an alternate signature
      # algorithm should be used.
      struct PrivateKeyFlagsV3
        include JSON::Serializable

        # Defines the minimum client compatibility.
        @[JSON::Field(key: "ClientVersion")]
        getter client_version : String

        # Allows the private key to be exported.
        @[JSON::Field(key: "ExportableKey")]
        getter exportable_key : Bool?

        # Reguires the PKCS #1 v2.1 signature format for certificates. You should verify that your CA,
        # objects, and applications can accept this signature format.
        @[JSON::Field(key: "RequireAlternateSignatureAlgorithm")]
        getter require_alternate_signature_algorithm : Bool?

        # Requirer user input when using the private key for enrollment.
        @[JSON::Field(key: "StrongKeyProtectionRequired")]
        getter strong_key_protection_required : Bool?

        def initialize(
          @client_version : String,
          @exportable_key : Bool? = nil,
          @require_alternate_signature_algorithm : Bool? = nil,
          @strong_key_protection_required : Bool? = nil
        )
        end
      end

      # Private key flags for v4 templates specify the client compatibility, if the private key can be
      # exported, if user input is required when using a private key, if an alternate signature algorithm
      # should be used, and if certificates are renewed using the same private key.
      struct PrivateKeyFlagsV4
        include JSON::Serializable

        # Defines the minimum client compatibility.
        @[JSON::Field(key: "ClientVersion")]
        getter client_version : String

        # Allows the private key to be exported.
        @[JSON::Field(key: "ExportableKey")]
        getter exportable_key : Bool?

        # Requires the PKCS #1 v2.1 signature format for certificates. You should verify that your CA,
        # objects, and applications can accept this signature format.
        @[JSON::Field(key: "RequireAlternateSignatureAlgorithm")]
        getter require_alternate_signature_algorithm : Bool?

        # Renew certificate using the same private key.
        @[JSON::Field(key: "RequireSameKeyRenewal")]
        getter require_same_key_renewal : Bool?

        # Require user input when using the private key for enrollment.
        @[JSON::Field(key: "StrongKeyProtectionRequired")]
        getter strong_key_protection_required : Bool?

        # Specifies the cryptographic service provider category used to generate private keys. Set to TRUE to
        # use Legacy Cryptographic Service Providers and FALSE to use Key Storage Providers.
        @[JSON::Field(key: "UseLegacyProvider")]
        getter use_legacy_provider : Bool?

        def initialize(
          @client_version : String,
          @exportable_key : Bool? = nil,
          @require_alternate_signature_algorithm : Bool? = nil,
          @require_same_key_renewal : Bool? = nil,
          @strong_key_protection_required : Bool? = nil,
          @use_legacy_provider : Bool? = nil
        )
        end
      end

      # The operation tried to access a nonexistent resource. The resource might not be specified correctly,
      # or its status might not be ACTIVE.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The identifier of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type, which can be one of Connector , Template , TemplateGroupAccessControlEntry ,
        # ServicePrincipalName , or DirectoryRegistration .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The service principal name that the connector uses to authenticate with Active Directory.
      struct ServicePrincipalName
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector.html .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the service principal name was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String?

        # The status of a service principal name.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information for the status of a service principal name if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # The date and time that the service principal name was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @directory_registration_arn : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The service principal name that the connector uses to authenticate with Active Directory.
      struct ServicePrincipalNameSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the service principal name was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) that was returned when you called CreateDirectoryRegistration .
        @[JSON::Field(key: "DirectoryRegistrationArn")]
        getter directory_registration_arn : String?

        # The status of a service principal name.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information for the status of a service principal name if the status is failed.
        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # Time when the service principal name was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @directory_registration_arn : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Request would cause a service quota to be exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The code associated with the service quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The identifier of the Amazon Web Services resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The resource type, which can be one of Connector , Template , TemplateGroupAccessControlEntry ,
        # ServicePrincipalName , or DirectoryRegistration .
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Identifies the originating service.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # Information to include in the subject name and alternate subject name of the certificate. The
      # subject name can be common name, directory path, DNS as common name, or left blank. You can
      # optionally include email to the subject name for user templates. If you leave the subject name blank
      # then you must set a subject alternate name. The subject alternate name (SAN) can include globally
      # unique identifier (GUID), DNS, domain DNS, email, service principal name (SPN), and user principal
      # name (UPN). You can leave the SAN blank. If you leave the SAN blank, then you must set a subject
      # name.
      struct SubjectNameFlagsV2
        include JSON::Serializable

        # Include the common name in the subject name.
        @[JSON::Field(key: "RequireCommonName")]
        getter require_common_name : Bool?

        # Include the directory path in the subject name.
        @[JSON::Field(key: "RequireDirectoryPath")]
        getter require_directory_path : Bool?

        # Include the DNS as common name in the subject name.
        @[JSON::Field(key: "RequireDnsAsCn")]
        getter require_dns_as_cn : Bool?

        # Include the subject's email in the subject name.
        @[JSON::Field(key: "RequireEmail")]
        getter require_email : Bool?

        # Include the globally unique identifier (GUID) in the subject alternate name.
        @[JSON::Field(key: "SanRequireDirectoryGuid")]
        getter san_require_directory_guid : Bool?

        # Include the DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDns")]
        getter san_require_dns : Bool?

        # Include the domain DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDomainDns")]
        getter san_require_domain_dns : Bool?

        # Include the subject's email in the subject alternate name.
        @[JSON::Field(key: "SanRequireEmail")]
        getter san_require_email : Bool?

        # Include the service principal name (SPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireSpn")]
        getter san_require_spn : Bool?

        # Include the user principal name (UPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireUpn")]
        getter san_require_upn : Bool?

        def initialize(
          @require_common_name : Bool? = nil,
          @require_directory_path : Bool? = nil,
          @require_dns_as_cn : Bool? = nil,
          @require_email : Bool? = nil,
          @san_require_directory_guid : Bool? = nil,
          @san_require_dns : Bool? = nil,
          @san_require_domain_dns : Bool? = nil,
          @san_require_email : Bool? = nil,
          @san_require_spn : Bool? = nil,
          @san_require_upn : Bool? = nil
        )
        end
      end

      # Information to include in the subject name and alternate subject name of the certificate. The
      # subject name can be common name, directory path, DNS as common name, or left blank. You can
      # optionally include email to the subject name for user templates. If you leave the subject name blank
      # then you must set a subject alternate name. The subject alternate name (SAN) can include globally
      # unique identifier (GUID), DNS, domain DNS, email, service principal name (SPN), and user principal
      # name (UPN). You can leave the SAN blank. If you leave the SAN blank, then you must set a subject
      # name.
      struct SubjectNameFlagsV3
        include JSON::Serializable

        # Include the common name in the subject name.
        @[JSON::Field(key: "RequireCommonName")]
        getter require_common_name : Bool?

        # Include the directory path in the subject name.
        @[JSON::Field(key: "RequireDirectoryPath")]
        getter require_directory_path : Bool?

        # Include the DNS as common name in the subject name.
        @[JSON::Field(key: "RequireDnsAsCn")]
        getter require_dns_as_cn : Bool?

        # Include the subject's email in the subject name.
        @[JSON::Field(key: "RequireEmail")]
        getter require_email : Bool?

        # Include the globally unique identifier (GUID) in the subject alternate name.
        @[JSON::Field(key: "SanRequireDirectoryGuid")]
        getter san_require_directory_guid : Bool?

        # Include the DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDns")]
        getter san_require_dns : Bool?

        # Include the domain DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDomainDns")]
        getter san_require_domain_dns : Bool?

        # Include the subject's email in the subject alternate name.
        @[JSON::Field(key: "SanRequireEmail")]
        getter san_require_email : Bool?

        # Include the service principal name (SPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireSpn")]
        getter san_require_spn : Bool?

        # Include the user principal name (UPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireUpn")]
        getter san_require_upn : Bool?

        def initialize(
          @require_common_name : Bool? = nil,
          @require_directory_path : Bool? = nil,
          @require_dns_as_cn : Bool? = nil,
          @require_email : Bool? = nil,
          @san_require_directory_guid : Bool? = nil,
          @san_require_dns : Bool? = nil,
          @san_require_domain_dns : Bool? = nil,
          @san_require_email : Bool? = nil,
          @san_require_spn : Bool? = nil,
          @san_require_upn : Bool? = nil
        )
        end
      end

      # Information to include in the subject name and alternate subject name of the certificate. The
      # subject name can be common name, directory path, DNS as common name, or left blank. You can
      # optionally include email to the subject name for user templates. If you leave the subject name blank
      # then you must set a subject alternate name. The subject alternate name (SAN) can include globally
      # unique identifier (GUID), DNS, domain DNS, email, service principal name (SPN), and user principal
      # name (UPN). You can leave the SAN blank. If you leave the SAN blank, then you must set a subject
      # name.
      struct SubjectNameFlagsV4
        include JSON::Serializable

        # Include the common name in the subject name.
        @[JSON::Field(key: "RequireCommonName")]
        getter require_common_name : Bool?

        # Include the directory path in the subject name.
        @[JSON::Field(key: "RequireDirectoryPath")]
        getter require_directory_path : Bool?

        # Include the DNS as common name in the subject name.
        @[JSON::Field(key: "RequireDnsAsCn")]
        getter require_dns_as_cn : Bool?

        # Include the subject's email in the subject name.
        @[JSON::Field(key: "RequireEmail")]
        getter require_email : Bool?

        # Include the globally unique identifier (GUID) in the subject alternate name.
        @[JSON::Field(key: "SanRequireDirectoryGuid")]
        getter san_require_directory_guid : Bool?

        # Include the DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDns")]
        getter san_require_dns : Bool?

        # Include the domain DNS in the subject alternate name.
        @[JSON::Field(key: "SanRequireDomainDns")]
        getter san_require_domain_dns : Bool?

        # Include the subject's email in the subject alternate name.
        @[JSON::Field(key: "SanRequireEmail")]
        getter san_require_email : Bool?

        # Include the service principal name (SPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireSpn")]
        getter san_require_spn : Bool?

        # Include the user principal name (UPN) in the subject alternate name.
        @[JSON::Field(key: "SanRequireUpn")]
        getter san_require_upn : Bool?

        def initialize(
          @require_common_name : Bool? = nil,
          @require_directory_path : Bool? = nil,
          @require_dns_as_cn : Bool? = nil,
          @require_email : Bool? = nil,
          @san_require_directory_guid : Bool? = nil,
          @san_require_dns : Bool? = nil,
          @san_require_domain_dns : Bool? = nil,
          @san_require_email : Bool? = nil,
          @san_require_spn : Bool? = nil,
          @san_require_upn : Bool? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you created the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Metadata assigned to a directory registration consisting of a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # An Active Directory compatible certificate template. Connectors issue certificates against these
      # templates based on the requestor's Active Directory group membership.
      struct Template
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the template was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "Definition")]
        getter definition : Types::TemplateDefinition?

        # Name of the templates. Template names must be unique.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Object identifier of a template.
        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        # The template schema version. Template schema versions can be v2, v3, or v4. The template
        # configuration options change based on the template schema version.
        @[JSON::Field(key: "PolicySchema")]
        getter policy_schema : Int32?

        # The version of the template. Template updates will increment the minor revision. Re-enrolling all
        # certificate holders will increment the major revision.
        @[JSON::Field(key: "Revision")]
        getter revision : Types::TemplateRevision?

        # Status of the template. Status can be creating, active, deleting, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time that the template was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @definition : Types::TemplateDefinition? = nil,
          @name : String? = nil,
          @object_identifier : String? = nil,
          @policy_schema : Int32? = nil,
          @revision : Types::TemplateRevision? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Template configuration to define the information included in certificates. Define certificate
      # validity and renewal periods, certificate request handling and enrollment options, key usage
      # extensions, application policies, and cryptography settings.
      struct TemplateDefinition
        include JSON::Serializable

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "TemplateV2")]
        getter template_v2 : Types::TemplateV2?

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "TemplateV3")]
        getter template_v3 : Types::TemplateV3?

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "TemplateV4")]
        getter template_v4 : Types::TemplateV4?

        def initialize(
          @template_v2 : Types::TemplateV2? = nil,
          @template_v3 : Types::TemplateV3? = nil,
          @template_v4 : Types::TemplateV4? = nil
        )
        end
      end

      # The revision version of the template. Template updates will increment the minor revision.
      # Re-enrolling all certificate holders will increment the major revision.
      struct TemplateRevision
        include JSON::Serializable

        # The revision version of the template. Re-enrolling all certificate holders will increment the major
        # revision.
        @[JSON::Field(key: "MajorRevision")]
        getter major_revision : Int32

        # The revision version of the template. Re-enrolling all certificate holders will increment the major
        # revision.
        @[JSON::Field(key: "MinorRevision")]
        getter minor_revision : Int32

        def initialize(
          @major_revision : Int32,
          @minor_revision : Int32
        )
        end
      end

      # An Active Directory compatible certificate template. Connectors issue certificates against these
      # templates based on the requestor's Active Directory group membership.
      struct TemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Resource Name (ARN) that was returned when you called CreateConnector .
        @[JSON::Field(key: "ConnectorArn")]
        getter connector_arn : String?

        # The date and time that the template was created.
        @[JSON::Field(key: "CreatedAt")]
        getter created_at : Time?

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "Definition")]
        getter definition : Types::TemplateDefinition?

        # Name of the template. The template name must be unique.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Object identifier of a template.
        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        # The template schema version. Template schema versions can be v2, v3, or v4. The template
        # configuration options change based on the template schema version.
        @[JSON::Field(key: "PolicySchema")]
        getter policy_schema : Int32?

        # The revision version of the template. Template updates will increment the minor revision.
        # Re-enrolling all certificate holders will increment the major revision.
        @[JSON::Field(key: "Revision")]
        getter revision : Types::TemplateRevision?

        # Status of the template. Status can be creating, active, deleting, or failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time that the template was updated.
        @[JSON::Field(key: "UpdatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String? = nil,
          @connector_arn : String? = nil,
          @created_at : Time? = nil,
          @definition : Types::TemplateDefinition? = nil,
          @name : String? = nil,
          @object_identifier : String? = nil,
          @policy_schema : Int32? = nil,
          @revision : Types::TemplateRevision? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # v2 template schema that uses Legacy Cryptographic Providers.
      struct TemplateV2
        include JSON::Serializable

        # Certificate validity describes the validity and renewal periods of a certificate.
        @[JSON::Field(key: "CertificateValidity")]
        getter certificate_validity : Types::CertificateValidity

        # Enrollment flags describe the enrollment settings for certificates such as using the existing
        # private key and deleting expired or revoked certificates.
        @[JSON::Field(key: "EnrollmentFlags")]
        getter enrollment_flags : Types::EnrollmentFlagsV2

        # Extensions describe the key usage extensions and application policies for a template.
        @[JSON::Field(key: "Extensions")]
        getter extensions : Types::ExtensionsV2

        # General flags describe whether the template is used for computers or users and if the template can
        # be used with autoenrollment.
        @[JSON::Field(key: "GeneralFlags")]
        getter general_flags : Types::GeneralFlagsV2

        # Private key attributes allow you to specify the minimal key length, key spec, and cryptographic
        # providers for the private key of a certificate for v2 templates. V2 templates allow you to use
        # Legacy Cryptographic Service Providers.
        @[JSON::Field(key: "PrivateKeyAttributes")]
        getter private_key_attributes : Types::PrivateKeyAttributesV2

        # Private key flags for v2 templates specify the client compatibility, if the private key can be
        # exported, and if user input is required when using a private key.
        @[JSON::Field(key: "PrivateKeyFlags")]
        getter private_key_flags : Types::PrivateKeyFlagsV2

        # Subject name flags describe the subject name and subject alternate name that is included in a
        # certificate.
        @[JSON::Field(key: "SubjectNameFlags")]
        getter subject_name_flags : Types::SubjectNameFlagsV2

        # List of templates in Active Directory that are superseded by this template.
        @[JSON::Field(key: "SupersededTemplates")]
        getter superseded_templates : Array(String)?

        def initialize(
          @certificate_validity : Types::CertificateValidity,
          @enrollment_flags : Types::EnrollmentFlagsV2,
          @extensions : Types::ExtensionsV2,
          @general_flags : Types::GeneralFlagsV2,
          @private_key_attributes : Types::PrivateKeyAttributesV2,
          @private_key_flags : Types::PrivateKeyFlagsV2,
          @subject_name_flags : Types::SubjectNameFlagsV2,
          @superseded_templates : Array(String)? = nil
        )
        end
      end

      # v3 template schema that uses Key Storage Providers.
      struct TemplateV3
        include JSON::Serializable

        # Certificate validity describes the validity and renewal periods of a certificate.
        @[JSON::Field(key: "CertificateValidity")]
        getter certificate_validity : Types::CertificateValidity

        # Enrollment flags describe the enrollment settings for certificates such as using the existing
        # private key and deleting expired or revoked certificates.
        @[JSON::Field(key: "EnrollmentFlags")]
        getter enrollment_flags : Types::EnrollmentFlagsV3

        # Extensions describe the key usage extensions and application policies for a template.
        @[JSON::Field(key: "Extensions")]
        getter extensions : Types::ExtensionsV3

        # General flags describe whether the template is used for computers or users and if the template can
        # be used with autoenrollment.
        @[JSON::Field(key: "GeneralFlags")]
        getter general_flags : Types::GeneralFlagsV3

        # Specifies the hash algorithm used to hash the private key.
        @[JSON::Field(key: "HashAlgorithm")]
        getter hash_algorithm : String

        # Private key attributes allow you to specify the algorithm, minimal key length, key spec, key usage,
        # and cryptographic providers for the private key of a certificate for v3 templates. V3 templates
        # allow you to use Key Storage Providers.
        @[JSON::Field(key: "PrivateKeyAttributes")]
        getter private_key_attributes : Types::PrivateKeyAttributesV3

        # Private key flags for v3 templates specify the client compatibility, if the private key can be
        # exported, if user input is required when using a private key, and if an alternate signature
        # algorithm should be used.
        @[JSON::Field(key: "PrivateKeyFlags")]
        getter private_key_flags : Types::PrivateKeyFlagsV3

        # Subject name flags describe the subject name and subject alternate name that is included in a
        # certificate.
        @[JSON::Field(key: "SubjectNameFlags")]
        getter subject_name_flags : Types::SubjectNameFlagsV3

        # List of templates in Active Directory that are superseded by this template.
        @[JSON::Field(key: "SupersededTemplates")]
        getter superseded_templates : Array(String)?

        def initialize(
          @certificate_validity : Types::CertificateValidity,
          @enrollment_flags : Types::EnrollmentFlagsV3,
          @extensions : Types::ExtensionsV3,
          @general_flags : Types::GeneralFlagsV3,
          @hash_algorithm : String,
          @private_key_attributes : Types::PrivateKeyAttributesV3,
          @private_key_flags : Types::PrivateKeyFlagsV3,
          @subject_name_flags : Types::SubjectNameFlagsV3,
          @superseded_templates : Array(String)? = nil
        )
        end
      end

      # v4 template schema that can use either Legacy Cryptographic Providers or Key Storage Providers.
      struct TemplateV4
        include JSON::Serializable

        # Certificate validity describes the validity and renewal periods of a certificate.
        @[JSON::Field(key: "CertificateValidity")]
        getter certificate_validity : Types::CertificateValidity

        # Enrollment flags describe the enrollment settings for certificates using the existing private key
        # and deleting expired or revoked certificates.
        @[JSON::Field(key: "EnrollmentFlags")]
        getter enrollment_flags : Types::EnrollmentFlagsV4

        # Extensions describe the key usage extensions and application policies for a template.
        @[JSON::Field(key: "Extensions")]
        getter extensions : Types::ExtensionsV4

        # General flags describe whether the template is used for computers or users and if the template can
        # be used with autoenrollment.
        @[JSON::Field(key: "GeneralFlags")]
        getter general_flags : Types::GeneralFlagsV4

        # Private key attributes allow you to specify the minimal key length, key spec, key usage, and
        # cryptographic providers for the private key of a certificate for v4 templates. V4 templates allow
        # you to use either Key Storage Providers or Legacy Cryptographic Service Providers. You specify the
        # cryptography provider category in private key flags.
        @[JSON::Field(key: "PrivateKeyAttributes")]
        getter private_key_attributes : Types::PrivateKeyAttributesV4

        # Private key flags for v4 templates specify the client compatibility, if the private key can be
        # exported, if user input is required when using a private key, if an alternate signature algorithm
        # should be used, and if certificates are renewed using the same private key.
        @[JSON::Field(key: "PrivateKeyFlags")]
        getter private_key_flags : Types::PrivateKeyFlagsV4

        # Subject name flags describe the subject name and subject alternate name that is included in a
        # certificate.
        @[JSON::Field(key: "SubjectNameFlags")]
        getter subject_name_flags : Types::SubjectNameFlagsV4

        # Specifies the hash algorithm used to hash the private key. Hash algorithm can only be specified when
        # using Key Storage Providers.
        @[JSON::Field(key: "HashAlgorithm")]
        getter hash_algorithm : String?

        # List of templates in Active Directory that are superseded by this template.
        @[JSON::Field(key: "SupersededTemplates")]
        getter superseded_templates : Array(String)?

        def initialize(
          @certificate_validity : Types::CertificateValidity,
          @enrollment_flags : Types::EnrollmentFlagsV4,
          @extensions : Types::ExtensionsV4,
          @general_flags : Types::GeneralFlagsV4,
          @private_key_attributes : Types::PrivateKeyAttributesV4,
          @private_key_flags : Types::PrivateKeyFlagsV4,
          @subject_name_flags : Types::SubjectNameFlagsV4,
          @hash_algorithm : String? = nil,
          @superseded_templates : Array(String)? = nil
        )
        end
      end

      # The limit on the number of requests per second was exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The code associated with the quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # Identifies the originating service.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you created the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Specifies a list of tag keys that you want to remove from the specified resources.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateTemplateGroupAccessControlEntryRequest
        include JSON::Serializable

        # Security identifier (SID) of the group object from Active Directory. The SID starts with "S-".
        @[JSON::Field(key: "GroupSecurityIdentifier")]
        getter group_security_identifier : String

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # Allow or deny permissions for an Active Directory group to enroll or autoenroll certificates for a
        # template.
        @[JSON::Field(key: "AccessRights")]
        getter access_rights : Types::AccessRights?

        # Name of the Active Directory group. This name does not need to match the group name in Active
        # Directory.
        @[JSON::Field(key: "GroupDisplayName")]
        getter group_display_name : String?

        def initialize(
          @group_security_identifier : String,
          @template_arn : String,
          @access_rights : Types::AccessRights? = nil,
          @group_display_name : String? = nil
        )
        end
      end

      struct UpdateTemplateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that was returned when you called CreateTemplate .
        @[JSON::Field(key: "TemplateArn")]
        getter template_arn : String

        # Template configuration to define the information included in certificates. Define certificate
        # validity and renewal periods, certificate request handling and enrollment options, key usage
        # extensions, application policies, and cryptography settings.
        @[JSON::Field(key: "Definition")]
        getter definition : Types::TemplateDefinition?

        # This setting allows the major version of a template to be increased automatically. All members of
        # Active Directory groups that are allowed to enroll with a template will receive a new certificate
        # issued using that template.
        @[JSON::Field(key: "ReenrollAllCertificateHolders")]
        getter reenroll_all_certificate_holders : Bool?

        def initialize(
          @template_arn : String,
          @definition : Types::TemplateDefinition? = nil,
          @reenroll_all_certificate_holders : Bool? = nil
        )
        end
      end

      # An input validation error occurred. For example, invalid characters in a template name, or if a
      # pagination token is invalid.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason for the validation error. This won't be return for every validation exception.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @reason : String? = nil
        )
        end
      end

      # Information describing the end of the validity period of the certificate. This parameter sets the
      # “Not After” date for the certificate. Certificate validity is the period of time during which a
      # certificate is valid. Validity can be expressed as an explicit date and time when the certificate
      # expires, or as a span of time after issuance, stated in hours, days, months, or years. For more
      # information, see Validity in RFC 5280. This value is unaffected when ValidityNotBefore is also
      # specified. For example, if Validity is set to 20 days in the future, the certificate will expire 20
      # days from issuance time regardless of the ValidityNotBefore value.
      struct ValidityPeriod
        include JSON::Serializable

        # The numeric value for the validity period.
        @[JSON::Field(key: "Period")]
        getter period : Int64

        # The unit of time. You can select hours, days, weeks, months, and years.
        @[JSON::Field(key: "PeriodType")]
        getter period_type : String

        def initialize(
          @period : Int64,
          @period_type : String
        )
        end
      end

      # Information about your VPC and security groups used with the connector.
      struct VpcInformation
        include JSON::Serializable

        # The security groups used with the connector. You can use a maximum of 4 security groups with a
        # connector.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The VPC IP address type.
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @security_group_ids : Array(String),
          @ip_address_type : String? = nil
        )
        end
      end
    end
  end
end
