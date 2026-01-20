require "json"
require "time"

module Aws
  module Outposts
    module Types

      # You do not have permission to perform this operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about an address.

      struct Address
        include JSON::Serializable

        # The first line of the address.

        @[JSON::Field(key: "AddressLine1")]
        getter address_line1 : String

        # The city for the address.

        @[JSON::Field(key: "City")]
        getter city : String

        # The name of the contact.

        @[JSON::Field(key: "ContactName")]
        getter contact_name : String

        # The phone number of the contact.

        @[JSON::Field(key: "ContactPhoneNumber")]
        getter contact_phone_number : String

        # The ISO-3166 two-letter country code for the address.

        @[JSON::Field(key: "CountryCode")]
        getter country_code : String

        # The postal code for the address.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String

        # The state for the address.

        @[JSON::Field(key: "StateOrRegion")]
        getter state_or_region : String

        # The second line of the address.

        @[JSON::Field(key: "AddressLine2")]
        getter address_line2 : String?

        # The third line of the address.

        @[JSON::Field(key: "AddressLine3")]
        getter address_line3 : String?

        # The district or county for the address.

        @[JSON::Field(key: "DistrictOrCounty")]
        getter district_or_county : String?

        # The municipality for the address.

        @[JSON::Field(key: "Municipality")]
        getter municipality : String?

        def initialize(
          @address_line1 : String,
          @city : String,
          @contact_name : String,
          @contact_phone_number : String,
          @country_code : String,
          @postal_code : String,
          @state_or_region : String,
          @address_line2 : String? = nil,
          @address_line3 : String? = nil,
          @district_or_county : String? = nil,
          @municipality : String? = nil
        )
        end
      end

      # Information about hardware assets.

      struct AssetInfo
        include JSON::Serializable

        # The ID of the asset. An Outpost asset can be a single server within an Outposts rack or an Outposts
        # server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # The position of an asset in a rack.

        @[JSON::Field(key: "AssetLocation")]
        getter asset_location : Types::AssetLocation?

        # The type of the asset.

        @[JSON::Field(key: "AssetType")]
        getter asset_type : String?

        # Information about compute hardware assets.

        @[JSON::Field(key: "ComputeAttributes")]
        getter compute_attributes : Types::ComputeAttributes?

        # The rack ID of the asset.

        @[JSON::Field(key: "RackId")]
        getter rack_id : String?

        def initialize(
          @asset_id : String? = nil,
          @asset_location : Types::AssetLocation? = nil,
          @asset_type : String? = nil,
          @compute_attributes : Types::ComputeAttributes? = nil,
          @rack_id : String? = nil
        )
        end
      end

      # An Amazon EC2 instance.

      struct AssetInstance
        include JSON::Serializable


        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The ID of the asset. An Outpost asset can be a single server within an Outposts rack or an Outposts
        # server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # The Amazon Web Services service name of the instance.

        @[JSON::Field(key: "AwsServiceName")]
        getter aws_service_name : String?

        # The ID of the instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The type of instance.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        def initialize(
          @account_id : String? = nil,
          @asset_id : String? = nil,
          @aws_service_name : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil
        )
        end
      end

      # The capacity for each instance type.

      struct AssetInstanceTypeCapacity
        include JSON::Serializable

        # The number of each instance type.

        @[JSON::Field(key: "Count")]
        getter count : Int32

        # The type of instance.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        def initialize(
          @count : Int32,
          @instance_type : String
        )
        end
      end

      # Information about the position of the asset in a rack.

      struct AssetLocation
        include JSON::Serializable

        # The position of an asset in a rack measured in rack units.

        @[JSON::Field(key: "RackElevation")]
        getter rack_elevation : Float64?

        def initialize(
          @rack_elevation : Float64? = nil
        )
        end
      end

      # A running Amazon EC2 instance that can be stopped to free up capacity needed to run the capacity
      # task.

      struct BlockingInstance
        include JSON::Serializable


        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon Web Services service name that owns the specified blocking instance.

        @[JSON::Field(key: "AwsServiceName")]
        getter aws_service_name : String?

        # The ID of the blocking instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        def initialize(
          @account_id : String? = nil,
          @aws_service_name : String? = nil,
          @instance_id : String? = nil
        )
        end
      end


      struct CancelCapacityTaskInput
        include JSON::Serializable

        # ID of the capacity task that you want to cancel.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String

        # ID or ARN of the Outpost associated with the capacity task that you want to cancel.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        def initialize(
          @capacity_task_id : String,
          @outpost_identifier : String
        )
        end
      end


      struct CancelCapacityTaskOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct CancelOrderInput
        include JSON::Serializable

        # The ID of the order.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String

        def initialize(
          @order_id : String
        )
        end
      end


      struct CancelOrderOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The capacity tasks that failed.

      struct CapacityTaskFailure
        include JSON::Serializable

        # The reason that the specified capacity task failed.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # The type of failure.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @reason : String,
          @type : String? = nil
        )
        end
      end

      # The summary of the capacity task.

      struct CapacityTaskSummary
        include JSON::Serializable

        # The ID of the asset. An Outpost asset can be a single server within an Outposts rack or an Outposts
        # server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # The ID of the specified capacity task.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String?

        # The status of the capacity task.

        @[JSON::Field(key: "CapacityTaskStatus")]
        getter capacity_task_status : String?

        # The date that the specified capacity task successfully ran.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # The date that the specified capacity task was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The date that the specified capacity was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # The ID of the Amazon Web Services Outposts order of the host associated with the capacity task.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # The ID of the Outpost associated with the specified capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        def initialize(
          @asset_id : String? = nil,
          @capacity_task_id : String? = nil,
          @capacity_task_status : String? = nil,
          @completion_date : Time? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @order_id : String? = nil,
          @outpost_id : String? = nil
        )
        end
      end

      # Information about a catalog item.

      struct CatalogItem
        include JSON::Serializable

        # The ID of the catalog item.

        @[JSON::Field(key: "CatalogItemId")]
        getter catalog_item_id : String?

        # Information about the EC2 capacity of an item.

        @[JSON::Field(key: "EC2Capacities")]
        getter ec2_capacities : Array(Types::EC2Capacity)?

        # The status of a catalog item.

        @[JSON::Field(key: "ItemStatus")]
        getter item_status : String?

        # Information about the power draw of an item.

        @[JSON::Field(key: "PowerKva")]
        getter power_kva : Float64?

        # The supported storage options for the catalog item.

        @[JSON::Field(key: "SupportedStorage")]
        getter supported_storage : Array(String)?

        # The uplink speed this catalog item requires for the connection to the Region.

        @[JSON::Field(key: "SupportedUplinkGbps")]
        getter supported_uplink_gbps : Array(Int32)?

        # The weight of the item in pounds.

        @[JSON::Field(key: "WeightLbs")]
        getter weight_lbs : Int32?

        def initialize(
          @catalog_item_id : String? = nil,
          @ec2_capacities : Array(Types::EC2Capacity)? = nil,
          @item_status : String? = nil,
          @power_kva : Float64? = nil,
          @supported_storage : Array(String)? = nil,
          @supported_uplink_gbps : Array(Int32)? = nil,
          @weight_lbs : Int32? = nil
        )
        end
      end

      # Information about compute hardware assets.

      struct ComputeAttributes
        include JSON::Serializable

        # The host ID of the Dedicated Host on the asset.

        @[JSON::Field(key: "HostId")]
        getter host_id : String?

        # A list of the names of instance families that are currently associated with a given asset.

        @[JSON::Field(key: "InstanceFamilies")]
        getter instance_families : Array(String)?

        # The instance type capacities configured for this asset. This can be changed through a capacity task.

        @[JSON::Field(key: "InstanceTypeCapacities")]
        getter instance_type_capacities : Array(Types::AssetInstanceTypeCapacity)?

        # The maximum number of vCPUs possible for the specified asset.

        @[JSON::Field(key: "MaxVcpus")]
        getter max_vcpus : Int32?

        # The state. ACTIVE - The asset is available and can provide capacity for new compute resources.
        # ISOLATED - The asset is undergoing maintenance and can't provide capacity for new compute resources.
        # Existing compute resources on the asset are not affected. RETIRING - The underlying hardware for the
        # asset is degraded. Capacity for new compute resources is reduced. Amazon Web Services sends
        # notifications for resources that must be stopped before the asset can be replaced.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @host_id : String? = nil,
          @instance_families : Array(String)? = nil,
          @instance_type_capacities : Array(Types::AssetInstanceTypeCapacity)? = nil,
          @max_vcpus : Int32? = nil,
          @state : String? = nil
        )
        end
      end

      # Updating or deleting this resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the resource causing the conflict.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of the resource causing the conflict.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Information about a connection.

      struct ConnectionDetails
        include JSON::Serializable

        # The allowed IP addresses.

        @[JSON::Field(key: "AllowedIps")]
        getter allowed_ips : Array(String)?

        # The public key of the client.

        @[JSON::Field(key: "ClientPublicKey")]
        getter client_public_key : String?

        # The client tunnel address.

        @[JSON::Field(key: "ClientTunnelAddress")]
        getter client_tunnel_address : String?

        # The endpoint for the server.

        @[JSON::Field(key: "ServerEndpoint")]
        getter server_endpoint : String?

        # The public key of the server.

        @[JSON::Field(key: "ServerPublicKey")]
        getter server_public_key : String?

        # The server tunnel address.

        @[JSON::Field(key: "ServerTunnelAddress")]
        getter server_tunnel_address : String?

        def initialize(
          @allowed_ips : Array(String)? = nil,
          @client_public_key : String? = nil,
          @client_tunnel_address : String? = nil,
          @server_endpoint : String? = nil,
          @server_public_key : String? = nil,
          @server_tunnel_address : String? = nil
        )
        end
      end


      struct CreateOrderInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the Outpost.

        @[JSON::Field(key: "OutpostIdentifier")]
        getter outpost_identifier : String

        # The payment option.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String

        # The line items that make up the order.

        @[JSON::Field(key: "LineItems")]
        getter line_items : Array(Types::LineItemRequest)?

        # The payment terms.

        @[JSON::Field(key: "PaymentTerm")]
        getter payment_term : String?

        def initialize(
          @outpost_identifier : String,
          @payment_option : String,
          @line_items : Array(Types::LineItemRequest)? = nil,
          @payment_term : String? = nil
        )
        end
      end


      struct CreateOrderOutput
        include JSON::Serializable

        # Information about this order.

        @[JSON::Field(key: "Order")]
        getter order : Types::Order?

        def initialize(
          @order : Types::Order? = nil
        )
        end
      end


      struct CreateOutpostInput
        include JSON::Serializable


        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String


        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?


        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?


        @[JSON::Field(key: "Description")]
        getter description : String?

        # The type of hardware for this Outpost.

        @[JSON::Field(key: "SupportedHardwareType")]
        getter supported_hardware_type : String?

        # The tags to apply to the Outpost.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @site_id : String,
          @availability_zone : String? = nil,
          @availability_zone_id : String? = nil,
          @description : String? = nil,
          @supported_hardware_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateOutpostOutput
        include JSON::Serializable


        @[JSON::Field(key: "Outpost")]
        getter outpost : Types::Outpost?

        def initialize(
          @outpost : Types::Outpost? = nil
        )
        end
      end


      struct CreateSiteInput
        include JSON::Serializable


        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Description")]
        getter description : String?

        # Additional information that you provide about site access requirements, electrician scheduling,
        # personal protective equipment, or regulation of equipment materials that could affect your
        # installation process.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # The location to install and power on the hardware. This address might be different from the shipping
        # address.

        @[JSON::Field(key: "OperatingAddress")]
        getter operating_address : Types::Address?

        # Information about the physical and logistical details for the rack at this site. For more
        # information about hardware requirements for racks, see Network readiness checklist in the Amazon Web
        # Services Outposts User Guide.

        @[JSON::Field(key: "RackPhysicalProperties")]
        getter rack_physical_properties : Types::RackPhysicalProperties?

        # The location to ship the hardware. This address might be different from the operating address.

        @[JSON::Field(key: "ShippingAddress")]
        getter shipping_address : Types::Address?

        # The tags to apply to a site.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @notes : String? = nil,
          @operating_address : Types::Address? = nil,
          @rack_physical_properties : Types::RackPhysicalProperties? = nil,
          @shipping_address : Types::Address? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSiteOutput
        include JSON::Serializable


        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end


      struct DeleteOutpostInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String

        def initialize(
          @outpost_id : String
        )
        end
      end


      struct DeleteOutpostOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSiteInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        def initialize(
          @site_id : String
        )
        end
      end


      struct DeleteSiteOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Information about EC2 capacity.

      struct EC2Capacity
        include JSON::Serializable

        # The family of the EC2 capacity.

        @[JSON::Field(key: "Family")]
        getter family : String?

        # The maximum size of the EC2 capacity.

        @[JSON::Field(key: "MaxSize")]
        getter max_size : String?

        # The quantity of the EC2 capacity.

        @[JSON::Field(key: "Quantity")]
        getter quantity : String?

        def initialize(
          @family : String? = nil,
          @max_size : String? = nil,
          @quantity : String? = nil
        )
        end
      end


      struct GetCapacityTaskInput
        include JSON::Serializable

        # ID of the capacity task.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String

        # ID or ARN of the Outpost associated with the specified capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        def initialize(
          @capacity_task_id : String,
          @outpost_identifier : String
        )
        end
      end


      struct GetCapacityTaskOutput
        include JSON::Serializable

        # The ID of the Outpost asset. An Outpost asset can be a single server within an Outposts rack or an
        # Outposts server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # ID of the capacity task.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String?

        # Status of the capacity task. A capacity task can have one of the following statuses: REQUESTED - The
        # capacity task was created and is awaiting the next step by Amazon Web Services Outposts. IN_PROGRESS
        # - The capacity task is running and cannot be cancelled. FAILED - The capacity task could not be
        # completed. COMPLETED - The capacity task has completed successfully. WAITING_FOR_EVACUATION - The
        # capacity task requires capacity to run. You must stop the recommended EC2 running instances to free
        # up capacity for the task to run. CANCELLATION_IN_PROGRESS - The capacity task has been cancelled and
        # is in the process of cleaning up resources. CANCELLED - The capacity task is cancelled.

        @[JSON::Field(key: "CapacityTaskStatus")]
        getter capacity_task_status : String?

        # The date the capacity task ran successfully.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # The date the capacity task was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Performs a dry run to determine if you are above or below instance capacity.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # Reason why the capacity task failed.

        @[JSON::Field(key: "Failed")]
        getter failed : Types::CapacityTaskFailure?

        # Instances that the user specified they cannot stop in order to free up the capacity needed to run
        # the capacity task.

        @[JSON::Field(key: "InstancesToExclude")]
        getter instances_to_exclude : Types::InstancesToExclude?

        # The date the capacity task was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # ID of the Amazon Web Services Outposts order associated with the specified capacity task.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # ID of the Outpost associated with the specified capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # List of instance pools requested in the capacity task.

        @[JSON::Field(key: "RequestedInstancePools")]
        getter requested_instance_pools : Array(Types::InstanceTypeCapacity)?

        # User-specified option in case an instance is blocking the capacity task from running. Shows one of
        # the following options: WAIT_FOR_EVACUATION - Checks every 10 minutes over 48 hours to determine if
        # instances have stopped and capacity is available to complete the task. FAIL_TASK - The capacity task
        # fails.

        @[JSON::Field(key: "TaskActionOnBlockingInstances")]
        getter task_action_on_blocking_instances : String?

        def initialize(
          @asset_id : String? = nil,
          @capacity_task_id : String? = nil,
          @capacity_task_status : String? = nil,
          @completion_date : Time? = nil,
          @creation_date : Time? = nil,
          @dry_run : Bool? = nil,
          @failed : Types::CapacityTaskFailure? = nil,
          @instances_to_exclude : Types::InstancesToExclude? = nil,
          @last_modified_date : Time? = nil,
          @order_id : String? = nil,
          @outpost_id : String? = nil,
          @requested_instance_pools : Array(Types::InstanceTypeCapacity)? = nil,
          @task_action_on_blocking_instances : String? = nil
        )
        end
      end


      struct GetCatalogItemInput
        include JSON::Serializable

        # The ID of the catalog item.

        @[JSON::Field(key: "CatalogItemId")]
        getter catalog_item_id : String

        def initialize(
          @catalog_item_id : String
        )
        end
      end


      struct GetCatalogItemOutput
        include JSON::Serializable

        # Information about this catalog item.

        @[JSON::Field(key: "CatalogItem")]
        getter catalog_item : Types::CatalogItem?

        def initialize(
          @catalog_item : Types::CatalogItem? = nil
        )
        end
      end


      struct GetConnectionRequest
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end


      struct GetConnectionResponse
        include JSON::Serializable

        # Information about the connection.

        @[JSON::Field(key: "ConnectionDetails")]
        getter connection_details : Types::ConnectionDetails?

        # The ID of the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        def initialize(
          @connection_details : Types::ConnectionDetails? = nil,
          @connection_id : String? = nil
        )
        end
      end


      struct GetOrderInput
        include JSON::Serializable

        # The ID of the order.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String

        def initialize(
          @order_id : String
        )
        end
      end


      struct GetOrderOutput
        include JSON::Serializable


        @[JSON::Field(key: "Order")]
        getter order : Types::Order?

        def initialize(
          @order : Types::Order? = nil
        )
        end
      end


      struct GetOutpostBillingInformationInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostIdentifier")]
        getter outpost_identifier : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @outpost_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetOutpostBillingInformationOutput
        include JSON::Serializable

        # The date the current contract term ends for the specified Outpost. You must start the renewal or
        # decommission process at least 5 business days before the current term for your Amazon Web Services
        # Outposts ends. Failing to complete these steps at least 5 business days before the current term ends
        # might result in unanticipated charges.

        @[JSON::Field(key: "ContractEndDate")]
        getter contract_end_date : String?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The subscription details for the specified Outpost.

        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @contract_end_date : String? = nil,
          @next_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct GetOutpostInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String

        def initialize(
          @outpost_id : String
        )
        end
      end


      struct GetOutpostInstanceTypesInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @outpost_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetOutpostInstanceTypesOutput
        include JSON::Serializable


        @[JSON::Field(key: "InstanceTypes")]
        getter instance_types : Array(Types::InstanceTypeItem)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The ID of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        def initialize(
          @instance_types : Array(Types::InstanceTypeItem)? = nil,
          @next_token : String? = nil,
          @outpost_arn : String? = nil,
          @outpost_id : String? = nil
        )
        end
      end


      struct GetOutpostOutput
        include JSON::Serializable


        @[JSON::Field(key: "Outpost")]
        getter outpost : Types::Outpost?

        def initialize(
          @outpost : Types::Outpost? = nil
        )
        end
      end


      struct GetOutpostSupportedInstanceTypesInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        # The ID of the Outpost asset. An Outpost asset can be a single server within an Outposts rack or an
        # Outposts server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID for the Amazon Web Services Outposts order.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        def initialize(
          @outpost_identifier : String,
          @asset_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @order_id : String? = nil
        )
        end
      end


      struct GetOutpostSupportedInstanceTypesOutput
        include JSON::Serializable


        @[JSON::Field(key: "InstanceTypes")]
        getter instance_types : Array(Types::InstanceTypeItem)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instance_types : Array(Types::InstanceTypeItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSiteAddressInput
        include JSON::Serializable

        # The type of the address you request.

        @[JSON::Field(key: "AddressType")]
        getter address_type : String

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        def initialize(
          @address_type : String,
          @site_id : String
        )
        end
      end


      struct GetSiteAddressOutput
        include JSON::Serializable

        # Information about the address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The type of the address you receive.

        @[JSON::Field(key: "AddressType")]
        getter address_type : String?


        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        def initialize(
          @address : Types::Address? = nil,
          @address_type : String? = nil,
          @site_id : String? = nil
        )
        end
      end


      struct GetSiteInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        def initialize(
          @site_id : String
        )
        end
      end


      struct GetSiteOutput
        include JSON::Serializable


        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end

      # The instance type that you specify determines the combination of CPU, memory, storage, and
      # networking capacity.

      struct InstanceTypeCapacity
        include JSON::Serializable

        # The number of instances for the specified instance type.

        @[JSON::Field(key: "Count")]
        getter count : Int32

        # The instance type of the hosts.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String

        def initialize(
          @count : Int32,
          @instance_type : String
        )
        end
      end

      # Information about an instance type.

      struct InstanceTypeItem
        include JSON::Serializable


        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The number of default VCPUs in an instance type.

        @[JSON::Field(key: "VCPUs")]
        getter vcp_us : Int32?

        def initialize(
          @instance_type : String? = nil,
          @vcp_us : Int32? = nil
        )
        end
      end

      # User-specified instances that must not be stopped. These instances will not appear in the list of
      # instances that Amazon Web Services recommends to stop in order to free up capacity.

      struct InstancesToExclude
        include JSON::Serializable

        # IDs of the accounts that own each instance that must not be stopped.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # List of user-specified instances that must not be stopped.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(String)?

        # Names of the services that own each instance that must not be stopped in order to free up the
        # capacity needed to run the capacity task.

        @[JSON::Field(key: "Services")]
        getter services : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @instances : Array(String)? = nil,
          @services : Array(String)? = nil
        )
        end
      end

      # An internal error has occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a line item.

      struct LineItem
        include JSON::Serializable

        # Information about assets.

        @[JSON::Field(key: "AssetInformationList")]
        getter asset_information_list : Array(Types::LineItemAssetInformation)?

        # The ID of the catalog item.

        @[JSON::Field(key: "CatalogItemId")]
        getter catalog_item_id : String?

        # The ID of the line item.

        @[JSON::Field(key: "LineItemId")]
        getter line_item_id : String?

        # The ID of the previous line item.

        @[JSON::Field(key: "PreviousLineItemId")]
        getter previous_line_item_id : String?

        # The ID of the previous order.

        @[JSON::Field(key: "PreviousOrderId")]
        getter previous_order_id : String?

        # The quantity of the line item.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32?

        # Information about a line item shipment.

        @[JSON::Field(key: "ShipmentInformation")]
        getter shipment_information : Types::ShipmentInformation?

        # The status of the line item.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @asset_information_list : Array(Types::LineItemAssetInformation)? = nil,
          @catalog_item_id : String? = nil,
          @line_item_id : String? = nil,
          @previous_line_item_id : String? = nil,
          @previous_order_id : String? = nil,
          @quantity : Int32? = nil,
          @shipment_information : Types::ShipmentInformation? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a line item asset.

      struct LineItemAssetInformation
        include JSON::Serializable

        # The ID of the asset. An Outpost asset can be a single server within an Outposts rack or an Outposts
        # server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # The MAC addresses of the asset.

        @[JSON::Field(key: "MacAddressList")]
        getter mac_address_list : Array(String)?

        def initialize(
          @asset_id : String? = nil,
          @mac_address_list : Array(String)? = nil
        )
        end
      end

      # Information about a line item request.

      struct LineItemRequest
        include JSON::Serializable

        # The ID of the catalog item.

        @[JSON::Field(key: "CatalogItemId")]
        getter catalog_item_id : String?

        # The quantity of a line item request.

        @[JSON::Field(key: "Quantity")]
        getter quantity : Int32?

        def initialize(
          @catalog_item_id : String? = nil,
          @quantity : Int32? = nil
        )
        end
      end


      struct ListAssetInstancesInput
        include JSON::Serializable

        # The ID of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        # Filters the results by account ID.

        @[JSON::Field(key: "AccountIdFilter")]
        getter account_id_filter : Array(String)?

        # Filters the results by asset ID.

        @[JSON::Field(key: "AssetIdFilter")]
        getter asset_id_filter : Array(String)?

        # Filters the results by Amazon Web Services service.

        @[JSON::Field(key: "AwsServiceFilter")]
        getter aws_service_filter : Array(String)?

        # Filters the results by instance ID.

        @[JSON::Field(key: "InstanceTypeFilter")]
        getter instance_type_filter : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @outpost_identifier : String,
          @account_id_filter : Array(String)? = nil,
          @asset_id_filter : Array(String)? = nil,
          @aws_service_filter : Array(String)? = nil,
          @instance_type_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetInstancesOutput
        include JSON::Serializable

        # List of instances owned by all accounts on the Outpost. Does not include Amazon EBS or Amazon S3
        # instances.

        @[JSON::Field(key: "AssetInstances")]
        getter asset_instances : Array(Types::AssetInstance)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @asset_instances : Array(Types::AssetInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetsInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        # Filters the results by the host ID of a Dedicated Host.

        @[JSON::Field(key: "HostIdFilter")]
        getter host_id_filter : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the results by state.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : Array(String)?

        def initialize(
          @outpost_identifier : String,
          @host_id_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status_filter : Array(String)? = nil
        )
        end
      end


      struct ListAssetsOutput
        include JSON::Serializable

        # Information about the hardware assets.

        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::AssetInfo)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assets : Array(Types::AssetInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBlockingInstancesForCapacityTaskInput
        include JSON::Serializable

        # The ID of the capacity task.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String

        # The ID or ARN of the Outpost associated with the specified capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @capacity_task_id : String,
          @outpost_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBlockingInstancesForCapacityTaskOutput
        include JSON::Serializable

        # A list of all running Amazon EC2 instances on the Outpost. Stopping one or more of these instances
        # can free up the capacity needed to run the capacity task.

        @[JSON::Field(key: "BlockingInstances")]
        getter blocking_instances : Array(Types::BlockingInstance)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @blocking_instances : Array(Types::BlockingInstance)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCapacityTasksInput
        include JSON::Serializable

        # A list of statuses. For example, REQUESTED or WAITING_FOR_EVACUATION .

        @[JSON::Field(key: "CapacityTaskStatusFilter")]
        getter capacity_task_status_filter : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the results by an Outpost ID or an Outpost ARN.

        @[JSON::Field(key: "OutpostIdentifierFilter")]
        getter outpost_identifier_filter : String?

        def initialize(
          @capacity_task_status_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @outpost_identifier_filter : String? = nil
        )
        end
      end


      struct ListCapacityTasksOutput
        include JSON::Serializable

        # Lists all the capacity tasks.

        @[JSON::Field(key: "CapacityTasks")]
        getter capacity_tasks : Array(Types::CapacityTaskSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @capacity_tasks : Array(Types::CapacityTaskSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCatalogItemsInput
        include JSON::Serializable

        # Filters the results by EC2 family (for example, M5).

        @[JSON::Field(key: "EC2FamilyFilter")]
        getter ec2_family_filter : Array(String)?

        # Filters the results by item class.

        @[JSON::Field(key: "ItemClassFilter")]
        getter item_class_filter : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the results by storage option.

        @[JSON::Field(key: "SupportedStorageFilter")]
        getter supported_storage_filter : Array(String)?

        def initialize(
          @ec2_family_filter : Array(String)? = nil,
          @item_class_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @supported_storage_filter : Array(String)? = nil
        )
        end
      end


      struct ListCatalogItemsOutput
        include JSON::Serializable

        # Information about the catalog items.

        @[JSON::Field(key: "CatalogItems")]
        getter catalog_items : Array(Types::CatalogItem)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @catalog_items : Array(Types::CatalogItem)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrdersInput
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID or the Amazon Resource Name (ARN) of the Outpost.

        @[JSON::Field(key: "OutpostIdentifierFilter")]
        getter outpost_identifier_filter : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @outpost_identifier_filter : String? = nil
        )
        end
      end


      struct ListOrdersOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the orders.

        @[JSON::Field(key: "Orders")]
        getter orders : Array(Types::OrderSummary)?

        def initialize(
          @next_token : String? = nil,
          @orders : Array(Types::OrderSummary)? = nil
        )
        end
      end


      struct ListOutpostsInput
        include JSON::Serializable

        # Filters the results by Availability Zone (for example, us-east-1a ).

        @[JSON::Field(key: "AvailabilityZoneFilter")]
        getter availability_zone_filter : Array(String)?

        # Filters the results by AZ ID (for example, use1-az1 ).

        @[JSON::Field(key: "AvailabilityZoneIdFilter")]
        getter availability_zone_id_filter : Array(String)?

        # Filters the results by the lifecycle status.

        @[JSON::Field(key: "LifeCycleStatusFilter")]
        getter life_cycle_status_filter : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @availability_zone_filter : Array(String)? = nil,
          @availability_zone_id_filter : Array(String)? = nil,
          @life_cycle_status_filter : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutpostsOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Outposts")]
        getter outposts : Array(Types::Outpost)?

        def initialize(
          @next_token : String? = nil,
          @outposts : Array(Types::Outpost)? = nil
        )
        end
      end


      struct ListSitesInput
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Filters the results by city.

        @[JSON::Field(key: "OperatingAddressCityFilter")]
        getter operating_address_city_filter : Array(String)?

        # Filters the results by country code.

        @[JSON::Field(key: "OperatingAddressCountryCodeFilter")]
        getter operating_address_country_code_filter : Array(String)?

        # Filters the results by state or region.

        @[JSON::Field(key: "OperatingAddressStateOrRegionFilter")]
        getter operating_address_state_or_region_filter : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @operating_address_city_filter : Array(String)? = nil,
          @operating_address_country_code_filter : Array(String)? = nil,
          @operating_address_state_or_region_filter : Array(String)? = nil
        )
        end
      end


      struct ListSitesOutput
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Sites")]
        getter sites : Array(Types::Site)?

        def initialize(
          @next_token : String? = nil,
          @sites : Array(Types::Site)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The resource tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The specified request is not valid.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about an order.

      struct Order
        include JSON::Serializable

        # The line items for the order

        @[JSON::Field(key: "LineItems")]
        getter line_items : Array(Types::LineItem)?

        # The fulfillment date of the order.

        @[JSON::Field(key: "OrderFulfilledDate")]
        getter order_fulfilled_date : Time?

        # The ID of the order.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # The submission date for the order.

        @[JSON::Field(key: "OrderSubmissionDate")]
        getter order_submission_date : Time?

        # The type of order.

        @[JSON::Field(key: "OrderType")]
        getter order_type : String?

        # The ID of the Outpost in the order.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # The payment option for the order.

        @[JSON::Field(key: "PaymentOption")]
        getter payment_option : String?

        # The payment term.

        @[JSON::Field(key: "PaymentTerm")]
        getter payment_term : String?

        # The status of the order. PREPARING - Order is received and being prepared. IN_PROGRESS - Order is
        # either being built or shipped. To get more details, see the line item status. DELIVERED - Order was
        # delivered to the Outpost site. COMPLETED - Order is complete. CANCELLED - Order is cancelled. ERROR
        # - Customer should contact support. The following status are deprecated: RECEIVED , PENDING ,
        # PROCESSING , INSTALLING , and FULFILLED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @line_items : Array(Types::LineItem)? = nil,
          @order_fulfilled_date : Time? = nil,
          @order_id : String? = nil,
          @order_submission_date : Time? = nil,
          @order_type : String? = nil,
          @outpost_id : String? = nil,
          @payment_option : String? = nil,
          @payment_term : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A summary of line items in your order.

      struct OrderSummary
        include JSON::Serializable

        # The status of all line items in the order.

        @[JSON::Field(key: "LineItemCountsByStatus")]
        getter line_item_counts_by_status : Hash(String, Int32)?

        # The fulfilment date for the order.

        @[JSON::Field(key: "OrderFulfilledDate")]
        getter order_fulfilled_date : Time?

        # The ID of the order.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # The submission date for the order.

        @[JSON::Field(key: "OrderSubmissionDate")]
        getter order_submission_date : Time?

        # The type of order.

        @[JSON::Field(key: "OrderType")]
        getter order_type : String?

        # The ID of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # The status of the order. PREPARING - Order is received and is being prepared. IN_PROGRESS - Order is
        # either being built, shipped, or installed. For more information, see the LineItem status. COMPLETED
        # - Order is complete. CANCELLED - Order is cancelled. ERROR - Customer should contact support. The
        # following statuses are deprecated: RECEIVED , PENDING , PROCESSING , INSTALLING , and FULFILLED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @line_item_counts_by_status : Hash(String, Int32)? = nil,
          @order_fulfilled_date : Time? = nil,
          @order_id : String? = nil,
          @order_submission_date : Time? = nil,
          @order_type : String? = nil,
          @outpost_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about an Outpost.

      struct Outpost
        include JSON::Serializable


        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?


        @[JSON::Field(key: "AvailabilityZoneId")]
        getter availability_zone_id : String?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LifeCycleStatus")]
        getter life_cycle_status : String?


        @[JSON::Field(key: "Name")]
        getter name : String?


        @[JSON::Field(key: "OutpostArn")]
        getter outpost_arn : String?

        # The ID of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?


        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?


        @[JSON::Field(key: "SiteArn")]
        getter site_arn : String?


        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The hardware type.

        @[JSON::Field(key: "SupportedHardwareType")]
        getter supported_hardware_type : String?

        # The Outpost tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @availability_zone : String? = nil,
          @availability_zone_id : String? = nil,
          @description : String? = nil,
          @life_cycle_status : String? = nil,
          @name : String? = nil,
          @outpost_arn : String? = nil,
          @outpost_id : String? = nil,
          @owner_id : String? = nil,
          @site_arn : String? = nil,
          @site_id : String? = nil,
          @supported_hardware_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the physical and logistical details for racks at sites. For more information about
      # hardware requirements for racks, see Network readiness checklist in the Amazon Web Services Outposts
      # User Guide.

      struct RackPhysicalProperties
        include JSON::Serializable

        # The type of fiber used to attach the Outpost to the network.

        @[JSON::Field(key: "FiberOpticCableType")]
        getter fiber_optic_cable_type : String?

        # The maximum rack weight that this site can support. NO_LIMIT is over 2000 lbs (907 kg).

        @[JSON::Field(key: "MaximumSupportedWeightLbs")]
        getter maximum_supported_weight_lbs : String?

        # The type of optical standard used to attach the Outpost to the network. This field is dependent on
        # uplink speed, fiber type, and distance to the upstream device. For more information about networking
        # requirements for racks, see Network in the Amazon Web Services Outposts User Guide.

        @[JSON::Field(key: "OpticalStandard")]
        getter optical_standard : String?

        # The power connector for the hardware.

        @[JSON::Field(key: "PowerConnector")]
        getter power_connector : String?

        # The power draw available at the hardware placement position for the rack.

        @[JSON::Field(key: "PowerDrawKva")]
        getter power_draw_kva : String?

        # The position of the power feed.

        @[JSON::Field(key: "PowerFeedDrop")]
        getter power_feed_drop : String?

        # The power option that you can provide for hardware.

        @[JSON::Field(key: "PowerPhase")]
        getter power_phase : String?

        # The number of uplinks each Outpost network device.

        @[JSON::Field(key: "UplinkCount")]
        getter uplink_count : String?

        # The uplink speed the rack supports for the connection to the Region.

        @[JSON::Field(key: "UplinkGbps")]
        getter uplink_gbps : String?

        def initialize(
          @fiber_optic_cable_type : String? = nil,
          @maximum_supported_weight_lbs : String? = nil,
          @optical_standard : String? = nil,
          @power_connector : String? = nil,
          @power_draw_kva : String? = nil,
          @power_feed_drop : String? = nil,
          @power_phase : String? = nil,
          @uplink_count : String? = nil,
          @uplink_gbps : String? = nil
        )
        end
      end

      # You have exceeded a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a line item shipment.

      struct ShipmentInformation
        include JSON::Serializable

        # The carrier of the shipment.

        @[JSON::Field(key: "ShipmentCarrier")]
        getter shipment_carrier : String?

        # The tracking number of the shipment.

        @[JSON::Field(key: "ShipmentTrackingNumber")]
        getter shipment_tracking_number : String?

        def initialize(
          @shipment_carrier : String? = nil,
          @shipment_tracking_number : String? = nil
        )
        end
      end

      # Information about a site.

      struct Site
        include JSON::Serializable


        @[JSON::Field(key: "AccountId")]
        getter account_id : String?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        # Notes about a site.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        # City where the hardware is installed and powered on.

        @[JSON::Field(key: "OperatingAddressCity")]
        getter operating_address_city : String?

        # The ISO-3166 two-letter country code where the hardware is installed and powered on.

        @[JSON::Field(key: "OperatingAddressCountryCode")]
        getter operating_address_country_code : String?

        # State or region where the hardware is installed and powered on.

        @[JSON::Field(key: "OperatingAddressStateOrRegion")]
        getter operating_address_state_or_region : String?

        # Information about the physical and logistical details for a rack at the site.

        @[JSON::Field(key: "RackPhysicalProperties")]
        getter rack_physical_properties : Types::RackPhysicalProperties?


        @[JSON::Field(key: "SiteArn")]
        getter site_arn : String?


        @[JSON::Field(key: "SiteId")]
        getter site_id : String?

        # The site tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @notes : String? = nil,
          @operating_address_city : String? = nil,
          @operating_address_country_code : String? = nil,
          @operating_address_state_or_region : String? = nil,
          @rack_physical_properties : Types::RackPhysicalProperties? = nil,
          @site_arn : String? = nil,
          @site_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartCapacityTaskInput
        include JSON::Serializable

        # The instance pools specified in the capacity task.

        @[JSON::Field(key: "InstancePools")]
        getter instance_pools : Array(Types::InstanceTypeCapacity)

        # The ID or ARN of the Outposts associated with the specified capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        # The ID of the Outpost asset. An Outpost asset can be a single server within an Outposts rack or an
        # Outposts server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # You can request a dry run to determine if the instance type and instance size changes is above or
        # below available instance capacity. Requesting a dry run does not make any changes to your plan.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # List of user-specified running instances that must not be stopped in order to free up the capacity
        # needed to run the capacity task.

        @[JSON::Field(key: "InstancesToExclude")]
        getter instances_to_exclude : Types::InstancesToExclude?

        # The ID of the Amazon Web Services Outposts order associated with the specified capacity task.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # Specify one of the following options in case an instance is blocking the capacity task from running.
        # WAIT_FOR_EVACUATION - Checks every 10 minutes over 48 hours to determine if instances have stopped
        # and capacity is available to complete the task. FAIL_TASK - The capacity task fails.

        @[JSON::Field(key: "TaskActionOnBlockingInstances")]
        getter task_action_on_blocking_instances : String?

        def initialize(
          @instance_pools : Array(Types::InstanceTypeCapacity),
          @outpost_identifier : String,
          @asset_id : String? = nil,
          @dry_run : Bool? = nil,
          @instances_to_exclude : Types::InstancesToExclude? = nil,
          @order_id : String? = nil,
          @task_action_on_blocking_instances : String? = nil
        )
        end
      end


      struct StartCapacityTaskOutput
        include JSON::Serializable

        # The ID of the asset. An Outpost asset can be a single server within an Outposts rack or an Outposts
        # server configuration.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String?

        # ID of the capacity task that you want to start.

        @[JSON::Field(key: "CapacityTaskId")]
        getter capacity_task_id : String?

        # Status of the specified capacity task.

        @[JSON::Field(key: "CapacityTaskStatus")]
        getter capacity_task_status : String?

        # Date that the specified capacity task ran successfully.

        @[JSON::Field(key: "CompletionDate")]
        getter completion_date : Time?

        # Date that the specified capacity task was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # Results of the dry run showing if the specified capacity task is above or below the available
        # instance capacity.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        # Reason that the specified capacity task failed.

        @[JSON::Field(key: "Failed")]
        getter failed : Types::CapacityTaskFailure?

        # User-specified instances that must not be stopped in order to free up the capacity needed to run the
        # capacity task.

        @[JSON::Field(key: "InstancesToExclude")]
        getter instances_to_exclude : Types::InstancesToExclude?

        # Date that the specified capacity task was last modified.

        @[JSON::Field(key: "LastModifiedDate")]
        getter last_modified_date : Time?

        # ID of the Amazon Web Services Outposts order of the host associated with the capacity task.

        @[JSON::Field(key: "OrderId")]
        getter order_id : String?

        # ID of the Outpost associated with the capacity task.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String?

        # List of the instance pools requested in the specified capacity task.

        @[JSON::Field(key: "RequestedInstancePools")]
        getter requested_instance_pools : Array(Types::InstanceTypeCapacity)?

        # User-specified option in case an instance is blocking the capacity task from running.
        # WAIT_FOR_EVACUATION - Checks every 10 minutes over 48 hours to determine if instances have stopped
        # and capacity is available to complete the task. FAIL_TASK - The capacity task fails.

        @[JSON::Field(key: "TaskActionOnBlockingInstances")]
        getter task_action_on_blocking_instances : String?

        def initialize(
          @asset_id : String? = nil,
          @capacity_task_id : String? = nil,
          @capacity_task_status : String? = nil,
          @completion_date : Time? = nil,
          @creation_date : Time? = nil,
          @dry_run : Bool? = nil,
          @failed : Types::CapacityTaskFailure? = nil,
          @instances_to_exclude : Types::InstancesToExclude? = nil,
          @last_modified_date : Time? = nil,
          @order_id : String? = nil,
          @outpost_id : String? = nil,
          @requested_instance_pools : Array(Types::InstanceTypeCapacity)? = nil,
          @task_action_on_blocking_instances : String? = nil
        )
        end
      end


      struct StartConnectionRequest
        include JSON::Serializable

        # The ID of the Outpost server.

        @[JSON::Field(key: "AssetId")]
        getter asset_id : String

        # The public key of the client.

        @[JSON::Field(key: "ClientPublicKey")]
        getter client_public_key : String

        # The device index of the network interface on the Outpost server.

        @[JSON::Field(key: "NetworkInterfaceDeviceIndex")]
        getter network_interface_device_index : Int32

        # The serial number of the dongle.

        @[JSON::Field(key: "DeviceSerialNumber")]
        getter device_serial_number : String?

        def initialize(
          @asset_id : String,
          @client_public_key : String,
          @network_interface_device_index : Int32,
          @device_serial_number : String? = nil
        )
        end
      end


      struct StartConnectionResponse
        include JSON::Serializable

        # The ID of the connection.

        @[JSON::Field(key: "ConnectionId")]
        getter connection_id : String?

        # The underlay IP address.

        @[JSON::Field(key: "UnderlayIpAddress")]
        getter underlay_ip_address : String?

        def initialize(
          @connection_id : String? = nil,
          @underlay_ip_address : String? = nil
        )
        end
      end


      struct StartOutpostDecommissionInput
        include JSON::Serializable

        # The ID or ARN of the Outpost that you want to decommission.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_identifier : String

        # Validates the request without starting the decommission process.

        @[JSON::Field(key: "ValidateOnly")]
        getter validate_only : Bool?

        def initialize(
          @outpost_identifier : String,
          @validate_only : Bool? = nil
        )
        end
      end


      struct StartOutpostDecommissionOutput
        include JSON::Serializable

        # The resources still associated with the Outpost that you are decommissioning.

        @[JSON::Field(key: "BlockingResourceTypes")]
        getter blocking_resource_types : Array(String)?

        # The status of the decommission request.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @blocking_resource_types : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information about your Amazon Web Services Outposts subscriptions.

      struct Subscription
        include JSON::Serializable

        # The date your subscription starts.

        @[JSON::Field(key: "BeginDate")]
        getter begin_date : Time?

        # The date your subscription ends.

        @[JSON::Field(key: "EndDate")]
        getter end_date : Time?

        # The amount you are billed each month in the subscription period.

        @[JSON::Field(key: "MonthlyRecurringPrice")]
        getter monthly_recurring_price : Float64?

        # The order ID for your subscription.

        @[JSON::Field(key: "OrderIds")]
        getter order_ids : Array(String)?

        # The ID of the subscription that appears on the Amazon Web Services Billing Center console.

        @[JSON::Field(key: "SubscriptionId")]
        getter subscription_id : String?

        # The status of subscription which can be one of the following: INACTIVE - Subscription requests that
        # are inactive. ACTIVE - Subscription requests that are in progress and have an end date in the
        # future. CANCELLED - Subscription requests that are cancelled.

        @[JSON::Field(key: "SubscriptionStatus")]
        getter subscription_status : String?

        # The type of subscription which can be one of the following: ORIGINAL - The first order on the Amazon
        # Web Services Outposts. RENEWAL - Renewal requests, both month to month and longer term.
        # CAPACITY_INCREASE - Capacity scaling orders.

        @[JSON::Field(key: "SubscriptionType")]
        getter subscription_type : String?

        # The amount billed when the subscription is created. This is a one-time charge.

        @[JSON::Field(key: "UpfrontPrice")]
        getter upfront_price : Float64?

        def initialize(
          @begin_date : Time? = nil,
          @end_date : Time? = nil,
          @monthly_recurring_price : Float64? = nil,
          @order_ids : Array(String)? = nil,
          @subscription_id : String? = nil,
          @subscription_status : String? = nil,
          @subscription_type : String? = nil,
          @upfront_price : Float64? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to add to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys.

        @[JSON::Field(key: "tagKeys")]
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


      struct UpdateOutpostInput
        include JSON::Serializable

        # The ID or ARN of the Outpost.

        @[JSON::Field(key: "OutpostId")]
        getter outpost_id : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of hardware for this Outpost.

        @[JSON::Field(key: "SupportedHardwareType")]
        getter supported_hardware_type : String?

        def initialize(
          @outpost_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @supported_hardware_type : String? = nil
        )
        end
      end


      struct UpdateOutpostOutput
        include JSON::Serializable


        @[JSON::Field(key: "Outpost")]
        getter outpost : Types::Outpost?

        def initialize(
          @outpost : Types::Outpost? = nil
        )
        end
      end


      struct UpdateSiteAddressInput
        include JSON::Serializable

        # The address for the site.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address

        # The type of the address.

        @[JSON::Field(key: "AddressType")]
        getter address_type : String

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        def initialize(
          @address : Types::Address,
          @address_type : String,
          @site_id : String
        )
        end
      end


      struct UpdateSiteAddressOutput
        include JSON::Serializable

        # Information about an address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The type of the address.

        @[JSON::Field(key: "AddressType")]
        getter address_type : String?

        def initialize(
          @address : Types::Address? = nil,
          @address_type : String? = nil
        )
        end
      end


      struct UpdateSiteInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Name")]
        getter name : String?

        # Notes about a site.

        @[JSON::Field(key: "Notes")]
        getter notes : String?

        def initialize(
          @site_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @notes : String? = nil
        )
        end
      end


      struct UpdateSiteOutput
        include JSON::Serializable


        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end


      struct UpdateSiteRackPhysicalPropertiesInput
        include JSON::Serializable

        # The ID or the Amazon Resource Name (ARN) of the site.

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        # The type of fiber that you will use to attach the Outpost to your network.

        @[JSON::Field(key: "FiberOpticCableType")]
        getter fiber_optic_cable_type : String?

        # The maximum rack weight that this site can support. NO_LIMIT is over 2000lbs.

        @[JSON::Field(key: "MaximumSupportedWeightLbs")]
        getter maximum_supported_weight_lbs : String?

        # The type of optical standard that you will use to attach the Outpost to your network. This field is
        # dependent on uplink speed, fiber type, and distance to the upstream device. For more information
        # about networking requirements for racks, see Network in the Amazon Web Services Outposts User Guide.
        # OPTIC_10GBASE_SR : 10GBASE-SR OPTIC_10GBASE_IR : 10GBASE-IR OPTIC_10GBASE_LR : 10GBASE-LR
        # OPTIC_40GBASE_SR : 40GBASE-SR OPTIC_40GBASE_ESR : 40GBASE-ESR OPTIC_40GBASE_IR4_LR4L : 40GBASE-IR
        # (LR4L) OPTIC_40GBASE_LR4 : 40GBASE-LR4 OPTIC_100GBASE_SR4 : 100GBASE-SR4 OPTIC_100GBASE_CWDM4 :
        # 100GBASE-CWDM4 OPTIC_100GBASE_LR4 : 100GBASE-LR4 OPTIC_100G_PSM4_MSA : 100G PSM4 MSA
        # OPTIC_1000BASE_LX : 1000Base-LX OPTIC_1000BASE_SX : 1000Base-SX

        @[JSON::Field(key: "OpticalStandard")]
        getter optical_standard : String?

        # The power connector that Amazon Web Services should plan to provide for connections to the hardware.
        # Note the correlation between PowerPhase and PowerConnector . Single-phase AC feed L6-30P – (common
        # in US); 30A; single phase IEC309 (blue) – P+N+E, 6hr; 32 A; single phase Three-phase AC feed
        # AH530P7W (red) – 3P+N+E, 7hr; 30A; three phase AH532P6W (red) – 3P+N+E, 6hr; 32A; three phase
        # CS8365C – (common in US); 3P+E, 50A; three phase

        @[JSON::Field(key: "PowerConnector")]
        getter power_connector : String?

        # The power draw, in kVA, available at the hardware placement position for the rack.

        @[JSON::Field(key: "PowerDrawKva")]
        getter power_draw_kva : String?

        # Indicates whether the power feed comes above or below the rack.

        @[JSON::Field(key: "PowerFeedDrop")]
        getter power_feed_drop : String?

        # The power option that you can provide for hardware. Single-phase AC feed: 200 V to 277 V, 50 Hz or
        # 60 Hz Three-phase AC feed: 346 V to 480 V, 50 Hz or 60 Hz

        @[JSON::Field(key: "PowerPhase")]
        getter power_phase : String?

        # Racks come with two Outpost network devices. Depending on the supported uplink speed at the site,
        # the Outpost network devices provide a variable number of uplinks. Specify the number of uplinks for
        # each Outpost network device that you intend to use to connect the rack to your network. Note the
        # correlation between UplinkGbps and UplinkCount . 1Gbps - Uplinks available: 1, 2, 4, 6, 8 10Gbps -
        # Uplinks available: 1, 2, 4, 8, 12, 16 40 and 100 Gbps- Uplinks available: 1, 2, 4

        @[JSON::Field(key: "UplinkCount")]
        getter uplink_count : String?

        # The uplink speed the rack should support for the connection to the Region.

        @[JSON::Field(key: "UplinkGbps")]
        getter uplink_gbps : String?

        def initialize(
          @site_id : String,
          @fiber_optic_cable_type : String? = nil,
          @maximum_supported_weight_lbs : String? = nil,
          @optical_standard : String? = nil,
          @power_connector : String? = nil,
          @power_draw_kva : String? = nil,
          @power_feed_drop : String? = nil,
          @power_phase : String? = nil,
          @uplink_count : String? = nil,
          @uplink_gbps : String? = nil
        )
        end
      end


      struct UpdateSiteRackPhysicalPropertiesOutput
        include JSON::Serializable


        @[JSON::Field(key: "Site")]
        getter site : Types::Site?

        def initialize(
          @site : Types::Site? = nil
        )
        end
      end

      # A parameter is not valid.

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
