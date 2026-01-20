module Aws
  module ACMPCA
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a root or subordinate private certificate authority (CA). You must specify the CA
      # configuration, an optional configuration for Online Certificate Status Protocol (OCSP) and/or a
      # certificate revocation list (CRL), the CA type, and an optional idempotency token to avoid
      # accidental creation of multiple CAs. The CA configuration specifies the name of the algorithm and
      # key size to be used to create the CA private key, the type of signing algorithm that the CA uses,
      # and X.500 subject information. The OCSP configuration can optionally specify a custom URL for the
      # OCSP responder. The CRL configuration specifies the CRL expiration period in days (the validity
      # period of the CRL), the Amazon S3 bucket that will contain the CRL, and a CNAME alias for the S3
      # bucket that is included in certificates issued by the CA. If successful, this action returns the
      # Amazon Resource Name (ARN) of the CA. Both Amazon Web Services Private CA and the IAM principal must
      # have permission to write to the S3 bucket that you specify. If the IAM principal making the call
      # does not have permission to write to the bucket, then an exception is thrown. For more information,
      # see Access policies for CRLs in Amazon S3 . Amazon Web Services Private CA assets that are stored in
      # Amazon S3 can be protected with encryption. For more information, see Encrypting Your CRLs .

      def create_certificate_authority(
        certificate_authority_configuration : Types::CertificateAuthorityConfiguration,
        certificate_authority_type : String,
        idempotency_token : String? = nil,
        key_storage_security_standard : String? = nil,
        revocation_configuration : Types::RevocationConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        usage_mode : String? = nil
      ) : Types::CreateCertificateAuthorityResponse

        input = Types::CreateCertificateAuthorityRequest.new(certificate_authority_configuration: certificate_authority_configuration, certificate_authority_type: certificate_authority_type, idempotency_token: idempotency_token, key_storage_security_standard: key_storage_security_standard, revocation_configuration: revocation_configuration, tags: tags, usage_mode: usage_mode)
        create_certificate_authority(input)
      end

      def create_certificate_authority(input : Types::CreateCertificateAuthorityRequest) : Types::CreateCertificateAuthorityResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCertificateAuthorityResponse, "CreateCertificateAuthority")
      end

      # Creates an audit report that lists every time that your CA private key is used to issue a
      # certificate. The IssueCertificate and RevokeCertificate actions use the private key. To save the
      # audit report to your designated Amazon S3 bucket, you must create a bucket policy that grants Amazon
      # Web Services Private CA permission to access and write to it. For an example policy, see Prepare an
      # Amazon S3 bucket for audit reports . Amazon Web Services Private CA assets that are stored in Amazon
      # S3 can be protected with encryption. For more information, see Encrypting Your Audit Reports . You
      # can generate a maximum of one report every 30 minutes.

      def create_certificate_authority_audit_report(
        audit_report_response_format : String,
        certificate_authority_arn : String,
        s3_bucket_name : String
      ) : Types::CreateCertificateAuthorityAuditReportResponse

        input = Types::CreateCertificateAuthorityAuditReportRequest.new(audit_report_response_format: audit_report_response_format, certificate_authority_arn: certificate_authority_arn, s3_bucket_name: s3_bucket_name)
        create_certificate_authority_audit_report(input)
      end

      def create_certificate_authority_audit_report(input : Types::CreateCertificateAuthorityAuditReportRequest) : Types::CreateCertificateAuthorityAuditReportResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CERTIFICATE_AUTHORITY_AUDIT_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCertificateAuthorityAuditReportResponse, "CreateCertificateAuthorityAuditReport")
      end

      # Grants one or more permissions on a private CA to the Certificate Manager (ACM) service principal (
      # acm.amazonaws.com ). These permissions allow ACM to issue and renew ACM certificates that reside in
      # the same Amazon Web Services account as the CA. You can list current permissions with the
      # ListPermissions action and revoke them with the DeletePermission action. About Permissions If the
      # private CA and the certificates it issues reside in the same account, you can use CreatePermission
      # to grant permissions for ACM to carry out automatic certificate renewals. For automatic certificate
      # renewal to succeed, the ACM service principal needs permissions to create, retrieve, and list
      # certificates. If the private CA and the ACM certificates reside in different accounts, then
      # permissions cannot be used to enable automatic renewals. Instead, the ACM certificate owner must set
      # up a resource-based policy to enable cross-account issuance and renewals. For more information, see
      # Using a Resource Based Policy with Amazon Web Services Private CA .

      def create_permission(
        actions : Array(String),
        certificate_authority_arn : String,
        principal : String,
        source_account : String? = nil
      ) : Nil

        input = Types::CreatePermissionRequest.new(actions: actions, certificate_authority_arn: certificate_authority_arn, principal: principal, source_account: source_account)
        create_permission(input)
      end

      def create_permission(input : Types::CreatePermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a private certificate authority (CA). You must provide the Amazon Resource Name (ARN) of the
      # private CA that you want to delete. You can find the ARN by calling the ListCertificateAuthorities
      # action. Deleting a CA will invalidate other CAs and certificates below it in your CA hierarchy.
      # Before you can delete a CA that you have created and activated, you must disable it. To do this,
      # call the UpdateCertificateAuthority action and set the CertificateAuthorityStatus parameter to
      # DISABLED . Additionally, you can delete a CA if you are waiting for it to be created (that is, the
      # status of the CA is CREATING ). You can also delete it if the CA has been created but you haven't
      # yet imported the signed certificate into Amazon Web Services Private CA (that is, the status of the
      # CA is PENDING_CERTIFICATE ). When you successfully call DeleteCertificateAuthority , the CA's status
      # changes to DELETED . However, the CA won't be permanently deleted until the restoration period has
      # passed. By default, if you do not set the PermanentDeletionTimeInDays parameter, the CA remains
      # restorable for 30 days. You can set the parameter from 7 to 30 days. The
      # DescribeCertificateAuthority action returns the time remaining in the restoration window of a
      # private CA in the DELETED state. To restore an eligible CA, call the RestoreCertificateAuthority
      # action. A private CA can be deleted if it is in the PENDING_CERTIFICATE , CREATING , EXPIRED ,
      # DISABLED , or FAILED state. To delete a CA in the ACTIVE state, you must first disable it, or else
      # the delete request results in an exception. If you are deleting a private CA in the
      # PENDING_CERTIFICATE or DISABLED state, you can set the length of its restoration period to 7-30
      # days. The default is 30. During this time, the status is set to DELETED and the CA can be restored.
      # A private CA deleted in the CREATING or FAILED state has no assigned restoration period and cannot
      # be restored.

      def delete_certificate_authority(
        certificate_authority_arn : String,
        permanent_deletion_time_in_days : Int32? = nil
      ) : Nil

        input = Types::DeleteCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn, permanent_deletion_time_in_days: permanent_deletion_time_in_days)
        delete_certificate_authority(input)
      end

      def delete_certificate_authority(input : Types::DeleteCertificateAuthorityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Revokes permissions on a private CA granted to the Certificate Manager (ACM) service principal
      # (acm.amazonaws.com). These permissions allow ACM to issue and renew ACM certificates that reside in
      # the same Amazon Web Services account as the CA. If you revoke these permissions, ACM will no longer
      # renew the affected certificates automatically. Permissions can be granted with the CreatePermission
      # action and listed with the ListPermissions action. About Permissions If the private CA and the
      # certificates it issues reside in the same account, you can use CreatePermission to grant permissions
      # for ACM to carry out automatic certificate renewals. For automatic certificate renewal to succeed,
      # the ACM service principal needs permissions to create, retrieve, and list certificates. If the
      # private CA and the ACM certificates reside in different accounts, then permissions cannot be used to
      # enable automatic renewals. Instead, the ACM certificate owner must set up a resource-based policy to
      # enable cross-account issuance and renewals. For more information, see Using a Resource Based Policy
      # with Amazon Web Services Private CA .

      def delete_permission(
        certificate_authority_arn : String,
        principal : String,
        source_account : String? = nil
      ) : Nil

        input = Types::DeletePermissionRequest.new(certificate_authority_arn: certificate_authority_arn, principal: principal, source_account: source_account)
        delete_permission(input)
      end

      def delete_permission(input : Types::DeletePermissionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the resource-based policy attached to a private CA. Deletion will remove any access that the
      # policy has granted. If there is no policy attached to the private CA, this action will return
      # successful. If you delete a policy that was applied through Amazon Web Services Resource Access
      # Manager (RAM), the CA will be removed from all shares in which it was included. The Certificate
      # Manager Service Linked Role that the policy supports is not affected when you delete the policy. The
      # current policy can be shown with GetPolicy and updated with PutPolicy . About Policies A policy
      # grants access on a private CA to an Amazon Web Services customer account, to Amazon Web Services
      # Organizations, or to an Amazon Web Services Organizations unit. Policies are under the control of a
      # CA administrator. For more information, see Using a Resource Based Policy with Amazon Web Services
      # Private CA . A policy permits a user of Certificate Manager (ACM) to issue ACM certificates signed
      # by a CA in another account. For ACM to manage automatic renewal of these certificates, the ACM user
      # must configure a Service Linked Role (SLR). The SLR allows the ACM service to assume the identity of
      # the user, subject to confirmation against the Amazon Web Services Private CA policy. For more
      # information, see Using a Service Linked Role with ACM . Updates made in Amazon Web Services Resource
      # Manager (RAM) are reflected in policies. For more information, see Attach a Policy for Cross-Account
      # Access .

      def delete_policy(
        resource_arn : String
      ) : Nil

        input = Types::DeletePolicyRequest.new(resource_arn: resource_arn)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Lists information about your private certificate authority (CA) or one that has been shared with
      # you. You specify the private CA on input by its ARN (Amazon Resource Name). The output contains the
      # status of your CA. This can be any of the following: CREATING - Amazon Web Services Private CA is
      # creating your private certificate authority. PENDING_CERTIFICATE - The certificate is pending. You
      # must use your Amazon Web Services Private CA-hosted or on-premises root or subordinate CA to sign
      # your private CA CSR and then import it into Amazon Web Services Private CA. ACTIVE - Your private CA
      # is active. DISABLED - Your private CA has been disabled. EXPIRED - Your private CA certificate has
      # expired. FAILED - Your private CA has failed. Your CA can fail because of problems such a network
      # outage or back-end Amazon Web Services failure or other errors. A failed CA can never return to the
      # pending state. You must create a new CA. DELETED - Your private CA is within the restoration period,
      # after which it is permanently deleted. The length of time remaining in the CA's restoration period
      # is also included in this action's output.

      def describe_certificate_authority(
        certificate_authority_arn : String
      ) : Types::DescribeCertificateAuthorityResponse

        input = Types::DescribeCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn)
        describe_certificate_authority(input)
      end

      def describe_certificate_authority(input : Types::DescribeCertificateAuthorityRequest) : Types::DescribeCertificateAuthorityResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificateAuthorityResponse, "DescribeCertificateAuthority")
      end

      # Lists information about a specific audit report created by calling the
      # CreateCertificateAuthorityAuditReport action. Audit information is created every time the
      # certificate authority (CA) private key is used. The private key is used when you call the
      # IssueCertificate action or the RevokeCertificate action.

      def describe_certificate_authority_audit_report(
        audit_report_id : String,
        certificate_authority_arn : String
      ) : Types::DescribeCertificateAuthorityAuditReportResponse

        input = Types::DescribeCertificateAuthorityAuditReportRequest.new(audit_report_id: audit_report_id, certificate_authority_arn: certificate_authority_arn)
        describe_certificate_authority_audit_report(input)
      end

      def describe_certificate_authority_audit_report(input : Types::DescribeCertificateAuthorityAuditReportRequest) : Types::DescribeCertificateAuthorityAuditReportResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CERTIFICATE_AUTHORITY_AUDIT_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCertificateAuthorityAuditReportResponse, "DescribeCertificateAuthorityAuditReport")
      end

      # Retrieves a certificate from your private CA or one that has been shared with you. The ARN of the
      # certificate is returned when you call the IssueCertificate action. You must specify both the ARN of
      # your private CA and the ARN of the issued certificate when calling the GetCertificate action. You
      # can retrieve the certificate if it is in the ISSUED , EXPIRED , or REVOKED state. You can call the
      # CreateCertificateAuthorityAuditReport action to create a report that contains information about all
      # of the certificates issued and revoked by your private CA.

      def get_certificate(
        certificate_arn : String,
        certificate_authority_arn : String
      ) : Types::GetCertificateResponse

        input = Types::GetCertificateRequest.new(certificate_arn: certificate_arn, certificate_authority_arn: certificate_authority_arn)
        get_certificate(input)
      end

      def get_certificate(input : Types::GetCertificateRequest) : Types::GetCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificateResponse, "GetCertificate")
      end

      # Retrieves the certificate and certificate chain for your private certificate authority (CA) or one
      # that has been shared with you. Both the certificate and the chain are base64 PEM-encoded. The chain
      # does not include the CA certificate. Each certificate in the chain signs the one before it.

      def get_certificate_authority_certificate(
        certificate_authority_arn : String
      ) : Types::GetCertificateAuthorityCertificateResponse

        input = Types::GetCertificateAuthorityCertificateRequest.new(certificate_authority_arn: certificate_authority_arn)
        get_certificate_authority_certificate(input)
      end

      def get_certificate_authority_certificate(input : Types::GetCertificateAuthorityCertificateRequest) : Types::GetCertificateAuthorityCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATE_AUTHORITY_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificateAuthorityCertificateResponse, "GetCertificateAuthorityCertificate")
      end

      # Retrieves the certificate signing request (CSR) for your private certificate authority (CA). The CSR
      # is created when you call the CreateCertificateAuthority action. Sign the CSR with your Amazon Web
      # Services Private CA-hosted or on-premises root or subordinate CA. Then import the signed certificate
      # back into Amazon Web Services Private CA by calling the ImportCertificateAuthorityCertificate
      # action. The CSR is returned as a base64 PEM-encoded string.

      def get_certificate_authority_csr(
        certificate_authority_arn : String
      ) : Types::GetCertificateAuthorityCsrResponse

        input = Types::GetCertificateAuthorityCsrRequest.new(certificate_authority_arn: certificate_authority_arn)
        get_certificate_authority_csr(input)
      end

      def get_certificate_authority_csr(input : Types::GetCertificateAuthorityCsrRequest) : Types::GetCertificateAuthorityCsrResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CERTIFICATE_AUTHORITY_CSR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCertificateAuthorityCsrResponse, "GetCertificateAuthorityCsr")
      end

      # Retrieves the resource-based policy attached to a private CA. If either the private CA resource or
      # the policy cannot be found, this action returns a ResourceNotFoundException . The policy can be
      # attached or updated with PutPolicy and removed with DeletePolicy . About Policies A policy grants
      # access on a private CA to an Amazon Web Services customer account, to Amazon Web Services
      # Organizations, or to an Amazon Web Services Organizations unit. Policies are under the control of a
      # CA administrator. For more information, see Using a Resource Based Policy with Amazon Web Services
      # Private CA . A policy permits a user of Certificate Manager (ACM) to issue ACM certificates signed
      # by a CA in another account. For ACM to manage automatic renewal of these certificates, the ACM user
      # must configure a Service Linked Role (SLR). The SLR allows the ACM service to assume the identity of
      # the user, subject to confirmation against the Amazon Web Services Private CA policy. For more
      # information, see Using a Service Linked Role with ACM . Updates made in Amazon Web Services Resource
      # Manager (RAM) are reflected in policies. For more information, see Attach a Policy for Cross-Account
      # Access .

      def get_policy(
        resource_arn : String
      ) : Types::GetPolicyResponse

        input = Types::GetPolicyRequest.new(resource_arn: resource_arn)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyRequest) : Types::GetPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPolicyResponse, "GetPolicy")
      end

      # Imports a signed private CA certificate into Amazon Web Services Private CA. This action is used
      # when you are using a chain of trust whose root is located outside Amazon Web Services Private CA.
      # Before you can call this action, the following preparations must in place: In Amazon Web Services
      # Private CA, call the CreateCertificateAuthority action to create the private CA that you plan to
      # back with the imported certificate. Call the GetCertificateAuthorityCsr action to generate a
      # certificate signing request (CSR). Sign the CSR using a root or intermediate CA hosted by either an
      # on-premises PKI hierarchy or by a commercial CA. Create a certificate chain and copy the signed
      # certificate and the certificate chain to your working directory. Amazon Web Services Private CA
      # supports three scenarios for installing a CA certificate: Installing a certificate for a root CA
      # hosted by Amazon Web Services Private CA. Installing a subordinate CA certificate whose parent
      # authority is hosted by Amazon Web Services Private CA. Installing a subordinate CA certificate whose
      # parent authority is externally hosted. The following additional requirements apply when you import a
      # CA certificate. Only a self-signed certificate can be imported as a root CA. A self-signed
      # certificate cannot be imported as a subordinate CA. Your certificate chain must not include the
      # private CA certificate that you are importing. Your root CA must be the last certificate in your
      # chain. The subordinate certificate, if any, that your root CA signed must be next to last. The
      # subordinate certificate signed by the preceding subordinate CA must come next, and so on until your
      # chain is built. The chain must be PEM-encoded. The maximum allowed size of a certificate is 32 KB.
      # The maximum allowed size of a certificate chain is 2 MB. Enforcement of Critical Constraints Amazon
      # Web Services Private CA allows the following extensions to be marked critical in the imported CA
      # certificate or chain. Authority key identifier Basic constraints ( must be marked critical)
      # Certificate policies Extended key usage Inhibit anyPolicy Issuer alternative name Key usage Name
      # constraints Policy mappings Subject alternative name Subject directory attributes Subject key
      # identifier Subject information access Amazon Web Services Private CA rejects the following
      # extensions when they are marked critical in an imported CA certificate or chain. Authority
      # information access CRL distribution points Freshest CRL Policy constraints Amazon Web Services
      # Private Certificate Authority will also reject any other extension marked as critical not contained
      # on the preceding list of allowed extensions.

      def import_certificate_authority_certificate(
        certificate : Bytes,
        certificate_authority_arn : String,
        certificate_chain : Bytes? = nil
      ) : Nil

        input = Types::ImportCertificateAuthorityCertificateRequest.new(certificate: certificate, certificate_authority_arn: certificate_authority_arn, certificate_chain: certificate_chain)
        import_certificate_authority_certificate(input)
      end

      def import_certificate_authority_certificate(input : Types::ImportCertificateAuthorityCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::IMPORT_CERTIFICATE_AUTHORITY_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Uses your private certificate authority (CA), or one that has been shared with you, to issue a
      # client certificate. This action returns the Amazon Resource Name (ARN) of the certificate. You can
      # retrieve the certificate by calling the GetCertificate action and specifying the ARN. You cannot use
      # the ACM ListCertificateAuthorities action to retrieve the ARNs of the certificates that you issue by
      # using Amazon Web Services Private CA.

      def issue_certificate(
        certificate_authority_arn : String,
        csr : Bytes,
        signing_algorithm : String,
        validity : Types::Validity,
        api_passthrough : Types::ApiPassthrough? = nil,
        idempotency_token : String? = nil,
        template_arn : String? = nil,
        validity_not_before : Types::Validity? = nil
      ) : Types::IssueCertificateResponse

        input = Types::IssueCertificateRequest.new(certificate_authority_arn: certificate_authority_arn, csr: csr, signing_algorithm: signing_algorithm, validity: validity, api_passthrough: api_passthrough, idempotency_token: idempotency_token, template_arn: template_arn, validity_not_before: validity_not_before)
        issue_certificate(input)
      end

      def issue_certificate(input : Types::IssueCertificateRequest) : Types::IssueCertificateResponse
        request = Protocol::JsonRpc.build_request(Model::ISSUE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IssueCertificateResponse, "IssueCertificate")
      end

      # Lists the private certificate authorities that you created by using the CreateCertificateAuthority
      # action.

      def list_certificate_authorities(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_owner : String? = nil
      ) : Types::ListCertificateAuthoritiesResponse

        input = Types::ListCertificateAuthoritiesRequest.new(max_results: max_results, next_token: next_token, resource_owner: resource_owner)
        list_certificate_authorities(input)
      end

      def list_certificate_authorities(input : Types::ListCertificateAuthoritiesRequest) : Types::ListCertificateAuthoritiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CERTIFICATE_AUTHORITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCertificateAuthoritiesResponse, "ListCertificateAuthorities")
      end

      # List all permissions on a private CA, if any, granted to the Certificate Manager (ACM) service
      # principal (acm.amazonaws.com). These permissions allow ACM to issue and renew ACM certificates that
      # reside in the same Amazon Web Services account as the CA. Permissions can be granted with the
      # CreatePermission action and revoked with the DeletePermission action. About Permissions If the
      # private CA and the certificates it issues reside in the same account, you can use CreatePermission
      # to grant permissions for ACM to carry out automatic certificate renewals. For automatic certificate
      # renewal to succeed, the ACM service principal needs permissions to create, retrieve, and list
      # certificates. If the private CA and the ACM certificates reside in different accounts, then
      # permissions cannot be used to enable automatic renewals. Instead, the ACM certificate owner must set
      # up a resource-based policy to enable cross-account issuance and renewals. For more information, see
      # Using a Resource Based Policy with Amazon Web Services Private CA .

      def list_permissions(
        certificate_authority_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPermissionsResponse

        input = Types::ListPermissionsRequest.new(certificate_authority_arn: certificate_authority_arn, max_results: max_results, next_token: next_token)
        list_permissions(input)
      end

      def list_permissions(input : Types::ListPermissionsRequest) : Types::ListPermissionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PERMISSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPermissionsResponse, "ListPermissions")
      end

      # Lists the tags, if any, that are associated with your private CA or one that has been shared with
      # you. Tags are labels that you can use to identify and organize your CAs. Each tag consists of a key
      # and an optional value. Call the TagCertificateAuthority action to add one or more tags to your CA.
      # Call the UntagCertificateAuthority action to remove tags.

      def list_tags(
        certificate_authority_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsResponse

        input = Types::ListTagsRequest.new(certificate_authority_arn: certificate_authority_arn, max_results: max_results, next_token: next_token)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsRequest) : Types::ListTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsResponse, "ListTags")
      end

      # Attaches a resource-based policy to a private CA. A policy can also be applied by sharing a private
      # CA through Amazon Web Services Resource Access Manager (RAM). For more information, see Attach a
      # Policy for Cross-Account Access . The policy can be displayed with GetPolicy and removed with
      # DeletePolicy . About Policies A policy grants access on a private CA to an Amazon Web Services
      # customer account, to Amazon Web Services Organizations, or to an Amazon Web Services Organizations
      # unit. Policies are under the control of a CA administrator. For more information, see Using a
      # Resource Based Policy with Amazon Web Services Private CA . A policy permits a user of Certificate
      # Manager (ACM) to issue ACM certificates signed by a CA in another account. For ACM to manage
      # automatic renewal of these certificates, the ACM user must configure a Service Linked Role (SLR).
      # The SLR allows the ACM service to assume the identity of the user, subject to confirmation against
      # the Amazon Web Services Private CA policy. For more information, see Using a Service Linked Role
      # with ACM . Updates made in Amazon Web Services Resource Manager (RAM) are reflected in policies. For
      # more information, see Attach a Policy for Cross-Account Access .

      def put_policy(
        policy : String,
        resource_arn : String
      ) : Nil

        input = Types::PutPolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_policy(input)
      end

      def put_policy(input : Types::PutPolicyRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Restores a certificate authority (CA) that is in the DELETED state. You can restore a CA during the
      # period that you defined in the PermanentDeletionTimeInDays parameter of the
      # DeleteCertificateAuthority action. Currently, you can specify 7 to 30 days. If you did not specify a
      # PermanentDeletionTimeInDays value, by default you can restore the CA at any time in a 30 day period.
      # You can check the time remaining in the restoration period of a private CA in the DELETED state by
      # calling the DescribeCertificateAuthority or ListCertificateAuthorities actions. The status of a
      # restored CA is set to its pre-deletion status when the RestoreCertificateAuthority action returns.
      # To change its status to ACTIVE , call the UpdateCertificateAuthority action. If the private CA was
      # in the PENDING_CERTIFICATE state at deletion, you must use the ImportCertificateAuthorityCertificate
      # action to import a certificate authority into the private CA before it can be activated. You cannot
      # restore a CA after the restoration period has ended.

      def restore_certificate_authority(
        certificate_authority_arn : String
      ) : Nil

        input = Types::RestoreCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn)
        restore_certificate_authority(input)
      end

      def restore_certificate_authority(input : Types::RestoreCertificateAuthorityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::RESTORE_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Revokes a certificate that was issued inside Amazon Web Services Private CA. If you enable a
      # certificate revocation list (CRL) when you create or update your private CA, information about the
      # revoked certificates will be included in the CRL. Amazon Web Services Private CA writes the CRL to
      # an S3 bucket that you specify. A CRL is typically updated approximately 30 minutes after a
      # certificate is revoked. If for any reason the CRL update fails, Amazon Web Services Private CA
      # attempts makes further attempts every 15 minutes. With Amazon CloudWatch, you can create alarms for
      # the metrics CRLGenerated and MisconfiguredCRLBucket . For more information, see Supported CloudWatch
      # Metrics . Both Amazon Web Services Private CA and the IAM principal must have permission to write to
      # the S3 bucket that you specify. If the IAM principal making the call does not have permission to
      # write to the bucket, then an exception is thrown. For more information, see Access policies for CRLs
      # in Amazon S3 . Amazon Web Services Private CA also writes revocation information to the audit
      # report. For more information, see CreateCertificateAuthorityAuditReport . You cannot revoke a root
      # CA self-signed certificate.

      def revoke_certificate(
        certificate_authority_arn : String,
        certificate_serial : String,
        revocation_reason : String
      ) : Nil

        input = Types::RevokeCertificateRequest.new(certificate_authority_arn: certificate_authority_arn, certificate_serial: certificate_serial, revocation_reason: revocation_reason)
        revoke_certificate(input)
      end

      def revoke_certificate(input : Types::RevokeCertificateRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REVOKE_CERTIFICATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Adds one or more tags to your private CA. Tags are labels that you can use to identify and organize
      # your Amazon Web Services resources. Each tag consists of a key and an optional value. You specify
      # the private CA on input by its Amazon Resource Name (ARN). You specify the tag by using a key-value
      # pair. You can apply a tag to just one private CA if you want to identify a specific characteristic
      # of that CA, or you can apply the same tag to multiple private CAs if you want to filter for a common
      # relationship among those CAs. To remove one or more tags, use the UntagCertificateAuthority action.
      # Call the ListTags action to see what tags are associated with your CA. To attach tags to a private
      # CA during the creation procedure, a CA administrator must first associate an inline IAM policy with
      # the CreateCertificateAuthority action and explicitly allow tagging. For more information, see
      # Attaching tags to a CA at the time of creation .

      def tag_certificate_authority(
        certificate_authority_arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::TagCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn, tags: tags)
        tag_certificate_authority(input)
      end

      def tag_certificate_authority(input : Types::TagCertificateAuthorityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Remove one or more tags from your private CA. A tag consists of a key-value pair. If you do not
      # specify the value portion of the tag when calling this action, the tag will be removed regardless of
      # value. If you specify a value, the tag is removed only if it is associated with the specified value.
      # To add tags to a private CA, use the TagCertificateAuthority . Call the ListTags action to see what
      # tags are associated with your CA.

      def untag_certificate_authority(
        certificate_authority_arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::UntagCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn, tags: tags)
        untag_certificate_authority(input)
      end

      def untag_certificate_authority(input : Types::UntagCertificateAuthorityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the status or configuration of a private certificate authority (CA). Your private CA must be
      # in the ACTIVE or DISABLED state before you can update it. You can disable a private CA that is in
      # the ACTIVE state or make a CA that is in the DISABLED state active again. Both Amazon Web Services
      # Private CA and the IAM principal must have permission to write to the S3 bucket that you specify. If
      # the IAM principal making the call does not have permission to write to the bucket, then an exception
      # is thrown. For more information, see Access policies for CRLs in Amazon S3 .

      def update_certificate_authority(
        certificate_authority_arn : String,
        revocation_configuration : Types::RevocationConfiguration? = nil,
        status : String? = nil
      ) : Nil

        input = Types::UpdateCertificateAuthorityRequest.new(certificate_authority_arn: certificate_authority_arn, revocation_configuration: revocation_configuration, status: status)
        update_certificate_authority(input)
      end

      def update_certificate_authority(input : Types::UpdateCertificateAuthorityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CERTIFICATE_AUTHORITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
