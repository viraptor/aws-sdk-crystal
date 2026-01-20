require "json"
require "time"

module Aws
  module WAFV2
    module Types

      # Information for a single API key. API keys are required for the integration of the CAPTCHA API in
      # your JavaScript client applications. The API lets you customize the placement and characteristics of
      # the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript
      # integration, see WAF client application integration in the WAF Developer Guide .

      struct APIKeySummary
        include JSON::Serializable

        # The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration.

        @[JSON::Field(key: "APIKey")]
        getter api_key : String?

        # The date and time that the key was created.

        @[JSON::Field(key: "CreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The token domains that are defined in this API key.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)?

        # Internal value used by WAF to manage the key.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @api_key : String? = nil,
          @creation_timestamp : Time? = nil,
          @token_domains : Array(String)? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Details for your use of the account creation fraud prevention managed rule group,
      # AWSManagedRulesACFPRuleSet . This configuration is used in ManagedRuleGroupConfig . For additional
      # information about this and the other intelligent threat mitigation rule groups, see Intelligent
      # threat mitigation in WAF and Amazon Web Services Managed Rules rule groups list in the WAF Developer
      # Guide .

      struct AWSManagedRulesACFPRuleSet
        include JSON::Serializable

        # The path of the account creation endpoint for your application. This is the page on your website
        # that accepts the completed registration form for a new user. This page must accept POST requests.
        # For example, for the URL https://example.com/web/newaccount , you would provide the path
        # /web/newaccount . Account creation page paths that start with the path that you provide are
        # considered a match. For example /web/newaccount matches the account creation paths /web/newaccount ,
        # /web/newaccount/ , /web/newaccountPage , and /web/newaccount/thisPage , but doesn't match the path
        # /home/web/newaccount or /website/newaccount .

        @[JSON::Field(key: "CreationPath")]
        getter creation_path : String

        # The path of the account registration endpoint for your application. This is the page on your website
        # that presents the registration form to new users. This page must accept GET text/html requests. For
        # example, for the URL https://example.com/web/registration , you would provide the path
        # /web/registration . Registration page paths that start with the path that you provide are considered
        # a match. For example /web/registration matches the registration paths /web/registration ,
        # /web/registration/ , /web/registrationPage , and /web/registration/thisPage , but doesn't match the
        # path /home/web/registration or /website/registration .

        @[JSON::Field(key: "RegistrationPagePath")]
        getter registration_page_path : String

        # The criteria for inspecting account creation requests, used by the ACFP rule group to validate and
        # track account creation attempts.

        @[JSON::Field(key: "RequestInspection")]
        getter request_inspection : Types::RequestInspectionACFP

        # Allow the use of regular expressions in the registration page path and the account creation path.

        @[JSON::Field(key: "EnableRegexInPath")]
        getter enable_regex_in_path : Bool?

        # The criteria for inspecting responses to account creation requests, used by the ACFP rule group to
        # track account creation success rates. Response inspection is available only in web ACLs that protect
        # Amazon CloudFront distributions. The ACFP rule group evaluates the responses that your protected
        # resources send back to client account creation attempts, keeping count of successful and failed
        # attempts from each IP address and client session. Using this information, the rule group labels and
        # mitigates requests from client sessions and IP addresses that have had too many successful account
        # creation attempts in a short amount of time.

        @[JSON::Field(key: "ResponseInspection")]
        getter response_inspection : Types::ResponseInspection?

        def initialize(
          @creation_path : String,
          @registration_page_path : String,
          @request_inspection : Types::RequestInspectionACFP,
          @enable_regex_in_path : Bool? = nil,
          @response_inspection : Types::ResponseInspection? = nil
        )
        end
      end

      # Details for your use of the account takeover prevention managed rule group,
      # AWSManagedRulesATPRuleSet . This configuration is used in ManagedRuleGroupConfig . For additional
      # information about this and the other intelligent threat mitigation rule groups, see Intelligent
      # threat mitigation in WAF and Amazon Web Services Managed Rules rule groups list in the WAF Developer
      # Guide .

      struct AWSManagedRulesATPRuleSet
        include JSON::Serializable

        # The path of the login endpoint for your application. For example, for the URL
        # https://example.com/web/login , you would provide the path /web/login . Login paths that start with
        # the path that you provide are considered a match. For example /web/login matches the login paths
        # /web/login , /web/login/ , /web/loginPage , and /web/login/thisPage , but doesn't match the login
        # path /home/web/login or /website/login . The rule group inspects only HTTP POST requests to your
        # specified login endpoint.

        @[JSON::Field(key: "LoginPath")]
        getter login_path : String

        # Allow the use of regular expressions in the login page path.

        @[JSON::Field(key: "EnableRegexInPath")]
        getter enable_regex_in_path : Bool?

        # The criteria for inspecting login requests, used by the ATP rule group to validate credentials
        # usage.

        @[JSON::Field(key: "RequestInspection")]
        getter request_inspection : Types::RequestInspection?

        # The criteria for inspecting responses to login requests, used by the ATP rule group to track login
        # failure rates. Response inspection is available only in web ACLs that protect Amazon CloudFront
        # distributions. The ATP rule group evaluates the responses that your protected resources send back to
        # client login attempts, keeping count of successful and failed attempts for each IP address and
        # client session. Using this information, the rule group labels and mitigates requests from client
        # sessions and IP addresses that have had too many failed login attempts in a short amount of time.

        @[JSON::Field(key: "ResponseInspection")]
        getter response_inspection : Types::ResponseInspection?

        def initialize(
          @login_path : String,
          @enable_regex_in_path : Bool? = nil,
          @request_inspection : Types::RequestInspection? = nil,
          @response_inspection : Types::ResponseInspection? = nil
        )
        end
      end

      # Configures the use of the anti-DDoS managed rule group, AWSManagedRulesAntiDDoSRuleSet . This
      # configuration is used in ManagedRuleGroupConfig . The configuration that you provide here determines
      # whether and how the rules in the rule group are used. For additional information about this and the
      # other intelligent threat mitigation rule groups, see Intelligent threat mitigation in WAF and Amazon
      # Web Services Managed Rules rule groups list in the WAF Developer Guide .

      struct AWSManagedRulesAntiDDoSRuleSet
        include JSON::Serializable

        # Configures the request handling that's applied by the managed rule group rules
        # ChallengeAllDuringEvent and ChallengeDDoSRequests during a distributed denial of service (DDoS)
        # attack.

        @[JSON::Field(key: "ClientSideActionConfig")]
        getter client_side_action_config : Types::ClientSideActionConfig

        # The sensitivity that the rule group rule DDoSRequests uses when matching against the DDoS suspicion
        # labeling on a request. The managed rule group adds the labeling during DDoS events, before the
        # DDoSRequests rule runs. The higher the sensitivity, the more levels of labeling that the rule
        # matches: Low sensitivity is less sensitive, causing the rule to match only on the most likely
        # participants in an attack, which are the requests with the high suspicion label
        # awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request . Medium sensitivity causes the rule to
        # match on the medium and high suspicion labels. High sensitivity causes the rule to match on all of
        # the suspicion labels: low, medium, and high. Default: LOW

        @[JSON::Field(key: "SensitivityToBlock")]
        getter sensitivity_to_block : String?

        def initialize(
          @client_side_action_config : Types::ClientSideActionConfig,
          @sensitivity_to_block : String? = nil
        )
        end
      end

      # Details for your use of the Bot Control managed rule group, AWSManagedRulesBotControlRuleSet . This
      # configuration is used in ManagedRuleGroupConfig . For additional information about this and the
      # other intelligent threat mitigation rule groups, see Intelligent threat mitigation in WAF and Amazon
      # Web Services Managed Rules rule groups list in the WAF Developer Guide .

      struct AWSManagedRulesBotControlRuleSet
        include JSON::Serializable

        # The inspection level to use for the Bot Control rule group. The common level is the least expensive.
        # The targeted level includes all common level rules and adds rules with more advanced inspection
        # criteria. For details, see WAF Bot Control rule group in the WAF Developer Guide .

        @[JSON::Field(key: "InspectionLevel")]
        getter inspection_level : String

        # Applies only to the targeted inspection level. Determines whether to use machine learning (ML) to
        # analyze your web traffic for bot-related activity. Machine learning is required for the Bot Control
        # rules TGT_ML_CoordinatedActivityLow and TGT_ML_CoordinatedActivityMedium , which inspect for
        # anomalous behavior that might indicate distributed, coordinated bot activity. For more information
        # about this choice, see the listing for these rules in the table at Bot Control rules listing in the
        # WAF Developer Guide . Default: TRUE

        @[JSON::Field(key: "EnableMachineLearning")]
        getter enable_machine_learning : Bool?

        def initialize(
          @inspection_level : String,
          @enable_machine_learning : Bool? = nil
        )
        end
      end

      # A single action condition for a Condition in a logging filter.

      struct ActionCondition
        include JSON::Serializable

        # The action setting that a log record must contain in order to meet the condition. This is the action
        # that WAF applied to the web request. For rule groups, this is either the configured rule action
        # setting, or if you've applied a rule action override to the rule, it's the override action. The
        # value EXCLUDED_AS_COUNT matches on excluded rules and also on rules that have a rule action override
        # of Count.

        @[JSON::Field(key: "Action")]
        getter action : String

        def initialize(
          @action : String
        )
        end
      end

      # The name of a field in the request payload that contains part or all of your customer's primary
      # physical address. This data type is used in the RequestInspectionACFP data type.

      struct AddressField
        include JSON::Serializable

        # The name of a single primary address field. How you specify the address fields depends on the
        # request inspection payload type. For JSON payloads, specify the field identifiers in JSON pointer
        # syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task Force
        # (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the JSON payload {
        # "form": { "primaryaddressline1": "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2",
        # "primaryaddressline3": "THE_ADDRESS3" } } , the address field idenfiers are
        # /form/primaryaddressline1 , /form/primaryaddressline2 , and /form/primaryaddressline3 . For form
        # encoded payload types, use the HTML form names. For example, for an HTML form with input elements
        # named primaryaddressline1 , primaryaddressline2 , and primaryaddressline3 , the address fields
        # identifiers are primaryaddressline1 , primaryaddressline2 , and primaryaddressline3 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # Inspect all of the elements that WAF has parsed and extracted from the web request component that
      # you've identified in your FieldToMatch specifications. This is used in the FieldToMatch
      # specification for some web request component types. JSON specification: "All": {}

      struct All
        include JSON::Serializable

        def initialize
        end
      end

      # Inspect all query arguments of the web request. This is used in the FieldToMatch specification for
      # some web request component types. JSON specification: "AllQueryArguments": {}

      struct AllQueryArguments
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies that WAF should allow the request and optionally defines additional custom handling for
      # the request. This is used in the context of other settings, for example to specify values for
      # RuleAction and web ACL DefaultAction .

      struct AllowAction
        include JSON::Serializable

        # Defines custom handling for the web request. For information about customizing web requests and
        # responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

        @[JSON::Field(key: "CustomRequestHandling")]
        getter custom_request_handling : Types::CustomRequestHandling?

        def initialize(
          @custom_request_handling : Types::CustomRequestHandling? = nil
        )
        end
      end

      # A logical rule statement used to combine other rule statements with AND logic. You provide more than
      # one Statement within the AndStatement .

      struct AndStatement
        include JSON::Serializable

        # The statements to combine with AND logic. You can use any statements that can be nested.

        @[JSON::Field(key: "Statements")]
        getter statements : Array(Types::Statement)

        def initialize(
          @statements : Array(Types::Statement)
        )
        end
      end

      # Application details defined during the web ACL creation process. Application attributes help WAF
      # give recommendations for protection packs.

      struct ApplicationAttribute
        include JSON::Serializable

        # Specifies the attribute name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the attribute value.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A list of ApplicationAttribute s that contains information about the application.

      struct ApplicationConfig
        include JSON::Serializable

        # Contains the attribute name and a list of values for that attribute.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ApplicationAttribute)?

        def initialize(
          @attributes : Array(Types::ApplicationAttribute)? = nil
        )
        end
      end

      # A rule statement that inspects web traffic based on the Autonomous System Number (ASN) associated
      # with the request's IP address. For additional details, see ASN match rule statement in the WAF
      # Developer Guide .

      struct AsnMatchStatement
        include JSON::Serializable

        # Contains one or more Autonomous System Numbers (ASNs). ASNs are unique identifiers assigned to large
        # internet networks managed by organizations such as internet service providers, enterprises,
        # universities, or government agencies.

        @[JSON::Field(key: "AsnList")]
        getter asn_list : Array(Int64)

        # The configuration for inspecting IP addresses to match against an ASN in an HTTP header that you
        # specify, instead of using the IP address that's reported by the web request origin. Commonly, this
        # is the X-Forwarded-For (XFF) header, but you can specify any header name.

        @[JSON::Field(key: "ForwardedIPConfig")]
        getter forwarded_ip_config : Types::ForwardedIPConfig?

        def initialize(
          @asn_list : Array(Int64),
          @forwarded_ip_config : Types::ForwardedIPConfig? = nil
        )
        end
      end


      struct AssociateWebACLRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to associate with the web ACL. The ARN must be in one
        # of the following formats: For an Application Load Balancer: arn: partition :elasticloadbalancing:
        # region : account-id :loadbalancer/app/ load-balancer-name / load-balancer-id For an Amazon API
        # Gateway REST API: arn: partition :apigateway: region ::/restapis/ api-id /stages/ stage-name For an
        # AppSync GraphQL API: arn: partition :appsync: region : account-id :apis/ GraphQLApiId For an Amazon
        # Cognito user pool: arn: partition :cognito-idp: region : account-id :userpool/ user-pool-id For an
        # App Runner service: arn: partition :apprunner: region : account-id :service/ apprunner-service-name
        # / apprunner-service-id For an Amazon Web Services Verified Access instance: arn: partition :ec2:
        # region : account-id :verified-access-instance/ instance-id For an Amplify application: arn:
        # partition :amplify: region : account-id :apps/ app-id

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String

        def initialize(
          @resource_arn : String,
          @web_acl_arn : String
        )
        end
      end


      struct AssociateWebACLResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies custom configurations for the associations between the web ACL and protected resources.
      # Use this to customize the maximum size of the request body that your protected resources forward to
      # WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App
      # Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). You are charged
      # additional fees when your protected resources forward body sizes that are larger than the default.
      # For more information, see WAF Pricing . For Application Load Balancer and AppSync, the limit is
      # fixed at 8 KB (8,192 bytes).

      struct AssociationConfig
        include JSON::Serializable

        # Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon
        # Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size
        # is 16 KB (16,384 bytes). You can change the setting for any of the available resource types. You are
        # charged additional fees when your protected resources forward body sizes that are larger than the
        # default. For more information, see WAF Pricing . Example JSON: { "API_GATEWAY": "KB_48",
        # "APP_RUNNER_SERVICE": "KB_32" } For Application Load Balancer and AppSync, the limit is fixed at 8
        # KB (8,192 bytes).

        @[JSON::Field(key: "RequestBody")]
        getter request_body : Hash(String, Types::RequestBodyAssociatedResourceTypeConfig)?

        def initialize(
          @request_body : Hash(String, Types::RequestBodyAssociatedResourceTypeConfig)? = nil
        )
        end
      end

      # Specifies that WAF should block the request and optionally defines additional custom handling for
      # the response to the web request. This is used in the context of other settings, for example to
      # specify values for RuleAction and web ACL DefaultAction .

      struct BlockAction
        include JSON::Serializable

        # Defines a custom response for the web request. For information about customizing web requests and
        # responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponse")]
        getter custom_response : Types::CustomResponse?

        def initialize(
          @custom_response : Types::CustomResponse? = nil
        )
        end
      end

      # Inspect the body of the web request. The body immediately follows the request headers. This is used
      # to indicate the web request component to inspect, in the FieldToMatch specification.

      struct Body
        include JSON::Serializable

        # What WAF should do if the body is larger than WAF can inspect. WAF does not support inspecting the
        # entire contents of the web request body if the body exceeds the limit for the resource type. When a
        # web request body is larger than the limit, the underlying host service only forwards the contents
        # that are within the limit to WAF for inspection. For Application Load Balancer and AppSync, the
        # limit is fixed at 8 KB (8,192 bytes). For CloudFront, API Gateway, Amazon Cognito, App Runner, and
        # Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each
        # resource type in the web ACL AssociationConfig , for additional processing fees. For Amplify, use
        # the CloudFront limit. The options for oversize handling are the following: CONTINUE - Inspect the
        # available body contents normally, according to the rule inspection criteria. MATCH - Treat the web
        # request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH - Treat
        # the web request as not matching the rule statement. You can combine the MATCH or NO_MATCH settings
        # for oversize handling with your rule and web ACL action settings, so that you block any request
        # whose body is over the limit. Default: CONTINUE

        @[JSON::Field(key: "OversizeHandling")]
        getter oversize_handling : String?

        def initialize(
          @oversize_handling : String? = nil
        )
        end
      end

      # A rule statement that defines a string match search for WAF to apply to web requests. The byte match
      # statement provides the bytes to search for, the location in requests that you want WAF to search,
      # and other settings. The bytes to search for are typically a string that corresponds with ASCII
      # characters. In the WAF console and the developer guide, this is called a string match statement.

      struct ByteMatchStatement
        include JSON::Serializable

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # The area within the portion of the web request that you want WAF to search for SearchString . Valid
        # values include the following: CONTAINS The specified part of the web request must include the value
        # of SearchString , but the location doesn't matter. CONTAINS_WORD The specified part of the web
        # request must include the value of SearchString , and SearchString must contain only alphanumeric
        # characters or underscore (A-Z, a-z, 0-9, or _). In addition, SearchString must be a word, which
        # means that both of the following are true: SearchString is at the beginning of the specified part of
        # the web request or is preceded by a character other than an alphanumeric character or underscore
        # (_). Examples include the value of a header and ;BadBot . SearchString is at the end of the
        # specified part of the web request or is followed by a character other than an alphanumeric character
        # or underscore (_), for example, BadBot; and -BadBot; . EXACTLY The value of the specified part of
        # the web request must exactly match the value of SearchString . STARTS_WITH The value of SearchString
        # must appear at the beginning of the specified part of the web request. ENDS_WITH The value of
        # SearchString must appear at the end of the specified part of the web request.

        @[JSON::Field(key: "PositionalConstraint")]
        getter positional_constraint : String

        # A string value that you want WAF to search for. WAF searches only in the part of web requests that
        # you designate for inspection in FieldToMatch . The maximum length of the value is 200 bytes. Valid
        # values depend on the component that you specify for inspection in FieldToMatch : Method : The HTTP
        # method that you want WAF to search for. This indicates the type of operation specified in the
        # request. UriPath : The value that you want WAF to search for in the URI path, for example,
        # /images/daily-ad.jpg . JA3Fingerprint : Available for use with Amazon CloudFront distributions and
        # Application Load Balancers. Match against the request's JA3 fingerprint. The JA3 fingerprint is a
        # 32-character hash derived from the TLS Client Hello of an incoming request. This fingerprint serves
        # as a unique identifier for the client's TLS configuration. You can use this choice only with a
        # string match ByteMatchStatement with the PositionalConstraint set to EXACTLY . You can obtain the
        # JA3 fingerprint for client requests from the web ACL logs. If WAF is able to calculate the
        # fingerprint, it includes it in the logs. For information about the logging fields, see Log fields in
        # the WAF Developer Guide . HeaderOrder : The list of header names to match for. WAF creates a string
        # that contains the ordered list of header names, from the headers in the web request, and then
        # matches against that string. If SearchString includes alphabetic characters A-Z and a-z, note that
        # the value is case sensitive. If you're using the WAF API Specify a base64-encoded version of the
        # value. The maximum length of the value before you base64-encode it is 200 bytes. For example,
        # suppose the value of Type is HEADER and the value of Data is User-Agent . If you want to search the
        # User-Agent header for the value BadBot , you base64-encode BadBot using MIME base64-encoding and
        # include the resulting value, QmFkQm90 , in the value of SearchString . If you're using the CLI or
        # one of the Amazon Web Services SDKs The value that you want WAF to search for. The SDK automatically
        # base64 encodes the value.

        @[JSON::Field(key: "SearchString")]
        getter search_string : Bytes

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @positional_constraint : String,
          @search_string : Bytes,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Specifies that WAF should run a CAPTCHA check against the request: If the request includes a valid,
      # unexpired CAPTCHA token, WAF applies any custom request handling and labels that you've configured
      # and then allows the web request inspection to proceed to the next rule, similar to a CountAction .
      # If the request doesn't include a valid, unexpired token, WAF discontinues the web ACL evaluation of
      # the request and blocks it from going to its intended destination. WAF generates a response that it
      # sends back to the client, which includes the following: The header x-amzn-waf-action with a value of
      # captcha . The HTTP status code 405 Method Not Allowed . If the request contains an Accept header
      # with a value of text/html , the response includes a CAPTCHA JavaScript page interstitial. You can
      # configure the expiration time in the CaptchaConfig ImmunityTimeProperty setting at the rule and web
      # ACL level. The rule setting overrides the web ACL setting. This action option is available for
      # rules. It isn't available for web ACL default actions.

      struct CaptchaAction
        include JSON::Serializable

        # Defines custom handling for the web request, used when the CAPTCHA inspection determines that the
        # request's token is valid and unexpired. For information about customizing web requests and
        # responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

        @[JSON::Field(key: "CustomRequestHandling")]
        getter custom_request_handling : Types::CustomRequestHandling?

        def initialize(
          @custom_request_handling : Types::CustomRequestHandling? = nil
        )
        end
      end

      # Specifies how WAF should handle CAPTCHA evaluations. This is available at the web ACL level and in
      # each rule.

      struct CaptchaConfig
        include JSON::Serializable

        # Determines how long a CAPTCHA timestamp in the token remains valid after the client successfully
        # solves a CAPTCHA puzzle.

        @[JSON::Field(key: "ImmunityTimeProperty")]
        getter immunity_time_property : Types::ImmunityTimeProperty?

        def initialize(
          @immunity_time_property : Types::ImmunityTimeProperty? = nil
        )
        end
      end

      # The result from the inspection of the web request for a valid CAPTCHA token.

      struct CaptchaResponse
        include JSON::Serializable

        # The reason for failure, populated when the evaluation of the token fails.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The HTTP response code indicating the status of the CAPTCHA token in the web request. If the token
        # is missing, invalid, or expired, this code is 405 Method Not Allowed .

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : Int32?

        # The time that the CAPTCHA was last solved for the supplied token.

        @[JSON::Field(key: "SolveTimestamp")]
        getter solve_timestamp : Int64?

        def initialize(
          @failure_reason : String? = nil,
          @response_code : Int32? = nil,
          @solve_timestamp : Int64? = nil
        )
        end
      end

      # Specifies that WAF should run a Challenge check against the request to verify that the request is
      # coming from a legitimate client session: If the request includes a valid, unexpired challenge token,
      # WAF applies any custom request handling and labels that you've configured and then allows the web
      # request inspection to proceed to the next rule, similar to a CountAction . If the request doesn't
      # include a valid, unexpired challenge token, WAF discontinues the web ACL evaluation of the request
      # and blocks it from going to its intended destination. WAF then generates a challenge response that
      # it sends back to the client, which includes the following: The header x-amzn-waf-action with a value
      # of challenge . The HTTP status code 202 Request Accepted . If the request contains an Accept header
      # with a value of text/html , the response includes a JavaScript page interstitial with a challenge
      # script. Challenges run silent browser interrogations in the background, and don't generally affect
      # the end user experience. A challenge enforces token acquisition using an interstitial JavaScript
      # challenge that inspects the client session for legitimate behavior. The challenge blocks bots or at
      # least increases the cost of operating sophisticated bots. After the client session successfully
      # responds to the challenge, it receives a new token from WAF, which the challenge script uses to
      # resubmit the original request. You can configure the expiration time in the ChallengeConfig
      # ImmunityTimeProperty setting at the rule and web ACL level. The rule setting overrides the web ACL
      # setting. This action option is available for rules. It isn't available for web ACL default actions.

      struct ChallengeAction
        include JSON::Serializable

        # Defines custom handling for the web request, used when the challenge inspection determines that the
        # request's token is valid and unexpired. For information about customizing web requests and
        # responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

        @[JSON::Field(key: "CustomRequestHandling")]
        getter custom_request_handling : Types::CustomRequestHandling?

        def initialize(
          @custom_request_handling : Types::CustomRequestHandling? = nil
        )
        end
      end

      # Specifies how WAF should handle Challenge evaluations. This is available at the web ACL level and in
      # each rule.

      struct ChallengeConfig
        include JSON::Serializable

        # Determines how long a challenge timestamp in the token remains valid after the client successfully
        # responds to a challenge.

        @[JSON::Field(key: "ImmunityTimeProperty")]
        getter immunity_time_property : Types::ImmunityTimeProperty?

        def initialize(
          @immunity_time_property : Types::ImmunityTimeProperty? = nil
        )
        end
      end

      # The result from the inspection of the web request for a valid challenge token.

      struct ChallengeResponse
        include JSON::Serializable

        # The reason for failure, populated when the evaluation of the token fails.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The HTTP response code indicating the status of the challenge token in the web request. If the token
        # is missing, invalid, or expired, this code is 202 Request Accepted .

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : Int32?

        # The time that the challenge was last solved for the supplied token.

        @[JSON::Field(key: "SolveTimestamp")]
        getter solve_timestamp : Int64?

        def initialize(
          @failure_reason : String? = nil,
          @response_code : Int32? = nil,
          @solve_timestamp : Int64? = nil
        )
        end
      end


      struct CheckCapacityRequest
        include JSON::Serializable

        # An array of Rule that you're configuring to use in a rule group or web ACL.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @rules : Array(Types::Rule),
          @scope : String
        )
        end
      end


      struct CheckCapacityResponse
        include JSON::Serializable

        # The capacity required by the rules and scope.

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64?

        def initialize(
          @capacity : Int64? = nil
        )
        end
      end

      # This is part of the AWSManagedRulesAntiDDoSRuleSet ClientSideActionConfig configuration in
      # ManagedRuleGroupConfig .

      struct ClientSideAction
        include JSON::Serializable

        # Determines whether to use the AWSManagedRulesAntiDDoSRuleSet rules ChallengeAllDuringEvent and
        # ChallengeDDoSRequests in the rule group evaluation and the related label
        # awswaf:managed:aws:anti-ddos:challengeable-request . If usage is enabled: The managed rule group
        # adds the label awswaf:managed:aws:anti-ddos:challengeable-request to any web request whose URL does
        # NOT match the regular expressions provided in the ClientSideAction setting
        # ExemptUriRegularExpressions . The two rules are evaluated against web requests for protected
        # resources that are experiencing a DDoS attack. The two rules only apply their action to matching
        # requests that have the label awswaf:managed:aws:anti-ddos:challengeable-request . If usage is
        # disabled: The managed rule group doesn't add the label
        # awswaf:managed:aws:anti-ddos:challengeable-request to any web requests. The two rules are not
        # evaluated. None of the other ClientSideAction settings have any effect. This setting only enables or
        # disables the use of the two anti-DDOS rules ChallengeAllDuringEvent and ChallengeDDoSRequests in the
        # anti-DDoS managed rule group. This setting doesn't alter the action setting in the two rules. To
        # override the actions used by the rules ChallengeAllDuringEvent and ChallengeDDoSRequests , enable
        # this setting, and then override the rule actions in the usual way, in your managed rule group
        # configuration.

        @[JSON::Field(key: "UsageOfAction")]
        getter usage_of_action : String

        # The regular expression to match against the web request URI, used to identify requests that can't
        # handle a silent browser challenge. When the ClientSideAction setting UsageOfAction is enabled, the
        # managed rule group uses this setting to determine which requests to label with
        # awswaf:managed:aws:anti-ddos:challengeable-request . If UsageOfAction is disabled, this setting has
        # no effect and the managed rule group doesn't add the label to any requests. The anti-DDoS managed
        # rule group doesn't evaluate the rules ChallengeDDoSRequests or ChallengeAllDuringEvent for web
        # requests whose URIs match this regex. This is true regardless of whether you override the rule
        # action for either of the rules in your web ACL configuration. Amazon Web Services recommends using a
        # regular expression. This setting is required if UsageOfAction is set to ENABLED . If required, you
        # can provide between 1 and 5 regex objects in the array of settings. Amazon Web Services recommends
        # starting with the following setting. Review and update it for your application's needs:
        # \/api\/|\.(acc|avi|css|gif|jpe?g|js|mp[34]|ogg|otf|pdf|png|tiff?|ttf|webm|webp|woff2?)$

        @[JSON::Field(key: "ExemptUriRegularExpressions")]
        getter exempt_uri_regular_expressions : Array(Types::Regex)?

        # The sensitivity that the rule group rule ChallengeDDoSRequests uses when matching against the DDoS
        # suspicion labeling on a request. The managed rule group adds the labeling during DDoS events, before
        # the ChallengeDDoSRequests rule runs. The higher the sensitivity, the more levels of labeling that
        # the rule matches: Low sensitivity is less sensitive, causing the rule to match only on the most
        # likely participants in an attack, which are the requests with the high suspicion label
        # awswaf:managed:aws:anti-ddos:high-suspicion-ddos-request . Medium sensitivity causes the rule to
        # match on the medium and high suspicion labels. High sensitivity causes the rule to match on all of
        # the suspicion labels: low, medium, and high. Default: HIGH

        @[JSON::Field(key: "Sensitivity")]
        getter sensitivity : String?

        def initialize(
          @usage_of_action : String,
          @exempt_uri_regular_expressions : Array(Types::Regex)? = nil,
          @sensitivity : String? = nil
        )
        end
      end

      # This is part of the configuration for the managed rules AWSManagedRulesAntiDDoSRuleSet in
      # ManagedRuleGroupConfig .

      struct ClientSideActionConfig
        include JSON::Serializable

        # Configuration for the use of the AWSManagedRulesAntiDDoSRuleSet rules ChallengeAllDuringEvent and
        # ChallengeDDoSRequests . This setting isn't related to the configuration of the Challenge action
        # itself. It only configures the use of the two anti-DDoS rules named here. You can enable or disable
        # the use of these rules, and you can configure how to use them when they are enabled.

        @[JSON::Field(key: "Challenge")]
        getter challenge : Types::ClientSideAction

        def initialize(
          @challenge : Types::ClientSideAction
        )
        end
      end

      # A single match condition for a Filter .

      struct Condition
        include JSON::Serializable

        # A single action condition. This is the action setting that a log record must contain in order to
        # meet the condition.

        @[JSON::Field(key: "ActionCondition")]
        getter action_condition : Types::ActionCondition?

        # A single label name condition. This is the fully qualified label name that a log record must contain
        # in order to meet the condition. Fully qualified labels have a prefix, optional namespaces, and label
        # name. The prefix identifies the rule group or web ACL context of the rule that added the label.

        @[JSON::Field(key: "LabelNameCondition")]
        getter label_name_condition : Types::LabelNameCondition?

        def initialize(
          @action_condition : Types::ActionCondition? = nil,
          @label_name_condition : Types::LabelNameCondition? = nil
        )
        end
      end

      # The filter to use to identify the subset of cookies to inspect in a web request. You must specify
      # exactly one setting: either All , IncludedCookies , or ExcludedCookies . Example JSON:
      # "MatchPattern": { "IncludedCookies": [ "session-id-time", "session-id" ] }

      struct CookieMatchPattern
        include JSON::Serializable

        # Inspect all cookies.

        @[JSON::Field(key: "All")]
        getter all : Types::All?

        # Inspect only the cookies whose keys don't match any of the strings specified here.

        @[JSON::Field(key: "ExcludedCookies")]
        getter excluded_cookies : Array(String)?

        # Inspect only the cookies that have a key that matches one of the strings specified here.

        @[JSON::Field(key: "IncludedCookies")]
        getter included_cookies : Array(String)?

        def initialize(
          @all : Types::All? = nil,
          @excluded_cookies : Array(String)? = nil,
          @included_cookies : Array(String)? = nil
        )
        end
      end

      # Inspect the cookies in the web request. You can specify the parts of the cookies to inspect and you
      # can narrow the set of cookies to inspect by including or excluding specific keys. This is used to
      # indicate the web request component to inspect, in the FieldToMatch specification. Example JSON:
      # "Cookies": { "MatchPattern": { "All": {} }, "MatchScope": "KEY", "OversizeHandling": "MATCH" }

      struct Cookies
        include JSON::Serializable

        # The filter to use to identify the subset of cookies to inspect in a web request. You must specify
        # exactly one setting: either All , IncludedCookies , or ExcludedCookies . Example JSON:
        # "MatchPattern": { "IncludedCookies": [ "session-id-time", "session-id" ] }

        @[JSON::Field(key: "MatchPattern")]
        getter match_pattern : Types::CookieMatchPattern

        # The parts of the cookies to inspect with the rule inspection criteria. If you specify ALL , WAF
        # inspects both keys and values. All does not require a match to be found in the keys and a match to
        # be found in the values. It requires a match to be found in the keys or the values or both. To
        # require a match in the keys and in the values, use a logical AND statement to combine two match
        # rules, one that inspects the keys and another that inspects the values.

        @[JSON::Field(key: "MatchScope")]
        getter match_scope : String

        # What WAF should do if the cookies of the request are more numerous or larger than WAF can inspect.
        # WAF does not support inspecting the entire contents of request cookies when they exceed 8 KB (8192
        # bytes) or 200 total cookies. The underlying host service forwards a maximum of 200 cookies and at
        # most 8 KB of cookie contents to WAF. The options for oversize handling are the following: CONTINUE -
        # Inspect the available cookies normally, according to the rule inspection criteria. MATCH - Treat the
        # web request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH -
        # Treat the web request as not matching the rule statement.

        @[JSON::Field(key: "OversizeHandling")]
        getter oversize_handling : String

        def initialize(
          @match_pattern : Types::CookieMatchPattern,
          @match_scope : String,
          @oversize_handling : String
        )
        end
      end

      # Specifies that WAF should count the request. Optionally defines additional custom handling for the
      # request. This is used in the context of other settings, for example to specify values for RuleAction
      # and web ACL DefaultAction .

      struct CountAction
        include JSON::Serializable

        # Defines custom handling for the web request. For information about customizing web requests and
        # responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

        @[JSON::Field(key: "CustomRequestHandling")]
        getter custom_request_handling : Types::CustomRequestHandling?

        def initialize(
          @custom_request_handling : Types::CustomRequestHandling? = nil
        )
        end
      end


      struct CreateAPIKeyRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The client application domains that you want to use this API key for. Example JSON: "TokenDomains":
        # ["abc.com", "store.abc.com"] Public suffixes aren't allowed. For example, you can't use gov.au or
        # co.uk as token domains.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)

        def initialize(
          @scope : String,
          @token_domains : Array(String)
        )
        end
      end


      struct CreateAPIKeyResponse
        include JSON::Serializable

        # The generated, encrypted API key. You can copy this for use in your JavaScript CAPTCHA integration.

        @[JSON::Field(key: "APIKey")]
        getter api_key : String?

        def initialize(
          @api_key : String? = nil
        )
        end
      end


      struct CreateIPSetRequest
        include JSON::Serializable

        # Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that
        # you want WAF to inspect for in incoming requests. All addresses must be specified using Classless
        # Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0 .
        # Example address strings: For requests that originated from the IP address 192.0.2.44, specify
        # 192.0.2.44/32 . For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255,
        # specify 192.0.2.0/24 . For requests that originated from the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . For
        # requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
        # 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        # Example JSON Addresses specifications: Empty array: "Addresses": [] Array with one address:
        # "Addresses": ["192.0.2.44/32"] Array with three addresses: "Addresses": ["192.0.2.44/32",
        # "192.0.2.0/24", "192.0.0.0/16"] INVALID specification: "Addresses": [""] INVALID

        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(String)

        # The version of the IP addresses, either IPV4 or IPV6 .

        @[JSON::Field(key: "IPAddressVersion")]
        getter ip_address_version : String

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # A description of the IP set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An array of key:value pairs to associate with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @addresses : Array(String),
          @ip_address_version : String,
          @name : String,
          @scope : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateIPSetResponse
        include JSON::Serializable

        # High-level information about an IPSet , returned by operations like create and list. This provides
        # information like the ID, that you can use to retrieve and manage an IPSet , and the ARN, that you
        # provide to the IPSetReferenceStatement to use the address set in a Rule .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::IPSetSummary?

        def initialize(
          @summary : Types::IPSetSummary? = nil
        )
        end
      end


      struct CreateRegexPatternSetRequest
        include JSON::Serializable

        # The name of the set. You cannot change the name after you create the set.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Array of regular expression strings.

        @[JSON::Field(key: "RegularExpressionList")]
        getter regular_expression_list : Array(Types::Regex)

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An array of key:value pairs to associate with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @regular_expression_list : Array(Types::Regex),
          @scope : String,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRegexPatternSetResponse
        include JSON::Serializable

        # High-level information about a RegexPatternSet , returned by operations like create and list. This
        # provides information like the ID, that you can use to retrieve and manage a RegexPatternSet , and
        # the ARN, that you provide to the RegexPatternSetReferenceStatement to use the pattern set in a Rule
        # .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::RegexPatternSetSummary?

        def initialize(
          @summary : Types::RegexPatternSetSummary? = nil
        )
        end
      end


      struct CreateRuleGroupRequest
        include JSON::Serializable

        # The web ACL capacity units (WCUs) required for this rule group. When you create your own rule group,
        # you define this, and you cannot change it after creation. When you add or modify the rules in a rule
        # group, WAF enforces this limit. You can check the capacity for a set of rules using CheckCapacity .
        # WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule
        # groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the
        # relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex
        # rules that use more processing power. Rule group capacity is fixed at creation, which helps users
        # plan their web ACL WCU usage when they use a rule group. For more information, see WAF web ACL
        # capacity units (WCU) in the WAF Developer Guide .

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the rule group, and then use
        # them in the rules that you define in the rule group. For information about customizing web requests
        # and responses, see Customizing web requests and responses in WAF in the WAF Developer Guide . For
        # information about the limits on count and size for custom request and response settings, see WAF
        # quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # A description of the rule group that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # An array of key:value pairs to associate with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @capacity : Int64,
          @name : String,
          @scope : String,
          @visibility_config : Types::VisibilityConfig,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @description : String? = nil,
          @rules : Array(Types::Rule)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleGroupResponse
        include JSON::Serializable

        # High-level information about a RuleGroup , returned by operations like create and list. This
        # provides information like the ID, that you can use to retrieve and manage a RuleGroup , and the ARN,
        # that you provide to the RuleGroupReferenceStatement to use the rule group in a Rule .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::RuleGroupSummary?

        def initialize(
          @summary : Types::RuleGroupSummary? = nil
        )
        end
      end


      struct CreateWebACLRequest
        include JSON::Serializable

        # The action to perform if none of the Rules contained in the WebACL match.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::DefaultAction

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # Configures the ability for the WAF console to store and retrieve application attributes during the
        # web ACL creation process. Application attributes help WAF give recommendations for protection packs.

        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # Specifies custom configurations for the associations between the web ACL and protected resources.
        # Use this to customize the maximum size of the request body that your protected resources forward to
        # WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App
        # Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). You are charged
        # additional fees when your protected resources forward body sizes that are larger than the default.
        # For more information, see WAF Pricing . For Application Load Balancer and AppSync, the limit is
        # fixed at 8 KB (8,192 bytes).

        @[JSON::Field(key: "AssociationConfig")]
        getter association_config : Types::AssociationConfig?

        # Specifies how WAF should handle CAPTCHA evaluations for rules that don't have their own
        # CaptchaConfig settings. If you don't specify this, WAF uses its default settings for CaptchaConfig .

        @[JSON::Field(key: "CaptchaConfig")]
        getter captcha_config : Types::CaptchaConfig?

        # Specifies how WAF should handle challenge evaluations for rules that don't have their own
        # ChallengeConfig settings. If you don't specify this, WAF uses its default settings for
        # ChallengeConfig .

        @[JSON::Field(key: "ChallengeConfig")]
        getter challenge_config : Types::ChallengeConfig?

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the web ACL, and then use them
        # in the rules and default actions that you define in the web ACL. For information about customizing
        # web requests and responses, see Customizing web requests and responses in WAF in the WAF Developer
        # Guide . For information about the limits on count and size for custom request and response settings,
        # see WAF quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level
        # data protection option. The data protection that you configure for the web ACL alters the data
        # that's available for any other data collection activity, including your WAF logging destinations,
        # web ACL request sampling, and Amazon Security Lake data collection and management. Your other option
        # for data protection is in the logging configuration, which only affects logging.

        @[JSON::Field(key: "DataProtectionConfig")]
        getter data_protection_config : Types::DataProtectionConfig?

        # A description of the web ACL that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the type of DDoS protection to apply to web request data for a web ACL. For most
        # scenarios, it is recommended to use the default protection level, ACTIVE_UNDER_DDOS . If a web ACL
        # is associated with multiple Application Load Balancers, the changes you make to DDoS protection in
        # that web ACL will apply to all associated Application Load Balancers.

        @[JSON::Field(key: "OnSourceDDoSProtectionConfig")]
        getter on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # An array of key:value pairs to associate with the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Specifies the domains that WAF should accept in a web request token. This enables the use of tokens
        # across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web
        # Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF
        # accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts
        # the resource's host domain plus all domains in the token domain list, including their prefixed
        # subdomains. Example JSON: "TokenDomains": { "mywebsite.com", "myotherwebsite.com" } Public suffixes
        # aren't allowed. For example, you can't use gov.au or co.uk as token domains.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)?

        def initialize(
          @default_action : Types::DefaultAction,
          @name : String,
          @scope : String,
          @visibility_config : Types::VisibilityConfig,
          @application_config : Types::ApplicationConfig? = nil,
          @association_config : Types::AssociationConfig? = nil,
          @captcha_config : Types::CaptchaConfig? = nil,
          @challenge_config : Types::ChallengeConfig? = nil,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @data_protection_config : Types::DataProtectionConfig? = nil,
          @description : String? = nil,
          @on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig? = nil,
          @rules : Array(Types::Rule)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @token_domains : Array(String)? = nil
        )
        end
      end


      struct CreateWebACLResponse
        include JSON::Serializable

        # High-level information about a WebACL , returned by operations like create and list. This provides
        # information like the ID, that you can use to retrieve and manage a WebACL , and the ARN, that you
        # provide to operations like AssociateWebACL .

        @[JSON::Field(key: "Summary")]
        getter summary : Types::WebACLSummary?

        def initialize(
          @summary : Types::WebACLSummary? = nil
        )
        end
      end

      # A custom header for custom request and response handling. This is used in CustomResponse and
      # CustomRequestHandling .

      struct CustomHTTPHeader
        include JSON::Serializable

        # The name of the custom header. For custom request header insertion, when WAF inserts the header into
        # the request, it prefixes this name x-amzn-waf- , to avoid confusion with the headers that are
        # already in the request. For example, for the header name sample , WAF inserts the header
        # x-amzn-waf-sample .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the custom header.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Custom request handling behavior that inserts custom headers into a web request. You can add custom
      # request handling for WAF to use when the rule action doesn't block the request. For example,
      # CaptchaAction for requests with valid t okens, and AllowAction . For information about customizing
      # web requests and responses, see Customizing web requests and responses in WAF in the WAF Developer
      # Guide .

      struct CustomRequestHandling
        include JSON::Serializable

        # The HTTP headers to insert into the request. Duplicate header names are not allowed. For information
        # about the limits on count and size for custom request and response settings, see WAF quotas in the
        # WAF Developer Guide .

        @[JSON::Field(key: "InsertHeaders")]
        getter insert_headers : Array(Types::CustomHTTPHeader)

        def initialize(
          @insert_headers : Array(Types::CustomHTTPHeader)
        )
        end
      end

      # A custom response to send to the client. You can define a custom response for rule actions and
      # default web ACL actions that are set to BlockAction . For information about customizing web requests
      # and responses, see Customizing web requests and responses in WAF in the WAF Developer Guide .

      struct CustomResponse
        include JSON::Serializable

        # The HTTP status code to return to the client. For a list of status codes that you can use in your
        # custom responses, see Supported status codes for custom response in the WAF Developer Guide .

        @[JSON::Field(key: "ResponseCode")]
        getter response_code : Int32

        # References the response body that you want WAF to return to the web request client. You can define a
        # custom response for a rule action or a default web ACL action that is set to block. To do this, you
        # first define the response body key and value in the CustomResponseBodies setting for the WebACL or
        # RuleGroup where you want to use it. Then, in the rule action or web ACL default action BlockAction
        # setting, you reference the response body using this key.

        @[JSON::Field(key: "CustomResponseBodyKey")]
        getter custom_response_body_key : String?

        # The HTTP headers to use in the response. You can specify any header name except for content-type .
        # Duplicate header names are not allowed. For information about the limits on count and size for
        # custom request and response settings, see WAF quotas in the WAF Developer Guide .

        @[JSON::Field(key: "ResponseHeaders")]
        getter response_headers : Array(Types::CustomHTTPHeader)?

        def initialize(
          @response_code : Int32,
          @custom_response_body_key : String? = nil,
          @response_headers : Array(Types::CustomHTTPHeader)? = nil
        )
        end
      end

      # The response body to use in a custom response to a web request. This is referenced by key from
      # CustomResponse CustomResponseBodyKey .

      struct CustomResponseBody
        include JSON::Serializable

        # The payload of the custom response. You can use JSON escape strings in JSON content. To do this, you
        # must specify JSON content in the ContentType setting. For information about the limits on count and
        # size for custom request and response settings, see WAF quotas in the WAF Developer Guide .

        @[JSON::Field(key: "Content")]
        getter content : String

        # The type of content in the payload that you are defining in the Content string.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        def initialize(
          @content : String,
          @content_type : String
        )
        end
      end

      # Specifies the protection behavior for a field type. This is part of the data protection
      # configuration for a web ACL.

      struct DataProtection
        include JSON::Serializable

        # Specifies how to protect the field. WAF can apply a one-way hash to the field or hard code a string
        # substitution. One-way hash example: ade099751dEXAMPLEHASH2ea9f3393f80dd5d3bEXAMPLEHASH966ae0d3cd5a1e
        # Substitution example: REDACTED

        @[JSON::Field(key: "Action")]
        getter action : String

        # Specifies the field type and optional keys to apply the protection behavior to.

        @[JSON::Field(key: "Field")]
        getter field : Types::FieldToProtect

        # Specifies whether to also exclude any rate-based rule details from the data protection you have
        # enabled for a given field. If you specify this exception, RateBasedDetails will show the value of
        # the field. For additional information, see the log field rateBasedRuleList at Log fields for web ACL
        # traffic in the WAF Developer Guide . Default: FALSE

        @[JSON::Field(key: "ExcludeRateBasedDetails")]
        getter exclude_rate_based_details : Bool?

        # Specifies whether to also exclude any rule match details from the data protection you have enabled
        # for a given field. WAF logs these details for non-terminating matching rules and for the terminating
        # matching rule. For additional information, see Log fields for web ACL traffic in the WAF Developer
        # Guide . Default: FALSE

        @[JSON::Field(key: "ExcludeRuleMatchDetails")]
        getter exclude_rule_match_details : Bool?

        def initialize(
          @action : String,
          @field : Types::FieldToProtect,
          @exclude_rate_based_details : Bool? = nil,
          @exclude_rule_match_details : Bool? = nil
        )
        end
      end

      # Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level
      # data protection option. The data protection that you configure for the web ACL alters the data
      # that's available for any other data collection activity, including your WAF logging destinations,
      # web ACL request sampling, and Amazon Security Lake data collection and management. Your other option
      # for data protection is in the logging configuration, which only affects logging. This is part of the
      # data protection configuration for a web ACL.

      struct DataProtectionConfig
        include JSON::Serializable

        # An array of data protection configurations for specific web request field types. This is defined for
        # each web ACL. WAF applies the specified protection to all web requests that the web ACL inspects.

        @[JSON::Field(key: "DataProtections")]
        getter data_protections : Array(Types::DataProtection)

        def initialize(
          @data_protections : Array(Types::DataProtection)
        )
        end
      end

      # In a WebACL , this is the action that you want WAF to perform when a web request doesn't match any
      # of the rules in the WebACL . The default action must be a terminating action.

      struct DefaultAction
        include JSON::Serializable

        # Specifies that WAF should allow requests by default.

        @[JSON::Field(key: "Allow")]
        getter allow : Types::AllowAction?

        # Specifies that WAF should block requests by default.

        @[JSON::Field(key: "Block")]
        getter block : Types::BlockAction?

        def initialize(
          @allow : Types::AllowAction? = nil,
          @block : Types::BlockAction? = nil
        )
        end
      end


      struct DeleteAPIKeyRequest
        include JSON::Serializable

        # The encrypted API key that you want to delete.

        @[JSON::Field(key: "APIKey")]
        getter api_key : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @api_key : String,
          @scope : String
        )
        end
      end


      struct DeleteAPIKeyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFirewallManagerRuleGroupsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "WebACLLockToken")]
        getter web_acl_lock_token : String

        def initialize(
          @web_acl_arn : String,
          @web_acl_lock_token : String
        )
        end
      end


      struct DeleteFirewallManagerRuleGroupsResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "NextWebACLLockToken")]
        getter next_web_acl_lock_token : String?

        def initialize(
          @next_web_acl_lock_token : String? = nil
        )
        end
      end


      struct DeleteIPSetRequest
        include JSON::Serializable

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct DeleteIPSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL from which you want to delete the LoggingConfiguration
        # .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The owner of the logging configuration, which must be set to CUSTOMER for the configurations that
        # you manage. The log scope SECURITY_LAKE indicates a configuration that is managed through Amazon
        # Security Lake. You can use Security Lake to collect log and event data from various sources for
        # normalization, analysis, and management. For information, see Collecting data from Amazon Web
        # Services services in the Amazon Security Lake user guide . The log scope
        # CLOUDWATCH_TELEMETRY_RULE_MANAGED indicates a configuration that is managed through Amazon
        # CloudWatch Logs for telemetry data collection and analysis. For information, see What is Amazon
        # CloudWatch Logs ? in the Amazon CloudWatch Logs user guide . Default: CUSTOMER

        @[JSON::Field(key: "LogScope")]
        getter log_scope : String?

        # Used to distinguish between various logging options. Currently, there is one option. Default:
        # WAF_LOGS

        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        def initialize(
          @resource_arn : String,
          @log_scope : String? = nil,
          @log_type : String? = nil
        )
        end
      end


      struct DeleteLoggingConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeletePermissionPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group from which you want to delete the policy. You must
        # be the owner of the rule group to perform this operation.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DeletePermissionPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRegexPatternSetRequest
        include JSON::Serializable

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the set. You cannot change the name after you create the set.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct DeleteRegexPatternSetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRuleGroupRequest
        include JSON::Serializable

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct DeleteRuleGroupResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWebACLRequest
        include JSON::Serializable

        # The unique identifier for the web ACL. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct DeleteWebACLResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeAllManagedProductsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @scope : String
        )
        end
      end


      struct DescribeAllManagedProductsResponse
        include JSON::Serializable

        # High-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web Services
        # Marketplace managed rule groups.

        @[JSON::Field(key: "ManagedProducts")]
        getter managed_products : Array(Types::ManagedProductDescriptor)?

        def initialize(
          @managed_products : Array(Types::ManagedProductDescriptor)? = nil
        )
        end
      end


      struct DescribeManagedProductsByVendorRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String

        def initialize(
          @scope : String,
          @vendor_name : String
        )
        end
      end


      struct DescribeManagedProductsByVendorResponse
        include JSON::Serializable

        # High-level information for the managed rule groups owned by the specified vendor.

        @[JSON::Field(key: "ManagedProducts")]
        getter managed_products : Array(Types::ManagedProductDescriptor)?

        def initialize(
          @managed_products : Array(Types::ManagedProductDescriptor)? = nil
        )
        end
      end


      struct DescribeManagedRuleGroupRequest
        include JSON::Serializable

        # The name of the managed rule group. You use this, along with the vendor name, to identify the rule
        # group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String

        # The version of the rule group. You can only use a version that is not scheduled for expiration. If
        # you don't provide this, WAF uses the vendor's default version.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @name : String,
          @scope : String,
          @vendor_name : String,
          @version_name : String? = nil
        )
        end
      end


      struct DescribeManagedRuleGroupResponse
        include JSON::Serializable

        # The labels that one or more rules in this rule group add to matching web requests. These labels are
        # defined in the RuleLabels for a Rule .

        @[JSON::Field(key: "AvailableLabels")]
        getter available_labels : Array(Types::LabelSummary)?

        # The web ACL capacity units (WCUs) required for this rule group. WAF uses WCUs to calculate and
        # control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF
        # calculates capacity differently for each rule type, to reflect the relative cost of each rule.
        # Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing
        # power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when
        # they use a rule group. For more information, see WAF web ACL capacity units (WCU) in the WAF
        # Developer Guide .

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64?

        # The labels that one or more rules in this rule group match against in label match statements. These
        # labels are defined in a LabelMatchStatement specification, in the Statement definition of a rule.

        @[JSON::Field(key: "ConsumedLabels")]
        getter consumed_labels : Array(Types::LabelSummary)?

        # The label namespace prefix for this rule group. All labels added by rules in this rule group have
        # this prefix. The syntax for the label namespace prefix for a managed rule group is the following:
        # awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt; : When a rule with a label matches a web
        # request, WAF adds the fully qualified label to the request. A fully qualified label is made up of
        # the label namespace from the rule group or web ACL where the rule is defined and the label from the
        # rule, separated by a colon: &lt;label namespace&gt;:&lt;label from rule&gt;

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : String?


        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::RuleSummary)?

        # The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to
        # provide notification of changes to the managed rule group. You can subscribe to the SNS topic to
        # receive notifications when the managed rule group is modified, such as for new versions and for
        # version expiration. For more information, see the Amazon Simple Notification Service Developer Guide
        # .

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The managed rule group's version.

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @available_labels : Array(Types::LabelSummary)? = nil,
          @capacity : Int64? = nil,
          @consumed_labels : Array(Types::LabelSummary)? = nil,
          @label_namespace : String? = nil,
          @rules : Array(Types::RuleSummary)? = nil,
          @sns_topic_arn : String? = nil,
          @version_name : String? = nil
        )
        end
      end

      # A WAF feature that is not supported by the CloudFront pricing plan associated with the web ACL.

      struct DisallowedFeature
        include JSON::Serializable

        # The name of the disallowed WAF feature.

        @[JSON::Field(key: "Feature")]
        getter feature : String?

        # The name of the CloudFront pricing plan required to use the WAF feature.

        @[JSON::Field(key: "RequiredPricingPlan")]
        getter required_pricing_plan : String?

        def initialize(
          @feature : String? = nil,
          @required_pricing_plan : String? = nil
        )
        end
      end


      struct DisassociateWebACLRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to disassociate from the web ACL. The ARN must be in
        # one of the following formats: For an Application Load Balancer: arn: partition
        # :elasticloadbalancing: region : account-id :loadbalancer/app/ load-balancer-name / load-balancer-id
        # For an Amazon API Gateway REST API: arn: partition :apigateway: region ::/restapis/ api-id /stages/
        # stage-name For an AppSync GraphQL API: arn: partition :appsync: region : account-id :apis/
        # GraphQLApiId For an Amazon Cognito user pool: arn: partition :cognito-idp: region : account-id
        # :userpool/ user-pool-id For an App Runner service: arn: partition :apprunner: region : account-id
        # :service/ apprunner-service-name / apprunner-service-id For an Amazon Web Services Verified Access
        # instance: arn: partition :ec2: region : account-id :verified-access-instance/ instance-id For an
        # Amplify application: arn: partition :amplify: region : account-id :apps/ app-id

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct DisassociateWebACLResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The name of the field in the request payload that contains your customer's email. This data type is
      # used in the RequestInspectionACFP data type.

      struct EmailField
        include JSON::Serializable

        # The name of the email field. How you specify this depends on the request inspection payload type.
        # For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON
        # Pointer syntax, see the Internet Engineering Task Force (IETF) documentation JavaScript Object
        # Notation (JSON) Pointer . For example, for the JSON payload { "form": { "email": "THE_EMAIL" } } ,
        # the email field specification is /form/email . For form encoded payload types, use the HTML form
        # names. For example, for an HTML form with the input element named email1 , the email field
        # specification is email1 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # Specifies a single rule in a rule group whose action you want to override to Count . Instead of this
      # option, use RuleActionOverrides . It accepts any valid action setting, including Count .

      struct ExcludedRule
        include JSON::Serializable

        # The name of the rule whose action you want to override to Count .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Specifies a web request component to be used in a rule match statement or in a logging
      # configuration. In a rule statement, this is the part of the web request that you want WAF to
      # inspect. Include the single FieldToMatch type that you want to inspect, with additional
      # specifications as needed, according to the type. You specify a single request component in
      # FieldToMatch for each rule statement that requires it. To inspect more than one component of the web
      # request, create a separate rule statement for each component. Example JSON for a QueryString field
      # to match: "FieldToMatch": { "QueryString": {} } Example JSON for a Method field to match
      # specification: "FieldToMatch": { "Method": { "Name": "DELETE" } } In a logging configuration, this
      # is used in the RedactedFields property to specify a field to redact from the logging records. For
      # this use case, note the following: Even though all FieldToMatch settings are available, the only
      # valid settings for field redaction are UriPath , QueryString , SingleHeader , and Method . In this
      # documentation, the descriptions of the individual fields talk about specifying the web request
      # component to inspect, but for field redaction, you are specifying the component type to redact from
      # the logs. If you have request sampling enabled, the redacted fields configuration for logging has no
      # impact on sampling. You can only exclude fields from request sampling by disabling sampling in the
      # web ACL visibility configuration or by configuring data protection for the web ACL.

      struct FieldToMatch
        include JSON::Serializable

        # Inspect all query arguments.

        @[JSON::Field(key: "AllQueryArguments")]
        getter all_query_arguments : Types::AllQueryArguments?

        # Inspect the request body as plain text. The request body immediately follows the request headers.
        # This is the part of a request that contains any additional data that you want to send to your web
        # server as the HTTP request body, such as data from a form. WAF does not support inspecting the
        # entire contents of the web request body if the body exceeds the limit for the resource type. When a
        # web request body is larger than the limit, the underlying host service only forwards the contents
        # that are within the limit to WAF for inspection. For Application Load Balancer and AppSync, the
        # limit is fixed at 8 KB (8,192 bytes). For CloudFront, API Gateway, Amazon Cognito, App Runner, and
        # Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each
        # resource type in the web ACL AssociationConfig , for additional processing fees. For Amplify, use
        # the CloudFront limit. For information about how to handle oversized request bodies, see the Body
        # object configuration.

        @[JSON::Field(key: "Body")]
        getter body : Types::Body?

        # Inspect the request cookies. You must configure scope and pattern matching filters in the Cookies
        # object, to define the set of cookies and the parts of the cookies that WAF inspects. Only the first
        # 8 KB (8192 bytes) of a request's cookies and only the first 200 cookies are forwarded to WAF for
        # inspection by the underlying host service. You must configure how to handle any oversize cookie
        # content in the Cookies object. WAF applies the pattern matching filters to the cookies that it
        # receives from the underlying host service.

        @[JSON::Field(key: "Cookies")]
        getter cookies : Types::Cookies?

        # Inspect a string containing the list of the request's header names, ordered as they appear in the
        # web request that WAF receives for inspection. WAF generates the string and then uses that as the
        # field to match component in its inspection. WAF separates the header names in the string using
        # colons and no added spaces, for example host:user-agent:accept:authorization:referer .

        @[JSON::Field(key: "HeaderOrder")]
        getter header_order : Types::HeaderOrder?

        # Inspect the request headers. You must configure scope and pattern matching filters in the Headers
        # object, to define the set of headers to and the parts of the headers that WAF inspects. Only the
        # first 8 KB (8192 bytes) of a request's headers and only the first 200 headers are forwarded to WAF
        # for inspection by the underlying host service. You must configure how to handle any oversize header
        # content in the Headers object. WAF applies the pattern matching filters to the headers that it
        # receives from the underlying host service.

        @[JSON::Field(key: "Headers")]
        getter headers : Types::Headers?

        # Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against
        # the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS
        # Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's
        # TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS
        # Client Hello information for the calculation. Almost all web requests include this information. You
        # can use this choice only with a string match ByteMatchStatement with the PositionalConstraint set to
        # EXACTLY . You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is
        # able to calculate the fingerprint, it includes it in the logs. For information about the logging
        # fields, see Log fields in the WAF Developer Guide . Provide the JA3 fingerprint string from the logs
        # in your string match statement specification, to match with any future requests that have the same
        # TLS configuration.

        @[JSON::Field(key: "JA3Fingerprint")]
        getter ja3_fingerprint : Types::JA3Fingerprint?

        # Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against
        # the request's JA4 fingerprint. The JA4 fingerprint is a 36-character hash derived from the TLS
        # Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's
        # TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS
        # Client Hello information for the calculation. Almost all web requests include this information. You
        # can use this choice only with a string match ByteMatchStatement with the PositionalConstraint set to
        # EXACTLY . You can obtain the JA4 fingerprint for client requests from the web ACL logs. If WAF is
        # able to calculate the fingerprint, it includes it in the logs. For information about the logging
        # fields, see Log fields in the WAF Developer Guide . Provide the JA4 fingerprint string from the logs
        # in your string match statement specification, to match with any future requests that have the same
        # TLS configuration.

        @[JSON::Field(key: "JA4Fingerprint")]
        getter ja4_fingerprint : Types::JA4Fingerprint?

        # Inspect the request body as JSON. The request body immediately follows the request headers. This is
        # the part of a request that contains any additional data that you want to send to your web server as
        # the HTTP request body, such as data from a form. WAF does not support inspecting the entire contents
        # of the web request body if the body exceeds the limit for the resource type. When a web request body
        # is larger than the limit, the underlying host service only forwards the contents that are within the
        # limit to WAF for inspection. For Application Load Balancer and AppSync, the limit is fixed at 8 KB
        # (8,192 bytes). For CloudFront, API Gateway, Amazon Cognito, App Runner, and Verified Access, the
        # default limit is 16 KB (16,384 bytes), and you can increase the limit for each resource type in the
        # web ACL AssociationConfig , for additional processing fees. For Amplify, use the CloudFront limit.
        # For information about how to handle oversized request bodies, see the JsonBody object configuration.

        @[JSON::Field(key: "JsonBody")]
        getter json_body : Types::JsonBody?

        # Inspect the HTTP method. The method indicates the type of operation that the request is asking the
        # origin to perform.

        @[JSON::Field(key: "Method")]
        getter method : Types::Method?

        # Inspect the query string. This is the part of a URL that appears after a ? character, if any.

        @[JSON::Field(key: "QueryString")]
        getter query_string : Types::QueryString?

        # Inspect a single header. Provide the name of the header to inspect, for example, User-Agent or
        # Referer . This setting isn't case sensitive. Example JSON: "SingleHeader": { "Name": "haystack" }
        # Alternately, you can filter and inspect all headers with the Headers FieldToMatch setting.

        @[JSON::Field(key: "SingleHeader")]
        getter single_header : Types::SingleHeader?

        # Inspect a single query argument. Provide the name of the query argument to inspect, such as UserName
        # or SalesRegion . The name can be up to 30 characters long and isn't case sensitive. Example JSON:
        # "SingleQueryArgument": { "Name": "myArgument" }

        @[JSON::Field(key: "SingleQueryArgument")]
        getter single_query_argument : Types::SingleQueryArgument?

        # Inspect fragments of the request URI. You must configure scope and pattern matching filters in the
        # UriFragment object, to define the fragment of a URI that WAF inspects. Only the first 8 KB (8192
        # bytes) of a request's URI fragments and only the first 200 URI fragments are forwarded to WAF for
        # inspection by the underlying host service. You must configure how to handle any oversize URI
        # fragment content in the UriFragment object. WAF applies the pattern matching filters to the cookies
        # that it receives from the underlying host service.

        @[JSON::Field(key: "UriFragment")]
        getter uri_fragment : Types::UriFragment?

        # Inspect the request URI path. This is the part of the web request that identifies a resource, for
        # example, /images/daily-ad.jpg .

        @[JSON::Field(key: "UriPath")]
        getter uri_path : Types::UriPath?

        def initialize(
          @all_query_arguments : Types::AllQueryArguments? = nil,
          @body : Types::Body? = nil,
          @cookies : Types::Cookies? = nil,
          @header_order : Types::HeaderOrder? = nil,
          @headers : Types::Headers? = nil,
          @ja3_fingerprint : Types::JA3Fingerprint? = nil,
          @ja4_fingerprint : Types::JA4Fingerprint? = nil,
          @json_body : Types::JsonBody? = nil,
          @method : Types::Method? = nil,
          @query_string : Types::QueryString? = nil,
          @single_header : Types::SingleHeader? = nil,
          @single_query_argument : Types::SingleQueryArgument? = nil,
          @uri_fragment : Types::UriFragment? = nil,
          @uri_path : Types::UriPath? = nil
        )
        end
      end

      # Specifies a field type and keys to protect in stored web request data. This is part of the data
      # protection configuration for a web ACL.

      struct FieldToProtect
        include JSON::Serializable

        # Specifies the web request component type to protect.

        @[JSON::Field(key: "FieldType")]
        getter field_type : String

        # Specifies the keys to protect for the specified field type. If you don't specify any key, then all
        # keys for the field type are protected.

        @[JSON::Field(key: "FieldKeys")]
        getter field_keys : Array(String)?

        def initialize(
          @field_type : String,
          @field_keys : Array(String)? = nil
        )
        end
      end

      # A single logging filter, used in LoggingFilter .

      struct Filter
        include JSON::Serializable

        # How to handle logs that satisfy the filter's conditions and requirement.

        @[JSON::Field(key: "Behavior")]
        getter behavior : String

        # Match conditions for the filter.

        @[JSON::Field(key: "Conditions")]
        getter conditions : Array(Types::Condition)

        # Logic to apply to the filtering conditions. You can specify that, in order to satisfy the filter, a
        # log must match all conditions or must match at least one condition.

        @[JSON::Field(key: "Requirement")]
        getter requirement : String

        def initialize(
          @behavior : String,
          @conditions : Array(Types::Condition),
          @requirement : String
        )
        end
      end

      # A rule group that's defined for an Firewall Manager WAF policy.

      struct FirewallManagerRuleGroup
        include JSON::Serializable

        # The processing guidance for an Firewall Manager rule. This is like a regular rule Statement , but it
        # can only contain a rule group reference.

        @[JSON::Field(key: "FirewallManagerStatement")]
        getter firewall_manager_statement : Types::FirewallManagerStatement

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The action to use in the place of the action that results from the rule group evaluation. Set the
        # override action to none to leave the result of the rule group alone. Set it to count to override the
        # result to count only. You can only use this for rule statements that reference a rule group, like
        # RuleGroupReferenceStatement and ManagedRuleGroupStatement . This option is usually set to none. It
        # does not affect how the rules in the rule group are evaluated. If you want the rules in the rule
        # group to only count matches, do not use this and instead use the rule action override option, with
        # Count action, in your rule group reference statement settings.

        @[JSON::Field(key: "OverrideAction")]
        getter override_action : Types::OverrideAction

        # If you define more than one rule group in the first or last Firewall Manager rule groups, WAF
        # evaluates each request against the rule groups in order, starting from the lowest priority setting.
        # The priorities don't need to be consecutive, but they must all be different.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        def initialize(
          @firewall_manager_statement : Types::FirewallManagerStatement,
          @name : String,
          @override_action : Types::OverrideAction,
          @priority : Int32,
          @visibility_config : Types::VisibilityConfig
        )
        end
      end

      # The processing guidance for an Firewall Manager rule. This is like a regular rule Statement , but it
      # can only contain a single rule group reference.

      struct FirewallManagerStatement
        include JSON::Serializable

        # A statement used by Firewall Manager to run the rules that are defined in a managed rule group. This
        # is managed by Firewall Manager for an Firewall Manager WAF policy.

        @[JSON::Field(key: "ManagedRuleGroupStatement")]
        getter managed_rule_group_statement : Types::ManagedRuleGroupStatement?

        # A statement used by Firewall Manager to run the rules that are defined in a rule group. This is
        # managed by Firewall Manager for an Firewall Manager WAF policy.

        @[JSON::Field(key: "RuleGroupReferenceStatement")]
        getter rule_group_reference_statement : Types::RuleGroupReferenceStatement?

        def initialize(
          @managed_rule_group_statement : Types::ManagedRuleGroupStatement? = nil,
          @rule_group_reference_statement : Types::RuleGroupReferenceStatement? = nil
        )
        end
      end

      # The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using
      # the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For
      # (XFF) header, but you can specify any header name. If the specified header isn't present in the
      # request, WAF doesn't apply the rule to the web request at all. This configuration is used for
      # GeoMatchStatement , AsnMatchStatement , and RateBasedStatement . For IPSetReferenceStatement , use
      # IPSetForwardedIPConfig instead. WAF only evaluates the first IP address found in the specified HTTP
      # header.

      struct ForwardedIPConfig
        include JSON::Serializable

        # The match status to assign to the web request if the request doesn't have a valid IP address in the
        # specified position. If the specified header isn't present in the request, WAF doesn't apply the rule
        # to the web request at all. You can specify the following fallback behaviors: MATCH - Treat the web
        # request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH - Treat
        # the web request as not matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        # The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF)
        # header, set this to X-Forwarded-For . If the specified header isn't present in the request, WAF
        # doesn't apply the rule to the web request at all.

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String

        def initialize(
          @fallback_behavior : String,
          @header_name : String
        )
        end
      end


      struct GenerateMobileSdkReleaseUrlRequest
        include JSON::Serializable

        # The device platform.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The release version. For the latest available version, specify LATEST .

        @[JSON::Field(key: "ReleaseVersion")]
        getter release_version : String

        def initialize(
          @platform : String,
          @release_version : String
        )
        end
      end


      struct GenerateMobileSdkReleaseUrlResponse
        include JSON::Serializable

        # The presigned download URL for the specified SDK release.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      # A rule statement that labels web requests by country and region and that matches against web
      # requests based on country code. A geo match rule labels every request that it inspects regardless of
      # whether it finds a match. To manage requests only by country, you can use this statement by itself
      # and specify the countries that you want to match against in the CountryCodes array. Otherwise,
      # configure your geo match rule with Count action so that it only labels requests. Then, add one or
      # more label match rules to run after the geo match rule and configure them to match against the
      # geographic labels and handle the requests as needed. WAF labels requests using the alpha-2 country
      # and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF
      # determines the codes using either the IP address in the web request origin or, if you specify it,
      # the address in the geo match ForwardedIPConfig . If you use the web request origin, the label
      # formats are awswaf:clientip:geo:region:&lt;ISO country code&gt;-&lt;ISO region code&gt; and
      # awswaf:clientip:geo:country:&lt;ISO country code&gt; . If you use a forwarded IP address, the label
      # formats are awswaf:forwardedip:geo:region:&lt;ISO country code&gt;-&lt;ISO region code&gt; and
      # awswaf:forwardedip:geo:country:&lt;ISO country code&gt; . For additional details, see Geographic
      # match rule statement in the WAF Developer Guide .

      struct GeoMatchStatement
        include JSON::Serializable

        # An array of two-character country codes that you want to match against, for example, [ "US", "CN" ]
        # , from the alpha-2 country ISO codes of the ISO 3166 international standard. When you use a geo
        # match statement just for the region and country labels that it adds to requests, you still have to
        # supply a country code for the rule to evaluate. In this case, you configure the rule to only count
        # matching requests, but it will still generate logging and count metrics for any matches. You can
        # reduce the logging and metrics that the rule produces by specifying a country that's unlikely to be
        # a source of traffic to your site.

        @[JSON::Field(key: "CountryCodes")]
        getter country_codes : Array(String)?

        # The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using
        # the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For
        # (XFF) header, but you can specify any header name. If the specified header isn't present in the
        # request, WAF doesn't apply the rule to the web request at all.

        @[JSON::Field(key: "ForwardedIPConfig")]
        getter forwarded_ip_config : Types::ForwardedIPConfig?

        def initialize(
          @country_codes : Array(String)? = nil,
          @forwarded_ip_config : Types::ForwardedIPConfig? = nil
        )
        end
      end


      struct GetDecryptedAPIKeyRequest
        include JSON::Serializable

        # The encrypted API key.

        @[JSON::Field(key: "APIKey")]
        getter api_key : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @api_key : String,
          @scope : String
        )
        end
      end


      struct GetDecryptedAPIKeyResponse
        include JSON::Serializable

        # The date and time that the key was created.

        @[JSON::Field(key: "CreationTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The token domains that are defined in this API key.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)?

        def initialize(
          @creation_timestamp : Time? = nil,
          @token_domains : Array(String)? = nil
        )
        end
      end


      struct GetIPSetRequest
        include JSON::Serializable

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct GetIPSetResponse
        include JSON::Serializable


        @[JSON::Field(key: "IPSet")]
        getter ip_set : Types::IPSet?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        def initialize(
          @ip_set : Types::IPSet? = nil,
          @lock_token : String? = nil
        )
        end
      end


      struct GetLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL for which you want to get the LoggingConfiguration .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The owner of the logging configuration, which must be set to CUSTOMER for the configurations that
        # you manage. The log scope SECURITY_LAKE indicates a configuration that is managed through Amazon
        # Security Lake. You can use Security Lake to collect log and event data from various sources for
        # normalization, analysis, and management. For information, see Collecting data from Amazon Web
        # Services services in the Amazon Security Lake user guide . The log scope
        # CLOUDWATCH_TELEMETRY_RULE_MANAGED indicates a configuration that is managed through Amazon
        # CloudWatch Logs for telemetry data collection and analysis. For information, see What is Amazon
        # CloudWatch Logs ? in the Amazon CloudWatch Logs user guide . Default: CUSTOMER

        @[JSON::Field(key: "LogScope")]
        getter log_scope : String?

        # Used to distinguish between various logging options. Currently, there is one option. Default:
        # WAF_LOGS

        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        def initialize(
          @resource_arn : String,
          @log_scope : String? = nil,
          @log_type : String? = nil
        )
        end
      end


      struct GetLoggingConfigurationResponse
        include JSON::Serializable

        # The LoggingConfiguration for the specified web ACL.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end


      struct GetManagedRuleSetRequest
        include JSON::Serializable

        # A unique identifier for the managed rule set. The ID is returned in the responses to commands like
        # list . You provide it to operations like get and update .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the managed rule set. You use this, along with the rule set ID, to identify the rule
        # set. This name is assigned to the corresponding managed rule group, which your customers can access
        # and use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct GetManagedRuleSetResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The managed rule set that you requested.

        @[JSON::Field(key: "ManagedRuleSet")]
        getter managed_rule_set : Types::ManagedRuleSet?

        def initialize(
          @lock_token : String? = nil,
          @managed_rule_set : Types::ManagedRuleSet? = nil
        )
        end
      end


      struct GetMobileSdkReleaseRequest
        include JSON::Serializable

        # The device platform.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The release version. For the latest available version, specify LATEST .

        @[JSON::Field(key: "ReleaseVersion")]
        getter release_version : String

        def initialize(
          @platform : String,
          @release_version : String
        )
        end
      end


      struct GetMobileSdkReleaseResponse
        include JSON::Serializable

        # Information for a specified SDK release, including release notes and tags.

        @[JSON::Field(key: "MobileSdkRelease")]
        getter mobile_sdk_release : Types::MobileSdkRelease?

        def initialize(
          @mobile_sdk_release : Types::MobileSdkRelease? = nil
        )
        end
      end


      struct GetPermissionPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule group for which you want to get the policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetPermissionPolicyResponse
        include JSON::Serializable

        # The IAM policy that is attached to the specified rule group.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetRateBasedStatementManagedKeysRequest
        include JSON::Serializable

        # The name of the rate-based rule to get the keys for. If you have the rule defined inside a rule
        # group that you're using in your web ACL, also provide the name of the rule group reference statement
        # in the request parameter RuleGroupRuleName .

        @[JSON::Field(key: "RuleName")]
        getter rule_name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The unique identifier for the web ACL. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "WebACLName")]
        getter web_acl_name : String

        # The name of the rule group reference statement in your web ACL. This is required only when you have
        # the rate-based rule nested inside a rule group.

        @[JSON::Field(key: "RuleGroupRuleName")]
        getter rule_group_rule_name : String?

        def initialize(
          @rule_name : String,
          @scope : String,
          @web_acl_id : String,
          @web_acl_name : String,
          @rule_group_rule_name : String? = nil
        )
        end
      end


      struct GetRateBasedStatementManagedKeysResponse
        include JSON::Serializable

        # The keys that are of Internet Protocol version 4 (IPv4).

        @[JSON::Field(key: "ManagedKeysIPV4")]
        getter managed_keys_ipv4 : Types::RateBasedStatementManagedKeysIPSet?

        # The keys that are of Internet Protocol version 6 (IPv6).

        @[JSON::Field(key: "ManagedKeysIPV6")]
        getter managed_keys_ipv6 : Types::RateBasedStatementManagedKeysIPSet?

        def initialize(
          @managed_keys_ipv4 : Types::RateBasedStatementManagedKeysIPSet? = nil,
          @managed_keys_ipv6 : Types::RateBasedStatementManagedKeysIPSet? = nil
        )
        end
      end


      struct GetRegexPatternSetRequest
        include JSON::Serializable

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the set. You cannot change the name after you create the set.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @id : String,
          @name : String,
          @scope : String
        )
        end
      end


      struct GetRegexPatternSetResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?


        @[JSON::Field(key: "RegexPatternSet")]
        getter regex_pattern_set : Types::RegexPatternSet?

        def initialize(
          @lock_token : String? = nil,
          @regex_pattern_set : Types::RegexPatternSet? = nil
        )
        end
      end


      struct GetRuleGroupRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @scope : String? = nil
        )
        end
      end


      struct GetRuleGroupResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?


        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        def initialize(
          @lock_token : String? = nil,
          @rule_group : Types::RuleGroup? = nil
        )
        end
      end


      struct GetSampledRequestsRequest
        include JSON::Serializable

        # The number of requests that you want WAF to return from among the first 5,000 requests that your
        # Amazon Web Services resource received during the time range. If your resource received fewer
        # requests than the value of MaxItems , GetSampledRequests returns information about all of them.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int64

        # The metric name assigned to the Rule or RuleGroup dimension for which you want a sample of requests.

        @[JSON::Field(key: "RuleMetricName")]
        getter rule_metric_name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The start date and time and the end date and time of the range for which you want GetSampledRequests
        # to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC)
        # format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z" . You can
        # specify any time range in the previous three hours. If you specify a start time that's earlier than
        # three hours ago, WAF sets it to three hours ago.

        @[JSON::Field(key: "TimeWindow")]
        getter time_window : Types::TimeWindow

        # The Amazon resource name (ARN) of the WebACL for which you want a sample of requests.

        @[JSON::Field(key: "WebAclArn")]
        getter web_acl_arn : String

        def initialize(
          @max_items : Int64,
          @rule_metric_name : String,
          @scope : String,
          @time_window : Types::TimeWindow,
          @web_acl_arn : String
        )
        end
      end


      struct GetSampledRequestsResponse
        include JSON::Serializable

        # The total number of requests from which GetSampledRequests got a sample of MaxItems requests. If
        # PopulationSize is less than MaxItems , the sample includes every request that your Amazon Web
        # Services resource received during the specified time range.

        @[JSON::Field(key: "PopulationSize")]
        getter population_size : Int64?

        # A complex type that contains detailed information about each of the requests in the sample.

        @[JSON::Field(key: "SampledRequests")]
        getter sampled_requests : Array(Types::SampledHTTPRequest)?

        # Usually, TimeWindow is the time range that you specified in the GetSampledRequests request. However,
        # if your Amazon Web Services resource received more than 5,000 requests during the time range that
        # you specified in the request, GetSampledRequests returns the time range for the first 5,000
        # requests. Times are in Coordinated Universal Time (UTC) format.

        @[JSON::Field(key: "TimeWindow")]
        getter time_window : Types::TimeWindow?

        def initialize(
          @population_size : Int64? = nil,
          @sampled_requests : Array(Types::SampledHTTPRequest)? = nil,
          @time_window : Types::TimeWindow? = nil
        )
        end
      end


      struct GetWebACLForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource whose web ACL you want to retrieve. The ARN must be
        # in one of the following formats: For an Application Load Balancer: arn: partition
        # :elasticloadbalancing: region : account-id :loadbalancer/app/ load-balancer-name / load-balancer-id
        # For an Amazon API Gateway REST API: arn: partition :apigateway: region ::/restapis/ api-id /stages/
        # stage-name For an AppSync GraphQL API: arn: partition :appsync: region : account-id :apis/
        # GraphQLApiId For an Amazon Cognito user pool: arn: partition :cognito-idp: region : account-id
        # :userpool/ user-pool-id For an App Runner service: arn: partition :apprunner: region : account-id
        # :service/ apprunner-service-name / apprunner-service-id For an Amazon Web Services Verified Access
        # instance: arn: partition :ec2: region : account-id :verified-access-instance/ instance-id For an
        # Amplify application: arn: partition :amplify: region : account-id :apps/ app-id

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetWebACLForResourceResponse
        include JSON::Serializable

        # The web ACL that is associated with the resource. If there is no associated resource, WAF returns a
        # null web ACL.

        @[JSON::Field(key: "WebACL")]
        getter web_acl : Types::WebACL?

        def initialize(
          @web_acl : Types::WebACL? = nil
        )
        end
      end


      struct GetWebACLRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL that you want to retrieve.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The unique identifier for the web ACL. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @scope : String? = nil
        )
        end
      end


      struct GetWebACLResponse
        include JSON::Serializable

        # The URL to use in SDK integrations with Amazon Web Services managed rule groups. For example, you
        # can use the integration SDKs with the account takeover prevention managed rule group
        # AWSManagedRulesATPRuleSet and the account creation fraud prevention managed rule group
        # AWSManagedRulesACFPRuleSet . This is only populated if you are using a rule group in your web ACL
        # that integrates with your applications in this way. For more information, see WAF client application
        # integration in the WAF Developer Guide .

        @[JSON::Field(key: "ApplicationIntegrationURL")]
        getter application_integration_url : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The web ACL specification. You can modify the settings in this web ACL and use it to update this web
        # ACL or create a new one.

        @[JSON::Field(key: "WebACL")]
        getter web_acl : Types::WebACL?

        def initialize(
          @application_integration_url : String? = nil,
          @lock_token : String? = nil,
          @web_acl : Types::WebACL? = nil
        )
        end
      end

      # Part of the response from GetSampledRequests . This is a complex type that appears as Headers in the
      # response syntax. HTTPHeader contains the names and values of all of the headers that appear in one
      # of the web requests.

      struct HTTPHeader
        include JSON::Serializable

        # The name of the HTTP header.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the HTTP header.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Part of the response from GetSampledRequests . This is a complex type that appears as Request in the
      # response syntax. HTTPRequest contains information about one of the web requests.

      struct HTTPRequest
        include JSON::Serializable

        # The IP address that the request originated from. If the web ACL is associated with a CloudFront
        # distribution, this is the value of one of the following fields in CloudFront access logs: c-ip , if
        # the viewer did not use an HTTP proxy or a load balancer to send the request x-forwarded-for , if the
        # viewer did use an HTTP proxy or a load balancer to send the request

        @[JSON::Field(key: "ClientIP")]
        getter client_ip : String?

        # The two-letter country code for the country that the request originated from. For a current list of
        # country codes, see the Wikipedia entry ISO 3166-1 alpha-2 .

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The HTTP version specified in the sampled web request, for example, HTTP/1.1 .

        @[JSON::Field(key: "HTTPVersion")]
        getter http_version : String?

        # A complex type that contains the name and value for each header in the sampled web request.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::HTTPHeader)?

        # The HTTP method specified in the sampled web request.

        @[JSON::Field(key: "Method")]
        getter method : String?

        # The URI path of the request, which identifies the resource, for example, /images/daily-ad.jpg .

        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @client_ip : String? = nil,
          @country : String? = nil,
          @http_version : String? = nil,
          @headers : Array(Types::HTTPHeader)? = nil,
          @method : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # The filter to use to identify the subset of headers to inspect in a web request. You must specify
      # exactly one setting: either All , IncludedHeaders , or ExcludedHeaders . Example JSON:
      # "MatchPattern": { "ExcludedHeaders": [ "KeyToExclude1", "KeyToExclude2" ] }

      struct HeaderMatchPattern
        include JSON::Serializable

        # Inspect all headers.

        @[JSON::Field(key: "All")]
        getter all : Types::All?

        # Inspect only the headers whose keys don't match any of the strings specified here.

        @[JSON::Field(key: "ExcludedHeaders")]
        getter excluded_headers : Array(String)?

        # Inspect only the headers that have a key that matches one of the strings specified here.

        @[JSON::Field(key: "IncludedHeaders")]
        getter included_headers : Array(String)?

        def initialize(
          @all : Types::All? = nil,
          @excluded_headers : Array(String)? = nil,
          @included_headers : Array(String)? = nil
        )
        end
      end

      # Inspect a string containing the list of the request's header names, ordered as they appear in the
      # web request that WAF receives for inspection. WAF generates the string and then uses that as the
      # field to match component in its inspection. WAF separates the header names in the string using
      # colons and no added spaces, for example host:user-agent:accept:authorization:referer .

      struct HeaderOrder
        include JSON::Serializable

        # What WAF should do if the headers determined by your match scope are more numerous or larger than
        # WAF can inspect. WAF does not support inspecting the entire contents of request headers when they
        # exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200
        # headers and at most 8 KB of header contents to WAF. The options for oversize handling are the
        # following: CONTINUE - Inspect the available headers normally, according to the rule inspection
        # criteria. MATCH - Treat the web request as matching the rule statement. WAF applies the rule action
        # to the request. NO_MATCH - Treat the web request as not matching the rule statement.

        @[JSON::Field(key: "OversizeHandling")]
        getter oversize_handling : String

        def initialize(
          @oversize_handling : String
        )
        end
      end

      # Inspect all headers in the web request. You can specify the parts of the headers to inspect and you
      # can narrow the set of headers to inspect by including or excluding specific keys. This is used to
      # indicate the web request component to inspect, in the FieldToMatch specification. If you want to
      # inspect just the value of a single header, use the SingleHeader FieldToMatch setting instead.
      # Example JSON: "Headers": { "MatchPattern": { "All": {} }, "MatchScope": "KEY", "OversizeHandling":
      # "MATCH" }

      struct Headers
        include JSON::Serializable

        # The filter to use to identify the subset of headers to inspect in a web request. You must specify
        # exactly one setting: either All , IncludedHeaders , or ExcludedHeaders . Example JSON:
        # "MatchPattern": { "ExcludedHeaders": [ "KeyToExclude1", "KeyToExclude2" ] }

        @[JSON::Field(key: "MatchPattern")]
        getter match_pattern : Types::HeaderMatchPattern

        # The parts of the headers to match with the rule inspection criteria. If you specify ALL , WAF
        # inspects both keys and values. All does not require a match to be found in the keys and a match to
        # be found in the values. It requires a match to be found in the keys or the values or both. To
        # require a match in the keys and in the values, use a logical AND statement to combine two match
        # rules, one that inspects the keys and another that inspects the values.

        @[JSON::Field(key: "MatchScope")]
        getter match_scope : String

        # What WAF should do if the headers determined by your match scope are more numerous or larger than
        # WAF can inspect. WAF does not support inspecting the entire contents of request headers when they
        # exceed 8 KB (8192 bytes) or 200 total headers. The underlying host service forwards a maximum of 200
        # headers and at most 8 KB of header contents to WAF. The options for oversize handling are the
        # following: CONTINUE - Inspect the available headers normally, according to the rule inspection
        # criteria. MATCH - Treat the web request as matching the rule statement. WAF applies the rule action
        # to the request. NO_MATCH - Treat the web request as not matching the rule statement.

        @[JSON::Field(key: "OversizeHandling")]
        getter oversize_handling : String

        def initialize(
          @match_pattern : Types::HeaderMatchPattern,
          @match_scope : String,
          @oversize_handling : String
        )
        end
      end

      # Contains zero or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain
      # Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0. For information
      # about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing . WAF assigns an ARN to
      # each IPSet that you create. To use an IP set in a rule, you provide the ARN to the Rule statement
      # IPSetReferenceStatement .

      struct IPSet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that
        # you want WAF to inspect for in incoming requests. All addresses must be specified using Classless
        # Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0 .
        # Example address strings: For requests that originated from the IP address 192.0.2.44, specify
        # 192.0.2.44/32 . For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255,
        # specify 192.0.2.0/24 . For requests that originated from the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . For
        # requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
        # 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        # Example JSON Addresses specifications: Empty array: "Addresses": [] Array with one address:
        # "Addresses": ["192.0.2.44/32"] Array with three addresses: "Addresses": ["192.0.2.44/32",
        # "192.0.2.0/24", "192.0.0.0/16"] INVALID specification: "Addresses": [""] INVALID

        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(String)

        # The version of the IP addresses, either IPV4 or IPV6 .

        @[JSON::Field(key: "IPAddressVersion")]
        getter ip_address_version : String

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the IP set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @arn : String,
          @addresses : Array(String),
          @ip_address_version : String,
          @id : String,
          @name : String,
          @description : String? = nil
        )
        end
      end

      # The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using
      # the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For
      # (XFF) header, but you can specify any header name. If the specified header isn't present in the
      # request, WAF doesn't apply the rule to the web request at all. This configuration is used only for
      # IPSetReferenceStatement . For GeoMatchStatement and RateBasedStatement , use ForwardedIPConfig
      # instead.

      struct IPSetForwardedIPConfig
        include JSON::Serializable

        # The match status to assign to the web request if the request doesn't have a valid IP address in the
        # specified position. If the specified header isn't present in the request, WAF doesn't apply the rule
        # to the web request at all. You can specify the following fallback behaviors: MATCH - Treat the web
        # request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH - Treat
        # the web request as not matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        # The name of the HTTP header to use for the IP address. For example, to use the X-Forwarded-For (XFF)
        # header, set this to X-Forwarded-For . If the specified header isn't present in the request, WAF
        # doesn't apply the rule to the web request at all.

        @[JSON::Field(key: "HeaderName")]
        getter header_name : String

        # The position in the header to search for the IP address. The header can contain IP addresses of the
        # original client and also of proxies. For example, the header value could be 10.1.1.1, 127.0.0.0,
        # 10.10.10.10 where the first IP address identifies the original client and the rest identify proxies
        # that the request went through. The options for this setting are the following: FIRST - Inspect the
        # first IP address in the list of IP addresses in the header. This is usually the client's original
        # IP. LAST - Inspect the last IP address in the list of IP addresses in the header. ANY - Inspect all
        # IP addresses in the header for a match. If the header contains more than 10 IP addresses, WAF
        # inspects the last 10.

        @[JSON::Field(key: "Position")]
        getter position : String

        def initialize(
          @fallback_behavior : String,
          @header_name : String,
          @position : String
        )
        end
      end

      # A rule statement used to detect web requests coming from particular IP addresses or address ranges.
      # To use this, create an IPSet that specifies the addresses you want to detect, then use the ARN of
      # that set in this statement. To create an IP set, see CreateIPSet . Each IP set rule statement
      # references an IP set. You create and maintain the set independent of your rules. This allows you to
      # use the single set in multiple rules. When you update the referenced set, WAF automatically updates
      # all rules that reference it.

      struct IPSetReferenceStatement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IPSet that this statement references.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using
        # the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For
        # (XFF) header, but you can specify any header name. If the specified header isn't present in the
        # request, WAF doesn't apply the rule to the web request at all.

        @[JSON::Field(key: "IPSetForwardedIPConfig")]
        getter ip_set_forwarded_ip_config : Types::IPSetForwardedIPConfig?

        def initialize(
          @arn : String,
          @ip_set_forwarded_ip_config : Types::IPSetForwardedIPConfig? = nil
        )
        end
      end

      # High-level information about an IPSet , returned by operations like create and list. This provides
      # information like the ID, that you can use to retrieve and manage an IPSet , and the ARN, that you
      # provide to the IPSetReferenceStatement to use the address set in a Rule .

      struct IPSetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the IP set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lock_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Used for CAPTCHA and challenge token settings. Determines how long a CAPTCHA or challenge timestamp
      # remains valid after WAF updates it for a successful CAPTCHA or challenge response.

      struct ImmunityTimeProperty
        include JSON::Serializable

        # The amount of time, in seconds, that a CAPTCHA or challenge timestamp is considered valid by WAF.
        # The default setting is 300. For the Challenge action, the minimum setting is 300.

        @[JSON::Field(key: "ImmunityTime")]
        getter immunity_time : Int64

        def initialize(
          @immunity_time : Int64
        )
        end
      end

      # Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against
      # the request's JA3 fingerprint. The JA3 fingerprint is a 32-character hash derived from the TLS
      # Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's
      # TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS
      # Client Hello information for the calculation. Almost all web requests include this information. You
      # can use this choice only with a string match ByteMatchStatement with the PositionalConstraint set to
      # EXACTLY . You can obtain the JA3 fingerprint for client requests from the web ACL logs. If WAF is
      # able to calculate the fingerprint, it includes it in the logs. For information about the logging
      # fields, see Log fields in the WAF Developer Guide . Provide the JA3 fingerprint string from the logs
      # in your string match statement specification, to match with any future requests that have the same
      # TLS configuration.

      struct JA3Fingerprint
        include JSON::Serializable

        # The match status to assign to the web request if the request doesn't have a JA3 fingerprint. You can
        # specify the following fallback behaviors: MATCH - Treat the web request as matching the rule
        # statement. WAF applies the rule action to the request. NO_MATCH - Treat the web request as not
        # matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        def initialize(
          @fallback_behavior : String
        )
        end
      end

      # Available for use with Amazon CloudFront distributions and Application Load Balancers. Match against
      # the request's JA4 fingerprint. The JA4 fingerprint is a 36-character hash derived from the TLS
      # Client Hello of an incoming request. This fingerprint serves as a unique identifier for the client's
      # TLS configuration. WAF calculates and logs this fingerprint for each request that has enough TLS
      # Client Hello information for the calculation. Almost all web requests include this information. You
      # can use this choice only with a string match ByteMatchStatement with the PositionalConstraint set to
      # EXACTLY . You can obtain the JA4 fingerprint for client requests from the web ACL logs. If WAF is
      # able to calculate the fingerprint, it includes it in the logs. For information about the logging
      # fields, see Log fields in the WAF Developer Guide . Provide the JA4 fingerprint string from the logs
      # in your string match statement specification, to match with any future requests that have the same
      # TLS configuration.

      struct JA4Fingerprint
        include JSON::Serializable

        # The match status to assign to the web request if the request doesn't have a JA4 fingerprint. You can
        # specify the following fallback behaviors: MATCH - Treat the web request as matching the rule
        # statement. WAF applies the rule action to the request. NO_MATCH - Treat the web request as not
        # matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        def initialize(
          @fallback_behavior : String
        )
        end
      end

      # Inspect the body of the web request as JSON. The body immediately follows the request headers. This
      # is used to indicate the web request component to inspect, in the FieldToMatch specification. Use the
      # specifications in this object to indicate which parts of the JSON body to inspect using the rule's
      # inspection criteria. WAF inspects only the parts of the JSON that result from the matches that you
      # indicate. Example JSON: "JsonBody": { "MatchPattern": { "All": {} }, "MatchScope": "ALL" } For
      # additional information about this request component option, see JSON body in the WAF Developer Guide
      # .

      struct JsonBody
        include JSON::Serializable

        # The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against
        # the rule inspection criteria.

        @[JSON::Field(key: "MatchPattern")]
        getter match_pattern : Types::JsonMatchPattern

        # The parts of the JSON to match against using the MatchPattern . If you specify ALL , WAF matches
        # against keys and values. All does not require a match to be found in the keys and a match to be
        # found in the values. It requires a match to be found in the keys or the values or both. To require a
        # match in the keys and in the values, use a logical AND statement to combine two match rules, one
        # that inspects the keys and another that inspects the values.

        @[JSON::Field(key: "MatchScope")]
        getter match_scope : String

        # What WAF should do if it fails to completely parse the JSON body. The options are the following:
        # EVALUATE_AS_STRING - Inspect the body as plain text. WAF applies the text transformations and
        # inspection criteria that you defined for the JSON inspection to the body text string. MATCH - Treat
        # the web request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH
        # - Treat the web request as not matching the rule statement. If you don't provide this setting, WAF
        # parses and evaluates the content only up to the first parsing failure that it encounters. WAF
        # parsing doesn't fully validate the input JSON string, so parsing can succeed even for invalid JSON.
        # When parsing succeeds, WAF doesn't apply the fallback behavior. For more information, see JSON body
        # in the WAF Developer Guide .

        @[JSON::Field(key: "InvalidFallbackBehavior")]
        getter invalid_fallback_behavior : String?

        # What WAF should do if the body is larger than WAF can inspect. WAF does not support inspecting the
        # entire contents of the web request body if the body exceeds the limit for the resource type. When a
        # web request body is larger than the limit, the underlying host service only forwards the contents
        # that are within the limit to WAF for inspection. For Application Load Balancer and AppSync, the
        # limit is fixed at 8 KB (8,192 bytes). For CloudFront, API Gateway, Amazon Cognito, App Runner, and
        # Verified Access, the default limit is 16 KB (16,384 bytes), and you can increase the limit for each
        # resource type in the web ACL AssociationConfig , for additional processing fees. For Amplify, use
        # the CloudFront limit. The options for oversize handling are the following: CONTINUE - Inspect the
        # available body contents normally, according to the rule inspection criteria. MATCH - Treat the web
        # request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH - Treat
        # the web request as not matching the rule statement. You can combine the MATCH or NO_MATCH settings
        # for oversize handling with your rule and web ACL action settings, so that you block any request
        # whose body is over the limit. Default: CONTINUE

        @[JSON::Field(key: "OversizeHandling")]
        getter oversize_handling : String?

        def initialize(
          @match_pattern : Types::JsonMatchPattern,
          @match_scope : String,
          @invalid_fallback_behavior : String? = nil,
          @oversize_handling : String? = nil
        )
        end
      end

      # The patterns to look for in the JSON body. WAF inspects the results of these pattern matches against
      # the rule inspection criteria. This is used with the FieldToMatch option JsonBody .

      struct JsonMatchPattern
        include JSON::Serializable

        # Match all of the elements. See also MatchScope in JsonBody . You must specify either this setting or
        # the IncludedPaths setting, but not both.

        @[JSON::Field(key: "All")]
        getter all : Types::All?

        # Match only the specified include paths. See also MatchScope in JsonBody . Provide the include paths
        # using JSON Pointer syntax. For example, "IncludedPaths": ["/dogs/0/name", "/dogs/1/name"] . For
        # information about this syntax, see the Internet Engineering Task Force (IETF) documentation
        # JavaScript Object Notation (JSON) Pointer . You must specify either this setting or the All setting,
        # but not both. Don't use this option to include all paths. Instead, use the All setting.

        @[JSON::Field(key: "IncludedPaths")]
        getter included_paths : Array(String)?

        def initialize(
          @all : Types::All? = nil,
          @included_paths : Array(String)? = nil
        )
        end
      end

      # A single label container. This is used as an element of a label array in multiple contexts, for
      # example, in RuleLabels inside a Rule and in Labels inside a SampledHTTPRequest .

      struct Label
        include JSON::Serializable

        # The label string.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # A rule statement to match against labels that have been added to the web request by rules that have
      # already run in the web ACL. The label match statement provides the label or namespace string to
      # search for. The label string can represent a part or all of the fully qualified label name that had
      # been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label
      # name. The prefix identifies the rule group or web ACL context of the rule that added the label. If
      # you do not provide the fully qualified name in your label match string, WAF performs the search for
      # labels that were added in the same context as the label match statement.

      struct LabelMatchStatement
        include JSON::Serializable

        # The string to match against. The setting you provide for this depends on the match statement's Scope
        # setting: If the Scope indicates LABEL , then this specification must include the name and can
        # include any number of preceding namespace specifications and prefix up to providing the fully
        # qualified label name. If the Scope indicates NAMESPACE , then this specification can include any
        # number of contiguous namespace strings, and can include the entire label namespace prefix from the
        # rule group or web ACL where the label originates. Labels are case sensitive and components of a
        # label must be separated by colon, for example NS1:NS2:name .

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specify whether you want to match using the label name or just the namespace.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        def initialize(
          @key : String,
          @scope : String
        )
        end
      end

      # A single label name condition for a Condition in a logging filter.

      struct LabelNameCondition
        include JSON::Serializable

        # The label name that a log record must contain in order to meet the condition. This must be a fully
        # qualified label name. Fully qualified labels have a prefix, optional namespaces, and label name. The
        # prefix identifies the rule group or web ACL context of the rule that added the label.

        @[JSON::Field(key: "LabelName")]
        getter label_name : String

        def initialize(
          @label_name : String
        )
        end
      end

      # List of labels used by one or more of the rules of a RuleGroup . This summary object is used for the
      # following rule group lists: AvailableLabels - Labels that rules add to matching requests. These
      # labels are defined in the RuleLabels for a Rule . ConsumedLabels - Labels that rules match against.
      # These labels are defined in a LabelMatchStatement specification, in the Statement definition of a
      # rule.

      struct LabelSummary
        include JSON::Serializable

        # An individual label specification.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct ListAPIKeysRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListAPIKeysResponse
        include JSON::Serializable

        # The array of key summaries. If you specified a Limit in your request, this might not be the full
        # list.

        @[JSON::Field(key: "APIKeySummaries")]
        getter api_key_summaries : Array(Types::APIKeySummary)?

        # The CAPTCHA application integration URL, for use in your JavaScript implementation.

        @[JSON::Field(key: "ApplicationIntegrationURL")]
        getter application_integration_url : String?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @api_key_summaries : Array(Types::APIKeySummary)? = nil,
          @application_integration_url : String? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListAvailableManagedRuleGroupVersionsRequest
        include JSON::Serializable

        # The name of the managed rule group. You use this, along with the vendor name, to identify the rule
        # group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @name : String,
          @scope : String,
          @vendor_name : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListAvailableManagedRuleGroupVersionsResponse
        include JSON::Serializable

        # The name of the version that's currently set as the default.

        @[JSON::Field(key: "CurrentDefaultVersion")]
        getter current_default_version : String?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The versions that are currently available for the specified managed rule group. If you specified a
        # Limit in your request, this might not be the full list.

        @[JSON::Field(key: "Versions")]
        getter versions : Array(Types::ManagedRuleGroupVersion)?

        def initialize(
          @current_default_version : String? = nil,
          @next_marker : String? = nil,
          @versions : Array(Types::ManagedRuleGroupVersion)? = nil
        )
        end
      end


      struct ListAvailableManagedRuleGroupsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListAvailableManagedRuleGroupsResponse
        include JSON::Serializable

        # Array of managed rule groups that you can use. If you specified a Limit in your request, this might
        # not be the full list.

        @[JSON::Field(key: "ManagedRuleGroups")]
        getter managed_rule_groups : Array(Types::ManagedRuleGroupSummary)?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @managed_rule_groups : Array(Types::ManagedRuleGroupSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListIPSetsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListIPSetsResponse
        include JSON::Serializable

        # Array of IPSets. If you specified a Limit in your request, this might not be the full list.

        @[JSON::Field(key: "IPSets")]
        getter ip_sets : Array(Types::IPSetSummary)?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @ip_sets : Array(Types::IPSetSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListLoggingConfigurationsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The owner of the logging configuration, which must be set to CUSTOMER for the configurations that
        # you manage. The log scope SECURITY_LAKE indicates a configuration that is managed through Amazon
        # Security Lake. You can use Security Lake to collect log and event data from various sources for
        # normalization, analysis, and management. For information, see Collecting data from Amazon Web
        # Services services in the Amazon Security Lake user guide . The log scope
        # CLOUDWATCH_TELEMETRY_RULE_MANAGED indicates a configuration that is managed through Amazon
        # CloudWatch Logs for telemetry data collection and analysis. For information, see What is Amazon
        # CloudWatch Logs ? in the Amazon CloudWatch Logs user guide . Default: CUSTOMER

        @[JSON::Field(key: "LogScope")]
        getter log_scope : String?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @log_scope : String? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListLoggingConfigurationsResponse
        include JSON::Serializable

        # Array of logging configurations. If you specified a Limit in your request, this might not be the
        # full list.

        @[JSON::Field(key: "LoggingConfigurations")]
        getter logging_configurations : Array(Types::LoggingConfiguration)?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @logging_configurations : Array(Types::LoggingConfiguration)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListManagedRuleSetsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListManagedRuleSetsResponse
        include JSON::Serializable

        # Your managed rule sets. If you specified a Limit in your request, this might not be the full list.

        @[JSON::Field(key: "ManagedRuleSets")]
        getter managed_rule_sets : Array(Types::ManagedRuleSetSummary)?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @managed_rule_sets : Array(Types::ManagedRuleSetSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListMobileSdkReleasesRequest
        include JSON::Serializable

        # The device platform to retrieve the list for.

        @[JSON::Field(key: "Platform")]
        getter platform : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @platform : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListMobileSdkReleasesResponse
        include JSON::Serializable

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The high level information for the available SDK releases. If you specified a Limit in your request,
        # this might not be the full list.

        @[JSON::Field(key: "ReleaseSummaries")]
        getter release_summaries : Array(Types::ReleaseSummary)?

        def initialize(
          @next_marker : String? = nil,
          @release_summaries : Array(Types::ReleaseSummary)? = nil
        )
        end
      end


      struct ListRegexPatternSetsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRegexPatternSetsResponse
        include JSON::Serializable

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Array of regex pattern sets. If you specified a Limit in your request, this might not be the full
        # list.

        @[JSON::Field(key: "RegexPatternSets")]
        getter regex_pattern_sets : Array(Types::RegexPatternSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @regex_pattern_sets : Array(Types::RegexPatternSetSummary)? = nil
        )
        end
      end


      struct ListResourcesForWebACLRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String

        # Retrieves the web ACLs that are used by the specified resource type. For Amazon CloudFront, don't
        # use this call. Instead, use the CloudFront call ListDistributionsByWebACLId . For information, see
        # ListDistributionsByWebACLId in the Amazon CloudFront API Reference . If you don't provide a resource
        # type, the call uses the resource type APPLICATION_LOAD_BALANCER . Default: APPLICATION_LOAD_BALANCER

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @web_acl_arn : String,
          @resource_type : String? = nil
        )
        end
      end


      struct ListResourcesForWebACLResponse
        include JSON::Serializable

        # The array of Amazon Resource Names (ARNs) of the associated resources.

        @[JSON::Field(key: "ResourceArns")]
        getter resource_arns : Array(String)?

        def initialize(
          @resource_arns : Array(String)? = nil
        )
        end
      end


      struct ListRuleGroupsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRuleGroupsResponse
        include JSON::Serializable

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Array of rule groups. If you specified a Limit in your request, this might not be the full list.

        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::RuleGroupSummary)?

        def initialize(
          @next_marker : String? = nil,
          @rule_groups : Array(Types::RuleGroupSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @resource_arn : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The collection of tagging definitions for the resource. If you specified a Limit in your request,
        # this might not be the full list.

        @[JSON::Field(key: "TagInfoForResource")]
        getter tag_info_for_resource : Types::TagInfoForResource?

        def initialize(
          @next_marker : String? = nil,
          @tag_info_for_resource : Types::TagInfoForResource? = nil
        )
        end
      end


      struct ListWebACLsRequest
        include JSON::Serializable

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The maximum number of objects that you want WAF to return for this request. If more objects are
        # available, in the response, WAF provides a NextMarker value that you can use in a subsequent call to
        # get the next batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @scope : String,
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListWebACLsResponse
        include JSON::Serializable

        # When you request a list of objects with a Limit setting, if the number of objects that are still
        # available for retrieval exceeds the limit, WAF returns a NextMarker value in the response. To
        # retrieve the next batch of objects, provide the marker from the prior call in your next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # Array of web ACLs. If you specified a Limit in your request, this might not be the full list.

        @[JSON::Field(key: "WebACLs")]
        getter web_ac_ls : Array(Types::WebACLSummary)?

        def initialize(
          @next_marker : String? = nil,
          @web_ac_ls : Array(Types::WebACLSummary)? = nil
        )
        end
      end

      # Defines an association between logging destinations and a web ACL resource, for logging from WAF. As
      # part of the association, you can specify parts of the standard logging fields to keep out of the
      # logs and you can specify filters so that you log only a subset of the logging records. If you
      # configure data protection for the web ACL, the protection applies to the data that WAF sends to the
      # logs. You can define one logging destination per web ACL. You can access information about the
      # traffic that WAF inspects using the following steps: Create your logging destination. You can use an
      # Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon
      # Kinesis Data Firehose. The name that you give the destination must start with aws-waf-logs- .
      # Depending on the type of destination, you might need to configure additional settings or
      # permissions. For configuration requirements and pricing information for each destination type, see
      # Logging web ACL traffic in the WAF Developer Guide . Associate your logging destination to your web
      # ACL using a PutLoggingConfiguration request. When you successfully enable logging using a
      # PutLoggingConfiguration request, WAF creates an additional role or policy that is required to write
      # logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource
      # policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis
      # Data Firehose, WAF creates a service-linked role. For additional information about web ACL logging,
      # see Logging web ACL traffic information in the WAF Developer Guide .

      struct LoggingConfiguration
        include JSON::Serializable

        # The logging destination configuration that you want to associate with the web ACL. You can associate
        # one logging destination to a web ACL.

        @[JSON::Field(key: "LogDestinationConfigs")]
        getter log_destination_configs : Array(String)

        # The Amazon Resource Name (ARN) of the web ACL that you want to associate with LogDestinationConfigs
        # .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The owner of the logging configuration, which must be set to CUSTOMER for the configurations that
        # you manage. The log scope SECURITY_LAKE indicates a configuration that is managed through Amazon
        # Security Lake. You can use Security Lake to collect log and event data from various sources for
        # normalization, analysis, and management. For information, see Collecting data from Amazon Web
        # Services services in the Amazon Security Lake user guide . The log scope
        # CLOUDWATCH_TELEMETRY_RULE_MANAGED indicates a configuration that is managed through Amazon
        # CloudWatch Logs for telemetry data collection and analysis. For information, see What is Amazon
        # CloudWatch Logs ? in the Amazon CloudWatch Logs user guide . Default: CUSTOMER

        @[JSON::Field(key: "LogScope")]
        getter log_scope : String?

        # Used to distinguish between various logging options. Currently, there is one option. Default:
        # WAF_LOGS

        @[JSON::Field(key: "LogType")]
        getter log_type : String?

        # Filtering that specifies which web requests are kept in the logs and which are dropped. You can
        # filter on the rule action and on the web request labels that were applied by matching rules during
        # web ACL evaluation.

        @[JSON::Field(key: "LoggingFilter")]
        getter logging_filter : Types::LoggingFilter?

        # Indicates whether the logging configuration was created by Firewall Manager, as part of an WAF
        # policy configuration. If true, only Firewall Manager can modify or delete the configuration. The
        # logging configuration can be created by Firewall Manager for use with any web ACL that Firewall
        # Manager is using for an WAF policy. Web ACLs that Firewall Manager creates and uses have their
        # ManagedByFirewallManager property set to true. Web ACLs that were created by a customer account and
        # then retrofitted by Firewall Manager for use by a policy have their RetrofittedByFirewallManager
        # property set to true. For either case, any corresponding logging configuration will indicate
        # ManagedByFirewallManager .

        @[JSON::Field(key: "ManagedByFirewallManager")]
        getter managed_by_firewall_manager : Bool?

        # The parts of the request that you want to keep out of the logs. For example, if you redact the
        # SingleHeader field, the HEADER field in the logs will be REDACTED for all rules that use the
        # SingleHeader FieldToMatch setting. If you configure data protection for the web ACL, the protection
        # applies to the data that WAF sends to the logs. Redaction applies only to the component that's
        # specified in the rule's FieldToMatch setting, so the SingleHeader redaction doesn't apply to rules
        # that use the Headers FieldToMatch . You can specify only the following fields for redaction: UriPath
        # , QueryString , SingleHeader , and Method . This setting has no impact on request sampling. You can
        # only exclude fields from request sampling by disabling sampling in the web ACL visibility
        # configuration or by configuring data protection for the web ACL.

        @[JSON::Field(key: "RedactedFields")]
        getter redacted_fields : Array(Types::FieldToMatch)?

        def initialize(
          @log_destination_configs : Array(String),
          @resource_arn : String,
          @log_scope : String? = nil,
          @log_type : String? = nil,
          @logging_filter : Types::LoggingFilter? = nil,
          @managed_by_firewall_manager : Bool? = nil,
          @redacted_fields : Array(Types::FieldToMatch)? = nil
        )
        end
      end

      # Filtering that specifies which web requests are kept in the logs and which are dropped, defined for
      # a web ACL's LoggingConfiguration . You can filter on the rule action and on the web request labels
      # that were applied by matching rules during web ACL evaluation.

      struct LoggingFilter
        include JSON::Serializable

        # Default handling for logs that don't match any of the specified filtering conditions.

        @[JSON::Field(key: "DefaultBehavior")]
        getter default_behavior : String

        # The filters that you want to apply to the logs.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)

        def initialize(
          @default_behavior : String,
          @filters : Array(Types::Filter)
        )
        end
      end

      # The properties of a managed product, such as an Amazon Web Services Managed Rules rule group or an
      # Amazon Web Services Marketplace managed rule group.

      struct ManagedProductDescriptor
        include JSON::Serializable

        # Indicates whether the rule group provides an advanced set of protections, such as the the Amazon Web
        # Services Managed Rules rule groups that are used for WAF intelligent threat mitigation.

        @[JSON::Field(key: "IsAdvancedManagedRuleSet")]
        getter is_advanced_managed_rule_set : Bool?

        # Indicates whether the rule group is versioned.

        @[JSON::Field(key: "IsVersioningSupported")]
        getter is_versioning_supported : Bool?

        # The name of the managed rule group. For example, AWSManagedRulesAnonymousIpList or
        # AWSManagedRulesATPRuleSet .

        @[JSON::Field(key: "ManagedRuleSetName")]
        getter managed_rule_set_name : String?

        # A short description of the managed rule group.

        @[JSON::Field(key: "ProductDescription")]
        getter product_description : String?

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "ProductId")]
        getter product_id : String?

        # For Amazon Web Services Marketplace managed rule groups only, the link to the rule group product
        # page.

        @[JSON::Field(key: "ProductLink")]
        getter product_link : String?

        # The display name for the managed rule group. For example, Anonymous IP list or Account takeover
        # prevention .

        @[JSON::Field(key: "ProductTitle")]
        getter product_title : String?

        # The Amazon resource name (ARN) of the Amazon Simple Notification Service SNS topic that's used to
        # provide notification of changes to the managed rule group. You can subscribe to the SNS topic to
        # receive notifications when the managed rule group is modified, such as for new versions and for
        # version expiration. For more information, see the Amazon Simple Notification Service Developer Guide
        # .

        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        def initialize(
          @is_advanced_managed_rule_set : Bool? = nil,
          @is_versioning_supported : Bool? = nil,
          @managed_rule_set_name : String? = nil,
          @product_description : String? = nil,
          @product_id : String? = nil,
          @product_link : String? = nil,
          @product_title : String? = nil,
          @sns_topic_arn : String? = nil,
          @vendor_name : String? = nil
        )
        end
      end

      # Additional information that's used by a managed rule group. Many managed rule groups don't require
      # this. The rule groups used for intelligent threat mitigation require additional configuration: Use
      # the AWSManagedRulesACFPRuleSet configuration object to configure the account creation fraud
      # prevention managed rule group. The configuration includes the registration and sign-up pages of your
      # application and the locations in the account creation request payload of data, such as the user
      # email and phone number fields. Use the AWSManagedRulesAntiDDoSRuleSet configuration object to
      # configure the anti-DDoS managed rule group. The configuration includes the sensitivity levels to use
      # in the rules that typically block and challenge requests that might be participating in DDoS attacks
      # and the specification to use to indicate whether a request can handle a silent browser challenge.
      # Use the AWSManagedRulesATPRuleSet configuration object to configure the account takeover prevention
      # managed rule group. The configuration includes the sign-in page of your application and the
      # locations in the login request payload of data such as the username and password. Use the
      # AWSManagedRulesBotControlRuleSet configuration object to configure the protection level that you
      # want the Bot Control rule group to use. For example specifications, see the examples section of
      # CreateWebACL .

      struct ManagedRuleGroupConfig
        include JSON::Serializable

        # Additional configuration for using the account creation fraud prevention (ACFP) managed rule group,
        # AWSManagedRulesACFPRuleSet . Use this to provide account creation request information to the rule
        # group. For web ACLs that protect CloudFront distributions, use this to also provide the information
        # about how your distribution responds to account creation requests. For information about using the
        # ACFP managed rule group, see WAF Fraud Control account creation fraud prevention (ACFP) rule group
        # and WAF Fraud Control account creation fraud prevention (ACFP) in the WAF Developer Guide .

        @[JSON::Field(key: "AWSManagedRulesACFPRuleSet")]
        getter aws_managed_rules_acfp_rule_set : Types::AWSManagedRulesACFPRuleSet?

        # Additional configuration for using the account takeover prevention (ATP) managed rule group,
        # AWSManagedRulesATPRuleSet . Use this to provide login request information to the rule group. For web
        # ACLs that protect CloudFront distributions, use this to also provide the information about how your
        # distribution responds to login requests. This configuration replaces the individual configuration
        # fields in ManagedRuleGroupConfig and provides additional feature configuration. For information
        # about using the ATP managed rule group, see WAF Fraud Control account takeover prevention (ATP) rule
        # group and WAF Fraud Control account takeover prevention (ATP) in the WAF Developer Guide .

        @[JSON::Field(key: "AWSManagedRulesATPRuleSet")]
        getter aws_managed_rules_atp_rule_set : Types::AWSManagedRulesATPRuleSet?

        # Additional configuration for using the anti-DDoS managed rule group, AWSManagedRulesAntiDDoSRuleSet
        # . Use this to configure anti-DDoS behavior for the rule group. For information about using the
        # anti-DDoS managed rule group, see WAF Anti-DDoS rule group and Distributed Denial of Service (DDoS)
        # prevention in the WAF Developer Guide .

        @[JSON::Field(key: "AWSManagedRulesAntiDDoSRuleSet")]
        getter aws_managed_rules_anti_d_do_s_rule_set : Types::AWSManagedRulesAntiDDoSRuleSet?

        # Additional configuration for using the Bot Control managed rule group. Use this to specify the
        # inspection level that you want to use. For information about using the Bot Control managed rule
        # group, see WAF Bot Control rule group and WAF Bot Control in the WAF Developer Guide .

        @[JSON::Field(key: "AWSManagedRulesBotControlRuleSet")]
        getter aws_managed_rules_bot_control_rule_set : Types::AWSManagedRulesBotControlRuleSet?

        # Instead of this setting, provide your configuration under AWSManagedRulesATPRuleSet .

        @[JSON::Field(key: "LoginPath")]
        getter login_path : String?

        # Instead of this setting, provide your configuration under the request inspection configuration for
        # AWSManagedRulesATPRuleSet or AWSManagedRulesACFPRuleSet .

        @[JSON::Field(key: "PasswordField")]
        getter password_field : Types::PasswordField?

        # Instead of this setting, provide your configuration under the request inspection configuration for
        # AWSManagedRulesATPRuleSet or AWSManagedRulesACFPRuleSet .

        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String?

        # Instead of this setting, provide your configuration under the request inspection configuration for
        # AWSManagedRulesATPRuleSet or AWSManagedRulesACFPRuleSet .

        @[JSON::Field(key: "UsernameField")]
        getter username_field : Types::UsernameField?

        def initialize(
          @aws_managed_rules_acfp_rule_set : Types::AWSManagedRulesACFPRuleSet? = nil,
          @aws_managed_rules_atp_rule_set : Types::AWSManagedRulesATPRuleSet? = nil,
          @aws_managed_rules_anti_d_do_s_rule_set : Types::AWSManagedRulesAntiDDoSRuleSet? = nil,
          @aws_managed_rules_bot_control_rule_set : Types::AWSManagedRulesBotControlRuleSet? = nil,
          @login_path : String? = nil,
          @password_field : Types::PasswordField? = nil,
          @payload_type : String? = nil,
          @username_field : Types::UsernameField? = nil
        )
        end
      end

      # A rule statement used to run the rules that are defined in a managed rule group. To use this,
      # provide the vendor name and the name of the rule group in this statement. You can retrieve the
      # required names by calling ListAvailableManagedRuleGroups . You cannot nest a
      # ManagedRuleGroupStatement , for example for use inside a NotStatement or OrStatement . You cannot
      # use a managed rule group inside another rule group. You can only reference a managed rule group as a
      # top-level statement within a rule that you define in a web ACL. You are charged additional fees when
      # you use the WAF Bot Control managed rule group AWSManagedRulesBotControlRuleSet , the WAF Fraud
      # Control account takeover prevention (ATP) managed rule group AWSManagedRulesATPRuleSet , or the WAF
      # Fraud Control account creation fraud prevention (ACFP) managed rule group AWSManagedRulesACFPRuleSet
      # . For more information, see WAF Pricing .

      struct ManagedRuleGroupStatement
        include JSON::Serializable

        # The name of the managed rule group. You use this, along with the vendor name, to identify the rule
        # group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String

        # Rules in the referenced rule group whose actions are set to Count . Instead of this option, use
        # RuleActionOverrides . It accepts any valid action setting, including Count .

        @[JSON::Field(key: "ExcludedRules")]
        getter excluded_rules : Array(Types::ExcludedRule)?

        # Additional information that's used by a managed rule group. Many managed rule groups don't require
        # this. The rule groups used for intelligent threat mitigation require additional configuration: Use
        # the AWSManagedRulesACFPRuleSet configuration object to configure the account creation fraud
        # prevention managed rule group. The configuration includes the registration and sign-up pages of your
        # application and the locations in the account creation request payload of data, such as the user
        # email and phone number fields. Use the AWSManagedRulesAntiDDoSRuleSet configuration object to
        # configure the anti-DDoS managed rule group. The configuration includes the sensitivity levels to use
        # in the rules that typically block and challenge requests that might be participating in DDoS attacks
        # and the specification to use to indicate whether a request can handle a silent browser challenge.
        # Use the AWSManagedRulesATPRuleSet configuration object to configure the account takeover prevention
        # managed rule group. The configuration includes the sign-in page of your application and the
        # locations in the login request payload of data such as the username and password. Use the
        # AWSManagedRulesBotControlRuleSet configuration object to configure the protection level that you
        # want the Bot Control rule group to use.

        @[JSON::Field(key: "ManagedRuleGroupConfigs")]
        getter managed_rule_group_configs : Array(Types::ManagedRuleGroupConfig)?

        # Action settings to use in the place of the rule actions that are configured inside the rule group.
        # You specify one override for each rule whose action you want to change. Verify the rule names in
        # your overrides carefully. With managed rule groups, WAF silently ignores any override that uses an
        # invalid rule name. With customer-owned rule groups, invalid rule names in your overrides will cause
        # web ACL updates to fail. An invalid rule name is any name that doesn't exactly match the
        # case-sensitive name of an existing rule in the rule group. You can use overrides for testing, for
        # example you can override all of rule actions to Count and then monitor the resulting count metrics
        # to understand how the rule group would handle your web traffic. You can also permanently override
        # some or all actions, to modify how the rule group manages your web traffic.

        @[JSON::Field(key: "RuleActionOverrides")]
        getter rule_action_overrides : Array(Types::RuleActionOverride)?

        # An optional nested statement that narrows the scope of the web requests that are evaluated by the
        # managed rule group. Requests are only evaluated by the rule group if they match the scope-down
        # statement. You can use any nestable Statement in the scope-down statement, and you can nest
        # statements at any level, the same as you can for a rule statement.

        @[JSON::Field(key: "ScopeDownStatement")]
        getter scope_down_statement : Types::Statement?

        # The version of the managed rule group to use. If you specify this, the version setting is fixed
        # until you change it. If you don't specify this, WAF uses the vendor's default version, and then
        # keeps the version at the vendor's default when the vendor updates the managed rule group settings.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String,
          @vendor_name : String,
          @excluded_rules : Array(Types::ExcludedRule)? = nil,
          @managed_rule_group_configs : Array(Types::ManagedRuleGroupConfig)? = nil,
          @rule_action_overrides : Array(Types::RuleActionOverride)? = nil,
          @scope_down_statement : Types::Statement? = nil,
          @version : String? = nil
        )
        end
      end

      # High-level information about a managed rule group, returned by ListAvailableManagedRuleGroups . This
      # provides information like the name and vendor name, that you provide when you add a
      # ManagedRuleGroupStatement to a web ACL. Managed rule groups include Amazon Web Services Managed
      # Rules rule groups and Amazon Web Services Marketplace managed rule groups. To use any Amazon Web
      # Services Marketplace managed rule group, first subscribe to the rule group through Amazon Web
      # Services Marketplace.

      struct ManagedRuleGroupSummary
        include JSON::Serializable

        # The description of the managed rule group, provided by Amazon Web Services Managed Rules or the
        # Amazon Web Services Marketplace seller who manages it.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the managed rule group. You use this, along with the vendor name, to identify the rule
        # group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name of the managed rule group vendor. You use this, along with the rule group name, to identify
        # a rule group.

        @[JSON::Field(key: "VendorName")]
        getter vendor_name : String?

        # Indicates whether the managed rule group is versioned. If it is, you can retrieve the versions list
        # by calling ListAvailableManagedRuleGroupVersions .

        @[JSON::Field(key: "VersioningSupported")]
        getter versioning_supported : Bool?

        def initialize(
          @description : String? = nil,
          @name : String? = nil,
          @vendor_name : String? = nil,
          @versioning_supported : Bool? = nil
        )
        end
      end

      # Describes a single version of a managed rule group.

      struct ManagedRuleGroupVersion
        include JSON::Serializable

        # The date and time that the managed rule group owner updated the rule group version information.

        @[JSON::Field(key: "LastUpdateTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # The version name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @last_update_timestamp : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A set of rules that is managed by Amazon Web Services and Amazon Web Services Marketplace sellers to
      # provide versioned managed rule groups for customers of WAF. This is intended for use only by vendors
      # of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
      # Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned
      # managed rule group offerings for your customers. The APIs are ListManagedRuleSets ,
      # GetManagedRuleSet , PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      struct ManagedRuleSet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # A unique identifier for the managed rule set. The ID is returned in the responses to commands like
        # list . You provide it to operations like get and update .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the managed rule set. You use this, along with the rule set ID, to identify the rule
        # set. This name is assigned to the corresponding managed rule group, which your customers can access
        # and use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The label namespace prefix for the managed rule groups that are offered to customers from this
        # managed rule set. All labels that are added by rules in the managed rule group have this prefix. The
        # syntax for the label namespace prefix for a managed rule group is the following:
        # awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt; : When a rule with a label matches a web
        # request, WAF adds the fully qualified label to the request. A fully qualified label is made up of
        # the label namespace from the rule group or web ACL where the rule is defined and the label from the
        # rule, separated by a colon: &lt;label namespace&gt;:&lt;label from rule&gt;

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : String?

        # The versions of this managed rule set that are available for use by customers.

        @[JSON::Field(key: "PublishedVersions")]
        getter published_versions : Hash(String, Types::ManagedRuleSetVersion)?

        # The version that you would like your customers to use.

        @[JSON::Field(key: "RecommendedVersion")]
        getter recommended_version : String?

        def initialize(
          @arn : String,
          @id : String,
          @name : String,
          @description : String? = nil,
          @label_namespace : String? = nil,
          @published_versions : Hash(String, Types::ManagedRuleSetVersion)? = nil,
          @recommended_version : String? = nil
        )
        end
      end

      # High-level information for a managed rule set. This is intended for use only by vendors of managed
      # rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. Vendors, you
      # can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group
      # offerings for your customers. The APIs are ListManagedRuleSets , GetManagedRuleSet ,
      # PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      struct ManagedRuleSetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the managed rule set. The ID is returned in the responses to commands like
        # list . You provide it to operations like get and update .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The label namespace prefix for the managed rule groups that are offered to customers from this
        # managed rule set. All labels that are added by rules in the managed rule group have this prefix. The
        # syntax for the label namespace prefix for a managed rule group is the following:
        # awswaf:managed:&lt;vendor&gt;:&lt;rule group name&gt; : When a rule with a label matches a web
        # request, WAF adds the fully qualified label to the request. A fully qualified label is made up of
        # the label namespace from the rule group or web ACL where the rule is defined and the label from the
        # rule, separated by a colon: &lt;label namespace&gt;:&lt;label from rule&gt;

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The name of the managed rule set. You use this, along with the rule set ID, to identify the rule
        # set. This name is assigned to the corresponding managed rule group, which your customers can access
        # and use.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @label_namespace : String? = nil,
          @lock_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Information for a single version of a managed rule set. This is intended for use only by vendors of
      # managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers.
      # Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned
      # managed rule group offerings for your customers. The APIs are ListManagedRuleSets ,
      # GetManagedRuleSet , PutManagedRuleSetVersions , and UpdateManagedRuleSetVersionExpiryDate .

      struct ManagedRuleSetVersion
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vendor rule group that's used to define the published version
        # of your managed rule group.

        @[JSON::Field(key: "AssociatedRuleGroupArn")]
        getter associated_rule_group_arn : String?

        # The web ACL capacity units (WCUs) required for this rule group. WAF uses WCUs to calculate and
        # control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF
        # calculates capacity differently for each rule type, to reflect the relative cost of each rule.
        # Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing
        # power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when
        # they use a rule group. For more information, see WAF web ACL capacity units (WCU) in the WAF
        # Developer Guide .

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64?

        # The time that this version is set to expire. Times are in Coordinated Universal Time (UTC) format.
        # UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".

        @[JSON::Field(key: "ExpiryTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry_timestamp : Time?

        # The amount of time you expect this version of your managed rule group to last, in days.

        @[JSON::Field(key: "ForecastedLifetime")]
        getter forecasted_lifetime : Int32?

        # The last time that you updated this version. Times are in Coordinated Universal Time (UTC) format.
        # UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".

        @[JSON::Field(key: "LastUpdateTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # The time that you first published this version. Times are in Coordinated Universal Time (UTC)
        # format. UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".

        @[JSON::Field(key: "PublishTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter publish_timestamp : Time?

        def initialize(
          @associated_rule_group_arn : String? = nil,
          @capacity : Int64? = nil,
          @expiry_timestamp : Time? = nil,
          @forecasted_lifetime : Int32? = nil,
          @last_update_timestamp : Time? = nil,
          @publish_timestamp : Time? = nil
        )
        end
      end

      # Inspect the HTTP method of the web request. The method indicates the type of operation that the
      # request is asking the origin to perform. This is used in the FieldToMatch specification for some web
      # request component types. JSON specification: "Method": {}

      struct Method
        include JSON::Serializable

        def initialize
        end
      end

      # Information for a release of the mobile SDK, including release notes and tags. The mobile SDK is not
      # generally available. Customers who have access to the mobile SDK can use it to establish and manage
      # WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see WAF
      # client application integration in the WAF Developer Guide .

      struct MobileSdkRelease
        include JSON::Serializable

        # Notes describing the release.

        @[JSON::Field(key: "ReleaseNotes")]
        getter release_notes : String?

        # The release version.

        @[JSON::Field(key: "ReleaseVersion")]
        getter release_version : String?

        # Tags that are associated with the release.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The timestamp of the release.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @release_notes : String? = nil,
          @release_version : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Specifies that WAF should do nothing. This is used for the OverrideAction setting on a Rule when the
      # rule uses a rule group reference statement. This is used in the context of other settings, for
      # example to specify values for RuleAction and web ACL DefaultAction . JSON specification: "None": {}

      struct NoneAction
        include JSON::Serializable

        def initialize
        end
      end

      # A logical rule statement used to negate the results of another rule statement. You provide one
      # Statement within the NotStatement .

      struct NotStatement
        include JSON::Serializable

        # The statement to negate. You can use any statement that can be nested.

        @[JSON::Field(key: "Statement")]
        getter statement : Types::Statement

        def initialize(
          @statement : Types::Statement
        )
        end
      end

      # Configures the level of DDoS protection that applies to web ACLs associated with Application Load
      # Balancers.

      struct OnSourceDDoSProtectionConfig
        include JSON::Serializable

        # The level of DDoS protection that applies to web ACLs associated with Application Load Balancers.
        # ACTIVE_UNDER_DDOS protection is enabled by default whenever a web ACL is associated with an
        # Application Load Balancer. In the event that an Application Load Balancer experiences high-load
        # conditions or suspected DDoS attacks, the ACTIVE_UNDER_DDOS protection automatically rate limits
        # traffic from known low reputation sources without disrupting Application Load Balancer availability.
        # ALWAYS_ON protection provides constant, always-on monitoring of known low reputation sources for
        # suspected DDoS attacks. While this provides a higher level of protection, there may be potential
        # impacts on legitimate traffic.

        @[JSON::Field(key: "ALBLowReputationMode")]
        getter alb_low_reputation_mode : String

        def initialize(
          @alb_low_reputation_mode : String
        )
        end
      end

      # A logical rule statement used to combine other rule statements with OR logic. You provide more than
      # one Statement within the OrStatement .

      struct OrStatement
        include JSON::Serializable

        # The statements to combine with OR logic. You can use any statements that can be nested.

        @[JSON::Field(key: "Statements")]
        getter statements : Array(Types::Statement)

        def initialize(
          @statements : Array(Types::Statement)
        )
        end
      end

      # The action to use in the place of the action that results from the rule group evaluation. Set the
      # override action to none to leave the result of the rule group alone. Set it to count to override the
      # result to count only. You can only use this for rule statements that reference a rule group, like
      # RuleGroupReferenceStatement and ManagedRuleGroupStatement . This option is usually set to none. It
      # does not affect how the rules in the rule group are evaluated. If you want the rules in the rule
      # group to only count matches, do not use this and instead use the rule action override option, with
      # Count action, in your rule group reference statement settings.

      struct OverrideAction
        include JSON::Serializable

        # Override the rule group evaluation result to count only. This option is usually set to none. It does
        # not affect how the rules in the rule group are evaluated. If you want the rules in the rule group to
        # only count matches, do not use this and instead use the rule action override option, with Count
        # action, in your rule group reference statement settings.

        @[JSON::Field(key: "Count")]
        getter count : Types::CountAction?

        # Don't override the rule group evaluation result. This is the most common setting.

        @[JSON::Field(key: "None")]
        getter none : Types::NoneAction?

        def initialize(
          @count : Types::CountAction? = nil,
          @none : Types::NoneAction? = nil
        )
        end
      end

      # The name of the field in the request payload that contains your customer's password. This data type
      # is used in the RequestInspection and RequestInspectionACFP data types.

      struct PasswordField
        include JSON::Serializable

        # The name of the password field. How you specify this depends on the request inspection payload type.
        # For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON
        # Pointer syntax, see the Internet Engineering Task Force (IETF) documentation JavaScript Object
        # Notation (JSON) Pointer . For example, for the JSON payload { "form": { "password": "THE_PASSWORD" }
        # } , the password field specification is /form/password . For form encoded payload types, use the
        # HTML form names. For example, for an HTML form with the input element named password1 , the password
        # field specification is password1 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # The name of a field in the request payload that contains part or all of your customer's primary
      # phone number. This data type is used in the RequestInspectionACFP data type.

      struct PhoneNumberField
        include JSON::Serializable

        # The name of a single primary phone number field. How you specify the phone number fields depends on
        # the request inspection payload type. For JSON payloads, specify the field identifiers in JSON
        # pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering Task
        # Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the JSON
        # payload { "form": { "primaryphoneline1": "THE_PHONE1", "primaryphoneline2": "THE_PHONE2",
        # "primaryphoneline3": "THE_PHONE3" } } , the phone number field identifiers are
        # /form/primaryphoneline1 , /form/primaryphoneline2 , and /form/primaryphoneline3 . For form encoded
        # payload types, use the HTML form names. For example, for an HTML form with input elements named
        # primaryphoneline1 , primaryphoneline2 , and primaryphoneline3 , the phone number field identifiers
        # are primaryphoneline1 , primaryphoneline2 , and primaryphoneline3 .

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct PutLoggingConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration

        def initialize(
          @logging_configuration : Types::LoggingConfiguration
        )
        end
      end


      struct PutLoggingConfigurationResponse
        include JSON::Serializable


        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end


      struct PutManagedRuleSetVersionsRequest
        include JSON::Serializable

        # A unique identifier for the managed rule set. The ID is returned in the responses to commands like
        # list . You provide it to operations like get and update .

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the managed rule set. You use this, along with the rule set ID, to identify the rule
        # set. This name is assigned to the corresponding managed rule group, which your customers can access
        # and use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The version of the named managed rule group that you'd like your customers to choose, from among
        # your version offerings.

        @[JSON::Field(key: "RecommendedVersion")]
        getter recommended_version : String?

        # The versions of the named managed rule group that you want to offer to your customers.

        @[JSON::Field(key: "VersionsToPublish")]
        getter versions_to_publish : Hash(String, Types::VersionToPublish)?

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String,
          @recommended_version : String? = nil,
          @versions_to_publish : Hash(String, Types::VersionToPublish)? = nil
        )
        end
      end


      struct PutManagedRuleSetVersionsResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @next_lock_token : String? = nil
        )
        end
      end


      struct PutPermissionPolicyRequest
        include JSON::Serializable

        # The policy to attach to the specified rule group. The policy specifications must conform to the
        # following: The policy must be composed using IAM Policy version 2012-10-17. The policy must include
        # specifications for Effect , Action , and Principal . Effect must specify Allow . Action must specify
        # wafv2:CreateWebACL , wafv2:UpdateWebACL , and wafv2:PutFirewallManagerRuleGroups and may optionally
        # specify wafv2:GetRuleGroup . WAF rejects any extra actions or wildcard actions in the policy. The
        # policy must not include a Resource parameter. For more information, see IAM Policies .

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the RuleGroup to which you want to attach the policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end


      struct PutPermissionPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Inspect the query string of the web request. This is the part of a URL that appears after a ?
      # character, if any. This is used in the FieldToMatch specification for some web request component
      # types. JSON specification: "QueryString": {}

      struct QueryString
        include JSON::Serializable

        def initialize
        end
      end

      # A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast
      # a rate. The rule categorizes requests according to your aggregation criteria, collects them into
      # aggregation instances, and counts and rate limits the requests for each instance. If you change any
      # of these settings in a rule that's currently in use, the change resets the rule's rate limiting
      # counts. This can pause the rule's rate limiting activities for up to a minute. You can specify
      # individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key
      # combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie. Each
      # unique set of values for the aggregation keys that you specify is a separate aggregation instance,
      # with the value from each key contributing to the aggregation instance definition. For example,
      # assume the rule evaluates web requests with the following IP address and HTTP method values: IP
      # address 10.1.1.1, HTTP method POST IP address 10.1.1.1, HTTP method GET IP address 127.0.0.0, HTTP
      # method POST IP address 10.1.1.1, HTTP method GET The rule would create different aggregation
      # instances according to your aggregation criteria, for example: If the aggregation criteria is just
      # the IP address, then each individual address is an aggregation instance, and WAF counts requests
      # separately for each. The aggregation instances and request counts for our example would be the
      # following: IP address 10.1.1.1: count 3 IP address 127.0.0.0: count 1 If the aggregation criteria is
      # HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances
      # and request counts for our example would be the following: HTTP method POST: count 2 HTTP method
      # GET: count 2 If the aggregation criteria is IP address and HTTP method, then each IP address and
      # each HTTP method would contribute to the combined aggregation instance. The aggregation instances
      # and request counts for our example would be the following: IP address 10.1.1.1, HTTP method POST:
      # count 1 IP address 10.1.1.1, HTTP method GET: count 2 IP address 127.0.0.0, HTTP method POST: count
      # 1 For any n-tuple of aggregation keys, each unique combination of values for the keys defines a
      # separate aggregation instance, which WAF counts and rate-limits individually. You can optionally
      # nest another statement inside the rate-based statement, to narrow the scope of the rule so that it
      # only counts and rate limits requests that match the nested statement. You can use this nested
      # scope-down statement in conjunction with your aggregation key specifications or you can just count
      # and rate limit all requests that match the scope-down statement, without additional aggregation.
      # When you choose to just manage all requests that match a scope-down statement, the aggregation
      # instance is singular for the rule. You cannot nest a RateBasedStatement inside another statement,
      # for example inside a NotStatement or OrStatement . You can define a RateBasedStatement inside a web
      # ACL and inside a rule group. For additional information about the options, see Rate limiting web
      # requests using rate-based rules in the WAF Developer Guide . If you only aggregate on the individual
      # IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently
      # rate limiting for a rule through the API call GetRateBasedStatementManagedKeys . This option is not
      # available for other aggregation configurations. WAF tracks and manages web requests separately for
      # each instance of a rate-based rule that you use. For example, if you provide the same rate-based
      # rule settings in two web ACLs, each of the two rule statements represents a separate instance of the
      # rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule
      # inside a rule group, and then use that rule group in multiple places, each use creates a separate
      # instance of the rate-based rule that gets its own tracking and management by WAF.

      struct RateBasedStatement
        include JSON::Serializable

        # Setting that indicates how to aggregate the request counts. Web requests that are missing any of the
        # components specified in the aggregation keys are omitted from the rate-based rule evaluation and
        # handling. CONSTANT - Count and limit the requests that match the rate-based rule's scope-down
        # statement. With this option, the counted requests aren't further aggregated. The scope-down
        # statement is the only specification used. When the count of all requests that satisfy the scope-down
        # statement goes over the limit, WAF applies the rule action to all requests that satisfy the
        # scope-down statement. With this option, you must configure the ScopeDownStatement property.
        # CUSTOM_KEYS - Aggregate the request counts using one or more web request components as the aggregate
        # keys. With this option, you must specify the aggregate keys in the CustomKeys property. To aggregate
        # on only the IP address or only the forwarded IP address, don't use custom keys. Instead, set the
        # aggregate key type to IP or FORWARDED_IP . FORWARDED_IP - Aggregate the request counts on the first
        # IP address in an HTTP header. With this option, you must specify the header to use in the
        # ForwardedIPConfig property. To aggregate on a combination of the forwarded IP address with other
        # aggregate keys, use CUSTOM_KEYS . IP - Aggregate the request counts on the IP address from the web
        # request origin. To aggregate on a combination of the IP address with other aggregate keys, use
        # CUSTOM_KEYS .

        @[JSON::Field(key: "AggregateKeyType")]
        getter aggregate_key_type : String

        # The limit on requests during the specified evaluation window for a single aggregation instance for
        # the rate-based rule. If the rate-based statement includes a ScopeDownStatement , this limit is
        # applied only to the requests that match the statement. Examples: If you aggregate on just the IP
        # address, this is the limit on requests from any single IP address. If you aggregate on the HTTP
        # method and the query argument name "city", then this is the limit on requests for any single method,
        # city pair.

        @[JSON::Field(key: "Limit")]
        getter limit : Int64

        # Specifies the aggregate keys to use in a rate-base rule.

        @[JSON::Field(key: "CustomKeys")]
        getter custom_keys : Array(Types::RateBasedStatementCustomKey)?

        # The amount of time, in seconds, that WAF should include in its request counts, looking back from the
        # current time. For example, for a setting of 120, when WAF checks the rate, it counts the requests
        # for the 2 minutes immediately preceding the current time. Valid settings are 60, 120, 300, and 600.
        # This setting doesn't determine how often WAF checks the rate, but how far back it looks each time it
        # checks. WAF checks the rate about every 10 seconds. Default: 300 (5 minutes)

        @[JSON::Field(key: "EvaluationWindowSec")]
        getter evaluation_window_sec : Int64?

        # The configuration for inspecting IP addresses in an HTTP header that you specify, instead of using
        # the IP address that's reported by the web request origin. Commonly, this is the X-Forwarded-For
        # (XFF) header, but you can specify any header name. If the specified header isn't present in the
        # request, WAF doesn't apply the rule to the web request at all. This is required if you specify a
        # forwarded IP in the rule's aggregate key settings.

        @[JSON::Field(key: "ForwardedIPConfig")]
        getter forwarded_ip_config : Types::ForwardedIPConfig?

        # An optional nested statement that narrows the scope of the web requests that are evaluated and
        # managed by the rate-based statement. When you use a scope-down statement, the rate-based rule only
        # tracks and rate limits requests that match the scope-down statement. You can use any nestable
        # Statement in the scope-down statement, and you can nest statements at any level, the same as you can
        # for a rule statement.

        @[JSON::Field(key: "ScopeDownStatement")]
        getter scope_down_statement : Types::Statement?

        def initialize(
          @aggregate_key_type : String,
          @limit : Int64,
          @custom_keys : Array(Types::RateBasedStatementCustomKey)? = nil,
          @evaluation_window_sec : Int64? = nil,
          @forwarded_ip_config : Types::ForwardedIPConfig? = nil,
          @scope_down_statement : Types::Statement? = nil
        )
        end
      end

      # Specifies a single custom aggregate key for a rate-base rule. Web requests that are missing any of
      # the components specified in the aggregation keys are omitted from the rate-based rule evaluation and
      # handling.

      struct RateBasedStatementCustomKey
        include JSON::Serializable

        # Use an Autonomous System Number (ASN) derived from the request's originating or forwarded IP address
        # as an aggregate key. Each distinct ASN contributes to the aggregation instance.

        @[JSON::Field(key: "ASN")]
        getter asn : Types::RateLimitAsn?

        # Use the value of a cookie in the request as an aggregate key. Each distinct value in the cookie
        # contributes to the aggregation instance. If you use a single cookie as your custom key, then each
        # value fully defines an aggregation instance.

        @[JSON::Field(key: "Cookie")]
        getter cookie : Types::RateLimitCookie?

        # Use the first IP address in an HTTP header as an aggregate key. Each distinct forwarded IP address
        # contributes to the aggregation instance. When you specify an IP or forwarded IP in the custom key
        # settings, you must also specify at least one other key to use. You can aggregate on only the
        # forwarded IP address by specifying FORWARDED_IP in your rate-based statement's AggregateKeyType .
        # With this option, you must specify the header to use in the rate-based rule's ForwardedIPConfig
        # property.

        @[JSON::Field(key: "ForwardedIP")]
        getter forwarded_ip : Types::RateLimitForwardedIP?

        # Use the request's HTTP method as an aggregate key. Each distinct HTTP method contributes to the
        # aggregation instance. If you use just the HTTP method as your custom key, then each method fully
        # defines an aggregation instance.

        @[JSON::Field(key: "HTTPMethod")]
        getter http_method : Types::RateLimitHTTPMethod?

        # Use the value of a header in the request as an aggregate key. Each distinct value in the header
        # contributes to the aggregation instance. If you use a single header as your custom key, then each
        # value fully defines an aggregation instance.

        @[JSON::Field(key: "Header")]
        getter header : Types::RateLimitHeader?

        # Use the request's originating IP address as an aggregate key. Each distinct IP address contributes
        # to the aggregation instance. When you specify an IP or forwarded IP in the custom key settings, you
        # must also specify at least one other key to use. You can aggregate on only the IP address by
        # specifying IP in your rate-based statement's AggregateKeyType .

        @[JSON::Field(key: "IP")]
        getter ip : Types::RateLimitIP?

        # Use the request's JA3 fingerprint as an aggregate key. If you use a single JA3 fingerprint as your
        # custom key, then each value fully defines an aggregation instance.

        @[JSON::Field(key: "JA3Fingerprint")]
        getter ja3_fingerprint : Types::RateLimitJA3Fingerprint?

        # Use the request's JA4 fingerprint as an aggregate key. If you use a single JA4 fingerprint as your
        # custom key, then each value fully defines an aggregation instance.

        @[JSON::Field(key: "JA4Fingerprint")]
        getter ja4_fingerprint : Types::RateLimitJA4Fingerprint?

        # Use the specified label namespace as an aggregate key. Each distinct fully qualified label name that
        # has the specified label namespace contributes to the aggregation instance. If you use just one label
        # namespace as your custom key, then each label name fully defines an aggregation instance. This uses
        # only labels that have been added to the request by rules that are evaluated before this rate-based
        # rule in the web ACL. For information about label namespaces and names, see Label syntax and naming
        # requirements in the WAF Developer Guide .

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : Types::RateLimitLabelNamespace?

        # Use the specified query argument as an aggregate key. Each distinct value for the named query
        # argument contributes to the aggregation instance. If you use a single query argument as your custom
        # key, then each value fully defines an aggregation instance.

        @[JSON::Field(key: "QueryArgument")]
        getter query_argument : Types::RateLimitQueryArgument?

        # Use the request's query string as an aggregate key. Each distinct string contributes to the
        # aggregation instance. If you use just the query string as your custom key, then each string fully
        # defines an aggregation instance.

        @[JSON::Field(key: "QueryString")]
        getter query_string : Types::RateLimitQueryString?

        # Use the request's URI path as an aggregate key. Each distinct URI path contributes to the
        # aggregation instance. If you use just the URI path as your custom key, then each URI path fully
        # defines an aggregation instance.

        @[JSON::Field(key: "UriPath")]
        getter uri_path : Types::RateLimitUriPath?

        def initialize(
          @asn : Types::RateLimitAsn? = nil,
          @cookie : Types::RateLimitCookie? = nil,
          @forwarded_ip : Types::RateLimitForwardedIP? = nil,
          @http_method : Types::RateLimitHTTPMethod? = nil,
          @header : Types::RateLimitHeader? = nil,
          @ip : Types::RateLimitIP? = nil,
          @ja3_fingerprint : Types::RateLimitJA3Fingerprint? = nil,
          @ja4_fingerprint : Types::RateLimitJA4Fingerprint? = nil,
          @label_namespace : Types::RateLimitLabelNamespace? = nil,
          @query_argument : Types::RateLimitQueryArgument? = nil,
          @query_string : Types::RateLimitQueryString? = nil,
          @uri_path : Types::RateLimitUriPath? = nil
        )
        end
      end

      # The set of IP addresses that are currently blocked for a RateBasedStatement . This is only available
      # for rate-based rules that aggregate on just the IP address, with the AggregateKeyType set to IP or
      # FORWARDED_IP . A rate-based rule applies its rule action to requests from IP addresses that are in
      # the rule's managed keys list and that match the rule's scope-down statement. When a rule has no
      # scope-down statement, it applies the action to all requests from the IP addresses that are in the
      # list. The rule applies its rule action to rate limit the matching requests. The action is usually
      # Block but it can be any valid rule action except for Allow. The maximum number of IP addresses that
      # can be rate limited by a single rate-based rule instance is 10,000. If more than 10,000 addresses
      # exceed the rate limit, WAF limits those with the highest rates.

      struct RateBasedStatementManagedKeysIPSet
        include JSON::Serializable

        # The IP addresses that are currently blocked.

        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(String)?

        # The version of the IP addresses, either IPV4 or IPV6 .

        @[JSON::Field(key: "IPAddressVersion")]
        getter ip_address_version : String?

        def initialize(
          @addresses : Array(String)? = nil,
          @ip_address_version : String? = nil
        )
        end
      end

      # Specifies an Autonomous System Number (ASN) derived from the request's originating or forwarded IP
      # address as an aggregate key for a rate-based rule. Each distinct ASN contributes to the aggregation
      # instance. If you use a single ASN as your custom key, then each ASN fully defines an aggregation
      # instance.

      struct RateLimitAsn
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a cookie as an aggregate key for a rate-based rule. Each distinct value in the cookie
      # contributes to the aggregation instance. If you use a single cookie as your custom key, then each
      # value fully defines an aggregation instance.

      struct RateLimitCookie
        include JSON::Serializable

        # The name of the cookie to use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @name : String,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Specifies the first IP address in an HTTP header as an aggregate key for a rate-based rule. Each
      # distinct forwarded IP address contributes to the aggregation instance. This setting is used only in
      # the RateBasedStatementCustomKey specification of a rate-based rule statement. When you specify an IP
      # or forwarded IP in the custom key settings, you must also specify at least one other key to use. You
      # can aggregate on only the forwarded IP address by specifying FORWARDED_IP in your rate-based
      # statement's AggregateKeyType . This data type supports using the forwarded IP address in the web
      # request aggregation for a rate-based rule, in RateBasedStatementCustomKey . The JSON specification
      # for using the forwarded IP address doesn't explicitly use this data type. JSON specification:
      # "ForwardedIP": {} When you use this specification, you must also configure the forwarded IP address
      # in the rate-based statement's ForwardedIPConfig .

      struct RateLimitForwardedIP
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the request's HTTP method as an aggregate key for a rate-based rule. Each distinct HTTP
      # method contributes to the aggregation instance. If you use just the HTTP method as your custom key,
      # then each method fully defines an aggregation instance. JSON specification: "RateLimitHTTPMethod":
      # {}

      struct RateLimitHTTPMethod
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a header as an aggregate key for a rate-based rule. Each distinct value in the header
      # contributes to the aggregation instance. If you use a single header as your custom key, then each
      # value fully defines an aggregation instance.

      struct RateLimitHeader
        include JSON::Serializable

        # The name of the header to use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @name : String,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Specifies the IP address in the web request as an aggregate key for a rate-based rule. Each distinct
      # IP address contributes to the aggregation instance. This setting is used only in the
      # RateBasedStatementCustomKey specification of a rate-based rule statement. To use this in the custom
      # key settings, you must specify at least one other key to use, along with the IP address. To
      # aggregate on only the IP address, in your rate-based statement's AggregateKeyType , specify IP .
      # JSON specification: "RateLimitIP": {}

      struct RateLimitIP
        include JSON::Serializable

        def initialize
        end
      end

      # Use the request's JA3 fingerprint derived from the TLS Client Hello of an incoming request as an
      # aggregate key. If you use a single JA3 fingerprint as your custom key, then each value fully defines
      # an aggregation instance.

      struct RateLimitJA3Fingerprint
        include JSON::Serializable

        # The match status to assign to the web request if there is insufficient TSL Client Hello information
        # to compute the JA3 fingerprint. You can specify the following fallback behaviors: MATCH - Treat the
        # web request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH -
        # Treat the web request as not matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        def initialize(
          @fallback_behavior : String
        )
        end
      end

      # Use the request's JA4 fingerprint derived from the TLS Client Hello of an incoming request as an
      # aggregate key. If you use a single JA4 fingerprint as your custom key, then each value fully defines
      # an aggregation instance.

      struct RateLimitJA4Fingerprint
        include JSON::Serializable

        # The match status to assign to the web request if there is insufficient TSL Client Hello information
        # to compute the JA4 fingerprint. You can specify the following fallback behaviors: MATCH - Treat the
        # web request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH -
        # Treat the web request as not matching the rule statement.

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String

        def initialize(
          @fallback_behavior : String
        )
        end
      end

      # Specifies a label namespace to use as an aggregate key for a rate-based rule. Each distinct fully
      # qualified label name that has the specified label namespace contributes to the aggregation instance.
      # If you use just one label namespace as your custom key, then each label name fully defines an
      # aggregation instance. This uses only labels that have been added to the request by rules that are
      # evaluated before this rate-based rule in the web ACL. For information about label namespaces and
      # names, see Label syntax and naming requirements in the WAF Developer Guide .

      struct RateLimitLabelNamespace
        include JSON::Serializable

        # The namespace to use for aggregation.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String

        def initialize(
          @namespace : String
        )
        end
      end

      # Specifies a query argument in the request as an aggregate key for a rate-based rule. Each distinct
      # value for the named query argument contributes to the aggregation instance. If you use a single
      # query argument as your custom key, then each value fully defines an aggregation instance.

      struct RateLimitQueryArgument
        include JSON::Serializable

        # The name of the query argument to use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @name : String,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Specifies the request's query string as an aggregate key for a rate-based rule. Each distinct string
      # contributes to the aggregation instance. If you use just the query string as your custom key, then
      # each string fully defines an aggregation instance.

      struct RateLimitQueryString
        include JSON::Serializable

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Specifies the request's URI path as an aggregate key for a rate-based rule. Each distinct URI path
      # contributes to the aggregation instance. If you use just the URI path as your custom key, then each
      # URI path fully defines an aggregation instance.

      struct RateLimitUriPath
        include JSON::Serializable

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # A single regular expression. This is used in a RegexPatternSet and also in the configuration for the
      # Amazon Web Services Managed Rules rule group AWSManagedRulesAntiDDoSRuleSet .

      struct Regex
        include JSON::Serializable

        # The string representing the regular expression.

        @[JSON::Field(key: "RegexString")]
        getter regex_string : String?

        def initialize(
          @regex_string : String? = nil
        )
        end
      end

      # A rule statement used to search web request components for a match against a single regular
      # expression.

      struct RegexMatchStatement
        include JSON::Serializable

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # The string representing the regular expression.

        @[JSON::Field(key: "RegexString")]
        getter regex_string : String

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @regex_string : String,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # Contains one or more regular expressions. WAF assigns an ARN to each RegexPatternSet that you
      # create. To use a set in a rule, you provide the ARN to the Rule statement
      # RegexPatternSetReferenceStatement .

      struct RegexPatternSet
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the set. You cannot change the name after you create the set.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The regular expression patterns in the set.

        @[JSON::Field(key: "RegularExpressionList")]
        getter regular_expression_list : Array(Types::Regex)?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @regular_expression_list : Array(Types::Regex)? = nil
        )
        end
      end

      # A rule statement used to search web request components for matches with regular expressions. To use
      # this, create a RegexPatternSet that specifies the expressions that you want to detect, then use the
      # ARN of that set in this statement. A web request matches the pattern set rule statement if the
      # request component matches any of the patterns in the set. To create a regex pattern set, see
      # CreateRegexPatternSet . Each regex pattern set rule statement references a regex pattern set. You
      # create and maintain the set independent of your rules. This allows you to use the single set in
      # multiple rules. When you update the referenced set, WAF automatically updates all rules that
      # reference it.

      struct RegexPatternSetReferenceStatement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RegexPatternSet that this statement references.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @arn : String,
          @field_to_match : Types::FieldToMatch,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # High-level information about a RegexPatternSet , returned by operations like create and list. This
      # provides information like the ID, that you can use to retrieve and manage a RegexPatternSet , and
      # the ARN, that you provide to the RegexPatternSetReferenceStatement to use the pattern set in a Rule
      # .

      struct RegexPatternSetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The name of the data type instance. You cannot change the name after you create the instance.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lock_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      # High level information for an SDK release.

      struct ReleaseSummary
        include JSON::Serializable

        # The release version.

        @[JSON::Field(key: "ReleaseVersion")]
        getter release_version : String?

        # The timestamp of the release.

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @release_version : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Customizes the maximum size of the request body that your protected CloudFront, API Gateway, Amazon
      # Cognito, App Runner, and Verified Access resources forward to WAF for inspection. The default size
      # is 16 KB (16,384 bytes). You can change the setting for any of the available resource types. You are
      # charged additional fees when your protected resources forward body sizes that are larger than the
      # default. For more information, see WAF Pricing . Example JSON: { "API_GATEWAY": "KB_48",
      # "APP_RUNNER_SERVICE": "KB_32" } For Application Load Balancer and AppSync, the limit is fixed at 8
      # KB (8,192 bytes). This is used in the AssociationConfig of the web ACL.

      struct RequestBodyAssociatedResourceTypeConfig
        include JSON::Serializable

        # Specifies the maximum size of the web request body component that an associated CloudFront, API
        # Gateway, Amazon Cognito, App Runner, or Verified Access resource should send to WAF for inspection.
        # This applies to statements in the web ACL that inspect the body or JSON body. Default: 16 KB (16,384
        # bytes)

        @[JSON::Field(key: "DefaultSizeInspectionLimit")]
        getter default_size_inspection_limit : String

        def initialize(
          @default_size_inspection_limit : String
        )
        end
      end

      # The criteria for inspecting login requests, used by the ATP rule group to validate credentials
      # usage. This is part of the AWSManagedRulesATPRuleSet configuration in ManagedRuleGroupConfig . In
      # these settings, you specify how your application accepts login attempts by providing the request
      # payload type and the names of the fields within the request body where the username and password are
      # provided.

      struct RequestInspection
        include JSON::Serializable

        # The name of the field in the request payload that contains your customer's password. How you specify
        # this depends on the request inspection payload type. For JSON payloads, specify the field name in
        # JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering
        # Task Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the
        # JSON payload { "form": { "password": "THE_PASSWORD" } } , the password field specification is
        # /form/password . For form encoded payload types, use the HTML form names. For example, for an HTML
        # form with the input element named password1 , the password field specification is password1 .

        @[JSON::Field(key: "PasswordField")]
        getter password_field : Types::PasswordField

        # The payload type for your login endpoint, either JSON or form encoded.

        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String

        # The name of the field in the request payload that contains your customer's username. How you specify
        # this depends on the request inspection payload type. For JSON payloads, specify the field name in
        # JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering
        # Task Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the
        # JSON payload { "form": { "username": "THE_USERNAME" } } , the username field specification is
        # /form/username . For form encoded payload types, use the HTML form names. For example, for an HTML
        # form with the input element named username1 , the username field specification is username1

        @[JSON::Field(key: "UsernameField")]
        getter username_field : Types::UsernameField

        def initialize(
          @password_field : Types::PasswordField,
          @payload_type : String,
          @username_field : Types::UsernameField
        )
        end
      end

      # The criteria for inspecting account creation requests, used by the ACFP rule group to validate and
      # track account creation attempts. This is part of the AWSManagedRulesACFPRuleSet configuration in
      # ManagedRuleGroupConfig . In these settings, you specify how your application accepts account
      # creation attempts by providing the request payload type and the names of the fields within the
      # request body where the username, password, email, and primary address and phone number fields are
      # provided.

      struct RequestInspectionACFP
        include JSON::Serializable

        # The payload type for your account creation endpoint, either JSON or form encoded.

        @[JSON::Field(key: "PayloadType")]
        getter payload_type : String

        # The names of the fields in the request payload that contain your customer's primary physical
        # address. Order the address fields in the array exactly as they are ordered in the request payload.
        # How you specify the address fields depends on the request inspection payload type. For JSON
        # payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON
        # Pointer syntax, see the Internet Engineering Task Force (IETF) documentation JavaScript Object
        # Notation (JSON) Pointer . For example, for the JSON payload { "form": { "primaryaddressline1":
        # "THE_ADDRESS1", "primaryaddressline2": "THE_ADDRESS2", "primaryaddressline3": "THE_ADDRESS3" } } ,
        # the address field idenfiers are /form/primaryaddressline1 , /form/primaryaddressline2 , and
        # /form/primaryaddressline3 . For form encoded payload types, use the HTML form names. For example,
        # for an HTML form with input elements named primaryaddressline1 , primaryaddressline2 , and
        # primaryaddressline3 , the address fields identifiers are primaryaddressline1 , primaryaddressline2 ,
        # and primaryaddressline3 .

        @[JSON::Field(key: "AddressFields")]
        getter address_fields : Array(Types::AddressField)?

        # The name of the field in the request payload that contains your customer's email. How you specify
        # this depends on the request inspection payload type. For JSON payloads, specify the field name in
        # JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering
        # Task Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the
        # JSON payload { "form": { "email": "THE_EMAIL" } } , the email field specification is /form/email .
        # For form encoded payload types, use the HTML form names. For example, for an HTML form with the
        # input element named email1 , the email field specification is email1 .

        @[JSON::Field(key: "EmailField")]
        getter email_field : Types::EmailField?

        # The name of the field in the request payload that contains your customer's password. How you specify
        # this depends on the request inspection payload type. For JSON payloads, specify the field name in
        # JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering
        # Task Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the
        # JSON payload { "form": { "password": "THE_PASSWORD" } } , the password field specification is
        # /form/password . For form encoded payload types, use the HTML form names. For example, for an HTML
        # form with the input element named password1 , the password field specification is password1 .

        @[JSON::Field(key: "PasswordField")]
        getter password_field : Types::PasswordField?

        # The names of the fields in the request payload that contain your customer's primary phone number.
        # Order the phone number fields in the array exactly as they are ordered in the request payload. How
        # you specify the phone number fields depends on the request inspection payload type. For JSON
        # payloads, specify the field identifiers in JSON pointer syntax. For information about the JSON
        # Pointer syntax, see the Internet Engineering Task Force (IETF) documentation JavaScript Object
        # Notation (JSON) Pointer . For example, for the JSON payload { "form": { "primaryphoneline1":
        # "THE_PHONE1", "primaryphoneline2": "THE_PHONE2", "primaryphoneline3": "THE_PHONE3" } } , the phone
        # number field identifiers are /form/primaryphoneline1 , /form/primaryphoneline2 , and
        # /form/primaryphoneline3 . For form encoded payload types, use the HTML form names. For example, for
        # an HTML form with input elements named primaryphoneline1 , primaryphoneline2 , and primaryphoneline3
        # , the phone number field identifiers are primaryphoneline1 , primaryphoneline2 , and
        # primaryphoneline3 .

        @[JSON::Field(key: "PhoneNumberFields")]
        getter phone_number_fields : Array(Types::PhoneNumberField)?

        # The name of the field in the request payload that contains your customer's username. How you specify
        # this depends on the request inspection payload type. For JSON payloads, specify the field name in
        # JSON pointer syntax. For information about the JSON Pointer syntax, see the Internet Engineering
        # Task Force (IETF) documentation JavaScript Object Notation (JSON) Pointer . For example, for the
        # JSON payload { "form": { "username": "THE_USERNAME" } } , the username field specification is
        # /form/username . For form encoded payload types, use the HTML form names. For example, for an HTML
        # form with the input element named username1 , the username field specification is username1

        @[JSON::Field(key: "UsernameField")]
        getter username_field : Types::UsernameField?

        def initialize(
          @payload_type : String,
          @address_fields : Array(Types::AddressField)? = nil,
          @email_field : Types::EmailField? = nil,
          @password_field : Types::PasswordField? = nil,
          @phone_number_fields : Array(Types::PhoneNumberField)? = nil,
          @username_field : Types::UsernameField? = nil
        )
        end
      end

      # The criteria for inspecting responses to login requests and account creation requests, used by the
      # ATP and ACFP rule groups to track login and account creation success and failure rates. Response
      # inspection is available only in web ACLs that protect Amazon CloudFront distributions. The rule
      # groups evaluates the responses that your protected resources send back to client login and account
      # creation attempts, keeping count of successful and failed attempts from each IP address and client
      # session. Using this information, the rule group labels and mitigates requests from client sessions
      # and IP addresses with too much suspicious activity in a short amount of time. This is part of the
      # AWSManagedRulesATPRuleSet and AWSManagedRulesACFPRuleSet configurations in ManagedRuleGroupConfig .
      # Enable response inspection by configuring exactly one component of the response to inspect, for
      # example, Header or StatusCode . You can't configure more than one component for inspection. If you
      # don't configure any of the response inspection options, response inspection is disabled.

      struct ResponseInspection
        include JSON::Serializable

        # Configures inspection of the response body for success and failure indicators. WAF can inspect the
        # first 65,536 bytes (64 KB) of the response body.

        @[JSON::Field(key: "BodyContains")]
        getter body_contains : Types::ResponseInspectionBodyContains?

        # Configures inspection of the response header for success and failure indicators.

        @[JSON::Field(key: "Header")]
        getter header : Types::ResponseInspectionHeader?

        # Configures inspection of the response JSON for success and failure indicators. WAF can inspect the
        # first 65,536 bytes (64 KB) of the response JSON.

        @[JSON::Field(key: "Json")]
        getter json : Types::ResponseInspectionJson?

        # Configures inspection of the response status code for success and failure indicators.

        @[JSON::Field(key: "StatusCode")]
        getter status_code : Types::ResponseInspectionStatusCode?

        def initialize(
          @body_contains : Types::ResponseInspectionBodyContains? = nil,
          @header : Types::ResponseInspectionHeader? = nil,
          @json : Types::ResponseInspectionJson? = nil,
          @status_code : Types::ResponseInspectionStatusCode? = nil
        )
        end
      end

      # Configures inspection of the response body. WAF can inspect the first 65,536 bytes (64 KB) of the
      # response body. This is part of the ResponseInspection configuration for AWSManagedRulesATPRuleSet
      # and AWSManagedRulesACFPRuleSet . Response inspection is available only in web ACLs that protect
      # Amazon CloudFront distributions.

      struct ResponseInspectionBodyContains
        include JSON::Serializable

        # Strings in the body of the response that indicate a failed login or account creation attempt. To be
        # counted as a failure, the string can be anywhere in the body and must be an exact match, including
        # case. Each string must be unique among the success and failure strings. JSON example:
        # "FailureStrings": [ "Request failed" ]

        @[JSON::Field(key: "FailureStrings")]
        getter failure_strings : Array(String)

        # Strings in the body of the response that indicate a successful login or account creation attempt. To
        # be counted as a success, the string can be anywhere in the body and must be an exact match,
        # including case. Each string must be unique among the success and failure strings. JSON examples:
        # "SuccessStrings": [ "Login successful" ] and "SuccessStrings": [ "Account creation successful",
        # "Welcome to our site!" ]

        @[JSON::Field(key: "SuccessStrings")]
        getter success_strings : Array(String)

        def initialize(
          @failure_strings : Array(String),
          @success_strings : Array(String)
        )
        end
      end

      # Configures inspection of the response header. This is part of the ResponseInspection configuration
      # for AWSManagedRulesATPRuleSet and AWSManagedRulesACFPRuleSet . Response inspection is available only
      # in web ACLs that protect Amazon CloudFront distributions.

      struct ResponseInspectionHeader
        include JSON::Serializable

        # Values in the response header with the specified name that indicate a failed login or account
        # creation attempt. To be counted as a failure, the value must be an exact match, including case. Each
        # value must be unique among the success and failure values. JSON examples: "FailureValues": [
        # "LoginFailed", "Failed login" ] and "FailureValues": [ "AccountCreationFailed" ]

        @[JSON::Field(key: "FailureValues")]
        getter failure_values : Array(String)

        # The name of the header to match against. The name must be an exact match, including case. JSON
        # example: "Name": [ "RequestResult" ]

        @[JSON::Field(key: "Name")]
        getter name : String

        # Values in the response header with the specified name that indicate a successful login or account
        # creation attempt. To be counted as a success, the value must be an exact match, including case. Each
        # value must be unique among the success and failure values. JSON examples: "SuccessValues": [
        # "LoginPassed", "Successful login" ] and "SuccessValues": [ "AccountCreated", "Successful account
        # creation" ]

        @[JSON::Field(key: "SuccessValues")]
        getter success_values : Array(String)

        def initialize(
          @failure_values : Array(String),
          @name : String,
          @success_values : Array(String)
        )
        end
      end

      # Configures inspection of the response JSON. WAF can inspect the first 65,536 bytes (64 KB) of the
      # response JSON. This is part of the ResponseInspection configuration for AWSManagedRulesATPRuleSet
      # and AWSManagedRulesACFPRuleSet . Response inspection is available only in web ACLs that protect
      # Amazon CloudFront distributions.

      struct ResponseInspectionJson
        include JSON::Serializable

        # Values for the specified identifier in the response JSON that indicate a failed login or account
        # creation attempt. To be counted as a failure, the value must be an exact match, including case. Each
        # value must be unique among the success and failure values. JSON example: "FailureValues": [ "False",
        # "Failed" ]

        @[JSON::Field(key: "FailureValues")]
        getter failure_values : Array(String)

        # The identifier for the value to match against in the JSON. The identifier must be an exact match,
        # including case. JSON examples: "Identifier": [ "/login/success" ] and "Identifier": [
        # "/sign-up/success" ]

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        # Values for the specified identifier in the response JSON that indicate a successful login or account
        # creation attempt. To be counted as a success, the value must be an exact match, including case. Each
        # value must be unique among the success and failure values. JSON example: "SuccessValues": [ "True",
        # "Succeeded" ]

        @[JSON::Field(key: "SuccessValues")]
        getter success_values : Array(String)

        def initialize(
          @failure_values : Array(String),
          @identifier : String,
          @success_values : Array(String)
        )
        end
      end

      # Configures inspection of the response status code. This is part of the ResponseInspection
      # configuration for AWSManagedRulesATPRuleSet and AWSManagedRulesACFPRuleSet . Response inspection is
      # available only in web ACLs that protect Amazon CloudFront distributions.

      struct ResponseInspectionStatusCode
        include JSON::Serializable

        # Status codes in the response that indicate a failed login or account creation attempt. To be counted
        # as a failure, the response status code must match one of these. Each code must be unique among the
        # success and failure status codes. JSON example: "FailureCodes": [ 400, 404 ]

        @[JSON::Field(key: "FailureCodes")]
        getter failure_codes : Array(Int32)

        # Status codes in the response that indicate a successful login or account creation attempt. To be
        # counted as a success, the response status code must match one of these. Each code must be unique
        # among the success and failure status codes. JSON example: "SuccessCodes": [ 200, 201 ]

        @[JSON::Field(key: "SuccessCodes")]
        getter success_codes : Array(Int32)

        def initialize(
          @failure_codes : Array(Int32),
          @success_codes : Array(Int32)
        )
        end
      end

      # A single rule, which you can use in a WebACL or RuleGroup to identify web requests that you want to
      # manage in some way. Each rule includes one top-level Statement that WAF uses to identify matching
      # web requests, and parameters that govern how WAF handles them.

      struct Rule
        include JSON::Serializable

        # The name of the rule. If you change the name of a Rule after you create it and you want the rule's
        # metric name to reflect the change, update the metric name in the rule's VisibilityConfig settings.
        # WAF doesn't automatically update the metric name when you update the rule name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # If you define more than one Rule in a WebACL , WAF evaluates each request against the Rules in order
        # based on the value of Priority . WAF processes rules with lower priority first. The priorities don't
        # need to be consecutive, but they must all be different.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The WAF processing statement for the rule, for example ByteMatchStatement or SizeConstraintStatement
        # .

        @[JSON::Field(key: "Statement")]
        getter statement : Types::Statement

        # Defines and enables Amazon CloudWatch metrics and web request sample collection. If you change the
        # name of a Rule after you create it and you want the rule's metric name to reflect the change, update
        # the metric name as well. WAF doesn't automatically update the metric name.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # The action that WAF should take on a web request when it matches the rule statement. Settings at the
        # web ACL level can override the rule action setting. This is used only for rules whose statements do
        # not reference a rule group. Rule statements that reference a rule group include
        # RuleGroupReferenceStatement and ManagedRuleGroupStatement . You must specify either this Action
        # setting or the rule OverrideAction setting, but not both: If the rule statement does not reference a
        # rule group, use this rule action setting and not the rule override action setting. If the rule
        # statement references a rule group, use the override action setting and not this action setting.

        @[JSON::Field(key: "Action")]
        getter action : Types::RuleAction?

        # Specifies how WAF should handle CAPTCHA evaluations. If you don't specify this, WAF uses the CAPTCHA
        # configuration that's defined for the web ACL.

        @[JSON::Field(key: "CaptchaConfig")]
        getter captcha_config : Types::CaptchaConfig?

        # Specifies how WAF should handle Challenge evaluations. If you don't specify this, WAF uses the
        # challenge configuration that's defined for the web ACL.

        @[JSON::Field(key: "ChallengeConfig")]
        getter challenge_config : Types::ChallengeConfig?

        # The action to use in the place of the action that results from the rule group evaluation. Set the
        # override action to none to leave the result of the rule group alone. Set it to count to override the
        # result to count only. You can only use this for rule statements that reference a rule group, like
        # RuleGroupReferenceStatement and ManagedRuleGroupStatement . This option is usually set to none. It
        # does not affect how the rules in the rule group are evaluated. If you want the rules in the rule
        # group to only count matches, do not use this and instead use the rule action override option, with
        # Count action, in your rule group reference statement settings.

        @[JSON::Field(key: "OverrideAction")]
        getter override_action : Types::OverrideAction?

        # Labels to apply to web requests that match the rule match statement. WAF applies fully qualified
        # labels to matching web requests. A fully qualified label is the concatenation of a label namespace
        # and a rule label. The rule's rule group or web ACL defines the label namespace. Any rule that isn't
        # a rule group reference statement or managed rule group statement can add labels to matching web
        # requests. Rules that run after this rule in the web ACL can match against these labels using a
        # LabelMatchStatement . For each label, provide a case-sensitive string containing optional namespaces
        # and a label name, according to the following guidelines: Separate each component of the label with a
        # colon. Each namespace or name can have up to 128 characters. You can specify up to 5 namespaces in a
        # label. Don't use the following reserved words in your label specification: aws , waf , managed ,
        # rulegroup , webacl , regexpatternset , or ipset . For example, myLabelName or
        # nameSpace1:nameSpace2:myLabelName .

        @[JSON::Field(key: "RuleLabels")]
        getter rule_labels : Array(Types::Label)?

        def initialize(
          @name : String,
          @priority : Int32,
          @statement : Types::Statement,
          @visibility_config : Types::VisibilityConfig,
          @action : Types::RuleAction? = nil,
          @captcha_config : Types::CaptchaConfig? = nil,
          @challenge_config : Types::ChallengeConfig? = nil,
          @override_action : Types::OverrideAction? = nil,
          @rule_labels : Array(Types::Label)? = nil
        )
        end
      end

      # The action that WAF should take on a web request when it matches a rule's statement. Settings at the
      # web ACL level can override the rule action setting.

      struct RuleAction
        include JSON::Serializable

        # Instructs WAF to allow the web request.

        @[JSON::Field(key: "Allow")]
        getter allow : Types::AllowAction?

        # Instructs WAF to block the web request.

        @[JSON::Field(key: "Block")]
        getter block : Types::BlockAction?

        # Instructs WAF to run a CAPTCHA check against the web request.

        @[JSON::Field(key: "Captcha")]
        getter captcha : Types::CaptchaAction?

        # Instructs WAF to run a Challenge check against the web request.

        @[JSON::Field(key: "Challenge")]
        getter challenge : Types::ChallengeAction?

        # Instructs WAF to count the web request and then continue evaluating the request using the remaining
        # rules in the web ACL.

        @[JSON::Field(key: "Count")]
        getter count : Types::CountAction?

        def initialize(
          @allow : Types::AllowAction? = nil,
          @block : Types::BlockAction? = nil,
          @captcha : Types::CaptchaAction? = nil,
          @challenge : Types::ChallengeAction? = nil,
          @count : Types::CountAction? = nil
        )
        end
      end

      # Action setting to use in the place of a rule action that is configured inside the rule group. You
      # specify one override for each rule whose action you want to change. Verify the rule names in your
      # overrides carefully. With managed rule groups, WAF silently ignores any override that uses an
      # invalid rule name. With customer-owned rule groups, invalid rule names in your overrides will cause
      # web ACL updates to fail. An invalid rule name is any name that doesn't exactly match the
      # case-sensitive name of an existing rule in the rule group. You can use overrides for testing, for
      # example you can override all of rule actions to Count and then monitor the resulting count metrics
      # to understand how the rule group would handle your web traffic. You can also permanently override
      # some or all actions, to modify how the rule group manages your web traffic.

      struct RuleActionOverride
        include JSON::Serializable

        # The override action to use, in place of the configured action of the rule in the rule group.

        @[JSON::Field(key: "ActionToUse")]
        getter action_to_use : Types::RuleAction

        # The name of the rule to override. Verify the rule names in your overrides carefully. With managed
        # rule groups, WAF silently ignores any override that uses an invalid rule name. With customer-owned
        # rule groups, invalid rule names in your overrides will cause web ACL updates to fail. An invalid
        # rule name is any name that doesn't exactly match the case-sensitive name of an existing rule in the
        # rule group.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @action_to_use : Types::RuleAction,
          @name : String
        )
        end
      end

      # A rule group defines a collection of rules to inspect and control web requests that you can use in a
      # WebACL . When you create a rule group, you define an immutable capacity limit. If you update a rule
      # group, you must stay within the capacity. This allows others to reuse the rule group with confidence
      # in its capacity requirements.

      struct RuleGroup
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The web ACL capacity units (WCUs) required for this rule group. When you create your own rule group,
        # you define this, and you cannot change it after creation. When you add or modify the rules in a rule
        # group, WAF enforces this limit. You can check the capacity for a set of rules using CheckCapacity .
        # WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule
        # groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the
        # relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex
        # rules that use more processing power. Rule group capacity is fixed at creation, which helps users
        # plan their web ACL WCU usage when they use a rule group. For more information, see WAF web ACL
        # capacity units (WCU) in the WAF Developer Guide .

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # The labels that one or more rules in this rule group add to matching web requests. These labels are
        # defined in the RuleLabels for a Rule .

        @[JSON::Field(key: "AvailableLabels")]
        getter available_labels : Array(Types::LabelSummary)?

        # The labels that one or more rules in this rule group match against in label match statements. These
        # labels are defined in a LabelMatchStatement specification, in the Statement definition of a rule.

        @[JSON::Field(key: "ConsumedLabels")]
        getter consumed_labels : Array(Types::LabelSummary)?

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the rule group, and then use
        # them in the rules that you define in the rule group. For information about customizing web requests
        # and responses, see Customizing web requests and responses in WAF in the WAF Developer Guide . For
        # information about the limits on count and size for custom request and response settings, see WAF
        # quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # A description of the rule group that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The label namespace prefix for this rule group. All labels added by rules in this rule group have
        # this prefix. The syntax for the label namespace prefix for your rule groups is the following:
        # awswaf:&lt;account ID&gt;:rulegroup:&lt;rule group name&gt;: When a rule with a label matches a web
        # request, WAF adds the fully qualified label to the request. A fully qualified label is made up of
        # the label namespace from the rule group or web ACL where the rule is defined and the label from the
        # rule, separated by a colon: &lt;label namespace&gt;:&lt;label from rule&gt;

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : String?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @arn : String,
          @capacity : Int64,
          @id : String,
          @name : String,
          @visibility_config : Types::VisibilityConfig,
          @available_labels : Array(Types::LabelSummary)? = nil,
          @consumed_labels : Array(Types::LabelSummary)? = nil,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @description : String? = nil,
          @label_namespace : String? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end

      # A rule statement used to run the rules that are defined in a RuleGroup . To use this, create a rule
      # group with your rules, then provide the ARN of the rule group in this statement. You cannot nest a
      # RuleGroupReferenceStatement , for example for use inside a NotStatement or OrStatement . You cannot
      # use a rule group reference statement inside another rule group. You can only reference a rule group
      # as a top-level statement within a rule that you define in a web ACL.

      struct RuleGroupReferenceStatement
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # Rules in the referenced rule group whose actions are set to Count . Instead of this option, use
        # RuleActionOverrides . It accepts any valid action setting, including Count .

        @[JSON::Field(key: "ExcludedRules")]
        getter excluded_rules : Array(Types::ExcludedRule)?

        # Action settings to use in the place of the rule actions that are configured inside the rule group.
        # You specify one override for each rule whose action you want to change. Verify the rule names in
        # your overrides carefully. With managed rule groups, WAF silently ignores any override that uses an
        # invalid rule name. With customer-owned rule groups, invalid rule names in your overrides will cause
        # web ACL updates to fail. An invalid rule name is any name that doesn't exactly match the
        # case-sensitive name of an existing rule in the rule group. You can use overrides for testing, for
        # example you can override all of rule actions to Count and then monitor the resulting count metrics
        # to understand how the rule group would handle your web traffic. You can also permanently override
        # some or all actions, to modify how the rule group manages your web traffic.

        @[JSON::Field(key: "RuleActionOverrides")]
        getter rule_action_overrides : Array(Types::RuleActionOverride)?

        def initialize(
          @arn : String,
          @excluded_rules : Array(Types::ExcludedRule)? = nil,
          @rule_action_overrides : Array(Types::RuleActionOverride)? = nil
        )
        end
      end

      # High-level information about a RuleGroup , returned by operations like create and list. This
      # provides information like the ID, that you can use to retrieve and manage a RuleGroup , and the ARN,
      # that you provide to the RuleGroupReferenceStatement to use the rule group in a Rule .

      struct RuleGroupSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the rule group that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The name of the data type instance. You cannot change the name after you create the instance.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lock_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      # High-level information about a Rule , returned by operations like DescribeManagedRuleGroup . This
      # provides information like the ID, that you can use to retrieve and manage a RuleGroup , and the ARN,
      # that you provide to the RuleGroupReferenceStatement to use the rule group in a Rule .

      struct RuleSummary
        include JSON::Serializable

        # The action that WAF should take on a web request when it matches a rule's statement. Settings at the
        # web ACL level can override the rule action setting.

        @[JSON::Field(key: "Action")]
        getter action : Types::RuleAction?

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @action : Types::RuleAction? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents a single sampled web request. The response from GetSampledRequests includes a
      # SampledHTTPRequests complex type that appears as SampledRequests in the response syntax.
      # SampledHTTPRequests contains an array of SampledHTTPRequest objects.

      struct SampledHTTPRequest
        include JSON::Serializable

        # A complex type that contains detailed information about the request.

        @[JSON::Field(key: "Request")]
        getter request : Types::HTTPRequest

        # A value that indicates how one result in the response relates proportionally to other results in the
        # response. For example, a result that has a weight of 2 represents roughly twice as many web requests
        # as a result that has a weight of 1 .

        @[JSON::Field(key: "Weight")]
        getter weight : Int64

        # The action that WAF applied to the request.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The CAPTCHA response for the request.

        @[JSON::Field(key: "CaptchaResponse")]
        getter captcha_response : Types::CaptchaResponse?

        # The Challenge response for the request.

        @[JSON::Field(key: "ChallengeResponse")]
        getter challenge_response : Types::ChallengeResponse?

        # Labels applied to the web request by matching rules. WAF applies fully qualified labels to matching
        # web requests. A fully qualified label is the concatenation of a label namespace and a rule label.
        # The rule's rule group or web ACL defines the label namespace. For example,
        # awswaf:111122223333:myRuleGroup:testRules:testNS1:testNS2:labelNameA or
        # awswaf:managed:aws:managed-rule-set:header:encoding:utf8 .

        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::Label)?

        # Used only for rule group rules that have a rule action override in place in the web ACL. This is the
        # action that the rule group rule is configured for, and not the action that was applied to the
        # request. The action that WAF applied is the Action value.

        @[JSON::Field(key: "OverriddenAction")]
        getter overridden_action : String?

        # Custom request headers inserted by WAF into the request, according to the custom request
        # configuration for the matching rule action.

        @[JSON::Field(key: "RequestHeadersInserted")]
        getter request_headers_inserted : Array(Types::HTTPHeader)?

        # The response code that was sent for the request.

        @[JSON::Field(key: "ResponseCodeSent")]
        getter response_code_sent : Int32?

        # The name of the Rule that the request matched. For managed rule groups, the format for this name is
        # &lt;vendor name&gt;#&lt;managed rule group name&gt;#&lt;rule name&gt; . For your own rule groups,
        # the format for this name is &lt;rule group name&gt;#&lt;rule name&gt; . If the rule is not in a rule
        # group, this field is absent.

        @[JSON::Field(key: "RuleNameWithinRuleGroup")]
        getter rule_name_within_rule_group : String?

        # The time at which WAF received the request from your Amazon Web Services resource, in Unix time
        # format (in seconds).

        @[JSON::Field(key: "Timestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @request : Types::HTTPRequest,
          @weight : Int64,
          @action : String? = nil,
          @captcha_response : Types::CaptchaResponse? = nil,
          @challenge_response : Types::ChallengeResponse? = nil,
          @labels : Array(Types::Label)? = nil,
          @overridden_action : String? = nil,
          @request_headers_inserted : Array(Types::HTTPHeader)? = nil,
          @response_code_sent : Int32? = nil,
          @rule_name_within_rule_group : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # Inspect one of the headers in the web request, identified by name, for example, User-Agent or
      # Referer . The name isn't case sensitive. You can filter and inspect all headers with the
      # FieldToMatch setting Headers . This is used to indicate the web request component to inspect, in the
      # FieldToMatch specification. Example JSON: "SingleHeader": { "Name": "haystack" }

      struct SingleHeader
        include JSON::Serializable

        # The name of the query header to inspect.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Inspect one query argument in the web request, identified by name, for example UserName or
      # SalesRegion . The name isn't case sensitive. This is used to indicate the web request component to
      # inspect, in the FieldToMatch specification. Example JSON: "SingleQueryArgument": { "Name":
      # "myArgument" }

      struct SingleQueryArgument
        include JSON::Serializable

        # The name of the query argument to inspect.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # A rule statement that compares a number of bytes against the size of a request component, using a
      # comparison operator, such as greater than (&gt;) or less than (&lt;). For example, you can use a
      # size constraint statement to look for query strings that are longer than 100 bytes. If you configure
      # WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit
      # for the web ACL and protected resource type. If you know that the request body for your web requests
      # should never exceed the inspection limit, you can use a size constraint statement to block requests
      # that have a larger request body size. For more information about the inspection limits, see Body and
      # JsonBody settings for the FieldToMatch data type. If you choose URI for the value of Part of the
      # request to filter on, the slash (/) in the URI counts as one character. For example, the URI
      # /logo.jpg is nine characters long.

      struct SizeConstraintStatement
        include JSON::Serializable

        # The operator to use to compare the request part to the size setting.

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # The size, in byte, to compare to the request part, after any transformations.

        @[JSON::Field(key: "Size")]
        getter size : Int64

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @comparison_operator : String,
          @field_to_match : Types::FieldToMatch,
          @size : Int64,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end

      # A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web
      # requests to do things like modify your database or extract data from it.

      struct SqliMatchStatement
        include JSON::Serializable

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        # The sensitivity that you want WAF to use to inspect for SQL injection attacks. HIGH detects more
        # attacks, but might generate more false positives, especially if your web requests frequently contain
        # unusual strings. For information about identifying and mitigating false positives, see Testing and
        # tuning in the WAF Developer Guide . LOW is generally a better choice for resources that already have
        # other protections against SQL injection attacks or that have a low tolerance for false positives.
        # Default: LOW

        @[JSON::Field(key: "SensitivityLevel")]
        getter sensitivity_level : String?

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @text_transformations : Array(Types::TextTransformation),
          @sensitivity_level : String? = nil
        )
        end
      end

      # The processing guidance for a Rule , used by WAF to determine whether a web request matches the
      # rule. For example specifications, see the examples section of CreateWebACL .

      struct Statement
        include JSON::Serializable

        # A logical rule statement used to combine other rule statements with AND logic. You provide more than
        # one Statement within the AndStatement .

        @[JSON::Field(key: "AndStatement")]
        getter and_statement : Types::AndStatement?

        # A rule statement that inspects web traffic based on the Autonomous System Number (ASN) associated
        # with the request's IP address. For additional details, see ASN match rule statement in the WAF
        # Developer Guide .

        @[JSON::Field(key: "AsnMatchStatement")]
        getter asn_match_statement : Types::AsnMatchStatement?

        # A rule statement that defines a string match search for WAF to apply to web requests. The byte match
        # statement provides the bytes to search for, the location in requests that you want WAF to search,
        # and other settings. The bytes to search for are typically a string that corresponds with ASCII
        # characters. In the WAF console and the developer guide, this is called a string match statement.

        @[JSON::Field(key: "ByteMatchStatement")]
        getter byte_match_statement : Types::ByteMatchStatement?

        # A rule statement that labels web requests by country and region and that matches against web
        # requests based on country code. A geo match rule labels every request that it inspects regardless of
        # whether it finds a match. To manage requests only by country, you can use this statement by itself
        # and specify the countries that you want to match against in the CountryCodes array. Otherwise,
        # configure your geo match rule with Count action so that it only labels requests. Then, add one or
        # more label match rules to run after the geo match rule and configure them to match against the
        # geographic labels and handle the requests as needed. WAF labels requests using the alpha-2 country
        # and region codes from the International Organization for Standardization (ISO) 3166 standard. WAF
        # determines the codes using either the IP address in the web request origin or, if you specify it,
        # the address in the geo match ForwardedIPConfig . If you use the web request origin, the label
        # formats are awswaf:clientip:geo:region:&lt;ISO country code&gt;-&lt;ISO region code&gt; and
        # awswaf:clientip:geo:country:&lt;ISO country code&gt; . If you use a forwarded IP address, the label
        # formats are awswaf:forwardedip:geo:region:&lt;ISO country code&gt;-&lt;ISO region code&gt; and
        # awswaf:forwardedip:geo:country:&lt;ISO country code&gt; . For additional details, see Geographic
        # match rule statement in the WAF Developer Guide .

        @[JSON::Field(key: "GeoMatchStatement")]
        getter geo_match_statement : Types::GeoMatchStatement?

        # A rule statement used to detect web requests coming from particular IP addresses or address ranges.
        # To use this, create an IPSet that specifies the addresses you want to detect, then use the ARN of
        # that set in this statement. To create an IP set, see CreateIPSet . Each IP set rule statement
        # references an IP set. You create and maintain the set independent of your rules. This allows you to
        # use the single set in multiple rules. When you update the referenced set, WAF automatically updates
        # all rules that reference it.

        @[JSON::Field(key: "IPSetReferenceStatement")]
        getter ip_set_reference_statement : Types::IPSetReferenceStatement?

        # A rule statement to match against labels that have been added to the web request by rules that have
        # already run in the web ACL. The label match statement provides the label or namespace string to
        # search for. The label string can represent a part or all of the fully qualified label name that had
        # been added to the web request. Fully qualified labels have a prefix, optional namespaces, and label
        # name. The prefix identifies the rule group or web ACL context of the rule that added the label. If
        # you do not provide the fully qualified name in your label match string, WAF performs the search for
        # labels that were added in the same context as the label match statement.

        @[JSON::Field(key: "LabelMatchStatement")]
        getter label_match_statement : Types::LabelMatchStatement?

        # A rule statement used to run the rules that are defined in a managed rule group. To use this,
        # provide the vendor name and the name of the rule group in this statement. You can retrieve the
        # required names by calling ListAvailableManagedRuleGroups . You cannot nest a
        # ManagedRuleGroupStatement , for example for use inside a NotStatement or OrStatement . You cannot
        # use a managed rule group inside another rule group. You can only reference a managed rule group as a
        # top-level statement within a rule that you define in a web ACL. You are charged additional fees when
        # you use the WAF Bot Control managed rule group AWSManagedRulesBotControlRuleSet , the WAF Fraud
        # Control account takeover prevention (ATP) managed rule group AWSManagedRulesATPRuleSet , or the WAF
        # Fraud Control account creation fraud prevention (ACFP) managed rule group AWSManagedRulesACFPRuleSet
        # . For more information, see WAF Pricing .

        @[JSON::Field(key: "ManagedRuleGroupStatement")]
        getter managed_rule_group_statement : Types::ManagedRuleGroupStatement?

        # A logical rule statement used to negate the results of another rule statement. You provide one
        # Statement within the NotStatement .

        @[JSON::Field(key: "NotStatement")]
        getter not_statement : Types::NotStatement?

        # A logical rule statement used to combine other rule statements with OR logic. You provide more than
        # one Statement within the OrStatement .

        @[JSON::Field(key: "OrStatement")]
        getter or_statement : Types::OrStatement?

        # A rate-based rule counts incoming requests and rate limits requests when they are coming at too fast
        # a rate. The rule categorizes requests according to your aggregation criteria, collects them into
        # aggregation instances, and counts and rate limits the requests for each instance. If you change any
        # of these settings in a rule that's currently in use, the change resets the rule's rate limiting
        # counts. This can pause the rule's rate limiting activities for up to a minute. You can specify
        # individual aggregation keys, like IP address or HTTP method. You can also specify aggregation key
        # combinations, like IP address and HTTP method, or HTTP method, query argument, and cookie. Each
        # unique set of values for the aggregation keys that you specify is a separate aggregation instance,
        # with the value from each key contributing to the aggregation instance definition. For example,
        # assume the rule evaluates web requests with the following IP address and HTTP method values: IP
        # address 10.1.1.1, HTTP method POST IP address 10.1.1.1, HTTP method GET IP address 127.0.0.0, HTTP
        # method POST IP address 10.1.1.1, HTTP method GET The rule would create different aggregation
        # instances according to your aggregation criteria, for example: If the aggregation criteria is just
        # the IP address, then each individual address is an aggregation instance, and WAF counts requests
        # separately for each. The aggregation instances and request counts for our example would be the
        # following: IP address 10.1.1.1: count 3 IP address 127.0.0.0: count 1 If the aggregation criteria is
        # HTTP method, then each individual HTTP method is an aggregation instance. The aggregation instances
        # and request counts for our example would be the following: HTTP method POST: count 2 HTTP method
        # GET: count 2 If the aggregation criteria is IP address and HTTP method, then each IP address and
        # each HTTP method would contribute to the combined aggregation instance. The aggregation instances
        # and request counts for our example would be the following: IP address 10.1.1.1, HTTP method POST:
        # count 1 IP address 10.1.1.1, HTTP method GET: count 2 IP address 127.0.0.0, HTTP method POST: count
        # 1 For any n-tuple of aggregation keys, each unique combination of values for the keys defines a
        # separate aggregation instance, which WAF counts and rate-limits individually. You can optionally
        # nest another statement inside the rate-based statement, to narrow the scope of the rule so that it
        # only counts and rate limits requests that match the nested statement. You can use this nested
        # scope-down statement in conjunction with your aggregation key specifications or you can just count
        # and rate limit all requests that match the scope-down statement, without additional aggregation.
        # When you choose to just manage all requests that match a scope-down statement, the aggregation
        # instance is singular for the rule. You cannot nest a RateBasedStatement inside another statement,
        # for example inside a NotStatement or OrStatement . You can define a RateBasedStatement inside a web
        # ACL and inside a rule group. For additional information about the options, see Rate limiting web
        # requests using rate-based rules in the WAF Developer Guide . If you only aggregate on the individual
        # IP address or forwarded IP address, you can retrieve the list of IP addresses that WAF is currently
        # rate limiting for a rule through the API call GetRateBasedStatementManagedKeys . This option is not
        # available for other aggregation configurations. WAF tracks and manages web requests separately for
        # each instance of a rate-based rule that you use. For example, if you provide the same rate-based
        # rule settings in two web ACLs, each of the two rule statements represents a separate instance of the
        # rate-based rule and gets its own tracking and management by WAF. If you define a rate-based rule
        # inside a rule group, and then use that rule group in multiple places, each use creates a separate
        # instance of the rate-based rule that gets its own tracking and management by WAF.

        @[JSON::Field(key: "RateBasedStatement")]
        getter rate_based_statement : Types::RateBasedStatement?

        # A rule statement used to search web request components for a match against a single regular
        # expression.

        @[JSON::Field(key: "RegexMatchStatement")]
        getter regex_match_statement : Types::RegexMatchStatement?

        # A rule statement used to search web request components for matches with regular expressions. To use
        # this, create a RegexPatternSet that specifies the expressions that you want to detect, then use the
        # ARN of that set in this statement. A web request matches the pattern set rule statement if the
        # request component matches any of the patterns in the set. To create a regex pattern set, see
        # CreateRegexPatternSet . Each regex pattern set rule statement references a regex pattern set. You
        # create and maintain the set independent of your rules. This allows you to use the single set in
        # multiple rules. When you update the referenced set, WAF automatically updates all rules that
        # reference it.

        @[JSON::Field(key: "RegexPatternSetReferenceStatement")]
        getter regex_pattern_set_reference_statement : Types::RegexPatternSetReferenceStatement?

        # A rule statement used to run the rules that are defined in a RuleGroup . To use this, create a rule
        # group with your rules, then provide the ARN of the rule group in this statement. You cannot nest a
        # RuleGroupReferenceStatement , for example for use inside a NotStatement or OrStatement . You cannot
        # use a rule group reference statement inside another rule group. You can only reference a rule group
        # as a top-level statement within a rule that you define in a web ACL.

        @[JSON::Field(key: "RuleGroupReferenceStatement")]
        getter rule_group_reference_statement : Types::RuleGroupReferenceStatement?

        # A rule statement that compares a number of bytes against the size of a request component, using a
        # comparison operator, such as greater than (&gt;) or less than (&lt;). For example, you can use a
        # size constraint statement to look for query strings that are longer than 100 bytes. If you configure
        # WAF to inspect the request body, WAF inspects only the number of bytes in the body up to the limit
        # for the web ACL and protected resource type. If you know that the request body for your web requests
        # should never exceed the inspection limit, you can use a size constraint statement to block requests
        # that have a larger request body size. For more information about the inspection limits, see Body and
        # JsonBody settings for the FieldToMatch data type. If you choose URI for the value of Part of the
        # request to filter on, the slash (/) in the URI counts as one character. For example, the URI
        # /logo.jpg is nine characters long.

        @[JSON::Field(key: "SizeConstraintStatement")]
        getter size_constraint_statement : Types::SizeConstraintStatement?

        # A rule statement that inspects for malicious SQL code. Attackers insert malicious SQL code into web
        # requests to do things like modify your database or extract data from it.

        @[JSON::Field(key: "SqliMatchStatement")]
        getter sqli_match_statement : Types::SqliMatchStatement?

        # A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker
        # uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into
        # other legitimate web browsers.

        @[JSON::Field(key: "XssMatchStatement")]
        getter xss_match_statement : Types::XssMatchStatement?

        def initialize(
          @and_statement : Types::AndStatement? = nil,
          @asn_match_statement : Types::AsnMatchStatement? = nil,
          @byte_match_statement : Types::ByteMatchStatement? = nil,
          @geo_match_statement : Types::GeoMatchStatement? = nil,
          @ip_set_reference_statement : Types::IPSetReferenceStatement? = nil,
          @label_match_statement : Types::LabelMatchStatement? = nil,
          @managed_rule_group_statement : Types::ManagedRuleGroupStatement? = nil,
          @not_statement : Types::NotStatement? = nil,
          @or_statement : Types::OrStatement? = nil,
          @rate_based_statement : Types::RateBasedStatement? = nil,
          @regex_match_statement : Types::RegexMatchStatement? = nil,
          @regex_pattern_set_reference_statement : Types::RegexPatternSetReferenceStatement? = nil,
          @rule_group_reference_statement : Types::RuleGroupReferenceStatement? = nil,
          @size_constraint_statement : Types::SizeConstraintStatement? = nil,
          @sqli_match_statement : Types::SqliMatchStatement? = nil,
          @xss_match_statement : Types::XssMatchStatement? = nil
        )
        end
      end

      # A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to
      # categorize and manage your resources, for purposes like billing or other management. Typically, the
      # tag key represents a category, such as "environment", and the tag value represents a specific value
      # within that category, such as "test," "development," or "production". Or you might set the tag key
      # to "customer" and the value to the customer name or ID. You can specify one or more tags to add to
      # each Amazon Web Services resource, up to 50 tags for a resource. You can tag the Amazon Web Services
      # resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You
      # can't manage or view tags through the WAF console.

      struct Tag
        include JSON::Serializable

        # Part of the key:value pair that defines a tag. You can use a tag key to describe a category of
        # information, such as "customer." Tag keys are case-sensitive.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value
        # within a category, such as "companyA" or "companyB." Tag values are case-sensitive.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # The collection of tagging definitions for an Amazon Web Services resource. Tags are key:value pairs
      # that you can use to categorize and manage your resources, for purposes like billing or other
      # management. Typically, the tag key represents a category, such as "environment", and the tag value
      # represents a specific value within that category, such as "test," "development," or "production". Or
      # you might set the tag key to "customer" and the value to the customer name or ID. You can specify
      # one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource. You can
      # tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets,
      # and regex pattern sets. You can't manage or view tags through the WAF console.

      struct TagInfoForResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?

        # The array of Tag objects defined for the resource.

        @[JSON::Field(key: "TagList")]
        getter tag_list : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tag_list : Array(Types::Tag)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # An array of key:value pairs to associate with the resource.

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

      # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
      # an effort to bypass detection.

      struct TextTransformation
        include JSON::Serializable

        # Sets the relative processing order for multiple transformations. WAF processes all transformations,
        # from lowest priority to highest, before inspecting the transformed content. The priorities don't
        # need to be consecutive, but they must all be different.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # For detailed descriptions of each of the transformation types, see Text transformations in the WAF
        # Developer Guide .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @priority : Int32,
          @type : String
        )
        end
      end

      # In a GetSampledRequests request, the StartTime and EndTime objects specify the time range for which
      # you want WAF to return a sample of web requests. You must specify the times in Coordinated Universal
      # Time (UTC) format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z"
      # . You can specify any time range in the previous three hours. In a GetSampledRequests response, the
      # StartTime and EndTime objects specify the time range for which WAF actually returned a sample of web
      # requests. WAF gets the specified number of requests from among the first 5,000 requests that your
      # Amazon Web Services resource receives during the specified time period. If your resource receives
      # more than 5,000 requests during that period, WAF stops sampling after the 5,000th request. In that
      # case, EndTime is the time that WAF received the 5,000th request.

      struct TimeWindow
        include JSON::Serializable

        # The end of the time range from which you want GetSampledRequests to return a sample of the requests
        # that your Amazon Web Services resource received. You must specify the times in Coordinated Universal
        # Time (UTC) format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z"
        # . You can specify any time range in the previous three hours.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The beginning of the time range from which you want GetSampledRequests to return a sample of the
        # requests that your Amazon Web Services resource received. You must specify the times in Coordinated
        # Universal Time (UTC) format. UTC format includes the special designator, Z . For example,
        # "2016-09-27T14:50Z" . You can specify any time range in the previous three hours.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # An array of keys identifying the tags to disassociate from the resource.

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


      struct UpdateIPSetRequest
        include JSON::Serializable

        # Contains an array of strings that specifies zero or more IP addresses or blocks of IP addresses that
        # you want WAF to inspect for in incoming requests. All addresses must be specified using Classless
        # Inter-Domain Routing (CIDR) notation. WAF supports all IPv4 and IPv6 CIDR ranges except for /0 .
        # Example address strings: For requests that originated from the IP address 192.0.2.44, specify
        # 192.0.2.44/32 . For requests that originated from IP addresses from 192.0.2.0 to 192.0.2.255,
        # specify 192.0.2.0/24 . For requests that originated from the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . For
        # requests that originated from IP addresses 1111:0000:0000:0000:0000:0000:0000:0000 to
        # 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify 1111:0000:0000:0000:0000:0000:0000:0000/64 . For
        # more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing .
        # Example JSON Addresses specifications: Empty array: "Addresses": [] Array with one address:
        # "Addresses": ["192.0.2.44/32"] Array with three addresses: "Addresses": ["192.0.2.44/32",
        # "192.0.2.0/24", "192.0.0.0/16"] INVALID specification: "Addresses": [""] INVALID

        @[JSON::Field(key: "Addresses")]
        getter addresses : Array(String)

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the IP set. You cannot change the name of an IPSet after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # A description of the IP set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @addresses : Array(String),
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateIPSetResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns this token to your update requests. You use
        # NextLockToken in the same manner as you use LockToken .

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @next_lock_token : String? = nil
        )
        end
      end


      struct UpdateManagedRuleSetVersionExpiryDateRequest
        include JSON::Serializable

        # The time that you want the version to expire. Times are in Coordinated Universal Time (UTC) format.
        # UTC format includes the special designator, Z. For example, "2016-09-27T14:50Z".

        @[JSON::Field(key: "ExpiryTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry_timestamp : Time

        # A unique identifier for the managed rule set. The ID is returned in the responses to commands like
        # list . You provide it to operations like get and update .

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the managed rule set. You use this, along with the rule set ID, to identify the rule
        # set. This name is assigned to the corresponding managed rule group, which your customers can access
        # and use.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # The version that you want to remove from your list of offerings for the named managed rule group.

        @[JSON::Field(key: "VersionToExpire")]
        getter version_to_expire : String

        def initialize(
          @expiry_timestamp : Time,
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String,
          @version_to_expire : String
        )
        end
      end


      struct UpdateManagedRuleSetVersionExpiryDateResponse
        include JSON::Serializable

        # The version that is set to expire.

        @[JSON::Field(key: "ExpiringVersion")]
        getter expiring_version : String?

        # The time that the version will expire. Times are in Coordinated Universal Time (UTC) format. UTC
        # format includes the special designator, Z. For example, "2016-09-27T14:50Z".

        @[JSON::Field(key: "ExpiryTimestamp", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiry_timestamp : Time?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @expiring_version : String? = nil,
          @expiry_timestamp : Time? = nil,
          @next_lock_token : String? = nil
        )
        end
      end


      struct UpdateRegexPatternSetRequest
        include JSON::Serializable

        # A unique identifier for the set. This ID is returned in the responses to create and list commands.
        # You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the set. You cannot change the name after you create the set.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "RegularExpressionList")]
        getter regular_expression_list : Array(Types::Regex)

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # A description of the set that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @regular_expression_list : Array(Types::Regex),
          @scope : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateRegexPatternSetResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns this token to your update requests. You use
        # NextLockToken in the same manner as you use LockToken .

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @next_lock_token : String? = nil
        )
        end
      end


      struct UpdateRuleGroupRequest
        include JSON::Serializable

        # A unique identifier for the rule group. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the rule group. You cannot change the name of a rule group after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the rule group, and then use
        # them in the rules that you define in the rule group. For information about customizing web requests
        # and responses, see Customizing web requests and responses in WAF in the WAF Developer Guide . For
        # information about the limits on count and size for custom request and response settings, see WAF
        # quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # A description of the rule group that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String,
          @visibility_config : Types::VisibilityConfig,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @description : String? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct UpdateRuleGroupResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns this token to your update requests. You use
        # NextLockToken in the same manner as you use LockToken .

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @next_lock_token : String? = nil
        )
        end
      end


      struct UpdateWebACLRequest
        include JSON::Serializable

        # The action to perform if none of the Rules contained in the WebACL match.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::DefaultAction

        # The unique identifier for the web ACL. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies whether this is for a global resource type, such as a Amazon CloudFront distribution. For
        # an Amplify application, use CLOUDFRONT . To work with CloudFront, you must also specify the Region
        # US East (N. Virginia) as follows: CLI - Specify the Region when you use the CloudFront scope:
        # --scope=CLOUDFRONT --region=us-east-1 . API and SDKs - For all calls, use the Region endpoint
        # us-east-1.

        @[JSON::Field(key: "Scope")]
        getter scope : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # Configures the ability for the WAF console to store and retrieve application attributes. Application
        # attributes help WAF give recommendations for protection packs. When using UpdateWebACL ,
        # ApplicationConfig follows these rules: If you omit ApplicationConfig from the request, all existing
        # entries in the web ACL are retained. If you include ApplicationConfig , entries must match the
        # existing values exactly. Any attempt to modify existing entries will result in an error.

        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # Specifies custom configurations for the associations between the web ACL and protected resources.
        # Use this to customize the maximum size of the request body that your protected resources forward to
        # WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App
        # Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). You are charged
        # additional fees when your protected resources forward body sizes that are larger than the default.
        # For more information, see WAF Pricing . For Application Load Balancer and AppSync, the limit is
        # fixed at 8 KB (8,192 bytes).

        @[JSON::Field(key: "AssociationConfig")]
        getter association_config : Types::AssociationConfig?

        # Specifies how WAF should handle CAPTCHA evaluations for rules that don't have their own
        # CaptchaConfig settings. If you don't specify this, WAF uses its default settings for CaptchaConfig .

        @[JSON::Field(key: "CaptchaConfig")]
        getter captcha_config : Types::CaptchaConfig?

        # Specifies how WAF should handle challenge evaluations for rules that don't have their own
        # ChallengeConfig settings. If you don't specify this, WAF uses its default settings for
        # ChallengeConfig .

        @[JSON::Field(key: "ChallengeConfig")]
        getter challenge_config : Types::ChallengeConfig?

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the web ACL, and then use them
        # in the rules and default actions that you define in the web ACL. For information about customizing
        # web requests and responses, see Customizing web requests and responses in WAF in the WAF Developer
        # Guide . For information about the limits on count and size for custom request and response settings,
        # see WAF quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level
        # data protection option. The data protection that you configure for the web ACL alters the data
        # that's available for any other data collection activity, including your WAF logging destinations,
        # web ACL request sampling, and Amazon Security Lake data collection and management. Your other option
        # for data protection is in the logging configuration, which only affects logging.

        @[JSON::Field(key: "DataProtectionConfig")]
        getter data_protection_config : Types::DataProtectionConfig?

        # A description of the web ACL that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies the type of DDoS protection to apply to web request data for a web ACL. For most
        # scenarios, it is recommended to use the default protection level, ACTIVE_UNDER_DDOS . If a web ACL
        # is associated with multiple Application Load Balancers, the changes you make to DDoS protection in
        # that web ACL will apply to all associated Application Load Balancers.

        @[JSON::Field(key: "OnSourceDDoSProtectionConfig")]
        getter on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # Specifies the domains that WAF should accept in a web request token. This enables the use of tokens
        # across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web
        # Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF
        # accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts
        # the resource's host domain plus all domains in the token domain list, including their prefixed
        # subdomains. Example JSON: "TokenDomains": { "mywebsite.com", "myotherwebsite.com" } Public suffixes
        # aren't allowed. For example, you can't use gov.au or co.uk as token domains.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)?

        def initialize(
          @default_action : Types::DefaultAction,
          @id : String,
          @lock_token : String,
          @name : String,
          @scope : String,
          @visibility_config : Types::VisibilityConfig,
          @application_config : Types::ApplicationConfig? = nil,
          @association_config : Types::AssociationConfig? = nil,
          @captcha_config : Types::CaptchaConfig? = nil,
          @challenge_config : Types::ChallengeConfig? = nil,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @data_protection_config : Types::DataProtectionConfig? = nil,
          @description : String? = nil,
          @on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig? = nil,
          @rules : Array(Types::Rule)? = nil,
          @token_domains : Array(String)? = nil
        )
        end
      end


      struct UpdateWebACLResponse
        include JSON::Serializable

        # A token used for optimistic locking. WAF returns this token to your update requests. You use
        # NextLockToken in the same manner as you use LockToken .

        @[JSON::Field(key: "NextLockToken")]
        getter next_lock_token : String?

        def initialize(
          @next_lock_token : String? = nil
        )
        end
      end

      # Inspect fragments of the request URI. You can specify the parts of the URI fragment to inspect and
      # you can narrow the set of URI fragments to inspect by including or excluding specific keys. This is
      # used to indicate the web request component to inspect, in the FieldToMatch specification. Example
      # JSON: "UriFragment": { "MatchPattern": { "All": {} }, "MatchScope": "KEY", "OversizeHandling":
      # "MATCH" }

      struct UriFragment
        include JSON::Serializable

        # What WAF should do if it fails to completely parse the JSON body. The options are the following:
        # EVALUATE_AS_STRING - Inspect the body as plain text. WAF applies the text transformations and
        # inspection criteria that you defined for the JSON inspection to the body text string. MATCH - Treat
        # the web request as matching the rule statement. WAF applies the rule action to the request. NO_MATCH
        # - Treat the web request as not matching the rule statement. If you don't provide this setting, WAF
        # parses and evaluates the content only up to the first parsing failure that it encounters. Example
        # JSON: { "UriFragment": { "FallbackBehavior": "MATCH"} } WAF parsing doesn't fully validate the input
        # JSON string, so parsing can succeed even for invalid JSON. When parsing succeeds, WAF doesn't apply
        # the fallback behavior. For more information, see JSON body in the WAF Developer Guide .

        @[JSON::Field(key: "FallbackBehavior")]
        getter fallback_behavior : String?

        def initialize(
          @fallback_behavior : String? = nil
        )
        end
      end

      # Inspect the path component of the URI of the web request. This is the part of the web request that
      # identifies a resource. For example, /images/daily-ad.jpg . This is used in the FieldToMatch
      # specification for some web request component types. JSON specification: "UriPath": {}

      struct UriPath
        include JSON::Serializable

        def initialize
        end
      end

      # The name of the field in the request payload that contains your customer's username. This data type
      # is used in the RequestInspection and RequestInspectionACFP data types.

      struct UsernameField
        include JSON::Serializable

        # The name of the username field. How you specify this depends on the request inspection payload type.
        # For JSON payloads, specify the field name in JSON pointer syntax. For information about the JSON
        # Pointer syntax, see the Internet Engineering Task Force (IETF) documentation JavaScript Object
        # Notation (JSON) Pointer . For example, for the JSON payload { "form": { "username": "THE_USERNAME" }
        # } , the username field specification is /form/username . For form encoded payload types, use the
        # HTML form names. For example, for an HTML form with the input element named username1 , the username
        # field specification is username1

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # A version of the named managed rule group, that the rule group's vendor publishes for use by
      # customers. This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web
      # Services and Amazon Web Services Marketplace sellers. Vendors, you can use the managed rule set APIs
      # to provide controlled rollout of your versioned managed rule group offerings for your customers. The
      # APIs are ListManagedRuleSets , GetManagedRuleSet , PutManagedRuleSetVersions , and
      # UpdateManagedRuleSetVersionExpiryDate .

      struct VersionToPublish
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the vendor's rule group that's used in the published managed rule
        # group version.

        @[JSON::Field(key: "AssociatedRuleGroupArn")]
        getter associated_rule_group_arn : String?

        # The amount of time the vendor expects this version of the managed rule group to last, in days.

        @[JSON::Field(key: "ForecastedLifetime")]
        getter forecasted_lifetime : Int32?

        def initialize(
          @associated_rule_group_arn : String? = nil,
          @forecasted_lifetime : Int32? = nil
        )
        end
      end

      # Defines and enables Amazon CloudWatch metrics and web request sample collection.

      struct VisibilityConfig
        include JSON::Serializable

        # Indicates whether the associated resource sends metrics to Amazon CloudWatch. For the list of
        # available metrics, see WAF Metrics in the WAF Developer Guide . For web ACLs, the metrics are for
        # web requests that have the web ACL default action applied. WAF applies the default action to web
        # requests that pass the inspection of all rules in the web ACL without being either allowed or
        # blocked. For more information, see The web ACL default action in the WAF Developer Guide .

        @[JSON::Field(key: "CloudWatchMetricsEnabled")]
        getter cloud_watch_metrics_enabled : Bool

        # A name of the Amazon CloudWatch metric dimension. The name can contain only the characters: A-Z,
        # a-z, 0-9, - (hyphen), and _ (underscore). The name can be from one to 128 characters long. It can't
        # contain whitespace or metric names that are reserved for WAF, for example All and Default_Action .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # Indicates whether WAF should store a sampling of the web requests that match the rules. You can view
        # the sampled requests through the WAF console. If you configure data protection for the web ACL, the
        # protection applies to the web ACL's sampled web request data. Request sampling doesn't provide a
        # field redaction option, and any field redaction that you specify in your logging configuration
        # doesn't affect sampling. You can only exclude fields from request sampling by disabling sampling in
        # the web ACL visibility configuration or by configuring data protection for the web ACL.

        @[JSON::Field(key: "SampledRequestsEnabled")]
        getter sampled_requests_enabled : Bool

        def initialize(
          @cloud_watch_metrics_enabled : Bool,
          @metric_name : String,
          @sampled_requests_enabled : Bool
        )
        end
      end

      # WAF couldn’t perform the operation because your resource is being used by another resource or it’s
      # associated with another resource.

      struct WAFAssociatedItemException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you are inspecting the web request body, headers, or cookies without
      # specifying how to handle oversize components. Rules that inspect the body must either provide an
      # OversizeHandling configuration or they must be preceded by a SizeConstraintStatement that blocks the
      # body content from being too large. Rules that inspect the headers or cookies must provide an
      # OversizeHandling configuration. Provide the handling configuration and retry your operation.
      # Alternately, you can suppress this warning by adding the following tag to the resource that you
      # provide to this operation: Tag (key: WAF:OversizeFieldsHandlingConstraintOptOut , value: true ).

      struct WAFConfigurationWarningException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t perform the operation because the resource that you tried to save is a duplicate of an
      # existing one.

      struct WAFDuplicateItemException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because the specified version for the managed rule group has expired. You can
      # retrieve the available versions for the managed rule group by calling
      # ListAvailableManagedRuleGroupVersions .

      struct WAFExpiredManagedRuleGroupVersionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because the specified WAF feature isn't supported by the CloudFront pricing
      # plan associated with the web ACL.

      struct WAFFeatureNotIncludedInPricingPlanException
        include JSON::Serializable

        # The names of the disallowed WAF features.

        @[JSON::Field(key: "DisallowedFeatures")]
        getter disallowed_features : Array(Types::DisallowedFeature)?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @disallowed_features : Array(Types::DisallowedFeature)? = nil,
          @message : String? = nil
        )
        end
      end

      # Your request is valid, but WAF couldn’t perform the operation because of a system problem. Retry
      # your request.

      struct WAFInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation isn't valid.

      struct WAFInvalidOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because WAF didn't recognize a parameter in the request. For example: You
      # specified a parameter name or value that isn't valid. Your nested statement isn't valid. You might
      # have tried to nest a statement that can’t be nested. You tried to update a WebACL with a
      # DefaultAction that isn't among the types available at DefaultAction . Your request references an ARN
      # that is malformed, or corresponds to a resource with which a web ACL can't be associated.

      struct WAFInvalidParameterException
        include JSON::Serializable

        # The settings where the invalid parameter was found.

        @[JSON::Field(key: "Field")]
        getter field : String?

        # The invalid parameter that resulted in the exception.

        @[JSON::Field(key: "Parameter")]
        getter parameter : String?

        # Additional information about the exception.

        @[JSON::Field(key: "Reason")]
        getter reason : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @field : String? = nil,
          @parameter : String? = nil,
          @reason : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The operation failed because the specified policy isn't in the proper format. The policy
      # specifications must conform to the following: The policy must be composed using IAM Policy version
      # 2012-10-17. The policy must include specifications for Effect , Action , and Principal . Effect must
      # specify Allow . Action must specify wafv2:CreateWebACL , wafv2:UpdateWebACL , and
      # wafv2:PutFirewallManagerRuleGroups and may optionally specify wafv2:GetRuleGroup . WAF rejects any
      # extra actions or wildcard actions in the policy. The policy must not include a Resource parameter.
      # For more information, see IAM Policies .

      struct WAFInvalidPermissionPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t perform the operation because the resource that you requested isn’t valid. Check the
      # resource, and try again.

      struct WAFInvalidResourceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t perform the operation because you exceeded your resource limit. For example, the
      # maximum number of WebACL objects that you can create for an Amazon Web Services account. For more
      # information, see WAF quotas in the WAF Developer Guide .

      struct WAFLimitsExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # Source type for the exception.

        @[JSON::Field(key: "SourceType")]
        getter source_type : String?

        def initialize(
          @message : String? = nil,
          @source_type : String? = nil
        )
        end
      end

      # The operation failed because you don't have the permissions that your logging configuration
      # requires. For information, see Logging web ACL traffic information in the WAF Developer Guide .

      struct WAFLogDestinationPermissionIssueException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t perform the operation because your resource doesn't exist. If you've just created a
      # resource that you're using in this operation, you might just need to wait a few minutes. It can take
      # from a few seconds to a number of minutes for changes to propagate.

      struct WAFNonexistentItemException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t save your changes because you tried to update or delete a resource that has changed
      # since you last retrieved it. Get the resource again, make any changes you need to make to the new
      # copy, and retry your operation.

      struct WAFOptimisticLockException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF is not able to access the service linked role. This can be caused by a previous
      # PutLoggingConfiguration request, which can lock the service linked role for about 20 seconds. Please
      # try your request again. The service linked role can also be locked by a previous
      # DeleteServiceLinkedRole request, which can lock the role for 15 minutes or more. If you recently
      # made a call to DeleteServiceLinkedRole , wait at least 15 minutes and try the request again. If you
      # receive this same exception again, you will have to wait additional time until the role is unlocked.

      struct WAFServiceLinkedRoleErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You tried to use a managed rule group that's available by subscription, but you aren't subscribed to
      # it yet.

      struct WAFSubscriptionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error occurred during the tagging operation. Retry your request.

      struct WAFTagOperationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t perform your tagging operation because of an internal error. Retry your request.

      struct WAFTagOperationInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # WAF couldn’t retrieve a resource that you specified for this operation. If you've just created a
      # resource that you're using in this operation, you might just need to wait a few minutes. It can take
      # from a few seconds to a number of minutes for changes to propagate. Verify the resource
      # specifications in your request parameters and then retry the operation.

      struct WAFUnavailableEntityException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The rule that you've named doesn't aggregate solely on the IP address or solely on the forwarded IP
      # address. This call is only available for rate-based rules with an AggregateKeyType setting of IP or
      # FORWARDED_IP .

      struct WAFUnsupportedAggregateKeyTypeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a
      # statement that defines what to look for in web requests and an action that WAF applies to requests
      # that match the statement. In the web ACL, you assign a default action to take (allow, block) for any
      # request that does not match any of the rules. The rules in a web ACL can be a combination of the
      # types Rule , RuleGroup , and managed rule group. You can associate a web ACL with one or more Amazon
      # Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon
      # API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App
      # Runner service, Amplify application, and Amazon Web Services Verified Access instance.

      struct WebACL
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL that you want to associate with the resource.

        @[JSON::Field(key: "ARN")]
        getter arn : String

        # The action to perform if none of the Rules contained in the WebACL match.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::DefaultAction

        # A unique identifier for the WebACL . This ID is returned in the responses to create and list
        # commands. You use this ID to do things like get, update, and delete a WebACL .

        @[JSON::Field(key: "Id")]
        getter id : String

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Defines and enables Amazon CloudWatch metrics and web request sample collection.

        @[JSON::Field(key: "VisibilityConfig")]
        getter visibility_config : Types::VisibilityConfig

        # Returns a list of ApplicationAttribute s.

        @[JSON::Field(key: "ApplicationConfig")]
        getter application_config : Types::ApplicationConfig?

        # Specifies custom configurations for the associations between the web ACL and protected resources.
        # Use this to customize the maximum size of the request body that your protected resources forward to
        # WAF for inspection. You can customize this setting for CloudFront, API Gateway, Amazon Cognito, App
        # Runner, or Verified Access resources. The default setting is 16 KB (16,384 bytes). You are charged
        # additional fees when your protected resources forward body sizes that are larger than the default.
        # For more information, see WAF Pricing . For Application Load Balancer and AppSync, the limit is
        # fixed at 8 KB (8,192 bytes).

        @[JSON::Field(key: "AssociationConfig")]
        getter association_config : Types::AssociationConfig?

        # The web ACL capacity units (WCUs) currently being used by this web ACL. WAF uses WCUs to calculate
        # and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF
        # calculates capacity differently for each rule type, to reflect the relative cost of each rule.
        # Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing
        # power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when
        # they use a rule group. For more information, see WAF web ACL capacity units (WCU) in the WAF
        # Developer Guide .

        @[JSON::Field(key: "Capacity")]
        getter capacity : Int64?

        # Specifies how WAF should handle CAPTCHA evaluations for rules that don't have their own
        # CaptchaConfig settings. If you don't specify this, WAF uses its default settings for CaptchaConfig .

        @[JSON::Field(key: "CaptchaConfig")]
        getter captcha_config : Types::CaptchaConfig?

        # Specifies how WAF should handle challenge evaluations for rules that don't have their own
        # ChallengeConfig settings. If you don't specify this, WAF uses its default settings for
        # ChallengeConfig .

        @[JSON::Field(key: "ChallengeConfig")]
        getter challenge_config : Types::ChallengeConfig?

        # A map of custom response keys and content bodies. When you create a rule with a block action, you
        # can send a custom response to the web request. You define these for the web ACL, and then use them
        # in the rules and default actions that you define in the web ACL. For information about customizing
        # web requests and responses, see Customizing web requests and responses in WAF in the WAF Developer
        # Guide . For information about the limits on count and size for custom request and response settings,
        # see WAF quotas in the WAF Developer Guide .

        @[JSON::Field(key: "CustomResponseBodies")]
        getter custom_response_bodies : Hash(String, Types::CustomResponseBody)?

        # Specifies data protection to apply to the web request data for the web ACL. This is a web ACL level
        # data protection option. The data protection that you configure for the web ACL alters the data
        # that's available for any other data collection activity, including your WAF logging destinations,
        # web ACL request sampling, and Amazon Security Lake data collection and management. Your other option
        # for data protection is in the logging configuration, which only affects logging.

        @[JSON::Field(key: "DataProtectionConfig")]
        getter data_protection_config : Types::DataProtectionConfig?

        # A description of the web ACL that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The label namespace prefix for this web ACL. All labels added by rules in this web ACL have this
        # prefix. The syntax for the label namespace prefix for a web ACL is the following: awswaf:&lt;account
        # ID&gt;:webacl:&lt;web ACL name&gt;: When a rule with a label matches a web request, WAF adds the
        # fully qualified label to the request. A fully qualified label is made up of the label namespace from
        # the rule group or web ACL where the rule is defined and the label from the rule, separated by a
        # colon: &lt;label namespace&gt;:&lt;label from rule&gt;

        @[JSON::Field(key: "LabelNamespace")]
        getter label_namespace : String?

        # Indicates whether this web ACL was created by Firewall Manager and is being managed by Firewall
        # Manager. If true, then only Firewall Manager can delete the web ACL or any Firewall Manager rule
        # groups in the web ACL. See also the properties RetrofittedByFirewallManager ,
        # PreProcessFirewallManagerRuleGroups , and PostProcessFirewallManagerRuleGroups .

        @[JSON::Field(key: "ManagedByFirewallManager")]
        getter managed_by_firewall_manager : Bool?

        # Configures the level of DDoS protection that applies to web ACLs associated with Application Load
        # Balancers.

        @[JSON::Field(key: "OnSourceDDoSProtectionConfig")]
        getter on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig?

        # The last set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF
        # policy and contains only rule group references. You can't alter these. Any rules and rule groups
        # that you define for the web ACL are prioritized before these. In the Firewall Manager WAF policy,
        # the Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a
        # set of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to
        # determine their relative processing order.

        @[JSON::Field(key: "PostProcessFirewallManagerRuleGroups")]
        getter post_process_firewall_manager_rule_groups : Array(Types::FirewallManagerRuleGroup)?

        # The first set of rules for WAF to process in the web ACL. This is defined in an Firewall Manager WAF
        # policy and contains only rule group references. You can't alter these. Any rules and rule groups
        # that you define for the web ACL are prioritized after these. In the Firewall Manager WAF policy, the
        # Firewall Manager administrator can define a set of rule groups to run first in the web ACL and a set
        # of rule groups to run last. Within each set, the administrator prioritizes the rule groups, to
        # determine their relative processing order.

        @[JSON::Field(key: "PreProcessFirewallManagerRuleGroups")]
        getter pre_process_firewall_manager_rule_groups : Array(Types::FirewallManagerRuleGroup)?

        # Indicates whether this web ACL was created by a customer account and then retrofitted by Firewall
        # Manager. If true, then the web ACL is currently being managed by a Firewall Manager WAF policy, and
        # only Firewall Manager can manage any Firewall Manager rule groups in the web ACL. See also the
        # properties ManagedByFirewallManager , PreProcessFirewallManagerRuleGroups , and
        # PostProcessFirewallManagerRuleGroups .

        @[JSON::Field(key: "RetrofittedByFirewallManager")]
        getter retrofitted_by_firewall_manager : Bool?

        # The Rule statements used to identify the web requests that you want to manage. Each rule includes
        # one top-level statement that WAF uses to identify matching web requests, and parameters that govern
        # how WAF handles them.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        # Specifies the domains that WAF should accept in a web request token. This enables the use of tokens
        # across multiple protected websites. When WAF provides a token, it uses the domain of the Amazon Web
        # Services resource that the web ACL is protecting. If you don't specify a list of token domains, WAF
        # accepts tokens only for the domain of the protected resource. With a token domain list, WAF accepts
        # the resource's host domain plus all domains in the token domain list, including their prefixed
        # subdomains.

        @[JSON::Field(key: "TokenDomains")]
        getter token_domains : Array(String)?

        def initialize(
          @arn : String,
          @default_action : Types::DefaultAction,
          @id : String,
          @name : String,
          @visibility_config : Types::VisibilityConfig,
          @application_config : Types::ApplicationConfig? = nil,
          @association_config : Types::AssociationConfig? = nil,
          @capacity : Int64? = nil,
          @captcha_config : Types::CaptchaConfig? = nil,
          @challenge_config : Types::ChallengeConfig? = nil,
          @custom_response_bodies : Hash(String, Types::CustomResponseBody)? = nil,
          @data_protection_config : Types::DataProtectionConfig? = nil,
          @description : String? = nil,
          @label_namespace : String? = nil,
          @managed_by_firewall_manager : Bool? = nil,
          @on_source_d_do_s_protection_config : Types::OnSourceDDoSProtectionConfig? = nil,
          @post_process_firewall_manager_rule_groups : Array(Types::FirewallManagerRuleGroup)? = nil,
          @pre_process_firewall_manager_rule_groups : Array(Types::FirewallManagerRuleGroup)? = nil,
          @retrofitted_by_firewall_manager : Bool? = nil,
          @rules : Array(Types::Rule)? = nil,
          @token_domains : Array(String)? = nil
        )
        end
      end

      # High-level information about a WebACL , returned by operations like create and list. This provides
      # information like the ID, that you can use to retrieve and manage a WebACL , and the ARN, that you
      # provide to operations like AssociateWebACL .

      struct WebACLSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # A description of the web ACL that helps with identification.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier for the web ACL. This ID is returned in the responses to create and list
        # commands. You provide it to operations like update and delete.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # A token used for optimistic locking. WAF returns a token to your get and list requests, to mark the
        # state of the entity at the time of the request. To make changes to the entity associated with the
        # token, you provide the token to operations like update and delete . WAF uses the token to ensure
        # that no changes have been made to the entity since you last retrieved it. If a change has been made,
        # the update fails with a WAFOptimisticLockException . If this happens, perform another get , and use
        # the new token returned by that operation.

        @[JSON::Field(key: "LockToken")]
        getter lock_token : String?

        # The name of the web ACL. You cannot change the name of a web ACL after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @lock_token : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A rule statement that inspects for cross-site scripting (XSS) attacks. In XSS attacks, the attacker
      # uses vulnerabilities in a benign website as a vehicle to inject malicious client-site scripts into
      # other legitimate web browsers.

      struct XssMatchStatement
        include JSON::Serializable

        # The part of the web request that you want WAF to inspect.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass detection. Text transformations are used in rule match statements, to transform
        # the FieldToMatch request component before inspecting it, and they're used in rate-based rule
        # statements, to transform request components before using them as custom aggregation keys. If you
        # specify one or more transformations to apply, WAF performs all transformations on the specified
        # content, starting from the lowest priority setting, and then uses the transformed component
        # contents.

        @[JSON::Field(key: "TextTransformations")]
        getter text_transformations : Array(Types::TextTransformation)

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @text_transformations : Array(Types::TextTransformation)
        )
        end
      end
    end
  end
end
