require "json"

module AwsSdk
  module LicenseManagerLinuxSubscriptions
    module Types


      struct DeregisterSubscriptionProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the subscription provider resource to deregister.

        @[JSON::Field(key: "SubscriptionProviderArn")]
        getter subscription_provider_arn : String

        def initialize(
          @subscription_provider_arn : String
        )
        end
      end


      struct DeregisterSubscriptionProviderResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A filter object that is used to return more specific results from a describe operation. Filters can
      # be used to match a set of resources by specific criteria.

      struct Filter
        include JSON::Serializable

        # The type of name to filter by.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An operator for filtering results.

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # One or more values for the name to filter by.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @operator : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end


      struct GetRegisteredSubscriptionProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the BYOL registration resource to get details for.

        @[JSON::Field(key: "SubscriptionProviderArn")]
        getter subscription_provider_arn : String

        def initialize(
          @subscription_provider_arn : String
        )
        end
      end


      struct GetRegisteredSubscriptionProviderResponse
        include JSON::Serializable

        # The timestamp from the last time License Manager retrieved subscription details from your registered
        # third-party Linux subscription provider.

        @[JSON::Field(key: "LastSuccessfulDataRetrievalTime")]
        getter last_successful_data_retrieval_time : String?

        # The Amazon Resource Name (ARN) of the third-party access secret stored in Secrets Manager for the
        # BYOL registration resource specified in the request.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The Amazon Resource Name (ARN) for the BYOL registration resource specified in the request.

        @[JSON::Field(key: "SubscriptionProviderArn")]
        getter subscription_provider_arn : String?

        # The subscription provider for the BYOL registration resource specified in the request.

        @[JSON::Field(key: "SubscriptionProviderSource")]
        getter subscription_provider_source : String?

        # The status of the Linux subscription provider access token from the last successful subscription
        # data request.

        @[JSON::Field(key: "SubscriptionProviderStatus")]
        getter subscription_provider_status : String?

        # The detailed message from your subscription provider token status.

        @[JSON::Field(key: "SubscriptionProviderStatusMessage")]
        getter subscription_provider_status_message : String?

        def initialize(
          @last_successful_data_retrieval_time : String? = nil,
          @secret_arn : String? = nil,
          @subscription_provider_arn : String? = nil,
          @subscription_provider_source : String? = nil,
          @subscription_provider_status : String? = nil,
          @subscription_provider_status_message : String? = nil
        )
        end
      end


      struct GetServiceSettingsRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetServiceSettingsResponse
        include JSON::Serializable

        # The Region in which License Manager displays the aggregated data for Linux subscriptions.

        @[JSON::Field(key: "HomeRegions")]
        getter home_regions : Array(String)?

        # Lists if discovery has been enabled for Linux subscriptions.

        @[JSON::Field(key: "LinuxSubscriptionsDiscovery")]
        getter linux_subscriptions_discovery : String?

        # Lists the settings defined for Linux subscriptions discovery. The settings include if Organizations
        # integration has been enabled, and which Regions data will be aggregated from.

        @[JSON::Field(key: "LinuxSubscriptionsDiscoverySettings")]
        getter linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings?

        # Indicates the status of Linux subscriptions settings being applied.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message which details the Linux subscriptions service settings current status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : Hash(String, String)?

        def initialize(
          @home_regions : Array(String)? = nil,
          @linux_subscriptions_discovery : String? = nil,
          @linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings? = nil,
          @status : String? = nil,
          @status_message : Hash(String, String)? = nil
        )
        end
      end

      # Details discovered information about a running instance using Linux subscriptions.

      struct Instance
        include JSON::Serializable

        # The account ID which owns the instance.

        @[JSON::Field(key: "AccountID")]
        getter account_id : String?

        # The AMI ID used to launch the instance.

        @[JSON::Field(key: "AmiId")]
        getter ami_id : String?

        # Indicates that you have two different license subscriptions for the same software on your instance.

        @[JSON::Field(key: "DualSubscription")]
        getter dual_subscription : String?

        # The instance ID of the resource.

        @[JSON::Field(key: "InstanceID")]
        getter instance_id : String?

        # The instance type of the resource.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The time in which the last discovery updated the instance details.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : String?

        # The operating system software version that runs on your instance.

        @[JSON::Field(key: "OsVersion")]
        getter os_version : String?

        # The product code for the instance. For more information, see Usage operation values in the License
        # Manager User Guide .

        @[JSON::Field(key: "ProductCode")]
        getter product_code : Array(String)?

        # The Region the instance is running in.

        @[JSON::Field(key: "Region")]
        getter region : String?

        # Indicates that your instance uses a BYOL license subscription from a third-party Linux subscription
        # provider that you've registered with License Manager.

        @[JSON::Field(key: "RegisteredWithSubscriptionProvider")]
        getter registered_with_subscription_provider : String?

        # The status of the instance.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the license subscription that the instance uses.

        @[JSON::Field(key: "SubscriptionName")]
        getter subscription_name : String?

        # The timestamp when you registered the third-party Linux subscription provider for the subscription
        # that the instance uses.

        @[JSON::Field(key: "SubscriptionProviderCreateTime")]
        getter subscription_provider_create_time : String?

        # The timestamp from the last time that the instance synced with the registered third-party Linux
        # subscription provider.

        @[JSON::Field(key: "SubscriptionProviderUpdateTime")]
        getter subscription_provider_update_time : String?

        # The usage operation of the instance. For more information, see For more information, see Usage
        # operation values in the License Manager User Guide .

        @[JSON::Field(key: "UsageOperation")]
        getter usage_operation : String?

        def initialize(
          @account_id : String? = nil,
          @ami_id : String? = nil,
          @dual_subscription : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil,
          @last_updated_time : String? = nil,
          @os_version : String? = nil,
          @product_code : Array(String)? = nil,
          @region : String? = nil,
          @registered_with_subscription_provider : String? = nil,
          @status : String? = nil,
          @subscription_name : String? = nil,
          @subscription_provider_create_time : String? = nil,
          @subscription_provider_update_time : String? = nil,
          @usage_operation : String? = nil
        )
        end
      end

      # An exception occurred with the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Lists the settings defined for discovering Linux subscriptions.

      struct LinuxSubscriptionsDiscoverySettings
        include JSON::Serializable

        # Details if you have enabled resource discovery across your accounts in Organizations.

        @[JSON::Field(key: "OrganizationIntegration")]
        getter organization_integration : String

        # The Regions in which to discover data for Linux subscriptions.

        @[JSON::Field(key: "SourceRegions")]
        getter source_regions : Array(String)

        def initialize(
          @organization_integration : String,
          @source_regions : Array(String)
        )
        end
      end

      # NextToken length limit is half of ddb accepted limit. Increase this limit if parameters in request
      # increases.

      struct ListLinuxSubscriptionInstancesRequest
        include JSON::Serializable

        # An array of structures that you can use to filter the results by your specified criteria. For
        # example, you can specify Region in the Name , with the contains operator to list all subscriptions
        # that match a partial string in the Value , such as us-west . For each filter, you can specify one of
        # the following values for the Name key to streamline results: AccountID AmiID DualSubscription
        # InstanceID InstanceType ProductCode Region Status UsageOperation For each filter, you can use one of
        # the following Operator values to define the behavior of the filter: contains equals Notequal

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum items to return in a request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLinuxSubscriptionInstancesResponse
        include JSON::Serializable

        # An array that contains instance objects.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @instances : Array(Types::Instance)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # NextToken length limit is half of ddb accepted limit. Increase this limit if parameters in request
      # increases.

      struct ListLinuxSubscriptionsRequest
        include JSON::Serializable

        # An array of structures that you can use to filter the results to those that match one or more sets
        # of key-value pairs that you specify. For example, you can filter by the name of Subscription with an
        # optional operator to see subscriptions that match, partially match, or don't match a certain
        # subscription's name. The valid names for this filter are: Subscription The valid Operators for this
        # filter are: contains equals Notequal

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        # The maximum items to return in a request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLinuxSubscriptionsResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains subscription objects.

        @[JSON::Field(key: "Subscriptions")]
        getter subscriptions : Array(Types::Subscription)?

        def initialize(
          @next_token : String? = nil,
          @subscriptions : Array(Types::Subscription)? = nil
        )
        end
      end


      struct ListRegisteredSubscriptionProvidersRequest
        include JSON::Serializable

        # The maximum items to return in a request.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to specify where to start paginating. This is the nextToken from a previously truncated
        # response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # To filter your results, specify which subscription providers to return in the list.

        @[JSON::Field(key: "SubscriptionProviderSources")]
        getter subscription_provider_sources : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @subscription_provider_sources : Array(String)? = nil
        )
        end
      end


      struct ListRegisteredSubscriptionProvidersResponse
        include JSON::Serializable

        # The next token used for paginated responses. When this field isn't empty, there are additional
        # elements that the service hasn't included in this request. Use this token with the next request to
        # retrieve additional objects.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of BYOL registration resources that fit the criteria you specified in the request.

        @[JSON::Field(key: "RegisteredSubscriptionProviders")]
        getter registered_subscription_providers : Array(Types::RegisteredSubscriptionProvider)?

        def initialize(
          @next_token : String? = nil,
          @registered_subscription_providers : Array(Types::RegisteredSubscriptionProvider)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to list metadata tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The metadata tags for the requested resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterSubscriptionProviderRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret where you've stored your subscription provider's access
        # token. For RHEL subscriptions managed through the Red Hat Subscription Manager (RHSM), the secret
        # contains your Red Hat Offline token.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The supported Linux subscription provider to register.

        @[JSON::Field(key: "SubscriptionProviderSource")]
        getter subscription_provider_source : String

        # The metadata tags to assign to your registered Linux subscription provider resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @secret_arn : String,
          @subscription_provider_source : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegisterSubscriptionProviderResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Linux subscription provider resource that you registered.

        @[JSON::Field(key: "SubscriptionProviderArn")]
        getter subscription_provider_arn : String?

        # The Linux subscription provider that you registered.

        @[JSON::Field(key: "SubscriptionProviderSource")]
        getter subscription_provider_source : String?

        # Indicates the status of the registration action for the Linux subscription provider that you
        # requested.

        @[JSON::Field(key: "SubscriptionProviderStatus")]
        getter subscription_provider_status : String?

        def initialize(
          @subscription_provider_arn : String? = nil,
          @subscription_provider_source : String? = nil,
          @subscription_provider_status : String? = nil
        )
        end
      end

      # A third-party provider for operating system (OS) platform software and license subscriptions, such
      # as Red Hat. When you register a third-party Linux subscription provider, License Manager can get
      # subscription data from the registered provider.

      struct RegisteredSubscriptionProvider
        include JSON::Serializable

        # The timestamp from the last time that License Manager accessed third-party subscription data for
        # your account from your registered Linux subscription provider.

        @[JSON::Field(key: "LastSuccessfulDataRetrievalTime")]
        getter last_successful_data_retrieval_time : String?

        # The Amazon Resource Name (ARN) of the Secrets Manager secret that stores your registered Linux
        # subscription provider access token. For RHEL account subscriptions, this is the offline token.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The Amazon Resource Name (ARN) of the Linux subscription provider resource that you registered.

        @[JSON::Field(key: "SubscriptionProviderArn")]
        getter subscription_provider_arn : String?

        # A supported third-party Linux subscription provider. License Manager currently supports Red Hat
        # subscriptions.

        @[JSON::Field(key: "SubscriptionProviderSource")]
        getter subscription_provider_source : String?

        # Indicates the status of your registered Linux subscription provider access token from the last time
        # License Manager retrieved subscription data. For RHEL account subscriptions, this is the status of
        # the offline token.

        @[JSON::Field(key: "SubscriptionProviderStatus")]
        getter subscription_provider_status : String?

        # A detailed message that's associated with your BYOL subscription provider token status.

        @[JSON::Field(key: "SubscriptionProviderStatusMessage")]
        getter subscription_provider_status_message : String?

        def initialize(
          @last_successful_data_retrieval_time : String? = nil,
          @secret_arn : String? = nil,
          @subscription_provider_arn : String? = nil,
          @subscription_provider_source : String? = nil,
          @subscription_provider_status : String? = nil,
          @subscription_provider_status_message : String? = nil
        )
        end
      end

      # Unable to find the requested Amazon Web Services resource.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object which details a discovered Linux subscription.

      struct Subscription
        include JSON::Serializable

        # The total amount of running instances using this subscription.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int64?

        # The name of the subscription.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of subscription. The type can be subscription-included with Amazon EC2, Bring Your Own
        # Subscription model (BYOS), or from the Amazon Web Services Marketplace. Certain subscriptions may
        # use licensing from the Amazon Web Services Marketplace as well as OS licensing from Amazon EC2 or
        # BYOS.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @instance_count : Int64? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services resource to which to add the specified
        # metadata tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The metadata tags to assign to the Amazon Web Services resource. Tags are formatted as key value
        # pairs.

        @[JSON::Field(key: "tags")]
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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon Web Services resource to remove the metadata tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of metadata tag keys to remove from the requested resource.

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


      struct UpdateServiceSettingsRequest
        include JSON::Serializable

        # Describes if the discovery of Linux subscriptions is enabled.

        @[JSON::Field(key: "LinuxSubscriptionsDiscovery")]
        getter linux_subscriptions_discovery : String

        # The settings defined for Linux subscriptions discovery. The settings include if Organizations
        # integration has been enabled, and which Regions data will be aggregated from.

        @[JSON::Field(key: "LinuxSubscriptionsDiscoverySettings")]
        getter linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings

        # Describes if updates are allowed to the service settings for Linux subscriptions. If you allow
        # updates, you can aggregate Linux subscription data in more than one home Region.

        @[JSON::Field(key: "AllowUpdate")]
        getter allow_update : Bool?

        def initialize(
          @linux_subscriptions_discovery : String,
          @linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings,
          @allow_update : Bool? = nil
        )
        end
      end


      struct UpdateServiceSettingsResponse
        include JSON::Serializable

        # The Region in which License Manager displays the aggregated data for Linux subscriptions.

        @[JSON::Field(key: "HomeRegions")]
        getter home_regions : Array(String)?

        # Lists if discovery has been enabled for Linux subscriptions.

        @[JSON::Field(key: "LinuxSubscriptionsDiscovery")]
        getter linux_subscriptions_discovery : String?

        # The settings defined for Linux subscriptions discovery. The settings include if Organizations
        # integration has been enabled, and which Regions data will be aggregated from.

        @[JSON::Field(key: "LinuxSubscriptionsDiscoverySettings")]
        getter linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings?

        # Indicates the status of Linux subscriptions settings being applied.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message which details the Linux subscriptions service settings current status.

        @[JSON::Field(key: "StatusMessage")]
        getter status_message : Hash(String, String)?

        def initialize(
          @home_regions : Array(String)? = nil,
          @linux_subscriptions_discovery : String? = nil,
          @linux_subscriptions_discovery_settings : Types::LinuxSubscriptionsDiscoverySettings? = nil,
          @status : String? = nil,
          @status_message : Hash(String, String)? = nil
        )
        end
      end

      # The provided input is not valid. Try your request again.

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
