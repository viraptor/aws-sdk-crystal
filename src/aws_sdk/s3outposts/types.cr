require "json"
require "time"

module AwsSdk
  module S3Outposts
    module Types

      # Access was denied for this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was a conflict with this action, and it could not be completed.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateEndpointRequest
        include JSON::Serializable

        # The ID of the Outposts.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String

        # The ID of the security group to use with the endpoint.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String

        # The ID of the subnet in the selected VPC. The endpoint subnet must belong to the Outpost that has
        # Amazon S3 on Outposts provisioned.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String

        # The type of access for the network connectivity for the Amazon S3 on Outposts endpoint. To use the
        # Amazon Web Services VPC, choose Private . To use the endpoint with an on-premises network, choose
        # CustomerOwnedIp . If you choose CustomerOwnedIp , you must also provide the customer-owned IP
        # address pool (CoIP pool). Private is the default access type value.

        @[JSON::Field(key: "AccessType")]
        getter access_type : String?

        # The ID of the customer-owned IPv4 address pool (CoIP pool) for the endpoint. IP addresses are
        # allocated from this pool for the endpoint.

        @[JSON::Field(key: "CustomerOwnedIpv4Pool")]
        getter customer_owned_ipv4_pool : String?

        def initialize(
          @outpost_id : String,
          @security_group_id : String,
          @subnet_id : String,
          @access_type : String? = nil,
          @customer_owned_ipv4_pool : String? = nil
        )
        end
      end


      struct CreateEndpointResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        def initialize(
          @endpoint_arn : String? = nil
        )
        end
      end


      struct DeleteEndpointRequest
        include JSON::Serializable

        # The ID of the endpoint.

        @[JSON::Field(key: "endpointId")]
        getter endpoint_id : String

        # The ID of the Outposts.

        @[JSON::Field(key: "outpostId")]
        getter outpost_id : String

        def initialize(
          @endpoint_id : String,
          @outpost_id : String
        )
        end
      end

      # Amazon S3 on Outposts Access Points simplify managing data access at scale for shared datasets in S3
      # on Outposts. S3 on Outposts uses endpoints to connect to Outposts buckets so that you can perform
      # actions within your virtual private cloud (VPC). For more information, see Accessing S3 on Outposts
      # using VPC-only access points in the Amazon Simple Storage Service User Guide .

      struct Endpoint
        include JSON::Serializable

        # The type of connectivity used to access the Amazon S3 on Outposts endpoint.

        @[JSON::Field(key: "AccessType")]
        getter access_type : String?

        # The VPC CIDR committed by this endpoint.

        @[JSON::Field(key: "CidrBlock")]
        getter cidr_block : String?

        # The time the endpoint was created.

        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The ID of the customer-owned IPv4 address pool used for the endpoint.

        @[JSON::Field(key: "CustomerOwnedIpv4Pool")]
        getter customer_owned_ipv4_pool : String?

        # The Amazon Resource Name (ARN) of the endpoint.

        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The failure reason, if any, for a create or delete endpoint operation.

        @[JSON::Field(key: "FailedReason")]
        getter failed_reason : Types::FailedReason?

        # The network interface of the endpoint.

        @[JSON::Field(key: "NetworkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The ID of the Outposts.

        @[JSON::Field(key: "OutpostsId")]
        getter outposts_id : String?

        # The ID of the security group used for the endpoint.

        @[JSON::Field(key: "SecurityGroupId")]
        getter security_group_id : String?

        # The status of the endpoint.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the subnet used for the endpoint.

        @[JSON::Field(key: "SubnetId")]
        getter subnet_id : String?

        # The ID of the VPC used for the endpoint.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @access_type : String? = nil,
          @cidr_block : String? = nil,
          @creation_time : Time? = nil,
          @customer_owned_ipv4_pool : String? = nil,
          @endpoint_arn : String? = nil,
          @failed_reason : Types::FailedReason? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @outposts_id : String? = nil,
          @security_group_id : String? = nil,
          @status : String? = nil,
          @subnet_id : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The failure reason, if any, for a create or delete endpoint operation.

      struct FailedReason
        include JSON::Serializable

        # The failure code, if any, for a create or delete endpoint operation.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Additional error details describing the endpoint failure and recommended action.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # There was an exception with the internal server.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListEndpointsRequest
        include JSON::Serializable

        # The maximum number of endpoints that will be returned in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If a previous response from this operation included a NextToken value, provide that value here to
        # retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEndpointsResult
        include JSON::Serializable

        # The list of endpoints associated with the specified Outpost.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # If the number of endpoints associated with the specified Outpost exceeds MaxResults , you can
        # include this value in subsequent calls to this operation to retrieve more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutpostsWithS3Request
        include JSON::Serializable

        # The maximum number of Outposts to return. The limit is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When you can get additional results from the ListOutpostsWithS3 call, a NextToken parameter is
        # returned in the output. You can then pass in a subsequent command to the NextToken parameter to
        # continue listing additional Outposts.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutpostsWithS3Result
        include JSON::Serializable

        # Returns a token that you can use to call ListOutpostsWithS3 again and receive additional results, if
        # there are any.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the list of Outposts that have the following characteristics: outposts that have S3
        # provisioned outposts that are Active (not pending any provisioning nor decommissioned) outposts to
        # which the the calling Amazon Web Services account has access

        @[JSON::Field(key: "Outposts")]
        getter outposts : Array(Types::Outpost)?

        def initialize(
          @next_token : String? = nil,
          @outposts : Array(Types::Outpost)? = nil
        )
        end
      end


      struct ListSharedEndpointsRequest
        include JSON::Serializable

        # The ID of the Amazon Web Services Outpost.

        @[JSON::Field(key: "outpostId")]
        getter outpost_id : String

        # The maximum number of endpoints that will be returned in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If a previous response from this operation included a NextToken value, you can provide that value
        # here to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @outpost_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSharedEndpointsResult
        include JSON::Serializable

        # The list of endpoints associated with the specified Outpost that have been shared by Amazon Web
        # Services Resource Access Manager (RAM).

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # If the number of endpoints associated with the specified Outpost exceeds MaxResults , you can
        # include this value in subsequent calls to this operation to retrieve more results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The container for the network interface.

      struct NetworkInterface
        include JSON::Serializable

        # The ID for the network interface.

        @[JSON::Field(key: "NetworkInterfaceId")]
        getter network_interface_id : String?

        def initialize(
          @network_interface_id : String? = nil
        )
        end
      end

      # Contains the details for the Outpost object.

      struct Outpost
        include JSON::Serializable

        # The Amazon S3 capacity of the outpost in bytes.

        @[JSON::Field(key: "CapacityInBytes")]
        getter capacity_in_bytes : Int64?

        # Specifies the unique Amazon Resource Name (ARN) for the outpost.

        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # Specifies the unique identifier for the outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # Returns the Amazon Web Services account ID of the outpost owner. Useful for comparing owned versus
        # shared outposts.

        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # Specifies the unique S3 on Outposts ARN for use with Resource Access Manager (RAM).

        @[JSON::Field(key: "S3OutpostArn")]
        getter s3_outpost_arn : String?

        def initialize(
          @capacity_in_bytes : Int64? = nil,
          @outpost_arn : String? = nil,
          @outpost_id : String? = nil,
          @owner_id : String? = nil,
          @s3_outpost_arn : String? = nil
        )
        end
      end

      # The service link connection to your Outposts home Region is down. Check your connection and try
      # again.

      struct OutpostOfflineException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was an exception validating this data.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
