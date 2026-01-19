require "json"
require "time"

module AwsSdk
  module Snowball
    module Types

      # The address that you want the Snow device(s) associated with a specific job to be shipped to.
      # Addresses are validated at the time of creation. The address you provide must be located within the
      # serviceable area of your region. Although no individual elements of the Address are required, if the
      # address is invalid or unsupported, then an exception is thrown.
      struct Address
        include JSON::Serializable

        # The unique ID for an address.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The city in an address that a Snow device is to be delivered to.
        @[JSON::Field(key: "City")]
        getter city : String?

        # The name of the company to receive a Snow device at an address.
        @[JSON::Field(key: "Company")]
        getter company : String?

        # The country in an address that a Snow device is to be delivered to.
        @[JSON::Field(key: "Country")]
        getter country : String?

        # If the address you are creating is a primary address, then set this option to true. This field is
        # not supported in most regions.
        @[JSON::Field(key: "IsRestricted")]
        getter is_restricted : Bool?

        # This field is no longer used and the value is ignored.
        @[JSON::Field(key: "Landmark")]
        getter landmark : String?

        # The name of a person to receive a Snow device at an address.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The phone number associated with an address that a Snow device is to be delivered to.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        # The postal code in an address that a Snow device is to be delivered to.
        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # This field is no longer used and the value is ignored.
        @[JSON::Field(key: "PrefectureOrDistrict")]
        getter prefecture_or_district : String?

        # The state or province in an address that a Snow device is to be delivered to.
        @[JSON::Field(key: "StateOrProvince")]
        getter state_or_province : String?

        # The first line in a street address that a Snow device is to be delivered to.
        @[JSON::Field(key: "Street1")]
        getter street1 : String?

        # The second line in a street address that a Snow device is to be delivered to.
        @[JSON::Field(key: "Street2")]
        getter street2 : String?

        # The third line in a street address that a Snow device is to be delivered to.
        @[JSON::Field(key: "Street3")]
        getter street3 : String?

        # Differentiates between delivery address and pickup address in the customer account. Provided at job
        # creation.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @address_id : String? = nil,
          @city : String? = nil,
          @company : String? = nil,
          @country : String? = nil,
          @is_restricted : Bool? = nil,
          @landmark : String? = nil,
          @name : String? = nil,
          @phone_number : String? = nil,
          @postal_code : String? = nil,
          @prefecture_or_district : String? = nil,
          @state_or_province : String? = nil,
          @street1 : String? = nil,
          @street2 : String? = nil,
          @street3 : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct CancelClusterRequest
        include JSON::Serializable

        # The 39-character ID for the cluster that you want to cancel, for example
        # CID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end

      struct CancelClusterResult
        include JSON::Serializable

        def initialize
        end
      end

      struct CancelJobRequest
        include JSON::Serializable

        # The 39-character job ID for the job that you want to cancel, for example
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CancelJobResult
        include JSON::Serializable

        def initialize
        end
      end

      # Job creation failed. Currently, clusters support five nodes. If you have fewer than five nodes for
      # your cluster and you have more nodes to create for this cluster, try again and create jobs until
      # your cluster has exactly five nodes.
      struct ClusterLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains a cluster's state, a cluster's ID, and other important information.
      struct ClusterListEntry
        include JSON::Serializable

        # The 39-character ID for the cluster that you want to list, for example
        # CID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The current state of this cluster. For information about the state of a specific node, see
        # JobListEntry$JobState .
        @[JSON::Field(key: "ClusterState")]
        getter cluster_state : String?

        # The creation date for this cluster.
        @[JSON::Field(key: "CreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # Defines an optional description of the cluster, for example Environmental Data Cluster-01 .
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @cluster_id : String? = nil,
          @cluster_state : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil
        )
        end
      end

      # Contains metadata about a specific cluster.
      struct ClusterMetadata
        include JSON::Serializable

        # The automatically generated ID for a specific address.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The automatically generated ID for a cluster.
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The current status of the cluster.
        @[JSON::Field(key: "ClusterState")]
        getter cluster_state : String?

        # The creation date for this cluster.
        @[JSON::Field(key: "CreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The optional description of the cluster.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the address that you want a cluster shipped to, after it will be shipped to its primary
        # address. This field is not supported in most regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # The type of job for this cluster. Currently, the only job type supported for clusters is LOCAL_USE .
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # The KmsKeyARN Amazon Resource Name (ARN) associated with this cluster. This ARN was created using
        # the CreateKey API action in Key Management Service (KMS.
        @[JSON::Field(key: "KmsKeyARN")]
        getter kms_key_arn : String?

        # The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Represents metadata and configuration settings for services on an Amazon Web Services Snow Family
        # device.
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        # The arrays of JobResource objects that can include updated S3Resource objects or LambdaResource
        # objects.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The role ARN associated with this cluster. This ARN was created using the CreateRole API action in
        # Identity and Access Management (IAM).
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get
        # each device, rather it represents how quickly each device moves to its destination while in transit.
        # Regional shipping speeds are as follows: In Australia, you have access to express shipping.
        # Typically, devices shipped express are delivered in about a day. In the European Union (EU), you
        # have access to express shipping. Typically, Snow devices shipped express are delivered in about a
        # day. In addition, most countries in the EU have access to standard shipping, which typically takes
        # less than a week, one way. In India, Snow devices are delivered in one to seven days. In the US, you
        # have access to one-day shipping and two-day shipping.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        # The type of Snowball Edge device to use for this cluster. For cluster jobs, Amazon Web Services Snow
        # Family currently supports only the EDGE device type.
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String?

        # The tax documents required in your Amazon Web Services Region.
        @[JSON::Field(key: "TaxDocuments")]
        getter tax_documents : Types::TaxDocuments?

        def initialize(
          @address_id : String? = nil,
          @cluster_id : String? = nil,
          @cluster_state : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @forwarding_address_id : String? = nil,
          @job_type : String? = nil,
          @kms_key_arn : String? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @shipping_option : String? = nil,
          @snowball_type : String? = nil,
          @tax_documents : Types::TaxDocuments? = nil
        )
        end
      end

      # A JSON-formatted object that describes a compatible Amazon Machine Image (AMI), including the ID and
      # name for a Snow device AMI. This AMI is compatible with the device's physical hardware requirements,
      # and it should be able to be run in an SBE1 instance on the device.
      struct CompatibleImage
        include JSON::Serializable

        # The unique identifier for an individual Snow device AMI.
        @[JSON::Field(key: "AmiId")]
        getter ami_id : String?

        # The optional name of a compatible image.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @ami_id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # You get this exception when you call CreateReturnShippingLabel more than once when other requests
      # are not completed.
      struct ConflictException
        include JSON::Serializable

        # You get this resource when you call CreateReturnShippingLabel more than once when other requests are
        # not completed. .
        @[JSON::Field(key: "ConflictResource")]
        getter conflict_resource : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @conflict_resource : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct CreateAddressRequest
        include JSON::Serializable

        # The address that you want the Snow device shipped to.
        @[JSON::Field(key: "Address")]
        getter address : Types::Address

        def initialize(
          @address : Types::Address
        )
        end
      end

      struct CreateAddressResult
        include JSON::Serializable

        # The automatically generated ID for a specific address. You'll use this ID when you create a job to
        # specify which address you want the Snow device for that job shipped to.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        def initialize(
          @address_id : String? = nil
        )
        end
      end

      struct CreateClusterRequest
        include JSON::Serializable

        # The ID for the address that you want the cluster shipped to.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String

        # The type of job for this cluster. Currently, the only job type supported for clusters is LOCAL_USE .
        # For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "JobType")]
        getter job_type : String

        # The shipping speed for each node in this cluster. This speed doesn't dictate how soon you'll get
        # each Snowball Edge device, rather it represents how quickly each device moves to its destination
        # while in transit. Regional shipping speeds are as follows: In Australia, you have access to express
        # shipping. Typically, Snow devices shipped express are delivered in about a day. In the European
        # Union (EU), you have access to express shipping. Typically, Snow devices shipped express are
        # delivered in about a day. In addition, most countries in the EU have access to standard shipping,
        # which typically takes less than a week, one way. In India, Snow devices are delivered in one to
        # seven days. In the United States of America (US), you have access to one-day shipping and two-day
        # shipping. In Australia, you have access to express shipping. Typically, devices shipped express are
        # delivered in about a day. In the European Union (EU), you have access to express shipping.
        # Typically, Snow devices shipped express are delivered in about a day. In addition, most countries in
        # the EU have access to standard shipping, which typically takes less than a week, one way. In India,
        # Snow devices are delivered in one to seven days. In the US, you have access to one-day shipping and
        # two-day shipping.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String

        # The type of Snow Family devices to use for this cluster. For cluster jobs, Amazon Web Services Snow
        # Family currently supports only the EDGE device type. For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String

        # An optional description of this specific cluster, for example Environmental Data Cluster-01 .
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Force to create cluster when user attempts to overprovision or underprovision a cluster. A cluster
        # is overprovisioned or underprovisioned if the initial size of the cluster is more (overprovisioned)
        # or less (underprovisioned) than what needed to meet capacity requirement specified with
        # OnDeviceServiceConfiguration .
        @[JSON::Field(key: "ForceCreateJobs")]
        getter force_create_jobs : Bool?

        # The forwarding address ID for a cluster. This field is not supported in most regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # If provided, each job will be automatically created and associated with the new cluster. If not
        # provided, will be treated as 0.
        @[JSON::Field(key: "InitialClusterSize")]
        getter initial_cluster_size : Int32?

        # The KmsKeyARN value that you want to associate with this cluster. KmsKeyARN values are created by
        # using the CreateKey API action in Key Management Service (KMS).
        @[JSON::Field(key: "KmsKeyARN")]
        getter kms_key_arn : String?

        # Lists long-term pricing id that will be used to associate with jobs automatically created for the
        # new cluster.
        @[JSON::Field(key: "LongTermPricingIds")]
        getter long_term_pricing_ids : Array(String)?

        # The Amazon Simple Notification Service (Amazon SNS) notification settings for this cluster.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Specifies the service or services on the Snow Family device that your transferred data will be
        # exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3
        # and NFS (Network File System).
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        # Allows you to securely operate and manage Snow devices in a cluster remotely from outside of your
        # internal network. When set to INSTALLED_AUTOSTART , remote management will automatically be
        # available when the device arrives at your location. Otherwise, you need to use the Snowball Client
        # to manage the device.
        @[JSON::Field(key: "RemoteManagement")]
        getter remote_management : String?

        # The resources associated with the cluster job. These resources include Amazon S3 buckets and
        # optional Lambda functions written in the Python language.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The RoleARN that you want to associate with this cluster. RoleArn values are created by using the
        # CreateRole API action in Identity and Access Management (IAM).
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # If your job is being created in one of the US regions, you have the option of specifying what size
        # Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage
        # capacity. For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballCapacityPreference")]
        getter snowball_capacity_preference : String?

        # The tax documents required in your Amazon Web Services Region.
        @[JSON::Field(key: "TaxDocuments")]
        getter tax_documents : Types::TaxDocuments?

        def initialize(
          @address_id : String,
          @job_type : String,
          @shipping_option : String,
          @snowball_type : String,
          @description : String? = nil,
          @force_create_jobs : Bool? = nil,
          @forwarding_address_id : String? = nil,
          @initial_cluster_size : Int32? = nil,
          @kms_key_arn : String? = nil,
          @long_term_pricing_ids : Array(String)? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @remote_management : String? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @snowball_capacity_preference : String? = nil,
          @tax_documents : Types::TaxDocuments? = nil
        )
        end
      end

      struct CreateClusterResult
        include JSON::Serializable

        # The automatically generated ID for a cluster.
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # List of jobs created for this cluster. For syntax, see ListJobsResult$JobListEntries in this guide.
        @[JSON::Field(key: "JobListEntries")]
        getter job_list_entries : Array(Types::JobListEntry)?

        def initialize(
          @cluster_id : String? = nil,
          @job_list_entries : Array(Types::JobListEntry)? = nil
        )
        end
      end

      struct CreateJobRequest
        include JSON::Serializable

        # The ID for the address that you want the Snow device shipped to.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The ID of a cluster. If you're creating a job for a node in a cluster, you need to provide only this
        # clusterId value. The other job attributes are inherited from the cluster.
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # Defines an optional description of this specific job, for example Important Photos 2016-08-11 .
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Defines the device configuration for an Snowball Edge job. For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "DeviceConfiguration")]
        getter device_configuration : Types::DeviceConfiguration?

        # The forwarding address ID for a job. This field is not supported in most Regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # The highest impact level of data that will be stored or processed on the device, provided at job
        # creation.
        @[JSON::Field(key: "ImpactLevel")]
        getter impact_level : String?

        # Defines the type of job that you're creating.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # The KmsKeyARN that you want to associate with this job. KmsKeyARN s are created using the CreateKey
        # Key Management Service (KMS) API action.
        @[JSON::Field(key: "KmsKeyARN")]
        getter kms_key_arn : String?

        # The ID of the long-term pricing type for the device.
        @[JSON::Field(key: "LongTermPricingId")]
        getter long_term_pricing_id : String?

        # Defines the Amazon Simple Notification Service (Amazon SNS) notification settings for this job.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Specifies the service or services on the Snow Family device that your transferred data will be
        # exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network
        # File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        # Information identifying the person picking up the device.
        @[JSON::Field(key: "PickupDetails")]
        getter pickup_details : Types::PickupDetails?

        # Allows you to securely operate and manage Snowcone devices remotely from outside of your internal
        # network. When set to INSTALLED_AUTOSTART , remote management will automatically be available when
        # the device arrives at your location. Otherwise, you need to use the Snowball Edge client to manage
        # the device. When set to NOT_INSTALLED , remote management will not be available on the device.
        @[JSON::Field(key: "RemoteManagement")]
        getter remote_management : String?

        # Defines the Amazon S3 buckets associated with this job. With IMPORT jobs, you specify the bucket or
        # buckets that your transferred data will be imported into. With EXPORT jobs, you specify the bucket
        # or buckets that your transferred data will be exported from. Optionally, you can also specify a
        # KeyRange value. If you choose to export a range, you define the length of the range by providing
        # either an inclusive BeginMarker value, an inclusive EndMarker value, or both. Ranges are UTF-8
        # binary sorted.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The RoleARN that you want to associate with this job. RoleArn s are created using the CreateRole
        # Identity and Access Management (IAM) API action.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The shipping speed for this job. This speed doesn't dictate how soon you'll get the Snow device,
        # rather it represents how quickly the Snow device moves to its destination while in transit. Regional
        # shipping speeds are as follows: In Australia, you have access to express shipping. Typically, Snow
        # devices shipped express are delivered in about a day. In the European Union (EU), you have access to
        # express shipping. Typically, Snow devices shipped express are delivered in about a day. In addition,
        # most countries in the EU have access to standard shipping, which typically takes less than a week,
        # one way. In India, Snow devices are delivered in one to seven days. In the US, you have access to
        # one-day shipping and two-day shipping.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        # If your job is being created in one of the US regions, you have the option of specifying what size
        # Snow device you'd like for this job. In all other regions, Snowballs come with 80 TB in storage
        # capacity. For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballCapacityPreference")]
        getter snowball_capacity_preference : String?

        # The type of Snow Family devices to use for this job. For cluster jobs, Amazon Web Services Snow
        # Family currently supports only the EDGE device type. The type of Amazon Web Services Snow device to
        # use for this job. Currently, the only supported device type for cluster jobs is EDGE . For more
        # information, see Snowball Edge Device Options in the Snowball Edge Developer Guide. For more
        # information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
        # (Snow Family Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String?

        # The tax documents required in your Amazon Web Services Region.
        @[JSON::Field(key: "TaxDocuments")]
        getter tax_documents : Types::TaxDocuments?

        def initialize(
          @address_id : String? = nil,
          @cluster_id : String? = nil,
          @description : String? = nil,
          @device_configuration : Types::DeviceConfiguration? = nil,
          @forwarding_address_id : String? = nil,
          @impact_level : String? = nil,
          @job_type : String? = nil,
          @kms_key_arn : String? = nil,
          @long_term_pricing_id : String? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @pickup_details : Types::PickupDetails? = nil,
          @remote_management : String? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @shipping_option : String? = nil,
          @snowball_capacity_preference : String? = nil,
          @snowball_type : String? = nil,
          @tax_documents : Types::TaxDocuments? = nil
        )
        end
      end

      struct CreateJobResult
        include JSON::Serializable

        # The automatically generated ID for a job, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct CreateLongTermPricingRequest
        include JSON::Serializable

        # The type of long-term pricing option you want for the device, either 1-year or 3-year long-term
        # pricing.
        @[JSON::Field(key: "LongTermPricingType")]
        getter long_term_pricing_type : String

        # The type of Snow Family devices to use for the long-term pricing job.
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String

        # Specifies whether the current long-term pricing type for the device should be renewed.
        @[JSON::Field(key: "IsLongTermPricingAutoRenew")]
        getter is_long_term_pricing_auto_renew : Bool?

        def initialize(
          @long_term_pricing_type : String,
          @snowball_type : String,
          @is_long_term_pricing_auto_renew : Bool? = nil
        )
        end
      end

      struct CreateLongTermPricingResult
        include JSON::Serializable

        # The ID of the long-term pricing type for the device.
        @[JSON::Field(key: "LongTermPricingId")]
        getter long_term_pricing_id : String?

        def initialize(
          @long_term_pricing_id : String? = nil
        )
        end
      end

      struct CreateReturnShippingLabelRequest
        include JSON::Serializable

        # The ID for a job that you want to create the return shipping label for; for example,
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The shipping speed for a particular job. This speed doesn't dictate how soon the device is returned
        # to Amazon Web Services. This speed represents how quickly it moves to its destination while in
        # transit. Regional shipping speeds are as follows:
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        def initialize(
          @job_id : String,
          @shipping_option : String? = nil
        )
        end
      end

      struct CreateReturnShippingLabelResult
        include JSON::Serializable

        # The status information of the task on a Snow device that is being returned to Amazon Web Services.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Defines the real-time status of a Snow device's data transfer while the device is at Amazon Web
      # Services. This data is only available while a job has a JobState value of InProgress , for both
      # import and export jobs.
      struct DataTransfer
        include JSON::Serializable

        # The number of bytes transferred between a Snow device and Amazon S3.
        @[JSON::Field(key: "BytesTransferred")]
        getter bytes_transferred : Int64?

        # The number of objects transferred between a Snow device and Amazon S3.
        @[JSON::Field(key: "ObjectsTransferred")]
        getter objects_transferred : Int64?

        # The total bytes of data for a transfer between a Snow device and Amazon S3. This value is set to 0
        # (zero) until all the keys that will be transferred have been listed.
        @[JSON::Field(key: "TotalBytes")]
        getter total_bytes : Int64?

        # The total number of objects for a transfer between a Snow device and Amazon S3. This value is set to
        # 0 (zero) until all the keys that will be transferred have been listed.
        @[JSON::Field(key: "TotalObjects")]
        getter total_objects : Int64?

        def initialize(
          @bytes_transferred : Int64? = nil,
          @objects_transferred : Int64? = nil,
          @total_bytes : Int64? = nil,
          @total_objects : Int64? = nil
        )
        end
      end

      # The name and version of the service dependant on the requested service.
      struct DependentService
        include JSON::Serializable

        # The name of the dependent service.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # The version of the dependent service.
        @[JSON::Field(key: "ServiceVersion")]
        getter service_version : Types::ServiceVersion?

        def initialize(
          @service_name : String? = nil,
          @service_version : Types::ServiceVersion? = nil
        )
        end
      end

      struct DescribeAddressRequest
        include JSON::Serializable

        # The automatically generated ID for a specific address.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String

        def initialize(
          @address_id : String
        )
        end
      end

      struct DescribeAddressResult
        include JSON::Serializable

        # The address that you want the Snow device(s) associated with a specific job to be shipped to.
        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        def initialize(
          @address : Types::Address? = nil
        )
        end
      end

      struct DescribeAddressesRequest
        include JSON::Serializable

        # The number of ADDRESS objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of ADDRESS objects,
        # you have the option of specifying a value for NextToken as the starting point for your list of
        # returned addresses.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeAddressesResult
        include JSON::Serializable

        # The Snow device shipping addresses that were created for this account.
        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(Types::Address)?

        # HTTP requests are stateless. If you use the automatically generated NextToken value in your next
        # DescribeAddresses call, your list of returned addresses will start from this point in the array.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @addresses : Array(Types::Address)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeClusterRequest
        include JSON::Serializable

        # The automatically generated ID for a cluster.
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        def initialize(
          @cluster_id : String
        )
        end
      end

      struct DescribeClusterResult
        include JSON::Serializable

        # Information about a specific cluster, including shipping information, cluster status, and other
        # important metadata.
        @[JSON::Field(key: "ClusterMetadata")]
        getter cluster_metadata : Types::ClusterMetadata?

        def initialize(
          @cluster_metadata : Types::ClusterMetadata? = nil
        )
        end
      end

      struct DescribeJobRequest
        include JSON::Serializable

        # The automatically generated ID for a job, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeJobResult
        include JSON::Serializable

        # Information about a specific job, including shipping information, job status, and other important
        # metadata.
        @[JSON::Field(key: "JobMetadata")]
        getter job_metadata : Types::JobMetadata?

        # Information about a specific job part (in the case of an export job), including shipping
        # information, job status, and other important metadata.
        @[JSON::Field(key: "SubJobMetadata")]
        getter sub_job_metadata : Array(Types::JobMetadata)?

        def initialize(
          @job_metadata : Types::JobMetadata? = nil,
          @sub_job_metadata : Array(Types::JobMetadata)? = nil
        )
        end
      end

      struct DescribeReturnShippingLabelRequest
        include JSON::Serializable

        # The automatically generated ID for a job, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeReturnShippingLabelResult
        include JSON::Serializable

        # The expiration date of the current return shipping label.
        @[JSON::Field(key: "ExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # The pre-signed Amazon S3 URI used to download the return shipping label.
        @[JSON::Field(key: "ReturnShippingLabelURI")]
        getter return_shipping_label_uri : String?

        # The status information of the task on a Snow device that is being returned to Amazon Web Services.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @expiration_date : Time? = nil,
          @return_shipping_label_uri : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The container for SnowconeDeviceConfiguration .
      struct DeviceConfiguration
        include JSON::Serializable

        # Returns information about the device configuration for an Snowball Edge job.
        @[JSON::Field(key: "SnowconeDeviceConfiguration")]
        getter snowcone_device_configuration : Types::SnowconeDeviceConfiguration?

        def initialize(
          @snowcone_device_configuration : Types::SnowconeDeviceConfiguration? = nil
        )
        end
      end

      # An object representing the metadata and configuration settings of EKS Anywhere on the Snow Family
      # device.
      struct EKSOnDeviceServiceConfiguration
        include JSON::Serializable

        # The optional version of EKS Anywhere on the Snow Family device.
        @[JSON::Field(key: "EKSAnywhereVersion")]
        getter eks_anywhere_version : String?

        # The Kubernetes version for EKS Anywhere on the Snow Family device.
        @[JSON::Field(key: "KubernetesVersion")]
        getter kubernetes_version : String?

        def initialize(
          @eks_anywhere_version : String? = nil,
          @kubernetes_version : String? = nil
        )
        end
      end

      # A JSON-formatted object that contains the IDs for an Amazon Machine Image (AMI), including the
      # Amazon EC2-compatible AMI ID and the Snow device AMI ID. Each AMI has these two IDs to simplify
      # identifying the AMI in both the Amazon Web Services Cloud and on the device.
      struct Ec2AmiResource
        include JSON::Serializable

        # The ID of the AMI in Amazon EC2.
        @[JSON::Field(key: "AmiId")]
        getter ami_id : String

        # The ID of the AMI on the Snow device.
        @[JSON::Field(key: "SnowballAmiId")]
        getter snowball_ami_id : String?

        def initialize(
          @ami_id : String,
          @snowball_ami_id : String? = nil
        )
        end
      end

      # Your user lacks the necessary Amazon EC2 permissions to perform the attempted action.
      struct Ec2RequestFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The container for the EventTriggerDefinition$EventResourceARN .
      struct EventTriggerDefinition
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for any local Amazon S3 resource that is an Lambda function's event
        # trigger associated with this job.
        @[JSON::Field(key: "EventResourceARN")]
        getter event_resource_arn : String?

        def initialize(
          @event_resource_arn : String? = nil
        )
        end
      end

      struct GetJobManifestRequest
        include JSON::Serializable

        # The ID for a job that you want to get the manifest file for, for example
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetJobManifestResult
        include JSON::Serializable

        # The Amazon S3 presigned URL for the manifest file associated with the specified JobId value.
        @[JSON::Field(key: "ManifestURI")]
        getter manifest_uri : String?

        def initialize(
          @manifest_uri : String? = nil
        )
        end
      end

      struct GetJobUnlockCodeRequest
        include JSON::Serializable

        # The ID for the job that you want to get the UnlockCode value for, for example
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetJobUnlockCodeResult
        include JSON::Serializable

        # The UnlockCode value for the specified job. The UnlockCode value can be accessed for up to 360 days
        # after the job has been created.
        @[JSON::Field(key: "UnlockCode")]
        getter unlock_code : String?

        def initialize(
          @unlock_code : String? = nil
        )
        end
      end

      struct GetSnowballUsageRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetSnowballUsageResult
        include JSON::Serializable

        # The service limit for number of Snow devices this account can have at once. The default service
        # limit is 1 (one).
        @[JSON::Field(key: "SnowballLimit")]
        getter snowball_limit : Int32?

        # The number of Snow devices that this account is currently using.
        @[JSON::Field(key: "SnowballsInUse")]
        getter snowballs_in_use : Int32?

        def initialize(
          @snowball_limit : Int32? = nil,
          @snowballs_in_use : Int32? = nil
        )
        end
      end

      struct GetSoftwareUpdatesRequest
        include JSON::Serializable

        # The ID for a job that you want to get the software update file for, for example
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetSoftwareUpdatesResult
        include JSON::Serializable

        # The Amazon S3 presigned URL for the update file associated with the specified JobId value. The
        # software update will be available for 2 days after this request is made. To access an update after
        # the 2 days have passed, you'll have to make another call to GetSoftwareUpdates .
        @[JSON::Field(key: "UpdatesURI")]
        getter updates_uri : String?

        def initialize(
          @updates_uri : String? = nil
        )
        end
      end

      # The tax documents required in Amazon Web Services Region in India.
      struct INDTaxDocuments
        include JSON::Serializable

        # The Goods and Services Tax (GST) documents required in Amazon Web Services Region in India.
        @[JSON::Field(key: "GSTIN")]
        getter gstin : String?

        def initialize(
          @gstin : String? = nil
        )
        end
      end

      # The address provided was invalid. Check the address with your region's carrier, and try again.
      struct InvalidAddressException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Job or cluster creation failed. One or more inputs were invalid. Confirm that the
      # CreateClusterRequest$SnowballType value supports your CreateJobRequest$JobType , and try again.
      struct InvalidInputCombinationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action can't be performed because the job's current state doesn't allow that action to be
      # performed.
      struct InvalidJobStateException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The NextToken string was altered unexpectedly, and the operation has stopped. Run the operation
      # without changing the NextToken string, and try again.
      struct InvalidNextTokenException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource can't be found. Check the information you provided in your last request, and
      # try again.
      struct InvalidResourceException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The provided resource value is invalid.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Each JobListEntry object contains a job's state, a job's ID, and a value that indicates whether the
      # job is a job part, in the case of an export job.
      struct JobListEntry
        include JSON::Serializable

        # The creation date for this job.
        @[JSON::Field(key: "CreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The optional description of this specific job, for example Important Photos 2016-08-11 .
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A value that indicates that this job is a main job. A main job represents a successful request to
        # create an export job. Main jobs aren't associated with any Snowballs. Instead, each main job will
        # have at least one job part, and each job part is associated with a Snowball. It might take some time
        # before the job parts associated with a particular main job are listed, because they are created
        # after the main job is created.
        @[JSON::Field(key: "IsMaster")]
        getter is_master : Bool?

        # The automatically generated ID for a job, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current state of this job.
        @[JSON::Field(key: "JobState")]
        getter job_state : String?

        # The type of job.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # The type of device used with this job.
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String?

        def initialize(
          @creation_date : Time? = nil,
          @description : String? = nil,
          @is_master : Bool? = nil,
          @job_id : String? = nil,
          @job_state : String? = nil,
          @job_type : String? = nil,
          @snowball_type : String? = nil
        )
        end
      end

      # Contains job logs. Whenever a Snow device is used to import data into or export data out of Amazon
      # S3, you'll have the option of downloading a PDF job report. Job logs are returned as a part of the
      # response syntax of the DescribeJob action in the JobMetadata data type. The job logs can be accessed
      # for up to 60 minutes after this request has been made. To access any of the job logs after 60
      # minutes have passed, you'll have to make another call to the DescribeJob action. For import jobs,
      # the PDF job report becomes available at the end of the import process. For export jobs, your job
      # report typically becomes available while the Snow device for your job part is being delivered to
      # you. The job report provides you insight into the state of your Amazon S3 data transfer. The report
      # includes details about your job or job part for your records. For deeper visibility into the status
      # of your transferred objects, you can look at the two associated logs: a success log and a failure
      # log. The logs are saved in comma-separated value (CSV) format, and the name of each log includes the
      # ID of the job or job part that the log describes.
      struct JobLogs
        include JSON::Serializable

        # A link to an Amazon S3 presigned URL where the job completion report is located.
        @[JSON::Field(key: "JobCompletionReportURI")]
        getter job_completion_report_uri : String?

        # A link to an Amazon S3 presigned URL where the job failure log is located.
        @[JSON::Field(key: "JobFailureLogURI")]
        getter job_failure_log_uri : String?

        # A link to an Amazon S3 presigned URL where the job success log is located.
        @[JSON::Field(key: "JobSuccessLogURI")]
        getter job_success_log_uri : String?

        def initialize(
          @job_completion_report_uri : String? = nil,
          @job_failure_log_uri : String? = nil,
          @job_success_log_uri : String? = nil
        )
        end
      end

      # Contains information about a specific job including shipping information, job status, and other
      # important metadata. This information is returned as a part of the response syntax of the DescribeJob
      # action.
      struct JobMetadata
        include JSON::Serializable

        # The ID for the address that you want the Snow device shipped to.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The 39-character ID for the cluster, for example CID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String?

        # The creation date for this job.
        @[JSON::Field(key: "CreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A value that defines the real-time status of a Snow device's data transfer while the device is at
        # Amazon Web Services. This data is only available while a job has a JobState value of InProgress ,
        # for both import and export jobs.
        @[JSON::Field(key: "DataTransferProgress")]
        getter data_transfer_progress : Types::DataTransfer?

        # The description of the job, provided at job creation.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "DeviceConfiguration")]
        getter device_configuration : Types::DeviceConfiguration?

        # The ID of the address that you want a job shipped to, after it will be shipped to its primary
        # address. This field is not supported in most regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # The highest impact level of data that will be stored or processed on the device, provided at job
        # creation.
        @[JSON::Field(key: "ImpactLevel")]
        getter impact_level : String?

        # The automatically generated ID for a job, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Links to Amazon S3 presigned URLs for the job report and logs. For import jobs, the PDF job report
        # becomes available at the end of the import process. For export jobs, your job report typically
        # becomes available while the Snow device for your job part is being delivered to you.
        @[JSON::Field(key: "JobLogInfo")]
        getter job_log_info : Types::JobLogs?

        # The current status of the jobs.
        @[JSON::Field(key: "JobState")]
        getter job_state : String?

        # The type of job.
        @[JSON::Field(key: "JobType")]
        getter job_type : String?

        # The Amazon Resource Name (ARN) for the Key Management Service (KMS) key associated with this job.
        # This ARN was created using the CreateKey API action in KMS.
        @[JSON::Field(key: "KmsKeyARN")]
        getter kms_key_arn : String?

        # The ID of the long-term pricing type for the device.
        @[JSON::Field(key: "LongTermPricingId")]
        getter long_term_pricing_id : String?

        # The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific
        # job. The Notification object is returned as a part of the response syntax of the DescribeJob action
        # in the JobMetadata data type.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Represents metadata and configuration settings for services on an Amazon Web Services Snow Family
        # device.
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        # Information identifying the person picking up the device.
        @[JSON::Field(key: "PickupDetails")]
        getter pickup_details : Types::PickupDetails?

        # Allows you to securely operate and manage Snowcone devices remotely from outside of your internal
        # network. When set to INSTALLED_AUTOSTART , remote management will automatically be available when
        # the device arrives at your location. Otherwise, you need to use the Snowball Client to manage the
        # device.
        @[JSON::Field(key: "RemoteManagement")]
        getter remote_management : String?

        # An array of S3Resource objects. Each S3Resource object represents an Amazon S3 bucket that your
        # transferred data will be exported from or imported into.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The role ARN associated with this job. This ARN was created using the CreateRole API action in
        # Identity and Access Management.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # A job's shipping information, including inbound and outbound tracking numbers and shipping speed
        # options.
        @[JSON::Field(key: "ShippingDetails")]
        getter shipping_details : Types::ShippingDetails?

        # The Snow device capacity preference for this job, specified at job creation. In US regions, you can
        # choose between 50 TB and 80 TB Snowballs. All other regions use 80 TB capacity Snowballs. For more
        # information, see "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html"
        # (Snow Family Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballCapacityPreference")]
        getter snowball_capacity_preference : String?

        # Unique ID associated with a device.
        @[JSON::Field(key: "SnowballId")]
        getter snowball_id : String?

        # The type of device used with this job.
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String?

        # The metadata associated with the tax documents required in your Amazon Web Services Region.
        @[JSON::Field(key: "TaxDocuments")]
        getter tax_documents : Types::TaxDocuments?

        def initialize(
          @address_id : String? = nil,
          @cluster_id : String? = nil,
          @creation_date : Time? = nil,
          @data_transfer_progress : Types::DataTransfer? = nil,
          @description : String? = nil,
          @device_configuration : Types::DeviceConfiguration? = nil,
          @forwarding_address_id : String? = nil,
          @impact_level : String? = nil,
          @job_id : String? = nil,
          @job_log_info : Types::JobLogs? = nil,
          @job_state : String? = nil,
          @job_type : String? = nil,
          @kms_key_arn : String? = nil,
          @long_term_pricing_id : String? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @pickup_details : Types::PickupDetails? = nil,
          @remote_management : String? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @shipping_details : Types::ShippingDetails? = nil,
          @snowball_capacity_preference : String? = nil,
          @snowball_id : String? = nil,
          @snowball_type : String? = nil,
          @tax_documents : Types::TaxDocuments? = nil
        )
        end
      end

      # Contains an array of Amazon Web Services resource objects. Each object represents an Amazon S3
      # bucket, an Lambda function, or an Amazon Machine Image (AMI) based on Amazon EC2 that is associated
      # with a particular job.
      struct JobResource
        include JSON::Serializable

        # The Amazon Machine Images (AMIs) associated with this job.
        @[JSON::Field(key: "Ec2AmiResources")]
        getter ec2_ami_resources : Array(Types::Ec2AmiResource)?

        # The Python-language Lambda functions for this job.
        @[JSON::Field(key: "LambdaResources")]
        getter lambda_resources : Array(Types::LambdaResource)?

        # An array of S3Resource objects.
        @[JSON::Field(key: "S3Resources")]
        getter s3_resources : Array(Types::S3Resource)?

        def initialize(
          @ec2_ami_resources : Array(Types::Ec2AmiResource)? = nil,
          @lambda_resources : Array(Types::LambdaResource)? = nil,
          @s3_resources : Array(Types::S3Resource)? = nil
        )
        end
      end

      # The provided Key Management Service key lacks the permissions to perform the specified CreateJob or
      # UpdateJob action.
      struct KMSRequestFailedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains a key range. For export jobs, a S3Resource object can have an optional KeyRange value. The
      # length of the range is defined at job creation, and has either an inclusive BeginMarker , an
      # inclusive EndMarker , or both. Ranges are UTF-8 binary sorted.
      struct KeyRange
        include JSON::Serializable

        # The key that starts an optional key range for an export job. Ranges are inclusive and UTF-8 binary
        # sorted.
        @[JSON::Field(key: "BeginMarker")]
        getter begin_marker : String?

        # The key that ends an optional key range for an export job. Ranges are inclusive and UTF-8 binary
        # sorted.
        @[JSON::Field(key: "EndMarker")]
        getter end_marker : String?

        def initialize(
          @begin_marker : String? = nil,
          @end_marker : String? = nil
        )
        end
      end

      # Identifies
      struct LambdaResource
        include JSON::Serializable

        # The array of ARNs for S3Resource objects to trigger the LambdaResource objects associated with this
        # job.
        @[JSON::Field(key: "EventTriggers")]
        getter event_triggers : Array(Types::EventTriggerDefinition)?

        # An Amazon Resource Name (ARN) that represents an Lambda function to be triggered by PUT object
        # actions on the associated local Amazon S3 resource.
        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String?

        def initialize(
          @event_triggers : Array(Types::EventTriggerDefinition)? = nil,
          @lambda_arn : String? = nil
        )
        end
      end

      struct ListClusterJobsRequest
        include JSON::Serializable

        # The 39-character ID for the cluster that you want to list, for example
        # CID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The number of JobListEntry objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of JobListEntry
        # objects, you have the option of specifying NextToken as the starting point for your returned list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cluster_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClusterJobsResult
        include JSON::Serializable

        # Each JobListEntry object contains a job's state, a job's ID, and a value that indicates whether the
        # job is a job part, in the case of export jobs.
        @[JSON::Field(key: "JobListEntries")]
        getter job_list_entries : Array(Types::JobListEntry)?

        # HTTP requests are stateless. If you use the automatically generated NextToken value in your next
        # ListClusterJobsResult call, your list of returned jobs will start from this point in the array.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_list_entries : Array(Types::JobListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClustersRequest
        include JSON::Serializable

        # The number of ClusterListEntry objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of ClusterListEntry
        # objects, you have the option of specifying NextToken as the starting point for your returned list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClustersResult
        include JSON::Serializable

        # Each ClusterListEntry object contains a cluster's state, a cluster's ID, and other important status
        # information.
        @[JSON::Field(key: "ClusterListEntries")]
        getter cluster_list_entries : Array(Types::ClusterListEntry)?

        # HTTP requests are stateless. If you use the automatically generated NextToken value in your next
        # ClusterListEntry call, your list of returned clusters will start from this point in the array.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @cluster_list_entries : Array(Types::ClusterListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCompatibleImagesRequest
        include JSON::Serializable

        # The maximum number of results for the list of compatible images. Currently, a Snowball Edge device
        # can store 10 AMIs.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of compatible images,
        # you can specify a value for NextToken as the starting point for your list of returned images.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCompatibleImagesResult
        include JSON::Serializable

        # A JSON-formatted object that describes a compatible AMI, including the ID and name for a Snow device
        # AMI.
        @[JSON::Field(key: "CompatibleImages")]
        getter compatible_images : Array(Types::CompatibleImage)?

        # Because HTTP requests are stateless, this is the starting point for your next list of returned
        # images.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @compatible_images : Array(Types::CompatibleImage)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsRequest
        include JSON::Serializable

        # The number of JobListEntry objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of JobListEntry
        # objects, you have the option of specifying NextToken as the starting point for your returned list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsResult
        include JSON::Serializable

        # Each JobListEntry object contains a job's state, a job's ID, and a value that indicates whether the
        # job is a job part, in the case of export jobs.
        @[JSON::Field(key: "JobListEntries")]
        getter job_list_entries : Array(Types::JobListEntry)?

        # HTTP requests are stateless. If you use this automatically generated NextToken value in your next
        # ListJobs call, your returned JobListEntry objects will start from this point in the array.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_list_entries : Array(Types::JobListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLongTermPricingRequest
        include JSON::Serializable

        # The maximum number of ListLongTermPricing objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Because HTTP requests are stateless, this is the starting point for your next list of
        # ListLongTermPricing to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLongTermPricingResult
        include JSON::Serializable

        # Each LongTermPricingEntry object contains a status, ID, and other information about the
        # LongTermPricing type.
        @[JSON::Field(key: "LongTermPricingEntries")]
        getter long_term_pricing_entries : Array(Types::LongTermPricingListEntry)?

        # Because HTTP requests are stateless, this is the starting point for your next list of returned
        # ListLongTermPricing list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @long_term_pricing_entries : Array(Types::LongTermPricingListEntry)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPickupLocationsRequest
        include JSON::Serializable

        # The maximum number of locations to list per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # HTTP requests are stateless. To identify what object comes "next" in the list of
        # ListPickupLocationsRequest objects, you have the option of specifying NextToken as the starting
        # point for your returned list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPickupLocationsResult
        include JSON::Serializable

        # Information about the address of pickup locations.
        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(Types::Address)?

        # HTTP requests are stateless. To identify what object comes "next" in the list of
        # ListPickupLocationsResult objects, you have the option of specifying NextToken as the starting point
        # for your returned list.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @addresses : Array(Types::Address)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceVersionsRequest
        include JSON::Serializable

        # The name of the service for which you're requesting supported versions.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # A list of names and versions of dependant services of the requested service.
        @[JSON::Field(key: "DependentServices")]
        getter dependent_services : Array(Types::DependentService)?

        # The maximum number of ListServiceVersions objects to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Because HTTP requests are stateless, this is the starting point for the next list of returned
        # ListServiceVersionsRequest versions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_name : String,
          @dependent_services : Array(Types::DependentService)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceVersionsResult
        include JSON::Serializable

        # The name of the service for which the system provided supported versions.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # A list of supported versions.
        @[JSON::Field(key: "ServiceVersions")]
        getter service_versions : Array(Types::ServiceVersion)

        # A list of names and versions of dependant services of the service for which the system provided
        # supported versions.
        @[JSON::Field(key: "DependentServices")]
        getter dependent_services : Array(Types::DependentService)?

        # Because HTTP requests are stateless, this is the starting point of the next list of returned
        # ListServiceVersionsResult results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_name : String,
          @service_versions : Array(Types::ServiceVersion),
          @dependent_services : Array(Types::DependentService)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Each LongTermPricingListEntry object contains information about a long-term pricing type.
      struct LongTermPricingListEntry
        include JSON::Serializable

        # The current active jobs on the device the long-term pricing type.
        @[JSON::Field(key: "CurrentActiveJob")]
        getter current_active_job : String?

        # If set to true , specifies that the current long-term pricing type for the device should be
        # automatically renewed before the long-term pricing contract expires.
        @[JSON::Field(key: "IsLongTermPricingAutoRenew")]
        getter is_long_term_pricing_auto_renew : Bool?

        # The IDs of the jobs that are associated with a long-term pricing type.
        @[JSON::Field(key: "JobIds")]
        getter job_ids : Array(String)?

        # The end date the long-term pricing contract.
        @[JSON::Field(key: "LongTermPricingEndDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter long_term_pricing_end_date : Time?

        # The ID of the long-term pricing type for the device.
        @[JSON::Field(key: "LongTermPricingId")]
        getter long_term_pricing_id : String?

        # The start date of the long-term pricing contract.
        @[JSON::Field(key: "LongTermPricingStartDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter long_term_pricing_start_date : Time?

        # The status of the long-term pricing type.
        @[JSON::Field(key: "LongTermPricingStatus")]
        getter long_term_pricing_status : String?

        # The type of long-term pricing that was selected for the device.
        @[JSON::Field(key: "LongTermPricingType")]
        getter long_term_pricing_type : String?

        # A new device that replaces a device that is ordered with long-term pricing.
        @[JSON::Field(key: "ReplacementJob")]
        getter replacement_job : String?

        # The type of Snow Family devices associated with this long-term pricing job.
        @[JSON::Field(key: "SnowballType")]
        getter snowball_type : String?

        def initialize(
          @current_active_job : String? = nil,
          @is_long_term_pricing_auto_renew : Bool? = nil,
          @job_ids : Array(String)? = nil,
          @long_term_pricing_end_date : Time? = nil,
          @long_term_pricing_id : String? = nil,
          @long_term_pricing_start_date : Time? = nil,
          @long_term_pricing_status : String? = nil,
          @long_term_pricing_type : String? = nil,
          @replacement_job : String? = nil,
          @snowball_type : String? = nil
        )
        end
      end

      # An object that represents the metadata and configuration settings for the NFS (Network File System)
      # service on an Amazon Web Services Snow Family device.
      struct NFSOnDeviceServiceConfiguration
        include JSON::Serializable

        # The maximum NFS storage for one Snow Family device.
        @[JSON::Field(key: "StorageLimit")]
        getter storage_limit : Int32?

        # The scale unit of the NFS storage on the device. Valid values: TB.
        @[JSON::Field(key: "StorageUnit")]
        getter storage_unit : String?

        def initialize(
          @storage_limit : Int32? = nil,
          @storage_unit : String? = nil
        )
        end
      end

      # The Amazon Simple Notification Service (Amazon SNS) notification settings associated with a specific
      # job. The Notification object is returned as a part of the response syntax of the DescribeJob action
      # in the JobMetadata data type. When the notification settings are defined during job creation, you
      # can choose to notify based on a specific set of job states using the JobStatesToNotify array of
      # strings, or you can specify that you want to have Amazon SNS notifications sent out for all job
      # states with NotifyAll set to true.
      struct Notification
        include JSON::Serializable

        # Used to send SNS notifications for the person picking up the device (identified during job
        # creation).
        @[JSON::Field(key: "DevicePickupSnsTopicARN")]
        getter device_pickup_sns_topic_arn : String?

        # The list of job states that will trigger a notification for this job.
        @[JSON::Field(key: "JobStatesToNotify")]
        getter job_states_to_notify : Array(String)?

        # Any change in job state will trigger a notification for this job.
        @[JSON::Field(key: "NotifyAll")]
        getter notify_all : Bool?

        # The new SNS TopicArn that you want to associate with this job. You can create Amazon Resource Names
        # (ARNs) for topics by using the CreateTopic Amazon SNS API action. You can subscribe email addresses
        # to an Amazon SNS topic through the Amazon Web Services Management Console, or by using the Subscribe
        # Amazon Simple Notification Service (Amazon SNS) API action.
        @[JSON::Field(key: "SnsTopicARN")]
        getter sns_topic_arn : String?

        def initialize(
          @device_pickup_sns_topic_arn : String? = nil,
          @job_states_to_notify : Array(String)? = nil,
          @notify_all : Bool? = nil,
          @sns_topic_arn : String? = nil
        )
        end
      end

      # An object that represents the metadata and configuration settings for services on an Amazon Web
      # Services Snow Family device.
      struct OnDeviceServiceConfiguration
        include JSON::Serializable

        # The configuration of EKS Anywhere on the Snow Family device.
        @[JSON::Field(key: "EKSOnDeviceService")]
        getter eks_on_device_service : Types::EKSOnDeviceServiceConfiguration?

        # Represents the NFS (Network File System) service on a Snow Family device.
        @[JSON::Field(key: "NFSOnDeviceService")]
        getter nfs_on_device_service : Types::NFSOnDeviceServiceConfiguration?

        # Configuration for Amazon S3 compatible storage on Snow family devices.
        @[JSON::Field(key: "S3OnDeviceService")]
        getter s3_on_device_service : Types::S3OnDeviceServiceConfiguration?

        # Represents the Storage Gateway service Tape Gateway type on a Snow Family device.
        @[JSON::Field(key: "TGWOnDeviceService")]
        getter tgw_on_device_service : Types::TGWOnDeviceServiceConfiguration?

        def initialize(
          @eks_on_device_service : Types::EKSOnDeviceServiceConfiguration? = nil,
          @nfs_on_device_service : Types::NFSOnDeviceServiceConfiguration? = nil,
          @s3_on_device_service : Types::S3OnDeviceServiceConfiguration? = nil,
          @tgw_on_device_service : Types::TGWOnDeviceServiceConfiguration? = nil
        )
        end
      end

      # Information identifying the person picking up the device.
      struct PickupDetails
        include JSON::Serializable

        # The unique ID for a device that will be picked up.
        @[JSON::Field(key: "DevicePickupId")]
        getter device_pickup_id : String?

        # The email address of the person picking up the device.
        @[JSON::Field(key: "Email")]
        getter email : String?

        # Expiration date of the credential identifying the person picking up the device.
        @[JSON::Field(key: "IdentificationExpirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter identification_expiration_date : Time?

        # Organization that issued the credential identifying the person picking up the device.
        @[JSON::Field(key: "IdentificationIssuingOrg")]
        getter identification_issuing_org : String?

        # The number on the credential identifying the person picking up the device.
        @[JSON::Field(key: "IdentificationNumber")]
        getter identification_number : String?

        # The name of the person picking up the device.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The phone number of the person picking up the device.
        @[JSON::Field(key: "PhoneNumber")]
        getter phone_number : String?

        def initialize(
          @device_pickup_id : String? = nil,
          @email : String? = nil,
          @identification_expiration_date : Time? = nil,
          @identification_issuing_org : String? = nil,
          @identification_number : String? = nil,
          @name : String? = nil,
          @phone_number : String? = nil
        )
        end
      end

      # You get this exception if you call CreateReturnShippingLabel and a valid return shipping label
      # already exists. In this case, use DescribeReturnShippingLabel to get the URL.
      struct ReturnShippingLabelAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon S3 compatible storage on Snow family devices configuration items.
      struct S3OnDeviceServiceConfiguration
        include JSON::Serializable

        # &gt;Fault tolerance level of the cluster. This indicates the number of nodes that can go down
        # without degrading the performance of the cluster. This additional input helps when the specified
        # StorageLimit matches more than one Amazon S3 compatible storage on Snow family devices service
        # configuration.
        @[JSON::Field(key: "FaultTolerance")]
        getter fault_tolerance : Int32?

        # Applicable when creating a cluster. Specifies how many nodes are needed for Amazon S3 compatible
        # storage on Snow family devices. If specified, the other input can be omitted.
        @[JSON::Field(key: "ServiceSize")]
        getter service_size : Int32?

        # If the specified storage limit value matches storage limit of one of the defined configurations,
        # that configuration will be used. If the specified storage limit value does not match any defined
        # configuration, the request will fail. If more than one configuration has the same storage limit as
        # specified, the other input need to be provided.
        @[JSON::Field(key: "StorageLimit")]
        getter storage_limit : Float64?

        # Storage unit. Currently the only supported unit is TB.
        @[JSON::Field(key: "StorageUnit")]
        getter storage_unit : String?

        def initialize(
          @fault_tolerance : Int32? = nil,
          @service_size : Int32? = nil,
          @storage_limit : Float64? = nil,
          @storage_unit : String? = nil
        )
        end
      end

      # Each S3Resource object represents an Amazon S3 bucket that your transferred data will be exported
      # from or imported into. For export jobs, this object can have an optional KeyRange value. The length
      # of the range is defined at job creation, and has either an inclusive BeginMarker , an inclusive
      # EndMarker , or both. Ranges are UTF-8 binary sorted.
      struct S3Resource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Amazon S3 bucket.
        @[JSON::Field(key: "BucketArn")]
        getter bucket_arn : String?

        # For export jobs, you can provide an optional KeyRange within a specific Amazon S3 bucket. The length
        # of the range is defined at job creation, and has either an inclusive BeginMarker , an inclusive
        # EndMarker , or both. Ranges are UTF-8 binary sorted.
        @[JSON::Field(key: "KeyRange")]
        getter key_range : Types::KeyRange?

        # Specifies the service or services on the Snow Family device that your transferred data will be
        # exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network
        # File System).
        @[JSON::Field(key: "TargetOnDeviceServices")]
        getter target_on_device_services : Array(Types::TargetOnDeviceService)?

        def initialize(
          @bucket_arn : String? = nil,
          @key_range : Types::KeyRange? = nil,
          @target_on_device_services : Array(Types::TargetOnDeviceService)? = nil
        )
        end
      end

      # The version of the requested service.
      struct ServiceVersion
        include JSON::Serializable

        # The version number of the requested service.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @version : String? = nil
        )
        end
      end

      # The Status and TrackingNumber information for an inbound or outbound shipment.
      struct Shipment
        include JSON::Serializable

        # Status information for a shipment.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The tracking number for this job. Using this tracking number with your region's carrier's website,
        # you can track a Snow device as the carrier transports it. For India, the carrier is Amazon
        # Logistics. For all other regions, UPS is the carrier.
        @[JSON::Field(key: "TrackingNumber")]
        getter tracking_number : String?

        def initialize(
          @status : String? = nil,
          @tracking_number : String? = nil
        )
        end
      end

      # A job's shipping information, including inbound and outbound tracking numbers and shipping speed
      # options.
      struct ShippingDetails
        include JSON::Serializable

        # The Status and TrackingNumber values for a Snow device being returned to Amazon Web Services for a
        # particular job.
        @[JSON::Field(key: "InboundShipment")]
        getter inbound_shipment : Types::Shipment?

        # The Status and TrackingNumber values for a Snow device being delivered to the address that you
        # specified for a particular job.
        @[JSON::Field(key: "OutboundShipment")]
        getter outbound_shipment : Types::Shipment?

        # The shipping speed for a particular job. This speed doesn't dictate how soon you'll get the Snow
        # device from the job's creation date. This speed represents how quickly it moves to its destination
        # while in transit. Regional shipping speeds are as follows: In Australia, you have access to express
        # shipping. Typically, Snow devices shipped express are delivered in about a day. In the European
        # Union (EU), you have access to express shipping. Typically, Snow devices shipped express are
        # delivered in about a day. In addition, most countries in the EU have access to standard shipping,
        # which typically takes less than a week, one way. In India, Snow devices are delivered in one to
        # seven days. In the United States of America (US), you have access to one-day shipping and two-day
        # shipping.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        def initialize(
          @inbound_shipment : Types::Shipment? = nil,
          @outbound_shipment : Types::Shipment? = nil,
          @shipping_option : String? = nil
        )
        end
      end

      # Specifies the device configuration for an Snowball Edge job.
      struct SnowconeDeviceConfiguration
        include JSON::Serializable

        # Configures the wireless connection for the Snowball Edge device.
        @[JSON::Field(key: "WirelessConnection")]
        getter wireless_connection : Types::WirelessConnection?

        def initialize(
          @wireless_connection : Types::WirelessConnection? = nil
        )
        end
      end

      # An object that represents the metadata and configuration settings for the Storage Gateway service
      # Tape Gateway type on an Amazon Web Services Snow Family device.
      struct TGWOnDeviceServiceConfiguration
        include JSON::Serializable

        # The maximum number of virtual tapes to store on one Snow Family device. Due to physical resource
        # limitations, this value must be set to 80 for Snowball Edge.
        @[JSON::Field(key: "StorageLimit")]
        getter storage_limit : Int32?

        # The scale unit of the virtual tapes on the device.
        @[JSON::Field(key: "StorageUnit")]
        getter storage_unit : String?

        def initialize(
          @storage_limit : Int32? = nil,
          @storage_unit : String? = nil
        )
        end
      end

      # An object that represents the service or services on the Snow Family device that your transferred
      # data will be exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and
      # NFS (Network File System).
      struct TargetOnDeviceService
        include JSON::Serializable

        # Specifies the name of the service on the Snow Family device that your transferred data will be
        # exported from or imported into.
        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        # Specifies whether the data is being imported or exported. You can import or export the data, or use
        # it locally on the device.
        @[JSON::Field(key: "TransferOption")]
        getter transfer_option : String?

        def initialize(
          @service_name : String? = nil,
          @transfer_option : String? = nil
        )
        end
      end

      # The tax documents required in your Amazon Web Services Region.
      struct TaxDocuments
        include JSON::Serializable

        @[JSON::Field(key: "IND")]
        getter ind : Types::INDTaxDocuments?

        def initialize(
          @ind : Types::INDTaxDocuments? = nil
        )
        end
      end

      # The address is either outside the serviceable area for your region, or an error occurred. Check the
      # address with your region's carrier and try again. If the issue persists, contact Amazon Web Services
      # Support.
      struct UnsupportedAddressException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UpdateClusterRequest
        include JSON::Serializable

        # The cluster ID of the cluster that you want to update, for example
        # CID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "ClusterId")]
        getter cluster_id : String

        # The ID of the updated Address object.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The updated description of this cluster.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated ID for the forwarding address for a cluster. This field is not supported in most
        # regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # The new or updated Notification object.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Specifies the service or services on the Snow Family device that your transferred data will be
        # exported from or imported into. Amazon Web Services Snow Family device clusters support Amazon S3
        # and NFS (Network File System).
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        # The updated arrays of JobResource objects that can include updated S3Resource objects or
        # LambdaResource objects.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The new role Amazon Resource Name (ARN) that you want to associate with this cluster. To create a
        # role ARN, use the CreateRole API action in Identity and Access Management (IAM).
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The updated shipping option value of this cluster's ShippingDetails object.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        def initialize(
          @cluster_id : String,
          @address_id : String? = nil,
          @description : String? = nil,
          @forwarding_address_id : String? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @shipping_option : String? = nil
        )
        end
      end

      struct UpdateClusterResult
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateJobRequest
        include JSON::Serializable

        # The job ID of the job that you want to update, for example JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The ID of the updated Address object.
        @[JSON::Field(key: "AddressId")]
        getter address_id : String?

        # The updated description of this job's JobMetadata object.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated ID for the forwarding address for a job. This field is not supported in most regions.
        @[JSON::Field(key: "ForwardingAddressId")]
        getter forwarding_address_id : String?

        # The new or updated Notification object.
        @[JSON::Field(key: "Notification")]
        getter notification : Types::Notification?

        # Specifies the service or services on the Snow Family device that your transferred data will be
        # exported from or imported into. Amazon Web Services Snow Family supports Amazon S3 and NFS (Network
        # File System) and the Amazon Web Services Storage Gateway service Tape Gateway type.
        @[JSON::Field(key: "OnDeviceServiceConfiguration")]
        getter on_device_service_configuration : Types::OnDeviceServiceConfiguration?

        @[JSON::Field(key: "PickupDetails")]
        getter pickup_details : Types::PickupDetails?

        # The updated JobResource object, or the updated JobResource object.
        @[JSON::Field(key: "Resources")]
        getter resources : Types::JobResource?

        # The new role Amazon Resource Name (ARN) that you want to associate with this job. To create a role
        # ARN, use the CreateRole Identity and Access Management (IAM) API action.
        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String?

        # The updated shipping option value of this job's ShippingDetails object.
        @[JSON::Field(key: "ShippingOption")]
        getter shipping_option : String?

        # The updated SnowballCapacityPreference of this job's JobMetadata object. The 50 TB Snowballs are
        # only available in the US regions. For more information, see
        # "https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide or
        # "https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html" (Snow Family
        # Devices and Capacity) in the Snowcone User Guide .
        @[JSON::Field(key: "SnowballCapacityPreference")]
        getter snowball_capacity_preference : String?

        def initialize(
          @job_id : String,
          @address_id : String? = nil,
          @description : String? = nil,
          @forwarding_address_id : String? = nil,
          @notification : Types::Notification? = nil,
          @on_device_service_configuration : Types::OnDeviceServiceConfiguration? = nil,
          @pickup_details : Types::PickupDetails? = nil,
          @resources : Types::JobResource? = nil,
          @role_arn : String? = nil,
          @shipping_option : String? = nil,
          @snowball_capacity_preference : String? = nil
        )
        end
      end

      struct UpdateJobResult
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateJobShipmentStateRequest
        include JSON::Serializable

        # The job ID of the job whose shipment date you want to update, for example
        # JID123e4567-e89b-12d3-a456-426655440000 .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The state of a device when it is being shipped. Set to RECEIVED when the device arrives at your
        # location. Set to RETURNED when you have returned the device to Amazon Web Services.
        @[JSON::Field(key: "ShipmentState")]
        getter shipment_state : String

        def initialize(
          @job_id : String,
          @shipment_state : String
        )
        end
      end

      struct UpdateJobShipmentStateResult
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateLongTermPricingRequest
        include JSON::Serializable

        # The ID of the long-term pricing type for the device.
        @[JSON::Field(key: "LongTermPricingId")]
        getter long_term_pricing_id : String

        # If set to true , specifies that the current long-term pricing type for the device should be
        # automatically renewed before the long-term pricing contract expires.
        @[JSON::Field(key: "IsLongTermPricingAutoRenew")]
        getter is_long_term_pricing_auto_renew : Bool?

        # Specifies that a device that is ordered with long-term pricing should be replaced with a new device.
        @[JSON::Field(key: "ReplacementJob")]
        getter replacement_job : String?

        def initialize(
          @long_term_pricing_id : String,
          @is_long_term_pricing_auto_renew : Bool? = nil,
          @replacement_job : String? = nil
        )
        end
      end

      struct UpdateLongTermPricingResult
        include JSON::Serializable

        def initialize
        end
      end

      # Configures the wireless connection on an Snowball Edge device.
      struct WirelessConnection
        include JSON::Serializable

        # Enables the Wi-Fi adapter on an Snowball Edge device.
        @[JSON::Field(key: "IsWifiEnabled")]
        getter is_wifi_enabled : Bool?

        def initialize(
          @is_wifi_enabled : Bool? = nil
        )
        end
      end
    end
  end
end
