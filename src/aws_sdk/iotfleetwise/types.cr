require "json"
require "time"

module AwsSdk
  module IoTFleetWise
    module Types

      # You don't have sufficient permission to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A signal that represents a vehicle device such as the engine, heater, and door locks. Data from an
      # actuator reports the state of a certain vehicle device. Updating actuator data can change the state
      # of a device. For example, you can turn on or off the heater by updating its actuator data.

      struct Actuator
        include JSON::Serializable

        # The specified data type of the actuator.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The fully qualified name of the actuator. For example, the fully qualified name of an actuator might
        # be Vehicle.Front.Left.Door.Lock .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A list of possible values an actuator can take.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)?

        # A specified value for the actuator.

        @[JSON::Field(key: "assignedValue")]
        getter assigned_value : String?

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of the actuator.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The specified possible maximum value of an actuator.

        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The specified possible minimum value of an actuator.

        @[JSON::Field(key: "min")]
        getter min : Float64?

        # The fully qualified name of the struct node for the actuator if the data type of the actuator is
        # Struct or StructArray . For example, the struct fully qualified name of an actuator might be
        # Vehicle.Door.LockStruct .

        @[JSON::Field(key: "structFullyQualifiedName")]
        getter struct_fully_qualified_name : String?

        # The scientific unit for the actuator.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @fully_qualified_name : String,
          @allowed_values : Array(String)? = nil,
          @assigned_value : String? = nil,
          @comment : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @struct_fully_qualified_name : String? = nil,
          @unit : String? = nil
        )
        end
      end


      struct AssociateVehicleFleetRequest
        include JSON::Serializable

        # The ID of a fleet.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The unique ID of the vehicle to associate with the fleet.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        def initialize(
          @fleet_id : String,
          @vehicle_name : String
        )
        end
      end


      struct AssociateVehicleFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A signal that represents static information about the vehicle, such as engine type or manufacturing
      # date.

      struct Attribute
        include JSON::Serializable

        # The specified data type of the attribute.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The fully qualified name of the attribute. For example, the fully qualified name of an attribute
        # might be Vehicle.Body.Engine.Type .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A list of possible values an attribute can be assigned.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)?

        # A specified value for the attribute.

        @[JSON::Field(key: "assignedValue")]
        getter assigned_value : String?

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The default value of the attribute.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of the attribute.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The specified possible maximum value of the attribute.

        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The specified possible minimum value of the attribute.

        @[JSON::Field(key: "min")]
        getter min : Float64?

        # The scientific unit for the attribute.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @fully_qualified_name : String,
          @allowed_values : Array(String)? = nil,
          @assigned_value : String? = nil,
          @comment : String? = nil,
          @default_value : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @unit : String? = nil
        )
        end
      end


      struct BatchCreateVehicleRequest
        include JSON::Serializable

        # A list of information about each vehicle to create. For more information, see the API data type.

        @[JSON::Field(key: "vehicles")]
        getter vehicles : Array(Types::CreateVehicleRequestItem)

        def initialize(
          @vehicles : Array(Types::CreateVehicleRequestItem)
        )
        end
      end


      struct BatchCreateVehicleResponse
        include JSON::Serializable

        # A list of information about creation errors, or an empty list if there aren't any errors.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::CreateVehicleError)?

        # A list of information about a batch of created vehicles. For more information, see the API data
        # type.

        @[JSON::Field(key: "vehicles")]
        getter vehicles : Array(Types::CreateVehicleResponseItem)?

        def initialize(
          @errors : Array(Types::CreateVehicleError)? = nil,
          @vehicles : Array(Types::CreateVehicleResponseItem)? = nil
        )
        end
      end


      struct BatchUpdateVehicleRequest
        include JSON::Serializable

        # A list of information about the vehicles to update. For more information, see the API data type.

        @[JSON::Field(key: "vehicles")]
        getter vehicles : Array(Types::UpdateVehicleRequestItem)

        def initialize(
          @vehicles : Array(Types::UpdateVehicleRequestItem)
        )
        end
      end


      struct BatchUpdateVehicleResponse
        include JSON::Serializable

        # A list of information about errors returned while updating a batch of vehicles, or, if there aren't
        # any errors, an empty list.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::UpdateVehicleError)?

        # A list of information about the batch of updated vehicles. This list contains only unique IDs for
        # the vehicles that were updated.

        @[JSON::Field(key: "vehicles")]
        getter vehicles : Array(Types::UpdateVehicleResponseItem)?

        def initialize(
          @errors : Array(Types::UpdateVehicleError)? = nil,
          @vehicles : Array(Types::UpdateVehicleResponseItem)? = nil
        )
        end
      end

      # A group of signals that are defined in a hierarchical structure.

      struct Branch
        include JSON::Serializable

        # The fully qualified name of the branch. For example, the fully qualified name of a branch might be
        # Vehicle.Body.Engine .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of the branch.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @fully_qualified_name : String,
          @comment : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Information about a campaign. You can use the API operation to return this information about
      # multiple created campaigns.

      struct CampaignSummary
        include JSON::Serializable

        # The time the campaign was created.

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The last time the campaign was modified.

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The Amazon Resource Name (ARN) of a campaign.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description of the campaign.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of a campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the signal catalog associated with the campaign.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        # The state of a campaign. The status can be one of the following: CREATING - Amazon Web Services IoT
        # FleetWise is processing your request to create the campaign. WAITING_FOR_APPROVAL - After a campaign
        # is created, it enters the WAITING_FOR_APPROVAL state. To allow Amazon Web Services IoT FleetWise to
        # deploy the campaign to the target vehicle or fleet, use the API operation to approve the campaign.
        # RUNNING - The campaign is active. SUSPENDED - The campaign is suspended. To resume the campaign, use
        # the API operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ARN of a vehicle or fleet to which the campaign is deployed.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @creation_time : Time,
          @last_modification_time : Time,
          @arn : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @signal_catalog_arn : String? = nil,
          @status : String? = nil,
          @target_arn : String? = nil
        )
        end
      end

      # Configurations used to create a decoder manifest.

      struct CanDbcDefinition
        include JSON::Serializable

        # A list of DBC files. You can upload only one DBC file for each network interface and specify up to
        # five (inclusive) files in the list. The DBC file can be a maximum size of 200 MB.

        @[JSON::Field(key: "canDbcFiles")]
        getter can_dbc_files : Array(Bytes)

        # Contains information about a network interface.

        @[JSON::Field(key: "networkInterface")]
        getter network_interface : String

        # Pairs every signal specified in your vehicle model with a signal decoder.

        @[JSON::Field(key: "signalsMap")]
        getter signals_map : Hash(String, String)?

        def initialize(
          @can_dbc_files : Array(Bytes),
          @network_interface : String,
          @signals_map : Hash(String, String)? = nil
        )
        end
      end

      # A single controller area network (CAN) device interface.

      struct CanInterface
        include JSON::Serializable

        # The unique name of the interface.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the communication protocol for the interface.

        @[JSON::Field(key: "protocolName")]
        getter protocol_name : String?

        # The version of the communication protocol for the interface.

        @[JSON::Field(key: "protocolVersion")]
        getter protocol_version : String?

        def initialize(
          @name : String,
          @protocol_name : String? = nil,
          @protocol_version : String? = nil
        )
        end
      end

      # Information about a single controller area network (CAN) signal and the messages it receives and
      # transmits.

      struct CanSignal
        include JSON::Serializable

        # A multiplier used to decode the CAN message.

        @[JSON::Field(key: "factor")]
        getter factor : Float64

        # Whether the byte ordering of a CAN message is big-endian.

        @[JSON::Field(key: "isBigEndian")]
        getter is_big_endian : Bool

        # Determines whether the message is signed ( true ) or not ( false ). If it's signed, the message can
        # represent both positive and negative numbers. The isSigned parameter only applies to the INTEGER raw
        # signal type, and it doesn't affect the FLOATING_POINT raw signal type.

        @[JSON::Field(key: "isSigned")]
        getter is_signed : Bool

        # How many bytes of data are in the message.

        @[JSON::Field(key: "length")]
        getter length : Int32

        # The ID of the message.

        @[JSON::Field(key: "messageId")]
        getter message_id : Int32

        # The offset used to calculate the signal value. Combined with factor, the calculation is value =
        # raw_value * factor + offset .

        @[JSON::Field(key: "offset")]
        getter offset : Float64

        # Indicates the beginning of the CAN signal. This should always be the least significant bit (LSB).
        # This value might be different from the value in a DBC file. For little endian signals, startBit is
        # the same value as in the DBC file. For big endian signals in a DBC file, the start bit is the most
        # significant bit (MSB). You will have to calculate the LSB instead and pass it as the startBit .

        @[JSON::Field(key: "startBit")]
        getter start_bit : Int32

        # The name of the signal.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value type of the signal. The default value is INTEGER .

        @[JSON::Field(key: "signalValueType")]
        getter signal_value_type : String?

        def initialize(
          @factor : Float64,
          @is_big_endian : Bool,
          @is_signed : Bool,
          @length : Int32,
          @message_id : Int32,
          @offset : Float64,
          @start_bit : Int32,
          @name : String? = nil,
          @signal_value_type : String? = nil
        )
        end
      end

      # The log delivery option to send data to Amazon CloudWatch Logs.

      struct CloudWatchLogDeliveryOptions
        include JSON::Serializable

        # The type of log to send data to Amazon CloudWatch Logs.

        @[JSON::Field(key: "logType")]
        getter log_type : String

        # The Amazon CloudWatch Logs group the operation sends data to.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        def initialize(
          @log_type : String,
          @log_group_name : String? = nil
        )
        end
      end

      # Specifies what data to collect and how often or when to collect it.

      struct CollectionScheme
        include JSON::Serializable

        # Information about a collection scheme that uses a simple logical expression to recognize what data
        # to collect.

        @[JSON::Field(key: "conditionBasedCollectionScheme")]
        getter condition_based_collection_scheme : Types::ConditionBasedCollectionScheme?

        # Information about a collection scheme that uses a time period to decide how often to collect data.

        @[JSON::Field(key: "timeBasedCollectionScheme")]
        getter time_based_collection_scheme : Types::TimeBasedCollectionScheme?

        def initialize(
          @condition_based_collection_scheme : Types::ConditionBasedCollectionScheme? = nil,
          @time_based_collection_scheme : Types::TimeBasedCollectionScheme? = nil
        )
        end
      end

      # Information about a collection scheme that uses a simple logical expression to recognize what data
      # to collect.

      struct ConditionBasedCollectionScheme
        include JSON::Serializable

        # The logical expression used to recognize what data to collect. For example,
        # $variable.`Vehicle.OutsideAirTemperature` &gt;= 105.0 .

        @[JSON::Field(key: "expression")]
        getter expression : String

        # Specifies the version of the conditional expression language.

        @[JSON::Field(key: "conditionLanguageVersion")]
        getter condition_language_version : Int32?

        # The minimum duration of time between two triggering events to collect data, in milliseconds. If a
        # signal changes often, you might want to collect data at a slower rate.

        @[JSON::Field(key: "minimumTriggerIntervalMs")]
        getter minimum_trigger_interval_ms : Int64?

        # Whether to collect data for all triggering events ( ALWAYS ). Specify ( RISING_EDGE ), or specify
        # only when the condition first evaluates to false. For example, triggering on "AirbagDeployed"; Users
        # aren't interested on triggering when the airbag is already exploded; they only care about the change
        # from not deployed =&gt; deployed.

        @[JSON::Field(key: "triggerMode")]
        getter trigger_mode : String?

        def initialize(
          @expression : String,
          @condition_language_version : Int32? = nil,
          @minimum_trigger_interval_ms : Int64? = nil,
          @trigger_mode : String? = nil
        )
        end
      end

      # Specifies the condition under which a signal fetch occurs.

      struct ConditionBasedSignalFetchConfig
        include JSON::Serializable

        # The condition that must be satisfied to trigger a signal fetch.

        @[JSON::Field(key: "conditionExpression")]
        getter condition_expression : String

        # Indicates the mode in which the signal fetch is triggered.

        @[JSON::Field(key: "triggerMode")]
        getter trigger_mode : String

        def initialize(
          @condition_expression : String,
          @trigger_mode : String
        )
        end
      end

      # The request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The resource on which there are conflicting operations.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The type of resource on which there are conflicting operations..

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource : String,
          @resource_type : String
        )
        end
      end


      struct CreateCampaignRequest
        include JSON::Serializable

        # The data collection scheme associated with the campaign. You can specify a scheme that collects data
        # based on time or an event.

        @[JSON::Field(key: "collectionScheme")]
        getter collection_scheme : Types::CollectionScheme

        # The name of the campaign to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the signal catalog to associate with the campaign.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # The ARN of the vehicle or fleet to deploy a campaign to.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # Determines whether to compress signals before transmitting data to Amazon Web Services IoT
        # FleetWise. If you don't want to compress the signals, use OFF . If it's not specified, SNAPPY is
        # used. Default: SNAPPY

        @[JSON::Field(key: "compression")]
        getter compression : String?

        # The destination where the campaign sends data. You can send data to an MQTT topic, or store it in
        # Amazon S3 or Amazon Timestream. MQTT is the publish/subscribe messaging protocol used by Amazon Web
        # Services IoT to communicate with your devices. Amazon S3 optimizes the cost of data storage and
        # provides additional mechanisms to use vehicle data, such as data lakes, centralized data storage,
        # data processing pipelines, and analytics. Amazon Web Services IoT FleetWise supports at-least-once
        # file delivery to S3. Your vehicle data is stored on multiple Amazon Web Services IoT FleetWise
        # servers for redundancy and high availability. You can use Amazon Timestream to access and analyze
        # time series data, and Timestream to query vehicle data so that you can identify trends and patterns.

        @[JSON::Field(key: "dataDestinationConfigs")]
        getter data_destination_configs : Array(Types::DataDestinationConfig)?

        # A list of vehicle attributes to associate with a campaign. Enrich the data with specified vehicle
        # attributes. For example, add make and model to the campaign, and Amazon Web Services IoT FleetWise
        # will associate the data with those attributes as dimensions in Amazon Timestream. You can then query
        # the data against make and model . Default: An empty array

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # The data partitions associated with the signals collected from the vehicle.

        @[JSON::Field(key: "dataPartitions")]
        getter data_partitions : Array(Types::DataPartition)?

        # An optional description of the campaign to help identify its purpose.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Option for a vehicle to send diagnostic trouble codes to Amazon Web Services IoT FleetWise. If you
        # want to send diagnostic trouble codes, use SEND_ACTIVE_DTCS . If it's not specified, OFF is used.
        # Default: OFF

        @[JSON::Field(key: "diagnosticsMode")]
        getter diagnostics_mode : String?

        # The time the campaign expires, in seconds since epoch (January 1, 1970 at midnight UTC time).
        # Vehicle data isn't collected after the campaign expires. Default: 253402214400 (December 31, 9999,
        # 00:00:00 UTC)

        @[JSON::Field(key: "expiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiry_time : Time?

        # How long (in milliseconds) to collect raw data after a triggering event initiates the collection. If
        # it's not specified, 0 is used. Default: 0

        @[JSON::Field(key: "postTriggerCollectionDuration")]
        getter post_trigger_collection_duration : Int64?

        # A number indicating the priority of one campaign over another campaign for a certain vehicle or
        # fleet. A campaign with the lowest value is deployed to vehicles before any other campaigns. If it's
        # not specified, 0 is used. Default: 0

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # A list of information about signals to collect. If you upload a signal as a condition in a data
        # partition for a campaign, then those same signals must be included in signalsToCollect .

        @[JSON::Field(key: "signalsToCollect")]
        getter signals_to_collect : Array(Types::SignalInformation)?

        # A list of information about signals to fetch.

        @[JSON::Field(key: "signalsToFetch")]
        getter signals_to_fetch : Array(Types::SignalFetchInformation)?

        # Determines whether to store collected data after a vehicle lost a connection with the cloud. After a
        # connection is re-established, the data is automatically forwarded to Amazon Web Services IoT
        # FleetWise. If you want to store collected data when a vehicle loses connection with the cloud, use
        # TO_DISK . If it's not specified, OFF is used. Default: OFF

        @[JSON::Field(key: "spoolingMode")]
        getter spooling_mode : String?

        # The time, in milliseconds, to deliver a campaign after it was approved. If it's not specified, 0 is
        # used. Default: 0

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Metadata that can be used to manage the campaign.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @collection_scheme : Types::CollectionScheme,
          @name : String,
          @signal_catalog_arn : String,
          @target_arn : String,
          @compression : String? = nil,
          @data_destination_configs : Array(Types::DataDestinationConfig)? = nil,
          @data_extra_dimensions : Array(String)? = nil,
          @data_partitions : Array(Types::DataPartition)? = nil,
          @description : String? = nil,
          @diagnostics_mode : String? = nil,
          @expiry_time : Time? = nil,
          @post_trigger_collection_duration : Int64? = nil,
          @priority : Int32? = nil,
          @signals_to_collect : Array(Types::SignalInformation)? = nil,
          @signals_to_fetch : Array(Types::SignalFetchInformation)? = nil,
          @spooling_mode : String? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateCampaignResponse
        include JSON::Serializable

        # The ARN of the created campaign.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the created campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct CreateDecoderManifestRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vehicle model (model manifest).

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String

        # The unique name of the decoder manifest to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # Use default decoders for all unmapped signals in the model. You don't need to provide any detailed
        # decoding information. Access to certain Amazon Web Services IoT FleetWise features is currently
        # gated. For more information, see Amazon Web Services Region and feature availability in the Amazon
        # Web Services IoT FleetWise Developer Guide .

        @[JSON::Field(key: "defaultForUnmappedSignals")]
        getter default_for_unmapped_signals : String?

        # A brief description of the decoder manifest.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of information about available network interfaces.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # A list of information about signal decoders.

        @[JSON::Field(key: "signalDecoders")]
        getter signal_decoders : Array(Types::SignalDecoder)?

        # Metadata that can be used to manage the decoder manifest.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @model_manifest_arn : String,
          @name : String,
          @default_for_unmapped_signals : String? = nil,
          @description : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @signal_decoders : Array(Types::SignalDecoder)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateDecoderManifestResponse
        include JSON::Serializable

        # The ARN of the created decoder manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the created decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct CreateFleetRequest
        include JSON::Serializable

        # The unique ID of the fleet to create.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The Amazon Resource Name (ARN) of a signal catalog.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # A brief description of the fleet to create.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Metadata that can be used to manage the fleet.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @fleet_id : String,
          @signal_catalog_arn : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFleetResponse
        include JSON::Serializable

        # The ARN of the created fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the created fleet.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @arn : String,
          @id : String
        )
        end
      end


      struct CreateModelManifestRequest
        include JSON::Serializable

        # The name of the vehicle model to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of nodes, which are a general abstraction of signals.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(String)

        # The Amazon Resource Name (ARN) of a signal catalog.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # A brief description of the vehicle model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Metadata that can be used to manage the vehicle model.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @nodes : Array(String),
          @signal_catalog_arn : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateModelManifestResponse
        include JSON::Serializable

        # The ARN of the created vehicle model.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the created vehicle model.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct CreateSignalCatalogRequest
        include JSON::Serializable

        # The name of the signal catalog to create.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the signal catalog.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of information about nodes, which are a general abstraction of signals. For more information,
        # see the API data type.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::Node)?

        # Metadata that can be used to manage the signal catalog.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @nodes : Array(Types::Node)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateSignalCatalogResponse
        include JSON::Serializable

        # The ARN of the created signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the created signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct CreateStateTemplateRequest
        include JSON::Serializable

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the signal catalog associated with the state template.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # A list of signals from which data is collected. The state template properties contain the fully
        # qualified names of the signals.

        @[JSON::Field(key: "stateTemplateProperties")]
        getter state_template_properties : Array(String)

        # A list of vehicle attributes to associate with the payload published on the state template's MQTT
        # topic. (See Processing last known state vehicle data using MQTT messaging ). For example, if you add
        # Vehicle.Attributes.Make and Vehicle.Attributes.Model attributes, Amazon Web Services IoT FleetWise
        # will enrich the protobuf encoded payload with those attributes in the extraDimensions field.

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # A brief description of the state template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of vehicle attributes to associate with user properties of the messages published on the
        # state template's MQTT topic. (See Processing last known state vehicle data using MQTT messaging ).
        # For example, if you add Vehicle.Attributes.Make and Vehicle.Attributes.Model attributes, Amazon Web
        # Services IoT FleetWise will include these attributes as User Properties with the MQTT message.
        # Default: An empty array

        @[JSON::Field(key: "metadataExtraDimensions")]
        getter metadata_extra_dimensions : Array(String)?

        # Metadata that can be used to manage the state template.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @signal_catalog_arn : String,
          @state_template_properties : Array(String),
          @data_extra_dimensions : Array(String)? = nil,
          @description : String? = nil,
          @metadata_extra_dimensions : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateStateTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique ID of the state template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An HTTP error resulting from creating a vehicle.

      struct CreateVehicleError
        include JSON::Serializable

        # An HTTP error code.

        @[JSON::Field(key: "code")]
        getter code : String?

        # A description of the HTTP error.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the vehicle with the error.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end


      struct CreateVehicleRequest
        include JSON::Serializable

        # The ARN of a decoder manifest.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String

        # The Amazon Resource Name ARN of a vehicle model.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String

        # The unique ID of the vehicle to create.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # An option to create a new Amazon Web Services IoT thing when creating a vehicle, or to validate an
        # existing Amazon Web Services IoT thing as a vehicle. Default:

        @[JSON::Field(key: "associationBehavior")]
        getter association_behavior : String?

        # Static information about a vehicle in a key-value pair. For example: "engineType" : "1.3 L R2" To
        # use attributes with Campaigns or State Templates, you must include them using the request parameters
        # dataExtraDimensions and/or metadataExtraDimensions (for state templates only) when creating your
        # campaign/state template.

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Associate state templates with the vehicle. You can monitor the last known state of the vehicle in
        # near real time.

        @[JSON::Field(key: "stateTemplates")]
        getter state_templates : Array(Types::StateTemplateAssociation)?

        # Metadata that can be used to manage the vehicle.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @decoder_manifest_arn : String,
          @model_manifest_arn : String,
          @vehicle_name : String,
          @association_behavior : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @state_templates : Array(Types::StateTemplateAssociation)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about the vehicle to create.

      struct CreateVehicleRequestItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a decoder manifest associated with the vehicle to create.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String

        # The ARN of the vehicle model (model manifest) to create the vehicle from.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String

        # The unique ID of the vehicle to create.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # An option to create a new Amazon Web Services IoT thing when creating a vehicle, or to validate an
        # existing thing as a vehicle.

        @[JSON::Field(key: "associationBehavior")]
        getter association_behavior : String?

        # Static information about a vehicle in a key-value pair. For example: "engine Type" : "v6"

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Associate state templates to track the state of the vehicle. State templates determine which signal
        # updates the vehicle sends to the cloud.

        @[JSON::Field(key: "stateTemplates")]
        getter state_templates : Array(Types::StateTemplateAssociation)?

        # Metadata which can be used to manage the vehicle.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @decoder_manifest_arn : String,
          @model_manifest_arn : String,
          @vehicle_name : String,
          @association_behavior : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @state_templates : Array(Types::StateTemplateAssociation)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateVehicleResponse
        include JSON::Serializable

        # The ARN of the created vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ARN of a created or validated Amazon Web Services IoT thing.

        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The unique ID of the created vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @arn : String? = nil,
          @thing_arn : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end

      # Information about a created vehicle.

      struct CreateVehicleResponseItem
        include JSON::Serializable

        # The ARN of the created vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ARN of a created or validated Amazon Web Services IoT thing.

        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        # The unique ID of the vehicle to create.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @arn : String? = nil,
          @thing_arn : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end

      # Represents a custom network interface as defined by the customer. Access to certain Amazon Web
      # Services IoT FleetWise features is currently gated. For more information, see Amazon Web Services
      # Region and feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct CustomDecodingInterface
        include JSON::Serializable

        # The name of the interface.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Information about signals using a custom decoding protocol as defined by the customer. Access to
      # certain Amazon Web Services IoT FleetWise features is currently gated. For more information, see
      # Amazon Web Services Region and feature availability in the Amazon Web Services IoT FleetWise
      # Developer Guide .

      struct CustomDecodingSignal
        include JSON::Serializable

        # The ID of the signal.

        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Represents a member of the complex data structure. The data type of the property can be either
      # primitive or another struct .

      struct CustomProperty
        include JSON::Serializable

        # The data type for the custom property.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The fully qualified name of the custom property. For example, the fully qualified name of a custom
        # property might be ComplexDataTypes.VehicleDataTypes.SVMCamera.FPS .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # Indicates whether the property is binary data.

        @[JSON::Field(key: "dataEncoding")]
        getter data_encoding : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of the custom property.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The fully qualified name of the struct node for the custom property if the data type of the custom
        # property is Struct or StructArray .

        @[JSON::Field(key: "structFullyQualifiedName")]
        getter struct_fully_qualified_name : String?

        def initialize(
          @data_type : String,
          @fully_qualified_name : String,
          @comment : String? = nil,
          @data_encoding : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil,
          @struct_fully_qualified_name : String? = nil
        )
        end
      end

      # The custom structure represents a complex or higher-order data structure.

      struct CustomStruct
        include JSON::Serializable

        # The fully qualified name of the custom structure. For example, the fully qualified name of a custom
        # structure might be ComplexDataTypes.VehicleDataTypes.SVMCamera .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of the custom structure.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @fully_qualified_name : String,
          @comment : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil
        )
        end
      end

      # The destination where the campaign sends data. You can send data to an MQTT topic, or store it in
      # Amazon S3 or Amazon Timestream.

      struct DataDestinationConfig
        include JSON::Serializable

        # The MQTT topic to which the Amazon Web Services IoT FleetWise campaign routes data. Access to
        # certain Amazon Web Services IoT FleetWise features is currently gated. For more information, see
        # Amazon Web Services Region and feature availability in the Amazon Web Services IoT FleetWise
        # Developer Guide .

        @[JSON::Field(key: "mqttTopicConfig")]
        getter mqtt_topic_config : Types::MqttTopicConfig?

        # The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign sends data.

        @[JSON::Field(key: "s3Config")]
        getter s3_config : Types::S3Config?

        # The Amazon Timestream table where the campaign sends data.

        @[JSON::Field(key: "timestreamConfig")]
        getter timestream_config : Types::TimestreamConfig?

        def initialize(
          @mqtt_topic_config : Types::MqttTopicConfig? = nil,
          @s3_config : Types::S3Config? = nil,
          @timestream_config : Types::TimestreamConfig? = nil
        )
        end
      end

      # The configuration for signal data storage and upload options. You can only specify these options
      # when the campaign's spooling mode is TO_DISK . Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct DataPartition
        include JSON::Serializable

        # The ID of the data partition. The data partition ID must be unique within a campaign. You can
        # establish a data partition as the default partition for a campaign by using default as the ID.

        @[JSON::Field(key: "id")]
        getter id : String

        # The storage options for a data partition.

        @[JSON::Field(key: "storageOptions")]
        getter storage_options : Types::DataPartitionStorageOptions

        # The upload options for the data partition.

        @[JSON::Field(key: "uploadOptions")]
        getter upload_options : Types::DataPartitionUploadOptions?

        def initialize(
          @id : String,
          @storage_options : Types::DataPartitionStorageOptions,
          @upload_options : Types::DataPartitionUploadOptions? = nil
        )
        end
      end

      # Size, time, and location options for the data partition.

      struct DataPartitionStorageOptions
        include JSON::Serializable

        # The maximum storage size of the data stored in the data partition. Newer data overwrites older data
        # when the partition reaches the maximum size.

        @[JSON::Field(key: "maximumSize")]
        getter maximum_size : Types::StorageMaximumSize

        # The amount of time that data in this partition will be kept on disk. After the designated amount of
        # time passes, the data can be removed, but it's not guaranteed to be removed. Before the time
        # expires, data in this partition can still be deleted if the partition reaches its configured maximum
        # size. Newer data will overwrite older data when the partition reaches the maximum size.

        @[JSON::Field(key: "minimumTimeToLive")]
        getter minimum_time_to_live : Types::StorageMinimumTimeToLive

        # The folder name for the data partition under the campaign storage folder.

        @[JSON::Field(key: "storageLocation")]
        getter storage_location : String

        def initialize(
          @maximum_size : Types::StorageMaximumSize,
          @minimum_time_to_live : Types::StorageMinimumTimeToLive,
          @storage_location : String
        )
        end
      end

      # The upload options for the data partition. If upload options are specified, you must also specify
      # storage options. See DataPartitionStorageOptions . Access to certain Amazon Web Services IoT
      # FleetWise features is currently gated. For more information, see Amazon Web Services Region and
      # feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct DataPartitionUploadOptions
        include JSON::Serializable

        # The logical expression used to recognize what data to collect. For example,
        # $variable.`Vehicle.OutsideAirTemperature` &gt;= 105.0 .

        @[JSON::Field(key: "expression")]
        getter expression : String

        # The version of the condition language. Defaults to the most recent condition language version.

        @[JSON::Field(key: "conditionLanguageVersion")]
        getter condition_language_version : Int32?

        def initialize(
          @expression : String,
          @condition_language_version : Int32? = nil
        )
        end
      end

      # Information about a created decoder manifest. You can use the API operation to return this
      # information about multiple decoder manifests.

      struct DecoderManifestSummary
        include JSON::Serializable

        # The time the decoder manifest was created in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The time the decoder manifest was last updated in seconds since epoch (January 1, 1970 at midnight
        # UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The ARN of a vehicle model (model manifest) associated with the decoder manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A brief description of the decoder manifest.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detailed message for the decoder manifest. When a decoder manifest is in an INVALID status, the
        # message contains detailed reason and help information.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ARN of a vehicle model (model manifest) associated with the decoder manifest.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # The name of the decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the decoder manifest. If the status is ACTIVE , the decoder manifest can't be edited.
        # If the status is marked DRAFT , you can edit the decoder manifest.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time,
          @last_modification_time : Time,
          @arn : String? = nil,
          @description : String? = nil,
          @message : String? = nil,
          @model_manifest_arn : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request couldn't be completed because it contains signal decoders with one or more validation
      # errors.

      struct DecoderManifestValidationException
        include JSON::Serializable

        # The request couldn't be completed because of invalid network interfaces in the request.

        @[JSON::Field(key: "invalidNetworkInterfaces")]
        getter invalid_network_interfaces : Array(Types::InvalidNetworkInterface)?

        # The request couldn't be completed because of invalid signals in the request.

        @[JSON::Field(key: "invalidSignals")]
        getter invalid_signals : Array(Types::InvalidSignalDecoder)?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_network_interfaces : Array(Types::InvalidNetworkInterface)? = nil,
          @invalid_signals : Array(Types::InvalidSignalDecoder)? = nil,
          @message : String? = nil
        )
        end
      end


      struct DeleteCampaignRequest
        include JSON::Serializable

        # The name of the campaign to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteCampaignResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted campaign. The ARN isn’t returned if a campaign doesn’t
        # exist.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the deleted campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteDecoderManifestRequest
        include JSON::Serializable

        # The name of the decoder manifest to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteDecoderManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted decoder manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct DeleteFleetRequest
        include JSON::Serializable

        # The ID of the fleet to delete.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct DeleteFleetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the deleted fleet.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct DeleteModelManifestRequest
        include JSON::Serializable

        # The name of the model manifest to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteModelManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted model manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted model manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct DeleteSignalCatalogRequest
        include JSON::Serializable

        # The name of the signal catalog to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteSignalCatalogResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the deleted signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct DeleteStateTemplateRequest
        include JSON::Serializable

        # The unique ID of the state template.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteStateTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique ID of the state template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteVehicleRequest
        include JSON::Serializable

        # The ID of the vehicle to delete.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        def initialize(
          @vehicle_name : String
        )
        end
      end


      struct DeleteVehicleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The ID of the deleted vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        def initialize(
          @arn : String,
          @vehicle_name : String
        )
        end
      end


      struct DisassociateVehicleFleetRequest
        include JSON::Serializable

        # The unique ID of a fleet.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The unique ID of the vehicle to disassociate from the fleet.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        def initialize(
          @fleet_id : String,
          @vehicle_name : String
        )
        end
      end


      struct DisassociateVehicleFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a fleet. You can use the API operation to return this information about multiple
      # fleets.

      struct FleetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the fleet was created, in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The unique ID of the fleet.

        @[JSON::Field(key: "id")]
        getter id : String

        # The ARN of the signal catalog associated with the fleet.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # A brief description of the fleet.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the fleet was last updated in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @signal_catalog_arn : String,
          @description : String? = nil,
          @last_modification_time : Time? = nil
        )
        end
      end

      # Vehicle Signal Specification (VSS) is a precise language used to describe and model signals in
      # vehicle networks. The JSON file collects signal specificiations in a VSS format.

      struct FormattedVss
        include JSON::Serializable

        # Provides the VSS in JSON format.

        @[JSON::Field(key: "vssJson")]
        getter vss_json : String?

        def initialize(
          @vss_json : String? = nil
        )
        end
      end


      struct GetCampaignRequest
        include JSON::Serializable

        # The name of the campaign to retrieve information about.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetCampaignResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about the data collection scheme associated with the campaign.

        @[JSON::Field(key: "collectionScheme")]
        getter collection_scheme : Types::CollectionScheme?

        # Whether to compress signals before transmitting data to Amazon Web Services IoT FleetWise. If OFF is
        # specified, the signals aren't compressed. If it's not specified, SNAPPY is used.

        @[JSON::Field(key: "compression")]
        getter compression : String?

        # The time the campaign was created in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The destination where the campaign sends data. You can send data to an MQTT topic, or store it in
        # Amazon S3 or Amazon Timestream. MQTT is the publish/subscribe messaging protocol used by Amazon Web
        # Services IoT to communicate with your devices. Amazon S3 optimizes the cost of data storage and
        # provides additional mechanisms to use vehicle data, such as data lakes, centralized data storage,
        # data processing pipelines, and analytics. You can use Amazon Timestream to access and analyze time
        # series data, and Timestream to query vehicle data so that you can identify trends and patterns.

        @[JSON::Field(key: "dataDestinationConfigs")]
        getter data_destination_configs : Array(Types::DataDestinationConfig)?

        # A list of vehicle attributes associated with the campaign.

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # The data partitions associated with the signals collected from the vehicle.

        @[JSON::Field(key: "dataPartitions")]
        getter data_partitions : Array(Types::DataPartition)?

        # The description of the campaign.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Option for a vehicle to send diagnostic trouble codes to Amazon Web Services IoT FleetWise.

        @[JSON::Field(key: "diagnosticsMode")]
        getter diagnostics_mode : String?

        # The time the campaign expires, in seconds since epoch (January 1, 1970 at midnight UTC time).
        # Vehicle data won't be collected after the campaign expires.

        @[JSON::Field(key: "expiryTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiry_time : Time?

        # The last time the campaign was modified.

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The name of the campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        # How long (in seconds) to collect raw data after a triggering event initiates the collection.

        @[JSON::Field(key: "postTriggerCollectionDuration")]
        getter post_trigger_collection_duration : Int64?

        # A number indicating the priority of one campaign over another campaign for a certain vehicle or
        # fleet. A campaign with the lowest value is deployed to vehicles before any other campaigns.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The ARN of a signal catalog.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        # Information about a list of signals to collect data on.

        @[JSON::Field(key: "signalsToCollect")]
        getter signals_to_collect : Array(Types::SignalInformation)?

        # Information about a list of signals to fetch data from.

        @[JSON::Field(key: "signalsToFetch")]
        getter signals_to_fetch : Array(Types::SignalFetchInformation)?

        # Whether to store collected data after a vehicle lost a connection with the cloud. After a connection
        # is re-established, the data is automatically forwarded to Amazon Web Services IoT FleetWise.

        @[JSON::Field(key: "spoolingMode")]
        getter spooling_mode : String?

        # The time, in milliseconds, to deliver a campaign after it was approved.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The state of the campaign. The status can be one of: CREATING , WAITING_FOR_APPROVAL , RUNNING , and
        # SUSPENDED .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ARN of the vehicle or the fleet targeted by the campaign.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        def initialize(
          @arn : String? = nil,
          @collection_scheme : Types::CollectionScheme? = nil,
          @compression : String? = nil,
          @creation_time : Time? = nil,
          @data_destination_configs : Array(Types::DataDestinationConfig)? = nil,
          @data_extra_dimensions : Array(String)? = nil,
          @data_partitions : Array(Types::DataPartition)? = nil,
          @description : String? = nil,
          @diagnostics_mode : String? = nil,
          @expiry_time : Time? = nil,
          @last_modification_time : Time? = nil,
          @name : String? = nil,
          @post_trigger_collection_duration : Int64? = nil,
          @priority : Int32? = nil,
          @signal_catalog_arn : String? = nil,
          @signals_to_collect : Array(Types::SignalInformation)? = nil,
          @signals_to_fetch : Array(Types::SignalFetchInformation)? = nil,
          @spooling_mode : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @target_arn : String? = nil
        )
        end
      end


      struct GetDecoderManifestRequest
        include JSON::Serializable

        # The name of the decoder manifest to retrieve information about.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetDecoderManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the decoder manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the decoder manifest was created in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The time the decoder manifest was last updated in seconds since epoch (January 1, 1970 at midnight
        # UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The name of the decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the decoder manifest.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The detailed message for the decoder manifest. When a decoder manifest is in an INVALID status, the
        # message contains detailed reason and help information.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ARN of a vehicle model (model manifest) associated with the decoder manifest.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # The state of the decoder manifest. If the status is ACTIVE , the decoder manifest can't be edited.
        # If the status is marked DRAFT , you can edit the decoder manifest.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @last_modification_time : Time,
          @name : String,
          @description : String? = nil,
          @message : String? = nil,
          @model_manifest_arn : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetEncryptionConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetEncryptionConfigurationResponse
        include JSON::Serializable

        # The encryption status.

        @[JSON::Field(key: "encryptionStatus")]
        getter encryption_status : String

        # The type of encryption. Set to KMS_BASED_ENCRYPTION to use a KMS key that you own and manage. Set to
        # FLEETWISE_DEFAULT_ENCRYPTION to use an Amazon Web Services managed key that is owned by the Amazon
        # Web Services IoT FleetWise service account.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The time when encryption was configured in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The error message that describes why encryption settings couldn't be configured, if applicable.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of the KMS key that is used for encryption.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The time when encryption was last updated in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        def initialize(
          @encryption_status : String,
          @encryption_type : String,
          @creation_time : Time? = nil,
          @error_message : String? = nil,
          @kms_key_id : String? = nil,
          @last_modification_time : Time? = nil
        )
        end
      end


      struct GetFleetRequest
        include JSON::Serializable

        # The ID of the fleet to retrieve information about.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end


      struct GetFleetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the fleet was created in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The ID of the fleet.

        @[JSON::Field(key: "id")]
        getter id : String

        # The time the fleet was last updated, in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The ARN of a signal catalog associated with the fleet.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String

        # A brief description of the fleet.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @id : String,
          @last_modification_time : Time,
          @signal_catalog_arn : String,
          @description : String? = nil
        )
        end
      end


      struct GetLoggingOptionsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetLoggingOptionsResponse
        include JSON::Serializable

        # Returns information about log delivery to Amazon CloudWatch Logs.

        @[JSON::Field(key: "cloudWatchLogDelivery")]
        getter cloud_watch_log_delivery : Types::CloudWatchLogDeliveryOptions

        def initialize(
          @cloud_watch_log_delivery : Types::CloudWatchLogDeliveryOptions
        )
        end
      end


      struct GetModelManifestRequest
        include JSON::Serializable

        # The name of the vehicle model to retrieve information about.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetModelManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vehicle model.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the vehicle model was created, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The last time the vehicle model was modified.

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The name of the vehicle model.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the vehicle model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the signal catalog associated with the vehicle model.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        # The state of the vehicle model. If the status is ACTIVE , the vehicle model can't be edited. You can
        # edit the vehicle model if the status is marked DRAFT .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @last_modification_time : Time,
          @name : String,
          @description : String? = nil,
          @signal_catalog_arn : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetRegisterAccountStatusRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetRegisterAccountStatusResponse
        include JSON::Serializable

        # The status of registering your account and resources. The status can be one of: REGISTRATION_SUCCESS
        # - The Amazon Web Services resource is successfully registered. REGISTRATION_PENDING - Amazon Web
        # Services IoT FleetWise is processing the registration request. This process takes approximately five
        # minutes to complete. REGISTRATION_FAILURE - Amazon Web Services IoT FleetWise can't register the AWS
        # resource. Try again later.

        @[JSON::Field(key: "accountStatus")]
        getter account_status : String

        # The time the account was registered, in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The unique ID of the Amazon Web Services account, provided at account creation.

        @[JSON::Field(key: "customerAccountId")]
        getter customer_account_id : String

        # Information about the registered IAM resources or errors, if any.

        @[JSON::Field(key: "iamRegistrationResponse")]
        getter iam_registration_response : Types::IamRegistrationResponse

        # The time this registration was last updated, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # Information about the registered Amazon Timestream resources or errors, if any.

        @[JSON::Field(key: "timestreamRegistrationResponse")]
        getter timestream_registration_response : Types::TimestreamRegistrationResponse?

        def initialize(
          @account_status : String,
          @creation_time : Time,
          @customer_account_id : String,
          @iam_registration_response : Types::IamRegistrationResponse,
          @last_modification_time : Time,
          @timestream_registration_response : Types::TimestreamRegistrationResponse? = nil
        )
        end
      end


      struct GetSignalCatalogRequest
        include JSON::Serializable

        # The name of the signal catalog to retrieve information about.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct GetSignalCatalogResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the signal catalog was created in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The last time the signal catalog was modified.

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The name of the signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the signal catalog.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The total number of network nodes specified in a signal catalog.

        @[JSON::Field(key: "nodeCounts")]
        getter node_counts : Types::NodeCounts?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @last_modification_time : Time,
          @name : String,
          @description : String? = nil,
          @node_counts : Types::NodeCounts? = nil
        )
        end
      end


      struct GetStateTemplateRequest
        include JSON::Serializable

        # The unique ID of the state template.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetStateTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the state template was created in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A list of vehicle attributes associated with the payload published on the state template's MQTT
        # topic. Default: An empty array

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # A brief description of the state template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique ID of the state template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time the state template was last updated in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # A list of vehicle attributes to associate with user properties of the messages published on the
        # state template's MQTT topic. Default: An empty array

        @[JSON::Field(key: "metadataExtraDimensions")]
        getter metadata_extra_dimensions : Array(String)?

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the signal catalog associated with the state template.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        # A list of signals from which data is collected. The state template properties contain the fully
        # qualified names of the signals.

        @[JSON::Field(key: "stateTemplateProperties")]
        getter state_template_properties : Array(String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @data_extra_dimensions : Array(String)? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modification_time : Time? = nil,
          @metadata_extra_dimensions : Array(String)? = nil,
          @name : String? = nil,
          @signal_catalog_arn : String? = nil,
          @state_template_properties : Array(String)? = nil
        )
        end
      end


      struct GetVehicleRequest
        include JSON::Serializable

        # The ID of the vehicle to retrieve information about.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        def initialize(
          @vehicle_name : String
        )
        end
      end


      struct GetVehicleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vehicle to retrieve information about.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Static information about a vehicle in a key-value pair. For example: "engineType" : "1.3 L R2"

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The time the vehicle was created in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The ARN of a decoder manifest associated with the vehicle.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String?

        # The time the vehicle was last updated in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The ARN of a vehicle model (model manifest) associated with the vehicle.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # State templates associated with the vehicle.

        @[JSON::Field(key: "stateTemplates")]
        getter state_templates : Array(Types::StateTemplateAssociation)?

        # The ID of the vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @arn : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @creation_time : Time? = nil,
          @decoder_manifest_arn : String? = nil,
          @last_modification_time : Time? = nil,
          @model_manifest_arn : String? = nil,
          @state_templates : Array(Types::StateTemplateAssociation)? = nil,
          @vehicle_name : String? = nil
        )
        end
      end


      struct GetVehicleStatusRequest
        include JSON::Serializable

        # The ID of the vehicle to retrieve information about.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # The maximum number of items to return, between 1 and 100, inclusive. This parameter is only
        # supported for resources of type CAMPAIGN .

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value. This
        # parameter is only supported for resources of type CAMPAIGN .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @vehicle_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetVehicleStatusResponse
        include JSON::Serializable

        # Lists information about the state of the vehicle with deployed campaigns.

        @[JSON::Field(key: "campaigns")]
        getter campaigns : Array(Types::VehicleStatus)?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @campaigns : Array(Types::VehicleStatus)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about registering an Identity and Access Management (IAM) resource so Amazon Web
      # Services IoT FleetWise edge agent software can transfer your vehicle data to Amazon Timestream.

      struct IamRegistrationResponse
        include JSON::Serializable

        # The status of registering your IAM resource. The status can be one of REGISTRATION_SUCCESS ,
        # REGISTRATION_PENDING , REGISTRATION_FAILURE .

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The Amazon Resource Name (ARN) of the IAM role to register.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # A message associated with a registration error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @registration_status : String,
          @role_arn : String,
          @error_message : String? = nil
        )
        end
      end

      # The IAM resource that enables Amazon Web Services IoT FleetWise edge agent software to send data to
      # Amazon Timestream. For more information, see IAM roles in the Identity and Access Management User
      # Guide .

      struct IamResources
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM resource that allows Amazon Web Services IoT FleetWise to
        # send data to Amazon Timestream. For example, arn:aws:iam::123456789012:role/SERVICE-ROLE-ARN .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @role_arn : String
        )
        end
      end


      struct ImportDecoderManifestRequest
        include JSON::Serializable

        # The name of the decoder manifest to import.

        @[JSON::Field(key: "name")]
        getter name : String

        # The file to load into an Amazon Web Services account.

        @[JSON::Field(key: "networkFileDefinitions")]
        getter network_file_definitions : Array(Types::NetworkFileDefinition)

        def initialize(
          @name : String,
          @network_file_definitions : Array(Types::NetworkFileDefinition)
        )
        end
      end


      struct ImportDecoderManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the decoder manifest that was imported.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the imported decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct ImportSignalCatalogRequest
        include JSON::Serializable

        # The name of the signal catalog to import.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the signal catalog.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Metadata that can be used to manage the signal catalog.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The contents of the Vehicle Signal Specification (VSS) configuration. VSS is a precise language used
        # to describe and model signals in vehicle networks.

        @[JSON::Field(key: "vss")]
        getter vss : Types::FormattedVss?

        def initialize(
          @name : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vss : Types::FormattedVss? = nil
        )
        end
      end


      struct ImportSignalCatalogResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the imported signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the imported signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end

      # The request couldn't be completed because the server temporarily failed.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the command.

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # A reason a vehicle network interface isn't valid.

      struct InvalidNetworkInterface
        include JSON::Serializable

        # The ID of the interface that isn't valid.

        @[JSON::Field(key: "interfaceId")]
        getter interface_id : String?

        # A message about why the interface isn't valid.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @interface_id : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The specified node type doesn't match the expected node type for a node. You can specify the node
      # type as branch, sensor, actuator, or attribute.

      struct InvalidNodeException
        include JSON::Serializable

        # The specified node type isn't valid.

        @[JSON::Field(key: "invalidNodes")]
        getter invalid_nodes : Array(Types::Node)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # The reason the node validation failed.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @invalid_nodes : Array(Types::Node)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A reason that a signal isn't valid.

      struct InvalidSignal
        include JSON::Serializable

        # The name of the signal that isn't valid.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A message about why the signal isn't valid.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A reason that a signal decoder isn't valid.

      struct InvalidSignalDecoder
        include JSON::Serializable

        # The possible cause for the invalid signal decoder.

        @[JSON::Field(key: "hint")]
        getter hint : String?

        # The name of a signal decoder that isn't valid.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A message about why the signal decoder isn't valid.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @hint : String? = nil,
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The request couldn't be completed because it contains signals that aren't valid.

      struct InvalidSignalsException
        include JSON::Serializable

        # The signals which caused the exception.

        @[JSON::Field(key: "invalidSignals")]
        getter invalid_signals : Array(Types::InvalidSignal)?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @invalid_signals : Array(Types::InvalidSignal)? = nil,
          @message : String? = nil
        )
        end
      end

      # A service quota was exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that was exceeded.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that was exceeded.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct ListCampaignsRequest
        include JSON::Serializable

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: campaign
        # name, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional parameter to filter the results by the status of each created campaign in your account.
        # The status can be one of: CREATING , WAITING_FOR_APPROVAL , RUNNING , or SUSPENDED .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListCampaignsResponse
        include JSON::Serializable

        # A summary of information about each campaign.

        @[JSON::Field(key: "campaignSummaries")]
        getter campaign_summaries : Array(Types::CampaignSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @campaign_summaries : Array(Types::CampaignSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDecoderManifestNetworkInterfacesRequest
        include JSON::Serializable

        # The name of the decoder manifest to list information about.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDecoderManifestNetworkInterfacesResponse
        include JSON::Serializable

        # A list of information about network interfaces.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDecoderManifestSignalsRequest
        include JSON::Serializable

        # The name of the decoder manifest to list information about.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDecoderManifestSignalsResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Information about a list of signals to decode.

        @[JSON::Field(key: "signalDecoders")]
        getter signal_decoders : Array(Types::SignalDecoder)?

        def initialize(
          @next_token : String? = nil,
          @signal_decoders : Array(Types::SignalDecoder)? = nil
        )
        end
      end


      struct ListDecoderManifestsRequest
        include JSON::Serializable

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: decoder
        # manifest name, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon Resource Name (ARN) of a vehicle model (model manifest) associated with the decoder
        # manifest.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @model_manifest_arn : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDecoderManifestsResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about each decoder manifest.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::DecoderManifestSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::DecoderManifestSummary)? = nil
        )
        end
      end


      struct ListFleetsForVehicleRequest
        include JSON::Serializable

        # The ID of the vehicle to retrieve information about.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @vehicle_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetsForVehicleResponse
        include JSON::Serializable

        # A list of fleet IDs that the vehicle is associated with.

        @[JSON::Field(key: "fleets")]
        getter fleets : Array(String)?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleets : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetsRequest
        include JSON::Serializable

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: fleet
        # ID, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFleetsResponse
        include JSON::Serializable

        # A list of information for each fleet.

        @[JSON::Field(key: "fleetSummaries")]
        getter fleet_summaries : Array(Types::FleetSummary)?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleet_summaries : Array(Types::FleetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelManifestNodesRequest
        include JSON::Serializable

        # The name of the vehicle model to list information about.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListModelManifestNodesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about nodes.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::Node)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::Node)? = nil
        )
        end
      end


      struct ListModelManifestsRequest
        include JSON::Serializable

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: model
        # manifest name, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of a signal catalog. If you specify a signal catalog, only the vehicle models associated
        # with it are returned.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        def initialize(
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signal_catalog_arn : String? = nil
        )
        end
      end


      struct ListModelManifestsResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about vehicle models.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::ModelManifestSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::ModelManifestSummary)? = nil
        )
        end
      end


      struct ListSignalCatalogNodesRequest
        include JSON::Serializable

        # The name of the signal catalog to list information about.

        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The type of node in the signal catalog.

        @[JSON::Field(key: "signalNodeType")]
        getter signal_node_type : String?

        def initialize(
          @name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @signal_node_type : String? = nil
        )
        end
      end


      struct ListSignalCatalogNodesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about nodes.

        @[JSON::Field(key: "nodes")]
        getter nodes : Array(Types::Node)?

        def initialize(
          @next_token : String? = nil,
          @nodes : Array(Types::Node)? = nil
        )
        end
      end


      struct ListSignalCatalogsRequest
        include JSON::Serializable

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSignalCatalogsResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about each signal catalog.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::SignalCatalogSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::SignalCatalogSummary)? = nil
        )
        end
      end


      struct ListStateTemplatesRequest
        include JSON::Serializable

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: state
        # template ID, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStateTemplatesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of information about each state template.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::StateTemplateSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::StateTemplateSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListVehiclesInFleetRequest
        include JSON::Serializable

        # The ID of a fleet.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleet_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVehiclesInFleetResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of vehicles associated with the fleet.

        @[JSON::Field(key: "vehicles")]
        getter vehicles : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @vehicles : Array(String)? = nil
        )
        end
      end


      struct ListVehiclesRequest
        include JSON::Serializable

        # The fully qualified names of the attributes. You can use this optional parameter to list the
        # vehicles containing all the attributes in the request. For example, attributeNames could be "
        # Vehicle.Body.Engine.Type, Vehicle.Color " and the corresponding attributeValues could be " 1.3 L R2,
        # Blue " . In this case, the API will filter vehicles with an attribute name Vehicle.Body.Engine.Type
        # that contains a value of 1.3 L R2 AND an attribute name Vehicle.Color that contains a value of "
        # Blue ". A request must contain unique values for the attributeNames filter and the matching number
        # of attributeValues filters to return the subset of vehicles that match the attributes filter
        # condition.

        @[JSON::Field(key: "attributeNames")]
        getter attribute_names : Array(String)?

        # Static information about a vehicle attribute value in string format. You can use this optional
        # parameter in conjunction with attributeNames to list the vehicles containing all the attributeValues
        # corresponding to the attributeNames filter. For example, attributeValues could be " 1.3 L R2, Blue "
        # and the corresponding attributeNames filter could be " Vehicle.Body.Engine.Type, Vehicle.Color ". In
        # this case, the API will filter vehicles with attribute name Vehicle.Body.Engine.Type that contains a
        # value of 1.3 L R2 AND an attribute name Vehicle.Color that contains a value of " Blue ". A request
        # must contain unique values for the attributeNames filter and the matching number of attributeValues
        # filter to return the subset of vehicles that match the attributes filter condition.

        @[JSON::Field(key: "attributeValues")]
        getter attribute_values : Array(String)?

        # When you set the listResponseScope parameter to METADATA_ONLY , the list response includes: vehicle
        # name, Amazon Resource Name (ARN), creation time, and last modification time.

        @[JSON::Field(key: "listResponseScope")]
        getter list_response_scope : String?

        # The maximum number of items to return, between 1 and 100, inclusive.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The Amazon Resource Name (ARN) of a vehicle model (model manifest). You can use this optional
        # parameter to list only the vehicles created from a certain vehicle model.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # A pagination token for the next set of results. If the results of a search are large, only a portion
        # of the results are returned, and a nextToken pagination token is returned in the response. To
        # retrieve the next set of results, reissue the search request and include the returned token. When
        # all results have been returned, the response does not contain a pagination token value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attribute_names : Array(String)? = nil,
          @attribute_values : Array(String)? = nil,
          @list_response_scope : String? = nil,
          @max_results : Int32? = nil,
          @model_manifest_arn : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVehiclesResponse
        include JSON::Serializable

        # The token to retrieve the next set of results, or null if there are no more results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of vehicles and information about them.

        @[JSON::Field(key: "vehicleSummaries")]
        getter vehicle_summaries : Array(Types::VehicleSummary)?

        def initialize(
          @next_token : String? = nil,
          @vehicle_summaries : Array(Types::VehicleSummary)? = nil
        )
        end
      end

      # The decoding information for a specific message which support higher order data types.

      struct MessageSignal
        include JSON::Serializable

        # The structured message for the message signal. It can be defined with either a
        # primitiveMessageDefinition , structuredMessageListDefinition , or structuredMessageDefinition
        # recursively.

        @[JSON::Field(key: "structuredMessage")]
        getter structured_message : Types::StructuredMessage

        # The topic name for the message signal. It corresponds to topics in ROS 2.

        @[JSON::Field(key: "topicName")]
        getter topic_name : String

        def initialize(
          @structured_message : Types::StructuredMessage,
          @topic_name : String
        )
        end
      end

      # Information about a vehicle model (model manifest). You can use the API operation to return this
      # information about multiple vehicle models.

      struct ModelManifestSummary
        include JSON::Serializable

        # The time the vehicle model was created, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The time the vehicle model was last updated, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The Amazon Resource Name (ARN) of the vehicle model.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A brief description of the vehicle model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the vehicle model.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the signal catalog associated with the vehicle model.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        # The state of the vehicle model. If the status is ACTIVE , the vehicle model can't be edited. If the
        # status is DRAFT , you can edit the vehicle model.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @creation_time : Time,
          @last_modification_time : Time,
          @arn : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @signal_catalog_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The MQTT topic to which the Amazon Web Services IoT FleetWise campaign routes data. For more
      # information, see Device communication protocols in the Amazon Web Services IoT Core Developer Guide
      # . Access to certain Amazon Web Services IoT FleetWise features is currently gated. For more
      # information, see Amazon Web Services Region and feature availability in the Amazon Web Services IoT
      # FleetWise Developer Guide .

      struct MqttTopicConfig
        include JSON::Serializable

        # The ARN of the role that grants Amazon Web Services IoT FleetWise permission to access and act on
        # messages sent to the MQTT topic.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The ARN of the MQTT topic.

        @[JSON::Field(key: "mqttTopicArn")]
        getter mqtt_topic_arn : String

        def initialize(
          @execution_role_arn : String,
          @mqtt_topic_arn : String
        )
        end
      end

      # Specifications for defining a vehicle network.

      struct NetworkFileDefinition
        include JSON::Serializable

        # Information, including CAN DBC files, about the configurations used to create a decoder manifest.

        @[JSON::Field(key: "canDbc")]
        getter can_dbc : Types::CanDbcDefinition?

        def initialize(
          @can_dbc : Types::CanDbcDefinition? = nil
        )
        end
      end

      # Represents a node and its specifications in an in-vehicle communication network. All signal decoders
      # must be associated with a network node. To return this information about all the network interfaces
      # specified in a decoder manifest, use the API operation.

      struct NetworkInterface
        include JSON::Serializable

        # The ID of the network interface.

        @[JSON::Field(key: "interfaceId")]
        getter interface_id : String

        # The network protocol for the vehicle. For example, CAN_SIGNAL specifies a protocol that defines how
        # data is communicated between electronic control units (ECUs). OBD_SIGNAL specifies a protocol that
        # defines how self-diagnostic data is communicated between ECUs.

        @[JSON::Field(key: "type")]
        getter type : String

        # Information about a network interface specified by the Controller Area Network (CAN) protocol.

        @[JSON::Field(key: "canInterface")]
        getter can_interface : Types::CanInterface?

        # Information about a custom network interface .

        @[JSON::Field(key: "customDecodingInterface")]
        getter custom_decoding_interface : Types::CustomDecodingInterface?

        # Information about a network interface specified by the on-board diagnostic (OBD) II protocol.

        @[JSON::Field(key: "obdInterface")]
        getter obd_interface : Types::ObdInterface?

        # The vehicle middleware defined as a type of network interface. Examples of vehicle middleware
        # include ROS2 and SOME/IP .

        @[JSON::Field(key: "vehicleMiddleware")]
        getter vehicle_middleware : Types::VehicleMiddleware?

        def initialize(
          @interface_id : String,
          @type : String,
          @can_interface : Types::CanInterface? = nil,
          @custom_decoding_interface : Types::CustomDecodingInterface? = nil,
          @obd_interface : Types::ObdInterface? = nil,
          @vehicle_middleware : Types::VehicleMiddleware? = nil
        )
        end
      end

      # A general abstraction of a signal. A node can be specified as an actuator, attribute, branch, or
      # sensor.

      struct Node
        include JSON::Serializable

        # Information about a node specified as an actuator. An actuator is a digital representation of a
        # vehicle device.

        @[JSON::Field(key: "actuator")]
        getter actuator : Types::Actuator?

        # Information about a node specified as an attribute. An attribute represents static information about
        # a vehicle.

        @[JSON::Field(key: "attribute")]
        getter attribute : Types::Attribute?

        # Information about a node specified as a branch. A group of signals that are defined in a
        # hierarchical structure.

        @[JSON::Field(key: "branch")]
        getter branch : Types::Branch?

        # Represents a member of the complex data structure. The datatype of the property can be either
        # primitive or another struct .

        @[JSON::Field(key: "property")]
        getter property : Types::CustomProperty?


        @[JSON::Field(key: "sensor")]
        getter sensor : Types::Sensor?

        # Represents a complex or higher-order data structure.

        @[JSON::Field(key: "struct")]
        getter struct : Types::CustomStruct?

        def initialize(
          @actuator : Types::Actuator? = nil,
          @attribute : Types::Attribute? = nil,
          @branch : Types::Branch? = nil,
          @property : Types::CustomProperty? = nil,
          @sensor : Types::Sensor? = nil,
          @struct : Types::CustomStruct? = nil
        )
        end
      end

      # Information about the number of nodes and node types in a vehicle network.

      struct NodeCounts
        include JSON::Serializable

        # The total number of nodes in a vehicle network that represent actuators.

        @[JSON::Field(key: "totalActuators")]
        getter total_actuators : Int32?

        # The total number of nodes in a vehicle network that represent attributes.

        @[JSON::Field(key: "totalAttributes")]
        getter total_attributes : Int32?

        # The total number of nodes in a vehicle network that represent branches.

        @[JSON::Field(key: "totalBranches")]
        getter total_branches : Int32?

        # The total number of nodes in a vehicle network.

        @[JSON::Field(key: "totalNodes")]
        getter total_nodes : Int32?

        # The total properties for the node.

        @[JSON::Field(key: "totalProperties")]
        getter total_properties : Int32?

        # The total number of nodes in a vehicle network that represent sensors.

        @[JSON::Field(key: "totalSensors")]
        getter total_sensors : Int32?

        # The total structure for the node.

        @[JSON::Field(key: "totalStructs")]
        getter total_structs : Int32?

        def initialize(
          @total_actuators : Int32? = nil,
          @total_attributes : Int32? = nil,
          @total_branches : Int32? = nil,
          @total_nodes : Int32? = nil,
          @total_properties : Int32? = nil,
          @total_sensors : Int32? = nil,
          @total_structs : Int32? = nil
        )
        end
      end

      # A network interface that specifies the on-board diagnostic (OBD) II network protocol.

      struct ObdInterface
        include JSON::Serializable

        # The name of the interface.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the message requesting vehicle data.

        @[JSON::Field(key: "requestMessageId")]
        getter request_message_id : Int32

        # The maximum number message requests per diagnostic trouble code per second.

        @[JSON::Field(key: "dtcRequestIntervalSeconds")]
        getter dtc_request_interval_seconds : Int32?

        # Whether the vehicle has a transmission control module (TCM).

        @[JSON::Field(key: "hasTransmissionEcu")]
        getter has_transmission_ecu : Bool?

        # The standard OBD II PID.

        @[JSON::Field(key: "obdStandard")]
        getter obd_standard : String?

        # The maximum number message requests per second.

        @[JSON::Field(key: "pidRequestIntervalSeconds")]
        getter pid_request_interval_seconds : Int32?

        # Whether to use extended IDs in the message.

        @[JSON::Field(key: "useExtendedIds")]
        getter use_extended_ids : Bool?

        def initialize(
          @name : String,
          @request_message_id : Int32,
          @dtc_request_interval_seconds : Int32? = nil,
          @has_transmission_ecu : Bool? = nil,
          @obd_standard : String? = nil,
          @pid_request_interval_seconds : Int32? = nil,
          @use_extended_ids : Bool? = nil
        )
        end
      end

      # Information about signal messages using the on-board diagnostics (OBD) II protocol in a vehicle.

      struct ObdSignal
        include JSON::Serializable

        # The length of a message.

        @[JSON::Field(key: "byteLength")]
        getter byte_length : Int32

        # The offset used to calculate the signal value. Combined with scaling, the calculation is value =
        # raw_value * scaling + offset .

        @[JSON::Field(key: "offset")]
        getter offset : Float64

        # The diagnostic code used to request data from a vehicle for this signal.

        @[JSON::Field(key: "pid")]
        getter pid : Int32

        # The length of the requested data.

        @[JSON::Field(key: "pidResponseLength")]
        getter pid_response_length : Int32

        # A multiplier used to decode the message.

        @[JSON::Field(key: "scaling")]
        getter scaling : Float64

        # The mode of operation (diagnostic service) in a message.

        @[JSON::Field(key: "serviceMode")]
        getter service_mode : Int32

        # Indicates the beginning of the message.

        @[JSON::Field(key: "startByte")]
        getter start_byte : Int32

        # The number of bits to mask in a message.

        @[JSON::Field(key: "bitMaskLength")]
        getter bit_mask_length : Int32?

        # The number of positions to shift bits in the message.

        @[JSON::Field(key: "bitRightShift")]
        getter bit_right_shift : Int32?

        # Determines whether the message is signed ( true ) or not ( false ). If it's signed, the message can
        # represent both positive and negative numbers. The isSigned parameter only applies to the INTEGER raw
        # signal type, and it doesn't affect the FLOATING_POINT raw signal type. The default value is false .

        @[JSON::Field(key: "isSigned")]
        getter is_signed : Bool?

        # The value type of the signal. The default value is INTEGER .

        @[JSON::Field(key: "signalValueType")]
        getter signal_value_type : String?

        def initialize(
          @byte_length : Int32,
          @offset : Float64,
          @pid : Int32,
          @pid_response_length : Int32,
          @scaling : Float64,
          @service_mode : Int32,
          @start_byte : Int32,
          @bit_mask_length : Int32? = nil,
          @bit_right_shift : Int32? = nil,
          @is_signed : Bool? = nil,
          @signal_value_type : String? = nil
        )
        end
      end

      # Vehicles associated with the state template will stream telemetry data when there is a change.

      struct OnChangeStateTemplateUpdateStrategy
        include JSON::Serializable

        def initialize
        end
      end

      # Vehicles associated with the state template will stream telemetry data during a specified time
      # period.

      struct PeriodicStateTemplateUpdateStrategy
        include JSON::Serializable


        @[JSON::Field(key: "stateTemplateUpdateRate")]
        getter state_template_update_rate : Types::TimePeriod

        def initialize(
          @state_template_update_rate : Types::TimePeriod
        )
        end
      end

      # Represents a primitive type node of the complex data structure.

      struct PrimitiveMessageDefinition
        include JSON::Serializable

        # Information about a PrimitiveMessage using a ROS 2 compliant primitive type message of the complex
        # data structure.

        @[JSON::Field(key: "ros2PrimitiveMessageDefinition")]
        getter ros2_primitive_message_definition : Types::ROS2PrimitiveMessageDefinition?

        def initialize(
          @ros2_primitive_message_definition : Types::ROS2PrimitiveMessageDefinition? = nil
        )
        end
      end


      struct PutEncryptionConfigurationRequest
        include JSON::Serializable

        # The type of encryption. Choose KMS_BASED_ENCRYPTION to use a KMS key or FLEETWISE_DEFAULT_ENCRYPTION
        # to use an Amazon Web Services managed key.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The ID of the KMS key that is used for encryption.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_type : String,
          @kms_key_id : String? = nil
        )
        end
      end


      struct PutEncryptionConfigurationResponse
        include JSON::Serializable

        # The encryption status.

        @[JSON::Field(key: "encryptionStatus")]
        getter encryption_status : String

        # The type of encryption. Set to KMS_BASED_ENCRYPTION to use an KMS key that you own and manage. Set
        # to FLEETWISE_DEFAULT_ENCRYPTION to use an Amazon Web Services managed key that is owned by the
        # Amazon Web Services IoT FleetWise service account.

        @[JSON::Field(key: "encryptionType")]
        getter encryption_type : String

        # The ID of the KMS key that is used for encryption.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @encryption_status : String,
          @encryption_type : String,
          @kms_key_id : String? = nil
        )
        end
      end


      struct PutLoggingOptionsRequest
        include JSON::Serializable

        # Creates or updates the log delivery option to Amazon CloudWatch Logs.

        @[JSON::Field(key: "cloudWatchLogDelivery")]
        getter cloud_watch_log_delivery : Types::CloudWatchLogDeliveryOptions

        def initialize(
          @cloud_watch_log_delivery : Types::CloudWatchLogDeliveryOptions
        )
        end
      end


      struct PutLoggingOptionsResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a ROS 2 compliant primitive type message of the complex data structure.

      struct ROS2PrimitiveMessageDefinition
        include JSON::Serializable

        # The primitive type (integer, floating point, boolean, etc.) for the ROS 2 primitive message
        # definition.

        @[JSON::Field(key: "primitiveType")]
        getter primitive_type : String

        # The offset used to calculate the signal value. Combined with scaling, the calculation is value =
        # raw_value * scaling + offset .

        @[JSON::Field(key: "offset")]
        getter offset : Float64?

        # A multiplier used to decode the message.

        @[JSON::Field(key: "scaling")]
        getter scaling : Float64?

        # An optional attribute specifying the upper bound for STRING and WSTRING .

        @[JSON::Field(key: "upperBound")]
        getter upper_bound : Int64?

        def initialize(
          @primitive_type : String,
          @offset : Float64? = nil,
          @scaling : Float64? = nil,
          @upper_bound : Int64? = nil
        )
        end
      end


      struct RegisterAccountRequest
        include JSON::Serializable

        # The IAM resource that allows Amazon Web Services IoT FleetWise to send data to Amazon Timestream.

        @[JSON::Field(key: "iamResources")]
        getter iam_resources : Types::IamResources?


        @[JSON::Field(key: "timestreamResources")]
        getter timestream_resources : Types::TimestreamResources?

        def initialize(
          @iam_resources : Types::IamResources? = nil,
          @timestream_resources : Types::TimestreamResources? = nil
        )
        end
      end


      struct RegisterAccountResponse
        include JSON::Serializable

        # The time the account was registered, in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The registered IAM resource that allows Amazon Web Services IoT FleetWise to send data to Amazon
        # Timestream.

        @[JSON::Field(key: "iamResources")]
        getter iam_resources : Types::IamResources

        # The time this registration was last updated, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The status of registering your Amazon Web Services account, IAM role, and Timestream resources.

        @[JSON::Field(key: "registerAccountStatus")]
        getter register_account_status : String


        @[JSON::Field(key: "timestreamResources")]
        getter timestream_resources : Types::TimestreamResources?

        def initialize(
          @creation_time : Time,
          @iam_resources : Types::IamResources,
          @last_modification_time : Time,
          @register_account_status : String,
          @timestream_resources : Types::TimestreamResources? = nil
        )
        end
      end

      # The resource wasn't found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that wasn't found.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that wasn't found.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The Amazon S3 bucket where the Amazon Web Services IoT FleetWise campaign sends data. Amazon S3 is
      # an object storage service that stores data as objects within buckets. For more information, see
      # Creating, configuring, and working with Amazon S3 buckets in the Amazon Simple Storage Service User
      # Guide .

      struct S3Config
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon S3 bucket.

        @[JSON::Field(key: "bucketArn")]
        getter bucket_arn : String

        # Specify the format that files are saved in the Amazon S3 bucket. You can save files in an Apache
        # Parquet or JSON format. Parquet - Store data in a columnar storage file format. Parquet is optimal
        # for fast data retrieval and can reduce costs. This option is selected by default. JSON - Store data
        # in a standard text-based JSON file format.

        @[JSON::Field(key: "dataFormat")]
        getter data_format : String?

        # Enter an S3 bucket prefix. The prefix is the string of characters after the bucket name and before
        # the object name. You can use the prefix to organize data stored in Amazon S3 buckets. For more
        # information, see Organizing objects using prefixes in the Amazon Simple Storage Service User Guide .
        # By default, Amazon Web Services IoT FleetWise sets the prefix
        # processed-data/year=YY/month=MM/date=DD/hour=HH/ (in UTC) to data it delivers to Amazon S3. You can
        # enter a prefix to append it to this default prefix. For example, if you enter the prefix vehicles ,
        # the prefix will be vehicles/processed-data/year=YY/month=MM/date=DD/hour=HH/ .

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # By default, stored data is compressed as a .gzip file. Compressed files have a reduced file size,
        # which can optimize the cost of data storage.

        @[JSON::Field(key: "storageCompressionFormat")]
        getter storage_compression_format : String?

        def initialize(
          @bucket_arn : String,
          @data_format : String? = nil,
          @prefix : String? = nil,
          @storage_compression_format : String? = nil
        )
        end
      end

      # An input component that reports the environmental condition of a vehicle. You can collect data about
      # fluid levels, temperatures, vibrations, or battery voltage from sensors.

      struct Sensor
        include JSON::Serializable

        # The specified data type of the sensor.

        @[JSON::Field(key: "dataType")]
        getter data_type : String

        # The fully qualified name of the sensor. For example, the fully qualified name of a sensor might be
        # Vehicle.Body.Engine.Battery .

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # A list of possible values a sensor can take.

        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : Array(String)?

        # A comment in addition to the description.

        @[JSON::Field(key: "comment")]
        getter comment : String?

        # The deprecation message for the node or the branch that was moved or deleted.

        @[JSON::Field(key: "deprecationMessage")]
        getter deprecation_message : String?

        # A brief description of a sensor.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The specified possible maximum value of the sensor.

        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The specified possible minimum value of the sensor.

        @[JSON::Field(key: "min")]
        getter min : Float64?

        # The fully qualified name of the struct node for a sensor if the data type of the actuator is Struct
        # or StructArray . For example, the struct fully qualified name of a sensor might be
        # Vehicle.ADAS.CameraStruct .

        @[JSON::Field(key: "structFullyQualifiedName")]
        getter struct_fully_qualified_name : String?

        # The scientific unit of measurement for data collected by the sensor.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @data_type : String,
          @fully_qualified_name : String,
          @allowed_values : Array(String)? = nil,
          @comment : String? = nil,
          @deprecation_message : String? = nil,
          @description : String? = nil,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @struct_fully_qualified_name : String? = nil,
          @unit : String? = nil
        )
        end
      end

      # Information about a collection of standardized signals, which can be attributes, branches, sensors,
      # or actuators.

      struct SignalCatalogSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the signal catalog was created in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The time the signal catalog was last updated in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The name of the signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @last_modification_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Information about a signal decoder.

      struct SignalDecoder
        include JSON::Serializable

        # The fully qualified name of a signal decoder as defined in a vehicle model.

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # The ID of a network interface that specifies what network protocol a vehicle follows.

        @[JSON::Field(key: "interfaceId")]
        getter interface_id : String

        # The network protocol for the vehicle. For example, CAN_SIGNAL specifies a protocol that defines how
        # data is communicated between electronic control units (ECUs). OBD_SIGNAL specifies a protocol that
        # defines how self-diagnostic data is communicated between ECUs.

        @[JSON::Field(key: "type")]
        getter type : String

        # Information about signal decoder using the Controller Area Network (CAN) protocol.

        @[JSON::Field(key: "canSignal")]
        getter can_signal : Types::CanSignal?

        # Information about a custom signal decoder . Access to certain Amazon Web Services IoT FleetWise
        # features is currently gated. For more information, see Amazon Web Services Region and feature
        # availability in the Amazon Web Services IoT FleetWise Developer Guide .

        @[JSON::Field(key: "customDecodingSignal")]
        getter custom_decoding_signal : Types::CustomDecodingSignal?

        # The decoding information for a specific message which supports higher order data types.

        @[JSON::Field(key: "messageSignal")]
        getter message_signal : Types::MessageSignal?

        # Information about signal decoder using the on-board diagnostic (OBD) II protocol.

        @[JSON::Field(key: "obdSignal")]
        getter obd_signal : Types::ObdSignal?

        def initialize(
          @fully_qualified_name : String,
          @interface_id : String,
          @type : String,
          @can_signal : Types::CanSignal? = nil,
          @custom_decoding_signal : Types::CustomDecodingSignal? = nil,
          @message_signal : Types::MessageSignal? = nil,
          @obd_signal : Types::ObdSignal? = nil
        )
        end
      end

      # The configuration of the signal fetch operation. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct SignalFetchConfig
        include JSON::Serializable

        # The configuration of a condition-based signal fetch operation.

        @[JSON::Field(key: "conditionBased")]
        getter condition_based : Types::ConditionBasedSignalFetchConfig?

        # The configuration of a time-based signal fetch operation.

        @[JSON::Field(key: "timeBased")]
        getter time_based : Types::TimeBasedSignalFetchConfig?

        def initialize(
          @condition_based : Types::ConditionBasedSignalFetchConfig? = nil,
          @time_based : Types::TimeBasedSignalFetchConfig? = nil
        )
        end
      end

      # Information about the signal to be fetched. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct SignalFetchInformation
        include JSON::Serializable

        # The actions to be performed by the signal fetch.

        @[JSON::Field(key: "actions")]
        getter actions : Array(String)

        # The fully qualified name of the signal to be fetched.

        @[JSON::Field(key: "fullyQualifiedName")]
        getter fully_qualified_name : String

        # The configuration of the signal fetch operation.

        @[JSON::Field(key: "signalFetchConfig")]
        getter signal_fetch_config : Types::SignalFetchConfig

        # The version of the condition language used.

        @[JSON::Field(key: "conditionLanguageVersion")]
        getter condition_language_version : Int32?

        def initialize(
          @actions : Array(String),
          @fully_qualified_name : String,
          @signal_fetch_config : Types::SignalFetchConfig,
          @condition_language_version : Int32? = nil
        )
        end
      end

      # Information about a signal.

      struct SignalInformation
        include JSON::Serializable

        # The name of the signal.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the data partition this signal is associated with. The ID must match one of the IDs
        # provided in dataPartitions . This is accomplished either by specifying a particular data partition
        # ID or by using default for an established default partition. You can establish a default partition
        # in the DataPartition data type. If you upload a signal as a condition for a campaign's data
        # partition, the same signal must be included in signalsToCollect . Access to certain Amazon Web
        # Services IoT FleetWise features is currently gated. For more information, see Amazon Web Services
        # Region and feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

        @[JSON::Field(key: "dataPartitionId")]
        getter data_partition_id : String?

        # The maximum number of samples to collect.

        @[JSON::Field(key: "maxSampleCount")]
        getter max_sample_count : Int64?

        # The minimum duration of time (in milliseconds) between two triggering events to collect data. If a
        # signal changes often, you might want to collect data at a slower rate.

        @[JSON::Field(key: "minimumSamplingIntervalMs")]
        getter minimum_sampling_interval_ms : Int64?

        def initialize(
          @name : String,
          @data_partition_id : String? = nil,
          @max_sample_count : Int64? = nil,
          @minimum_sampling_interval_ms : Int64? = nil
        )
        end
      end

      # The state template associated with a vehicle. State templates contain state properties, which are
      # signals that belong to a signal catalog that is synchronized between the Amazon Web Services IoT
      # FleetWise Edge and the Amazon Web Services Cloud. Access to certain Amazon Web Services IoT
      # FleetWise features is currently gated. For more information, see Amazon Web Services Region and
      # feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct StateTemplateAssociation
        include JSON::Serializable

        # The unique ID of the state template.

        @[JSON::Field(key: "identifier")]
        getter identifier : String


        @[JSON::Field(key: "stateTemplateUpdateStrategy")]
        getter state_template_update_strategy : Types::StateTemplateUpdateStrategy

        def initialize(
          @identifier : String,
          @state_template_update_strategy : Types::StateTemplateUpdateStrategy
        )
        end
      end

      # Information about a state template. Access to certain Amazon Web Services IoT FleetWise features is
      # currently gated. For more information, see Amazon Web Services Region and feature availability in
      # the Amazon Web Services IoT FleetWise Developer Guide .

      struct StateTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the state template was created, in seconds since epoch (January 1, 1970 at midnight UTC
        # time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A brief description of the state template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique ID of the state template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The time the state template was last updated, in seconds since epoch (January 1, 1970 at midnight
        # UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time?

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the signal catalog associated with the state template.

        @[JSON::Field(key: "signalCatalogArn")]
        getter signal_catalog_arn : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_modification_time : Time? = nil,
          @name : String? = nil,
          @signal_catalog_arn : String? = nil
        )
        end
      end

      # The update strategy for the state template. Vehicles associated with the state template can stream
      # telemetry data with either an onChange or periodic update strategy. Access to certain Amazon Web
      # Services IoT FleetWise features is currently gated. For more information, see Amazon Web Services
      # Region and feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct StateTemplateUpdateStrategy
        include JSON::Serializable


        @[JSON::Field(key: "onChange")]
        getter on_change : Types::OnChangeStateTemplateUpdateStrategy?


        @[JSON::Field(key: "periodic")]
        getter periodic : Types::PeriodicStateTemplateUpdateStrategy?

        def initialize(
          @on_change : Types::OnChangeStateTemplateUpdateStrategy? = nil,
          @periodic : Types::PeriodicStateTemplateUpdateStrategy? = nil
        )
        end
      end

      # The maximum storage size for the data partition. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct StorageMaximumSize
        include JSON::Serializable

        # The data type of the data to store.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The maximum amount of time to store data.

        @[JSON::Field(key: "value")]
        getter value : Int32

        def initialize(
          @unit : String,
          @value : Int32
        )
        end
      end

      # Information about the minimum amount of time that data will be kept. Access to certain Amazon Web
      # Services IoT FleetWise features is currently gated. For more information, see Amazon Web Services
      # Region and feature availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct StorageMinimumTimeToLive
        include JSON::Serializable

        # The time increment type.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The minimum amount of time to store the data.

        @[JSON::Field(key: "value")]
        getter value : Int32

        def initialize(
          @unit : String,
          @value : Int32
        )
        end
      end

      # The structured message for the message signal. It can be defined with either a
      # primitiveMessageDefinition , structuredMessageListDefinition , or structuredMessageDefinition
      # recursively.

      struct StructuredMessage
        include JSON::Serializable

        # Represents a primitive type node of the complex data structure.

        @[JSON::Field(key: "primitiveMessageDefinition")]
        getter primitive_message_definition : Types::PrimitiveMessageDefinition?

        # Represents a struct type node of the complex data structure.

        @[JSON::Field(key: "structuredMessageDefinition")]
        getter structured_message_definition : Array(Types::StructuredMessageFieldNameAndDataTypePair)?

        # Represents a list type node of the complex data structure.

        @[JSON::Field(key: "structuredMessageListDefinition")]
        getter structured_message_list_definition : Types::StructuredMessageListDefinition?

        def initialize(
          @primitive_message_definition : Types::PrimitiveMessageDefinition? = nil,
          @structured_message_definition : Array(Types::StructuredMessageFieldNameAndDataTypePair)? = nil,
          @structured_message_list_definition : Types::StructuredMessageListDefinition? = nil
        )
        end
      end

      # Represents a StructureMessageName to DataType map element.

      struct StructuredMessageFieldNameAndDataTypePair
        include JSON::Serializable

        # The data type.

        @[JSON::Field(key: "dataType")]
        getter data_type : Types::StructuredMessage

        # The field name of the structured message. It determines how a data value is referenced in the target
        # language.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String

        def initialize(
          @data_type : Types::StructuredMessage,
          @field_name : String
        )
        end
      end

      # Represents a list type node of the complex data structure.

      struct StructuredMessageListDefinition
        include JSON::Serializable

        # The type of list of the structured message list definition.

        @[JSON::Field(key: "listType")]
        getter list_type : String

        # The member type of the structured message list definition.

        @[JSON::Field(key: "memberType")]
        getter member_type : Types::StructuredMessage

        # The name of the structured message list definition.

        @[JSON::Field(key: "name")]
        getter name : String

        # The capacity of the structured message list definition when the list type is FIXED_CAPACITY or
        # DYNAMIC_BOUNDED_CAPACITY .

        @[JSON::Field(key: "capacity")]
        getter capacity : Int32?

        def initialize(
          @list_type : String,
          @member_type : Types::StructuredMessage,
          @name : String,
          @capacity : Int32? = nil
        )
        end
      end

      # A set of key/value pairs that are used to manage the resource.

      struct Tag
        include JSON::Serializable

        # The tag's key.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.

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

        # The ARN of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The new or modified tags for the resource.

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

      # The request couldn't be completed due to throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The quota identifier of the applied throttling rules for this request.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying the command.

        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        # The code for the service that couldn't be completed due to throttling.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Information about a collection scheme that uses a time period to decide how often to collect data.

      struct TimeBasedCollectionScheme
        include JSON::Serializable

        # The time period (in milliseconds) to decide how often to collect data. For example, if the time
        # period is 60000 , the Edge Agent software collects data once every minute.

        @[JSON::Field(key: "periodMs")]
        getter period_ms : Int64

        def initialize(
          @period_ms : Int64
        )
        end
      end

      # Used to configure a frequency-based vehicle signal fetch.

      struct TimeBasedSignalFetchConfig
        include JSON::Serializable

        # The frequency with which the signal fetch will be executed.

        @[JSON::Field(key: "executionFrequencyMs")]
        getter execution_frequency_ms : Int64

        def initialize(
          @execution_frequency_ms : Int64
        )
        end
      end

      # The length of time between state template updates.

      struct TimePeriod
        include JSON::Serializable

        # A unit of time.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # A number of time units.

        @[JSON::Field(key: "value")]
        getter value : Int32

        def initialize(
          @unit : String,
          @value : Int32
        )
        end
      end

      # The Amazon Timestream table where the Amazon Web Services IoT FleetWise campaign sends data.
      # Timestream stores and organizes data to optimize query processing time and to reduce storage costs.
      # For more information, see Data modeling in the Amazon Timestream Developer Guide .

      struct TimestreamConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task execution role that grants Amazon Web Services IoT
        # FleetWise permission to deliver data to the Amazon Timestream table.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The Amazon Resource Name (ARN) of the Amazon Timestream table.

        @[JSON::Field(key: "timestreamTableArn")]
        getter timestream_table_arn : String

        def initialize(
          @execution_role_arn : String,
          @timestream_table_arn : String
        )
        end
      end

      # Information about the registered Amazon Timestream resources or errors, if any.

      struct TimestreamRegistrationResponse
        include JSON::Serializable

        # The status of registering your Amazon Timestream resources. The status can be one of
        # REGISTRATION_SUCCESS , REGISTRATION_PENDING , REGISTRATION_FAILURE .

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The name of the Timestream database.

        @[JSON::Field(key: "timestreamDatabaseName")]
        getter timestream_database_name : String

        # The name of the Timestream database table.

        @[JSON::Field(key: "timestreamTableName")]
        getter timestream_table_name : String

        # A message associated with a registration error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The Amazon Resource Name (ARN) of the Timestream database.

        @[JSON::Field(key: "timestreamDatabaseArn")]
        getter timestream_database_arn : String?

        # The ARN of the Timestream database table.

        @[JSON::Field(key: "timestreamTableArn")]
        getter timestream_table_arn : String?

        def initialize(
          @registration_status : String,
          @timestream_database_name : String,
          @timestream_table_name : String,
          @error_message : String? = nil,
          @timestream_database_arn : String? = nil,
          @timestream_table_arn : String? = nil
        )
        end
      end

      # The registered Amazon Timestream resources that Amazon Web Services IoT FleetWise edge agent
      # software can transfer your vehicle data to.

      struct TimestreamResources
        include JSON::Serializable

        # The name of the registered Amazon Timestream database.

        @[JSON::Field(key: "timestreamDatabaseName")]
        getter timestream_database_name : String

        # The name of the registered Amazon Timestream database table.

        @[JSON::Field(key: "timestreamTableName")]
        getter timestream_table_name : String

        def initialize(
          @timestream_database_name : String,
          @timestream_table_name : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of the keys of the tags to be removed from the resource.

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


      struct UpdateCampaignRequest
        include JSON::Serializable

        # Specifies how to update a campaign. The action can be one of the following: APPROVE - To approve
        # delivering a data collection scheme to vehicles. SUSPEND - To suspend collecting signal data. The
        # campaign is deleted from vehicles and all vehicles in the suspended campaign will stop sending data.
        # RESUME - To reactivate the SUSPEND campaign. The campaign is redeployed to all vehicles and the
        # vehicles will resume sending data. UPDATE - To update a campaign.

        @[JSON::Field(key: "action")]
        getter action : String

        # The name of the campaign to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of vehicle attributes to associate with a signal. Default: An empty array

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # The description of the campaign.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action : String,
          @name : String,
          @data_extra_dimensions : Array(String)? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateCampaignResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the campaign.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the updated campaign.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of a campaign. The status can be one of: CREATING - Amazon Web Services IoT FleetWise is
        # processing your request to create the campaign. WAITING_FOR_APPROVAL - After you create a campaign,
        # it enters this state. Use the API operation to approve the campaign for deployment to the target
        # vehicle or fleet. RUNNING - The campaign is active. SUSPENDED - The campaign is suspended. To resume
        # the campaign, use the API operation.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateDecoderManifestRequest
        include JSON::Serializable

        # The name of the decoder manifest to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # Use default decoders for all unmapped signals in the model. You don't need to provide any detailed
        # decoding information. Access to certain Amazon Web Services IoT FleetWise features is currently
        # gated. For more information, see Amazon Web Services Region and feature availability in the Amazon
        # Web Services IoT FleetWise Developer Guide .

        @[JSON::Field(key: "defaultForUnmappedSignals")]
        getter default_for_unmapped_signals : String?

        # A brief description of the decoder manifest to update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of information about the network interfaces to add to the decoder manifest.

        @[JSON::Field(key: "networkInterfacesToAdd")]
        getter network_interfaces_to_add : Array(Types::NetworkInterface)?

        # A list of network interfaces to remove from the decoder manifest.

        @[JSON::Field(key: "networkInterfacesToRemove")]
        getter network_interfaces_to_remove : Array(String)?

        # A list of information about the network interfaces to update in the decoder manifest.

        @[JSON::Field(key: "networkInterfacesToUpdate")]
        getter network_interfaces_to_update : Array(Types::NetworkInterface)?

        # A list of information about decoding additional signals to add to the decoder manifest.

        @[JSON::Field(key: "signalDecodersToAdd")]
        getter signal_decoders_to_add : Array(Types::SignalDecoder)?

        # A list of signal decoders to remove from the decoder manifest.

        @[JSON::Field(key: "signalDecodersToRemove")]
        getter signal_decoders_to_remove : Array(String)?

        # A list of updated information about decoding signals to update in the decoder manifest.

        @[JSON::Field(key: "signalDecodersToUpdate")]
        getter signal_decoders_to_update : Array(Types::SignalDecoder)?

        # The state of the decoder manifest. If the status is ACTIVE , the decoder manifest can't be edited.
        # If the status is DRAFT , you can edit the decoder manifest.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String,
          @default_for_unmapped_signals : String? = nil,
          @description : String? = nil,
          @network_interfaces_to_add : Array(Types::NetworkInterface)? = nil,
          @network_interfaces_to_remove : Array(String)? = nil,
          @network_interfaces_to_update : Array(Types::NetworkInterface)? = nil,
          @signal_decoders_to_add : Array(Types::SignalDecoder)? = nil,
          @signal_decoders_to_remove : Array(String)? = nil,
          @signal_decoders_to_update : Array(Types::SignalDecoder)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateDecoderManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated decoder manifest.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the updated decoder manifest.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct UpdateFleetRequest
        include JSON::Serializable

        # The ID of the fleet to update.

        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # An updated description of the fleet.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @fleet_id : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateFleetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated fleet.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the updated fleet.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct UpdateModelManifestRequest
        include JSON::Serializable

        # The name of the vehicle model to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the vehicle model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of fullyQualifiedName of nodes, which are a general abstraction of signals, to add to the
        # vehicle model.

        @[JSON::Field(key: "nodesToAdd")]
        getter nodes_to_add : Array(String)?

        # A list of fullyQualifiedName of nodes, which are a general abstraction of signals, to remove from
        # the vehicle model.

        @[JSON::Field(key: "nodesToRemove")]
        getter nodes_to_remove : Array(String)?

        # The state of the vehicle model. If the status is ACTIVE , the vehicle model can't be edited. If the
        # status is DRAFT , you can edit the vehicle model.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String,
          @description : String? = nil,
          @nodes_to_add : Array(String)? = nil,
          @nodes_to_remove : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateModelManifestResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated vehicle model.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the updated vehicle model.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct UpdateSignalCatalogRequest
        include JSON::Serializable

        # The name of the signal catalog to update.

        @[JSON::Field(key: "name")]
        getter name : String

        # A brief description of the signal catalog to update.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of information about nodes to add to the signal catalog.

        @[JSON::Field(key: "nodesToAdd")]
        getter nodes_to_add : Array(Types::Node)?

        # A list of fullyQualifiedName of nodes to remove from the signal catalog.

        @[JSON::Field(key: "nodesToRemove")]
        getter nodes_to_remove : Array(String)?

        # A list of information about nodes to update in the signal catalog.

        @[JSON::Field(key: "nodesToUpdate")]
        getter nodes_to_update : Array(Types::Node)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @nodes_to_add : Array(Types::Node)? = nil,
          @nodes_to_remove : Array(String)? = nil,
          @nodes_to_update : Array(Types::Node)? = nil
        )
        end
      end


      struct UpdateSignalCatalogResponse
        include JSON::Serializable

        # The ARN of the updated signal catalog.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the updated signal catalog.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct UpdateStateTemplateRequest
        include JSON::Serializable

        # The unique ID of the state template.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A list of vehicle attributes to associate with the payload published on the state template's MQTT
        # topic. (See Processing last known state vehicle data using MQTT messaging ). For example, if you add
        # Vehicle.Attributes.Make and Vehicle.Attributes.Model attributes, Amazon Web Services IoT FleetWise
        # will enrich the protobuf encoded payload with those attributes in the extraDimensions field.
        # Default: An empty array

        @[JSON::Field(key: "dataExtraDimensions")]
        getter data_extra_dimensions : Array(String)?

        # A brief description of the state template.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A list of vehicle attributes to associate with user properties of the messages published on the
        # state template's MQTT topic. (See Processing last known state vehicle data using MQTT messaging ).
        # For example, if you add Vehicle.Attributes.Make and Vehicle.Attributes.Model attributes, Amazon Web
        # Services IoT FleetWise will include these attributes as User Properties with the MQTT message.

        @[JSON::Field(key: "metadataExtraDimensions")]
        getter metadata_extra_dimensions : Array(String)?

        # Add signals from which data is collected as part of the state template.

        @[JSON::Field(key: "stateTemplatePropertiesToAdd")]
        getter state_template_properties_to_add : Array(String)?

        # Remove signals from which data is collected as part of the state template.

        @[JSON::Field(key: "stateTemplatePropertiesToRemove")]
        getter state_template_properties_to_remove : Array(String)?

        def initialize(
          @identifier : String,
          @data_extra_dimensions : Array(String)? = nil,
          @description : String? = nil,
          @metadata_extra_dimensions : Array(String)? = nil,
          @state_template_properties_to_add : Array(String)? = nil,
          @state_template_properties_to_remove : Array(String)? = nil
        )
        end
      end


      struct UpdateStateTemplateResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state template.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique ID of the state template.

        @[JSON::Field(key: "id")]
        getter id : String?

        # The name of the state template.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An HTTP error resulting from updating the description for a vehicle.

      struct UpdateVehicleError
        include JSON::Serializable

        # The relevant HTTP error code (400+).

        @[JSON::Field(key: "code")]
        getter code : Int32?

        # A message associated with the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the vehicle with the error.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @code : Int32? = nil,
          @message : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end


      struct UpdateVehicleRequest
        include JSON::Serializable

        # The unique ID of the vehicle to update.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # The method the specified attributes will update the existing attributes on the vehicle. Use Overwite
        # to replace the vehicle attributes with the specified attributes. Or use Merge to combine all
        # attributes. This is required if attributes are present in the input.

        @[JSON::Field(key: "attributeUpdateMode")]
        getter attribute_update_mode : String?

        # Static information about a vehicle in a key-value pair. For example: "engineType" : "1.3 L R2"

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The ARN of the decoder manifest associated with this vehicle.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String?

        # The ARN of a vehicle model (model manifest) associated with the vehicle.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # Associate state templates with the vehicle.

        @[JSON::Field(key: "stateTemplatesToAdd")]
        getter state_templates_to_add : Array(Types::StateTemplateAssociation)?

        # Remove state templates from the vehicle.

        @[JSON::Field(key: "stateTemplatesToRemove")]
        getter state_templates_to_remove : Array(String)?

        # Change the stateTemplateUpdateStrategy of state templates already associated with the vehicle.

        @[JSON::Field(key: "stateTemplatesToUpdate")]
        getter state_templates_to_update : Array(Types::StateTemplateAssociation)?

        def initialize(
          @vehicle_name : String,
          @attribute_update_mode : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @decoder_manifest_arn : String? = nil,
          @model_manifest_arn : String? = nil,
          @state_templates_to_add : Array(Types::StateTemplateAssociation)? = nil,
          @state_templates_to_remove : Array(String)? = nil,
          @state_templates_to_update : Array(Types::StateTemplateAssociation)? = nil
        )
        end
      end

      # Information about the vehicle to update. Access to certain Amazon Web Services IoT FleetWise
      # features is currently gated. For more information, see Amazon Web Services Region and feature
      # availability in the Amazon Web Services IoT FleetWise Developer Guide .

      struct UpdateVehicleRequestItem
        include JSON::Serializable

        # The unique ID of the vehicle to update.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # The method the specified attributes will update the existing attributes on the vehicle. Use Overwite
        # to replace the vehicle attributes with the specified attributes. Or use Merge to combine all
        # attributes. This is required if attributes are present in the input.

        @[JSON::Field(key: "attributeUpdateMode")]
        getter attribute_update_mode : String?

        # Static information about a vehicle in a key-value pair. For example: "engineType" : "1.3 L R2"

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The ARN of the signal decoder manifest associated with the vehicle to update.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String?

        # The ARN of the vehicle model (model manifest) associated with the vehicle to update.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String?

        # Associate additional state templates to track the state of the vehicle. State templates determine
        # which signal updates the vehicle sends to the cloud.

        @[JSON::Field(key: "stateTemplatesToAdd")]
        getter state_templates_to_add : Array(Types::StateTemplateAssociation)?

        # Remove existing state template associations from the vehicle.

        @[JSON::Field(key: "stateTemplatesToRemove")]
        getter state_templates_to_remove : Array(String)?

        # Change the stateTemplateUpdateStrategy of state templates already associated with the vehicle.

        @[JSON::Field(key: "stateTemplatesToUpdate")]
        getter state_templates_to_update : Array(Types::StateTemplateAssociation)?

        def initialize(
          @vehicle_name : String,
          @attribute_update_mode : String? = nil,
          @attributes : Hash(String, String)? = nil,
          @decoder_manifest_arn : String? = nil,
          @model_manifest_arn : String? = nil,
          @state_templates_to_add : Array(Types::StateTemplateAssociation)? = nil,
          @state_templates_to_remove : Array(String)? = nil,
          @state_templates_to_update : Array(Types::StateTemplateAssociation)? = nil
        )
        end
      end


      struct UpdateVehicleResponse
        include JSON::Serializable

        # The ARN of the updated vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the updated vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @arn : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end

      # Information about the updated vehicle.

      struct UpdateVehicleResponseItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The unique ID of the updated vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @arn : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that fail to satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        # The reason the input failed to satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # A validation error due to mismatch between the expected data type, length, or pattern of the
      # parameter and the input.

      struct ValidationExceptionField
        include JSON::Serializable

        # A message about the validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the parameter field with the validation error.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The vehicle middleware defined as a type of network interface. Examples of vehicle middleware
      # include ROS2 and SOME/IP .

      struct VehicleMiddleware
        include JSON::Serializable

        # The name of the vehicle middleware.

        @[JSON::Field(key: "name")]
        getter name : String

        # The protocol name of the vehicle middleware.

        @[JSON::Field(key: "protocolName")]
        getter protocol_name : String

        def initialize(
          @name : String,
          @protocol_name : String
        )
        end
      end

      # Information about a campaign associated with a vehicle.

      struct VehicleStatus
        include JSON::Serializable

        # The name of a campaign.

        @[JSON::Field(key: "campaignName")]
        getter campaign_name : String?

        # The status of a campaign, which can be one of the following: CREATED - The campaign exists but is
        # not yet approved. READY - The campaign is approved but has not been deployed to the vehicle. Data
        # has not arrived at the vehicle yet. HEALTHY - The campaign is deployed to the vehicle. SUSPENDED -
        # The campaign is suspended and data collection is paused. DELETING - The campaign is being removed
        # from the vehicle. READY_FOR_CHECKIN - The campaign is approved and waiting for vehicle check-in
        # before deployment.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique ID of the vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String?

        def initialize(
          @campaign_name : String? = nil,
          @status : String? = nil,
          @vehicle_name : String? = nil
        )
        end
      end

      # Information about a vehicle. To return this information about vehicles in your account, you can use
      # the API operation.

      struct VehicleSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vehicle.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The time the vehicle was created in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "creationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time

        # The ARN of a decoder manifest associated with the vehicle.

        @[JSON::Field(key: "decoderManifestArn")]
        getter decoder_manifest_arn : String

        # The time the vehicle was last updated in seconds since epoch (January 1, 1970 at midnight UTC time).

        @[JSON::Field(key: "lastModificationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modification_time : Time

        # The ARN of a vehicle model (model manifest) associated with the vehicle.

        @[JSON::Field(key: "modelManifestArn")]
        getter model_manifest_arn : String

        # The unique ID of the vehicle.

        @[JSON::Field(key: "vehicleName")]
        getter vehicle_name : String

        # Static information about a vehicle in a key-value pair. For example: "engineType" : "1.3 L R2"

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @arn : String,
          @creation_time : Time,
          @decoder_manifest_arn : String,
          @last_modification_time : Time,
          @model_manifest_arn : String,
          @vehicle_name : String,
          @attributes : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
