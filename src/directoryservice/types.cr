require "json"
require "time"

module Aws
  module DirectoryService
    module Types

      # A directory assessment is automatically created when you create a hybrid directory. There are two
      # types of assessments: CUSTOMER and SYSTEM . Your Amazon Web Services account has a limit of 100
      # CUSTOMER directory assessments. If you attempt to create a hybrid directory; and you already have
      # 100 CUSTOMER directory assessments;, you will encounter an error. Delete assessments to free up
      # capacity before trying again. You can request an increase to your CUSTOMER directory assessment
      # quota by contacting customer support or delete existing CUSTOMER directory assessments; to free up
      # capacity.

      struct ADAssessmentLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct AcceptSharedDirectoryRequest
        include JSON::Serializable

        # Identifier of the shared directory in the directory consumer account. This identifier is different
        # for each directory owner account.

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String

        def initialize(
          @shared_directory_id : String
        )
        end
      end


      struct AcceptSharedDirectoryResult
        include JSON::Serializable

        # The shared directory in the directory consumer account.

        @[JSON::Field(key: "SharedDirectory")]
        getter shared_directory : Types::SharedDirectory?

        def initialize(
          @shared_directory : Types::SharedDirectory? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct AddIpRoutesRequest
        include JSON::Serializable

        # Identifier (ID) of the directory to which to add the address block.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # IP address blocks, using CIDR format, of the traffic to route. This is often the IP address block of
        # the DNS server used for your self-managed domain.

        @[JSON::Field(key: "IpRoutes")]
        getter ip_routes : Array(Types::IpRoute)

        # If set to true, updates the inbound and outbound rules of the security group that has the
        # description: "Amazon Web Services created security group for directory ID directory controllers."
        # Following are the new rules: Inbound: Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source:
        # Managed Microsoft AD VPC IPv4 CIDR Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: Managed
        # Microsoft AD VPC IPv4 CIDR Type: DNS (UDP), Protocol: UDP, Range: 53, Source: Managed Microsoft AD
        # VPC IPv4 CIDR Type: DNS (TCP), Protocol: TCP, Range: 53, Source: Managed Microsoft AD VPC IPv4 CIDR
        # Type: LDAP, Protocol: TCP, Range: 389, Source: Managed Microsoft AD VPC IPv4 CIDR Type: All ICMP,
        # Protocol: All, Range: N/A, Source: Managed Microsoft AD VPC IPv4 CIDR Outbound: Type: All traffic,
        # Protocol: All, Range: All, Destination: 0.0.0.0/0 These security rules impact an internal network
        # interface that is not exposed publicly.

        @[JSON::Field(key: "UpdateSecurityGroupForDirectoryControllers")]
        getter update_security_group_for_directory_controllers : Bool?

        def initialize(
          @directory_id : String,
          @ip_routes : Array(Types::IpRoute),
          @update_security_group_for_directory_controllers : Bool? = nil
        )
        end
      end


      struct AddIpRoutesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct AddRegionRequest
        include JSON::Serializable

        # The identifier of the directory to which you want to add Region replication.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the Region where you want to add domain controllers for replication. For example,
        # us-east-1 .

        @[JSON::Field(key: "RegionName")]
        getter region_name : String


        @[JSON::Field(key: "VPCSettings")]
        getter vpc_settings : Types::DirectoryVpcSettings

        def initialize(
          @directory_id : String,
          @region_name : String,
          @vpc_settings : Types::DirectoryVpcSettings
        )
        end
      end


      struct AddRegionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct AddTagsToResourceRequest
        include JSON::Serializable

        # Identifier (ID) for the directory to which to add the tag.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The tags to be assigned to the directory.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_id : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct AddTagsToResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains detailed information about a directory assessment, including configuration parameters,
      # status, and validation results.

      struct Assessment
        include JSON::Serializable

        # The unique identifier of the directory assessment.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        # The IP addresses of the DNS servers or domain controllers in your self-managed AD environment.

        @[JSON::Field(key: "CustomerDnsIps")]
        getter customer_dns_ips : Array(String)?

        # The identifier of the directory associated with this assessment.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The fully qualified domain name (FQDN) of the Active Directory domain being assessed.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The date and time when the assessment status was last updated.

        @[JSON::Field(key: "LastUpdateDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_date_time : Time?

        # The type of assessment report generated. Valid values are CUSTOMER and SYSTEM .

        @[JSON::Field(key: "ReportType")]
        getter report_type : String?

        # The security groups identifiers attached to the network interfaces.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The identifiers of the self-managed AD instances used to perform the assessment.

        @[JSON::Field(key: "SelfManagedInstanceIds")]
        getter self_managed_instance_ids : Array(String)?

        # The date and time when the assessment was initiated.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current status of the assessment. Valid values include SUCCESS , FAILED , PENDING , and
        # IN_PROGRESS .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status code providing additional information about the assessment state.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # A human-readable description of the current assessment status, including any error details or
        # progress information.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # A list of subnet identifiers in the Amazon VPC in which the hybrid directory is created.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The version of the assessment framework used to evaluate your self-managed AD environment.

        @[JSON::Field(key: "Version")]
        getter version : String?

        # Contains Amazon VPC information for the StartADAssessment operation.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @assessment_id : String? = nil,
          @customer_dns_ips : Array(String)? = nil,
          @directory_id : String? = nil,
          @dns_name : String? = nil,
          @last_update_date_time : Time? = nil,
          @report_type : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @self_managed_instance_ids : Array(String)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_reason : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @version : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains configuration parameters required to perform a directory assessment.

      struct AssessmentConfiguration
        include JSON::Serializable

        # A list of IP addresses for the DNS servers or domain controllers in your self-managed AD that are
        # tested during the assessment.

        @[JSON::Field(key: "CustomerDnsIps")]
        getter customer_dns_ips : Array(String)

        # The fully qualified domain name (FQDN) of the self-managed AD domain to assess.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String

        # The identifiers of the self-managed instances with SSM that are used to perform connectivity and
        # validation tests.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)


        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettings

        # By default, the service attaches a security group to allow network access to the self-managed nodes
        # in your Amazon VPC. You can optionally supply your own security group that allows network traffic to
        # and from your self-managed domain controllers outside of your Amazon VPC.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        def initialize(
          @customer_dns_ips : Array(String),
          @dns_name : String,
          @instance_ids : Array(String),
          @vpc_settings : Types::DirectoryVpcSettings,
          @security_group_ids : Array(String)? = nil
        )
        end
      end

      # Contains the results of validation tests performed against a specific domain controller during a
      # directory assessment.

      struct AssessmentReport
        include JSON::Serializable

        # The IP address of the domain controller that was tested during the assessment.

        @[JSON::Field(key: "DomainControllerIp")]
        getter domain_controller_ip : String?

        # A list of validation results for different test categories performed against this domain controller.

        @[JSON::Field(key: "Validations")]
        getter validations : Array(Types::AssessmentValidation)?

        def initialize(
          @domain_controller_ip : String? = nil,
          @validations : Array(Types::AssessmentValidation)? = nil
        )
        end
      end

      # Contains summary information about a directory assessment, providing a high-level overview without
      # detailed validation results.

      struct AssessmentSummary
        include JSON::Serializable

        # The unique identifier of the directory assessment.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        # The IP addresses of the DNS servers or domain controllers in your self-managed AD environment.

        @[JSON::Field(key: "CustomerDnsIps")]
        getter customer_dns_ips : Array(String)?

        # The identifier of the directory associated with this assessment.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The fully qualified domain name (FQDN) of the Active Directory domain being assessed.

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The date and time when the assessment status was last updated.

        @[JSON::Field(key: "LastUpdateDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_date_time : Time?

        # The type of assessment report generated. Valid values include CUSTOMER and SYSTEM .

        @[JSON::Field(key: "ReportType")]
        getter report_type : String?

        # The date and time when the assessment was initiated.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current status of the assessment. Valid values include SUCCESS , FAILED , PENDING , and
        # IN_PROGRESS .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @assessment_id : String? = nil,
          @customer_dns_ips : Array(String)? = nil,
          @directory_id : String? = nil,
          @dns_name : String? = nil,
          @last_update_date_time : Time? = nil,
          @report_type : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Contains information about a specific validation test performed during a directory assessment.

      struct AssessmentValidation
        include JSON::Serializable

        # The category of the validation test.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The date and time when the validation test was completed or last updated.

        @[JSON::Field(key: "LastUpdateDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_date_time : Time?

        # The name of the specific validation test performed within the category.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The date and time when the validation test was started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The result status of the validation test. Valid values include SUCCESS , FAILED , PENDING , and
        # IN_PROGRESS .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A detailed status code providing additional information about the validation result.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : String?

        # A human-readable description of the validation result, including any error details or
        # recommendations.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @category : String? = nil,
          @last_update_date_time : Time? = nil,
          @name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Represents a named directory attribute.

      struct Attribute
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An authentication error occurred.

      struct AuthenticationFailedException
        include JSON::Serializable

        # The textual message for the exception.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier of the request that caused the exception.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end


      struct CancelSchemaExtensionRequest
        include JSON::Serializable

        # The identifier of the directory whose schema extension will be canceled.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The identifier of the schema extension that will be canceled.

        @[JSON::Field(key: "SchemaExtensionId")]
        getter schema_extension_id : String

        def initialize(
          @directory_id : String,
          @schema_extension_id : String
        )
        end
      end


      struct CancelSchemaExtensionResult
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the certificate.

      struct Certificate
        include JSON::Serializable

        # The identifier of the certificate.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        # A ClientCertAuthSettings object that contains client certificate authentication settings.

        @[JSON::Field(key: "ClientCertAuthSettings")]
        getter client_cert_auth_settings : Types::ClientCertAuthSettings?

        # The common name for the certificate.

        @[JSON::Field(key: "CommonName")]
        getter common_name : String?

        # The date and time when the certificate will expire.

        @[JSON::Field(key: "ExpiryDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry_date_time : Time?

        # The date and time that the certificate was registered.

        @[JSON::Field(key: "RegisteredDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter registered_date_time : Time?

        # The state of the certificate.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Describes a state change for the certificate.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The function that the registered certificate performs. Valid values include ClientLDAPS or
        # ClientCertAuth . The default value is ClientLDAPS .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @certificate_id : String? = nil,
          @client_cert_auth_settings : Types::ClientCertAuthSettings? = nil,
          @common_name : String? = nil,
          @expiry_date_time : Time? = nil,
          @registered_date_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The certificate has already been registered into the system.

      struct CertificateAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The certificate is not present in the system for describe or deregister activities.

      struct CertificateDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The certificate is being used for the LDAP security connection and cannot be removed without
      # disabling LDAP security.

      struct CertificateInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains general information about a certificate.

      struct CertificateInfo
        include JSON::Serializable

        # The identifier of the certificate.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        # The common name for the certificate.

        @[JSON::Field(key: "CommonName")]
        getter common_name : String?

        # The date and time when the certificate will expire.

        @[JSON::Field(key: "ExpiryDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry_date_time : Time?

        # The state of the certificate.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The function that the registered certificate performs. Valid values include ClientLDAPS or
        # ClientCertAuth . The default value is ClientLDAPS .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @certificate_id : String? = nil,
          @common_name : String? = nil,
          @expiry_date_time : Time? = nil,
          @state : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The certificate could not be added because the certificate limit has been reached.

      struct CertificateLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains information about a client authentication method for a directory.

      struct ClientAuthenticationSettingInfo
        include JSON::Serializable

        # The date and time when the status of the client authentication type was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Whether the client authentication type is enabled or disabled for the specified directory.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of client authentication for the specified directory. If no type is specified, a list of
        # all client authentication types that are supported for the directory is retrieved.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @last_updated_date_time : Time? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Contains information about the client certificate authentication settings for the
      # RegisterCertificate and DescribeCertificate operations.

      struct ClientCertAuthSettings
        include JSON::Serializable

        # Specifies the URL of the default OCSP server used to check for revocation status. A secondary value
        # to any OCSP address found in the AIA extension of the user certificate.

        @[JSON::Field(key: "OCSPUrl")]
        getter ocsp_url : String?

        def initialize(
          @ocsp_url : String? = nil
        )
        end
      end

      # A client exception has occurred.

      struct ClientException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains information about a computer account in a directory.

      struct Computer
        include JSON::Serializable

        # An array of Attribute objects containing the LDAP attributes that belong to the computer account.

        @[JSON::Field(key: "ComputerAttributes")]
        getter computer_attributes : Array(Types::Attribute)?

        # The identifier of the computer.

        @[JSON::Field(key: "ComputerId")]
        getter computer_id : String?

        # The computer name.

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String?

        def initialize(
          @computer_attributes : Array(Types::Attribute)? = nil,
          @computer_id : String? = nil,
          @computer_name : String? = nil
        )
        end
      end

      # Points to a remote domain with which you are setting up a trust relationship. Conditional forwarders
      # are required in order to set up a trust relationship with another domain.

      struct ConditionalForwarder
        include JSON::Serializable

        # The IP addresses of the remote DNS server associated with RemoteDomainName. This is the IP address
        # of the DNS server that your conditional forwarder points to.

        @[JSON::Field(key: "DnsIpAddrs")]
        getter dns_ip_addrs : Array(String)?

        # The IPv6 addresses of the remote DNS server associated with RemoteDomainName. This is the IPv6
        # address of the DNS server that your conditional forwarder points to.

        @[JSON::Field(key: "DnsIpv6Addrs")]
        getter dns_ipv6_addrs : Array(String)?

        # The fully qualified domain name (FQDN) of the remote domains pointed to by the conditional
        # forwarder.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String?

        # The replication scope of the conditional forwarder. The only allowed value is Domain , which will
        # replicate the conditional forwarder to all of the domain controllers for your Amazon Web Services
        # directory.

        @[JSON::Field(key: "ReplicationScope")]
        getter replication_scope : String?

        def initialize(
          @dns_ip_addrs : Array(String)? = nil,
          @dns_ipv6_addrs : Array(String)? = nil,
          @remote_domain_name : String? = nil,
          @replication_scope : String? = nil
        )
        end
      end

      # Contains the inputs for the ConnectDirectory operation.

      struct ConnectDirectoryRequest
        include JSON::Serializable

        # A DirectoryConnectSettings object that contains additional information for the operation.

        @[JSON::Field(key: "ConnectSettings")]
        getter connect_settings : Types::DirectoryConnectSettings

        # The fully qualified name of your self-managed directory, such as corp.example.com .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The password for your self-managed user account.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The size of the directory.

        @[JSON::Field(key: "Size")]
        getter size : String

        # A description for the directory.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The network type for your directory. The default value is IPv4 or IPv6 based on the provided subnet
        # capabilities.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The NetBIOS name of your self-managed directory, such as CORP .

        @[JSON::Field(key: "ShortName")]
        getter short_name : String?

        # The tags to be assigned to AD Connector.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @connect_settings : Types::DirectoryConnectSettings,
          @name : String,
          @password : String,
          @size : String,
          @description : String? = nil,
          @network_type : String? = nil,
          @short_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains the results of the ConnectDirectory operation.

      struct ConnectDirectoryResult
        include JSON::Serializable

        # The identifier of the new directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end

      # Contains the inputs for the CreateAlias operation.

      struct CreateAliasRequest
        include JSON::Serializable

        # The requested alias. The alias must be unique amongst all aliases in Amazon Web Services. This
        # operation throws an EntityAlreadyExistsException error if the alias already exists.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The identifier of the directory for which to create the alias.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @alias : String,
          @directory_id : String
        )
        end
      end

      # Contains the results of the CreateAlias operation.

      struct CreateAliasResult
        include JSON::Serializable

        # The alias for the directory.

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @alias : String? = nil,
          @directory_id : String? = nil
        )
        end
      end

      # Contains the inputs for the CreateComputer operation.

      struct CreateComputerRequest
        include JSON::Serializable

        # The name of the computer account.

        @[JSON::Field(key: "ComputerName")]
        getter computer_name : String

        # The identifier of the directory in which to create the computer account.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # A one-time password that is used to join the computer to the directory. You should generate a
        # random, strong password to use for this parameter.

        @[JSON::Field(key: "Password")]
        getter password : String

        # An array of Attribute objects that contain any LDAP attributes to apply to the computer account.

        @[JSON::Field(key: "ComputerAttributes")]
        getter computer_attributes : Array(Types::Attribute)?

        # The fully-qualified distinguished name of the organizational unit to place the computer account in.

        @[JSON::Field(key: "OrganizationalUnitDistinguishedName")]
        getter organizational_unit_distinguished_name : String?

        def initialize(
          @computer_name : String,
          @directory_id : String,
          @password : String,
          @computer_attributes : Array(Types::Attribute)? = nil,
          @organizational_unit_distinguished_name : String? = nil
        )
        end
      end

      # Contains the results for the CreateComputer operation.

      struct CreateComputerResult
        include JSON::Serializable

        # A Computer object that represents the computer account.

        @[JSON::Field(key: "Computer")]
        getter computer : Types::Computer?

        def initialize(
          @computer : Types::Computer? = nil
        )
        end
      end

      # Initiates the creation of a conditional forwarder for your Directory Service for Microsoft Active
      # Directory. Conditional forwarders are required in order to set up a trust relationship with another
      # domain.

      struct CreateConditionalForwarderRequest
        include JSON::Serializable

        # The directory ID of the Amazon Web Services directory for which you are creating the conditional
        # forwarder.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust
        # relationship.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String

        # The IP addresses of the remote DNS server associated with RemoteDomainName.

        @[JSON::Field(key: "DnsIpAddrs")]
        getter dns_ip_addrs : Array(String)?

        # The IPv6 addresses of the remote DNS server associated with RemoteDomainName.

        @[JSON::Field(key: "DnsIpv6Addrs")]
        getter dns_ipv6_addrs : Array(String)?

        def initialize(
          @directory_id : String,
          @remote_domain_name : String,
          @dns_ip_addrs : Array(String)? = nil,
          @dns_ipv6_addrs : Array(String)? = nil
        )
        end
      end

      # The result of a CreateConditinalForwarder request.

      struct CreateConditionalForwarderResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the CreateDirectory operation.

      struct CreateDirectoryRequest
        include JSON::Serializable

        # The fully qualified name for the directory, such as corp.example.com .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The password for the directory administrator. The directory creation process creates a directory
        # administrator account with the user name Administrator and this password. If you need to change the
        # password for the administrator account, you can use the ResetUserPassword API call. The regex
        # pattern for this string is made up of the following conditions: Length (?=^.{8,64}$) – Must be
        # between 8 and 64 characters AND any 3 of the following password complexity rules required by Active
        # Directory: Numbers and upper case and lowercase (?=.*\d)(?=.*[A-Z])(?=.*[a-z]) Numbers and special
        # characters and lower case (?=.*\d)(?=.*[^A-Za-z0-9\s])(?=.*[a-z]) Special characters and upper case
        # and lower case (?=.*[^A-Za-z0-9\s])(?=.*[A-Z])(?=.*[a-z]) Numbers and upper case and special
        # characters (?=.*\d)(?=.*[A-Z])(?=.*[^A-Za-z0-9\s]) For additional information about how Active
        # Directory passwords are enforced, see Password must meet complexity requirements on the Microsoft
        # website.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The size of the directory.

        @[JSON::Field(key: "Size")]
        getter size : String

        # A description for the directory.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The network type for your directory. Simple AD supports IPv4 and Dual-stack only.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The NetBIOS name of the directory, such as CORP .

        @[JSON::Field(key: "ShortName")]
        getter short_name : String?

        # The tags to be assigned to the Simple AD directory.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A DirectoryVpcSettings object that contains additional information for the operation.

        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettings?

        def initialize(
          @name : String,
          @password : String,
          @size : String,
          @description : String? = nil,
          @network_type : String? = nil,
          @short_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_settings : Types::DirectoryVpcSettings? = nil
        )
        end
      end

      # Contains the results of the CreateDirectory operation.

      struct CreateDirectoryResult
        include JSON::Serializable

        # The identifier of the directory that was created.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end


      struct CreateHybridADRequest
        include JSON::Serializable

        # The unique identifier of the successful directory assessment that validates your self-managed AD
        # environment. You must have a successful directory assessment before you create a hybrid directory.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that contains the
        # credentials for the service account used to join hybrid domain controllers to your self-managed AD
        # domain. This secret is used once and not stored. The secret must contain key-value pairs with keys
        # matching customerAdAdminDomainUsername and customerAdAdminDomainPassword . For example:
        # {"customerAdAdminDomainUsername":"carlos_salazar","customerAdAdminDomainPassword":"ExamplePassword123!"}
        # .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The tags to be assigned to the directory. Each tag consists of a key and value pair. You can specify
        # multiple tags as a list.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @assessment_id : String,
          @secret_arn : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateHybridADResult
        include JSON::Serializable

        # The unique identifier of the newly created hybrid directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end


      struct CreateLogSubscriptionRequest
        include JSON::Serializable

        # Identifier of the directory to which you want to subscribe and receive real-time logs to your
        # specified CloudWatch log group.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the CloudWatch log group where the real-time domain controller logs are forwarded.

        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String

        def initialize(
          @directory_id : String,
          @log_group_name : String
        )
        end
      end


      struct CreateLogSubscriptionResult
        include JSON::Serializable

        def initialize
        end
      end

      # Creates an Managed Microsoft AD directory.

      struct CreateMicrosoftADRequest
        include JSON::Serializable

        # The fully qualified domain name for the Managed Microsoft AD directory, such as corp.example.com .
        # This name will resolve inside your VPC only. It does not need to be publicly resolvable.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The password for the default administrative user named Admin . If you need to change the password
        # for the administrator account, you can use the ResetUserPassword API call.

        @[JSON::Field(key: "Password")]
        getter password : String

        # Contains VPC information for the CreateDirectory or CreateMicrosoftAD operation.

        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettings

        # A description for the directory. This label will appear on the Amazon Web Services console Directory
        # Details page after the directory is created.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Managed Microsoft AD is available in two editions: Standard and Enterprise . Enterprise is the
        # default.

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # The network type for your domain. The default value is IPv4 or IPv6 based on the provided subnet
        # capabilities.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The NetBIOS name for your domain, such as CORP . If you don't specify a NetBIOS name, it will
        # default to the first part of your directory DNS. For example, CORP for the directory DNS
        # corp.example.com .

        @[JSON::Field(key: "ShortName")]
        getter short_name : String?

        # The tags to be assigned to the Managed Microsoft AD directory.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @password : String,
          @vpc_settings : Types::DirectoryVpcSettings,
          @description : String? = nil,
          @edition : String? = nil,
          @network_type : String? = nil,
          @short_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Result of a CreateMicrosoftAD request.

      struct CreateMicrosoftADResult
        include JSON::Serializable

        # The identifier of the directory that was created.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end

      # Contains the inputs for the CreateSnapshot operation.

      struct CreateSnapshotRequest
        include JSON::Serializable

        # The identifier of the directory of which to take a snapshot.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The descriptive name to apply to the snapshot.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @directory_id : String,
          @name : String? = nil
        )
        end
      end

      # Contains the results of the CreateSnapshot operation.

      struct CreateSnapshotResult
        include JSON::Serializable

        # The identifier of the snapshot that was created.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        def initialize(
          @snapshot_id : String? = nil
        )
        end
      end

      # Directory Service for Microsoft Active Directory allows you to configure trust relationships. For
      # example, you can establish a trust between your Managed Microsoft AD directory, and your existing
      # self-managed Microsoft Active Directory. This would allow you to provide users and groups access to
      # resources in either domain, with a single set of credentials. This action initiates the creation of
      # the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and
      # an external domain.

      struct CreateTrustRequest
        include JSON::Serializable

        # The Directory ID of the Managed Microsoft AD directory for which to establish the trust
        # relationship.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The Fully Qualified Domain Name (FQDN) of the external domain for which to create the trust
        # relationship.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String

        # The direction of the trust relationship.

        @[JSON::Field(key: "TrustDirection")]
        getter trust_direction : String

        # The trust password. The trust password must be the same password that was used when creating the
        # trust relationship on the external domain.

        @[JSON::Field(key: "TrustPassword")]
        getter trust_password : String

        # The IP addresses of the remote DNS server associated with RemoteDomainName.

        @[JSON::Field(key: "ConditionalForwarderIpAddrs")]
        getter conditional_forwarder_ip_addrs : Array(String)?

        # The IPv6 addresses of the remote DNS server associated with RemoteDomainName.

        @[JSON::Field(key: "ConditionalForwarderIpv6Addrs")]
        getter conditional_forwarder_ipv6_addrs : Array(String)?

        # Optional parameter to enable selective authentication for the trust.

        @[JSON::Field(key: "SelectiveAuth")]
        getter selective_auth : String?

        # The trust relationship type. Forest is the default.

        @[JSON::Field(key: "TrustType")]
        getter trust_type : String?

        def initialize(
          @directory_id : String,
          @remote_domain_name : String,
          @trust_direction : String,
          @trust_password : String,
          @conditional_forwarder_ip_addrs : Array(String)? = nil,
          @conditional_forwarder_ipv6_addrs : Array(String)? = nil,
          @selective_auth : String? = nil,
          @trust_type : String? = nil
        )
        end
      end

      # The result of a CreateTrust request.

      struct CreateTrustResult
        include JSON::Serializable

        # A unique identifier for the trust relationship that was created.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String?

        def initialize(
          @trust_id : String? = nil
        )
        end
      end


      struct DeleteADAssessmentRequest
        include JSON::Serializable

        # The unique identifier of the directory assessment to delete.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end


      struct DeleteADAssessmentResult
        include JSON::Serializable

        # The unique identifier of the deleted directory assessment.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        def initialize(
          @assessment_id : String? = nil
        )
        end
      end

      # Deletes a conditional forwarder.

      struct DeleteConditionalForwarderRequest
        include JSON::Serializable

        # The directory ID for which you are deleting the conditional forwarder.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The fully qualified domain name (FQDN) of the remote domain with which you are deleting the
        # conditional forwarder.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String

        def initialize(
          @directory_id : String,
          @remote_domain_name : String
        )
        end
      end

      # The result of a DeleteConditionalForwarder request.

      struct DeleteConditionalForwarderResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the DeleteDirectory operation.

      struct DeleteDirectoryRequest
        include JSON::Serializable

        # The identifier of the directory to delete.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end

      # Contains the results of the DeleteDirectory operation.

      struct DeleteDirectoryResult
        include JSON::Serializable

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end


      struct DeleteLogSubscriptionRequest
        include JSON::Serializable

        # Identifier of the directory whose log subscription you want to delete.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct DeleteLogSubscriptionResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the DeleteSnapshot operation.

      struct DeleteSnapshotRequest
        include JSON::Serializable

        # The identifier of the directory snapshot to be deleted.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        def initialize(
          @snapshot_id : String
        )
        end
      end

      # Contains the results of the DeleteSnapshot operation.

      struct DeleteSnapshotResult
        include JSON::Serializable

        # The identifier of the directory snapshot that was deleted.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        def initialize(
          @snapshot_id : String? = nil
        )
        end
      end

      # Deletes the local side of an existing trust relationship between the Managed Microsoft AD directory
      # and the external domain.

      struct DeleteTrustRequest
        include JSON::Serializable

        # The Trust ID of the trust relationship to be deleted.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String

        # Delete a conditional forwarder as part of a DeleteTrustRequest.

        @[JSON::Field(key: "DeleteAssociatedConditionalForwarder")]
        getter delete_associated_conditional_forwarder : Bool?

        def initialize(
          @trust_id : String,
          @delete_associated_conditional_forwarder : Bool? = nil
        )
        end
      end

      # The result of a DeleteTrust request.

      struct DeleteTrustResult
        include JSON::Serializable

        # The Trust ID of the trust relationship that was deleted.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String?

        def initialize(
          @trust_id : String? = nil
        )
        end
      end


      struct DeregisterCertificateRequest
        include JSON::Serializable

        # The identifier of the certificate.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @certificate_id : String,
          @directory_id : String
        )
        end
      end


      struct DeregisterCertificateResult
        include JSON::Serializable

        def initialize
        end
      end

      # Removes the specified directory as a publisher to the specified Amazon SNS topic.

      struct DeregisterEventTopicRequest
        include JSON::Serializable

        # The Directory ID to remove as a publisher. This directory will no longer send messages to the
        # specified Amazon SNS topic.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The name of the Amazon SNS topic from which to remove the directory as a publisher.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        def initialize(
          @directory_id : String,
          @topic_name : String
        )
        end
      end

      # The result of a DeregisterEventTopic request.

      struct DeregisterEventTopicResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeADAssessmentRequest
        include JSON::Serializable

        # The identifier of the directory assessment to describe.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String

        def initialize(
          @assessment_id : String
        )
        end
      end


      struct DescribeADAssessmentResult
        include JSON::Serializable

        # Detailed information about the self-managed instance settings (IDs and DNS IPs).

        @[JSON::Field(key: "Assessment")]
        getter assessment : Types::Assessment?

        # A list of assessment reports containing validation results for each domain controller and test
        # category. Each report includes specific validation details and outcomes.

        @[JSON::Field(key: "AssessmentReports")]
        getter assessment_reports : Array(Types::AssessmentReport)?

        def initialize(
          @assessment : Types::Assessment? = nil,
          @assessment_reports : Array(Types::AssessmentReport)? = nil
        )
        end
      end

      # Contains the inputs for the DescribeCAEnrollmentPolicy operation.

      struct DescribeCAEnrollmentPolicyRequest
        include JSON::Serializable

        # The identifier of the directory for which to retrieve the CA enrollment policy information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end

      # Contains the results of the DescribeCAEnrollmentPolicy operation.

      struct DescribeCAEnrollmentPolicyResult
        include JSON::Serializable

        # The current status of the CA enrollment policy. This indicates if automatic certificate enrollment
        # is currently active, inactive, or in a transitional state. Valid values: IN_PROGRESS - The policy is
        # being activated T SUCCESS - The policy is active and automatic certificate enrollment is operational
        # FAILED - The policy activation or deactivation failed DISABLING - The policy is being deactivated
        # DISABLED - The policy is inactive and automatic certificate enrollment is not available IMPAIRED -
        # Network connectivity is impaired.

        @[JSON::Field(key: "CaEnrollmentPolicyStatus")]
        getter ca_enrollment_policy_status : String?

        # Additional information explaining the current status of the CA enrollment policy, particularly
        # useful when the policy is in an error or transitional state.

        @[JSON::Field(key: "CaEnrollmentPolicyStatusReason")]
        getter ca_enrollment_policy_status_reason : String?

        # The identifier of the directory associated with this CA enrollment policy.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The date and time when the CA enrollment policy was last modified or updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Private Certificate Authority (PCA)
        # connector that is configured for automatic certificate enrollment in this directory.

        @[JSON::Field(key: "PcaConnectorArn")]
        getter pca_connector_arn : String?

        def initialize(
          @ca_enrollment_policy_status : String? = nil,
          @ca_enrollment_policy_status_reason : String? = nil,
          @directory_id : String? = nil,
          @last_updated_date_time : Time? = nil,
          @pca_connector_arn : String? = nil
        )
        end
      end


      struct DescribeCertificateRequest
        include JSON::Serializable

        # The identifier of the certificate.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @certificate_id : String,
          @directory_id : String
        )
        end
      end


      struct DescribeCertificateResult
        include JSON::Serializable

        # Information about the certificate, including registered date time, certificate state, the reason for
        # the state, expiration date time, and certificate common name.

        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::Certificate?

        def initialize(
          @certificate : Types::Certificate? = nil
        )
        end
      end


      struct DescribeClientAuthenticationSettingsRequest
        include JSON::Serializable

        # The identifier of the directory for which to retrieve information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The maximum number of items to return. If this value is zero, the maximum number of items is
        # specified by the limitations of the operation.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeClientAuthenticationSettingsResult.NextToken value from a previous call to
        # DescribeClientAuthenticationSettings . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of client authentication for which to retrieve information. If no type is specified, a list
        # of all client authentication types that are supported for the specified directory is retrieved.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeClientAuthenticationSettingsResult
        include JSON::Serializable

        # Information about the type of client authentication for the specified directory. The following
        # information is retrieved: The date and time when the status of the client authentication type was
        # last updated, whether the client authentication type is enabled or disabled, and the type of client
        # authentication.

        @[JSON::Field(key: "ClientAuthenticationSettingsInfo")]
        getter client_authentication_settings_info : Array(Types::ClientAuthenticationSettingInfo)?

        # The next token used to retrieve the client authentication settings if the number of setting types
        # exceeds page limit and there is another page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @client_authentication_settings_info : Array(Types::ClientAuthenticationSettingInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes a conditional forwarder.

      struct DescribeConditionalForwardersRequest
        include JSON::Serializable

        # The directory ID for which to get the list of associated conditional forwarders.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The fully qualified domain names (FQDN) of the remote domains for which to get the list of
        # associated conditional forwarders. If this member is null, all conditional forwarders are returned.

        @[JSON::Field(key: "RemoteDomainNames")]
        getter remote_domain_names : Array(String)?

        def initialize(
          @directory_id : String,
          @remote_domain_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeConditionalForwarder request.

      struct DescribeConditionalForwardersResult
        include JSON::Serializable

        # The list of conditional forwarders that have been created.

        @[JSON::Field(key: "ConditionalForwarders")]
        getter conditional_forwarders : Array(Types::ConditionalForwarder)?

        def initialize(
          @conditional_forwarders : Array(Types::ConditionalForwarder)? = nil
        )
        end
      end

      # Contains the inputs for the DescribeDirectories operation.

      struct DescribeDirectoriesRequest
        include JSON::Serializable

        # A list of identifiers of the directories for which to obtain the information. If this member is
        # null, all directories that belong to the current account are returned. An empty list results in an
        # InvalidParameterException being thrown.

        @[JSON::Field(key: "DirectoryIds")]
        getter directory_ids : Array(String)?

        # The maximum number of items to return. If this value is zero, the maximum number of items is
        # specified by the limitations of the operation.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeDirectoriesResult.NextToken value from a previous call to DescribeDirectories . Pass
        # null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the results of the DescribeDirectories operation.

      struct DescribeDirectoriesResult
        include JSON::Serializable

        # The list of available DirectoryDescription objects that were retrieved. It is possible that this
        # list contains less than the number of items specified in the Limit member of the request. This
        # occurs if there are less than the requested number of items left to retrieve, or if the limitations
        # of the operation have been exceeded.

        @[JSON::Field(key: "DirectoryDescriptions")]
        getter directory_descriptions : Array(Types::DirectoryDescription)?

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to DescribeDirectories to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_descriptions : Array(Types::DirectoryDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDirectoryDataAccessRequest
        include JSON::Serializable

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct DescribeDirectoryDataAccessResult
        include JSON::Serializable

        # The current status of data access through the Directory Service Data API.

        @[JSON::Field(key: "DataAccessStatus")]
        getter data_access_status : String?

        def initialize(
          @data_access_status : String? = nil
        )
        end
      end


      struct DescribeDomainControllersRequest
        include JSON::Serializable

        # Identifier of the directory for which to retrieve the domain controller information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # A list of identifiers for the domain controllers whose information will be provided.

        @[JSON::Field(key: "DomainControllerIds")]
        getter domain_controller_ids : Array(String)?

        # The maximum number of items to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeDomainControllers.NextToken value from a previous call to DescribeDomainControllers .
        # Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String,
          @domain_controller_ids : Array(String)? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeDomainControllersResult
        include JSON::Serializable

        # List of the DomainController objects that were retrieved.

        @[JSON::Field(key: "DomainControllers")]
        getter domain_controllers : Array(Types::DomainController)?

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to DescribeDomainControllers retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_controllers : Array(Types::DomainController)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes event topics.

      struct DescribeEventTopicsRequest
        include JSON::Serializable

        # The Directory ID for which to get the list of associated Amazon SNS topics. If this member is null,
        # associations for all Directory IDs are returned.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # A list of Amazon SNS topic names for which to obtain the information. If this member is null, all
        # associations for the specified Directory ID are returned. An empty list results in an
        # InvalidParameterException being thrown.

        @[JSON::Field(key: "TopicNames")]
        getter topic_names : Array(String)?

        def initialize(
          @directory_id : String? = nil,
          @topic_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeEventTopic request.

      struct DescribeEventTopicsResult
        include JSON::Serializable

        # A list of Amazon SNS topic names that receive status messages from the specified Directory ID.

        @[JSON::Field(key: "EventTopics")]
        getter event_topics : Array(Types::EventTopic)?

        def initialize(
          @event_topics : Array(Types::EventTopic)? = nil
        )
        end
      end


      struct DescribeHybridADUpdateRequest
        include JSON::Serializable

        # The identifier of the hybrid directory for which to retrieve update information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The pagination token from a previous request to DescribeHybridADUpdate . Pass null if this is the
        # first request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of update activities to retrieve. Valid values include SelfManagedInstances and
        # HybridAdministratorAccount .

        @[JSON::Field(key: "UpdateType")]
        getter update_type : String?

        def initialize(
          @directory_id : String,
          @next_token : String? = nil,
          @update_type : String? = nil
        )
        end
      end


      struct DescribeHybridADUpdateResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # request to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about update activities for the hybrid directory, organized by update type.

        @[JSON::Field(key: "UpdateActivities")]
        getter update_activities : Types::HybridUpdateActivities?

        def initialize(
          @next_token : String? = nil,
          @update_activities : Types::HybridUpdateActivities? = nil
        )
        end
      end


      struct DescribeLDAPSSettingsRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # Specifies the number of items that should be displayed on one page.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The type of next token used for pagination.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of LDAP security to enable. Currently only the value Client is supported.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct DescribeLDAPSSettingsResult
        include JSON::Serializable

        # Information about LDAP security for the specified directory, including status of enablement, state
        # last updated date time, and the reason for the state.

        @[JSON::Field(key: "LDAPSSettingsInfo")]
        getter ldaps_settings_info : Array(Types::LDAPSSettingInfo)?

        # The next token used to retrieve the LDAPS settings if the number of setting types exceeds page limit
        # and there is another page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ldaps_settings_info : Array(Types::LDAPSSettingInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRegionsRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The DescribeRegionsResult.NextToken value from a previous call to DescribeRegions . Pass null if
        # this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the Region. For example, us-east-1 .

        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        def initialize(
          @directory_id : String,
          @next_token : String? = nil,
          @region_name : String? = nil
        )
        end
      end


      struct DescribeRegionsResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to DescribeRegions to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of Region information related to the directory for each replicated Region.

        @[JSON::Field(key: "RegionsDescription")]
        getter regions_description : Array(Types::RegionDescription)?

        def initialize(
          @next_token : String? = nil,
          @regions_description : Array(Types::RegionDescription)? = nil
        )
        end
      end


      struct DescribeSettingsRequest
        include JSON::Serializable

        # The identifier of the directory for which to retrieve information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The DescribeSettingsResult.NextToken value from a previous call to DescribeSettings . Pass null if
        # this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of the directory settings for which to retrieve information.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @directory_id : String,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeSettingsResult
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # If not null, token that indicates that more results are available. Pass this value for the NextToken
        # parameter in a subsequent call to DescribeSettings to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of SettingEntry objects that were retrieved. It is possible that this list contains less
        # than the number of items specified in the Limit member of the request. This occurs if there are less
        # than the requested number of items left to retrieve, or if the limitations of the operation have
        # been exceeded.

        @[JSON::Field(key: "SettingEntries")]
        getter setting_entries : Array(Types::SettingEntry)?

        def initialize(
          @directory_id : String? = nil,
          @next_token : String? = nil,
          @setting_entries : Array(Types::SettingEntry)? = nil
        )
        end
      end


      struct DescribeSharedDirectoriesRequest
        include JSON::Serializable

        # Returns the identifier of the directory in the directory owner account.

        @[JSON::Field(key: "OwnerDirectoryId")]
        getter owner_directory_id : String

        # The number of shared directories to return in the response object.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeSharedDirectoriesResult.NextToken value from a previous call to
        # DescribeSharedDirectories . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of identifiers of all shared directories in your account.

        @[JSON::Field(key: "SharedDirectoryIds")]
        getter shared_directory_ids : Array(String)?

        def initialize(
          @owner_directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @shared_directory_ids : Array(String)? = nil
        )
        end
      end


      struct DescribeSharedDirectoriesResult
        include JSON::Serializable

        # If not null, token that indicates that more results are available. Pass this value for the NextToken
        # parameter in a subsequent call to DescribeSharedDirectories to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of all shared directories in your account.

        @[JSON::Field(key: "SharedDirectories")]
        getter shared_directories : Array(Types::SharedDirectory)?

        def initialize(
          @next_token : String? = nil,
          @shared_directories : Array(Types::SharedDirectory)? = nil
        )
        end
      end

      # Contains the inputs for the DescribeSnapshots operation.

      struct DescribeSnapshotsRequest
        include JSON::Serializable

        # The identifier of the directory for which to retrieve snapshot information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The maximum number of objects to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeSnapshotsResult.NextToken value from a previous call to DescribeSnapshots . Pass null if
        # this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of identifiers of the snapshots to obtain the information for. If this member is null or
        # empty, all snapshots are returned using the Limit and NextToken members.

        @[JSON::Field(key: "SnapshotIds")]
        getter snapshot_ids : Array(String)?

        def initialize(
          @directory_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @snapshot_ids : Array(String)? = nil
        )
        end
      end

      # Contains the results of the DescribeSnapshots operation.

      struct DescribeSnapshotsResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value in the NextToken member of a subsequent
        # call to DescribeSnapshots .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of Snapshot objects that were retrieved. It is possible that this list contains less than
        # the number of items specified in the Limit member of the request. This occurs if there are less than
        # the requested number of items left to retrieve, or if the limitations of the operation have been
        # exceeded.

        @[JSON::Field(key: "Snapshots")]
        getter snapshots : Array(Types::Snapshot)?

        def initialize(
          @next_token : String? = nil,
          @snapshots : Array(Types::Snapshot)? = nil
        )
        end
      end

      # Describes the trust relationships for a particular Managed Microsoft AD directory. If no input
      # parameters are provided, such as directory ID or trust ID, this request describes all the trust
      # relationships.

      struct DescribeTrustsRequest
        include JSON::Serializable

        # The Directory ID of the Amazon Web Services directory that is a part of the requested trust
        # relationship.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The maximum number of objects to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The DescribeTrustsResult.NextToken value from a previous call to DescribeTrusts . Pass null if this
        # is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of identifiers of the trust relationships for which to obtain the information. If this member
        # is null, all trust relationships that belong to the current account are returned. An empty list
        # results in an InvalidParameterException being thrown.

        @[JSON::Field(key: "TrustIds")]
        getter trust_ids : Array(String)?

        def initialize(
          @directory_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @trust_ids : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeTrust request.

      struct DescribeTrustsResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to DescribeTrusts to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of Trust objects that were retrieved. It is possible that this list contains less than the
        # number of items specified in the Limit member of the request. This occurs if there are less than the
        # requested number of items left to retrieve, or if the limitations of the operation have been
        # exceeded.

        @[JSON::Field(key: "Trusts")]
        getter trusts : Array(Types::Trust)?

        def initialize(
          @next_token : String? = nil,
          @trusts : Array(Types::Trust)? = nil
        )
        end
      end


      struct DescribeUpdateDirectoryRequest
        include JSON::Serializable

        # The unique identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of updates you want to describe for the directory.

        @[JSON::Field(key: "UpdateType")]
        getter update_type : String

        # The DescribeUpdateDirectoryResult . NextToken value from a previous call to DescribeUpdateDirectory
        # . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the Region.

        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        def initialize(
          @directory_id : String,
          @update_type : String,
          @next_token : String? = nil,
          @region_name : String? = nil
        )
        end
      end


      struct DescribeUpdateDirectoryResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value for the NextToken parameter.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of update activities on a directory for the requested update type.

        @[JSON::Field(key: "UpdateActivities")]
        getter update_activities : Array(Types::UpdateInfoEntry)?

        def initialize(
          @next_token : String? = nil,
          @update_activities : Array(Types::UpdateInfoEntry)? = nil
        )
        end
      end

      # The Region you specified is the same Region where the Managed Microsoft AD directory was created.
      # Specify a different Region and try again.

      struct DirectoryAlreadyInRegionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The specified directory has already been shared with this Amazon Web Services account.

      struct DirectoryAlreadySharedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains connection settings for creating an AD Connector with the ConnectDirectory action.

      struct DirectoryConnectSettings
        include JSON::Serializable

        # The user name of an account in your self-managed directory that is used to connect to the directory.
        # This account must have the following permissions: Read users and groups Create computer objects Join
        # computers to the domain

        @[JSON::Field(key: "CustomerUserName")]
        getter customer_user_name : String

        # A list of subnet identifiers in the VPC in which the AD Connector is created.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The identifier of the VPC in which the AD Connector is created.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # The IP addresses of DNS servers or domain controllers in your self-managed directory.

        @[JSON::Field(key: "CustomerDnsIps")]
        getter customer_dns_ips : Array(String)?

        # The IPv6 addresses of DNS servers or domain controllers in your self-managed directory.

        @[JSON::Field(key: "CustomerDnsIpsV6")]
        getter customer_dns_ips_v6 : Array(String)?

        def initialize(
          @customer_user_name : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @customer_dns_ips : Array(String)? = nil,
          @customer_dns_ips_v6 : Array(String)? = nil
        )
        end
      end

      # Contains information about an AD Connector directory.

      struct DirectoryConnectSettingsDescription
        include JSON::Serializable

        # The Availability Zones that the directory is in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The IP addresses of the AD Connector servers.

        @[JSON::Field(key: "ConnectIps")]
        getter connect_ips : Array(String)?

        # The IPv6 addresses of the AD Connector servers.

        @[JSON::Field(key: "ConnectIpsV6")]
        getter connect_ips_v6 : Array(String)?

        # The user name of the service account in your self-managed directory.

        @[JSON::Field(key: "CustomerUserName")]
        getter customer_user_name : String?

        # The security group identifier for the AD Connector directory.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        # A list of subnet identifiers in the VPC that the AD Connector is in.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC that the AD Connector is in.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @connect_ips : Array(String)? = nil,
          @connect_ips_v6 : Array(String)? = nil,
          @customer_user_name : String? = nil,
          @security_group_id : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Contains information about an Directory Service directory.

      struct DirectoryDescription
        include JSON::Serializable

        # The access URL for the directory, such as http://&lt;alias&gt;.awsapps.com . If no alias exists,
        # &lt;alias&gt; is the directory identifier, such as d-XXXXXXXXXX .

        @[JSON::Field(key: "AccessUrl")]
        getter access_url : String?

        # The alias for the directory. If no alias exists, the alias is the directory identifier, such as
        # d-XXXXXXXXXX .

        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # DirectoryConnectSettingsDescription object that contains additional information about an AD
        # Connector directory. Present only for AD Connector directories.

        @[JSON::Field(key: "ConnectSettings")]
        getter connect_settings : Types::DirectoryConnectSettingsDescription?

        # The description for the directory.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The desired number of domain controllers in the directory if the directory is Microsoft AD.

        @[JSON::Field(key: "DesiredNumberOfDomainControllers")]
        getter desired_number_of_domain_controllers : Int32?

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The IP addresses of the DNS servers for the directory. For a Simple AD or Microsoft AD directory,
        # these are the IP addresses of the Simple AD or Microsoft AD directory servers. For an AD Connector
        # directory, these are the IP addresses of self-managed directory to which the AD Connector is
        # connected.

        @[JSON::Field(key: "DnsIpAddrs")]
        getter dns_ip_addrs : Array(String)?

        # The IPv6 addresses of the DNS servers for the directory. For a Simple AD or Microsoft AD directory,
        # these are the IPv6 addresses of the Simple AD or Microsoft AD directory servers. For an AD Connector
        # directory, these are the IPv6 addresses of the DNS servers or domain controllers in your
        # self-managed directory to which the AD Connector is connected.

        @[JSON::Field(key: "DnsIpv6Addrs")]
        getter dns_ipv6_addrs : Array(String)?

        # The edition associated with this directory.

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # Contains information about the hybrid directory configuration for the directory, including Amazon
        # Web Services System Manager managed node identifiers and DNS IPs.

        @[JSON::Field(key: "HybridSettings")]
        getter hybrid_settings : Types::HybridSettingsDescription?

        # The date and time when the directory was created.

        @[JSON::Field(key: "LaunchTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter launch_time : Time?

        # The fully qualified name of the directory.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network type of the directory.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # The operating system (OS) version of the directory.

        @[JSON::Field(key: "OsVersion")]
        getter os_version : String?

        # Describes the Managed Microsoft AD directory in the directory owner account.

        @[JSON::Field(key: "OwnerDirectoryDescription")]
        getter owner_directory_description : Types::OwnerDirectoryDescription?

        # Information about the RadiusSettings object configured for this directory.

        @[JSON::Field(key: "RadiusSettings")]
        getter radius_settings : Types::RadiusSettings?

        # The status of the RADIUS MFA server connection.

        @[JSON::Field(key: "RadiusStatus")]
        getter radius_status : String?

        # Lists the Regions where the directory has replicated.

        @[JSON::Field(key: "RegionsInfo")]
        getter regions_info : Types::RegionsInfo?

        # The method used when sharing a directory to determine whether the directory should be shared within
        # your Amazon Web Services organization ( ORGANIZATIONS ) or with any Amazon Web Services account by
        # sending a shared directory request ( HANDSHAKE ).

        @[JSON::Field(key: "ShareMethod")]
        getter share_method : String?

        # A directory share request that is sent by the directory owner to the directory consumer. The request
        # includes a typed message to help the directory consumer administrator determine whether to approve
        # or reject the share invitation.

        @[JSON::Field(key: "ShareNotes")]
        getter share_notes : String?

        # Current directory status of the shared Managed Microsoft AD directory.

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # The short name of the directory.

        @[JSON::Field(key: "ShortName")]
        getter short_name : String?

        # The directory size.

        @[JSON::Field(key: "Size")]
        getter size : String?

        # Indicates whether single sign-on is enabled for the directory. For more information, see EnableSso
        # and DisableSso .

        @[JSON::Field(key: "SsoEnabled")]
        getter sso_enabled : Bool?

        # The current stage of the directory.

        @[JSON::Field(key: "Stage")]
        getter stage : String?

        # The date and time when the stage was last updated.

        @[JSON::Field(key: "StageLastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stage_last_updated_date_time : Time?

        # Additional information about the directory stage.

        @[JSON::Field(key: "StageReason")]
        getter stage_reason : String?

        # The directory type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # A DirectoryVpcSettingsDescription object that contains additional information about a directory.
        # Present only for Simple AD and Managed Microsoft AD directories.

        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettingsDescription?

        def initialize(
          @access_url : String? = nil,
          @alias : String? = nil,
          @connect_settings : Types::DirectoryConnectSettingsDescription? = nil,
          @description : String? = nil,
          @desired_number_of_domain_controllers : Int32? = nil,
          @directory_id : String? = nil,
          @dns_ip_addrs : Array(String)? = nil,
          @dns_ipv6_addrs : Array(String)? = nil,
          @edition : String? = nil,
          @hybrid_settings : Types::HybridSettingsDescription? = nil,
          @launch_time : Time? = nil,
          @name : String? = nil,
          @network_type : String? = nil,
          @os_version : String? = nil,
          @owner_directory_description : Types::OwnerDirectoryDescription? = nil,
          @radius_settings : Types::RadiusSettings? = nil,
          @radius_status : String? = nil,
          @regions_info : Types::RegionsInfo? = nil,
          @share_method : String? = nil,
          @share_notes : String? = nil,
          @share_status : String? = nil,
          @short_name : String? = nil,
          @size : String? = nil,
          @sso_enabled : Bool? = nil,
          @stage : String? = nil,
          @stage_last_updated_date_time : Time? = nil,
          @stage_reason : String? = nil,
          @type : String? = nil,
          @vpc_settings : Types::DirectoryVpcSettingsDescription? = nil
        )
        end
      end

      # The specified directory does not exist in the system.

      struct DirectoryDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The directory is already updated to desired update type settings.

      struct DirectoryInDesiredStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The maximum number of directories in the region has been reached. You can use the GetDirectoryLimits
      # operation to determine your directory limits in the region.

      struct DirectoryLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains directory limit information for a Region.

      struct DirectoryLimits
        include JSON::Serializable

        # The current number of cloud directories in the Region.

        @[JSON::Field(key: "CloudOnlyDirectoriesCurrentCount")]
        getter cloud_only_directories_current_count : Int32?

        # The maximum number of cloud directories allowed in the Region.

        @[JSON::Field(key: "CloudOnlyDirectoriesLimit")]
        getter cloud_only_directories_limit : Int32?

        # Indicates if the cloud directory limit has been reached.

        @[JSON::Field(key: "CloudOnlyDirectoriesLimitReached")]
        getter cloud_only_directories_limit_reached : Bool?

        # The current number of Managed Microsoft AD directories in the region.

        @[JSON::Field(key: "CloudOnlyMicrosoftADCurrentCount")]
        getter cloud_only_microsoft_ad_current_count : Int32?

        # The maximum number of Managed Microsoft AD directories allowed in the region.

        @[JSON::Field(key: "CloudOnlyMicrosoftADLimit")]
        getter cloud_only_microsoft_ad_limit : Int32?

        # Indicates if the Managed Microsoft AD directory limit has been reached.

        @[JSON::Field(key: "CloudOnlyMicrosoftADLimitReached")]
        getter cloud_only_microsoft_ad_limit_reached : Bool?

        # The current number of connected directories in the Region.

        @[JSON::Field(key: "ConnectedDirectoriesCurrentCount")]
        getter connected_directories_current_count : Int32?

        # The maximum number of connected directories allowed in the Region.

        @[JSON::Field(key: "ConnectedDirectoriesLimit")]
        getter connected_directories_limit : Int32?

        # Indicates if the connected directory limit has been reached.

        @[JSON::Field(key: "ConnectedDirectoriesLimitReached")]
        getter connected_directories_limit_reached : Bool?

        def initialize(
          @cloud_only_directories_current_count : Int32? = nil,
          @cloud_only_directories_limit : Int32? = nil,
          @cloud_only_directories_limit_reached : Bool? = nil,
          @cloud_only_microsoft_ad_current_count : Int32? = nil,
          @cloud_only_microsoft_ad_limit : Int32? = nil,
          @cloud_only_microsoft_ad_limit_reached : Bool? = nil,
          @connected_directories_current_count : Int32? = nil,
          @connected_directories_limit : Int32? = nil,
          @connected_directories_limit_reached : Bool? = nil
        )
        end
      end

      # The specified directory has not been shared with this Amazon Web Services account.

      struct DirectoryNotSharedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains the directory size configuration for update operations.

      struct DirectorySizeUpdateSettings
        include JSON::Serializable

        # The target directory size for the update operation.

        @[JSON::Field(key: "DirectorySize")]
        getter directory_size : String?

        def initialize(
          @directory_size : String? = nil
        )
        end
      end

      # The specified directory is unavailable.

      struct DirectoryUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains VPC information for the CreateDirectory , CreateMicrosoftAD , or CreateHybridAD operation.

      struct DirectoryVpcSettings
        include JSON::Serializable

        # The identifiers of the subnets for the directory servers. The two subnets must be in different
        # Availability Zones. Directory Service creates a directory server and a DNS server in each of these
        # subnets.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        # The identifier of the VPC in which to create the directory.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        def initialize(
          @subnet_ids : Array(String),
          @vpc_id : String
        )
        end
      end

      # Contains information about the directory.

      struct DirectoryVpcSettingsDescription
        include JSON::Serializable

        # The list of Availability Zones that the directory is in.

        @[JSON::Field(key: "AvailabilityZones")]
        getter availability_zones : Array(String)?

        # The domain controller security group identifier for the directory.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        # The identifiers of the subnets for the directory servers.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC that the directory is in.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zones : Array(String)? = nil,
          @security_group_id : String? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # A disable operation for CA enrollment policy is already in progress for this directory.

      struct DisableAlreadyInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains the inputs for the DisableCAEnrollmentPolicy operation.

      struct DisableCAEnrollmentPolicyRequest
        include JSON::Serializable

        # The identifier of the directory for which to disable the CA enrollment policy.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end

      # Contains the results of the DisableCAEnrollmentPolicy operation.

      struct DisableCAEnrollmentPolicyResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableClientAuthenticationRequest
        include JSON::Serializable

        # The identifier of the directory

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of client authentication to disable. Currently the only parameter "SmartCard" is supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @directory_id : String,
          @type : String
        )
        end
      end


      struct DisableClientAuthenticationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableDirectoryDataAccessRequest
        include JSON::Serializable

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct DisableDirectoryDataAccessResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DisableLDAPSRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of LDAP security to enable. Currently only the value Client is supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @directory_id : String,
          @type : String
        )
        end
      end


      struct DisableLDAPSResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the DisableRadius operation.

      struct DisableRadiusRequest
        include JSON::Serializable

        # The identifier of the directory for which to disable MFA.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end

      # Contains the results of the DisableRadius operation.

      struct DisableRadiusResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the DisableSso operation.

      struct DisableSsoRequest
        include JSON::Serializable

        # The identifier of the directory for which to disable single-sign on.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The password of an alternate account to use to disable single-sign on. This is only used for AD
        # Connector directories. For more information, see the UserName parameter.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The username of an alternate account to use to disable single-sign on. This is only used for AD
        # Connector directories. This account must have privileges to remove a service principal name. If the
        # AD Connector service account does not have privileges to remove a service principal name, you can
        # specify an alternate account with the UserName and Password parameters. These credentials are only
        # used to disable single sign-on and are not stored by the service. The AD Connector service account
        # is not changed.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @directory_id : String,
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the results of the DisableSso operation.

      struct DisableSsoResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about the domain controllers for a specified directory.

      struct DomainController
        include JSON::Serializable

        # The Availability Zone where the domain controller is located.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Identifier of the directory where the domain controller resides.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The IP address of the domain controller.

        @[JSON::Field(key: "DnsIpAddr")]
        getter dns_ip_addr : String?

        # The IPv6 address of the domain controller.

        @[JSON::Field(key: "DnsIpv6Addr")]
        getter dns_ipv6_addr : String?

        # Identifies a specific domain controller in the directory.

        @[JSON::Field(key: "DomainControllerId")]
        getter domain_controller_id : String?

        # Specifies when the domain controller was created.

        @[JSON::Field(key: "LaunchTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter launch_time : Time?

        # The status of the domain controller.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time that the status was last updated.

        @[JSON::Field(key: "StatusLastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter status_last_updated_date_time : Time?

        # A description of the domain controller state.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        # Identifier of the subnet in the VPC that contains the domain controller.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The identifier of the VPC that contains the domain controller.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @directory_id : String? = nil,
          @dns_ip_addr : String? = nil,
          @dns_ipv6_addr : String? = nil,
          @domain_controller_id : String? = nil,
          @launch_time : Time? = nil,
          @status : String? = nil,
          @status_last_updated_date_time : Time? = nil,
          @status_reason : String? = nil,
          @subnet_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The maximum allowed number of domain controllers per directory was exceeded. The default limit per
      # directory is 20 domain controllers.

      struct DomainControllerLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # An enable operation for CA enrollment policy is already in progress for this directory.

      struct EnableAlreadyInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains the inputs for the EnableCAEnrollmentPolicy operation.

      struct EnableCAEnrollmentPolicyRequest
        include JSON::Serializable

        # The identifier of the directory for which to enable the CA enrollment policy.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The Amazon Resource Name (ARN) of the Private Certificate Authority (PCA) connector to use for
        # automatic certificate enrollment. This connector must be properly configured and accessible from the
        # directory. The ARN format is: arn:aws:pca-connector-ad: region : account-id :connector/ connector-id

        @[JSON::Field(key: "PcaConnectorArn")]
        getter pca_connector_arn : String

        def initialize(
          @directory_id : String,
          @pca_connector_arn : String
        )
        end
      end

      # Contains the results of the EnableCAEnrollmentPolicy operation.

      struct EnableCAEnrollmentPolicyResult
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableClientAuthenticationRequest
        include JSON::Serializable

        # The identifier of the specified directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of client authentication to enable. Currently only the value SmartCard is supported. Smart
        # card authentication in AD Connector requires that you enable Kerberos Constrained Delegation for the
        # Service User to the LDAP service in your self-managed AD.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @directory_id : String,
          @type : String
        )
        end
      end


      struct EnableClientAuthenticationResult
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableDirectoryDataAccessRequest
        include JSON::Serializable

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct EnableDirectoryDataAccessResult
        include JSON::Serializable

        def initialize
        end
      end


      struct EnableLDAPSRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of LDAP security to enable. Currently only the value Client is supported.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @directory_id : String,
          @type : String
        )
        end
      end


      struct EnableLDAPSResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the EnableRadius operation.

      struct EnableRadiusRequest
        include JSON::Serializable

        # The identifier of the directory for which to enable MFA.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # A RadiusSettings object that contains information about the RADIUS server.

        @[JSON::Field(key: "RadiusSettings")]
        getter radius_settings : Types::RadiusSettings

        def initialize(
          @directory_id : String,
          @radius_settings : Types::RadiusSettings
        )
        end
      end

      # Contains the results of the EnableRadius operation.

      struct EnableRadiusResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the EnableSso operation.

      struct EnableSsoRequest
        include JSON::Serializable

        # The identifier of the directory for which to enable single-sign on.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The password of an alternate account to use to enable single-sign on. This is only used for AD
        # Connector directories. For more information, see the UserName parameter.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The username of an alternate account to use to enable single-sign on. This is only used for AD
        # Connector directories. This account must have privileges to add a service principal name. If the AD
        # Connector service account does not have privileges to add a service principal name, you can specify
        # an alternate account with the UserName and Password parameters. These credentials are only used to
        # enable single sign-on and are not stored by the service. The AD Connector service account is not
        # changed.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @directory_id : String,
          @password : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Contains the results of the EnableSso operation.

      struct EnableSsoResult
        include JSON::Serializable

        def initialize
        end
      end

      # The specified entity already exists.

      struct EntityAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The specified entity could not be found.

      struct EntityDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Information about Amazon SNS topic and Directory Service directory associations.

      struct EventTopic
        include JSON::Serializable

        # The date and time of when you associated your directory with the Amazon SNS topic.

        @[JSON::Field(key: "CreatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date_time : Time?

        # The Directory ID of an Directory Service directory that will publish status messages to an Amazon
        # SNS topic.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The topic registration status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon SNS topic ARN (Amazon Resource Name).

        @[JSON::Field(key: "TopicArn")]
        getter topic_arn : String?

        # The name of an Amazon SNS topic the receives status messages from the directory.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String?

        def initialize(
          @created_date_time : Time? = nil,
          @directory_id : String? = nil,
          @status : String? = nil,
          @topic_arn : String? = nil,
          @topic_name : String? = nil
        )
        end
      end

      # Contains the inputs for the GetDirectoryLimits operation.

      struct GetDirectoryLimitsRequest
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the results of the GetDirectoryLimits operation.

      struct GetDirectoryLimitsResult
        include JSON::Serializable

        # A DirectoryLimits object that contains the directory limits for the current Region.

        @[JSON::Field(key: "DirectoryLimits")]
        getter directory_limits : Types::DirectoryLimits?

        def initialize(
          @directory_limits : Types::DirectoryLimits? = nil
        )
        end
      end

      # Contains the inputs for the GetSnapshotLimits operation.

      struct GetSnapshotLimitsRequest
        include JSON::Serializable

        # Contains the identifier of the directory to obtain the limits for.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end

      # Contains the results of the GetSnapshotLimits operation.

      struct GetSnapshotLimitsResult
        include JSON::Serializable

        # A SnapshotLimits object that contains the manual snapshot limits for the specified directory.

        @[JSON::Field(key: "SnapshotLimits")]
        getter snapshot_limits : Types::SnapshotLimits?

        def initialize(
          @snapshot_limits : Types::SnapshotLimits? = nil
        )
        end
      end

      # Use to recover to the hybrid directory administrator account credentials.

      struct HybridAdministratorAccountUpdate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that contains the
        # credentials for the AD administrator user, and enables hybrid domain controllers to join the managed
        # AD domain. For example:
        # {"customerAdAdminDomainUsername":"carlos_salazar","customerAdAdminDomainPassword":"ExamplePassword123!"}.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        def initialize(
          @secret_arn : String
        )
        end
      end

      # Contains configuration settings for self-managed instances with SSM used in hybrid directory
      # operations.

      struct HybridCustomerInstancesSettings
        include JSON::Serializable

        # The IP addresses of the DNS servers or domain controllers in your self-managed AD environment.

        @[JSON::Field(key: "CustomerDnsIps")]
        getter customer_dns_ips : Array(String)

        # The identifiers of the self-managed instances with SSM used in hybrid directory.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)

        def initialize(
          @customer_dns_ips : Array(String),
          @instance_ids : Array(String)
        )
        end
      end

      # Describes the current hybrid directory configuration settings for a directory.

      struct HybridSettingsDescription
        include JSON::Serializable

        # The IP addresses of the DNS servers in your self-managed AD environment.

        @[JSON::Field(key: "SelfManagedDnsIpAddrs")]
        getter self_managed_dns_ip_addrs : Array(String)?

        # The identifiers of the self-managed instances with SSM used for hybrid directory operations.

        @[JSON::Field(key: "SelfManagedInstanceIds")]
        getter self_managed_instance_ids : Array(String)?

        def initialize(
          @self_managed_dns_ip_addrs : Array(String)? = nil,
          @self_managed_instance_ids : Array(String)? = nil
        )
        end
      end

      # Contains information about update activities for different components of a hybrid directory.

      struct HybridUpdateActivities
        include JSON::Serializable

        # A list of update activities related to hybrid directory administrator account changes.

        @[JSON::Field(key: "HybridAdministratorAccount")]
        getter hybrid_administrator_account : Array(Types::HybridUpdateInfoEntry)?

        # A list of update activities related to the self-managed instances with SSM in the self-managed
        # instances with SSM hybrid directory configuration.

        @[JSON::Field(key: "SelfManagedInstances")]
        getter self_managed_instances : Array(Types::HybridUpdateInfoEntry)?

        def initialize(
          @hybrid_administrator_account : Array(Types::HybridUpdateInfoEntry)? = nil,
          @self_managed_instances : Array(Types::HybridUpdateInfoEntry)? = nil
        )
        end
      end

      # Contains detailed information about a specific update activity for a hybrid directory component.

      struct HybridUpdateInfoEntry
        include JSON::Serializable

        # The identifier of the assessment performed to validate this update configuration.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        # Specifies if the update was initiated by the customer or Amazon Web Services.

        @[JSON::Field(key: "InitiatedBy")]
        getter initiated_by : String?

        # The date and time when the update activity status was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The new configuration values being applied in this update.

        @[JSON::Field(key: "NewValue")]
        getter new_value : Types::HybridUpdateValue?

        # The previous configuration values before this update was applied.

        @[JSON::Field(key: "PreviousValue")]
        getter previous_value : Types::HybridUpdateValue?

        # The date and time when the update activity was initiated.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current status of the update activity. Valid values include UPDATED , UPDATING , and
        # UPDATE_FAILED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A human-readable description of the update status, including any error details or progress
        # information.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @assessment_id : String? = nil,
          @initiated_by : String? = nil,
          @last_updated_date_time : Time? = nil,
          @new_value : Types::HybridUpdateValue? = nil,
          @previous_value : Types::HybridUpdateValue? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Contains the configuration values for a hybrid directory update, including Amazon Web Services
      # System Manager managed node and DNS information.

      struct HybridUpdateValue
        include JSON::Serializable

        # The IP addresses of the DNS servers or domain controllers in the hybrid directory configuration.

        @[JSON::Field(key: "DnsIps")]
        getter dns_ips : Array(String)?

        # The identifiers of the self-managed instances with SSM in the hybrid directory configuration.

        @[JSON::Field(key: "InstanceIds")]
        getter instance_ids : Array(String)?

        def initialize(
          @dns_ips : Array(String)? = nil,
          @instance_ids : Array(String)? = nil
        )
        end
      end

      # The specified directory setting is not compatible with other settings.

      struct IncompatibleSettingsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The account does not have sufficient permission to perform the operation.

      struct InsufficientPermissionsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The certificate PEM that was provided has incorrect encoding.

      struct InvalidCertificateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Client authentication is already enabled.

      struct InvalidClientAuthStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The LDAP activities could not be performed because they are limited by the LDAPS status.

      struct InvalidLDAPSStatusException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The NextToken value is not valid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # One or more parameters are not valid.

      struct InvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The new password provided by the user does not meet the password complexity requirements defined in
      # your directory.

      struct InvalidPasswordException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The specified shared target is not valid.

      struct InvalidTargetException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains the IP address block. This is often the address block of the DNS server used for your
      # self-managed domain.

      struct IpRoute
        include JSON::Serializable

        # IP address block in CIDR format, such as 10.0.0.0/24. This is often the address block of the DNS
        # server used for your self-managed domain. For a single IP address, use a CIDR address block with
        # /32. For example, 10.0.0.0/32.

        @[JSON::Field(key: "CidrIp")]
        getter cidr_ip : String?

        # IPv6 address block in CIDR format, such as 2001:db8::/32. This is often the address block of the DNS
        # server used for your self-managed domain. For a single IPv6 address, use a CIDR address block with
        # /128. For example, 2001:db8::1/128.

        @[JSON::Field(key: "CidrIpv6")]
        getter cidr_ipv6 : String?

        # Description of the address block.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @cidr_ip : String? = nil,
          @cidr_ipv6 : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Information about one or more IP address blocks.

      struct IpRouteInfo
        include JSON::Serializable

        # The date and time the address block was added to the directory.

        @[JSON::Field(key: "AddedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter added_date_time : Time?

        # IP address block in the IpRoute .

        @[JSON::Field(key: "CidrIp")]
        getter cidr_ip : String?

        # IPv6 address block in the IpRoute .

        @[JSON::Field(key: "CidrIpv6")]
        getter cidr_ipv6 : String?

        # Description of the IpRouteInfo .

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Identifier (ID) of the directory associated with the IP addresses.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The status of the IP address block.

        @[JSON::Field(key: "IpRouteStatusMsg")]
        getter ip_route_status_msg : String?

        # The reason for the IpRouteStatusMsg.

        @[JSON::Field(key: "IpRouteStatusReason")]
        getter ip_route_status_reason : String?

        def initialize(
          @added_date_time : Time? = nil,
          @cidr_ip : String? = nil,
          @cidr_ipv6 : String? = nil,
          @description : String? = nil,
          @directory_id : String? = nil,
          @ip_route_status_msg : String? = nil,
          @ip_route_status_reason : String? = nil
        )
        end
      end

      # The maximum allowed number of IP addresses was exceeded. The default limit is 100 IP address blocks.

      struct IpRouteLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains general information about the LDAPS settings.

      struct LDAPSSettingInfo
        include JSON::Serializable

        # The state of the LDAPS settings.

        @[JSON::Field(key: "LDAPSStatus")]
        getter ldaps_status : String?

        # Describes a state change for LDAPS.

        @[JSON::Field(key: "LDAPSStatusReason")]
        getter ldaps_status_reason : String?

        # The date and time when the LDAPS settings were last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        def initialize(
          @ldaps_status : String? = nil,
          @ldaps_status_reason : String? = nil,
          @last_updated_date_time : Time? = nil
        )
        end
      end


      struct ListADAssessmentsRequest
        include JSON::Serializable

        # The identifier of the directory for which to list assessments. If not specified, all assessments in
        # your account are returned.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The maximum number of assessment summaries to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The pagination token from a previous request to ListADAssessments . Pass null if this is the first
        # request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListADAssessmentsResult
        include JSON::Serializable

        # A list of assessment summaries containing basic information about each directory assessment.

        @[JSON::Field(key: "Assessments")]
        getter assessments : Array(Types::AssessmentSummary)?

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # request to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assessments : Array(Types::AssessmentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCertificatesRequest
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The number of items that should show up on one page

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A token for requesting another page of certificates if the NextToken response element indicates that
        # more certificates are available. Use the value of the returned NextToken element in your request
        # until the token comes back as null . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCertificatesResult
        include JSON::Serializable

        # A list of certificates with basic details including certificate ID, certificate common name,
        # certificate state.

        @[JSON::Field(key: "CertificatesInfo")]
        getter certificates_info : Array(Types::CertificateInfo)?

        # Indicates whether another page of certificates is available when the number of available
        # certificates exceeds the page limit.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificates_info : Array(Types::CertificateInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIpRoutesRequest
        include JSON::Serializable

        # Identifier (ID) of the directory for which you want to retrieve the IP addresses.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # Maximum number of items to return. If this value is zero, the maximum number of items is specified
        # by the limitations of the operation.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The ListIpRoutes.NextToken value from a previous call to ListIpRoutes . Pass null if this is the
        # first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIpRoutesResult
        include JSON::Serializable

        # A list of IpRoute s.

        @[JSON::Field(key: "IpRoutesInfo")]
        getter ip_routes_info : Array(Types::IpRouteInfo)?

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to ListIpRoutes to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @ip_routes_info : Array(Types::IpRouteInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLogSubscriptionsRequest
        include JSON::Serializable

        # If a DirectoryID is provided, lists only the log subscription associated with that directory. If no
        # DirectoryId is provided, lists all log subscriptions associated with your Amazon Web Services
        # account. If there are no log subscriptions for the Amazon Web Services account or the directory, an
        # empty list will be returned.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The maximum number of items returned.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The token for the next set of items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLogSubscriptionsResult
        include JSON::Serializable

        # A list of active LogSubscription objects for calling the Amazon Web Services account.

        @[JSON::Field(key: "LogSubscriptions")]
        getter log_subscriptions : Array(Types::LogSubscription)?

        # The token for the next set of items to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @log_subscriptions : Array(Types::LogSubscription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemaExtensionsRequest
        include JSON::Serializable

        # The identifier of the directory from which to retrieve the schema extension information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The maximum number of items to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The ListSchemaExtensions.NextToken value from a previous call to ListSchemaExtensions . Pass null if
        # this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemaExtensionsResult
        include JSON::Serializable

        # If not null, more results are available. Pass this value for the NextToken parameter in a subsequent
        # call to ListSchemaExtensions to retrieve the next set of items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the schema extensions applied to the directory.

        @[JSON::Field(key: "SchemaExtensionsInfo")]
        getter schema_extensions_info : Array(Types::SchemaExtensionInfo)?

        def initialize(
          @next_token : String? = nil,
          @schema_extensions_info : Array(Types::SchemaExtensionInfo)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Identifier (ID) of the directory for which you want to retrieve tags.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Reserved for future use.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_id : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # Reserved for future use.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of tags returned by the ListTagsForResource operation.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents a log subscription, which tracks real-time data from a chosen log group to a specified
      # destination.

      struct LogSubscription
        include JSON::Serializable

        # Identifier (ID) of the directory that you want to associate with the log subscription.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The name of the log group.

        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The date and time that the log subscription was created.

        @[JSON::Field(key: "SubscriptionCreatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter subscription_created_date_time : Time?

        def initialize(
          @directory_id : String? = nil,
          @log_group_name : String? = nil,
          @subscription_created_date_time : Time? = nil
        )
        end
      end

      # Contains the network configuration for directory update operations.

      struct NetworkUpdateSettings
        include JSON::Serializable

        # IPv6 addresses of DNS servers or domain controllers in the self-managed directory. Required only
        # when updating an AD Connector directory.

        @[JSON::Field(key: "CustomerDnsIpsV6")]
        getter customer_dns_ips_v6 : Array(String)?

        # The target network type for the directory update.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        def initialize(
          @customer_dns_ips_v6 : Array(String)? = nil,
          @network_type : String? = nil
        )
        end
      end

      # Client authentication setup could not be completed because at least one valid certificate must be
      # registered in the system.

      struct NoAvailableCertificateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # OS version that the directory needs to be updated to.

      struct OSUpdateSettings
        include JSON::Serializable

        # OS version that the directory needs to be updated to.

        @[JSON::Field(key: "OSVersion")]
        getter os_version : String?

        def initialize(
          @os_version : String? = nil
        )
        end
      end

      # Exception encountered while trying to access your Amazon Web Services organization.

      struct OrganizationsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains the directory owner account details shared with the directory consumer account.

      struct OwnerDirectoryDescription
        include JSON::Serializable

        # Identifier of the directory owner account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Identifier of the Managed Microsoft AD directory in the directory owner account.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # IP address of the directory’s domain controllers.

        @[JSON::Field(key: "DnsIpAddrs")]
        getter dns_ip_addrs : Array(String)?

        # IPv6 addresses of the directory’s domain controllers.

        @[JSON::Field(key: "DnsIpv6Addrs")]
        getter dns_ipv6_addrs : Array(String)?

        # Network type of the directory in the directory owner account.

        @[JSON::Field(key: "NetworkType")]
        getter network_type : String?

        # Information about the RadiusSettings object server configuration.

        @[JSON::Field(key: "RadiusSettings")]
        getter radius_settings : Types::RadiusSettings?

        # The status of the RADIUS server.

        @[JSON::Field(key: "RadiusStatus")]
        getter radius_status : String?

        # Information about the VPC settings for the directory.

        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettingsDescription?

        def initialize(
          @account_id : String? = nil,
          @directory_id : String? = nil,
          @dns_ip_addrs : Array(String)? = nil,
          @dns_ipv6_addrs : Array(String)? = nil,
          @network_type : String? = nil,
          @radius_settings : Types::RadiusSettings? = nil,
          @radius_status : String? = nil,
          @vpc_settings : Types::DirectoryVpcSettingsDescription? = nil
        )
        end
      end

      # Contains information about a Remote Authentication Dial In User Service (RADIUS) server.

      struct RadiusSettings
        include JSON::Serializable

        # The protocol specified for your RADIUS endpoints.

        @[JSON::Field(key: "AuthenticationProtocol")]
        getter authentication_protocol : String?

        # Not currently used.

        @[JSON::Field(key: "DisplayLabel")]
        getter display_label : String?

        # The port that your RADIUS server is using for communications. Your self-managed network must allow
        # inbound traffic over this port from the Directory Service servers.

        @[JSON::Field(key: "RadiusPort")]
        getter radius_port : Int32?

        # The maximum number of times that communication with the RADIUS server is retried after the initial
        # attempt.

        @[JSON::Field(key: "RadiusRetries")]
        getter radius_retries : Int32?

        # The fully qualified domain name (FQDN) or IP addresses of the RADIUS server endpoints, or the FQDN
        # or IP addresses of your RADIUS server load balancer.

        @[JSON::Field(key: "RadiusServers")]
        getter radius_servers : Array(String)?

        # The IPv6 addresses of the RADIUS server endpoints or RADIUS server load balancer.

        @[JSON::Field(key: "RadiusServersIpv6")]
        getter radius_servers_ipv6 : Array(String)?

        # The amount of time, in seconds, to wait for the RADIUS server to respond.

        @[JSON::Field(key: "RadiusTimeout")]
        getter radius_timeout : Int32?

        # Required for enabling RADIUS on the directory.

        @[JSON::Field(key: "SharedSecret")]
        getter shared_secret : String?

        # Not currently used.

        @[JSON::Field(key: "UseSameUsername")]
        getter use_same_username : Bool?

        def initialize(
          @authentication_protocol : String? = nil,
          @display_label : String? = nil,
          @radius_port : Int32? = nil,
          @radius_retries : Int32? = nil,
          @radius_servers : Array(String)? = nil,
          @radius_servers_ipv6 : Array(String)? = nil,
          @radius_timeout : Int32? = nil,
          @shared_secret : String? = nil,
          @use_same_username : Bool? = nil
        )
        end
      end

      # The replicated Region information for a directory.

      struct RegionDescription
        include JSON::Serializable

        # The desired number of domain controllers in the specified Region for the specified directory.

        @[JSON::Field(key: "DesiredNumberOfDomainControllers")]
        getter desired_number_of_domain_controllers : Int32?

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The date and time that the Region description was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Specifies when the Region replication began.

        @[JSON::Field(key: "LaunchTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter launch_time : Time?

        # The name of the Region. For example, us-east-1 .

        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        # Specifies whether the Region is the primary Region or an additional Region.

        @[JSON::Field(key: "RegionType")]
        getter region_type : String?

        # The status of the replication process for the specified Region.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time that the Region status was last updated.

        @[JSON::Field(key: "StatusLastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter status_last_updated_date_time : Time?


        @[JSON::Field(key: "VpcSettings")]
        getter vpc_settings : Types::DirectoryVpcSettings?

        def initialize(
          @desired_number_of_domain_controllers : Int32? = nil,
          @directory_id : String? = nil,
          @last_updated_date_time : Time? = nil,
          @launch_time : Time? = nil,
          @region_name : String? = nil,
          @region_type : String? = nil,
          @status : String? = nil,
          @status_last_updated_date_time : Time? = nil,
          @vpc_settings : Types::DirectoryVpcSettings? = nil
        )
        end
      end

      # You have reached the limit for maximum number of simultaneous Region replications per directory.

      struct RegionLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Provides information about the Regions that are configured for multi-Region replication.

      struct RegionsInfo
        include JSON::Serializable

        # Lists the Regions where the directory has been replicated, excluding the primary Region.

        @[JSON::Field(key: "AdditionalRegions")]
        getter additional_regions : Array(String)?

        # The Region where the Managed Microsoft AD directory was originally created.

        @[JSON::Field(key: "PrimaryRegion")]
        getter primary_region : String?

        def initialize(
          @additional_regions : Array(String)? = nil,
          @primary_region : String? = nil
        )
        end
      end


      struct RegisterCertificateRequest
        include JSON::Serializable

        # The certificate PEM string that needs to be registered.

        @[JSON::Field(key: "CertificateData")]
        getter certificate_data : String

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # A ClientCertAuthSettings object that contains client certificate authentication settings.

        @[JSON::Field(key: "ClientCertAuthSettings")]
        getter client_cert_auth_settings : Types::ClientCertAuthSettings?

        # The function that the registered certificate performs. Valid values include ClientLDAPS or
        # ClientCertAuth . The default value is ClientLDAPS .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @certificate_data : String,
          @directory_id : String,
          @client_cert_auth_settings : Types::ClientCertAuthSettings? = nil,
          @type : String? = nil
        )
        end
      end


      struct RegisterCertificateResult
        include JSON::Serializable

        # The identifier of the certificate.

        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        def initialize(
          @certificate_id : String? = nil
        )
        end
      end

      # Registers a new event topic.

      struct RegisterEventTopicRequest
        include JSON::Serializable

        # The Directory ID that will publish status messages to the Amazon SNS topic.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The Amazon SNS topic name to which the directory will publish status messages. This Amazon SNS topic
        # must be in the same region as the specified Directory ID.

        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        def initialize(
          @directory_id : String,
          @topic_name : String
        )
        end
      end

      # The result of a RegisterEventTopic request.

      struct RegisterEventTopicResult
        include JSON::Serializable

        def initialize
        end
      end


      struct RejectSharedDirectoryRequest
        include JSON::Serializable

        # Identifier of the shared directory in the directory consumer account. This identifier is different
        # for each directory owner account.

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String

        def initialize(
          @shared_directory_id : String
        )
        end
      end


      struct RejectSharedDirectoryResult
        include JSON::Serializable

        # Identifier of the shared directory in the directory consumer account.

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String?

        def initialize(
          @shared_directory_id : String? = nil
        )
        end
      end


      struct RemoveIpRoutesRequest
        include JSON::Serializable

        # Identifier (ID) of the directory from which you want to remove the IP addresses.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # IP address blocks that you want to remove.

        @[JSON::Field(key: "CidrIps")]
        getter cidr_ips : Array(String)?

        # IPv6 address blocks that you want to remove.

        @[JSON::Field(key: "CidrIpv6s")]
        getter cidr_ipv6s : Array(String)?

        def initialize(
          @directory_id : String,
          @cidr_ips : Array(String)? = nil,
          @cidr_ipv6s : Array(String)? = nil
        )
        end
      end


      struct RemoveIpRoutesResult
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveRegionRequest
        include JSON::Serializable

        # The identifier of the directory for which you want to remove Region replication.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @directory_id : String
        )
        end
      end


      struct RemoveRegionResult
        include JSON::Serializable

        def initialize
        end
      end


      struct RemoveTagsFromResourceRequest
        include JSON::Serializable

        # Identifier (ID) of the directory from which to remove the tag.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The tag key (name) of the tag to be removed.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_id : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct RemoveTagsFromResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct ResetUserPasswordRequest
        include JSON::Serializable

        # Identifier of the Managed Microsoft AD or Simple AD directory in which the user resides.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The new password that will be reset.

        @[JSON::Field(key: "NewPassword")]
        getter new_password : String

        # The user name of the user whose password will be reset.

        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @directory_id : String,
          @new_password : String,
          @user_name : String
        )
        end
      end


      struct ResetUserPasswordResult
        include JSON::Serializable

        def initialize
        end
      end

      # An object representing the inputs for the RestoreFromSnapshot operation.

      struct RestoreFromSnapshotRequest
        include JSON::Serializable

        # The identifier of the snapshot to restore from.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String

        def initialize(
          @snapshot_id : String
        )
        end
      end

      # Contains the results of the RestoreFromSnapshot operation.

      struct RestoreFromSnapshotResult
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a schema extension.

      struct SchemaExtensionInfo
        include JSON::Serializable

        # A description of the schema extension.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the directory to which the schema extension is applied.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The date and time that the schema extension was completed.

        @[JSON::Field(key: "EndDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_date_time : Time?

        # The identifier of the schema extension.

        @[JSON::Field(key: "SchemaExtensionId")]
        getter schema_extension_id : String?

        # The current status of the schema extension.

        @[JSON::Field(key: "SchemaExtensionStatus")]
        getter schema_extension_status : String?

        # The reason for the SchemaExtensionStatus .

        @[JSON::Field(key: "SchemaExtensionStatusReason")]
        getter schema_extension_status_reason : String?

        # The date and time that the schema extension started being applied to the directory.

        @[JSON::Field(key: "StartDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_date_time : Time?

        def initialize(
          @description : String? = nil,
          @directory_id : String? = nil,
          @end_date_time : Time? = nil,
          @schema_extension_id : String? = nil,
          @schema_extension_status : String? = nil,
          @schema_extension_status_reason : String? = nil,
          @start_date_time : Time? = nil
        )
        end
      end

      # An exception has occurred in Directory Service.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains information about the configurable settings for a directory.

      struct Setting
        include JSON::Serializable

        # The name of the directory setting. For example: TLS_1_0

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the directory setting for which to retrieve information. For example, for TLS_1_0 , the
        # valid values are: Enable and Disable .

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Contains information about the specified configurable setting for a directory.

      struct SettingEntry
        include JSON::Serializable

        # The valid range of values for the directory setting. These values depend on the DataType of your
        # directory.

        @[JSON::Field(key: "AllowedValues")]
        getter allowed_values : String?

        # The value of the directory setting that is applied to the directory.

        @[JSON::Field(key: "AppliedValue")]
        getter applied_value : String?

        # The data type of a directory setting. This is used to define the AllowedValues of a setting. For
        # example a data type can be Boolean , DurationInSeconds , or Enum .

        @[JSON::Field(key: "DataType")]
        getter data_type : String?

        # The date and time when the request to update a directory setting was last submitted.

        @[JSON::Field(key: "LastRequestedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_requested_date_time : Time?

        # The date and time when the directory setting was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The name of the directory setting. For example: TLS_1_0

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Details about the status of the request to update the directory setting. If the directory setting is
        # deployed in more than one region, status is returned for the request in each region where the
        # setting is deployed.

        @[JSON::Field(key: "RequestDetailedStatus")]
        getter request_detailed_status : Hash(String, String)?

        # The overall status of the request to update the directory setting request. If the directory setting
        # is deployed in more than one region, and the request fails in any region, the overall status is
        # Failed .

        @[JSON::Field(key: "RequestStatus")]
        getter request_status : String?

        # The last status message for the directory status request.

        @[JSON::Field(key: "RequestStatusMessage")]
        getter request_status_message : String?

        # The value that was last requested for the directory setting.

        @[JSON::Field(key: "RequestedValue")]
        getter requested_value : String?

        # The type, or category, of a directory setting. Similar settings have the same type. For example,
        # Protocol , Cipher , or Certificate-Based Authentication .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @allowed_values : String? = nil,
          @applied_value : String? = nil,
          @data_type : String? = nil,
          @last_requested_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @name : String? = nil,
          @request_detailed_status : Hash(String, String)? = nil,
          @request_status : String? = nil,
          @request_status_message : String? = nil,
          @requested_value : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ShareDirectoryRequest
        include JSON::Serializable

        # Identifier of the Managed Microsoft AD directory that you want to share with other Amazon Web
        # Services accounts.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The method used when sharing a directory to determine whether the directory should be shared within
        # your Amazon Web Services organization ( ORGANIZATIONS ) or with any Amazon Web Services account by
        # sending a directory sharing request ( HANDSHAKE ).

        @[JSON::Field(key: "ShareMethod")]
        getter share_method : String

        # Identifier for the directory consumer account with whom the directory is to be shared.

        @[JSON::Field(key: "ShareTarget")]
        getter share_target : Types::ShareTarget

        # A directory share request that is sent by the directory owner to the directory consumer. The request
        # includes a typed message to help the directory consumer administrator determine whether to approve
        # or reject the share invitation.

        @[JSON::Field(key: "ShareNotes")]
        getter share_notes : String?

        def initialize(
          @directory_id : String,
          @share_method : String,
          @share_target : Types::ShareTarget,
          @share_notes : String? = nil
        )
        end
      end


      struct ShareDirectoryResult
        include JSON::Serializable

        # Identifier of the directory that is stored in the directory consumer account that is shared from the
        # specified directory ( DirectoryId ).

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String?

        def initialize(
          @shared_directory_id : String? = nil
        )
        end
      end

      # The maximum number of Amazon Web Services accounts that you can share with this directory has been
      # reached.

      struct ShareLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Identifier that contains details about the directory consumer account.

      struct ShareTarget
        include JSON::Serializable

        # Identifier of the directory consumer account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Type of identifier to be used in the Id field.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # Details about the shared directory in the directory owner account for which the share request in the
      # directory consumer account has been accepted.

      struct SharedDirectory
        include JSON::Serializable

        # The date and time that the shared directory was created.

        @[JSON::Field(key: "CreatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date_time : Time?

        # The date and time that the shared directory was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # Identifier of the directory owner account, which contains the directory that has been shared to the
        # consumer account.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # Identifier of the directory in the directory owner account.

        @[JSON::Field(key: "OwnerDirectoryId")]
        getter owner_directory_id : String?

        # The method used when sharing a directory to determine whether the directory should be shared within
        # your Amazon Web Services organization ( ORGANIZATIONS ) or with any Amazon Web Services account by
        # sending a shared directory request ( HANDSHAKE ).

        @[JSON::Field(key: "ShareMethod")]
        getter share_method : String?

        # A directory share request that is sent by the directory owner to the directory consumer. The request
        # includes a typed message to help the directory consumer administrator determine whether to approve
        # or reject the share invitation.

        @[JSON::Field(key: "ShareNotes")]
        getter share_notes : String?

        # Current directory status of the shared Managed Microsoft AD directory.

        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # Identifier of the directory consumer account that has access to the shared directory (
        # OwnerDirectoryId ) in the directory owner account.

        @[JSON::Field(key: "SharedAccountId")]
        getter shared_account_id : String?

        # Identifier of the shared directory in the directory consumer account. This identifier is different
        # for each directory owner account.

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String?

        def initialize(
          @created_date_time : Time? = nil,
          @last_updated_date_time : Time? = nil,
          @owner_account_id : String? = nil,
          @owner_directory_id : String? = nil,
          @share_method : String? = nil,
          @share_notes : String? = nil,
          @share_status : String? = nil,
          @shared_account_id : String? = nil,
          @shared_directory_id : String? = nil
        )
        end
      end

      # Describes a directory snapshot.

      struct Snapshot
        include JSON::Serializable

        # The directory identifier.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The descriptive name of the snapshot.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The snapshot identifier.

        @[JSON::Field(key: "SnapshotId")]
        getter snapshot_id : String?

        # The date and time that the snapshot was taken.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The snapshot status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The snapshot type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @directory_id : String? = nil,
          @name : String? = nil,
          @snapshot_id : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The maximum number of manual snapshots for the directory has been reached. You can use the
      # GetSnapshotLimits operation to determine the snapshot limits for a directory.

      struct SnapshotLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Contains manual snapshot limit information for a directory.

      struct SnapshotLimits
        include JSON::Serializable

        # The current number of manual snapshots of the directory.

        @[JSON::Field(key: "ManualSnapshotsCurrentCount")]
        getter manual_snapshots_current_count : Int32?

        # The maximum number of manual snapshots allowed.

        @[JSON::Field(key: "ManualSnapshotsLimit")]
        getter manual_snapshots_limit : Int32?

        # Indicates if the manual snapshot limit has been reached.

        @[JSON::Field(key: "ManualSnapshotsLimitReached")]
        getter manual_snapshots_limit_reached : Bool?

        def initialize(
          @manual_snapshots_current_count : Int32? = nil,
          @manual_snapshots_limit : Int32? = nil,
          @manual_snapshots_limit_reached : Bool? = nil
        )
        end
      end


      struct StartADAssessmentRequest
        include JSON::Serializable

        # Configuration parameters for the directory assessment, including DNS server information, domain
        # name, Amazon VPC subnet, and Amazon Web Services System Manager managed node details.

        @[JSON::Field(key: "AssessmentConfiguration")]
        getter assessment_configuration : Types::AssessmentConfiguration?

        # The identifier of the directory for which to perform the assessment. This should be an existing
        # directory. If the assessment is not for an existing directory, this parameter should be omitted.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @assessment_configuration : Types::AssessmentConfiguration? = nil,
          @directory_id : String? = nil
        )
        end
      end


      struct StartADAssessmentResult
        include JSON::Serializable

        # The unique identifier of the newly started directory assessment. Use this identifier to monitor
        # assessment progress and retrieve results.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        def initialize(
          @assessment_id : String? = nil
        )
        end
      end


      struct StartSchemaExtensionRequest
        include JSON::Serializable

        # If true, creates a snapshot of the directory before applying the schema extension.

        @[JSON::Field(key: "CreateSnapshotBeforeSchemaExtension")]
        getter create_snapshot_before_schema_extension : Bool

        # A description of the schema extension.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The identifier of the directory for which the schema extension will be applied to.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The LDIF file represented as a string. To construct the LdifContent string, precede each line as it
        # would be formatted in an ldif file with \n. See the example request below for more details. The file
        # size can be no larger than 1MB.

        @[JSON::Field(key: "LdifContent")]
        getter ldif_content : String

        def initialize(
          @create_snapshot_before_schema_extension : Bool,
          @description : String,
          @directory_id : String,
          @ldif_content : String
        )
        end
      end


      struct StartSchemaExtensionResult
        include JSON::Serializable

        # The identifier of the schema extension that will be applied.

        @[JSON::Field(key: "SchemaExtensionId")]
        getter schema_extension_id : String?

        def initialize(
          @schema_extension_id : String? = nil
        )
        end
      end

      # Metadata assigned to a directory consisting of a key-value pair.

      struct Tag
        include JSON::Serializable

        # Required name of the tag. The string value can be Unicode characters and cannot be prefixed with
        # "aws:". The string can contain only the set of Unicode letters, digits, white-space, '_', '.', '/',
        # '=', '+', '-', ':', '@'(Java regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Key")]
        getter key : String

        # The optional value of the tag. The string value can be Unicode characters. The string can contain
        # only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-', ':', '@' (Java
        # regex: "^([\\p{L}\\p{Z}\\p{N}_.:/=+\\-]*)$").

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The maximum allowed number of tags was exceeded.

      struct TagLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Describes a trust relationship between an Managed Microsoft AD directory and an external domain.

      struct Trust
        include JSON::Serializable

        # The date and time that the trust relationship was created.

        @[JSON::Field(key: "CreatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created_date_time : Time?

        # The Directory ID of the Amazon Web Services directory involved in the trust relationship.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The date and time that the trust relationship was last updated.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The Fully Qualified Domain Name (FQDN) of the external domain involved in the trust relationship.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String?

        # Current state of selective authentication for the trust.

        @[JSON::Field(key: "SelectiveAuth")]
        getter selective_auth : String?

        # The date and time that the TrustState was last updated.

        @[JSON::Field(key: "StateLastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter state_last_updated_date_time : Time?

        # The trust relationship direction.

        @[JSON::Field(key: "TrustDirection")]
        getter trust_direction : String?

        # The unique ID of the trust relationship.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String?

        # The trust relationship state.

        @[JSON::Field(key: "TrustState")]
        getter trust_state : String?

        # The reason for the TrustState.

        @[JSON::Field(key: "TrustStateReason")]
        getter trust_state_reason : String?

        # The trust relationship type. Forest is the default.

        @[JSON::Field(key: "TrustType")]
        getter trust_type : String?

        def initialize(
          @created_date_time : Time? = nil,
          @directory_id : String? = nil,
          @last_updated_date_time : Time? = nil,
          @remote_domain_name : String? = nil,
          @selective_auth : String? = nil,
          @state_last_updated_date_time : Time? = nil,
          @trust_direction : String? = nil,
          @trust_id : String? = nil,
          @trust_state : String? = nil,
          @trust_state_reason : String? = nil,
          @trust_type : String? = nil
        )
        end
      end


      struct UnshareDirectoryRequest
        include JSON::Serializable

        # The identifier of the Managed Microsoft AD directory that you want to stop sharing.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # Identifier for the directory consumer account with whom the directory has to be unshared.

        @[JSON::Field(key: "UnshareTarget")]
        getter unshare_target : Types::UnshareTarget

        def initialize(
          @directory_id : String,
          @unshare_target : Types::UnshareTarget
        )
        end
      end


      struct UnshareDirectoryResult
        include JSON::Serializable

        # Identifier of the directory stored in the directory consumer account that is to be unshared from the
        # specified directory ( DirectoryId ).

        @[JSON::Field(key: "SharedDirectoryId")]
        getter shared_directory_id : String?

        def initialize(
          @shared_directory_id : String? = nil
        )
        end
      end

      # Identifier that contains details about the directory consumer account with whom the directory is
      # being unshared.

      struct UnshareTarget
        include JSON::Serializable

        # Identifier of the directory consumer account.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Type of identifier to be used in the Id field.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # The operation is not supported.

      struct UnsupportedOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The specified directory setting is not supported.

      struct UnsupportedSettingsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Updates a conditional forwarder.

      struct UpdateConditionalForwarderRequest
        include JSON::Serializable

        # The directory ID of the Amazon Web Services directory for which to update the conditional forwarder.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust
        # relationship.

        @[JSON::Field(key: "RemoteDomainName")]
        getter remote_domain_name : String

        # The updated IP addresses of the remote DNS server associated with the conditional forwarder.

        @[JSON::Field(key: "DnsIpAddrs")]
        getter dns_ip_addrs : Array(String)?

        # The updated IPv6 addresses of the remote DNS server associated with the conditional forwarder.

        @[JSON::Field(key: "DnsIpv6Addrs")]
        getter dns_ipv6_addrs : Array(String)?

        def initialize(
          @directory_id : String,
          @remote_domain_name : String,
          @dns_ip_addrs : Array(String)? = nil,
          @dns_ipv6_addrs : Array(String)? = nil
        )
        end
      end

      # The result of an UpdateConditionalForwarder request.

      struct UpdateConditionalForwarderResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDirectorySetupRequest
        include JSON::Serializable

        # The identifier of the directory to update.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The type of update to perform on the directory.

        @[JSON::Field(key: "UpdateType")]
        getter update_type : String

        # Specifies whether to create a directory snapshot before performing the update.

        @[JSON::Field(key: "CreateSnapshotBeforeUpdate")]
        getter create_snapshot_before_update : Bool?

        # Directory size configuration to apply during the update operation.

        @[JSON::Field(key: "DirectorySizeUpdateSettings")]
        getter directory_size_update_settings : Types::DirectorySizeUpdateSettings?

        # Network configuration to apply during the directory update operation.

        @[JSON::Field(key: "NetworkUpdateSettings")]
        getter network_update_settings : Types::NetworkUpdateSettings?

        # Operating system configuration to apply during the directory update operation.

        @[JSON::Field(key: "OSUpdateSettings")]
        getter os_update_settings : Types::OSUpdateSettings?

        def initialize(
          @directory_id : String,
          @update_type : String,
          @create_snapshot_before_update : Bool? = nil,
          @directory_size_update_settings : Types::DirectorySizeUpdateSettings? = nil,
          @network_update_settings : Types::NetworkUpdateSettings? = nil,
          @os_update_settings : Types::OSUpdateSettings? = nil
        )
        end
      end


      struct UpdateDirectorySetupResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateHybridADRequest
        include JSON::Serializable

        # The identifier of the hybrid directory to update.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # We create a hybrid directory administrator account when we create a hybrid directory. Use
        # HybridAdministratorAccountUpdate to recover the hybrid directory administrator account if you have
        # deleted it. To recover your hybrid directory administrator account, we need temporary access to a
        # user in your self-managed AD with administrator permissions in the form of a secret from Amazon Web
        # Services Secrets Manager. We use these credentials once during recovery and don't store them. If
        # your hybrid directory administrator account exists, then you don’t need to use
        # HybridAdministratorAccountUpdate , even if you have updated your self-managed AD administrator user.

        @[JSON::Field(key: "HybridAdministratorAccountUpdate")]
        getter hybrid_administrator_account_update : Types::HybridAdministratorAccountUpdate?

        # Updates to the self-managed AD configuration, including DNS server IP addresses and Amazon Web
        # Services System Manager managed node identifiers.

        @[JSON::Field(key: "SelfManagedInstancesSettings")]
        getter self_managed_instances_settings : Types::HybridCustomerInstancesSettings?

        def initialize(
          @directory_id : String,
          @hybrid_administrator_account_update : Types::HybridAdministratorAccountUpdate? = nil,
          @self_managed_instances_settings : Types::HybridCustomerInstancesSettings? = nil
        )
        end
      end


      struct UpdateHybridADResult
        include JSON::Serializable

        # The identifier of the assessment performed to validate the update configuration. This assessment
        # ensures the updated settings are compatible with your environment.

        @[JSON::Field(key: "AssessmentId")]
        getter assessment_id : String?

        # The identifier of the updated hybrid directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @assessment_id : String? = nil,
          @directory_id : String? = nil
        )
        end
      end

      # An entry of update information related to a requested update type.

      struct UpdateInfoEntry
        include JSON::Serializable

        # This specifies if the update was initiated by the customer or by the service team.

        @[JSON::Field(key: "InitiatedBy")]
        getter initiated_by : String?

        # The last updated date and time of a particular directory setting.

        @[JSON::Field(key: "LastUpdatedDateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_updated_date_time : Time?

        # The new value of the target setting.

        @[JSON::Field(key: "NewValue")]
        getter new_value : Types::UpdateValue?

        # The old value of the target setting.

        @[JSON::Field(key: "PreviousValue")]
        getter previous_value : Types::UpdateValue?

        # The name of the Region.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The start time of the UpdateDirectorySetup for the particular type.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the update performed on the directory.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The reason for the current status of the update type activity.

        @[JSON::Field(key: "StatusReason")]
        getter status_reason : String?

        def initialize(
          @initiated_by : String? = nil,
          @last_updated_date_time : Time? = nil,
          @new_value : Types::UpdateValue? = nil,
          @previous_value : Types::UpdateValue? = nil,
          @region : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct UpdateNumberOfDomainControllersRequest
        include JSON::Serializable

        # The number of domain controllers desired in the directory.

        @[JSON::Field(key: "DesiredNumber")]
        getter desired_number : Int32

        # Identifier of the directory to which the domain controllers will be added or removed.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        def initialize(
          @desired_number : Int32,
          @directory_id : String
        )
        end
      end


      struct UpdateNumberOfDomainControllersResult
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the UpdateRadius operation.

      struct UpdateRadiusRequest
        include JSON::Serializable

        # The identifier of the directory for which to update the RADIUS server information.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # A RadiusSettings object that contains information about the RADIUS server.

        @[JSON::Field(key: "RadiusSettings")]
        getter radius_settings : Types::RadiusSettings

        def initialize(
          @directory_id : String,
          @radius_settings : Types::RadiusSettings
        )
        end
      end

      # Contains the results of the UpdateRadius operation.

      struct UpdateRadiusResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateSettingsRequest
        include JSON::Serializable

        # The identifier of the directory for which to update settings.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String

        # The list of Setting objects.

        @[JSON::Field(key: "Settings")]
        getter settings : Array(Types::Setting)

        def initialize(
          @directory_id : String,
          @settings : Array(Types::Setting)
        )
        end
      end


      struct UpdateSettingsResult
        include JSON::Serializable

        # The identifier of the directory.

        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        def initialize(
          @directory_id : String? = nil
        )
        end
      end


      struct UpdateTrustRequest
        include JSON::Serializable

        # Identifier of the trust relationship.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String

        # Updates selective authentication for the trust.

        @[JSON::Field(key: "SelectiveAuth")]
        getter selective_auth : String?

        def initialize(
          @trust_id : String,
          @selective_auth : String? = nil
        )
        end
      end


      struct UpdateTrustResult
        include JSON::Serializable


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # Identifier of the trust relationship.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String?

        def initialize(
          @request_id : String? = nil,
          @trust_id : String? = nil
        )
        end
      end

      # The value for a given type of UpdateSettings .

      struct UpdateValue
        include JSON::Serializable

        # The OS update related settings.

        @[JSON::Field(key: "OSUpdateSettings")]
        getter os_update_settings : Types::OSUpdateSettings?

        def initialize(
          @os_update_settings : Types::OSUpdateSettings? = nil
        )
        end
      end

      # The user provided a username that does not exist in your directory.

      struct UserDoesNotExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Initiates the verification of an existing trust relationship between an Managed Microsoft AD
      # directory and an external domain.

      struct VerifyTrustRequest
        include JSON::Serializable

        # The unique Trust ID of the trust relationship to verify.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String

        def initialize(
          @trust_id : String
        )
        end
      end

      # Result of a VerifyTrust request.

      struct VerifyTrustResult
        include JSON::Serializable

        # The unique Trust ID of the trust relationship that was verified.

        @[JSON::Field(key: "TrustId")]
        getter trust_id : String?

        def initialize(
          @trust_id : String? = nil
        )
        end
      end
    end
  end
end
