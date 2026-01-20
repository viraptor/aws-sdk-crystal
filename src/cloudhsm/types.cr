require "json"

module Aws
  module CloudHSM
    module Types


      struct AddTagsToResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS CloudHSM resource to tag.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # One or more tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tag_list : Array(Types::Tag)
        )
        end
      end


      struct AddTagsToResourceResponse
        include JSON::Serializable

        # The status of the operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Indicates that an internal error occurred.

      struct CloudHsmInternalException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that an exception occurred in the AWS CloudHSM service.

      struct CloudHsmServiceException
        include JSON::Serializable

        # Additional information about the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        # Indicates if the action can be retried.

        @[JSON::Field(key: "retryable")]
        getter retryable : Bool?

        def initialize(
          @message : String? = nil,
          @retryable : Bool? = nil
        )
        end
      end

      # Contains the inputs for the CreateHapgRequest action.

      struct CreateHapgRequest
        include JSON::Serializable

        # The label of the new high-availability partition group.

        @[JSON::Field(key: "Label")]
        getter label : String

        def initialize(
          @label : String
        )
        end
      end

      # Contains the output of the CreateHAPartitionGroup action.

      struct CreateHapgResponse
        include JSON::Serializable

        # The ARN of the high-availability partition group.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String?

        def initialize(
          @hapg_arn : String? = nil
        )
        end
      end

      # Contains the inputs for the CreateHsm operation.

      struct CreateHsmRequest
        include JSON::Serializable

        # The ARN of an IAM role to enable the AWS CloudHSM service to allocate an ENI on your behalf.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # The SSH public key to install on the HSM.

        @[JSON::Field(key: "SshKey")]
        getter ssh_key : String

        # The identifier of the subnet in your VPC in which to place the HSM.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String


        @[JSON::Field(key: "SubscriptionType")]
        getter subscription_type : String

        # A user-defined token to ensure idempotence. Subsequent calls to this operation with the same token
        # will be ignored.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The IP address to assign to the HSM's ENI. If an IP address is not specified, an IP address will be
        # randomly chosen from the CIDR range of the subnet.

        @[JSON::Field(key: "EniIp")]
        getter eni_ip : String?

        # The external ID from IamRoleArn , if present.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The IP address for the syslog monitoring server. The AWS CloudHSM service only supports one syslog
        # monitoring server.

        @[JSON::Field(key: "SyslogIp")]
        getter syslog_ip : String?

        def initialize(
          @iam_role_arn : String,
          @ssh_key : String,
          @subnet_id : String,
          @subscription_type : String,
          @client_token : String? = nil,
          @eni_ip : String? = nil,
          @external_id : String? = nil,
          @syslog_ip : String? = nil
        )
        end
      end

      # Contains the output of the CreateHsm operation.

      struct CreateHsmResponse
        include JSON::Serializable

        # The ARN of the HSM.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String?

        def initialize(
          @hsm_arn : String? = nil
        )
        end
      end

      # Contains the inputs for the CreateLunaClient action.

      struct CreateLunaClientRequest
        include JSON::Serializable

        # The contents of a Base64-Encoded X.509 v3 certificate to be installed on the HSMs used by this
        # client.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String

        # The label for the client.

        @[JSON::Field(key: "Label")]
        getter label : String?

        def initialize(
          @certificate : String,
          @label : String? = nil
        )
        end
      end

      # Contains the output of the CreateLunaClient action.

      struct CreateLunaClientResponse
        include JSON::Serializable

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String?

        def initialize(
          @client_arn : String? = nil
        )
        end
      end

      # Contains the inputs for the DeleteHapg action.

      struct DeleteHapgRequest
        include JSON::Serializable

        # The ARN of the high-availability partition group to delete.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String

        def initialize(
          @hapg_arn : String
        )
        end
      end

      # Contains the output of the DeleteHapg action.

      struct DeleteHapgResponse
        include JSON::Serializable

        # The status of the action.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains the inputs for the DeleteHsm operation.

      struct DeleteHsmRequest
        include JSON::Serializable

        # The ARN of the HSM to delete.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String

        def initialize(
          @hsm_arn : String
        )
        end
      end

      # Contains the output of the DeleteHsm operation.

      struct DeleteHsmResponse
        include JSON::Serializable

        # The status of the operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end


      struct DeleteLunaClientRequest
        include JSON::Serializable

        # The ARN of the client to delete.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String

        def initialize(
          @client_arn : String
        )
        end
      end


      struct DeleteLunaClientResponse
        include JSON::Serializable

        # The status of the action.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Contains the inputs for the DescribeHapg action.

      struct DescribeHapgRequest
        include JSON::Serializable

        # The ARN of the high-availability partition group to describe.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String

        def initialize(
          @hapg_arn : String
        )
        end
      end

      # Contains the output of the DescribeHapg action.

      struct DescribeHapgResponse
        include JSON::Serializable

        # The ARN of the high-availability partition group.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String?

        # The serial number of the high-availability partition group.

        @[JSON::Field(key: "HapgSerial")]
        getter hapg_serial : String?


        @[JSON::Field(key: "HsmsLastActionFailed")]
        getter hsms_last_action_failed : Array(String)?


        @[JSON::Field(key: "HsmsPendingDeletion")]
        getter hsms_pending_deletion : Array(String)?


        @[JSON::Field(key: "HsmsPendingRegistration")]
        getter hsms_pending_registration : Array(String)?

        # The label for the high-availability partition group.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The date and time the high-availability partition group was last modified.

        @[JSON::Field(key: "LastModifiedTimestamp")]
        getter last_modified_timestamp : String?

        # The list of partition serial numbers that belong to the high-availability partition group.

        @[JSON::Field(key: "PartitionSerialList")]
        getter partition_serial_list : Array(String)?

        # The state of the high-availability partition group.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @hapg_arn : String? = nil,
          @hapg_serial : String? = nil,
          @hsms_last_action_failed : Array(String)? = nil,
          @hsms_pending_deletion : Array(String)? = nil,
          @hsms_pending_registration : Array(String)? = nil,
          @label : String? = nil,
          @last_modified_timestamp : String? = nil,
          @partition_serial_list : Array(String)? = nil,
          @state : String? = nil
        )
        end
      end

      # Contains the inputs for the DescribeHsm operation.

      struct DescribeHsmRequest
        include JSON::Serializable

        # The ARN of the HSM. Either the HsmArn or the SerialNumber parameter must be specified.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String?

        # The serial number of the HSM. Either the HsmArn or the HsmSerialNumber parameter must be specified.

        @[JSON::Field(key: "HsmSerialNumber")]
        getter hsm_serial_number : String?

        def initialize(
          @hsm_arn : String? = nil,
          @hsm_serial_number : String? = nil
        )
        end
      end

      # Contains the output of the DescribeHsm operation.

      struct DescribeHsmResponse
        include JSON::Serializable

        # The Availability Zone that the HSM is in.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # The identifier of the elastic network interface (ENI) attached to the HSM.

        @[JSON::Field(key: "EniId")]
        getter eni_id : String?

        # The IP address assigned to the HSM's ENI.

        @[JSON::Field(key: "EniIp")]
        getter eni_ip : String?

        # The ARN of the HSM.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String?

        # The HSM model type.

        @[JSON::Field(key: "HsmType")]
        getter hsm_type : String?

        # The ARN of the IAM role assigned to the HSM.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The list of partitions on the HSM.

        @[JSON::Field(key: "Partitions")]
        getter partitions : Array(String)?

        # The serial number of the HSM.

        @[JSON::Field(key: "SerialNumber")]
        getter serial_number : String?

        # The date and time that the server certificate was last updated.

        @[JSON::Field(key: "ServerCertLastUpdated")]
        getter server_cert_last_updated : String?

        # The URI of the certificate server.

        @[JSON::Field(key: "ServerCertUri")]
        getter server_cert_uri : String?

        # The HSM software version.

        @[JSON::Field(key: "SoftwareVersion")]
        getter software_version : String?

        # The date and time that the SSH key was last updated.

        @[JSON::Field(key: "SshKeyLastUpdated")]
        getter ssh_key_last_updated : String?

        # The public SSH key.

        @[JSON::Field(key: "SshPublicKey")]
        getter ssh_public_key : String?

        # The status of the HSM.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # Contains additional information about the status of the HSM.

        @[JSON::Field(key: "StatusDetails")]
        getter status_details : String?

        # The identifier of the subnet that the HSM is in.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The subscription end date.

        @[JSON::Field(key: "SubscriptionEndDate")]
        getter subscription_end_date : String?

        # The subscription start date.

        @[JSON::Field(key: "SubscriptionStartDate")]
        getter subscription_start_date : String?


        @[JSON::Field(key: "SubscriptionType")]
        getter subscription_type : String?

        # The name of the HSM vendor.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        # The identifier of the VPC that the HSM is in.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @availability_zone : String? = nil,
          @eni_id : String? = nil,
          @eni_ip : String? = nil,
          @hsm_arn : String? = nil,
          @hsm_type : String? = nil,
          @iam_role_arn : String? = nil,
          @partitions : Array(String)? = nil,
          @serial_number : String? = nil,
          @server_cert_last_updated : String? = nil,
          @server_cert_uri : String? = nil,
          @software_version : String? = nil,
          @ssh_key_last_updated : String? = nil,
          @ssh_public_key : String? = nil,
          @status : String? = nil,
          @status_details : String? = nil,
          @subnet_id : String? = nil,
          @subscription_end_date : String? = nil,
          @subscription_start_date : String? = nil,
          @subscription_type : String? = nil,
          @vendor_name : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct DescribeLunaClientRequest
        include JSON::Serializable

        # The certificate fingerprint.

        @[JSON::Field(key: "CertificateFingerprint")]
        getter certificate_fingerprint : String?

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String?

        def initialize(
          @certificate_fingerprint : String? = nil,
          @client_arn : String? = nil
        )
        end
      end


      struct DescribeLunaClientResponse
        include JSON::Serializable

        # The certificate installed on the HSMs used by this client.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String?

        # The certificate fingerprint.

        @[JSON::Field(key: "CertificateFingerprint")]
        getter certificate_fingerprint : String?

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String?

        # The label of the client.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The date and time the client was last modified.

        @[JSON::Field(key: "LastModifiedTimestamp")]
        getter last_modified_timestamp : String?

        def initialize(
          @certificate : String? = nil,
          @certificate_fingerprint : String? = nil,
          @client_arn : String? = nil,
          @label : String? = nil,
          @last_modified_timestamp : String? = nil
        )
        end
      end


      struct GetConfigRequest
        include JSON::Serializable

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String

        # The client version.

        @[JSON::Field(key: "ClientVersion")]
        getter client_version : String

        # A list of ARNs that identify the high-availability partition groups that are associated with the
        # client.

        @[JSON::Field(key: "HapgList")]
        getter hapg_list : Array(String)

        def initialize(
          @client_arn : String,
          @client_version : String,
          @hapg_list : Array(String)
        )
        end
      end


      struct GetConfigResponse
        include JSON::Serializable

        # The certificate file containing the server.pem files of the HSMs.

        @[JSON::Field(key: "ConfigCred")]
        getter config_cred : String?

        # The chrystoki.conf configuration file.

        @[JSON::Field(key: "ConfigFile")]
        getter config_file : String?

        # The type of credentials.

        @[JSON::Field(key: "ConfigType")]
        getter config_type : String?

        def initialize(
          @config_cred : String? = nil,
          @config_file : String? = nil,
          @config_type : String? = nil
        )
        end
      end

      # Indicates that one or more of the request parameters are not valid.

      struct InvalidRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the inputs for the ListAvailableZones action.

      struct ListAvailableZonesRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct ListAvailableZonesResponse
        include JSON::Serializable

        # The list of Availability Zones that have available AWS CloudHSM capacity.

        @[JSON::Field(key: "AZList")]
        getter az_list : Array(String)?

        def initialize(
          @az_list : Array(String)? = nil
        )
        end
      end


      struct ListHapgsRequest
        include JSON::Serializable

        # The NextToken value from a previous call to ListHapgs . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListHapgsResponse
        include JSON::Serializable

        # The list of high-availability partition groups.

        @[JSON::Field(key: "HapgList")]
        getter hapg_list : Array(String)

        # If not null, more results are available. Pass this value to ListHapgs to retrieve the next set of
        # items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hapg_list : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListHsmsRequest
        include JSON::Serializable

        # The NextToken value from a previous call to ListHsms . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Contains the output of the ListHsms operation.

      struct ListHsmsResponse
        include JSON::Serializable

        # The list of ARNs that identify the HSMs.

        @[JSON::Field(key: "HsmList")]
        getter hsm_list : Array(String)?

        # If not null, more results are available. Pass this value to ListHsms to retrieve the next set of
        # items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hsm_list : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLunaClientsRequest
        include JSON::Serializable

        # The NextToken value from a previous call to ListLunaClients . Pass null if this is the first call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end


      struct ListLunaClientsResponse
        include JSON::Serializable

        # The list of clients.

        @[JSON::Field(key: "ClientList")]
        getter client_list : Array(String)

        # If not null, more results are available. Pass this to ListLunaClients to retrieve the next set of
        # items.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @client_list : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS CloudHSM resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # One or more tags.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)

        def initialize(
          @tag_list : Array(Types::Tag)
        )
        end
      end


      struct ModifyHapgRequest
        include JSON::Serializable

        # The ARN of the high-availability partition group to modify.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String

        # The new label for the high-availability partition group.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The list of partition serial numbers to make members of the high-availability partition group.

        @[JSON::Field(key: "PartitionSerialList")]
        getter partition_serial_list : Array(String)?

        def initialize(
          @hapg_arn : String,
          @label : String? = nil,
          @partition_serial_list : Array(String)? = nil
        )
        end
      end


      struct ModifyHapgResponse
        include JSON::Serializable

        # The ARN of the high-availability partition group.

        @[JSON::Field(key: "HapgArn")]
        getter hapg_arn : String?

        def initialize(
          @hapg_arn : String? = nil
        )
        end
      end

      # Contains the inputs for the ModifyHsm operation.

      struct ModifyHsmRequest
        include JSON::Serializable

        # The ARN of the HSM to modify.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String

        # The new IP address for the elastic network interface (ENI) attached to the HSM. If the HSM is moved
        # to a different subnet, and an IP address is not specified, an IP address will be randomly chosen
        # from the CIDR range of the new subnet.

        @[JSON::Field(key: "EniIp")]
        getter eni_ip : String?

        # The new external ID.

        @[JSON::Field(key: "ExternalId")]
        getter external_id : String?

        # The new IAM role ARN.

        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # The new identifier of the subnet that the HSM is in. The new subnet must be in the same Availability
        # Zone as the current subnet.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The new IP address for the syslog monitoring server. The AWS CloudHSM service only supports one
        # syslog monitoring server.

        @[JSON::Field(key: "SyslogIp")]
        getter syslog_ip : String?

        def initialize(
          @hsm_arn : String,
          @eni_ip : String? = nil,
          @external_id : String? = nil,
          @iam_role_arn : String? = nil,
          @subnet_id : String? = nil,
          @syslog_ip : String? = nil
        )
        end
      end

      # Contains the output of the ModifyHsm operation.

      struct ModifyHsmResponse
        include JSON::Serializable

        # The ARN of the HSM.

        @[JSON::Field(key: "HsmArn")]
        getter hsm_arn : String?

        def initialize(
          @hsm_arn : String? = nil
        )
        end
      end


      struct ModifyLunaClientRequest
        include JSON::Serializable

        # The new certificate for the client.

        @[JSON::Field(key: "Certificate")]
        getter certificate : String

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String

        def initialize(
          @certificate : String,
          @client_arn : String
        )
        end
      end


      struct ModifyLunaClientResponse
        include JSON::Serializable

        # The ARN of the client.

        @[JSON::Field(key: "ClientArn")]
        getter client_arn : String?

        def initialize(
          @client_arn : String? = nil
        )
        end
      end


      struct RemoveTagsFromResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS CloudHSM resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag key or keys to remove. Specify only the tag key to remove (not the value). To overwrite the
        # value for an existing tag, use AddTagsToResource .

        @[JSON::Field(key: "TagKeyList")]
        getter tag_key_list : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_key_list : Array(String)
        )
        end
      end


      struct RemoveTagsFromResourceResponse
        include JSON::Serializable

        # The status of the operation.

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # A key-value pair that identifies or specifies metadata about an AWS CloudHSM resource.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end
    end
  end
end
