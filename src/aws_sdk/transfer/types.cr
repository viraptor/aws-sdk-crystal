require "json"
require "time"

module AwsSdk
  module Transfer
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

      # Contains the details for an AS2 connector object. The connector object is used for AS2 outbound
      # processes, to connect the Transfer Family customer with the trading partner.
      struct As2ConnectorConfig
        include JSON::Serializable

        # Provides Basic authentication support to the AS2 Connectors API. To use Basic authentication, you
        # must provide the name or Amazon Resource Name (ARN) of a secret in Secrets Manager. The default
        # value for this parameter is null , which indicates that Basic authentication is not enabled for the
        # connector. If the connector should use Basic authentication, the secret needs to be in the following
        # format: { "Username": "user-name", "Password": "user-password" } Replace user-name and user-password
        # with the credentials for the actual user that is being authenticated. Note the following: You are
        # storing these credentials in Secrets Manager, not passing them directly into this API. If you are
        # using the API, SDKs, or CloudFormation to configure your connector, then you must create the secret
        # before you can enable Basic authentication. However, if you are using the Amazon Web Services
        # management console, you can have the system create the secret for you. If you have previously
        # enabled Basic authentication for a connector, you can disable it by using the UpdateConnector API
        # call. For example, if you are using the CLI, you can run the following command to remove Basic
        # authentication: update-connector --connector-id my-connector-id --as2-config 'BasicAuthSecretId=""'
        @[JSON::Field(key: "BasicAuthSecretId")]
        getter basic_auth_secret_id : String?

        # Specifies whether the AS2 file is compressed.
        @[JSON::Field(key: "Compression")]
        getter compression : String?

        # The algorithm that is used to encrypt the file. Note the following: Do not use the DES_EDE3_CBC
        # algorithm unless you must support a legacy client that requires it, as it is a weak encryption
        # algorithm. You can only specify NONE if the URL for your connector uses HTTPS. Using HTTPS ensures
        # that no traffic is sent in clear text.
        @[JSON::Field(key: "EncryptionAlgorithm")]
        getter encryption_algorithm : String?

        # A unique identifier for the AS2 local profile.
        @[JSON::Field(key: "LocalProfileId")]
        getter local_profile_id : String?

        # Used for outbound requests (from an Transfer Family connector to a partner AS2 server) to determine
        # whether the partner response for transfers is synchronous or asynchronous. Specify either of the
        # following values: SYNC : The system expects a synchronous MDN response, confirming that the file was
        # transferred successfully (or not). NONE : Specifies that no MDN response is required.
        @[JSON::Field(key: "MdnResponse")]
        getter mdn_response : String?

        # The signing algorithm for the MDN response. If set to DEFAULT (or not set at all), the value for
        # SigningAlgorithm is used.
        @[JSON::Field(key: "MdnSigningAlgorithm")]
        getter mdn_signing_algorithm : String?

        # Used as the Subject HTTP header attribute in AS2 messages that are being sent with the connector.
        @[JSON::Field(key: "MessageSubject")]
        getter message_subject : String?

        # A unique identifier for the partner profile for the connector.
        @[JSON::Field(key: "PartnerProfileId")]
        getter partner_profile_id : String?

        # Allows you to use the Amazon S3 Content-Type that is associated with objects in S3 instead of having
        # the content type mapped based on the file extension. This parameter is enabled by default when you
        # create an AS2 connector from the console, but disabled by default when you create an AS2 connector
        # by calling the API directly.
        @[JSON::Field(key: "PreserveContentType")]
        getter preserve_content_type : String?

        # The algorithm that is used to sign the AS2 messages sent with the connector.
        @[JSON::Field(key: "SigningAlgorithm")]
        getter signing_algorithm : String?

        def initialize(
          @basic_auth_secret_id : String? = nil,
          @compression : String? = nil,
          @encryption_algorithm : String? = nil,
          @local_profile_id : String? = nil,
          @mdn_response : String? = nil,
          @mdn_signing_algorithm : String? = nil,
          @message_subject : String? = nil,
          @partner_profile_id : String? = nil,
          @preserve_content_type : String? = nil,
          @signing_algorithm : String? = nil
        )
        end
      end

      # This exception is thrown when the UpdateServer is called for a file transfer protocol-enabled server
      # that has VPC as the endpoint type and the server's VpcEndpointID is not in the available state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration structure that defines how traffic is routed from the connector to the SFTP server.
      # Contains VPC Lattice settings when using VPC_LATTICE egress type for private connectivity through
      # customer VPCs.
      struct ConnectorEgressConfig
        include JSON::Serializable

        # VPC_LATTICE configuration for routing connector traffic through customer VPCs. Enables private
        # connectivity to SFTP servers without requiring public internet access or complex network
        # configurations.
        @[JSON::Field(key: "VpcLattice")]
        getter vpc_lattice : Types::ConnectorVpcLatticeEgressConfig?

        def initialize(
          @vpc_lattice : Types::ConnectorVpcLatticeEgressConfig? = nil
        )
        end
      end

      # A structure that contains the details for files transferred using an SFTP connector, during a single
      # transfer.
      struct ConnectorFileTransferResult
        include JSON::Serializable

        # The filename and path to where the file was sent to or retrieved from.
        @[JSON::Field(key: "FilePath")]
        getter file_path : String

        # The current status for the transfer.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : String

        # For transfers that fail, this parameter contains a code indicating the reason. For example,
        # RETRIEVE_FILE_NOT_FOUND
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # For transfers that fail, this parameter describes the reason for the failure.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        def initialize(
          @file_path : String,
          @status_code : String,
          @failure_code : String? = nil,
          @failure_message : String? = nil
        )
        end
      end

      # VPC_LATTICE egress configuration that specifies the Resource Configuration ARN and port for
      # connecting to SFTP servers through customer VPCs. Requires a valid Resource Configuration with
      # appropriate network access.
      struct ConnectorVpcLatticeEgressConfig
        include JSON::Serializable

        # ARN of the VPC_LATTICE Resource Configuration that defines the target SFTP server location. Must
        # point to a valid Resource Configuration in the customer's VPC with appropriate network connectivity
        # to the SFTP server.
        @[JSON::Field(key: "ResourceConfigurationArn")]
        getter resource_configuration_arn : String

        # Port number for connecting to the SFTP server through VPC_LATTICE. Defaults to 22 if not specified.
        # Must match the port on which the target SFTP server is listening.
        @[JSON::Field(key: "PortNumber")]
        getter port_number : Int32?

        def initialize(
          @resource_configuration_arn : String,
          @port_number : Int32? = nil
        )
        end
      end

      # Each step type has its own StepDetails structure.
      struct CopyStepDetails
        include JSON::Serializable

        # Specifies the location for the file being copied. Use ${Transfer:UserName} or ${Transfer:UploadDate}
        # in this field to parametrize the destination prefix by username or uploaded date. Set the value of
        # DestinationFileLocation to ${Transfer:UserName} to copy uploaded files to an Amazon S3 bucket that
        # is prefixed with the name of the Transfer Family user that uploaded the file. Set the value of
        # DestinationFileLocation to ${Transfer:UploadDate} to copy uploaded files to an Amazon S3 bucket that
        # is prefixed with the date of the upload. The system resolves UploadDate to a date format of
        # YYYY-MM-DD , based on the date the file is uploaded in UTC.
        @[JSON::Field(key: "DestinationFileLocation")]
        getter destination_file_location : Types::InputFileLocation?

        # The name of the step, used as an identifier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A flag that indicates whether to overwrite an existing file of the same name. The default is FALSE .
        # If the workflow is processing a file that has the same name as an existing file, the behavior is as
        # follows: If OverwriteExisting is TRUE , the existing file is replaced with the file being processed.
        # If OverwriteExisting is FALSE , nothing happens, and the workflow processing stops.
        @[JSON::Field(key: "OverwriteExisting")]
        getter overwrite_existing : String?

        # Specifies which file to use as input to the workflow step: either the output from the previous step,
        # or the originally uploaded file for the workflow. To use the previous file as the input, enter
        # ${previous.file} . In this case, this workflow step uses the output file from the previous workflow
        # step as input. This is the default value. To use the originally uploaded file location as input for
        # this step, enter ${original.file} .
        @[JSON::Field(key: "SourceFileLocation")]
        getter source_file_location : String?

        def initialize(
          @destination_file_location : Types::InputFileLocation? = nil,
          @name : String? = nil,
          @overwrite_existing : String? = nil,
          @source_file_location : String? = nil
        )
        end
      end

      struct CreateAccessRequest
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String

        # A system-assigned unique identifier for a server instance. This is the specific server that you
        # added your user to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . The following is an Entry and Target pair example. [
        # { "Entry": "/directory1", "Target": "/bucket_name/home/mydirectory" } ] In most cases, you can use
        # this value instead of the session policy to lock down your user to the designated home directory ("
        # chroot "). To do this, you can set Entry to / and set Target to the HomeDirectory parameter value.
        # The following is an Entry and Target pair example for chroot . [ { "Entry": "/", "Target":
        # "/bucket_name/home/mydirectory" } ]
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} . This policy applies only when the domain of
        # ServerId is Amazon S3. Amazon EFS does not use session policies. For session policies, Transfer
        # Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy.
        # You save the policy as a JSON blob and pass it in the Policy argument. For an example of a session
        # policy, see Example session policy . For more information, see AssumeRole in the Security Token
        # Service API Reference .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        def initialize(
          @external_id : String,
          @role : String,
          @server_id : String,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil
        )
        end
      end

      struct CreateAccessResponse
        include JSON::Serializable

        # The external identifier of the group whose users have access to your Amazon S3 or Amazon EFS
        # resources over the enabled protocols using Transfer Family.
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # The identifier of the server that the user is attached to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @external_id : String,
          @server_id : String
        )
        end
      end

      struct CreateAgreementRequest
        include JSON::Serializable

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String

        # A unique identifier for the AS2 local profile.
        @[JSON::Field(key: "LocalProfileId")]
        getter local_profile_id : String

        # A unique identifier for the partner profile used in the agreement.
        @[JSON::Field(key: "PartnerProfileId")]
        getter partner_profile_id : String

        # A system-assigned unique identifier for a server instance. This is the specific server that the
        # agreement uses.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The landing directory (folder) for files transferred by using the AS2 protocol. A BaseDirectory
        # example is / amzn-s3-demo-bucket /home/mydirectory .
        @[JSON::Field(key: "BaseDirectory")]
        getter base_directory : String?

        # A CustomDirectoriesType structure. This structure specifies custom directories for storing various
        # AS2 message files. You can specify directories for the following types of files. Failed files MDN
        # files Payload files Status files Temporary files
        @[JSON::Field(key: "CustomDirectories")]
        getter custom_directories : Types::CustomDirectoriesType?

        # A name or short description to identify the agreement.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Determines whether or not unsigned messages from your trading partners will be accepted. ENABLED :
        # Transfer Family rejects unsigned messages from your trading partner. DISABLED (default value):
        # Transfer Family accepts unsigned messages from your trading partner.
        @[JSON::Field(key: "EnforceMessageSigning")]
        getter enforce_message_signing : String?

        # Determines whether or not Transfer Family appends a unique string of characters to the end of the
        # AS2 message payload filename when saving it. ENABLED : the filename provided by your trading parter
        # is preserved when the file is saved. DISABLED (default value): when Transfer Family saves the file,
        # the filename is adjusted, as described in File names and locations .
        @[JSON::Field(key: "PreserveFilename")]
        getter preserve_filename : String?

        # The status of the agreement. The agreement can be either ACTIVE or INACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Key-value pairs that can be used to group and search for agreements.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @access_role : String,
          @local_profile_id : String,
          @partner_profile_id : String,
          @server_id : String,
          @base_directory : String? = nil,
          @custom_directories : Types::CustomDirectoriesType? = nil,
          @description : String? = nil,
          @enforce_message_signing : String? = nil,
          @preserve_filename : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAgreementResponse
        include JSON::Serializable

        # The unique identifier for the agreement. Use this ID for deleting, or updating an agreement, as well
        # as in any other API calls that require that you specify the agreement ID.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String

        def initialize(
          @agreement_id : String
        )
        end
      end

      struct CreateConnectorRequest
        include JSON::Serializable

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String

        # A structure that contains the parameters for an AS2 connector object.
        @[JSON::Field(key: "As2Config")]
        getter as2_config : Types::As2ConnectorConfig?

        # Specifies the egress configuration for the connector, which determines how traffic is routed from
        # the connector to the SFTP server. When set to VPC, enables routing through customer VPCs using
        # VPC_LATTICE for private connectivity.
        @[JSON::Field(key: "EgressConfig")]
        getter egress_config : Types::ConnectorEgressConfig?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a
        # connector to turn on CloudWatch logging for Amazon S3 events. When set, you can view connector
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies the name of the security policy for the connector.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # A structure that contains the parameters for an SFTP connector object.
        @[JSON::Field(key: "SftpConfig")]
        getter sftp_config : Types::SftpConnectorConfig?

        # Key-value pairs that can be used to group and search for connectors. Tags are metadata attached to
        # connectors for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The URL of the partner's AS2 or SFTP endpoint. When creating AS2 connectors or service-managed SFTP
        # connectors (connectors without egress configuration), you must provide a URL to specify the remote
        # server endpoint. For VPC Lattice type connectors, the URL must be null.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @access_role : String,
          @as2_config : Types::As2ConnectorConfig? = nil,
          @egress_config : Types::ConnectorEgressConfig? = nil,
          @logging_role : String? = nil,
          @security_policy_name : String? = nil,
          @sftp_config : Types::SftpConnectorConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @url : String? = nil
        )
        end
      end

      struct CreateConnectorResponse
        include JSON::Serializable

        # The unique identifier for the connector, returned after the API call succeeds.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end

      struct CreateProfileRequest
        include JSON::Serializable

        # The As2Id is the AS2-name , as defined in the RFC 4130 . For inbound transfers, this is the AS2-From
        # header for the AS2 messages sent from the partner. For outbound connectors, this is the AS2-To
        # header for the AS2 messages sent to the partner using the StartFileTransfer API operation. This ID
        # cannot include spaces.
        @[JSON::Field(key: "As2Id")]
        getter as2_id : String

        # Determines the type of profile to create: Specify LOCAL to create a local profile. A local profile
        # represents the AS2-enabled Transfer Family server organization or party. Specify PARTNER to create a
        # partner profile. A partner profile represents a remote organization, external to Transfer Family.
        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateIds")]
        getter certificate_ids : Array(String)?

        # Key-value pairs that can be used to group and search for AS2 profiles.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @as2_id : String,
          @profile_type : String,
          @certificate_ids : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProfileResponse
        include JSON::Serializable

        # The unique identifier for the AS2 profile, returned after the API call succeeds.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct CreateServerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Certificate Manager (ACM) certificate. Required when Protocols
        # is set to FTPS . To request a new public certificate, see Request a public certificate in the
        # Certificate Manager User Guide . To import an existing certificate into ACM, see Importing
        # certificates into ACM in the Certificate Manager User Guide . To request a private certificate to
        # use FTPS through private IP addresses, see Request a private certificate in the Certificate Manager
        # User Guide . Certificates with the following cryptographic algorithms and key sizes are supported:
        # 2048-bit RSA (RSA_2048) 4096-bit RSA (RSA_4096) Elliptic Prime Curve 256 bit (EC_prime256v1)
        # Elliptic Prime Curve 384 bit (EC_secp384r1) Elliptic Prime Curve 521 bit (EC_secp521r1) The
        # certificate must be a valid SSL/TLS X.509 version 3 certificate with FQDN or IP address specified
        # and information about the issuer.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The domain of the storage system that is used for file transfers. There are two domains available:
        # Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File System (Amazon EFS). The default
        # value is S3. After the server is created, the domain cannot be changed.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The virtual private cloud (VPC) endpoint settings that are configured for your server. When you host
        # your endpoint within your VPC, you can make your endpoint accessible only to resources within your
        # VPC, or you can attach Elastic IP addresses and make your endpoint accessible to clients over the
        # internet. Your VPC's default security groups are automatically assigned to your endpoint.
        @[JSON::Field(key: "EndpointDetails")]
        getter endpoint_details : Types::EndpointDetails?

        # The type of endpoint that you want your server to use. You can choose to make your server's endpoint
        # publicly accessible (PUBLIC) or host it inside your VPC. With an endpoint that is hosted in a VPC,
        # you can restrict access to your server and resources only within your VPC or choose to make it
        # internet facing by attaching Elastic IP addresses directly to it. After May 19, 2021, you won't be
        # able to create a server using EndpointType=VPC_ENDPOINT in your Amazon Web Services account if your
        # account hasn't already done so before May 19, 2021. If you have already created servers with
        # EndpointType=VPC_ENDPOINT in your Amazon Web Services account on or before May 19, 2021, you will
        # not be affected. After this date, use EndpointType = VPC . For more information, see
        # https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
        # It is recommended that you use VPC as the EndpointType . With this endpoint type, you have the
        # option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with your server's
        # endpoint and use VPC security groups to restrict traffic by the client's public IP address. This is
        # not possible with EndpointType set to VPC_ENDPOINT .
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled server. You can add multiple
        # host keys, in case you want to rotate keys, or have a set of active keys that use different
        # algorithms. Use the following command to generate an RSA 2048 bit key with no passphrase: ssh-keygen
        # -t rsa -b 2048 -N "" -m PEM -f my-new-server-key . Use a minimum value of 2048 for the -b option.
        # You can create a stronger key by using 3072 or 4096. Use the following command to generate an ECDSA
        # 256 bit key with no passphrase: ssh-keygen -t ecdsa -b 256 -N "" -m PEM -f my-new-server-key . Valid
        # values for the -b option for ECDSA are 256, 384, and 521. Use the following command to generate an
        # ED25519 key with no passphrase: ssh-keygen -t ed25519 -N "" -f my-new-server-key . For all of these
        # commands, you can replace my-new-server-key with a string of your choice. If you aren't planning to
        # migrate existing users from an existing SFTP-enabled server to a new server, don't update the host
        # key. Accidentally changing a server's host key can be disruptive. For more information, see Manage
        # host keys for your SFTP-enabled server in the Transfer Family User Guide .
        @[JSON::Field(key: "HostKey")]
        getter host_key : String?

        # Required when IdentityProviderType is set to AWS_DIRECTORY_SERVICE , Amazon Web Services_LAMBDA or
        # API_GATEWAY . Accepts an array containing all of the information required to use a directory in
        # AWS_DIRECTORY_SERVICE or invoke a customer-supplied authentication API, including the API Gateway
        # URL. Cannot be specified when IdentityProviderType is set to SERVICE_MANAGED .
        @[JSON::Field(key: "IdentityProviderDetails")]
        getter identity_provider_details : Types::IdentityProviderDetails?

        # The mode of authentication for a server. The default value is SERVICE_MANAGED , which allows you to
        # store and access user credentials within the Transfer Family service. Use AWS_DIRECTORY_SERVICE to
        # provide access to Active Directory groups in Directory Service for Microsoft Active Directory or
        # Microsoft Active Directory in your on-premises environment or in Amazon Web Services using AD
        # Connector. This option also requires you to provide a Directory ID by using the
        # IdentityProviderDetails parameter. Use the API_GATEWAY value to integrate with an identity provider
        # of your choosing. The API_GATEWAY setting requires you to provide an Amazon API Gateway endpoint URL
        # to call for authentication by using the IdentityProviderDetails parameter. Use the AWS_LAMBDA value
        # to directly use an Lambda function as your identity provider. If you choose this value, you must
        # specify the ARN for the Lambda function in the Function parameter for the IdentityProviderDetails
        # data type.
        @[JSON::Field(key: "IdentityProviderType")]
        getter identity_provider_type : String?

        # Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your Transfer Family
        # endpoint. The default value is IPV4 . The IpAddressType parameter has the following limitations: It
        # cannot be changed while the server is online. You must stop the server before modifying this
        # parameter. It cannot be updated to DUALSTACK if the server has AddressAllocationIds specified. When
        # using DUALSTACK as the IpAddressType , you cannot set the AddressAllocationIds parameter for the
        # EndpointDetails for the server.
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a server
        # to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set, you can view user
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies a string to display when users connect to a server. This string is displayed after the
        # user authenticates. The SFTP protocol does not support post-authentication display banners.
        @[JSON::Field(key: "PostAuthenticationLoginBanner")]
        getter post_authentication_login_banner : String?

        # Specifies a string to display when users connect to a server. This string is displayed before the
        # user authenticates. For example, the following banner displays details about using the system: This
        # system is for the use of authorized users only. Individuals using this computer system without
        # authority, or in excess of their authority, are subject to having all of their activities on this
        # system monitored and recorded by system personnel.
        @[JSON::Field(key: "PreAuthenticationLoginBanner")]
        getter pre_authentication_login_banner : String?

        # The protocol settings that are configured for your server. Avoid placing Network Load Balancers
        # (NLBs) or NAT gateways in front of Transfer Family servers, as this increases costs and can cause
        # performance issues, including reduced connection limits for FTPS. For more details, see Avoid
        # placing NLBs and NATs in front of Transfer Family . To indicate passive mode (for FTP and FTPS
        # protocols), use the PassiveIp parameter. Enter a single dotted-quad IPv4 address, such as the
        # external IP address of a firewall, router, or load balancer. To ignore the error that is generated
        # when the client attempts to use the SETSTAT command on a file that you are uploading to an Amazon S3
        # bucket, use the SetStatOption parameter. To have the Transfer Family server ignore the SETSTAT
        # command and upload files without needing to make any changes to your SFTP client, set the value to
        # ENABLE_NO_OP . If you set the SetStatOption parameter to ENABLE_NO_OP , Transfer Family generates a
        # log entry to Amazon CloudWatch Logs, so that you can determine when the client is making a SETSTAT
        # call. To determine whether your Transfer Family server resumes recent, negotiated sessions through a
        # unique session ID, use the TlsSessionResumptionMode parameter. As2Transports indicates the transport
        # method for the AS2 messages. Currently, only HTTP is supported.
        @[JSON::Field(key: "ProtocolDetails")]
        getter protocol_details : Types::ProtocolDetails?

        # Specifies the file transfer protocol or protocols over which your file transfer protocol client can
        # connect to your server's endpoint. The available protocols are: SFTP (Secure Shell (SSH) File
        # Transfer Protocol): File transfer over SSH FTPS (File Transfer Protocol Secure): File transfer with
        # TLS encryption FTP (File Transfer Protocol): Unencrypted file transfer AS2 (Applicability Statement
        # 2): used for transporting structured business-to-business data If you select FTPS , you must choose
        # a certificate stored in Certificate Manager (ACM) which is used to identify your server when clients
        # connect to it over FTPS. If Protocol includes either FTP or FTPS , then the EndpointType must be VPC
        # and the IdentityProviderType must be either AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes FTP , then AddressAllocationIds cannot be associated. If Protocol is set only to
        # SFTP , the EndpointType can be set to PUBLIC and the IdentityProviderType can be set any of the
        # supported identity types: SERVICE_MANAGED , AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes AS2 , then the EndpointType must be VPC , and domain must be Amazon S3.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # Specifies whether or not performance for your Amazon S3 directories is optimized. If using the
        # console, this is enabled by default. If using the API or CLI, this is disabled by default. By
        # default, home directory mappings have a TYPE of DIRECTORY . If you enable this option, you would
        # then need to explicitly set the HomeDirectoryMapEntry Type to FILE if you want a mapping to have a
        # file target.
        @[JSON::Field(key: "S3StorageOptions")]
        getter s3_storage_options : Types::S3StorageOptions?

        # Specifies the name of the security policy for the server.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # Specifies the log groups to which your server logs are sent. To specify a log group, you must
        # provide the ARN for an existing log group. In this case, the format of the log group is as follows:
        # arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:* For example,
        # arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:* If you have previously specified a log
        # group for a server, you can clear it, and in effect turn off structured logging, by providing an
        # empty value for this parameter in an update-server call. For example: update-server --server-id
        # s-1234567890abcdef0 --structured-log-destinations
        @[JSON::Field(key: "StructuredLogDestinations")]
        getter structured_log_destinations : Array(String)?

        # Key-value pairs that can be used to group and search for servers.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the workflow ID for the workflow to assign and the execution role that's used for
        # executing the workflow. In addition to a workflow to execute when a file is uploaded completely,
        # WorkflowDetails can also contain a workflow ID (and execution role) for a workflow to execute on
        # partial upload. A partial upload occurs when the server session disconnects while the file is still
        # being uploaded.
        @[JSON::Field(key: "WorkflowDetails")]
        getter workflow_details : Types::WorkflowDetails?

        def initialize(
          @certificate : String? = nil,
          @domain : String? = nil,
          @endpoint_details : Types::EndpointDetails? = nil,
          @endpoint_type : String? = nil,
          @host_key : String? = nil,
          @identity_provider_details : Types::IdentityProviderDetails? = nil,
          @identity_provider_type : String? = nil,
          @ip_address_type : String? = nil,
          @logging_role : String? = nil,
          @post_authentication_login_banner : String? = nil,
          @pre_authentication_login_banner : String? = nil,
          @protocol_details : Types::ProtocolDetails? = nil,
          @protocols : Array(String)? = nil,
          @s3_storage_options : Types::S3StorageOptions? = nil,
          @security_policy_name : String? = nil,
          @structured_log_destinations : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @workflow_details : Types::WorkflowDetails? = nil
        )
        end
      end

      struct CreateServerResponse
        include JSON::Serializable

        # The service-assigned identifier of the server that is created.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String

        # A system-assigned unique identifier for a server instance. This is the specific server that you
        # added your user to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique string that identifies a user and is associated with a ServerId . This user name must be a
        # minimum of 3 and a maximum of 100 characters long. The following are valid characters: a-z, A-Z,
        # 0-9, underscore '_', hyphen '-', period '.', and at sign '@'. The user name can't start with a
        # hyphen, period, or at sign.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . The following is an Entry and Target pair example. [
        # { "Entry": "/directory1", "Target": "/bucket_name/home/mydirectory" } ] In most cases, you can use
        # this value instead of the session policy to lock your user down to the designated home directory ("
        # chroot "). To do this, you can set Entry to / and set Target to the value the user should see for
        # their home directory when they log in. The following is an Entry and Target pair example for chroot
        # . [ { "Entry": "/", "Target": "/bucket_name/home/mydirectory" } ]
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} . This policy applies only when the domain of
        # ServerId is Amazon S3. Amazon EFS does not use session policies. For session policies, Transfer
        # Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy.
        # You save the policy as a JSON blob and pass it in the Policy argument. For an example of a session
        # policy, see Example session policy . For more information, see AssumeRole in the Amazon Web Services
        # Security Token Service API Reference .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Specifies the full POSIX identity, including user ID ( Uid ), group ID ( Gid ), and any secondary
        # groups IDs ( SecondaryGids ), that controls your users' access to your Amazon EFS file systems. The
        # POSIX permissions that are set on files and directories in Amazon EFS determine the level of access
        # your users get when transferring files into and out of your Amazon EFS file systems.
        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # The public portion of the Secure Shell (SSH) key used to authenticate the user to the server. The
        # three standard SSH public key format elements are &lt;key type&gt; , &lt;body base64&gt; , and an
        # optional &lt;comment&gt; , with spaces between each element. Transfer Family accepts RSA, ECDSA, and
        # ED25519 keys. For RSA keys, the key type is ssh-rsa . For ED25519 keys, the key type is ssh-ed25519
        # . For ECDSA keys, the key type is either ecdsa-sha2-nistp256 , ecdsa-sha2-nistp384 , or
        # ecdsa-sha2-nistp521 , depending on the size of the key you generated.
        @[JSON::Field(key: "SshPublicKeyBody")]
        getter ssh_public_key_body : String?

        # Key-value pairs that can be used to group and search for users. Tags are metadata attached to users
        # for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @role : String,
          @server_id : String,
          @user_name : String,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @ssh_public_key_body : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateUserResponse
        include JSON::Serializable

        # The identifier of the server that the user is attached to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique string that identifies a Transfer Family user.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @user_name : String
        )
        end
      end

      struct CreateWebAppRequest
        include JSON::Serializable

        # You can provide a structure that contains the details for the identity provider to use with your web
        # app. For more details about this parameter, see Configure your identity provider for Transfer Family
        # web apps .
        @[JSON::Field(key: "IdentityProviderDetails")]
        getter identity_provider_details : Types::WebAppIdentityProviderDetails

        # The AccessEndpoint is the URL that you provide to your users for them to interact with the Transfer
        # Family web app. You can specify a custom URL or use the default value. Before you enter a custom URL
        # for this parameter, follow the steps described in Update your access endpoint with a custom URL .
        @[JSON::Field(key: "AccessEndpoint")]
        getter access_endpoint : String?

        # The endpoint configuration for the web app. You can specify whether the web app endpoint is publicly
        # accessible or hosted within a VPC.
        @[JSON::Field(key: "EndpointDetails")]
        getter endpoint_details : Types::WebAppEndpointDetails?

        # Key-value pairs that can be used to group and search for web apps.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Setting for the type of endpoint policy for the web app. The default value is STANDARD . If you are
        # creating the web app in an Amazon Web Services GovCloud (US) Region, you can set this parameter to
        # FIPS .
        @[JSON::Field(key: "WebAppEndpointPolicy")]
        getter web_app_endpoint_policy : String?

        # A union that contains the value for number of concurrent connections or the user sessions on your
        # web app.
        @[JSON::Field(key: "WebAppUnits")]
        getter web_app_units : Types::WebAppUnits?

        def initialize(
          @identity_provider_details : Types::WebAppIdentityProviderDetails,
          @access_endpoint : String? = nil,
          @endpoint_details : Types::WebAppEndpointDetails? = nil,
          @tags : Array(Types::Tag)? = nil,
          @web_app_endpoint_policy : String? = nil,
          @web_app_units : Types::WebAppUnits? = nil
        )
        end
      end

      struct CreateWebAppResponse
        include JSON::Serializable

        # Returns a unique identifier for the web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      struct CreateWorkflowRequest
        include JSON::Serializable

        # Specifies the details for the steps that are in the specified workflow. The TYPE specifies which of
        # the following actions is being taken for this step. COPY - Copy the file to another location. CUSTOM
        # - Perform a custom step with an Lambda function target. DECRYPT - Decrypt a file that was encrypted
        # before it was uploaded. DELETE - Delete the file. TAG - Add a tag to the file. Currently, copying
        # and tagging are supported only on S3. For file location, you specify either the Amazon S3 bucket and
        # key, or the Amazon EFS file system ID and path.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::WorkflowStep)

        # A textual description for the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the steps (actions) to take if errors are encountered during execution of the workflow.
        # For custom steps, the Lambda function needs to send FAILURE to the call back API to kick off the
        # exception steps. Additionally, if the Lambda does not send SUCCESS before it times out, the
        # exception steps are executed.
        @[JSON::Field(key: "OnExceptionSteps")]
        getter on_exception_steps : Array(Types::WorkflowStep)?

        # Key-value pairs that can be used to group and search for workflows. Tags are metadata attached to
        # workflows for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @steps : Array(Types::WorkflowStep),
          @description : String? = nil,
          @on_exception_steps : Array(Types::WorkflowStep)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateWorkflowResponse
        include JSON::Serializable

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @workflow_id : String
        )
        end
      end

      # Contains Amazon S3 locations for storing specific types of AS2 message files.
      struct CustomDirectoriesType
        include JSON::Serializable

        # Specifies a location to store failed AS2 message files.
        @[JSON::Field(key: "FailedFilesDirectory")]
        getter failed_files_directory : String

        # Specifies a location to store MDN files.
        @[JSON::Field(key: "MdnFilesDirectory")]
        getter mdn_files_directory : String

        # Specifies a location to store the payload for AS2 message files.
        @[JSON::Field(key: "PayloadFilesDirectory")]
        getter payload_files_directory : String

        # Specifies a location to store AS2 status messages.
        @[JSON::Field(key: "StatusFilesDirectory")]
        getter status_files_directory : String

        # Specifies a location to store temporary AS2 message files.
        @[JSON::Field(key: "TemporaryFilesDirectory")]
        getter temporary_files_directory : String

        def initialize(
          @failed_files_directory : String,
          @mdn_files_directory : String,
          @payload_files_directory : String,
          @status_files_directory : String,
          @temporary_files_directory : String
        )
        end
      end

      # Each step type has its own StepDetails structure.
      struct CustomStepDetails
        include JSON::Serializable

        # The name of the step, used as an identifier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies which file to use as input to the workflow step: either the output from the previous step,
        # or the originally uploaded file for the workflow. To use the previous file as the input, enter
        # ${previous.file} . In this case, this workflow step uses the output file from the previous workflow
        # step as input. This is the default value. To use the originally uploaded file location as input for
        # this step, enter ${original.file} .
        @[JSON::Field(key: "SourceFileLocation")]
        getter source_file_location : String?

        # The ARN for the Lambda function that is being called.
        @[JSON::Field(key: "Target")]
        getter target : String?

        # Timeout, in seconds, for the step.
        @[JSON::Field(key: "TimeoutSeconds")]
        getter timeout_seconds : Int32?

        def initialize(
          @name : String? = nil,
          @source_file_location : String? = nil,
          @target : String? = nil,
          @timeout_seconds : Int32? = nil
        )
        end
      end

      # Each step type has its own StepDetails structure.
      struct DecryptStepDetails
        include JSON::Serializable

        # Specifies the location for the file being decrypted. Use ${Transfer:UserName} or
        # ${Transfer:UploadDate} in this field to parametrize the destination prefix by username or uploaded
        # date. Set the value of DestinationFileLocation to ${Transfer:UserName} to decrypt uploaded files to
        # an Amazon S3 bucket that is prefixed with the name of the Transfer Family user that uploaded the
        # file. Set the value of DestinationFileLocation to ${Transfer:UploadDate} to decrypt uploaded files
        # to an Amazon S3 bucket that is prefixed with the date of the upload. The system resolves UploadDate
        # to a date format of YYYY-MM-DD , based on the date the file is uploaded in UTC.
        @[JSON::Field(key: "DestinationFileLocation")]
        getter destination_file_location : Types::InputFileLocation

        # The type of encryption used. Currently, this value must be PGP .
        @[JSON::Field(key: "Type")]
        getter type : String

        # The name of the step, used as an identifier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # A flag that indicates whether to overwrite an existing file of the same name. The default is FALSE .
        # If the workflow is processing a file that has the same name as an existing file, the behavior is as
        # follows: If OverwriteExisting is TRUE , the existing file is replaced with the file being processed.
        # If OverwriteExisting is FALSE , nothing happens, and the workflow processing stops.
        @[JSON::Field(key: "OverwriteExisting")]
        getter overwrite_existing : String?

        # Specifies which file to use as input to the workflow step: either the output from the previous step,
        # or the originally uploaded file for the workflow. To use the previous file as the input, enter
        # ${previous.file} . In this case, this workflow step uses the output file from the previous workflow
        # step as input. This is the default value. To use the originally uploaded file location as input for
        # this step, enter ${original.file} .
        @[JSON::Field(key: "SourceFileLocation")]
        getter source_file_location : String?

        def initialize(
          @destination_file_location : Types::InputFileLocation,
          @type : String,
          @name : String? = nil,
          @overwrite_existing : String? = nil,
          @source_file_location : String? = nil
        )
        end
      end

      struct DeleteAccessRequest
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # A system-assigned unique identifier for a server that has this user assigned.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @external_id : String,
          @server_id : String
        )
        end
      end

      struct DeleteAgreementRequest
        include JSON::Serializable

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String

        # The server identifier associated with the agreement that you are deleting.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @agreement_id : String,
          @server_id : String
        )
        end
      end

      struct DeleteCertificateRequest
        include JSON::Serializable

        # The identifier of the certificate object that you are deleting.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      struct DeleteConnectorRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end

      struct DeleteHostKeyRequest
        include JSON::Serializable

        # The identifier of the host key that you are deleting.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String

        # The identifier of the server that contains the host key that you are deleting.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @host_key_id : String,
          @server_id : String
        )
        end
      end

      struct DeleteProfileRequest
        include JSON::Serializable

        # The identifier of the profile that you are deleting.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct DeleteServerRequest
        include JSON::Serializable

        # A unique system-assigned identifier for a server instance.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct DeleteSshPublicKeyRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a file transfer protocol-enabled server instance that has
        # the user assigned to it.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique identifier used to reference your user's specific SSH key.
        @[JSON::Field(key: "SshPublicKeyId")]
        getter ssh_public_key_id : String

        # A unique string that identifies a user whose public key is being deleted.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @ssh_public_key_id : String,
          @user_name : String
        )
        end
      end

      # The name of the step, used to identify the delete step.
      struct DeleteStepDetails
        include JSON::Serializable

        # The name of the step, used as an identifier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies which file to use as input to the workflow step: either the output from the previous step,
        # or the originally uploaded file for the workflow. To use the previous file as the input, enter
        # ${previous.file} . In this case, this workflow step uses the output file from the previous workflow
        # step as input. This is the default value. To use the originally uploaded file location as input for
        # this step, enter ${original.file} .
        @[JSON::Field(key: "SourceFileLocation")]
        getter source_file_location : String?

        def initialize(
          @name : String? = nil,
          @source_file_location : String? = nil
        )
        end
      end

      struct DeleteUserRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server instance that has the user assigned to it.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique string that identifies a user that is being deleted from a server.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @user_name : String
        )
        end
      end

      struct DeleteWebAppCustomizationRequest
        include JSON::Serializable

        # Provide the unique identifier for the web app that contains the customizations that you are
        # deleting.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      struct DeleteWebAppRequest
        include JSON::Serializable

        # Provide the unique identifier for the web app that you are deleting.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      struct DeleteWorkflowRequest
        include JSON::Serializable

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @workflow_id : String
        )
        end
      end

      struct DescribeAccessRequest
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # A system-assigned unique identifier for a server that has this access assigned.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @external_id : String,
          @server_id : String
        )
        end
      end

      struct DescribeAccessResponse
        include JSON::Serializable

        # The external identifier of the server that the access is attached to.
        @[JSON::Field(key: "Access")]
        getter access : Types::DescribedAccess

        # A system-assigned unique identifier for a server that has this access assigned.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @access : Types::DescribedAccess,
          @server_id : String
        )
        end
      end

      struct DescribeAgreementRequest
        include JSON::Serializable

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String

        # The server identifier that's associated with the agreement.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @agreement_id : String,
          @server_id : String
        )
        end
      end

      struct DescribeAgreementResponse
        include JSON::Serializable

        # The details for the specified agreement, returned as a DescribedAgreement object.
        @[JSON::Field(key: "Agreement")]
        getter agreement : Types::DescribedAgreement

        def initialize(
          @agreement : Types::DescribedAgreement
        )
        end
      end

      struct DescribeCertificateRequest
        include JSON::Serializable

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      struct DescribeCertificateResponse
        include JSON::Serializable

        # The details for the specified certificate, returned as an object.
        @[JSON::Field(key: "Certificate")]
        getter certificate : Types::DescribedCertificate

        def initialize(
          @certificate : Types::DescribedCertificate
        )
        end
      end

      struct DescribeConnectorRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end

      struct DescribeConnectorResponse
        include JSON::Serializable

        # The structure that contains the details of the connector.
        @[JSON::Field(key: "Connector")]
        getter connector : Types::DescribedConnector

        def initialize(
          @connector : Types::DescribedConnector
        )
        end
      end

      struct DescribeExecutionRequest
        include JSON::Serializable

        # A unique identifier for the execution of a workflow.
        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @execution_id : String,
          @workflow_id : String
        )
        end
      end

      struct DescribeExecutionResponse
        include JSON::Serializable

        # The structure that contains the details of the workflow' execution.
        @[JSON::Field(key: "Execution")]
        getter execution : Types::DescribedExecution

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @execution : Types::DescribedExecution,
          @workflow_id : String
        )
        end
      end

      struct DescribeHostKeyRequest
        include JSON::Serializable

        # The identifier of the host key that you want described.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String

        # The identifier of the server that contains the host key that you want described.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @host_key_id : String,
          @server_id : String
        )
        end
      end

      struct DescribeHostKeyResponse
        include JSON::Serializable

        # Returns the details for the specified host key.
        @[JSON::Field(key: "HostKey")]
        getter host_key : Types::DescribedHostKey

        def initialize(
          @host_key : Types::DescribedHostKey
        )
        end
      end

      struct DescribeProfileRequest
        include JSON::Serializable

        # The identifier of the profile that you want described.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct DescribeProfileResponse
        include JSON::Serializable

        # The details of the specified profile, returned as an object.
        @[JSON::Field(key: "Profile")]
        getter profile : Types::DescribedProfile

        def initialize(
          @profile : Types::DescribedProfile
        )
        end
      end

      struct DescribeSecurityPolicyRequest
        include JSON::Serializable

        # Specify the text name of the security policy for which you want the details.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String

        def initialize(
          @security_policy_name : String
        )
        end
      end

      struct DescribeSecurityPolicyResponse
        include JSON::Serializable

        # An array containing the properties of the security policy.
        @[JSON::Field(key: "SecurityPolicy")]
        getter security_policy : Types::DescribedSecurityPolicy

        def initialize(
          @security_policy : Types::DescribedSecurityPolicy
        )
        end
      end

      struct DescribeServerRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct DescribeServerResponse
        include JSON::Serializable

        # An array containing the properties of a server with the ServerID you specified.
        @[JSON::Field(key: "Server")]
        getter server : Types::DescribedServer

        def initialize(
          @server : Types::DescribedServer
        )
        end
      end

      struct DescribeUserRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server that has this user assigned.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The name of the user assigned to one or more servers. User names are part of the sign-in credentials
        # to use the Transfer Family service and perform file transfer tasks.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @user_name : String
        )
        end
      end

      struct DescribeUserResponse
        include JSON::Serializable

        # A system-assigned unique identifier for a server that has this user assigned.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # An array containing the properties of the Transfer Family user for the ServerID value that you
        # specified.
        @[JSON::Field(key: "User")]
        getter user : Types::DescribedUser

        def initialize(
          @server_id : String,
          @user : Types::DescribedUser
        )
        end
      end

      struct DescribeWebAppCustomizationRequest
        include JSON::Serializable

        # Provide the unique identifier for the web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      struct DescribeWebAppCustomizationResponse
        include JSON::Serializable

        # Returns a structure that contains the details of the web app customizations.
        @[JSON::Field(key: "WebAppCustomization")]
        getter web_app_customization : Types::DescribedWebAppCustomization

        def initialize(
          @web_app_customization : Types::DescribedWebAppCustomization
        )
        end
      end

      struct DescribeWebAppRequest
        include JSON::Serializable

        # Provide the unique identifier for the web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      struct DescribeWebAppResponse
        include JSON::Serializable

        # Returns a structure that contains the details of the web app.
        @[JSON::Field(key: "WebApp")]
        getter web_app : Types::DescribedWebApp

        def initialize(
          @web_app : Types::DescribedWebApp
        )
        end
      end

      struct DescribeWorkflowRequest
        include JSON::Serializable

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @workflow_id : String
        )
        end
      end

      struct DescribeWorkflowResponse
        include JSON::Serializable

        # The structure that contains the details of the workflow.
        @[JSON::Field(key: "Workflow")]
        getter workflow : Types::DescribedWorkflow

        def initialize(
          @workflow : Types::DescribedWorkflow
        )
        end
      end

      # Describes the properties of the access that was specified.
      struct DescribedAccess
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . In most cases, you can use this value instead of the
        # session policy to lock down the associated access to the designated home directory (" chroot "). To
        # do this, you can set Entry to '/' and set Target to the HomeDirectory parameter value.
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @external_id : String? = nil,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @role : String? = nil
        )
        end
      end

      # Describes the properties of an agreement.
      struct DescribedAgreement
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) for the agreement.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String?

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String?

        # The landing directory (folder) for files that are transferred by using the AS2 protocol.
        @[JSON::Field(key: "BaseDirectory")]
        getter base_directory : String?

        # A CustomDirectoriesType structure. This structure specifies custom directories for storing various
        # AS2 message files. You can specify directories for the following types of files. Failed files MDN
        # files Payload files Status files Temporary files
        @[JSON::Field(key: "CustomDirectories")]
        getter custom_directories : Types::CustomDirectoriesType?

        # The name or short description that's used to identify the agreement.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Determines whether or not unsigned messages from your trading partners will be accepted. ENABLED :
        # Transfer Family rejects unsigned messages from your trading partner. DISABLED (default value):
        # Transfer Family accepts unsigned messages from your trading partner.
        @[JSON::Field(key: "EnforceMessageSigning")]
        getter enforce_message_signing : String?

        # A unique identifier for the AS2 local profile.
        @[JSON::Field(key: "LocalProfileId")]
        getter local_profile_id : String?

        # A unique identifier for the partner profile used in the agreement.
        @[JSON::Field(key: "PartnerProfileId")]
        getter partner_profile_id : String?

        # Determines whether or not Transfer Family appends a unique string of characters to the end of the
        # AS2 message payload filename when saving it. ENABLED : the filename provided by your trading parter
        # is preserved when the file is saved. DISABLED (default value): when Transfer Family saves the file,
        # the filename is adjusted, as described in File names and locations .
        @[JSON::Field(key: "PreserveFilename")]
        getter preserve_filename : String?

        # A system-assigned unique identifier for a server instance. This identifier indicates the specific
        # server that the agreement uses.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String?

        # The current status of the agreement, either ACTIVE or INACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Key-value pairs that can be used to group and search for agreements.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @access_role : String? = nil,
          @agreement_id : String? = nil,
          @base_directory : String? = nil,
          @custom_directories : Types::CustomDirectoriesType? = nil,
          @description : String? = nil,
          @enforce_message_signing : String? = nil,
          @local_profile_id : String? = nil,
          @partner_profile_id : String? = nil,
          @preserve_filename : String? = nil,
          @server_id : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes the properties of a certificate.
      struct DescribedCertificate
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) for the certificate.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # An optional date that specifies when the certificate becomes active. If you do not specify a value,
        # ActiveDate takes the same value as NotBeforeDate , which is specified by the CA.
        @[JSON::Field(key: "ActiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_date : Time?

        # The file name for the certificate.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The list of certificates that make up the chain for the certificate.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        # The name or description that's used to identity the certificate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional date that specifies when the certificate becomes inactive. If you do not specify a
        # value, InactiveDate takes the same value as NotAfterDate , which is specified by the CA.
        @[JSON::Field(key: "InactiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter inactive_date : Time?

        # The final date that the certificate is valid.
        @[JSON::Field(key: "NotAfterDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_after_date : Time?

        # The earliest date that the certificate is valid.
        @[JSON::Field(key: "NotBeforeDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_before_date : Time?

        # The serial number for the certificate.
        @[JSON::Field(key: "Serial")]
        getter serial : String?

        # A certificate's status can be either ACTIVE or INACTIVE . You can set ActiveDate and InactiveDate in
        # the UpdateCertificate call. If you set values for these parameters, those values are used to
        # determine whether the certificate has a status of ACTIVE or INACTIVE . If you don't set values for
        # ActiveDate and InactiveDate , we use the NotBefore and NotAfter date as specified on the X509
        # certificate to determine when a certificate is active and when it is inactive.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Key-value pairs that can be used to group and search for certificates.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # If a private key has been specified for the certificate, its type is CERTIFICATE_WITH_PRIVATE_KEY .
        # If there is no private key, the type is CERTIFICATE .
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Specifies how this certificate is used. It can be used in the following ways: SIGNING : For signing
        # AS2 messages ENCRYPTION : For encrypting AS2 messages TLS : For securing AS2 communications sent
        # over HTTPS
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @arn : String,
          @active_date : Time? = nil,
          @certificate : String? = nil,
          @certificate_chain : String? = nil,
          @certificate_id : String? = nil,
          @description : String? = nil,
          @inactive_date : Time? = nil,
          @not_after_date : Time? = nil,
          @not_before_date : Time? = nil,
          @serial : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @usage : String? = nil
        )
        end
      end

      # Describes the parameters for the connector, as identified by the ConnectorId .
      struct DescribedConnector
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) for the connector.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Type of egress configuration for the connector. SERVICE_MANAGED uses Transfer Family managed NAT
        # gateways, while VPC_LATTICE routes traffic through customer VPCs using VPC Lattice.
        @[JSON::Field(key: "EgressType")]
        getter egress_type : String

        # Current status of the connector. PENDING indicates creation/update in progress, ACTIVE means ready
        # for operations, and ERRORED indicates a failure requiring attention.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String?

        # A structure that contains the parameters for an AS2 connector object.
        @[JSON::Field(key: "As2Config")]
        getter as2_config : Types::As2ConnectorConfig?

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String?

        # Current egress configuration of the connector, showing how traffic is routed to the SFTP server.
        # Contains VPC Lattice settings when using VPC_LATTICE egress type. When using the VPC_LATTICE egress
        # type, Transfer Family uses a managed Service Network to simplify the resource sharing process.
        @[JSON::Field(key: "EgressConfig")]
        getter egress_config : Types::DescribedConnectorEgressConfig?

        # Error message providing details when the connector is in ERRORED status. Contains information to
        # help troubleshoot connector creation or operation failures.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a
        # connector to turn on CloudWatch logging for Amazon S3 events. When set, you can view connector
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # The text name of the security policy for the specified connector.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # The list of egress IP addresses of this connector. These IP addresses are assigned automatically
        # when you create the connector.
        @[JSON::Field(key: "ServiceManagedEgressIpAddresses")]
        getter service_managed_egress_ip_addresses : Array(String)?

        # A structure that contains the parameters for an SFTP connector object.
        @[JSON::Field(key: "SftpConfig")]
        getter sftp_config : Types::SftpConnectorConfig?

        # Key-value pairs that can be used to group and search for connectors.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The URL of the partner's AS2 or SFTP endpoint. When creating AS2 connectors or service-managed SFTP
        # connectors (connectors without egress configuration), you must provide a URL to specify the remote
        # server endpoint. For VPC Lattice type connectors, the URL must be null.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @arn : String,
          @egress_type : String,
          @status : String,
          @access_role : String? = nil,
          @as2_config : Types::As2ConnectorConfig? = nil,
          @connector_id : String? = nil,
          @egress_config : Types::DescribedConnectorEgressConfig? = nil,
          @error_message : String? = nil,
          @logging_role : String? = nil,
          @security_policy_name : String? = nil,
          @service_managed_egress_ip_addresses : Array(String)? = nil,
          @sftp_config : Types::SftpConnectorConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @url : String? = nil
        )
        end
      end

      # Response structure containing the current egress configuration details for the connector. Shows how
      # traffic is currently routed from the connector to the SFTP server.
      struct DescribedConnectorEgressConfig
        include JSON::Serializable

        # VPC_LATTICE configuration details in the response, showing the current Resource Configuration ARN
        # and port settings for VPC-based connectivity.
        @[JSON::Field(key: "VpcLattice")]
        getter vpc_lattice : Types::DescribedConnectorVpcLatticeEgressConfig?

        def initialize(
          @vpc_lattice : Types::DescribedConnectorVpcLatticeEgressConfig? = nil
        )
        end
      end

      # VPC_LATTICE egress configuration details in the response, containing the Resource Configuration ARN
      # and port number currently configured for the connector.
      struct DescribedConnectorVpcLatticeEgressConfig
        include JSON::Serializable

        # ARN of the VPC_LATTICE Resource Configuration currently used by the connector. This Resource
        # Configuration defines the network path to the SFTP server through the customer's VPC.
        @[JSON::Field(key: "ResourceConfigurationArn")]
        getter resource_configuration_arn : String

        # Port number currently configured for SFTP connections through VPC_LATTICE. Shows the port on which
        # the connector attempts to connect to the target SFTP server.
        @[JSON::Field(key: "PortNumber")]
        getter port_number : Int32?

        def initialize(
          @resource_configuration_arn : String,
          @port_number : Int32? = nil
        )
        end
      end

      # The details for an execution object.
      struct DescribedExecution
        include JSON::Serializable

        # A unique identifier for the execution of a workflow.
        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # The IAM role associated with the execution.
        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String?

        # A structure that describes the Amazon S3 or EFS file location. This is the file location when the
        # execution begins: if the file is being copied, this is the initial (as opposed to destination) file
        # location.
        @[JSON::Field(key: "InitialFileLocation")]
        getter initial_file_location : Types::FileLocation?

        # The IAM logging role associated with the execution.
        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # A structure that describes the execution results. This includes a list of the steps along with the
        # details of each step, error type and message (if any), and the OnExceptionSteps structure.
        @[JSON::Field(key: "Results")]
        getter results : Types::ExecutionResults?

        # A container object for the session details that are associated with a workflow.
        @[JSON::Field(key: "ServiceMetadata")]
        getter service_metadata : Types::ServiceMetadata?

        # The status is one of the execution. Can be in progress, completed, exception encountered, or
        # handling the exception.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @execution_id : String? = nil,
          @execution_role : String? = nil,
          @initial_file_location : Types::FileLocation? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @results : Types::ExecutionResults? = nil,
          @service_metadata : Types::ServiceMetadata? = nil,
          @status : String? = nil
        )
        end
      end

      # The details for a server host key.
      struct DescribedHostKey
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) for the host key.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date on which the host key was added to the server.
        @[JSON::Field(key: "DateImported", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_imported : Time?

        # The text description for this host key.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The public key fingerprint, which is a short sequence of bytes used to identify the longer public
        # key.
        @[JSON::Field(key: "HostKeyFingerprint")]
        getter host_key_fingerprint : String?

        # A unique identifier for the host key.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String?

        # Key-value pairs that can be used to group and search for host keys.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The encryption algorithm that is used for the host key. The Type parameter is specified by using one
        # of the following values: ssh-rsa ssh-ed25519 ecdsa-sha2-nistp256 ecdsa-sha2-nistp384
        # ecdsa-sha2-nistp521
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String,
          @date_imported : Time? = nil,
          @description : String? = nil,
          @host_key_fingerprint : String? = nil,
          @host_key_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end

      # A structure that contains the details of the IAM Identity Center used for your web app. Returned
      # during a call to DescribeWebApp .
      struct DescribedIdentityCenterConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the IAM Identity Center application: this value is set
        # automatically when you create your web app.
        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The Amazon Resource Name (ARN) for the IAM Identity Center used for the web app.
        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The IAM role in IAM Identity Center used for the web app.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @application_arn : String? = nil,
          @instance_arn : String? = nil,
          @role : String? = nil
        )
        end
      end

      # The details for a local or partner AS2 profile.
      struct DescribedProfile
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) for the profile.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The As2Id is the AS2-name , as defined in the RFC 4130 . For inbound transfers, this is the AS2-From
        # header for the AS2 messages sent from the partner. For outbound connectors, this is the AS2-To
        # header for the AS2 messages sent to the partner using the StartFileTransfer API operation. This ID
        # cannot include spaces.
        @[JSON::Field(key: "As2Id")]
        getter as2_id : String?

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateIds")]
        getter certificate_ids : Array(String)?

        # A unique identifier for the local or partner AS2 profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # Indicates whether to list only LOCAL type profiles or only PARTNER type profiles. If not supplied in
        # the request, the command lists all types of profiles.
        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        # Key-value pairs that can be used to group and search for profiles.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String,
          @as2_id : String? = nil,
          @certificate_ids : Array(String)? = nil,
          @profile_id : String? = nil,
          @profile_type : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes the properties of a security policy that you specify. For more information about security
      # policies, see Working with security policies for servers or Working with security policies for SFTP
      # connectors .
      struct DescribedSecurityPolicy
        include JSON::Serializable

        # The text name of the specified security policy.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String

        # Specifies whether this policy enables Federal Information Processing Standards (FIPS). This
        # parameter applies to both server and connector security policies.
        @[JSON::Field(key: "Fips")]
        getter fips : Bool?

        # Lists the file transfer protocols that the security policy applies to.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # Lists the enabled Secure Shell (SSH) cipher encryption algorithms in the security policy that is
        # attached to the server or connector. This parameter applies to both server and connector security
        # policies.
        @[JSON::Field(key: "SshCiphers")]
        getter ssh_ciphers : Array(String)?

        # Lists the host key algorithms for the security policy. This parameter only applies to security
        # policies for connectors.
        @[JSON::Field(key: "SshHostKeyAlgorithms")]
        getter ssh_host_key_algorithms : Array(String)?

        # Lists the enabled SSH key exchange (KEX) encryption algorithms in the security policy that is
        # attached to the server or connector. This parameter applies to both server and connector security
        # policies.
        @[JSON::Field(key: "SshKexs")]
        getter ssh_kexs : Array(String)?

        # Lists the enabled SSH message authentication code (MAC) encryption algorithms in the security policy
        # that is attached to the server or connector. This parameter applies to both server and connector
        # security policies.
        @[JSON::Field(key: "SshMacs")]
        getter ssh_macs : Array(String)?

        # Lists the enabled Transport Layer Security (TLS) cipher encryption algorithms in the security policy
        # that is attached to the server. This parameter only applies to security policies for servers.
        @[JSON::Field(key: "TlsCiphers")]
        getter tls_ciphers : Array(String)?

        # The resource type to which the security policy applies, either server or connector.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @security_policy_name : String,
          @fips : Bool? = nil,
          @protocols : Array(String)? = nil,
          @ssh_ciphers : Array(String)? = nil,
          @ssh_host_key_algorithms : Array(String)? = nil,
          @ssh_kexs : Array(String)? = nil,
          @ssh_macs : Array(String)? = nil,
          @tls_ciphers : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the properties of a file transfer protocol-enabled server that was specified.
      struct DescribedServer
        include JSON::Serializable

        # Specifies the unique Amazon Resource Name (ARN) of the server.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The list of egress IP addresses of this server. These IP addresses are only relevant for servers
        # that use the AS2 protocol. They are used for sending asynchronous MDNs. These IP addresses are
        # assigned automatically when you create an AS2 server. Additionally, if you update an existing server
        # and add the AS2 protocol, static IP addresses are assigned as well.
        @[JSON::Field(key: "As2ServiceManagedEgressIpAddresses")]
        getter as2_service_managed_egress_ip_addresses : Array(String)?

        # Specifies the ARN of the Amazon Web ServicesCertificate Manager (ACM) certificate. Required when
        # Protocols is set to FTPS .
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # Specifies the domain of the storage system that is used for file transfers. There are two domains
        # available: Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File System (Amazon EFS).
        # The default value is S3.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # The virtual private cloud (VPC) endpoint settings that are configured for your server. When you host
        # your endpoint within your VPC, you can make your endpoint accessible only to resources within your
        # VPC, or you can attach Elastic IP addresses and make your endpoint accessible to clients over the
        # internet. Your VPC's default security groups are automatically assigned to your endpoint.
        @[JSON::Field(key: "EndpointDetails")]
        getter endpoint_details : Types::EndpointDetails?

        # Defines the type of endpoint that your server is connected to. If your server is connected to a VPC
        # endpoint, your server isn't accessible over the public internet.
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # Specifies the Base64-encoded SHA256 fingerprint of the server's host key. This value is equivalent
        # to the output of the ssh-keygen -l -f my-new-server-key command.
        @[JSON::Field(key: "HostKeyFingerprint")]
        getter host_key_fingerprint : String?

        # Specifies information to call a customer-supplied authentication API. This field is not populated
        # when the IdentityProviderType of a server is AWS_DIRECTORY_SERVICE or SERVICE_MANAGED .
        @[JSON::Field(key: "IdentityProviderDetails")]
        getter identity_provider_details : Types::IdentityProviderDetails?

        # The mode of authentication for a server. The default value is SERVICE_MANAGED , which allows you to
        # store and access user credentials within the Transfer Family service. Use AWS_DIRECTORY_SERVICE to
        # provide access to Active Directory groups in Directory Service for Microsoft Active Directory or
        # Microsoft Active Directory in your on-premises environment or in Amazon Web Services using AD
        # Connector. This option also requires you to provide a Directory ID by using the
        # IdentityProviderDetails parameter. Use the API_GATEWAY value to integrate with an identity provider
        # of your choosing. The API_GATEWAY setting requires you to provide an Amazon API Gateway endpoint URL
        # to call for authentication by using the IdentityProviderDetails parameter. Use the AWS_LAMBDA value
        # to directly use an Lambda function as your identity provider. If you choose this value, you must
        # specify the ARN for the Lambda function in the Function parameter for the IdentityProviderDetails
        # data type.
        @[JSON::Field(key: "IdentityProviderType")]
        getter identity_provider_type : String?

        # Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your Transfer Family
        # endpoint. The default value is IPV4 . The IpAddressType parameter has the following limitations: It
        # cannot be changed while the server is online. You must stop the server before modifying this
        # parameter. It cannot be updated to DUALSTACK if the server has AddressAllocationIds specified. When
        # using DUALSTACK as the IpAddressType , you cannot set the AddressAllocationIds parameter for the
        # EndpointDetails for the server.
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a server
        # to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set, you can view user
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies a string to display when users connect to a server. This string is displayed after the
        # user authenticates. The SFTP protocol does not support post-authentication display banners.
        @[JSON::Field(key: "PostAuthenticationLoginBanner")]
        getter post_authentication_login_banner : String?

        # Specifies a string to display when users connect to a server. This string is displayed before the
        # user authenticates. For example, the following banner displays details about using the system: This
        # system is for the use of authorized users only. Individuals using this computer system without
        # authority, or in excess of their authority, are subject to having all of their activities on this
        # system monitored and recorded by system personnel.
        @[JSON::Field(key: "PreAuthenticationLoginBanner")]
        getter pre_authentication_login_banner : String?

        # The protocol settings that are configured for your server. Avoid placing Network Load Balancers
        # (NLBs) or NAT gateways in front of Transfer Family servers, as this increases costs and can cause
        # performance issues, including reduced connection limits for FTPS. For more details, see Avoid
        # placing NLBs and NATs in front of Transfer Family . To indicate passive mode (for FTP and FTPS
        # protocols), use the PassiveIp parameter. Enter a single dotted-quad IPv4 address, such as the
        # external IP address of a firewall, router, or load balancer. To ignore the error that is generated
        # when the client attempts to use the SETSTAT command on a file that you are uploading to an Amazon S3
        # bucket, use the SetStatOption parameter. To have the Transfer Family server ignore the SETSTAT
        # command and upload files without needing to make any changes to your SFTP client, set the value to
        # ENABLE_NO_OP . If you set the SetStatOption parameter to ENABLE_NO_OP , Transfer Family generates a
        # log entry to Amazon CloudWatch Logs, so that you can determine when the client is making a SETSTAT
        # call. To determine whether your Transfer Family server resumes recent, negotiated sessions through a
        # unique session ID, use the TlsSessionResumptionMode parameter. As2Transports indicates the transport
        # method for the AS2 messages. Currently, only HTTP is supported.
        @[JSON::Field(key: "ProtocolDetails")]
        getter protocol_details : Types::ProtocolDetails?

        # Specifies the file transfer protocol or protocols over which your file transfer protocol client can
        # connect to your server's endpoint. The available protocols are: SFTP (Secure Shell (SSH) File
        # Transfer Protocol): File transfer over SSH FTPS (File Transfer Protocol Secure): File transfer with
        # TLS encryption FTP (File Transfer Protocol): Unencrypted file transfer AS2 (Applicability Statement
        # 2): used for transporting structured business-to-business data If you select FTPS , you must choose
        # a certificate stored in Certificate Manager (ACM) which is used to identify your server when clients
        # connect to it over FTPS. If Protocol includes either FTP or FTPS , then the EndpointType must be VPC
        # and the IdentityProviderType must be either AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes FTP , then AddressAllocationIds cannot be associated. If Protocol is set only to
        # SFTP , the EndpointType can be set to PUBLIC and the IdentityProviderType can be set any of the
        # supported identity types: SERVICE_MANAGED , AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes AS2 , then the EndpointType must be VPC , and domain must be Amazon S3.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # Specifies whether or not performance for your Amazon S3 directories is optimized. If using the
        # console, this is enabled by default. If using the API or CLI, this is disabled by default. By
        # default, home directory mappings have a TYPE of DIRECTORY . If you enable this option, you would
        # then need to explicitly set the HomeDirectoryMapEntry Type to FILE if you want a mapping to have a
        # file target.
        @[JSON::Field(key: "S3StorageOptions")]
        getter s3_storage_options : Types::S3StorageOptions?

        # Specifies the name of the security policy for the server.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # Specifies the unique system-assigned identifier for a server that you instantiate.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String?

        # The condition of the server that was described. A value of ONLINE indicates that the server can
        # accept jobs and transfer files. A State value of OFFLINE means that the server cannot perform file
        # transfer operations. The states of STARTING and STOPPING indicate that the server is in an
        # intermediate state, either not fully able to respond, or not fully offline. The values of
        # START_FAILED or STOP_FAILED can indicate an error condition.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Specifies the log groups to which your server logs are sent. To specify a log group, you must
        # provide the ARN for an existing log group. In this case, the format of the log group is as follows:
        # arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:* For example,
        # arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:* If you have previously specified a log
        # group for a server, you can clear it, and in effect turn off structured logging, by providing an
        # empty value for this parameter in an update-server call. For example: update-server --server-id
        # s-1234567890abcdef0 --structured-log-destinations
        @[JSON::Field(key: "StructuredLogDestinations")]
        getter structured_log_destinations : Array(String)?

        # Specifies the key-value pairs that you can use to search for and group servers that were assigned to
        # the server that was described.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the number of users that are assigned to a server you specified with the ServerId .
        @[JSON::Field(key: "UserCount")]
        getter user_count : Int32?

        # Specifies the workflow ID for the workflow to assign and the execution role that's used for
        # executing the workflow. In addition to a workflow to execute when a file is uploaded completely,
        # WorkflowDetails can also contain a workflow ID (and execution role) for a workflow to execute on
        # partial upload. A partial upload occurs when the server session disconnects while the file is still
        # being uploaded.
        @[JSON::Field(key: "WorkflowDetails")]
        getter workflow_details : Types::WorkflowDetails?

        def initialize(
          @arn : String,
          @as2_service_managed_egress_ip_addresses : Array(String)? = nil,
          @certificate : String? = nil,
          @domain : String? = nil,
          @endpoint_details : Types::EndpointDetails? = nil,
          @endpoint_type : String? = nil,
          @host_key_fingerprint : String? = nil,
          @identity_provider_details : Types::IdentityProviderDetails? = nil,
          @identity_provider_type : String? = nil,
          @ip_address_type : String? = nil,
          @logging_role : String? = nil,
          @post_authentication_login_banner : String? = nil,
          @pre_authentication_login_banner : String? = nil,
          @protocol_details : Types::ProtocolDetails? = nil,
          @protocols : Array(String)? = nil,
          @s3_storage_options : Types::S3StorageOptions? = nil,
          @security_policy_name : String? = nil,
          @server_id : String? = nil,
          @state : String? = nil,
          @structured_log_destinations : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_count : Int32? = nil,
          @workflow_details : Types::WorkflowDetails? = nil
        )
        end
      end

      # Describes the properties of a user that was specified.
      struct DescribedUser
        include JSON::Serializable

        # Specifies the unique Amazon Resource Name (ARN) for the user that was requested to be described.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . In most cases, you can use this value instead of the
        # session policy to lock your user down to the designated home directory (" chroot "). To do this, you
        # can set Entry to '/' and set Target to the HomeDirectory parameter value.
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Specifies the full POSIX identity, including user ID ( Uid ), group ID ( Gid ), and any secondary
        # groups IDs ( SecondaryGids ), that controls your users' access to your Amazon Elastic File System
        # (Amazon EFS) file systems. The POSIX permissions that are set on files and directories in your file
        # system determine the level of access your users get when transferring files into and out of your
        # Amazon EFS file systems.
        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # Specifies the public key portion of the Secure Shell (SSH) keys stored for the described user. To
        # delete the public key body, set its value to zero keys, as shown here: SshPublicKeys: []
        @[JSON::Field(key: "SshPublicKeys")]
        getter ssh_public_keys : Array(Types::SshPublicKey)?

        # Specifies the key-value pairs for the user requested. Tag can be used to search for and group users
        # for a variety of purposes.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the name of the user that was requested to be described. User names are used for
        # authentication purposes. This is the string that will be used by your user when they log in to your
        # server.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @arn : String,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @role : String? = nil,
          @ssh_public_keys : Array(Types::SshPublicKey)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_name : String? = nil
        )
        end
      end

      # A structure that describes the parameters for the web app, as identified by the WebAppId .
      struct DescribedWebApp
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web app.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The unique identifier for the web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        # The AccessEndpoint is the URL that you provide to your users for them to interact with the Transfer
        # Family web app. You can specify a custom URL or use the default value.
        @[JSON::Field(key: "AccessEndpoint")]
        getter access_endpoint : String?

        # The endpoint configuration details for the web app, including VPC settings if the endpoint is hosted
        # within a VPC.
        @[JSON::Field(key: "DescribedEndpointDetails")]
        getter described_endpoint_details : Types::DescribedWebAppEndpointDetails?

        # A structure that contains the details for the identity provider used by the web app.
        @[JSON::Field(key: "DescribedIdentityProviderDetails")]
        getter described_identity_provider_details : Types::DescribedWebAppIdentityProviderDetails?

        # The type of endpoint hosting the web app. Valid values are PUBLIC for publicly accessible endpoints
        # and VPC for VPC-hosted endpoints that provide network isolation.
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # Key-value pairs that can be used to group and search for web apps. Tags are metadata attached to web
        # apps for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The WebAppEndpoint is the unique URL for your Transfer Family web app. This is the value that you
        # use when you configure Origins on CloudFront.
        @[JSON::Field(key: "WebAppEndpoint")]
        getter web_app_endpoint : String?

        # Setting for the type of endpoint policy for the web app. The default value is STANDARD . If your web
        # app was created in an Amazon Web Services GovCloud (US) Region, the value of this parameter can be
        # FIPS , which indicates the web app endpoint is FIPS-compliant.
        @[JSON::Field(key: "WebAppEndpointPolicy")]
        getter web_app_endpoint_policy : String?

        # A union that contains the value for number of concurrent connections or the user sessions on your
        # web app.
        @[JSON::Field(key: "WebAppUnits")]
        getter web_app_units : Types::WebAppUnits?

        def initialize(
          @arn : String,
          @web_app_id : String,
          @access_endpoint : String? = nil,
          @described_endpoint_details : Types::DescribedWebAppEndpointDetails? = nil,
          @described_identity_provider_details : Types::DescribedWebAppIdentityProviderDetails? = nil,
          @endpoint_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @web_app_endpoint : String? = nil,
          @web_app_endpoint_policy : String? = nil,
          @web_app_units : Types::WebAppUnits? = nil
        )
        end
      end

      # A structure that contains the customization fields for the web app. You can provide a title, logo,
      # and icon to customize the appearance of your web app.
      struct DescribedWebAppCustomization
        include JSON::Serializable

        # Returns the Amazon Resource Name (ARN) for the web app.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Returns the unique identifier for your web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        # Returns an icon file data string (in base64 encoding).
        @[JSON::Field(key: "FaviconFile")]
        getter favicon_file : Bytes?

        # Returns a logo file data string (in base64 encoding).
        @[JSON::Field(key: "LogoFile")]
        getter logo_file : Bytes?

        # Returns the page title that you defined for your web app.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @arn : String,
          @web_app_id : String,
          @favicon_file : Bytes? = nil,
          @logo_file : Bytes? = nil,
          @title : String? = nil
        )
        end
      end

      # Contains the endpoint configuration details for a web app, including VPC configuration when the
      # endpoint is hosted within a VPC.
      struct DescribedWebAppEndpointDetails
        include JSON::Serializable

        # The VPC configuration details when the web app endpoint is hosted within a VPC. This includes the
        # VPC ID, subnet IDs, and VPC endpoint ID.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::DescribedWebAppVpcConfig?

        def initialize(
          @vpc : Types::DescribedWebAppVpcConfig? = nil
        )
        end
      end

      # Returns a structure that contains the identity provider details for your web app.
      struct DescribedWebAppIdentityProviderDetails
        include JSON::Serializable

        # Returns a structure for your identity provider details. This structure contains the instance ARN and
        # role being used for the web app.
        @[JSON::Field(key: "IdentityCenterConfig")]
        getter identity_center_config : Types::DescribedIdentityCenterConfig?

        def initialize(
          @identity_center_config : Types::DescribedIdentityCenterConfig? = nil
        )
        end
      end

      # Contains the VPC configuration details for a web app endpoint, including the VPC identifier, subnet
      # IDs, and VPC endpoint ID used for hosting the endpoint.
      struct DescribedWebAppVpcConfig
        include JSON::Serializable

        # The list of subnet IDs within the VPC where the web app endpoint is deployed. These subnets must be
        # in the same VPC and provide network connectivity for the endpoint.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC endpoint created for the web app.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The identifier of the VPC where the web app endpoint is hosted.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @subnet_ids : Array(String)? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Describes the properties of the specified workflow
      struct DescribedWorkflow
        include JSON::Serializable

        # Specifies the unique Amazon Resource Name (ARN) for the workflow.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Specifies the text description for the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the steps (actions) to take if errors are encountered during execution of the workflow.
        @[JSON::Field(key: "OnExceptionSteps")]
        getter on_exception_steps : Array(Types::WorkflowStep)?

        # Specifies the details for the steps that are in the specified workflow.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::WorkflowStep)?

        # Key-value pairs that can be used to group and search for workflows. Tags are metadata attached to
        # workflows for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        def initialize(
          @arn : String,
          @description : String? = nil,
          @on_exception_steps : Array(Types::WorkflowStep)? = nil,
          @steps : Array(Types::WorkflowStep)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      # Specifies the details for the file location for the file that's being used in the workflow. Only
      # applicable if you are using Amazon Elastic File Systems (Amazon EFS) for storage.
      struct EfsFileLocation
        include JSON::Serializable

        # The identifier of the file system, assigned by Amazon EFS.
        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String?

        # The pathname for the folder being used by a workflow.
        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @file_system_id : String? = nil,
          @path : String? = nil
        )
        end
      end

      # The virtual private cloud (VPC) endpoint settings that are configured for your file transfer
      # protocol-enabled server. With a VPC endpoint, you can restrict access to your server and resources
      # only within your VPC. To control incoming internet traffic, invoke the UpdateServer API and attach
      # an Elastic IP address to your server's endpoint. After May 19, 2021, you won't be able to create a
      # server using EndpointType=VPC_ENDPOINT in your Amazon Web Services account if your account hasn't
      # already done so before May 19, 2021. If you have already created servers with
      # EndpointType=VPC_ENDPOINT in your Amazon Web Services account on or before May 19, 2021, you will
      # not be affected. After this date, use EndpointType = VPC . For more information, see
      # https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
      # It is recommended that you use VPC as the EndpointType . With this endpoint type, you have the
      # option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with your server's
      # endpoint and use VPC security groups to restrict traffic by the client's public IP address. This is
      # not possible with EndpointType set to VPC_ENDPOINT .
      struct EndpointDetails
        include JSON::Serializable

        # A list of address allocation IDs that are required to attach an Elastic IP address to your server's
        # endpoint. An address allocation ID corresponds to the allocation ID of an Elastic IP address. This
        # value can be retrieved from the allocationId field from the Amazon EC2 Address data type. One way to
        # retrieve this value is by calling the EC2 DescribeAddresses API. This parameter is optional. Set
        # this parameter if you want to make your VPC endpoint public-facing. For details, see Create an
        # internet-facing endpoint for your server . This property can only be set as follows: EndpointType
        # must be set to VPC The Transfer Family server must be offline. You cannot set this parameter for
        # Transfer Family servers that use the FTP protocol. The server must already have SubnetIds populated
        # ( SubnetIds and AddressAllocationIds cannot be updated simultaneously). AddressAllocationIds can't
        # contain duplicates, and must be equal in length to SubnetIds . For example, if you have three subnet
        # IDs, you must also specify three address allocation IDs. Call the UpdateServer API to set or change
        # this parameter. You can't set address allocation IDs for servers that have an IpAddressType set to
        # DUALSTACK You can only set this property if IpAddressType is set to IPV4 .
        @[JSON::Field(key: "AddressAllocationIds")]
        getter address_allocation_ids : Array(String)?

        # A list of security groups IDs that are available to attach to your server's endpoint. While
        # SecurityGroupIds appears in the response syntax for consistency with CreateServer and UpdateServer
        # operations, this field is not populated in DescribeServer responses. Security groups are managed at
        # the VPC endpoint level and can be modified outside of the Transfer Family service. To retrieve
        # current security group information, use the EC2 DescribeVpcEndpoints API with the VpcEndpointId
        # returned in the response. This property can only be set when EndpointType is set to VPC . You can
        # edit the SecurityGroupIds property in the UpdateServer API only if you are changing the EndpointType
        # from PUBLIC or VPC_ENDPOINT to VPC . To change security groups associated with your server's VPC
        # endpoint after creation, use the Amazon EC2 ModifyVpcEndpoint API.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of subnet IDs that are required to host your server endpoint in your VPC. This property can
        # only be set when EndpointType is set to VPC .
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC endpoint. This property can only be set when EndpointType is set to
        # VPC_ENDPOINT . For more information, see
        # https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
        @[JSON::Field(key: "VpcEndpointId")]
        getter vpc_endpoint_id : String?

        # The VPC identifier of the VPC in which a server's endpoint will be hosted. This property can only be
        # set when EndpointType is set to VPC .
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @address_allocation_ids : Array(String)? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_endpoint_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Specifies the error message and type, for an error that occurs during the execution of the workflow.
      struct ExecutionError
        include JSON::Serializable

        # Specifies the descriptive message that corresponds to the ErrorType .
        @[JSON::Field(key: "Message")]
        getter message : String

        # Specifies the error type. ALREADY_EXISTS : occurs for a copy step, if the overwrite option is not
        # selected and a file with the same name already exists in the target location. BAD_REQUEST : a
        # general bad request: for example, a step that attempts to tag an EFS file returns BAD_REQUEST , as
        # only S3 files can be tagged. CUSTOM_STEP_FAILED : occurs when the custom step provided a callback
        # that indicates failure. INTERNAL_SERVER_ERROR : a catch-all error that can occur for a variety of
        # reasons. NOT_FOUND : occurs when a requested entity, for example a source file for a copy step, does
        # not exist. PERMISSION_DENIED : occurs if your policy does not contain the correct permissions to
        # complete one or more of the steps in the workflow. TIMEOUT : occurs when the execution times out.
        # You can set the TimeoutSeconds for a custom step, anywhere from 1 second to 1800 seconds (30
        # minutes). THROTTLED : occurs if you exceed the new execution refill rate of one workflow per second.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @message : String,
          @type : String
        )
        end
      end

      # Specifies the steps in the workflow, as well as the steps to execute in case of any errors during
      # workflow execution.
      struct ExecutionResults
        include JSON::Serializable

        # Specifies the steps (actions) to take if errors are encountered during execution of the workflow.
        @[JSON::Field(key: "OnExceptionSteps")]
        getter on_exception_steps : Array(Types::ExecutionStepResult)?

        # Specifies the details for the steps that are in the specified workflow.
        @[JSON::Field(key: "Steps")]
        getter steps : Array(Types::ExecutionStepResult)?

        def initialize(
          @on_exception_steps : Array(Types::ExecutionStepResult)? = nil,
          @steps : Array(Types::ExecutionStepResult)? = nil
        )
        end
      end

      # Specifies the following details for the step: error (if any), outputs (if any), and the step type.
      struct ExecutionStepResult
        include JSON::Serializable

        # Specifies the details for an error, if it occurred during execution of the specified workflow step.
        @[JSON::Field(key: "Error")]
        getter error : Types::ExecutionError?

        # The values for the key/value pair applied as a tag to the file. Only applicable if the step type is
        # TAG .
        @[JSON::Field(key: "Outputs")]
        getter outputs : String?

        # One of the available step types. COPY - Copy the file to another location. CUSTOM - Perform a custom
        # step with an Lambda function target. DECRYPT - Decrypt a file that was encrypted before it was
        # uploaded. DELETE - Delete the file. TAG - Add a tag to the file.
        @[JSON::Field(key: "StepType")]
        getter step_type : String?

        def initialize(
          @error : Types::ExecutionError? = nil,
          @outputs : String? = nil,
          @step_type : String? = nil
        )
        end
      end

      # Specifies the Amazon S3 or EFS file details to be used in the step.
      struct FileLocation
        include JSON::Serializable

        # Specifies the Amazon EFS identifier and the path for the file being used.
        @[JSON::Field(key: "EfsFileLocation")]
        getter efs_file_location : Types::EfsFileLocation?

        # Specifies the S3 details for the file being used, such as bucket, ETag, and so forth.
        @[JSON::Field(key: "S3FileLocation")]
        getter s3_file_location : Types::S3FileLocation?

        def initialize(
          @efs_file_location : Types::EfsFileLocation? = nil,
          @s3_file_location : Types::S3FileLocation? = nil
        )
        end
      end

      # Represents an object that contains entries and targets for HomeDirectoryMappings . The following is
      # an Entry and Target pair example for chroot . [ { "Entry": "/", "Target":
      # "/bucket_name/home/mydirectory" } ]
      struct HomeDirectoryMapEntry
        include JSON::Serializable

        # Represents an entry for HomeDirectoryMappings .
        @[JSON::Field(key: "Entry")]
        getter entry : String

        # Represents the map target that is used in a HomeDirectoryMapEntry .
        @[JSON::Field(key: "Target")]
        getter target : String

        # Specifies the type of mapping. Set the type to FILE if you want the mapping to point to a file, or
        # DIRECTORY for the directory to point to a directory. By default, home directory mappings have a Type
        # of DIRECTORY when you create a Transfer Family server. You would need to explicitly set Type to FILE
        # if you want a mapping to have a file target.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @entry : String,
          @target : String,
          @type : String? = nil
        )
        end
      end

      # A structure that describes the values to use for the IAM Identity Center settings when you create or
      # update a web app.
      struct IdentityCenterConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the IAM Identity Center used for the web app.
        @[JSON::Field(key: "InstanceArn")]
        getter instance_arn : String?

        # The IAM role in IAM Identity Center used for the web app.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @instance_arn : String? = nil,
          @role : String? = nil
        )
        end
      end

      # Returns information related to the type of user authentication that is in use for a file transfer
      # protocol-enabled server's users. A server can have only one method of authentication.
      struct IdentityProviderDetails
        include JSON::Serializable

        # The identifier of the Directory Service directory that you want to use as your identity provider.
        @[JSON::Field(key: "DirectoryId")]
        getter directory_id : String?

        # The ARN for a Lambda function to use for the Identity provider.
        @[JSON::Field(key: "Function")]
        getter function : String?

        # This parameter is only applicable if your IdentityProviderType is API_GATEWAY . Provides the type of
        # InvocationRole used to authenticate the user account.
        @[JSON::Field(key: "InvocationRole")]
        getter invocation_role : String?

        # For SFTP-enabled servers, and for custom identity providers only , you can specify whether to
        # authenticate using a password, SSH key pair, or both. PASSWORD - users must provide their password
        # to connect. PUBLIC_KEY - users must provide their private key to connect. PUBLIC_KEY_OR_PASSWORD -
        # users can authenticate with either their password or their key. This is the default value.
        # PUBLIC_KEY_AND_PASSWORD - users must provide both their private key and their password to connect.
        # The server checks the key first, and then if the key is valid, the system prompts for a password. If
        # the private key provided does not match the public key that is stored, authentication fails.
        @[JSON::Field(key: "SftpAuthenticationMethods")]
        getter sftp_authentication_methods : String?

        # Provides the location of the service endpoint used to authenticate users.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @directory_id : String? = nil,
          @function : String? = nil,
          @invocation_role : String? = nil,
          @sftp_authentication_methods : String? = nil,
          @url : String? = nil
        )
        end
      end

      struct ImportCertificateRequest
        include JSON::Serializable

        # For the CLI, provide a file path for a certificate in URI format. For example, --certificate
        # file://encryption-cert.pem . Alternatively, you can provide the raw content. For the SDK, specify
        # the raw content of a certificate file. For example, --certificate "`cat encryption-cert.pem`" . You
        # can provide both the certificate and its chain in this parameter, without needing to use the
        # CertificateChain parameter. If you use this parameter for both the certificate and its chain, do not
        # use the CertificateChain parameter.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String

        # Specifies how this certificate is used. It can be used in the following ways: SIGNING : For signing
        # AS2 messages ENCRYPTION : For encrypting AS2 messages TLS : For securing AS2 communications sent
        # over HTTPS
        @[JSON::Field(key: "Usage")]
        getter usage : String

        # An optional date that specifies when the certificate becomes active. If you do not specify a value,
        # ActiveDate takes the same value as NotBeforeDate , which is specified by the CA.
        @[JSON::Field(key: "ActiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_date : Time?

        # An optional list of certificates that make up the chain for the certificate that's being imported.
        @[JSON::Field(key: "CertificateChain")]
        getter certificate_chain : String?

        # A short description that helps identify the certificate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional date that specifies when the certificate becomes inactive. If you do not specify a
        # value, InactiveDate takes the same value as NotAfterDate , which is specified by the CA.
        @[JSON::Field(key: "InactiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter inactive_date : Time?

        # For the CLI, provide a file path for a private key in URI format. For example, --private-key
        # file://encryption-key.pem . Alternatively, you can provide the raw content of the private key file.
        # For the SDK, specify the raw content of a private key file. For example, --private-key "`cat
        # encryption-key.pem`"
        @[JSON::Field(key: "PrivateKey")]
        getter private_key : String?

        # Key-value pairs that can be used to group and search for certificates.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate : String,
          @usage : String,
          @active_date : Time? = nil,
          @certificate_chain : String? = nil,
          @description : String? = nil,
          @inactive_date : Time? = nil,
          @private_key : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportCertificateResponse
        include JSON::Serializable

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      struct ImportHostKeyRequest
        include JSON::Serializable

        # The private key portion of an SSH key pair. Transfer Family accepts RSA, ECDSA, and ED25519 keys.
        @[JSON::Field(key: "HostKeyBody")]
        getter host_key_body : String

        # The identifier of the server that contains the host key that you are importing.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The text description that identifies this host key.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Key-value pairs that can be used to group and search for host keys.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @host_key_body : String,
          @server_id : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportHostKeyResponse
        include JSON::Serializable

        # Returns the host key identifier for the imported key.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String

        # Returns the server identifier that contains the imported key.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @host_key_id : String,
          @server_id : String
        )
        end
      end

      struct ImportSshPublicKeyRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The public key portion of an SSH key pair. Transfer Family accepts RSA, ECDSA, and ED25519 keys.
        @[JSON::Field(key: "SshPublicKeyBody")]
        getter ssh_public_key_body : String

        # The name of the Transfer Family user that is assigned to one or more servers.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @ssh_public_key_body : String,
          @user_name : String
        )
        end
      end

      # Identifies the user, the server they belong to, and the identifier of the SSH public key associated
      # with that user. A user can have more than one key on each server that they are associated with.
      struct ImportSshPublicKeyResponse
        include JSON::Serializable

        # A system-assigned unique identifier for a server.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The name given to a public key by the system that was imported.
        @[JSON::Field(key: "SshPublicKeyId")]
        getter ssh_public_key_id : String

        # A user name assigned to the ServerID value that you specified.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @ssh_public_key_id : String,
          @user_name : String
        )
        end
      end

      # Specifies the location for the file that's being processed.
      struct InputFileLocation
        include JSON::Serializable

        # Specifies the details for the Amazon Elastic File System (Amazon EFS) file that's being decrypted.
        @[JSON::Field(key: "EfsFileLocation")]
        getter efs_file_location : Types::EfsFileLocation?

        # Specifies the details for the Amazon S3 file that's being copied or decrypted.
        @[JSON::Field(key: "S3FileLocation")]
        getter s3_file_location : Types::S3InputFileLocation?

        def initialize(
          @efs_file_location : Types::EfsFileLocation? = nil,
          @s3_file_location : Types::S3InputFileLocation? = nil
        )
        end
      end

      # This exception is thrown when an error occurs in the Transfer Family service.
      struct InternalServiceError
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The NextToken parameter that was passed is invalid.
      struct InvalidNextTokenException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # This exception is thrown when the client submits a malformed request.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct ListAccessesRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server that has users assigned to it.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you can get additional results from the ListAccesses call, a NextToken parameter is returned in
        # the output. You can then pass in a subsequent command to the NextToken parameter to continue listing
        # additional accesses.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAccessesResponse
        include JSON::Serializable

        # Returns the accesses and their properties for the ServerId value that you specify.
        @[JSON::Field(key: "Accesses")]
        getter accesses : Array(Types::ListedAccess)

        # A system-assigned unique identifier for a server that has users assigned to it.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # When you can get additional results from the ListAccesses call, a NextToken parameter is returned in
        # the output. You can then pass in a subsequent command to the NextToken parameter to continue listing
        # additional accesses.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accesses : Array(Types::ListedAccess),
          @server_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListAgreementsRequest
        include JSON::Serializable

        # The identifier of the server for which you want a list of agreements.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you can get additional results from the ListAgreements call, a NextToken parameter is returned
        # in the output. You can then pass in a subsequent command to the NextToken parameter to continue
        # listing additional agreements.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAgreementsResponse
        include JSON::Serializable

        # Returns an array, where each item contains the details of an agreement.
        @[JSON::Field(key: "Agreements")]
        getter agreements : Array(Types::ListedAgreement)

        # Returns a token that you can use to call ListAgreements again and receive additional results, if
        # there are any.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @agreements : Array(Types::ListedAgreement),
          @next_token : String? = nil
        )
        end
      end

      struct ListCertificatesRequest
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you can get additional results from the ListCertificates call, a NextToken parameter is
        # returned in the output. You can then pass in a subsequent command to the NextToken parameter to
        # continue listing additional certificates.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCertificatesResponse
        include JSON::Serializable

        # Returns an array of the certificates that are specified in the ListCertificates call.
        @[JSON::Field(key: "Certificates")]
        getter certificates : Array(Types::ListedCertificate)

        # Returns the next token, which you can use to list the next certificate.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @certificates : Array(Types::ListedCertificate),
          @next_token : String? = nil
        )
        end
      end

      struct ListConnectorsRequest
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you can get additional results from the ListConnectors call, a NextToken parameter is returned
        # in the output. You can then pass in a subsequent command to the NextToken parameter to continue
        # listing additional connectors.
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

        # Returns an array, where each item contains the details of a connector.
        @[JSON::Field(key: "Connectors")]
        getter connectors : Array(Types::ListedConnector)

        # Returns a token that you can use to call ListConnectors again and receive additional results, if
        # there are any.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connectors : Array(Types::ListedConnector),
          @next_token : String? = nil
        )
        end
      end

      struct ListExecutionsRequest
        include JSON::Serializable

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # ListExecutions returns the NextToken parameter in the output. You can then pass the NextToken
        # parameter in a subsequent command to continue listing additional executions. This is useful for
        # pagination, for instance. If you have 100 executions for a workflow, you might only want to list
        # first 10. If so, call the API by specifying the max-results : aws transfer list-executions
        # --max-results 10 This returns details for the first 10 executions, as well as the pointer (
        # NextToken ) to the eleventh execution. You can now call the API again, supplying the NextToken value
        # you received: aws transfer list-executions --max-results 10 --next-token
        # $somePointerReturnedFromPreviousListResult This call returns the next 10 executions, the 11th
        # through the 20th. You can then repeat the call until the details for all 100 executions have been
        # returned.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workflow_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExecutionsResponse
        include JSON::Serializable

        # Returns the details for each execution, in a ListedExecution array.
        @[JSON::Field(key: "Executions")]
        getter executions : Array(Types::ListedExecution)

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        # ListExecutions returns the NextToken parameter in the output. You can then pass the NextToken
        # parameter in a subsequent command to continue listing additional executions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @executions : Array(Types::ListedExecution),
          @workflow_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListFileTransferResultsRequest
        include JSON::Serializable

        # A unique identifier for a connector. This value should match the value supplied to the corresponding
        # StartFileTransfer call.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # A unique identifier for a file transfer. This value should match the value supplied to the
        # corresponding StartFileTransfer call.
        @[JSON::Field(key: "TransferId")]
        getter transfer_id : String

        # The maximum number of files to return in a single page. Note that currently you can specify a
        # maximum of 10 file paths in a single StartFileTransfer operation. Thus, the maximum number of file
        # transfer results that can be returned in a single page is 10.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If there are more file details than returned in this call, use this value for a subsequent call to
        # ListFileTransferResults to retrieve them.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connector_id : String,
          @transfer_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFileTransferResultsResponse
        include JSON::Serializable

        # Returns the details for the files transferred in the transfer identified by the TransferId and
        # ConnectorId specified. FilePath : the filename and path to where the file was sent to or retrieved
        # from. StatusCode : current status for the transfer. The status returned is one of the following
        # values: QUEUED , IN_PROGRESS , COMPLETED , or FAILED FailureCode : for transfers that fail, this
        # parameter contains a code indicating the reason. For example, RETRIEVE_FILE_NOT_FOUND FailureMessage
        # : for transfers that fail, this parameter describes the reason for the failure.
        @[JSON::Field(key: "FileTransferResults")]
        getter file_transfer_results : Array(Types::ConnectorFileTransferResult)

        # Returns a token that you can use to call ListFileTransferResults again and receive additional
        # results, if there are any (against the same TransferId .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @file_transfer_results : Array(Types::ConnectorFileTransferResult),
          @next_token : String? = nil
        )
        end
      end

      struct ListHostKeysRequest
        include JSON::Serializable

        # The identifier of the server that contains the host keys that you want to view.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When there are additional results that were not returned, a NextToken parameter is returned. You can
        # use that value for a subsequent call to ListHostKeys to continue listing results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHostKeysResponse
        include JSON::Serializable

        # Returns an array, where each item contains the details of a host key.
        @[JSON::Field(key: "HostKeys")]
        getter host_keys : Array(Types::ListedHostKey)

        # Returns the server identifier that contains the listed host keys.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # Returns a token that you can use to call ListHostKeys again and receive additional results, if there
        # are any.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @host_keys : Array(Types::ListedHostKey),
          @server_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListProfilesRequest
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When there are additional results that were not returned, a NextToken parameter is returned. You can
        # use that value for a subsequent call to ListProfiles to continue listing results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Indicates whether to list only LOCAL type profiles or only PARTNER type profiles. If not supplied in
        # the request, the command lists all types of profiles.
        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @profile_type : String? = nil
        )
        end
      end

      struct ListProfilesResponse
        include JSON::Serializable

        # Returns an array, where each item contains the details of a profile.
        @[JSON::Field(key: "Profiles")]
        getter profiles : Array(Types::ListedProfile)

        # Returns a token that you can use to call ListProfiles again and receive additional results, if there
        # are any.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @profiles : Array(Types::ListedProfile),
          @next_token : String? = nil
        )
        end
      end

      struct ListSecurityPoliciesRequest
        include JSON::Serializable

        # Specifies the number of security policies to return as a response to the ListSecurityPolicies query.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the ListSecurityPolicies command, a NextToken parameter is
        # returned in the output. You can then pass the NextToken parameter in a subsequent command to
        # continue listing additional security policies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSecurityPoliciesResponse
        include JSON::Serializable

        # An array of security policies that were listed.
        @[JSON::Field(key: "SecurityPolicyNames")]
        getter security_policy_names : Array(String)

        # When you can get additional results from the ListSecurityPolicies operation, a NextToken parameter
        # is returned in the output. In a following command, you can pass in the NextToken parameter to
        # continue listing security policies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @security_policy_names : Array(String),
          @next_token : String? = nil
        )
        end
      end

      struct ListServersRequest
        include JSON::Serializable

        # Specifies the number of servers to return as a response to the ListServers query.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the ListServers command, a NextToken parameter is returned
        # in the output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional servers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServersResponse
        include JSON::Serializable

        # An array of servers that were listed.
        @[JSON::Field(key: "Servers")]
        getter servers : Array(Types::ListedServer)

        # When you can get additional results from the ListServers operation, a NextToken parameter is
        # returned in the output. In a following command, you can pass in the NextToken parameter to continue
        # listing additional servers.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @servers : Array(Types::ListedServer),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an identifier
        # for a specific Amazon Web Services resource, such as a server, user, or role.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Specifies the number of tags to return as a response to the ListTagsForResource request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # When you request additional results from the ListTagsForResource operation, a NextToken parameter is
        # returned in the input. You can then pass in a subsequent command to the NextToken parameter to
        # continue listing additional tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The ARN you specified to list the tags of.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # When you can get additional results from the ListTagsForResource call, a NextToken parameter is
        # returned in the output. You can then pass in a subsequent command to the NextToken parameter to
        # continue listing additional tags.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Key-value pairs that are assigned to a resource, usually for the purpose of grouping and searching
        # for items. Tags are metadata that you define.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListUsersRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server that has users assigned to it.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # Specifies the number of users to return as a response to the ListUsers request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If there are additional results from the ListUsers call, a NextToken parameter is returned in the
        # output. You can then pass the NextToken to a subsequent ListUsers command, to continue listing
        # additional users.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersResponse
        include JSON::Serializable

        # A system-assigned unique identifier for a server that the users are assigned to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # Returns the Transfer Family users and their properties for the ServerId value that you specify.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::ListedUser)

        # When you can get additional results from the ListUsers call, a NextToken parameter is returned in
        # the output. You can then pass in a subsequent command to the NextToken parameter to continue listing
        # additional users.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @server_id : String,
          @users : Array(Types::ListedUser),
          @next_token : String? = nil
        )
        end
      end

      struct ListWebAppsRequest
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Returns the NextToken parameter in the output. You can then pass the NextToken parameter in a
        # subsequent command to continue listing additional web apps.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWebAppsResponse
        include JSON::Serializable

        # Returns, for each listed web app, a structure that contains details for the web app.
        @[JSON::Field(key: "WebApps")]
        getter web_apps : Array(Types::ListedWebApp)

        # Provide this value for the NextToken parameter in a subsequent command to continue listing
        # additional web apps.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @web_apps : Array(Types::ListedWebApp),
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowsRequest
        include JSON::Serializable

        # The maximum number of items to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # ListWorkflows returns the NextToken parameter in the output. You can then pass the NextToken
        # parameter in a subsequent command to continue listing additional workflows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowsResponse
        include JSON::Serializable

        # Returns the Arn , WorkflowId , and Description for each workflow.
        @[JSON::Field(key: "Workflows")]
        getter workflows : Array(Types::ListedWorkflow)

        # ListWorkflows returns the NextToken parameter in the output. You can then pass the NextToken
        # parameter in a subsequent command to continue listing additional workflows.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workflows : Array(Types::ListedWorkflow),
          @next_token : String? = nil
        )
        end
      end

      # Lists the properties for one or more specified associated accesses.
      struct ListedAccess
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @external_id : String? = nil,
          @home_directory : String? = nil,
          @home_directory_type : String? = nil,
          @role : String? = nil
        )
        end
      end

      # Describes the properties of an agreement.
      struct ListedAgreement
        include JSON::Serializable

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String?

        # The Amazon Resource Name (ARN) of the specified agreement.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The current description for the agreement. You can change it by calling the UpdateAgreement
        # operation and providing a new description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the AS2 local profile.
        @[JSON::Field(key: "LocalProfileId")]
        getter local_profile_id : String?

        # A unique identifier for the partner profile.
        @[JSON::Field(key: "PartnerProfileId")]
        getter partner_profile_id : String?

        # The unique identifier for the agreement.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String?

        # The agreement can be either ACTIVE or INACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @agreement_id : String? = nil,
          @arn : String? = nil,
          @description : String? = nil,
          @local_profile_id : String? = nil,
          @partner_profile_id : String? = nil,
          @server_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the properties of a certificate.
      struct ListedCertificate
        include JSON::Serializable

        # An optional date that specifies when the certificate becomes active. If you do not specify a value,
        # ActiveDate takes the same value as NotBeforeDate , which is specified by the CA.
        @[JSON::Field(key: "ActiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_date : Time?

        # The Amazon Resource Name (ARN) of the specified certificate.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String?

        # The name or short description that's used to identify the certificate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional date that specifies when the certificate becomes inactive. If you do not specify a
        # value, InactiveDate takes the same value as NotAfterDate , which is specified by the CA.
        @[JSON::Field(key: "InactiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter inactive_date : Time?

        # The certificate can be either ACTIVE , PENDING_ROTATION , or INACTIVE . PENDING_ROTATION means that
        # this certificate will replace the current certificate when it expires.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type for the certificate. If a private key has been specified for the certificate, its type is
        # CERTIFICATE_WITH_PRIVATE_KEY . If there is no private key, the type is CERTIFICATE .
        @[JSON::Field(key: "Type")]
        getter type : String?

        # Specifies how this certificate is used. It can be used in the following ways: SIGNING : For signing
        # AS2 messages ENCRYPTION : For encrypting AS2 messages TLS : For securing AS2 communications sent
        # over HTTPS
        @[JSON::Field(key: "Usage")]
        getter usage : String?

        def initialize(
          @active_date : Time? = nil,
          @arn : String? = nil,
          @certificate_id : String? = nil,
          @description : String? = nil,
          @inactive_date : Time? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @usage : String? = nil
        )
        end
      end

      # Returns details of the connector that is specified.
      struct ListedConnector
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified connector.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String?

        # The URL of the partner's AS2 or SFTP endpoint. When creating AS2 connectors or service-managed SFTP
        # connectors (connectors without egress configuration), you must provide a URL to specify the remote
        # server endpoint. For VPC Lattice type connectors, the URL must be null.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @arn : String? = nil,
          @connector_id : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Returns properties of the execution that is specified.
      struct ListedExecution
        include JSON::Serializable

        # A unique identifier for the execution of a workflow.
        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # A structure that describes the Amazon S3 or EFS file location. This is the file location when the
        # execution begins: if the file is being copied, this is the initial (as opposed to destination) file
        # location.
        @[JSON::Field(key: "InitialFileLocation")]
        getter initial_file_location : Types::FileLocation?

        # A container object for the session details that are associated with a workflow.
        @[JSON::Field(key: "ServiceMetadata")]
        getter service_metadata : Types::ServiceMetadata?

        # The status is one of the execution. Can be in progress, completed, exception encountered, or
        # handling the exception.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @execution_id : String? = nil,
          @initial_file_location : Types::FileLocation? = nil,
          @service_metadata : Types::ServiceMetadata? = nil,
          @status : String? = nil
        )
        end
      end

      # Returns properties of the host key that's specified.
      struct ListedHostKey
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the host key.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The date on which the host key was added to the server.
        @[JSON::Field(key: "DateImported", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_imported : Time?

        # The current description for the host key. You can change it by calling the UpdateHostKey operation
        # and providing a new description.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The public key fingerprint, which is a short sequence of bytes used to identify the longer public
        # key.
        @[JSON::Field(key: "Fingerprint")]
        getter fingerprint : String?

        # A unique identifier for the host key.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String?

        # The encryption algorithm that is used for the host key. The Type parameter is specified by using one
        # of the following values: ssh-rsa ssh-ed25519 ecdsa-sha2-nistp256 ecdsa-sha2-nistp384
        # ecdsa-sha2-nistp521
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String,
          @date_imported : Time? = nil,
          @description : String? = nil,
          @fingerprint : String? = nil,
          @host_key_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Returns the properties of the profile that was specified.
      struct ListedProfile
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the specified profile.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The As2Id is the AS2-name , as defined in the RFC 4130 . For inbound transfers, this is the AS2-From
        # header for the AS2 messages sent from the partner. For outbound connectors, this is the AS2-To
        # header for the AS2 messages sent to the partner using the StartFileTransfer API operation. This ID
        # cannot include spaces.
        @[JSON::Field(key: "As2Id")]
        getter as2_id : String?

        # A unique identifier for the local or partner AS2 profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # Indicates whether to list only LOCAL type profiles or only PARTNER type profiles. If not supplied in
        # the request, the command lists all types of profiles.
        @[JSON::Field(key: "ProfileType")]
        getter profile_type : String?

        def initialize(
          @arn : String? = nil,
          @as2_id : String? = nil,
          @profile_id : String? = nil,
          @profile_type : String? = nil
        )
        end
      end

      # Returns properties of a file transfer protocol-enabled server that was specified.
      struct ListedServer
        include JSON::Serializable

        # Specifies the unique Amazon Resource Name (ARN) for a server to be listed.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Specifies the domain of the storage system that is used for file transfers. There are two domains
        # available: Amazon Simple Storage Service (Amazon S3) and Amazon Elastic File System (Amazon EFS).
        # The default value is S3.
        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # Specifies the type of VPC endpoint that your server is connected to. If your server is connected to
        # a VPC endpoint, your server isn't accessible over the public internet.
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The mode of authentication for a server. The default value is SERVICE_MANAGED , which allows you to
        # store and access user credentials within the Transfer Family service. Use AWS_DIRECTORY_SERVICE to
        # provide access to Active Directory groups in Directory Service for Microsoft Active Directory or
        # Microsoft Active Directory in your on-premises environment or in Amazon Web Services using AD
        # Connector. This option also requires you to provide a Directory ID by using the
        # IdentityProviderDetails parameter. Use the API_GATEWAY value to integrate with an identity provider
        # of your choosing. The API_GATEWAY setting requires you to provide an Amazon API Gateway endpoint URL
        # to call for authentication by using the IdentityProviderDetails parameter. Use the AWS_LAMBDA value
        # to directly use an Lambda function as your identity provider. If you choose this value, you must
        # specify the ARN for the Lambda function in the Function parameter for the IdentityProviderDetails
        # data type.
        @[JSON::Field(key: "IdentityProviderType")]
        getter identity_provider_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a server
        # to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set, you can view user
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies the unique system assigned identifier for the servers that were listed.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String?

        # The condition of the server that was described. A value of ONLINE indicates that the server can
        # accept jobs and transfer files. A State value of OFFLINE means that the server cannot perform file
        # transfer operations. The states of STARTING and STOPPING indicate that the server is in an
        # intermediate state, either not fully able to respond, or not fully offline. The values of
        # START_FAILED or STOP_FAILED can indicate an error condition.
        @[JSON::Field(key: "State")]
        getter state : String?

        # Specifies the number of users that are assigned to a server you specified with the ServerId .
        @[JSON::Field(key: "UserCount")]
        getter user_count : Int32?

        def initialize(
          @arn : String,
          @domain : String? = nil,
          @endpoint_type : String? = nil,
          @identity_provider_type : String? = nil,
          @logging_role : String? = nil,
          @server_id : String? = nil,
          @state : String? = nil,
          @user_count : Int32? = nil
        )
        end
      end

      # Returns properties of the user that you specify.
      struct ListedUser
        include JSON::Serializable

        # Provides the unique Amazon Resource Name (ARN) for the user that you want to learn about.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests. The IAM role that controls your users' access to your Amazon S3 bucket for servers with
        # Domain=S3 , or your EFS file system for servers with Domain=EFS . The policies attached to this role
        # determine the level of access you want to provide your users when transferring files into and out of
        # your S3 buckets or EFS file systems.
        @[JSON::Field(key: "Role")]
        getter role : String?

        # Specifies the number of SSH public keys stored for the user you specified.
        @[JSON::Field(key: "SshPublicKeyCount")]
        getter ssh_public_key_count : Int32?

        # Specifies the name of the user whose ARN was specified. User names are used for authentication
        # purposes.
        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @arn : String,
          @home_directory : String? = nil,
          @home_directory_type : String? = nil,
          @role : String? = nil,
          @ssh_public_key_count : Int32? = nil,
          @user_name : String? = nil
        )
        end
      end

      # a structure that contains details for the web app.
      struct ListedWebApp
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the web app.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The unique identifier for the web app.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        # The AccessEndpoint is the URL that you provide to your users for them to interact with the Transfer
        # Family web app. You can specify a custom URL or use the default value.
        @[JSON::Field(key: "AccessEndpoint")]
        getter access_endpoint : String?

        # The type of endpoint hosting the web app. Valid values are PUBLIC for publicly accessible endpoints
        # and VPC for VPC-hosted endpoints.
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The WebAppEndpoint is the unique URL for your Transfer Family web app. This is the value that you
        # use when you configure Origins on CloudFront.
        @[JSON::Field(key: "WebAppEndpoint")]
        getter web_app_endpoint : String?

        def initialize(
          @arn : String,
          @web_app_id : String,
          @access_endpoint : String? = nil,
          @endpoint_type : String? = nil,
          @web_app_endpoint : String? = nil
        )
        end
      end

      # Contains the identifier, text description, and Amazon Resource Name (ARN) for the workflow.
      struct ListedWorkflow
        include JSON::Serializable

        # Specifies the unique Amazon Resource Name (ARN) for the workflow.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # Specifies the text description for the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @workflow_id : String? = nil
        )
        end
      end

      # Consists of the logging role and the log group name.
      struct LoggingConfiguration
        include JSON::Serializable

        # The name of the CloudWatch logging group for the Transfer Family server to which this workflow
        # belongs.
        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a server
        # to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set, you can view user
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        def initialize(
          @log_group_name : String? = nil,
          @logging_role : String? = nil
        )
        end
      end

      # The full POSIX identity, including user ID ( Uid ), group ID ( Gid ), and any secondary groups IDs (
      # SecondaryGids ), that controls your users' access to your Amazon EFS file systems. The POSIX
      # permissions that are set on files and directories in your file system determine the level of access
      # your users get when transferring files into and out of your Amazon EFS file systems.
      struct PosixProfile
        include JSON::Serializable

        # The POSIX group ID used for all EFS operations by this user.
        @[JSON::Field(key: "Gid")]
        getter gid : Int64

        # The POSIX user ID used for all EFS operations by this user.
        @[JSON::Field(key: "Uid")]
        getter uid : Int64

        # The secondary POSIX group IDs used for all EFS operations by this user.
        @[JSON::Field(key: "SecondaryGids")]
        getter secondary_gids : Array(Int64)?

        def initialize(
          @gid : Int64,
          @uid : Int64,
          @secondary_gids : Array(Int64)? = nil
        )
        end
      end

      # The protocol settings that are configured for your server.
      struct ProtocolDetails
        include JSON::Serializable

        # Indicates the transport method for the AS2 messages. Currently, only HTTP is supported.
        @[JSON::Field(key: "As2Transports")]
        getter as2_transports : Array(String)?

        # Indicates passive mode, for FTP and FTPS protocols. Enter a single IPv4 address, such as the public
        # IP address of a firewall, router, or load balancer. For example: aws transfer update-server
        # --protocol-details PassiveIp=0.0.0.0 Replace 0.0.0.0 in the example above with the actual IP address
        # you want to use. If you change the PassiveIp value, you must stop and then restart your Transfer
        # Family server for the change to take effect. For details on using passive mode (PASV) in a NAT
        # environment, see Configuring your FTPS server behind a firewall or NAT with Transfer Family .
        # Additionally, avoid placing Network Load Balancers (NLBs) or NAT gateways in front of Transfer
        # Family servers. This configuration increases costs and can cause performance issues. When NLBs or
        # NATs are in the communication path, Transfer Family cannot accurately recognize client IP addresses,
        # which impacts connection sharding and limits FTPS servers to only 300 simultaneous connections
        # instead of 10,000. If you must use an NLB, use port 21 for health checks and enable TLS session
        # resumption by setting TlsSessionResumptionMode = ENFORCED . For optimal performance, migrate to VPC
        # endpoints with Elastic IP addresses instead of using NLBs. For more details, see Avoid placing NLBs
        # and NATs in front of Transfer Family . Special values The AUTO and 0.0.0.0 are special values for
        # the PassiveIp parameter. The value PassiveIp=AUTO is assigned by default to FTP and FTPS type
        # servers. In this case, the server automatically responds with one of the endpoint IPs within the
        # PASV response. PassiveIp=0.0.0.0 has a more unique application for its usage. For example, if you
        # have a High Availability (HA) Network Load Balancer (NLB) environment, where you have 3 subnets, you
        # can only specify a single IP address using the PassiveIp parameter. This reduces the effectiveness
        # of having High Availability. In this case, you can specify PassiveIp=0.0.0.0 . This tells the client
        # to use the same IP address as the Control connection and utilize all AZs for their connections.
        # Note, however, that not all FTP clients support the PassiveIp=0.0.0.0 response. FileZilla and WinSCP
        # do support it. If you are using other clients, check to see if your client supports the
        # PassiveIp=0.0.0.0 response.
        @[JSON::Field(key: "PassiveIp")]
        getter passive_ip : String?

        # Use the SetStatOption to ignore the error that is generated when the client attempts to use SETSTAT
        # on a file you are uploading to an S3 bucket. Some SFTP file transfer clients can attempt to change
        # the attributes of remote files, including timestamp and permissions, using commands, such as SETSTAT
        # when uploading the file. However, these commands are not compatible with object storage systems,
        # such as Amazon S3. Due to this incompatibility, file uploads from these clients can result in errors
        # even when the file is otherwise successfully uploaded. Set the value to ENABLE_NO_OP to have the
        # Transfer Family server ignore the SETSTAT command, and upload files without needing to make any
        # changes to your SFTP client. While the SetStatOption ENABLE_NO_OP setting ignores the error, it does
        # generate a log entry in Amazon CloudWatch Logs, so you can determine when the client is making a
        # SETSTAT call. If you want to preserve the original timestamp for your file, and modify other file
        # attributes using SETSTAT , you can use Amazon EFS as backend storage with Transfer Family.
        @[JSON::Field(key: "SetStatOption")]
        getter set_stat_option : String?

        # A property used with Transfer Family servers that use the FTPS protocol. TLS Session Resumption
        # provides a mechanism to resume or share a negotiated secret key between the control and data
        # connection for an FTPS session. TlsSessionResumptionMode determines whether or not the server
        # resumes recent, negotiated sessions through a unique session ID. This property is available during
        # CreateServer and UpdateServer calls. If a TlsSessionResumptionMode value is not specified during
        # CreateServer , it is set to ENFORCED by default. DISABLED : the server does not process TLS session
        # resumption client requests and creates a new TLS session for each request. ENABLED : the server
        # processes and accepts clients that are performing TLS session resumption. The server doesn't reject
        # client data connections that do not perform the TLS session resumption client processing. ENFORCED :
        # the server processes and accepts clients that are performing TLS session resumption. The server
        # rejects client data connections that do not perform the TLS session resumption client processing.
        # Before you set the value to ENFORCED , test your clients. Not all FTPS clients perform TLS session
        # resumption. So, if you choose to enforce TLS session resumption, you prevent any connections from
        # FTPS clients that don't perform the protocol negotiation. To determine whether or not you can use
        # the ENFORCED value, you need to test your clients.
        @[JSON::Field(key: "TlsSessionResumptionMode")]
        getter tls_session_resumption_mode : String?

        def initialize(
          @as2_transports : Array(String)? = nil,
          @passive_ip : String? = nil,
          @set_stat_option : String? = nil,
          @tls_session_resumption_mode : String? = nil
        )
        end
      end

      # The requested resource does not exist, or exists in a region other than the one specified for the
      # command.
      struct ResourceExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "Resource")]
        getter resource : String

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource : String,
          @resource_type : String
        )
        end
      end

      # This exception is thrown when a resource is not found by the Amazon Web ServicesTransfer Family
      # service.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        @[JSON::Field(key: "Resource")]
        getter resource : String

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource : String,
          @resource_type : String
        )
        end
      end

      # Specifies the details for the file location for the file that's being used in the workflow. Only
      # applicable if you are using S3 storage.
      struct S3FileLocation
        include JSON::Serializable

        # Specifies the S3 bucket that contains the file being used.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The entity tag is a hash of the object. The ETag reflects changes only to the contents of an object,
        # not its metadata.
        @[JSON::Field(key: "Etag")]
        getter etag : String?

        # The name assigned to the file when it was created in Amazon S3. You use the object key to retrieve
        # the object.
        @[JSON::Field(key: "Key")]
        getter key : String?

        # Specifies the file version.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @bucket : String? = nil,
          @etag : String? = nil,
          @key : String? = nil,
          @version_id : String? = nil
        )
        end
      end

      # Specifies the customer input Amazon S3 file location. If it is used inside
      # copyStepDetails.DestinationFileLocation , it should be the S3 copy destination. You need to provide
      # the bucket and key. The key can represent either a path or a file. This is determined by whether or
      # not you end the key value with the forward slash (/) character. If the final character is "/", then
      # your file is copied to the folder, and its name does not change. If, rather, the final character is
      # alphanumeric, your uploaded file is renamed to the path value. In this case, if a file with that
      # name already exists, it is overwritten. For example, if your path is shared-files/bob/ , your
      # uploaded files are copied to the shared-files/bob/ , folder. If your path is shared-files/today ,
      # each uploaded file is copied to the shared-files folder and named today : each upload overwrites the
      # previous version of the bob file.
      struct S3InputFileLocation
        include JSON::Serializable

        # Specifies the S3 bucket for the customer input file.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The name assigned to the file when it was created in Amazon S3. You use the object key to retrieve
        # the object.
        @[JSON::Field(key: "Key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # The Amazon S3 storage options that are configured for your server.
      struct S3StorageOptions
        include JSON::Serializable

        # Specifies whether or not performance for your Amazon S3 directories is optimized. If using the
        # console, this is enabled by default. If using the API or CLI, this is disabled by default. By
        # default, home directory mappings have a TYPE of DIRECTORY . If you enable this option, you would
        # then need to explicitly set the HomeDirectoryMapEntry Type to FILE if you want a mapping to have a
        # file target.
        @[JSON::Field(key: "DirectoryListingOptimization")]
        getter directory_listing_optimization : String?

        def initialize(
          @directory_listing_optimization : String? = nil
        )
        end
      end

      # Specifies the key-value pair that are assigned to a file during the execution of a Tagging step.
      struct S3Tag
        include JSON::Serializable

        # The name assigned to the tag that you create.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value that corresponds to the key.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct SendWorkflowStepStateRequest
        include JSON::Serializable

        # A unique identifier for the execution of a workflow.
        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String

        # Indicates whether the specified step succeeded or failed.
        @[JSON::Field(key: "Status")]
        getter status : String

        # Used to distinguish between multiple callbacks for multiple Lambda steps within the same execution.
        @[JSON::Field(key: "Token")]
        getter token : String

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @execution_id : String,
          @status : String,
          @token : String,
          @workflow_id : String
        )
        end
      end

      struct SendWorkflowStepStateResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A container object for the session details that are associated with a workflow.
      struct ServiceMetadata
        include JSON::Serializable

        # The Server ID ( ServerId ), Session ID ( SessionId ) and user ( UserName ) make up the UserDetails .
        @[JSON::Field(key: "UserDetails")]
        getter user_details : Types::UserDetails

        def initialize(
          @user_details : Types::UserDetails
        )
        end
      end

      # The request has failed because the Amazon Web ServicesTransfer Family service is not available.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the details for an SFTP connector object. The connector object is used for transferring
      # files to and from a partner's SFTP server.
      struct SftpConnectorConfig
        include JSON::Serializable

        # Specify the number of concurrent connections that your connector creates to the remote server. The
        # default value is 1 . The maximum values is 5 . If you are using the Amazon Web Services Management
        # Console, the default value is 5 . This parameter specifies the number of active connections that
        # your connector can establish with the remote server at the same time. Increasing this value can
        # enhance connector performance when transferring large file batches by enabling parallel operations.
        @[JSON::Field(key: "MaxConcurrentConnections")]
        getter max_concurrent_connections : Int32?

        # The public portion of the host key, or keys, that are used to identify the external server to which
        # you are connecting. You can use the ssh-keyscan command against the SFTP server to retrieve the
        # necessary key. TrustedHostKeys is optional for CreateConnector . If not provided, you can use
        # TestConnection to retrieve the server host key during the initial connection attempt, and
        # subsequently update the connector with the observed host key. When creating connectors with egress
        # config (VPC_LATTICE type connectors), since host name is not something we can verify, the only
        # accepted trusted host key format is key-type key-body without the host name. For example: ssh-rsa
        # AAAAB3Nza...&lt;long-string-for-public-key&gt; The three standard SSH public key format elements are
        # &lt;key type&gt; , &lt;body base64&gt; , and an optional &lt;comment&gt; , with spaces between each
        # element. Specify only the &lt;key type&gt; and &lt;body base64&gt; : do not enter the
        # &lt;comment&gt; portion of the key. For the trusted host key, Transfer Family accepts RSA and ECDSA
        # keys. For RSA keys, the &lt;key type&gt; string is ssh-rsa . For ECDSA keys, the &lt;key type&gt;
        # string is either ecdsa-sha2-nistp256 , ecdsa-sha2-nistp384 , or ecdsa-sha2-nistp521 , depending on
        # the size of the key you generated. Run this command to retrieve the SFTP server host key, where your
        # SFTP server name is ftp.host.com . ssh-keyscan ftp.host.com This prints the public host key to
        # standard output. ftp.host.com ssh-rsa AAAAB3Nza...&lt;long-string-for-public-key&gt; Copy and paste
        # this string into the TrustedHostKeys field for the create-connector command or into the Trusted host
        # keys field in the console. For VPC Lattice type connectors (VPC_LATTICE), remove the hostname from
        # the key and use only the key-type key-body format. In this example, it should be: ssh-rsa
        # AAAAB3Nza...&lt;long-string-for-public-key&gt;
        @[JSON::Field(key: "TrustedHostKeys")]
        getter trusted_host_keys : Array(String)?

        # The identifier for the secret (in Amazon Web Services Secrets Manager) that contains the SFTP user's
        # private key, password, or both. The identifier must be the Amazon Resource Name (ARN) of the secret.
        # Required when creating an SFTP connector Optional when updating an existing SFTP connector
        @[JSON::Field(key: "UserSecretId")]
        getter user_secret_id : String?

        def initialize(
          @max_concurrent_connections : Int32? = nil,
          @trusted_host_keys : Array(String)? = nil,
          @user_secret_id : String? = nil
        )
        end
      end

      # Contains the details for an SFTP connector connection.
      struct SftpConnectorConnectionDetails
        include JSON::Serializable

        # The SSH public key of the remote SFTP server. This is returned during the initial connection attempt
        # when you call TestConnection . It allows you to retrieve the valid server host key to update the
        # connector when you are unable to obtain it in advance.
        @[JSON::Field(key: "HostKey")]
        getter host_key : String?

        def initialize(
          @host_key : String? = nil
        )
        end
      end

      # Provides information about the public Secure Shell (SSH) key that is associated with a Transfer
      # Family user for the specific file transfer protocol-enabled server (as identified by ServerId ). The
      # information returned includes the date the key was imported, the public key contents, and the public
      # key ID. A user can store more than one SSH public key associated with their user name on a specific
      # server.
      struct SshPublicKey
        include JSON::Serializable

        # Specifies the date that the public key was added to the Transfer Family user.
        @[JSON::Field(key: "DateImported", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_imported : Time

        # Specifies the content of the SSH public key as specified by the PublicKeyId . Transfer Family
        # accepts RSA, ECDSA, and ED25519 keys.
        @[JSON::Field(key: "SshPublicKeyBody")]
        getter ssh_public_key_body : String

        # Specifies the SshPublicKeyId parameter contains the identifier of the public key.
        @[JSON::Field(key: "SshPublicKeyId")]
        getter ssh_public_key_id : String

        def initialize(
          @date_imported : Time,
          @ssh_public_key_body : String,
          @ssh_public_key_id : String
        )
        end
      end

      struct StartDirectoryListingRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # Specifies the path (bucket and prefix) in Amazon S3 storage to store the results of the directory
        # listing.
        @[JSON::Field(key: "OutputDirectoryPath")]
        getter output_directory_path : String

        # Specifies the directory on the remote SFTP server for which you want to list its contents.
        @[JSON::Field(key: "RemoteDirectoryPath")]
        getter remote_directory_path : String

        # An optional parameter where you can specify the maximum number of file/directory names to retrieve.
        # The default value is 1,000.
        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        def initialize(
          @connector_id : String,
          @output_directory_path : String,
          @remote_directory_path : String,
          @max_items : Int32? = nil
        )
        end
      end

      struct StartDirectoryListingResponse
        include JSON::Serializable

        # Returns a unique identifier for the directory listing call.
        @[JSON::Field(key: "ListingId")]
        getter listing_id : String

        # Returns the file name where the results are stored. This is a combination of the connector ID and
        # the listing ID: &lt;connector-id&gt;-&lt;listing-id&gt;.json .
        @[JSON::Field(key: "OutputFileName")]
        getter output_file_name : String

        def initialize(
          @listing_id : String,
          @output_file_name : String
        )
        end
      end

      struct StartFileTransferRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # For an inbound transfer, the LocaDirectoryPath specifies the destination for one or more files that
        # are transferred from the partner's SFTP server.
        @[JSON::Field(key: "LocalDirectoryPath")]
        getter local_directory_path : String?

        # For an outbound transfer, the RemoteDirectoryPath specifies the destination for one or more files
        # that are transferred to the partner's SFTP server. If you don't specify a RemoteDirectoryPath , the
        # destination for transferred files is the SFTP user's home directory.
        @[JSON::Field(key: "RemoteDirectoryPath")]
        getter remote_directory_path : String?

        # One or more source paths for the partner's SFTP server. Each string represents a source file path
        # for one inbound file transfer.
        @[JSON::Field(key: "RetrieveFilePaths")]
        getter retrieve_file_paths : Array(String)?

        # One or more source paths for the Amazon S3 storage. Each string represents a source file path for
        # one outbound file transfer. For example, amzn-s3-demo-bucket / myfile.txt . Replace
        # amzn-s3-demo-bucket with one of your actual buckets.
        @[JSON::Field(key: "SendFilePaths")]
        getter send_file_paths : Array(String)?

        def initialize(
          @connector_id : String,
          @local_directory_path : String? = nil,
          @remote_directory_path : String? = nil,
          @retrieve_file_paths : Array(String)? = nil,
          @send_file_paths : Array(String)? = nil
        )
        end
      end

      struct StartFileTransferResponse
        include JSON::Serializable

        # Returns the unique identifier for the file transfer.
        @[JSON::Field(key: "TransferId")]
        getter transfer_id : String

        def initialize(
          @transfer_id : String
        )
        end
      end

      struct StartRemoteDeleteRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # The absolute path of the file or directory to delete. You can only specify one path per call to this
        # operation.
        @[JSON::Field(key: "DeletePath")]
        getter delete_path : String

        def initialize(
          @connector_id : String,
          @delete_path : String
        )
        end
      end

      struct StartRemoteDeleteResponse
        include JSON::Serializable

        # Returns a unique identifier for the delete operation.
        @[JSON::Field(key: "DeleteId")]
        getter delete_id : String

        def initialize(
          @delete_id : String
        )
        end
      end

      struct StartRemoteMoveRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # The absolute path of the file or directory to move or rename. You can only specify one path per call
        # to this operation.
        @[JSON::Field(key: "SourcePath")]
        getter source_path : String

        # The absolute path for the target of the move/rename operation.
        @[JSON::Field(key: "TargetPath")]
        getter target_path : String

        def initialize(
          @connector_id : String,
          @source_path : String,
          @target_path : String
        )
        end
      end

      struct StartRemoteMoveResponse
        include JSON::Serializable

        # Returns a unique identifier for the move/rename operation.
        @[JSON::Field(key: "MoveId")]
        getter move_id : String

        def initialize(
          @move_id : String
        )
        end
      end

      struct StartServerRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server that you start.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct StopServerRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server that you stopped.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      # Creates a key-value pair for a specific resource. Tags are metadata that you can use to search for
      # and group a resource for various purposes. You can apply tags to servers, users, and roles. A tag
      # key can take more than one value. For example, to group servers for accounting purposes, you might
      # create a tag called Group and assign the values Research and Accounting to that group.
      struct Tag
        include JSON::Serializable

        # The name assigned to the tag that you create.
        @[JSON::Field(key: "Key")]
        getter key : String

        # Contains one or more values that you assigned to the key name you create.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # An Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a server, user,
        # or role.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # Key-value pairs assigned to ARNs that you can use to group and search for resources by type. You can
        # attach this metadata to resources (servers, users, workflows, and so on) for any purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # Each step type has its own StepDetails structure. The key/value pairs used to tag a file during the
      # execution of a workflow step.
      struct TagStepDetails
        include JSON::Serializable

        # The name of the step, used as an identifier.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies which file to use as input to the workflow step: either the output from the previous step,
        # or the originally uploaded file for the workflow. To use the previous file as the input, enter
        # ${previous.file} . In this case, this workflow step uses the output file from the previous workflow
        # step as input. This is the default value. To use the originally uploaded file location as input for
        # this step, enter ${original.file} .
        @[JSON::Field(key: "SourceFileLocation")]
        getter source_file_location : String?

        # Array that contains from 1 to 10 key/value pairs.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::S3Tag)?

        def initialize(
          @name : String? = nil,
          @source_file_location : String? = nil,
          @tags : Array(Types::S3Tag)? = nil
        )
        end
      end

      struct TestConnectionRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end

      struct TestConnectionResponse
        include JSON::Serializable

        # Returns the identifier of the connector object that you are testing.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String?

        # Structure that contains the SFTP connector host key.
        @[JSON::Field(key: "SftpConnectionDetails")]
        getter sftp_connection_details : Types::SftpConnectorConnectionDetails?

        # Returns OK for successful test, or ERROR if the test fails.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Returns Connection succeeded if the test is successful. Or, returns a descriptive error message if
        # the test fails. The following list provides troubleshooting details, depending on the error message
        # that you receive. Verify that your secret name aligns with the one in Transfer Role permissions.
        # Verify the server URL in the connector configuration , and verify that the login credentials work
        # successfully outside of the connector. Verify that the secret exists and is formatted correctly.
        # Verify that the trusted host key in the connector configuration matches the ssh-keyscan output.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @connector_id : String? = nil,
          @sftp_connection_details : Types::SftpConnectorConnectionDetails? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct TestIdentityProviderRequest
        include JSON::Serializable

        # A system-assigned identifier for a specific server. That server's user authentication method is
        # tested with a user name and password.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The name of the account to be tested.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The type of file transfer protocol to be tested. The available protocols are: Secure Shell (SSH)
        # File Transfer Protocol (SFTP) File Transfer Protocol Secure (FTPS) File Transfer Protocol (FTP)
        # Applicability Statement 2 (AS2)
        @[JSON::Field(key: "ServerProtocol")]
        getter server_protocol : String?

        # The source IP address of the account to be tested.
        @[JSON::Field(key: "SourceIp")]
        getter source_ip : String?

        # The password of the account to be tested.
        @[JSON::Field(key: "UserPassword")]
        getter user_password : String?

        def initialize(
          @server_id : String,
          @user_name : String,
          @server_protocol : String? = nil,
          @source_ip : String? = nil,
          @user_password : String? = nil
        )
        end
      end

      struct TestIdentityProviderResponse
        include JSON::Serializable

        # The HTTP status code that is the response from your API Gateway or your Lambda function.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32

        # The endpoint of the service used to authenticate a user.
        @[JSON::Field(key: "Url")]
        getter url : String

        # A message that indicates whether the test was successful or not. If an empty string is returned, the
        # most likely cause is that the authentication failed due to an incorrect username or password.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The response that is returned from your API Gateway or your Lambda function.
        @[JSON::Field(key: "Response")]
        getter response : String?

        def initialize(
          @status_code : Int32,
          @url : String,
          @message : String? = nil,
          @response : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : String?

        def initialize(
          @retry_after_seconds : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The value of the resource that will have the tag removed. An Amazon Resource Name (ARN) is an
        # identifier for a specific Amazon Web Services resource, such as a server, user, or role.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # TagKeys are key-value pairs assigned to ARNs that can be used to group and search for resources by
        # type. This metadata can be attached to resources for any purpose.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateAccessRequest
        include JSON::Serializable

        # A unique identifier that is required to identify specific groups within your directory. The users of
        # the group that you associate have access to your Amazon S3 or Amazon EFS resources over the enabled
        # protocols using Transfer Family. If you know the group name, you can view the SID values by running
        # the following command using Windows PowerShell. Get-ADGroup -Filter {samAccountName -like "
        # YourGroupName *"} -Properties * | Select SamAccountName,ObjectSid In that command, replace
        # YourGroupName with the name of your Active Directory group. The regular expression used to validate
        # this parameter is a string of characters consisting of uppercase and lowercase alphanumeric
        # characters with no spaces. You can also include underscores or any of the following characters:
        # =,.@:/-
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # A system-assigned unique identifier for a server instance. This is the specific server that you
        # added your user to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . The following is an Entry and Target pair example. [
        # { "Entry": "/directory1", "Target": "/bucket_name/home/mydirectory" } ] In most cases, you can use
        # this value instead of the session policy to lock down your user to the designated home directory ("
        # chroot "). To do this, you can set Entry to / and set Target to the HomeDirectory parameter value.
        # The following is an Entry and Target pair example for chroot . [ { "Entry": "/", "Target":
        # "/bucket_name/home/mydirectory" } ]
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} . This policy applies only when the domain of
        # ServerId is Amazon S3. Amazon EFS does not use session policies. For session policies, Transfer
        # Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy.
        # You save the policy as a JSON blob and pass it in the Policy argument. For an example of a session
        # policy, see Example session policy . For more information, see AssumeRole in the Amazon Web
        # ServicesSecurity Token Service API Reference .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @external_id : String,
          @server_id : String,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @role : String? = nil
        )
        end
      end

      struct UpdateAccessResponse
        include JSON::Serializable

        # The external identifier of the group whose users have access to your Amazon S3 or Amazon EFS
        # resources over the enabled protocols using Amazon Web ServicesTransfer Family.
        @[JSON::Field(key: "ExternalId")]
        getter external_id : String

        # The identifier of the server that the user is attached to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @external_id : String,
          @server_id : String
        )
        end
      end

      struct UpdateAgreementRequest
        include JSON::Serializable

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String

        # A system-assigned unique identifier for a server instance. This is the specific server that the
        # agreement uses.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String?

        # To change the landing directory (folder) for files that are transferred, provide the bucket folder
        # that you want to use; for example, / amzn-s3-demo-bucket / home / mydirectory .
        @[JSON::Field(key: "BaseDirectory")]
        getter base_directory : String?

        # A CustomDirectoriesType structure. This structure specifies custom directories for storing various
        # AS2 message files. You can specify directories for the following types of files. Failed files MDN
        # files Payload files Status files Temporary files
        @[JSON::Field(key: "CustomDirectories")]
        getter custom_directories : Types::CustomDirectoriesType?

        # To replace the existing description, provide a short description for the agreement.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Determines whether or not unsigned messages from your trading partners will be accepted. ENABLED :
        # Transfer Family rejects unsigned messages from your trading partner. DISABLED (default value):
        # Transfer Family accepts unsigned messages from your trading partner.
        @[JSON::Field(key: "EnforceMessageSigning")]
        getter enforce_message_signing : String?

        # A unique identifier for the AS2 local profile. To change the local profile identifier, provide a new
        # value here.
        @[JSON::Field(key: "LocalProfileId")]
        getter local_profile_id : String?

        # A unique identifier for the partner profile. To change the partner profile identifier, provide a new
        # value here.
        @[JSON::Field(key: "PartnerProfileId")]
        getter partner_profile_id : String?

        # Determines whether or not Transfer Family appends a unique string of characters to the end of the
        # AS2 message payload filename when saving it. ENABLED : the filename provided by your trading parter
        # is preserved when the file is saved. DISABLED (default value): when Transfer Family saves the file,
        # the filename is adjusted, as described in File names and locations .
        @[JSON::Field(key: "PreserveFilename")]
        getter preserve_filename : String?

        # You can update the status for the agreement, either activating an inactive agreement or the reverse.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @agreement_id : String,
          @server_id : String,
          @access_role : String? = nil,
          @base_directory : String? = nil,
          @custom_directories : Types::CustomDirectoriesType? = nil,
          @description : String? = nil,
          @enforce_message_signing : String? = nil,
          @local_profile_id : String? = nil,
          @partner_profile_id : String? = nil,
          @preserve_filename : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateAgreementResponse
        include JSON::Serializable

        # A unique identifier for the agreement. This identifier is returned when you create an agreement.
        @[JSON::Field(key: "AgreementId")]
        getter agreement_id : String

        def initialize(
          @agreement_id : String
        )
        end
      end

      struct UpdateCertificateRequest
        include JSON::Serializable

        # The identifier of the certificate object that you are updating.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        # An optional date that specifies when the certificate becomes active. If you do not specify a value,
        # ActiveDate takes the same value as NotBeforeDate , which is specified by the CA.
        @[JSON::Field(key: "ActiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter active_date : Time?

        # A short description to help identify the certificate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # An optional date that specifies when the certificate becomes inactive. If you do not specify a
        # value, InactiveDate takes the same value as NotAfterDate , which is specified by the CA.
        @[JSON::Field(key: "InactiveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter inactive_date : Time?

        def initialize(
          @certificate_id : String,
          @active_date : Time? = nil,
          @description : String? = nil,
          @inactive_date : Time? = nil
        )
        end
      end

      struct UpdateCertificateResponse
        include JSON::Serializable

        # Returns the identifier of the certificate object that you are updating.
        @[JSON::Field(key: "CertificateId")]
        getter certificate_id : String

        def initialize(
          @certificate_id : String
        )
        end
      end

      # Structure for updating the egress configuration of an existing connector. Allows modification of how
      # traffic is routed from the connector to the SFTP server, including VPC_LATTICE settings.
      struct UpdateConnectorEgressConfig
        include JSON::Serializable

        # VPC_LATTICE configuration updates for the connector. Use this to modify the Resource Configuration
        # ARN or port number for VPC-based connectivity.
        @[JSON::Field(key: "VpcLattice")]
        getter vpc_lattice : Types::UpdateConnectorVpcLatticeEgressConfig?

        def initialize(
          @vpc_lattice : Types::UpdateConnectorVpcLatticeEgressConfig? = nil
        )
        end
      end

      struct UpdateConnectorRequest
        include JSON::Serializable

        # The unique identifier for the connector.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        # Connectors are used to send files using either the AS2 or SFTP protocol. For the access role,
        # provide the Amazon Resource Name (ARN) of the Identity and Access Management role to use. For AS2
        # connectors With AS2, you can send files by calling StartFileTransfer and specifying the file paths
        # in the request parameter, SendFilePaths . We use the file’s parent directory (for example, for
        # --send-file-paths /bucket/dir/file.txt , parent directory is /bucket/dir/ ) to temporarily store a
        # processed AS2 message file, store the MDN when we receive them from the partner, and write a final
        # JSON file containing relevant metadata of the transmission. So, the AccessRole needs to provide read
        # and write access to the parent directory of the file location used in the StartFileTransfer request.
        # Additionally, you need to provide read and write access to the parent directory of the files that
        # you intend to send with StartFileTransfer . If you are using Basic authentication for your AS2
        # connector, the access role requires the secretsmanager:GetSecretValue permission for the secret. If
        # the secret is encrypted using a customer-managed key instead of the Amazon Web Services managed key
        # in Secrets Manager, then the role also needs the kms:Decrypt permission for that key. For SFTP
        # connectors Make sure that the access role provides read and write access to the parent directory of
        # the file location that's used in the StartFileTransfer request. Additionally, make sure that the
        # role provides secretsmanager:GetSecretValue permission to Secrets Manager.
        @[JSON::Field(key: "AccessRole")]
        getter access_role : String?

        # A structure that contains the parameters for an AS2 connector object.
        @[JSON::Field(key: "As2Config")]
        getter as2_config : Types::As2ConnectorConfig?

        # Updates the egress configuration for the connector, allowing you to modify how traffic is routed
        # from the connector to the SFTP server. Changes to VPC configuration may require connector restart.
        @[JSON::Field(key: "EgressConfig")]
        getter egress_config : Types::UpdateConnectorEgressConfig?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a
        # connector to turn on CloudWatch logging for Amazon S3 events. When set, you can view connector
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies the name of the security policy for the connector.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # A structure that contains the parameters for an SFTP connector object.
        @[JSON::Field(key: "SftpConfig")]
        getter sftp_config : Types::SftpConnectorConfig?

        # The URL of the partner's AS2 or SFTP endpoint. When creating AS2 connectors or service-managed SFTP
        # connectors (connectors without egress configuration), you must provide a URL to specify the remote
        # server endpoint. For VPC Lattice type connectors, the URL must be null.
        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @connector_id : String,
          @access_role : String? = nil,
          @as2_config : Types::As2ConnectorConfig? = nil,
          @egress_config : Types::UpdateConnectorEgressConfig? = nil,
          @logging_role : String? = nil,
          @security_policy_name : String? = nil,
          @sftp_config : Types::SftpConnectorConfig? = nil,
          @url : String? = nil
        )
        end
      end

      struct UpdateConnectorResponse
        include JSON::Serializable

        # Returns the identifier of the connector object that you are updating.
        @[JSON::Field(key: "ConnectorId")]
        getter connector_id : String

        def initialize(
          @connector_id : String
        )
        end
      end

      # VPC_LATTICE egress configuration updates for modifying how the connector routes traffic through
      # customer VPCs. Changes to these settings may require connector restart to take effect.
      struct UpdateConnectorVpcLatticeEgressConfig
        include JSON::Serializable

        # Updated port number for SFTP connections through VPC_LATTICE. Change this if the target SFTP server
        # port has been modified or if connecting to a different server endpoint.
        @[JSON::Field(key: "PortNumber")]
        getter port_number : Int32?

        # Updated ARN of the VPC_LATTICE Resource Configuration. Use this to change the target SFTP server
        # location or modify the network path through the customer's VPC infrastructure.
        @[JSON::Field(key: "ResourceConfigurationArn")]
        getter resource_configuration_arn : String?

        def initialize(
          @port_number : Int32? = nil,
          @resource_configuration_arn : String? = nil
        )
        end
      end

      struct UpdateHostKeyRequest
        include JSON::Serializable

        # An updated description for the host key.
        @[JSON::Field(key: "Description")]
        getter description : String

        # The identifier of the host key that you are updating.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String

        # The identifier of the server that contains the host key that you are updating.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @description : String,
          @host_key_id : String,
          @server_id : String
        )
        end
      end

      struct UpdateHostKeyResponse
        include JSON::Serializable

        # Returns the host key identifier for the updated host key.
        @[JSON::Field(key: "HostKeyId")]
        getter host_key_id : String

        # Returns the server identifier for the server that contains the updated host key.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @host_key_id : String,
          @server_id : String
        )
        end
      end

      struct UpdateProfileRequest
        include JSON::Serializable

        # The identifier of the profile object that you are updating.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # An array of identifiers for the imported certificates. You use this identifier for working with
        # profiles and partner profiles.
        @[JSON::Field(key: "CertificateIds")]
        getter certificate_ids : Array(String)?

        def initialize(
          @profile_id : String,
          @certificate_ids : Array(String)? = nil
        )
        end
      end

      struct UpdateProfileResponse
        include JSON::Serializable

        # Returns the identifier for the profile that's being updated.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct UpdateServerRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a server instance that the Transfer Family user is assigned
        # to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The Amazon Resource Name (ARN) of the Amazon Web ServicesCertificate Manager (ACM) certificate.
        # Required when Protocols is set to FTPS . To request a new public certificate, see Request a public
        # certificate in the Amazon Web ServicesCertificate Manager User Guide . To import an existing
        # certificate into ACM, see Importing certificates into ACM in the Amazon Web ServicesCertificate
        # Manager User Guide . To request a private certificate to use FTPS through private IP addresses, see
        # Request a private certificate in the Amazon Web ServicesCertificate Manager User Guide .
        # Certificates with the following cryptographic algorithms and key sizes are supported: 2048-bit RSA
        # (RSA_2048) 4096-bit RSA (RSA_4096) Elliptic Prime Curve 256 bit (EC_prime256v1) Elliptic Prime Curve
        # 384 bit (EC_secp384r1) Elliptic Prime Curve 521 bit (EC_secp521r1) The certificate must be a valid
        # SSL/TLS X.509 version 3 certificate with FQDN or IP address specified and information about the
        # issuer.
        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The virtual private cloud (VPC) endpoint settings that are configured for your server. When you host
        # your endpoint within your VPC, you can make your endpoint accessible only to resources within your
        # VPC, or you can attach Elastic IP addresses and make your endpoint accessible to clients over the
        # internet. Your VPC's default security groups are automatically assigned to your endpoint.
        @[JSON::Field(key: "EndpointDetails")]
        getter endpoint_details : Types::EndpointDetails?

        # The type of endpoint that you want your server to use. You can choose to make your server's endpoint
        # publicly accessible (PUBLIC) or host it inside your VPC. With an endpoint that is hosted in a VPC,
        # you can restrict access to your server and resources only within your VPC or choose to make it
        # internet facing by attaching Elastic IP addresses directly to it. After May 19, 2021, you won't be
        # able to create a server using EndpointType=VPC_ENDPOINT in your Amazon Web Services account if your
        # account hasn't already done so before May 19, 2021. If you have already created servers with
        # EndpointType=VPC_ENDPOINT in your Amazon Web Services account on or before May 19, 2021, you will
        # not be affected. After this date, use EndpointType = VPC . For more information, see
        # https://docs.aws.amazon.com/transfer/latest/userguide/create-server-in-vpc.html#deprecate-vpc-endpoint.
        # It is recommended that you use VPC as the EndpointType . With this endpoint type, you have the
        # option to directly associate up to three Elastic IPv4 addresses (BYO IP included) with your server's
        # endpoint and use VPC security groups to restrict traffic by the client's public IP address. This is
        # not possible with EndpointType set to VPC_ENDPOINT .
        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The RSA, ECDSA, or ED25519 private key to use for your SFTP-enabled server. You can add multiple
        # host keys, in case you want to rotate keys, or have a set of active keys that use different
        # algorithms. Use the following command to generate an RSA 2048 bit key with no passphrase: ssh-keygen
        # -t rsa -b 2048 -N "" -m PEM -f my-new-server-key . Use a minimum value of 2048 for the -b option.
        # You can create a stronger key by using 3072 or 4096. Use the following command to generate an ECDSA
        # 256 bit key with no passphrase: ssh-keygen -t ecdsa -b 256 -N "" -m PEM -f my-new-server-key . Valid
        # values for the -b option for ECDSA are 256, 384, and 521. Use the following command to generate an
        # ED25519 key with no passphrase: ssh-keygen -t ed25519 -N "" -f my-new-server-key . For all of these
        # commands, you can replace my-new-server-key with a string of your choice. If you aren't planning to
        # migrate existing users from an existing SFTP-enabled server to a new server, don't update the host
        # key. Accidentally changing a server's host key can be disruptive. For more information, see Manage
        # host keys for your SFTP-enabled server in the Transfer Family User Guide .
        @[JSON::Field(key: "HostKey")]
        getter host_key : String?

        # An array containing all of the information required to call a customer's authentication API method.
        @[JSON::Field(key: "IdentityProviderDetails")]
        getter identity_provider_details : Types::IdentityProviderDetails?

        # The mode of authentication for a server. The default value is SERVICE_MANAGED , which allows you to
        # store and access user credentials within the Transfer Family service. Use AWS_DIRECTORY_SERVICE to
        # provide access to Active Directory groups in Directory Service for Microsoft Active Directory or
        # Microsoft Active Directory in your on-premises environment or in Amazon Web Services using AD
        # Connector. This option also requires you to provide a Directory ID by using the
        # IdentityProviderDetails parameter. Use the API_GATEWAY value to integrate with an identity provider
        # of your choosing. The API_GATEWAY setting requires you to provide an Amazon API Gateway endpoint URL
        # to call for authentication by using the IdentityProviderDetails parameter. Use the AWS_LAMBDA value
        # to directly use an Lambda function as your identity provider. If you choose this value, you must
        # specify the ARN for the Lambda function in the Function parameter for the IdentityProviderDetails
        # data type.
        @[JSON::Field(key: "IdentityProviderType")]
        getter identity_provider_type : String?

        # Specifies whether to use IPv4 only, or to use dual-stack (IPv4 and IPv6) for your Transfer Family
        # endpoint. The default value is IPV4 . The IpAddressType parameter has the following limitations: It
        # cannot be changed while the server is online. You must stop the server before modifying this
        # parameter. It cannot be updated to DUALSTACK if the server has AddressAllocationIds specified. When
        # using DUALSTACK as the IpAddressType , you cannot set the AddressAllocationIds parameter for the
        # EndpointDetails for the server.
        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that allows a server
        # to turn on Amazon CloudWatch logging for Amazon S3 or Amazon EFS events. When set, you can view user
        # activity in your CloudWatch logs.
        @[JSON::Field(key: "LoggingRole")]
        getter logging_role : String?

        # Specifies a string to display when users connect to a server. This string is displayed after the
        # user authenticates. The SFTP protocol does not support post-authentication display banners.
        @[JSON::Field(key: "PostAuthenticationLoginBanner")]
        getter post_authentication_login_banner : String?

        # Specifies a string to display when users connect to a server. This string is displayed before the
        # user authenticates. For example, the following banner displays details about using the system: This
        # system is for the use of authorized users only. Individuals using this computer system without
        # authority, or in excess of their authority, are subject to having all of their activities on this
        # system monitored and recorded by system personnel.
        @[JSON::Field(key: "PreAuthenticationLoginBanner")]
        getter pre_authentication_login_banner : String?

        # The protocol settings that are configured for your server. Avoid placing Network Load Balancers
        # (NLBs) or NAT gateways in front of Transfer Family servers, as this increases costs and can cause
        # performance issues, including reduced connection limits for FTPS. For more details, see Avoid
        # placing NLBs and NATs in front of Transfer Family . To indicate passive mode (for FTP and FTPS
        # protocols), use the PassiveIp parameter. Enter a single dotted-quad IPv4 address, such as the
        # external IP address of a firewall, router, or load balancer. To ignore the error that is generated
        # when the client attempts to use the SETSTAT command on a file that you are uploading to an Amazon S3
        # bucket, use the SetStatOption parameter. To have the Transfer Family server ignore the SETSTAT
        # command and upload files without needing to make any changes to your SFTP client, set the value to
        # ENABLE_NO_OP . If you set the SetStatOption parameter to ENABLE_NO_OP , Transfer Family generates a
        # log entry to Amazon CloudWatch Logs, so that you can determine when the client is making a SETSTAT
        # call. To determine whether your Transfer Family server resumes recent, negotiated sessions through a
        # unique session ID, use the TlsSessionResumptionMode parameter. As2Transports indicates the transport
        # method for the AS2 messages. Currently, only HTTP is supported.
        @[JSON::Field(key: "ProtocolDetails")]
        getter protocol_details : Types::ProtocolDetails?

        # Specifies the file transfer protocol or protocols over which your file transfer protocol client can
        # connect to your server's endpoint. The available protocols are: SFTP (Secure Shell (SSH) File
        # Transfer Protocol): File transfer over SSH FTPS (File Transfer Protocol Secure): File transfer with
        # TLS encryption FTP (File Transfer Protocol): Unencrypted file transfer AS2 (Applicability Statement
        # 2): used for transporting structured business-to-business data If you select FTPS , you must choose
        # a certificate stored in Certificate Manager (ACM) which is used to identify your server when clients
        # connect to it over FTPS. If Protocol includes either FTP or FTPS , then the EndpointType must be VPC
        # and the IdentityProviderType must be either AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes FTP , then AddressAllocationIds cannot be associated. If Protocol is set only to
        # SFTP , the EndpointType can be set to PUBLIC and the IdentityProviderType can be set any of the
        # supported identity types: SERVICE_MANAGED , AWS_DIRECTORY_SERVICE , AWS_LAMBDA , or API_GATEWAY . If
        # Protocol includes AS2 , then the EndpointType must be VPC , and domain must be Amazon S3.
        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # Specifies whether or not performance for your Amazon S3 directories is optimized. If using the
        # console, this is enabled by default. If using the API or CLI, this is disabled by default. By
        # default, home directory mappings have a TYPE of DIRECTORY . If you enable this option, you would
        # then need to explicitly set the HomeDirectoryMapEntry Type to FILE if you want a mapping to have a
        # file target.
        @[JSON::Field(key: "S3StorageOptions")]
        getter s3_storage_options : Types::S3StorageOptions?

        # Specifies the name of the security policy for the server.
        @[JSON::Field(key: "SecurityPolicyName")]
        getter security_policy_name : String?

        # Specifies the log groups to which your server logs are sent. To specify a log group, you must
        # provide the ARN for an existing log group. In this case, the format of the log group is as follows:
        # arn:aws:logs:region-name:amazon-account-id:log-group:log-group-name:* For example,
        # arn:aws:logs:us-east-1:111122223333:log-group:mytestgroup:* If you have previously specified a log
        # group for a server, you can clear it, and in effect turn off structured logging, by providing an
        # empty value for this parameter in an update-server call. For example: update-server --server-id
        # s-1234567890abcdef0 --structured-log-destinations
        @[JSON::Field(key: "StructuredLogDestinations")]
        getter structured_log_destinations : Array(String)?

        # Specifies the workflow ID for the workflow to assign and the execution role that's used for
        # executing the workflow. In addition to a workflow to execute when a file is uploaded completely,
        # WorkflowDetails can also contain a workflow ID (and execution role) for a workflow to execute on
        # partial upload. A partial upload occurs when the server session disconnects while the file is still
        # being uploaded. To remove an associated workflow from a server, you can provide an empty OnUpload
        # object, as in the following example. aws transfer update-server --server-id s-01234567890abcdef
        # --workflow-details '{"OnUpload":[]}'
        @[JSON::Field(key: "WorkflowDetails")]
        getter workflow_details : Types::WorkflowDetails?

        def initialize(
          @server_id : String,
          @certificate : String? = nil,
          @endpoint_details : Types::EndpointDetails? = nil,
          @endpoint_type : String? = nil,
          @host_key : String? = nil,
          @identity_provider_details : Types::IdentityProviderDetails? = nil,
          @identity_provider_type : String? = nil,
          @ip_address_type : String? = nil,
          @logging_role : String? = nil,
          @post_authentication_login_banner : String? = nil,
          @pre_authentication_login_banner : String? = nil,
          @protocol_details : Types::ProtocolDetails? = nil,
          @protocols : Array(String)? = nil,
          @s3_storage_options : Types::S3StorageOptions? = nil,
          @security_policy_name : String? = nil,
          @structured_log_destinations : Array(String)? = nil,
          @workflow_details : Types::WorkflowDetails? = nil
        )
        end
      end

      struct UpdateServerResponse
        include JSON::Serializable

        # A system-assigned unique identifier for a server that the Transfer Family user is assigned to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        def initialize(
          @server_id : String
        )
        end
      end

      struct UpdateUserRequest
        include JSON::Serializable

        # A system-assigned unique identifier for a Transfer Family server instance that the user is assigned
        # to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique string that identifies a user and is associated with a server as specified by the ServerId
        # . This user name must be a minimum of 3 and a maximum of 100 characters long. The following are
        # valid characters: a-z, A-Z, 0-9, underscore '_', hyphen '-', period '.', and at sign '@'. The user
        # name can't start with a hyphen, period, or at sign.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The landing directory (folder) for a user when they log in to the server using the client. A
        # HomeDirectory example is /bucket_name/home/mydirectory . You can use the HomeDirectory parameter for
        # HomeDirectoryType when it is set to either PATH or LOGICAL .
        @[JSON::Field(key: "HomeDirectory")]
        getter home_directory : String?

        # Logical directory mappings that specify what Amazon S3 or Amazon EFS paths and keys should be
        # visible to your user and how you want to make them visible. You must specify the Entry and Target
        # pair, where Entry shows how the path is made visible and Target is the actual Amazon S3 or Amazon
        # EFS path. If you only specify a target, it is displayed as is. You also must ensure that your
        # Identity and Access Management (IAM) role provides access to paths in Target . This value can be set
        # only when HomeDirectoryType is set to LOGICAL . The following is an Entry and Target pair example. [
        # { "Entry": "/directory1", "Target": "/bucket_name/home/mydirectory" } ] In most cases, you can use
        # this value instead of the session policy to lock down your user to the designated home directory ("
        # chroot "). To do this, you can set Entry to '/' and set Target to the HomeDirectory parameter value.
        # The following is an Entry and Target pair example for chroot . [ { "Entry": "/", "Target":
        # "/bucket_name/home/mydirectory" } ]
        @[JSON::Field(key: "HomeDirectoryMappings")]
        getter home_directory_mappings : Array(Types::HomeDirectoryMapEntry)?

        # The type of landing directory (folder) that you want your users' home directory to be when they log
        # in to the server. If you set it to PATH , the user will see the absolute Amazon S3 bucket or Amazon
        # EFS path as is in their file transfer protocol clients. If you set it to LOGICAL , you need to
        # provide mappings in the HomeDirectoryMappings for how you want to make Amazon S3 or Amazon EFS paths
        # visible to your users. If HomeDirectoryType is LOGICAL , you must provide mappings, using the
        # HomeDirectoryMappings parameter. If, on the other hand, HomeDirectoryType is PATH , you provide an
        # absolute path using the HomeDirectory parameter. You cannot have both HomeDirectory and
        # HomeDirectoryMappings in your template.
        @[JSON::Field(key: "HomeDirectoryType")]
        getter home_directory_type : String?

        # A session policy for your user so that you can use the same Identity and Access Management (IAM)
        # role across multiple users. This policy scopes down a user's access to portions of their Amazon S3
        # bucket. Variables that you can use inside this policy include ${Transfer:UserName} ,
        # ${Transfer:HomeDirectory} , and ${Transfer:HomeBucket} . This policy applies only when the domain of
        # ServerId is Amazon S3. Amazon EFS does not use session policies. For session policies, Transfer
        # Family stores the policy as a JSON blob, instead of the Amazon Resource Name (ARN) of the policy.
        # You save the policy as a JSON blob and pass it in the Policy argument. For an example of a session
        # policy, see Creating a session policy . For more information, see AssumeRole in the Amazon Web
        # Services Security Token Service API Reference .
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # Specifies the full POSIX identity, including user ID ( Uid ), group ID ( Gid ), and any secondary
        # groups IDs ( SecondaryGids ), that controls your users' access to your Amazon Elastic File Systems
        # (Amazon EFS). The POSIX permissions that are set on files and directories in your file system
        # determines the level of access your users get when transferring files into and out of your Amazon
        # EFS file systems.
        @[JSON::Field(key: "PosixProfile")]
        getter posix_profile : Types::PosixProfile?

        # The Amazon Resource Name (ARN) of the Identity and Access Management (IAM) role that controls your
        # users' access to your Amazon S3 bucket or Amazon EFS file system. The policies attached to this role
        # determine the level of access that you want to provide your users when transferring files into and
        # out of your Amazon S3 bucket or Amazon EFS file system. The IAM role should also contain a trust
        # relationship that allows the server to access your resources when servicing your users' transfer
        # requests.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @server_id : String,
          @user_name : String,
          @home_directory : String? = nil,
          @home_directory_mappings : Array(Types::HomeDirectoryMapEntry)? = nil,
          @home_directory_type : String? = nil,
          @policy : String? = nil,
          @posix_profile : Types::PosixProfile? = nil,
          @role : String? = nil
        )
        end
      end

      # UpdateUserResponse returns the user name and identifier for the request to update a user's
      # properties.
      struct UpdateUserResponse
        include JSON::Serializable

        # A system-assigned unique identifier for a Transfer Family server instance that the account is
        # assigned to.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # The unique identifier for a user that is assigned to a server instance that was specified in the
        # request.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        def initialize(
          @server_id : String,
          @user_name : String
        )
        end
      end

      struct UpdateWebAppCustomizationRequest
        include JSON::Serializable

        # Provide the identifier of the web app that you are updating.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        # Specify an icon file data string (in base64 encoding).
        @[JSON::Field(key: "FaviconFile")]
        getter favicon_file : Bytes?

        # Specify logo file data string (in base64 encoding).
        @[JSON::Field(key: "LogoFile")]
        getter logo_file : Bytes?

        # Provide an updated title.
        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @web_app_id : String,
          @favicon_file : Bytes? = nil,
          @logo_file : Bytes? = nil,
          @title : String? = nil
        )
        end
      end

      struct UpdateWebAppCustomizationResponse
        include JSON::Serializable

        # Returns the unique identifier for the web app being updated.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      # Contains the endpoint configuration details for updating a web app, including VPC settings for
      # endpoints hosted within a VPC.
      struct UpdateWebAppEndpointDetails
        include JSON::Serializable

        # The VPC configuration details for updating a web app endpoint hosted within a VPC. This includes the
        # subnet IDs for endpoint deployment.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::UpdateWebAppVpcConfig?

        def initialize(
          @vpc : Types::UpdateWebAppVpcConfig? = nil
        )
        end
      end

      # A structure that describes the values to use for the IAM Identity Center settings when you update a
      # web app.
      struct UpdateWebAppIdentityCenterConfig
        include JSON::Serializable

        # The IAM role used to access IAM Identity Center.
        @[JSON::Field(key: "Role")]
        getter role : String?

        def initialize(
          @role : String? = nil
        )
        end
      end

      # A union that contains the UpdateWebAppIdentityCenterConfig object.
      struct UpdateWebAppIdentityProviderDetails
        include JSON::Serializable

        # A structure that describes the values to use for the IAM Identity Center settings when you update a
        # web app.
        @[JSON::Field(key: "IdentityCenterConfig")]
        getter identity_center_config : Types::UpdateWebAppIdentityCenterConfig?

        def initialize(
          @identity_center_config : Types::UpdateWebAppIdentityCenterConfig? = nil
        )
        end
      end

      struct UpdateWebAppRequest
        include JSON::Serializable

        # Provide the identifier of the web app that you are updating.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        # The AccessEndpoint is the URL that you provide to your users for them to interact with the Transfer
        # Family web app. You can specify a custom URL or use the default value.
        @[JSON::Field(key: "AccessEndpoint")]
        getter access_endpoint : String?

        # The updated endpoint configuration for the web app. You can modify the endpoint type and VPC
        # configuration settings.
        @[JSON::Field(key: "EndpointDetails")]
        getter endpoint_details : Types::UpdateWebAppEndpointDetails?

        # Provide updated identity provider values in a WebAppIdentityProviderDetails object.
        @[JSON::Field(key: "IdentityProviderDetails")]
        getter identity_provider_details : Types::UpdateWebAppIdentityProviderDetails?

        # A union that contains the value for number of concurrent connections or the user sessions on your
        # web app.
        @[JSON::Field(key: "WebAppUnits")]
        getter web_app_units : Types::WebAppUnits?

        def initialize(
          @web_app_id : String,
          @access_endpoint : String? = nil,
          @endpoint_details : Types::UpdateWebAppEndpointDetails? = nil,
          @identity_provider_details : Types::UpdateWebAppIdentityProviderDetails? = nil,
          @web_app_units : Types::WebAppUnits? = nil
        )
        end
      end

      struct UpdateWebAppResponse
        include JSON::Serializable

        # Returns the unique identifier for the web app being updated.
        @[JSON::Field(key: "WebAppId")]
        getter web_app_id : String

        def initialize(
          @web_app_id : String
        )
        end
      end

      # Contains the VPC configuration settings for updating a web app endpoint, including the subnet IDs
      # where the endpoint should be deployed.
      struct UpdateWebAppVpcConfig
        include JSON::Serializable

        # The list of subnet IDs within the VPC where the web app endpoint should be deployed during the
        # update operation.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # Specifies the user name, server ID, and session ID for a workflow.
      struct UserDetails
        include JSON::Serializable

        # The system-assigned unique identifier for a Transfer server instance.
        @[JSON::Field(key: "ServerId")]
        getter server_id : String

        # A unique string that identifies a Transfer Family user associated with a server.
        @[JSON::Field(key: "UserName")]
        getter user_name : String

        # The system-assigned unique identifier for a session that corresponds to the workflow.
        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        def initialize(
          @server_id : String,
          @user_name : String,
          @session_id : String? = nil
        )
        end
      end

      # Contains the endpoint configuration for a web app, including VPC settings when the endpoint is
      # hosted within a VPC.
      struct WebAppEndpointDetails
        include JSON::Serializable

        # The VPC configuration for hosting the web app endpoint within a VPC.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::WebAppVpcConfig?

        def initialize(
          @vpc : Types::WebAppVpcConfig? = nil
        )
        end
      end

      # A union that contains the IdentityCenterConfig object.
      struct WebAppIdentityProviderDetails
        include JSON::Serializable

        # A structure that describes the values to use for the IAM Identity Center settings when you create a
        # web app.
        @[JSON::Field(key: "IdentityCenterConfig")]
        getter identity_center_config : Types::IdentityCenterConfig?

        def initialize(
          @identity_center_config : Types::IdentityCenterConfig? = nil
        )
        end
      end

      # Contains an integer value that represents the value for number of concurrent connections or the user
      # sessions on your web app.
      struct WebAppUnits
        include JSON::Serializable

        # An integer that represents the number of units for your desired number of concurrent connections, or
        # the number of user sessions on your web app at the same time. Each increment allows an additional
        # 250 concurrent sessions: a value of 1 sets the number of concurrent sessions to 250; 2 sets a value
        # of 500, and so on.
        @[JSON::Field(key: "Provisioned")]
        getter provisioned : Int32?

        def initialize(
          @provisioned : Int32? = nil
        )
        end
      end

      # Contains the VPC configuration settings for hosting a web app endpoint, including the VPC ID, subnet
      # IDs, and security group IDs for access control.
      struct WebAppVpcConfig
        include JSON::Serializable

        # The list of security group IDs that control access to the web app endpoint. These security groups
        # determine which sources can access the endpoint based on IP addresses and port configurations.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The list of subnet IDs within the VPC where the web app endpoint will be deployed. These subnets
        # must be in the same VPC specified in the VpcId parameter.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The identifier of the VPC where the web app endpoint will be hosted.
        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Specifies the workflow ID for the workflow to assign and the execution role that's used for
      # executing the workflow. In addition to a workflow to execute when a file is uploaded completely,
      # WorkflowDetails can also contain a workflow ID (and execution role) for a workflow to execute on
      # partial upload. A partial upload occurs when the server session disconnects while the file is still
      # being uploaded.
      struct WorkflowDetail
        include JSON::Serializable

        # Includes the necessary permissions for S3, EFS, and Lambda operations that Transfer can assume, so
        # that all workflow steps can operate on the required resources
        @[JSON::Field(key: "ExecutionRole")]
        getter execution_role : String

        # A unique identifier for the workflow.
        @[JSON::Field(key: "WorkflowId")]
        getter workflow_id : String

        def initialize(
          @execution_role : String,
          @workflow_id : String
        )
        end
      end

      # Container for the WorkflowDetail data type. It is used by actions that trigger a workflow to begin
      # execution.
      struct WorkflowDetails
        include JSON::Serializable

        # A trigger that starts a workflow if a file is only partially uploaded. You can attach a workflow to
        # a server that executes whenever there is a partial upload. A partial upload occurs when a file is
        # open when the session disconnects. OnPartialUpload can contain a maximum of one WorkflowDetail
        # object.
        @[JSON::Field(key: "OnPartialUpload")]
        getter on_partial_upload : Array(Types::WorkflowDetail)?

        # A trigger that starts a workflow: the workflow begins to execute after a file is uploaded. To remove
        # an associated workflow from a server, you can provide an empty OnUpload object, as in the following
        # example. aws transfer update-server --server-id s-01234567890abcdef --workflow-details
        # '{"OnUpload":[]}' OnUpload can contain a maximum of one WorkflowDetail object.
        @[JSON::Field(key: "OnUpload")]
        getter on_upload : Array(Types::WorkflowDetail)?

        def initialize(
          @on_partial_upload : Array(Types::WorkflowDetail)? = nil,
          @on_upload : Array(Types::WorkflowDetail)? = nil
        )
        end
      end

      # The basic building block of a workflow.
      struct WorkflowStep
        include JSON::Serializable

        # Details for a step that performs a file copy. Consists of the following values: A description An
        # Amazon S3 location for the destination of the file copy. A flag that indicates whether to overwrite
        # an existing file of the same name. The default is FALSE .
        @[JSON::Field(key: "CopyStepDetails")]
        getter copy_step_details : Types::CopyStepDetails?

        # Details for a step that invokes an Lambda function. Consists of the Lambda function's name, target,
        # and timeout (in seconds).
        @[JSON::Field(key: "CustomStepDetails")]
        getter custom_step_details : Types::CustomStepDetails?

        # Details for a step that decrypts an encrypted file. Consists of the following values: A descriptive
        # name An Amazon S3 or Amazon Elastic File System (Amazon EFS) location for the source file to
        # decrypt. An S3 or Amazon EFS location for the destination of the file decryption. A flag that
        # indicates whether to overwrite an existing file of the same name. The default is FALSE . The type of
        # encryption that's used. Currently, only PGP encryption is supported.
        @[JSON::Field(key: "DecryptStepDetails")]
        getter decrypt_step_details : Types::DecryptStepDetails?

        # Details for a step that deletes the file.
        @[JSON::Field(key: "DeleteStepDetails")]
        getter delete_step_details : Types::DeleteStepDetails?

        # Details for a step that creates one or more tags. You specify one or more tags. Each tag contains a
        # key-value pair.
        @[JSON::Field(key: "TagStepDetails")]
        getter tag_step_details : Types::TagStepDetails?

        # Currently, the following step types are supported. COPY - Copy the file to another location. CUSTOM
        # - Perform a custom step with an Lambda function target. DECRYPT - Decrypt a file that was encrypted
        # before it was uploaded. DELETE - Delete the file. TAG - Add a tag to the file.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @copy_step_details : Types::CopyStepDetails? = nil,
          @custom_step_details : Types::CustomStepDetails? = nil,
          @decrypt_step_details : Types::DecryptStepDetails? = nil,
          @delete_step_details : Types::DeleteStepDetails? = nil,
          @tag_step_details : Types::TagStepDetails? = nil,
          @type : String? = nil
        )
        end
      end
    end
  end
end
