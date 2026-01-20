require "json"
require "time"

module AwsSdk
  module NetworkMonitor
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This operation attempted to create a resource that already exists.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateMonitorInput
        include JSON::Serializable

        # The name identifying the monitor. It can contain only letters, underscores (_), or dashes (-), and
        # can be up to 200 characters.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The time, in seconds, that metrics are aggregated and sent to Amazon CloudWatch. Valid values are
        # either 30 or 60 . 60 is the default if no period is chosen.

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64?

        # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
        # client token was provided in the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Displays a list of all of the probes created for a monitor.

        @[JSON::Field(key: "probes")]
        getter probes : Array(Types::CreateMonitorProbeInput)?

        # The list of key-value pairs created and assigned to the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @monitor_name : String,
          @aggregation_period : Int64? = nil,
          @client_token : String? = nil,
          @probes : Array(Types::CreateMonitorProbeInput)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMonitorOutput
        include JSON::Serializable

        # The ARN of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The state of the monitor.

        @[JSON::Field(key: "state")]
        getter state : String

        # The number of seconds that metrics are aggregated by and sent to Amazon CloudWatch. This will be
        # either 30 or 60 .

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64?

        # The list of key-value pairs assigned to the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @monitor_arn : String,
          @monitor_name : String,
          @state : String,
          @aggregation_period : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a monitor probe.

      struct CreateMonitorProbeInput
        include JSON::Serializable

        # The destination IP address. This must be either IPV4 or IPV6 .

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The protocol used for the network traffic between the source and destination . This must be either
        # TCP or ICMP .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ARN of the subnet.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The port associated with the destination . This is required only if the protocol is TCP and must be
        # a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The size of the packets sent between the source and destination. This must be a number between 56
        # and 8500 .

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The list of key-value pairs created and assigned to the monitor.

        @[JSON::Field(key: "probeTags")]
        getter probe_tags : Hash(String, String)?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @destination_port : Int32? = nil,
          @packet_size : Int32? = nil,
          @probe_tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProbeInput
        include JSON::Serializable

        # The name of the monitor to associated with the probe.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # Describes the details of an individual probe for a monitor.

        @[JSON::Field(key: "probe")]
        getter probe : Types::ProbeInput

        # Unique, case-sensitive identifier to ensure the idempotency of the request. Only returned if a
        # client token was provided in the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The list of key-value pairs created and assigned to the probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @monitor_name : String,
          @probe : Types::ProbeInput,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProbeOutput
        include JSON::Serializable

        # The destination IP address for the monitor. This must be either an IPv4 or IPv6 address.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The protocol used for the network traffic between the source and destination . This must be either
        # TCP or ICMP .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ARN of the probe.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # Indicates whether the IP address is IPV4 or IPV6 .

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The time and date that the probe was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The port associated with the destination . This is required only if the protocol is TCP and must be
        # a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The time and date when the probe was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The size of the packets sent between the source and destination. This must be a number between 56
        # and 8500 .

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The ARN of the probe.

        @[JSON::Field(key: "probeArn")]
        getter probe_arn : String?

        # The ID of the probe for which details are returned.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String?

        # The state of the probe.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The list of key-value pairs assigned to the probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the source VPC or subnet.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @address_family : String? = nil,
          @created_at : Time? = nil,
          @destination_port : Int32? = nil,
          @modified_at : Time? = nil,
          @packet_size : Int32? = nil,
          @probe_arn : String? = nil,
          @probe_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct DeleteMonitorInput
        include JSON::Serializable

        # The name of the monitor to delete.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end


      struct DeleteMonitorOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteProbeInput
        include JSON::Serializable

        # The name of the monitor to delete.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The ID of the probe to delete.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String

        def initialize(
          @monitor_name : String,
          @probe_id : String
        )
        end
      end


      struct DeleteProbeOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct GetMonitorInput
        include JSON::Serializable

        # The name of the monitor that details are returned for.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        def initialize(
          @monitor_name : String
        )
        end
      end


      struct GetMonitorOutput
        include JSON::Serializable

        # The aggregation period for the specified monitor.

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64

        # The time and date when the monitor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The time and date when the monitor was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time

        # The ARN of the selected monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # Lists the status of the state of each monitor.

        @[JSON::Field(key: "state")]
        getter state : String

        # The details about each probe associated with that monitor.

        @[JSON::Field(key: "probes")]
        getter probes : Array(Types::Probe)?

        # The list of key-value pairs assigned to the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @aggregation_period : Int64,
          @created_at : Time,
          @modified_at : Time,
          @monitor_arn : String,
          @monitor_name : String,
          @state : String,
          @probes : Array(Types::Probe)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetProbeInput
        include JSON::Serializable

        # The name of the monitor associated with the probe. Run ListMonitors to get a list of monitor names.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The ID of the probe to get information about. Run GetMonitor action to get a list of probes and
        # probe IDs for the monitor.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String

        def initialize(
          @monitor_name : String,
          @probe_id : String
        )
        end
      end


      struct GetProbeOutput
        include JSON::Serializable

        # The destination IP address for the monitor. This must be either an IPv4 or IPv6 address.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The protocol used for the network traffic between the source and destination . This must be either
        # TCP or ICMP .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ARN of the probe.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # Indicates whether the IP address is IPV4 or IPV6 .

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The time and date that the probe was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The port associated with the destination . This is required only if the protocol is TCP and must be
        # a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The time and date that the probe was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The size of the packets sent between the source and destination. This must be a number between 56
        # and 8500 .

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The ARN of the probe.

        @[JSON::Field(key: "probeArn")]
        getter probe_arn : String?

        # The ID of the probe for which details are returned.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String?

        # The state of the probe.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The list of key-value pairs assigned to the probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the source VPC or subnet.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @address_family : String? = nil,
          @created_at : Time? = nil,
          @destination_port : Int32? = nil,
          @modified_at : Time? = nil,
          @packet_size : Int32? = nil,
          @probe_arn : String? = nil,
          @probe_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListMonitorsInput
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. If MaxResults is given a value larger than 100, only
        # 100 results are returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of all monitors and their states.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListMonitorsOutput
        include JSON::Serializable

        # Lists individual details about each of your monitors.

        @[JSON::Field(key: "monitors")]
        getter monitors : Array(Types::MonitorSummary)

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @monitors : Array(Types::MonitorSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # Lists the tags assigned to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Displays summary information about a monitor.

      struct MonitorSummary
        include JSON::Serializable

        # The ARN of the monitor.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The state of the monitor.

        @[JSON::Field(key: "state")]
        getter state : String

        # The time, in seconds, that metrics are collected and sent to Amazon CloudWatch. Valid values are
        # either 30 or 60 .

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64?

        # The list of key-value pairs assigned to the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @monitor_arn : String,
          @monitor_name : String,
          @state : String,
          @aggregation_period : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes information about a network monitor probe.

      struct Probe
        include JSON::Serializable

        # The destination for the probe. This should be either an IPV4 or IPV6 .

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The network protocol for the destination. This can be either TCP or ICMP . If the protocol is TCP ,
        # then port is also required.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ARN of the probe source subnet.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The IPv4 or IPv6 address for the probe.

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The time and date the probe was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The destination port for the probe. This is required only if the protocol is TCP and must be a
        # number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The time and date that the probe was last modified.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The size of the packets traveling between the source and destination . This must be a number between
        # 56 and

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The ARN of the probe.

        @[JSON::Field(key: "probeArn")]
        getter probe_arn : String?

        # The ID of the probe.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String?

        # The state of the probe.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The list of key-value pairs created and assigned to the probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The ID of the source VPC subnet.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @address_family : String? = nil,
          @created_at : Time? = nil,
          @destination_port : Int32? = nil,
          @modified_at : Time? = nil,
          @packet_size : Int32? = nil,
          @probe_arn : String? = nil,
          @probe_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Defines a probe when creating a probe or monitor.

      struct ProbeInput
        include JSON::Serializable

        # The destination IP address. This must be either IPV4 or IPV6 .

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The protocol used for the network traffic between the source and destination . This must be either
        # TCP or ICMP .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The ARN of the subnet.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The port associated with the destination . This is required only if the protocol is TCP and must be
        # a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The size of the packets sent between the source and destination. This must be a number between 56
        # and 8500 .

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The list of key-value pairs created and assigned to the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @destination_port : Int32? = nil,
          @packet_size : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This request exceeds a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The ARN of the monitor or probe to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs assigned to the monitor or probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request was denied due to request throttling

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The ARN of the monitor or probe that the tag should be removed from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key-value pa

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateMonitorInput
        include JSON::Serializable

        # The aggregation time, in seconds, to change to. This must be either 30 or 60 .

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64

        # The name of the monitor to update.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        def initialize(
          @aggregation_period : Int64,
          @monitor_name : String
        )
        end
      end


      struct UpdateMonitorOutput
        include JSON::Serializable

        # The ARN of the monitor that was updated.

        @[JSON::Field(key: "monitorArn")]
        getter monitor_arn : String

        # The name of the monitor that was updated.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The state of the updated monitor.

        @[JSON::Field(key: "state")]
        getter state : String

        # The changed aggregation period.

        @[JSON::Field(key: "aggregationPeriod")]
        getter aggregation_period : Int64?

        # The list of key-value pairs associated with the monitor.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @monitor_arn : String,
          @monitor_name : String,
          @state : String,
          @aggregation_period : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateProbeInput
        include JSON::Serializable

        # The name of the monitor that the probe was updated for.

        @[JSON::Field(key: "monitorName")]
        getter monitor_name : String

        # The ID of the probe to update.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String

        # The updated IP address for the probe destination. This must be either an IPv4 or IPv6 address.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The updated port for the probe destination. This is required only if the protocol is TCP and must be
        # a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # he updated packets size for network traffic between the source and destination. This must be a
        # number between 56 and 8500 .

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The updated network protocol for the destination. This can be either TCP or ICMP . If the protocol
        # is TCP , then port is also required.

        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The state of the probe update.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @monitor_name : String,
          @probe_id : String,
          @destination : String? = nil,
          @destination_port : Int32? = nil,
          @packet_size : Int32? = nil,
          @protocol : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateProbeOutput
        include JSON::Serializable

        # The updated destination IP address for the probe.

        @[JSON::Field(key: "destination")]
        getter destination : String

        # The updated protocol for the probe.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The updated ARN of the source subnet.

        @[JSON::Field(key: "sourceArn")]
        getter source_arn : String

        # The updated IP address family. This must be either IPV4 or IPV6 .

        @[JSON::Field(key: "addressFamily")]
        getter address_family : String?

        # The time and date that the probe was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The updated destination port. This must be a number between 1 and 65536 .

        @[JSON::Field(key: "destinationPort")]
        getter destination_port : Int32?

        # The time and date that the probe was last updated.

        @[JSON::Field(key: "modifiedAt")]
        getter modified_at : Time?

        # The updated packet size for the probe.

        @[JSON::Field(key: "packetSize")]
        getter packet_size : Int32?

        # The updated ARN of the probe.

        @[JSON::Field(key: "probeArn")]
        getter probe_arn : String?

        # The updated ID of the probe.

        @[JSON::Field(key: "probeId")]
        getter probe_id : String?

        # The state of the updated probe.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Update tags for a probe.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The updated ID of the source VPC subnet ID.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @destination : String,
          @protocol : String,
          @source_arn : String,
          @address_family : String? = nil,
          @created_at : Time? = nil,
          @destination_port : Int32? = nil,
          @modified_at : Time? = nil,
          @packet_size : Int32? = nil,
          @probe_arn : String? = nil,
          @probe_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # One of the parameters for the request is not valid.

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
