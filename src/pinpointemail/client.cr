module Aws
  module PinpointEmail
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

      # Create a configuration set. Configuration sets are groups of rules that you can apply to the emails
      # you send using Amazon Pinpoint. You apply a configuration set to an email by including a reference
      # to the configuration set in the headers of the email. When you apply a configuration set to an
      # email, all of the rules in that configuration set are applied to the email.

      def create_configuration_set(
        configuration_set_name : String,
        delivery_options : Types::DeliveryOptions? = nil,
        reputation_options : Types::ReputationOptions? = nil,
        sending_options : Types::SendingOptions? = nil,
        tags : Array(Types::Tag)? = nil,
        tracking_options : Types::TrackingOptions? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationSetRequest.new(configuration_set_name: configuration_set_name, delivery_options: delivery_options, reputation_options: reputation_options, sending_options: sending_options, tags: tags, tracking_options: tracking_options)
        create_configuration_set(input)
      end

      def create_configuration_set(input : Types::CreateConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an event destination. In Amazon Pinpoint, events include message sends, deliveries, opens,
      # clicks, bounces, and complaints. Event destinations are places that you can send information about
      # these events to. For example, you can send event data to Amazon SNS to receive notifications when
      # you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to
      # Amazon S3 for long-term storage. A single configuration set can include more than one event
      # destination.

      def create_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestinationDefinition,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::CreateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination, event_destination_name: event_destination_name)
        create_configuration_set_event_destination(input)
      end

      def create_configuration_set_event_destination(input : Types::CreateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses
      # that are associated with your Amazon Pinpoint account. You can associate a pool with a configuration
      # set. When you send an email that uses that configuration set, Amazon Pinpoint sends it using only
      # the IP addresses in the associated pool.

      def create_dedicated_ip_pool(
        pool_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDedicatedIpPoolRequest.new(pool_name: pool_name, tags: tags)
        create_dedicated_ip_pool(input)
      end

      def create_dedicated_ip_pool(input : Types::CreateDedicatedIpPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEDICATED_IP_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict
      # how your messages will be handled by various email providers around the world. When you perform a
      # predictive inbox placement test, you provide a sample message that contains the content that you
      # plan to send to your customers. Amazon Pinpoint then sends that message to special email addresses
      # spread across several major email providers. After about 24 hours, the test is complete, and you can
      # use the GetDeliverabilityTestReport operation to view the results of the test.

      def create_deliverability_test_report(
        content : Types::EmailContent,
        from_email_address : String,
        report_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDeliverabilityTestReportRequest.new(content: content, from_email_address: from_email_address, report_name: report_name, tags: tags)
        create_deliverability_test_report(input)
      end

      def create_deliverability_test_report(input : Types::CreateDeliverabilityTestReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DELIVERABILITY_TEST_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Verifies an email identity for use with Amazon Pinpoint. In Amazon Pinpoint, an identity is an email
      # address or domain that you use when you send email. Before you can use an identity to send email
      # with Amazon Pinpoint, you first have to verify it. By verifying an address, you demonstrate that
      # you're the owner of the address, and that you've given Amazon Pinpoint permission to send email from
      # the address. When you verify an email address, Amazon Pinpoint sends an email to the address. Your
      # email address is verified as soon as you follow the link in the verification email. When you verify
      # a domain, this operation provides a set of DKIM tokens, which you can convert into CNAME tokens. You
      # add these CNAME tokens to the DNS configuration for your domain. Your domain is verified when Amazon
      # Pinpoint detects these records in the DNS configuration for your domain. It usually takes around 72
      # hours to complete the domain verification process.

      def create_email_identity(
        email_identity : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateEmailIdentityRequest.new(email_identity: email_identity, tags: tags)
        create_email_identity(input)
      end

      def create_email_identity(input : Types::CreateEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing configuration set. In Amazon Pinpoint, configuration sets are groups of rules
      # that you can apply to the emails you send. You apply a configuration set to an email by including a
      # reference to the configuration set in the headers of the email. When you apply a configuration set
      # to an email, all of the rules in that configuration set are applied to the email.

      def delete_configuration_set(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set(input)
      end

      def delete_configuration_set(input : Types::DeleteConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an event destination. In Amazon Pinpoint, events include message sends, deliveries, opens,
      # clicks, bounces, and complaints. Event destinations are places that you can send information about
      # these events to. For example, you can send event data to Amazon SNS to receive notifications when
      # you receive bounces or complaints, or you can use Amazon Kinesis Data Firehose to stream data to
      # Amazon S3 for long-term storage.

      def delete_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name)
        delete_configuration_set_event_destination(input)
      end

      def delete_configuration_set_event_destination(input : Types::DeleteConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a dedicated IP pool.

      def delete_dedicated_ip_pool(
        pool_name : String
      ) : Protocol::Request
        input = Types::DeleteDedicatedIpPoolRequest.new(pool_name: pool_name)
        delete_dedicated_ip_pool(input)
      end

      def delete_dedicated_ip_pool(input : Types::DeleteDedicatedIpPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEDICATED_IP_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an email identity that you previously verified for use with Amazon Pinpoint. An identity can
      # be either an email address or a domain name.

      def delete_email_identity(
        email_identity : String
      ) : Protocol::Request
        input = Types::DeleteEmailIdentityRequest.new(email_identity: email_identity)
        delete_email_identity(input)
      end

      def delete_email_identity(input : Types::DeleteEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtain information about the email-sending status and capabilities of your Amazon Pinpoint account
      # in the current AWS Region.

      def get_account : Protocol::Request
        input = Types::GetAccountRequest.new
        get_account(input)
      end

      def get_account(input : Types::GetAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of the blacklists that your dedicated IP addresses appear on.

      def get_blacklist_reports(
        blacklist_item_names : Array(String)
      ) : Protocol::Request
        input = Types::GetBlacklistReportsRequest.new(blacklist_item_names: blacklist_item_names)
        get_blacklist_reports(input)
      end

      def get_blacklist_reports(input : Types::GetBlacklistReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BLACKLIST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about an existing configuration set, including the dedicated IP pool that it's
      # associated with, whether or not it's enabled for sending email, and more. In Amazon Pinpoint,
      # configuration sets are groups of rules that you can apply to the emails you send. You apply a
      # configuration set to an email by including a reference to the configuration set in the headers of
      # the email. When you apply a configuration set to an email, all of the rules in that configuration
      # set are applied to the email.

      def get_configuration_set(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::GetConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        get_configuration_set(input)
      end

      def get_configuration_set(input : Types::GetConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of event destinations that are associated with a configuration set. In Amazon
      # Pinpoint, events include message sends, deliveries, opens, clicks, bounces, and complaints. Event
      # destinations are places that you can send information about these events to. For example, you can
      # send event data to Amazon SNS to receive notifications when you receive bounces or complaints, or
      # you can use Amazon Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.

      def get_configuration_set_event_destinations(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::GetConfigurationSetEventDestinationsRequest.new(configuration_set_name: configuration_set_name)
        get_configuration_set_event_destinations(input)
      end

      def get_configuration_set_event_destinations(input : Types::GetConfigurationSetEventDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_SET_EVENT_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a dedicated IP address, including the name of the dedicated IP pool that it's
      # associated with, as well information about the automatic warm-up process for the address.

      def get_dedicated_ip(
        ip : String
      ) : Protocol::Request
        input = Types::GetDedicatedIpRequest.new(ip: ip)
        get_dedicated_ip(input)
      end

      def get_dedicated_ip(input : Types::GetDedicatedIpRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEDICATED_IP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the dedicated IP addresses that are associated with your Amazon Pinpoint account.

      def get_dedicated_ips(
        next_token : String? = nil,
        page_size : Int32? = nil,
        pool_name : String? = nil
      ) : Protocol::Request
        input = Types::GetDedicatedIpsRequest.new(next_token: next_token, page_size: page_size, pool_name: pool_name)
        get_dedicated_ips(input)
      end

      def get_dedicated_ips(input : Types::GetDedicatedIpsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEDICATED_IPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about the status of the Deliverability dashboard for your Amazon Pinpoint
      # account. When the Deliverability dashboard is enabled, you gain access to reputation,
      # deliverability, and other metrics for the domains that you use to send email using Amazon Pinpoint.
      # You also gain the ability to perform predictive inbox placement tests. When you use the
      # Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that
      # you accrue by using Amazon Pinpoint. For more information about the features and cost of a
      # Deliverability dashboard subscription, see Amazon Pinpoint Pricing .

      def get_deliverability_dashboard_options : Protocol::Request
        input = Types::GetDeliverabilityDashboardOptionsRequest.new
        get_deliverability_dashboard_options(input)
      end

      def get_deliverability_dashboard_options(input : Types::GetDeliverabilityDashboardOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELIVERABILITY_DASHBOARD_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the results of a predictive inbox placement test.

      def get_deliverability_test_report(
        report_id : String
      ) : Protocol::Request
        input = Types::GetDeliverabilityTestReportRequest.new(report_id: report_id)
        get_deliverability_test_report(input)
      end

      def get_deliverability_test_report(input : Types::GetDeliverabilityTestReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELIVERABILITY_TEST_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve all the deliverability data for a specific campaign. This data is available for a campaign
      # only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for (
      # PutDeliverabilityDashboardOption operation).

      def get_domain_deliverability_campaign(
        campaign_id : String
      ) : Protocol::Request
        input = Types::GetDomainDeliverabilityCampaignRequest.new(campaign_id: campaign_id)
        get_domain_deliverability_campaign(input)
      end

      def get_domain_deliverability_campaign(input : Types::GetDomainDeliverabilityCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_DELIVERABILITY_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve inbox placement and engagement rates for the domains that you use to send email.

      def get_domain_statistics_report(
        domain : String,
        end_date : Time,
        start_date : Time
      ) : Protocol::Request
        input = Types::GetDomainStatisticsReportRequest.new(domain: domain, end_date: end_date, start_date: start_date)
        get_domain_statistics_report(input)
      end

      def get_domain_statistics_report(input : Types::GetDomainStatisticsReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_STATISTICS_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about a specific identity associated with your Amazon Pinpoint account,
      # including the identity's verification status, its DKIM authentication status, and its custom
      # Mail-From settings.

      def get_email_identity(
        email_identity : String
      ) : Protocol::Request
        input = Types::GetEmailIdentityRequest.new(email_identity: email_identity)
        get_email_identity(input)
      end

      def get_email_identity(input : Types::GetEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the configuration sets associated with your Amazon Pinpoint account in the current
      # region. In Amazon Pinpoint, configuration sets are groups of rules that you can apply to the emails
      # you send. You apply a configuration set to an email by including a reference to the configuration
      # set in the headers of the email. When you apply a configuration set to an email, all of the rules in
      # that configuration set are applied to the email.

      def list_configuration_sets(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationSetsRequest.new(next_token: next_token, page_size: page_size)
        list_configuration_sets(input)
      end

      def list_configuration_sets(input : Types::ListConfigurationSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the dedicated IP pools that exist in your Amazon Pinpoint account in the current AWS
      # Region.

      def list_dedicated_ip_pools(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDedicatedIpPoolsRequest.new(next_token: next_token, page_size: page_size)
        list_dedicated_ip_pools(input)
      end

      def list_dedicated_ip_pools(input : Types::ListDedicatedIpPoolsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEDICATED_IP_POOLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Show a list of the predictive inbox placement tests that you've performed, regardless of their
      # statuses. For predictive inbox placement tests that are complete, you can use the
      # GetDeliverabilityTestReport operation to view the results.

      def list_deliverability_test_reports(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDeliverabilityTestReportsRequest.new(next_token: next_token, page_size: page_size)
        list_deliverability_test_reports(input)
      end

      def list_deliverability_test_reports(input : Types::ListDeliverabilityTestReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DELIVERABILITY_TEST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve deliverability data for all the campaigns that used a specific domain to send email during
      # a specified time range. This data is available for a domain only if you enabled the Deliverability
      # dashboard ( PutDeliverabilityDashboardOption operation) for the domain.

      def list_domain_deliverability_campaigns(
        end_date : Time,
        start_date : Time,
        subscribed_domain : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDomainDeliverabilityCampaignsRequest.new(end_date: end_date, start_date: start_date, subscribed_domain: subscribed_domain, next_token: next_token, page_size: page_size)
        list_domain_deliverability_campaigns(input)
      end

      def list_domain_deliverability_campaigns(input : Types::ListDomainDeliverabilityCampaignsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_DELIVERABILITY_CAMPAIGNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of the email identities that are associated with your Amazon Pinpoint account.
      # An identity can be either an email address or a domain. This operation returns identities that are
      # verified as well as those that aren't.

      def list_email_identities(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListEmailIdentitiesRequest.new(next_token: next_token, page_size: page_size)
        list_email_identities(input)
      end

      def list_email_identities(input : Types::ListEmailIdentitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EMAIL_IDENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of the tags (keys and values) that are associated with a specified resource. A tag
      # is a label that you optionally define and associate with a resource in Amazon Pinpoint. Each tag
      # consists of a required tag key and an optional associated tag value . A tag key is a general label
      # that acts as a category for more specific tag values. A tag value acts as a descriptor within a tag
      # key.

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

      # Enable or disable the automatic warm-up feature for dedicated IP addresses.

      def put_account_dedicated_ip_warmup_attributes(
        auto_warmup_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutAccountDedicatedIpWarmupAttributesRequest.new(auto_warmup_enabled: auto_warmup_enabled)
        put_account_dedicated_ip_warmup_attributes(input)
      end

      def put_account_dedicated_ip_warmup_attributes(input : Types::PutAccountDedicatedIpWarmupAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_DEDICATED_IP_WARMUP_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable the ability of your account to send email.

      def put_account_sending_attributes(
        sending_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutAccountSendingAttributesRequest.new(sending_enabled: sending_enabled)
        put_account_sending_attributes(input)
      end

      def put_account_sending_attributes(input : Types::PutAccountSendingAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_SENDING_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create
      # groups of dedicated IP addresses for sending specific types of email.

      def put_configuration_set_delivery_options(
        configuration_set_name : String,
        sending_pool_name : String? = nil,
        tls_policy : String? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetDeliveryOptionsRequest.new(configuration_set_name: configuration_set_name, sending_pool_name: sending_pool_name, tls_policy: tls_policy)
        put_configuration_set_delivery_options(input)
      end

      def put_configuration_set_delivery_options(input : Types::PutConfigurationSetDeliveryOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_DELIVERY_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable collection of reputation metrics for emails that you send using a particular
      # configuration set in a specific AWS Region.

      def put_configuration_set_reputation_options(
        configuration_set_name : String,
        reputation_metrics_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetReputationOptionsRequest.new(configuration_set_name: configuration_set_name, reputation_metrics_enabled: reputation_metrics_enabled)
        put_configuration_set_reputation_options(input)
      end

      def put_configuration_set_reputation_options(input : Types::PutConfigurationSetReputationOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_REPUTATION_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable email sending for messages that use a particular configuration set in a specific
      # AWS Region.

      def put_configuration_set_sending_options(
        configuration_set_name : String,
        sending_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetSendingOptionsRequest.new(configuration_set_name: configuration_set_name, sending_enabled: sending_enabled)
        put_configuration_set_sending_options(input)
      end

      def put_configuration_set_sending_options(input : Types::PutConfigurationSetSendingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_SENDING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specify a custom domain to use for open and click tracking elements in email that you send using
      # Amazon Pinpoint.

      def put_configuration_set_tracking_options(
        configuration_set_name : String,
        custom_redirect_domain : String? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetTrackingOptionsRequest.new(configuration_set_name: configuration_set_name, custom_redirect_domain: custom_redirect_domain)
        put_configuration_set_tracking_options(input)
      end

      def put_configuration_set_tracking_options(input : Types::PutConfigurationSetTrackingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_TRACKING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Move a dedicated IP address to an existing dedicated IP pool. The dedicated IP address that you
      # specify must already exist, and must be associated with your Amazon Pinpoint account. The dedicated
      # IP pool you specify must already exist. You can create a new pool by using the CreateDedicatedIpPool
      # operation.

      def put_dedicated_ip_in_pool(
        destination_pool_name : String,
        ip : String
      ) : Protocol::Request
        input = Types::PutDedicatedIpInPoolRequest.new(destination_pool_name: destination_pool_name, ip: ip)
        put_dedicated_ip_in_pool(input)
      end

      def put_dedicated_ip_in_pool(input : Types::PutDedicatedIpInPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEDICATED_IP_IN_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end


      def put_dedicated_ip_warmup_attributes(
        ip : String,
        warmup_percentage : Int32
      ) : Protocol::Request
        input = Types::PutDedicatedIpWarmupAttributesRequest.new(ip: ip, warmup_percentage: warmup_percentage)
        put_dedicated_ip_warmup_attributes(input)
      end

      def put_dedicated_ip_warmup_attributes(input : Types::PutDedicatedIpWarmupAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEDICATED_IP_WARMUP_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable the Deliverability dashboard for your Amazon Pinpoint account. When you enable the
      # Deliverability dashboard, you gain access to reputation, deliverability, and other metrics for the
      # domains that you use to send email using Amazon Pinpoint. You also gain the ability to perform
      # predictive inbox placement tests. When you use the Deliverability dashboard, you pay a monthly
      # subscription charge, in addition to any other fees that you accrue by using Amazon Pinpoint. For
      # more information about the features and cost of a Deliverability dashboard subscription, see Amazon
      # Pinpoint Pricing .

      def put_deliverability_dashboard_option(
        dashboard_enabled : Bool,
        subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)? = nil
      ) : Protocol::Request
        input = Types::PutDeliverabilityDashboardOptionRequest.new(dashboard_enabled: dashboard_enabled, subscribed_domains: subscribed_domains)
        put_deliverability_dashboard_option(input)
      end

      def put_deliverability_dashboard_option(input : Types::PutDeliverabilityDashboardOptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DELIVERABILITY_DASHBOARD_OPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable DKIM authentication for an email identity.

      def put_email_identity_dkim_attributes(
        email_identity : String,
        signing_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityDkimAttributesRequest.new(email_identity: email_identity, signing_enabled: signing_enabled)
        put_email_identity_dkim_attributes(input)
      end

      def put_email_identity_dkim_attributes(input : Types::PutEmailIdentityDkimAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_DKIM_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable feedback forwarding for an identity. This setting determines what happens
      # when an identity is used to send an email that results in a bounce or complaint event. When you
      # enable feedback forwarding, Amazon Pinpoint sends you email notifications when bounce or complaint
      # events occur. Amazon Pinpoint sends this notification to the address that you specified in the
      # Return-Path header of the original email. When you disable feedback forwarding, Amazon Pinpoint
      # sends notifications through other mechanisms, such as by notifying an Amazon SNS topic. You're
      # required to have a method of tracking bounces and complaints. If you haven't set up another
      # mechanism for receiving bounce or complaint notifications, Amazon Pinpoint sends an email
      # notification when these events occur (even if this setting is disabled).

      def put_email_identity_feedback_attributes(
        email_identity : String,
        email_forwarding_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityFeedbackAttributesRequest.new(email_identity: email_identity, email_forwarding_enabled: email_forwarding_enabled)
        put_email_identity_feedback_attributes(input)
      end

      def put_email_identity_feedback_attributes(input : Types::PutEmailIdentityFeedbackAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_FEEDBACK_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable the custom Mail-From domain configuration for an email identity.

      def put_email_identity_mail_from_attributes(
        email_identity : String,
        behavior_on_mx_failure : String? = nil,
        mail_from_domain : String? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityMailFromAttributesRequest.new(email_identity: email_identity, behavior_on_mx_failure: behavior_on_mx_failure, mail_from_domain: mail_from_domain)
        put_email_identity_mail_from_attributes(input)
      end

      def put_email_identity_mail_from_attributes(input : Types::PutEmailIdentityMailFromAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_MAIL_FROM_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an email message. You can use the Amazon Pinpoint Email API to send two types of messages:
      # Simple – A standard email message. When you create this type of message, you specify the sender, the
      # recipient, and the message body, and Amazon Pinpoint assembles the message for you. Raw – A raw,
      # MIME-formatted email message. When you send this type of email, you have to specify all of the
      # message headers, as well as the message body. You can use this message type to send messages that
      # contain attachments. The message that you specify has to be a valid MIME message.

      def send_email(
        content : Types::EmailContent,
        destination : Types::Destination,
        configuration_set_name : String? = nil,
        email_tags : Array(Types::MessageTag)? = nil,
        feedback_forwarding_email_address : String? = nil,
        from_email_address : String? = nil,
        reply_to_addresses : Array(String)? = nil
      ) : Protocol::Request
        input = Types::SendEmailRequest.new(content: content, destination: destination, configuration_set_name: configuration_set_name, email_tags: email_tags, feedback_forwarding_email_address: feedback_forwarding_email_address, from_email_address: from_email_address, reply_to_addresses: reply_to_addresses)
        send_email(input)
      end

      def send_email(input : Types::SendEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add one or more tags (keys and values) to a specified resource. A tag is a label that you optionally
      # define and associate with a resource in Amazon Pinpoint. Tags can help you categorize and manage
      # resources in different ways, such as by purpose, owner, environment, or other criteria. A resource
      # can have as many as 50 tags. Each tag consists of a required tag key and an associated tag value ,
      # both of which you define. A tag key is a general label that acts as a category for more specific tag
      # values. A tag value acts as a descriptor within a tag key.

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

      # Remove one or more tags (keys and values) from a specified resource.

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

      # Update the configuration of an event destination for a configuration set. In Amazon Pinpoint, events
      # include message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are
      # places that you can send information about these events to. For example, you can send event data to
      # Amazon SNS to receive notifications when you receive bounces or complaints, or you can use Amazon
      # Kinesis Data Firehose to stream data to Amazon S3 for long-term storage.

      def update_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestinationDefinition,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::UpdateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination, event_destination_name: event_destination_name)
        update_configuration_set_event_destination(input)
      end

      def update_configuration_set_event_destination(input : Types::UpdateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
