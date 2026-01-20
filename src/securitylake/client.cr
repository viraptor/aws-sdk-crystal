module Aws
  module SecurityLake
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Adds a natively supported Amazon Web Services service as an Amazon Security Lake source. Enables
      # source types for member accounts in required Amazon Web Services Regions, based on the parameters
      # you specify. You can choose any source type in any Region for either accounts that are part of a
      # trusted organization or standalone accounts. Once you add an Amazon Web Services service as a
      # source, Security Lake starts collecting logs and events from it. You can use this API only to enable
      # natively supported Amazon Web Services services as a source. Use CreateCustomLogSource to enable
      # data collection from a custom source.

      def create_aws_log_source(
        sources : Array(Types::AwsLogSourceConfiguration)
      ) : Protocol::Request
        input = Types::CreateAwsLogSourceRequest.new(sources: sources)
        create_aws_log_source(input)
      end

      def create_aws_log_source(input : Types::CreateAwsLogSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AWS_LOG_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a third-party custom source in Amazon Security Lake, from the Amazon Web Services Region where
      # you want to create a custom source. Security Lake can collect logs and events from third-party
      # custom sources. After creating the appropriate IAM role to invoke Glue crawler, use this API to add
      # a custom source name in Security Lake. This operation creates a partition in the Amazon S3 bucket
      # for Security Lake as the target location for log files from the custom source. In addition, this
      # operation also creates an associated Glue table and an Glue crawler.

      def create_custom_log_source(
        configuration : Types::CustomLogSourceConfiguration,
        source_name : String,
        event_classes : Array(String)? = nil,
        source_version : String? = nil
      ) : Protocol::Request
        input = Types::CreateCustomLogSourceRequest.new(configuration: configuration, source_name: source_name, event_classes: event_classes, source_version: source_version)
        create_custom_log_source(input)
      end

      def create_custom_log_source(input : Types::CreateCustomLogSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_LOG_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initializes an Amazon Security Lake instance with the provided (or default) configuration. You can
      # enable Security Lake in Amazon Web Services Regions with customized settings before enabling log
      # collection in Regions. To specify particular Regions, configure these Regions using the
      # configurations parameter. If you have already enabled Security Lake in a Region when you call this
      # command, the command will update the Region if you provide new configuration parameters. If you have
      # not already enabled Security Lake in the Region when you call this API, it will set up the data lake
      # in the Region with the specified configurations. When you enable Security Lake, it starts ingesting
      # security data after the CreateAwsLogSource call and after you create subscribers using the
      # CreateSubscriber API. This includes ingesting security data from sources, storing data, and making
      # data accessible to subscribers. Security Lake also enables all the existing settings and resources
      # that it stores or maintains for your Amazon Web Services account in the current Region, including
      # security log and event data. For more information, see the Amazon Security Lake User Guide .

      def create_data_lake(
        configurations : Array(Types::DataLakeConfiguration),
        meta_store_manager_role_arn : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDataLakeRequest.new(configurations: configurations, meta_store_manager_role_arn: meta_store_manager_role_arn, tags: tags)
        create_data_lake(input)
      end

      def create_data_lake(input : Types::CreateDataLakeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_LAKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the specified notification subscription in Amazon Security Lake for the organization you
      # specify. The notification subscription is created for exceptions that cannot be resolved by Security
      # Lake automatically.

      def create_data_lake_exception_subscription(
        notification_endpoint : String,
        subscription_protocol : String,
        exception_time_to_live : Int64? = nil
      ) : Protocol::Request
        input = Types::CreateDataLakeExceptionSubscriptionRequest.new(notification_endpoint: notification_endpoint, subscription_protocol: subscription_protocol, exception_time_to_live: exception_time_to_live)
        create_data_lake_exception_subscription(input)
      end

      def create_data_lake_exception_subscription(input : Types::CreateDataLakeExceptionSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_LAKE_EXCEPTION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Automatically enables Amazon Security Lake for new member accounts in your organization. Security
      # Lake is not automatically enabled for any existing member accounts in your organization. This
      # operation merges the new data lake organization configuration with the existing configuration for
      # Security Lake in your organization. If you want to create a new data lake organization
      # configuration, you must delete the existing one using DeleteDataLakeOrganizationConfiguration .

      def create_data_lake_organization_configuration(
        auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)? = nil
      ) : Protocol::Request
        input = Types::CreateDataLakeOrganizationConfigurationRequest.new(auto_enable_new_account: auto_enable_new_account)
        create_data_lake_organization_configuration(input)
      end

      def create_data_lake_organization_configuration(input : Types::CreateDataLakeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_LAKE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a subscriber for accounts that are already enabled in Amazon Security Lake. You can create a
      # subscriber with access to data in the current Amazon Web Services Region.

      def create_subscriber(
        sources : Array(Types::LogSourceResource),
        subscriber_identity : Types::AwsIdentity,
        subscriber_name : String,
        access_types : Array(String)? = nil,
        subscriber_description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriberRequest.new(sources: sources, subscriber_identity: subscriber_identity, subscriber_name: subscriber_name, access_types: access_types, subscriber_description: subscriber_description, tags: tags)
        create_subscriber(input)
      end

      def create_subscriber(input : Types::CreateSubscriberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Notifies the subscriber when new data is written to the data lake for the sources that the
      # subscriber consumes in Security Lake. You can create only one subscriber notification per
      # subscriber.

      def create_subscriber_notification(
        configuration : Types::NotificationConfiguration,
        subscriber_id : String
      ) : Protocol::Request
        input = Types::CreateSubscriberNotificationRequest.new(configuration: configuration, subscriber_id: subscriber_id)
        create_subscriber_notification(input)
      end

      def create_subscriber_notification(input : Types::CreateSubscriberNotificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIBER_NOTIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a natively supported Amazon Web Services service as an Amazon Security Lake source. You can
      # remove a source for one or more Regions. When you remove the source, Security Lake stops collecting
      # data from that source in the specified Regions and accounts, and subscribers can no longer consume
      # new data from the source. However, subscribers can still consume data that Security Lake collected
      # from the source before removal. You can choose any source type in any Amazon Web Services Region for
      # either accounts that are part of a trusted organization or standalone accounts.

      def delete_aws_log_source(
        sources : Array(Types::AwsLogSourceConfiguration)
      ) : Protocol::Request
        input = Types::DeleteAwsLogSourceRequest.new(sources: sources)
        delete_aws_log_source(input)
      end

      def delete_aws_log_source(input : Types::DeleteAwsLogSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AWS_LOG_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a custom log source from Amazon Security Lake, to stop sending data from the custom source
      # to Security Lake.

      def delete_custom_log_source(
        source_name : String,
        source_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteCustomLogSourceRequest.new(source_name: source_name, source_version: source_version)
        delete_custom_log_source(input)
      end

      def delete_custom_log_source(input : Types::DeleteCustomLogSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_LOG_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you disable Amazon Security Lake from your account, Security Lake is disabled in all Amazon Web
      # Services Regions and it stops collecting data from your sources. Also, this API automatically takes
      # steps to remove the account from Security Lake. However, Security Lake retains all of your existing
      # settings and the resources that it created in your Amazon Web Services account in the current Amazon
      # Web Services Region. The DeleteDataLake operation does not delete the data that is stored in your
      # Amazon S3 bucket, which is owned by your Amazon Web Services account. For more information, see the
      # Amazon Security Lake User Guide .

      def delete_data_lake(
        regions : Array(String)
      ) : Protocol::Request
        input = Types::DeleteDataLakeRequest.new(regions: regions)
        delete_data_lake(input)
      end

      def delete_data_lake(input : Types::DeleteDataLakeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_LAKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified notification subscription in Amazon Security Lake for the organization you
      # specify.

      def delete_data_lake_exception_subscription : Protocol::Request
        input = Types::DeleteDataLakeExceptionSubscriptionRequest.new
        delete_data_lake_exception_subscription(input)
      end

      def delete_data_lake_exception_subscription(input : Types::DeleteDataLakeExceptionSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_LAKE_EXCEPTION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Turns off automatic enablement of Amazon Security Lake for member accounts that are added to an
      # organization in Organizations. Only the delegated Security Lake administrator for an organization
      # can perform this operation. If the delegated Security Lake administrator performs this operation,
      # new member accounts won't automatically contribute data to the data lake.

      def delete_data_lake_organization_configuration(
        auto_enable_new_account : Array(Types::DataLakeAutoEnableNewAccountConfiguration)? = nil
      ) : Protocol::Request
        input = Types::DeleteDataLakeOrganizationConfigurationRequest.new(auto_enable_new_account: auto_enable_new_account)
        delete_data_lake_organization_configuration(input)
      end

      def delete_data_lake_organization_configuration(input : Types::DeleteDataLakeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_LAKE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the subscription permission and all notification settings for accounts that are already
      # enabled in Amazon Security Lake. When you run DeleteSubscriber , the subscriber will no longer
      # consume data from Security Lake and the subscriber is removed. This operation deletes the subscriber
      # and removes access to data in the current Amazon Web Services Region.

      def delete_subscriber(
        subscriber_id : String
      ) : Protocol::Request
        input = Types::DeleteSubscriberRequest.new(subscriber_id: subscriber_id)
        delete_subscriber(input)
      end

      def delete_subscriber(input : Types::DeleteSubscriberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified subscription notification in Amazon Security Lake for the organization you
      # specify.

      def delete_subscriber_notification(
        subscriber_id : String
      ) : Protocol::Request
        input = Types::DeleteSubscriberNotificationRequest.new(subscriber_id: subscriber_id)
        delete_subscriber_notification(input)
      end

      def delete_subscriber_notification(input : Types::DeleteSubscriberNotificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIBER_NOTIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Amazon Security Lake delegated administrator account for the organization. This API can
      # only be called by the organization management account. The organization management account cannot be
      # the delegated administrator account.

      def deregister_data_lake_delegated_administrator : Protocol::Request
        input = Types::DeregisterDataLakeDelegatedAdministratorRequest.new
        deregister_data_lake_delegated_administrator(input)
      end

      def deregister_data_lake_delegated_administrator(input : Types::DeregisterDataLakeDelegatedAdministratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_DATA_LAKE_DELEGATED_ADMINISTRATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the protocol and endpoint that were provided when subscribing to Amazon SNS topics for
      # exception notifications.

      def get_data_lake_exception_subscription : Protocol::Request
        input = Types::GetDataLakeExceptionSubscriptionRequest.new
        get_data_lake_exception_subscription(input)
      end

      def get_data_lake_exception_subscription(input : Types::GetDataLakeExceptionSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_EXCEPTION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the configuration that will be automatically set up for accounts added to the organization
      # after the organization has onboarded to Amazon Security Lake. This API does not take input
      # parameters.

      def get_data_lake_organization_configuration : Protocol::Request
        input = Types::GetDataLakeOrganizationConfigurationRequest.new
        get_data_lake_organization_configuration(input)
      end

      def get_data_lake_organization_configuration(input : Types::GetDataLakeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a snapshot of the current Region, including whether Amazon Security Lake is enabled for
      # those accounts and which sources Security Lake is collecting data from.

      def get_data_lake_sources(
        accounts : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDataLakeSourcesRequest.new(accounts: accounts, max_results: max_results, next_token: next_token)
        get_data_lake_sources(input)
      end

      def get_data_lake_sources(input : Types::GetDataLakeSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the subscription information for the specified subscription ID. You can get information
      # about a specific subscriber.

      def get_subscriber(
        subscriber_id : String
      ) : Protocol::Request
        input = Types::GetSubscriberRequest.new(subscriber_id: subscriber_id)
        get_subscriber(input)
      end

      def get_subscriber(input : Types::GetSubscriberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Security Lake exceptions that you can use to find the source of problems and fix
      # them.

      def list_data_lake_exceptions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListDataLakeExceptionsRequest.new(max_results: max_results, next_token: next_token, regions: regions)
        list_data_lake_exceptions(input)
      end

      def list_data_lake_exceptions(input : Types::ListDataLakeExceptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_LAKE_EXCEPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the Amazon Security Lake configuration object for the specified Amazon Web Services
      # Regions. You can use this operation to determine whether Security Lake is enabled for a Region.

      def list_data_lakes(
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListDataLakesRequest.new(regions: regions)
        list_data_lakes(input)
      end

      def list_data_lakes(input : Types::ListDataLakesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_LAKES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the log sources.

      def list_log_sources(
        accounts : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        regions : Array(String)? = nil,
        sources : Array(Types::LogSourceResource)? = nil
      ) : Protocol::Request
        input = Types::ListLogSourcesRequest.new(accounts: accounts, max_results: max_results, next_token: next_token, regions: regions, sources: sources)
        list_log_sources(input)
      end

      def list_log_sources(input : Types::ListLogSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LOG_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all subscribers for the specific Amazon Security Lake account ID. You can retrieve a list of
      # subscriptions associated with a specific organization or Amazon Web Services account.

      def list_subscribers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscribersRequest.new(max_results: max_results, next_token: next_token)
        list_subscribers(input)
      end

      def list_subscribers(input : Types::ListSubscribersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the tags (keys and values) that are associated with an Amazon Security Lake resource: a
      # subscriber, or the data lake configuration for your Amazon Web Services account in a particular
      # Amazon Web Services Region.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates the Amazon Security Lake delegated administrator account for the organization. This API
      # can only be called by the organization management account. The organization management account
      # cannot be the delegated administrator account.

      def register_data_lake_delegated_administrator(
        account_id : String
      ) : Protocol::Request
        input = Types::RegisterDataLakeDelegatedAdministratorRequest.new(account_id: account_id)
        register_data_lake_delegated_administrator(input)
      end

      def register_data_lake_delegated_administrator(input : Types::RegisterDataLakeDelegatedAdministratorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_DATA_LAKE_DELEGATED_ADMINISTRATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates one or more tags that are associated with an Amazon Security Lake resource: a
      # subscriber, or the data lake configuration for your Amazon Web Services account in a particular
      # Amazon Web Services Region. A tag is a label that you can define and associate with Amazon Web
      # Services resources. Each tag consists of a required tag key and an associated tag value . A tag key
      # is a general label that acts as a category for a more specific tag value. A tag value acts as a
      # descriptor for a tag key. Tags can help you identify, categorize, and manage resources in different
      # ways, such as by owner, environment, or other criteria. For more information, see Tagging Amazon
      # Security Lake resources in the Amazon Security Lake User Guide .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags (keys and values) from an Amazon Security Lake resource: a subscriber, or
      # the data lake configuration for your Amazon Web Services account in a particular Amazon Web Services
      # Region.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # You can use UpdateDataLake to specify where to store your security data, how it should be encrypted
      # at rest and for how long. You can add a Rollup Region to consolidate data from multiple Amazon Web
      # Services Regions, replace default encryption (SSE-S3) with Customer Manged Key , or specify
      # transition and expiration actions through storage Lifecycle management . The UpdateDataLake API
      # works as an "upsert" operation that performs an insert if the specified item or record does not
      # exist, or an update if it already exists. Security Lake securely stores your data at rest using
      # Amazon Web Services encryption solutions. For more details, see Data protection in Amazon Security
      # Lake . For example, omitting the key encryptionConfiguration from a Region that is included in an
      # update call that currently uses KMS will leave that Region's KMS key in place, but specifying
      # encryptionConfiguration: {kmsKeyId: 'S3_MANAGED_KEY'} for that same Region will reset the key to
      # S3-managed . For more details about lifecycle management and how to update retention settings for
      # one or more Regions after enabling Security Lake, see the Amazon Security Lake User Guide .

      def update_data_lake(
        configurations : Array(Types::DataLakeConfiguration),
        meta_store_manager_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataLakeRequest.new(configurations: configurations, meta_store_manager_role_arn: meta_store_manager_role_arn)
        update_data_lake(input)
      end

      def update_data_lake(input : Types::UpdateDataLakeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_LAKE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified notification subscription in Amazon Security Lake for the organization you
      # specify.

      def update_data_lake_exception_subscription(
        notification_endpoint : String,
        subscription_protocol : String,
        exception_time_to_live : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateDataLakeExceptionSubscriptionRequest.new(notification_endpoint: notification_endpoint, subscription_protocol: subscription_protocol, exception_time_to_live: exception_time_to_live)
        update_data_lake_exception_subscription(input)
      end

      def update_data_lake_exception_subscription(input : Types::UpdateDataLakeExceptionSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_LAKE_EXCEPTION_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing subscription for the given Amazon Security Lake account ID. You can update a
      # subscriber by changing the sources that the subscriber consumes data from.

      def update_subscriber(
        subscriber_id : String,
        sources : Array(Types::LogSourceResource)? = nil,
        subscriber_description : String? = nil,
        subscriber_identity : Types::AwsIdentity? = nil,
        subscriber_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSubscriberRequest.new(subscriber_id: subscriber_id, sources: sources, subscriber_description: subscriber_description, subscriber_identity: subscriber_identity, subscriber_name: subscriber_name)
        update_subscriber(input)
      end

      def update_subscriber(input : Types::UpdateSubscriberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing notification method for the subscription (SQS or HTTPs endpoint) or switches the
      # notification subscription endpoint for a subscriber.

      def update_subscriber_notification(
        configuration : Types::NotificationConfiguration,
        subscriber_id : String
      ) : Protocol::Request
        input = Types::UpdateSubscriberNotificationRequest.new(configuration: configuration, subscriber_id: subscriber_id)
        update_subscriber_notification(input)
      end

      def update_subscriber_notification(input : Types::UpdateSubscriberNotificationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIBER_NOTIFICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
