module AwsSdk
  module SNS
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

      # Adds a statement to a topic's access control policy, granting access for the specified Amazon Web
      # Services accounts to the specified actions. To remove the ability to change topic permissions, you
      # must deny permissions to the AddPermission , RemovePermission , and SetTopicAttributes actions in
      # your IAM policy.
      def add_permission(
        aws_account_id : Array(String),
        action_name : Array(String),
        label : String,
        topic_arn : String
      ) : Nil
        input = Types::AddPermissionInput.new(aws_account_id: aws_account_id, action_name: action_name, label: label, topic_arn: topic_arn)
        add_permission(input)
      end
      def add_permission(input : Types::AddPermissionInput) : Nil
        request = Protocol::Query.build_request(Model::ADD_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS
      # messages from your Amazon Web Services account. You cannot send SMS messages to a number that is
      # opted out. To resume sending messages, you can opt in the number by using the OptInPhoneNumber
      # action.
      def check_if_phone_number_is_opted_out(
        phone_number : String
      ) : Types::CheckIfPhoneNumberIsOptedOutResponse
        input = Types::CheckIfPhoneNumberIsOptedOutInput.new(phone_number: phone_number)
        check_if_phone_number_is_opted_out(input)
      end
      def check_if_phone_number_is_opted_out(input : Types::CheckIfPhoneNumberIsOptedOutInput) : Types::CheckIfPhoneNumberIsOptedOutResponse
        request = Protocol::Query.build_request(Model::CHECK_IF_PHONE_NUMBER_IS_OPTED_OUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CheckIfPhoneNumberIsOptedOutResponse, "CheckIfPhoneNumberIsOptedOut")
      end

      # Verifies an endpoint owner's intent to receive messages by validating the token sent to the endpoint
      # by an earlier Subscribe action. If the token is valid, the action creates a new subscription and
      # returns its Amazon Resource Name (ARN). This call requires an AWS signature only when the
      # AuthenticateOnUnsubscribe flag is set to "true".
      def confirm_subscription(
        token : String,
        topic_arn : String,
        authenticate_on_unsubscribe : String? = nil
      ) : Types::ConfirmSubscriptionResponse
        input = Types::ConfirmSubscriptionInput.new(token: token, topic_arn: topic_arn, authenticate_on_unsubscribe: authenticate_on_unsubscribe)
        confirm_subscription(input)
      end
      def confirm_subscription(input : Types::ConfirmSubscriptionInput) : Types::ConfirmSubscriptionResponse
        request = Protocol::Query.build_request(Model::CONFIRM_SUBSCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ConfirmSubscriptionResponse, "ConfirmSubscription")
      end

      # Creates a platform application object for one of the supported push notification services, such as
      # APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You must
      # specify PlatformPrincipal and PlatformCredential attributes when using the CreatePlatformApplication
      # action. PlatformPrincipal and PlatformCredential are received from the notification service. For
      # ADM, PlatformPrincipal is client id and PlatformCredential is client secret . For APNS and
      # APNS_SANDBOX using certificate credentials, PlatformPrincipal is SSL certificate and
      # PlatformCredential is private key . For APNS and APNS_SANDBOX using token credentials,
      # PlatformPrincipal is signing key ID and PlatformCredential is signing key . For Baidu,
      # PlatformPrincipal is API key and PlatformCredential is secret key . For GCM (Firebase Cloud
      # Messaging) using key credentials, there is no PlatformPrincipal . The PlatformCredential is API key
      # . For GCM (Firebase Cloud Messaging) using token credentials, there is no PlatformPrincipal . The
      # PlatformCredential is a JSON formatted private key file. When using the Amazon Web Services CLI or
      # Amazon Web Services SDKs, the file must be in string format and special characters must be ignored.
      # To format the file correctly, Amazon SNS recommends using the following command: SERVICE_JSON=$(jq
      # @json &lt; service.json) . For MPNS, PlatformPrincipal is TLS certificate and PlatformCredential is
      # private key . For WNS, PlatformPrincipal is Package Security Identifier and PlatformCredential is
      # secret key . You can use the returned PlatformApplicationArn as an attribute for the
      # CreatePlatformEndpoint action.
      def create_platform_application(
        attributes : Hash(String, String),
        name : String,
        platform : String
      ) : Types::CreatePlatformApplicationResponse
        input = Types::CreatePlatformApplicationInput.new(attributes: attributes, name: name, platform: platform)
        create_platform_application(input)
      end
      def create_platform_application(input : Types::CreatePlatformApplicationInput) : Types::CreatePlatformApplicationResponse
        request = Protocol::Query.build_request(Model::CREATE_PLATFORM_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreatePlatformApplicationResponse, "CreatePlatformApplication")
      end

      # Creates an endpoint for a device and mobile app on one of the supported push notification services,
      # such as GCM (Firebase Cloud Messaging) and APNS. CreatePlatformEndpoint requires the
      # PlatformApplicationArn that is returned from CreatePlatformApplication . You can use the returned
      # EndpointArn to send a message to a mobile app or by the Subscribe action for subscription to a
      # topic. The CreatePlatformEndpoint action is idempotent, so if the requester already owns an endpoint
      # with the same device token and attributes, that endpoint's ARN is returned without creating a new
      # endpoint. For more information, see Using Amazon SNS Mobile Push Notifications . When using
      # CreatePlatformEndpoint with Baidu, two attributes must be provided: ChannelId and UserId. The token
      # field must also contain the ChannelId. For more information, see Creating an Amazon SNS Endpoint for
      # Baidu .
      def create_platform_endpoint(
        platform_application_arn : String,
        token : String,
        attributes : Hash(String, String)? = nil,
        custom_user_data : String? = nil
      ) : Types::CreateEndpointResponse
        input = Types::CreatePlatformEndpointInput.new(platform_application_arn: platform_application_arn, token: token, attributes: attributes, custom_user_data: custom_user_data)
        create_platform_endpoint(input)
      end
      def create_platform_endpoint(input : Types::CreatePlatformEndpointInput) : Types::CreateEndpointResponse
        request = Protocol::Query.build_request(Model::CREATE_PLATFORM_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateEndpointResponse, "CreatePlatformEndpoint")
      end

      # Adds a destination phone number to an Amazon Web Services account in the SMS sandbox and sends a
      # one-time password (OTP) to that phone number. When you start using Amazon SNS to send SMS messages,
      # your Amazon Web Services account is in the SMS sandbox . The SMS sandbox provides a safe environment
      # for you to try Amazon SNS features without risking your reputation as an SMS sender. While your
      # Amazon Web Services account is in the SMS sandbox, you can use all of the features of Amazon SNS.
      # However, you can send SMS messages only to verified destination phone numbers. For more information,
      # including how to move out of the sandbox to send messages without restrictions, see SMS sandbox in
      # the Amazon SNS Developer Guide .
      def create_sms_sandbox_phone_number(
        phone_number : String,
        language_code : String? = nil
      ) : Types::CreateSMSSandboxPhoneNumberResult
        input = Types::CreateSMSSandboxPhoneNumberInput.new(phone_number: phone_number, language_code: language_code)
        create_sms_sandbox_phone_number(input)
      end
      def create_sms_sandbox_phone_number(input : Types::CreateSMSSandboxPhoneNumberInput) : Types::CreateSMSSandboxPhoneNumberResult
        request = Protocol::Query.build_request(Model::CREATE_SMS_SANDBOX_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateSMSSandboxPhoneNumberResult, "CreateSMSSandboxPhoneNumber")
      end

      # Creates a topic to which notifications can be published. Users can create at most 100,000 standard
      # topics (at most 1,000 FIFO topics). For more information, see Creating an Amazon SNS topic in the
      # Amazon SNS Developer Guide . This action is idempotent, so if the requester already owns a topic
      # with the specified name, that topic's ARN is returned without creating a new topic.
      def create_topic(
        name : String,
        attributes : Hash(String, String)? = nil,
        data_protection_policy : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTopicResponse
        input = Types::CreateTopicInput.new(name: name, attributes: attributes, data_protection_policy: data_protection_policy, tags: tags)
        create_topic(input)
      end
      def create_topic(input : Types::CreateTopicInput) : Types::CreateTopicResponse
        request = Protocol::Query.build_request(Model::CREATE_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::CreateTopicResponse, "CreateTopic")
      end

      # Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For
      # more information, see Using Amazon SNS Mobile Push Notifications . When you delete an endpoint that
      # is also subscribed to a topic, then you must also unsubscribe the endpoint from the topic.
      def delete_endpoint(
        endpoint_arn : String
      ) : Nil
        input = Types::DeleteEndpointInput.new(endpoint_arn: endpoint_arn)
        delete_endpoint(input)
      end
      def delete_endpoint(input : Types::DeleteEndpointInput) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a platform application object for one of the supported push notification services, such as
      # APNS and GCM (Firebase Cloud Messaging). For more information, see Using Amazon SNS Mobile Push
      # Notifications .
      def delete_platform_application(
        platform_application_arn : String
      ) : Nil
        input = Types::DeletePlatformApplicationInput.new(platform_application_arn: platform_application_arn)
        delete_platform_application(input)
      end
      def delete_platform_application(input : Types::DeletePlatformApplicationInput) : Nil
        request = Protocol::Query.build_request(Model::DELETE_PLATFORM_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon Web Services account's verified or pending phone number from the SMS sandbox. When
      # you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the SMS
      # sandbox . The SMS sandbox provides a safe environment for you to try Amazon SNS features without
      # risking your reputation as an SMS sender. While your Amazon Web Services account is in the SMS
      # sandbox, you can use all of the features of Amazon SNS. However, you can send SMS messages only to
      # verified destination phone numbers. For more information, including how to move out of the sandbox
      # to send messages without restrictions, see SMS sandbox in the Amazon SNS Developer Guide .
      def delete_sms_sandbox_phone_number(
        phone_number : String
      ) : Types::DeleteSMSSandboxPhoneNumberResult
        input = Types::DeleteSMSSandboxPhoneNumberInput.new(phone_number: phone_number)
        delete_sms_sandbox_phone_number(input)
      end
      def delete_sms_sandbox_phone_number(input : Types::DeleteSMSSandboxPhoneNumberInput) : Types::DeleteSMSSandboxPhoneNumberResult
        request = Protocol::Query.build_request(Model::DELETE_SMS_SANDBOX_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DeleteSMSSandboxPhoneNumberResult, "DeleteSMSSandboxPhoneNumber")
      end

      # Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages previously
      # sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a
      # topic that does not exist does not result in an error.
      def delete_topic(
        topic_arn : String
      ) : Nil
        input = Types::DeleteTopicInput.new(topic_arn: topic_arn)
        delete_topic(input)
      end
      def delete_topic(input : Types::DeleteTopicInput) : Nil
        request = Protocol::Query.build_request(Model::DELETE_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Retrieves the specified inline DataProtectionPolicy document that is stored in the specified Amazon
      # SNS topic.
      def get_data_protection_policy(
        resource_arn : String
      ) : Types::GetDataProtectionPolicyResponse
        input = Types::GetDataProtectionPolicyInput.new(resource_arn: resource_arn)
        get_data_protection_policy(input)
      end
      def get_data_protection_policy(input : Types::GetDataProtectionPolicyInput) : Types::GetDataProtectionPolicyResponse
        request = Protocol::Query.build_request(Model::GET_DATA_PROTECTION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetDataProtectionPolicyResponse, "GetDataProtectionPolicy")
      end

      # Retrieves the endpoint attributes for a device on one of the supported push notification services,
      # such as GCM (Firebase Cloud Messaging) and APNS. For more information, see Using Amazon SNS Mobile
      # Push Notifications .
      def get_endpoint_attributes(
        endpoint_arn : String
      ) : Types::GetEndpointAttributesResponse
        input = Types::GetEndpointAttributesInput.new(endpoint_arn: endpoint_arn)
        get_endpoint_attributes(input)
      end
      def get_endpoint_attributes(input : Types::GetEndpointAttributesInput) : Types::GetEndpointAttributesResponse
        request = Protocol::Query.build_request(Model::GET_ENDPOINT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetEndpointAttributesResponse, "GetEndpointAttributes")
      end

      # Retrieves the attributes of the platform application object for the supported push notification
      # services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see Using Amazon
      # SNS Mobile Push Notifications .
      def get_platform_application_attributes(
        platform_application_arn : String
      ) : Types::GetPlatformApplicationAttributesResponse
        input = Types::GetPlatformApplicationAttributesInput.new(platform_application_arn: platform_application_arn)
        get_platform_application_attributes(input)
      end
      def get_platform_application_attributes(input : Types::GetPlatformApplicationAttributesInput) : Types::GetPlatformApplicationAttributesResponse
        request = Protocol::Query.build_request(Model::GET_PLATFORM_APPLICATION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetPlatformApplicationAttributesResponse, "GetPlatformApplicationAttributes")
      end

      # Returns the settings for sending SMS messages from your Amazon Web Services account. These settings
      # are set with the SetSMSAttributes action.
      def get_sms_attributes(
        attributes : Array(String)? = nil
      ) : Types::GetSMSAttributesResponse
        input = Types::GetSMSAttributesInput.new(attributes: attributes)
        get_sms_attributes(input)
      end
      def get_sms_attributes(input : Types::GetSMSAttributesInput) : Types::GetSMSAttributesResponse
        request = Protocol::Query.build_request(Model::GET_SMS_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSMSAttributesResponse, "GetSMSAttributes")
      end

      # Retrieves the SMS sandbox status for the calling Amazon Web Services account in the target Amazon
      # Web Services Region. When you start using Amazon SNS to send SMS messages, your Amazon Web Services
      # account is in the SMS sandbox . The SMS sandbox provides a safe environment for you to try Amazon
      # SNS features without risking your reputation as an SMS sender. While your Amazon Web Services
      # account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
      # SMS messages only to verified destination phone numbers. For more information, including how to move
      # out of the sandbox to send messages without restrictions, see SMS sandbox in the Amazon SNS
      # Developer Guide .
      def get_sms_sandbox_account_status : Types::GetSMSSandboxAccountStatusResult
        input = Types::GetSMSSandboxAccountStatusInput.new
        get_sms_sandbox_account_status(input)
      end
      def get_sms_sandbox_account_status(input : Types::GetSMSSandboxAccountStatusInput) : Types::GetSMSSandboxAccountStatusResult
        request = Protocol::Query.build_request(Model::GET_SMS_SANDBOX_ACCOUNT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSMSSandboxAccountStatusResult, "GetSMSSandboxAccountStatus")
      end

      # Returns all of the properties of a subscription.
      def get_subscription_attributes(
        subscription_arn : String
      ) : Types::GetSubscriptionAttributesResponse
        input = Types::GetSubscriptionAttributesInput.new(subscription_arn: subscription_arn)
        get_subscription_attributes(input)
      end
      def get_subscription_attributes(input : Types::GetSubscriptionAttributesInput) : Types::GetSubscriptionAttributesResponse
        request = Protocol::Query.build_request(Model::GET_SUBSCRIPTION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetSubscriptionAttributesResponse, "GetSubscriptionAttributes")
      end

      # Returns all of the properties of a topic. Topic properties returned might differ based on the
      # authorization of the user.
      def get_topic_attributes(
        topic_arn : String
      ) : Types::GetTopicAttributesResponse
        input = Types::GetTopicAttributesInput.new(topic_arn: topic_arn)
        get_topic_attributes(input)
      end
      def get_topic_attributes(input : Types::GetTopicAttributesInput) : Types::GetTopicAttributesResponse
        request = Protocol::Query.build_request(Model::GET_TOPIC_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetTopicAttributesResponse, "GetTopicAttributes")
      end

      # Lists the endpoints and endpoint attributes for devices in a supported push notification service,
      # such as GCM (Firebase Cloud Messaging) and APNS. The results for ListEndpointsByPlatformApplication
      # are paginated and return a limited list of endpoints, up to 100. If additional records are available
      # after the first page results, then a NextToken string will be returned. To receive the next page,
      # you call ListEndpointsByPlatformApplication again using the NextToken string received from the
      # previous call. When there are no more records to return, NextToken will be null. For more
      # information, see Using Amazon SNS Mobile Push Notifications . This action is throttled at 30
      # transactions per second (TPS).
      def list_endpoints_by_platform_application(
        platform_application_arn : String,
        next_token : String? = nil
      ) : Types::ListEndpointsByPlatformApplicationResponse
        input = Types::ListEndpointsByPlatformApplicationInput.new(platform_application_arn: platform_application_arn, next_token: next_token)
        list_endpoints_by_platform_application(input)
      end
      def list_endpoints_by_platform_application(input : Types::ListEndpointsByPlatformApplicationInput) : Types::ListEndpointsByPlatformApplicationResponse
        request = Protocol::Query.build_request(Model::LIST_ENDPOINTS_BY_PLATFORM_APPLICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListEndpointsByPlatformApplicationResponse, "ListEndpointsByPlatformApplication")
      end

      # Lists the calling Amazon Web Services account's dedicated origination numbers and their metadata.
      # For more information about origination numbers, see Origination numbers in the Amazon SNS Developer
      # Guide .
      def list_origination_numbers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOriginationNumbersResult
        input = Types::ListOriginationNumbersRequest.new(max_results: max_results, next_token: next_token)
        list_origination_numbers(input)
      end
      def list_origination_numbers(input : Types::ListOriginationNumbersRequest) : Types::ListOriginationNumbersResult
        request = Protocol::Query.build_request(Model::LIST_ORIGINATION_NUMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListOriginationNumbersResult, "ListOriginationNumbers")
      end

      # Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to them.
      # The results for ListPhoneNumbersOptedOut are paginated, and each page returns up to 100 phone
      # numbers. If additional phone numbers are available after the first page of results, then a NextToken
      # string will be returned. To receive the next page, you call ListPhoneNumbersOptedOut again using the
      # NextToken string received from the previous call. When there are no more records to return,
      # NextToken will be null.
      def list_phone_numbers_opted_out(
        next_token : String? = nil
      ) : Types::ListPhoneNumbersOptedOutResponse
        input = Types::ListPhoneNumbersOptedOutInput.new(next_token: next_token)
        list_phone_numbers_opted_out(input)
      end
      def list_phone_numbers_opted_out(input : Types::ListPhoneNumbersOptedOutInput) : Types::ListPhoneNumbersOptedOutResponse
        request = Protocol::Query.build_request(Model::LIST_PHONE_NUMBERS_OPTED_OUT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPhoneNumbersOptedOutResponse, "ListPhoneNumbersOptedOut")
      end

      # Lists the platform application objects for the supported push notification services, such as APNS
      # and GCM (Firebase Cloud Messaging). The results for ListPlatformApplications are paginated and
      # return a limited list of applications, up to 100. If additional records are available after the
      # first page results, then a NextToken string will be returned. To receive the next page, you call
      # ListPlatformApplications using the NextToken string received from the previous call. When there are
      # no more records to return, NextToken will be null. For more information, see Using Amazon SNS Mobile
      # Push Notifications . This action is throttled at 15 transactions per second (TPS).
      def list_platform_applications(
        next_token : String? = nil
      ) : Types::ListPlatformApplicationsResponse
        input = Types::ListPlatformApplicationsInput.new(next_token: next_token)
        list_platform_applications(input)
      end
      def list_platform_applications(input : Types::ListPlatformApplicationsInput) : Types::ListPlatformApplicationsResponse
        request = Protocol::Query.build_request(Model::LIST_PLATFORM_APPLICATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListPlatformApplicationsResponse, "ListPlatformApplications")
      end

      # Lists the calling Amazon Web Services account's current verified and pending destination phone
      # numbers in the SMS sandbox. When you start using Amazon SNS to send SMS messages, your Amazon Web
      # Services account is in the SMS sandbox . The SMS sandbox provides a safe environment for you to try
      # Amazon SNS features without risking your reputation as an SMS sender. While your Amazon Web Services
      # account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
      # SMS messages only to verified destination phone numbers. For more information, including how to move
      # out of the sandbox to send messages without restrictions, see SMS sandbox in the Amazon SNS
      # Developer Guide .
      def list_sms_sandbox_phone_numbers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSMSSandboxPhoneNumbersResult
        input = Types::ListSMSSandboxPhoneNumbersInput.new(max_results: max_results, next_token: next_token)
        list_sms_sandbox_phone_numbers(input)
      end
      def list_sms_sandbox_phone_numbers(input : Types::ListSMSSandboxPhoneNumbersInput) : Types::ListSMSSandboxPhoneNumbersResult
        request = Protocol::Query.build_request(Model::LIST_SMS_SANDBOX_PHONE_NUMBERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSMSSandboxPhoneNumbersResult, "ListSMSSandboxPhoneNumbers")
      end

      # Returns a list of the requester's subscriptions. Each call returns a limited list of subscriptions,
      # up to 100. If there are more subscriptions, a NextToken is also returned. Use the NextToken
      # parameter in a new ListSubscriptions call to get further results. This action is throttled at 30
      # transactions per second (TPS).
      def list_subscriptions(
        next_token : String? = nil
      ) : Types::ListSubscriptionsResponse
        input = Types::ListSubscriptionsInput.new(next_token: next_token)
        list_subscriptions(input)
      end
      def list_subscriptions(input : Types::ListSubscriptionsInput) : Types::ListSubscriptionsResponse
        request = Protocol::Query.build_request(Model::LIST_SUBSCRIPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSubscriptionsResponse, "ListSubscriptions")
      end

      # Returns a list of the subscriptions to a specific topic. Each call returns a limited list of
      # subscriptions, up to 100. If there are more subscriptions, a NextToken is also returned. Use the
      # NextToken parameter in a new ListSubscriptionsByTopic call to get further results. This action is
      # throttled at 30 transactions per second (TPS).
      def list_subscriptions_by_topic(
        topic_arn : String,
        next_token : String? = nil
      ) : Types::ListSubscriptionsByTopicResponse
        input = Types::ListSubscriptionsByTopicInput.new(topic_arn: topic_arn, next_token: next_token)
        list_subscriptions_by_topic(input)
      end
      def list_subscriptions_by_topic(input : Types::ListSubscriptionsByTopicInput) : Types::ListSubscriptionsByTopicResponse
        request = Protocol::Query.build_request(Model::LIST_SUBSCRIPTIONS_BY_TOPIC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListSubscriptionsByTopicResponse, "ListSubscriptionsByTopic")
      end

      # List all tags added to the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the
      # Amazon Simple Notification Service Developer Guide .
      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::Query.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100. If
      # there are more topics, a NextToken is also returned. Use the NextToken parameter in a new ListTopics
      # call to get further results. This action is throttled at 30 transactions per second (TPS).
      def list_topics(
        next_token : String? = nil
      ) : Types::ListTopicsResponse
        input = Types::ListTopicsInput.new(next_token: next_token)
        list_topics(input)
      end
      def list_topics(input : Types::ListTopicsInput) : Types::ListTopicsResponse
        request = Protocol::Query.build_request(Model::LIST_TOPICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListTopicsResponse, "ListTopics")
      end

      # Use this request to opt in a phone number that is opted out, which enables you to resume sending SMS
      # messages to the number. You can opt in a phone number only once every 30 days.
      def opt_in_phone_number(
        phone_number : String
      ) : Types::OptInPhoneNumberResponse
        input = Types::OptInPhoneNumberInput.new(phone_number: phone_number)
        opt_in_phone_number(input)
      end
      def opt_in_phone_number(input : Types::OptInPhoneNumberInput) : Types::OptInPhoneNumberResponse
        request = Protocol::Query.build_request(Model::OPT_IN_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::OptInPhoneNumberResponse, "OptInPhoneNumber")
      end

      # Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone number, or
      # a message to a mobile platform endpoint (when you specify the TargetArn ). If you send a message to
      # a topic, Amazon SNS delivers the message to each endpoint that is subscribed to the topic. The
      # format of the message depends on the notification protocol for each subscribed endpoint. When a
      # messageId is returned, the message is saved and Amazon SNS immediately delivers it to subscribers.
      # To use the Publish action for publishing a message to a mobile endpoint, such as an app on a Kindle
      # device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The
      # EndpointArn is returned when making a call with the CreatePlatformEndpoint action. For more
      # information about formatting messages, see Send Custom Platform-Specific Payloads in Messages to
      # Mobile Devices . You can publish messages only to topics and endpoints in the same Amazon Web
      # Services Region.
      def publish(
        message : String,
        message_attributes : Hash(String, Types::MessageAttributeValue)? = nil,
        message_deduplication_id : String? = nil,
        message_group_id : String? = nil,
        message_structure : String? = nil,
        phone_number : String? = nil,
        subject : String? = nil,
        target_arn : String? = nil,
        topic_arn : String? = nil
      ) : Types::PublishResponse
        input = Types::PublishInput.new(message: message, message_attributes: message_attributes, message_deduplication_id: message_deduplication_id, message_group_id: message_group_id, message_structure: message_structure, phone_number: phone_number, subject: subject, target_arn: target_arn, topic_arn: topic_arn)
        publish(input)
      end
      def publish(input : Types::PublishInput) : Types::PublishResponse
        request = Protocol::Query.build_request(Model::PUBLISH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PublishResponse, "Publish")
      end

      # Publishes up to 10 messages to the specified topic in a single batch. This is a batch version of the
      # Publish API. If you try to send more than 10 messages in a single batch request, you will receive a
      # TooManyEntriesInBatchRequest exception. For FIFO topics, multiple messages within a single batch are
      # published in the order they are sent, and messages are deduplicated within the batch and across
      # batches for five minutes. The result of publishing each message is reported individually in the
      # response. Because the batch request can result in a combination of successful and unsuccessful
      # actions, you should check for batch errors even when the call returns an HTTP status code of 200.
      # The maximum allowed individual message size and the maximum total payload size (the sum of the
      # individual lengths of all of the batched messages) are both 256 KB (262,144 bytes). The PublishBatch
      # API can send up to 10 messages at a time. If you attempt to send more than 10 messages in one
      # request, you will encounter a TooManyEntriesInBatchRequest exception. In such cases, split your
      # messages into multiple requests, each containing no more than 10 messages. Some actions take lists
      # of parameters. These lists are specified using the param.n notation. Values of n are integers
      # starting from 1 . For example, a parameter list with two elements looks like this:
      # &amp;AttributeName.1=first &amp;AttributeName.2=second If you send a batch message to a topic,
      # Amazon SNS publishes the batch message to each endpoint that is subscribed to the topic. The format
      # of the batch message depends on the notification protocol for each subscribed endpoint. When a
      # messageId is returned, the batch message is saved, and Amazon SNS immediately delivers the message
      # to subscribers.
      def publish_batch(
        publish_batch_request_entries : Array(Types::PublishBatchRequestEntry),
        topic_arn : String
      ) : Types::PublishBatchResponse
        input = Types::PublishBatchInput.new(publish_batch_request_entries: publish_batch_request_entries, topic_arn: topic_arn)
        publish_batch(input)
      end
      def publish_batch(input : Types::PublishBatchInput) : Types::PublishBatchResponse
        request = Protocol::Query.build_request(Model::PUBLISH_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::PublishBatchResponse, "PublishBatch")
      end

      # Adds or updates an inline policy document that is stored in the specified Amazon SNS topic.
      def put_data_protection_policy(
        data_protection_policy : String,
        resource_arn : String
      ) : Nil
        input = Types::PutDataProtectionPolicyInput.new(data_protection_policy: data_protection_policy, resource_arn: resource_arn)
        put_data_protection_policy(input)
      end
      def put_data_protection_policy(input : Types::PutDataProtectionPolicyInput) : Nil
        request = Protocol::Query.build_request(Model::PUT_DATA_PROTECTION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Removes a statement from a topic's access control policy. To remove the ability to change topic
      # permissions, you must deny permissions to the AddPermission , RemovePermission , and
      # SetTopicAttributes actions in your IAM policy.
      def remove_permission(
        label : String,
        topic_arn : String
      ) : Nil
        input = Types::RemovePermissionInput.new(label: label, topic_arn: topic_arn)
        remove_permission(input)
      end
      def remove_permission(input : Types::RemovePermissionInput) : Nil
        request = Protocol::Query.build_request(Model::REMOVE_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the attributes for an endpoint for a device on one of the supported push notification services,
      # such as GCM (Firebase Cloud Messaging) and APNS. For more information, see Using Amazon SNS Mobile
      # Push Notifications .
      def set_endpoint_attributes(
        attributes : Hash(String, String),
        endpoint_arn : String
      ) : Nil
        input = Types::SetEndpointAttributesInput.new(attributes: attributes, endpoint_arn: endpoint_arn)
        set_endpoint_attributes(input)
      end
      def set_endpoint_attributes(input : Types::SetEndpointAttributesInput) : Nil
        request = Protocol::Query.build_request(Model::SET_ENDPOINT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Sets the attributes of the platform application object for the supported push notification services,
      # such as APNS and GCM (Firebase Cloud Messaging). For more information, see Using Amazon SNS Mobile
      # Push Notifications . For information on configuring attributes for message delivery status, see
      # Using Amazon SNS Application Attributes for Message Delivery Status .
      def set_platform_application_attributes(
        attributes : Hash(String, String),
        platform_application_arn : String
      ) : Nil
        input = Types::SetPlatformApplicationAttributesInput.new(attributes: attributes, platform_application_arn: platform_application_arn)
        set_platform_application_attributes(input)
      end
      def set_platform_application_attributes(input : Types::SetPlatformApplicationAttributesInput) : Nil
        request = Protocol::Query.build_request(Model::SET_PLATFORM_APPLICATION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Use this request to set the default settings for sending SMS messages and receiving daily SMS usage
      # reports. You can override some of these settings for a single message when you use the Publish
      # action with the MessageAttributes.entry.N parameter. For more information, see Publishing to a
      # mobile phone in the Amazon SNS Developer Guide . To use this operation, you must grant the Amazon
      # SNS service principal ( sns.amazonaws.com ) permission to perform the s3:ListBucket action.
      def set_sms_attributes(
        attributes : Hash(String, String)
      ) : Types::SetSMSAttributesResponse
        input = Types::SetSMSAttributesInput.new(attributes: attributes)
        set_sms_attributes(input)
      end
      def set_sms_attributes(input : Types::SetSMSAttributesInput) : Types::SetSMSAttributesResponse
        request = Protocol::Query.build_request(Model::SET_SMS_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SetSMSAttributesResponse, "SetSMSAttributes")
      end

      # Allows a subscription owner to set an attribute of the subscription to a new value.
      def set_subscription_attributes(
        attribute_name : String,
        subscription_arn : String,
        attribute_value : String? = nil
      ) : Nil
        input = Types::SetSubscriptionAttributesInput.new(attribute_name: attribute_name, subscription_arn: subscription_arn, attribute_value: attribute_value)
        set_subscription_attributes(input)
      end
      def set_subscription_attributes(input : Types::SetSubscriptionAttributesInput) : Nil
        request = Protocol::Query.build_request(Model::SET_SUBSCRIPTION_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Allows a topic owner to set an attribute of the topic to a new value. To remove the ability to
      # change topic permissions, you must deny permissions to the AddPermission , RemovePermission , and
      # SetTopicAttributes actions in your IAM policy.
      def set_topic_attributes(
        attribute_name : String,
        topic_arn : String,
        attribute_value : String? = nil
      ) : Nil
        input = Types::SetTopicAttributesInput.new(attribute_name: attribute_name, topic_arn: topic_arn, attribute_value: attribute_value)
        set_topic_attributes(input)
      end
      def set_topic_attributes(input : Types::SetTopicAttributesInput) : Nil
        request = Protocol::Query.build_request(Model::SET_TOPIC_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if the
      # endpoint and the topic are not in the same Amazon Web Services account, the endpoint owner must run
      # the ConfirmSubscription action to confirm the subscription. You call the ConfirmSubscription action
      # with the token from the subscription response. Confirmation tokens are valid for two days. This
      # action is throttled at 100 transactions per second (TPS).
      def subscribe(
        protocol : String,
        topic_arn : String,
        attributes : Hash(String, String)? = nil,
        endpoint : String? = nil,
        return_subscription_arn : Bool? = nil
      ) : Types::SubscribeResponse
        input = Types::SubscribeInput.new(protocol: protocol, topic_arn: topic_arn, attributes: attributes, endpoint: endpoint, return_subscription_arn: return_subscription_arn)
        subscribe(input)
      end
      def subscribe(input : Types::SubscribeInput) : Types::SubscribeResponse
        request = Protocol::Query.build_request(Model::SUBSCRIBE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SubscribeResponse, "Subscribe")
      end

      # Add tags to the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the Amazon SNS
      # Developer Guide . When you use topic tags, keep the following guidelines in mind: Adding more than
      # 50 tags to a topic isn't recommended. Tags don't have any semantic meaning. Amazon SNS interprets
      # tags as character strings. Tags are case-sensitive. A new tag with a key identical to that of an
      # existing tag overwrites the existing tag. Tagging actions are limited to 10 TPS per Amazon Web
      # Services account, per Amazon Web Services Region. If your application requires a higher throughput,
      # file a technical support request .
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::Query.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Deletes a subscription. If the subscription requires authentication for deletion, only the owner of
      # the subscription or the topic's owner can unsubscribe, and an Amazon Web Services signature is
      # required. If the Unsubscribe call does not require authentication and the requester is not the
      # subscription owner, a final cancellation message is delivered to the endpoint, so that the endpoint
      # owner can easily resubscribe to the topic if the Unsubscribe request was unintended. This action is
      # throttled at 100 transactions per second (TPS).
      def unsubscribe(
        subscription_arn : String
      ) : Nil
        input = Types::UnsubscribeInput.new(subscription_arn: subscription_arn)
        unsubscribe(input)
      end
      def unsubscribe(input : Types::UnsubscribeInput) : Nil
        request = Protocol::Query.build_request(Model::UNSUBSCRIBE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Remove tags from the specified Amazon SNS topic. For an overview, see Amazon SNS Tags in the Amazon
      # SNS Developer Guide .
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::Query.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Verifies a destination phone number with a one-time password (OTP) for the calling Amazon Web
      # Services account. When you start using Amazon SNS to send SMS messages, your Amazon Web Services
      # account is in the SMS sandbox . The SMS sandbox provides a safe environment for you to try Amazon
      # SNS features without risking your reputation as an SMS sender. While your Amazon Web Services
      # account is in the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send
      # SMS messages only to verified destination phone numbers. For more information, including how to move
      # out of the sandbox to send messages without restrictions, see SMS sandbox in the Amazon SNS
      # Developer Guide .
      def verify_sms_sandbox_phone_number(
        one_time_password : String,
        phone_number : String
      ) : Types::VerifySMSSandboxPhoneNumberResult
        input = Types::VerifySMSSandboxPhoneNumberInput.new(one_time_password: one_time_password, phone_number: phone_number)
        verify_sms_sandbox_phone_number(input)
      end
      def verify_sms_sandbox_phone_number(input : Types::VerifySMSSandboxPhoneNumberInput) : Types::VerifySMSSandboxPhoneNumberResult
        request = Protocol::Query.build_request(Model::VERIFY_SMS_SANDBOX_PHONE_NUMBER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::VerifySMSSandboxPhoneNumberResult, "VerifySMSSandboxPhoneNumber")
      end
    end
  end
end
