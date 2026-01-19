module AwsSdk
  module WAF
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

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a ByteMatchSet . You then use UpdateByteMatchSet to identify the part of a web request that
      # you want AWS WAF to inspect, such as the values of the User-Agent header or the query string. For
      # example, you can create a ByteMatchSet that matches any requests with User-Agent headers that
      # contain the string BadBot . You can then configure AWS WAF to reject those requests. To create and
      # configure a ByteMatchSet , perform the following steps: Use GetChangeToken to get the change token
      # that you provide in the ChangeToken parameter of a CreateByteMatchSet request. Submit a
      # CreateByteMatchSet request. Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of an UpdateByteMatchSet request. Submit an UpdateByteMatchSet request to
      # specify the part of the request that you want AWS WAF to inspect (for example, the header or the
      # URI) and the value that you want AWS WAF to watch for. For more information about how to use the AWS
      # WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_byte_match_set(
        change_token : String,
        name : String
      ) : Types::CreateByteMatchSetResponse
        input = Types::CreateByteMatchSetRequest.new(change_token: change_token, name: name)
        create_byte_match_set(input)
      end
      def create_byte_match_set(input : Types::CreateByteMatchSetRequest) : Types::CreateByteMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_BYTE_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateByteMatchSetResponse, "CreateByteMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates an GeoMatchSet , which you use to specify which web requests you want to allow or block
      # based on the country that the requests originate from. For example, if you're receiving a lot of
      # requests from one or more countries and you want to block the requests, you can create an
      # GeoMatchSet that contains those countries and then configure AWS WAF to block the requests. To
      # create and configure a GeoMatchSet , perform the following steps: Use GetChangeToken to get the
      # change token that you provide in the ChangeToken parameter of a CreateGeoMatchSet request. Submit a
      # CreateGeoMatchSet request. Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of an UpdateGeoMatchSet request. Submit an UpdateGeoMatchSetSet request to
      # specify the countries that you want AWS WAF to watch for. For more information about how to use the
      # AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_geo_match_set(
        change_token : String,
        name : String
      ) : Types::CreateGeoMatchSetResponse
        input = Types::CreateGeoMatchSetRequest.new(change_token: change_token, name: name)
        create_geo_match_set(input)
      end
      def create_geo_match_set(input : Types::CreateGeoMatchSetRequest) : Types::CreateGeoMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_GEO_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateGeoMatchSetResponse, "CreateGeoMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates an IPSet , which you use to specify which web requests that you want to allow or block based
      # on the IP addresses that the requests originate from. For example, if you're receiving a lot of
      # requests from one or more individual IP addresses or one or more ranges of IP addresses and you want
      # to block the requests, you can create an IPSet that contains those IP addresses and then configure
      # AWS WAF to block the requests. To create and configure an IPSet , perform the following steps: Use
      # GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # CreateIPSet request. Submit a CreateIPSet request. Use GetChangeToken to get the change token that
      # you provide in the ChangeToken parameter of an UpdateIPSet request. Submit an UpdateIPSet request to
      # specify the IP addresses that you want AWS WAF to watch for. For more information about how to use
      # the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_ip_set(
        change_token : String,
        name : String
      ) : Types::CreateIPSetResponse
        input = Types::CreateIPSetRequest.new(change_token: change_token, name: name)
        create_ip_set(input)
      end
      def create_ip_set(input : Types::CreateIPSetRequest) : Types::CreateIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIPSetResponse, "CreateIPSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a RateBasedRule . The RateBasedRule contains a RateLimit , which specifies the maximum
      # number of requests that AWS WAF allows from a specified IP address in a five-minute period. The
      # RateBasedRule also contains the IPSet objects, ByteMatchSet objects, and other predicates that
      # identify the requests that you want to count or block if these requests exceed the RateLimit . If
      # you add more than one predicate to a RateBasedRule , a request not only must exceed the RateLimit ,
      # but it also must match all the conditions to be counted or blocked. For example, suppose you add the
      # following to a RateBasedRule : An IPSet that matches the IP address 192.0.2.44/32 A ByteMatchSet
      # that matches BadBot in the User-Agent header Further, you specify a RateLimit of 1,000. You then add
      # the RateBasedRule to a WebACL and specify that you want to block requests that meet the conditions
      # in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the
      # User-Agent header in the request must contain the value BadBot . Further, requests that match these
      # two conditions must be received at a rate of more than 1,000 requests every five minutes. If both
      # conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below
      # 1,000 for a five-minute period, AWS WAF no longer blocks the requests. As a second example, suppose
      # you want to limit requests to a particular page on your site. To do this, you could add the
      # following to a RateBasedRule : A ByteMatchSet with FieldToMatch of URI A PositionalConstraint of
      # STARTS_WITH A TargetString of login Further, you specify a RateLimit of 1,000. By adding this
      # RateBasedRule to a WebACL , you could limit requests to your login page without affecting the rest
      # of your site. To create and configure a RateBasedRule , perform the following steps: Create and
      # update the predicates that you want to include in the rule. For more information, see
      # CreateByteMatchSet , CreateIPSet , and CreateSqlInjectionMatchSet . Use GetChangeToken to get the
      # change token that you provide in the ChangeToken parameter of a CreateRule request. Submit a
      # CreateRateBasedRule request. Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of an UpdateRule request. Submit an UpdateRateBasedRule request to specify the
      # predicates that you want to include in the rule. Create and update a WebACL that contains the
      # RateBasedRule . For more information, see CreateWebACL . For more information about how to use the
      # AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_rate_based_rule(
        change_token : String,
        metric_name : String,
        name : String,
        rate_key : String,
        rate_limit : Int64,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRateBasedRuleResponse
        input = Types::CreateRateBasedRuleRequest.new(change_token: change_token, metric_name: metric_name, name: name, rate_key: rate_key, rate_limit: rate_limit, tags: tags)
        create_rate_based_rule(input)
      end
      def create_rate_based_rule(input : Types::CreateRateBasedRuleRequest) : Types::CreateRateBasedRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RATE_BASED_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRateBasedRuleResponse, "CreateRateBasedRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a RegexMatchSet . You then use UpdateRegexMatchSet to identify the part of a web request
      # that you want AWS WAF to inspect, such as the values of the User-Agent header or the query string.
      # For example, you can create a RegexMatchSet that contains a RegexMatchTuple that looks for any
      # requests with User-Agent headers that match a RegexPatternSet with pattern B[a@]dB[o0]t . You can
      # then configure AWS WAF to reject those requests. To create and configure a RegexMatchSet , perform
      # the following steps: Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of a CreateRegexMatchSet request. Submit a CreateRegexMatchSet request. Use GetChangeToken
      # to get the change token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet
      # request. Submit an UpdateRegexMatchSet request to specify the part of the request that you want AWS
      # WAF to inspect (for example, the header or the URI) and the value, using a RegexPatternSet , that
      # you want AWS WAF to watch for. For more information about how to use the AWS WAF API to allow or
      # block HTTP requests, see the AWS WAF Developer Guide .
      def create_regex_match_set(
        change_token : String,
        name : String
      ) : Types::CreateRegexMatchSetResponse
        input = Types::CreateRegexMatchSetRequest.new(change_token: change_token, name: name)
        create_regex_match_set(input)
      end
      def create_regex_match_set(input : Types::CreateRegexMatchSetRequest) : Types::CreateRegexMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGEX_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegexMatchSetResponse, "CreateRegexMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a RegexPatternSet . You then use UpdateRegexPatternSet to specify the regular expression
      # (regex) pattern that you want AWS WAF to search for, such as B[a@]dB[o0]t . You can then configure
      # AWS WAF to reject those requests. To create and configure a RegexPatternSet , perform the following
      # steps: Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # CreateRegexPatternSet request. Submit a CreateRegexPatternSet request. Use GetChangeToken to get the
      # change token that you provide in the ChangeToken parameter of an UpdateRegexPatternSet request.
      # Submit an UpdateRegexPatternSet request to specify the string that you want AWS WAF to watch for.
      # For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS
      # WAF Developer Guide .
      def create_regex_pattern_set(
        change_token : String,
        name : String
      ) : Types::CreateRegexPatternSetResponse
        input = Types::CreateRegexPatternSetRequest.new(change_token: change_token, name: name)
        create_regex_pattern_set(input)
      end
      def create_regex_pattern_set(input : Types::CreateRegexPatternSetRequest) : Types::CreateRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRegexPatternSetResponse, "CreateRegexPatternSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a Rule , which contains the IPSet objects, ByteMatchSet objects, and other predicates that
      # identify the requests that you want to block. If you add more than one predicate to a Rule , a
      # request must match all of the specifications to be allowed or blocked. For example, suppose that you
      # add the following to a Rule : An IPSet that matches the IP address 192.0.2.44/32 A ByteMatchSet that
      # matches BadBot in the User-Agent header You then add the Rule to a WebACL and specify that you want
      # to blocks requests that satisfy the Rule . For a request to be blocked, it must come from the IP
      # address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot . To
      # create and configure a Rule , perform the following steps: Create and update the predicates that you
      # want to include in the Rule . For more information, see CreateByteMatchSet , CreateIPSet , and
      # CreateSqlInjectionMatchSet . Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of a CreateRule request. Submit a CreateRule request. Use GetChangeToken to
      # get the change token that you provide in the ChangeToken parameter of an UpdateRule request. Submit
      # an UpdateRule request to specify the predicates that you want to include in the Rule . Create and
      # update a WebACL that contains the Rule . For more information, see CreateWebACL . For more
      # information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF
      # Developer Guide .
      def create_rule(
        change_token : String,
        metric_name : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleResponse
        input = Types::CreateRuleRequest.new(change_token: change_token, metric_name: metric_name, name: name, tags: tags)
        create_rule(input)
      end
      def create_rule(input : Types::CreateRuleRequest) : Types::CreateRuleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleResponse, "CreateRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a RuleGroup . A rule group is a collection of predefined rules that you add to a web ACL.
      # You use UpdateRuleGroup to add rules to the rule group. Rule groups are subject to the following
      # limits: Three rule groups per account. You can request an increase to this limit by contacting
      # customer support. One rule group per web ACL. Ten rules per rule group. For more information about
      # how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_rule_group(
        change_token : String,
        metric_name : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateRuleGroupResponse
        input = Types::CreateRuleGroupRequest.new(change_token: change_token, metric_name: metric_name, name: name, tags: tags)
        create_rule_group(input)
      end
      def create_rule_group(input : Types::CreateRuleGroupRequest) : Types::CreateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRuleGroupResponse, "CreateRuleGroup")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a SizeConstraintSet . You then use UpdateSizeConstraintSet to identify the part of a web
      # request that you want AWS WAF to check for length, such as the length of the User-Agent header or
      # the length of the query string. For example, you can create a SizeConstraintSet that matches any
      # requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to
      # reject those requests. To create and configure a SizeConstraintSet , perform the following steps:
      # Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # CreateSizeConstraintSet request. Submit a CreateSizeConstraintSet request. Use GetChangeToken to get
      # the change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet
      # request. Submit an UpdateSizeConstraintSet request to specify the part of the request that you want
      # AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch
      # for. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the
      # AWS WAF Developer Guide .
      def create_size_constraint_set(
        change_token : String,
        name : String
      ) : Types::CreateSizeConstraintSetResponse
        input = Types::CreateSizeConstraintSetRequest.new(change_token: change_token, name: name)
        create_size_constraint_set(input)
      end
      def create_size_constraint_set(input : Types::CreateSizeConstraintSetRequest) : Types::CreateSizeConstraintSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SIZE_CONSTRAINT_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSizeConstraintSetResponse, "CreateSizeConstraintSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a SqlInjectionMatchSet , which you use to allow, block, or count requests that contain
      # snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences
      # that are likely to be malicious strings. To create and configure a SqlInjectionMatchSet , perform
      # the following steps: Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of a CreateSqlInjectionMatchSet request. Submit a CreateSqlInjectionMatchSet request. Use
      # GetChangeToken to get the change token that you provide in the ChangeToken parameter of an
      # UpdateSqlInjectionMatchSet request. Submit an UpdateSqlInjectionMatchSet request to specify the
      # parts of web requests in which you want to allow, block, or count malicious SQL code. For more
      # information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF
      # Developer Guide .
      def create_sql_injection_match_set(
        change_token : String,
        name : String
      ) : Types::CreateSqlInjectionMatchSetResponse
        input = Types::CreateSqlInjectionMatchSetRequest.new(change_token: change_token, name: name)
        create_sql_injection_match_set(input)
      end
      def create_sql_injection_match_set(input : Types::CreateSqlInjectionMatchSetRequest) : Types::CreateSqlInjectionMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SQL_INJECTION_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSqlInjectionMatchSetResponse, "CreateSqlInjectionMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates a WebACL , which contains the Rules that identify the CloudFront web requests that you want
      # to allow, block, or count. AWS WAF evaluates Rules in order based on the value of Priority for each
      # Rule . You also specify a default action, either ALLOW or BLOCK . If a web request doesn't match any
      # of the Rules in a WebACL , AWS WAF responds to the request with the default action. To create and
      # configure a WebACL , perform the following steps: Create and update the ByteMatchSet objects and
      # other predicates that you want to include in Rules . For more information, see CreateByteMatchSet ,
      # UpdateByteMatchSet , CreateIPSet , UpdateIPSet , CreateSqlInjectionMatchSet , and
      # UpdateSqlInjectionMatchSet . Create and update the Rules that you want to include in the WebACL .
      # For more information, see CreateRule and UpdateRule . Use GetChangeToken to get the change token
      # that you provide in the ChangeToken parameter of a CreateWebACL request. Submit a CreateWebACL
      # request. Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of
      # an UpdateWebACL request. Submit an UpdateWebACL request to specify the Rules that you want to
      # include in the WebACL , to specify the default action, and to associate the WebACL with a CloudFront
      # distribution. For more information about how to use the AWS WAF API, see the AWS WAF Developer Guide
      # .
      def create_web_acl(
        change_token : String,
        default_action : Types::WafAction,
        metric_name : String,
        name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateWebACLResponse
        input = Types::CreateWebACLRequest.new(change_token: change_token, default_action: default_action, metric_name: metric_name, name: name, tags: tags)
        create_web_acl(input)
      end
      def create_web_acl(input : Types::CreateWebACLRequest) : Types::CreateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWebACLResponse, "CreateWebACL")
      end

      # Creates an AWS CloudFormation WAFV2 template for the specified web ACL in the specified Amazon S3
      # bucket. Then, in CloudFormation, you create a stack from the template, to create the web ACL and its
      # resources in AWS WAFV2. Use this to migrate your AWS WAF Classic web ACL to the latest version of
      # AWS WAF. This is part of a larger migration procedure for web ACLs from AWS WAF Classic to the
      # latest version of AWS WAF. For the full procedure, including caveats and manual steps to complete
      # the migration and switch over to the new web ACL, see Migrating your AWS WAF Classic resources to
      # AWS WAF in the AWS WAF Developer Guide .
      def create_web_acl_migration_stack(
        ignore_unsupported_type : Bool,
        s3_bucket_name : String,
        web_acl_id : String
      ) : Types::CreateWebACLMigrationStackResponse
        input = Types::CreateWebACLMigrationStackRequest.new(ignore_unsupported_type: ignore_unsupported_type, s3_bucket_name: s3_bucket_name, web_acl_id: web_acl_id)
        create_web_acl_migration_stack(input)
      end
      def create_web_acl_migration_stack(input : Types::CreateWebACLMigrationStackRequest) : Types::CreateWebACLMigrationStackResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WEB_ACL_MIGRATION_STACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWebACLMigrationStackResponse, "CreateWebACLMigrationStack")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Creates an XssMatchSet , which you use to allow, block, or count requests that contain cross-site
      # scripting attacks in the specified part of web requests. AWS WAF searches for character sequences
      # that are likely to be malicious strings. To create and configure an XssMatchSet , perform the
      # following steps: Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of a CreateXssMatchSet request. Submit a CreateXssMatchSet request. Use GetChangeToken to
      # get the change token that you provide in the ChangeToken parameter of an UpdateXssMatchSet request.
      # Submit an UpdateXssMatchSet request to specify the parts of web requests in which you want to allow,
      # block, or count cross-site scripting attacks. For more information about how to use the AWS WAF API
      # to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def create_xss_match_set(
        change_token : String,
        name : String
      ) : Types::CreateXssMatchSetResponse
        input = Types::CreateXssMatchSetRequest.new(change_token: change_token, name: name)
        create_xss_match_set(input)
      end
      def create_xss_match_set(input : Types::CreateXssMatchSetRequest) : Types::CreateXssMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_XSS_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateXssMatchSetResponse, "CreateXssMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a ByteMatchSet . You can't delete a ByteMatchSet if it's still used in any Rules
      # or if it still includes any ByteMatchTuple objects (any filters). If you just want to remove a
      # ByteMatchSet from a Rule , use UpdateRule . To permanently delete a ByteMatchSet , perform the
      # following steps: Update the ByteMatchSet to remove filters, if any. For more information, see
      # UpdateByteMatchSet . Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of a DeleteByteMatchSet request. Submit a DeleteByteMatchSet request.
      def delete_byte_match_set(
        byte_match_set_id : String,
        change_token : String
      ) : Types::DeleteByteMatchSetResponse
        input = Types::DeleteByteMatchSetRequest.new(byte_match_set_id: byte_match_set_id, change_token: change_token)
        delete_byte_match_set(input)
      end
      def delete_byte_match_set(input : Types::DeleteByteMatchSetRequest) : Types::DeleteByteMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_BYTE_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteByteMatchSetResponse, "DeleteByteMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a GeoMatchSet . You can't delete a GeoMatchSet if it's still used in any Rules
      # or if it still includes any countries. If you just want to remove a GeoMatchSet from a Rule , use
      # UpdateRule . To permanently delete a GeoMatchSet from AWS WAF, perform the following steps: Update
      # the GeoMatchSet to remove any countries. For more information, see UpdateGeoMatchSet . Use
      # GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # DeleteGeoMatchSet request. Submit a DeleteGeoMatchSet request.
      def delete_geo_match_set(
        change_token : String,
        geo_match_set_id : String
      ) : Types::DeleteGeoMatchSetResponse
        input = Types::DeleteGeoMatchSetRequest.new(change_token: change_token, geo_match_set_id: geo_match_set_id)
        delete_geo_match_set(input)
      end
      def delete_geo_match_set(input : Types::DeleteGeoMatchSetRequest) : Types::DeleteGeoMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_GEO_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteGeoMatchSetResponse, "DeleteGeoMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes an IPSet . You can't delete an IPSet if it's still used in any Rules or if it
      # still includes any IP addresses. If you just want to remove an IPSet from a Rule , use UpdateRule .
      # To permanently delete an IPSet from AWS WAF, perform the following steps: Update the IPSet to remove
      # IP address ranges, if any. For more information, see UpdateIPSet . Use GetChangeToken to get the
      # change token that you provide in the ChangeToken parameter of a DeleteIPSet request. Submit a
      # DeleteIPSet request.
      def delete_ip_set(
        change_token : String,
        ip_set_id : String
      ) : Types::DeleteIPSetResponse
        input = Types::DeleteIPSetRequest.new(change_token: change_token, ip_set_id: ip_set_id)
        delete_ip_set(input)
      end
      def delete_ip_set(input : Types::DeleteIPSetRequest) : Types::DeleteIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIPSetResponse, "DeleteIPSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes the LoggingConfiguration from the specified web ACL.
      def delete_logging_configuration(
        resource_arn : String
      ) : Types::DeleteLoggingConfigurationResponse
        input = Types::DeleteLoggingConfigurationRequest.new(resource_arn: resource_arn)
        delete_logging_configuration(input)
      end
      def delete_logging_configuration(input : Types::DeleteLoggingConfigurationRequest) : Types::DeleteLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLoggingConfigurationResponse, "DeleteLoggingConfiguration")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes an IAM policy from the specified RuleGroup. The user making the request must be
      # the owner of the RuleGroup.
      def delete_permission_policy(
        resource_arn : String
      ) : Types::DeletePermissionPolicyResponse
        input = Types::DeletePermissionPolicyRequest.new(resource_arn: resource_arn)
        delete_permission_policy(input)
      end
      def delete_permission_policy(input : Types::DeletePermissionPolicyRequest) : Types::DeletePermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePermissionPolicyResponse, "DeletePermissionPolicy")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a RateBasedRule . You can't delete a rule if it's still used in any WebACL
      # objects or if it still includes any predicates, such as ByteMatchSet objects. If you just want to
      # remove a rule from a WebACL , use UpdateWebACL . To permanently delete a RateBasedRule from AWS WAF,
      # perform the following steps: Update the RateBasedRule to remove predicates, if any. For more
      # information, see UpdateRateBasedRule . Use GetChangeToken to get the change token that you provide
      # in the ChangeToken parameter of a DeleteRateBasedRule request. Submit a DeleteRateBasedRule request.
      def delete_rate_based_rule(
        change_token : String,
        rule_id : String
      ) : Types::DeleteRateBasedRuleResponse
        input = Types::DeleteRateBasedRuleRequest.new(change_token: change_token, rule_id: rule_id)
        delete_rate_based_rule(input)
      end
      def delete_rate_based_rule(input : Types::DeleteRateBasedRuleRequest) : Types::DeleteRateBasedRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RATE_BASED_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRateBasedRuleResponse, "DeleteRateBasedRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a RegexMatchSet . You can't delete a RegexMatchSet if it's still used in any
      # Rules or if it still includes any RegexMatchTuples objects (any filters). If you just want to remove
      # a RegexMatchSet from a Rule , use UpdateRule . To permanently delete a RegexMatchSet , perform the
      # following steps: Update the RegexMatchSet to remove filters, if any. For more information, see
      # UpdateRegexMatchSet . Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of a DeleteRegexMatchSet request. Submit a DeleteRegexMatchSet request.
      def delete_regex_match_set(
        change_token : String,
        regex_match_set_id : String
      ) : Types::DeleteRegexMatchSetResponse
        input = Types::DeleteRegexMatchSetRequest.new(change_token: change_token, regex_match_set_id: regex_match_set_id)
        delete_regex_match_set(input)
      end
      def delete_regex_match_set(input : Types::DeleteRegexMatchSetRequest) : Types::DeleteRegexMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGEX_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegexMatchSetResponse, "DeleteRegexMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a RegexPatternSet . You can't delete a RegexPatternSet if it's still used in any
      # RegexMatchSet or if the RegexPatternSet is not empty.
      def delete_regex_pattern_set(
        change_token : String,
        regex_pattern_set_id : String
      ) : Types::DeleteRegexPatternSetResponse
        input = Types::DeleteRegexPatternSetRequest.new(change_token: change_token, regex_pattern_set_id: regex_pattern_set_id)
        delete_regex_pattern_set(input)
      end
      def delete_regex_pattern_set(input : Types::DeleteRegexPatternSetRequest) : Types::DeleteRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRegexPatternSetResponse, "DeleteRegexPatternSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a Rule . You can't delete a Rule if it's still used in any WebACL objects or if
      # it still includes any predicates, such as ByteMatchSet objects. If you just want to remove a Rule
      # from a WebACL , use UpdateWebACL . To permanently delete a Rule from AWS WAF, perform the following
      # steps: Update the Rule to remove predicates, if any. For more information, see UpdateRule . Use
      # GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteRule
      # request. Submit a DeleteRule request.
      def delete_rule(
        change_token : String,
        rule_id : String
      ) : Types::DeleteRuleResponse
        input = Types::DeleteRuleRequest.new(change_token: change_token, rule_id: rule_id)
        delete_rule(input)
      end
      def delete_rule(input : Types::DeleteRuleRequest) : Types::DeleteRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleResponse, "DeleteRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a RuleGroup . You can't delete a RuleGroup if it's still used in any WebACL
      # objects or if it still includes any rules. If you just want to remove a RuleGroup from a WebACL ,
      # use UpdateWebACL . To permanently delete a RuleGroup from AWS WAF, perform the following steps:
      # Update the RuleGroup to remove rules, if any. For more information, see UpdateRuleGroup . Use
      # GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # DeleteRuleGroup request. Submit a DeleteRuleGroup request.
      def delete_rule_group(
        change_token : String,
        rule_group_id : String
      ) : Types::DeleteRuleGroupResponse
        input = Types::DeleteRuleGroupRequest.new(change_token: change_token, rule_group_id: rule_group_id)
        delete_rule_group(input)
      end
      def delete_rule_group(input : Types::DeleteRuleGroupRequest) : Types::DeleteRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRuleGroupResponse, "DeleteRuleGroup")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a SizeConstraintSet . You can't delete a SizeConstraintSet if it's still used in
      # any Rules or if it still includes any SizeConstraint objects (any filters). If you just want to
      # remove a SizeConstraintSet from a Rule , use UpdateRule . To permanently delete a SizeConstraintSet
      # , perform the following steps: Update the SizeConstraintSet to remove filters, if any. For more
      # information, see UpdateSizeConstraintSet . Use GetChangeToken to get the change token that you
      # provide in the ChangeToken parameter of a DeleteSizeConstraintSet request. Submit a
      # DeleteSizeConstraintSet request.
      def delete_size_constraint_set(
        change_token : String,
        size_constraint_set_id : String
      ) : Types::DeleteSizeConstraintSetResponse
        input = Types::DeleteSizeConstraintSetRequest.new(change_token: change_token, size_constraint_set_id: size_constraint_set_id)
        delete_size_constraint_set(input)
      end
      def delete_size_constraint_set(input : Types::DeleteSizeConstraintSetRequest) : Types::DeleteSizeConstraintSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SIZE_CONSTRAINT_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSizeConstraintSetResponse, "DeleteSizeConstraintSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a SqlInjectionMatchSet . You can't delete a SqlInjectionMatchSet if it's still
      # used in any Rules or if it still contains any SqlInjectionMatchTuple objects. If you just want to
      # remove a SqlInjectionMatchSet from a Rule , use UpdateRule . To permanently delete a
      # SqlInjectionMatchSet from AWS WAF, perform the following steps: Update the SqlInjectionMatchSet to
      # remove filters, if any. For more information, see UpdateSqlInjectionMatchSet . Use GetChangeToken to
      # get the change token that you provide in the ChangeToken parameter of a DeleteSqlInjectionMatchSet
      # request. Submit a DeleteSqlInjectionMatchSet request.
      def delete_sql_injection_match_set(
        change_token : String,
        sql_injection_match_set_id : String
      ) : Types::DeleteSqlInjectionMatchSetResponse
        input = Types::DeleteSqlInjectionMatchSetRequest.new(change_token: change_token, sql_injection_match_set_id: sql_injection_match_set_id)
        delete_sql_injection_match_set(input)
      end
      def delete_sql_injection_match_set(input : Types::DeleteSqlInjectionMatchSetRequest) : Types::DeleteSqlInjectionMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SQL_INJECTION_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSqlInjectionMatchSetResponse, "DeleteSqlInjectionMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes a WebACL . You can't delete a WebACL if it still contains any Rules . To delete
      # a WebACL , perform the following steps: Update the WebACL to remove Rules , if any. For more
      # information, see UpdateWebACL . Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of a DeleteWebACL request. Submit a DeleteWebACL request.
      def delete_web_acl(
        change_token : String,
        web_acl_id : String
      ) : Types::DeleteWebACLResponse
        input = Types::DeleteWebACLRequest.new(change_token: change_token, web_acl_id: web_acl_id)
        delete_web_acl(input)
      end
      def delete_web_acl(input : Types::DeleteWebACLRequest) : Types::DeleteWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWebACLResponse, "DeleteWebACL")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Permanently deletes an XssMatchSet . You can't delete an XssMatchSet if it's still used in any Rules
      # or if it still contains any XssMatchTuple objects. If you just want to remove an XssMatchSet from a
      # Rule , use UpdateRule . To permanently delete an XssMatchSet from AWS WAF, perform the following
      # steps: Update the XssMatchSet to remove filters, if any. For more information, see UpdateXssMatchSet
      # . Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a
      # DeleteXssMatchSet request. Submit a DeleteXssMatchSet request.
      def delete_xss_match_set(
        change_token : String,
        xss_match_set_id : String
      ) : Types::DeleteXssMatchSetResponse
        input = Types::DeleteXssMatchSetRequest.new(change_token: change_token, xss_match_set_id: xss_match_set_id)
        delete_xss_match_set(input)
      end
      def delete_xss_match_set(input : Types::DeleteXssMatchSetRequest) : Types::DeleteXssMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_XSS_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteXssMatchSetResponse, "DeleteXssMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the ByteMatchSet specified by ByteMatchSetId .
      def get_byte_match_set(
        byte_match_set_id : String
      ) : Types::GetByteMatchSetResponse
        input = Types::GetByteMatchSetRequest.new(byte_match_set_id: byte_match_set_id)
        get_byte_match_set(input)
      end
      def get_byte_match_set(input : Types::GetByteMatchSetRequest) : Types::GetByteMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_BYTE_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetByteMatchSetResponse, "GetByteMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. When
      # you want to create, update, or delete AWS WAF objects, get a change token and include the change
      # token in the create, update, or delete request. Change tokens ensure that your application doesn't
      # submit conflicting requests to AWS WAF. Each create, update, or delete request must use a unique
      # change token. If your application submits a GetChangeToken request and then submits a second
      # GetChangeToken request before submitting a create, update, or delete request, the second
      # GetChangeToken request returns the same value as the first GetChangeToken request. When you use a
      # change token in a create, update, or delete request, the status of the change token changes to
      # PENDING , which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use
      # GetChangeTokenStatus to determine the status of your change token.
      def get_change_token : Types::GetChangeTokenResponse
        input = Types::GetChangeTokenRequest.new
        get_change_token(input)
      end
      def get_change_token(input : Types::GetChangeTokenRequest) : Types::GetChangeTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CHANGE_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetChangeTokenResponse, "GetChangeToken")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the status of a ChangeToken that you got by calling GetChangeToken . ChangeTokenStatus is
      # one of the following values: PROVISIONED : You requested the change token by calling GetChangeToken
      # , but you haven't used it yet in a call to create, update, or delete an AWS WAF object. PENDING :
      # AWS WAF is propagating the create, update, or delete request to all AWS WAF servers. INSYNC :
      # Propagation is complete.
      def get_change_token_status(
        change_token : String
      ) : Types::GetChangeTokenStatusResponse
        input = Types::GetChangeTokenStatusRequest.new(change_token: change_token)
        get_change_token_status(input)
      end
      def get_change_token_status(input : Types::GetChangeTokenStatusRequest) : Types::GetChangeTokenStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CHANGE_TOKEN_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetChangeTokenStatusResponse, "GetChangeTokenStatus")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the GeoMatchSet that is specified by GeoMatchSetId .
      def get_geo_match_set(
        geo_match_set_id : String
      ) : Types::GetGeoMatchSetResponse
        input = Types::GetGeoMatchSetRequest.new(geo_match_set_id: geo_match_set_id)
        get_geo_match_set(input)
      end
      def get_geo_match_set(input : Types::GetGeoMatchSetRequest) : Types::GetGeoMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_GEO_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetGeoMatchSetResponse, "GetGeoMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the IPSet that is specified by IPSetId .
      def get_ip_set(
        ip_set_id : String
      ) : Types::GetIPSetResponse
        input = Types::GetIPSetRequest.new(ip_set_id: ip_set_id)
        get_ip_set(input)
      end
      def get_ip_set(input : Types::GetIPSetRequest) : Types::GetIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIPSetResponse, "GetIPSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the LoggingConfiguration for the specified web ACL.
      def get_logging_configuration(
        resource_arn : String
      ) : Types::GetLoggingConfigurationResponse
        input = Types::GetLoggingConfigurationRequest.new(resource_arn: resource_arn)
        get_logging_configuration(input)
      end
      def get_logging_configuration(input : Types::GetLoggingConfigurationRequest) : Types::GetLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLoggingConfigurationResponse, "GetLoggingConfiguration")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the IAM policy attached to the RuleGroup.
      def get_permission_policy(
        resource_arn : String
      ) : Types::GetPermissionPolicyResponse
        input = Types::GetPermissionPolicyRequest.new(resource_arn: resource_arn)
        get_permission_policy(input)
      end
      def get_permission_policy(input : Types::GetPermissionPolicyRequest) : Types::GetPermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPermissionPolicyResponse, "GetPermissionPolicy")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the RateBasedRule that is specified by the RuleId that you included in the GetRateBasedRule
      # request.
      def get_rate_based_rule(
        rule_id : String
      ) : Types::GetRateBasedRuleResponse
        input = Types::GetRateBasedRuleRequest.new(rule_id: rule_id)
        get_rate_based_rule(input)
      end
      def get_rate_based_rule(input : Types::GetRateBasedRuleRequest) : Types::GetRateBasedRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RATE_BASED_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRateBasedRuleResponse, "GetRateBasedRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of IP addresses currently being blocked by the RateBasedRule that is specified by
      # the RuleId . The maximum number of managed keys that will be blocked is 10,000. If more than 10,000
      # addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.
      def get_rate_based_rule_managed_keys(
        rule_id : String,
        next_marker : String? = nil
      ) : Types::GetRateBasedRuleManagedKeysResponse
        input = Types::GetRateBasedRuleManagedKeysRequest.new(rule_id: rule_id, next_marker: next_marker)
        get_rate_based_rule_managed_keys(input)
      end
      def get_rate_based_rule_managed_keys(input : Types::GetRateBasedRuleManagedKeysRequest) : Types::GetRateBasedRuleManagedKeysResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RATE_BASED_RULE_MANAGED_KEYS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRateBasedRuleManagedKeysResponse, "GetRateBasedRuleManagedKeys")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the RegexMatchSet specified by RegexMatchSetId .
      def get_regex_match_set(
        regex_match_set_id : String
      ) : Types::GetRegexMatchSetResponse
        input = Types::GetRegexMatchSetRequest.new(regex_match_set_id: regex_match_set_id)
        get_regex_match_set(input)
      end
      def get_regex_match_set(input : Types::GetRegexMatchSetRequest) : Types::GetRegexMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGEX_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegexMatchSetResponse, "GetRegexMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the RegexPatternSet specified by RegexPatternSetId .
      def get_regex_pattern_set(
        regex_pattern_set_id : String
      ) : Types::GetRegexPatternSetResponse
        input = Types::GetRegexPatternSetRequest.new(regex_pattern_set_id: regex_pattern_set_id)
        get_regex_pattern_set(input)
      end
      def get_regex_pattern_set(input : Types::GetRegexPatternSetRequest) : Types::GetRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRegexPatternSetResponse, "GetRegexPatternSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the Rule that is specified by the RuleId that you included in the GetRule request.
      def get_rule(
        rule_id : String
      ) : Types::GetRuleResponse
        input = Types::GetRuleRequest.new(rule_id: rule_id)
        get_rule(input)
      end
      def get_rule(input : Types::GetRuleRequest) : Types::GetRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRuleResponse, "GetRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the RuleGroup that is specified by the RuleGroupId that you included in the GetRuleGroup
      # request. To view the rules in a rule group, use ListActivatedRulesInRuleGroup .
      def get_rule_group(
        rule_group_id : String
      ) : Types::GetRuleGroupResponse
        input = Types::GetRuleGroupRequest.new(rule_group_id: rule_group_id)
        get_rule_group(input)
      end
      def get_rule_group(input : Types::GetRuleGroupRequest) : Types::GetRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRuleGroupResponse, "GetRuleGroup")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. Gets
      # detailed information about a specified number of requests--a sample--that AWS WAF randomly selects
      # from among the first 5,000 requests that your AWS resource received during a time range that you
      # choose. You can specify a sample size of up to 500 requests, and you can specify any time range in
      # the previous three hours. GetSampledRequests returns a time range, which is usually the time range
      # that you specified. However, if your resource (such as a CloudFront distribution) received 5,000
      # requests before the specified time range elapsed, GetSampledRequests returns an updated time range.
      # This new time range indicates the actual period during which AWS WAF selected the requests in the
      # sample.
      def get_sampled_requests(
        max_items : Int64,
        rule_id : String,
        time_window : Types::TimeWindow,
        web_acl_id : String
      ) : Types::GetSampledRequestsResponse
        input = Types::GetSampledRequestsRequest.new(max_items: max_items, rule_id: rule_id, time_window: time_window, web_acl_id: web_acl_id)
        get_sampled_requests(input)
      end
      def get_sampled_requests(input : Types::GetSampledRequestsRequest) : Types::GetSampledRequestsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SAMPLED_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSampledRequestsResponse, "GetSampledRequests")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the SizeConstraintSet specified by SizeConstraintSetId .
      def get_size_constraint_set(
        size_constraint_set_id : String
      ) : Types::GetSizeConstraintSetResponse
        input = Types::GetSizeConstraintSetRequest.new(size_constraint_set_id: size_constraint_set_id)
        get_size_constraint_set(input)
      end
      def get_size_constraint_set(input : Types::GetSizeConstraintSetRequest) : Types::GetSizeConstraintSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SIZE_CONSTRAINT_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSizeConstraintSetResponse, "GetSizeConstraintSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the SqlInjectionMatchSet that is specified by SqlInjectionMatchSetId .
      def get_sql_injection_match_set(
        sql_injection_match_set_id : String
      ) : Types::GetSqlInjectionMatchSetResponse
        input = Types::GetSqlInjectionMatchSetRequest.new(sql_injection_match_set_id: sql_injection_match_set_id)
        get_sql_injection_match_set(input)
      end
      def get_sql_injection_match_set(input : Types::GetSqlInjectionMatchSetRequest) : Types::GetSqlInjectionMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SQL_INJECTION_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSqlInjectionMatchSetResponse, "GetSqlInjectionMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the WebACL that is specified by WebACLId .
      def get_web_acl(
        web_acl_id : String
      ) : Types::GetWebACLResponse
        input = Types::GetWebACLRequest.new(web_acl_id: web_acl_id)
        get_web_acl(input)
      end
      def get_web_acl(input : Types::GetWebACLRequest) : Types::GetWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::GET_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetWebACLResponse, "GetWebACL")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns the XssMatchSet that is specified by XssMatchSetId .
      def get_xss_match_set(
        xss_match_set_id : String
      ) : Types::GetXssMatchSetResponse
        input = Types::GetXssMatchSetRequest.new(xss_match_set_id: xss_match_set_id)
        get_xss_match_set(input)
      end
      def get_xss_match_set(input : Types::GetXssMatchSetRequest) : Types::GetXssMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::GET_XSS_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetXssMatchSetResponse, "GetXssMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of ActivatedRule objects.
      def list_activated_rules_in_rule_group(
        limit : Int32? = nil,
        next_marker : String? = nil,
        rule_group_id : String? = nil
      ) : Types::ListActivatedRulesInRuleGroupResponse
        input = Types::ListActivatedRulesInRuleGroupRequest.new(limit: limit, next_marker: next_marker, rule_group_id: rule_group_id)
        list_activated_rules_in_rule_group(input)
      end
      def list_activated_rules_in_rule_group(input : Types::ListActivatedRulesInRuleGroupRequest) : Types::ListActivatedRulesInRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTIVATED_RULES_IN_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListActivatedRulesInRuleGroupResponse, "ListActivatedRulesInRuleGroup")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of ByteMatchSetSummary objects.
      def list_byte_match_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListByteMatchSetsResponse
        input = Types::ListByteMatchSetsRequest.new(limit: limit, next_marker: next_marker)
        list_byte_match_sets(input)
      end
      def list_byte_match_sets(input : Types::ListByteMatchSetsRequest) : Types::ListByteMatchSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BYTE_MATCH_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListByteMatchSetsResponse, "ListByteMatchSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of GeoMatchSetSummary objects in the response.
      def list_geo_match_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListGeoMatchSetsResponse
        input = Types::ListGeoMatchSetsRequest.new(limit: limit, next_marker: next_marker)
        list_geo_match_sets(input)
      end
      def list_geo_match_sets(input : Types::ListGeoMatchSetsRequest) : Types::ListGeoMatchSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_GEO_MATCH_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListGeoMatchSetsResponse, "ListGeoMatchSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of IPSetSummary objects in the response.
      def list_ip_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListIPSetsResponse
        input = Types::ListIPSetsRequest.new(limit: limit, next_marker: next_marker)
        list_ip_sets(input)
      end
      def list_ip_sets(input : Types::ListIPSetsRequest) : Types::ListIPSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IP_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIPSetsResponse, "ListIPSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of LoggingConfiguration objects.
      def list_logging_configurations(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListLoggingConfigurationsResponse
        input = Types::ListLoggingConfigurationsRequest.new(limit: limit, next_marker: next_marker)
        list_logging_configurations(input)
      end
      def list_logging_configurations(input : Types::ListLoggingConfigurationsRequest) : Types::ListLoggingConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LOGGING_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLoggingConfigurationsResponse, "ListLoggingConfigurations")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RuleSummary objects.
      def list_rate_based_rules(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRateBasedRulesResponse
        input = Types::ListRateBasedRulesRequest.new(limit: limit, next_marker: next_marker)
        list_rate_based_rules(input)
      end
      def list_rate_based_rules(input : Types::ListRateBasedRulesRequest) : Types::ListRateBasedRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RATE_BASED_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRateBasedRulesResponse, "ListRateBasedRules")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RegexMatchSetSummary objects.
      def list_regex_match_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRegexMatchSetsResponse
        input = Types::ListRegexMatchSetsRequest.new(limit: limit, next_marker: next_marker)
        list_regex_match_sets(input)
      end
      def list_regex_match_sets(input : Types::ListRegexMatchSetsRequest) : Types::ListRegexMatchSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REGEX_MATCH_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegexMatchSetsResponse, "ListRegexMatchSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RegexPatternSetSummary objects.
      def list_regex_pattern_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRegexPatternSetsResponse
        input = Types::ListRegexPatternSetsRequest.new(limit: limit, next_marker: next_marker)
        list_regex_pattern_sets(input)
      end
      def list_regex_pattern_sets(input : Types::ListRegexPatternSetsRequest) : Types::ListRegexPatternSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REGEX_PATTERN_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRegexPatternSetsResponse, "ListRegexPatternSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RuleGroup objects.
      def list_rule_groups(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRuleGroupsResponse
        input = Types::ListRuleGroupsRequest.new(limit: limit, next_marker: next_marker)
        list_rule_groups(input)
      end
      def list_rule_groups(input : Types::ListRuleGroupsRequest) : Types::ListRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRuleGroupsResponse, "ListRuleGroups")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RuleSummary objects.
      def list_rules(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListRulesResponse
        input = Types::ListRulesRequest.new(limit: limit, next_marker: next_marker)
        list_rules(input)
      end
      def list_rules(input : Types::ListRulesRequest) : Types::ListRulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRulesResponse, "ListRules")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of SizeConstraintSetSummary objects.
      def list_size_constraint_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListSizeConstraintSetsResponse
        input = Types::ListSizeConstraintSetsRequest.new(limit: limit, next_marker: next_marker)
        list_size_constraint_sets(input)
      end
      def list_size_constraint_sets(input : Types::ListSizeConstraintSetsRequest) : Types::ListSizeConstraintSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SIZE_CONSTRAINT_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSizeConstraintSetsResponse, "ListSizeConstraintSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of SqlInjectionMatchSet objects.
      def list_sql_injection_match_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListSqlInjectionMatchSetsResponse
        input = Types::ListSqlInjectionMatchSetsRequest.new(limit: limit, next_marker: next_marker)
        list_sql_injection_match_sets(input)
      end
      def list_sql_injection_match_sets(input : Types::ListSqlInjectionMatchSetsRequest) : Types::ListSqlInjectionMatchSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SQL_INJECTION_MATCH_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSqlInjectionMatchSetsResponse, "ListSqlInjectionMatchSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of RuleGroup objects that you are subscribed to.
      def list_subscribed_rule_groups(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListSubscribedRuleGroupsResponse
        input = Types::ListSubscribedRuleGroupsRequest.new(limit: limit, next_marker: next_marker)
        list_subscribed_rule_groups(input)
      end
      def list_subscribed_rule_groups(input : Types::ListSubscribedRuleGroupsRequest) : Types::ListSubscribedRuleGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SUBSCRIBED_RULE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSubscribedRuleGroupsResponse, "ListSubscribedRuleGroups")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Retrieves the tags associated with the specified AWS resource. Tags are key:value pairs that you can
      # use to categorize and manage your resources, for purposes like billing. For example, you might set
      # the tag key to "customer" and the value to the customer name or ID. You can specify one or more tags
      # to add to each AWS resource, up to 50 tags for a resource. Tagging is only available through the
      # API, SDKs, and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag
      # the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
      def list_tags_for_resource(
        resource_arn : String,
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, limit: limit, next_marker: next_marker)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of WebACLSummary objects in the response.
      def list_web_ac_ls(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListWebACLsResponse
        input = Types::ListWebACLsRequest.new(limit: limit, next_marker: next_marker)
        list_web_ac_ls(input)
      end
      def list_web_ac_ls(input : Types::ListWebACLsRequest) : Types::ListWebACLsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WEB_AC_LS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWebACLsResponse, "ListWebACLs")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returns an array of XssMatchSet objects.
      def list_xss_match_sets(
        limit : Int32? = nil,
        next_marker : String? = nil
      ) : Types::ListXssMatchSetsResponse
        input = Types::ListXssMatchSetsRequest.new(limit: limit, next_marker: next_marker)
        list_xss_match_sets(input)
      end
      def list_xss_match_sets(input : Types::ListXssMatchSetsRequest) : Types::ListXssMatchSetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_XSS_MATCH_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListXssMatchSetsResponse, "ListXssMatchSets")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Associates a LoggingConfiguration with a specified web ACL. You can access information about all
      # traffic that AWS WAF inspects using the following steps: Create an Amazon Kinesis Data Firehose.
      # Create the data firehose with a PUT source and in the region that you are operating. However, if you
      # are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia). Do
      # not create the data firehose using a Kinesis stream as your source. Associate that firehose to your
      # web ACL using a PutLoggingConfiguration request. When you successfully enable logging using a
      # PutLoggingConfiguration request, AWS WAF will create a service linked role with the necessary
      # permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see Logging Web
      # ACL Traffic Information in the AWS WAF Developer Guide .
      def put_logging_configuration(
        logging_configuration : Types::LoggingConfiguration
      ) : Types::PutLoggingConfigurationResponse
        input = Types::PutLoggingConfigurationRequest.new(logging_configuration: logging_configuration)
        put_logging_configuration(input)
      end
      def put_logging_configuration(input : Types::PutLoggingConfigurationRequest) : Types::PutLoggingConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_LOGGING_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutLoggingConfigurationResponse, "PutLoggingConfiguration")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Attaches an IAM policy to the specified resource. The only supported use for this action is to share
      # a RuleGroup across accounts. The PutPermissionPolicy is subject to the following restrictions: You
      # can attach only one policy with each PutPermissionPolicy request. The policy must include an Effect
      # , Action and Principal . Effect must specify Allow . The Action in the policy must be
      # waf:UpdateWebACL , waf-regional:UpdateWebACL , waf:GetRuleGroup and waf-regional:GetRuleGroup . Any
      # extra or wildcard actions in the policy will be rejected. The policy cannot include a Resource
      # parameter. The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in
      # the same region. The user making the request must be the owner of the RuleGroup. Your policy must be
      # composed using IAM Policy version 2012-10-17. For more information, see IAM Policies . An example of
      # a valid policy parameter is shown in the Examples section below.
      def put_permission_policy(
        policy : String,
        resource_arn : String
      ) : Types::PutPermissionPolicyResponse
        input = Types::PutPermissionPolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_permission_policy(input)
      end
      def put_permission_policy(input : Types::PutPermissionPolicyRequest) : Types::PutPermissionPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PERMISSION_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutPermissionPolicyResponse, "PutPermissionPolicy")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Associates tags with the specified AWS resource. Tags are key:value pairs that you can use to
      # categorize and manage your resources, for purposes like billing. For example, you might set the tag
      # key to "customer" and the value to the customer name or ID. You can specify one or more tags to add
      # to each AWS resource, up to 50 tags for a resource. Tagging is only available through the API, SDKs,
      # and CLI. You can't manage or view tags through the AWS WAF Classic console. You can use this action
      # to tag the AWS resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes ByteMatchTuple objects (filters) in a ByteMatchSet . For each ByteMatchTuple
      # object, you specify the following values: Whether to insert or delete the object from the array. If
      # you want to change a ByteMatchSetUpdate object, you delete the existing object and add a new one.
      # The part of a web request that you want AWS WAF to inspect, such as a query string or the value of
      # the User-Agent header. The bytes (typically a string that corresponds with ASCII characters) that
      # you want AWS WAF to look for. For more information, including how you specify the values for the AWS
      # WAF API and the AWS CLI or SDKs, see TargetString in the ByteMatchTuple data type. Where to look,
      # such as at the beginning or the end of a query string. Whether to perform any conversions on the
      # request, such as converting it to lowercase, before inspecting it for the specified string. For
      # example, you can add a ByteMatchSetUpdate object that matches web requests in which User-Agent
      # headers contain the string BadBot . You can then configure AWS WAF to block those requests. To
      # create and configure a ByteMatchSet , perform the following steps: Create a ByteMatchSet. For more
      # information, see CreateByteMatchSet . Use GetChangeToken to get the change token that you provide in
      # the ChangeToken parameter of an UpdateByteMatchSet request. Submit an UpdateByteMatchSet request to
      # specify the part of the request that you want AWS WAF to inspect (for example, the header or the
      # URI) and the value that you want AWS WAF to watch for. For more information about how to use the AWS
      # WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_byte_match_set(
        byte_match_set_id : String,
        change_token : String,
        updates : Array(Types::ByteMatchSetUpdate)
      ) : Types::UpdateByteMatchSetResponse
        input = Types::UpdateByteMatchSetRequest.new(byte_match_set_id: byte_match_set_id, change_token: change_token, updates: updates)
        update_byte_match_set(input)
      end
      def update_byte_match_set(input : Types::UpdateByteMatchSetRequest) : Types::UpdateByteMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_BYTE_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateByteMatchSetResponse, "UpdateByteMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes GeoMatchConstraint objects in an GeoMatchSet . For each GeoMatchConstraint
      # object, you specify the following values: Whether to insert or delete the object from the array. If
      # you want to change an GeoMatchConstraint object, you delete the existing object and add a new one.
      # The Type . The only valid value for Type is Country . The Value , which is a two character code for
      # the country to add to the GeoMatchConstraint object. Valid codes are listed in
      # GeoMatchConstraint$Value . To create and configure an GeoMatchSet , perform the following steps:
      # Submit a CreateGeoMatchSet request. Use GetChangeToken to get the change token that you provide in
      # the ChangeToken parameter of an UpdateGeoMatchSet request. Submit an UpdateGeoMatchSet request to
      # specify the country that you want AWS WAF to watch for. When you update an GeoMatchSet , you specify
      # the country that you want to add and/or the country that you want to delete. If you want to change a
      # country, you delete the existing country and add the new one. For more information about how to use
      # the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_geo_match_set(
        change_token : String,
        geo_match_set_id : String,
        updates : Array(Types::GeoMatchSetUpdate)
      ) : Types::UpdateGeoMatchSetResponse
        input = Types::UpdateGeoMatchSetRequest.new(change_token: change_token, geo_match_set_id: geo_match_set_id, updates: updates)
        update_geo_match_set(input)
      end
      def update_geo_match_set(input : Types::UpdateGeoMatchSetRequest) : Types::UpdateGeoMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_GEO_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateGeoMatchSetResponse, "UpdateGeoMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes IPSetDescriptor objects in an IPSet . For each IPSetDescriptor object, you
      # specify the following values: Whether to insert or delete the object from the array. If you want to
      # change an IPSetDescriptor object, you delete the existing object and add a new one. The IP address
      # version, IPv4 or IPv6 . The IP address in CIDR notation, for example, 192.0.2.0/24 (for the range of
      # IP addresses from 192.0.2.0 to 192.0.2.255 ) or 192.0.2.44/32 (for the individual IP address
      # 192.0.2.44 ). AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS
      # WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR
      # notation, see the Wikipedia entry Classless Inter-Domain Routing . IPv6 addresses can be represented
      # using any of the following formats: 1111:0000:0000:0000:0000:0000:0000:0111/128
      # 1111:0:0:0:0:0:0:0111/128 1111::0111/128 1111::111/128 You use an IPSet to specify which web
      # requests you want to allow or block based on the IP addresses that the requests originated from. For
      # example, if you're receiving a lot of requests from one or a small number of IP addresses and you
      # want to block the requests, you can create an IPSet that specifies those IP addresses, and then
      # configure AWS WAF to block the requests. To create and configure an IPSet , perform the following
      # steps: Submit a CreateIPSet request. Use GetChangeToken to get the change token that you provide in
      # the ChangeToken parameter of an UpdateIPSet request. Submit an UpdateIPSet request to specify the IP
      # addresses that you want AWS WAF to watch for. When you update an IPSet , you specify the IP
      # addresses that you want to add and/or the IP addresses that you want to delete. If you want to
      # change an IP address, you delete the existing IP address and add the new one. You can insert a
      # maximum of 1000 addresses in a single request. For more information about how to use the AWS WAF API
      # to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_ip_set(
        change_token : String,
        ip_set_id : String,
        updates : Array(Types::IPSetUpdate)
      ) : Types::UpdateIPSetResponse
        input = Types::UpdateIPSetRequest.new(change_token: change_token, ip_set_id: ip_set_id, updates: updates)
        update_ip_set(input)
      end
      def update_ip_set(input : Types::UpdateIPSetRequest) : Types::UpdateIPSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IP_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIPSetResponse, "UpdateIPSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes Predicate objects in a rule and updates the RateLimit in the rule. Each Predicate
      # object identifies a predicate, such as a ByteMatchSet or an IPSet , that specifies the web requests
      # that you want to block or count. The RateLimit specifies the number of requests every five minutes
      # that triggers the rule. If you add more than one predicate to a RateBasedRule , a request must match
      # all the predicates and exceed the RateLimit to be counted or blocked. For example, suppose you add
      # the following to a RateBasedRule : An IPSet that matches the IP address 192.0.2.44/32 A ByteMatchSet
      # that matches BadBot in the User-Agent header Further, you specify a RateLimit of 1,000. You then add
      # the RateBasedRule to a WebACL and specify that you want to block requests that satisfy the rule. For
      # a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in
      # the request must contain the value BadBot . Further, requests that match these two conditions much
      # be received at a rate of more than 1,000 every five minutes. If the rate drops below this limit, AWS
      # WAF no longer blocks the requests. As a second example, suppose you want to limit requests to a
      # particular page on your site. To do this, you could add the following to a RateBasedRule : A
      # ByteMatchSet with FieldToMatch of URI A PositionalConstraint of STARTS_WITH A TargetString of login
      # Further, you specify a RateLimit of 1,000. By adding this RateBasedRule to a WebACL , you could
      # limit requests to your login page without affecting the rest of your site.
      def update_rate_based_rule(
        change_token : String,
        rate_limit : Int64,
        rule_id : String,
        updates : Array(Types::RuleUpdate)
      ) : Types::UpdateRateBasedRuleResponse
        input = Types::UpdateRateBasedRuleRequest.new(change_token: change_token, rate_limit: rate_limit, rule_id: rule_id, updates: updates)
        update_rate_based_rule(input)
      end
      def update_rate_based_rule(input : Types::UpdateRateBasedRuleRequest) : Types::UpdateRateBasedRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RATE_BASED_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRateBasedRuleResponse, "UpdateRateBasedRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes RegexMatchTuple objects (filters) in a RegexMatchSet . For each
      # RegexMatchSetUpdate object, you specify the following values: Whether to insert or delete the object
      # from the array. If you want to change a RegexMatchSetUpdate object, you delete the existing object
      # and add a new one. The part of a web request that you want AWS WAF to inspectupdate, such as a query
      # string or the value of the User-Agent header. The identifier of the pattern (a regular expression)
      # that you want AWS WAF to look for. For more information, see RegexPatternSet . Whether to perform
      # any conversions on the request, such as converting it to lowercase, before inspecting it for the
      # specified string. For example, you can create a RegexPatternSet that matches any requests with
      # User-Agent headers that contain the string B[a@]dB[o0]t . You can then configure AWS WAF to reject
      # those requests. To create and configure a RegexMatchSet , perform the following steps: Create a
      # RegexMatchSet. For more information, see CreateRegexMatchSet . Use GetChangeToken to get the change
      # token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet request. Submit an
      # UpdateRegexMatchSet request to specify the part of the request that you want AWS WAF to inspect (for
      # example, the header or the URI) and the identifier of the RegexPatternSet that contain the regular
      # expression patters you want AWS WAF to watch for. For more information about how to use the AWS WAF
      # API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_regex_match_set(
        change_token : String,
        regex_match_set_id : String,
        updates : Array(Types::RegexMatchSetUpdate)
      ) : Types::UpdateRegexMatchSetResponse
        input = Types::UpdateRegexMatchSetRequest.new(change_token: change_token, regex_match_set_id: regex_match_set_id, updates: updates)
        update_regex_match_set(input)
      end
      def update_regex_match_set(input : Types::UpdateRegexMatchSetRequest) : Types::UpdateRegexMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REGEX_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRegexMatchSetResponse, "UpdateRegexMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes RegexPatternString objects in a RegexPatternSet . For each RegexPatternString
      # object, you specify the following values: Whether to insert or delete the RegexPatternString . The
      # regular expression pattern that you want to insert or delete. For more information, see
      # RegexPatternSet . For example, you can create a RegexPatternString such as B[a@]dB[o0]t . AWS WAF
      # will match this RegexPatternString to: BadBot BadB0t B@dBot B@dB0t To create and configure a
      # RegexPatternSet , perform the following steps: Create a RegexPatternSet. For more information, see
      # CreateRegexPatternSet . Use GetChangeToken to get the change token that you provide in the
      # ChangeToken parameter of an UpdateRegexPatternSet request. Submit an UpdateRegexPatternSet request
      # to specify the regular expression pattern that you want AWS WAF to watch for. For more information
      # about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_regex_pattern_set(
        change_token : String,
        regex_pattern_set_id : String,
        updates : Array(Types::RegexPatternSetUpdate)
      ) : Types::UpdateRegexPatternSetResponse
        input = Types::UpdateRegexPatternSetRequest.new(change_token: change_token, regex_pattern_set_id: regex_pattern_set_id, updates: updates)
        update_regex_pattern_set(input)
      end
      def update_regex_pattern_set(input : Types::UpdateRegexPatternSetRequest) : Types::UpdateRegexPatternSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REGEX_PATTERN_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRegexPatternSetResponse, "UpdateRegexPatternSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes Predicate objects in a Rule . Each Predicate object identifies a predicate, such
      # as a ByteMatchSet or an IPSet , that specifies the web requests that you want to allow, block, or
      # count. If you add more than one predicate to a Rule , a request must match all of the specifications
      # to be allowed, blocked, or counted. For example, suppose that you add the following to a Rule : A
      # ByteMatchSet that matches the value BadBot in the User-Agent header An IPSet that matches the IP
      # address 192.0.2.44 You then add the Rule to a WebACL and specify that you want to block requests
      # that satisfy the Rule . For a request to be blocked, the User-Agent header in the request must
      # contain the value BadBot and the request must originate from the IP address 192.0.2.44. To create
      # and configure a Rule , perform the following steps: Create and update the predicates that you want
      # to include in the Rule . Create the Rule . See CreateRule . Use GetChangeToken to get the change
      # token that you provide in the ChangeToken parameter of an UpdateRule request. Submit an UpdateRule
      # request to add predicates to the Rule . Create and update a WebACL that contains the Rule . See
      # CreateWebACL . If you want to replace one ByteMatchSet or IPSet with another, you delete the
      # existing one and add the new one. For more information about how to use the AWS WAF API to allow or
      # block HTTP requests, see the AWS WAF Developer Guide .
      def update_rule(
        change_token : String,
        rule_id : String,
        updates : Array(Types::RuleUpdate)
      ) : Types::UpdateRuleResponse
        input = Types::UpdateRuleRequest.new(change_token: change_token, rule_id: rule_id, updates: updates)
        update_rule(input)
      end
      def update_rule(input : Types::UpdateRuleRequest) : Types::UpdateRuleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleResponse, "UpdateRule")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes ActivatedRule objects in a RuleGroup . You can only insert REGULAR rules into a
      # rule group. You can have a maximum of ten rules per rule group. To create and configure a RuleGroup
      # , perform the following steps: Create and update the Rules that you want to include in the RuleGroup
      # . See CreateRule . Use GetChangeToken to get the change token that you provide in the ChangeToken
      # parameter of an UpdateRuleGroup request. Submit an UpdateRuleGroup request to add Rules to the
      # RuleGroup . Create and update a WebACL that contains the RuleGroup . See CreateWebACL . If you want
      # to replace one Rule with another, you delete the existing one and add the new one. For more
      # information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF
      # Developer Guide .
      def update_rule_group(
        change_token : String,
        rule_group_id : String,
        updates : Array(Types::RuleGroupUpdate)
      ) : Types::UpdateRuleGroupResponse
        input = Types::UpdateRuleGroupRequest.new(change_token: change_token, rule_group_id: rule_group_id, updates: updates)
        update_rule_group(input)
      end
      def update_rule_group(input : Types::UpdateRuleGroupRequest) : Types::UpdateRuleGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RULE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRuleGroupResponse, "UpdateRuleGroup")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes SizeConstraint objects (filters) in a SizeConstraintSet . For each SizeConstraint
      # object, you specify the following values: Whether to insert or delete the object from the array. If
      # you want to change a SizeConstraintSetUpdate object, you delete the existing object and add a new
      # one. The part of a web request that you want AWS WAF to evaluate, such as the length of a query
      # string or the length of the User-Agent header. Whether to perform any transformations on the
      # request, such as converting it to lowercase, before checking its length. Note that transformations
      # of the request body are not supported because the AWS resource forwards only the first 8192 bytes of
      # your request to AWS WAF. You can only specify a single type of TextTransformation. A
      # ComparisonOperator used for evaluating the selected part of the request against the specified Size ,
      # such as equals, greater than, less than, and so on. The length, in bytes, that you want AWS WAF to
      # watch for in selected part of the request. The length is computed after applying the transformation.
      # For example, you can add a SizeConstraintSetUpdate object that matches web requests in which the
      # length of the User-Agent header is greater than 100 bytes. You can then configure AWS WAF to block
      # those requests. To create and configure a SizeConstraintSet , perform the following steps: Create a
      # SizeConstraintSet. For more information, see CreateSizeConstraintSet . Use GetChangeToken to get the
      # change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet request.
      # Submit an UpdateSizeConstraintSet request to specify the part of the request that you want AWS WAF
      # to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.
      # For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS
      # WAF Developer Guide .
      def update_size_constraint_set(
        change_token : String,
        size_constraint_set_id : String,
        updates : Array(Types::SizeConstraintSetUpdate)
      ) : Types::UpdateSizeConstraintSetResponse
        input = Types::UpdateSizeConstraintSetRequest.new(change_token: change_token, size_constraint_set_id: size_constraint_set_id, updates: updates)
        update_size_constraint_set(input)
      end
      def update_size_constraint_set(input : Types::UpdateSizeConstraintSetRequest) : Types::UpdateSizeConstraintSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SIZE_CONSTRAINT_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSizeConstraintSetResponse, "UpdateSizeConstraintSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes SqlInjectionMatchTuple objects (filters) in a SqlInjectionMatchSet . For each
      # SqlInjectionMatchTuple object, you specify the following values: Action : Whether to insert the
      # object into or delete the object from the array. To change a SqlInjectionMatchTuple , you delete the
      # existing object and add a new one. FieldToMatch : The part of web requests that you want AWS WAF to
      # inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the
      # header or parameter. TextTransformation : Which text transformation, if any, to perform on the web
      # request before inspecting the request for snippets of malicious SQL code. You can only specify a
      # single type of TextTransformation. You use SqlInjectionMatchSet objects to specify which CloudFront
      # requests that you want to allow, block, or count. For example, if you're receiving requests that
      # contain snippets of SQL code in the query string and you want to block the requests, you can create
      # a SqlInjectionMatchSet with the applicable settings, and then configure AWS WAF to block the
      # requests. To create and configure a SqlInjectionMatchSet , perform the following steps: Submit a
      # CreateSqlInjectionMatchSet request. Use GetChangeToken to get the change token that you provide in
      # the ChangeToken parameter of an UpdateIPSet request. Submit an UpdateSqlInjectionMatchSet request to
      # specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code. For
      # more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF
      # Developer Guide .
      def update_sql_injection_match_set(
        change_token : String,
        sql_injection_match_set_id : String,
        updates : Array(Types::SqlInjectionMatchSetUpdate)
      ) : Types::UpdateSqlInjectionMatchSetResponse
        input = Types::UpdateSqlInjectionMatchSetRequest.new(change_token: change_token, sql_injection_match_set_id: sql_injection_match_set_id, updates: updates)
        update_sql_injection_match_set(input)
      end
      def update_sql_injection_match_set(input : Types::UpdateSqlInjectionMatchSetRequest) : Types::UpdateSqlInjectionMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SQL_INJECTION_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSqlInjectionMatchSetResponse, "UpdateSqlInjectionMatchSet")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes ActivatedRule objects in a WebACL . Each Rule identifies web requests that you
      # want to allow, block, or count. When you update a WebACL , you specify the following values: A
      # default action for the WebACL , either ALLOW or BLOCK . AWS WAF performs the default action if a
      # request doesn't match the criteria in any of the Rules in a WebACL . The Rules that you want to add
      # or delete. If you want to replace one Rule with another, you delete the existing Rule and add the
      # new one. For each Rule , whether you want AWS WAF to allow requests, block requests, or count
      # requests that match the conditions in the Rule . The order in which you want AWS WAF to evaluate the
      # Rules in a WebACL . If you add more than one Rule to a WebACL , AWS WAF evaluates each request
      # against the Rules in order based on the value of Priority . (The Rule that has the lowest value for
      # Priority is evaluated first.) When a web request matches all the predicates (such as ByteMatchSets
      # and IPSets ) in a Rule , AWS WAF immediately takes the corresponding action, allow or block, and
      # doesn't evaluate the request against the remaining Rules in the WebACL , if any. To create and
      # configure a WebACL , perform the following steps: Create and update the predicates that you want to
      # include in Rules . For more information, see CreateByteMatchSet , UpdateByteMatchSet , CreateIPSet ,
      # UpdateIPSet , CreateSqlInjectionMatchSet , and UpdateSqlInjectionMatchSet . Create and update the
      # Rules that you want to include in the WebACL . For more information, see CreateRule and UpdateRule .
      # Create a WebACL . See CreateWebACL . Use GetChangeToken to get the change token that you provide in
      # the ChangeToken parameter of an UpdateWebACL request. Submit an UpdateWebACL request to specify the
      # Rules that you want to include in the WebACL , to specify the default action, and to associate the
      # WebACL with a CloudFront distribution. The ActivatedRule can be a rule group. If you specify a rule
      # group as your ActivatedRule , you can exclude specific rules from that rule group. If you already
      # have a rule group associated with a web ACL and want to submit an UpdateWebACL request to exclude
      # certain rules from that rule group, you must first remove the rule group from the web ACL, the
      # re-insert it again, specifying the excluded rules. For details, see ActivatedRule$ExcludedRules . Be
      # aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first
      # creating the rule, the UpdateWebACL request will fail because the request tries to add a REGULAR
      # rule (the default rule type) with the specified ID, which does not exist. For more information about
      # how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_web_acl(
        change_token : String,
        web_acl_id : String,
        default_action : Types::WafAction? = nil,
        updates : Array(Types::WebACLUpdate)? = nil
      ) : Types::UpdateWebACLResponse
        input = Types::UpdateWebACLRequest.new(change_token: change_token, web_acl_id: web_acl_id, default_action: default_action, updates: updates)
        update_web_acl(input)
      end
      def update_web_acl(input : Types::UpdateWebACLRequest) : Types::UpdateWebACLResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WEB_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWebACLResponse, "UpdateWebACL")
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Inserts or deletes XssMatchTuple objects (filters) in an XssMatchSet . For each XssMatchTuple
      # object, you specify the following values: Action : Whether to insert the object into or delete the
      # object from the array. To change an XssMatchTuple , you delete the existing object and add a new
      # one. FieldToMatch : The part of web requests that you want AWS WAF to inspect and, if you want AWS
      # WAF to inspect a header or custom query parameter, the name of the header or parameter.
      # TextTransformation : Which text transformation, if any, to perform on the web request before
      # inspecting the request for cross-site scripting attacks. You can only specify a single type of
      # TextTransformation. You use XssMatchSet objects to specify which CloudFront requests that you want
      # to allow, block, or count. For example, if you're receiving requests that contain cross-site
      # scripting attacks in the request body and you want to block the requests, you can create an
      # XssMatchSet with the applicable settings, and then configure AWS WAF to block the requests. To
      # create and configure an XssMatchSet , perform the following steps: Submit a CreateXssMatchSet
      # request. Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of
      # an UpdateIPSet request. Submit an UpdateXssMatchSet request to specify the parts of web requests
      # that you want AWS WAF to inspect for cross-site scripting attacks. For more information about how to
      # use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide .
      def update_xss_match_set(
        change_token : String,
        updates : Array(Types::XssMatchSetUpdate),
        xss_match_set_id : String
      ) : Types::UpdateXssMatchSetResponse
        input = Types::UpdateXssMatchSetRequest.new(change_token: change_token, updates: updates, xss_match_set_id: xss_match_set_id)
        update_xss_match_set(input)
      end
      def update_xss_match_set(input : Types::UpdateXssMatchSetRequest) : Types::UpdateXssMatchSetResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_XSS_MATCH_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateXssMatchSetResponse, "UpdateXssMatchSet")
      end
    end
  end
end
