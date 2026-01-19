require "json"
require "time"

module AwsSdk
  module BackupGateway
    module Types

      # The operation cannot proceed because you have insufficient permissions.
      struct AccessDeniedException
        include JSON::Serializable

        # A description of why you have insufficient permissions.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      struct AssociateGatewayToServerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        # The Amazon Resource Name (ARN) of the server that hosts your virtual machines.
        @[JSON::Field(key: "ServerArn")]
        getter server_arn : String

        def initialize(
          @gateway_arn : String,
          @server_arn : String
        )
        end
      end

      struct AssociateGatewayToServerOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a gateway.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule consists of
      # one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines a period of time
      # on one or more days of the week, during which bandwidth rate limits are specified for uploading,
      # downloading, or both.
      struct BandwidthRateLimitInterval
        include JSON::Serializable

        # The days of the week component of the bandwidth rate limit interval, represented as ordinal numbers
        # from 0 to 6, where 0 represents Sunday and 6 represents Saturday.
        @[JSON::Field(key: "DaysOfWeek")]
        getter days_of_week : Array(Int32)

        # The hour of the day to end the bandwidth rate limit interval.
        @[JSON::Field(key: "EndHourOfDay")]
        getter end_hour_of_day : Int32

        # The minute of the hour to end the bandwidth rate limit interval. The bandwidth rate limit interval
        # ends at the end of the minute. To end an interval at the end of an hour, use the value 59 .
        @[JSON::Field(key: "EndMinuteOfHour")]
        getter end_minute_of_hour : Int32

        # The hour of the day to start the bandwidth rate limit interval.
        @[JSON::Field(key: "StartHourOfDay")]
        getter start_hour_of_day : Int32

        # The minute of the hour to start the bandwidth rate limit interval. The interval begins at the start
        # of that minute. To begin an interval exactly at the start of the hour, use the value 0 .
        @[JSON::Field(key: "StartMinuteOfHour")]
        getter start_minute_of_hour : Int32

        # The average upload rate limit component of the bandwidth rate limit interval, in bits per second.
        # This field does not appear in the response if the upload rate limit is not set. For Backup Gateway,
        # the minimum value is (Value) .
        @[JSON::Field(key: "AverageUploadRateLimitInBitsPerSec")]
        getter average_upload_rate_limit_in_bits_per_sec : Int64?

        def initialize(
          @days_of_week : Array(Int32),
          @end_hour_of_day : Int32,
          @end_minute_of_hour : Int32,
          @start_hour_of_day : Int32,
          @start_minute_of_hour : Int32,
          @average_upload_rate_limit_in_bits_per_sec : Int64? = nil
        )
        end
      end

      # The operation cannot proceed because it is not supported.
      struct ConflictException
        include JSON::Serializable

        # A description of why the operation is not supported.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      struct CreateGatewayInput
        include JSON::Serializable

        # The activation key of the created gateway.
        @[JSON::Field(key: "ActivationKey")]
        getter activation_key : String

        # The display name of the created gateway.
        @[JSON::Field(key: "GatewayDisplayName")]
        getter gateway_display_name : String

        # The type of created gateway.
        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String

        # A list of up to 50 tags to assign to the gateway. Each tag is a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @activation_key : String,
          @gateway_display_name : String,
          @gateway_type : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateGatewayOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you create.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct DeleteGatewayInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway to delete.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct DeleteGatewayOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you deleted.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct DeleteHypervisorInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor to delete.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        def initialize(
          @hypervisor_arn : String
        )
        end
      end

      struct DeleteHypervisorOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor you deleted.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        def initialize(
          @hypervisor_arn : String? = nil
        )
        end
      end

      struct DisassociateGatewayFromServerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway to disassociate.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct DisassociateGatewayFromServerOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you disassociated.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A gateway is an Backup Gateway appliance that runs on the customer's network to provide seamless
      # connectivity to backup storage in the Amazon Web Services Cloud.
      struct Gateway
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        # The display name of the gateway.
        @[JSON::Field(key: "GatewayDisplayName")]
        getter gateway_display_name : String?

        # The type of the gateway.
        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String?

        # The hypervisor ID of the gateway.
        @[JSON::Field(key: "HypervisorId")]
        getter hypervisor_id : String?

        # The last time Backup gateway communicated with the gateway, in Unix format and UTC time.
        @[JSON::Field(key: "LastSeenTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_seen_time : Time?

        def initialize(
          @gateway_arn : String? = nil,
          @gateway_display_name : String? = nil,
          @gateway_type : String? = nil,
          @hypervisor_id : String? = nil,
          @last_seen_time : Time? = nil
        )
        end
      end

      # The details of gateway.
      struct GatewayDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        # The display name of the gateway.
        @[JSON::Field(key: "GatewayDisplayName")]
        getter gateway_display_name : String?

        # The type of the gateway type.
        @[JSON::Field(key: "GatewayType")]
        getter gateway_type : String?

        # The hypervisor ID of the gateway.
        @[JSON::Field(key: "HypervisorId")]
        getter hypervisor_id : String?

        # Details showing the last time Backup gateway communicated with the cloud, in Unix format and UTC
        # time.
        @[JSON::Field(key: "LastSeenTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_seen_time : Time?

        # Returns your gateway's weekly maintenance start time including the day and time of the week. Note
        # that values are in terms of the gateway's time zone. Can be weekly or monthly.
        @[JSON::Field(key: "MaintenanceStartTime")]
        getter maintenance_start_time : Types::MaintenanceStartTime?

        # Details showing the next update availability time of the gateway.
        @[JSON::Field(key: "NextUpdateAvailabilityTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter next_update_availability_time : Time?

        # The DNS name for the virtual private cloud (VPC) endpoint the gateway uses to connect to the cloud
        # for backup gateway.
        @[JSON::Field(key: "VpcEndpoint")]
        getter vpc_endpoint : String?

        def initialize(
          @gateway_arn : String? = nil,
          @gateway_display_name : String? = nil,
          @gateway_type : String? = nil,
          @hypervisor_id : String? = nil,
          @last_seen_time : Time? = nil,
          @maintenance_start_time : Types::MaintenanceStartTime? = nil,
          @next_update_availability_time : Time? = nil,
          @vpc_endpoint : String? = nil
        )
        end
      end

      struct GetBandwidthRateLimitScheduleInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct GetBandwidthRateLimitScheduleOutput
        include JSON::Serializable

        # An array containing bandwidth rate limit schedule intervals for a gateway. When no bandwidth rate
        # limit intervals have been scheduled, the array is empty.
        @[JSON::Field(key: "BandwidthRateLimitIntervals")]
        getter bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)?

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)? = nil,
          @gateway_arn : String? = nil
        )
        end
      end

      struct GetGatewayInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct GetGatewayOutput
        include JSON::Serializable

        # By providing the ARN (Amazon Resource Name), this API returns the gateway.
        @[JSON::Field(key: "Gateway")]
        getter gateway : Types::GatewayDetails?

        def initialize(
          @gateway : Types::GatewayDetails? = nil
        )
        end
      end

      struct GetHypervisorInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        def initialize(
          @hypervisor_arn : String
        )
        end
      end

      struct GetHypervisorOutput
        include JSON::Serializable

        # Details about the requested hypervisor.
        @[JSON::Field(key: "Hypervisor")]
        getter hypervisor : Types::HypervisorDetails?

        def initialize(
          @hypervisor : Types::HypervisorDetails? = nil
        )
        end
      end

      struct GetHypervisorPropertyMappingsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        def initialize(
          @hypervisor_arn : String
        )
        end
      end

      struct GetHypervisorPropertyMappingsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String?

        # This is a display of the mappings of on-premises VMware tags to the Amazon Web Services tags.
        @[JSON::Field(key: "VmwareToAwsTagMappings")]
        getter vmware_to_aws_tag_mappings : Array(Types::VmwareToAwsTagMapping)?

        def initialize(
          @hypervisor_arn : String? = nil,
          @iam_role_arn : String? = nil,
          @vmware_to_aws_tag_mappings : Array(Types::VmwareToAwsTagMapping)? = nil
        )
        end
      end

      struct GetVirtualMachineInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the virtual machine.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetVirtualMachineOutput
        include JSON::Serializable

        # This object contains the basic attributes of VirtualMachine contained by the output of
        # GetVirtualMachine
        @[JSON::Field(key: "VirtualMachine")]
        getter virtual_machine : Types::VirtualMachineDetails?

        def initialize(
          @virtual_machine : Types::VirtualMachineDetails? = nil
        )
        end
      end

      # Represents the hypervisor's permissions to which the gateway will connect. A hypervisor is hardware,
      # software, or firmware that creates and manages virtual machines, and allocates resources to them.
      struct Hypervisor
        include JSON::Serializable

        # The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name
        # (FQDN).
        @[JSON::Field(key: "Host")]
        getter host : String?

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        # The Amazon Resource Name (ARN) of the Key Management Service used to encrypt the hypervisor.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The name of the hypervisor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the hypervisor.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @host : String? = nil,
          @hypervisor_arn : String? = nil,
          @kms_key_arn : String? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # These are the details of the specified hypervisor. A hypervisor is hardware, software, or firmware
      # that creates and manages virtual machines, and allocates resources to them.
      struct HypervisorDetails
        include JSON::Serializable

        # The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name
        # (FQDN).
        @[JSON::Field(key: "Host")]
        getter host : String?

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        # The Amazon Resource Name (ARN) of the KMS used to encrypt the hypervisor.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # This is the time when the most recent successful sync of metadata occurred.
        @[JSON::Field(key: "LastSuccessfulMetadataSyncTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_successful_metadata_sync_time : Time?

        # This is the most recent status for the indicated metadata sync.
        @[JSON::Field(key: "LatestMetadataSyncStatus")]
        getter latest_metadata_sync_status : String?

        # This is the most recent status for the indicated metadata sync.
        @[JSON::Field(key: "LatestMetadataSyncStatusMessage")]
        getter latest_metadata_sync_status_message : String?

        # The Amazon Resource Name (ARN) of the group of gateways within the requested log.
        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        # This is the name of the specified hypervisor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # This is the current state of the specified hypervisor. The possible states are PENDING , ONLINE ,
        # OFFLINE , or ERROR .
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @host : String? = nil,
          @hypervisor_arn : String? = nil,
          @kms_key_arn : String? = nil,
          @last_successful_metadata_sync_time : Time? = nil,
          @latest_metadata_sync_status : String? = nil,
          @latest_metadata_sync_status_message : String? = nil,
          @log_group_arn : String? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ImportHypervisorConfigurationInput
        include JSON::Serializable

        # The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name
        # (FQDN).
        @[JSON::Field(key: "Host")]
        getter host : String

        # The name of the hypervisor.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Key Management Service for the hypervisor.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The password for the hypervisor.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The tags of the hypervisor configuration to import.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The username for the hypervisor.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @host : String,
          @name : String,
          @kms_key_arn : String? = nil,
          @password : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @username : String? = nil
        )
        end
      end

      struct ImportHypervisorConfigurationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor you disassociated.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        def initialize(
          @hypervisor_arn : String? = nil
        )
        end
      end

      # The operation did not succeed because an internal error occurred. Try again later.
      struct InternalServerException
        include JSON::Serializable

        # A description of which internal error occured.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct ListGatewaysInput
        include JSON::Serializable

        # The maximum number of gateways to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return MaxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGatewaysOutput
        include JSON::Serializable

        # A list of your gateways.
        @[JSON::Field(key: "Gateways")]
        getter gateways : Array(Types::Gateway)?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return maxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @gateways : Array(Types::Gateway)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHypervisorsInput
        include JSON::Serializable

        # The maximum number of hypervisors to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return maxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListHypervisorsOutput
        include JSON::Serializable

        # A list of your Hypervisor objects, ordered by their Amazon Resource Names (ARNs).
        @[JSON::Field(key: "Hypervisors")]
        getter hypervisors : Array(Types::Hypervisor)?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return maxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hypervisors : Array(Types::Hypervisor)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource's tags to list.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource's tags that you listed.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A list of the resource's tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListVirtualMachinesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor connected to your virtual machine.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        # The maximum number of virtual machines to list.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return maxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hypervisor_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListVirtualMachinesOutput
        include JSON::Serializable

        # The next item following a partial list of returned resources. For example, if a request is made to
        # return maxResults number of resources, NextToken allows you to return more items in your list
        # starting at the location pointed to by the next token.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of your VirtualMachine objects, ordered by their Amazon Resource Names (ARNs).
        @[JSON::Field(key: "VirtualMachines")]
        getter virtual_machines : Array(Types::VirtualMachine)?

        def initialize(
          @next_token : String? = nil,
          @virtual_machines : Array(Types::VirtualMachine)? = nil
        )
        end
      end

      # This is your gateway's weekly maintenance start time including the day and time of the week. Note
      # that values are in terms of the gateway's time zone. Can be weekly or monthly.
      struct MaintenanceStartTime
        include JSON::Serializable

        # The hour component of the maintenance start time represented as hh , where hh is the hour (0 to 23).
        # The hour of the day is in the time zone of the gateway.
        @[JSON::Field(key: "HourOfDay")]
        getter hour_of_day : Int32

        # The minute component of the maintenance start time represented as mm , where mm is the minute (0 to
        # 59). The minute of the hour is in the time zone of the gateway.
        @[JSON::Field(key: "MinuteOfHour")]
        getter minute_of_hour : Int32

        # The day of the month component of the maintenance start time represented as an ordinal number from 1
        # to 28, where 1 represents the first day of the month and 28 represents the last day of the month.
        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32?

        # An ordinal number between 0 and 6 that represents the day of the week, where 0 represents Sunday and
        # 6 represents Saturday. The day of week is in the time zone of the gateway.
        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : Int32?

        def initialize(
          @hour_of_day : Int32,
          @minute_of_hour : Int32,
          @day_of_month : Int32? = nil,
          @day_of_week : Int32? = nil
        )
        end
      end

      struct PutBandwidthRateLimitScheduleInput
        include JSON::Serializable

        # An array containing bandwidth rate limit schedule intervals for a gateway. When no bandwidth rate
        # limit intervals have been scheduled, the array is empty.
        @[JSON::Field(key: "BandwidthRateLimitIntervals")]
        getter bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval)

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @bandwidth_rate_limit_intervals : Array(Types::BandwidthRateLimitInterval),
          @gateway_arn : String
        )
        end
      end

      struct PutBandwidthRateLimitScheduleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway. Use the ListGateways operation to return a list of
        # gateways for your account and Amazon Web Services Region.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct PutHypervisorPropertyMappingsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        # The Amazon Resource Name (ARN) of the IAM role.
        @[JSON::Field(key: "IamRoleArn")]
        getter iam_role_arn : String

        # This action requests the mappings of on-premises VMware tags to the Amazon Web Services tags.
        @[JSON::Field(key: "VmwareToAwsTagMappings")]
        getter vmware_to_aws_tag_mappings : Array(Types::VmwareToAwsTagMapping)

        def initialize(
          @hypervisor_arn : String,
          @iam_role_arn : String,
          @vmware_to_aws_tag_mappings : Array(Types::VmwareToAwsTagMapping)
        )
        end
      end

      struct PutHypervisorPropertyMappingsOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        def initialize(
          @hypervisor_arn : String? = nil
        )
        end
      end

      struct PutMaintenanceStartTimeInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the gateway, used to specify its maintenance start time.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        # The hour of the day to start maintenance on a gateway.
        @[JSON::Field(key: "HourOfDay")]
        getter hour_of_day : Int32

        # The minute of the hour to start maintenance on a gateway.
        @[JSON::Field(key: "MinuteOfHour")]
        getter minute_of_hour : Int32

        # The day of the month start maintenance on a gateway. Valid values range from Sunday to Saturday .
        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32?

        # The day of the week to start maintenance on a gateway.
        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : Int32?

        def initialize(
          @gateway_arn : String,
          @hour_of_day : Int32,
          @minute_of_hour : Int32,
          @day_of_month : Int32? = nil,
          @day_of_week : Int32? = nil
        )
        end
      end

      struct PutMaintenanceStartTimeOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a gateway for which you set the maintenance start time.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      # A resource that is required for the action wasn't found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # A description of which resource wasn't found.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct StartVirtualMachinesMetadataSyncInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        def initialize(
          @hypervisor_arn : String
        )
        end
      end

      struct StartVirtualMachinesMetadataSyncOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        def initialize(
          @hypervisor_arn : String? = nil
        )
        end
      end

      # A key-value pair you can use to manage, filter, and search for your resources. Allowed characters
      # include UTF-8 letters, numbers, spaces, and the following characters: + - = . _ : /.
      struct Tag
        include JSON::Serializable

        # The key part of a tag's key-value pair. The key can't start with aws: .
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value part of a tag's key-value pair.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to tag.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags to assign to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you tagged.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      struct TestHypervisorConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway to the hypervisor to test.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        # The server host of the hypervisor. This can be either an IP address or a fully-qualified domain name
        # (FQDN).
        @[JSON::Field(key: "Host")]
        getter host : String

        # The password for the hypervisor.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The username for the hypervisor.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @gateway_arn : String,
          @host : String,
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      struct TestHypervisorConfigurationOutput
        include JSON::Serializable

        def initialize
        end
      end

      # TPS has been limited to protect against intentional or unintentional high request volumes.
      struct ThrottlingException
        include JSON::Serializable

        # Error: TPS has been limited to protect against intentional or unintentional high request volumes.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String,
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which to remove tags.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The list of tag keys specifying which tags to remove.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which you removed tags.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        def initialize(
          @resource_arn : String? = nil
        )
        end
      end

      struct UpdateGatewayInformationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway to update.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        # The updated display name of the gateway.
        @[JSON::Field(key: "GatewayDisplayName")]
        getter gateway_display_name : String?

        def initialize(
          @gateway_arn : String,
          @gateway_display_name : String? = nil
        )
        end
      end

      struct UpdateGatewayInformationOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you updated.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct UpdateGatewaySoftwareNowInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway to be updated.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String

        def initialize(
          @gateway_arn : String
        )
        end
      end

      struct UpdateGatewaySoftwareNowOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the gateway you updated.
        @[JSON::Field(key: "GatewayArn")]
        getter gateway_arn : String?

        def initialize(
          @gateway_arn : String? = nil
        )
        end
      end

      struct UpdateHypervisorInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor to update.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String

        # The updated host of the hypervisor. This can be either an IP address or a fully-qualified domain
        # name (FQDN).
        @[JSON::Field(key: "Host")]
        getter host : String?

        # The Amazon Resource Name (ARN) of the group of gateways within the requested log.
        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        # The updated name for the hypervisor
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The updated password for the hypervisor.
        @[JSON::Field(key: "Password")]
        getter password : String?

        # The updated username for the hypervisor.
        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @hypervisor_arn : String,
          @host : String? = nil,
          @log_group_arn : String? = nil,
          @name : String? = nil,
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      struct UpdateHypervisorOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the hypervisor you updated.
        @[JSON::Field(key: "HypervisorArn")]
        getter hypervisor_arn : String?

        def initialize(
          @hypervisor_arn : String? = nil
        )
        end
      end

      # The operation did not succeed because a validation error occurred.
      struct ValidationException
        include JSON::Serializable

        # A description of what caused the validation error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # A virtual machine that is on a hypervisor.
      struct VirtualMachine
        include JSON::Serializable

        # The host name of the virtual machine.
        @[JSON::Field(key: "HostName")]
        getter host_name : String?

        # The ID of the virtual machine's hypervisor.
        @[JSON::Field(key: "HypervisorId")]
        getter hypervisor_id : String?

        # The most recent date a virtual machine was backed up, in Unix format and UTC time.
        @[JSON::Field(key: "LastBackupDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_backup_date : Time?

        # The name of the virtual machine.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The path of the virtual machine.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The Amazon Resource Name (ARN) of the virtual machine. For example,
        # arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        def initialize(
          @host_name : String? = nil,
          @hypervisor_id : String? = nil,
          @last_backup_date : Time? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @resource_arn : String? = nil
        )
        end
      end

      # Your VirtualMachine objects, ordered by their Amazon Resource Names (ARNs).
      struct VirtualMachineDetails
        include JSON::Serializable

        # The host name of the virtual machine.
        @[JSON::Field(key: "HostName")]
        getter host_name : String?

        # The ID of the virtual machine's hypervisor.
        @[JSON::Field(key: "HypervisorId")]
        getter hypervisor_id : String?

        # The most recent date a virtual machine was backed up, in Unix format and UTC time.
        @[JSON::Field(key: "LastBackupDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_backup_date : Time?

        # The name of the virtual machine.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The path of the virtual machine.
        @[JSON::Field(key: "Path")]
        getter path : String?

        # The Amazon Resource Name (ARN) of the virtual machine. For example,
        # arn:aws:backup-gateway:us-west-1:0000000000000:vm/vm-0000ABCDEFGIJKL .
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # These are the details of the VMware tags associated with the specified virtual machine.
        @[JSON::Field(key: "VmwareTags")]
        getter vmware_tags : Array(Types::VmwareTag)?

        def initialize(
          @host_name : String? = nil,
          @hypervisor_id : String? = nil,
          @last_backup_date : Time? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @resource_arn : String? = nil,
          @vmware_tags : Array(Types::VmwareTag)? = nil
        )
        end
      end

      # A VMware tag is a tag attached to a specific virtual machine. A tag is a key-value pair you can use
      # to manage, filter, and search for your resources. The content of VMware tags can be matched to
      # Amazon Web Services tags.
      struct VmwareTag
        include JSON::Serializable

        # The is the category of VMware.
        @[JSON::Field(key: "VmwareCategory")]
        getter vmware_category : String?

        # This is a user-defined description of a VMware tag.
        @[JSON::Field(key: "VmwareTagDescription")]
        getter vmware_tag_description : String?

        # This is the user-defined name of a VMware tag.
        @[JSON::Field(key: "VmwareTagName")]
        getter vmware_tag_name : String?

        def initialize(
          @vmware_category : String? = nil,
          @vmware_tag_description : String? = nil,
          @vmware_tag_name : String? = nil
        )
        end
      end

      # This displays the mapping of on-premises VMware tags to the corresponding Amazon Web Services tags.
      struct VmwareToAwsTagMapping
        include JSON::Serializable

        # The key part of the Amazon Web Services tag's key-value pair.
        @[JSON::Field(key: "AwsTagKey")]
        getter aws_tag_key : String

        # The value part of the Amazon Web Services tag's key-value pair.
        @[JSON::Field(key: "AwsTagValue")]
        getter aws_tag_value : String

        # The is the category of VMware.
        @[JSON::Field(key: "VmwareCategory")]
        getter vmware_category : String

        # This is the user-defined name of a VMware tag.
        @[JSON::Field(key: "VmwareTagName")]
        getter vmware_tag_name : String

        def initialize(
          @aws_tag_key : String,
          @aws_tag_value : String,
          @vmware_category : String,
          @vmware_tag_name : String
        )
        end
      end
    end
  end
end
