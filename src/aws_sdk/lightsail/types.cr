require "json"
require "time"

module AwsSdk
  module Lightsail
    module Types

      # Lightsail throws this exception when the user cannot be authenticated or uses invalid credentials to
      # access a resource.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      # Describes an access key for an Amazon Lightsail bucket. Access keys grant full programmatic access
      # to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use
      # the CreateBucketAccessKey action to create an access key for a specific bucket. For more information
      # about access keys, see Creating access keys for a bucket in Amazon Lightsail in the Amazon Lightsail
      # Developer Guide . The secretAccessKey value is returned only in response to the
      # CreateBucketAccessKey action. You can get a secret access key only when you first create an access
      # key; you cannot get the secret access key later. If you lose the secret access key, you must create
      # a new access key.
      struct AccessKey
        include JSON::Serializable

        # The ID of the access key.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String?

        # The timestamp when the access key was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the last time the access key was used. This object does not include data in
        # the response of a CreateBucketAccessKey action. If the access key has not been used, the region and
        # serviceName values are N/A , and the lastUsedDate value is null.
        @[JSON::Field(key: "lastUsed")]
        getter last_used : Types::AccessKeyLastUsed?

        # The secret access key used to sign requests. You should store the secret access key in a safe
        # location. We recommend that you delete the access key if the secret access key is compromised.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String?

        # The status of the access key. A status of Active means that the key is valid, while Inactive means
        # it is not.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @access_key_id : String? = nil,
          @created_at : Time? = nil,
          @last_used : Types::AccessKeyLastUsed? = nil,
          @secret_access_key : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the last time an access key was used. This object does not include data in the response of
      # a CreateBucketAccessKey action.
      struct AccessKeyLastUsed
        include JSON::Serializable

        # The date and time when the access key was most recently used. This value is null if the access key
        # has not been used.
        @[JSON::Field(key: "lastUsedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_used_date : Time?

        # The Amazon Web Services Region where this access key was most recently used. This value is N/A if
        # the access key has not been used.
        @[JSON::Field(key: "region")]
        getter region : String?

        # The name of the Amazon Web Services service with which this access key was most recently used. This
        # value is N/A if the access key has not been used.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @last_used_date : Time? = nil,
          @region : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Describes the anonymous access permissions for an Amazon Lightsail bucket and its objects. For more
      # information about bucket access permissions, see Understanding bucket permissions in Amazon
      # Lightsail in the Amazon Lightsail Developer Guide .
      struct AccessRules
        include JSON::Serializable

        # A Boolean value that indicates whether the access control list (ACL) permissions that are applied to
        # individual objects override the getObject option that is currently specified. When this is true, you
        # can use the PutObjectAcl Amazon S3 API action to set individual objects to public (read-only) using
        # the public-read ACL, or to private using the private ACL.
        @[JSON::Field(key: "allowPublicOverrides")]
        getter allow_public_overrides : Bool?

        # Specifies the anonymous access to all objects in a bucket. The following options can be specified:
        # public - Sets all objects in the bucket to public (read-only), making them readable by anyone in the
        # world. If the getObject value is set to public , then all objects in the bucket default to public
        # regardless of the allowPublicOverrides value. private - Sets all objects in the bucket to private,
        # making them readable only by you or anyone you give access to. If the getObject value is set to
        # private , and the allowPublicOverrides value is set to true , then all objects in the bucket default
        # to private unless they are configured with a public-read ACL. Individual objects with a public-read
        # ACL are readable by anyone in the world.
        @[JSON::Field(key: "getObject")]
        getter get_object : String?

        def initialize(
          @allow_public_overrides : Bool? = nil,
          @get_object : String? = nil
        )
        end
      end

      # Describes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level
      # block public access (BPA) feature for your Lightsail buckets. The account-level BPA feature of
      # Amazon S3 provides centralized controls to limit public access to all Amazon S3 buckets in an
      # account. BPA can make all Amazon S3 buckets in an Amazon Web Services account private regardless of
      # the individual bucket and object permissions that are configured. Lightsail buckets take into
      # account the Amazon S3 account-level BPA configuration when allowing or denying public access. To do
      # this, Lightsail periodically fetches the account-level BPA configuration from Amazon S3. When the
      # account-level BPA status is InSync , the Amazon S3 account-level BPA configuration is synchronized
      # and it applies to your Lightsail buckets. For more information about Amazon Simple Storage Service
      # account-level BPA and how it affects Lightsail buckets, see Block public access for buckets in
      # Amazon Lightsail in the Amazon Lightsail Developer Guide .
      struct AccountLevelBpaSync
        include JSON::Serializable

        # A Boolean value that indicates whether account-level block public access is affecting your Lightsail
        # buckets.
        @[JSON::Field(key: "bpaImpactsLightsail")]
        getter bpa_impacts_lightsail : Bool?

        # The timestamp of when the account-level BPA configuration was last synchronized. This value is null
        # when the account-level BPA configuration has not been synchronized.
        @[JSON::Field(key: "lastSyncedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_synced_at : Time?

        # A message that provides a reason for a Failed or Defaulted synchronization status. The following
        # messages are possible: SYNC_ON_HOLD - The synchronization has not yet happened. This status message
        # occurs immediately after you create your first Lightsail bucket. This status message should change
        # after the first synchronization happens, approximately 1 hour after the first bucket is created.
        # DEFAULTED_FOR_SLR_MISSING - The synchronization failed because the required service-linked role is
        # missing from your Amazon Web Services account. The account-level BPA configuration for your
        # Lightsail buckets is defaulted to active until the synchronization can occur. This means that all
        # your buckets are private and not publicly accessible. For more information about how to create the
        # required service-linked role to allow synchronization, see Using Service-Linked Roles for Amazon
        # Lightsail in the Amazon Lightsail Developer Guide . DEFAULTED_FOR_SLR_MISSING_ON_HOLD - The
        # synchronization failed because the required service-linked role is missing from your Amazon Web
        # Services account. Account-level BPA is not yet configured for your Lightsail buckets. Therefore,
        # only the bucket access permissions and individual object access permissions apply to your Lightsail
        # buckets. For more information about how to create the required service-linked role to allow
        # synchronization, see Using Service-Linked Roles for Amazon Lightsail in the Amazon Lightsail
        # Developer Guide . Unknown - The reason that synchronization failed is unknown. Contact Amazon Web
        # Services Support for more information.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The status of the account-level BPA synchronization. The following statuses are possible: InSync -
        # Account-level BPA is synchronized. The Amazon S3 account-level BPA configuration applies to your
        # Lightsail buckets. NeverSynced - Synchronization has not yet happened. The Amazon S3 account-level
        # BPA configuration does not apply to your Lightsail buckets. Failed - Synchronization failed. The
        # Amazon S3 account-level BPA configuration does not apply to your Lightsail buckets. Defaulted -
        # Synchronization failed and account-level BPA for your Lightsail buckets is defaulted to active . You
        # might need to complete further actions if the status is Failed or Defaulted . The message parameter
        # provides more information for those statuses.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @bpa_impacts_lightsail : Bool? = nil,
          @last_synced_at : Time? = nil,
          @message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Lightsail throws this exception when an account is still in the setup in progress state.
      struct AccountSetupInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      # Describes an add-on that is enabled for an Amazon Lightsail resource.
      struct AddOn
        include JSON::Serializable

        # The amount of idle time in minutes after which your virtual computer will automatically stop. This
        # add-on only applies to Lightsail for Research resources.
        @[JSON::Field(key: "duration")]
        getter duration : String?

        # The name of the add-on.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The next daily time an automatic snapshot will be created. The time shown is in HH:00 format, and in
        # Coordinated Universal Time (UTC). The snapshot is automatically created between the time shown and
        # up to 45 minutes after.
        @[JSON::Field(key: "nextSnapshotTimeOfDay")]
        getter next_snapshot_time_of_day : String?

        # The daily time when an automatic snapshot is created. The time shown is in HH:00 format, and in
        # Coordinated Universal Time (UTC). The snapshot is automatically created between the time shown and
        # up to 45 minutes after.
        @[JSON::Field(key: "snapshotTimeOfDay")]
        getter snapshot_time_of_day : String?

        # The status of the add-on.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The trigger threshold of the action. This add-on only applies to Lightsail for Research resources.
        @[JSON::Field(key: "threshold")]
        getter threshold : String?

        def initialize(
          @duration : String? = nil,
          @name : String? = nil,
          @next_snapshot_time_of_day : String? = nil,
          @snapshot_time_of_day : String? = nil,
          @status : String? = nil,
          @threshold : String? = nil
        )
        end
      end

      # Describes a request to enable, modify, or disable an add-on for an Amazon Lightsail resource. An
      # additional cost may be associated with enabling add-ons. For more information, see the Lightsail
      # pricing page .
      struct AddOnRequest
        include JSON::Serializable

        # The add-on type.
        @[JSON::Field(key: "addOnType")]
        getter add_on_type : String

        # An object that represents additional parameters when enabling or modifying the automatic snapshot
        # add-on.
        @[JSON::Field(key: "autoSnapshotAddOnRequest")]
        getter auto_snapshot_add_on_request : Types::AutoSnapshotAddOnRequest?

        # An object that represents additional parameters when enabling or modifying the StopInstanceOnIdle
        # add-on. This object only applies to Lightsail for Research resources.
        @[JSON::Field(key: "stopInstanceOnIdleRequest")]
        getter stop_instance_on_idle_request : Types::StopInstanceOnIdleRequest?

        def initialize(
          @add_on_type : String,
          @auto_snapshot_add_on_request : Types::AutoSnapshotAddOnRequest? = nil,
          @stop_instance_on_idle_request : Types::StopInstanceOnIdleRequest? = nil
        )
        end
      end

      # Describes an alarm. An alarm is a way to monitor your Lightsail resource metrics. For more
      # information, see Alarms in Amazon Lightsail .
      struct Alarm
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alarm.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The arithmetic operation used when comparing the specified statistic and threshold.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String?

        # The contact protocols for the alarm, such as Email , SMS (text messaging), or both.
        @[JSON::Field(key: "contactProtocols")]
        getter contact_protocols : Array(String)?

        # The timestamp when the alarm was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The number of data points that must not within the specified threshold to trigger the alarm.
        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # The number of periods over which data is compared to the specified threshold.
        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32?

        # An object that lists information about the location of the alarm.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the metric associated with the alarm.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # An object that lists information about the resource monitored by the alarm.
        @[JSON::Field(key: "monitoredResourceInfo")]
        getter monitored_resource_info : Types::MonitoredResourceInfo?

        # The name of the alarm.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates whether the alarm is enabled.
        @[JSON::Field(key: "notificationEnabled")]
        getter notification_enabled : Bool?

        # The alarm states that trigger a notification.
        @[JSON::Field(key: "notificationTriggers")]
        getter notification_triggers : Array(String)?

        # The period, in seconds, over which the statistic is applied.
        @[JSON::Field(key: "period")]
        getter period : Int32?

        # The Lightsail resource type of the alarm.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The current state of the alarm. An alarm has the following possible states: ALARM - The metric is
        # outside of the defined threshold. INSUFFICIENT_DATA - The alarm has just started, the metric is not
        # available, or not enough data is available for the metric to determine the alarm state. OK - The
        # metric is within the defined threshold.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The statistic for the metric associated with the alarm. The following statistics are available:
        # Minimum - The lowest value observed during the specified period. Use this value to determine low
        # volumes of activity for your application. Maximum - The highest value observed during the specified
        # period. Use this value to determine high volumes of activity for your application. Sum - All values
        # submitted for the matching metric added together. You can use this statistic to determine the total
        # volume of a metric. Average - The value of Sum / SampleCount during the specified period. By
        # comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a
        # metric and how close the average use is to the Minimum and Maximum values. This comparison helps you
        # to know when to increase or decrease your resources. SampleCount - The count, or number, of data
        # points used for the statistical calculation.
        @[JSON::Field(key: "statistic")]
        getter statistic : String?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail alarm. This code enables our support team to look up your Lightsail information more
        # easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The value against which the specified statistic is compared.
        @[JSON::Field(key: "threshold")]
        getter threshold : Float64?

        # Specifies how the alarm handles missing data points. An alarm can treat missing data in the
        # following ways: breaching - Assume the missing data is not within the threshold. Missing data counts
        # towards the number of times the metric is not within the threshold. notBreaching - Assume the
        # missing data is within the threshold. Missing data does not count towards the number of times the
        # metric is not within the threshold. ignore - Ignore the missing data. Maintains the current alarm
        # state. missing - Missing data is treated as missing.
        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        # The unit of the metric associated with the alarm.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @arn : String? = nil,
          @comparison_operator : String? = nil,
          @contact_protocols : Array(String)? = nil,
          @created_at : Time? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @evaluation_periods : Int32? = nil,
          @location : Types::ResourceLocation? = nil,
          @metric_name : String? = nil,
          @monitored_resource_info : Types::MonitoredResourceInfo? = nil,
          @name : String? = nil,
          @notification_enabled : Bool? = nil,
          @notification_triggers : Array(String)? = nil,
          @period : Int32? = nil,
          @resource_type : String? = nil,
          @state : String? = nil,
          @statistic : String? = nil,
          @support_code : String? = nil,
          @threshold : Float64? = nil,
          @treat_missing_data : String? = nil,
          @unit : String? = nil
        )
        end
      end

      struct AllocateStaticIpRequest
        include JSON::Serializable

        # The name of the static IP address.
        @[JSON::Field(key: "staticIpName")]
        getter static_ip_name : String

        def initialize(
          @static_ip_name : String
        )
        end
      end

      struct AllocateStaticIpResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct AttachCertificateToDistributionRequest
        include JSON::Serializable

        # The name of the certificate to attach to a distribution. Only certificates with a status of ISSUED
        # can be attached to a distribution. Use the GetCertificates action to get a list of certificate names
        # that you can specify. This is the name of the certificate resource type and is used only to
        # reference the certificate in other API actions. It can be different than the domain name of the
        # certificate. For example, your certificate name might be WordPress-Blog-Certificate and the domain
        # name of the certificate might be example.com .
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        # The name of the distribution that the certificate will be attached to. Use the GetDistributions
        # action to get a list of distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String

        def initialize(
          @certificate_name : String,
          @distribution_name : String
        )
        end
      end

      struct AttachCertificateToDistributionResult
        include JSON::Serializable

        # An object that describes the result of the action, such as the status of the request, the timestamp
        # of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct AttachDiskRequest
        include JSON::Serializable

        # The unique Lightsail disk name ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        # The disk path to expose to the instance ( /dev/xvdf ).
        @[JSON::Field(key: "diskPath")]
        getter disk_path : String

        # The name of the Lightsail instance where you want to utilize the storage disk.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # A Boolean value used to determine the automatic mounting of a storage volume to a virtual computer.
        # The default value is False . This value only applies to Lightsail for Research resources.
        @[JSON::Field(key: "autoMounting")]
        getter auto_mounting : Bool?

        def initialize(
          @disk_name : String,
          @disk_path : String,
          @instance_name : String,
          @auto_mounting : Bool? = nil
        )
        end
      end

      struct AttachDiskResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct AttachInstancesToLoadBalancerRequest
        include JSON::Serializable

        # An array of strings representing the instance name(s) you want to attach to your load balancer. An
        # instance must be running before you can attach it to your load balancer. There are no additional
        # limits on the number of instances you can attach to your load balancer, aside from the limit of
        # Lightsail instances you can create in your account (20).
        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # The name of the load balancer.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @instance_names : Array(String),
          @load_balancer_name : String
        )
        end
      end

      struct AttachInstancesToLoadBalancerResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct AttachLoadBalancerTlsCertificateRequest
        include JSON::Serializable

        # The name of your SSL/TLS certificate.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        # The name of the load balancer to which you want to associate the SSL/TLS certificate.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @certificate_name : String,
          @load_balancer_name : String
        )
        end
      end

      struct AttachLoadBalancerTlsCertificateResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request. These SSL/TLS certificates are
        # only usable by Lightsail load balancers. You can't get the certificate and use it for another
        # purpose.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct AttachStaticIpRequest
        include JSON::Serializable

        # The instance name to which you want to attach the static IP address.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # The name of the static IP.
        @[JSON::Field(key: "staticIpName")]
        getter static_ip_name : String

        def initialize(
          @instance_name : String,
          @static_ip_name : String
        )
        end
      end

      struct AttachStaticIpResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes a block storage disk that is attached to an instance, and is included in an automatic
      # snapshot.
      struct AttachedDisk
        include JSON::Serializable

        # The path of the disk ( /dev/xvdf ).
        @[JSON::Field(key: "path")]
        getter path : String?

        # The size of the disk in GB.
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        def initialize(
          @path : String? = nil,
          @size_in_gb : Int32? = nil
        )
        end
      end

      # Describes a request to enable or modify the automatic snapshot add-on for an Amazon Lightsail
      # instance or disk. When you modify the automatic snapshot time for a resource, it is typically
      # effective immediately except under the following conditions: If an automatic snapshot has been
      # created for the current day, and you change the snapshot time to a later time of day, then the new
      # snapshot time will be effective the following day. This ensures that two snapshots are not created
      # for the current day. If an automatic snapshot has not yet been created for the current day, and you
      # change the snapshot time to an earlier time of day, then the new snapshot time will be effective the
      # following day and a snapshot is automatically created at the previously set time for the current
      # day. This ensures that a snapshot is created for the current day. If an automatic snapshot has not
      # yet been created for the current day, and you change the snapshot time to a time that is within 30
      # minutes from your current time, then the new snapshot time will be effective the following day and a
      # snapshot is automatically created at the previously set time for the current day. This ensures that
      # a snapshot is created for the current day, because 30 minutes is required between your current time
      # and the new snapshot time that you specify. If an automatic snapshot is scheduled to be created
      # within 30 minutes from your current time and you change the snapshot time, then the new snapshot
      # time will be effective the following day and a snapshot is automatically created at the previously
      # set time for the current day. This ensures that a snapshot is created for the current day, because
      # 30 minutes is required between your current time and the new snapshot time that you specify.
      struct AutoSnapshotAddOnRequest
        include JSON::Serializable

        # The daily time when an automatic snapshot will be created. Constraints: Must be in HH:00 format, and
        # in an hourly increment. Specified in Coordinated Universal Time (UTC). The snapshot will be
        # automatically created between the time specified and up to 45 minutes after.
        @[JSON::Field(key: "snapshotTimeOfDay")]
        getter snapshot_time_of_day : String?

        def initialize(
          @snapshot_time_of_day : String? = nil
        )
        end
      end

      # Describes an automatic snapshot.
      struct AutoSnapshotDetails
        include JSON::Serializable

        # The timestamp when the automatic snapshot was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The date of the automatic snapshot in YYYY-MM-DD format.
        @[JSON::Field(key: "date")]
        getter date : String?

        # An array of objects that describe the block storage disks attached to the instance when the
        # automatic snapshot was created.
        @[JSON::Field(key: "fromAttachedDisks")]
        getter from_attached_disks : Array(Types::AttachedDisk)?

        # The status of the automatic snapshot.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @date : String? = nil,
          @from_attached_disks : Array(Types::AttachedDisk)? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes an Availability Zone. This is returned only as part of a GetRegions request.
      struct AvailabilityZone
        include JSON::Serializable

        # The state of the Availability Zone.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The name of the Availability Zone. The format is us-east-2a (case-sensitive).
        @[JSON::Field(key: "zoneName")]
        getter zone_name : String?

        def initialize(
          @state : String? = nil,
          @zone_name : String? = nil
        )
        end
      end

      # Describes a blueprint (a virtual private server image).
      struct Blueprint
        include JSON::Serializable

        # Virtual computer blueprints that are supported by Lightsail for Research. This parameter only
        # applies to Lightsail for Research resources.
        @[JSON::Field(key: "appCategory")]
        getter app_category : String?

        # The ID for the virtual private server image ( app_wordpress_x_x or app_lamp_x_x ).
        @[JSON::Field(key: "blueprintId")]
        getter blueprint_id : String?

        # The description of the blueprint.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The group name of the blueprint ( amazon-linux ).
        @[JSON::Field(key: "group")]
        getter group : String?

        # A Boolean value indicating whether the blueprint is active. Inactive blueprints are listed to
        # support customers with existing instances but are not necessarily available for launch of new
        # instances. Blueprints are marked inactive when they become outdated due to operating system updates
        # or new application releases.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The end-user license agreement URL for the image or blueprint.
        @[JSON::Field(key: "licenseUrl")]
        getter license_url : String?

        # The minimum bundle power required to run this blueprint. For example, you need a bundle with a power
        # value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500.
        # 0 indicates that the blueprint runs on all instance sizes.
        @[JSON::Field(key: "minPower")]
        getter min_power : Int32?

        # The friendly name of the blueprint ( Amazon Linux ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The operating system platform (either Linux/Unix-based or Windows Server-based) of the blueprint.
        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The product URL to learn more about the image or blueprint.
        @[JSON::Field(key: "productUrl")]
        getter product_url : String?

        # The type of the blueprint ( os or app ).
        @[JSON::Field(key: "type")]
        getter type : String?

        # The version number of the operating system, application, or stack ( 2016.03.0 ).
        @[JSON::Field(key: "version")]
        getter version : String?

        # The version code.
        @[JSON::Field(key: "versionCode")]
        getter version_code : String?

        def initialize(
          @app_category : String? = nil,
          @blueprint_id : String? = nil,
          @description : String? = nil,
          @group : String? = nil,
          @is_active : Bool? = nil,
          @license_url : String? = nil,
          @min_power : Int32? = nil,
          @name : String? = nil,
          @platform : String? = nil,
          @product_url : String? = nil,
          @type : String? = nil,
          @version : String? = nil,
          @version_code : String? = nil
        )
        end
      end

      # Describes an Amazon Lightsail bucket.
      struct Bucket
        include JSON::Serializable

        # Indicates whether the bundle that is currently applied to a bucket can be changed to another bundle.
        # You can update a bucket's bundle only one time within a monthly Amazon Web Services billing cycle.
        # Use the UpdateBucketBundle action to change a bucket's bundle.
        @[JSON::Field(key: "ableToUpdateBundle")]
        getter able_to_update_bundle : Bool?

        # An object that describes the access log configuration for the bucket.
        @[JSON::Field(key: "accessLogConfig")]
        getter access_log_config : Types::BucketAccessLogConfig?

        # An object that describes the access rules of the bucket.
        @[JSON::Field(key: "accessRules")]
        getter access_rules : Types::AccessRules?

        # The Amazon Resource Name (ARN) of the bucket.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the bundle currently applied to the bucket. A bucket bundle specifies the monthly cost,
        # storage space, and data transfer quota for a bucket. Use the UpdateBucketBundle action to change the
        # bundle of a bucket.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # An array of cross-origin resource sharing (CORS) rules that identify origins and the HTTP methods
        # that can be executed on your bucket. This field is only included in the response when CORS
        # configuration is requested or when updating CORS configuration. For more information, see
        # Configuring cross-origin resource sharing (CORS) .
        @[JSON::Field(key: "cors")]
        getter cors : Types::BucketCorsConfig?

        # The timestamp when the distribution was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the location of the bucket, such as the Amazon Web Services Region and
        # Availability Zone.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the bucket.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Indicates whether object versioning is enabled for the bucket. The following options can be
        # configured: Enabled - Object versioning is enabled. Suspended - Object versioning was previously
        # enabled but is currently suspended. Existing object versions are retained. NeverEnabled - Object
        # versioning has never been enabled.
        @[JSON::Field(key: "objectVersioning")]
        getter object_versioning : String?

        # An array of strings that specify the Amazon Web Services account IDs that have read-only access to
        # the bucket.
        @[JSON::Field(key: "readonlyAccessAccounts")]
        getter readonly_access_accounts : Array(String)?

        # The Lightsail resource type of the bucket.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # An array of objects that describe Lightsail instances that have access to the bucket. Use the
        # SetResourceAccessForBucket action to update the instances that have access to a bucket.
        @[JSON::Field(key: "resourcesReceivingAccess")]
        getter resources_receiving_access : Array(Types::ResourceReceivingAccess)?

        # An object that describes the state of the bucket.
        @[JSON::Field(key: "state")]
        getter state : Types::BucketState?

        # The support code for a bucket. Include this code in your email to support when you have questions
        # about a Lightsail bucket. This code enables our support team to look up your Lightsail information
        # more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the bucket. For more information, see Tags in Amazon Lightsail
        # in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The URL of the bucket.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @able_to_update_bundle : Bool? = nil,
          @access_log_config : Types::BucketAccessLogConfig? = nil,
          @access_rules : Types::AccessRules? = nil,
          @arn : String? = nil,
          @bundle_id : String? = nil,
          @cors : Types::BucketCorsConfig? = nil,
          @created_at : Time? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @object_versioning : String? = nil,
          @readonly_access_accounts : Array(String)? = nil,
          @resource_type : String? = nil,
          @resources_receiving_access : Array(Types::ResourceReceivingAccess)? = nil,
          @state : Types::BucketState? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @url : String? = nil
        )
        end
      end

      # Describes the access log configuration for a bucket in the Amazon Lightsail object storage service.
      # For more information about bucket access logs, see Logging bucket requests using access logging in
      # Amazon Lightsail in the Amazon Lightsail Developer Guide .
      struct BucketAccessLogConfig
        include JSON::Serializable

        # A Boolean value that indicates whether bucket access logging is enabled for the bucket.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The name of the bucket where the access logs are saved. The destination can be a Lightsail bucket in
        # the same account, and in the same Amazon Web Services Region as the source bucket. This parameter is
        # required when enabling the access log for a bucket, and should be omitted when disabling the access
        # log.
        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The optional object prefix for the bucket access log. The prefix is an optional addition to the
        # object key that organizes your access log files in the destination bucket. For example, if you
        # specify a logs/ prefix, then each log object will begin with the logs/ prefix in its key (for
        # example, logs/2021-11-01-21-32-16-E568B2907131C0C0 ). This parameter can be optionally specified
        # when enabling the access log for a bucket, and should be omitted when disabling the access log.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @enabled : Bool,
          @destination : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes the specifications of a bundle that can be applied to an Amazon Lightsail bucket. A bucket
      # bundle specifies the monthly cost, storage space, and data transfer quota for a bucket.
      struct BucketBundle
        include JSON::Serializable

        # The ID of the bundle.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # Indicates whether the bundle is active. Use for a new or existing bucket.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The name of the bundle.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The monthly price of the bundle, in US dollars.
        @[JSON::Field(key: "price")]
        getter price : Float64?

        # The storage size of the bundle, in GB.
        @[JSON::Field(key: "storagePerMonthInGb")]
        getter storage_per_month_in_gb : Int32?

        # The monthly network transfer quota of the bundle.
        @[JSON::Field(key: "transferPerMonthInGb")]
        getter transfer_per_month_in_gb : Int32?

        def initialize(
          @bundle_id : String? = nil,
          @is_active : Bool? = nil,
          @name : String? = nil,
          @price : Float64? = nil,
          @storage_per_month_in_gb : Int32? = nil,
          @transfer_per_month_in_gb : Int32? = nil
        )
        end
      end

      # Describes the cross-origin resource sharing (CORS) configuration for a Lightsail bucket. CORS
      # defines a way for client web applications that are loaded in one domain to interact with resources
      # in a different domain. For more information, see Configuring cross-origin resource sharing (CORS) .
      struct BucketCorsConfig
        include JSON::Serializable

        # A set of origins and methods (cross-origin access that you want to allow). You can add up to 20
        # rules to the configuration. The total size is limited to 64 KB.
        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::BucketCorsRule)?

        def initialize(
          @rules : Array(Types::BucketCorsRule)? = nil
        )
        end
      end

      # Describes a cross-origin resource sharing (CORS) rule for a Lightsail bucket. CORS rules specify
      # which origins are allowed to access the bucket, which HTTP methods are allowed, and other access
      # control information. For more information, see Configuring cross-origin resource sharing (CORS) .
      struct BucketCorsRule
        include JSON::Serializable

        # The HTTP methods that are allowed when accessing the bucket from the specified origin. Each CORS
        # rule must identify at least one origin and one method. You can use the following HTTP methods: GET -
        # Retrieves data from the server, such as downloading files or viewing content. PUT - Uploads or
        # replaces data on the server, such as uploading new files. POST - Sends data to the server for
        # processing, such as submitting forms or creating new resources. DELETE - Removes data from the
        # server, such as deleting files or resources. HEAD - Retrieves only the headers from the server
        # without the actual content, useful for checking if a resource exists.
        @[JSON::Field(key: "allowedMethods")]
        getter allowed_methods : Array(String)

        # One or more origins you want customers to be able to access the bucket from. Each CORS rule must
        # identify at least one origin and one method.
        @[JSON::Field(key: "allowedOrigins")]
        getter allowed_origins : Array(String)

        # Headers that are specified in the Access-Control-Request-Headers header. These headers are allowed
        # in a preflight OPTIONS request. In response to any preflight OPTIONS request, Amazon S3 returns any
        # requested headers that are allowed.
        @[JSON::Field(key: "allowedHeaders")]
        getter allowed_headers : Array(String)?

        # One or more headers in the response that you want customers to be able to access from their
        # applications (for example, from a JavaScript XMLHttpRequest object).
        @[JSON::Field(key: "exposeHeaders")]
        getter expose_headers : Array(String)?

        # A unique identifier for the CORS rule. The ID value can be up to 255 characters long. The IDs help
        # you find a rule in the configuration.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The time in seconds that your browser is to cache the preflight response for the specified resource.
        # A CORS rule can have only one maxAgeSeconds element.
        @[JSON::Field(key: "maxAgeSeconds")]
        getter max_age_seconds : Int32?

        def initialize(
          @allowed_methods : Array(String),
          @allowed_origins : Array(String),
          @allowed_headers : Array(String)? = nil,
          @expose_headers : Array(String)? = nil,
          @id : String? = nil,
          @max_age_seconds : Int32? = nil
        )
        end
      end

      # Describes the state of an Amazon Lightsail bucket.
      struct BucketState
        include JSON::Serializable

        # The state code of the bucket. The following codes are possible: OK - The bucket is in a running
        # state. Unknown - Creation of the bucket might have timed-out. You might want to delete the bucket
        # and create a new one.
        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that describes the state of the bucket.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes a bundle, which is a set of specs describing your virtual private server (or instance ).
      struct Bundle
        include JSON::Serializable

        # The bundle ID ( micro_x_x ).
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # The number of vCPUs included in the bundle ( 2 ).
        @[JSON::Field(key: "cpuCount")]
        getter cpu_count : Int32?

        # The size of the SSD ( 30 ).
        @[JSON::Field(key: "diskSizeInGb")]
        getter disk_size_in_gb : Int32?

        # The instance type ( micro ).
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # A Boolean value indicating whether the bundle is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # A friendly name for the bundle ( Micro ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # A numeric value that represents the power of the bundle ( 500 ). You can use the bundle's power
        # value in conjunction with a blueprint's minimum power value to determine whether the blueprint will
        # run on the bundle. For example, you need a bundle with a power value of 500 or more to create an
        # instance that uses a blueprint with a minimum power value of 500.
        @[JSON::Field(key: "power")]
        getter power : Int32?

        # The price in US dollars ( 5.0 ) of the bundle.
        @[JSON::Field(key: "price")]
        getter price : Float64?

        # An integer that indicates the public ipv4 address count included in the bundle, the value is either
        # 0 or 1.
        @[JSON::Field(key: "publicIpv4AddressCount")]
        getter public_ipv4_address_count : Int32?

        # The amount of RAM in GB ( 2.0 ).
        @[JSON::Field(key: "ramSizeInGb")]
        getter ram_size_in_gb : Float64?

        # Virtual computer blueprints that are supported by a Lightsail for Research bundle. This parameter
        # only applies to Lightsail for Research resources.
        @[JSON::Field(key: "supportedAppCategories")]
        getter supported_app_categories : Array(String)?

        # The operating system platform (Linux/Unix-based or Windows Server-based) that the bundle supports.
        # You can only launch a WINDOWS bundle on a blueprint that supports the WINDOWS platform. LINUX_UNIX
        # blueprints require a LINUX_UNIX bundle.
        @[JSON::Field(key: "supportedPlatforms")]
        getter supported_platforms : Array(String)?

        # The data transfer rate per month in GB ( 2000 ).
        @[JSON::Field(key: "transferPerMonthInGb")]
        getter transfer_per_month_in_gb : Int32?

        def initialize(
          @bundle_id : String? = nil,
          @cpu_count : Int32? = nil,
          @disk_size_in_gb : Int32? = nil,
          @instance_type : String? = nil,
          @is_active : Bool? = nil,
          @name : String? = nil,
          @power : Int32? = nil,
          @price : Float64? = nil,
          @public_ipv4_address_count : Int32? = nil,
          @ram_size_in_gb : Float64? = nil,
          @supported_app_categories : Array(String)? = nil,
          @supported_platforms : Array(String)? = nil,
          @transfer_per_month_in_gb : Int32? = nil
        )
        end
      end

      # Describes the default cache behavior of an Amazon Lightsail content delivery network (CDN)
      # distribution.
      struct CacheBehavior
        include JSON::Serializable

        # The cache behavior of the distribution. The following cache behaviors can be specified: cache - This
        # option is best for static sites. When specified, your distribution caches and serves your entire
        # website as static content. This behavior is ideal for websites with static content that doesn't
        # change depending on who views it, or for websites that don't use cookies, headers, or query strings
        # to personalize content. dont-cache - This option is best for sites that serve a mix of static and
        # dynamic content. When specified, your distribution caches and serve only the content that is
        # specified in the distribution's CacheBehaviorPerPath parameter. This behavior is ideal for websites
        # or web applications that use cookies, headers, and query strings to personalize content for
        # individual users.
        @[JSON::Field(key: "behavior")]
        getter behavior : String?

        def initialize(
          @behavior : String? = nil
        )
        end
      end

      # Describes the per-path cache behavior of an Amazon Lightsail content delivery network (CDN)
      # distribution. A per-path cache behavior is used to override, or add an exception to, the default
      # cache behavior of a distribution. For example, if the cacheBehavior is set to cache , then a
      # per-path cache behavior can be used to specify a directory, file, or file type that your
      # distribution will cache. Alternately, if the distribution's cacheBehavior is dont-cache , then a
      # per-path cache behavior can be used to specify a directory, file, or file type that your
      # distribution will not cache.
      struct CacheBehaviorPerPath
        include JSON::Serializable

        # The cache behavior for the specified path. You can specify one of the following per-path cache
        # behaviors: cache - This behavior caches the specified path. dont-cache - This behavior doesn't cache
        # the specified path.
        @[JSON::Field(key: "behavior")]
        getter behavior : String?

        # The path to a directory or file to cached, or not cache. Use an asterisk symbol to specify wildcard
        # directories ( path/to/assets/* ), and file types ( *.html, *jpg, *js ). Directories and file paths
        # are case-sensitive. Examples: Specify the following to cache all files in the document root of an
        # Apache web server running on a Lightsail instance. var/www/html/ Specify the following file to cache
        # only the index page in the document root of an Apache web server. var/www/html/index.html Specify
        # the following to cache only the .html files in the document root of an Apache web server.
        # var/www/html/*.html Specify the following to cache only the .jpg, .png, and .gif files in the images
        # sub-directory of the document root of an Apache web server. var/www/html/images/*.jpg
        # var/www/html/images/*.png var/www/html/images/*.gif Specify the following to cache all files in the
        # images sub-directory of the document root of an Apache web server. var/www/html/images/
        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @behavior : String? = nil,
          @path : String? = nil
        )
        end
      end

      # Describes the cache settings of an Amazon Lightsail content delivery network (CDN) distribution.
      # These settings apply only to your distribution's cacheBehaviors (including the defaultCacheBehavior
      # ) that have a behavior of cache .
      struct CacheSettings
        include JSON::Serializable

        # The HTTP methods that are processed and forwarded to the distribution's origin. You can specify the
        # following options: GET,HEAD - The distribution forwards the GET and HEAD methods. GET,HEAD,OPTIONS -
        # The distribution forwards the GET , HEAD , and OPTIONS methods.
        # GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE - The distribution forwards the GET , HEAD , OPTIONS , PUT ,
        # PATCH , POST , and DELETE methods. If you specify the third option, you might need to restrict
        # access to your distribution's origin so users can't perform operations that you don't want them to.
        # For example, you might not want users to have permission to delete objects from your origin.
        @[JSON::Field(key: "allowedHTTPMethods")]
        getter allowed_http_methods : String?

        # The HTTP method responses that are cached by your distribution. You can specify the following
        # options: GET,HEAD - The distribution caches responses to the GET and HEAD methods. GET,HEAD,OPTIONS
        # - The distribution caches responses to the GET , HEAD , and OPTIONS methods.
        @[JSON::Field(key: "cachedHTTPMethods")]
        getter cached_http_methods : String?

        # The default amount of time that objects stay in the distribution's cache before the distribution
        # forwards another request to the origin to determine whether the content has been updated. The value
        # specified applies only when the origin does not add HTTP headers such as Cache-Control max-age ,
        # Cache-Control s-maxage , and Expires to objects.
        @[JSON::Field(key: "defaultTTL")]
        getter default_ttl : Int64?

        # An object that describes the cookies that are forwarded to the origin. Your content is cached based
        # on the cookies that are forwarded.
        @[JSON::Field(key: "forwardedCookies")]
        getter forwarded_cookies : Types::CookieObject?

        # An object that describes the headers that are forwarded to the origin. Your content is cached based
        # on the headers that are forwarded.
        @[JSON::Field(key: "forwardedHeaders")]
        getter forwarded_headers : Types::HeaderObject?

        # An object that describes the query strings that are forwarded to the origin. Your content is cached
        # based on the query strings that are forwarded.
        @[JSON::Field(key: "forwardedQueryStrings")]
        getter forwarded_query_strings : Types::QueryStringObject?

        # The maximum amount of time that objects stay in the distribution's cache before the distribution
        # forwards another request to the origin to determine whether the object has been updated. The value
        # specified applies only when the origin adds HTTP headers such as Cache-Control max-age ,
        # Cache-Control s-maxage , and Expires to objects.
        @[JSON::Field(key: "maximumTTL")]
        getter maximum_ttl : Int64?

        # The minimum amount of time that objects stay in the distribution's cache before the distribution
        # forwards another request to the origin to determine whether the object has been updated. A value of
        # 0 must be specified for minimumTTL if the distribution is configured to forward all headers to the
        # origin.
        @[JSON::Field(key: "minimumTTL")]
        getter minimum_ttl : Int64?

        def initialize(
          @allowed_http_methods : String? = nil,
          @cached_http_methods : String? = nil,
          @default_ttl : Int64? = nil,
          @forwarded_cookies : Types::CookieObject? = nil,
          @forwarded_headers : Types::HeaderObject? = nil,
          @forwarded_query_strings : Types::QueryStringObject? = nil,
          @maximum_ttl : Int64? = nil,
          @minimum_ttl : Int64? = nil
        )
        end
      end

      # Describes the full details of an Amazon Lightsail SSL/TLS certificate. To get a summary of a
      # certificate, use the GetCertificates action and omit includeCertificateDetails from your request.
      # The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain
      # name, and tags.
      struct Certificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the certificate was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The domain name of the certificate.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # An array of objects that describe the domain validation records of the certificate.
        @[JSON::Field(key: "domainValidationRecords")]
        getter domain_validation_records : Array(Types::DomainValidationRecord)?

        # The renewal eligibility of the certificate.
        @[JSON::Field(key: "eligibleToRenew")]
        getter eligible_to_renew : String?

        # The number of Lightsail resources that the certificate is attached to.
        @[JSON::Field(key: "inUseResourceCount")]
        getter in_use_resource_count : Int32?

        # The timestamp when the certificate was issued.
        @[JSON::Field(key: "issuedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter issued_at : Time?

        # The certificate authority that issued the certificate.
        @[JSON::Field(key: "issuerCA")]
        getter issuer_ca : String?

        # The algorithm used to generate the key pair (the public and private key) of the certificate.
        @[JSON::Field(key: "keyAlgorithm")]
        getter key_algorithm : String?

        # The name of the certificate ( my-certificate ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp when the certificate expires.
        @[JSON::Field(key: "notAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_after : Time?

        # The timestamp when the certificate is first valid.
        @[JSON::Field(key: "notBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_before : Time?

        # An object that describes the status of the certificate renewal managed by Lightsail.
        @[JSON::Field(key: "renewalSummary")]
        getter renewal_summary : Types::RenewalSummary?

        # The validation failure reason, if any, of the certificate. The following failure reasons are
        # possible: NO_AVAILABLE_CONTACTS - This failure applies to email validation, which is not available
        # for Lightsail certificates. ADDITIONAL_VERIFICATION_REQUIRED - Lightsail requires additional
        # information to process this certificate request. This can happen as a fraud-protection measure, such
        # as when the domain ranks within the Alexa top 1000 websites. To provide the required information,
        # use the Amazon Web Services Support Center to contact Amazon Web Services Support. You cannot
        # request a certificate for Amazon-owned domain names such as those ending in amazonaws.com,
        # cloudfront.net, or elasticbeanstalk.com. DOMAIN_NOT_ALLOWED - One or more of the domain names in the
        # certificate request was reported as an unsafe domain by VirusTotal . To correct the problem, search
        # for your domain name on the VirusTotal website. If your domain is reported as suspicious, see Google
        # Help for Hacked Websites to learn what you can do. If you believe that the result is a false
        # positive, notify the organization that is reporting the domain. VirusTotal is an aggregate of
        # several antivirus and URL scanners and cannot remove your domain from a block list itself. After you
        # correct the problem and the VirusTotal registry has been updated, request a new certificate. If you
        # see this error and your domain is not included in the VirusTotal list, visit the Amazon Web Services
        # Support Center and create a case. INVALID_PUBLIC_DOMAIN - One or more of the domain names in the
        # certificate request is not valid. Typically, this is because a domain name in the request is not a
        # valid top-level domain. Try to request a certificate again, correcting any spelling errors or typos
        # that were in the failed request, and ensure that all domain names in the request are for valid
        # top-level domains. For example, you cannot request a certificate for example.invalidpublicdomain
        # because invalidpublicdomain is not a valid top-level domain. OTHER - Typically, this failure occurs
        # when there is a typographical error in one or more of the domain names in the certificate request.
        # Try to request a certificate again, correcting any spelling errors or typos that were in the failed
        # request.
        @[JSON::Field(key: "requestFailureReason")]
        getter request_failure_reason : String?

        # The reason the certificate was revoked. This value is present only when the certificate status is
        # REVOKED .
        @[JSON::Field(key: "revocationReason")]
        getter revocation_reason : String?

        # The timestamp when the certificate was revoked. This value is present only when the certificate
        # status is REVOKED .
        @[JSON::Field(key: "revokedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter revoked_at : Time?

        # The serial number of the certificate.
        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # The validation status of the certificate.
        @[JSON::Field(key: "status")]
        getter status : String?

        # An array of strings that specify the alternate domains ( example2.com ) and subdomains (
        # blog.example.com ) of the certificate.
        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Array(String)?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail certificate. This code enables our support team to look up your Lightsail information more
        # easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @domain_name : String? = nil,
          @domain_validation_records : Array(Types::DomainValidationRecord)? = nil,
          @eligible_to_renew : String? = nil,
          @in_use_resource_count : Int32? = nil,
          @issued_at : Time? = nil,
          @issuer_ca : String? = nil,
          @key_algorithm : String? = nil,
          @name : String? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @renewal_summary : Types::RenewalSummary? = nil,
          @request_failure_reason : String? = nil,
          @revocation_reason : String? = nil,
          @revoked_at : Time? = nil,
          @serial_number : String? = nil,
          @status : String? = nil,
          @subject_alternative_names : Array(String)? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an Amazon Lightsail SSL/TLS certificate.
      struct CertificateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the certificate.
        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # An object that describes a certificate in detail.
        @[JSON::Field(key: "certificateDetail")]
        getter certificate_detail : Types::Certificate?

        # The name of the certificate.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The domain name of the certificate.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_arn : String? = nil,
          @certificate_detail : Types::Certificate? = nil,
          @certificate_name : String? = nil,
          @domain_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CloseInstancePublicPortsRequest
        include JSON::Serializable

        # The name of the instance for which to close ports.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # An object to describe the ports to close for the specified instance.
        @[JSON::Field(key: "portInfo")]
        getter port_info : Types::PortInfo

        def initialize(
          @instance_name : String,
          @port_info : Types::PortInfo
        )
        end
      end

      struct CloseInstancePublicPortsResult
        include JSON::Serializable

        # An object that describes the result of the action, such as the status of the request, the timestamp
        # of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      # Describes a CloudFormation stack record created as a result of the create cloud formation stack
      # action. A CloudFormation stack record provides information about the AWS CloudFormation stack used
      # to create a new Amazon Elastic Compute Cloud instance from an exported Lightsail instance snapshot.
      struct CloudFormationStackRecord
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudFormation stack record.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the CloudFormation stack record was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A list of objects describing the destination service, which is AWS CloudFormation, and the Amazon
        # Resource Name (ARN) of the AWS CloudFormation stack.
        @[JSON::Field(key: "destinationInfo")]
        getter destination_info : Types::DestinationInfo?

        # A list of objects describing the Availability Zone and Amazon Web Services Region of the
        # CloudFormation stack record.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the CloudFormation stack record. It starts with CloudFormationStackRecord followed by a
        # GUID.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type ( CloudFormationStackRecord ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A list of objects describing the source of the CloudFormation stack record.
        @[JSON::Field(key: "sourceInfo")]
        getter source_info : Array(Types::CloudFormationStackRecordSourceInfo)?

        # The current state of the CloudFormation stack record.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @destination_info : Types::DestinationInfo? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @source_info : Array(Types::CloudFormationStackRecordSourceInfo)? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes the source of a CloudFormation stack record (i.e., the export snapshot record).
      struct CloudFormationStackRecordSourceInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the export snapshot record.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the record.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type ( ExportSnapshotRecord ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes a contact method. A contact method is a way to send you notifications. For more
      # information, see Notifications in Amazon Lightsail .
      struct ContactMethod
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact method.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The destination of the contact method, such as an email address or a mobile phone number.
        @[JSON::Field(key: "contactEndpoint")]
        getter contact_endpoint : String?

        # The timestamp when the contact method was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the location of the contact method, such as the Amazon Web Services Region
        # and Availability Zone.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the contact method.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol of the contact method, such as email or SMS (text messaging).
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The Lightsail resource type of the contact method.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The current status of the contact method. A contact method has the following possible status:
        # PendingVerification - The contact method has not yet been verified, and the verification has not yet
        # expired. Valid - The contact method has been verified. InValid - An attempt was made to verify the
        # contact method, but the verification has expired.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail contact method. This code enables our support team to look up your Lightsail information
        # more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        def initialize(
          @arn : String? = nil,
          @contact_endpoint : String? = nil,
          @created_at : Time? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @protocol : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @support_code : String? = nil
        )
        end
      end

      # Describes the settings of a container that will be launched, or that is launched, to an Amazon
      # Lightsail container service.
      struct Container
        include JSON::Serializable

        # The launch command for the container.
        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables of the container.
        @[JSON::Field(key: "environment")]
        getter environment : Hash(String, String)?

        # The name of the image used for the container. Container images sourced from your Lightsail container
        # service, that are registered and stored on your service, start with a colon ( : ). For example, if
        # your container service name is container-service-1 , the container image label is mystaticsite , and
        # you want to use the third ( 3 ) version of the registered container image, then you should specify
        # :container-service-1.mystaticsite.3 . To use the latest version of a container image, specify latest
        # instead of a version number (for example, :container-service-1.mystaticsite.latest ). Lightsail will
        # automatically use the highest numbered version of the registered container image. Container images
        # sourced from a public registry like Docker Hub don't start with a colon. For example, nginx:latest
        # or nginx .
        @[JSON::Field(key: "image")]
        getter image : String?

        # The open firewall ports of the container.
        @[JSON::Field(key: "ports")]
        getter ports : Hash(String, String)?

        def initialize(
          @command : Array(String)? = nil,
          @environment : Hash(String, String)? = nil,
          @image : String? = nil,
          @ports : Hash(String, String)? = nil
        )
        end
      end

      # Describes a container image that is registered to an Amazon Lightsail container service.
      struct ContainerImage
        include JSON::Serializable

        # The timestamp when the container image was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The digest of the container image.
        @[JSON::Field(key: "digest")]
        getter digest : String?

        # The name of the container image.
        @[JSON::Field(key: "image")]
        getter image : String?

        def initialize(
          @created_at : Time? = nil,
          @digest : String? = nil,
          @image : String? = nil
        )
        end
      end

      # Describes an Amazon Lightsail container service.
      struct ContainerService
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the container service.
        @[JSON::Field(key: "containerServiceName")]
        getter container_service_name : String?

        # The timestamp when the container service was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the current container deployment of the container service.
        @[JSON::Field(key: "currentDeployment")]
        getter current_deployment : Types::ContainerServiceDeployment?

        # A Boolean value indicating whether the container service is disabled.
        @[JSON::Field(key: "isDisabled")]
        getter is_disabled : Bool?

        # An object that describes the location of the container service, such as the Amazon Web Services
        # Region and Availability Zone.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # An object that describes the next deployment of the container service. This value is null when there
        # is no deployment in a pending state.
        @[JSON::Field(key: "nextDeployment")]
        getter next_deployment : Types::ContainerServiceDeployment?

        # The power specification of the container service. The power specifies the amount of RAM, the number
        # of vCPUs, and the base price of the container service.
        @[JSON::Field(key: "power")]
        getter power : String?

        # The ID of the power of the container service.
        @[JSON::Field(key: "powerId")]
        getter power_id : String?

        # The principal ARN of the container service. The principal ARN can be used to create a trust
        # relationship between your standard Amazon Web Services account and your Lightsail container service.
        # This allows you to give your service permission to access resources in your standard Amazon Web
        # Services account.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        # The private domain name of the container service. The private domain name is accessible only by
        # other resources within the default virtual private cloud (VPC) of your Lightsail account.
        @[JSON::Field(key: "privateDomainName")]
        getter private_domain_name : String?

        # An object that describes the configuration for the container service to access private container
        # image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories. For
        # more information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
        # container service in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "privateRegistryAccess")]
        getter private_registry_access : Types::PrivateRegistryAccess?

        # The public domain name of the container service, such as example.com and www.example.com . You can
        # specify up to four public domain names for a container service. The domain names that you specify
        # are used when you create a deployment with a container configured as the public endpoint of your
        # container service. If you don't specify public domain names, then you can use the default domain of
        # the container service. You must create and validate an SSL/TLS certificate before you can use public
        # domain names with your container service. Use the CreateCertificate action to create a certificate
        # for the public domain names you want to use with your container service. See CreateContainerService
        # or UpdateContainerService for information about how to specify public domain names for your
        # Lightsail container service.
        @[JSON::Field(key: "publicDomainNames")]
        getter public_domain_names : Hash(String, Array(String))?

        # The Lightsail resource type of the container service.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The scale specification of the container service. The scale specifies the allocated compute nodes of
        # the container service.
        @[JSON::Field(key: "scale")]
        getter scale : Int32?

        # The current state of the container service. The following container service states are possible:
        # PENDING - The container service is being created. READY - The container service is running but it
        # does not have an active container deployment. DEPLOYING - The container service is launching a
        # container deployment. RUNNING - The container service is running and it has an active container
        # deployment. UPDATING - The container service capacity or its custom domains are being updated.
        # DELETING - The container service is being deleted. DISABLED - The container service is disabled, and
        # its active deployment and containers, if any, are shut down.
        @[JSON::Field(key: "state")]
        getter state : String?

        # An object that describes the current state of the container service. The state detail is populated
        # only when a container service is in a PENDING , DEPLOYING , or UPDATING state.
        @[JSON::Field(key: "stateDetail")]
        getter state_detail : Types::ContainerServiceStateDetail?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The publicly accessible URL of the container service. If no public endpoint is specified in the
        # currentDeployment , this URL returns a 404 response.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @arn : String? = nil,
          @container_service_name : String? = nil,
          @created_at : Time? = nil,
          @current_deployment : Types::ContainerServiceDeployment? = nil,
          @is_disabled : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @next_deployment : Types::ContainerServiceDeployment? = nil,
          @power : String? = nil,
          @power_id : String? = nil,
          @principal_arn : String? = nil,
          @private_domain_name : String? = nil,
          @private_registry_access : Types::PrivateRegistryAccess? = nil,
          @public_domain_names : Hash(String, Array(String))? = nil,
          @resource_type : String? = nil,
          @scale : Int32? = nil,
          @state : String? = nil,
          @state_detail : Types::ContainerServiceStateDetail? = nil,
          @tags : Array(Types::Tag)? = nil,
          @url : String? = nil
        )
        end
      end

      # Describes a container deployment configuration of an Amazon Lightsail container service. A
      # deployment specifies the settings, such as the ports and launch command, of containers that are
      # deployed to your container service.
      struct ContainerServiceDeployment
        include JSON::Serializable

        # An object that describes the configuration for the containers of the deployment.
        @[JSON::Field(key: "containers")]
        getter containers : Hash(String, Types::Container)?

        # The timestamp when the deployment was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the endpoint of the deployment.
        @[JSON::Field(key: "publicEndpoint")]
        getter public_endpoint : Types::ContainerServiceEndpoint?

        # The state of the deployment. A deployment can be in one of the following states: ACTIVATING - The
        # deployment is being created. ACTIVE - The deployment was successfully created, and it's currently
        # running on the container service. The container service can have only one deployment in an active
        # state at a time. INACTIVE - The deployment was previously successfully created, but it is not
        # currently running on the container service. FAILED - The deployment failed. Use the GetContainerLog
        # action to view the log events for the containers in the deployment to try to determine the reason
        # for the failure.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The version number of the deployment.
        @[JSON::Field(key: "version")]
        getter version : Int32?

        def initialize(
          @containers : Hash(String, Types::Container)? = nil,
          @created_at : Time? = nil,
          @public_endpoint : Types::ContainerServiceEndpoint? = nil,
          @state : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Describes a container deployment configuration of an Amazon Lightsail container service. A
      # deployment specifies the settings, such as the ports and launch command, of containers that are
      # deployed to your container service.
      struct ContainerServiceDeploymentRequest
        include JSON::Serializable

        # An object that describes the configuration for the containers of the deployment.
        @[JSON::Field(key: "containers")]
        getter containers : Hash(String, Types::Container)?

        # An object that describes the endpoint of the deployment.
        @[JSON::Field(key: "publicEndpoint")]
        getter public_endpoint : Types::EndpointRequest?

        def initialize(
          @containers : Hash(String, Types::Container)? = nil,
          @public_endpoint : Types::EndpointRequest? = nil
        )
        end
      end

      # Describes the activation status of the role that you can use to grant an Amazon Lightsail container
      # service access to Amazon Elastic Container Registry (Amazon ECR) private repositories. When
      # activated, Lightsail creates an Identity and Access Management (IAM) role for the specified
      # Lightsail container service. You can use the ARN of the role to create a trust relationship between
      # your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services
      # account. This allows your container service to pull images from Amazon ECR private repositories. For
      # more information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
      # container service in the Amazon Lightsail Developer Guide .
      struct ContainerServiceECRImagePullerRole
        include JSON::Serializable

        # A Boolean value that indicates whether the role is activated.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The Amazon Resource Name (ARN) of the role, if it is activated.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @is_active : Bool? = nil,
          @principal_arn : String? = nil
        )
        end
      end

      # Describes a request to activate or deactivate the role that you can use to grant an Amazon Lightsail
      # container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.
      # When activated, Lightsail creates an Identity and Access Management (IAM) role for the specified
      # Lightsail container service. You can use the ARN of the role to create a trust relationship between
      # your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services
      # account. This allows your container service to pull images from Amazon ECR private repositories. For
      # more information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
      # container service in the Amazon Lightsail Developer Guide .
      struct ContainerServiceECRImagePullerRoleRequest
        include JSON::Serializable

        # A Boolean value that indicates whether to activate the role.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        def initialize(
          @is_active : Bool? = nil
        )
        end
      end

      # Describes the public endpoint configuration of a deployment of an Amazon Lightsail container
      # service.
      struct ContainerServiceEndpoint
        include JSON::Serializable

        # The name of the container entry of the deployment that the endpoint configuration applies to.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The port of the specified container to which traffic is forwarded to.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # An object that describes the health check configuration of the container.
        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::ContainerServiceHealthCheckConfig?

        def initialize(
          @container_name : String? = nil,
          @container_port : Int32? = nil,
          @health_check : Types::ContainerServiceHealthCheckConfig? = nil
        )
        end
      end

      # Describes the health check configuration of an Amazon Lightsail container service.
      struct ContainerServiceHealthCheckConfig
        include JSON::Serializable

        # The number of consecutive health checks successes required before moving the container to the
        # Healthy state. The default value is 2 .
        @[JSON::Field(key: "healthyThreshold")]
        getter healthy_threshold : Int32?

        # The approximate interval, in seconds, between health checks of an individual container. You can
        # specify between 5 and 300 seconds. The default value is 5 .
        @[JSON::Field(key: "intervalSeconds")]
        getter interval_seconds : Int32?

        # The path on the container on which to perform the health check. The default value is / .
        @[JSON::Field(key: "path")]
        getter path : String?

        # The HTTP codes to use when checking for a successful response from a container. You can specify
        # values between 200 and 499 . You can specify multiple values (for example, 200,202 ) or a range of
        # values (for example, 200-299 ).
        @[JSON::Field(key: "successCodes")]
        getter success_codes : String?

        # The amount of time, in seconds, during which no response means a failed health check. You can
        # specify between 2 and 60 seconds. The default value is 2 .
        @[JSON::Field(key: "timeoutSeconds")]
        getter timeout_seconds : Int32?

        # The number of consecutive health check failures required before moving the container to the
        # Unhealthy state. The default value is 2 .
        @[JSON::Field(key: "unhealthyThreshold")]
        getter unhealthy_threshold : Int32?

        def initialize(
          @healthy_threshold : Int32? = nil,
          @interval_seconds : Int32? = nil,
          @path : String? = nil,
          @success_codes : String? = nil,
          @timeout_seconds : Int32? = nil,
          @unhealthy_threshold : Int32? = nil
        )
        end
      end

      # Describes the log events of a container of an Amazon Lightsail container service.
      struct ContainerServiceLogEvent
        include JSON::Serializable

        # The timestamp when the container service log event was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The message of the container service log event.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @created_at : Time? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes the powers that can be specified for an Amazon Lightsail container service. The power
      # specifies the amount of RAM, the number of vCPUs, and the base price of the container service.
      struct ContainerServicePower
        include JSON::Serializable

        # The number of vCPUs included in the power.
        @[JSON::Field(key: "cpuCount")]
        getter cpu_count : Float64?

        # A Boolean value indicating whether the power is active and can be specified for container services.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The friendly name of the power ( nano ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ID of the power ( nano-1 ).
        @[JSON::Field(key: "powerId")]
        getter power_id : String?

        # The monthly price of the power in USD.
        @[JSON::Field(key: "price")]
        getter price : Float64?

        # The amount of RAM (in GB) of the power.
        @[JSON::Field(key: "ramSizeInGb")]
        getter ram_size_in_gb : Float64?

        def initialize(
          @cpu_count : Float64? = nil,
          @is_active : Bool? = nil,
          @name : String? = nil,
          @power_id : String? = nil,
          @price : Float64? = nil,
          @ram_size_in_gb : Float64? = nil
        )
        end
      end

      # Describes the sign-in credentials for the container image registry of an Amazon Lightsail account.
      struct ContainerServiceRegistryLogin
        include JSON::Serializable

        # The timestamp of when the container image registry sign-in credentials expire. The log in
        # credentials expire 12 hours after they are created, at which point you will need to create a new set
        # of log in credentials using the CreateContainerServiceRegistryLogin action.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # The container service registry password to use to push container images to the container image
        # registry of a Lightsail account
        @[JSON::Field(key: "password")]
        getter password : String?

        # The address to use to push container images to the container image registry of a Lightsail account.
        @[JSON::Field(key: "registry")]
        getter registry : String?

        # The container service registry username to use to push container images to the container image
        # registry of a Lightsail account.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @expires_at : Time? = nil,
          @password : String? = nil,
          @registry : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes the current state of a container service.
      struct ContainerServiceStateDetail
        include JSON::Serializable

        # The state code of the container service. The following state codes are possible: The following state
        # codes are possible if your container service is in a DEPLOYING or UPDATING state:
        # CREATING_SYSTEM_RESOURCES - The system resources for your container service are being created.
        # CREATING_NETWORK_INFRASTRUCTURE - The network infrastructure for your container service are being
        # created. PROVISIONING_CERTIFICATE - The SSL/TLS certificate for your container service is being
        # created. PROVISIONING_SERVICE - Your container service is being provisioned. CREATING_DEPLOYMENT -
        # Your deployment is being created on your container service. EVALUATING_HEALTH_CHECK - The health of
        # your deployment is being evaluated. ACTIVATING_DEPLOYMENT - Your deployment is being activated. The
        # following state codes are possible if your container service is in a PENDING state:
        # CERTIFICATE_LIMIT_EXCEEDED - The SSL/TLS certificate required for your container service exceeds the
        # maximum number of certificates allowed for your account. UNKNOWN_ERROR - An error was experienced
        # when your container service was being created.
        @[JSON::Field(key: "code")]
        getter code : String?

        # A message that provides more information for the state code. The state detail is populated only when
        # a container service is in a PENDING , DEPLOYING , or UPDATING state.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct ContainerServicesListResult
        include JSON::Serializable

        # An array of objects that describe one or more container services.
        @[JSON::Field(key: "containerServices")]
        getter container_services : Array(Types::ContainerService)?

        def initialize(
          @container_services : Array(Types::ContainerService)? = nil
        )
        end
      end

      # Describes whether an Amazon Lightsail content delivery network (CDN) distribution forwards cookies
      # to the origin and, if so, which ones. For the cookies that you specify, your distribution caches
      # separate versions of the specified content based on the cookie values in viewer requests.
      struct CookieObject
        include JSON::Serializable

        # The specific cookies to forward to your distribution's origin.
        @[JSON::Field(key: "cookiesAllowList")]
        getter cookies_allow_list : Array(String)?

        # Specifies which cookies to forward to the distribution's origin for a cache behavior: all , none ,
        # or allow-list to forward only the cookies specified in the cookiesAllowList parameter.
        @[JSON::Field(key: "option")]
        getter option : String?

        def initialize(
          @cookies_allow_list : Array(String)? = nil,
          @option : String? = nil
        )
        end
      end

      struct CopySnapshotRequest
        include JSON::Serializable

        # The Amazon Web Services Region where the source manual or automatic snapshot is located.
        @[JSON::Field(key: "sourceRegion")]
        getter source_region : String

        # The name of the new manual snapshot to be created as a copy.
        @[JSON::Field(key: "targetSnapshotName")]
        getter target_snapshot_name : String

        # The date of the source automatic snapshot to copy. Use the get auto snapshots operation to identify
        # the dates of the available automatic snapshots. Constraints: Must be specified in YYYY-MM-DD format.
        # This parameter cannot be defined together with the use latest restorable auto snapshot parameter.
        # The restore date and use latest restorable auto snapshot parameters are mutually exclusive. Define
        # this parameter only when copying an automatic snapshot as a manual snapshot. For more information,
        # see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "restoreDate")]
        getter restore_date : String?

        # The name of the source instance or disk from which the source automatic snapshot was created.
        # Constraint: Define this parameter only when copying an automatic snapshot as a manual snapshot. For
        # more information, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "sourceResourceName")]
        getter source_resource_name : String?

        # The name of the source manual snapshot to copy. Constraint: Define this parameter only when copying
        # a manual snapshot as another manual snapshot.
        @[JSON::Field(key: "sourceSnapshotName")]
        getter source_snapshot_name : String?

        # A Boolean value to indicate whether to use the latest available automatic snapshot of the specified
        # source instance or disk. Constraints: This parameter cannot be defined together with the restore
        # date parameter. The use latest restorable auto snapshot and restore date parameters are mutually
        # exclusive. Define this parameter only when copying an automatic snapshot as a manual snapshot. For
        # more information, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "useLatestRestorableAutoSnapshot")]
        getter use_latest_restorable_auto_snapshot : Bool?

        def initialize(
          @source_region : String,
          @target_snapshot_name : String,
          @restore_date : String? = nil,
          @source_resource_name : String? = nil,
          @source_snapshot_name : String? = nil,
          @use_latest_restorable_auto_snapshot : Bool? = nil
        )
        end
      end

      struct CopySnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes the estimated cost for resources in your Lightsail for Research account.
      struct CostEstimate
        include JSON::Serializable

        # The cost estimate result that's associated with a time period.
        @[JSON::Field(key: "resultsByTime")]
        getter results_by_time : Array(Types::EstimateByTime)?

        # The types of usage that are included in the estimate, such as costs, usage, or data transfer.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        def initialize(
          @results_by_time : Array(Types::EstimateByTime)? = nil,
          @usage_type : String? = nil
        )
        end
      end

      struct CreateBucketAccessKeyRequest
        include JSON::Serializable

        # The name of the bucket that the new access key will belong to, and grant access to.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      struct CreateBucketAccessKeyResult
        include JSON::Serializable

        # An object that describes the access key that is created.
        @[JSON::Field(key: "accessKey")]
        getter access_key : Types::AccessKey?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @access_key : Types::AccessKey? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateBucketRequest
        include JSON::Serializable

        # The name for the bucket. For more information about bucket names, see Bucket naming rules in Amazon
        # Lightsail in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The ID of the bundle to use for the bucket. A bucket bundle specifies the monthly cost, storage
        # space, and data transfer quota for a bucket. Use the GetBucketBundles action to get a list of bundle
        # IDs that you can specify. Use the UpdateBucketBundle action to change the bundle after the bucket is
        # created.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String

        # A Boolean value that indicates whether to enable versioning of objects in the bucket. For more
        # information about versioning, see Enabling and suspending object versioning in a bucket in Amazon
        # Lightsail in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "enableObjectVersioning")]
        getter enable_object_versioning : Bool?

        # The tag keys and optional values to add to the bucket during creation. Use the TagResource action to
        # tag the bucket after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @bucket_name : String,
          @bundle_id : String,
          @enable_object_versioning : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateBucketResult
        include JSON::Serializable

        # An object that describes the bucket that is created.
        @[JSON::Field(key: "bucket")]
        getter bucket : Types::Bucket?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @bucket : Types::Bucket? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateCertificateRequest
        include JSON::Serializable

        # The name for the certificate.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        # The domain name ( example.com ) for the certificate.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # An array of strings that specify the alternate domains ( example2.com ) and subdomains (
        # blog.example.com ) for the certificate. You can specify a maximum of nine alternate domains (in
        # addition to the primary domain name). Wildcard domain entries ( *.example.com ) are not supported.
        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Array(String)?

        # The tag keys and optional values to add to the certificate during create. Use the TagResource action
        # to tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_name : String,
          @domain_name : String,
          @subject_alternative_names : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCertificateResult
        include JSON::Serializable

        # An object that describes the certificate created.
        @[JSON::Field(key: "certificate")]
        getter certificate : Types::CertificateSummary?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @certificate : Types::CertificateSummary? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateCloudFormationStackRequest
        include JSON::Serializable

        # An array of parameters that will be used to create the new Amazon EC2 instance. You can only pass
        # one instance entry at a time in this array. You will get an invalid parameter error if you pass more
        # than one instance entry in this array.
        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::InstanceEntry)

        def initialize(
          @instances : Array(Types::InstanceEntry)
        )
        end
      end

      struct CreateCloudFormationStackResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateContactMethodRequest
        include JSON::Serializable

        # The destination of the contact method, such as an email address or a mobile phone number. Use the
        # E.164 format when specifying a mobile phone number. E.164 is a standard for the phone number
        # structure used for international telecommunication. Phone numbers that follow this format can have a
        # maximum of 15 digits, and they are prefixed with the plus character (+) and the country code. For
        # example, a U.S. phone number in E.164 format would be specified as +1XXX5550100. For more
        # information, see E.164 on Wikipedia .
        @[JSON::Field(key: "contactEndpoint")]
        getter contact_endpoint : String

        # The protocol of the contact method, such as Email or SMS (text messaging). The SMS protocol is
        # supported only in the following Amazon Web Services Regions. US East (N. Virginia) ( us-east-1 ) US
        # West (Oregon) ( us-west-2 ) Europe (Ireland) ( eu-west-1 ) Asia Pacific (Tokyo) ( ap-northeast-1 )
        # Asia Pacific (Singapore) ( ap-southeast-1 ) Asia Pacific (Sydney) ( ap-southeast-2 ) For a list of
        # countries/regions where SMS text messages can be sent, and the latest Amazon Web Services Regions
        # where SMS text messaging is supported, see Supported Regions and Countries in the Amazon SNS
        # Developer Guide . For more information about notifications in Amazon Lightsail, see Notifications in
        # Amazon Lightsail .
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @contact_endpoint : String,
          @protocol : String
        )
        end
      end

      struct CreateContactMethodResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateContainerServiceDeploymentRequest
        include JSON::Serializable

        # The name of the container service for which to create the deployment.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # An object that describes the settings of the containers that will be launched on the container
        # service.
        @[JSON::Field(key: "containers")]
        getter containers : Hash(String, Types::Container)?

        # An object that describes the settings of the public endpoint for the container service.
        @[JSON::Field(key: "publicEndpoint")]
        getter public_endpoint : Types::EndpointRequest?

        def initialize(
          @service_name : String,
          @containers : Hash(String, Types::Container)? = nil,
          @public_endpoint : Types::EndpointRequest? = nil
        )
        end
      end

      struct CreateContainerServiceDeploymentResult
        include JSON::Serializable

        # An object that describes a container service.
        @[JSON::Field(key: "containerService")]
        getter container_service : Types::ContainerService?

        def initialize(
          @container_service : Types::ContainerService? = nil
        )
        end
      end

      struct CreateContainerServiceRegistryLoginRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateContainerServiceRegistryLoginResult
        include JSON::Serializable

        # An object that describes the log in information for the container service registry of your Lightsail
        # account.
        @[JSON::Field(key: "registryLogin")]
        getter registry_login : Types::ContainerServiceRegistryLogin?

        def initialize(
          @registry_login : Types::ContainerServiceRegistryLogin? = nil
        )
        end
      end

      struct CreateContainerServiceRequest
        include JSON::Serializable

        # The power specification for the container service. The power specifies the amount of memory, vCPUs,
        # and base monthly cost of each node of the container service. The power and scale of a container
        # service makes up its configured capacity. To determine the monthly price of your container service,
        # multiply the base price of the power with the scale (the number of nodes) of the service. Use the
        # GetContainerServicePowers action to get a list of power options that you can specify using this
        # parameter, and their base monthly cost.
        @[JSON::Field(key: "power")]
        getter power : String

        # The scale specification for the container service. The scale specifies the allocated compute nodes
        # of the container service. The power and scale of a container service makes up its configured
        # capacity. To determine the monthly price of your container service, multiply the base price of the
        # power with the scale (the number of nodes) of the service.
        @[JSON::Field(key: "scale")]
        getter scale : Int32

        # The name for the container service. The name that you specify for your container service will make
        # up part of its default domain. The default domain of a container service is typically
        # https://&lt;ServiceName&gt;.&lt;RandomGUID&gt;.&lt;AWSRegion&gt;.cs.amazonlightsail.com . If the
        # name of your container service is container-service-1 , and it's located in the US East (Ohio)
        # Amazon Web Services Region ( us-east-2 ), then the domain for your container service will be like
        # the following example: https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com
        # The following are the requirements for container service names: Must be unique within each Amazon
        # Web Services Region in your Lightsail account. Must contain 1 to 63 characters. Must contain only
        # alphanumeric characters and hyphens. A hyphen (-) can separate words but cannot be at the start or
        # end of the name.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # An object that describes a deployment for the container service. A deployment specifies the
        # containers that will be launched on the container service and their settings, such as the ports to
        # open, the environment variables to apply, and the launch command to run. It also specifies the
        # container that will serve as the public endpoint of the deployment and its settings, such as the
        # HTTP or HTTPS port to use, and the health check configuration.
        @[JSON::Field(key: "deployment")]
        getter deployment : Types::ContainerServiceDeploymentRequest?

        # An object to describe the configuration for the container service to access private container image
        # repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories. For more
        # information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
        # container service in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "privateRegistryAccess")]
        getter private_registry_access : Types::PrivateRegistryAccessRequest?

        # The public domain names to use with the container service, such as example.com and www.example.com .
        # You can specify up to four public domain names for a container service. The domain names that you
        # specify are used when you create a deployment with a container configured as the public endpoint of
        # your container service. If you don't specify public domain names, then you can use the default
        # domain of the container service. You must create and validate an SSL/TLS certificate before you can
        # use public domain names with your container service. Use the CreateCertificate action to create a
        # certificate for the public domain names you want to use with your container service. You can specify
        # public domain names using a string to array map as shown in the example later on this page.
        @[JSON::Field(key: "publicDomainNames")]
        getter public_domain_names : Hash(String, Array(String))?

        # The tag keys and optional values to add to the container service during create. Use the TagResource
        # action to tag a resource after it's created. For more information about tags in Lightsail, see the
        # Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @power : String,
          @scale : Int32,
          @service_name : String,
          @deployment : Types::ContainerServiceDeploymentRequest? = nil,
          @private_registry_access : Types::PrivateRegistryAccessRequest? = nil,
          @public_domain_names : Hash(String, Array(String))? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateContainerServiceResult
        include JSON::Serializable

        # An object that describes a container service.
        @[JSON::Field(key: "containerService")]
        getter container_service : Types::ContainerService?

        def initialize(
          @container_service : Types::ContainerService? = nil
        )
        end
      end

      struct CreateDiskFromSnapshotRequest
        include JSON::Serializable

        # The Availability Zone where you want to create the disk ( us-east-2a ). Choose the same Availability
        # Zone as the Lightsail instance where you want to create the disk. Use the GetRegions operation to
        # list the Availability Zones where Lightsail is currently available.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The unique Lightsail disk name ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        # The size of the disk in GB ( 32 ).
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32

        # An array of objects that represent the add-ons to enable for the new disk.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOnRequest)?

        # The name of the disk snapshot ( my-snapshot ) from which to create the new storage disk. Constraint:
        # This parameter cannot be defined together with the source disk name parameter. The disk snapshot
        # name and source disk name parameters are mutually exclusive.
        @[JSON::Field(key: "diskSnapshotName")]
        getter disk_snapshot_name : String?

        # The date of the automatic snapshot to use for the new disk. Use the get auto snapshots operation to
        # identify the dates of the available automatic snapshots. Constraints: Must be specified in
        # YYYY-MM-DD format. This parameter cannot be defined together with the use latest restorable auto
        # snapshot parameter. The restore date and use latest restorable auto snapshot parameters are mutually
        # exclusive. Define this parameter only when creating a new disk from an automatic snapshot. For more
        # information, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "restoreDate")]
        getter restore_date : String?

        # The name of the source disk from which the source automatic snapshot was created. Constraints: This
        # parameter cannot be defined together with the disk snapshot name parameter. The source disk name and
        # disk snapshot name parameters are mutually exclusive. Define this parameter only when creating a new
        # disk from an automatic snapshot. For more information, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "sourceDiskName")]
        getter source_disk_name : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # A Boolean value to indicate whether to use the latest available automatic snapshot. Constraints:
        # This parameter cannot be defined together with the restore date parameter. The use latest restorable
        # auto snapshot and restore date parameters are mutually exclusive. Define this parameter only when
        # creating a new disk from an automatic snapshot. For more information, see the Amazon Lightsail
        # Developer Guide .
        @[JSON::Field(key: "useLatestRestorableAutoSnapshot")]
        getter use_latest_restorable_auto_snapshot : Bool?

        def initialize(
          @availability_zone : String,
          @disk_name : String,
          @size_in_gb : Int32,
          @add_ons : Array(Types::AddOnRequest)? = nil,
          @disk_snapshot_name : String? = nil,
          @restore_date : String? = nil,
          @source_disk_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @use_latest_restorable_auto_snapshot : Bool? = nil
        )
        end
      end

      struct CreateDiskFromSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateDiskRequest
        include JSON::Serializable

        # The Availability Zone where you want to create the disk ( us-east-2a ). Use the same Availability
        # Zone as the Lightsail instance to which you want to attach the disk. Use the get regions operation
        # to list the Availability Zones where Lightsail is currently available.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The unique Lightsail disk name ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        # The size of the disk in GB ( 32 ).
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32

        # An array of objects that represent the add-ons to enable for the new disk.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOnRequest)?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @availability_zone : String,
          @disk_name : String,
          @size_in_gb : Int32,
          @add_ons : Array(Types::AddOnRequest)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDiskResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateDiskSnapshotRequest
        include JSON::Serializable

        # The name of the destination disk snapshot ( my-disk-snapshot ) based on the source disk.
        @[JSON::Field(key: "diskSnapshotName")]
        getter disk_snapshot_name : String

        # The unique name of the source disk ( Disk-Virginia-1 ). This parameter cannot be defined together
        # with the instance name parameter. The disk name and instance name parameters are mutually exclusive.
        @[JSON::Field(key: "diskName")]
        getter disk_name : String?

        # The unique name of the source instance ( Amazon_Linux-512MB-Virginia-1 ). When this is defined, a
        # snapshot of the instance's system volume is created. This parameter cannot be defined together with
        # the disk name parameter. The instance name and disk name parameters are mutually exclusive.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @disk_snapshot_name : String,
          @disk_name : String? = nil,
          @instance_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDiskSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateDistributionRequest
        include JSON::Serializable

        # The bundle ID to use for the distribution. A distribution bundle describes the specifications of
        # your distribution, such as the monthly cost and monthly network transfer quota. Use the
        # GetDistributionBundles action to get a list of distribution bundle IDs that you can specify.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String

        # An object that describes the default cache behavior for the distribution.
        @[JSON::Field(key: "defaultCacheBehavior")]
        getter default_cache_behavior : Types::CacheBehavior

        # The name for the distribution.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String

        # An object that describes the origin resource for the distribution, such as a Lightsail instance,
        # bucket, or load balancer. The distribution pulls, caches, and serves content from the origin.
        @[JSON::Field(key: "origin")]
        getter origin : Types::InputOrigin

        # An object that describes the cache behavior settings for the distribution.
        @[JSON::Field(key: "cacheBehaviorSettings")]
        getter cache_behavior_settings : Types::CacheSettings?

        # An array of objects that describe the per-path cache behavior for the distribution.
        @[JSON::Field(key: "cacheBehaviors")]
        getter cache_behaviors : Array(Types::CacheBehaviorPerPath)?

        # The name of the SSL/TLS certificate that you want to attach to the distribution. Use the
        # GetCertificates action to get a list of certificate names that you can specify.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The IP address type for the distribution. The possible values are ipv4 for IPv4 only, and dualstack
        # for IPv4 and IPv6. The default value is dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The tag keys and optional values to add to the distribution during create. Use the TagResource
        # action to tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The minimum TLS protocol version for the SSL/TLS certificate.
        @[JSON::Field(key: "viewerMinimumTlsProtocolVersion")]
        getter viewer_minimum_tls_protocol_version : String?

        def initialize(
          @bundle_id : String,
          @default_cache_behavior : Types::CacheBehavior,
          @distribution_name : String,
          @origin : Types::InputOrigin,
          @cache_behavior_settings : Types::CacheSettings? = nil,
          @cache_behaviors : Array(Types::CacheBehaviorPerPath)? = nil,
          @certificate_name : String? = nil,
          @ip_address_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @viewer_minimum_tls_protocol_version : String? = nil
        )
        end
      end

      struct CreateDistributionResult
        include JSON::Serializable

        # An object that describes the distribution created.
        @[JSON::Field(key: "distribution")]
        getter distribution : Types::LightsailDistribution?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @distribution : Types::LightsailDistribution? = nil,
          @operation : Types::Operation? = nil
        )
        end
      end

      struct CreateDomainEntryRequest
        include JSON::Serializable

        # An array of key-value pairs containing information about the domain entry request.
        @[JSON::Field(key: "domainEntry")]
        getter domain_entry : Types::DomainEntry

        # The domain name ( example.com ) for which you want to create the domain entry.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_entry : Types::DomainEntry,
          @domain_name : String
        )
        end
      end

      struct CreateDomainEntryResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct CreateDomainRequest
        include JSON::Serializable

        # The domain name to manage ( example.com ).
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @domain_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDomainResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct CreateGUISessionAccessDetailsRequest
        include JSON::Serializable

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct CreateGUISessionAccessDetailsResult
        include JSON::Serializable

        # The reason the operation failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The percentage of completion for the operation.
        @[JSON::Field(key: "percentageComplete")]
        getter percentage_complete : Int32?

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # Returns information about the specified Amazon DCV GUI session.
        @[JSON::Field(key: "sessions")]
        getter sessions : Array(Types::Session)?

        # The status of the operation.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @failure_reason : String? = nil,
          @percentage_complete : Int32? = nil,
          @resource_name : String? = nil,
          @sessions : Array(Types::Session)? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateInstanceSnapshotRequest
        include JSON::Serializable

        # The Lightsail instance on which to base your snapshot.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # The name for your new snapshot.
        @[JSON::Field(key: "instanceSnapshotName")]
        getter instance_snapshot_name : String

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @instance_name : String,
          @instance_snapshot_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateInstanceSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateInstancesFromSnapshotRequest
        include JSON::Serializable

        # The Availability Zone where you want to create your instances. Use the following formatting:
        # us-east-2a (case sensitive). You can get a list of Availability Zones by using the get regions
        # operation. Be sure to add the include Availability Zones parameter to your request.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The bundle of specification information for your virtual private server (or instance ), including
        # the pricing plan ( micro_x_x ).
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String

        # The names for your new instances.
        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # An array of objects representing the add-ons to enable for the new instance.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOnRequest)?

        # An object containing information about one or more disk mappings.
        @[JSON::Field(key: "attachedDiskMapping")]
        getter attached_disk_mapping : Hash(String, Array(Types::DiskMap))?

        # The name of the instance snapshot on which you are basing your new instances. Use the get instance
        # snapshots operation to return information about your existing snapshots. Constraint: This parameter
        # cannot be defined together with the source instance name parameter. The instance snapshot name and
        # source instance name parameters are mutually exclusive.
        @[JSON::Field(key: "instanceSnapshotName")]
        getter instance_snapshot_name : String?

        # The IP address type for the instance. The possible values are ipv4 for IPv4 only, ipv6 for IPv6
        # only, and dualstack for IPv4 and IPv6. The default value is dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The name for your key pair.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String?

        # The date of the automatic snapshot to use for the new instance. Use the get auto snapshots operation
        # to identify the dates of the available automatic snapshots. Constraints: Must be specified in
        # YYYY-MM-DD format. This parameter cannot be defined together with the use latest restorable auto
        # snapshot parameter. The restore date and use latest restorable auto snapshot parameters are mutually
        # exclusive. Define this parameter only when creating a new instance from an automatic snapshot. For
        # more information, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "restoreDate")]
        getter restore_date : String?

        # The name of the source instance from which the source automatic snapshot was created. Constraints:
        # This parameter cannot be defined together with the instance snapshot name parameter. The source
        # instance name and instance snapshot name parameters are mutually exclusive. Define this parameter
        # only when creating a new instance from an automatic snapshot. For more information, see the Amazon
        # Lightsail Developer Guide .
        @[JSON::Field(key: "sourceInstanceName")]
        getter source_instance_name : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # A Boolean value to indicate whether to use the latest available automatic snapshot. Constraints:
        # This parameter cannot be defined together with the restore date parameter. The use latest restorable
        # auto snapshot and restore date parameters are mutually exclusive. Define this parameter only when
        # creating a new instance from an automatic snapshot. For more information, see the Amazon Lightsail
        # Developer Guide .
        @[JSON::Field(key: "useLatestRestorableAutoSnapshot")]
        getter use_latest_restorable_auto_snapshot : Bool?

        # You can create a launch script that configures a server with additional user data. For example,
        # apt-get -y update . Depending on the machine image you choose, the command to get software on your
        # instance varies. Amazon Linux and CentOS use yum , Debian and Ubuntu use apt-get , and FreeBSD uses
        # pkg . For a complete list, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "userData")]
        getter user_data : String?

        def initialize(
          @availability_zone : String,
          @bundle_id : String,
          @instance_names : Array(String),
          @add_ons : Array(Types::AddOnRequest)? = nil,
          @attached_disk_mapping : Hash(String, Array(Types::DiskMap))? = nil,
          @instance_snapshot_name : String? = nil,
          @ip_address_type : String? = nil,
          @key_pair_name : String? = nil,
          @restore_date : String? = nil,
          @source_instance_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @use_latest_restorable_auto_snapshot : Bool? = nil,
          @user_data : String? = nil
        )
        end
      end

      struct CreateInstancesFromSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateInstancesRequest
        include JSON::Serializable

        # The Availability Zone in which to create your instance. Use the following format: us-east-2a (case
        # sensitive). You can get a list of Availability Zones by using the get regions operation. Be sure to
        # add the include Availability Zones parameter to your request.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The ID for a virtual private server image ( app_wordpress_x_x or app_lamp_x_x ). Use the get
        # blueprints operation to return a list of available images (or blueprints ). Use active blueprints
        # when creating new instances. Inactive blueprints are listed to support customers with existing
        # instances and are not necessarily available to create new instances. Blueprints are marked inactive
        # when they become outdated due to operating system updates or new application releases.
        @[JSON::Field(key: "blueprintId")]
        getter blueprint_id : String

        # The bundle of specification information for your virtual private server (or instance ), including
        # the pricing plan ( medium_x_x ).
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String

        # The names to use for your new Lightsail instances. Separate multiple values using quotation marks
        # and commas, for example: ["MyFirstInstance","MySecondInstance"]
        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # An array of objects representing the add-ons to enable for the new instance.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOnRequest)?

        # (Discontinued) The name for your custom image. In releases prior to June 12, 2017, this parameter
        # was ignored by the API. It is now discontinued.
        @[JSON::Field(key: "customImageName")]
        getter custom_image_name : String?

        # The IP address type for the instance. The possible values are ipv4 for IPv4 only, ipv6 for IPv6
        # only, and dualstack for IPv4 and IPv6. The default value is dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The name of your key pair.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # A launch script you can create that configures a server with additional user data. For example, you
        # might want to run apt-get -y update . Depending on the machine image you choose, the command to get
        # software on your instance varies. Amazon Linux and CentOS use yum , Debian and Ubuntu use apt-get ,
        # and FreeBSD uses pkg . For a complete list, see the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "userData")]
        getter user_data : String?

        def initialize(
          @availability_zone : String,
          @blueprint_id : String,
          @bundle_id : String,
          @instance_names : Array(String),
          @add_ons : Array(Types::AddOnRequest)? = nil,
          @custom_image_name : String? = nil,
          @ip_address_type : String? = nil,
          @key_pair_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_data : String? = nil
        )
        end
      end

      struct CreateInstancesResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateKeyPairRequest
        include JSON::Serializable

        # The name for your new key pair.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @key_pair_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateKeyPairResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the new key pair you just created.
        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::KeyPair?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        # A base64-encoded RSA private key.
        @[JSON::Field(key: "privateKeyBase64")]
        getter private_key_base64 : String?

        # A base64-encoded public key of the ssh-rsa type.
        @[JSON::Field(key: "publicKeyBase64")]
        getter public_key_base64 : String?

        def initialize(
          @key_pair : Types::KeyPair? = nil,
          @operation : Types::Operation? = nil,
          @private_key_base64 : String? = nil,
          @public_key_base64 : String? = nil
        )
        end
      end

      struct CreateLoadBalancerRequest
        include JSON::Serializable

        # The instance port where you're creating your load balancer.
        @[JSON::Field(key: "instancePort")]
        getter instance_port : Int32

        # The name of your load balancer.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        # The optional alternative domains and subdomains to use with your SSL/TLS certificate (
        # www.example.com , example.com , m.example.com , blog.example.com ).
        @[JSON::Field(key: "certificateAlternativeNames")]
        getter certificate_alternative_names : Array(String)?

        # The domain name with which your certificate is associated ( example.com ). If you specify
        # certificateDomainName , then certificateName is required (and vice-versa).
        @[JSON::Field(key: "certificateDomainName")]
        getter certificate_domain_name : String?

        # The name of the SSL/TLS certificate. If you specify certificateName , then certificateDomainName is
        # required (and vice-versa).
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The path you provided to perform the load balancer health check. If you didn't specify a health
        # check path, Lightsail uses the root path of your website ( "/" ). You may want to specify a custom
        # health check path other than the root of your application if your home page loads slowly or has a
        # lot of media or scripting on it.
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String?

        # The IP address type for the load balancer. The possible values are ipv4 for IPv4 only, ipv6 for IPv6
        # only, and dualstack for IPv4 and IPv6. The default value is dualstack .
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The name of the TLS policy to apply to the load balancer. Use the GetLoadBalancerTlsPolicies action
        # to get a list of TLS policy names that you can specify. For more information about load balancer TLS
        # policies, see Configuring TLS security policies on your Amazon Lightsail load balancers in the
        # Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tlsPolicyName")]
        getter tls_policy_name : String?

        def initialize(
          @instance_port : Int32,
          @load_balancer_name : String,
          @certificate_alternative_names : Array(String)? = nil,
          @certificate_domain_name : String? = nil,
          @certificate_name : String? = nil,
          @health_check_path : String? = nil,
          @ip_address_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tls_policy_name : String? = nil
        )
        end
      end

      struct CreateLoadBalancerResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateLoadBalancerTlsCertificateRequest
        include JSON::Serializable

        # The domain name ( example.com ) for your SSL/TLS certificate.
        @[JSON::Field(key: "certificateDomainName")]
        getter certificate_domain_name : String

        # The SSL/TLS certificate name. You can have up to 10 certificates in your account at one time. Each
        # Lightsail load balancer can have up to 2 certificates associated with it at one time. There is also
        # an overall limit to the number of certificates that can be issue in a 365-day period. For more
        # information, see Limits .
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        # The load balancer name where you want to create the SSL/TLS certificate.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        # An array of strings listing alternative domains and subdomains for your SSL/TLS certificate.
        # Lightsail will de-dupe the names for you. You can have a maximum of 9 alternative names (in addition
        # to the 1 primary domain). We do not support wildcards ( *.example.com ).
        @[JSON::Field(key: "certificateAlternativeNames")]
        getter certificate_alternative_names : Array(String)?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @certificate_domain_name : String,
          @certificate_name : String,
          @load_balancer_name : String,
          @certificate_alternative_names : Array(String)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateLoadBalancerTlsCertificateResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateRelationalDatabaseFromSnapshotRequest
        include JSON::Serializable

        # The name to use for your new Lightsail database resource. Constraints: Must contain from 2 to 255
        # alphanumeric characters, or hyphens. The first and last character must be a letter or number.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The Availability Zone in which to create your new database. Use the us-east-2a case-sensitive
        # format. You can get a list of Availability Zones by using the get regions operation. Be sure to add
        # the include relational database Availability Zones parameter to your request.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # Specifies the accessibility options for your new database. A value of true specifies a database that
        # is available to resources outside of your Lightsail account. A value of false specifies a database
        # that is available only to your Lightsail resources in the same region as your database.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The bundle ID for your new database. A bundle describes the performance specifications for your
        # database. You can get a list of database bundle IDs by using the get relational database bundles
        # operation. When creating a new database from a snapshot, you cannot choose a bundle that is smaller
        # than the bundle of the source database.
        @[JSON::Field(key: "relationalDatabaseBundleId")]
        getter relational_database_bundle_id : String?

        # The name of the database snapshot from which to create your new database.
        @[JSON::Field(key: "relationalDatabaseSnapshotName")]
        getter relational_database_snapshot_name : String?

        # The date and time to restore your database from. Constraints: Must be before the latest restorable
        # time for the database. Cannot be specified if the use latest restorable time parameter is true .
        # Specified in Coordinated Universal Time (UTC). Specified in the Unix time format. For example, if
        # you wish to use a restore time of October 1, 2018, at 8 PM UTC, then you input 1538424000 as the
        # restore time.
        @[JSON::Field(key: "restoreTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter restore_time : Time?

        # The name of the source database.
        @[JSON::Field(key: "sourceRelationalDatabaseName")]
        getter source_relational_database_name : String?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Specifies whether your database is restored from the latest backup time. A value of true restores
        # from the latest backup time. Default: false Constraints: Cannot be specified if the restore time
        # parameter is provided.
        @[JSON::Field(key: "useLatestRestorableTime")]
        getter use_latest_restorable_time : Bool?

        def initialize(
          @relational_database_name : String,
          @availability_zone : String? = nil,
          @publicly_accessible : Bool? = nil,
          @relational_database_bundle_id : String? = nil,
          @relational_database_snapshot_name : String? = nil,
          @restore_time : Time? = nil,
          @source_relational_database_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @use_latest_restorable_time : Bool? = nil
        )
        end
      end

      struct CreateRelationalDatabaseFromSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateRelationalDatabaseRequest
        include JSON::Serializable

        # The meaning of this parameter differs according to the database engine you use. MySQL The name of
        # the database to create when the Lightsail database resource is created. If this parameter isn't
        # specified, no database is created in the database resource. Constraints: Must contain 1 to 64
        # letters or numbers. Must begin with a letter. Subsequent characters can be letters, underscores, or
        # digits (0- 9). Can't be a word reserved by the specified database engine. For more information about
        # reserved words in MySQL, see the Keywords and Reserved Words articles for MySQL 5.6 , MySQL 5.7 ,
        # and MySQL 8.0 . PostgreSQL The name of the database to create when the Lightsail database resource
        # is created. If this parameter isn't specified, a database named postgres is created in the database
        # resource. Constraints: Must contain 1 to 63 letters or numbers. Must begin with a letter. Subsequent
        # characters can be letters, underscores, or digits (0- 9). Can't be a word reserved by the specified
        # database engine. For more information about reserved words in PostgreSQL, see the SQL Key Words
        # articles for PostgreSQL 9.6 , PostgreSQL 10 , PostgreSQL 11 , and PostgreSQL 12 .
        @[JSON::Field(key: "masterDatabaseName")]
        getter master_database_name : String

        # The name for the master user. MySQL Constraints: Required for MySQL. Must be 1 to 16 letters or
        # numbers. Can contain underscores. First character must be a letter. Can't be a reserved word for the
        # chosen database engine. For more information about reserved words in MySQL 5.6 or 5.7, see the
        # Keywords and Reserved Words articles for MySQL 5.6 , MySQL 5.7 , or MySQL 8.0 . PostgreSQL
        # Constraints: Required for PostgreSQL. Must be 1 to 63 letters or numbers. Can contain underscores.
        # First character must be a letter. Can't be a reserved word for the chosen database engine. For more
        # information about reserved words in MySQL 5.6 or 5.7, see the Keywords and Reserved Words articles
        # for PostgreSQL 9.6 , PostgreSQL 10 , PostgreSQL 11 , and PostgreSQL 12 .
        @[JSON::Field(key: "masterUsername")]
        getter master_username : String

        # The blueprint ID for your new database. A blueprint describes the major engine version of a
        # database. You can get a list of database blueprints IDs by using the get relational database
        # blueprints operation.
        @[JSON::Field(key: "relationalDatabaseBlueprintId")]
        getter relational_database_blueprint_id : String

        # The bundle ID for your new database. A bundle describes the performance specifications for your
        # database. You can get a list of database bundle IDs by using the get relational database bundles
        # operation.
        @[JSON::Field(key: "relationalDatabaseBundleId")]
        getter relational_database_bundle_id : String

        # The name to use for your new Lightsail database resource. Constraints: Must contain from 2 to 255
        # alphanumeric characters, or hyphens. The first and last character must be a letter or number.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The Availability Zone in which to create your new database. Use the us-east-2a case-sensitive
        # format. You can get a list of Availability Zones by using the get regions operation. Be sure to add
        # the include relational database Availability Zones parameter to your request.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The password for the master user. The password can include any printable ASCII character except "/",
        # """, or "@". It cannot contain spaces. MySQL Constraints: Must contain from 8 to 41 characters.
        # PostgreSQL Constraints: Must contain from 8 to 128 characters.
        @[JSON::Field(key: "masterUserPassword")]
        getter master_user_password : String?

        # The daily time range during which automated backups are created for your new database if automated
        # backups are enabled. The default is a 30-minute window selected at random from an 8-hour block of
        # time for each AWS Region. For more information about the preferred backup window time blocks for
        # each region, see the Working With Backups guide in the Amazon Relational Database Service
        # documentation. Constraints: Must be in the hh24:mi-hh24:mi format. Example: 16:00-16:30 Specified in
        # Coordinated Universal Time (UTC). Must not conflict with the preferred maintenance window. Must be
        # at least 30 minutes.
        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur on your new database. The default is
        # a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on
        # a random day of the week. Constraints: Must be in the ddd:hh24:mi-ddd:hh24:mi format. Valid days:
        # Mon, Tue, Wed, Thu, Fri, Sat, Sun. Must be at least 30 minutes. Specified in Coordinated Universal
        # Time (UTC). Example: Tue:17:00-Tue:17:30
        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies the accessibility options for your new database. A value of true specifies a database that
        # is available to resources outside of your Lightsail account. A value of false specifies a database
        # that is available only to your Lightsail resources in the same region as your database.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @master_database_name : String,
          @master_username : String,
          @relational_database_blueprint_id : String,
          @relational_database_bundle_id : String,
          @relational_database_name : String,
          @availability_zone : String? = nil,
          @master_user_password : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct CreateRelationalDatabaseSnapshotRequest
        include JSON::Serializable

        # The name of the database on which to base your new snapshot.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The name for your new database snapshot. Constraints: Must contain from 2 to 255 alphanumeric
        # characters, or hyphens. The first and last character must be a letter or number.
        @[JSON::Field(key: "relationalDatabaseSnapshotName")]
        getter relational_database_snapshot_name : String

        # The tag keys and optional values to add to the resource during create. Use the TagResource action to
        # tag a resource after it's created.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @relational_database_name : String,
          @relational_database_snapshot_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateRelationalDatabaseSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteAlarmRequest
        include JSON::Serializable

        # The name of the alarm to delete.
        @[JSON::Field(key: "alarmName")]
        getter alarm_name : String

        def initialize(
          @alarm_name : String
        )
        end
      end

      struct DeleteAlarmResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteAutoSnapshotRequest
        include JSON::Serializable

        # The date of the automatic snapshot to delete in YYYY-MM-DD format. Use the get auto snapshots
        # operation to get the available automatic snapshots for a resource.
        @[JSON::Field(key: "date")]
        getter date : String

        # The name of the source instance or disk from which to delete the automatic snapshot.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @date : String,
          @resource_name : String
        )
        end
      end

      struct DeleteAutoSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteBucketAccessKeyRequest
        include JSON::Serializable

        # The ID of the access key to delete. Use the GetBucketAccessKeys action to get a list of access key
        # IDs that you can specify.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String

        # The name of the bucket that the access key belongs to.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @access_key_id : String,
          @bucket_name : String
        )
        end
      end

      struct DeleteBucketAccessKeyResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteBucketRequest
        include JSON::Serializable

        # The name of the bucket to delete. Use the GetBuckets action to get a list of bucket names that you
        # can specify.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # A Boolean value that indicates whether to force delete the bucket. You must force delete the bucket
        # if it has one of the following conditions: The bucket is the origin of a distribution. The bucket
        # has instances that were granted access to it using the SetResourceAccessForBucket action. The bucket
        # has objects. The bucket has access keys. Force deleting a bucket might impact other resources that
        # rely on the bucket, such as instances, distributions, or software that use the issued access keys.
        @[JSON::Field(key: "forceDelete")]
        getter force_delete : Bool?

        def initialize(
          @bucket_name : String,
          @force_delete : Bool? = nil
        )
        end
      end

      struct DeleteBucketResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteCertificateRequest
        include JSON::Serializable

        # The name of the certificate to delete. Use the GetCertificates action to get a list of certificate
        # names that you can specify.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        def initialize(
          @certificate_name : String
        )
        end
      end

      struct DeleteCertificateResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteContactMethodRequest
        include JSON::Serializable

        # The protocol that will be deleted, such as Email or SMS (text messaging). To delete an Email and an
        # SMS contact method if you added both, you must run separate DeleteContactMethod actions to delete
        # each protocol.
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @protocol : String
        )
        end
      end

      struct DeleteContactMethodResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteContainerImageRequest
        include JSON::Serializable

        # The name of the container image to delete from the container service. Use the GetContainerImages
        # action to get the name of the container images that are registered to a container service. Container
        # images sourced from your Lightsail container service, that are registered and stored on your
        # service, start with a colon ( : ). For example, :container-service-1.mystaticwebsite.1 . Container
        # images sourced from a public registry like Docker Hub don't start with a colon. For example,
        # nginx:latest or nginx .
        @[JSON::Field(key: "image")]
        getter image : String

        # The name of the container service for which to delete a registered container image.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @image : String,
          @service_name : String
        )
        end
      end

      struct DeleteContainerImageResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteContainerServiceRequest
        include JSON::Serializable

        # The name of the container service to delete.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end

      struct DeleteContainerServiceResult
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteDiskRequest
        include JSON::Serializable

        # The unique name of the disk you want to delete ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        # A Boolean value to indicate whether to delete all add-ons for the disk.
        @[JSON::Field(key: "forceDeleteAddOns")]
        getter force_delete_add_ons : Bool?

        def initialize(
          @disk_name : String,
          @force_delete_add_ons : Bool? = nil
        )
        end
      end

      struct DeleteDiskResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteDiskSnapshotRequest
        include JSON::Serializable

        # The name of the disk snapshot you want to delete ( my-disk-snapshot ).
        @[JSON::Field(key: "diskSnapshotName")]
        getter disk_snapshot_name : String

        def initialize(
          @disk_snapshot_name : String
        )
        end
      end

      struct DeleteDiskSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteDistributionRequest
        include JSON::Serializable

        # The name of the distribution to delete. Use the GetDistributions action to get a list of
        # distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String?

        def initialize(
          @distribution_name : String? = nil
        )
        end
      end

      struct DeleteDistributionResult
        include JSON::Serializable

        # An object that describes the result of the action, such as the status of the request, the timestamp
        # of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct DeleteDomainEntryRequest
        include JSON::Serializable

        # An array of key-value pairs containing information about your domain entries.
        @[JSON::Field(key: "domainEntry")]
        getter domain_entry : Types::DomainEntry

        # The name of the domain entry to delete.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_entry : Types::DomainEntry,
          @domain_name : String
        )
        end
      end

      struct DeleteDomainEntryResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct DeleteDomainRequest
        include JSON::Serializable

        # The specific domain name to delete.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      struct DeleteDomainResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct DeleteInstanceRequest
        include JSON::Serializable

        # The name of the instance to delete.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # A Boolean value to indicate whether to delete all add-ons for the instance.
        @[JSON::Field(key: "forceDeleteAddOns")]
        getter force_delete_add_ons : Bool?

        def initialize(
          @instance_name : String,
          @force_delete_add_ons : Bool? = nil
        )
        end
      end

      struct DeleteInstanceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteInstanceSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot to delete.
        @[JSON::Field(key: "instanceSnapshotName")]
        getter instance_snapshot_name : String

        def initialize(
          @instance_snapshot_name : String
        )
        end
      end

      struct DeleteInstanceSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteKeyPairRequest
        include JSON::Serializable

        # The name of the key pair to delete.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String

        # The RSA fingerprint of the Lightsail default key pair to delete. The expectedFingerprint parameter
        # is required only when specifying to delete a Lightsail default key pair.
        @[JSON::Field(key: "expectedFingerprint")]
        getter expected_fingerprint : String?

        def initialize(
          @key_pair_name : String,
          @expected_fingerprint : String? = nil
        )
        end
      end

      struct DeleteKeyPairResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct DeleteKnownHostKeysRequest
        include JSON::Serializable

        # The name of the instance for which you want to reset the host key or certificate.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct DeleteKnownHostKeysResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteLoadBalancerRequest
        include JSON::Serializable

        # The name of the load balancer you want to delete.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_name : String
        )
        end
      end

      struct DeleteLoadBalancerResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteLoadBalancerTlsCertificateRequest
        include JSON::Serializable

        # The SSL/TLS certificate name.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String

        # The load balancer name.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        # When true , forces the deletion of an SSL/TLS certificate. There can be two certificates associated
        # with a Lightsail load balancer: the primary and the backup. The force parameter is required when the
        # primary SSL/TLS certificate is in use by an instance attached to the load balancer.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @certificate_name : String,
          @load_balancer_name : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteLoadBalancerTlsCertificateResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteRelationalDatabaseRequest
        include JSON::Serializable

        # The name of the database that you are deleting.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The name of the database snapshot created if skip final snapshot is false , which is the default
        # value for that parameter. Specifying this parameter and also specifying the skip final snapshot
        # parameter to true results in an error. Constraints: Must contain from 2 to 255 alphanumeric
        # characters, or hyphens. The first and last character must be a letter or number.
        @[JSON::Field(key: "finalRelationalDatabaseSnapshotName")]
        getter final_relational_database_snapshot_name : String?

        # Determines whether a final database snapshot is created before your database is deleted. If true is
        # specified, no database snapshot is created. If false is specified, a database snapshot is created
        # before your database is deleted. You must specify the final relational database snapshot name
        # parameter if the skip final snapshot parameter is false . Default: false
        @[JSON::Field(key: "skipFinalSnapshot")]
        getter skip_final_snapshot : Bool?

        def initialize(
          @relational_database_name : String,
          @final_relational_database_snapshot_name : String? = nil,
          @skip_final_snapshot : Bool? = nil
        )
        end
      end

      struct DeleteRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DeleteRelationalDatabaseSnapshotRequest
        include JSON::Serializable

        # The name of the database snapshot that you are deleting.
        @[JSON::Field(key: "relationalDatabaseSnapshotName")]
        getter relational_database_snapshot_name : String

        def initialize(
          @relational_database_snapshot_name : String
        )
        end
      end

      struct DeleteRelationalDatabaseSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes the destination of a record.
      struct DestinationInfo
        include JSON::Serializable

        # The ID of the resource created at the destination.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The destination service of the record.
        @[JSON::Field(key: "service")]
        getter service : String?

        def initialize(
          @id : String? = nil,
          @service : String? = nil
        )
        end
      end

      struct DetachCertificateFromDistributionRequest
        include JSON::Serializable

        # The name of the distribution from which to detach the certificate. Use the GetDistributions action
        # to get a list of distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String

        def initialize(
          @distribution_name : String
        )
        end
      end

      struct DetachCertificateFromDistributionResult
        include JSON::Serializable

        # An object that describes the result of the action, such as the status of the request, the timestamp
        # of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct DetachDiskRequest
        include JSON::Serializable

        # The unique name of the disk you want to detach from your instance ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        def initialize(
          @disk_name : String
        )
        end
      end

      struct DetachDiskResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DetachInstancesFromLoadBalancerRequest
        include JSON::Serializable

        # An array of strings containing the names of the instances you want to detach from the load balancer.
        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # The name of the Lightsail load balancer.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @instance_names : Array(String),
          @load_balancer_name : String
        )
        end
      end

      struct DetachInstancesFromLoadBalancerResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DetachStaticIpRequest
        include JSON::Serializable

        # The name of the static IP to detach from the instance.
        @[JSON::Field(key: "staticIpName")]
        getter static_ip_name : String

        def initialize(
          @static_ip_name : String
        )
        end
      end

      struct DetachStaticIpResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct DisableAddOnRequest
        include JSON::Serializable

        # The add-on type to disable.
        @[JSON::Field(key: "addOnType")]
        getter add_on_type : String

        # The name of the source resource for which to disable the add-on.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @add_on_type : String,
          @resource_name : String
        )
        end
      end

      struct DisableAddOnResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes a block storage disk.
      struct Disk
        include JSON::Serializable

        # An array of objects representing the add-ons enabled on the disk.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOn)?

        # The Amazon Resource Name (ARN) of the disk.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The resources to which the disk is attached.
        @[JSON::Field(key: "attachedTo")]
        getter attached_to : String?

        # (Discontinued) The attachment state of the disk. In releases prior to November 14, 2017, this
        # parameter returned attached for system disks in the API response. It is now discontinued, but still
        # included in the response. Use isAttached instead.
        @[JSON::Field(key: "attachmentState")]
        getter attachment_state : String?

        # The status of automatically mounting a storage disk to a virtual computer. This parameter only
        # applies to Lightsail for Research resources.
        @[JSON::Field(key: "autoMountStatus")]
        getter auto_mount_status : String?

        # The date when the disk was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # (Discontinued) The number of GB in use by the disk. In releases prior to November 14, 2017, this
        # parameter was not included in the API response. It is now discontinued.
        @[JSON::Field(key: "gbInUse")]
        getter gb_in_use : Int32?

        # The input/output operations per second (IOPS) of the disk.
        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # A Boolean value indicating whether the disk is attached.
        @[JSON::Field(key: "isAttached")]
        getter is_attached : Bool?

        # A Boolean value indicating whether this disk is a system disk (has an operating system loaded on
        # it).
        @[JSON::Field(key: "isSystemDisk")]
        getter is_system_disk : Bool?

        # The AWS Region and Availability Zone where the disk is located.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The unique name of the disk.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The disk path.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The Lightsail resource type ( Disk ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The size of the disk in GB.
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        # Describes the status of the disk.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @add_ons : Array(Types::AddOn)? = nil,
          @arn : String? = nil,
          @attached_to : String? = nil,
          @attachment_state : String? = nil,
          @auto_mount_status : String? = nil,
          @created_at : Time? = nil,
          @gb_in_use : Int32? = nil,
          @iops : Int32? = nil,
          @is_attached : Bool? = nil,
          @is_system_disk : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @resource_type : String? = nil,
          @size_in_gb : Int32? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a disk.
      struct DiskInfo
        include JSON::Serializable

        # A Boolean value indicating whether this disk is a system disk (has an operating system loaded on
        # it).
        @[JSON::Field(key: "isSystemDisk")]
        getter is_system_disk : Bool?

        # The disk name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The disk path.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The size of the disk in GB ( 32 ).
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        def initialize(
          @is_system_disk : Bool? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @size_in_gb : Int32? = nil
        )
        end
      end

      # Describes a block storage disk mapping.
      struct DiskMap
        include JSON::Serializable

        # The new disk name ( my-new-disk ).
        @[JSON::Field(key: "newDiskName")]
        getter new_disk_name : String?

        # The original disk path exposed to the instance (for example, /dev/sdh ).
        @[JSON::Field(key: "originalDiskPath")]
        getter original_disk_path : String?

        def initialize(
          @new_disk_name : String? = nil,
          @original_disk_path : String? = nil
        )
        end
      end

      # Describes a block storage disk snapshot.
      struct DiskSnapshot
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the disk snapshot.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the disk snapshot was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the source disk from which the disk snapshot was created.
        @[JSON::Field(key: "fromDiskArn")]
        getter from_disk_arn : String?

        # The unique name of the source disk from which the disk snapshot was created.
        @[JSON::Field(key: "fromDiskName")]
        getter from_disk_name : String?

        # The Amazon Resource Name (ARN) of the source instance from which the disk (system volume) snapshot
        # was created.
        @[JSON::Field(key: "fromInstanceArn")]
        getter from_instance_arn : String?

        # The unique name of the source instance from which the disk (system volume) snapshot was created.
        @[JSON::Field(key: "fromInstanceName")]
        getter from_instance_name : String?

        # A Boolean value indicating whether the snapshot was created from an automatic snapshot.
        @[JSON::Field(key: "isFromAutoSnapshot")]
        getter is_from_auto_snapshot : Bool?

        # The AWS Region and Availability Zone where the disk snapshot was created.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the disk snapshot ( my-disk-snapshot ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The progress of the snapshot.
        @[JSON::Field(key: "progress")]
        getter progress : String?

        # The Lightsail resource type ( DiskSnapshot ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The size of the disk in GB.
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        # The status of the disk snapshot operation.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @from_disk_arn : String? = nil,
          @from_disk_name : String? = nil,
          @from_instance_arn : String? = nil,
          @from_instance_name : String? = nil,
          @is_from_auto_snapshot : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @progress : String? = nil,
          @resource_type : String? = nil,
          @size_in_gb : Int32? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a disk snapshot.
      struct DiskSnapshotInfo
        include JSON::Serializable

        # The size of the disk in GB ( 32 ).
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        def initialize(
          @size_in_gb : Int32? = nil
        )
        end
      end

      # Describes the specifications of a distribution bundle.
      struct DistributionBundle
        include JSON::Serializable

        # The ID of the bundle.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # Indicates whether the bundle is active, and can be specified for a new or existing distribution.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The name of the distribution bundle.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The monthly price, in US dollars, of the bundle.
        @[JSON::Field(key: "price")]
        getter price : Float64?

        # The monthly network transfer quota of the bundle.
        @[JSON::Field(key: "transferPerMonthInGb")]
        getter transfer_per_month_in_gb : Int32?

        def initialize(
          @bundle_id : String? = nil,
          @is_active : Bool? = nil,
          @name : String? = nil,
          @price : Float64? = nil,
          @transfer_per_month_in_gb : Int32? = nil
        )
        end
      end

      # Describes the creation state of the canonical name (CNAME) records that are automatically added by
      # Amazon Lightsail to the DNS of a domain to validate domain ownership for an SSL/TLS certificate.
      # When you create an SSL/TLS certificate for a Lightsail resource, you must add a set of CNAME records
      # to the DNS of the domains for the certificate to validate that you own the domains. Lightsail can
      # automatically add the CNAME records to the DNS of the domain if the DNS zone for the domain exists
      # within your Lightsail account. If automatic record addition fails, or if you manage the DNS of your
      # domain using a third-party service, then you must manually add the CNAME records to the DNS of your
      # domain. For more information, see Verify an SSL/TLS certificate in Amazon Lightsail in the Amazon
      # Lightsail Developer Guide .
      struct DnsRecordCreationState
        include JSON::Serializable

        # The status code for the automated DNS record creation. Following are the possible values: SUCCEEDED
        # - The validation records were successfully added to the domain. STARTED - The automatic DNS record
        # creation has started. FAILED - The validation records failed to be added to the domain.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The message that describes the reason for the status code.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes a domain where you are storing recordsets.
      struct Domain
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the domain recordset (
        # arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE ).
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the domain recordset was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An array of key-value pairs containing information about the domain entries.
        @[JSON::Field(key: "domainEntries")]
        getter domain_entries : Array(Types::DomainEntry)?

        # The AWS Region and Availability Zones where the domain recordset was created.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the domain.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An object that describes the state of the Route 53 domain delegation to a Lightsail DNS zone.
        @[JSON::Field(key: "registeredDomainDelegationInfo")]
        getter registered_domain_delegation_info : Types::RegisteredDomainDelegationInfo?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @domain_entries : Array(Types::DomainEntry)? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @registered_domain_delegation_info : Types::RegisteredDomainDelegationInfo? = nil,
          @resource_type : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a domain recordset entry.
      struct DomainEntry
        include JSON::Serializable

        # The ID of the domain recordset entry.
        @[JSON::Field(key: "id")]
        getter id : String?

        # When true , specifies whether the domain entry is an alias used by the Lightsail load balancer,
        # Lightsail container service, Lightsail content delivery network (CDN) distribution, or another
        # Amazon Web Services resource. You can include an alias (A type) record in your request, which points
        # to the DNS name of a load balancer, container service, CDN distribution, or other Amazon Web
        # Services resource and routes traffic to that resource.
        @[JSON::Field(key: "isAlias")]
        getter is_alias : Bool?

        # The name of the domain.
        @[JSON::Field(key: "name")]
        getter name : String?

        # (Discontinued) The options for the domain entry. In releases prior to November 29, 2017, this
        # parameter was not included in the API response. It is now discontinued.
        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        # The target IP address ( 192.0.2.0 ), or AWS name server ( ns-111.awsdns-22.com. ). For Lightsail
        # load balancers, the value looks like
        # ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com . For Lightsail
        # distributions, the value looks like exampled1182ne.cloudfront.net . For Lightsail container
        # services, the value looks like container-service-1.example23scljs.us-west-2.cs.amazonlightsail.com .
        # Be sure to also set isAlias to true when setting up an A record for a Lightsail load balancer,
        # distribution, or container service.
        @[JSON::Field(key: "target")]
        getter target : String?

        # The type of domain entry, such as address for IPv4 (A), address for IPv6 (AAAA), canonical name
        # (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or
        # text (TXT). The following domain entry types can be used: A AAAA CNAME MX NS SOA SRV TXT
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @id : String? = nil,
          @is_alias : Bool? = nil,
          @name : String? = nil,
          @options : Hash(String, String)? = nil,
          @target : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Describes the domain name system (DNS) records that you must add to the DNS of your registered
      # domain to validate ownership for an Amazon Lightsail SSL/TLS certificate.
      struct DomainValidationRecord
        include JSON::Serializable

        # An object that describes the state of the canonical name (CNAME) records that are automatically
        # added by Lightsail to the DNS of the domain to validate domain ownership.
        @[JSON::Field(key: "dnsRecordCreationState")]
        getter dns_record_creation_state : Types::DnsRecordCreationState?

        # The domain name of the certificate validation record. For example, example.com or www.example.com .
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # An object that describes the DNS records to add to your domain's DNS to validate it for the
        # certificate.
        @[JSON::Field(key: "resourceRecord")]
        getter resource_record : Types::ResourceRecord?

        # The validation status of the record.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String?

        def initialize(
          @dns_record_creation_state : Types::DnsRecordCreationState? = nil,
          @domain_name : String? = nil,
          @resource_record : Types::ResourceRecord? = nil,
          @validation_status : String? = nil
        )
        end
      end

      struct DownloadDefaultKeyPairRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DownloadDefaultKeyPairResult
        include JSON::Serializable

        # The timestamp when the default key pair was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A base64-encoded RSA private key.
        @[JSON::Field(key: "privateKeyBase64")]
        getter private_key_base64 : String?

        # A base64-encoded public key of the ssh-rsa type.
        @[JSON::Field(key: "publicKeyBase64")]
        getter public_key_base64 : String?

        def initialize(
          @created_at : Time? = nil,
          @private_key_base64 : String? = nil,
          @public_key_base64 : String? = nil
        )
        end
      end

      struct EnableAddOnRequest
        include JSON::Serializable

        # An array of strings representing the add-on to enable or modify.
        @[JSON::Field(key: "addOnRequest")]
        getter add_on_request : Types::AddOnRequest

        # The name of the source resource for which to enable or modify the add-on.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @add_on_request : Types::AddOnRequest,
          @resource_name : String
        )
        end
      end

      struct EnableAddOnResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes the settings of a public endpoint for an Amazon Lightsail container service.
      struct EndpointRequest
        include JSON::Serializable

        # The name of the container for the endpoint.
        @[JSON::Field(key: "containerName")]
        getter container_name : String

        # The port of the container to which traffic is forwarded to.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32

        # An object that describes the health check configuration of the container.
        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::ContainerServiceHealthCheckConfig?

        def initialize(
          @container_name : String,
          @container_port : Int32,
          @health_check : Types::ContainerServiceHealthCheckConfig? = nil
        )
        end
      end

      # An estimate that's associated with a time period.
      struct EstimateByTime
        include JSON::Serializable

        # The currency of the estimate in USD.
        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The unit of measurement that's used for the cost estimate.
        @[JSON::Field(key: "pricingUnit")]
        getter pricing_unit : String?

        # The period of time, in days, that an estimate covers. The period has a start date and an end date.
        # The start date must come before the end date.
        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod?

        # The number of pricing units used to calculate the total number of hours. For example, 1 unit equals
        # 1 hour.
        @[JSON::Field(key: "unit")]
        getter unit : Float64?

        # The amount of cost or usage that's measured for the cost estimate.
        @[JSON::Field(key: "usageCost")]
        getter usage_cost : Float64?

        def initialize(
          @currency : String? = nil,
          @pricing_unit : String? = nil,
          @time_period : Types::TimePeriod? = nil,
          @unit : Float64? = nil,
          @usage_cost : Float64? = nil
        )
        end
      end

      # Describes an export snapshot record.
      struct ExportSnapshotRecord
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the export snapshot record.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the export snapshot record was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A list of objects describing the destination of the export snapshot record.
        @[JSON::Field(key: "destinationInfo")]
        getter destination_info : Types::DestinationInfo?

        # The AWS Region and Availability Zone where the export snapshot record is located.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The export snapshot record name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type ( ExportSnapshotRecord ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A list of objects describing the source of the export snapshot record.
        @[JSON::Field(key: "sourceInfo")]
        getter source_info : Types::ExportSnapshotRecordSourceInfo?

        # The state of the export snapshot record.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @destination_info : Types::DestinationInfo? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @source_info : Types::ExportSnapshotRecordSourceInfo? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes the source of an export snapshot record.
      struct ExportSnapshotRecordSourceInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the source instance or disk snapshot.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The date when the source instance or disk snapshot was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A list of objects describing a disk snapshot.
        @[JSON::Field(key: "diskSnapshotInfo")]
        getter disk_snapshot_info : Types::DiskSnapshotInfo?

        # The Amazon Resource Name (ARN) of the snapshot's source instance or disk.
        @[JSON::Field(key: "fromResourceArn")]
        getter from_resource_arn : String?

        # The name of the snapshot's source instance or disk.
        @[JSON::Field(key: "fromResourceName")]
        getter from_resource_name : String?

        # A list of objects describing an instance snapshot.
        @[JSON::Field(key: "instanceSnapshotInfo")]
        getter instance_snapshot_info : Types::InstanceSnapshotInfo?

        # The name of the source instance or disk snapshot.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type ( InstanceSnapshot or DiskSnapshot ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @disk_snapshot_info : Types::DiskSnapshotInfo? = nil,
          @from_resource_arn : String? = nil,
          @from_resource_name : String? = nil,
          @instance_snapshot_info : Types::InstanceSnapshotInfo? = nil,
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ExportSnapshotRequest
        include JSON::Serializable

        # The name of the instance or disk snapshot to be exported to Amazon EC2.
        @[JSON::Field(key: "sourceSnapshotName")]
        getter source_snapshot_name : String

        def initialize(
          @source_snapshot_name : String
        )
        end
      end

      struct ExportSnapshotResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct GetActiveNamesRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetActiveNames request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetActiveNamesResult
        include JSON::Serializable

        # The list of active names returned by the get active names request.
        @[JSON::Field(key: "activeNames")]
        getter active_names : Array(String)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetActiveNames request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @active_names : Array(String)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetAlarmsRequest
        include JSON::Serializable

        # The name of the alarm. Specify an alarm name to return information about a specific alarm.
        @[JSON::Field(key: "alarmName")]
        getter alarm_name : String?

        # The name of the Lightsail resource being monitored by the alarm. Specify a monitored resource name
        # to return information about all alarms for a specific resource.
        @[JSON::Field(key: "monitoredResourceName")]
        getter monitored_resource_name : String?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetAlarms request. If your results are paginated, the response will return a next page token
        # that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @alarm_name : String? = nil,
          @monitored_resource_name : String? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetAlarmsResult
        include JSON::Serializable

        # An array of objects that describe the alarms.
        @[JSON::Field(key: "alarms")]
        getter alarms : Array(Types::Alarm)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetAlarms request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @alarms : Array(Types::Alarm)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetAutoSnapshotsRequest
        include JSON::Serializable

        # The name of the source instance or disk from which to get automatic snapshot information.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct GetAutoSnapshotsResult
        include JSON::Serializable

        # An array of objects that describe the automatic snapshots that are available for the specified
        # source instance or disk.
        @[JSON::Field(key: "autoSnapshots")]
        getter auto_snapshots : Array(Types::AutoSnapshotDetails)?

        # The name of the source instance or disk for the automatic snapshots.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The resource type of the automatic snapshot. The possible values are Instance , and Disk .
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @auto_snapshots : Array(Types::AutoSnapshotDetails)? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct GetBlueprintsRequest
        include JSON::Serializable

        # Returns a list of blueprints that are specific to Lightsail for Research. You must use this
        # parameter to view Lightsail for Research blueprints.
        @[JSON::Field(key: "appCategory")]
        getter app_category : String?

        # A Boolean value that indicates whether to include inactive (unavailable) blueprints in the response
        # of your request.
        @[JSON::Field(key: "includeInactive")]
        getter include_inactive : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetBlueprints request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @app_category : String? = nil,
          @include_inactive : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetBlueprintsResult
        include JSON::Serializable

        # An array of key-value pairs that contains information about the available blueprints.
        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::Blueprint)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetBlueprints request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @blueprints : Array(Types::Blueprint)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetBucketAccessKeysRequest
        include JSON::Serializable

        # The name of the bucket for which to return access keys.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end

      struct GetBucketAccessKeysResult
        include JSON::Serializable

        # An object that describes the access keys for the specified bucket.
        @[JSON::Field(key: "accessKeys")]
        getter access_keys : Array(Types::AccessKey)?

        def initialize(
          @access_keys : Array(Types::AccessKey)? = nil
        )
        end
      end

      struct GetBucketBundlesRequest
        include JSON::Serializable

        # A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of
        # your request.
        @[JSON::Field(key: "includeInactive")]
        getter include_inactive : Bool?

        def initialize(
          @include_inactive : Bool? = nil
        )
        end
      end

      struct GetBucketBundlesResult
        include JSON::Serializable

        # An object that describes bucket bundles.
        @[JSON::Field(key: "bundles")]
        getter bundles : Array(Types::BucketBundle)?

        def initialize(
          @bundles : Array(Types::BucketBundle)? = nil
        )
        end
      end

      struct GetBucketMetricDataRequest
        include JSON::Serializable

        # The name of the bucket for which to get metric data.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The timestamp indicating the latest data to be returned.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The metric for which you want to return information. Valid bucket metric names are listed below,
        # along with the most useful statistics to include in your request, and the published unit value.
        # These bucket metrics are reported once per day. BucketSizeBytes - The amount of data in bytes stored
        # in a bucket. This value is calculated by summing the size of all objects in the bucket (including
        # object versions), including the size of all parts for all incomplete multipart uploads to the
        # bucket. Statistics: The most useful statistic is Maximum . Unit: The published unit is Bytes .
        # NumberOfObjects - The total number of objects stored in a bucket. This value is calculated by
        # counting all objects in the bucket (including object versions) and the total number of parts for all
        # incomplete multipart uploads to the bucket. Statistics: The most useful statistic is Average . Unit:
        # The published unit is Count .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, of the returned data points. Bucket storage metrics are reported once
        # per day. Therefore, you should specify a period of 86400 seconds, which is the number of seconds in
        # a day.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The timestamp indicating the earliest data to be returned.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - The sum of all values submitted for
        # the matching metric. You can use this statistic to determine the total volume of a metric. Average -
        # The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The unit for the metric data request. Valid units depend on the metric data being requested. For the
        # valid units with each available metric, see the metricName parameter.
        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @bucket_name : String,
          @end_time : Time,
          @metric_name : String,
          @period : Int32,
          @start_time : Time,
          @statistics : Array(String),
          @unit : String
        )
        end
      end

      struct GetBucketMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetBucketsRequest
        include JSON::Serializable

        # The name of the bucket for which to return information. When omitted, the response includes all of
        # your buckets in the Amazon Web Services Region where the request is made.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # A Boolean value that indicates whether to include Lightsail instances that were given access to the
        # bucket using the SetResourceAccessForBucket action.
        @[JSON::Field(key: "includeConnectedResources")]
        getter include_connected_resources : Bool?

        # A Boolean value that indicates whether to include Lightsail bucket CORS configuration in the
        # response. For more information, see Configuring cross-origin resource sharing (CORS) . This
        # parameter is only supported when getting a single bucket with bucketName specified. The default
        # value for this parameter is False .
        @[JSON::Field(key: "includeCors")]
        getter include_cors : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetBuckets request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @bucket_name : String? = nil,
          @include_connected_resources : Bool? = nil,
          @include_cors : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetBucketsResult
        include JSON::Serializable

        # An object that describes the synchronization status of the Amazon S3 account-level block public
        # access feature for your Lightsail buckets. For more information about this feature and how it
        # affects Lightsail buckets, see Block public access for buckets in Amazon Lightsail .
        @[JSON::Field(key: "accountLevelBpaSync")]
        getter account_level_bpa_sync : Types::AccountLevelBpaSync?

        # An array of objects that describe buckets.
        @[JSON::Field(key: "buckets")]
        getter buckets : Array(Types::Bucket)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetBuckets request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @account_level_bpa_sync : Types::AccountLevelBpaSync? = nil,
          @buckets : Array(Types::Bucket)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetBundlesRequest
        include JSON::Serializable

        # Returns a list of bundles that are specific to Lightsail for Research. You must use this parameter
        # to view Lightsail for Research bundles.
        @[JSON::Field(key: "appCategory")]
        getter app_category : String?

        # A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of
        # your request.
        @[JSON::Field(key: "includeInactive")]
        getter include_inactive : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetBundles request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @app_category : String? = nil,
          @include_inactive : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetBundlesResult
        include JSON::Serializable

        # An array of key-value pairs that contains information about the available bundles.
        @[JSON::Field(key: "bundles")]
        getter bundles : Array(Types::Bundle)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetBundles request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @bundles : Array(Types::Bundle)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetCertificatesRequest
        include JSON::Serializable

        # The name for the certificate for which to return information. When omitted, the response includes
        # all of your certificates in the Amazon Web Services Region where the request is made.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The status of the certificates for which to return information. For example, specify ISSUED to
        # return only certificates with an ISSUED status. When omitted, the response includes all of your
        # certificates in the Amazon Web Services Region where the request is made, regardless of their
        # current status.
        @[JSON::Field(key: "certificateStatuses")]
        getter certificate_statuses : Array(String)?

        # Indicates whether to include detailed information about the certificates in the response. When
        # omitted, the response includes only the certificate names, Amazon Resource Names (ARNs), domain
        # names, and tags.
        @[JSON::Field(key: "includeCertificateDetails")]
        getter include_certificate_details : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetCertificates request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @certificate_name : String? = nil,
          @certificate_statuses : Array(String)? = nil,
          @include_certificate_details : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetCertificatesResult
        include JSON::Serializable

        # An object that describes certificates.
        @[JSON::Field(key: "certificates")]
        getter certificates : Array(Types::CertificateSummary)?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @certificates : Array(Types::CertificateSummary)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetCloudFormationStackRecordsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetClouFormationStackRecords request. If your results are paginated, the response will
        # return a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetCloudFormationStackRecordsResult
        include JSON::Serializable

        # A list of objects describing the CloudFormation stack records.
        @[JSON::Field(key: "cloudFormationStackRecords")]
        getter cloud_formation_stack_records : Array(Types::CloudFormationStackRecord)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetCloudFormationStackRecords request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @cloud_formation_stack_records : Array(Types::CloudFormationStackRecord)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetContactMethodsRequest
        include JSON::Serializable

        # The protocols used to send notifications, such as Email , or SMS (text messaging). Specify a
        # protocol in your request to return information about a specific contact method protocol.
        @[JSON::Field(key: "protocols")]
        getter protocols : Array(String)?

        def initialize(
          @protocols : Array(String)? = nil
        )
        end
      end

      struct GetContactMethodsResult
        include JSON::Serializable

        # An array of objects that describe the contact methods.
        @[JSON::Field(key: "contactMethods")]
        getter contact_methods : Array(Types::ContactMethod)?

        def initialize(
          @contact_methods : Array(Types::ContactMethod)? = nil
        )
        end
      end

      struct GetContainerAPIMetadataRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetContainerAPIMetadataResult
        include JSON::Serializable

        # Metadata about Lightsail containers, such as the current version of the Lightsail Control
        # (lightsailctl) plugin.
        @[JSON::Field(key: "metadata")]
        getter metadata : Array(Hash(String, String))?

        def initialize(
          @metadata : Array(Hash(String, String))? = nil
        )
        end
      end

      struct GetContainerImagesRequest
        include JSON::Serializable

        # The name of the container service for which to return registered container images.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end

      struct GetContainerImagesResult
        include JSON::Serializable

        # An array of objects that describe container images that are registered to the container service.
        @[JSON::Field(key: "containerImages")]
        getter container_images : Array(Types::ContainerImage)?

        def initialize(
          @container_images : Array(Types::ContainerImage)? = nil
        )
        end
      end

      struct GetContainerLogRequest
        include JSON::Serializable

        # The name of the container that is either running or previously ran on the container service for
        # which to return a log.
        @[JSON::Field(key: "containerName")]
        getter container_name : String

        # The name of the container service for which to get a container log.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The end of the time interval for which to get log data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use an end time
        # of October 1, 2018, at 9 PM UTC, specify 1538427600 as the end time. You can convert a
        # human-friendly time to Unix time format using a converter like Epoch converter .
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The pattern to use to filter the returned log events to a specific term. The following are a few
        # examples of filter patterns that you can specify: To return all log events, specify a filter pattern
        # of "" . To exclude log events that contain the ERROR term, and return all other log events, specify
        # a filter pattern of "-ERROR" . To return log events that contain the ERROR term, specify a filter
        # pattern of "ERROR" . To return log events that contain both the ERROR and Exception terms, specify a
        # filter pattern of "ERROR Exception" . To return log events that contain the ERROR or the Exception
        # term, specify a filter pattern of "?ERROR ?Exception" .
        @[JSON::Field(key: "filterPattern")]
        getter filter_pattern : String?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetContainerLog request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        # The start of the time interval for which to get log data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use a start
        # time of October 1, 2018, at 8 PM UTC, specify 1538424000 as the start time. You can convert a
        # human-friendly time to Unix time format using a converter like Epoch converter .
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @container_name : String,
          @service_name : String,
          @end_time : Time? = nil,
          @filter_pattern : String? = nil,
          @page_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetContainerLogResult
        include JSON::Serializable

        # An array of objects that describe the log events of a container.
        @[JSON::Field(key: "logEvents")]
        getter log_events : Array(Types::ContainerServiceLogEvent)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetContainerLog request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @log_events : Array(Types::ContainerServiceLogEvent)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetContainerServiceDeploymentsRequest
        include JSON::Serializable

        # The name of the container service for which to return deployments.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @service_name : String
        )
        end
      end

      struct GetContainerServiceDeploymentsResult
        include JSON::Serializable

        # An array of objects that describe deployments for a container service.
        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::ContainerServiceDeployment)?

        def initialize(
          @deployments : Array(Types::ContainerServiceDeployment)? = nil
        )
        end
      end

      struct GetContainerServiceMetricDataRequest
        include JSON::Serializable

        # The end time of the time period.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The metric for which you want to return information. Valid container service metric names are listed
        # below, along with the most useful statistics to include in your request, and the published unit
        # value. CPUUtilization - The average percentage of compute units that are currently in use across all
        # nodes of the container service. This metric identifies the processing power required to run
        # containers on each node of the container service. Statistics: The most useful statistics are Maximum
        # and Average . Unit: The published unit is Percent . MemoryUtilization - The average percentage of
        # available memory that is currently in use across all nodes of the container service. This metric
        # identifies the memory required to run containers on each node of the container service. Statistics:
        # The most useful statistics are Maximum and Average . Unit: The published unit is Percent .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, of the returned data points. All container service metric data is
        # available in 5-minute (300 seconds) granularity.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The name of the container service for which to get metric data.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The start time of the time period.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - All values submitted for the matching
        # metric added together. You can use this statistic to determine the total volume of a metric. Average
        # - The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        def initialize(
          @end_time : Time,
          @metric_name : String,
          @period : Int32,
          @service_name : String,
          @start_time : Time,
          @statistics : Array(String)
        )
        end
      end

      struct GetContainerServiceMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetContainerServicePowersRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetContainerServicePowersResult
        include JSON::Serializable

        # An array of objects that describe the powers that can be specified for a container service.
        @[JSON::Field(key: "powers")]
        getter powers : Array(Types::ContainerServicePower)?

        def initialize(
          @powers : Array(Types::ContainerServicePower)? = nil
        )
        end
      end

      struct GetContainerServicesRequest
        include JSON::Serializable

        # The name of the container service for which to return information. When omitted, the response
        # includes all of your container services in the Amazon Web Services Region where the request is made.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @service_name : String? = nil
        )
        end
      end

      struct GetCostEstimateRequest
        include JSON::Serializable

        # The cost estimate end time. Constraints: Specified in Coordinated Universal Time (UTC). Specified in
        # the Unix time format. For example, if you want to use an end time of October 1, 2018, at 9 PM UTC,
        # specify 1538427600 as the end time. You can convert a human-friendly time to Unix time format using
        # a converter like Epoch converter .
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The cost estimate start time. Constraints: Specified in Coordinated Universal Time (UTC). Specified
        # in the Unix time format. For example, if you want to use a start time of October 1, 2018, at 8 PM
        # UTC, specify 1538424000 as the start time. You can convert a human-friendly time to Unix time format
        # using a converter like Epoch converter .
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @resource_name : String,
          @start_time : Time
        )
        end
      end

      struct GetCostEstimateResult
        include JSON::Serializable

        # Returns the estimate's forecasted cost or usage.
        @[JSON::Field(key: "resourcesBudgetEstimate")]
        getter resources_budget_estimate : Array(Types::ResourceBudgetEstimate)?

        def initialize(
          @resources_budget_estimate : Array(Types::ResourceBudgetEstimate)? = nil
        )
        end
      end

      struct GetDiskRequest
        include JSON::Serializable

        # The name of the disk ( my-disk ).
        @[JSON::Field(key: "diskName")]
        getter disk_name : String

        def initialize(
          @disk_name : String
        )
        end
      end

      struct GetDiskResult
        include JSON::Serializable

        # An object containing information about the disk.
        @[JSON::Field(key: "disk")]
        getter disk : Types::Disk?

        def initialize(
          @disk : Types::Disk? = nil
        )
        end
      end

      struct GetDiskSnapshotRequest
        include JSON::Serializable

        # The name of the disk snapshot ( my-disk-snapshot ).
        @[JSON::Field(key: "diskSnapshotName")]
        getter disk_snapshot_name : String

        def initialize(
          @disk_snapshot_name : String
        )
        end
      end

      struct GetDiskSnapshotResult
        include JSON::Serializable

        # An object containing information about the disk snapshot.
        @[JSON::Field(key: "diskSnapshot")]
        getter disk_snapshot : Types::DiskSnapshot?

        def initialize(
          @disk_snapshot : Types::DiskSnapshot? = nil
        )
        end
      end

      struct GetDiskSnapshotsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetDiskSnapshots request. If your results are paginated, the response will return a next
        # page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetDiskSnapshotsResult
        include JSON::Serializable

        # An array of objects containing information about all block storage disk snapshots.
        @[JSON::Field(key: "diskSnapshots")]
        getter disk_snapshots : Array(Types::DiskSnapshot)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetDiskSnapshots request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @disk_snapshots : Array(Types::DiskSnapshot)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetDisksRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetDisks request. If your results are paginated, the response will return a next page token
        # that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetDisksResult
        include JSON::Serializable

        # An array of objects containing information about all block storage disks.
        @[JSON::Field(key: "disks")]
        getter disks : Array(Types::Disk)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetDisks request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @disks : Array(Types::Disk)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetDistributionBundlesRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetDistributionBundlesResult
        include JSON::Serializable

        # An object that describes a distribution bundle.
        @[JSON::Field(key: "bundles")]
        getter bundles : Array(Types::DistributionBundle)?

        def initialize(
          @bundles : Array(Types::DistributionBundle)? = nil
        )
        end
      end

      struct GetDistributionLatestCacheResetRequest
        include JSON::Serializable

        # The name of the distribution for which to return the timestamp of the last cache reset. Use the
        # GetDistributions action to get a list of distribution names that you can specify. When omitted, the
        # response includes the latest cache reset timestamp of all your distributions.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String?

        def initialize(
          @distribution_name : String? = nil
        )
        end
      end

      struct GetDistributionLatestCacheResetResult
        include JSON::Serializable

        # The timestamp of the last cache reset ( 1479734909.17 ) in Unix time format.
        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The status of the last cache reset.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @create_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetDistributionMetricDataRequest
        include JSON::Serializable

        # The name of the distribution for which to get metric data. Use the GetDistributions action to get a
        # list of distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String

        # The end of the time interval for which to get metric data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use an end time
        # of October 1, 2018, at 9 PM UTC, specify 1538427600 as the end time. You can convert a
        # human-friendly time to Unix time format using a converter like Epoch converter .
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The metric for which you want to return information. Valid distribution metric names are listed
        # below, along with the most useful statistics to include in your request, and the published unit
        # value. Requests - The total number of viewer requests received by your Lightsail distribution, for
        # all HTTP methods, and for both HTTP and HTTPS requests. Statistics : The most useful statistic is
        # Sum . Unit : The published unit is None . BytesDownloaded - The number of bytes downloaded by
        # viewers for GET, HEAD, and OPTIONS requests. Statistics : The most useful statistic is Sum . Unit :
        # The published unit is None . BytesUploaded - The number of bytes uploaded to your origin by your
        # Lightsail distribution, using POST and PUT requests. Statistics : The most useful statistic is Sum .
        # Unit : The published unit is None . TotalErrorRate - The percentage of all viewer requests for which
        # the response's HTTP status code was 4xx or 5xx. Statistics : The most useful statistic is Average .
        # Unit : The published unit is Percent . 4xxErrorRate - The percentage of all viewer requests for
        # which the response's HTTP status cod was 4xx. In these cases, the client or client viewer may have
        # made an error. For example, a status code of 404 (Not Found) means that the client requested an
        # object that could not be found. Statistics : The most useful statistic is Average . Unit : The
        # published unit is Percent . 5xxErrorRate - The percentage of all viewer requests for which the
        # response's HTTP status code was 5xx. In these cases, the origin server did not satisfy the requests.
        # For example, a status code of 503 (Service Unavailable) means that the origin server is currently
        # unavailable. Statistics : The most useful statistic is Average . Unit : The published unit is
        # Percent .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, for the metric data points that will be returned.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The start of the time interval for which to get metric data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use a start
        # time of October 1, 2018, at 8 PM UTC, specify 1538424000 as the start time. You can convert a
        # human-friendly time to Unix time format using a converter like Epoch converter .
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - All values submitted for the matching
        # metric added together. You can use this statistic to determine the total volume of a metric. Average
        # - The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The unit for the metric data request. Valid units depend on the metric data being requested. For the
        # valid units with each available metric, see the metricName parameter.
        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @distribution_name : String,
          @end_time : Time,
          @metric_name : String,
          @period : Int32,
          @start_time : Time,
          @statistics : Array(String),
          @unit : String
        )
        end
      end

      struct GetDistributionMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetDistributionsRequest
        include JSON::Serializable

        # The name of the distribution for which to return information. When omitted, the response includes
        # all of your distributions in the Amazon Web Services Region where the request is made.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetDistributions request. If your results are paginated, the response will return a next
        # page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @distribution_name : String? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetDistributionsResult
        include JSON::Serializable

        # An array of objects that describe your distributions.
        @[JSON::Field(key: "distributions")]
        getter distributions : Array(Types::LightsailDistribution)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetDistributions request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @distributions : Array(Types::LightsailDistribution)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetDomainRequest
        include JSON::Serializable

        # The domain name for which your want to return information about.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      struct GetDomainResult
        include JSON::Serializable

        # An array of key-value pairs containing information about your get domain request.
        @[JSON::Field(key: "domain")]
        getter domain : Types::Domain?

        def initialize(
          @domain : Types::Domain? = nil
        )
        end
      end

      struct GetDomainsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetDomains request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetDomainsResult
        include JSON::Serializable

        # An array of key-value pairs containing information about each of the domain entries in the user's
        # account.
        @[JSON::Field(key: "domains")]
        getter domains : Array(Types::Domain)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetDomains request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @domains : Array(Types::Domain)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetExportSnapshotRecordsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetExportSnapshotRecords request. If your results are paginated, the response will return a
        # next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetExportSnapshotRecordsResult
        include JSON::Serializable

        # A list of objects describing the export snapshot records.
        @[JSON::Field(key: "exportSnapshotRecords")]
        getter export_snapshot_records : Array(Types::ExportSnapshotRecord)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetExportSnapshotRecords request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @export_snapshot_records : Array(Types::ExportSnapshotRecord)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetInstanceAccessDetailsRequest
        include JSON::Serializable

        # The name of the instance to access.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # The protocol to use to connect to your instance. Defaults to ssh .
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @instance_name : String,
          @protocol : String? = nil
        )
        end
      end

      struct GetInstanceAccessDetailsResult
        include JSON::Serializable

        # An array of key-value pairs containing information about a get instance access request.
        @[JSON::Field(key: "accessDetails")]
        getter access_details : Types::InstanceAccessDetails?

        def initialize(
          @access_details : Types::InstanceAccessDetails? = nil
        )
        end
      end

      struct GetInstanceMetricDataRequest
        include JSON::Serializable

        # The end time of the time period.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The name of the instance for which you want to get metrics data.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # The metric for which you want to return information. Valid instance metric names are listed below,
        # along with the most useful statistics to include in your request, and the published unit value.
        # BurstCapacityPercentage - The percentage of CPU performance available for your instance to burst
        # above its baseline. Your instance continuously accrues and consumes burst capacity. Burst capacity
        # stops accruing when your instance's BurstCapacityPercentage reaches 100%. For more information, see
        # Viewing instance burst capacity in Amazon Lightsail . Statistics : The most useful statistics are
        # Maximum and Average . Unit : The published unit is Percent . BurstCapacityTime - The available
        # amount of time for your instance to burst at 100% CPU utilization. Your instance continuously
        # accrues and consumes burst capacity. Burst capacity time stops accruing when your instance's
        # BurstCapacityPercentage metric reaches 100%. Burst capacity time is consumed at the full rate only
        # when your instance operates at 100% CPU utilization. For example, if your instance operates at 50%
        # CPU utilization in the burstable zone for a 5-minute period, then it consumes CPU burst capacity
        # minutes at a 50% rate in that period. Your instance consumed 2 minutes and 30 seconds of CPU burst
        # capacity minutes in the 5-minute period. For more information, see Viewing instance burst capacity
        # in Amazon Lightsail . Statistics : The most useful statistics are Maximum and Average . Unit : The
        # published unit is Seconds . CPUUtilization - The percentage of allocated compute units that are
        # currently in use on the instance. This metric identifies the processing power to run the
        # applications on the instance. Tools in your operating system can show a lower percentage than
        # Lightsail when the instance is not allocated a full processor core. Statistics : The most useful
        # statistics are Maximum and Average . Unit : The published unit is Percent . NetworkIn - The number
        # of bytes received on all network interfaces by the instance. This metric identifies the volume of
        # incoming network traffic to the instance. The number reported is the number of bytes received during
        # the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300
        # to find Bytes/second. Statistics : The most useful statistic is Sum . Unit : The published unit is
        # Bytes . NetworkOut - The number of bytes sent out on all network interfaces by the instance. This
        # metric identifies the volume of outgoing network traffic from the instance. The number reported is
        # the number of bytes sent during the period. Because this metric is reported in 5-minute intervals,
        # divide the reported number by 300 to find Bytes/second. Statistics : The most useful statistic is
        # Sum . Unit : The published unit is Bytes . StatusCheckFailed - Reports whether the instance passed
        # or failed both the instance status check and the system status check. This metric can be either 0
        # (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.
        # Statistics : The most useful statistic is Sum . Unit : The published unit is Count .
        # StatusCheckFailed_Instance - Reports whether the instance passed or failed the instance status
        # check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute
        # (60 seconds) granularity. Statistics : The most useful statistic is Sum . Unit : The published unit
        # is Count . StatusCheckFailed_System - Reports whether the instance passed or failed the system
        # status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in
        # 1-minute (60 seconds) granularity. Statistics : The most useful statistic is Sum . Unit : The
        # published unit is Count . MetadataNoToken - Reports the number of times that the instance metadata
        # service was successfully accessed without a token. This metric determines if there are any processes
        # accessing instance metadata by using Instance Metadata Service Version 1, which doesn't use a token.
        # If all requests use token-backed sessions, such as Instance Metadata Service Version 2, then the
        # value is 0. Statistics : The most useful statistic is Sum . Unit : The published unit is Count .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, of the returned data points. The StatusCheckFailed ,
        # StatusCheckFailed_Instance , and StatusCheckFailed_System instance metric data is available in
        # 1-minute (60 seconds) granularity. All other instance metric data is available in 5-minute (300
        # seconds) granularity.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The start time of the time period.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - All values submitted for the matching
        # metric added together. You can use this statistic to determine the total volume of a metric. Average
        # - The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The unit for the metric data request. Valid units depend on the metric data being requested. For the
        # valid units to specify with each available metric, see the metricName parameter.
        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @end_time : Time,
          @instance_name : String,
          @metric_name : String,
          @period : Int32,
          @start_time : Time,
          @statistics : Array(String),
          @unit : String
        )
        end
      end

      struct GetInstanceMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetInstancePortStatesRequest
        include JSON::Serializable

        # The name of the instance for which to return firewall port states.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct GetInstancePortStatesResult
        include JSON::Serializable

        # An array of objects that describe the firewall port states for the specified instance.
        @[JSON::Field(key: "portStates")]
        getter port_states : Array(Types::InstancePortState)?

        def initialize(
          @port_states : Array(Types::InstancePortState)? = nil
        )
        end
      end

      struct GetInstanceRequest
        include JSON::Serializable

        # The name of the instance.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct GetInstanceResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the specified instance.
        @[JSON::Field(key: "instance")]
        getter instance : Types::Instance?

        def initialize(
          @instance : Types::Instance? = nil
        )
        end
      end

      struct GetInstanceSnapshotRequest
        include JSON::Serializable

        # The name of the snapshot for which you are requesting information.
        @[JSON::Field(key: "instanceSnapshotName")]
        getter instance_snapshot_name : String

        def initialize(
          @instance_snapshot_name : String
        )
        end
      end

      struct GetInstanceSnapshotResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the results of your get instance snapshot
        # request.
        @[JSON::Field(key: "instanceSnapshot")]
        getter instance_snapshot : Types::InstanceSnapshot?

        def initialize(
          @instance_snapshot : Types::InstanceSnapshot? = nil
        )
        end
      end

      struct GetInstanceSnapshotsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetInstanceSnapshots request. If your results are paginated, the response will return a next
        # page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetInstanceSnapshotsResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the results of your get instance snapshots
        # request.
        @[JSON::Field(key: "instanceSnapshots")]
        getter instance_snapshots : Array(Types::InstanceSnapshot)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetInstanceSnapshots request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @instance_snapshots : Array(Types::InstanceSnapshot)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetInstanceStateRequest
        include JSON::Serializable

        # The name of the instance to get state information about.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct GetInstanceStateResult
        include JSON::Serializable

        # The state of the instance.
        @[JSON::Field(key: "state")]
        getter state : Types::InstanceState?

        def initialize(
          @state : Types::InstanceState? = nil
        )
        end
      end

      struct GetInstancesRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetInstances request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetInstancesResult
        include JSON::Serializable

        # An array of key-value pairs containing information about your instances.
        @[JSON::Field(key: "instances")]
        getter instances : Array(Types::Instance)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetInstances request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @instances : Array(Types::Instance)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetKeyPairRequest
        include JSON::Serializable

        # The name of the key pair for which you are requesting information.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String

        def initialize(
          @key_pair_name : String
        )
        end
      end

      struct GetKeyPairResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the key pair.
        @[JSON::Field(key: "keyPair")]
        getter key_pair : Types::KeyPair?

        def initialize(
          @key_pair : Types::KeyPair? = nil
        )
        end
      end

      struct GetKeyPairsRequest
        include JSON::Serializable

        # A Boolean value that indicates whether to include the default key pair in the response of your
        # request.
        @[JSON::Field(key: "includeDefaultKeyPair")]
        getter include_default_key_pair : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetKeyPairs request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @include_default_key_pair : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetKeyPairsResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the key pairs.
        @[JSON::Field(key: "keyPairs")]
        getter key_pairs : Array(Types::KeyPair)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetKeyPairs request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @key_pairs : Array(Types::KeyPair)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetLoadBalancerMetricDataRequest
        include JSON::Serializable

        # The end time of the period.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The name of the load balancer.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        # The metric for which you want to return information. Valid load balancer metric names are listed
        # below, along with the most useful statistics to include in your request, and the published unit
        # value. ClientTLSNegotiationErrorCount - The number of TLS connections initiated by the client that
        # did not establish a session with the load balancer due to a TLS error generated by the load
        # balancer. Possible causes include a mismatch of ciphers or protocols. Statistics : The most useful
        # statistic is Sum . Unit : The published unit is Count . HealthyHostCount - The number of target
        # instances that are considered healthy. Statistics : The most useful statistic are Average , Minimum
        # , and Maximum . Unit : The published unit is Count . HTTPCode_Instance_2XX_Count - The number of
        # HTTP 2XX response codes generated by the target instances. This does not include any response codes
        # generated by the load balancer. Statistics : The most useful statistic is Sum . Note that Minimum ,
        # Maximum , and Average all return 1 . Unit : The published unit is Count .
        # HTTPCode_Instance_3XX_Count - The number of HTTP 3XX response codes generated by the target
        # instances. This does not include any response codes generated by the load balancer. Statistics : The
        # most useful statistic is Sum . Note that Minimum , Maximum , and Average all return 1 . Unit : The
        # published unit is Count . HTTPCode_Instance_4XX_Count - The number of HTTP 4XX response codes
        # generated by the target instances. This does not include any response codes generated by the load
        # balancer. Statistics : The most useful statistic is Sum . Note that Minimum , Maximum , and Average
        # all return 1 . Unit : The published unit is Count . HTTPCode_Instance_5XX_Count - The number of HTTP
        # 5XX response codes generated by the target instances. This does not include any response codes
        # generated by the load balancer. Statistics : The most useful statistic is Sum . Note that Minimum ,
        # Maximum , and Average all return 1 . Unit : The published unit is Count . HTTPCode_LB_4XX_Count -
        # The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are
        # generated when requests are malformed or incomplete. These requests were not received by the target
        # instance. This count does not include response codes generated by the target instances. Statistics :
        # The most useful statistic is Sum . Note that Minimum , Maximum , and Average all return 1 . Unit :
        # The published unit is Count . HTTPCode_LB_5XX_Count - The number of HTTP 5XX server error codes that
        # originated from the load balancer. This does not include any response codes generated by the target
        # instance. This metric is reported if there are no healthy instances attached to the load balancer,
        # or if the request rate exceeds the capacity of the instances (spillover) or the load balancer.
        # Statistics : The most useful statistic is Sum . Note that Minimum , Maximum , and Average all return
        # 1 . Unit : The published unit is Count . InstanceResponseTime - The time elapsed, in seconds, after
        # the request leaves the load balancer until a response from the target instance is received.
        # Statistics : The most useful statistic is Average . Unit : The published unit is Seconds .
        # RejectedConnectionCount - The number of connections that were rejected because the load balancer had
        # reached its maximum number of connections. Statistics : The most useful statistic is Sum . Unit :
        # The published unit is Count . RequestCount - The number of requests processed over IPv4. This count
        # includes only the requests with a response generated by a target instance of the load balancer.
        # Statistics : The most useful statistic is Sum . Note that Minimum , Maximum , and Average all return
        # 1 . Unit : The published unit is Count . UnhealthyHostCount - The number of target instances that
        # are considered unhealthy. Statistics : The most useful statistic are Average , Minimum , and Maximum
        # . Unit : The published unit is Count .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, of the returned data points.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The start time of the period.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - All values submitted for the matching
        # metric added together. You can use this statistic to determine the total volume of a metric. Average
        # - The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The unit for the metric data request. Valid units depend on the metric data being requested. For the
        # valid units with each available metric, see the metricName parameter.
        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @end_time : Time,
          @load_balancer_name : String,
          @metric_name : String,
          @period : Int32,
          @start_time : Time,
          @statistics : Array(String),
          @unit : String
        )
        end
      end

      struct GetLoadBalancerMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetLoadBalancerRequest
        include JSON::Serializable

        # The name of the load balancer.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_name : String
        )
        end
      end

      struct GetLoadBalancerResult
        include JSON::Serializable

        # An object containing information about your load balancer.
        @[JSON::Field(key: "loadBalancer")]
        getter load_balancer : Types::LoadBalancer?

        def initialize(
          @load_balancer : Types::LoadBalancer? = nil
        )
        end
      end

      struct GetLoadBalancerTlsCertificatesRequest
        include JSON::Serializable

        # The name of the load balancer you associated with your SSL/TLS certificate.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @load_balancer_name : String
        )
        end
      end

      struct GetLoadBalancerTlsCertificatesResult
        include JSON::Serializable

        # An array of LoadBalancerTlsCertificate objects describing your SSL/TLS certificates.
        @[JSON::Field(key: "tlsCertificates")]
        getter tls_certificates : Array(Types::LoadBalancerTlsCertificate)?

        def initialize(
          @tls_certificates : Array(Types::LoadBalancerTlsCertificate)? = nil
        )
        end
      end

      struct GetLoadBalancerTlsPoliciesRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetLoadBalancerTlsPolicies request. If your results are paginated, the response will return
        # a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetLoadBalancerTlsPoliciesResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetLoadBalancerTlsPolicies request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An array of objects that describe the TLS security policies that are available.
        @[JSON::Field(key: "tlsPolicies")]
        getter tls_policies : Array(Types::LoadBalancerTlsPolicy)?

        def initialize(
          @next_page_token : String? = nil,
          @tls_policies : Array(Types::LoadBalancerTlsPolicy)? = nil
        )
        end
      end

      struct GetLoadBalancersRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetLoadBalancers request. If your results are paginated, the response will return a next
        # page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetLoadBalancersResult
        include JSON::Serializable

        # An array of LoadBalancer objects describing your load balancers.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetLoadBalancers request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetOperationRequest
        include JSON::Serializable

        # A GUID used to identify the operation.
        @[JSON::Field(key: "operationId")]
        getter operation_id : String

        def initialize(
          @operation_id : String
        )
        end
      end

      struct GetOperationResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct GetOperationsForResourceRequest
        include JSON::Serializable

        # The name of the resource for which you are requesting information.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetOperationsForResource request. If your results are paginated, the response will return a
        # next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @resource_name : String,
          @page_token : String? = nil
        )
        end
      end

      struct GetOperationsForResourceResult
        include JSON::Serializable

        # (Discontinued) Returns the number of pages of results that remain. In releases prior to June 12,
        # 2017, this parameter returned null by the API. It is now discontinued, and the API returns the next
        # page token parameter instead.
        @[JSON::Field(key: "nextPageCount")]
        getter next_page_count : String?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetOperationsForResource request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @next_page_count : String? = nil,
          @next_page_token : String? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct GetOperationsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetOperations request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetOperationsResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetOperations request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @next_page_token : String? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct GetRegionsRequest
        include JSON::Serializable

        # A Boolean value indicating whether to also include Availability Zones in your get regions request.
        # Availability Zones are indicated with a letter: us-east-2a .
        @[JSON::Field(key: "includeAvailabilityZones")]
        getter include_availability_zones : Bool?

        # A Boolean value indicating whether to also include Availability Zones for databases in your get
        # regions request. Availability Zones are indicated with a letter ( us-east-2a ).
        @[JSON::Field(key: "includeRelationalDatabaseAvailabilityZones")]
        getter include_relational_database_availability_zones : Bool?

        def initialize(
          @include_availability_zones : Bool? = nil,
          @include_relational_database_availability_zones : Bool? = nil
        )
        end
      end

      struct GetRegionsResult
        include JSON::Serializable

        # An array of key-value pairs containing information about your get regions request.
        @[JSON::Field(key: "regions")]
        getter regions : Array(Types::Region)?

        def initialize(
          @regions : Array(Types::Region)? = nil
        )
        end
      end

      struct GetRelationalDatabaseBlueprintsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabaseBlueprints request. If your results are paginated, the response will
        # return a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseBlueprintsResult
        include JSON::Serializable

        # An object describing the result of your get relational database blueprints request.
        @[JSON::Field(key: "blueprints")]
        getter blueprints : Array(Types::RelationalDatabaseBlueprint)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabaseBlueprints request and specify the next page token using the pageToken
        # parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @blueprints : Array(Types::RelationalDatabaseBlueprint)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseBundlesRequest
        include JSON::Serializable

        # A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of
        # your request.
        @[JSON::Field(key: "includeInactive")]
        getter include_inactive : Bool?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabaseBundles request. If your results are paginated, the response will
        # return a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @include_inactive : Bool? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseBundlesResult
        include JSON::Serializable

        # An object describing the result of your get relational database bundles request.
        @[JSON::Field(key: "bundles")]
        getter bundles : Array(Types::RelationalDatabaseBundle)?

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabaseBundles request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @bundles : Array(Types::RelationalDatabaseBundle)? = nil,
          @next_page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseEventsRequest
        include JSON::Serializable

        # The name of the database from which to get events.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The number of minutes in the past from which to retrieve events. For example, to get all events from
        # the past 2 hours, enter 120. Default: 60 The minimum is 1 and the maximum is 14 days (20160
        # minutes).
        @[JSON::Field(key: "durationInMinutes")]
        getter duration_in_minutes : Int32?

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabaseEvents request. If your results are paginated, the response will return
        # a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @relational_database_name : String,
          @duration_in_minutes : Int32? = nil,
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseEventsResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabaseEvents request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An object describing the result of your get relational database events request.
        @[JSON::Field(key: "relationalDatabaseEvents")]
        getter relational_database_events : Array(Types::RelationalDatabaseEvent)?

        def initialize(
          @next_page_token : String? = nil,
          @relational_database_events : Array(Types::RelationalDatabaseEvent)? = nil
        )
        end
      end

      struct GetRelationalDatabaseLogEventsRequest
        include JSON::Serializable

        # The name of the log stream. Use the get relational database log streams operation to get a list of
        # available log streams.
        @[JSON::Field(key: "logStreamName")]
        getter log_stream_name : String

        # The name of your database for which to get log events.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The end of the time interval from which to get log events. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use an end time
        # of October 1, 2018, at 8 PM UTC, then you input 1538424000 as the end time.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The token to advance to the next or previous page of results from your request. To get a page token,
        # perform an initial GetRelationalDatabaseLogEvents request. If your results are paginated, the
        # response will return a next forward token and/or next backward token that you can specify as the
        # page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        # Parameter to specify if the log should start from head or tail. If true is specified, the log event
        # starts from the head of the log. If false is specified, the log event starts from the tail of the
        # log. For PostgreSQL, the default value of false is the only option available.
        @[JSON::Field(key: "startFromHead")]
        getter start_from_head : Bool?

        # The start of the time interval from which to get log events. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use a start
        # time of October 1, 2018, at 8 PM UTC, then you input 1538424000 as the start time.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @log_stream_name : String,
          @relational_database_name : String,
          @end_time : Time? = nil,
          @page_token : String? = nil,
          @start_from_head : Bool? = nil,
          @start_time : Time? = nil
        )
        end
      end

      struct GetRelationalDatabaseLogEventsResult
        include JSON::Serializable

        # A token used for advancing to the previous page of results from your get relational database log
        # events request.
        @[JSON::Field(key: "nextBackwardToken")]
        getter next_backward_token : String?

        # A token used for advancing to the next page of results from your get relational database log events
        # request.
        @[JSON::Field(key: "nextForwardToken")]
        getter next_forward_token : String?

        # An object describing the result of your get relational database log events request.
        @[JSON::Field(key: "resourceLogEvents")]
        getter resource_log_events : Array(Types::LogEvent)?

        def initialize(
          @next_backward_token : String? = nil,
          @next_forward_token : String? = nil,
          @resource_log_events : Array(Types::LogEvent)? = nil
        )
        end
      end

      struct GetRelationalDatabaseLogStreamsRequest
        include JSON::Serializable

        # The name of your database for which to get log streams.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        def initialize(
          @relational_database_name : String
        )
        end
      end

      struct GetRelationalDatabaseLogStreamsResult
        include JSON::Serializable

        # An object describing the result of your get relational database log streams request.
        @[JSON::Field(key: "logStreams")]
        getter log_streams : Array(String)?

        def initialize(
          @log_streams : Array(String)? = nil
        )
        end
      end

      struct GetRelationalDatabaseMasterUserPasswordRequest
        include JSON::Serializable

        # The name of your database for which to get the master user password.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The password version to return. Specifying CURRENT or PREVIOUS returns the current or previous
        # passwords respectively. Specifying PENDING returns the newest version of the password that will
        # rotate to CURRENT . After the PENDING password rotates to CURRENT , the PENDING password is no
        # longer available. Default: CURRENT
        @[JSON::Field(key: "passwordVersion")]
        getter password_version : String?

        def initialize(
          @relational_database_name : String,
          @password_version : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseMasterUserPasswordResult
        include JSON::Serializable

        # The timestamp when the specified version of the master user password was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The master user password for the password version specified.
        @[JSON::Field(key: "masterUserPassword")]
        getter master_user_password : String?

        def initialize(
          @created_at : Time? = nil,
          @master_user_password : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseMetricDataRequest
        include JSON::Serializable

        # The end of the time interval from which to get metric data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use an end time
        # of October 1, 2018, at 8 PM UTC, then you input 1538424000 as the end time.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The metric for which you want to return information. Valid relational database metric names are
        # listed below, along with the most useful statistics to include in your request, and the published
        # unit value. All relational database metric data is available in 1-minute (60 seconds) granularity.
        # CPUUtilization - The percentage of CPU utilization currently in use on the database. Statistics :
        # The most useful statistics are Maximum and Average . Unit : The published unit is Percent .
        # DatabaseConnections - The number of database connections in use. Statistics : The most useful
        # statistics are Maximum and Sum . Unit : The published unit is Count . DiskQueueDepth - The number of
        # outstanding IOs (read/write requests) that are waiting to access the disk. Statistics : The most
        # useful statistic is Sum . Unit : The published unit is Count . FreeStorageSpace - The amount of
        # available storage space. Statistics : The most useful statistic is Sum . Unit : The published unit
        # is Bytes . NetworkReceiveThroughput - The incoming (Receive) network traffic on the database,
        # including both customer database traffic and AWS traffic used for monitoring and replication.
        # Statistics : The most useful statistic is Average . Unit : The published unit is Bytes/Second .
        # NetworkTransmitThroughput - The outgoing (Transmit) network traffic on the database, including both
        # customer database traffic and AWS traffic used for monitoring and replication. Statistics : The most
        # useful statistic is Average . Unit : The published unit is Bytes/Second .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The granularity, in seconds, of the returned data points. All relational database metric data is
        # available in 1-minute (60 seconds) granularity.
        @[JSON::Field(key: "period")]
        getter period : Int32

        # The name of your database from which to get metric data.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The start of the time interval from which to get metric data. Constraints: Specified in Coordinated
        # Universal Time (UTC). Specified in the Unix time format. For example, if you wish to use a start
        # time of October 1, 2018, at 8 PM UTC, then you input 1538424000 as the start time.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The statistic for the metric. The following statistics are available: Minimum - The lowest value
        # observed during the specified period. Use this value to determine low volumes of activity for your
        # application. Maximum - The highest value observed during the specified period. Use this value to
        # determine high volumes of activity for your application. Sum - All values submitted for the matching
        # metric added together. You can use this statistic to determine the total volume of a metric. Average
        # - The value of Sum / SampleCount during the specified period. By comparing this statistic with the
        # Minimum and Maximum values, you can determine the full scope of a metric and how close the average
        # use is to the Minimum and Maximum values. This comparison helps you to know when to increase or
        # decrease your resources. SampleCount - The count, or number, of data points used for the statistical
        # calculation.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The unit for the metric data request. Valid units depend on the metric data being requested. For the
        # valid units with each available metric, see the metricName parameter.
        @[JSON::Field(key: "unit")]
        getter unit : String

        def initialize(
          @end_time : Time,
          @metric_name : String,
          @period : Int32,
          @relational_database_name : String,
          @start_time : Time,
          @statistics : Array(String),
          @unit : String
        )
        end
      end

      struct GetRelationalDatabaseMetricDataResult
        include JSON::Serializable

        # An array of objects that describe the metric data returned.
        @[JSON::Field(key: "metricData")]
        getter metric_data : Array(Types::MetricDatapoint)?

        # The name of the metric returned.
        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        def initialize(
          @metric_data : Array(Types::MetricDatapoint)? = nil,
          @metric_name : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseParametersRequest
        include JSON::Serializable

        # The name of your database for which to get parameters.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabaseParameters request. If your results are paginated, the response will
        # return a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @relational_database_name : String,
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseParametersResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabaseParameters request and specify the next page token using the pageToken
        # parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An object describing the result of your get relational database parameters request.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::RelationalDatabaseParameter)?

        def initialize(
          @next_page_token : String? = nil,
          @parameters : Array(Types::RelationalDatabaseParameter)? = nil
        )
        end
      end

      struct GetRelationalDatabaseRequest
        include JSON::Serializable

        # The name of the database that you are looking up.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        def initialize(
          @relational_database_name : String
        )
        end
      end

      struct GetRelationalDatabaseResult
        include JSON::Serializable

        # An object describing the specified database.
        @[JSON::Field(key: "relationalDatabase")]
        getter relational_database : Types::RelationalDatabase?

        def initialize(
          @relational_database : Types::RelationalDatabase? = nil
        )
        end
      end

      struct GetRelationalDatabaseSnapshotRequest
        include JSON::Serializable

        # The name of the database snapshot for which to get information.
        @[JSON::Field(key: "relationalDatabaseSnapshotName")]
        getter relational_database_snapshot_name : String

        def initialize(
          @relational_database_snapshot_name : String
        )
        end
      end

      struct GetRelationalDatabaseSnapshotResult
        include JSON::Serializable

        # An object describing the specified database snapshot.
        @[JSON::Field(key: "relationalDatabaseSnapshot")]
        getter relational_database_snapshot : Types::RelationalDatabaseSnapshot?

        def initialize(
          @relational_database_snapshot : Types::RelationalDatabaseSnapshot? = nil
        )
        end
      end

      struct GetRelationalDatabaseSnapshotsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabaseSnapshots request. If your results are paginated, the response will
        # return a next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabaseSnapshotsResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabaseSnapshots request and specify the next page token using the pageToken
        # parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An object describing the result of your get relational database snapshots request.
        @[JSON::Field(key: "relationalDatabaseSnapshots")]
        getter relational_database_snapshots : Array(Types::RelationalDatabaseSnapshot)?

        def initialize(
          @next_page_token : String? = nil,
          @relational_database_snapshots : Array(Types::RelationalDatabaseSnapshot)? = nil
        )
        end
      end

      struct GetRelationalDatabasesRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetRelationalDatabases request. If your results are paginated, the response will return a
        # next page token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetRelationalDatabasesResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetRelationalDatabases request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An object describing the result of your get relational databases request.
        @[JSON::Field(key: "relationalDatabases")]
        getter relational_databases : Array(Types::RelationalDatabase)?

        def initialize(
          @next_page_token : String? = nil,
          @relational_databases : Array(Types::RelationalDatabase)? = nil
        )
        end
      end

      struct GetSetupHistoryRequest
        include JSON::Serializable

        # The name of the resource for which you are requesting information.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetSetupHistory request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @resource_name : String,
          @page_token : String? = nil
        )
        end
      end

      struct GetSetupHistoryResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetSetupHistory request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # The historical information that's returned.
        @[JSON::Field(key: "setupHistory")]
        getter setup_history : Array(Types::SetupHistory)?

        def initialize(
          @next_page_token : String? = nil,
          @setup_history : Array(Types::SetupHistory)? = nil
        )
        end
      end

      struct GetStaticIpRequest
        include JSON::Serializable

        # The name of the static IP in Lightsail.
        @[JSON::Field(key: "staticIpName")]
        getter static_ip_name : String

        def initialize(
          @static_ip_name : String
        )
        end
      end

      struct GetStaticIpResult
        include JSON::Serializable

        # An array of key-value pairs containing information about the requested static IP.
        @[JSON::Field(key: "staticIp")]
        getter static_ip : Types::StaticIp?

        def initialize(
          @static_ip : Types::StaticIp? = nil
        )
        end
      end

      struct GetStaticIpsRequest
        include JSON::Serializable

        # The token to advance to the next page of results from your request. To get a page token, perform an
        # initial GetStaticIps request. If your results are paginated, the response will return a next page
        # token that you can specify as the page token in a subsequent request.
        @[JSON::Field(key: "pageToken")]
        getter page_token : String?

        def initialize(
          @page_token : String? = nil
        )
        end
      end

      struct GetStaticIpsResult
        include JSON::Serializable

        # The token to advance to the next page of results from your request. A next page token is not
        # returned if there are no more results to display. To get the next page of results, perform another
        # GetStaticIps request and specify the next page token using the pageToken parameter.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # An array of key-value pairs containing information about your get static IPs request.
        @[JSON::Field(key: "staticIps")]
        getter static_ips : Array(Types::StaticIp)?

        def initialize(
          @next_page_token : String? = nil,
          @static_ips : Array(Types::StaticIp)? = nil
        )
        end
      end

      # Describes the request headers that a Lightsail distribution bases caching on. For the headers that
      # you specify, your distribution caches separate versions of the specified content based on the header
      # values in viewer requests. For example, suppose viewer requests for logo.jpg contain a custom
      # product header that has a value of either acme or apex , and you configure your distribution to
      # cache your content based on values in the product header. Your distribution forwards the product
      # header to the origin and caches the response from the origin once for each header value.
      struct HeaderObject
        include JSON::Serializable

        # The specific headers to forward to your distribution's origin.
        @[JSON::Field(key: "headersAllowList")]
        getter headers_allow_list : Array(String)?

        # The headers that you want your distribution to forward to your origin and base caching on. You can
        # configure your distribution to do one of the following: all - Forward all headers to your origin.
        # none - Forward only the default headers. allow-list - Forward only the headers you specify using the
        # headersAllowList parameter.
        @[JSON::Field(key: "option")]
        getter option : String?

        def initialize(
          @headers_allow_list : Array(String)? = nil,
          @option : String? = nil
        )
        end
      end

      # Describes the public SSH host keys or the RDP certificate.
      struct HostKeyAttributes
        include JSON::Serializable

        # The SSH host key algorithm or the RDP certificate format. For SSH host keys, the algorithm may be
        # ssh-rsa , ecdsa-sha2-nistp256 , ssh-ed25519 , etc. For RDP certificates, the algorithm is always
        # x509-cert .
        @[JSON::Field(key: "algorithm")]
        getter algorithm : String?

        # The SHA-1 fingerprint of the returned SSH host key or RDP certificate. Example of an SHA-1 SSH
        # fingerprint: SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0 Example of an SHA-1 RDP fingerprint:
        # af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45
        @[JSON::Field(key: "fingerprintSHA1")]
        getter fingerprint_sha1 : String?

        # The SHA-256 fingerprint of the returned SSH host key or RDP certificate. Example of an SHA-256 SSH
        # fingerprint: SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o Example of an SHA-256 RDP
        # fingerprint:
        # 03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68
        @[JSON::Field(key: "fingerprintSHA256")]
        getter fingerprint_sha256 : String?

        # The returned RDP certificate is not valid after this point in time. This value is listed only for
        # RDP certificates.
        @[JSON::Field(key: "notValidAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_valid_after : Time?

        # The returned RDP certificate is valid after this point in time. This value is listed only for RDP
        # certificates.
        @[JSON::Field(key: "notValidBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_valid_before : Time?

        # The public SSH host key or the RDP certificate.
        @[JSON::Field(key: "publicKey")]
        getter public_key : String?

        # The time that the SSH host key or RDP certificate was recorded by Lightsail.
        @[JSON::Field(key: "witnessedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter witnessed_at : Time?

        def initialize(
          @algorithm : String? = nil,
          @fingerprint_sha1 : String? = nil,
          @fingerprint_sha256 : String? = nil,
          @not_valid_after : Time? = nil,
          @not_valid_before : Time? = nil,
          @public_key : String? = nil,
          @witnessed_at : Time? = nil
        )
        end
      end

      struct ImportKeyPairRequest
        include JSON::Serializable

        # The name of the key pair for which you want to import the public key.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String

        # A base64-encoded public key of the ssh-rsa type.
        @[JSON::Field(key: "publicKeyBase64")]
        getter public_key_base64 : String

        def initialize(
          @key_pair_name : String,
          @public_key_base64 : String
        )
        end
      end

      struct ImportKeyPairResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      # Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution. An
      # origin can be a Lightsail instance, bucket, container service, or load balancer. A distribution
      # pulls content from an origin, caches it, and serves it to viewers via a worldwide network of edge
      # servers.
      struct InputOrigin
        include JSON::Serializable

        # The name of the origin resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol that your Amazon Lightsail distribution uses when establishing a connection with your
        # origin to pull content.
        @[JSON::Field(key: "protocolPolicy")]
        getter protocol_policy : String?

        # The AWS Region name of the origin resource.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # The amount of time, in seconds, that the distribution waits for a response after forwarding a
        # request to the origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the default
        # (if you don't specify otherwise) is 30 seconds.
        @[JSON::Field(key: "responseTimeout")]
        getter response_timeout : Int32?

        def initialize(
          @name : String? = nil,
          @protocol_policy : String? = nil,
          @region_name : String? = nil,
          @response_timeout : Int32? = nil
        )
        end
      end

      # Describes an instance (a virtual private server).
      struct Instance
        include JSON::Serializable

        # An array of objects representing the add-ons enabled on the instance.
        @[JSON::Field(key: "addOns")]
        getter add_ons : Array(Types::AddOn)?

        # The Amazon Resource Name (ARN) of the instance (
        # arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE ).
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The blueprint ID ( amazon_linux_2023 ).
        @[JSON::Field(key: "blueprintId")]
        getter blueprint_id : String?

        # The friendly name of the blueprint ( Amazon Linux 2023 ).
        @[JSON::Field(key: "blueprintName")]
        getter blueprint_name : String?

        # The bundle for the instance ( micro_x_x ).
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # The timestamp when the instance was created ( 1479734909.17 ) in Unix time format.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The size of the vCPU and the amount of RAM for the instance.
        @[JSON::Field(key: "hardware")]
        getter hardware : Types::InstanceHardware?

        # The IP address type of the instance. The possible values are ipv4 for IPv4 only, ipv6 for IPv6 only,
        # and dualstack for IPv4 and IPv6.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The IPv6 addresses of the instance.
        @[JSON::Field(key: "ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        # A Boolean value indicating whether this instance has a static IP assigned to it.
        @[JSON::Field(key: "isStaticIp")]
        getter is_static_ip : Bool?

        # The region name and Availability Zone where the instance is located.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The metadata options for the Amazon Lightsail instance.
        @[JSON::Field(key: "metadataOptions")]
        getter metadata_options : Types::InstanceMetadataOptions?

        # The name the user gave the instance ( Amazon_Linux_2023-1 ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # Information about the public ports and monthly data transfer rates for the instance.
        @[JSON::Field(key: "networking")]
        getter networking : Types::InstanceNetworking?

        # The private IP address of the instance.
        @[JSON::Field(key: "privateIpAddress")]
        getter private_ip_address : String?

        # The public IP address of the instance.
        @[JSON::Field(key: "publicIpAddress")]
        getter public_ip_address : String?

        # The type of resource (usually Instance ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The name of the SSH key being used to connect to the instance ( LightsailDefaultKeyPair ).
        @[JSON::Field(key: "sshKeyName")]
        getter ssh_key_name : String?

        # The status code and the state ( running ) for the instance.
        @[JSON::Field(key: "state")]
        getter state : Types::InstanceState?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The user name for connecting to the instance ( ec2-user ).
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @add_ons : Array(Types::AddOn)? = nil,
          @arn : String? = nil,
          @blueprint_id : String? = nil,
          @blueprint_name : String? = nil,
          @bundle_id : String? = nil,
          @created_at : Time? = nil,
          @hardware : Types::InstanceHardware? = nil,
          @ip_address_type : String? = nil,
          @ipv6_addresses : Array(String)? = nil,
          @is_static_ip : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @metadata_options : Types::InstanceMetadataOptions? = nil,
          @name : String? = nil,
          @networking : Types::InstanceNetworking? = nil,
          @private_ip_address : String? = nil,
          @public_ip_address : String? = nil,
          @resource_type : String? = nil,
          @ssh_key_name : String? = nil,
          @state : Types::InstanceState? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @username : String? = nil
        )
        end
      end

      # The parameters for gaining temporary access to one of your Amazon Lightsail instances.
      struct InstanceAccessDetails
        include JSON::Serializable

        # For SSH access, the public key to use when accessing your instance For OpenSSH clients (command line
        # SSH), you should save this value to tempkey-cert.pub .
        @[JSON::Field(key: "certKey")]
        getter cert_key : String?

        # For SSH access, the date on which the temporary keys expire.
        @[JSON::Field(key: "expiresAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expires_at : Time?

        # Describes the public SSH host keys or the RDP certificate.
        @[JSON::Field(key: "hostKeys")]
        getter host_keys : Array(Types::HostKeyAttributes)?

        # The name of this Amazon Lightsail instance.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The public IP address of the Amazon Lightsail instance.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # The IPv6 address of the Amazon Lightsail instance.
        @[JSON::Field(key: "ipv6Addresses")]
        getter ipv6_addresses : Array(String)?

        # For RDP access, the password for your Amazon Lightsail instance. Password will be an empty string if
        # the password for your new instance is not ready yet. When you create an instance, it can take up to
        # 15 minutes for the instance to be ready. If you create an instance using any key pair other than the
        # default ( LightsailDefaultKeyPair ), password will always be an empty string. If you change the
        # Administrator password on the instance, Lightsail will continue to return the original password
        # value. When accessing the instance using RDP, you need to manually enter the Administrator password
        # after changing it from the default.
        @[JSON::Field(key: "password")]
        getter password : String?

        # For a Windows Server-based instance, an object with the data you can use to retrieve your password.
        # This is only needed if password is empty and the instance is not new (and therefore the password is
        # not ready yet). When you create an instance, it can take up to 15 minutes for the instance to be
        # ready.
        @[JSON::Field(key: "passwordData")]
        getter password_data : Types::PasswordData?

        # For SSH access, the temporary private key. For OpenSSH clients (command line SSH), you should save
        # this value to tempkey ).
        @[JSON::Field(key: "privateKey")]
        getter private_key : String?

        # The protocol for these Amazon Lightsail instance access details.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The user name to use when logging in to the Amazon Lightsail instance.
        @[JSON::Field(key: "username")]
        getter username : String?

        def initialize(
          @cert_key : String? = nil,
          @expires_at : Time? = nil,
          @host_keys : Array(Types::HostKeyAttributes)? = nil,
          @instance_name : String? = nil,
          @ip_address : String? = nil,
          @ipv6_addresses : Array(String)? = nil,
          @password : String? = nil,
          @password_data : Types::PasswordData? = nil,
          @private_key : String? = nil,
          @protocol : String? = nil,
          @username : String? = nil
        )
        end
      end

      # Describes the Amazon Elastic Compute Cloud instance and related resources to be created using the
      # create cloud formation stack operation.
      struct InstanceEntry
        include JSON::Serializable

        # The Availability Zone for the new Amazon EC2 instance.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String

        # The instance type ( t2.micro ) to use for the new Amazon EC2 instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The port configuration to use for the new Amazon EC2 instance. The following configuration options
        # are available: DEFAULT - Use the default firewall settings from the Lightsail instance blueprint. If
        # this is specified, then IPv4 and IPv6 will be configured for the new instance that is created in
        # Amazon EC2. INSTANCE - Use the configured firewall settings from the source Lightsail instance. If
        # this is specified, the new instance that is created in Amazon EC2 will be configured to match the
        # configuration of the source Lightsail instance. For example, if the source instance is configured
        # for dual-stack (IPv4 and IPv6), then IPv4 and IPv6 will be configured for the new instance that is
        # created in Amazon EC2. If the source instance is configured for IPv4 only, then only IPv4 will be
        # configured for the new instance that is created in Amazon EC2. NONE - Use the default Amazon EC2
        # security group. If this is specified, then only IPv4 will be configured for the new instance that is
        # created in Amazon EC2. CLOSED - All ports closed. If this is specified, then only IPv4 will be
        # configured for the new instance that is created in Amazon EC2. If you configured lightsail-connect
        # as a cidrListAliases on your instance, or if you chose to allow the Lightsail browser-based SSH or
        # RDP clients to connect to your instance, that configuration is not carried over to your new Amazon
        # EC2 instance.
        @[JSON::Field(key: "portInfoSource")]
        getter port_info_source : String

        # The name of the export snapshot record, which contains the exported Lightsail instance snapshot that
        # will be used as the source of the new Amazon EC2 instance. Use the get export snapshot records
        # operation to get a list of export snapshot records that you can use to create a CloudFormation
        # stack.
        @[JSON::Field(key: "sourceName")]
        getter source_name : String

        # A launch script you can create that configures a server with additional user data. For example, you
        # might want to run apt-get -y update . Depending on the machine image you choose, the command to get
        # software on your instance varies. Amazon Linux and CentOS use yum , Debian and Ubuntu use apt-get ,
        # and FreeBSD uses pkg .
        @[JSON::Field(key: "userData")]
        getter user_data : String?

        def initialize(
          @availability_zone : String,
          @instance_type : String,
          @port_info_source : String,
          @source_name : String,
          @user_data : String? = nil
        )
        end
      end

      # Describes the hardware for the instance.
      struct InstanceHardware
        include JSON::Serializable

        # The number of vCPUs the instance has.
        @[JSON::Field(key: "cpuCount")]
        getter cpu_count : Int32?

        # The disks attached to the instance.
        @[JSON::Field(key: "disks")]
        getter disks : Array(Types::Disk)?

        # The amount of RAM in GB on the instance ( 1.0 ).
        @[JSON::Field(key: "ramSizeInGb")]
        getter ram_size_in_gb : Float64?

        def initialize(
          @cpu_count : Int32? = nil,
          @disks : Array(Types::Disk)? = nil,
          @ram_size_in_gb : Float64? = nil
        )
        end
      end

      # Describes information about the health of the instance.
      struct InstanceHealthSummary
        include JSON::Serializable

        # Describes the overall instance health. Valid values are below.
        @[JSON::Field(key: "instanceHealth")]
        getter instance_health : String?

        # More information about the instance health. If the instanceHealth is healthy , then an
        # instanceHealthReason value is not provided. If instanceHealth is initial , the instanceHealthReason
        # value can be one of the following: Lb.RegistrationInProgress - The target instance is in the process
        # of being registered with the load balancer. Lb.InitialHealthChecking - The Lightsail load balancer
        # is still sending the target instance the minimum number of health checks required to determine its
        # health status. If instanceHealth is unhealthy , the instanceHealthReason value can be one of the
        # following: Instance.ResponseCodeMismatch - The health checks did not return an expected HTTP code.
        # Instance.Timeout - The health check requests timed out. Instance.FailedHealthChecks - The health
        # checks failed because the connection to the target instance timed out, the target instance response
        # was malformed, or the target instance failed the health check for an unknown reason.
        # Lb.InternalError - The health checks failed due to an internal error. If instanceHealth is unused ,
        # the instanceHealthReason value can be one of the following: Instance.NotRegistered - The target
        # instance is not registered with the target group. Instance.NotInUse - The target group is not used
        # by any load balancer, or the target instance is in an Availability Zone that is not enabled for its
        # load balancer. Instance.IpUnusable - The target IP address is reserved for use by a Lightsail load
        # balancer. Instance.InvalidState - The target is in the stopped or terminated state. If
        # instanceHealth is draining , the instanceHealthReason value can be one of the following:
        # Instance.DeregistrationInProgress - The target instance is in the process of being deregistered and
        # the deregistration delay period has not expired.
        @[JSON::Field(key: "instanceHealthReason")]
        getter instance_health_reason : String?

        # The name of the Lightsail instance for which you are requesting health check data.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        def initialize(
          @instance_health : String? = nil,
          @instance_health_reason : String? = nil,
          @instance_name : String? = nil
        )
        end
      end

      # The metadata options for the instance.
      struct InstanceMetadataOptions
        include JSON::Serializable

        # Indicates whether the HTTP metadata endpoint on your instances is enabled or disabled. If the value
        # is disabled , you cannot access your instance metadata.
        @[JSON::Field(key: "httpEndpoint")]
        getter http_endpoint : String?

        # Indicates whether the IPv6 endpoint for the instance metadata service is enabled or disabled.
        @[JSON::Field(key: "httpProtocolIpv6")]
        getter http_protocol_ipv6 : String?

        # The desired HTTP PUT response hop limit for instance metadata requests. A larger number means that
        # the instance metadata requests can travel farther.
        @[JSON::Field(key: "httpPutResponseHopLimit")]
        getter http_put_response_hop_limit : Int32?

        # The state of token usage for your instance metadata requests. If the state is optional , you can
        # choose whether to retrieve instance metadata with a signed token header on your request. If you
        # retrieve the IAM role credentials without a token, the version 1.0 role credentials are returned. If
        # you retrieve the IAM role credentials by using a valid signed token, the version 2.0 role
        # credentials are returned. If the state is required , you must send a signed token header with all
        # instance metadata retrieval requests. In this state, retrieving the IAM role credential always
        # returns the version 2.0 credentials. The version 1.0 credentials are not available. Not all instance
        # blueprints in Lightsail support version 2.0 credentials. Use the MetadataNoToken instance metric to
        # track the number of calls to the instance metadata service that are using version 1.0 credentials.
        # For more information, see Viewing instance metrics in Amazon Lightsail in the Amazon Lightsail
        # Developer Guide .
        @[JSON::Field(key: "httpTokens")]
        getter http_tokens : String?

        # The state of the metadata option changes. The following states are possible: pending - The metadata
        # options are being updated. The instance is not yet ready to process metadata traffic with the new
        # selection. applied - The metadata options have been successfully applied to the instance.
        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @http_endpoint : String? = nil,
          @http_protocol_ipv6 : String? = nil,
          @http_put_response_hop_limit : Int32? = nil,
          @http_tokens : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Describes monthly data transfer rates and port information for an instance.
      struct InstanceNetworking
        include JSON::Serializable

        # The amount of data in GB allocated for monthly data transfers.
        @[JSON::Field(key: "monthlyTransfer")]
        getter monthly_transfer : Types::MonthlyTransfer?

        # An array of key-value pairs containing information about the ports on the instance.
        @[JSON::Field(key: "ports")]
        getter ports : Array(Types::InstancePortInfo)?

        def initialize(
          @monthly_transfer : Types::MonthlyTransfer? = nil,
          @ports : Array(Types::InstancePortInfo)? = nil
        )
        end
      end

      # Describes information about ports for an Amazon Lightsail instance.
      struct InstancePortInfo
        include JSON::Serializable

        # The access direction ( inbound or outbound ). Lightsail currently supports only inbound access
        # direction.
        @[JSON::Field(key: "accessDirection")]
        getter access_direction : String?

        # The location from which access is allowed. For example, Anywhere (0.0.0.0/0) , or Custom if a
        # specific IP address or range of IP addresses is allowed.
        @[JSON::Field(key: "accessFrom")]
        getter access_from : String?

        # The type of access ( Public or Private ).
        @[JSON::Field(key: "accessType")]
        getter access_type : String?

        # An alias that defines access for a preconfigured range of IP addresses. The only alias currently
        # supported is lightsail-connect , which allows IP addresses of the browser-based RDP/SSH client in
        # the Lightsail console to connect to your instance.
        @[JSON::Field(key: "cidrListAliases")]
        getter cidr_list_aliases : Array(String)?

        # The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. The ipv6Cidrs parameter lists the IPv6 addresses that
        # are allowed to connect to an instance. For more information about CIDR block notation, see Classless
        # Inter-Domain Routing on Wikipedia .
        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        # The common name of the port information.
        @[JSON::Field(key: "commonName")]
        getter common_name : String?

        # The first port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP type for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP type for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "fromPort")]
        getter from_port : Int32?

        # The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an
        # instance through IPv6; otherwise, IPv4 should be used. The cidrs parameter lists the IPv4 addresses
        # that are allowed to connect to an instance. For more information about CIDR block notation, see
        # Classless Inter-Domain Routing on Wikipedia .
        @[JSON::Field(key: "ipv6Cidrs")]
        getter ipv6_cidrs : Array(String)?

        # The IP protocol name. The name can be one of the following: tcp - Transmission Control Protocol
        # (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications
        # running on hosts communicating by an IP network. If you have an application that doesn't require
        # reliable data stream service, use UDP instead. all - All transport layer protocol types. For more
        # general information, see Transport layer on Wikipedia . udp - With User Datagram Protocol (UDP),
        # computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
        # network. Prior communications are not required to set up transmission channels or data paths.
        # Applications that don't require reliable data stream service can use UDP, which provides a
        # connectionless datagram service that emphasizes reduced latency over reliability. If you do require
        # reliable data stream service, use TCP instead. icmp - Internet Control Message Protocol (ICMP) is
        # used to send error messages and operational information indicating success or failure when
        # communicating with an instance. For example, an error is indicated when an instance could not be
        # reached. When you specify icmp as the protocol , you must specify the ICMP type using the fromPort
        # parameter, and ICMP code using the toPort parameter. icmp6 - Internet Control Message Protocol
        # (ICMP) for IPv6. When you specify icmp6 as the protocol , you must specify the ICMP type using the
        # fromPort parameter, and ICMP code using the toPort parameter.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The last port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP code for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP code for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "toPort")]
        getter to_port : Int32?

        def initialize(
          @access_direction : String? = nil,
          @access_from : String? = nil,
          @access_type : String? = nil,
          @cidr_list_aliases : Array(String)? = nil,
          @cidrs : Array(String)? = nil,
          @common_name : String? = nil,
          @from_port : Int32? = nil,
          @ipv6_cidrs : Array(String)? = nil,
          @protocol : String? = nil,
          @to_port : Int32? = nil
        )
        end
      end

      # Describes open ports on an instance, the IP addresses allowed to connect to the instance through the
      # ports, and the protocol.
      struct InstancePortState
        include JSON::Serializable

        # An alias that defines access for a preconfigured range of IP addresses. The only alias currently
        # supported is lightsail-connect , which allows IP addresses of the browser-based RDP/SSH client in
        # the Lightsail console to connect to your instance.
        @[JSON::Field(key: "cidrListAliases")]
        getter cidr_list_aliases : Array(String)?

        # The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. The ipv6Cidrs parameter lists the IPv6 addresses that
        # are allowed to connect to an instance. For more information about CIDR block notation, see Classless
        # Inter-Domain Routing on Wikipedia .
        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        # The first port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP type for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP type for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "fromPort")]
        getter from_port : Int32?

        # The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an
        # instance through IPv6; otherwise, IPv4 should be used. The cidrs parameter lists the IPv4 addresses
        # that are allowed to connect to an instance. For more information about CIDR block notation, see
        # Classless Inter-Domain Routing on Wikipedia .
        @[JSON::Field(key: "ipv6Cidrs")]
        getter ipv6_cidrs : Array(String)?

        # The IP protocol name. The name can be one of the following: tcp - Transmission Control Protocol
        # (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications
        # running on hosts communicating by an IP network. If you have an application that doesn't require
        # reliable data stream service, use UDP instead. all - All transport layer protocol types. For more
        # general information, see Transport layer on Wikipedia . udp - With User Datagram Protocol (UDP),
        # computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
        # network. Prior communications are not required to set up transmission channels or data paths.
        # Applications that don't require reliable data stream service can use UDP, which provides a
        # connectionless datagram service that emphasizes reduced latency over reliability. If you do require
        # reliable data stream service, use TCP instead. icmp - Internet Control Message Protocol (ICMP) is
        # used to send error messages and operational information indicating success or failure when
        # communicating with an instance. For example, an error is indicated when an instance could not be
        # reached. When you specify icmp as the protocol , you must specify the ICMP type using the fromPort
        # parameter, and ICMP code using the toPort parameter. icmp6 - Internet Control Message Protocol
        # (ICMP) for IPv6. When you specify icmp6 as the protocol , you must specify the ICMP type using the
        # fromPort parameter, and ICMP code using the toPort parameter.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Specifies whether the instance port is open or closed . The port state for Lightsail instances is
        # always open .
        @[JSON::Field(key: "state")]
        getter state : String?

        # The last port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP code for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP code for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "toPort")]
        getter to_port : Int32?

        def initialize(
          @cidr_list_aliases : Array(String)? = nil,
          @cidrs : Array(String)? = nil,
          @from_port : Int32? = nil,
          @ipv6_cidrs : Array(String)? = nil,
          @protocol : String? = nil,
          @state : String? = nil,
          @to_port : Int32? = nil
        )
        end
      end

      # Describes an instance snapshot.
      struct InstanceSnapshot
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the snapshot (
        # arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE ).
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the snapshot was created ( 1479907467.024 ).
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An array of disk objects containing information about all block storage disks.
        @[JSON::Field(key: "fromAttachedDisks")]
        getter from_attached_disks : Array(Types::Disk)?

        # The blueprint ID from which you created the snapshot ( amazon_linux_2023 ). A blueprint is a virtual
        # private server (or instance ) image used to create instances quickly.
        @[JSON::Field(key: "fromBlueprintId")]
        getter from_blueprint_id : String?

        # The bundle ID from which you created the snapshot ( micro_x_x ).
        @[JSON::Field(key: "fromBundleId")]
        getter from_bundle_id : String?

        # The Amazon Resource Name (ARN) of the instance from which the snapshot was created (
        # arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE ).
        @[JSON::Field(key: "fromInstanceArn")]
        getter from_instance_arn : String?

        # The instance from which the snapshot was created.
        @[JSON::Field(key: "fromInstanceName")]
        getter from_instance_name : String?

        # A Boolean value indicating whether the snapshot was created from an automatic snapshot.
        @[JSON::Field(key: "isFromAutoSnapshot")]
        getter is_from_auto_snapshot : Bool?

        # The region name and Availability Zone where you created the snapshot.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the snapshot.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The progress of the snapshot. This is populated only for disk snapshots, and is null for instance
        # snapshots.
        @[JSON::Field(key: "progress")]
        getter progress : String?

        # The type of resource (usually InstanceSnapshot ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The size in GB of the SSD.
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        # The state the snapshot is in.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @from_attached_disks : Array(Types::Disk)? = nil,
          @from_blueprint_id : String? = nil,
          @from_bundle_id : String? = nil,
          @from_instance_arn : String? = nil,
          @from_instance_name : String? = nil,
          @is_from_auto_snapshot : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @progress : String? = nil,
          @resource_type : String? = nil,
          @size_in_gb : Int32? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an instance snapshot.
      struct InstanceSnapshotInfo
        include JSON::Serializable

        # The blueprint ID from which the source instance ( amazon_linux_2023 ).
        @[JSON::Field(key: "fromBlueprintId")]
        getter from_blueprint_id : String?

        # The bundle ID from which the source instance was created ( micro_x_x ).
        @[JSON::Field(key: "fromBundleId")]
        getter from_bundle_id : String?

        # A list of objects describing the disks that were attached to the source instance.
        @[JSON::Field(key: "fromDiskInfo")]
        getter from_disk_info : Array(Types::DiskInfo)?

        def initialize(
          @from_blueprint_id : String? = nil,
          @from_bundle_id : String? = nil,
          @from_disk_info : Array(Types::DiskInfo)? = nil
        )
        end
      end

      # Describes the virtual private server (or instance ) status.
      struct InstanceState
        include JSON::Serializable

        # The status code for the instance.
        @[JSON::Field(key: "code")]
        getter code : Int32?

        # The state of the instance ( running or pending ).
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Lightsail throws this exception when user input does not conform to the validation rules of an input
      # field. Domain and distribution APIs are only available in the N. Virginia ( us-east-1 ) Amazon Web
      # Services Region. Please set your Amazon Web Services Region configuration to us-east-1 to create,
      # view, or edit these resources.
      struct InvalidInputException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      struct IsVpcPeeredRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct IsVpcPeeredResult
        include JSON::Serializable

        # Returns true if the Lightsail VPC is peered; otherwise, false .
        @[JSON::Field(key: "isPeered")]
        getter is_peered : Bool?

        def initialize(
          @is_peered : Bool? = nil
        )
        end
      end

      # Describes an SSH key pair.
      struct KeyPair
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the key pair (
        # arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE ).
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the key pair was created ( 1479816991.349 ).
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The RSA fingerprint of the key pair.
        @[JSON::Field(key: "fingerprint")]
        getter fingerprint : String?

        # The region name and Availability Zone where the key pair was created.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The friendly name of the SSH key pair.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The resource type (usually KeyPair ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @fingerprint : String? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes an Amazon Lightsail content delivery network (CDN) distribution.
      struct LightsailDistribution
        include JSON::Serializable

        # Indicates whether the bundle that is currently applied to your distribution, specified using the
        # distributionName parameter, can be changed to another bundle. Use the UpdateDistributionBundle
        # action to change your distribution's bundle.
        @[JSON::Field(key: "ableToUpdateBundle")]
        getter able_to_update_bundle : Bool?

        # The alternate domain names of the distribution.
        @[JSON::Field(key: "alternativeDomainNames")]
        getter alternative_domain_names : Array(String)?

        # The Amazon Resource Name (ARN) of the distribution.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the bundle currently applied to the distribution.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # An object that describes the cache behavior settings of the distribution.
        @[JSON::Field(key: "cacheBehaviorSettings")]
        getter cache_behavior_settings : Types::CacheSettings?

        # An array of objects that describe the per-path cache behavior of the distribution.
        @[JSON::Field(key: "cacheBehaviors")]
        getter cache_behaviors : Array(Types::CacheBehaviorPerPath)?

        # The name of the SSL/TLS certificate attached to the distribution, if any.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The timestamp when the distribution was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # An object that describes the default cache behavior of the distribution.
        @[JSON::Field(key: "defaultCacheBehavior")]
        getter default_cache_behavior : Types::CacheBehavior?

        # The domain name of the distribution.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The IP address type of the distribution. The possible values are ipv4 for IPv4 only, and dualstack
        # for IPv4 and IPv6.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # Indicates whether the distribution is enabled.
        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool?

        # An object that describes the location of the distribution, such as the Amazon Web Services Region
        # and Availability Zone. Lightsail distributions are global resources that can reference an origin in
        # any Amazon Web Services Region, and distribute its content globally. However, all distributions are
        # located in the us-east-1 Region.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the distribution.
        @[JSON::Field(key: "name")]
        getter name : String?

        # An object that describes the origin resource of the distribution, such as a Lightsail instance,
        # bucket, or load balancer. The distribution pulls, caches, and serves content from the origin.
        @[JSON::Field(key: "origin")]
        getter origin : Types::Origin?

        # The public DNS of the origin.
        @[JSON::Field(key: "originPublicDNS")]
        getter origin_public_dns : String?

        # The Lightsail resource type ( Distribution ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of the distribution.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail distribution. This code enables our support team to look up your Lightsail information
        # more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The minimum TLS protocol version that the distribution can use to communicate with viewers.
        @[JSON::Field(key: "viewerMinimumTlsProtocolVersion")]
        getter viewer_minimum_tls_protocol_version : String?

        def initialize(
          @able_to_update_bundle : Bool? = nil,
          @alternative_domain_names : Array(String)? = nil,
          @arn : String? = nil,
          @bundle_id : String? = nil,
          @cache_behavior_settings : Types::CacheSettings? = nil,
          @cache_behaviors : Array(Types::CacheBehaviorPerPath)? = nil,
          @certificate_name : String? = nil,
          @created_at : Time? = nil,
          @default_cache_behavior : Types::CacheBehavior? = nil,
          @domain_name : String? = nil,
          @ip_address_type : String? = nil,
          @is_enabled : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @origin : Types::Origin? = nil,
          @origin_public_dns : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @viewer_minimum_tls_protocol_version : String? = nil
        )
        end
      end

      # Describes a load balancer.
      struct LoadBalancer
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the load balancer.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A string to string map of the configuration options for your load balancer. Valid values are listed
        # below.
        @[JSON::Field(key: "configurationOptions")]
        getter configuration_options : Hash(String, String)?

        # The date when your load balancer was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The DNS name of your Lightsail load balancer.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String?

        # The path you specified to perform your health checks. If no path is specified, the load balancer
        # tries to make a request to the default (root) page.
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String?

        # A Boolean value that indicates whether HTTPS redirection is enabled for the load balancer.
        @[JSON::Field(key: "httpsRedirectionEnabled")]
        getter https_redirection_enabled : Bool?

        # An array of InstanceHealthSummary objects describing the health of the load balancer.
        @[JSON::Field(key: "instanceHealthSummary")]
        getter instance_health_summary : Array(Types::InstanceHealthSummary)?

        # The port where the load balancer will direct traffic to your Lightsail instances. For HTTP traffic,
        # it's port 80. For HTTPS traffic, it's port 443.
        @[JSON::Field(key: "instancePort")]
        getter instance_port : Int32?

        # The IP address type of the load balancer. The possible values are ipv4 for IPv4 only, ipv6 for IPv6
        # only, and dualstack for IPv4 and IPv6.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The AWS Region where your load balancer was created ( us-east-2a ). Lightsail automatically creates
        # your load balancer across Availability Zones.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the load balancer ( my-load-balancer ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol you have enabled for your load balancer. Valid values are below. You can't just have
        # HTTP_HTTPS , but you can have just HTTP .
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # An array of public port settings for your load balancer. For HTTP, use port 80. For HTTPS, use port
        # 443.
        @[JSON::Field(key: "publicPorts")]
        getter public_ports : Array(Int32)?

        # The resource type ( LoadBalancer .
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of your load balancer. Valid values are below.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail load balancer. This code enables our support team to look up your Lightsail information
        # more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # An array of LoadBalancerTlsCertificateSummary objects that provide additional information about the
        # SSL/TLS certificates. For example, if true , the certificate is attached to the load balancer.
        @[JSON::Field(key: "tlsCertificateSummaries")]
        getter tls_certificate_summaries : Array(Types::LoadBalancerTlsCertificateSummary)?

        # The name of the TLS security policy for the load balancer.
        @[JSON::Field(key: "tlsPolicyName")]
        getter tls_policy_name : String?

        def initialize(
          @arn : String? = nil,
          @configuration_options : Hash(String, String)? = nil,
          @created_at : Time? = nil,
          @dns_name : String? = nil,
          @health_check_path : String? = nil,
          @https_redirection_enabled : Bool? = nil,
          @instance_health_summary : Array(Types::InstanceHealthSummary)? = nil,
          @instance_port : Int32? = nil,
          @ip_address_type : String? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @protocol : String? = nil,
          @public_ports : Array(Int32)? = nil,
          @resource_type : String? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tls_certificate_summaries : Array(Types::LoadBalancerTlsCertificateSummary)? = nil,
          @tls_policy_name : String? = nil
        )
        end
      end

      # Describes a load balancer SSL/TLS certificate. TLS is just an updated, more secure version of Secure
      # Socket Layer (SSL).
      struct LoadBalancerTlsCertificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SSL/TLS certificate.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time when you created your SSL/TLS certificate.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The domain name for your SSL/TLS certificate.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # An array of LoadBalancerTlsCertificateDomainValidationRecord objects describing the records.
        @[JSON::Field(key: "domainValidationRecords")]
        getter domain_validation_records : Array(Types::LoadBalancerTlsCertificateDomainValidationRecord)?

        # The validation failure reason, if any, of the certificate. The following failure reasons are
        # possible: NO_AVAILABLE_CONTACTS - This failure applies to email validation, which is not available
        # for Lightsail certificates. ADDITIONAL_VERIFICATION_REQUIRED - Lightsail requires additional
        # information to process this certificate request. This can happen as a fraud-protection measure, such
        # as when the domain ranks within the Alexa top 1000 websites. To provide the required information,
        # use the AWS Support Center to contact AWS Support. You cannot request a certificate for Amazon-owned
        # domain names such as those ending in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.
        # DOMAIN_NOT_ALLOWED - One or more of the domain names in the certificate request was reported as an
        # unsafe domain by VirusTotal . To correct the problem, search for your domain name on the VirusTotal
        # website. If your domain is reported as suspicious, see Google Help for Hacked Websites to learn what
        # you can do. If you believe that the result is a false positive, notify the organization that is
        # reporting the domain. VirusTotal is an aggregate of several antivirus and URL scanners and cannot
        # remove your domain from a block list itself. After you correct the problem and the VirusTotal
        # registry has been updated, request a new certificate. If you see this error and your domain is not
        # included in the VirusTotal list, visit the AWS Support Center and create a case.
        # INVALID_PUBLIC_DOMAIN - One or more of the domain names in the certificate request is not valid.
        # Typically, this is because a domain name in the request is not a valid top-level domain. Try to
        # request a certificate again, correcting any spelling errors or typos that were in the failed
        # request, and ensure that all domain names in the request are for valid top-level domains. For
        # example, you cannot request a certificate for example.invalidpublicdomain because
        # invalidpublicdomain is not a valid top-level domain. OTHER - Typically, this failure occurs when
        # there is a typographical error in one or more of the domain names in the certificate request. Try to
        # request a certificate again, correcting any spelling errors or typos that were in the failed
        # request.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # When true , the SSL/TLS certificate is attached to the Lightsail load balancer.
        @[JSON::Field(key: "isAttached")]
        getter is_attached : Bool?

        # The time when the SSL/TLS certificate was issued.
        @[JSON::Field(key: "issuedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter issued_at : Time?

        # The issuer of the certificate.
        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # The algorithm used to generate the key pair (the public and private key).
        @[JSON::Field(key: "keyAlgorithm")]
        getter key_algorithm : String?

        # The load balancer name where your SSL/TLS certificate is attached.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String?

        # The Amazon Web Services Region and Availability Zone where you created your certificate.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the SSL/TLS certificate ( my-certificate ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The timestamp when the SSL/TLS certificate expires.
        @[JSON::Field(key: "notAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_after : Time?

        # The timestamp when the SSL/TLS certificate is first valid.
        @[JSON::Field(key: "notBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter not_before : Time?

        # An object that describes the status of the certificate renewal managed by Lightsail.
        @[JSON::Field(key: "renewalSummary")]
        getter renewal_summary : Types::LoadBalancerTlsCertificateRenewalSummary?

        # The resource type ( LoadBalancerTlsCertificate ). Instance - A Lightsail instance (a virtual private
        # server) StaticIp - A static IP address KeyPair - The key pair used to connect to a Lightsail
        # instance InstanceSnapshot - A Lightsail instance snapshot Domain - A DNS zone PeeredVpc - A peered
        # VPC LoadBalancer - A Lightsail load balancer LoadBalancerTlsCertificate - An SSL/TLS certificate
        # associated with a Lightsail load balancer Disk - A Lightsail block storage disk DiskSnapshot - A
        # block storage disk snapshot
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The reason the certificate was revoked. This value is present only when the certificate status is
        # REVOKED .
        @[JSON::Field(key: "revocationReason")]
        getter revocation_reason : String?

        # The timestamp when the certificate was revoked. This value is present only when the certificate
        # status is REVOKED .
        @[JSON::Field(key: "revokedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter revoked_at : Time?

        # The serial number of the certificate.
        @[JSON::Field(key: "serial")]
        getter serial : String?

        # The algorithm that was used to sign the certificate.
        @[JSON::Field(key: "signatureAlgorithm")]
        getter signature_algorithm : String?

        # The validation status of the SSL/TLS certificate. Valid values are below.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The name of the entity that is associated with the public key contained in the certificate.
        @[JSON::Field(key: "subject")]
        getter subject : String?

        # An array of strings that specify the alternate domains ( example2.com ) and subdomains (
        # blog.example.com ) for the certificate.
        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Array(String)?

        # The support code. Include this code in your email to support when you have questions about your
        # Lightsail load balancer or SSL/TLS certificate. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @domain_name : String? = nil,
          @domain_validation_records : Array(Types::LoadBalancerTlsCertificateDomainValidationRecord)? = nil,
          @failure_reason : String? = nil,
          @is_attached : Bool? = nil,
          @issued_at : Time? = nil,
          @issuer : String? = nil,
          @key_algorithm : String? = nil,
          @load_balancer_name : String? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @not_after : Time? = nil,
          @not_before : Time? = nil,
          @renewal_summary : Types::LoadBalancerTlsCertificateRenewalSummary? = nil,
          @resource_type : String? = nil,
          @revocation_reason : String? = nil,
          @revoked_at : Time? = nil,
          @serial : String? = nil,
          @signature_algorithm : String? = nil,
          @status : String? = nil,
          @subject : String? = nil,
          @subject_alternative_names : Array(String)? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # An object that describes the state of the canonical name (CNAME) records that are automatically
      # added by Lightsail to the DNS of the domain to validate domain ownership.
      struct LoadBalancerTlsCertificateDnsRecordCreationState
        include JSON::Serializable

        # The status code for the automated DNS record creation. Following are the possible values: SUCCEEDED
        # - The validation records were successfully added. STARTED - The automatic DNS record creation has
        # started. FAILED - The validation record addition failed.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The message that describes the reason for the status code.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Contains information about the domain names on an SSL/TLS certificate that you will use to validate
      # domain ownership.
      struct LoadBalancerTlsCertificateDomainValidationOption
        include JSON::Serializable

        # The fully qualified domain name in the certificate request.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The status of the domain validation. Valid values are listed below.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String?

        def initialize(
          @domain_name : String? = nil,
          @validation_status : String? = nil
        )
        end
      end

      # Describes the validation record of each domain name in the SSL/TLS certificate.
      struct LoadBalancerTlsCertificateDomainValidationRecord
        include JSON::Serializable

        # An object that describes the state of the canonical name (CNAME) records that are automatically
        # added by Lightsail to the DNS of a domain to validate domain ownership.
        @[JSON::Field(key: "dnsRecordCreationState")]
        getter dns_record_creation_state : Types::LoadBalancerTlsCertificateDnsRecordCreationState?

        # The domain name against which your SSL/TLS certificate was validated.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # A fully qualified domain name in the certificate. For example, example.com .
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of validation record. For example, CNAME for domain validation.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The validation status. Valid values are listed below.
        @[JSON::Field(key: "validationStatus")]
        getter validation_status : String?

        # The value for that type.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @dns_record_creation_state : Types::LoadBalancerTlsCertificateDnsRecordCreationState? = nil,
          @domain_name : String? = nil,
          @name : String? = nil,
          @type : String? = nil,
          @validation_status : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains information about the status of Lightsail's managed renewal for the certificate. The
      # renewal status of the certificate. The following renewal status are possible: PendingAutoRenewal -
      # Lightsail is attempting to automatically validate the domain names in the certificate. No further
      # action is required. PendingValidation - Lightsail couldn't automatically validate one or more domain
      # names in the certificate. You must take action to validate these domain names or the certificate
      # won't be renewed. If you used DNS validation, check to make sure your certificate's domain
      # validation records exist in your domain's DNS, and that your certificate remains in use. Success -
      # All domain names in the certificate are validated, and Lightsail renewed the certificate. No further
      # action is required. Failed - One or more domain names were not validated before the certificate
      # expired, and Lightsail did not renew the certificate. You can request a new certificate using the
      # CreateCertificate action.
      struct LoadBalancerTlsCertificateRenewalSummary
        include JSON::Serializable

        # Contains information about the validation of each domain name in the certificate, as it pertains to
        # Lightsail's managed renewal. This is different from the initial validation that occurs as a result
        # of the RequestCertificate request.
        @[JSON::Field(key: "domainValidationOptions")]
        getter domain_validation_options : Array(Types::LoadBalancerTlsCertificateDomainValidationOption)?

        # The renewal status of the certificate. The following renewal status are possible: PendingAutoRenewal
        # - Lightsail is attempting to automatically validate the domain names of the certificate. No further
        # action is required. PendingValidation - Lightsail couldn't automatically validate one or more domain
        # names of the certificate. You must take action to validate these domain names or the certificate
        # won't be renewed. Check to make sure your certificate's domain validation records exist in your
        # domain's DNS, and that your certificate remains in use. Success - All domain names in the
        # certificate are validated, and Lightsail renewed the certificate. No further action is required.
        # Failed - One or more domain names were not validated before the certificate expired, and Lightsail
        # did not renew the certificate. You can request a new certificate using the CreateCertificate action.
        @[JSON::Field(key: "renewalStatus")]
        getter renewal_status : String?

        def initialize(
          @domain_validation_options : Array(Types::LoadBalancerTlsCertificateDomainValidationOption)? = nil,
          @renewal_status : String? = nil
        )
        end
      end

      # Provides a summary of SSL/TLS certificate metadata.
      struct LoadBalancerTlsCertificateSummary
        include JSON::Serializable

        # When true , the SSL/TLS certificate is attached to the Lightsail load balancer.
        @[JSON::Field(key: "isAttached")]
        getter is_attached : Bool?

        # The name of the SSL/TLS certificate.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @is_attached : Bool? = nil,
          @name : String? = nil
        )
        end
      end

      # Describes the TLS security policies that are available for Lightsail load balancers. For more
      # information about load balancer TLS security policies, see Configuring TLS security policies on your
      # Amazon Lightsail load balancers in the Amazon Lightsail Developer Guide .
      struct LoadBalancerTlsPolicy
        include JSON::Serializable

        # The ciphers used by the TLS security policy. The ciphers are listed in order of preference.
        @[JSON::Field(key: "ciphers")]
        getter ciphers : Array(String)?

        # The description of the TLS security policy.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A Boolean value that indicates whether the TLS security policy is the default.
        @[JSON::Field(key: "isDefault")]
        getter is_default : Bool?

        # The name of the TLS security policy.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocols used in a given TLS security policy.
        @[JSON::Field(key: "protocols")]
        getter protocols : Array(String)?

        def initialize(
          @ciphers : Array(String)? = nil,
          @description : String? = nil,
          @is_default : Bool? = nil,
          @name : String? = nil,
          @protocols : Array(String)? = nil
        )
        end
      end

      # Describes a database log event.
      struct LogEvent
        include JSON::Serializable

        # The timestamp when the database log event was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The message of the database log event.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @created_at : Time? = nil,
          @message : String? = nil
        )
        end
      end

      # Describes the metric data point.
      struct MetricDatapoint
        include JSON::Serializable

        # The average.
        @[JSON::Field(key: "average")]
        getter average : Float64?

        # The maximum.
        @[JSON::Field(key: "maximum")]
        getter maximum : Float64?

        # The minimum.
        @[JSON::Field(key: "minimum")]
        getter minimum : Float64?

        # The sample count.
        @[JSON::Field(key: "sampleCount")]
        getter sample_count : Float64?

        # The sum.
        @[JSON::Field(key: "sum")]
        getter sum : Float64?

        # The timestamp ( 1479816991.349 ).
        @[JSON::Field(key: "timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        # The unit.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        def initialize(
          @average : Float64? = nil,
          @maximum : Float64? = nil,
          @minimum : Float64? = nil,
          @sample_count : Float64? = nil,
          @sum : Float64? = nil,
          @timestamp : Time? = nil,
          @unit : String? = nil
        )
        end
      end

      # Describes resource being monitored by an alarm. An alarm is a way to monitor your Amazon Lightsail
      # resource metrics. For more information, see Alarms in Amazon Lightsail .
      struct MonitoredResourceInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource being monitored.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The name of the Lightsail resource being monitored.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type of the resource being monitored. Instances, load balancers, and
        # relational databases are the only Lightsail resources that can currently be monitored by alarms.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes the monthly data transfer in and out of your virtual private server (or instance ).
      struct MonthlyTransfer
        include JSON::Serializable

        # The amount allocated per month (in GB).
        @[JSON::Field(key: "gbPerMonthAllocated")]
        getter gb_per_month_allocated : Int32?

        def initialize(
          @gb_per_month_allocated : Int32? = nil
        )
        end
      end

      # Describes the state of the name server records update made by Amazon Lightsail to an Amazon Route 53
      # registered domain. For more information, see DNS in Amazon Lightsail in the Amazon Lightsail
      # Developer Guide .
      struct NameServersUpdateState
        include JSON::Serializable

        # The status code for the name servers update. Following are the possible values: SUCCEEDED - The name
        # server records were successfully updated. PENDING - The name server record update is in progress.
        # FAILED - The name server record update failed. STARTED - The automatic name server record update
        # started.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The message that describes the reason for the status code.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Lightsail throws this exception when it cannot find a resource.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      struct OpenInstancePublicPortsRequest
        include JSON::Serializable

        # The name of the instance for which to open ports.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # An object to describe the ports to open for the specified instance.
        @[JSON::Field(key: "portInfo")]
        getter port_info : Types::PortInfo

        def initialize(
          @instance_name : String,
          @port_info : Types::PortInfo
        )
        end
      end

      struct OpenInstancePublicPortsResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      # Describes the API operation.
      struct Operation
        include JSON::Serializable

        # The timestamp when the operation was initialized ( 1479816991.349 ).
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The error code.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error details.
        @[JSON::Field(key: "errorDetails")]
        getter error_details : String?

        # The ID of the operation.
        @[JSON::Field(key: "id")]
        getter id : String?

        # A Boolean value indicating whether the operation is terminal.
        @[JSON::Field(key: "isTerminal")]
        getter is_terminal : Bool?

        # The Amazon Web Services Region and Availability Zone.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # Details about the operation ( Debian-1GB-Ohio-1 ).
        @[JSON::Field(key: "operationDetails")]
        getter operation_details : String?

        # The type of operation.
        @[JSON::Field(key: "operationType")]
        getter operation_type : String?

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of the operation.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The timestamp when the status was changed ( 1479816991.349 ).
        @[JSON::Field(key: "statusChangedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter status_changed_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @error_code : String? = nil,
          @error_details : String? = nil,
          @id : String? = nil,
          @is_terminal : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @operation_details : String? = nil,
          @operation_type : String? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @status_changed_at : Time? = nil
        )
        end
      end

      # Lightsail throws this exception when an operation fails to execute.
      struct OperationFailureException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      # Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution. An
      # origin can be a Lightsail instance, bucket, or load balancer. A distribution pulls content from an
      # origin, caches it, and serves it to viewers via a worldwide network of edge servers.
      struct Origin
        include JSON::Serializable

        # The name of the origin resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol that your Amazon Lightsail distribution uses when establishing a connection with your
        # origin to pull content.
        @[JSON::Field(key: "protocolPolicy")]
        getter protocol_policy : String?

        # The AWS Region name of the origin resource.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        # The resource type of the origin resource ( Instance ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The amount of time, in seconds, that the distribution waits for a response after forwarding a
        # request to the origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the default
        # (if you don't specify otherwise) is 30 seconds.
        @[JSON::Field(key: "responseTimeout")]
        getter response_timeout : Int32?

        def initialize(
          @name : String? = nil,
          @protocol_policy : String? = nil,
          @region_name : String? = nil,
          @resource_type : String? = nil,
          @response_timeout : Int32? = nil
        )
        end
      end

      # The password data for the Windows Server-based instance, including the ciphertext and the key pair
      # name.
      struct PasswordData
        include JSON::Serializable

        # The encrypted password. Ciphertext will be an empty string if access to your new instance is not
        # ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.
        # If you use the default key pair ( LightsailDefaultKeyPair ), the decrypted password will be
        # available in the password field. If you are using a custom key pair, you need to use your own means
        # of decryption. If you change the Administrator password on the instance, Lightsail will continue to
        # return the original ciphertext value. When accessing the instance using RDP, you need to manually
        # enter the Administrator password after changing it from the default.
        @[JSON::Field(key: "ciphertext")]
        getter ciphertext : String?

        # The name of the key pair that you used when creating your instance. If no key pair name was
        # specified when creating the instance, Lightsail uses the default key pair ( LightsailDefaultKeyPair
        # ). If you are using a custom key pair, you need to use your own means of decrypting your password
        # using the ciphertext . Lightsail creates the ciphertext by encrypting your password with the public
        # key part of this key pair.
        @[JSON::Field(key: "keyPairName")]
        getter key_pair_name : String?

        def initialize(
          @ciphertext : String? = nil,
          @key_pair_name : String? = nil
        )
        end
      end

      struct PeerVpcRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct PeerVpcResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      # Describes a pending database maintenance action.
      struct PendingMaintenanceAction
        include JSON::Serializable

        # The type of pending database maintenance action.
        @[JSON::Field(key: "action")]
        getter action : String?

        # The effective date of the pending database maintenance action.
        @[JSON::Field(key: "currentApplyDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter current_apply_date : Time?

        # Additional detail about the pending database maintenance action.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @action : String? = nil,
          @current_apply_date : Time? = nil,
          @description : String? = nil
        )
        end
      end

      # Describes a pending database value modification.
      struct PendingModifiedRelationalDatabaseValues
        include JSON::Serializable

        # A Boolean value indicating whether automated backup retention is enabled.
        @[JSON::Field(key: "backupRetentionEnabled")]
        getter backup_retention_enabled : Bool?

        # The database engine version.
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The password for the master user of the database.
        @[JSON::Field(key: "masterUserPassword")]
        getter master_user_password : String?

        def initialize(
          @backup_retention_enabled : Bool? = nil,
          @engine_version : String? = nil,
          @master_user_password : String? = nil
        )
        end
      end

      # Describes ports to open on an instance, the IP addresses allowed to connect to the instance through
      # the ports, and the protocol.
      struct PortInfo
        include JSON::Serializable

        # An alias that defines access for a preconfigured range of IP addresses. The only alias currently
        # supported is lightsail-connect , which allows IP addresses of the browser-based RDP/SSH client in
        # the Lightsail console to connect to your instance.
        @[JSON::Field(key: "cidrListAliases")]
        getter cidr_list_aliases : Array(String)?

        # The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. The ipv6Cidrs parameter lists the IPv6 addresses that
        # are allowed to connect to an instance. Examples: To allow the IP address 192.0.2.44 , specify
        # 192.0.2.44 or 192.0.2.44/32 . To allow the IP addresses 192.0.2.0 to 192.0.2.255 , specify
        # 192.0.2.0/24 . For more information about CIDR block notation, see Classless Inter-Domain Routing on
        # Wikipedia .
        @[JSON::Field(key: "cidrs")]
        getter cidrs : Array(String)?

        # The first port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP type for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP type for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "fromPort")]
        getter from_port : Int32?

        # The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an
        # instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an
        # instance through IPv6; otherwise, IPv4 should be used. The cidrs parameter lists the IPv4 addresses
        # that are allowed to connect to an instance. For more information about CIDR block notation, see
        # Classless Inter-Domain Routing on Wikipedia .
        @[JSON::Field(key: "ipv6Cidrs")]
        getter ipv6_cidrs : Array(String)?

        # The IP protocol name. The name can be one of the following: tcp - Transmission Control Protocol
        # (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications
        # running on hosts communicating by an IP network. If you have an application that doesn't require
        # reliable data stream service, use UDP instead. all - All transport layer protocol types. For more
        # general information, see Transport layer on Wikipedia . udp - With User Datagram Protocol (UDP),
        # computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP)
        # network. Prior communications are not required to set up transmission channels or data paths.
        # Applications that don't require reliable data stream service can use UDP, which provides a
        # connectionless datagram service that emphasizes reduced latency over reliability. If you do require
        # reliable data stream service, use TCP instead. icmp - Internet Control Message Protocol (ICMP) is
        # used to send error messages and operational information indicating success or failure when
        # communicating with an instance. For example, an error is indicated when an instance could not be
        # reached. When you specify icmp as the protocol , you must specify the ICMP type using the fromPort
        # parameter, and ICMP code using the toPort parameter. icmp6 - Internet Control Message Protocol
        # (ICMP) for IPv6. When you specify icmp6 as the protocol , you must specify the ICMP type using the
        # fromPort parameter, and ICMP code using the toPort parameter.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The last port in a range of open ports on an instance. Allowed ports: TCP and UDP - 0 to 65535 ICMP
        # - The ICMP code for IPv4 addresses. For example, specify 8 as the fromPort (ICMP type), and -1 as
        # the toPort (ICMP code), to enable ICMP Ping. For more information, see Control Messages on Wikipedia
        # . ICMPv6 - The ICMP code for IPv6 addresses. For example, specify 128 as the fromPort (ICMPv6 type),
        # and 0 as toPort (ICMPv6 code). For more information, see Internet Control Message Protocol for IPv6
        # .
        @[JSON::Field(key: "toPort")]
        getter to_port : Int32?

        def initialize(
          @cidr_list_aliases : Array(String)? = nil,
          @cidrs : Array(String)? = nil,
          @from_port : Int32? = nil,
          @ipv6_cidrs : Array(String)? = nil,
          @protocol : String? = nil,
          @to_port : Int32? = nil
        )
        end
      end

      # Describes the configuration for an Amazon Lightsail container service to access private container
      # image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories. For
      # more information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
      # container service in the Amazon Lightsail Developer Guide .
      struct PrivateRegistryAccess
        include JSON::Serializable

        # An object that describes the activation status of the role that you can use to grant a Lightsail
        # container service access to Amazon ECR private repositories. If the role is activated, the Amazon
        # Resource Name (ARN) of the role is also listed.
        @[JSON::Field(key: "ecrImagePullerRole")]
        getter ecr_image_puller_role : Types::ContainerServiceECRImagePullerRole?

        def initialize(
          @ecr_image_puller_role : Types::ContainerServiceECRImagePullerRole? = nil
        )
        end
      end

      # Describes a request to configure an Amazon Lightsail container service to access private container
      # image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories. For
      # more information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
      # container service in the Amazon Lightsail Developer Guide .
      struct PrivateRegistryAccessRequest
        include JSON::Serializable

        # An object to describe a request to activate or deactivate the role that you can use to grant an
        # Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private
        # repositories.
        @[JSON::Field(key: "ecrImagePullerRole")]
        getter ecr_image_puller_role : Types::ContainerServiceECRImagePullerRoleRequest?

        def initialize(
          @ecr_image_puller_role : Types::ContainerServiceECRImagePullerRoleRequest? = nil
        )
        end
      end

      struct PutAlarmRequest
        include JSON::Serializable

        # The name for the alarm. Specify the name of an existing alarm to update, and overwrite the previous
        # configuration of the alarm.
        @[JSON::Field(key: "alarmName")]
        getter alarm_name : String

        # The arithmetic operation to use when comparing the specified statistic to the threshold. The
        # specified statistic value is used as the first operand.
        @[JSON::Field(key: "comparisonOperator")]
        getter comparison_operator : String

        # The number of most recent periods over which data is compared to the specified threshold. If you are
        # setting an "M out of N" alarm, this value ( evaluationPeriods ) is the N. If you are setting an
        # alarm that requires that a number of consecutive data points be breaching to trigger the alarm, this
        # value specifies the rolling period of time in which data points are evaluated. Each evaluation
        # period is five minutes long. For example, specify an evaluation period of 24 to evaluate a metric
        # over a rolling period of two hours. You can specify a minimum valuation period of 1 (5 minutes), and
        # a maximum evaluation period of 288 (24 hours).
        @[JSON::Field(key: "evaluationPeriods")]
        getter evaluation_periods : Int32

        # The name of the metric to associate with the alarm. You can configure up to two alarms per metric.
        # The following metrics are available for each resource type: Instances : BurstCapacityPercentage ,
        # BurstCapacityTime , CPUUtilization , NetworkIn , NetworkOut , StatusCheckFailed ,
        # StatusCheckFailed_Instance , and StatusCheckFailed_System . Load balancers :
        # ClientTLSNegotiationErrorCount , HealthyHostCount , UnhealthyHostCount , HTTPCode_LB_4XX_Count ,
        # HTTPCode_LB_5XX_Count , HTTPCode_Instance_2XX_Count , HTTPCode_Instance_3XX_Count ,
        # HTTPCode_Instance_4XX_Count , HTTPCode_Instance_5XX_Count , InstanceResponseTime ,
        # RejectedConnectionCount , and RequestCount . Relational databases : CPUUtilization ,
        # DatabaseConnections , DiskQueueDepth , FreeStorageSpace , NetworkReceiveThroughput , and
        # NetworkTransmitThroughput . For more information about these metrics, see Metrics available in
        # Lightsail .
        @[JSON::Field(key: "metricName")]
        getter metric_name : String

        # The name of the Lightsail resource that will be monitored. Instances, load balancers, and relational
        # databases are the only Lightsail resources that can currently be monitored by alarms.
        @[JSON::Field(key: "monitoredResourceName")]
        getter monitored_resource_name : String

        # The value against which the specified statistic is compared.
        @[JSON::Field(key: "threshold")]
        getter threshold : Float64

        # The contact protocols to use for the alarm, such as Email , SMS (text messaging), or both. A
        # notification is sent via the specified contact protocol if notifications are enabled for the alarm,
        # and when the alarm is triggered. A notification is not sent if a contact protocol is not specified,
        # if the specified contact protocol is not configured in the Amazon Web Services Region, or if
        # notifications are not enabled for the alarm using the notificationEnabled paramater. Use the
        # CreateContactMethod action to configure a contact protocol in an Amazon Web Services Region.
        @[JSON::Field(key: "contactProtocols")]
        getter contact_protocols : Array(String)?

        # The number of data points that must be not within the specified threshold to trigger the alarm. If
        # you are setting an "M out of N" alarm, this value ( datapointsToAlarm ) is the M.
        @[JSON::Field(key: "datapointsToAlarm")]
        getter datapoints_to_alarm : Int32?

        # Indicates whether the alarm is enabled. Notifications are enabled by default if you don't specify
        # this parameter.
        @[JSON::Field(key: "notificationEnabled")]
        getter notification_enabled : Bool?

        # The alarm states that trigger a notification. An alarm has the following possible states: ALARM -
        # The metric is outside of the defined threshold. INSUFFICIENT_DATA - The alarm has just started, the
        # metric is not available, or not enough data is available for the metric to determine the alarm
        # state. OK - The metric is within the defined threshold. When you specify a notification trigger, the
        # ALARM state must be specified. The INSUFFICIENT_DATA and OK states can be specified in addition to
        # the ALARM state. If you specify OK as an alarm trigger, a notification is sent when the alarm
        # switches from an ALARM or INSUFFICIENT_DATA alarm state to an OK state. This can be thought of as an
        # all clear alarm notification. If you specify INSUFFICIENT_DATA as the alarm trigger, a notification
        # is sent when the alarm switches from an OK or ALARM alarm state to an INSUFFICIENT_DATA state. The
        # notification trigger defaults to ALARM if you don't specify this parameter.
        @[JSON::Field(key: "notificationTriggers")]
        getter notification_triggers : Array(String)?

        # Sets how this alarm will handle missing data points. An alarm can treat missing data in the
        # following ways: breaching - Assume the missing data is not within the threshold. Missing data counts
        # towards the number of times the metric is not within the threshold. notBreaching - Assume the
        # missing data is within the threshold. Missing data does not count towards the number of times the
        # metric is not within the threshold. ignore - Ignore the missing data. Maintains the current alarm
        # state. missing - Missing data is treated as missing. If treatMissingData is not specified, the
        # default behavior of missing is used.
        @[JSON::Field(key: "treatMissingData")]
        getter treat_missing_data : String?

        def initialize(
          @alarm_name : String,
          @comparison_operator : String,
          @evaluation_periods : Int32,
          @metric_name : String,
          @monitored_resource_name : String,
          @threshold : Float64,
          @contact_protocols : Array(String)? = nil,
          @datapoints_to_alarm : Int32? = nil,
          @notification_enabled : Bool? = nil,
          @notification_triggers : Array(String)? = nil,
          @treat_missing_data : String? = nil
        )
        end
      end

      struct PutAlarmResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct PutInstancePublicPortsRequest
        include JSON::Serializable

        # The name of the instance for which to open ports.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # An array of objects to describe the ports to open for the specified instance.
        @[JSON::Field(key: "portInfos")]
        getter port_infos : Array(Types::PortInfo)

        def initialize(
          @instance_name : String,
          @port_infos : Array(Types::PortInfo)
        )
        end
      end

      struct PutInstancePublicPortsResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      # Describes the query string parameters that an Amazon Lightsail content delivery network (CDN)
      # distribution to bases caching on. For the query strings that you specify, your distribution caches
      # separate versions of the specified content based on the query string values in viewer requests.
      struct QueryStringObject
        include JSON::Serializable

        # Indicates whether the distribution forwards and caches based on query strings.
        @[JSON::Field(key: "option")]
        getter option : Bool?

        # The specific query strings that the distribution forwards to the origin. Your distribution will
        # cache content based on the specified query strings. If the option parameter is true, then your
        # distribution forwards all query strings, regardless of what you specify using the
        # queryStringsAllowList parameter.
        @[JSON::Field(key: "queryStringsAllowList")]
        getter query_strings_allow_list : Array(String)?

        def initialize(
          @option : Bool? = nil,
          @query_strings_allow_list : Array(String)? = nil
        )
        end
      end

      # Describes the deletion state of an Amazon Route 53 hosted zone for a domain that is being
      # automatically delegated to an Amazon Lightsail DNS zone.
      struct R53HostedZoneDeletionState
        include JSON::Serializable

        # The status code for the deletion state. Following are the possible values: SUCCEEDED - The hosted
        # zone was successfully deleted. PENDING - The hosted zone deletion is in progress. FAILED - The
        # hosted zone deletion failed. STARTED - The hosted zone deletion started.
        @[JSON::Field(key: "code")]
        getter code : String?

        # The message that describes the reason for the status code.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct RebootInstanceRequest
        include JSON::Serializable

        # The name of the instance to reboot.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct RebootInstanceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct RebootRelationalDatabaseRequest
        include JSON::Serializable

        # The name of your database to reboot.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        def initialize(
          @relational_database_name : String
        )
        end
      end

      struct RebootRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes the Amazon Web Services Region.
      struct Region
        include JSON::Serializable

        # The Availability Zones. Follows the format us-east-2a (case-sensitive).
        @[JSON::Field(key: "availabilityZones")]
        getter availability_zones : Array(Types::AvailabilityZone)?

        # The continent code ( NA , meaning North America).
        @[JSON::Field(key: "continentCode")]
        getter continent_code : String?

        # The description of the Amazon Web Services Region ( This region is recommended to serve users in the
        # eastern United States and eastern Canada ).
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name ( Ohio ).
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The region name ( us-east-2 ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Availability Zones for databases. Follows the format us-east-2a (case-sensitive).
        @[JSON::Field(key: "relationalDatabaseAvailabilityZones")]
        getter relational_database_availability_zones : Array(Types::AvailabilityZone)?

        def initialize(
          @availability_zones : Array(Types::AvailabilityZone)? = nil,
          @continent_code : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @name : String? = nil,
          @relational_database_availability_zones : Array(Types::AvailabilityZone)? = nil
        )
        end
      end

      # Lightsail throws this exception when an operation is performed on resources in an opt-in Region that
      # is currently being set up.
      struct RegionSetupInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        # Regions and Availability Zones for Lightsail
        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        # Opt-in Regions typically take a few minutes to finish setting up before you can work with them. Wait
        # a few minutes and try again.
        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      struct RegisterContainerImageRequest
        include JSON::Serializable

        # The digest of the container image to be registered.
        @[JSON::Field(key: "digest")]
        getter digest : String

        # The label for the container image when it's registered to the container service. Use a descriptive
        # label that you can use to track the different versions of your registered container images. Use the
        # GetContainerImages action to return the container images registered to a Lightsail container
        # service. The label is the &lt;imagelabel&gt; portion of the following image name example:
        # :container-service-1.&lt;imagelabel&gt;.1 If the name of your container service is
        # mycontainerservice , and the label that you specify is mystaticwebsite , then the name of the
        # registered container image will be :mycontainerservice.mystaticwebsite.1 . The number at the end of
        # these image name examples represents the version of the registered container image. If you push and
        # register another container image to the same Lightsail container service, with the same label, then
        # the version number for the new registered container image will be 2 . If you push and register
        # another container image, the version number will be 3 , and so on.
        @[JSON::Field(key: "label")]
        getter label : String

        # The name of the container service for which to register a container image.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @digest : String,
          @label : String,
          @service_name : String
        )
        end
      end

      struct RegisterContainerImageResult
        include JSON::Serializable

        # An object that describes a container image that is registered to a Lightsail container service
        @[JSON::Field(key: "containerImage")]
        getter container_image : Types::ContainerImage?

        def initialize(
          @container_image : Types::ContainerImage? = nil
        )
        end
      end

      # Describes the delegation state of an Amazon Route 53 registered domain to Amazon Lightsail. When you
      # delegate an Amazon Route 53 registered domain to Lightsail, you can manage the DNS of the domain
      # using a Lightsail DNS zone. You no longer use the Route 53 hosted zone to manage the DNS of the
      # domain. To delegate the domain, Lightsail automatically updates the domain's name servers in Route
      # 53 to the name servers of the Lightsail DNS zone. Then, Lightsail automatically deletes the Route 53
      # hosted zone for the domain. All of the following conditions must be true for automatic domain
      # delegation to be successful: The registered domain must be in the same Amazon Web Services account
      # as the Lightsail account making the request. The user or entity making the request must have
      # permission to manage domains in Route 53. The Route 53 hosted zone for the domain must be empty. It
      # cannot contain DNS records other than start of authority (SOA) and name server records. If automatic
      # domain delegation fails, or if you manage the DNS of your domain using a service other than Route
      # 53, then you must manually add the Lightsail DNS zone name servers to your domain in order to
      # delegate management of its DNS to Lightsail. For more information, see Creating a DNS zone to manage
      # your domain’s records in Amazon Lightsail in the Amazon Lightsail Developer Guide .
      struct RegisteredDomainDelegationInfo
        include JSON::Serializable

        # An object that describes the state of the name server records that are automatically added to the
        # Route 53 domain by Lightsail.
        @[JSON::Field(key: "nameServersUpdateState")]
        getter name_servers_update_state : Types::NameServersUpdateState?

        # Describes the deletion state of an Amazon Route 53 hosted zone for a domain that is being
        # automatically delegated to an Amazon Lightsail DNS zone.
        @[JSON::Field(key: "r53HostedZoneDeletionState")]
        getter r53_hosted_zone_deletion_state : Types::R53HostedZoneDeletionState?

        def initialize(
          @name_servers_update_state : Types::NameServersUpdateState? = nil,
          @r53_hosted_zone_deletion_state : Types::R53HostedZoneDeletionState? = nil
        )
        end
      end

      # Describes a database.
      struct RelationalDatabase
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the database.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # A Boolean value indicating whether automated backup retention is enabled for the database.
        @[JSON::Field(key: "backupRetentionEnabled")]
        getter backup_retention_enabled : Bool?

        # The certificate associated with the database.
        @[JSON::Field(key: "caCertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # The timestamp when the database was created. Formatted in Unix time.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The database software (for example, MySQL ).
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The database engine version (for example, 5.7.23 ).
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Describes the hardware of the database.
        @[JSON::Field(key: "hardware")]
        getter hardware : Types::RelationalDatabaseHardware?

        # The latest point in time to which the database can be restored. Formatted in Unix time.
        @[JSON::Field(key: "latestRestorableTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_restorable_time : Time?

        # The Region name and Availability Zone where the database is located.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the master database created when the Lightsail database resource is created.
        @[JSON::Field(key: "masterDatabaseName")]
        getter master_database_name : String?

        # The master endpoint for the database.
        @[JSON::Field(key: "masterEndpoint")]
        getter master_endpoint : Types::RelationalDatabaseEndpoint?

        # The master user name of the database.
        @[JSON::Field(key: "masterUsername")]
        getter master_username : String?

        # The unique name of the database resource in Lightsail.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The status of parameter updates for the database.
        @[JSON::Field(key: "parameterApplyStatus")]
        getter parameter_apply_status : String?

        # Describes the pending maintenance actions for the database.
        @[JSON::Field(key: "pendingMaintenanceActions")]
        getter pending_maintenance_actions : Array(Types::PendingMaintenanceAction)?

        # Describes pending database value modifications.
        @[JSON::Field(key: "pendingModifiedValues")]
        getter pending_modified_values : Types::PendingModifiedRelationalDatabaseValues?

        # The daily time range during which automated backups are created for the database (for example,
        # 16:00-16:30 ).
        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur on the database. In the format
        # ddd:hh24:mi-ddd:hh24:mi . For example, Tue:17:00-Tue:17:30 .
        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # A Boolean value indicating whether the database is publicly accessible.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The blueprint ID for the database. A blueprint describes the major engine version of a database.
        @[JSON::Field(key: "relationalDatabaseBlueprintId")]
        getter relational_database_blueprint_id : String?

        # The bundle ID for the database. A bundle describes the performance specifications for your database.
        @[JSON::Field(key: "relationalDatabaseBundleId")]
        getter relational_database_bundle_id : String?

        # The Lightsail resource type for the database (for example, RelationalDatabase ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Describes the secondary Availability Zone of a high availability database. The secondary database is
        # used for failover support of a high availability database.
        @[JSON::Field(key: "secondaryAvailabilityZone")]
        getter secondary_availability_zone : String?

        # Describes the current state of the database.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code for the database. Include this code in your email to support when you have
        # questions about a database in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @backup_retention_enabled : Bool? = nil,
          @ca_certificate_identifier : String? = nil,
          @created_at : Time? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @hardware : Types::RelationalDatabaseHardware? = nil,
          @latest_restorable_time : Time? = nil,
          @location : Types::ResourceLocation? = nil,
          @master_database_name : String? = nil,
          @master_endpoint : Types::RelationalDatabaseEndpoint? = nil,
          @master_username : String? = nil,
          @name : String? = nil,
          @parameter_apply_status : String? = nil,
          @pending_maintenance_actions : Array(Types::PendingMaintenanceAction)? = nil,
          @pending_modified_values : Types::PendingModifiedRelationalDatabaseValues? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @relational_database_blueprint_id : String? = nil,
          @relational_database_bundle_id : String? = nil,
          @resource_type : String? = nil,
          @secondary_availability_zone : String? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Describes a database image, or blueprint. A blueprint describes the major engine version of a
      # database.
      struct RelationalDatabaseBlueprint
        include JSON::Serializable

        # The ID for the database blueprint.
        @[JSON::Field(key: "blueprintId")]
        getter blueprint_id : String?

        # The database software of the database blueprint (for example, MySQL ).
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The description of the database engine for the database blueprint.
        @[JSON::Field(key: "engineDescription")]
        getter engine_description : String?

        # The database engine version for the database blueprint (for example, 5.7.23 ).
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The description of the database engine version for the database blueprint.
        @[JSON::Field(key: "engineVersionDescription")]
        getter engine_version_description : String?

        # A Boolean value indicating whether the engine version is the default for the database blueprint.
        @[JSON::Field(key: "isEngineDefault")]
        getter is_engine_default : Bool?

        def initialize(
          @blueprint_id : String? = nil,
          @engine : String? = nil,
          @engine_description : String? = nil,
          @engine_version : String? = nil,
          @engine_version_description : String? = nil,
          @is_engine_default : Bool? = nil
        )
        end
      end

      # Describes a database bundle. A bundle describes the performance specifications of the database.
      struct RelationalDatabaseBundle
        include JSON::Serializable

        # The ID for the database bundle.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # The number of virtual CPUs (vCPUs) for the database bundle.
        @[JSON::Field(key: "cpuCount")]
        getter cpu_count : Int32?

        # The size of the disk for the database bundle.
        @[JSON::Field(key: "diskSizeInGb")]
        getter disk_size_in_gb : Int32?

        # A Boolean value indicating whether the database bundle is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # A Boolean value indicating whether the database bundle is encrypted.
        @[JSON::Field(key: "isEncrypted")]
        getter is_encrypted : Bool?

        # The name for the database bundle.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The cost of the database bundle in US currency.
        @[JSON::Field(key: "price")]
        getter price : Float64?

        # The amount of RAM in GB (for example, 2.0 ) for the database bundle.
        @[JSON::Field(key: "ramSizeInGb")]
        getter ram_size_in_gb : Float64?

        # The data transfer rate per month in GB for the database bundle.
        @[JSON::Field(key: "transferPerMonthInGb")]
        getter transfer_per_month_in_gb : Int32?

        def initialize(
          @bundle_id : String? = nil,
          @cpu_count : Int32? = nil,
          @disk_size_in_gb : Int32? = nil,
          @is_active : Bool? = nil,
          @is_encrypted : Bool? = nil,
          @name : String? = nil,
          @price : Float64? = nil,
          @ram_size_in_gb : Float64? = nil,
          @transfer_per_month_in_gb : Int32? = nil
        )
        end
      end

      # Describes an endpoint for a database.
      struct RelationalDatabaseEndpoint
        include JSON::Serializable

        # Specifies the DNS address of the database.
        @[JSON::Field(key: "address")]
        getter address : String?

        # Specifies the port that the database is listening on.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @address : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # Describes an event for a database.
      struct RelationalDatabaseEvent
        include JSON::Serializable

        # The timestamp when the database event was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The category that the database event belongs to.
        @[JSON::Field(key: "eventCategories")]
        getter event_categories : Array(String)?

        # The message of the database event.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The database that the database event relates to.
        @[JSON::Field(key: "resource")]
        getter resource : String?

        def initialize(
          @created_at : Time? = nil,
          @event_categories : Array(String)? = nil,
          @message : String? = nil,
          @resource : String? = nil
        )
        end
      end

      # Describes the hardware of a database.
      struct RelationalDatabaseHardware
        include JSON::Serializable

        # The number of vCPUs for the database.
        @[JSON::Field(key: "cpuCount")]
        getter cpu_count : Int32?

        # The size of the disk for the database.
        @[JSON::Field(key: "diskSizeInGb")]
        getter disk_size_in_gb : Int32?

        # The amount of RAM in GB for the database.
        @[JSON::Field(key: "ramSizeInGb")]
        getter ram_size_in_gb : Float64?

        def initialize(
          @cpu_count : Int32? = nil,
          @disk_size_in_gb : Int32? = nil,
          @ram_size_in_gb : Float64? = nil
        )
        end
      end

      # Describes the parameters of a database.
      struct RelationalDatabaseParameter
        include JSON::Serializable

        # Specifies the valid range of values for the parameter.
        @[JSON::Field(key: "allowedValues")]
        getter allowed_values : String?

        # Indicates when parameter updates are applied. Can be immediate or pending-reboot .
        @[JSON::Field(key: "applyMethod")]
        getter apply_method : String?

        # Specifies the engine-specific parameter type.
        @[JSON::Field(key: "applyType")]
        getter apply_type : String?

        # Specifies the valid data type for the parameter.
        @[JSON::Field(key: "dataType")]
        getter data_type : String?

        # Provides a description of the parameter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # A Boolean value indicating whether the parameter can be modified.
        @[JSON::Field(key: "isModifiable")]
        getter is_modifiable : Bool?

        # Specifies the name of the parameter.
        @[JSON::Field(key: "parameterName")]
        getter parameter_name : String?

        # Specifies the value of the parameter.
        @[JSON::Field(key: "parameterValue")]
        getter parameter_value : String?

        def initialize(
          @allowed_values : String? = nil,
          @apply_method : String? = nil,
          @apply_type : String? = nil,
          @data_type : String? = nil,
          @description : String? = nil,
          @is_modifiable : Bool? = nil,
          @parameter_name : String? = nil,
          @parameter_value : String? = nil
        )
        end
      end

      # Describes a database snapshot.
      struct RelationalDatabaseSnapshot
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the database snapshot.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp when the database snapshot was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The software of the database snapshot (for example, MySQL )
        @[JSON::Field(key: "engine")]
        getter engine : String?

        # The database engine version for the database snapshot (for example, 5.7.23 ).
        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The Amazon Resource Name (ARN) of the database from which the database snapshot was created.
        @[JSON::Field(key: "fromRelationalDatabaseArn")]
        getter from_relational_database_arn : String?

        # The blueprint ID of the database from which the database snapshot was created. A blueprint describes
        # the major engine version of a database.
        @[JSON::Field(key: "fromRelationalDatabaseBlueprintId")]
        getter from_relational_database_blueprint_id : String?

        # The bundle ID of the database from which the database snapshot was created.
        @[JSON::Field(key: "fromRelationalDatabaseBundleId")]
        getter from_relational_database_bundle_id : String?

        # The name of the source database from which the database snapshot was created.
        @[JSON::Field(key: "fromRelationalDatabaseName")]
        getter from_relational_database_name : String?

        # The Region name and Availability Zone where the database snapshot is located.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the database snapshot.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The size of the disk in GB (for example, 32 ) for the database snapshot.
        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Int32?

        # The state of the database snapshot.
        @[JSON::Field(key: "state")]
        getter state : String?

        # The support code for the database snapshot. Include this code in your email to support when you have
        # questions about a database snapshot in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        # The tag keys and optional values for the resource. For more information about tags in Lightsail, see
        # the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @engine : String? = nil,
          @engine_version : String? = nil,
          @from_relational_database_arn : String? = nil,
          @from_relational_database_blueprint_id : String? = nil,
          @from_relational_database_bundle_id : String? = nil,
          @from_relational_database_name : String? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @size_in_gb : Int32? = nil,
          @state : String? = nil,
          @support_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ReleaseStaticIpRequest
        include JSON::Serializable

        # The name of the static IP to delete.
        @[JSON::Field(key: "staticIpName")]
        getter static_ip_name : String

        def initialize(
          @static_ip_name : String
        )
        end
      end

      struct ReleaseStaticIpResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes the status of a SSL/TLS certificate renewal managed by Amazon Lightsail.
      struct RenewalSummary
        include JSON::Serializable

        # An array of objects that describe the domain validation records of the certificate.
        @[JSON::Field(key: "domainValidationRecords")]
        getter domain_validation_records : Array(Types::DomainValidationRecord)?

        # The renewal status of the certificate. The following renewal status are possible: PendingAutoRenewal
        # - Lightsail is attempting to automatically validate the domain names of the certificate. No further
        # action is required. PendingValidation - Lightsail couldn't automatically validate one or more domain
        # names of the certificate. You must take action to validate these domain names or the certificate
        # won't be renewed. Check to make sure your certificate's domain validation records exist in your
        # domain's DNS, and that your certificate remains in use. Success - All domain names in the
        # certificate are validated, and Lightsail renewed the certificate. No further action is required.
        # Failed - One or more domain names were not validated before the certificate expired, and Lightsail
        # did not renew the certificate. You can request a new certificate using the CreateCertificate action.
        @[JSON::Field(key: "renewalStatus")]
        getter renewal_status : String?

        # The reason for the renewal status of the certificate.
        @[JSON::Field(key: "renewalStatusReason")]
        getter renewal_status_reason : String?

        # The timestamp when the certificate was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @domain_validation_records : Array(Types::DomainValidationRecord)? = nil,
          @renewal_status : String? = nil,
          @renewal_status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      struct ResetDistributionCacheRequest
        include JSON::Serializable

        # The name of the distribution for which to reset cache. Use the GetDistributions action to get a list
        # of distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String?

        def initialize(
          @distribution_name : String? = nil
        )
        end
      end

      struct ResetDistributionCacheResult
        include JSON::Serializable

        # The timestamp of the reset cache request ( 1479734909.17 ) in Unix time format.
        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        # The status of the reset cache request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @create_time : Time? = nil,
          @operation : Types::Operation? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the estimated cost or usage that a budget tracks.
      struct ResourceBudgetEstimate
        include JSON::Serializable

        # The cost estimate for the specified budget.
        @[JSON::Field(key: "costEstimates")]
        getter cost_estimates : Array(Types::CostEstimate)?

        # The estimate end time.
        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        # The type of resource the budget will track.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The estimate start time.
        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @cost_estimates : Array(Types::CostEstimate)? = nil,
          @end_time : Time? = nil,
          @resource_name : String? = nil,
          @resource_type : String? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # Describes the resource location.
      struct ResourceLocation
        include JSON::Serializable

        # The Availability Zone. Follows the format us-east-2a (case-sensitive).
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The Amazon Web Services Region name.
        @[JSON::Field(key: "regionName")]
        getter region_name : String?

        def initialize(
          @availability_zone : String? = nil,
          @region_name : String? = nil
        )
        end
      end

      # Describes an Amazon Lightsail instance that has access to a Lightsail bucket.
      struct ResourceReceivingAccess
        include JSON::Serializable

        # The name of the Lightsail instance.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type (for example, Instance ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes the domain name system (DNS) records to add to your domain's DNS to validate it for an
      # Amazon Lightsail certificate.
      struct ResourceRecord
        include JSON::Serializable

        # The name of the record.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The DNS record type.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The value for the DNS record.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct SendContactMethodVerificationRequest
        include JSON::Serializable

        # The protocol to verify, such as Email or SMS (text messaging).
        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @protocol : String
        )
        end
      end

      struct SendContactMethodVerificationResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # A general service exception.
      struct ServiceException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      # Describes a web-based, remote graphical user interface (GUI), Amazon DCV session. The session is
      # used to access a virtual computer’s operating system or application.
      struct Session
        include JSON::Serializable

        # When true, this Boolean value indicates the primary session for the specified resource.
        @[JSON::Field(key: "isPrimary")]
        getter is_primary : Bool?

        # The session name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The session URL.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @is_primary : Bool? = nil,
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end

      struct SetIpAddressTypeRequest
        include JSON::Serializable

        # The IP address type to set for the specified resource. The possible values are ipv4 for IPv4 only,
        # ipv6 for IPv6 only, and dualstack for IPv4 and IPv6.
        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String

        # The name of the resource for which to set the IP address type.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The resource type. The resource values are Distribution , Instance , and LoadBalancer .
        # Distribution-related APIs are available only in the N. Virginia ( us-east-1 ) Amazon Web Services
        # Region. Set your Amazon Web Services Region configuration to us-east-1 to create, view, or edit
        # distributions.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Required parameter to accept the instance bundle update when changing to, and from, IPv6-only. An
        # instance bundle will change when switching from dual-stack or ipv4 , to ipv6 . It also changes when
        # switching from ipv6 , to dual-stack or ipv4 . You must include this parameter in the command to
        # update the bundle. For example, if you switch from dual-stack to ipv6 , the bundle will be updated,
        # and billing for the IPv6-only instance bundle begins immediately.
        @[JSON::Field(key: "acceptBundleUpdate")]
        getter accept_bundle_update : Bool?

        def initialize(
          @ip_address_type : String,
          @resource_name : String,
          @resource_type : String,
          @accept_bundle_update : Bool? = nil
        )
        end
      end

      struct SetIpAddressTypeResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct SetResourceAccessForBucketRequest
        include JSON::Serializable

        # The access setting. The following access settings are available: allow - Allows access to the bucket
        # and its objects. deny - Denies access to the bucket and its objects. Use this setting to remove
        # access for a resource previously set to allow .
        @[JSON::Field(key: "access")]
        getter access : String

        # The name of the bucket for which to set access to another Lightsail resource.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The name of the Lightsail instance for which to set bucket access. The instance must be in a running
        # or stopped state.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @access : String,
          @bucket_name : String,
          @resource_name : String
        )
        end
      end

      struct SetResourceAccessForBucketResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Returns details about the commands that were run.
      struct SetupExecutionDetails
        include JSON::Serializable

        # The command that was executed.
        @[JSON::Field(key: "command")]
        getter command : String?

        # The timestamp for when the request was run.
        @[JSON::Field(key: "dateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_time : Time?

        # The name of the target resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The text written by the command to stderr.
        @[JSON::Field(key: "standardError")]
        getter standard_error : String?

        # The text written by the command to stdout.
        @[JSON::Field(key: "standardOutput")]
        getter standard_output : String?

        # The status of the SetupInstanceHttps request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The current version of the script..
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @command : String? = nil,
          @date_time : Time? = nil,
          @name : String? = nil,
          @standard_error : String? = nil,
          @standard_output : String? = nil,
          @status : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Returns a list of the commands that were ran on the target resource. The status of each command is
      # also returned.
      struct SetupHistory
        include JSON::Serializable

        # Describes the full details of the request.
        @[JSON::Field(key: "executionDetails")]
        getter execution_details : Array(Types::SetupExecutionDetails)?

        # A GUID that's used to identify the operation.
        @[JSON::Field(key: "operationId")]
        getter operation_id : String?

        # Information about the specified request.
        @[JSON::Field(key: "request")]
        getter request : Types::SetupRequest?

        # The target resource name for the request.
        @[JSON::Field(key: "resource")]
        getter resource : Types::SetupHistoryResource?

        # The status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @execution_details : Array(Types::SetupExecutionDetails)? = nil,
          @operation_id : String? = nil,
          @request : Types::SetupRequest? = nil,
          @resource : Types::SetupHistoryResource? = nil,
          @status : String? = nil
        )
        end
      end

      # The Lightsail resource that SetupHistory was ran on.
      struct SetupHistoryResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lightsail resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The timestamp for when the resource was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the Lightsail resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The Lightsail resource type. For example, Instance .
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct SetupInstanceHttpsRequest
        include JSON::Serializable

        # The certificate authority that issues the SSL/TLS certificate.
        @[JSON::Field(key: "certificateProvider")]
        getter certificate_provider : String

        # The name of the domain and subdomains that were specified for the SSL/TLS certificate.
        @[JSON::Field(key: "domainNames")]
        getter domain_names : Array(String)

        # The contact method for SSL/TLS certificate renewal alerts. You can enter one email address.
        @[JSON::Field(key: "emailAddress")]
        getter email_address : String

        # The name of the Lightsail instance.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @certificate_provider : String,
          @domain_names : Array(String),
          @email_address : String,
          @instance_name : String
        )
        end
      end

      struct SetupInstanceHttpsResult
        include JSON::Serializable

        # The available API operations for SetupInstanceHttps .
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Returns information that was submitted during the SetupInstanceHttps request. Email information is
      # redacted for privacy.
      struct SetupRequest
        include JSON::Serializable

        # The Certificate Authority (CA) that issues the SSL/TLS certificate.
        @[JSON::Field(key: "certificateProvider")]
        getter certificate_provider : String?

        # The name of the domain and subdomains that the SSL/TLS certificate secures.
        @[JSON::Field(key: "domainNames")]
        getter domain_names : Array(String)?

        # The name of the Lightsail instance.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        def initialize(
          @certificate_provider : String? = nil,
          @domain_names : Array(String)? = nil,
          @instance_name : String? = nil
        )
        end
      end

      struct StartGUISessionRequest
        include JSON::Serializable

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct StartGUISessionResult
        include JSON::Serializable

        # The available API operations.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct StartInstanceRequest
        include JSON::Serializable

        # The name of the instance (a virtual private server) to start.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      struct StartInstanceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct StartRelationalDatabaseRequest
        include JSON::Serializable

        # The name of your database to start.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        def initialize(
          @relational_database_name : String
        )
        end
      end

      struct StartRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes a static IP.
      struct StaticIp
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the static IP (
        # arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE ).
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The instance where the static IP is attached ( Amazon_Linux-1GB-Ohio-1 ).
        @[JSON::Field(key: "attachedTo")]
        getter attached_to : String?

        # The timestamp when the static IP was created ( 1479735304.222 ).
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The static IP address.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String?

        # A Boolean value indicating whether the static IP is attached.
        @[JSON::Field(key: "isAttached")]
        getter is_attached : Bool?

        # The region and Availability Zone where the static IP was created.
        @[JSON::Field(key: "location")]
        getter location : Types::ResourceLocation?

        # The name of the static IP ( StaticIP-Ohio-EXAMPLE ).
        @[JSON::Field(key: "name")]
        getter name : String?

        # The resource type (usually StaticIp ).
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The support code. Include this code in your email to support when you have questions about an
        # instance or another resource in Lightsail. This code enables our support team to look up your
        # Lightsail information more easily.
        @[JSON::Field(key: "supportCode")]
        getter support_code : String?

        def initialize(
          @arn : String? = nil,
          @attached_to : String? = nil,
          @created_at : Time? = nil,
          @ip_address : String? = nil,
          @is_attached : Bool? = nil,
          @location : Types::ResourceLocation? = nil,
          @name : String? = nil,
          @resource_type : String? = nil,
          @support_code : String? = nil
        )
        end
      end

      struct StopGUISessionRequest
        include JSON::Serializable

        # The resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct StopGUISessionResult
        include JSON::Serializable

        # The available API operations.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes a request to create or edit the StopInstanceOnIdle add-on. This add-on only applies to
      # Lightsail for Research resources.
      struct StopInstanceOnIdleRequest
        include JSON::Serializable

        # The amount of idle time in minutes after which your virtual computer will automatically stop.
        @[JSON::Field(key: "duration")]
        getter duration : String?

        # The value to compare with the duration.
        @[JSON::Field(key: "threshold")]
        getter threshold : String?

        def initialize(
          @duration : String? = nil,
          @threshold : String? = nil
        )
        end
      end

      struct StopInstanceRequest
        include JSON::Serializable

        # The name of the instance (a virtual private server) to stop.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # When set to True , forces a Lightsail instance that is stuck in a stopping state to stop. Only use
        # the force parameter if your instance is stuck in the stopping state. In any other state, your
        # instance should stop normally without adding this parameter to your API request.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @instance_name : String,
          @force : Bool? = nil
        )
        end
      end

      struct StopInstanceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct StopRelationalDatabaseRequest
        include JSON::Serializable

        # The name of your database to stop.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # The name of your new database snapshot to be created before stopping your database.
        @[JSON::Field(key: "relationalDatabaseSnapshotName")]
        getter relational_database_snapshot_name : String?

        def initialize(
          @relational_database_name : String,
          @relational_database_snapshot_name : String? = nil
        )
        end
      end

      struct StopRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Describes a tag key and optional value assigned to an Amazon Lightsail resource. For more
      # information about tags in Lightsail, see the Amazon Lightsail Developer Guide .
      struct Tag
        include JSON::Serializable

        # The key of the tag. Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in UTF-8,
        # or the following characters: + - = . _ : / @
        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of the tag. Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in
        # UTF-8, or the following characters: + - = . _ : / @
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The name of the resource to which you are adding tags.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The tag key and optional value.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        # The Amazon Resource Name (ARN) of the resource to which you want to add a tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_name : String,
          @tags : Array(Types::Tag),
          @resource_arn : String? = nil
        )
        end
      end

      struct TagResourceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct TestAlarmRequest
        include JSON::Serializable

        # The name of the alarm to test.
        @[JSON::Field(key: "alarmName")]
        getter alarm_name : String

        # The alarm state to test. An alarm has the following possible states that can be tested: ALARM - The
        # metric is outside of the defined threshold. INSUFFICIENT_DATA - The alarm has just started, the
        # metric is not available, or not enough data is available for the metric to determine the alarm
        # state. OK - The metric is within the defined threshold.
        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @alarm_name : String,
          @state : String
        )
        end
      end

      struct TestAlarmResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      # Sets the start date and end date for retrieving a cost estimate. The start date is inclusive, but
      # the end date is exclusive. For example, if start is 2017-01-01 and end is 2017-05-01 , then the cost
      # and usage data is retrieved from 2017-01-01 up to and including 2017-04-30 but not including
      # 2017-05-01 .
      struct TimePeriod
        include JSON::Serializable

        # The end of the time period. The end date is exclusive. For example, if end is 2017-05-01 , Lightsail
        # for Research retrieves cost and usage data from the start date up to, but not including, 2017-05-01
        # .
        @[JSON::Field(key: "end", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end : Time?

        # The beginning of the time period. The start date is inclusive. For example, if start is 2017-01-01 ,
        # Lightsail for Research retrieves cost and usage data starting at 2017-01-01 up to the end date. The
        # start date must be equal to or no later than the current date to avoid a validation error.
        @[JSON::Field(key: "start", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start : Time?

        def initialize(
          @end : Time? = nil,
          @start : Time? = nil
        )
        end
      end

      # Lightsail throws this exception when the user has not been authenticated.
      struct UnauthenticatedException
        include JSON::Serializable

        @[JSON::Field(key: "code")]
        getter code : String?

        @[JSON::Field(key: "docs")]
        getter docs : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        @[JSON::Field(key: "tip")]
        getter tip : String?

        def initialize(
          @code : String? = nil,
          @docs : String? = nil,
          @message : String? = nil,
          @tip : String? = nil
        )
        end
      end

      struct UnpeerVpcRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct UnpeerVpcResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The name of the resource from which you are removing a tag.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The tag keys to delete from the specified resource.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        # The Amazon Resource Name (ARN) of the resource from which you want to remove a tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String?

        def initialize(
          @resource_name : String,
          @tag_keys : Array(String),
          @resource_arn : String? = nil
        )
        end
      end

      struct UntagResourceResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateBucketBundleRequest
        include JSON::Serializable

        # The name of the bucket for which to update the bundle.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The ID of the new bundle to apply to the bucket. Use the GetBucketBundles action to get a list of
        # bundle IDs that you can specify.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String

        def initialize(
          @bucket_name : String,
          @bundle_id : String
        )
        end
      end

      struct UpdateBucketBundleResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateBucketRequest
        include JSON::Serializable

        # The name of the bucket to update.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # An object that describes the access log configuration for the bucket.
        @[JSON::Field(key: "accessLogConfig")]
        getter access_log_config : Types::BucketAccessLogConfig?

        # An object that sets the public accessibility of objects in the specified bucket.
        @[JSON::Field(key: "accessRules")]
        getter access_rules : Types::AccessRules?

        # Sets the cross-origin resource sharing (CORS) configuration for your bucket. If a CORS configuration
        # exists, it is replaced with the specified configuration. For AWS CLI operations, this parameter can
        # also be passed as a file. For more information, see Configuring cross-origin resource sharing (CORS)
        # . CORS information is only returned in a response when you update the CORS policy.
        @[JSON::Field(key: "cors")]
        getter cors : Types::BucketCorsConfig?

        # An array of strings to specify the Amazon Web Services account IDs that can access the bucket. You
        # can give a maximum of 10 Amazon Web Services accounts access to a bucket.
        @[JSON::Field(key: "readonlyAccessAccounts")]
        getter readonly_access_accounts : Array(String)?

        # Specifies whether to enable or suspend versioning of objects in the bucket. The following options
        # can be specified: Enabled - Enables versioning of objects in the specified bucket. Suspended -
        # Suspends versioning of objects in the specified bucket. Existing object versions are retained.
        @[JSON::Field(key: "versioning")]
        getter versioning : String?

        def initialize(
          @bucket_name : String,
          @access_log_config : Types::BucketAccessLogConfig? = nil,
          @access_rules : Types::AccessRules? = nil,
          @cors : Types::BucketCorsConfig? = nil,
          @readonly_access_accounts : Array(String)? = nil,
          @versioning : String? = nil
        )
        end
      end

      struct UpdateBucketResult
        include JSON::Serializable

        # An object that describes the bucket that is updated.
        @[JSON::Field(key: "bucket")]
        getter bucket : Types::Bucket?

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @bucket : Types::Bucket? = nil,
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateContainerServiceRequest
        include JSON::Serializable

        # The name of the container service to update.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # A Boolean value to indicate whether the container service is disabled.
        @[JSON::Field(key: "isDisabled")]
        getter is_disabled : Bool?

        # The power for the container service. The power specifies the amount of memory, vCPUs, and base
        # monthly cost of each node of the container service. The power and scale of a container service makes
        # up its configured capacity. To determine the monthly price of your container service, multiply the
        # base price of the power with the scale (the number of nodes) of the service. Use the
        # GetContainerServicePowers action to view the specifications of each power option.
        @[JSON::Field(key: "power")]
        getter power : String?

        # An object to describe the configuration for the container service to access private container image
        # repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories. For more
        # information, see Configuring access to an Amazon ECR private repository for an Amazon Lightsail
        # container service in the Amazon Lightsail Developer Guide .
        @[JSON::Field(key: "privateRegistryAccess")]
        getter private_registry_access : Types::PrivateRegistryAccessRequest?

        # The public domain names to use with the container service, such as example.com and www.example.com .
        # You can specify up to four public domain names for a container service. The domain names that you
        # specify are used when you create a deployment with a container configured as the public endpoint of
        # your container service. If you don't specify public domain names, then you can use the default
        # domain of the container service. You must create and validate an SSL/TLS certificate before you can
        # use public domain names with your container service. Use the CreateCertificate action to create a
        # certificate for the public domain names you want to use with your container service. You can specify
        # public domain names using a string to array map as shown in the example later on this page.
        @[JSON::Field(key: "publicDomainNames")]
        getter public_domain_names : Hash(String, Array(String))?

        # The scale for the container service. The scale specifies the allocated compute nodes of the
        # container service. The power and scale of a container service makes up its configured capacity. To
        # determine the monthly price of your container service, multiply the base price of the power with the
        # scale (the number of nodes) of the service.
        @[JSON::Field(key: "scale")]
        getter scale : Int32?

        def initialize(
          @service_name : String,
          @is_disabled : Bool? = nil,
          @power : String? = nil,
          @private_registry_access : Types::PrivateRegistryAccessRequest? = nil,
          @public_domain_names : Hash(String, Array(String))? = nil,
          @scale : Int32? = nil
        )
        end
      end

      struct UpdateContainerServiceResult
        include JSON::Serializable

        # An object that describes a container service.
        @[JSON::Field(key: "containerService")]
        getter container_service : Types::ContainerService?

        def initialize(
          @container_service : Types::ContainerService? = nil
        )
        end
      end

      struct UpdateDistributionBundleRequest
        include JSON::Serializable

        # The bundle ID of the new bundle to apply to your distribution. Use the GetDistributionBundles action
        # to get a list of distribution bundle IDs that you can specify.
        @[JSON::Field(key: "bundleId")]
        getter bundle_id : String?

        # The name of the distribution for which to update the bundle. Use the GetDistributions action to get
        # a list of distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String?

        def initialize(
          @bundle_id : String? = nil,
          @distribution_name : String? = nil
        )
        end
      end

      struct UpdateDistributionBundleResult
        include JSON::Serializable

        # An object that describes the result of the action, such as the status of the request, the timestamp
        # of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct UpdateDistributionRequest
        include JSON::Serializable

        # The name of the distribution to update. Use the GetDistributions action to get a list of
        # distribution names that you can specify.
        @[JSON::Field(key: "distributionName")]
        getter distribution_name : String

        # An object that describes the cache behavior settings for the distribution. The cacheBehaviorSettings
        # specified in your UpdateDistributionRequest will replace your distribution's existing settings.
        @[JSON::Field(key: "cacheBehaviorSettings")]
        getter cache_behavior_settings : Types::CacheSettings?

        # An array of objects that describe the per-path cache behavior for the distribution.
        @[JSON::Field(key: "cacheBehaviors")]
        getter cache_behaviors : Array(Types::CacheBehaviorPerPath)?

        # The name of the SSL/TLS certificate that you want to attach to the distribution. Only certificates
        # with a status of ISSUED can be attached to a distribution. Use the GetCertificates action to get a
        # list of certificate names that you can specify.
        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # An object that describes the default cache behavior for the distribution.
        @[JSON::Field(key: "defaultCacheBehavior")]
        getter default_cache_behavior : Types::CacheBehavior?

        # Indicates whether to enable the distribution.
        @[JSON::Field(key: "isEnabled")]
        getter is_enabled : Bool?

        # An object that describes the origin resource for the distribution, such as a Lightsail instance,
        # bucket, or load balancer. The distribution pulls, caches, and serves content from the origin.
        @[JSON::Field(key: "origin")]
        getter origin : Types::InputOrigin?

        # Indicates whether the default SSL/TLS certificate is attached to the distribution. The default value
        # is true . When true , the distribution uses the default domain name such as
        # d111111abcdef8.cloudfront.net . Set this value to false to attach a new certificate to the
        # distribution.
        @[JSON::Field(key: "useDefaultCertificate")]
        getter use_default_certificate : Bool?

        # Use this parameter to update the minimum TLS protocol version for the SSL/TLS certificate that's
        # attached to the distribution.
        @[JSON::Field(key: "viewerMinimumTlsProtocolVersion")]
        getter viewer_minimum_tls_protocol_version : String?

        def initialize(
          @distribution_name : String,
          @cache_behavior_settings : Types::CacheSettings? = nil,
          @cache_behaviors : Array(Types::CacheBehaviorPerPath)? = nil,
          @certificate_name : String? = nil,
          @default_cache_behavior : Types::CacheBehavior? = nil,
          @is_enabled : Bool? = nil,
          @origin : Types::InputOrigin? = nil,
          @use_default_certificate : Bool? = nil,
          @viewer_minimum_tls_protocol_version : String? = nil
        )
        end
      end

      struct UpdateDistributionResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct UpdateDomainEntryRequest
        include JSON::Serializable

        # An array of key-value pairs containing information about the domain entry.
        @[JSON::Field(key: "domainEntry")]
        getter domain_entry : Types::DomainEntry

        # The name of the domain recordset to update.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_entry : Types::DomainEntry,
          @domain_name : String
        )
        end
      end

      struct UpdateDomainEntryResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateInstanceMetadataOptionsRequest
        include JSON::Serializable

        # The name of the instance for which to update metadata parameters.
        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # Enables or disables the HTTP metadata endpoint on your instances. If this parameter is not
        # specified, the existing state is maintained. If you specify a value of disabled , you cannot access
        # your instance metadata.
        @[JSON::Field(key: "httpEndpoint")]
        getter http_endpoint : String?

        # Enables or disables the IPv6 endpoint for the instance metadata service. This setting applies only
        # when the HTTP metadata endpoint is enabled. This parameter is available only for instances in the
        # Europe (Stockholm) Amazon Web Services Region ( eu-north-1 ).
        @[JSON::Field(key: "httpProtocolIpv6")]
        getter http_protocol_ipv6 : String?

        # The desired HTTP PUT response hop limit for instance metadata requests. A larger number means that
        # the instance metadata requests can travel farther. If no parameter is specified, the existing state
        # is maintained.
        @[JSON::Field(key: "httpPutResponseHopLimit")]
        getter http_put_response_hop_limit : Int32?

        # The state of token usage for your instance metadata requests. If the parameter is not specified in
        # the request, the default state is optional . If the state is optional , you can choose whether to
        # retrieve instance metadata with a signed token header on your request. If you retrieve the IAM role
        # credentials without a token, the version 1.0 role credentials are returned. If you retrieve the IAM
        # role credentials by using a valid signed token, the version 2.0 role credentials are returned. If
        # the state is required , you must send a signed token header with all instance metadata retrieval
        # requests. In this state, retrieving the IAM role credential always returns the version 2.0
        # credentials. The version 1.0 credentials are not available.
        @[JSON::Field(key: "httpTokens")]
        getter http_tokens : String?

        def initialize(
          @instance_name : String,
          @http_endpoint : String? = nil,
          @http_protocol_ipv6 : String? = nil,
          @http_put_response_hop_limit : Int32? = nil,
          @http_tokens : String? = nil
        )
        end
      end

      struct UpdateInstanceMetadataOptionsResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end

      struct UpdateLoadBalancerAttributeRequest
        include JSON::Serializable

        # The name of the attribute you want to update.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String

        # The value that you want to specify for the attribute name. The following values are supported
        # depending on what you specify for the attributeName request parameter: If you specify
        # HealthCheckPath for the attributeName request parameter, then the attributeValue request parameter
        # must be the path to ping on the target (for example, /weather/us/wa/seattle ). If you specify
        # SessionStickinessEnabled for the attributeName request parameter, then the attributeValue request
        # parameter must be true to activate session stickiness or false to deactivate session stickiness. If
        # you specify SessionStickiness_LB_CookieDurationSeconds for the attributeName request parameter, then
        # the attributeValue request parameter must be an interger that represents the cookie duration in
        # seconds. If you specify HttpsRedirectionEnabled for the attributeName request parameter, then the
        # attributeValue request parameter must be true to activate HTTP to HTTPS redirection or false to
        # deactivate HTTP to HTTPS redirection. If you specify TlsPolicyName for the attributeName request
        # parameter, then the attributeValue request parameter must be the name of the TLS policy. Use the
        # GetLoadBalancerTlsPolicies action to get a list of TLS policy names that you can specify.
        @[JSON::Field(key: "attributeValue")]
        getter attribute_value : String

        # The name of the load balancer that you want to modify ( my-load-balancer .
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String

        def initialize(
          @attribute_name : String,
          @attribute_value : String,
          @load_balancer_name : String
        )
        end
      end

      struct UpdateLoadBalancerAttributeResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateRelationalDatabaseParametersRequest
        include JSON::Serializable

        # The database parameters to update.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::RelationalDatabaseParameter)

        # The name of your database for which to update parameters.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        def initialize(
          @parameters : Array(Types::RelationalDatabaseParameter),
          @relational_database_name : String
        )
        end
      end

      struct UpdateRelationalDatabaseParametersResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end

      struct UpdateRelationalDatabaseRequest
        include JSON::Serializable

        # The name of your Lightsail database resource to update.
        @[JSON::Field(key: "relationalDatabaseName")]
        getter relational_database_name : String

        # When true , applies changes immediately. When false , applies changes during the preferred
        # maintenance window. Some changes may cause an outage. Default: false
        @[JSON::Field(key: "applyImmediately")]
        getter apply_immediately : Bool?

        # Indicates the certificate that needs to be associated with the database.
        @[JSON::Field(key: "caCertificateIdentifier")]
        getter ca_certificate_identifier : String?

        # When true , disables automated backup retention for your database. Disabling backup retention
        # deletes all automated database backups. Before disabling this, you may want to create a snapshot of
        # your database using the create relational database snapshot operation. Updates are applied during
        # the next maintenance window because this can result in an outage.
        @[JSON::Field(key: "disableBackupRetention")]
        getter disable_backup_retention : Bool?

        # When true , enables automated backup retention for your database. Updates are applied during the
        # next maintenance window because this can result in an outage.
        @[JSON::Field(key: "enableBackupRetention")]
        getter enable_backup_retention : Bool?

        # The password for the master user. The password can include any printable ASCII character except "/",
        # """, or "@". My SQL Constraints: Must contain from 8 to 41 characters. PostgreSQL Constraints: Must
        # contain from 8 to 128 characters.
        @[JSON::Field(key: "masterUserPassword")]
        getter master_user_password : String?

        # The daily time range during which automated backups are created for your database if automated
        # backups are enabled. Constraints: Must be in the hh24:mi-hh24:mi format. Example: 16:00-16:30
        # Specified in Coordinated Universal Time (UTC). Must not conflict with the preferred maintenance
        # window. Must be at least 30 minutes.
        @[JSON::Field(key: "preferredBackupWindow")]
        getter preferred_backup_window : String?

        # The weekly time range during which system maintenance can occur on your database. The default is a
        # 30-minute window selected at random from an 8-hour block of time for each Amazon Web Services
        # Region, occurring on a random day of the week. Constraints: Must be in the ddd:hh24:mi-ddd:hh24:mi
        # format. Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun. Must be at least 30 minutes. Specified in
        # Coordinated Universal Time (UTC). Example: Tue:17:00-Tue:17:30
        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies the accessibility options for your database. A value of true specifies a database that is
        # available to resources outside of your Lightsail account. A value of false specifies a database that
        # is available only to your Lightsail resources in the same region as your database.
        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # This parameter is used to update the major version of the database. Enter the blueprintId for the
        # major version that you want to update to. Use the GetRelationalDatabaseBlueprints action to get a
        # list of available blueprint IDs.
        @[JSON::Field(key: "relationalDatabaseBlueprintId")]
        getter relational_database_blueprint_id : String?

        # When true , the master user password is changed to a new strong password generated by Lightsail. Use
        # the get relational database master user password operation to get the new password.
        @[JSON::Field(key: "rotateMasterUserPassword")]
        getter rotate_master_user_password : Bool?

        def initialize(
          @relational_database_name : String,
          @apply_immediately : Bool? = nil,
          @ca_certificate_identifier : String? = nil,
          @disable_backup_retention : Bool? = nil,
          @enable_backup_retention : Bool? = nil,
          @master_user_password : String? = nil,
          @preferred_backup_window : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @relational_database_blueprint_id : String? = nil,
          @rotate_master_user_password : Bool? = nil
        )
        end
      end

      struct UpdateRelationalDatabaseResult
        include JSON::Serializable

        # An array of objects that describe the result of the action, such as the status of the request, the
        # timestamp of the request, and the resources affected by the request.
        @[JSON::Field(key: "operations")]
        getter operations : Array(Types::Operation)?

        def initialize(
          @operations : Array(Types::Operation)? = nil
        )
        end
      end
    end
  end
end
