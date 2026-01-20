require "json"
require "time"

module AwsSdk
  module GlobalAccelerator
    module Types

      # An accelerator is a complex type that includes one or more listeners that process inbound
      # connections and then direct traffic to one or more endpoint groups, each of which includes
      # endpoints, such as load balancers.

      struct Accelerator
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String?

        # The date and time that the accelerator was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The Domain Name System (DNS) name that Global Accelerator creates that points to an accelerator's
        # static IPv4 addresses. The naming convention for the DNS name for an accelerator is the following: A
        # lowercase letter a, followed by a 16-bit random hex string, followed by .awsglobalaccelerator.com.
        # For example: a1234567890abcdef.awsglobalaccelerator.com. If you have a dual-stack accelerator, you
        # also have a second DNS name, DualStackDnsName , that points to both the A record and the AAAA record
        # for all four static addresses for the accelerator: two IPv4 addresses and two IPv6 addresses. For
        # more information about the default DNS name, see Support for DNS addressing in Global Accelerator in
        # the Global Accelerator Developer Guide .

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # The Domain Name System (DNS) name that Global Accelerator creates that points to a dual-stack
        # accelerator's four static IP addresses: two IPv4 addresses and two IPv6 addresses. The naming
        # convention for the dual-stack DNS name is the following: A lowercase letter a, followed by a 16-bit
        # random hex string, followed by .dualstack.awsglobalaccelerator.com. For example:
        # a1234567890abcdef.dualstack.awsglobalaccelerator.com. Note: Global Accelerator also assigns a
        # default DNS name, DnsName , to your accelerator that points just to the static IPv4 addresses. For
        # more information, see Support for DNS addressing in Global Accelerator in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "DualStackDnsName")]
        getter dual_stack_dns_name : String?

        # Indicates whether the accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, the accelerator cannot be deleted. If set to false, accelerator can be
        # deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # A history of changes that you make to an accelerator in Global Accelerator.

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::AcceleratorEvent)?

        # The IP address type that an accelerator supports. For a standard accelerator, the value can be IPV4
        # or DUAL_STACK.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The static IP addresses that Global Accelerator associates with the accelerator.

        @[JSON::Field(key: "IpSets")]
        getter ip_sets : Array(Types::IpSet)?

        # The date and time that the accelerator was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the accelerator. The name must contain only alphanumeric characters or hyphens (-), and
        # must not begin or end with a hyphen.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Describes the deployment status of the accelerator.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @accelerator_arn : String? = nil,
          @created_time : Time? = nil,
          @dns_name : String? = nil,
          @dual_stack_dns_name : String? = nil,
          @enabled : Bool? = nil,
          @events : Array(Types::AcceleratorEvent)? = nil,
          @ip_address_type : String? = nil,
          @ip_sets : Array(Types::IpSet)? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Attributes of an accelerator.

      struct AcceleratorAttributes
        include JSON::Serializable

        # Indicates whether flow logs are enabled. The default value is false. If the value is true,
        # FlowLogsS3Bucket and FlowLogsS3Prefix must be specified. For more information, see Flow logs in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "FlowLogsEnabled")]
        getter flow_logs_enabled : Bool?

        # The name of the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true
        # . The bucket must exist and have a bucket policy that grants Global Accelerator permission to write
        # to the bucket.

        @[JSON::Field(key: "FlowLogsS3Bucket")]
        getter flow_logs_s3_bucket : String?

        # The prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is required if
        # FlowLogsEnabled is true . If you specify slash (/) for the S3 bucket prefix, the log file bucket
        # folder structure will include a double slash (//), like the following:
        # s3-bucket_name//AWSLogs/aws_account_id

        @[JSON::Field(key: "FlowLogsS3Prefix")]
        getter flow_logs_s3_prefix : String?

        def initialize(
          @flow_logs_enabled : Bool? = nil,
          @flow_logs_s3_bucket : String? = nil,
          @flow_logs_s3_prefix : String? = nil
        )
        end
      end

      # A complex type that contains a Timestamp value and Message for changes that you make to an
      # accelerator in Global Accelerator. Messages stored here provide progress or error information when
      # you update an accelerator from IPv4 to dual-stack, or from dual-stack to IPv4. Global Accelerator
      # stores a maximum of ten event messages.

      struct AcceleratorEvent
        include JSON::Serializable

        # A string that contains an Event message describing changes or errors when you update an accelerator
        # in Global Accelerator from IPv4 to dual-stack, or dual-stack to IPv4.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A timestamp for when you update an accelerator in Global Accelerator from IPv4 to dual-stack, or
        # dual-stack to IPv4.

        @[JSON::Field(key: "Timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @message : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # The accelerator that you specified could not be disabled.

      struct AcceleratorNotDisabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The accelerator that you specified doesn't exist.

      struct AcceleratorNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You don't have access permission.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddCustomRoutingEndpointsRequest
        include JSON::Serializable

        # The list of endpoint objects to add to a custom routing accelerator.

        @[JSON::Field(key: "EndpointConfigurations")]
        getter endpoint_configurations : Array(Types::CustomRoutingEndpointConfiguration)

        # The Amazon Resource Name (ARN) of the endpoint group for the custom routing endpoint.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_configurations : Array(Types::CustomRoutingEndpointConfiguration),
          @endpoint_group_arn : String
        )
        end
      end


      struct AddCustomRoutingEndpointsResponse
        include JSON::Serializable

        # The endpoint objects added to the custom routing accelerator.

        @[JSON::Field(key: "EndpointDescriptions")]
        getter endpoint_descriptions : Array(Types::CustomRoutingEndpointDescription)?

        # The Amazon Resource Name (ARN) of the endpoint group for the custom routing endpoint.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        def initialize(
          @endpoint_descriptions : Array(Types::CustomRoutingEndpointDescription)? = nil,
          @endpoint_group_arn : String? = nil
        )
        end
      end


      struct AddEndpointsRequest
        include JSON::Serializable

        # The list of endpoint objects.

        @[JSON::Field(key: "EndpointConfigurations")]
        getter endpoint_configurations : Array(Types::EndpointConfiguration)

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_configurations : Array(Types::EndpointConfiguration),
          @endpoint_group_arn : String
        )
        end
      end


      struct AddEndpointsResponse
        include JSON::Serializable

        # The list of endpoint objects.

        @[JSON::Field(key: "EndpointDescriptions")]
        getter endpoint_descriptions : Array(Types::EndpointDescription)?

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        def initialize(
          @endpoint_descriptions : Array(Types::EndpointDescription)? = nil,
          @endpoint_group_arn : String? = nil
        )
        end
      end


      struct AdvertiseByoipCidrRequest
        include JSON::Serializable

        # The address range, in CIDR notation. This must be the exact range that you provisioned. You can't
        # advertise only a portion of the provisioned range. For more information, see Bring your own IP
        # addresses (BYOIP) in the Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        def initialize(
          @cidr : String
        )
        end
      end


      struct AdvertiseByoipCidrResponse
        include JSON::Serializable

        # Information about the address range.

        @[JSON::Field(key: "ByoipCidr")]
        getter byoip_cidr : Types::ByoipCidr?

        def initialize(
          @byoip_cidr : Types::ByoipCidr? = nil
        )
        end
      end


      struct AllowCustomRoutingTrafficRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        # An ID for the endpoint. For custom routing accelerators, this is the virtual private cloud (VPC)
        # subnet ID.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String

        # Indicates whether all destination IP addresses and ports for a specified VPC subnet endpoint can
        # receive traffic from a custom routing accelerator. The value is TRUE or FALSE. When set to TRUE, all
        # destinations in the custom routing VPC subnet can receive traffic. Note that you cannot specify
        # destination IP addresses and ports when the value is set to TRUE. When set to FALSE (or not
        # specified), you must specify a list of destination IP addresses that are allowed to receive traffic.
        # A list of ports is optional. If you don't specify a list of ports, the ports that can accept traffic
        # is the same as the ports configured for the endpoint group. The default value is FALSE.

        @[JSON::Field(key: "AllowAllTrafficToEndpoint")]
        getter allow_all_traffic_to_endpoint : Bool?

        # A list of specific Amazon EC2 instance IP addresses (destination addresses) in a subnet that you
        # want to allow to receive traffic. The IP addresses must be a subset of the IP addresses that you
        # specified for the endpoint group. DestinationAddresses is required if AllowAllTrafficToEndpoint is
        # FALSE or is not specified.

        @[JSON::Field(key: "DestinationAddresses")]
        getter destination_addresses : Array(String)?

        # A list of specific Amazon EC2 instance ports (destination ports) that you want to allow to receive
        # traffic.

        @[JSON::Field(key: "DestinationPorts")]
        getter destination_ports : Array(Int32)?

        def initialize(
          @endpoint_group_arn : String,
          @endpoint_id : String,
          @allow_all_traffic_to_endpoint : Bool? = nil,
          @destination_addresses : Array(String)? = nil,
          @destination_ports : Array(Int32)? = nil
        )
        end
      end

      # The listener that you specified has an endpoint group associated with it. You must remove all
      # dependent resources from a listener before you can delete it.

      struct AssociatedEndpointGroupFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The accelerator that you specified has a listener associated with it. You must remove all dependent
      # resources from an accelerator before you can delete it.

      struct AssociatedListenerFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A cross-account attachment in Global Accelerator. A cross-account attachment specifies the
      # principals who have permission to work with resources in your account, which you also list in the
      # attachment.

      struct Attachment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cross-account attachment.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String?

        # The date and time that the cross-account attachment was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The date and time that the cross-account attachment was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the cross-account attachment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The principals included in the cross-account attachment.

        @[JSON::Field(key: "Principals")]
        getter principals : Array(String)?

        # The resources included in the cross-account attachment.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        def initialize(
          @attachment_arn : String? = nil,
          @created_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @principals : Array(String)? = nil,
          @resources : Array(Types::Resource)? = nil
        )
        end
      end

      # No cross-account attachment was found.

      struct AttachmentNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about an IP address range that is provisioned for use with your Amazon Web Services
      # resources through bring your own IP address (BYOIP). The following describes each BYOIP State that
      # your IP address range can be in. PENDING_PROVISIONING — You’ve submitted a request to provision an
      # IP address range but it is not yet provisioned with Global Accelerator. READY — The address range is
      # provisioned with Global Accelerator and can be advertised. PENDING_ADVERTISING — You’ve submitted a
      # request for Global Accelerator to advertise an address range but it is not yet being advertised.
      # ADVERTISING — The address range is being advertised by Global Accelerator. PENDING_WITHDRAWING —
      # You’ve submitted a request to withdraw an address range from being advertised but it is still being
      # advertised by Global Accelerator. PENDING_DEPROVISIONING — You’ve submitted a request to deprovision
      # an address range from Global Accelerator but it is still provisioned. DEPROVISIONED — The address
      # range is deprovisioned from Global Accelerator. FAILED_PROVISION — The request to provision the
      # address range from Global Accelerator was not successful. Please make sure that you provide all of
      # the correct information, and try again. If the request fails a second time, contact Amazon Web
      # Services support. FAILED_ADVERTISING — The request for Global Accelerator to advertise the address
      # range was not successful. Please make sure that you provide all of the correct information, and try
      # again. If the request fails a second time, contact Amazon Web Services support. FAILED_WITHDRAW —
      # The request to withdraw the address range from advertising by Global Accelerator was not successful.
      # Please make sure that you provide all of the correct information, and try again. If the request
      # fails a second time, contact Amazon Web Services support. FAILED_DEPROVISION — The request to
      # deprovision the address range from Global Accelerator was not successful. Please make sure that you
      # provide all of the correct information, and try again. If the request fails a second time, contact
      # Amazon Web Services support.

      struct ByoipCidr
        include JSON::Serializable

        # The address range, in CIDR notation. For more information, see Bring your own IP addresses (BYOIP)
        # in the Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String?

        # A history of status changes for an IP address range that you bring to Global Accelerator through
        # bring your own IP address (BYOIP).

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::ByoipCidrEvent)?

        # The state of the address pool.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @cidr : String? = nil,
          @events : Array(Types::ByoipCidrEvent)? = nil,
          @state : String? = nil
        )
        end
      end

      # A complex type that contains a Message and a Timestamp value for changes that you make in the status
      # of an IP address range that you bring to Global Accelerator through bring your own IP address
      # (BYOIP).

      struct ByoipCidrEvent
        include JSON::Serializable

        # A string that contains an Event message describing changes that you make in the status of an IP
        # address range that you bring to Global Accelerator through bring your own IP address (BYOIP).

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A timestamp for when you make a status change for an IP address range that you bring to Global
        # Accelerator through bring your own IP address (BYOIP).

        @[JSON::Field(key: "Timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @message : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # The CIDR that you specified was not found or is incorrect.

      struct ByoipCidrNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides authorization for Amazon to bring a specific IP address range to a specific Amazon Web
      # Services account using bring your own IP addresses (BYOIP). For more information, see Bring your own
      # IP addresses (BYOIP) in the Global Accelerator Developer Guide .

      struct CidrAuthorizationContext
        include JSON::Serializable

        # The plain-text authorization message for the prefix and account.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The signed authorization message for the prefix and account.

        @[JSON::Field(key: "Signature")]
        getter signature : String

        def initialize(
          @message : String,
          @signature : String
        )
        end
      end

      # You can't use both of those options.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateAcceleratorRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of an accelerator.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of the accelerator. The name can have a maximum of 64 characters, must contain only
        # alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with a hyphen or
        # period.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Indicates whether an accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, an accelerator cannot be deleted. If set to false, the accelerator can
        # be deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The IP address type that an accelerator supports. For a standard accelerator, the value can be IPV4
        # or DUAL_STACK.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # Optionally, if you've added your own IP address pool to Global Accelerator (BYOIP), you can choose
        # an IPv4 address from your own pool to use for the accelerator's static IPv4 address when you create
        # an accelerator. After you bring an address range to Amazon Web Services, it appears in your account
        # as an address pool. When you create an accelerator, you can assign one IPv4 address from your range
        # to it. Global Accelerator assigns you a second static IPv4 address from an Amazon IP address range.
        # If you bring two IPv4 address ranges to Amazon Web Services, you can assign one IPv4 address from
        # each range to your accelerator. This restriction is because Global Accelerator assigns each address
        # range to a different network zone, for high availability. You can specify one or two addresses,
        # separated by a space. Do not include the /32 suffix. Note that you can't update IP addresses for an
        # existing accelerator. To change them, you must create a new accelerator with the new addresses. For
        # more information, see Bring your own IP addresses (BYOIP) in the Global Accelerator Developer Guide
        # .

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # Create tags for an accelerator. For more information, see Tagging in Global Accelerator in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @idempotency_token : String,
          @name : String,
          @enabled : Bool? = nil,
          @ip_address_type : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateAcceleratorResponse
        include JSON::Serializable

        # The accelerator that is created by specifying a listener and the supported IP address types.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::Accelerator?

        def initialize(
          @accelerator : Types::Accelerator? = nil
        )
        end
      end


      struct CreateCrossAccountAttachmentRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of the cross-account attachment.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The principals to include in the cross-account attachment. A principal can be an Amazon Web Services
        # account number or the Amazon Resource Name (ARN) for an accelerator.

        @[JSON::Field(key: "Principals")]
        getter principals : Array(String)?

        # The Amazon Resource Names (ARNs) for the resources to include in the cross-account attachment. A
        # resource can be any supported Amazon Web Services resource type for Global Accelerator or a CIDR
        # range for a bring your own IP address (BYOIP) address pool.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(Types::Resource)?

        # Add tags for a cross-account attachment. For more information, see Tagging in Global Accelerator in
        # the Global Accelerator Developer Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @idempotency_token : String,
          @name : String,
          @principals : Array(String)? = nil,
          @resources : Array(Types::Resource)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCrossAccountAttachmentResponse
        include JSON::Serializable

        # Information about the cross-account attachment.

        @[JSON::Field(key: "CrossAccountAttachment")]
        getter cross_account_attachment : Types::Attachment?

        def initialize(
          @cross_account_attachment : Types::Attachment? = nil
        )
        end
      end


      struct CreateCustomRoutingAcceleratorRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The name of a custom routing accelerator. The name can have a maximum of 64 characters, must contain
        # only alphanumeric characters or hyphens (-), and must not begin or end with a hyphen.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Indicates whether an accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, an accelerator cannot be deleted. If set to false, the accelerator can
        # be deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The IP address type that an accelerator supports. For a custom routing accelerator, the value must
        # be IPV4.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # Optionally, if you've added your own IP address pool to Global Accelerator (BYOIP), you can choose
        # an IPv4 address from your own pool to use for the accelerator's static IPv4 address when you create
        # an accelerator. After you bring an address range to Amazon Web Services, it appears in your account
        # as an address pool. When you create an accelerator, you can assign one IPv4 address from your range
        # to it. Global Accelerator assigns you a second static IPv4 address from an Amazon IP address range.
        # If you bring two IPv4 address ranges to Amazon Web Services, you can assign one IPv4 address from
        # each range to your accelerator. This restriction is because Global Accelerator assigns each address
        # range to a different network zone, for high availability. You can specify one or two addresses,
        # separated by a space. Do not include the /32 suffix. Note that you can't update IP addresses for an
        # existing accelerator. To change them, you must create a new accelerator with the new addresses. For
        # more information, see Bring your own IP addresses (BYOIP) in the Global Accelerator Developer Guide
        # .

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # Create tags for an accelerator. For more information, see Tagging in Global Accelerator in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @idempotency_token : String,
          @name : String,
          @enabled : Bool? = nil,
          @ip_address_type : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCustomRoutingAcceleratorResponse
        include JSON::Serializable

        # The accelerator that is created.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::CustomRoutingAccelerator?

        def initialize(
          @accelerator : Types::CustomRoutingAccelerator? = nil
        )
        end
      end


      struct CreateCustomRoutingEndpointGroupRequest
        include JSON::Serializable

        # Sets the port range and protocol for all endpoints (virtual private cloud subnets) in a custom
        # routing endpoint group to accept client traffic on.

        @[JSON::Field(key: "DestinationConfigurations")]
        getter destination_configurations : Array(Types::CustomRoutingDestinationConfiguration)

        # The Amazon Web Services Region where the endpoint group is located. A listener can have only one
        # endpoint group in a specific Region.

        @[JSON::Field(key: "EndpointGroupRegion")]
        getter endpoint_group_region : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The Amazon Resource Name (ARN) of the listener for a custom routing endpoint.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @destination_configurations : Array(Types::CustomRoutingDestinationConfiguration),
          @endpoint_group_region : String,
          @idempotency_token : String,
          @listener_arn : String
        )
        end
      end


      struct CreateCustomRoutingEndpointGroupResponse
        include JSON::Serializable

        # The information about the endpoint group created for a custom routing accelerator.

        @[JSON::Field(key: "EndpointGroup")]
        getter endpoint_group : Types::CustomRoutingEndpointGroup?

        def initialize(
          @endpoint_group : Types::CustomRoutingEndpointGroup? = nil
        )
        end
      end


      struct CreateCustomRoutingListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator for a custom routing listener.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The port range to support for connections from clients to your accelerator. Separately, you set port
        # ranges for endpoints. For more information, see About endpoints for custom routing accelerators .

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)

        def initialize(
          @accelerator_arn : String,
          @idempotency_token : String,
          @port_ranges : Array(Types::PortRange)
        )
        end
      end


      struct CreateCustomRoutingListenerResponse
        include JSON::Serializable

        # The listener that you've created for a custom routing accelerator.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::CustomRoutingListener?

        def initialize(
          @listener : Types::CustomRoutingListener? = nil
        )
        end
      end


      struct CreateEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Web Services Region where the endpoint group is located. A listener can have only one
        # endpoint group in a specific Region.

        @[JSON::Field(key: "EndpointGroupRegion")]
        getter endpoint_group_region : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The list of endpoint objects.

        @[JSON::Field(key: "EndpointConfigurations")]
        getter endpoint_configurations : Array(Types::EndpointConfiguration)?

        # The time—10 seconds or 30 seconds—between each health check for an endpoint. The default value is
        # 30.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # If the protocol is HTTP/S, then this specifies the path that is the destination for health check
        # targets. The default value is slash (/).

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port that Global Accelerator uses to check the health of endpoints that are part of this
        # endpoint group. The default port is the listener port that this endpoint group is associated with.
        # If listener port is a list of ports, Global Accelerator uses the first port in the list.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : Int32?

        # The protocol that Global Accelerator uses to check the health of endpoints that are part of this
        # endpoint group. The default value is TCP.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # Override specific listener ports used to route traffic to endpoints that are part of this endpoint
        # group. For example, you can create a port override in which the listener receives user traffic on
        # ports 80 and 443, but your accelerator routes that traffic to ports 1080 and 1443, respectively, on
        # the endpoints. For more information, see Overriding listener ports in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "PortOverrides")]
        getter port_overrides : Array(Types::PortOverride)?

        # The number of consecutive health checks required to set the state of a healthy endpoint to
        # unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.

        @[JSON::Field(key: "ThresholdCount")]
        getter threshold_count : Int32?

        # The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is
        # distributed to other endpoint groups for this listener. Use this action to increase (dial up) or
        # decrease (dial down) traffic to a specific Region. The percentage is applied to the traffic that
        # would otherwise have been routed to the Region based on optimal routing. The default value is 100.

        @[JSON::Field(key: "TrafficDialPercentage")]
        getter traffic_dial_percentage : Float64?

        def initialize(
          @endpoint_group_region : String,
          @idempotency_token : String,
          @listener_arn : String,
          @endpoint_configurations : Array(Types::EndpointConfiguration)? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : Int32? = nil,
          @health_check_protocol : String? = nil,
          @port_overrides : Array(Types::PortOverride)? = nil,
          @threshold_count : Int32? = nil,
          @traffic_dial_percentage : Float64? = nil
        )
        end
      end


      struct CreateEndpointGroupResponse
        include JSON::Serializable

        # The information about the endpoint group that was created.

        @[JSON::Field(key: "EndpointGroup")]
        getter endpoint_group : Types::EndpointGroup?

        def initialize(
          @endpoint_group : Types::EndpointGroup? = nil
        )
        end
      end


      struct CreateListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of your accelerator.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency—that is, the
        # uniqueness—of the request.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String

        # The list of port ranges to support for connections from clients to your accelerator.

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)

        # The protocol for connections from clients to your accelerator.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String

        # Client affinity lets you direct all requests from a user to the same endpoint, if you have stateful
        # applications, regardless of the port and protocol of the client request. Client affinity gives you
        # control over whether to always route each client to the same specific endpoint. Global Accelerator
        # uses a consistent-flow hashing algorithm to choose the optimal endpoint for a connection. If client
        # affinity is NONE , Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP address,
        # source port, destination IP address, destination port, and protocol—to select the hash value, and
        # then chooses the best endpoint. However, with this setting, if someone uses different ports to
        # connect to Global Accelerator, their connections might not be always routed to the same endpoint
        # because the hash value changes. If you want a given client to always be routed to the same endpoint,
        # set client affinity to SOURCE_IP instead. When you use the SOURCE_IP setting, Global Accelerator
        # uses the "two-tuple" (2-tuple) properties— source (client) IP address and destination IP address—to
        # select the hash value. The default value is NONE .

        @[JSON::Field(key: "ClientAffinity")]
        getter client_affinity : String?

        def initialize(
          @accelerator_arn : String,
          @idempotency_token : String,
          @port_ranges : Array(Types::PortRange),
          @protocol : String,
          @client_affinity : String? = nil
        )
        end
      end


      struct CreateListenerResponse
        include JSON::Serializable

        # The listener that you've created.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::Listener?

        def initialize(
          @listener : Types::Listener? = nil
        )
        end
      end

      # An endpoint (Amazon Web Services resource) or an IP address range, in CIDR format, that is listed in
      # a cross-account attachment. A cross-account resource can be added to an accelerator by specified
      # principals, which are also listed in the attachment. For more information, see Working with
      # cross-account attachments and resources in Global Accelerator in the Global Accelerator Developer
      # Guide .

      struct CrossAccountResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cross-account attachment that specifies the resources
        # (endpoints or CIDR range) that can be added to accelerators and principals that have permission to
        # add them.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String?

        # An IP address range, in CIDR format, that is specified as an Amazon Web Services resource. The
        # address must be provisioned and advertised in Global Accelerator by following the bring your own IP
        # address (BYOIP) process for Global Accelerator. For more information, see Bring your own IP
        # addresses (BYOIP) in the Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String?

        # The endpoint ID for the endpoint that is listed in a cross-account attachment and can be added to an
        # accelerator by specified principals.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @attachment_arn : String? = nil,
          @cidr : String? = nil,
          @endpoint_id : String? = nil
        )
        end
      end

      # Attributes of a custom routing accelerator.

      struct CustomRoutingAccelerator
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom routing accelerator.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String?

        # The date and time that the accelerator was created.

        @[JSON::Field(key: "CreatedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_time : Time?

        # The Domain Name System (DNS) name that Global Accelerator creates that points to an accelerator's
        # static IPv4 addresses. The naming convention for the DNS name is the following: A lowercase letter
        # a, followed by a 16-bit random hex string, followed by .awsglobalaccelerator.com. For example:
        # a1234567890abcdef.awsglobalaccelerator.com. If you have a dual-stack accelerator, you also have a
        # second DNS name, DualStackDnsName , that points to both the A record and the AAAA record for all
        # four static addresses for the accelerator: two IPv4 addresses and two IPv6 addresses. For more
        # information about the default DNS name, see Support for DNS addressing in Global Accelerator in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "DnsName")]
        getter dns_name : String?

        # Indicates whether the accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, the accelerator cannot be deleted. If set to false, accelerator can be
        # deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The IP address type that an accelerator supports. For a custom routing accelerator, the value must
        # be IPV4.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The static IP addresses that Global Accelerator associates with the accelerator.

        @[JSON::Field(key: "IpSets")]
        getter ip_sets : Array(Types::IpSet)?

        # The date and time that the accelerator was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the accelerator. The name must contain only alphanumeric characters or hyphens (-), and
        # must not begin or end with a hyphen.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Describes the deployment status of the accelerator.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @accelerator_arn : String? = nil,
          @created_time : Time? = nil,
          @dns_name : String? = nil,
          @enabled : Bool? = nil,
          @ip_address_type : String? = nil,
          @ip_sets : Array(Types::IpSet)? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Attributes of a custom routing accelerator.

      struct CustomRoutingAcceleratorAttributes
        include JSON::Serializable

        # Indicates whether flow logs are enabled. The default value is false. If the value is true,
        # FlowLogsS3Bucket and FlowLogsS3Prefix must be specified. For more information, see Flow logs in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "FlowLogsEnabled")]
        getter flow_logs_enabled : Bool?

        # The name of the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true
        # . The bucket must exist and have a bucket policy that grants Global Accelerator permission to write
        # to the bucket.

        @[JSON::Field(key: "FlowLogsS3Bucket")]
        getter flow_logs_s3_bucket : String?

        # The prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is required if
        # FlowLogsEnabled is true . If you don’t specify a prefix, the flow logs are stored in the root of the
        # bucket. If you specify slash (/) for the S3 bucket prefix, the log file bucket folder structure will
        # include a double slash (//), like the following: DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id

        @[JSON::Field(key: "FlowLogsS3Prefix")]
        getter flow_logs_s3_prefix : String?

        def initialize(
          @flow_logs_enabled : Bool? = nil,
          @flow_logs_s3_bucket : String? = nil,
          @flow_logs_s3_prefix : String? = nil
        )
        end
      end

      # For a custom routing accelerator, sets the port range and protocol for all endpoints (virtual
      # private cloud subnets) in an endpoint group to accept client traffic on.

      struct CustomRoutingDestinationConfiguration
        include JSON::Serializable

        # The first port, inclusive, in the range of ports for the endpoint group that is associated with a
        # custom routing accelerator.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32

        # The protocol for the endpoint group that is associated with a custom routing accelerator. The
        # protocol can be either TCP or UDP.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)

        # The last port, inclusive, in the range of ports for the endpoint group that is associated with a
        # custom routing accelerator.

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32

        def initialize(
          @from_port : Int32,
          @protocols : Array(String),
          @to_port : Int32
        )
        end
      end

      # For a custom routing accelerator, describes the port range and protocol for all endpoints (virtual
      # private cloud subnets) in an endpoint group to accept client traffic on.

      struct CustomRoutingDestinationDescription
        include JSON::Serializable

        # The first port, inclusive, in the range of ports for the endpoint group that is associated with a
        # custom routing accelerator.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32?

        # The protocol for the endpoint group that is associated with a custom routing accelerator. The
        # protocol can be either TCP or UDP.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        # The last port, inclusive, in the range of ports for the endpoint group that is associated with a
        # custom routing accelerator.

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32?

        def initialize(
          @from_port : Int32? = nil,
          @protocols : Array(String)? = nil,
          @to_port : Int32? = nil
        )
        end
      end

      # The list of endpoint objects. For custom routing, this is a list of virtual private cloud (VPC)
      # subnet IDs.

      struct CustomRoutingEndpointConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cross-account attachment that specifies the endpoints
        # (resources) that can be added to accelerators and principals that have permission to add the
        # endpoints.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String?

        # An ID for the endpoint. For custom routing accelerators, this is the virtual private cloud (VPC)
        # subnet ID.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @attachment_arn : String? = nil,
          @endpoint_id : String? = nil
        )
        end
      end

      # A complex type for an endpoint for a custom routing accelerator. Each endpoint group can include one
      # or more endpoints, which are virtual private cloud (VPC) subnets.

      struct CustomRoutingEndpointDescription
        include JSON::Serializable

        # An ID for the endpoint. For custom routing accelerators, this is the virtual private cloud (VPC)
        # subnet ID.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @endpoint_id : String? = nil
        )
        end
      end

      # A complex type for the endpoint group for a custom routing accelerator. An Amazon Web Services
      # Region can have only one endpoint group for a specific listener.

      struct CustomRoutingEndpointGroup
        include JSON::Serializable

        # For a custom routing accelerator, describes the port range and protocol for all endpoints (virtual
        # private cloud subnets) in an endpoint group to accept client traffic on.

        @[JSON::Field(key: "DestinationDescriptions")]
        getter destination_descriptions : Array(Types::CustomRoutingDestinationDescription)?

        # For a custom routing accelerator, describes the endpoints (virtual private cloud subnets) in an
        # endpoint group to accept client traffic on.

        @[JSON::Field(key: "EndpointDescriptions")]
        getter endpoint_descriptions : Array(Types::CustomRoutingEndpointDescription)?

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        # The Amazon Web Services Region where the endpoint group is located.

        @[JSON::Field(key: "EndpointGroupRegion")]
        getter endpoint_group_region : String?

        def initialize(
          @destination_descriptions : Array(Types::CustomRoutingDestinationDescription)? = nil,
          @endpoint_descriptions : Array(Types::CustomRoutingEndpointDescription)? = nil,
          @endpoint_group_arn : String? = nil,
          @endpoint_group_region : String? = nil
        )
        end
      end

      # A complex type for a listener for a custom routing accelerator.

      struct CustomRoutingListener
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String?

        # The port range to support for connections from clients to your accelerator. Separately, you set port
        # ranges for endpoints. For more information, see About endpoints for custom routing accelerators .

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)?

        def initialize(
          @listener_arn : String? = nil,
          @port_ranges : Array(Types::PortRange)? = nil
        )
        end
      end


      struct DeleteAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an accelerator.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DeleteCrossAccountAttachmentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the cross-account attachment to delete.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String

        def initialize(
          @attachment_arn : String
        )
        end
      end


      struct DeleteCustomRoutingAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom routing accelerator to delete.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DeleteCustomRoutingEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group to delete.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_group_arn : String
        )
        end
      end


      struct DeleteCustomRoutingListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to delete.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DeleteEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group to delete.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_group_arn : String
        )
        end
      end


      struct DeleteListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DenyCustomRoutingTrafficRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        # An ID for the endpoint. For custom routing accelerators, this is the virtual private cloud (VPC)
        # subnet ID.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String

        # Indicates whether all destination IP addresses and ports for a specified VPC subnet endpoint cannot
        # receive traffic from a custom routing accelerator. The value is TRUE or FALSE. When set to TRUE, no
        # destinations in the custom routing VPC subnet can receive traffic. Note that you cannot specify
        # destination IP addresses and ports when the value is set to TRUE. When set to FALSE (or not
        # specified), you must specify a list of destination IP addresses that cannot receive traffic. A list
        # of ports is optional. If you don't specify a list of ports, the ports that can accept traffic is the
        # same as the ports configured for the endpoint group. The default value is FALSE.

        @[JSON::Field(key: "DenyAllTrafficToEndpoint")]
        getter deny_all_traffic_to_endpoint : Bool?

        # A list of specific Amazon EC2 instance IP addresses (destination addresses) in a subnet that you
        # want to prevent from receiving traffic. The IP addresses must be a subset of the IP addresses
        # allowed for the VPC subnet associated with the endpoint group.

        @[JSON::Field(key: "DestinationAddresses")]
        getter destination_addresses : Array(String)?

        # A list of specific Amazon EC2 instance ports (destination ports) in a subnet endpoint that you want
        # to prevent from receiving traffic.

        @[JSON::Field(key: "DestinationPorts")]
        getter destination_ports : Array(Int32)?

        def initialize(
          @endpoint_group_arn : String,
          @endpoint_id : String,
          @deny_all_traffic_to_endpoint : Bool? = nil,
          @destination_addresses : Array(String)? = nil,
          @destination_ports : Array(Int32)? = nil
        )
        end
      end


      struct DeprovisionByoipCidrRequest
        include JSON::Serializable

        # The address range, in CIDR notation. The prefix must be the same prefix that you specified when you
        # provisioned the address range. For more information, see Bring your own IP addresses (BYOIP) in the
        # Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        def initialize(
          @cidr : String
        )
        end
      end


      struct DeprovisionByoipCidrResponse
        include JSON::Serializable

        # Information about the address range.

        @[JSON::Field(key: "ByoipCidr")]
        getter byoip_cidr : Types::ByoipCidr?

        def initialize(
          @byoip_cidr : Types::ByoipCidr? = nil
        )
        end
      end


      struct DescribeAcceleratorAttributesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator with the attributes that you want to describe.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DescribeAcceleratorAttributesResponse
        include JSON::Serializable

        # The attributes of the accelerator.

        @[JSON::Field(key: "AcceleratorAttributes")]
        getter accelerator_attributes : Types::AcceleratorAttributes?

        def initialize(
          @accelerator_attributes : Types::AcceleratorAttributes? = nil
        )
        end
      end


      struct DescribeAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to describe.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DescribeAcceleratorResponse
        include JSON::Serializable

        # The description of the accelerator.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::Accelerator?

        def initialize(
          @accelerator : Types::Accelerator? = nil
        )
        end
      end


      struct DescribeCrossAccountAttachmentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the cross-account attachment to describe.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String

        def initialize(
          @attachment_arn : String
        )
        end
      end


      struct DescribeCrossAccountAttachmentResponse
        include JSON::Serializable

        # Information about the cross-account attachment.

        @[JSON::Field(key: "CrossAccountAttachment")]
        getter cross_account_attachment : Types::Attachment?

        def initialize(
          @cross_account_attachment : Types::Attachment? = nil
        )
        end
      end


      struct DescribeCustomRoutingAcceleratorAttributesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom routing accelerator to describe the attributes for.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DescribeCustomRoutingAcceleratorAttributesResponse
        include JSON::Serializable

        # The attributes of the custom routing accelerator.

        @[JSON::Field(key: "AcceleratorAttributes")]
        getter accelerator_attributes : Types::CustomRoutingAcceleratorAttributes?

        def initialize(
          @accelerator_attributes : Types::CustomRoutingAcceleratorAttributes? = nil
        )
        end
      end


      struct DescribeCustomRoutingAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to describe.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        def initialize(
          @accelerator_arn : String
        )
        end
      end


      struct DescribeCustomRoutingAcceleratorResponse
        include JSON::Serializable

        # The description of the custom routing accelerator.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::CustomRoutingAccelerator?

        def initialize(
          @accelerator : Types::CustomRoutingAccelerator? = nil
        )
        end
      end


      struct DescribeCustomRoutingEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group to describe.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_group_arn : String
        )
        end
      end


      struct DescribeCustomRoutingEndpointGroupResponse
        include JSON::Serializable

        # The description of an endpoint group for a custom routing accelerator.

        @[JSON::Field(key: "EndpointGroup")]
        getter endpoint_group : Types::CustomRoutingEndpointGroup?

        def initialize(
          @endpoint_group : Types::CustomRoutingEndpointGroup? = nil
        )
        end
      end


      struct DescribeCustomRoutingListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to describe.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DescribeCustomRoutingListenerResponse
        include JSON::Serializable

        # The description of a listener for a custom routing accelerator.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::CustomRoutingListener?

        def initialize(
          @listener : Types::CustomRoutingListener? = nil
        )
        end
      end


      struct DescribeEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group to describe.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        def initialize(
          @endpoint_group_arn : String
        )
        end
      end


      struct DescribeEndpointGroupResponse
        include JSON::Serializable

        # The description of an endpoint group.

        @[JSON::Field(key: "EndpointGroup")]
        getter endpoint_group : Types::EndpointGroup?

        def initialize(
          @endpoint_group : Types::EndpointGroup? = nil
        )
        end
      end


      struct DescribeListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to describe.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        def initialize(
          @listener_arn : String
        )
        end
      end


      struct DescribeListenerResponse
        include JSON::Serializable

        # The description of a listener.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::Listener?

        def initialize(
          @listener : Types::Listener? = nil
        )
        end
      end

      # The port mappings for a specified endpoint IP address (destination).

      struct DestinationPortMapping
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom routing accelerator that you have port mappings for.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String?

        # The IP address/port combinations (sockets) that map to a given destination socket address.

        @[JSON::Field(key: "AcceleratorSocketAddresses")]
        getter accelerator_socket_addresses : Array(Types::SocketAddress)?

        # The endpoint IP address/port combination for traffic received on the accelerator socket address.

        @[JSON::Field(key: "DestinationSocketAddress")]
        getter destination_socket_address : Types::SocketAddress?

        # Indicates whether or not a port mapping destination can receive traffic. The value is either ALLOW,
        # if traffic is allowed to the destination, or DENY, if traffic is not allowed to the destination.

        @[JSON::Field(key: "DestinationTrafficState")]
        getter destination_traffic_state : String?

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        # The Amazon Web Services Region for the endpoint group.

        @[JSON::Field(key: "EndpointGroupRegion")]
        getter endpoint_group_region : String?

        # The ID for the virtual private cloud (VPC) subnet.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The IP address type that an accelerator supports. For a custom routing accelerator, the value must
        # be IPV4.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        def initialize(
          @accelerator_arn : String? = nil,
          @accelerator_socket_addresses : Array(Types::SocketAddress)? = nil,
          @destination_socket_address : Types::SocketAddress? = nil,
          @destination_traffic_state : String? = nil,
          @endpoint_group_arn : String? = nil,
          @endpoint_group_region : String? = nil,
          @endpoint_id : String? = nil,
          @ip_address_type : String? = nil
        )
        end
      end

      # The endpoint that you specified doesn't exist.

      struct EndpointAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type for endpoints. A resource must be valid and active when you add it as an endpoint.

      struct EndpointConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cross-account attachment that specifies the endpoints
        # (resources) that can be added to accelerators and principals that have permission to add the
        # endpoints.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String?

        # Indicates whether client IP address preservation is enabled for an endpoint. The value is true or
        # false. The default value is true for Application Load Balancer endpoints. If the value is set to
        # true, the client's IP address is preserved in the X-Forwarded-For request header as traffic travels
        # to applications on the endpoint fronted by the accelerator. Client IP address preservation is
        # supported, in specific Amazon Web Services Regions, for endpoints that are Application Load
        # Balancers, Amazon EC2 instances, and Network Load Balancers with security groups. IMPORTANT: You
        # cannot use client IP address preservation with Network Load Balancers with TLS listeners. For more
        # information, see Preserve client IP addresses in Global Accelerator in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "ClientIPPreservationEnabled")]
        getter client_ip_preservation_enabled : Bool?

        # An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load Balancer,
        # this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an Elastic IP address,
        # this is the Elastic IP address allocation ID. For Amazon EC2 instances, this is the EC2 instance ID.
        # A resource must be valid and active when you add it as an endpoint. For cross-account endpoints,
        # this must be the ARN of the resource.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The weight associated with the endpoint. When you add weights to endpoints, you configure Global
        # Accelerator to route traffic based on proportions that you specify. For example, you might specify
        # endpoint weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of your traffic, on average, is
        # routed to the first endpoint, 5/20 is routed both to the second and third endpoints, and 6/20 is
        # routed to the last endpoint. For more information, see Endpoint weights in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "Weight")]
        getter weight : Int32?

        def initialize(
          @attachment_arn : String? = nil,
          @client_ip_preservation_enabled : Bool? = nil,
          @endpoint_id : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # A complex type for an endpoint. Each endpoint group can include one or more endpoints, such as load
      # balancers.

      struct EndpointDescription
        include JSON::Serializable

        # Indicates whether client IP address preservation is enabled for an endpoint. The value is true or
        # false. The default value is true for Application Load Balancers endpoints. If the value is set to
        # true, the client's IP address is preserved in the X-Forwarded-For request header as traffic travels
        # to applications on the endpoint fronted by the accelerator. Client IP address preservation is
        # supported, in specific Amazon Web Services Regions, for endpoints that are Application Load
        # Balancers, Amazon EC2 instances, and Network Load Balancers with security groups. IMPORTANT: You
        # cannot use client IP address preservation with Network Load Balancers with TLS listeners. For more
        # information, see Preserve client IP addresses in Global Accelerator in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "ClientIPPreservationEnabled")]
        getter client_ip_preservation_enabled : Bool?

        # An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load Balancer,
        # this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an Elastic IP address,
        # this is the Elastic IP address allocation ID. For Amazon EC2 instances, this is the EC2 instance ID.
        # An Application Load Balancer can be either internal or internet-facing.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # Returns a null result.

        @[JSON::Field(key: "HealthReason")]
        getter health_reason : String?

        # The health status of the endpoint.

        @[JSON::Field(key: "HealthState")]
        getter health_state : String?

        # The weight associated with the endpoint. When you add weights to endpoints, you configure Global
        # Accelerator to route traffic based on proportions that you specify. For example, you might specify
        # endpoint weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of your traffic, on average, is
        # routed to the first endpoint, 5/20 is routed both to the second and third endpoints, and 6/20 is
        # routed to the last endpoint. For more information, see Endpoint weights in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "Weight")]
        getter weight : Int32?

        def initialize(
          @client_ip_preservation_enabled : Bool? = nil,
          @endpoint_id : String? = nil,
          @health_reason : String? = nil,
          @health_state : String? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # A complex type for the endpoint group. An Amazon Web Services Region can have only one endpoint
      # group for a specific listener.

      struct EndpointGroup
        include JSON::Serializable

        # The list of endpoint objects.

        @[JSON::Field(key: "EndpointDescriptions")]
        getter endpoint_descriptions : Array(Types::EndpointDescription)?

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        # The Amazon Web Services Region where the endpoint group is located.

        @[JSON::Field(key: "EndpointGroupRegion")]
        getter endpoint_group_region : String?

        # The time—10 seconds or 30 seconds—between health checks for each endpoint. The default value is 30.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # If the protocol is HTTP/S, then this value provides the ping path that Global Accelerator uses for
        # the destination on the endpoints for health checks. The default is slash (/).

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port that Global Accelerator uses to perform health checks on endpoints that are part of this
        # endpoint group. The default port is the port for the listener that this endpoint group is associated
        # with. If the listener port is a list, Global Accelerator uses the first specified port in the list
        # of ports.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : Int32?

        # The protocol that Global Accelerator uses to perform health checks on endpoints that are part of
        # this endpoint group. The default value is TCP.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # Allows you to override the destination ports used to route traffic to an endpoint. Using a port
        # override lets you map a list of external destination ports (that your users send traffic to) to a
        # list of internal destination ports that you want an application endpoint to receive traffic on.

        @[JSON::Field(key: "PortOverrides")]
        getter port_overrides : Array(Types::PortOverride)?

        # The number of consecutive health checks required to set the state of a healthy endpoint to
        # unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.

        @[JSON::Field(key: "ThresholdCount")]
        getter threshold_count : Int32?

        # The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is
        # distributed to other endpoint groups for this listener. Use this action to increase (dial up) or
        # decrease (dial down) traffic to a specific Region. The percentage is applied to the traffic that
        # would otherwise have been routed to the Region based on optimal routing. The default value is 100.

        @[JSON::Field(key: "TrafficDialPercentage")]
        getter traffic_dial_percentage : Float64?

        def initialize(
          @endpoint_descriptions : Array(Types::EndpointDescription)? = nil,
          @endpoint_group_arn : String? = nil,
          @endpoint_group_region : String? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : Int32? = nil,
          @health_check_protocol : String? = nil,
          @port_overrides : Array(Types::PortOverride)? = nil,
          @threshold_count : Int32? = nil,
          @traffic_dial_percentage : Float64? = nil
        )
        end
      end

      # The endpoint group that you specified already exists.

      struct EndpointGroupAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The endpoint group that you specified doesn't exist.

      struct EndpointGroupNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type for an endpoint. Specifies information about the endpoint to remove from the endpoint
      # group.

      struct EndpointIdentifier
        include JSON::Serializable

        # An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load Balancer,
        # this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an Elastic IP address,
        # this is the Elastic IP address allocation ID. For Amazon EC2 instances, this is the EC2 instance ID.
        # An Application Load Balancer can be either internal or internet-facing.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String

        # Indicates whether client IP address preservation is enabled for an endpoint. The value is true or
        # false. If the value is set to true, the client's IP address is preserved in the X-Forwarded-For
        # request header as traffic travels to applications on the endpoint fronted by the accelerator.

        @[JSON::Field(key: "ClientIPPreservationEnabled")]
        getter client_ip_preservation_enabled : Bool?

        def initialize(
          @endpoint_id : String,
          @client_ip_preservation_enabled : Bool? = nil
        )
        end
      end

      # The endpoint that you specified doesn't exist.

      struct EndpointNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CIDR that you specified is not valid for this action. For example, the state of the CIDR might
      # be incorrect for this action.

      struct IncorrectCidrStateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was an internal error for Global Accelerator.

      struct InternalServiceErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An argument that you specified is invalid.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There isn't another item to return.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The port numbers that you specified are not valid numbers or are not unique for this accelerator.

      struct InvalidPortRangeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type for the set of IP addresses for an accelerator.

      struct IpSet
        include JSON::Serializable

        # The types of IP addresses included in this IP set.

        @[JSON::Field(key: "IpAddressFamily")]
        getter ip_address_family : String?

        # The array of IP addresses in the IP address set. An IP address set can have a maximum of two IP
        # addresses.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # IpFamily is deprecated and has been replaced by IpAddressFamily.

        @[JSON::Field(key: "IpFamily")]
        getter ip_family : String?

        def initialize(
          @ip_address_family : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @ip_family : String? = nil
        )
        end
      end

      # Processing your request would cause you to exceed an Global Accelerator limit.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAcceleratorsRequest
        include JSON::Serializable

        # The number of Global Accelerator objects that you want to return with this call. The default value
        # is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAcceleratorsResponse
        include JSON::Serializable

        # The list of accelerators for a customer account.

        @[JSON::Field(key: "Accelerators")]
        getter accelerators : Array(Types::Accelerator)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accelerators : Array(Types::Accelerator)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListByoipCidrsRequest
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListByoipCidrsResponse
        include JSON::Serializable

        # Information about your address ranges.

        @[JSON::Field(key: "ByoipCidrs")]
        getter byoip_cidrs : Array(Types::ByoipCidr)?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @byoip_cidrs : Array(Types::ByoipCidr)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountAttachmentsRequest
        include JSON::Serializable

        # The number of cross-account attachment objects that you want to return with this call. The default
        # value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountAttachmentsResponse
        include JSON::Serializable

        # Information about the cross-account attachments.

        @[JSON::Field(key: "CrossAccountAttachments")]
        getter cross_account_attachments : Array(Types::Attachment)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cross_account_attachments : Array(Types::Attachment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountResourceAccountsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct ListCrossAccountResourceAccountsResponse
        include JSON::Serializable

        # The account IDs of principals (resource owners) in a cross-account attachment who can work with
        # resources listed in the same attachment.

        @[JSON::Field(key: "ResourceOwnerAwsAccountIds")]
        getter resource_owner_aws_account_ids : Array(String)?

        def initialize(
          @resource_owner_aws_account_ids : Array(String)? = nil
        )
        end
      end


      struct ListCrossAccountResourcesRequest
        include JSON::Serializable

        # The account ID of a resource owner in a cross-account attachment.

        @[JSON::Field(key: "ResourceOwnerAwsAccountId")]
        getter resource_owner_aws_account_id : String

        # The Amazon Resource Name (ARN) of an accelerator in a cross-account attachment.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String?

        # The number of cross-account resource objects that you want to return with this call. The default
        # value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_owner_aws_account_id : String,
          @accelerator_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCrossAccountResourcesResponse
        include JSON::Serializable

        # The cross-account resources used with an accelerator.

        @[JSON::Field(key: "CrossAccountResources")]
        getter cross_account_resources : Array(Types::CrossAccountResource)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cross_account_resources : Array(Types::CrossAccountResource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingAcceleratorsRequest
        include JSON::Serializable

        # The number of custom routing Global Accelerator objects that you want to return with this call. The
        # default value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingAcceleratorsResponse
        include JSON::Serializable

        # The list of custom routing accelerators for a customer account.

        @[JSON::Field(key: "Accelerators")]
        getter accelerators : Array(Types::CustomRoutingAccelerator)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accelerators : Array(Types::CustomRoutingAccelerator)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingEndpointGroupsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to list endpoint groups for.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The number of endpoint group objects that you want to return with this call. The default value is
        # 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @listener_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingEndpointGroupsResponse
        include JSON::Serializable

        # The list of the endpoint groups associated with a listener for a custom routing accelerator.

        @[JSON::Field(key: "EndpointGroups")]
        getter endpoint_groups : Array(Types::CustomRoutingEndpointGroup)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoint_groups : Array(Types::CustomRoutingEndpointGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingListenersRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to list listeners for.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # The number of listener objects that you want to return with this call. The default value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accelerator_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingListenersResponse
        include JSON::Serializable

        # The list of listeners for a custom routing accelerator.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::CustomRoutingListener)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @listeners : Array(Types::CustomRoutingListener)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingPortMappingsByDestinationRequest
        include JSON::Serializable

        # The endpoint IP address in a virtual private cloud (VPC) subnet for which you want to receive back
        # port mappings.

        @[JSON::Field(key: "DestinationAddress")]
        getter destination_address : String

        # The ID for the virtual private cloud (VPC) subnet.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String

        # The number of destination port mappings that you want to return with this call. The default value is
        # 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destination_address : String,
          @endpoint_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingPortMappingsByDestinationResponse
        include JSON::Serializable

        # The port mappings for the endpoint IP address that you specified in the request.

        @[JSON::Field(key: "DestinationPortMappings")]
        getter destination_port_mappings : Array(Types::DestinationPortMapping)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @destination_port_mappings : Array(Types::DestinationPortMapping)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingPortMappingsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to list the custom routing port mappings for.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # The Amazon Resource Name (ARN) of the endpoint group to list the custom routing port mappings for.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        # The number of destination port mappings that you want to return with this call. The default value is
        # 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accelerator_arn : String,
          @endpoint_group_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCustomRoutingPortMappingsResponse
        include JSON::Serializable

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The port mappings for a custom routing accelerator.

        @[JSON::Field(key: "PortMappings")]
        getter port_mappings : Array(Types::PortMapping)?

        def initialize(
          @next_token : String? = nil,
          @port_mappings : Array(Types::PortMapping)? = nil
        )
        end
      end


      struct ListEndpointGroupsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The number of endpoint group objects that you want to return with this call. The default value is
        # 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @listener_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEndpointGroupsResponse
        include JSON::Serializable

        # The list of the endpoint groups associated with a listener.

        @[JSON::Field(key: "EndpointGroups")]
        getter endpoint_groups : Array(Types::EndpointGroup)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoint_groups : Array(Types::EndpointGroup)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListListenersRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator for which you want to list listener objects.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # The number of listener objects that you want to return with this call. The default value is 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @accelerator_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListListenersResponse
        include JSON::Serializable

        # The list of listeners for an accelerator.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)?

        # The token for the next set of results. You receive this token from a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @listeners : Array(Types::Listener)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to list tags for. An ARN uniquely identifies an
        # accelerator.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Root level tag for the Tags parameters.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A complex type for a listener.

      struct Listener
        include JSON::Serializable

        # Client affinity lets you direct all requests from a user to the same endpoint, if you have stateful
        # applications, regardless of the port and protocol of the client request. Client affinity gives you
        # control over whether to always route each client to the same specific endpoint. Global Accelerator
        # uses a consistent-flow hashing algorithm to choose the optimal endpoint for a connection. If client
        # affinity is NONE , Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP address,
        # source port, destination IP address, destination port, and protocol—to select the hash value, and
        # then chooses the best endpoint. However, with this setting, if someone uses different ports to
        # connect to Global Accelerator, their connections might not be always routed to the same endpoint
        # because the hash value changes. If you want a given client to always be routed to the same endpoint,
        # set client affinity to SOURCE_IP instead. When you use the SOURCE_IP setting, Global Accelerator
        # uses the "two-tuple" (2-tuple) properties— source (client) IP address and destination IP address—to
        # select the hash value. The default value is NONE .

        @[JSON::Field(key: "ClientAffinity")]
        getter client_affinity : String?

        # The Amazon Resource Name (ARN) of the listener.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String?

        # The list of port ranges for the connections from clients to the accelerator.

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)?

        # The protocol for the connections from clients to the accelerator.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @client_affinity : String? = nil,
          @listener_arn : String? = nil,
          @port_ranges : Array(Types::PortRange)? = nil,
          @protocol : String? = nil
        )
        end
      end

      # The listener that you specified doesn't exist.

      struct ListenerNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Returns the ports and associated IP addresses and ports of Amazon EC2 instances in your virtual
      # private cloud (VPC) subnets. Custom routing is a port mapping protocol in Global Accelerator that
      # statically associates port ranges with VPC subnets, which allows Global Accelerator to route to
      # specific instances and ports within one or more subnets.

      struct PortMapping
        include JSON::Serializable

        # The accelerator port.

        @[JSON::Field(key: "AcceleratorPort")]
        getter accelerator_port : Int32?

        # The EC2 instance IP address and port number in the virtual private cloud (VPC) subnet.

        @[JSON::Field(key: "DestinationSocketAddress")]
        getter destination_socket_address : Types::SocketAddress?

        # Indicates whether or not a port mapping destination can receive traffic. The value is either ALLOW,
        # if traffic is allowed to the destination, or DENY, if traffic is not allowed to the destination.

        @[JSON::Field(key: "DestinationTrafficState")]
        getter destination_traffic_state : String?

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String?

        # The IP address of the VPC subnet (the subnet ID).

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The protocols supported by the endpoint group.

        @[JSON::Field(key: "Protocols")]
        getter protocols : Array(String)?

        def initialize(
          @accelerator_port : Int32? = nil,
          @destination_socket_address : Types::SocketAddress? = nil,
          @destination_traffic_state : String? = nil,
          @endpoint_group_arn : String? = nil,
          @endpoint_id : String? = nil,
          @protocols : Array(String)? = nil
        )
        end
      end

      # Override specific listener ports used to route traffic to endpoints that are part of an endpoint
      # group. For example, you can create a port override in which the listener receives user traffic on
      # ports 80 and 443, but your accelerator routes that traffic to ports 1080 and 1443, respectively, on
      # the endpoints. For more information, see Overriding listener ports in the Global Accelerator
      # Developer Guide .

      struct PortOverride
        include JSON::Serializable

        # The endpoint port that you want a listener port to be mapped to. This is the port on the endpoint,
        # such as the Application Load Balancer or Amazon EC2 instance.

        @[JSON::Field(key: "EndpointPort")]
        getter endpoint_port : Int32?

        # The listener port that you want to map to a specific endpoint port. This is the port that user
        # traffic arrives to the Global Accelerator on.

        @[JSON::Field(key: "ListenerPort")]
        getter listener_port : Int32?

        def initialize(
          @endpoint_port : Int32? = nil,
          @listener_port : Int32? = nil
        )
        end
      end

      # A complex type for a range of ports for a listener.

      struct PortRange
        include JSON::Serializable

        # The first port in the range of ports, inclusive.

        @[JSON::Field(key: "FromPort")]
        getter from_port : Int32?

        # The last port in the range of ports, inclusive.

        @[JSON::Field(key: "ToPort")]
        getter to_port : Int32?

        def initialize(
          @from_port : Int32? = nil,
          @to_port : Int32? = nil
        )
        end
      end


      struct ProvisionByoipCidrRequest
        include JSON::Serializable

        # The public IPv4 address range, in CIDR notation. The most specific IP prefix that you can specify is
        # /24. The address range cannot overlap with another address range that you've brought to this Amazon
        # Web Services Region or another Region. For more information, see Bring your own IP addresses (BYOIP)
        # in the Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        # A signed document that proves that you are authorized to bring the specified IP address range to
        # Amazon using BYOIP.

        @[JSON::Field(key: "CidrAuthorizationContext")]
        getter cidr_authorization_context : Types::CidrAuthorizationContext

        def initialize(
          @cidr : String,
          @cidr_authorization_context : Types::CidrAuthorizationContext
        )
        end
      end


      struct ProvisionByoipCidrResponse
        include JSON::Serializable

        # Information about the address range.

        @[JSON::Field(key: "ByoipCidr")]
        getter byoip_cidr : Types::ByoipCidr?

        def initialize(
          @byoip_cidr : Types::ByoipCidr? = nil
        )
        end
      end


      struct RemoveCustomRoutingEndpointsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group to remove endpoints from.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        # The IDs for the endpoints. For custom routing accelerators, endpoint IDs are the virtual private
        # cloud (VPC) subnet IDs.

        @[JSON::Field(key: "EndpointIds")]
        getter endpoint_ids : Array(String)

        def initialize(
          @endpoint_group_arn : String,
          @endpoint_ids : Array(String)
        )
        end
      end


      struct RemoveEndpointsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        # The identifiers of the endpoints that you want to remove.

        @[JSON::Field(key: "EndpointIdentifiers")]
        getter endpoint_identifiers : Array(Types::EndpointIdentifier)

        def initialize(
          @endpoint_group_arn : String,
          @endpoint_identifiers : Array(Types::EndpointIdentifier)
        )
        end
      end

      # A resource is one of the following: the ARN for an Amazon Web Services resource that is supported by
      # Global Accelerator to be added as an endpoint, or a CIDR range that specifies a bring your own IP
      # (BYOIP) address pool.

      struct Resource
        include JSON::Serializable

        # An IP address range, in CIDR format, that is specified as resource. The address must be provisioned
        # and advertised in Global Accelerator by following the bring your own IP address (BYOIP) process for
        # Global Accelerator For more information, see Bring your own IP addresses (BYOIP) in the Global
        # Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String?

        # The endpoint ID for the endpoint that is specified as a Amazon Web Services resource. An endpoint ID
        # for the cross-account feature is the ARN of an Amazon Web Services resource, such as a Network Load
        # Balancer, that Global Accelerator supports as an endpoint for an accelerator.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The Amazon Web Services Region where a shared endpoint resource is located.

        @[JSON::Field(key: "Region")]
        getter region : String?

        def initialize(
          @cidr : String? = nil,
          @endpoint_id : String? = nil,
          @region : String? = nil
        )
        end
      end

      # An IP address/port combination.

      struct SocketAddress
        include JSON::Serializable

        # The IP address for the socket address.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The port for the socket address.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        def initialize(
          @ip_address : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # A complex type that contains a Tag key and Tag value.

      struct Tag
        include JSON::Serializable

        # A string that contains a Tag key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # A string that contains a Tag value.

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

        # The Amazon Resource Name (ARN) of the Global Accelerator resource to add tags to. An ARN uniquely
        # identifies a resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to add to a resource. A tag consists of a key and a value that you define.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # There's already a transaction in progress. Another transaction can't be processed.

      struct TransactionInProgressException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Global Accelerator resource to remove tags from. An ARN
        # uniquely identifies a resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag key pairs that you want to remove from the specified resources.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateAcceleratorAttributesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator that you want to update.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # Update whether flow logs are enabled. The default value is false. If the value is true,
        # FlowLogsS3Bucket and FlowLogsS3Prefix must be specified. For more information, see Flow Logs in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "FlowLogsEnabled")]
        getter flow_logs_enabled : Bool?

        # The name of the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true
        # . The bucket must exist and have a bucket policy that grants Global Accelerator permission to write
        # to the bucket.

        @[JSON::Field(key: "FlowLogsS3Bucket")]
        getter flow_logs_s3_bucket : String?

        # Update the prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is required
        # if FlowLogsEnabled is true . If you specify slash (/) for the S3 bucket prefix, the log file bucket
        # folder structure will include a double slash (//), like the following:
        # s3-bucket_name//AWSLogs/aws_account_id

        @[JSON::Field(key: "FlowLogsS3Prefix")]
        getter flow_logs_s3_prefix : String?

        def initialize(
          @accelerator_arn : String,
          @flow_logs_enabled : Bool? = nil,
          @flow_logs_s3_bucket : String? = nil,
          @flow_logs_s3_prefix : String? = nil
        )
        end
      end


      struct UpdateAcceleratorAttributesResponse
        include JSON::Serializable

        # Updated attributes for the accelerator.

        @[JSON::Field(key: "AcceleratorAttributes")]
        getter accelerator_attributes : Types::AcceleratorAttributes?

        def initialize(
          @accelerator_attributes : Types::AcceleratorAttributes? = nil
        )
        end
      end


      struct UpdateAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to update.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # Indicates whether an accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, the accelerator cannot be deleted. If set to false, the accelerator can
        # be deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The IP address type that an accelerator supports. For a standard accelerator, the value can be IPV4
        # or DUAL_STACK.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The IP addresses for an accelerator.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # The name of the accelerator. The name can have a maximum of 64 characters, must contain only
        # alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with a hyphen or
        # period.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @accelerator_arn : String,
          @enabled : Bool? = nil,
          @ip_address_type : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAcceleratorResponse
        include JSON::Serializable

        # Information about the updated accelerator.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::Accelerator?

        def initialize(
          @accelerator : Types::Accelerator? = nil
        )
        end
      end


      struct UpdateCrossAccountAttachmentRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cross-account attachment to update.

        @[JSON::Field(key: "AttachmentArn")]
        getter attachment_arn : String

        # The principals to add to the cross-account attachment. A principal is an account or the Amazon
        # Resource Name (ARN) of an accelerator that the attachment gives permission to work with resources
        # from another account. The resources are also listed in the attachment. To add more than one
        # principal, separate the account numbers or accelerator ARNs, or both, with commas.

        @[JSON::Field(key: "AddPrincipals")]
        getter add_principals : Array(String)?

        # The resources to add to the cross-account attachment. A resource listed in a cross-account
        # attachment can be used with an accelerator by the principals that are listed in the attachment. To
        # add more than one resource, separate the resource ARNs with commas.

        @[JSON::Field(key: "AddResources")]
        getter add_resources : Array(Types::Resource)?

        # The name of the cross-account attachment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The principals to remove from the cross-account attachment. A principal is an account or the Amazon
        # Resource Name (ARN) of an accelerator that the attachment gives permission to work with resources
        # from another account. The resources are also listed in the attachment. To remove more than one
        # principal, separate the account numbers or accelerator ARNs, or both, with commas.

        @[JSON::Field(key: "RemovePrincipals")]
        getter remove_principals : Array(String)?

        # The resources to remove from the cross-account attachment. A resource listed in a cross-account
        # attachment can be used with an accelerator by the principals that are listed in the attachment. To
        # remove more than one resource, separate the resource ARNs with commas.

        @[JSON::Field(key: "RemoveResources")]
        getter remove_resources : Array(Types::Resource)?

        def initialize(
          @attachment_arn : String,
          @add_principals : Array(String)? = nil,
          @add_resources : Array(Types::Resource)? = nil,
          @name : String? = nil,
          @remove_principals : Array(String)? = nil,
          @remove_resources : Array(Types::Resource)? = nil
        )
        end
      end


      struct UpdateCrossAccountAttachmentResponse
        include JSON::Serializable

        # Information about the updated cross-account attachment.

        @[JSON::Field(key: "CrossAccountAttachment")]
        getter cross_account_attachment : Types::Attachment?

        def initialize(
          @cross_account_attachment : Types::Attachment? = nil
        )
        end
      end


      struct UpdateCustomRoutingAcceleratorAttributesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom routing accelerator to update attributes for.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # Update whether flow logs are enabled. The default value is false. If the value is true,
        # FlowLogsS3Bucket and FlowLogsS3Prefix must be specified. For more information, see Flow logs in the
        # Global Accelerator Developer Guide .

        @[JSON::Field(key: "FlowLogsEnabled")]
        getter flow_logs_enabled : Bool?

        # The name of the Amazon S3 bucket for the flow logs. Attribute is required if FlowLogsEnabled is true
        # . The bucket must exist and have a bucket policy that grants Global Accelerator permission to write
        # to the bucket.

        @[JSON::Field(key: "FlowLogsS3Bucket")]
        getter flow_logs_s3_bucket : String?

        # Update the prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is required
        # if FlowLogsEnabled is true . If you don’t specify a prefix, the flow logs are stored in the root of
        # the bucket. If you specify slash (/) for the S3 bucket prefix, the log file bucket folder structure
        # will include a double slash (//), like the following: DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id

        @[JSON::Field(key: "FlowLogsS3Prefix")]
        getter flow_logs_s3_prefix : String?

        def initialize(
          @accelerator_arn : String,
          @flow_logs_enabled : Bool? = nil,
          @flow_logs_s3_bucket : String? = nil,
          @flow_logs_s3_prefix : String? = nil
        )
        end
      end


      struct UpdateCustomRoutingAcceleratorAttributesResponse
        include JSON::Serializable

        # Updated custom routing accelerator.

        @[JSON::Field(key: "AcceleratorAttributes")]
        getter accelerator_attributes : Types::CustomRoutingAcceleratorAttributes?

        def initialize(
          @accelerator_attributes : Types::CustomRoutingAcceleratorAttributes? = nil
        )
        end
      end


      struct UpdateCustomRoutingAcceleratorRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the accelerator to update.

        @[JSON::Field(key: "AcceleratorArn")]
        getter accelerator_arn : String

        # Indicates whether an accelerator is enabled. The value is true or false. The default value is true.
        # If the value is set to true, the accelerator cannot be deleted. If set to false, the accelerator can
        # be deleted.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The IP address type that an accelerator supports. For a custom routing accelerator, the value must
        # be IPV4.

        @[JSON::Field(key: "IpAddressType")]
        getter ip_address_type : String?

        # The IP addresses for an accelerator.

        @[JSON::Field(key: "IpAddresses")]
        getter ip_addresses : Array(String)?

        # The name of the accelerator. The name can have a maximum of 64 characters, must contain only
        # alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with a hyphen or
        # period.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @accelerator_arn : String,
          @enabled : Bool? = nil,
          @ip_address_type : String? = nil,
          @ip_addresses : Array(String)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateCustomRoutingAcceleratorResponse
        include JSON::Serializable

        # Information about the updated custom routing accelerator.

        @[JSON::Field(key: "Accelerator")]
        getter accelerator : Types::CustomRoutingAccelerator?

        def initialize(
          @accelerator : Types::CustomRoutingAccelerator? = nil
        )
        end
      end


      struct UpdateCustomRoutingListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to update.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # The updated port range to support for connections from clients to your accelerator. If you remove
        # ports that are currently being used by a subnet endpoint, the call fails. Separately, you set port
        # ranges for endpoints. For more information, see About endpoints for custom routing accelerators .

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)

        def initialize(
          @listener_arn : String,
          @port_ranges : Array(Types::PortRange)
        )
        end
      end


      struct UpdateCustomRoutingListenerResponse
        include JSON::Serializable

        # Information for the updated listener for a custom routing accelerator.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::CustomRoutingListener?

        def initialize(
          @listener : Types::CustomRoutingListener? = nil
        )
        end
      end


      struct UpdateEndpointGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint group.

        @[JSON::Field(key: "EndpointGroupArn")]
        getter endpoint_group_arn : String

        # The list of endpoint objects. A resource must be valid and active when you add it as an endpoint.

        @[JSON::Field(key: "EndpointConfigurations")]
        getter endpoint_configurations : Array(Types::EndpointConfiguration)?

        # The time—10 seconds or 30 seconds—between each health check for an endpoint. The default value is
        # 30.

        @[JSON::Field(key: "HealthCheckIntervalSeconds")]
        getter health_check_interval_seconds : Int32?

        # If the protocol is HTTP/S, then this specifies the path that is the destination for health check
        # targets. The default value is slash (/).

        @[JSON::Field(key: "HealthCheckPath")]
        getter health_check_path : String?

        # The port that Global Accelerator uses to check the health of endpoints that are part of this
        # endpoint group. The default port is the listener port that this endpoint group is associated with.
        # If the listener port is a list of ports, Global Accelerator uses the first port in the list.

        @[JSON::Field(key: "HealthCheckPort")]
        getter health_check_port : Int32?

        # The protocol that Global Accelerator uses to check the health of endpoints that are part of this
        # endpoint group. The default value is TCP.

        @[JSON::Field(key: "HealthCheckProtocol")]
        getter health_check_protocol : String?

        # Override specific listener ports used to route traffic to endpoints that are part of this endpoint
        # group. For example, you can create a port override in which the listener receives user traffic on
        # ports 80 and 443, but your accelerator routes that traffic to ports 1080 and 1443, respectively, on
        # the endpoints. For more information, see Overriding listener ports in the Global Accelerator
        # Developer Guide .

        @[JSON::Field(key: "PortOverrides")]
        getter port_overrides : Array(Types::PortOverride)?

        # The number of consecutive health checks required to set the state of a healthy endpoint to
        # unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.

        @[JSON::Field(key: "ThresholdCount")]
        getter threshold_count : Int32?

        # The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is
        # distributed to other endpoint groups for this listener. Use this action to increase (dial up) or
        # decrease (dial down) traffic to a specific Region. The percentage is applied to the traffic that
        # would otherwise have been routed to the Region based on optimal routing. The default value is 100.

        @[JSON::Field(key: "TrafficDialPercentage")]
        getter traffic_dial_percentage : Float64?

        def initialize(
          @endpoint_group_arn : String,
          @endpoint_configurations : Array(Types::EndpointConfiguration)? = nil,
          @health_check_interval_seconds : Int32? = nil,
          @health_check_path : String? = nil,
          @health_check_port : Int32? = nil,
          @health_check_protocol : String? = nil,
          @port_overrides : Array(Types::PortOverride)? = nil,
          @threshold_count : Int32? = nil,
          @traffic_dial_percentage : Float64? = nil
        )
        end
      end


      struct UpdateEndpointGroupResponse
        include JSON::Serializable

        # The information about the endpoint group that was updated.

        @[JSON::Field(key: "EndpointGroup")]
        getter endpoint_group : Types::EndpointGroup?

        def initialize(
          @endpoint_group : Types::EndpointGroup? = nil
        )
        end
      end


      struct UpdateListenerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the listener to update.

        @[JSON::Field(key: "ListenerArn")]
        getter listener_arn : String

        # Client affinity lets you direct all requests from a user to the same endpoint, if you have stateful
        # applications, regardless of the port and protocol of the client request. Client affinity gives you
        # control over whether to always route each client to the same specific endpoint. Global Accelerator
        # uses a consistent-flow hashing algorithm to choose the optimal endpoint for a connection. If client
        # affinity is NONE , Global Accelerator uses the "five-tuple" (5-tuple) properties—source IP address,
        # source port, destination IP address, destination port, and protocol—to select the hash value, and
        # then chooses the best endpoint. However, with this setting, if someone uses different ports to
        # connect to Global Accelerator, their connections might not be always routed to the same endpoint
        # because the hash value changes. If you want a given client to always be routed to the same endpoint,
        # set client affinity to SOURCE_IP instead. When you use the SOURCE_IP setting, Global Accelerator
        # uses the "two-tuple" (2-tuple) properties— source (client) IP address and destination IP address—to
        # select the hash value. The default value is NONE .

        @[JSON::Field(key: "ClientAffinity")]
        getter client_affinity : String?

        # The updated list of port ranges for the connections from clients to the accelerator.

        @[JSON::Field(key: "PortRanges")]
        getter port_ranges : Array(Types::PortRange)?

        # The updated protocol for the connections from clients to the accelerator.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @listener_arn : String,
          @client_affinity : String? = nil,
          @port_ranges : Array(Types::PortRange)? = nil,
          @protocol : String? = nil
        )
        end
      end


      struct UpdateListenerResponse
        include JSON::Serializable

        # Information for the updated listener.

        @[JSON::Field(key: "Listener")]
        getter listener : Types::Listener?

        def initialize(
          @listener : Types::Listener? = nil
        )
        end
      end


      struct WithdrawByoipCidrRequest
        include JSON::Serializable

        # The address range, in CIDR notation. For more information, see Bring your own IP addresses (BYOIP)
        # in the Global Accelerator Developer Guide.

        @[JSON::Field(key: "Cidr")]
        getter cidr : String

        def initialize(
          @cidr : String
        )
        end
      end


      struct WithdrawByoipCidrResponse
        include JSON::Serializable

        # Information about the BYOIP address pool.

        @[JSON::Field(key: "ByoipCidr")]
        getter byoip_cidr : Types::ByoipCidr?

        def initialize(
          @byoip_cidr : Types::ByoipCidr? = nil
        )
        end
      end
    end
  end
end
