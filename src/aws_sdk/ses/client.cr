module AwsSdk
  module SES
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates a receipt rule set by cloning an existing one. All receipt rules and configurations are
      # copied to the new receipt rule set and are completely independent of the source rule set. For
      # information about setting up rule sets, see the Amazon SES Developer Guide . You can execute this
      # operation no more than once per second.

      def clone_receipt_rule_set(
        original_rule_set_name : String,
        rule_set_name : String
      ) : Types::CloneReceiptRuleSetResponse

        input = Types::CloneReceiptRuleSetRequest.new(original_rule_set_name: original_rule_set_name, rule_set_name: rule_set_name)
        clone_receipt_rule_set(input)
      end

      def clone_receipt_rule_set(input : Types::CloneReceiptRuleSetRequest) : Types::CloneReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::CLONE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CloneReceiptRuleSetResponse, "CloneReceiptRuleSet")
      end

      # Creates a configuration set. Configuration sets enable you to publish email sending events. For
      # information about using configuration sets, see the Amazon SES Developer Guide . You can execute
      # this operation no more than once per second.

      def create_configuration_set(
        configuration_set : Types::ConfigurationSet
      ) : Types::CreateConfigurationSetResponse

        input = Types::CreateConfigurationSetRequest.new(configuration_set: configuration_set)
        create_configuration_set(input)
      end

      def create_configuration_set(input : Types::CreateConfigurationSetRequest) : Types::CreateConfigurationSetResponse
        request = Protocol::Query.build_request(Model::CREATE_CONFIGURATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateConfigurationSetResponse, "CreateConfigurationSet")
      end

      # Creates a configuration set event destination. When you create or update an event destination, you
      # must provide one, and only one, destination. The destination can be CloudWatch, Amazon Kinesis
      # Firehose, or Amazon Simple Notification Service (Amazon SNS). An event destination is the Amazon Web
      # Services service to which Amazon SES publishes the email sending events associated with a
      # configuration set. For information about using configuration sets, see the Amazon SES Developer
      # Guide . You can execute this operation no more than once per second.

      def create_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestination
      ) : Types::CreateConfigurationSetEventDestinationResponse

        input = Types::CreateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination)
        create_configuration_set_event_destination(input)
      end

      def create_configuration_set_event_destination(input : Types::CreateConfigurationSetEventDestinationRequest) : Types::CreateConfigurationSetEventDestinationResponse
        request = Protocol::Query.build_request(Model::CREATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateConfigurationSetEventDestinationResponse, "CreateConfigurationSetEventDestination")
      end

      # Creates an association between a configuration set and a custom domain for open and click event
      # tracking. By default, images and links used for tracking open and click events are hosted on domains
      # operated by Amazon SES. You can configure a subdomain of your own to handle these events. For
      # information about using custom domains, see the Amazon SES Developer Guide .

      def create_configuration_set_tracking_options(
        configuration_set_name : String,
        tracking_options : Types::TrackingOptions
      ) : Types::CreateConfigurationSetTrackingOptionsResponse

        input = Types::CreateConfigurationSetTrackingOptionsRequest.new(configuration_set_name: configuration_set_name, tracking_options: tracking_options)
        create_configuration_set_tracking_options(input)
      end

      def create_configuration_set_tracking_options(input : Types::CreateConfigurationSetTrackingOptionsRequest) : Types::CreateConfigurationSetTrackingOptionsResponse
        request = Protocol::Query.build_request(Model::CREATE_CONFIGURATION_SET_TRACKING_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateConfigurationSetTrackingOptionsResponse, "CreateConfigurationSetTrackingOptions")
      end

      # Creates a new custom verification email template. For more information about custom verification
      # email templates, see Using Custom Verification Email Templates in the Amazon SES Developer Guide .
      # You can execute this operation no more than once per second.

      def create_custom_verification_email_template(
        failure_redirection_url : String,
        from_email_address : String,
        success_redirection_url : String,
        template_content : String,
        template_name : String,
        template_subject : String
      ) : Nil

        input = Types::CreateCustomVerificationEmailTemplateRequest.new(failure_redirection_url: failure_redirection_url, from_email_address: from_email_address, success_redirection_url: success_redirection_url, template_content: template_content, template_name: template_name, template_subject: template_subject)
        create_custom_verification_email_template(input)
      end

      def create_custom_verification_email_template(input : Types::CreateCustomVerificationEmailTemplateRequest) : Nil
        request = Protocol::Query.build_request(Model::CREATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a new IP address filter. For information about setting up IP address filters, see the Amazon
      # SES Developer Guide . You can execute this operation no more than once per second.

      def create_receipt_filter(
        filter : Types::ReceiptFilter
      ) : Types::CreateReceiptFilterResponse

        input = Types::CreateReceiptFilterRequest.new(filter: filter)
        create_receipt_filter(input)
      end

      def create_receipt_filter(input : Types::CreateReceiptFilterRequest) : Types::CreateReceiptFilterResponse
        request = Protocol::Query.build_request(Model::CREATE_RECEIPT_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateReceiptFilterResponse, "CreateReceiptFilter")
      end

      # Creates a receipt rule. For information about setting up receipt rules, see the Amazon SES Developer
      # Guide . You can execute this operation no more than once per second.

      def create_receipt_rule(
        rule : Types::ReceiptRule,
        rule_set_name : String,
        after : String? = nil
      ) : Types::CreateReceiptRuleResponse

        input = Types::CreateReceiptRuleRequest.new(rule: rule, rule_set_name: rule_set_name, after: after)
        create_receipt_rule(input)
      end

      def create_receipt_rule(input : Types::CreateReceiptRuleRequest) : Types::CreateReceiptRuleResponse
        request = Protocol::Query.build_request(Model::CREATE_RECEIPT_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateReceiptRuleResponse, "CreateReceiptRule")
      end

      # Creates an empty receipt rule set. For information about setting up receipt rule sets, see the
      # Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def create_receipt_rule_set(
        rule_set_name : String
      ) : Types::CreateReceiptRuleSetResponse

        input = Types::CreateReceiptRuleSetRequest.new(rule_set_name: rule_set_name)
        create_receipt_rule_set(input)
      end

      def create_receipt_rule_set(input : Types::CreateReceiptRuleSetRequest) : Types::CreateReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::CREATE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateReceiptRuleSetResponse, "CreateReceiptRuleSet")
      end

      # Creates an email template. Email templates enable you to send personalized email to one or more
      # destinations in a single operation. For more information, see the Amazon SES Developer Guide . You
      # can execute this operation no more than once per second.

      def create_template(
        template : Types::Template
      ) : Types::CreateTemplateResponse

        input = Types::CreateTemplateRequest.new(template: template)
        create_template(input)
      end

      def create_template(input : Types::CreateTemplateRequest) : Types::CreateTemplateResponse
        request = Protocol::Query.build_request(Model::CREATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateTemplateResponse, "CreateTemplate")
      end

      # Deletes a configuration set. Configuration sets enable you to publish email sending events. For
      # information about using configuration sets, see the Amazon SES Developer Guide . You can execute
      # this operation no more than once per second.

      def delete_configuration_set(
        configuration_set_name : String
      ) : Types::DeleteConfigurationSetResponse

        input = Types::DeleteConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set(input)
      end

      def delete_configuration_set(input : Types::DeleteConfigurationSetRequest) : Types::DeleteConfigurationSetResponse
        request = Protocol::Query.build_request(Model::DELETE_CONFIGURATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteConfigurationSetResponse, "DeleteConfigurationSet")
      end

      # Deletes a configuration set event destination. Configuration set event destinations are associated
      # with configuration sets, which enable you to publish email sending events. For information about
      # using configuration sets, see the Amazon SES Developer Guide . You can execute this operation no
      # more than once per second.

      def delete_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination_name : String
      ) : Types::DeleteConfigurationSetEventDestinationResponse

        input = Types::DeleteConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name)
        delete_configuration_set_event_destination(input)
      end

      def delete_configuration_set_event_destination(input : Types::DeleteConfigurationSetEventDestinationRequest) : Types::DeleteConfigurationSetEventDestinationResponse
        request = Protocol::Query.build_request(Model::DELETE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteConfigurationSetEventDestinationResponse, "DeleteConfigurationSetEventDestination")
      end

      # Deletes an association between a configuration set and a custom domain for open and click event
      # tracking. By default, images and links used for tracking open and click events are hosted on domains
      # operated by Amazon SES. You can configure a subdomain of your own to handle these events. For
      # information about using custom domains, see the Amazon SES Developer Guide . Deleting this kind of
      # association results in emails sent using the specified configuration set to capture open and click
      # events using the standard, Amazon SES-operated domains.

      def delete_configuration_set_tracking_options(
        configuration_set_name : String
      ) : Types::DeleteConfigurationSetTrackingOptionsResponse

        input = Types::DeleteConfigurationSetTrackingOptionsRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set_tracking_options(input)
      end

      def delete_configuration_set_tracking_options(input : Types::DeleteConfigurationSetTrackingOptionsRequest) : Types::DeleteConfigurationSetTrackingOptionsResponse
        request = Protocol::Query.build_request(Model::DELETE_CONFIGURATION_SET_TRACKING_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteConfigurationSetTrackingOptionsResponse, "DeleteConfigurationSetTrackingOptions")
      end

      # Deletes an existing custom verification email template. For more information about custom
      # verification email templates, see Using Custom Verification Email Templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def delete_custom_verification_email_template(
        template_name : String
      ) : Nil

        input = Types::DeleteCustomVerificationEmailTemplateRequest.new(template_name: template_name)
        delete_custom_verification_email_template(input)
      end

      def delete_custom_verification_email_template(input : Types::DeleteCustomVerificationEmailTemplateRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified identity (an email address or a domain) from the list of verified identities.
      # You can execute this operation no more than once per second.

      def delete_identity(
        identity : String
      ) : Types::DeleteIdentityResponse

        input = Types::DeleteIdentityRequest.new(identity: identity)
        delete_identity(input)
      end

      def delete_identity(input : Types::DeleteIdentityRequest) : Types::DeleteIdentityResponse
        request = Protocol::Query.build_request(Model::DELETE_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteIdentityResponse, "DeleteIdentity")
      end

      # Deletes the specified sending authorization policy for the given identity (an email address or a
      # domain). This operation returns successfully even if a policy with the specified name does not
      # exist. This operation is for the identity owner only. If you have not verified the identity, it
      # returns an error. Sending authorization is a feature that enables an identity owner to authorize
      # other senders to use its identities. For information about using sending authorization, see the
      # Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def delete_identity_policy(
        identity : String,
        policy_name : String
      ) : Types::DeleteIdentityPolicyResponse

        input = Types::DeleteIdentityPolicyRequest.new(identity: identity, policy_name: policy_name)
        delete_identity_policy(input)
      end

      def delete_identity_policy(input : Types::DeleteIdentityPolicyRequest) : Types::DeleteIdentityPolicyResponse
        request = Protocol::Query.build_request(Model::DELETE_IDENTITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteIdentityPolicyResponse, "DeleteIdentityPolicy")
      end

      # Deletes the specified IP address filter. For information about managing IP address filters, see the
      # Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def delete_receipt_filter(
        filter_name : String
      ) : Types::DeleteReceiptFilterResponse

        input = Types::DeleteReceiptFilterRequest.new(filter_name: filter_name)
        delete_receipt_filter(input)
      end

      def delete_receipt_filter(input : Types::DeleteReceiptFilterRequest) : Types::DeleteReceiptFilterResponse
        request = Protocol::Query.build_request(Model::DELETE_RECEIPT_FILTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteReceiptFilterResponse, "DeleteReceiptFilter")
      end

      # Deletes the specified receipt rule. For information about managing receipt rules, see the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def delete_receipt_rule(
        rule_name : String,
        rule_set_name : String
      ) : Types::DeleteReceiptRuleResponse

        input = Types::DeleteReceiptRuleRequest.new(rule_name: rule_name, rule_set_name: rule_set_name)
        delete_receipt_rule(input)
      end

      def delete_receipt_rule(input : Types::DeleteReceiptRuleRequest) : Types::DeleteReceiptRuleResponse
        request = Protocol::Query.build_request(Model::DELETE_RECEIPT_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteReceiptRuleResponse, "DeleteReceiptRule")
      end

      # Deletes the specified receipt rule set and all of the receipt rules it contains. The currently
      # active rule set cannot be deleted. For information about managing receipt rule sets, see the Amazon
      # SES Developer Guide . You can execute this operation no more than once per second.

      def delete_receipt_rule_set(
        rule_set_name : String
      ) : Types::DeleteReceiptRuleSetResponse

        input = Types::DeleteReceiptRuleSetRequest.new(rule_set_name: rule_set_name)
        delete_receipt_rule_set(input)
      end

      def delete_receipt_rule_set(input : Types::DeleteReceiptRuleSetRequest) : Types::DeleteReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::DELETE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteReceiptRuleSetResponse, "DeleteReceiptRuleSet")
      end

      # Deletes an email template. You can execute this operation no more than once per second.

      def delete_template(
        template_name : String
      ) : Types::DeleteTemplateResponse

        input = Types::DeleteTemplateRequest.new(template_name: template_name)
        delete_template(input)
      end

      def delete_template(input : Types::DeleteTemplateRequest) : Types::DeleteTemplateResponse
        request = Protocol::Query.build_request(Model::DELETE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteTemplateResponse, "DeleteTemplate")
      end

      # Deprecated. Use the DeleteIdentity operation to delete email addresses and domains.

      def delete_verified_email_address(
        email_address : String
      ) : Nil

        input = Types::DeleteVerifiedEmailAddressRequest.new(email_address: email_address)
        delete_verified_email_address(input)
      end

      def delete_verified_email_address(input : Types::DeleteVerifiedEmailAddressRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_VERIFIED_EMAIL_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Returns the metadata and receipt rules for the receipt rule set that is currently active. For
      # information about setting up receipt rule sets, see the Amazon SES Developer Guide . You can execute
      # this operation no more than once per second.

      def describe_active_receipt_rule_set : Types::DescribeActiveReceiptRuleSetResponse
        input = Types::DescribeActiveReceiptRuleSetRequest.new
        describe_active_receipt_rule_set(input)
      end

      def describe_active_receipt_rule_set(input : Types::DescribeActiveReceiptRuleSetRequest) : Types::DescribeActiveReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_ACTIVE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeActiveReceiptRuleSetResponse, "DescribeActiveReceiptRuleSet")
      end

      # Returns the details of the specified configuration set. For information about using configuration
      # sets, see the Amazon SES Developer Guide . You can execute this operation no more than once per
      # second.

      def describe_configuration_set(
        configuration_set_name : String,
        configuration_set_attribute_names : Array(String)? = nil
      ) : Types::DescribeConfigurationSetResponse

        input = Types::DescribeConfigurationSetRequest.new(configuration_set_name: configuration_set_name, configuration_set_attribute_names: configuration_set_attribute_names)
        describe_configuration_set(input)
      end

      def describe_configuration_set(input : Types::DescribeConfigurationSetRequest) : Types::DescribeConfigurationSetResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_CONFIGURATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeConfigurationSetResponse, "DescribeConfigurationSet")
      end

      # Returns the details of the specified receipt rule. For information about setting up receipt rules,
      # see the Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def describe_receipt_rule(
        rule_name : String,
        rule_set_name : String
      ) : Types::DescribeReceiptRuleResponse

        input = Types::DescribeReceiptRuleRequest.new(rule_name: rule_name, rule_set_name: rule_set_name)
        describe_receipt_rule(input)
      end

      def describe_receipt_rule(input : Types::DescribeReceiptRuleRequest) : Types::DescribeReceiptRuleResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_RECEIPT_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeReceiptRuleResponse, "DescribeReceiptRule")
      end

      # Returns the details of the specified receipt rule set. For information about managing receipt rule
      # sets, see the Amazon SES Developer Guide . You can execute this operation no more than once per
      # second.

      def describe_receipt_rule_set(
        rule_set_name : String
      ) : Types::DescribeReceiptRuleSetResponse

        input = Types::DescribeReceiptRuleSetRequest.new(rule_set_name: rule_set_name)
        describe_receipt_rule_set(input)
      end

      def describe_receipt_rule_set(input : Types::DescribeReceiptRuleSetRequest) : Types::DescribeReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::DESCRIBE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DescribeReceiptRuleSetResponse, "DescribeReceiptRuleSet")
      end

      # Returns the email sending status of the Amazon SES account for the current Region. You can execute
      # this operation no more than once per second.


      def get_account_sending_enabled : Types::GetAccountSendingEnabledResponse
        request = Protocol::Query.build_request(Model::GET_ACCOUNT_SENDING_ENABLED, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAccountSendingEnabledResponse, "GetAccountSendingEnabled")
      end

      # Returns the custom email verification template for the template name you specify. For more
      # information about custom verification email templates, see Using Custom Verification Email Templates
      # in the Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def get_custom_verification_email_template(
        template_name : String
      ) : Types::GetCustomVerificationEmailTemplateResponse

        input = Types::GetCustomVerificationEmailTemplateRequest.new(template_name: template_name)
        get_custom_verification_email_template(input)
      end

      def get_custom_verification_email_template(input : Types::GetCustomVerificationEmailTemplateRequest) : Types::GetCustomVerificationEmailTemplateResponse
        request = Protocol::Query.build_request(Model::GET_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetCustomVerificationEmailTemplateResponse, "GetCustomVerificationEmailTemplate")
      end

      # Returns the current status of Easy DKIM signing for an entity. For domain name identities, this
      # operation also returns the DKIM tokens that are required for Easy DKIM signing, and whether Amazon
      # SES has successfully verified that these tokens have been published. This operation takes a list of
      # identities as input and returns the following information for each: Whether Easy DKIM signing is
      # enabled or disabled. A set of DKIM tokens that represent the identity. If the identity is an email
      # address, the tokens represent the domain of that address. Whether Amazon SES has successfully
      # verified the DKIM tokens published in the domain's DNS. This information is only returned for domain
      # name identities, not for email addresses. This operation is throttled at one request per second and
      # can only get DKIM attributes for up to 100 identities at a time. For more information about creating
      # DNS records using DKIM tokens, go to the Amazon SES Developer Guide .

      def get_identity_dkim_attributes(
        identities : Array(String)
      ) : Types::GetIdentityDkimAttributesResponse

        input = Types::GetIdentityDkimAttributesRequest.new(identities: identities)
        get_identity_dkim_attributes(input)
      end

      def get_identity_dkim_attributes(input : Types::GetIdentityDkimAttributesRequest) : Types::GetIdentityDkimAttributesResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_DKIM_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityDkimAttributesResponse, "GetIdentityDkimAttributes")
      end

      # Returns the custom MAIL FROM attributes for a list of identities (email addresses : domains). This
      # operation is throttled at one request per second and can only get custom MAIL FROM attributes for up
      # to 100 identities at a time.

      def get_identity_mail_from_domain_attributes(
        identities : Array(String)
      ) : Types::GetIdentityMailFromDomainAttributesResponse

        input = Types::GetIdentityMailFromDomainAttributesRequest.new(identities: identities)
        get_identity_mail_from_domain_attributes(input)
      end

      def get_identity_mail_from_domain_attributes(input : Types::GetIdentityMailFromDomainAttributesRequest) : Types::GetIdentityMailFromDomainAttributesResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_MAIL_FROM_DOMAIN_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityMailFromDomainAttributesResponse, "GetIdentityMailFromDomainAttributes")
      end

      # Given a list of verified identities (email addresses and/or domains), returns a structure describing
      # identity notification attributes. This operation is throttled at one request per second and can only
      # get notification attributes for up to 100 identities at a time. For more information about using
      # notifications with Amazon SES, see the Amazon SES Developer Guide .

      def get_identity_notification_attributes(
        identities : Array(String)
      ) : Types::GetIdentityNotificationAttributesResponse

        input = Types::GetIdentityNotificationAttributesRequest.new(identities: identities)
        get_identity_notification_attributes(input)
      end

      def get_identity_notification_attributes(input : Types::GetIdentityNotificationAttributesRequest) : Types::GetIdentityNotificationAttributesResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_NOTIFICATION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityNotificationAttributesResponse, "GetIdentityNotificationAttributes")
      end

      # Returns the requested sending authorization policies for the given identity (an email address or a
      # domain). The policies are returned as a map of policy names to policy contents. You can retrieve a
      # maximum of 20 policies at a time. This operation is for the identity owner only. If you have not
      # verified the identity, it returns an error. Sending authorization is a feature that enables an
      # identity owner to authorize other senders to use its identities. For information about using sending
      # authorization, see the Amazon SES Developer Guide . You can execute this operation no more than once
      # per second.

      def get_identity_policies(
        identity : String,
        policy_names : Array(String)
      ) : Types::GetIdentityPoliciesResponse

        input = Types::GetIdentityPoliciesRequest.new(identity: identity, policy_names: policy_names)
        get_identity_policies(input)
      end

      def get_identity_policies(input : Types::GetIdentityPoliciesRequest) : Types::GetIdentityPoliciesResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityPoliciesResponse, "GetIdentityPolicies")
      end

      # Given a list of identities (email addresses and/or domains), returns the verification status and
      # (for domain identities) the verification token for each identity. The verification status of an
      # email address is "Pending" until the email address owner clicks the link within the verification
      # email that Amazon SES sent to that address. If the email address owner clicks the link within 24
      # hours, the verification status of the email address changes to "Success". If the link is not clicked
      # within 24 hours, the verification status changes to "Failed." In that case, to verify the email
      # address, you must restart the verification process from the beginning. For domain identities, the
      # domain's verification status is "Pending" as Amazon SES searches for the required TXT record in the
      # DNS settings of the domain. When Amazon SES detects the record, the domain's verification status
      # changes to "Success". If Amazon SES is unable to detect the record within 72 hours, the domain's
      # verification status changes to "Failed." In that case, to verify the domain, you must restart the
      # verification process from the beginning. This operation is throttled at one request per second and
      # can only get verification attributes for up to 100 identities at a time.

      def get_identity_verification_attributes(
        identities : Array(String)
      ) : Types::GetIdentityVerificationAttributesResponse

        input = Types::GetIdentityVerificationAttributesRequest.new(identities: identities)
        get_identity_verification_attributes(input)
      end

      def get_identity_verification_attributes(input : Types::GetIdentityVerificationAttributesRequest) : Types::GetIdentityVerificationAttributesResponse
        request = Protocol::Query.build_request(Model::GET_IDENTITY_VERIFICATION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetIdentityVerificationAttributesResponse, "GetIdentityVerificationAttributes")
      end

      # Provides the sending limits for the Amazon SES account. You can execute this operation no more than
      # once per second.


      def get_send_quota : Types::GetSendQuotaResponse
        request = Protocol::Query.build_request(Model::GET_SEND_QUOTA, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSendQuotaResponse, "GetSendQuota")
      end

      # Provides sending statistics for the current Amazon Web Services Region. The result is a list of data
      # points, representing the last two weeks of sending activity. Each data point in the list contains
      # statistics for a 15-minute period of time. You can execute this operation no more than once per
      # second.


      def get_send_statistics : Types::GetSendStatisticsResponse
        request = Protocol::Query.build_request(Model::GET_SEND_STATISTICS, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSendStatisticsResponse, "GetSendStatistics")
      end

      # Displays the template object (which includes the Subject line, HTML part and text part) for the
      # template you specify. You can execute this operation no more than once per second.

      def get_template(
        template_name : String
      ) : Types::GetTemplateResponse

        input = Types::GetTemplateRequest.new(template_name: template_name)
        get_template(input)
      end

      def get_template(input : Types::GetTemplateRequest) : Types::GetTemplateResponse
        request = Protocol::Query.build_request(Model::GET_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTemplateResponse, "GetTemplate")
      end

      # Provides a list of the configuration sets associated with your Amazon SES account in the current
      # Amazon Web Services Region. For information about using configuration sets, see Monitoring Your
      # Amazon SES Sending Activity in the Amazon SES Developer Guide. You can execute this operation no
      # more than once per second. This operation returns up to 1,000 configuration sets each time it is
      # run. If your Amazon SES account has more than 1,000 configuration sets, this operation also returns
      # NextToken . You can then execute the ListConfigurationSets operation again, passing the NextToken
      # parameter and the value of the NextToken element to retrieve additional results.

      def list_configuration_sets(
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListConfigurationSetsResponse

        input = Types::ListConfigurationSetsRequest.new(max_items: max_items, next_token: next_token)
        list_configuration_sets(input)
      end

      def list_configuration_sets(input : Types::ListConfigurationSetsRequest) : Types::ListConfigurationSetsResponse
        request = Protocol::Query.build_request(Model::LIST_CONFIGURATION_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListConfigurationSetsResponse, "ListConfigurationSets")
      end

      # Lists the existing custom verification email templates for your account in the current Amazon Web
      # Services Region. For more information about custom verification email templates, see Using Custom
      # Verification Email Templates in the Amazon SES Developer Guide . You can execute this operation no
      # more than once per second.

      def list_custom_verification_email_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCustomVerificationEmailTemplatesResponse

        input = Types::ListCustomVerificationEmailTemplatesRequest.new(max_results: max_results, next_token: next_token)
        list_custom_verification_email_templates(input)
      end

      def list_custom_verification_email_templates(input : Types::ListCustomVerificationEmailTemplatesRequest) : Types::ListCustomVerificationEmailTemplatesResponse
        request = Protocol::Query.build_request(Model::LIST_CUSTOM_VERIFICATION_EMAIL_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListCustomVerificationEmailTemplatesResponse, "ListCustomVerificationEmailTemplates")
      end

      # Returns a list containing all of the identities (email addresses and domains) for your Amazon Web
      # Services account in the current Amazon Web Services Region, regardless of verification status. You
      # can execute this operation no more than once per second. It's recommended that for successive
      # pagination calls of this API, you continue to the use the same parameter/value pairs as used in the
      # original call, e.g., if you used IdentityType=Domain in the the original call and received a
      # NextToken in the response, you should continue providing the IdentityType=Domain parameter for
      # further NextToken calls; however, if you didn't provide the IdentityType parameter in the original
      # call, then continue to not provide it for successive pagination calls. Using this protocol will
      # ensure consistent results.

      def list_identities(
        identity_type : String? = nil,
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListIdentitiesResponse

        input = Types::ListIdentitiesRequest.new(identity_type: identity_type, max_items: max_items, next_token: next_token)
        list_identities(input)
      end

      def list_identities(input : Types::ListIdentitiesRequest) : Types::ListIdentitiesResponse
        request = Protocol::Query.build_request(Model::LIST_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListIdentitiesResponse, "ListIdentities")
      end

      # Returns a list of sending authorization policies that are attached to the given identity (an email
      # address or a domain). This operation returns only a list. To get the actual policy content, use
      # GetIdentityPolicies . This operation is for the identity owner only. If you have not verified the
      # identity, it returns an error. Sending authorization is a feature that enables an identity owner to
      # authorize other senders to use its identities. For information about using sending authorization,
      # see the Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def list_identity_policies(
        identity : String
      ) : Types::ListIdentityPoliciesResponse

        input = Types::ListIdentityPoliciesRequest.new(identity: identity)
        list_identity_policies(input)
      end

      def list_identity_policies(input : Types::ListIdentityPoliciesRequest) : Types::ListIdentityPoliciesResponse
        request = Protocol::Query.build_request(Model::LIST_IDENTITY_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListIdentityPoliciesResponse, "ListIdentityPolicies")
      end

      # Lists the IP address filters associated with your Amazon Web Services account in the current Amazon
      # Web Services Region. For information about managing IP address filters, see the Amazon SES Developer
      # Guide . You can execute this operation no more than once per second.

      def list_receipt_filters : Types::ListReceiptFiltersResponse
        input = Types::ListReceiptFiltersRequest.new
        list_receipt_filters(input)
      end

      def list_receipt_filters(input : Types::ListReceiptFiltersRequest) : Types::ListReceiptFiltersResponse
        request = Protocol::Query.build_request(Model::LIST_RECEIPT_FILTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListReceiptFiltersResponse, "ListReceiptFilters")
      end

      # Lists the receipt rule sets that exist under your Amazon Web Services account in the current Amazon
      # Web Services Region. If there are additional receipt rule sets to be retrieved, you receive a
      # NextToken that you can provide to the next call to ListReceiptRuleSets to retrieve the additional
      # entries. For information about managing receipt rule sets, see the Amazon SES Developer Guide . You
      # can execute this operation no more than once per second.

      def list_receipt_rule_sets(
        next_token : String? = nil
      ) : Types::ListReceiptRuleSetsResponse

        input = Types::ListReceiptRuleSetsRequest.new(next_token: next_token)
        list_receipt_rule_sets(input)
      end

      def list_receipt_rule_sets(input : Types::ListReceiptRuleSetsRequest) : Types::ListReceiptRuleSetsResponse
        request = Protocol::Query.build_request(Model::LIST_RECEIPT_RULE_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListReceiptRuleSetsResponse, "ListReceiptRuleSets")
      end

      # Lists the email templates present in your Amazon SES account in the current Amazon Web Services
      # Region. You can execute this operation no more than once per second.

      def list_templates(
        max_items : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTemplatesResponse

        input = Types::ListTemplatesRequest.new(max_items: max_items, next_token: next_token)
        list_templates(input)
      end

      def list_templates(input : Types::ListTemplatesRequest) : Types::ListTemplatesResponse
        request = Protocol::Query.build_request(Model::LIST_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTemplatesResponse, "ListTemplates")
      end

      # Deprecated. Use the ListIdentities operation to list the email addresses and domains associated with
      # your account.


      def list_verified_email_addresses : Types::ListVerifiedEmailAddressesResponse
        request = Protocol::Query.build_request(Model::LIST_VERIFIED_EMAIL_ADDRESSES, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListVerifiedEmailAddressesResponse, "ListVerifiedEmailAddresses")
      end

      # Adds or updates the delivery options for a configuration set.

      def put_configuration_set_delivery_options(
        configuration_set_name : String,
        delivery_options : Types::DeliveryOptions? = nil
      ) : Types::PutConfigurationSetDeliveryOptionsResponse

        input = Types::PutConfigurationSetDeliveryOptionsRequest.new(configuration_set_name: configuration_set_name, delivery_options: delivery_options)
        put_configuration_set_delivery_options(input)
      end

      def put_configuration_set_delivery_options(input : Types::PutConfigurationSetDeliveryOptionsRequest) : Types::PutConfigurationSetDeliveryOptionsResponse
        request = Protocol::Query.build_request(Model::PUT_CONFIGURATION_SET_DELIVERY_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PutConfigurationSetDeliveryOptionsResponse, "PutConfigurationSetDeliveryOptions")
      end

      # Adds or updates a sending authorization policy for the specified identity (an email address or a
      # domain). This operation is for the identity owner only. If you have not verified the identity, it
      # returns an error. Sending authorization is a feature that enables an identity owner to authorize
      # other senders to use its identities. For information about using sending authorization, see the
      # Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def put_identity_policy(
        identity : String,
        policy : String,
        policy_name : String
      ) : Types::PutIdentityPolicyResponse

        input = Types::PutIdentityPolicyRequest.new(identity: identity, policy: policy, policy_name: policy_name)
        put_identity_policy(input)
      end

      def put_identity_policy(input : Types::PutIdentityPolicyRequest) : Types::PutIdentityPolicyResponse
        request = Protocol::Query.build_request(Model::PUT_IDENTITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PutIdentityPolicyResponse, "PutIdentityPolicy")
      end

      # Reorders the receipt rules within a receipt rule set. All of the rules in the rule set must be
      # represented in this request. That is, it is error if the reorder request doesn't explicitly position
      # all of the rules. For information about managing receipt rule sets, see the Amazon SES Developer
      # Guide . You can execute this operation no more than once per second.

      def reorder_receipt_rule_set(
        rule_names : Array(String),
        rule_set_name : String
      ) : Types::ReorderReceiptRuleSetResponse

        input = Types::ReorderReceiptRuleSetRequest.new(rule_names: rule_names, rule_set_name: rule_set_name)
        reorder_receipt_rule_set(input)
      end

      def reorder_receipt_rule_set(input : Types::ReorderReceiptRuleSetRequest) : Types::ReorderReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::REORDER_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ReorderReceiptRuleSetResponse, "ReorderReceiptRuleSet")
      end

      # Generates and sends a bounce message to the sender of an email you received through Amazon SES. You
      # can only use this operation on an email up to 24 hours after you receive it. You cannot use this
      # operation to send generic bounces for mail that was not received by Amazon SES. For information
      # about receiving email through Amazon SES, see the Amazon SES Developer Guide . You can execute this
      # operation no more than once per second.

      def send_bounce(
        bounce_sender : String,
        bounced_recipient_info_list : Array(Types::BouncedRecipientInfo),
        original_message_id : String,
        bounce_sender_arn : String? = nil,
        explanation : String? = nil,
        message_dsn : Types::MessageDsn? = nil
      ) : Types::SendBounceResponse

        input = Types::SendBounceRequest.new(bounce_sender: bounce_sender, bounced_recipient_info_list: bounced_recipient_info_list, original_message_id: original_message_id, bounce_sender_arn: bounce_sender_arn, explanation: explanation, message_dsn: message_dsn)
        send_bounce(input)
      end

      def send_bounce(input : Types::SendBounceRequest) : Types::SendBounceResponse
        request = Protocol::Query.build_request(Model::SEND_BOUNCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendBounceResponse, "SendBounce")
      end

      # Composes an email message to multiple destinations. The message body is created using an email
      # template. To send email using this operation, your call must meet the following requirements: The
      # call must refer to an existing email template. You can create email templates using CreateTemplate .
      # The message must be sent from a verified email address or domain. If your account is still in the
      # Amazon SES sandbox, you may send only to verified addresses or domains, or to email addresses
      # associated with the Amazon SES Mailbox Simulator. For more information, see Verifying Email
      # Addresses and Domains in the Amazon SES Developer Guide. The maximum message size is 10 MB. Each
      # Destination parameter must include at least one recipient email address. The recipient address can
      # be a To: address, a CC: address, or a BCC: address. If a recipient email address is invalid (that
      # is, it is not in the format UserName@[SubDomain.]Domain.TopLevelDomain ), the entire message is
      # rejected, even if the message contains other recipients that are valid. The message may not include
      # more than 50 recipients, across the To:, CC: and BCC: fields. If you need to send an email message
      # to a larger audience, you can divide your recipient list into groups of 50 or fewer, and then call
      # the SendBulkTemplatedEmail operation several times to send the message to each group. The number of
      # destinations you can contact in a single call can be limited by your account's maximum sending rate.

      def send_bulk_templated_email(
        default_template_data : String,
        destinations : Array(Types::BulkEmailDestination),
        source : String,
        template : String,
        configuration_set_name : String? = nil,
        default_tags : Array(Types::MessageTag)? = nil,
        reply_to_addresses : Array(String)? = nil,
        return_path : String? = nil,
        return_path_arn : String? = nil,
        source_arn : String? = nil,
        template_arn : String? = nil
      ) : Types::SendBulkTemplatedEmailResponse

        input = Types::SendBulkTemplatedEmailRequest.new(default_template_data: default_template_data, destinations: destinations, source: source, template: template, configuration_set_name: configuration_set_name, default_tags: default_tags, reply_to_addresses: reply_to_addresses, return_path: return_path, return_path_arn: return_path_arn, source_arn: source_arn, template_arn: template_arn)
        send_bulk_templated_email(input)
      end

      def send_bulk_templated_email(input : Types::SendBulkTemplatedEmailRequest) : Types::SendBulkTemplatedEmailResponse
        request = Protocol::Query.build_request(Model::SEND_BULK_TEMPLATED_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendBulkTemplatedEmailResponse, "SendBulkTemplatedEmail")
      end

      # Adds an email address to the list of identities for your Amazon SES account in the current Amazon
      # Web Services Region and attempts to verify it. As a result of executing this operation, a customized
      # verification email is sent to the specified address. To use this operation, you must first create a
      # custom verification email template. For more information about creating and using custom
      # verification email templates, see Using Custom Verification Email Templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def send_custom_verification_email(
        email_address : String,
        template_name : String,
        configuration_set_name : String? = nil
      ) : Types::SendCustomVerificationEmailResponse

        input = Types::SendCustomVerificationEmailRequest.new(email_address: email_address, template_name: template_name, configuration_set_name: configuration_set_name)
        send_custom_verification_email(input)
      end

      def send_custom_verification_email(input : Types::SendCustomVerificationEmailRequest) : Types::SendCustomVerificationEmailResponse
        request = Protocol::Query.build_request(Model::SEND_CUSTOM_VERIFICATION_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendCustomVerificationEmailResponse, "SendCustomVerificationEmail")
      end

      # Composes an email message and immediately queues it for sending. To send email using this operation,
      # your message must meet the following requirements: The message must be sent from a verified email
      # address or domain. If you attempt to send email using a non-verified address or domain, the
      # operation results in an "Email address not verified" error. If your account is still in the Amazon
      # SES sandbox, you may only send to verified addresses or domains, or to email addresses associated
      # with the Amazon SES Mailbox Simulator. For more information, see Verifying Email Addresses and
      # Domains in the Amazon SES Developer Guide. The maximum message size is 10 MB. The message must
      # include at least one recipient email address. The recipient address can be a To: address, a CC:
      # address, or a BCC: address. If a recipient email address is invalid (that is, it is not in the
      # format UserName@[SubDomain.]Domain.TopLevelDomain ), the entire message is rejected, even if the
      # message contains other recipients that are valid. The message may not include more than 50
      # recipients, across the To:, CC: and BCC: fields. If you need to send an email message to a larger
      # audience, you can divide your recipient list into groups of 50 or fewer, and then call the SendEmail
      # operation several times to send the message to each group. For every message that you send, the
      # total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted
      # against the maximum number of emails you can send in a 24-hour period (your sending quota ). For
      # more information about sending quotas in Amazon SES, see Managing Your Amazon SES Sending Limits in
      # the Amazon SES Developer Guide.

      def send_email(
        destination : Types::Destination,
        message : Types::Message,
        source : String,
        configuration_set_name : String? = nil,
        reply_to_addresses : Array(String)? = nil,
        return_path : String? = nil,
        return_path_arn : String? = nil,
        source_arn : String? = nil,
        tags : Array(Types::MessageTag)? = nil
      ) : Types::SendEmailResponse

        input = Types::SendEmailRequest.new(destination: destination, message: message, source: source, configuration_set_name: configuration_set_name, reply_to_addresses: reply_to_addresses, return_path: return_path, return_path_arn: return_path_arn, source_arn: source_arn, tags: tags)
        send_email(input)
      end

      def send_email(input : Types::SendEmailRequest) : Types::SendEmailResponse
        request = Protocol::Query.build_request(Model::SEND_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendEmailResponse, "SendEmail")
      end

      # Composes an email message and immediately queues it for sending. This operation is more flexible
      # than the SendEmail operation. When you use the SendRawEmail operation, you can specify the headers
      # of the message as well as its content. This flexibility is useful, for example, when you need to
      # send a multipart MIME email (such a message that contains both a text and an HTML version). You can
      # also use this operation to send messages that include attachments. The SendRawEmail operation has
      # the following requirements: You can only send email from verified email addresses or domains . If
      # you try to send email from an address that isn't verified, the operation results in an "Email
      # address not verified" error. If your account is still in the Amazon SES sandbox , you can only send
      # email to other verified addresses in your account, or to addresses that are associated with the
      # Amazon SES mailbox simulator . The maximum message size, including attachments, is 10 MB. Each
      # message has to include at least one recipient address. A recipient address includes any address on
      # the To:, CC:, or BCC: lines. If you send a single message to more than one recipient address, and
      # one of the recipient addresses isn't in a valid format (that is, it's not in the format
      # UserName@[SubDomain.]Domain.TopLevelDomain ), Amazon SES rejects the entire message, even if the
      # other addresses are valid. Each message can include up to 50 recipient addresses across the To:,
      # CC:, or BCC: lines. If you need to send a single message to more than 50 recipients, you have to
      # split the list of recipient addresses into groups of less than 50 recipients, and send separate
      # messages to each group. Amazon SES allows you to specify 8-bit Content-Transfer-Encoding for MIME
      # message parts. However, if Amazon SES has to modify the contents of your message (for example, if
      # you use open and click tracking), 8-bit content isn't preserved. For this reason, we highly
      # recommend that you encode all content that isn't 7-bit ASCII. For more information, see MIME
      # Encoding in the Amazon SES Developer Guide . Additionally, keep the following considerations in mind
      # when using the SendRawEmail operation: Although you can customize the message headers when using the
      # SendRawEmail operation, Amazon SES automatically applies its own Message-ID and Date headers; if you
      # passed these headers when creating the message, they are overwritten by the values that Amazon SES
      # provides. If you are using sending authorization to send on behalf of another user, SendRawEmail
      # enables you to specify the cross-account identity for the email's Source, From, and Return-Path
      # parameters in one of two ways: you can pass optional parameters SourceArn , FromArn , and/or
      # ReturnPathArn , or you can include the following X-headers in the header of your raw email:
      # X-SES-SOURCE-ARN X-SES-FROM-ARN X-SES-RETURN-PATH-ARN Don't include these X-headers in the DKIM
      # signature. Amazon SES removes these before it sends the email. If you only specify the
      # SourceIdentityArn parameter, Amazon SES sets the From and Return-Path addresses to the same identity
      # that you specified. For more information about sending authorization, see the Using Sending
      # Authorization with Amazon SES in the Amazon SES Developer Guide. For every message that you send,
      # the total number of recipients (including each recipient in the To:, CC: and BCC: fields) is counted
      # against the maximum number of emails you can send in a 24-hour period (your sending quota ). For
      # more information about sending quotas in Amazon SES, see Managing Your Amazon SES Sending Limits in
      # the Amazon SES Developer Guide.

      def send_raw_email(
        raw_message : Types::RawMessage,
        configuration_set_name : String? = nil,
        destinations : Array(String)? = nil,
        from_arn : String? = nil,
        return_path_arn : String? = nil,
        source : String? = nil,
        source_arn : String? = nil,
        tags : Array(Types::MessageTag)? = nil
      ) : Types::SendRawEmailResponse

        input = Types::SendRawEmailRequest.new(raw_message: raw_message, configuration_set_name: configuration_set_name, destinations: destinations, from_arn: from_arn, return_path_arn: return_path_arn, source: source, source_arn: source_arn, tags: tags)
        send_raw_email(input)
      end

      def send_raw_email(input : Types::SendRawEmailRequest) : Types::SendRawEmailResponse
        request = Protocol::Query.build_request(Model::SEND_RAW_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendRawEmailResponse, "SendRawEmail")
      end

      # Composes an email message using an email template and immediately queues it for sending. To send
      # email using this operation, your call must meet the following requirements: The call must refer to
      # an existing email template. You can create email templates using the CreateTemplate operation. The
      # message must be sent from a verified email address or domain. If your account is still in the Amazon
      # SES sandbox, you may only send to verified addresses or domains, or to email addresses associated
      # with the Amazon SES Mailbox Simulator. For more information, see Verifying Email Addresses and
      # Domains in the Amazon SES Developer Guide. The maximum message size is 10 MB. Calls to the
      # SendTemplatedEmail operation may only include one Destination parameter. A destination is a set of
      # recipients that receives the same version of the email. The Destination parameter can include up to
      # 50 recipients, across the To:, CC: and BCC: fields. The Destination parameter must include at least
      # one recipient email address. The recipient address can be a To: address, a CC: address, or a BCC:
      # address. If a recipient email address is invalid (that is, it is not in the format
      # UserName@[SubDomain.]Domain.TopLevelDomain ), the entire message is rejected, even if the message
      # contains other recipients that are valid. If your call to the SendTemplatedEmail operation includes
      # all of the required parameters, Amazon SES accepts it and returns a Message ID. However, if Amazon
      # SES can't render the email because the template contains errors, it doesn't send the email.
      # Additionally, because it already accepted the message, Amazon SES doesn't return a message stating
      # that it was unable to send the email. For these reasons, we highly recommend that you set up Amazon
      # SES to send you notifications when Rendering Failure events occur. For more information, see Sending
      # Personalized Email Using the Amazon SES API in the Amazon Simple Email Service Developer Guide .

      def send_templated_email(
        destination : Types::Destination,
        source : String,
        template : String,
        template_data : String,
        configuration_set_name : String? = nil,
        reply_to_addresses : Array(String)? = nil,
        return_path : String? = nil,
        return_path_arn : String? = nil,
        source_arn : String? = nil,
        tags : Array(Types::MessageTag)? = nil,
        template_arn : String? = nil
      ) : Types::SendTemplatedEmailResponse

        input = Types::SendTemplatedEmailRequest.new(destination: destination, source: source, template: template, template_data: template_data, configuration_set_name: configuration_set_name, reply_to_addresses: reply_to_addresses, return_path: return_path, return_path_arn: return_path_arn, source_arn: source_arn, tags: tags, template_arn: template_arn)
        send_templated_email(input)
      end

      def send_templated_email(input : Types::SendTemplatedEmailRequest) : Types::SendTemplatedEmailResponse
        request = Protocol::Query.build_request(Model::SEND_TEMPLATED_EMAIL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SendTemplatedEmailResponse, "SendTemplatedEmail")
      end

      # Sets the specified receipt rule set as the active receipt rule set. To disable your email-receiving
      # through Amazon SES completely, you can call this operation with RuleSetName set to null. For
      # information about managing receipt rule sets, see the Amazon SES Developer Guide . You can execute
      # this operation no more than once per second.

      def set_active_receipt_rule_set(
        rule_set_name : String? = nil
      ) : Types::SetActiveReceiptRuleSetResponse

        input = Types::SetActiveReceiptRuleSetRequest.new(rule_set_name: rule_set_name)
        set_active_receipt_rule_set(input)
      end

      def set_active_receipt_rule_set(input : Types::SetActiveReceiptRuleSetRequest) : Types::SetActiveReceiptRuleSetResponse
        request = Protocol::Query.build_request(Model::SET_ACTIVE_RECEIPT_RULE_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetActiveReceiptRuleSetResponse, "SetActiveReceiptRuleSet")
      end

      # Enables or disables Easy DKIM signing of email sent from an identity. If Easy DKIM signing is
      # enabled for a domain, then Amazon SES uses DKIM to sign all email that it sends from addresses on
      # that domain. If Easy DKIM signing is enabled for an email address, then Amazon SES uses DKIM to sign
      # all email it sends from that address. For email addresses (for example, user@example.com ), you can
      # only enable DKIM signing if the corresponding domain (in this case, example.com ) has been set up to
      # use Easy DKIM. You can enable DKIM signing for an identity at any time after you start the
      # verification process for the identity, even if the verification process isn't complete. You can
      # execute this operation no more than once per second. For more information about Easy DKIM signing,
      # go to the Amazon SES Developer Guide .

      def set_identity_dkim_enabled(
        dkim_enabled : Bool,
        identity : String
      ) : Types::SetIdentityDkimEnabledResponse

        input = Types::SetIdentityDkimEnabledRequest.new(dkim_enabled: dkim_enabled, identity: identity)
        set_identity_dkim_enabled(input)
      end

      def set_identity_dkim_enabled(input : Types::SetIdentityDkimEnabledRequest) : Types::SetIdentityDkimEnabledResponse
        request = Protocol::Query.build_request(Model::SET_IDENTITY_DKIM_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIdentityDkimEnabledResponse, "SetIdentityDkimEnabled")
      end

      # Given an identity (an email address or a domain), enables or disables whether Amazon SES forwards
      # bounce and complaint notifications as email. Feedback forwarding can only be disabled when Amazon
      # Simple Notification Service (Amazon SNS) topics are specified for both bounces and complaints.
      # Feedback forwarding does not apply to delivery notifications. Delivery notifications are only
      # available through Amazon SNS. You can execute this operation no more than once per second. For more
      # information about using notifications with Amazon SES, see the Amazon SES Developer Guide .

      def set_identity_feedback_forwarding_enabled(
        forwarding_enabled : Bool,
        identity : String
      ) : Types::SetIdentityFeedbackForwardingEnabledResponse

        input = Types::SetIdentityFeedbackForwardingEnabledRequest.new(forwarding_enabled: forwarding_enabled, identity: identity)
        set_identity_feedback_forwarding_enabled(input)
      end

      def set_identity_feedback_forwarding_enabled(input : Types::SetIdentityFeedbackForwardingEnabledRequest) : Types::SetIdentityFeedbackForwardingEnabledResponse
        request = Protocol::Query.build_request(Model::SET_IDENTITY_FEEDBACK_FORWARDING_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIdentityFeedbackForwardingEnabledResponse, "SetIdentityFeedbackForwardingEnabled")
      end

      # Given an identity (an email address or a domain), sets whether Amazon SES includes the original
      # email headers in the Amazon Simple Notification Service (Amazon SNS) notifications of a specified
      # type. You can execute this operation no more than once per second. For more information about using
      # notifications with Amazon SES, see the Amazon SES Developer Guide .

      def set_identity_headers_in_notifications_enabled(
        enabled : Bool,
        identity : String,
        notification_type : String
      ) : Types::SetIdentityHeadersInNotificationsEnabledResponse

        input = Types::SetIdentityHeadersInNotificationsEnabledRequest.new(enabled: enabled, identity: identity, notification_type: notification_type)
        set_identity_headers_in_notifications_enabled(input)
      end

      def set_identity_headers_in_notifications_enabled(input : Types::SetIdentityHeadersInNotificationsEnabledRequest) : Types::SetIdentityHeadersInNotificationsEnabledResponse
        request = Protocol::Query.build_request(Model::SET_IDENTITY_HEADERS_IN_NOTIFICATIONS_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIdentityHeadersInNotificationsEnabledResponse, "SetIdentityHeadersInNotificationsEnabled")
      end

      # Enables or disables the custom MAIL FROM domain setup for a verified identity (an email address or a
      # domain). To send emails using the specified MAIL FROM domain, you must add an MX record to your MAIL
      # FROM domain's DNS settings. To ensure that your emails pass Sender Policy Framework (SPF) checks,
      # you must also add or update an SPF record. For more information, see the Amazon SES Developer Guide
      # . You can execute this operation no more than once per second.

      def set_identity_mail_from_domain(
        identity : String,
        behavior_on_mx_failure : String? = nil,
        mail_from_domain : String? = nil
      ) : Types::SetIdentityMailFromDomainResponse

        input = Types::SetIdentityMailFromDomainRequest.new(identity: identity, behavior_on_mx_failure: behavior_on_mx_failure, mail_from_domain: mail_from_domain)
        set_identity_mail_from_domain(input)
      end

      def set_identity_mail_from_domain(input : Types::SetIdentityMailFromDomainRequest) : Types::SetIdentityMailFromDomainResponse
        request = Protocol::Query.build_request(Model::SET_IDENTITY_MAIL_FROM_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIdentityMailFromDomainResponse, "SetIdentityMailFromDomain")
      end

      # Sets an Amazon Simple Notification Service (Amazon SNS) topic to use when delivering notifications.
      # When you use this operation, you specify a verified identity, such as an email address or domain.
      # When you send an email that uses the chosen identity in the Source field, Amazon SES sends
      # notifications to the topic you specified. You can send bounce, complaint, or delivery notifications
      # (or any combination of the three) to the Amazon SNS topic that you specify. You can execute this
      # operation no more than once per second. For more information about feedback notification, see the
      # Amazon SES Developer Guide .

      def set_identity_notification_topic(
        identity : String,
        notification_type : String,
        sns_topic : String? = nil
      ) : Types::SetIdentityNotificationTopicResponse

        input = Types::SetIdentityNotificationTopicRequest.new(identity: identity, notification_type: notification_type, sns_topic: sns_topic)
        set_identity_notification_topic(input)
      end

      def set_identity_notification_topic(input : Types::SetIdentityNotificationTopicRequest) : Types::SetIdentityNotificationTopicResponse
        request = Protocol::Query.build_request(Model::SET_IDENTITY_NOTIFICATION_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetIdentityNotificationTopicResponse, "SetIdentityNotificationTopic")
      end

      # Sets the position of the specified receipt rule in the receipt rule set. For information about
      # managing receipt rules, see the Amazon SES Developer Guide . You can execute this operation no more
      # than once per second.

      def set_receipt_rule_position(
        rule_name : String,
        rule_set_name : String,
        after : String? = nil
      ) : Types::SetReceiptRulePositionResponse

        input = Types::SetReceiptRulePositionRequest.new(rule_name: rule_name, rule_set_name: rule_set_name, after: after)
        set_receipt_rule_position(input)
      end

      def set_receipt_rule_position(input : Types::SetReceiptRulePositionRequest) : Types::SetReceiptRulePositionResponse
        request = Protocol::Query.build_request(Model::SET_RECEIPT_RULE_POSITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetReceiptRulePositionResponse, "SetReceiptRulePosition")
      end

      # Creates a preview of the MIME content of an email when provided with a template and a set of
      # replacement data. You can execute this operation no more than once per second.

      def test_render_template(
        template_data : String,
        template_name : String
      ) : Types::TestRenderTemplateResponse

        input = Types::TestRenderTemplateRequest.new(template_data: template_data, template_name: template_name)
        test_render_template(input)
      end

      def test_render_template(input : Types::TestRenderTemplateRequest) : Types::TestRenderTemplateResponse
        request = Protocol::Query.build_request(Model::TEST_RENDER_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TestRenderTemplateResponse, "TestRenderTemplate")
      end

      # Enables or disables email sending across your entire Amazon SES account in the current Amazon Web
      # Services Region. You can use this operation in conjunction with Amazon CloudWatch alarms to
      # temporarily pause email sending across your Amazon SES account in a given Amazon Web Services Region
      # when reputation metrics (such as your bounce or complaint rates) reach certain thresholds. You can
      # execute this operation no more than once per second.

      def update_account_sending_enabled(
        enabled : Bool? = nil
      ) : Nil

        input = Types::UpdateAccountSendingEnabledRequest.new(enabled: enabled)
        update_account_sending_enabled(input)
      end

      def update_account_sending_enabled(input : Types::UpdateAccountSendingEnabledRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_ACCOUNT_SENDING_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the event destination of a configuration set. Event destinations are associated with
      # configuration sets, which enable you to publish email sending events to Amazon CloudWatch, Amazon
      # Kinesis Firehose, or Amazon Simple Notification Service (Amazon SNS). For information about using
      # configuration sets, see Monitoring Your Amazon SES Sending Activity in the Amazon SES Developer
      # Guide. When you create or update an event destination, you must provide one, and only one,
      # destination. The destination can be Amazon CloudWatch, Amazon Kinesis Firehose, or Amazon Simple
      # Notification Service (Amazon SNS). You can execute this operation no more than once per second.

      def update_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestination
      ) : Types::UpdateConfigurationSetEventDestinationResponse

        input = Types::UpdateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination)
        update_configuration_set_event_destination(input)
      end

      def update_configuration_set_event_destination(input : Types::UpdateConfigurationSetEventDestinationRequest) : Types::UpdateConfigurationSetEventDestinationResponse
        request = Protocol::Query.build_request(Model::UPDATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateConfigurationSetEventDestinationResponse, "UpdateConfigurationSetEventDestination")
      end

      # Enables or disables the publishing of reputation metrics for emails sent using a specific
      # configuration set in a given Amazon Web Services Region. Reputation metrics include bounce and
      # complaint rates. These metrics are published to Amazon CloudWatch. By using CloudWatch, you can
      # create alarms when bounce or complaint rates exceed certain thresholds. You can execute this
      # operation no more than once per second.

      def update_configuration_set_reputation_metrics_enabled(
        configuration_set_name : String,
        enabled : Bool
      ) : Nil

        input = Types::UpdateConfigurationSetReputationMetricsEnabledRequest.new(configuration_set_name: configuration_set_name, enabled: enabled)
        update_configuration_set_reputation_metrics_enabled(input)
      end

      def update_configuration_set_reputation_metrics_enabled(input : Types::UpdateConfigurationSetReputationMetricsEnabledRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_CONFIGURATION_SET_REPUTATION_METRICS_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Enables or disables email sending for messages sent using a specific configuration set in a given
      # Amazon Web Services Region. You can use this operation in conjunction with Amazon CloudWatch alarms
      # to temporarily pause email sending for a configuration set when the reputation metrics for that
      # configuration set (such as your bounce on complaint rate) exceed certain thresholds. You can execute
      # this operation no more than once per second.

      def update_configuration_set_sending_enabled(
        configuration_set_name : String,
        enabled : Bool
      ) : Nil

        input = Types::UpdateConfigurationSetSendingEnabledRequest.new(configuration_set_name: configuration_set_name, enabled: enabled)
        update_configuration_set_sending_enabled(input)
      end

      def update_configuration_set_sending_enabled(input : Types::UpdateConfigurationSetSendingEnabledRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_CONFIGURATION_SET_SENDING_ENABLED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Modifies an association between a configuration set and a custom domain for open and click event
      # tracking. By default, images and links used for tracking open and click events are hosted on domains
      # operated by Amazon SES. You can configure a subdomain of your own to handle these events. For
      # information about using custom domains, see the Amazon SES Developer Guide .

      def update_configuration_set_tracking_options(
        configuration_set_name : String,
        tracking_options : Types::TrackingOptions
      ) : Types::UpdateConfigurationSetTrackingOptionsResponse

        input = Types::UpdateConfigurationSetTrackingOptionsRequest.new(configuration_set_name: configuration_set_name, tracking_options: tracking_options)
        update_configuration_set_tracking_options(input)
      end

      def update_configuration_set_tracking_options(input : Types::UpdateConfigurationSetTrackingOptionsRequest) : Types::UpdateConfigurationSetTrackingOptionsResponse
        request = Protocol::Query.build_request(Model::UPDATE_CONFIGURATION_SET_TRACKING_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateConfigurationSetTrackingOptionsResponse, "UpdateConfigurationSetTrackingOptions")
      end

      # Updates an existing custom verification email template. For more information about custom
      # verification email templates, see Using Custom Verification Email Templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def update_custom_verification_email_template(
        template_name : String,
        failure_redirection_url : String? = nil,
        from_email_address : String? = nil,
        success_redirection_url : String? = nil,
        template_content : String? = nil,
        template_subject : String? = nil
      ) : Nil

        input = Types::UpdateCustomVerificationEmailTemplateRequest.new(template_name: template_name, failure_redirection_url: failure_redirection_url, from_email_address: from_email_address, success_redirection_url: success_redirection_url, template_content: template_content, template_subject: template_subject)
        update_custom_verification_email_template(input)
      end

      def update_custom_verification_email_template(input : Types::UpdateCustomVerificationEmailTemplateRequest) : Nil
        request = Protocol::Query.build_request(Model::UPDATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a receipt rule. For information about managing receipt rules, see the Amazon SES Developer
      # Guide . You can execute this operation no more than once per second.

      def update_receipt_rule(
        rule : Types::ReceiptRule,
        rule_set_name : String
      ) : Types::UpdateReceiptRuleResponse

        input = Types::UpdateReceiptRuleRequest.new(rule: rule, rule_set_name: rule_set_name)
        update_receipt_rule(input)
      end

      def update_receipt_rule(input : Types::UpdateReceiptRuleRequest) : Types::UpdateReceiptRuleResponse
        request = Protocol::Query.build_request(Model::UPDATE_RECEIPT_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateReceiptRuleResponse, "UpdateReceiptRule")
      end

      # Updates an email template. Email templates enable you to send personalized email to one or more
      # destinations in a single operation. For more information, see the Amazon SES Developer Guide . You
      # can execute this operation no more than once per second.

      def update_template(
        template : Types::Template
      ) : Types::UpdateTemplateResponse

        input = Types::UpdateTemplateRequest.new(template: template)
        update_template(input)
      end

      def update_template(input : Types::UpdateTemplateRequest) : Types::UpdateTemplateResponse
        request = Protocol::Query.build_request(Model::UPDATE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UpdateTemplateResponse, "UpdateTemplate")
      end

      # Returns a set of DKIM tokens for a domain identity. When you execute the VerifyDomainDkim operation,
      # the domain that you specify is added to the list of identities that are associated with your
      # account. This is true even if you haven't already associated the domain with your account by using
      # the VerifyDomainIdentity operation. However, you can't send email from the domain until you either
      # successfully verify it or you successfully set up DKIM for it . You use the tokens that are
      # generated by this operation to create CNAME records. When Amazon SES detects that you've added these
      # records to the DNS configuration for a domain, you can start sending email from that domain. You can
      # start sending email even if you haven't added the TXT record provided by the VerifyDomainIdentity
      # operation to the DNS configuration for your domain. All email that you send from the domain is
      # authenticated using DKIM. To create the CNAME records for DKIM authentication, use the following
      # values: Name : token ._domainkey. example.com Type : CNAME Value : token .dkim.amazonses.com In the
      # preceding example, replace token with one of the tokens that are generated when you execute this
      # operation. Replace example.com with your domain. Repeat this process for each token that's generated
      # by this operation. You can execute this operation no more than once per second.

      def verify_domain_dkim(
        domain : String
      ) : Types::VerifyDomainDkimResponse

        input = Types::VerifyDomainDkimRequest.new(domain: domain)
        verify_domain_dkim(input)
      end

      def verify_domain_dkim(input : Types::VerifyDomainDkimRequest) : Types::VerifyDomainDkimResponse
        request = Protocol::Query.build_request(Model::VERIFY_DOMAIN_DKIM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::VerifyDomainDkimResponse, "VerifyDomainDkim")
      end

      # Adds a domain to the list of identities for your Amazon SES account in the current Amazon Web
      # Services Region and attempts to verify it. For more information about verifying domains, see
      # Verifying Email Addresses and Domains in the Amazon SES Developer Guide. You can execute this
      # operation no more than once per second.

      def verify_domain_identity(
        domain : String
      ) : Types::VerifyDomainIdentityResponse

        input = Types::VerifyDomainIdentityRequest.new(domain: domain)
        verify_domain_identity(input)
      end

      def verify_domain_identity(input : Types::VerifyDomainIdentityRequest) : Types::VerifyDomainIdentityResponse
        request = Protocol::Query.build_request(Model::VERIFY_DOMAIN_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::VerifyDomainIdentityResponse, "VerifyDomainIdentity")
      end

      # Deprecated. Use the VerifyEmailIdentity operation to verify a new email address.

      def verify_email_address(
        email_address : String
      ) : Nil

        input = Types::VerifyEmailAddressRequest.new(email_address: email_address)
        verify_email_address(input)
      end

      def verify_email_address(input : Types::VerifyEmailAddressRequest) : Nil
        request = Protocol::Query.build_request(Model::VERIFY_EMAIL_ADDRESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Adds an email address to the list of identities for your Amazon SES account in the current Amazon
      # Web Services Region and attempts to verify it. As a result of executing this operation, a
      # verification email is sent to the specified address. You can execute this operation no more than
      # once per second.

      def verify_email_identity(
        email_address : String
      ) : Types::VerifyEmailIdentityResponse

        input = Types::VerifyEmailIdentityRequest.new(email_address: email_address)
        verify_email_identity(input)
      end

      def verify_email_identity(input : Types::VerifyEmailIdentityRequest) : Types::VerifyEmailIdentityResponse
        request = Protocol::Query.build_request(Model::VERIFY_EMAIL_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::VerifyEmailIdentityResponse, "VerifyEmailIdentity")
      end
    end
  end
end
