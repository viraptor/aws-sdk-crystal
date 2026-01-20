require "json"
require "time"

module AwsSdk
  module WAF
    module Types

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # ActivatedRule object in an UpdateWebACL request specifies a Rule that you want to insert or delete,
      # the priority of the Rule in the WebACL , and the action that you want AWS WAF to take when a web
      # request matches the Rule ( ALLOW , BLOCK , or COUNT ). To specify whether to insert or delete a Rule
      # , use the Action parameter in the WebACLUpdate data type.

      struct ActivatedRule
        include JSON::Serializable

        # Specifies the order in which the Rules in a WebACL are evaluated. Rules with a lower value for
        # Priority are evaluated before Rules with a higher value. The value must be a unique integer. If you
        # add multiple Rules to a WebACL , the values don't need to be consecutive.

        @[JSON::Field(key: "Priority")]
        getter priority : Int32

        # The RuleId for a Rule . You use RuleId to get more information about a Rule (see GetRule ), update a
        # Rule (see UpdateRule ), insert a Rule into a WebACL or delete a one from a WebACL (see UpdateWebACL
        # ), or delete a Rule from AWS WAF (see DeleteRule ). RuleId is returned by CreateRule and by
        # ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # Specifies the action that CloudFront or AWS WAF takes when a web request matches the conditions in
        # the Rule . Valid values for Action include the following: ALLOW : CloudFront responds with the
        # requested object. BLOCK : CloudFront responds with an HTTP 403 (Forbidden) status code. COUNT : AWS
        # WAF increments a counter of requests that match the conditions in the rule and then continues to
        # inspect the web request based on the remaining rules in the web ACL. ActivatedRule|OverrideAction
        # applies only when updating or adding a RuleGroup to a WebACL . In this case, you do not use
        # ActivatedRule|Action . For all other update requests, ActivatedRule|Action is used instead of
        # ActivatedRule|OverrideAction .

        @[JSON::Field(key: "Action")]
        getter action : Types::WafAction?

        # An array of rules to exclude from a rule group. This is applicable only when the ActivatedRule
        # refers to a RuleGroup . Sometimes it is necessary to troubleshoot rule groups that are blocking
        # traffic unexpectedly (false positives). One troubleshooting technique is to identify the specific
        # rule within the rule group that is blocking the legitimate traffic and then disable (exclude) that
        # particular rule. You can exclude rules from both your own rule groups and AWS Marketplace rule
        # groups that have been associated with a web ACL. Specifying ExcludedRules does not remove those
        # rules from the rule group. Rather, it changes the action for the rules to COUNT . Therefore,
        # requests that match an ExcludedRule are counted but not blocked. The RuleGroup owner will receive
        # COUNT metrics for each ExcludedRule . If you want to exclude rules from a rule group that is already
        # associated with a web ACL, perform the following steps: Use the AWS WAF logs to identify the IDs of
        # the rules that you want to exclude. For more information about the logs, see Logging Web ACL Traffic
        # Information . Submit an UpdateWebACL request that has two actions: The first action deletes the
        # existing rule group from the web ACL. That is, in the UpdateWebACL request, the first Updates:Action
        # should be DELETE and Updates:ActivatedRule:RuleId should be the rule group that contains the rules
        # that you want to exclude. The second action inserts the same rule group back in, but specifying the
        # rules to exclude. That is, the second Updates:Action should be INSERT , Updates:ActivatedRule:RuleId
        # should be the rule group that you just removed, and ExcludedRules should contain the rules that you
        # want to exclude.

        @[JSON::Field(key: "ExcludedRules")]
        getter excluded_rules : Array(Types::ExcludedRule)?

        # Use the OverrideAction to test your RuleGroup . Any rule in a RuleGroup can potentially block a
        # request. If you set the OverrideAction to None , the RuleGroup will block a request if any
        # individual rule in the RuleGroup matches the request and is configured to block that request.
        # However if you first want to test the RuleGroup , set the OverrideAction to Count . The RuleGroup
        # will then override any block action specified by individual rules contained within the group.
        # Instead of blocking matching requests, those requests will be counted. You can view a record of
        # counted requests using GetSampledRequests . ActivatedRule|OverrideAction applies only when updating
        # or adding a RuleGroup to a WebACL . In this case you do not use ActivatedRule|Action . For all other
        # update requests, ActivatedRule|Action is used instead of ActivatedRule|OverrideAction .

        @[JSON::Field(key: "OverrideAction")]
        getter override_action : Types::WafOverrideAction?

        # The rule type, either REGULAR , as defined by Rule , RATE_BASED , as defined by RateBasedRule , or
        # GROUP , as defined by RuleGroup . The default is REGULAR. Although this field is optional, be aware
        # that if you try to add a RATE_BASED rule to a web ACL without setting the type, the UpdateWebACL
        # request will fail because the request tries to add a REGULAR rule with the specified ID, which does
        # not exist.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @priority : Int32,
          @rule_id : String,
          @action : Types::WafAction? = nil,
          @excluded_rules : Array(Types::ExcludedRule)? = nil,
          @override_action : Types::WafOverrideAction? = nil,
          @type : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In a
      # GetByteMatchSet request, ByteMatchSet is a complex type that contains the ByteMatchSetId and Name of
      # a ByteMatchSet , and the values that you specified when you updated the ByteMatchSet . A complex
      # type that contains ByteMatchTuple objects, which specify the parts of web requests that you want AWS
      # WAF to inspect and the values that you want AWS WAF to search for. If a ByteMatchSet contains more
      # than one ByteMatchTuple object, a request needs to match the settings in only one ByteMatchTuple to
      # be considered a match.

      struct ByteMatchSet
        include JSON::Serializable

        # The ByteMatchSetId for a ByteMatchSet . You use ByteMatchSetId to get information about a
        # ByteMatchSet (see GetByteMatchSet ), update a ByteMatchSet (see UpdateByteMatchSet ), insert a
        # ByteMatchSet into a Rule or delete one from a Rule (see UpdateRule ), and delete a ByteMatchSet from
        # AWS WAF (see DeleteByteMatchSet ). ByteMatchSetId is returned by CreateByteMatchSet and by
        # ListByteMatchSets .

        @[JSON::Field(key: "ByteMatchSetId")]
        getter byte_match_set_id : String

        # Specifies the bytes (typically a string that corresponds with ASCII characters) that you want AWS
        # WAF to search for in web requests, the location in requests that you want AWS WAF to search, and
        # other settings.

        @[JSON::Field(key: "ByteMatchTuples")]
        getter byte_match_tuples : Array(Types::ByteMatchTuple)

        # A friendly name or description of the ByteMatchSet . You can't change Name after you create a
        # ByteMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @byte_match_set_id : String,
          @byte_match_tuples : Array(Types::ByteMatchTuple),
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returned by ListByteMatchSets . Each ByteMatchSetSummary object includes the Name and ByteMatchSetId
      # for one ByteMatchSet .

      struct ByteMatchSetSummary
        include JSON::Serializable

        # The ByteMatchSetId for a ByteMatchSet . You use ByteMatchSetId to get information about a
        # ByteMatchSet , update a ByteMatchSet , remove a ByteMatchSet from a Rule , and delete a ByteMatchSet
        # from AWS WAF. ByteMatchSetId is returned by CreateByteMatchSet and by ListByteMatchSets .

        @[JSON::Field(key: "ByteMatchSetId")]
        getter byte_match_set_id : String

        # A friendly name or description of the ByteMatchSet . You can't change Name after you create a
        # ByteMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @byte_match_set_id : String,
          @name : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In an
      # UpdateByteMatchSet request, ByteMatchSetUpdate specifies whether to insert or delete a
      # ByteMatchTuple and includes the settings for the ByteMatchTuple .

      struct ByteMatchSetUpdate
        include JSON::Serializable

        # Specifies whether to insert or delete a ByteMatchTuple .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Information about the part of a web request that you want AWS WAF to inspect and the value that you
        # want AWS WAF to search for. If you specify DELETE for the value of Action , the ByteMatchTuple
        # values must exactly match the values in the ByteMatchTuple that you want to delete from the
        # ByteMatchSet .

        @[JSON::Field(key: "ByteMatchTuple")]
        getter byte_match_tuple : Types::ByteMatchTuple

        def initialize(
          @action : String,
          @byte_match_tuple : Types::ByteMatchTuple
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to search
      # for in web requests, the location in requests that you want AWS WAF to search, and other settings.

      struct ByteMatchTuple
        include JSON::Serializable

        # The part of a web request that you want AWS WAF to search, such as a specified header or a query
        # string. For more information, see FieldToMatch .

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Within the portion of a web request that you want to search (for example, in the query string, if
        # any), specify where you want AWS WAF to search. Valid values include the following: CONTAINS The
        # specified part of the web request must include the value of TargetString , but the location doesn't
        # matter. CONTAINS_WORD The specified part of the web request must include the value of TargetString ,
        # and TargetString must contain only alphanumeric characters or underscore (A-Z, a-z, 0-9, or _). In
        # addition, TargetString must be a word, which means one of the following: TargetString exactly
        # matches the value of the specified part of the web request, such as the value of a header.
        # TargetString is at the beginning of the specified part of the web request and is followed by a
        # character other than an alphanumeric character or underscore (_), for example, BadBot; .
        # TargetString is at the end of the specified part of the web request and is preceded by a character
        # other than an alphanumeric character or underscore (_), for example, ;BadBot . TargetString is in
        # the middle of the specified part of the web request and is preceded and followed by characters other
        # than alphanumeric characters or underscore (_), for example, -BadBot; . EXACTLY The value of the
        # specified part of the web request must exactly match the value of TargetString . STARTS_WITH The
        # value of TargetString must appear at the beginning of the specified part of the web request.
        # ENDS_WITH The value of TargetString must appear at the end of the specified part of the web request.

        @[JSON::Field(key: "PositionalConstraint")]
        getter positional_constraint : String

        # The value that you want AWS WAF to search for. AWS WAF searches for the specified string in the part
        # of web requests that you specified in FieldToMatch . The maximum length of the value is 50 bytes.
        # Valid values depend on the values that you specified for FieldToMatch : HEADER : The value that you
        # want AWS WAF to search for in the request header that you specified in FieldToMatch , for example,
        # the value of the User-Agent or Referer header. METHOD : The HTTP method, which indicates the type of
        # operation specified in the request. CloudFront supports the following methods: DELETE , GET , HEAD ,
        # OPTIONS , PATCH , POST , and PUT . QUERY_STRING : The value that you want AWS WAF to search for in
        # the query string, which is the part of a URL that appears after a ? character. URI : The value that
        # you want AWS WAF to search for in the part of a URL that identifies a resource, for example,
        # /images/daily-ad.jpg . BODY : The part of a request that contains any additional data that you want
        # to send to your web server as the HTTP request body, such as data from a form. The request body
        # immediately follows the request headers. Note that only the first 8192 bytes of the request body are
        # forwarded to AWS WAF for inspection. To allow or block requests based on the length of the body, you
        # can create a size constraint set. For more information, see CreateSizeConstraintSet .
        # SINGLE_QUERY_ARG : The parameter in the query string that you will inspect, such as UserName or
        # SalesRegion . The maximum length for SINGLE_QUERY_ARG is 30 characters. ALL_QUERY_ARGS : Similar to
        # SINGLE_QUERY_ARG , but instead of inspecting a single parameter, AWS WAF inspects all parameters
        # within the query string for the value or regex pattern that you specify in TargetString . If
        # TargetString includes alphabetic characters A-Z and a-z, note that the value is case sensitive. If
        # you're using the AWS WAF API Specify a base64-encoded version of the value. The maximum length of
        # the value before you base64-encode it is 50 bytes. For example, suppose the value of Type is HEADER
        # and the value of Data is User-Agent . If you want to search the User-Agent header for the value
        # BadBot , you base64-encode BadBot using MIME base64-encoding and include the resulting value,
        # QmFkQm90 , in the value of TargetString . If you're using the AWS CLI or one of the AWS SDKs The
        # value that you want AWS WAF to search for. The SDK automatically base64 encodes the value.

        @[JSON::Field(key: "TargetString")]
        getter target_string : Bytes

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on
        # FieldToMatch before inspecting it for a match. You can only specify a single type of
        # TextTransformation. CMD_LINE When you're concerned that attackers are injecting an operating system
        # command line command and using unusual formatting to disguise some or all of the command, use this
        # option to perform the following transformations: Delete the following characters: \ " ' ^ Delete
        # spaces before the following characters: / ( Replace the following characters with a space: , ;
        # Replace multiple spaces with one space Convert uppercase letters (A-Z) to lowercase (a-z)
        # COMPRESS_WHITE_SPACE Use this option to replace the following characters with a space character
        # (decimal 32): \f, formfeed, decimal 12 \t, tab, decimal 9 \n, newline, decimal 10 \r, carriage
        # return, decimal 13 \v, vertical tab, decimal 11 non-breaking space, decimal 160 COMPRESS_WHITE_SPACE
        # also replaces multiple spaces with one space. HTML_ENTITY_DECODE Use this option to replace
        # HTML-encoded characters with unencoded characters. HTML_ENTITY_DECODE performs the following
        # operations: Replaces (ampersand)quot; with " Replaces (ampersand)nbsp; with a non-breaking space,
        # decimal 160 Replaces (ampersand)lt; with a "less than" symbol Replaces (ampersand)gt; with &gt;
        # Replaces characters that are represented in hexadecimal format, (ampersand)#xhhhh; , with the
        # corresponding characters Replaces characters that are represented in decimal format,
        # (ampersand)#nnnn; , with the corresponding characters LOWERCASE Use this option to convert uppercase
        # letters (A-Z) to lowercase (a-z). URL_DECODE Use this option to decode a URL-encoded value. NONE
        # Specify NONE if you don't want to perform any text transformations.

        @[JSON::Field(key: "TextTransformation")]
        getter text_transformation : String

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @positional_constraint : String,
          @target_string : Bytes,
          @text_transformation : String
        )
        end
      end


      struct CreateByteMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the ByteMatchSet . You can't change Name after you create a
        # ByteMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateByteMatchSetResponse
        include JSON::Serializable

        # A ByteMatchSet that contains no ByteMatchTuple objects.

        @[JSON::Field(key: "ByteMatchSet")]
        getter byte_match_set : Types::ByteMatchSet?

        # The ChangeToken that you used to submit the CreateByteMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @byte_match_set : Types::ByteMatchSet? = nil,
          @change_token : String? = nil
        )
        end
      end


      struct CreateGeoMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the GeoMatchSet . You can't change Name after you create the
        # GeoMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateGeoMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateGeoMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # The GeoMatchSet returned in the CreateGeoMatchSet response. The GeoMatchSet contains no
        # GeoMatchConstraints .

        @[JSON::Field(key: "GeoMatchSet")]
        getter geo_match_set : Types::GeoMatchSet?

        def initialize(
          @change_token : String? = nil,
          @geo_match_set : Types::GeoMatchSet? = nil
        )
        end
      end


      struct CreateIPSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the IPSet . You can't change Name after you create the IPSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateIPSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateIPSet request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # The IPSet returned in the CreateIPSet response.

        @[JSON::Field(key: "IPSet")]
        getter ip_set : Types::IPSet?

        def initialize(
          @change_token : String? = nil,
          @ip_set : Types::IPSet? = nil
        )
        end
      end


      struct CreateRateBasedRuleRequest
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRateBasedRule request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description for the metrics for this RateBasedRule . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the RateBasedRule .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A friendly name or description of the RateBasedRule . You can't change the name of a RateBasedRule
        # after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The field that AWS WAF uses to determine if requests are likely arriving from a single source and
        # thus subject to rate monitoring. The only valid value for RateKey is IP . IP indicates that requests
        # that arrive from the same IP address are subject to the RateLimit that is specified in the
        # RateBasedRule .

        @[JSON::Field(key: "RateKey")]
        getter rate_key : String

        # The maximum number of requests, which have an identical value in the field that is specified by
        # RateKey , allowed in a five-minute period. If the number of requests exceeds the RateLimit and the
        # other predicates specified in the rule are also met, AWS WAF triggers the action that is specified
        # for this rule.

        @[JSON::Field(key: "RateLimit")]
        getter rate_limit : Int64


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @change_token : String,
          @metric_name : String,
          @name : String,
          @rate_key : String,
          @rate_limit : Int64,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRateBasedRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRateBasedRule request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # The RateBasedRule that is returned in the CreateRateBasedRule response.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::RateBasedRule?

        def initialize(
          @change_token : String? = nil,
          @rule : Types::RateBasedRule? = nil
        )
        end
      end


      struct CreateRegexMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the RegexMatchSet . You can't change Name after you create a
        # RegexMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateRegexMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRegexMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # A RegexMatchSet that contains no RegexMatchTuple objects.

        @[JSON::Field(key: "RegexMatchSet")]
        getter regex_match_set : Types::RegexMatchSet?

        def initialize(
          @change_token : String? = nil,
          @regex_match_set : Types::RegexMatchSet? = nil
        )
        end
      end


      struct CreateRegexPatternSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the RegexPatternSet . You can't change Name after you create a
        # RegexPatternSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateRegexPatternSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRegexPatternSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # A RegexPatternSet that contains no objects.

        @[JSON::Field(key: "RegexPatternSet")]
        getter regex_pattern_set : Types::RegexPatternSet?

        def initialize(
          @change_token : String? = nil,
          @regex_pattern_set : Types::RegexPatternSet? = nil
        )
        end
      end


      struct CreateRuleGroupRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description for the metrics for this RuleGroup . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the RuleGroup .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A friendly name or description of the RuleGroup . You can't change Name after you create a RuleGroup
        # .

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @change_token : String,
          @metric_name : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleGroupResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRuleGroup request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # An empty RuleGroup .

        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        def initialize(
          @change_token : String? = nil,
          @rule_group : Types::RuleGroup? = nil
        )
        end
      end


      struct CreateRuleRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description for the metrics for this Rule . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the Rule .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A friendly name or description of the Rule . You can't change the name of a Rule after you create
        # it.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @change_token : String,
          @metric_name : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateRule request. You can also use this value to query
        # the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # The Rule returned in the CreateRule response.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::Rule?

        def initialize(
          @change_token : String? = nil,
          @rule : Types::Rule? = nil
        )
        end
      end


      struct CreateSizeConstraintSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description of the SizeConstraintSet . You can't change Name after you create a
        # SizeConstraintSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end


      struct CreateSizeConstraintSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateSizeConstraintSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # A SizeConstraintSet that contains no SizeConstraint objects.

        @[JSON::Field(key: "SizeConstraintSet")]
        getter size_constraint_set : Types::SizeConstraintSet?

        def initialize(
          @change_token : String? = nil,
          @size_constraint_set : Types::SizeConstraintSet? = nil
        )
        end
      end

      # A request to create a SqlInjectionMatchSet .

      struct CreateSqlInjectionMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description for the SqlInjectionMatchSet that you're creating. You can't change
        # Name after you create the SqlInjectionMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end

      # The response to a CreateSqlInjectionMatchSet request.

      struct CreateSqlInjectionMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateSqlInjectionMatchSet request. You can also use
        # this value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # A SqlInjectionMatchSet .

        @[JSON::Field(key: "SqlInjectionMatchSet")]
        getter sql_injection_match_set : Types::SqlInjectionMatchSet?

        def initialize(
          @change_token : String? = nil,
          @sql_injection_match_set : Types::SqlInjectionMatchSet? = nil
        )
        end
      end


      struct CreateWebACLMigrationStackRequest
        include JSON::Serializable

        # Indicates whether to exclude entities that can't be migrated or to stop the migration. Set this to
        # true to ignore unsupported entities in the web ACL during the migration. Otherwise, if AWS WAF
        # encounters unsupported entities, it stops the process and throws an exception.

        @[JSON::Field(key: "IgnoreUnsupportedType")]
        getter ignore_unsupported_type : Bool

        # The name of the Amazon S3 bucket to store the CloudFormation template in. The S3 bucket must be
        # configured as follows for the migration: The bucket name must start with aws-waf-migration- . For
        # example, aws-waf-migration-my-web-acl . The bucket must be in the Region where you are deploying the
        # template. For example, for a web ACL in us-west-2, you must use an Amazon S3 bucket in us-west-2 and
        # you must deploy the template stack to us-west-2. The bucket policies must permit the migration
        # process to write data. For listings of the bucket policies, see the Examples section.

        @[JSON::Field(key: "S3BucketName")]
        getter s3_bucket_name : String

        # The UUID of the WAF Classic web ACL that you want to migrate to WAF v2.

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        def initialize(
          @ignore_unsupported_type : Bool,
          @s3_bucket_name : String,
          @web_acl_id : String
        )
        end
      end


      struct CreateWebACLMigrationStackResponse
        include JSON::Serializable

        # The URL of the template created in Amazon S3.

        @[JSON::Field(key: "S3ObjectUrl")]
        getter s3_object_url : String

        def initialize(
          @s3_object_url : String
        )
        end
      end


      struct CreateWebACLRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The action that you want AWS WAF to take when a request doesn't match the criteria specified in any
        # of the Rule objects that are associated with the WebACL .

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::WafAction

        # A friendly name or description for the metrics for this WebACL .The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change MetricName after you create the WebACL .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A friendly name or description of the WebACL . You can't change Name after you create the WebACL .

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @change_token : String,
          @default_action : Types::WafAction,
          @metric_name : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateWebACLResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateWebACL request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # The WebACL returned in the CreateWebACL response.

        @[JSON::Field(key: "WebACL")]
        getter web_acl : Types::WebACL?

        def initialize(
          @change_token : String? = nil,
          @web_acl : Types::WebACL? = nil
        )
        end
      end

      # A request to create an XssMatchSet .

      struct CreateXssMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # A friendly name or description for the XssMatchSet that you're creating. You can't change Name after
        # you create the XssMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @change_token : String,
          @name : String
        )
        end
      end

      # The response to a CreateXssMatchSet request.

      struct CreateXssMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the CreateXssMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        # An XssMatchSet .

        @[JSON::Field(key: "XssMatchSet")]
        getter xss_match_set : Types::XssMatchSet?

        def initialize(
          @change_token : String? = nil,
          @xss_match_set : Types::XssMatchSet? = nil
        )
        end
      end


      struct DeleteByteMatchSetRequest
        include JSON::Serializable

        # The ByteMatchSetId of the ByteMatchSet that you want to delete. ByteMatchSetId is returned by
        # CreateByteMatchSet and by ListByteMatchSets .

        @[JSON::Field(key: "ByteMatchSetId")]
        getter byte_match_set_id : String

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        def initialize(
          @byte_match_set_id : String,
          @change_token : String
        )
        end
      end


      struct DeleteByteMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteByteMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteGeoMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The GeoMatchSetID of the GeoMatchSet that you want to delete. GeoMatchSetId is returned by
        # CreateGeoMatchSet and by ListGeoMatchSets .

        @[JSON::Field(key: "GeoMatchSetId")]
        getter geo_match_set_id : String

        def initialize(
          @change_token : String,
          @geo_match_set_id : String
        )
        end
      end


      struct DeleteGeoMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteGeoMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteIPSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The IPSetId of the IPSet that you want to delete. IPSetId is returned by CreateIPSet and by
        # ListIPSets .

        @[JSON::Field(key: "IPSetId")]
        getter ip_set_id : String

        def initialize(
          @change_token : String,
          @ip_set_id : String
        )
        end
      end


      struct DeleteIPSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteIPSet request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL from which you want to delete the LoggingConfiguration
        # .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
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

        # The Amazon Resource Name (ARN) of the RuleGroup from which you want to delete the policy. The user
        # making the request must be the owner of the RuleGroup.

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


      struct DeleteRateBasedRuleRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RuleId of the RateBasedRule that you want to delete. RuleId is returned by CreateRateBasedRule
        # and by ListRateBasedRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @change_token : String,
          @rule_id : String
        )
        end
      end


      struct DeleteRateBasedRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteRateBasedRule request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteRegexMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RegexMatchSetId of the RegexMatchSet that you want to delete. RegexMatchSetId is returned by
        # CreateRegexMatchSet and by ListRegexMatchSets .

        @[JSON::Field(key: "RegexMatchSetId")]
        getter regex_match_set_id : String

        def initialize(
          @change_token : String,
          @regex_match_set_id : String
        )
        end
      end


      struct DeleteRegexMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteRegexMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteRegexPatternSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RegexPatternSetId of the RegexPatternSet that you want to delete. RegexPatternSetId is returned
        # by CreateRegexPatternSet and by ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        def initialize(
          @change_token : String,
          @regex_pattern_set_id : String
        )
        end
      end


      struct DeleteRegexPatternSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteRegexPatternSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteRuleGroupRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RuleGroupId of the RuleGroup that you want to delete. RuleGroupId is returned by CreateRuleGroup
        # and by ListRuleGroups .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        def initialize(
          @change_token : String,
          @rule_group_id : String
        )
        end
      end


      struct DeleteRuleGroupResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteRuleGroup request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteRuleRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RuleId of the Rule that you want to delete. RuleId is returned by CreateRule and by ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @change_token : String,
          @rule_id : String
        )
        end
      end


      struct DeleteRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteRule request. You can also use this value to query
        # the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteSizeConstraintSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The SizeConstraintSetId of the SizeConstraintSet that you want to delete. SizeConstraintSetId is
        # returned by CreateSizeConstraintSet and by ListSizeConstraintSets .

        @[JSON::Field(key: "SizeConstraintSetId")]
        getter size_constraint_set_id : String

        def initialize(
          @change_token : String,
          @size_constraint_set_id : String
        )
        end
      end


      struct DeleteSizeConstraintSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteSizeConstraintSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end

      # A request to delete a SqlInjectionMatchSet from AWS WAF.

      struct DeleteSqlInjectionMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to delete.
        # SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets .

        @[JSON::Field(key: "SqlInjectionMatchSetId")]
        getter sql_injection_match_set_id : String

        def initialize(
          @change_token : String,
          @sql_injection_match_set_id : String
        )
        end
      end

      # The response to a request to delete a SqlInjectionMatchSet from AWS WAF.

      struct DeleteSqlInjectionMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteSqlInjectionMatchSet request. You can also use
        # this value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct DeleteWebACLRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The WebACLId of the WebACL that you want to delete. WebACLId is returned by CreateWebACL and by
        # ListWebACLs .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        def initialize(
          @change_token : String,
          @web_acl_id : String
        )
        end
      end


      struct DeleteWebACLResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteWebACL request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end

      # A request to delete an XssMatchSet from AWS WAF.

      struct DeleteXssMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The XssMatchSetId of the XssMatchSet that you want to delete. XssMatchSetId is returned by
        # CreateXssMatchSet and by ListXssMatchSets .

        @[JSON::Field(key: "XssMatchSetId")]
        getter xss_match_set_id : String

        def initialize(
          @change_token : String,
          @xss_match_set_id : String
        )
        end
      end

      # The response to a request to delete an XssMatchSet from AWS WAF.

      struct DeleteXssMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the DeleteXssMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # rule to exclude from a rule group. This is applicable only when the ActivatedRule refers to a
      # RuleGroup . The rule must belong to the RuleGroup that is specified by the ActivatedRule .

      struct ExcludedRule
        include JSON::Serializable

        # The unique identifier for the rule to exclude from the rule group.

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @rule_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies where in a web request to look for TargetString .

      struct FieldToMatch
        include JSON::Serializable

        # The part of the web request that you want AWS WAF to search for a specified string. Parts of a
        # request that you can search include the following: HEADER : A specified request header, for example,
        # the value of the User-Agent or Referer header. If you choose HEADER for the type, specify the name
        # of the header in Data . METHOD : The HTTP method, which indicated the type of operation that the
        # request is asking the origin to perform. Amazon CloudFront supports the following methods: DELETE ,
        # GET , HEAD , OPTIONS , PATCH , POST , and PUT . QUERY_STRING : A query string, which is the part of
        # a URL that appears after a ? character, if any. URI : The part of a web request that identifies a
        # resource, for example, /images/daily-ad.jpg . BODY : The part of a request that contains any
        # additional data that you want to send to your web server as the HTTP request body, such as data from
        # a form. The request body immediately follows the request headers. Note that only the first 8192
        # bytes of the request body are forwarded to AWS WAF for inspection. To allow or block requests based
        # on the length of the body, you can create a size constraint set. For more information, see
        # CreateSizeConstraintSet . SINGLE_QUERY_ARG : The parameter in the query string that you will
        # inspect, such as UserName or SalesRegion . The maximum length for SINGLE_QUERY_ARG is 30 characters.
        # ALL_QUERY_ARGS : Similar to SINGLE_QUERY_ARG , but rather than inspecting a single parameter, AWS
        # WAF will inspect all parameters within the query for the value or regex pattern that you specify in
        # TargetString .

        @[JSON::Field(key: "Type")]
        getter type : String

        # When the value of Type is HEADER , enter the name of the header that you want AWS WAF to search, for
        # example, User-Agent or Referer . The name of the header is not case sensitive. When the value of
        # Type is SINGLE_QUERY_ARG , enter the name of the parameter that you want AWS WAF to search, for
        # example, UserName or SalesRegion . The parameter name is not case sensitive. If the value of Type is
        # any other value, omit Data .

        @[JSON::Field(key: "Data")]
        getter data : String?

        def initialize(
          @type : String,
          @data : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # country from which web requests originate that you want AWS WAF to search for.

      struct GeoMatchConstraint
        include JSON::Serializable

        # The type of geographical area you want AWS WAF to search for. Currently Country is the only valid
        # value.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The country that you want AWS WAF to search for.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains one or more countries that AWS WAF will search for.

      struct GeoMatchSet
        include JSON::Serializable

        # An array of GeoMatchConstraint objects, which contain the country that you want AWS WAF to search
        # for.

        @[JSON::Field(key: "GeoMatchConstraints")]
        getter geo_match_constraints : Array(Types::GeoMatchConstraint)

        # The GeoMatchSetId for an GeoMatchSet . You use GeoMatchSetId to get information about a GeoMatchSet
        # (see GeoMatchSet ), update a GeoMatchSet (see UpdateGeoMatchSet ), insert a GeoMatchSet into a Rule
        # or delete one from a Rule (see UpdateRule ), and delete a GeoMatchSet from AWS WAF (see
        # DeleteGeoMatchSet ). GeoMatchSetId is returned by CreateGeoMatchSet and by ListGeoMatchSets .

        @[JSON::Field(key: "GeoMatchSetId")]
        getter geo_match_set_id : String

        # A friendly name or description of the GeoMatchSet . You can't change the name of an GeoMatchSet
        # after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @geo_match_constraints : Array(Types::GeoMatchConstraint),
          @geo_match_set_id : String,
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the identifier and the name of the GeoMatchSet .

      struct GeoMatchSetSummary
        include JSON::Serializable

        # The GeoMatchSetId for an GeoMatchSet . You can use GeoMatchSetId in a GetGeoMatchSet request to get
        # detailed information about an GeoMatchSet .

        @[JSON::Field(key: "GeoMatchSetId")]
        getter geo_match_set_id : String

        # A friendly name or description of the GeoMatchSet . You can't change the name of an GeoMatchSet
        # after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @geo_match_set_id : String,
          @name : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the type of update to perform to an GeoMatchSet with UpdateGeoMatchSet .

      struct GeoMatchSetUpdate
        include JSON::Serializable

        # Specifies whether to insert or delete a country with UpdateGeoMatchSet .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The country from which web requests originate that you want AWS WAF to search for.

        @[JSON::Field(key: "GeoMatchConstraint")]
        getter geo_match_constraint : Types::GeoMatchConstraint

        def initialize(
          @action : String,
          @geo_match_constraint : Types::GeoMatchConstraint
        )
        end
      end


      struct GetByteMatchSetRequest
        include JSON::Serializable

        # The ByteMatchSetId of the ByteMatchSet that you want to get. ByteMatchSetId is returned by
        # CreateByteMatchSet and by ListByteMatchSets .

        @[JSON::Field(key: "ByteMatchSetId")]
        getter byte_match_set_id : String

        def initialize(
          @byte_match_set_id : String
        )
        end
      end


      struct GetByteMatchSetResponse
        include JSON::Serializable

        # Information about the ByteMatchSet that you specified in the GetByteMatchSet request. For more
        # information, see the following topics: ByteMatchSet : Contains ByteMatchSetId , ByteMatchTuples ,
        # and Name ByteMatchTuples : Contains an array of ByteMatchTuple objects. Each ByteMatchTuple object
        # contains FieldToMatch , PositionalConstraint , TargetString , and TextTransformation FieldToMatch :
        # Contains Data and Type

        @[JSON::Field(key: "ByteMatchSet")]
        getter byte_match_set : Types::ByteMatchSet?

        def initialize(
          @byte_match_set : Types::ByteMatchSet? = nil
        )
        end
      end


      struct GetChangeTokenRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetChangeTokenResponse
        include JSON::Serializable

        # The ChangeToken that you used in the request. Use this value in a GetChangeTokenStatus request to
        # get the current status of the request.

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct GetChangeTokenStatusRequest
        include JSON::Serializable

        # The change token for which you want to get the status. This change token was previously returned in
        # the GetChangeToken response.

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        def initialize(
          @change_token : String
        )
        end
      end


      struct GetChangeTokenStatusResponse
        include JSON::Serializable

        # The status of the change token.

        @[JSON::Field(key: "ChangeTokenStatus")]
        getter change_token_status : String?

        def initialize(
          @change_token_status : String? = nil
        )
        end
      end


      struct GetGeoMatchSetRequest
        include JSON::Serializable

        # The GeoMatchSetId of the GeoMatchSet that you want to get. GeoMatchSetId is returned by
        # CreateGeoMatchSet and by ListGeoMatchSets .

        @[JSON::Field(key: "GeoMatchSetId")]
        getter geo_match_set_id : String

        def initialize(
          @geo_match_set_id : String
        )
        end
      end


      struct GetGeoMatchSetResponse
        include JSON::Serializable

        # Information about the GeoMatchSet that you specified in the GetGeoMatchSet request. This includes
        # the Type , which for a GeoMatchContraint is always Country , as well as the Value , which is the
        # identifier for a specific country.

        @[JSON::Field(key: "GeoMatchSet")]
        getter geo_match_set : Types::GeoMatchSet?

        def initialize(
          @geo_match_set : Types::GeoMatchSet? = nil
        )
        end
      end


      struct GetIPSetRequest
        include JSON::Serializable

        # The IPSetId of the IPSet that you want to get. IPSetId is returned by CreateIPSet and by ListIPSets
        # .

        @[JSON::Field(key: "IPSetId")]
        getter ip_set_id : String

        def initialize(
          @ip_set_id : String
        )
        end
      end


      struct GetIPSetResponse
        include JSON::Serializable

        # Information about the IPSet that you specified in the GetIPSet request. For more information, see
        # the following topics: IPSet : Contains IPSetDescriptors , IPSetId , and Name IPSetDescriptors :
        # Contains an array of IPSetDescriptor objects. Each IPSetDescriptor object contains Type and Value

        @[JSON::Field(key: "IPSet")]
        getter ip_set : Types::IPSet?

        def initialize(
          @ip_set : Types::IPSet? = nil
        )
        end
      end


      struct GetLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the web ACL for which you want to get the LoggingConfiguration .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
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


      struct GetPermissionPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the RuleGroup for which you want to get the policy.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetPermissionPolicyResponse
        include JSON::Serializable

        # The IAM policy attached to the specified RuleGroup.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetRateBasedRuleManagedKeysRequest
        include JSON::Serializable

        # The RuleId of the RateBasedRule for which you want to get a list of ManagedKeys . RuleId is returned
        # by CreateRateBasedRule and by ListRateBasedRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # A null value and not currently used. Do not include this in your request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @rule_id : String,
          @next_marker : String? = nil
        )
        end
      end


      struct GetRateBasedRuleManagedKeysResponse
        include JSON::Serializable

        # An array of IP addresses that currently are blocked by the specified RateBasedRule .

        @[JSON::Field(key: "ManagedKeys")]
        getter managed_keys : Array(String)?

        # A null value and not currently used.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @managed_keys : Array(String)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct GetRateBasedRuleRequest
        include JSON::Serializable

        # The RuleId of the RateBasedRule that you want to get. RuleId is returned by CreateRateBasedRule and
        # by ListRateBasedRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @rule_id : String
        )
        end
      end


      struct GetRateBasedRuleResponse
        include JSON::Serializable

        # Information about the RateBasedRule that you specified in the GetRateBasedRule request.

        @[JSON::Field(key: "Rule")]
        getter rule : Types::RateBasedRule?

        def initialize(
          @rule : Types::RateBasedRule? = nil
        )
        end
      end


      struct GetRegexMatchSetRequest
        include JSON::Serializable

        # The RegexMatchSetId of the RegexMatchSet that you want to get. RegexMatchSetId is returned by
        # CreateRegexMatchSet and by ListRegexMatchSets .

        @[JSON::Field(key: "RegexMatchSetId")]
        getter regex_match_set_id : String

        def initialize(
          @regex_match_set_id : String
        )
        end
      end


      struct GetRegexMatchSetResponse
        include JSON::Serializable

        # Information about the RegexMatchSet that you specified in the GetRegexMatchSet request. For more
        # information, see RegexMatchTuple .

        @[JSON::Field(key: "RegexMatchSet")]
        getter regex_match_set : Types::RegexMatchSet?

        def initialize(
          @regex_match_set : Types::RegexMatchSet? = nil
        )
        end
      end


      struct GetRegexPatternSetRequest
        include JSON::Serializable

        # The RegexPatternSetId of the RegexPatternSet that you want to get. RegexPatternSetId is returned by
        # CreateRegexPatternSet and by ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        def initialize(
          @regex_pattern_set_id : String
        )
        end
      end


      struct GetRegexPatternSetResponse
        include JSON::Serializable

        # Information about the RegexPatternSet that you specified in the GetRegexPatternSet request,
        # including the identifier of the pattern set and the regular expression patterns you want AWS WAF to
        # search for.

        @[JSON::Field(key: "RegexPatternSet")]
        getter regex_pattern_set : Types::RegexPatternSet?

        def initialize(
          @regex_pattern_set : Types::RegexPatternSet? = nil
        )
        end
      end


      struct GetRuleGroupRequest
        include JSON::Serializable

        # The RuleGroupId of the RuleGroup that you want to get. RuleGroupId is returned by CreateRuleGroup
        # and by ListRuleGroups .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        def initialize(
          @rule_group_id : String
        )
        end
      end


      struct GetRuleGroupResponse
        include JSON::Serializable

        # Information about the RuleGroup that you specified in the GetRuleGroup request.

        @[JSON::Field(key: "RuleGroup")]
        getter rule_group : Types::RuleGroup?

        def initialize(
          @rule_group : Types::RuleGroup? = nil
        )
        end
      end


      struct GetRuleRequest
        include JSON::Serializable

        # The RuleId of the Rule that you want to get. RuleId is returned by CreateRule and by ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @rule_id : String
        )
        end
      end


      struct GetRuleResponse
        include JSON::Serializable

        # Information about the Rule that you specified in the GetRule request. For more information, see the
        # following topics: Rule : Contains MetricName , Name , an array of Predicate objects, and RuleId
        # Predicate : Each Predicate object contains DataId , Negated , and Type

        @[JSON::Field(key: "Rule")]
        getter rule : Types::Rule?

        def initialize(
          @rule : Types::Rule? = nil
        )
        end
      end


      struct GetSampledRequestsRequest
        include JSON::Serializable

        # The number of requests that you want AWS WAF to return from among the first 5,000 requests that your
        # AWS resource received during the time range. If your resource received fewer requests than the value
        # of MaxItems , GetSampledRequests returns information about all of them.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int64

        # RuleId is one of three values: The RuleId of the Rule or the RuleGroupId of the RuleGroup for which
        # you want GetSampledRequests to return a sample of requests. Default_Action , which causes
        # GetSampledRequests to return a sample of the requests that didn't match any of the rules in the
        # specified WebACL .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # The start date and time and the end date and time of the range for which you want GetSampledRequests
        # to return a sample of requests. You must specify the times in Coordinated Universal Time (UTC)
        # format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z" . You can
        # specify any time range in the previous three hours.

        @[JSON::Field(key: "TimeWindow")]
        getter time_window : Types::TimeWindow

        # The WebACLId of the WebACL for which you want GetSampledRequests to return a sample of requests.

        @[JSON::Field(key: "WebAclId")]
        getter web_acl_id : String

        def initialize(
          @max_items : Int64,
          @rule_id : String,
          @time_window : Types::TimeWindow,
          @web_acl_id : String
        )
        end
      end


      struct GetSampledRequestsResponse
        include JSON::Serializable

        # The total number of requests from which GetSampledRequests got a sample of MaxItems requests. If
        # PopulationSize is less than MaxItems , the sample includes every request that your AWS resource
        # received during the specified time range.

        @[JSON::Field(key: "PopulationSize")]
        getter population_size : Int64?

        # A complex type that contains detailed information about each of the requests in the sample.

        @[JSON::Field(key: "SampledRequests")]
        getter sampled_requests : Array(Types::SampledHTTPRequest)?

        # Usually, TimeWindow is the time range that you specified in the GetSampledRequests request. However,
        # if your AWS resource received more than 5,000 requests during the time range that you specified in
        # the request, GetSampledRequests returns the time range for the first 5,000 requests. Times are in
        # Coordinated Universal Time (UTC) format.

        @[JSON::Field(key: "TimeWindow")]
        getter time_window : Types::TimeWindow?

        def initialize(
          @population_size : Int64? = nil,
          @sampled_requests : Array(Types::SampledHTTPRequest)? = nil,
          @time_window : Types::TimeWindow? = nil
        )
        end
      end


      struct GetSizeConstraintSetRequest
        include JSON::Serializable

        # The SizeConstraintSetId of the SizeConstraintSet that you want to get. SizeConstraintSetId is
        # returned by CreateSizeConstraintSet and by ListSizeConstraintSets .

        @[JSON::Field(key: "SizeConstraintSetId")]
        getter size_constraint_set_id : String

        def initialize(
          @size_constraint_set_id : String
        )
        end
      end


      struct GetSizeConstraintSetResponse
        include JSON::Serializable

        # Information about the SizeConstraintSet that you specified in the GetSizeConstraintSet request. For
        # more information, see the following topics: SizeConstraintSet : Contains SizeConstraintSetId ,
        # SizeConstraints , and Name SizeConstraints : Contains an array of SizeConstraint objects. Each
        # SizeConstraint object contains FieldToMatch , TextTransformation , ComparisonOperator , and Size
        # FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "SizeConstraintSet")]
        getter size_constraint_set : Types::SizeConstraintSet?

        def initialize(
          @size_constraint_set : Types::SizeConstraintSet? = nil
        )
        end
      end

      # A request to get a SqlInjectionMatchSet .

      struct GetSqlInjectionMatchSetRequest
        include JSON::Serializable

        # The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to get. SqlInjectionMatchSetId
        # is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets .

        @[JSON::Field(key: "SqlInjectionMatchSetId")]
        getter sql_injection_match_set_id : String

        def initialize(
          @sql_injection_match_set_id : String
        )
        end
      end

      # The response to a GetSqlInjectionMatchSet request.

      struct GetSqlInjectionMatchSetResponse
        include JSON::Serializable

        # Information about the SqlInjectionMatchSet that you specified in the GetSqlInjectionMatchSet
        # request. For more information, see the following topics: SqlInjectionMatchSet : Contains Name ,
        # SqlInjectionMatchSetId , and an array of SqlInjectionMatchTuple objects SqlInjectionMatchTuple :
        # Each SqlInjectionMatchTuple object contains FieldToMatch and TextTransformation FieldToMatch :
        # Contains Data and Type

        @[JSON::Field(key: "SqlInjectionMatchSet")]
        getter sql_injection_match_set : Types::SqlInjectionMatchSet?

        def initialize(
          @sql_injection_match_set : Types::SqlInjectionMatchSet? = nil
        )
        end
      end


      struct GetWebACLRequest
        include JSON::Serializable

        # The WebACLId of the WebACL that you want to get. WebACLId is returned by CreateWebACL and by
        # ListWebACLs .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        def initialize(
          @web_acl_id : String
        )
        end
      end


      struct GetWebACLResponse
        include JSON::Serializable

        # Information about the WebACL that you specified in the GetWebACL request. For more information, see
        # the following topics: WebACL : Contains DefaultAction , MetricName , Name , an array of Rule
        # objects, and WebACLId DefaultAction (Data type is WafAction ): Contains Type Rules : Contains an
        # array of ActivatedRule objects, which contain Action , Priority , and RuleId Action : Contains Type

        @[JSON::Field(key: "WebACL")]
        getter web_acl : Types::WebACL?

        def initialize(
          @web_acl : Types::WebACL? = nil
        )
        end
      end

      # A request to get an XssMatchSet .

      struct GetXssMatchSetRequest
        include JSON::Serializable

        # The XssMatchSetId of the XssMatchSet that you want to get. XssMatchSetId is returned by
        # CreateXssMatchSet and by ListXssMatchSets .

        @[JSON::Field(key: "XssMatchSetId")]
        getter xss_match_set_id : String

        def initialize(
          @xss_match_set_id : String
        )
        end
      end

      # The response to a GetXssMatchSet request.

      struct GetXssMatchSetResponse
        include JSON::Serializable

        # Information about the XssMatchSet that you specified in the GetXssMatchSet request. For more
        # information, see the following topics: XssMatchSet : Contains Name , XssMatchSetId , and an array of
        # XssMatchTuple objects XssMatchTuple : Each XssMatchTuple object contains FieldToMatch and
        # TextTransformation FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "XssMatchSet")]
        getter xss_match_set : Types::XssMatchSet?

        def initialize(
          @xss_match_set : Types::XssMatchSet? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # response from a GetSampledRequests request includes an HTTPHeader complex type that appears as
      # Headers in the response syntax. HTTPHeader contains the names and values of all of the headers that
      # appear in one of the web requests that were returned by GetSampledRequests .

      struct HTTPHeader
        include JSON::Serializable

        # The name of one of the headers in the sampled web request.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of one of the headers in the sampled web request.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # response from a GetSampledRequests request includes an HTTPRequest complex type that appears as
      # Request in the response syntax. HTTPRequest contains information about one of the web requests that
      # were returned by GetSampledRequests .

      struct HTTPRequest
        include JSON::Serializable

        # The IP address that the request originated from. If the WebACL is associated with a CloudFront
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

        # A complex type that contains two values for each header in the sampled web request: the name of the
        # header and the value of the header.

        @[JSON::Field(key: "Headers")]
        getter headers : Array(Types::HTTPHeader)?

        # The HTTP method specified in the sampled web request. CloudFront supports the following methods:
        # DELETE , GET , HEAD , OPTIONS , PATCH , POST , and PUT .

        @[JSON::Field(key: "Method")]
        getter method : String?

        # The part of a web request that identifies the resource, for example, /images/daily-ad.jpg .

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

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains one or more IP addresses or blocks of IP addresses specified in Classless Inter-Domain
      # Routing (CIDR) notation. AWS WAF supports IPv4 address ranges: /8 and any range between /16 through
      # /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. To specify an
      # individual IP address, you specify the four-part IP address followed by a /32 , for example,
      # 192.0.2.0/32. To block a range of IP addresses, you can specify /8 or any range between /16 through
      # /32 (for IPv4) or /24, /32, /48, /56, /64, or /128 (for IPv6). For more information about CIDR
      # notation, see the Wikipedia entry Classless Inter-Domain Routing .

      struct IPSet
        include JSON::Serializable

        # The IP address type ( IPV4 or IPV6 ) and the IP address range (in CIDR notation) that web requests
        # originate from. If the WebACL is associated with a CloudFront distribution and the viewer did not
        # use an HTTP proxy or a load balancer to send the request, this is the value of the c-ip field in the
        # CloudFront access logs.

        @[JSON::Field(key: "IPSetDescriptors")]
        getter ip_set_descriptors : Array(Types::IPSetDescriptor)

        # The IPSetId for an IPSet . You use IPSetId to get information about an IPSet (see GetIPSet ), update
        # an IPSet (see UpdateIPSet ), insert an IPSet into a Rule or delete one from a Rule (see UpdateRule
        # ), and delete an IPSet from AWS WAF (see DeleteIPSet ). IPSetId is returned by CreateIPSet and by
        # ListIPSets .

        @[JSON::Field(key: "IPSetId")]
        getter ip_set_id : String

        # A friendly name or description of the IPSet . You can't change the name of an IPSet after you create
        # it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @ip_set_descriptors : Array(Types::IPSetDescriptor),
          @ip_set_id : String,
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the IP address type ( IPV4 or IPV6 ) and the IP address range (in CIDR format) that web
      # requests originate from.

      struct IPSetDescriptor
        include JSON::Serializable

        # Specify IPV4 or IPV6 .

        @[JSON::Field(key: "Type")]
        getter type : String

        # Specify an IPv4 address by using CIDR notation. For example: To configure AWS WAF to allow, block,
        # or count requests that originated from the IP address 192.0.2.44, specify 192.0.2.44/32 . To
        # configure AWS WAF to allow, block, or count requests that originated from IP addresses from
        # 192.0.2.0 to 192.0.2.255, specify 192.0.2.0/24 . For more information about CIDR notation, see the
        # Wikipedia entry Classless Inter-Domain Routing . Specify an IPv6 address by using CIDR notation. For
        # example: To configure AWS WAF to allow, block, or count requests that originated from the IP address
        # 1111:0000:0000:0000:0000:0000:0000:0111, specify 1111:0000:0000:0000:0000:0000:0000:0111/128 . To
        # configure AWS WAF to allow, block, or count requests that originated from IP addresses
        # 1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, specify
        # 1111:0000:0000:0000:0000:0000:0000:0000/64 .

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the identifier and the name of the IPSet .

      struct IPSetSummary
        include JSON::Serializable

        # The IPSetId for an IPSet . You can use IPSetId in a GetIPSet request to get detailed information
        # about an IPSet .

        @[JSON::Field(key: "IPSetId")]
        getter ip_set_id : String

        # A friendly name or description of the IPSet . You can't change the name of an IPSet after you create
        # it.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @ip_set_id : String,
          @name : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the type of update to perform to an IPSet with UpdateIPSet .

      struct IPSetUpdate
        include JSON::Serializable

        # Specifies whether to insert or delete an IP address with UpdateIPSet .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The IP address type ( IPV4 or IPV6 ) and the IP address range (in CIDR notation) that web requests
        # originate from.

        @[JSON::Field(key: "IPSetDescriptor")]
        getter ip_set_descriptor : Types::IPSetDescriptor

        def initialize(
          @action : String,
          @ip_set_descriptor : Types::IPSetDescriptor
        )
        end
      end


      struct ListActivatedRulesInRuleGroupRequest
        include JSON::Serializable

        # Specifies the number of ActivatedRules that you want AWS WAF to return for this request. If you have
        # more ActivatedRules than the number that you specify for Limit , the response includes a NextMarker
        # value that you can use to get another batch of ActivatedRules .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more ActivatedRules than the value of Limit , AWS WAF
        # returns a NextMarker value in the response that allows you to list another group of ActivatedRules .
        # For the second and subsequent ListActivatedRulesInRuleGroup requests, specify the value of
        # NextMarker from the previous response to get information about another batch of ActivatedRules .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # The RuleGroupId of the RuleGroup for which you want to get a list of ActivatedRule objects.

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil,
          @rule_group_id : String? = nil
        )
        end
      end


      struct ListActivatedRulesInRuleGroupResponse
        include JSON::Serializable

        # An array of ActivatedRules objects.

        @[JSON::Field(key: "ActivatedRules")]
        getter activated_rules : Array(Types::ActivatedRule)?

        # If you have more ActivatedRules than the number that you specified for Limit in the request, the
        # response includes a NextMarker value. To list more ActivatedRules , submit another
        # ListActivatedRulesInRuleGroup request, and specify the NextMarker value from the response in the
        # NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @activated_rules : Array(Types::ActivatedRule)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListByteMatchSetsRequest
        include JSON::Serializable

        # Specifies the number of ByteMatchSet objects that you want AWS WAF to return for this request. If
        # you have more ByteMatchSets objects than the number you specify for Limit , the response includes a
        # NextMarker value that you can use to get another batch of ByteMatchSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more ByteMatchSets than the value of Limit , AWS WAF
        # returns a NextMarker value in the response that allows you to list another group of ByteMatchSets .
        # For the second and subsequent ListByteMatchSets requests, specify the value of NextMarker from the
        # previous response to get information about another batch of ByteMatchSets .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListByteMatchSetsResponse
        include JSON::Serializable

        # An array of ByteMatchSetSummary objects.

        @[JSON::Field(key: "ByteMatchSets")]
        getter byte_match_sets : Array(Types::ByteMatchSetSummary)?

        # If you have more ByteMatchSet objects than the number that you specified for Limit in the request,
        # the response includes a NextMarker value. To list more ByteMatchSet objects, submit another
        # ListByteMatchSets request, and specify the NextMarker value from the response in the NextMarker
        # value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @byte_match_sets : Array(Types::ByteMatchSetSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListGeoMatchSetsRequest
        include JSON::Serializable

        # Specifies the number of GeoMatchSet objects that you want AWS WAF to return for this request. If you
        # have more GeoMatchSet objects than the number you specify for Limit , the response includes a
        # NextMarker value that you can use to get another batch of GeoMatchSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more GeoMatchSet s than the value of Limit , AWS WAF
        # returns a NextMarker value in the response that allows you to list another group of GeoMatchSet
        # objects. For the second and subsequent ListGeoMatchSets requests, specify the value of NextMarker
        # from the previous response to get information about another batch of GeoMatchSet objects.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListGeoMatchSetsResponse
        include JSON::Serializable

        # An array of GeoMatchSetSummary objects.

        @[JSON::Field(key: "GeoMatchSets")]
        getter geo_match_sets : Array(Types::GeoMatchSetSummary)?

        # If you have more GeoMatchSet objects than the number that you specified for Limit in the request,
        # the response includes a NextMarker value. To list more GeoMatchSet objects, submit another
        # ListGeoMatchSets request, and specify the NextMarker value from the response in the NextMarker value
        # in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @geo_match_sets : Array(Types::GeoMatchSetSummary)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListIPSetsRequest
        include JSON::Serializable

        # Specifies the number of IPSet objects that you want AWS WAF to return for this request. If you have
        # more IPSet objects than the number you specify for Limit , the response includes a NextMarker value
        # that you can use to get another batch of IPSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # AWS WAF returns a NextMarker value in the response that allows you to list another group of IPSets .
        # For the second and subsequent ListIPSets requests, specify the value of NextMarker from the previous
        # response to get information about another batch of IPSets .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListIPSetsResponse
        include JSON::Serializable

        # An array of IPSetSummary objects.

        @[JSON::Field(key: "IPSets")]
        getter ip_sets : Array(Types::IPSetSummary)?

        # To list more IPSet objects, submit another ListIPSets request, and in the next request use the
        # NextMarker response value as the NextMarker value.

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

        # Specifies the number of LoggingConfigurations that you want AWS WAF to return for this request. If
        # you have more LoggingConfigurations than the number that you specify for Limit , the response
        # includes a NextMarker value that you can use to get another batch of LoggingConfigurations .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more LoggingConfigurations than the value of Limit ,
        # AWS WAF returns a NextMarker value in the response that allows you to list another group of
        # LoggingConfigurations . For the second and subsequent ListLoggingConfigurations requests, specify
        # the value of NextMarker from the previous response to get information about another batch of
        # ListLoggingConfigurations .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListLoggingConfigurationsResponse
        include JSON::Serializable

        # An array of LoggingConfiguration objects.

        @[JSON::Field(key: "LoggingConfigurations")]
        getter logging_configurations : Array(Types::LoggingConfiguration)?

        # If you have more LoggingConfigurations than the number that you specified for Limit in the request,
        # the response includes a NextMarker value. To list more LoggingConfigurations , submit another
        # ListLoggingConfigurations request, and specify the NextMarker value from the response in the
        # NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @logging_configurations : Array(Types::LoggingConfiguration)? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRateBasedRulesRequest
        include JSON::Serializable

        # Specifies the number of Rules that you want AWS WAF to return for this request. If you have more
        # Rules than the number that you specify for Limit , the response includes a NextMarker value that you
        # can use to get another batch of Rules .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more Rules than the value of Limit , AWS WAF returns a
        # NextMarker value in the response that allows you to list another group of Rules . For the second and
        # subsequent ListRateBasedRules requests, specify the value of NextMarker from the previous response
        # to get information about another batch of Rules .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRateBasedRulesResponse
        include JSON::Serializable

        # If you have more Rules than the number that you specified for Limit in the request, the response
        # includes a NextMarker value. To list more Rules , submit another ListRateBasedRules request, and
        # specify the NextMarker value from the response in the NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RuleSummary objects.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::RuleSummary)?

        def initialize(
          @next_marker : String? = nil,
          @rules : Array(Types::RuleSummary)? = nil
        )
        end
      end


      struct ListRegexMatchSetsRequest
        include JSON::Serializable

        # Specifies the number of RegexMatchSet objects that you want AWS WAF to return for this request. If
        # you have more RegexMatchSet objects than the number you specify for Limit , the response includes a
        # NextMarker value that you can use to get another batch of RegexMatchSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more RegexMatchSet objects than the value of Limit ,
        # AWS WAF returns a NextMarker value in the response that allows you to list another group of
        # ByteMatchSets . For the second and subsequent ListRegexMatchSets requests, specify the value of
        # NextMarker from the previous response to get information about another batch of RegexMatchSet
        # objects.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRegexMatchSetsResponse
        include JSON::Serializable

        # If you have more RegexMatchSet objects than the number that you specified for Limit in the request,
        # the response includes a NextMarker value. To list more RegexMatchSet objects, submit another
        # ListRegexMatchSets request, and specify the NextMarker value from the response in the NextMarker
        # value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RegexMatchSetSummary objects.

        @[JSON::Field(key: "RegexMatchSets")]
        getter regex_match_sets : Array(Types::RegexMatchSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @regex_match_sets : Array(Types::RegexMatchSetSummary)? = nil
        )
        end
      end


      struct ListRegexPatternSetsRequest
        include JSON::Serializable

        # Specifies the number of RegexPatternSet objects that you want AWS WAF to return for this request. If
        # you have more RegexPatternSet objects than the number you specify for Limit , the response includes
        # a NextMarker value that you can use to get another batch of RegexPatternSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more RegexPatternSet objects than the value of Limit ,
        # AWS WAF returns a NextMarker value in the response that allows you to list another group of
        # RegexPatternSet objects. For the second and subsequent ListRegexPatternSets requests, specify the
        # value of NextMarker from the previous response to get information about another batch of
        # RegexPatternSet objects.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRegexPatternSetsResponse
        include JSON::Serializable

        # If you have more RegexPatternSet objects than the number that you specified for Limit in the
        # request, the response includes a NextMarker value. To list more RegexPatternSet objects, submit
        # another ListRegexPatternSets request, and specify the NextMarker value from the response in the
        # NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RegexPatternSetSummary objects.

        @[JSON::Field(key: "RegexPatternSets")]
        getter regex_pattern_sets : Array(Types::RegexPatternSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @regex_pattern_sets : Array(Types::RegexPatternSetSummary)? = nil
        )
        end
      end


      struct ListRuleGroupsRequest
        include JSON::Serializable

        # Specifies the number of RuleGroups that you want AWS WAF to return for this request. If you have
        # more RuleGroups than the number that you specify for Limit , the response includes a NextMarker
        # value that you can use to get another batch of RuleGroups .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more RuleGroups than the value of Limit , AWS WAF
        # returns a NextMarker value in the response that allows you to list another group of RuleGroups . For
        # the second and subsequent ListRuleGroups requests, specify the value of NextMarker from the previous
        # response to get information about another batch of RuleGroups .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRuleGroupsResponse
        include JSON::Serializable

        # If you have more RuleGroups than the number that you specified for Limit in the request, the
        # response includes a NextMarker value. To list more RuleGroups , submit another ListRuleGroups
        # request, and specify the NextMarker value from the response in the NextMarker value in the next
        # request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RuleGroup objects.

        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::RuleGroupSummary)?

        def initialize(
          @next_marker : String? = nil,
          @rule_groups : Array(Types::RuleGroupSummary)? = nil
        )
        end
      end


      struct ListRulesRequest
        include JSON::Serializable

        # Specifies the number of Rules that you want AWS WAF to return for this request. If you have more
        # Rules than the number that you specify for Limit , the response includes a NextMarker value that you
        # can use to get another batch of Rules .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more Rules than the value of Limit , AWS WAF returns a
        # NextMarker value in the response that allows you to list another group of Rules . For the second and
        # subsequent ListRules requests, specify the value of NextMarker from the previous response to get
        # information about another batch of Rules .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListRulesResponse
        include JSON::Serializable

        # If you have more Rules than the number that you specified for Limit in the request, the response
        # includes a NextMarker value. To list more Rules , submit another ListRules request, and specify the
        # NextMarker value from the response in the NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RuleSummary objects.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::RuleSummary)?

        def initialize(
          @next_marker : String? = nil,
          @rules : Array(Types::RuleSummary)? = nil
        )
        end
      end


      struct ListSizeConstraintSetsRequest
        include JSON::Serializable

        # Specifies the number of SizeConstraintSet objects that you want AWS WAF to return for this request.
        # If you have more SizeConstraintSets objects than the number you specify for Limit , the response
        # includes a NextMarker value that you can use to get another batch of SizeConstraintSet objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more SizeConstraintSets than the value of Limit , AWS
        # WAF returns a NextMarker value in the response that allows you to list another group of
        # SizeConstraintSets . For the second and subsequent ListSizeConstraintSets requests, specify the
        # value of NextMarker from the previous response to get information about another batch of
        # SizeConstraintSets .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListSizeConstraintSetsResponse
        include JSON::Serializable

        # If you have more SizeConstraintSet objects than the number that you specified for Limit in the
        # request, the response includes a NextMarker value. To list more SizeConstraintSet objects, submit
        # another ListSizeConstraintSets request, and specify the NextMarker value from the response in the
        # NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of SizeConstraintSetSummary objects.

        @[JSON::Field(key: "SizeConstraintSets")]
        getter size_constraint_sets : Array(Types::SizeConstraintSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @size_constraint_sets : Array(Types::SizeConstraintSetSummary)? = nil
        )
        end
      end

      # A request to list the SqlInjectionMatchSet objects created by the current AWS account.

      struct ListSqlInjectionMatchSetsRequest
        include JSON::Serializable

        # Specifies the number of SqlInjectionMatchSet objects that you want AWS WAF to return for this
        # request. If you have more SqlInjectionMatchSet objects than the number you specify for Limit , the
        # response includes a NextMarker value that you can use to get another batch of Rules .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more SqlInjectionMatchSet objects than the value of
        # Limit , AWS WAF returns a NextMarker value in the response that allows you to list another group of
        # SqlInjectionMatchSets . For the second and subsequent ListSqlInjectionMatchSets requests, specify
        # the value of NextMarker from the previous response to get information about another batch of
        # SqlInjectionMatchSets .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The response to a ListSqlInjectionMatchSets request.

      struct ListSqlInjectionMatchSetsResponse
        include JSON::Serializable

        # If you have more SqlInjectionMatchSet objects than the number that you specified for Limit in the
        # request, the response includes a NextMarker value. To list more SqlInjectionMatchSet objects, submit
        # another ListSqlInjectionMatchSets request, and specify the NextMarker value from the response in the
        # NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of SqlInjectionMatchSetSummary objects.

        @[JSON::Field(key: "SqlInjectionMatchSets")]
        getter sql_injection_match_sets : Array(Types::SqlInjectionMatchSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @sql_injection_match_sets : Array(Types::SqlInjectionMatchSetSummary)? = nil
        )
        end
      end


      struct ListSubscribedRuleGroupsRequest
        include JSON::Serializable

        # Specifies the number of subscribed rule groups that you want AWS WAF to return for this request. If
        # you have more objects than the number you specify for Limit , the response includes a NextMarker
        # value that you can use to get another batch of objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more ByteMatchSets subscribed rule groups than the
        # value of Limit , AWS WAF returns a NextMarker value in the response that allows you to list another
        # group of subscribed rule groups. For the second and subsequent ListSubscribedRuleGroupsRequest
        # requests, specify the value of NextMarker from the previous response to get information about
        # another batch of subscribed rule groups.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListSubscribedRuleGroupsResponse
        include JSON::Serializable

        # If you have more objects than the number that you specified for Limit in the request, the response
        # includes a NextMarker value. To list more objects, submit another ListSubscribedRuleGroups request,
        # and specify the NextMarker value from the response in the NextMarker value in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of RuleGroup objects.

        @[JSON::Field(key: "RuleGroups")]
        getter rule_groups : Array(Types::SubscribedRuleGroupSummary)?

        def initialize(
          @next_marker : String? = nil,
          @rule_groups : Array(Types::SubscribedRuleGroupSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String


        @[JSON::Field(key: "Limit")]
        getter limit : Int32?


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


        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?


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

        # Specifies the number of WebACL objects that you want AWS WAF to return for this request. If you have
        # more WebACL objects than the number that you specify for Limit , the response includes a NextMarker
        # value that you can use to get another batch of WebACL objects.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more WebACL objects than the number that you specify
        # for Limit , AWS WAF returns a NextMarker value in the response that allows you to list another group
        # of WebACL objects. For the second and subsequent ListWebACLs requests, specify the value of
        # NextMarker from the previous response to get information about another batch of WebACL objects.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end


      struct ListWebACLsResponse
        include JSON::Serializable

        # If you have more WebACL objects than the number that you specified for Limit in the request, the
        # response includes a NextMarker value. To list more WebACL objects, submit another ListWebACLs
        # request, and specify the NextMarker value from the response in the NextMarker value in the next
        # request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of WebACLSummary objects.

        @[JSON::Field(key: "WebACLs")]
        getter web_ac_ls : Array(Types::WebACLSummary)?

        def initialize(
          @next_marker : String? = nil,
          @web_ac_ls : Array(Types::WebACLSummary)? = nil
        )
        end
      end

      # A request to list the XssMatchSet objects created by the current AWS account.

      struct ListXssMatchSetsRequest
        include JSON::Serializable

        # Specifies the number of XssMatchSet objects that you want AWS WAF to return for this request. If you
        # have more XssMatchSet objects than the number you specify for Limit , the response includes a
        # NextMarker value that you can use to get another batch of Rules .

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # If you specify a value for Limit and you have more XssMatchSet objects than the value of Limit , AWS
        # WAF returns a NextMarker value in the response that allows you to list another group of XssMatchSets
        # . For the second and subsequent ListXssMatchSets requests, specify the value of NextMarker from the
        # previous response to get information about another batch of XssMatchSets .

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        def initialize(
          @limit : Int32? = nil,
          @next_marker : String? = nil
        )
        end
      end

      # The response to a ListXssMatchSets request.

      struct ListXssMatchSetsResponse
        include JSON::Serializable

        # If you have more XssMatchSet objects than the number that you specified for Limit in the request,
        # the response includes a NextMarker value. To list more XssMatchSet objects, submit another
        # ListXssMatchSets request, and specify the NextMarker value from the response in the NextMarker value
        # in the next request.

        @[JSON::Field(key: "NextMarker")]
        getter next_marker : String?

        # An array of XssMatchSetSummary objects.

        @[JSON::Field(key: "XssMatchSets")]
        getter xss_match_sets : Array(Types::XssMatchSetSummary)?

        def initialize(
          @next_marker : String? = nil,
          @xss_match_sets : Array(Types::XssMatchSetSummary)? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # Amazon Kinesis Data Firehose, RedactedFields information, and the web ACL Amazon Resource Name
      # (ARN).

      struct LoggingConfiguration
        include JSON::Serializable

        # An array of Amazon Kinesis Data Firehose ARNs.

        @[JSON::Field(key: "LogDestinationConfigs")]
        getter log_destination_configs : Array(String)

        # The Amazon Resource Name (ARN) of the web ACL that you want to associate with LogDestinationConfigs
        # .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The parts of the request that you want redacted from the logs. For example, if you redact the cookie
        # field, the cookie field in the firehose will be xxx .

        @[JSON::Field(key: "RedactedFields")]
        getter redacted_fields : Array(Types::FieldToMatch)?

        def initialize(
          @log_destination_configs : Array(String),
          @resource_arn : String,
          @redacted_fields : Array(Types::FieldToMatch)? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the ByteMatchSet , IPSet , SqlInjectionMatchSet , XssMatchSet , RegexMatchSet ,
      # GeoMatchSet , and SizeConstraintSet objects that you want to add to a Rule and, for each object,
      # indicates whether you want to negate the settings, for example, requests that do NOT originate from
      # the IP address 192.0.2.44.

      struct Predicate
        include JSON::Serializable

        # A unique identifier for a predicate in a Rule , such as ByteMatchSetId or IPSetId . The ID is
        # returned by the corresponding Create or List command.

        @[JSON::Field(key: "DataId")]
        getter data_id : String

        # Set Negated to False if you want AWS WAF to allow, block, or count requests based on the settings in
        # the specified ByteMatchSet , IPSet , SqlInjectionMatchSet , XssMatchSet , RegexMatchSet ,
        # GeoMatchSet , or SizeConstraintSet . For example, if an IPSet includes the IP address 192.0.2.44 ,
        # AWS WAF will allow or block requests based on that IP address. Set Negated to True if you want AWS
        # WAF to allow or block a request based on the negation of the settings in the ByteMatchSet , IPSet ,
        # SqlInjectionMatchSet , XssMatchSet , RegexMatchSet , GeoMatchSet , or SizeConstraintSet . For
        # example, if an IPSet includes the IP address 192.0.2.44 , AWS WAF will allow, block, or count
        # requests based on all IP addresses except 192.0.2.44 .

        @[JSON::Field(key: "Negated")]
        getter negated : Bool

        # The type of predicate in a Rule , such as ByteMatch or IPSet .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @data_id : String,
          @negated : Bool,
          @type : String
        )
        end
      end


      struct PutLoggingConfigurationRequest
        include JSON::Serializable

        # The Amazon Kinesis Data Firehose that contains the inspected traffic information, the redacted
        # fields details, and the Amazon Resource Name (ARN) of the web ACL to monitor. When specifying Type
        # in RedactedFields , you must use one of the following values: URI , QUERY_STRING , HEADER , or
        # METHOD .

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration

        def initialize(
          @logging_configuration : Types::LoggingConfiguration
        )
        end
      end


      struct PutLoggingConfigurationResponse
        include JSON::Serializable

        # The LoggingConfiguration that you submitted in the request.

        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        def initialize(
          @logging_configuration : Types::LoggingConfiguration? = nil
        )
        end
      end


      struct PutPermissionPolicyRequest
        include JSON::Serializable

        # The policy to attach to the specified RuleGroup.

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

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # RateBasedRule is identical to a regular Rule , with one addition: a RateBasedRule counts the number
      # of requests that arrive from a specified IP address every five minutes. For example, based on recent
      # requests that you've seen from an attacker, you might create a RateBasedRule that includes the
      # following conditions: The requests come from 192.0.2.44. They contain the value BadBot in the
      # User-Agent header. In the rule, you also define the rate limit as 1,000. Requests that meet both of
      # these conditions and exceed 1,000 requests every five minutes trigger the rule's action (block or
      # count), which is defined in the web ACL.

      struct RateBasedRule
        include JSON::Serializable

        # The Predicates object contains one Predicate element for each ByteMatchSet , IPSet , or
        # SqlInjectionMatchSet object that you want to include in a RateBasedRule .

        @[JSON::Field(key: "MatchPredicates")]
        getter match_predicates : Array(Types::Predicate)

        # The field that AWS WAF uses to determine if requests are likely arriving from single source and thus
        # subject to rate monitoring. The only valid value for RateKey is IP . IP indicates that requests
        # arriving from the same IP address are subject to the RateLimit that is specified in the
        # RateBasedRule .

        @[JSON::Field(key: "RateKey")]
        getter rate_key : String

        # The maximum number of requests, which have an identical value in the field specified by the RateKey
        # , allowed in a five-minute period. If the number of requests exceeds the RateLimit and the other
        # predicates specified in the rule are also met, AWS WAF triggers the action that is specified for
        # this rule.

        @[JSON::Field(key: "RateLimit")]
        getter rate_limit : Int64

        # A unique identifier for a RateBasedRule . You use RuleId to get more information about a
        # RateBasedRule (see GetRateBasedRule ), update a RateBasedRule (see UpdateRateBasedRule ), insert a
        # RateBasedRule into a WebACL or delete one from a WebACL (see UpdateWebACL ), or delete a
        # RateBasedRule from AWS WAF (see DeleteRateBasedRule ).

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # A friendly name or description for the metrics for a RateBasedRule . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the RateBasedRule .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # A friendly name or description for a RateBasedRule . You can't change the name of a RateBasedRule
        # after you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @match_predicates : Array(Types::Predicate),
          @rate_key : String,
          @rate_limit : Int64,
          @rule_id : String,
          @metric_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In a
      # GetRegexMatchSet request, RegexMatchSet is a complex type that contains the RegexMatchSetId and Name
      # of a RegexMatchSet , and the values that you specified when you updated the RegexMatchSet . The
      # values are contained in a RegexMatchTuple object, which specify the parts of web requests that you
      # want AWS WAF to inspect and the values that you want AWS WAF to search for. If a RegexMatchSet
      # contains more than one RegexMatchTuple object, a request needs to match the settings in only one
      # ByteMatchTuple to be considered a match.

      struct RegexMatchSet
        include JSON::Serializable

        # A friendly name or description of the RegexMatchSet . You can't change Name after you create a
        # RegexMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The RegexMatchSetId for a RegexMatchSet . You use RegexMatchSetId to get information about a
        # RegexMatchSet (see GetRegexMatchSet ), update a RegexMatchSet (see UpdateRegexMatchSet ), insert a
        # RegexMatchSet into a Rule or delete one from a Rule (see UpdateRule ), and delete a RegexMatchSet
        # from AWS WAF (see DeleteRegexMatchSet ). RegexMatchSetId is returned by CreateRegexMatchSet and by
        # ListRegexMatchSets .

        @[JSON::Field(key: "RegexMatchSetId")]
        getter regex_match_set_id : String?

        # Contains an array of RegexMatchTuple objects. Each RegexMatchTuple object contains: The part of a
        # web request that you want AWS WAF to inspect, such as a query string or the value of the User-Agent
        # header. The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For
        # more information, see RegexPatternSet . Whether to perform any conversions on the request, such as
        # converting it to lowercase, before inspecting it for the specified string.

        @[JSON::Field(key: "RegexMatchTuples")]
        getter regex_match_tuples : Array(Types::RegexMatchTuple)?

        def initialize(
          @name : String? = nil,
          @regex_match_set_id : String? = nil,
          @regex_match_tuples : Array(Types::RegexMatchTuple)? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returned by ListRegexMatchSets . Each RegexMatchSetSummary object includes the Name and
      # RegexMatchSetId for one RegexMatchSet .

      struct RegexMatchSetSummary
        include JSON::Serializable

        # A friendly name or description of the RegexMatchSet . You can't change Name after you create a
        # RegexMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The RegexMatchSetId for a RegexMatchSet . You use RegexMatchSetId to get information about a
        # RegexMatchSet , update a RegexMatchSet , remove a RegexMatchSet from a Rule , and delete a
        # RegexMatchSet from AWS WAF. RegexMatchSetId is returned by CreateRegexMatchSet and by
        # ListRegexMatchSets .

        @[JSON::Field(key: "RegexMatchSetId")]
        getter regex_match_set_id : String

        def initialize(
          @name : String,
          @regex_match_set_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In an
      # UpdateRegexMatchSet request, RegexMatchSetUpdate specifies whether to insert or delete a
      # RegexMatchTuple and includes the settings for the RegexMatchTuple .

      struct RegexMatchSetUpdate
        include JSON::Serializable

        # Specifies whether to insert or delete a RegexMatchTuple .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Information about the part of a web request that you want AWS WAF to inspect and the identifier of
        # the regular expression (regex) pattern that you want AWS WAF to search for. If you specify DELETE
        # for the value of Action , the RegexMatchTuple values must exactly match the values in the
        # RegexMatchTuple that you want to delete from the RegexMatchSet .

        @[JSON::Field(key: "RegexMatchTuple")]
        getter regex_match_tuple : Types::RegexMatchTuple

        def initialize(
          @action : String,
          @regex_match_tuple : Types::RegexMatchTuple
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # regular expression pattern that you want AWS WAF to search for in web requests, the location in
      # requests that you want AWS WAF to search, and other settings. Each RegexMatchTuple object contains:
      # The part of a web request that you want AWS WAF to inspect, such as a query string or the value of
      # the User-Agent header. The identifier of the pattern (a regular expression) that you want AWS WAF to
      # look for. For more information, see RegexPatternSet . Whether to perform any conversions on the
      # request, such as converting it to lowercase, before inspecting it for the specified string.

      struct RegexMatchTuple
        include JSON::Serializable

        # Specifies where in a web request to look for the RegexPatternSet .

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # The RegexPatternSetId for a RegexPatternSet . You use RegexPatternSetId to get information about a
        # RegexPatternSet (see GetRegexPatternSet ), update a RegexPatternSet (see UpdateRegexPatternSet ),
        # insert a RegexPatternSet into a RegexMatchSet or delete one from a RegexMatchSet (see
        # UpdateRegexMatchSet ), and delete an RegexPatternSet from AWS WAF (see DeleteRegexPatternSet ).
        # RegexPatternSetId is returned by CreateRegexPatternSet and by ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on
        # RegexPatternSet before inspecting a request for a match. You can only specify a single type of
        # TextTransformation. CMD_LINE When you're concerned that attackers are injecting an operating system
        # commandline command and using unusual formatting to disguise some or all of the command, use this
        # option to perform the following transformations: Delete the following characters: \ " ' ^ Delete
        # spaces before the following characters: / ( Replace the following characters with a space: , ;
        # Replace multiple spaces with one space Convert uppercase letters (A-Z) to lowercase (a-z)
        # COMPRESS_WHITE_SPACE Use this option to replace the following characters with a space character
        # (decimal 32): \f, formfeed, decimal 12 \t, tab, decimal 9 \n, newline, decimal 10 \r, carriage
        # return, decimal 13 \v, vertical tab, decimal 11 non-breaking space, decimal 160 COMPRESS_WHITE_SPACE
        # also replaces multiple spaces with one space. HTML_ENTITY_DECODE Use this option to replace
        # HTML-encoded characters with unencoded characters. HTML_ENTITY_DECODE performs the following
        # operations: Replaces (ampersand)quot; with " Replaces (ampersand)nbsp; with a non-breaking space,
        # decimal 160 Replaces (ampersand)lt; with a "less than" symbol Replaces (ampersand)gt; with &gt;
        # Replaces characters that are represented in hexadecimal format, (ampersand)#xhhhh; , with the
        # corresponding characters Replaces characters that are represented in decimal format,
        # (ampersand)#nnnn; , with the corresponding characters LOWERCASE Use this option to convert uppercase
        # letters (A-Z) to lowercase (a-z). URL_DECODE Use this option to decode a URL-encoded value. NONE
        # Specify NONE if you don't want to perform any text transformations.

        @[JSON::Field(key: "TextTransformation")]
        getter text_transformation : String

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @regex_pattern_set_id : String,
          @text_transformation : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # RegexPatternSet specifies the regular expression (regex) pattern that you want AWS WAF to search
      # for, such as B[a@]dB[o0]t . You can then configure AWS WAF to reject those requests.

      struct RegexPatternSet
        include JSON::Serializable

        # The identifier for the RegexPatternSet . You use RegexPatternSetId to get information about a
        # RegexPatternSet , update a RegexPatternSet , remove a RegexPatternSet from a RegexMatchSet , and
        # delete a RegexPatternSet from AWS WAF. RegexMatchSetId is returned by CreateRegexPatternSet and by
        # ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        # Specifies the regular expression (regex) patterns that you want AWS WAF to search for, such as
        # B[a@]dB[o0]t .

        @[JSON::Field(key: "RegexPatternStrings")]
        getter regex_pattern_strings : Array(String)

        # A friendly name or description of the RegexPatternSet . You can't change Name after you create a
        # RegexPatternSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @regex_pattern_set_id : String,
          @regex_pattern_strings : Array(String),
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Returned by ListRegexPatternSets . Each RegexPatternSetSummary object includes the Name and
      # RegexPatternSetId for one RegexPatternSet .

      struct RegexPatternSetSummary
        include JSON::Serializable

        # A friendly name or description of the RegexPatternSet . You can't change Name after you create a
        # RegexPatternSet .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The RegexPatternSetId for a RegexPatternSet . You use RegexPatternSetId to get information about a
        # RegexPatternSet , update a RegexPatternSet , remove a RegexPatternSet from a RegexMatchSet , and
        # delete a RegexPatternSet from AWS WAF. RegexPatternSetId is returned by CreateRegexPatternSet and by
        # ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        def initialize(
          @name : String,
          @regex_pattern_set_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In an
      # UpdateRegexPatternSet request, RegexPatternSetUpdate specifies whether to insert or delete a
      # RegexPatternString and includes the settings for the RegexPatternString .

      struct RegexPatternSetUpdate
        include JSON::Serializable

        # Specifies whether to insert or delete a RegexPatternString .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Specifies the regular expression (regex) pattern that you want AWS WAF to search for, such as
        # B[a@]dB[o0]t .

        @[JSON::Field(key: "RegexPatternString")]
        getter regex_pattern_string : String

        def initialize(
          @action : String,
          @regex_pattern_string : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # combination of ByteMatchSet , IPSet , and/or SqlInjectionMatchSet objects that identify the web
      # requests that you want to allow, block, or count. For example, you might create a Rule that includes
      # the following predicates: An IPSet that causes AWS WAF to search for web requests that originate
      # from the IP address 192.0.2.44 A ByteMatchSet that causes AWS WAF to search for web requests for
      # which the value of the User-Agent header is BadBot . To match the settings in this Rule , a request
      # must originate from 192.0.2.44 AND include a User-Agent header for which the value is BadBot .

      struct Rule
        include JSON::Serializable

        # The Predicates object contains one Predicate element for each ByteMatchSet , IPSet , or
        # SqlInjectionMatchSet object that you want to include in a Rule .

        @[JSON::Field(key: "Predicates")]
        getter predicates : Array(Types::Predicate)

        # A unique identifier for a Rule . You use RuleId to get more information about a Rule (see GetRule ),
        # update a Rule (see UpdateRule ), insert a Rule into a WebACL or delete a one from a WebACL (see
        # UpdateWebACL ), or delete a Rule from AWS WAF (see DeleteRule ). RuleId is returned by CreateRule
        # and by ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # A friendly name or description for the metrics for this Rule . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change MetricName after you create the Rule .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The friendly name or description for the Rule . You can't change the name of a Rule after you create
        # it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @predicates : Array(Types::Predicate),
          @rule_id : String,
          @metric_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # collection of predefined rules that you can add to a web ACL. Rule groups are subject to the
      # following limits: Three rule groups per account. You can request an increase to this limit by
      # contacting customer support. One rule group per web ACL. Ten rules per rule group.

      struct RuleGroup
        include JSON::Serializable

        # A unique identifier for a RuleGroup . You use RuleGroupId to get more information about a RuleGroup
        # (see GetRuleGroup ), update a RuleGroup (see UpdateRuleGroup ), insert a RuleGroup into a WebACL or
        # delete a one from a WebACL (see UpdateWebACL ), or delete a RuleGroup from AWS WAF (see
        # DeleteRuleGroup ). RuleGroupId is returned by CreateRuleGroup and by ListRuleGroups .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        # A friendly name or description for the metrics for this RuleGroup . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the RuleGroup .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # The friendly name or description for the RuleGroup . You can't change the name of a RuleGroup after
        # you create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @rule_group_id : String,
          @metric_name : String? = nil,
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the identifier and the friendly name or description of the RuleGroup .

      struct RuleGroupSummary
        include JSON::Serializable

        # A friendly name or description of the RuleGroup . You can't change the name of a RuleGroup after you
        # create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a RuleGroup . You use RuleGroupId to get more information about a RuleGroup
        # (see GetRuleGroup ), update a RuleGroup (see UpdateRuleGroup ), insert a RuleGroup into a WebACL or
        # delete one from a WebACL (see UpdateWebACL ), or delete a RuleGroup from AWS WAF (see
        # DeleteRuleGroup ). RuleGroupId is returned by CreateRuleGroup and by ListRuleGroups .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        def initialize(
          @name : String,
          @rule_group_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies an ActivatedRule and indicates whether you want to add it to a RuleGroup or delete it from
      # a RuleGroup .

      struct RuleGroupUpdate
        include JSON::Serializable

        # Specify INSERT to add an ActivatedRule to a RuleGroup . Use DELETE to remove an ActivatedRule from a
        # RuleGroup .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The ActivatedRule object specifies a Rule that you want to insert or delete, the priority of the
        # Rule in the WebACL , and the action that you want AWS WAF to take when a web request matches the
        # Rule ( ALLOW , BLOCK , or COUNT ).

        @[JSON::Field(key: "ActivatedRule")]
        getter activated_rule : Types::ActivatedRule

        def initialize(
          @action : String,
          @activated_rule : Types::ActivatedRule
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the identifier and the friendly name or description of the Rule .

      struct RuleSummary
        include JSON::Serializable

        # A friendly name or description of the Rule . You can't change the name of a Rule after you create
        # it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a Rule . You use RuleId to get more information about a Rule (see GetRule ),
        # update a Rule (see UpdateRule ), insert a Rule into a WebACL or delete one from a WebACL (see
        # UpdateWebACL ), or delete a Rule from AWS WAF (see DeleteRule ). RuleId is returned by CreateRule
        # and by ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        def initialize(
          @name : String,
          @rule_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies a Predicate (such as an IPSet ) and indicates whether you want to add it to a Rule or
      # delete it from a Rule .

      struct RuleUpdate
        include JSON::Serializable

        # Specify INSERT to add a Predicate to a Rule . Use DELETE to remove a Predicate from a Rule .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The ID of the Predicate (such as an IPSet ) that you want to add to a Rule .

        @[JSON::Field(key: "Predicate")]
        getter predicate : Types::Predicate

        def initialize(
          @action : String,
          @predicate : Types::Predicate
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # response from a GetSampledRequests request includes a SampledHTTPRequests complex type that appears
      # as SampledRequests in the response syntax. SampledHTTPRequests contains one SampledHTTPRequest
      # object for each web request that is returned by GetSampledRequests .

      struct SampledHTTPRequest
        include JSON::Serializable

        # A complex type that contains detailed information about the request.

        @[JSON::Field(key: "Request")]
        getter request : Types::HTTPRequest

        # A value that indicates how one result in the response relates proportionally to other results in the
        # response. A result that has a weight of 2 represents roughly twice as many CloudFront web requests
        # as a result that has a weight of 1 .

        @[JSON::Field(key: "Weight")]
        getter weight : Int64

        # The action for the Rule that the request matched: ALLOW , BLOCK , or COUNT .

        @[JSON::Field(key: "Action")]
        getter action : String?

        # This value is returned if the GetSampledRequests request specifies the ID of a RuleGroup rather than
        # the ID of an individual rule. RuleWithinRuleGroup is the rule within the specified RuleGroup that
        # matched the request listed in the response.

        @[JSON::Field(key: "RuleWithinRuleGroup")]
        getter rule_within_rule_group : String?

        # The time at which AWS WAF received the request from your AWS resource, in Unix time format (in
        # seconds).

        @[JSON::Field(key: "Timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time?

        def initialize(
          @request : Types::HTTPRequest,
          @weight : Int64,
          @action : String? = nil,
          @rule_within_rule_group : String? = nil,
          @timestamp : Time? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies a constraint on the size of a part of the web request. AWS WAF uses the Size ,
      # ComparisonOperator , and FieldToMatch to build an expression in the form of " Size
      # ComparisonOperator size in bytes of FieldToMatch ". If that expression is true, the SizeConstraint
      # is considered to match.

      struct SizeConstraint
        include JSON::Serializable

        # The type of comparison you want AWS WAF to perform. AWS WAF uses this in combination with the
        # provided Size and FieldToMatch to build an expression in the form of " Size ComparisonOperator size
        # in bytes of FieldToMatch ". If that expression is true, the SizeConstraint is considered to match.
        # EQ : Used to test if the Size is equal to the size of the FieldToMatch NE : Used to test if the Size
        # is not equal to the size of the FieldToMatch LE : Used to test if the Size is less than or equal to
        # the size of the FieldToMatch LT : Used to test if the Size is strictly less than the size of the
        # FieldToMatch GE : Used to test if the Size is greater than or equal to the size of the FieldToMatch
        # GT : Used to test if the Size is strictly greater than the size of the FieldToMatch

        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # Specifies where in a web request to look for the size constraint.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # The size in bytes that you want AWS WAF to compare against the size of the specified FieldToMatch .
        # AWS WAF uses this in combination with ComparisonOperator and FieldToMatch to build an expression in
        # the form of " Size ComparisonOperator size in bytes of FieldToMatch ". If that expression is true,
        # the SizeConstraint is considered to match. Valid values for size are 0 - 21474836480 bytes (0 - 20
        # GB). If you specify URI for the value of Type , the / in the URI counts as one character. For
        # example, the URI /logo.jpg is nine characters long.

        @[JSON::Field(key: "Size")]
        getter size : Int64

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on
        # FieldToMatch before inspecting it for a match. You can only specify a single type of
        # TextTransformation. Note that if you choose BODY for the value of Type , you must choose NONE for
        # TextTransformation because CloudFront forwards only the first 8192 bytes for inspection. NONE
        # Specify NONE if you don't want to perform any text transformations. CMD_LINE When you're concerned
        # that attackers are injecting an operating system command line command and using unusual formatting
        # to disguise some or all of the command, use this option to perform the following transformations:
        # Delete the following characters: \ " ' ^ Delete spaces before the following characters: / ( Replace
        # the following characters with a space: , ; Replace multiple spaces with one space Convert uppercase
        # letters (A-Z) to lowercase (a-z) COMPRESS_WHITE_SPACE Use this option to replace the following
        # characters with a space character (decimal 32): \f, formfeed, decimal 12 \t, tab, decimal 9 \n,
        # newline, decimal 10 \r, carriage return, decimal 13 \v, vertical tab, decimal 11 non-breaking space,
        # decimal 160 COMPRESS_WHITE_SPACE also replaces multiple spaces with one space. HTML_ENTITY_DECODE
        # Use this option to replace HTML-encoded characters with unencoded characters. HTML_ENTITY_DECODE
        # performs the following operations: Replaces (ampersand)quot; with " Replaces (ampersand)nbsp; with a
        # non-breaking space, decimal 160 Replaces (ampersand)lt; with a "less than" symbol Replaces
        # (ampersand)gt; with &gt; Replaces characters that are represented in hexadecimal format,
        # (ampersand)#xhhhh; , with the corresponding characters Replaces characters that are represented in
        # decimal format, (ampersand)#nnnn; , with the corresponding characters LOWERCASE Use this option to
        # convert uppercase letters (A-Z) to lowercase (a-z). URL_DECODE Use this option to decode a
        # URL-encoded value.

        @[JSON::Field(key: "TextTransformation")]
        getter text_transformation : String

        def initialize(
          @comparison_operator : String,
          @field_to_match : Types::FieldToMatch,
          @size : Int64,
          @text_transformation : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # complex type that contains SizeConstraint objects, which specify the parts of web requests that you
      # want AWS WAF to inspect the size of. If a SizeConstraintSet contains more than one SizeConstraint
      # object, a request only needs to match one constraint to be considered a match.

      struct SizeConstraintSet
        include JSON::Serializable

        # A unique identifier for a SizeConstraintSet . You use SizeConstraintSetId to get information about a
        # SizeConstraintSet (see GetSizeConstraintSet ), update a SizeConstraintSet (see
        # UpdateSizeConstraintSet ), insert a SizeConstraintSet into a Rule or delete one from a Rule (see
        # UpdateRule ), and delete a SizeConstraintSet from AWS WAF (see DeleteSizeConstraintSet ).
        # SizeConstraintSetId is returned by CreateSizeConstraintSet and by ListSizeConstraintSets .

        @[JSON::Field(key: "SizeConstraintSetId")]
        getter size_constraint_set_id : String

        # Specifies the parts of web requests that you want to inspect the size of.

        @[JSON::Field(key: "SizeConstraints")]
        getter size_constraints : Array(Types::SizeConstraint)

        # The name, if any, of the SizeConstraintSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @size_constraint_set_id : String,
          @size_constraints : Array(Types::SizeConstraint),
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The Id
      # and Name of a SizeConstraintSet .

      struct SizeConstraintSetSummary
        include JSON::Serializable

        # The name of the SizeConstraintSet , if any.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a SizeConstraintSet . You use SizeConstraintSetId to get information about a
        # SizeConstraintSet (see GetSizeConstraintSet ), update a SizeConstraintSet (see
        # UpdateSizeConstraintSet ), insert a SizeConstraintSet into a Rule or delete one from a Rule (see
        # UpdateRule ), and delete a SizeConstraintSet from AWS WAF (see DeleteSizeConstraintSet ).
        # SizeConstraintSetId is returned by CreateSizeConstraintSet and by ListSizeConstraintSets .

        @[JSON::Field(key: "SizeConstraintSetId")]
        getter size_constraint_set_id : String

        def initialize(
          @name : String,
          @size_constraint_set_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the part of a web request that you want to inspect the size of and indicates whether you
      # want to add the specification to a SizeConstraintSet or delete it from a SizeConstraintSet .

      struct SizeConstraintSetUpdate
        include JSON::Serializable

        # Specify INSERT to add a SizeConstraintSetUpdate to a SizeConstraintSet . Use DELETE to remove a
        # SizeConstraintSetUpdate from a SizeConstraintSet .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Specifies a constraint on the size of a part of the web request. AWS WAF uses the Size ,
        # ComparisonOperator , and FieldToMatch to build an expression in the form of " Size
        # ComparisonOperator size in bytes of FieldToMatch ". If that expression is true, the SizeConstraint
        # is considered to match.

        @[JSON::Field(key: "SizeConstraint")]
        getter size_constraint : Types::SizeConstraint

        def initialize(
          @action : String,
          @size_constraint : Types::SizeConstraint
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # complex type that contains SqlInjectionMatchTuple objects, which specify the parts of web requests
      # that you want AWS WAF to inspect for snippets of malicious SQL code and, if you want AWS WAF to
      # inspect a header, the name of the header. If a SqlInjectionMatchSet contains more than one
      # SqlInjectionMatchTuple object, a request needs to include snippets of SQL code in only one of the
      # specified parts of the request to be considered a match.

      struct SqlInjectionMatchSet
        include JSON::Serializable

        # A unique identifier for a SqlInjectionMatchSet . You use SqlInjectionMatchSetId to get information
        # about a SqlInjectionMatchSet (see GetSqlInjectionMatchSet ), update a SqlInjectionMatchSet (see
        # UpdateSqlInjectionMatchSet ), insert a SqlInjectionMatchSet into a Rule or delete one from a Rule
        # (see UpdateRule ), and delete a SqlInjectionMatchSet from AWS WAF (see DeleteSqlInjectionMatchSet ).
        # SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets .

        @[JSON::Field(key: "SqlInjectionMatchSetId")]
        getter sql_injection_match_set_id : String

        # Specifies the parts of web requests that you want to inspect for snippets of malicious SQL code.

        @[JSON::Field(key: "SqlInjectionMatchTuples")]
        getter sql_injection_match_tuples : Array(Types::SqlInjectionMatchTuple)

        # The name, if any, of the SqlInjectionMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @sql_injection_match_set_id : String,
          @sql_injection_match_tuples : Array(Types::SqlInjectionMatchTuple),
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The Id
      # and Name of a SqlInjectionMatchSet .

      struct SqlInjectionMatchSetSummary
        include JSON::Serializable

        # The name of the SqlInjectionMatchSet , if any, specified by Id .

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a SqlInjectionMatchSet . You use SqlInjectionMatchSetId to get information
        # about a SqlInjectionMatchSet (see GetSqlInjectionMatchSet ), update a SqlInjectionMatchSet (see
        # UpdateSqlInjectionMatchSet ), insert a SqlInjectionMatchSet into a Rule or delete one from a Rule
        # (see UpdateRule ), and delete a SqlInjectionMatchSet from AWS WAF (see DeleteSqlInjectionMatchSet ).
        # SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets .

        @[JSON::Field(key: "SqlInjectionMatchSetId")]
        getter sql_injection_match_set_id : String

        def initialize(
          @name : String,
          @sql_injection_match_set_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the part of a web request that you want to inspect for snippets of malicious SQL code and
      # indicates whether you want to add the specification to a SqlInjectionMatchSet or delete it from a
      # SqlInjectionMatchSet .

      struct SqlInjectionMatchSetUpdate
        include JSON::Serializable

        # Specify INSERT to add a SqlInjectionMatchSetUpdate to a SqlInjectionMatchSet . Use DELETE to remove
        # a SqlInjectionMatchSetUpdate from a SqlInjectionMatchSet .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL
        # code and, if you want AWS WAF to inspect a header, the name of the header.

        @[JSON::Field(key: "SqlInjectionMatchTuple")]
        getter sql_injection_match_tuple : Types::SqlInjectionMatchTuple

        def initialize(
          @action : String,
          @sql_injection_match_tuple : Types::SqlInjectionMatchTuple
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the part of a web request that you want AWS WAF to inspect for snippets of malicious SQL
      # code and, if you want AWS WAF to inspect a header, the name of the header.

      struct SqlInjectionMatchTuple
        include JSON::Serializable

        # Specifies where in a web request to look for snippets of malicious SQL code.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on
        # FieldToMatch before inspecting it for a match. You can only specify a single type of
        # TextTransformation. CMD_LINE When you're concerned that attackers are injecting an operating system
        # command line command and using unusual formatting to disguise some or all of the command, use this
        # option to perform the following transformations: Delete the following characters: \ " ' ^ Delete
        # spaces before the following characters: / ( Replace the following characters with a space: , ;
        # Replace multiple spaces with one space Convert uppercase letters (A-Z) to lowercase (a-z)
        # COMPRESS_WHITE_SPACE Use this option to replace the following characters with a space character
        # (decimal 32): \f, formfeed, decimal 12 \t, tab, decimal 9 \n, newline, decimal 10 \r, carriage
        # return, decimal 13 \v, vertical tab, decimal 11 non-breaking space, decimal 160 COMPRESS_WHITE_SPACE
        # also replaces multiple spaces with one space. HTML_ENTITY_DECODE Use this option to replace
        # HTML-encoded characters with unencoded characters. HTML_ENTITY_DECODE performs the following
        # operations: Replaces (ampersand)quot; with " Replaces (ampersand)nbsp; with a non-breaking space,
        # decimal 160 Replaces (ampersand)lt; with a "less than" symbol Replaces (ampersand)gt; with &gt;
        # Replaces characters that are represented in hexadecimal format, (ampersand)#xhhhh; , with the
        # corresponding characters Replaces characters that are represented in decimal format,
        # (ampersand)#nnnn; , with the corresponding characters LOWERCASE Use this option to convert uppercase
        # letters (A-Z) to lowercase (a-z). URL_DECODE Use this option to decode a URL-encoded value. NONE
        # Specify NONE if you don't want to perform any text transformations.

        @[JSON::Field(key: "TextTransformation")]
        getter text_transformation : String

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @text_transformation : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # summary of the rule groups you are subscribed to.

      struct SubscribedRuleGroupSummary
        include JSON::Serializable

        # A friendly name or description for the metrics for this RuleGroup . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change the name of the metric after you create the RuleGroup .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String

        # A friendly name or description of the RuleGroup . You can't change the name of a RuleGroup after you
        # create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a RuleGroup .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        def initialize(
          @metric_name : String,
          @name : String,
          @rule_group_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A tag
      # associated with an AWS resource. Tags are key:value pairs that you can use to categorize and manage
      # your resources, for purposes like billing. For example, you might set the tag key to "customer" and
      # the value to the customer name or ID. You can specify one or more tags to add to each AWS resource,
      # up to 50 tags for a resource. Tagging is only available through the API, SDKs, and CLI. You can't
      # manage or view tags through the AWS WAF Classic console. You can tag the AWS resources that you
      # manage through AWS WAF Classic: web ACLs, rule groups, and rules.

      struct Tag
        include JSON::Serializable


        @[JSON::Field(key: "Key")]
        getter key : String


        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Information for a tag associated with an AWS resource. Tags are key:value pairs that you can use to
      # categorize and manage your resources, for purposes like billing. For example, you might set the tag
      # key to "customer" and the value to the customer name or ID. You can specify one or more tags to add
      # to each AWS resource, up to 50 tags for a resource. Tagging is only available through the API, SDKs,
      # and CLI. You can't manage or view tags through the AWS WAF Classic console. You can tag the AWS
      # resources that you manage through AWS WAF Classic: web ACLs, rule groups, and rules.

      struct TagInfoForResource
        include JSON::Serializable


        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String?


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


        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String


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

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. In a
      # GetSampledRequests request, the StartTime and EndTime objects specify the time range for which you
      # want AWS WAF to return a sample of web requests. You must specify the times in Coordinated Universal
      # Time (UTC) format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z"
      # . In a GetSampledRequests response, the StartTime and EndTime objects specify the time range for
      # which AWS WAF actually returned a sample of web requests. AWS WAF gets the specified number of
      # requests from among the first 5,000 requests that your AWS resource receives during the specified
      # time period. If your resource receives more than 5,000 requests during that period, AWS WAF stops
      # sampling after the 5,000th request. In that case, EndTime is the time that AWS WAF received the
      # 5,000th request.

      struct TimeWindow
        include JSON::Serializable

        # The end of the time range from which you want GetSampledRequests to return a sample of the requests
        # that your AWS resource received. You must specify the date and time in Coordinated Universal Time
        # (UTC) format. UTC format includes the special designator, Z . For example, "2016-09-27T14:50Z" . You
        # can specify any time range in the previous three hours.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The beginning of the time range from which you want GetSampledRequests to return a sample of the
        # requests that your AWS resource received. You must specify the date and time in Coordinated
        # Universal Time (UTC) format. UTC format includes the special designator, Z . For example,
        # "2016-09-27T14:50Z" . You can specify any time range in the previous three hours.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String


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


      struct UpdateByteMatchSetRequest
        include JSON::Serializable

        # The ByteMatchSetId of the ByteMatchSet that you want to update. ByteMatchSetId is returned by
        # CreateByteMatchSet and by ListByteMatchSets .

        @[JSON::Field(key: "ByteMatchSetId")]
        getter byte_match_set_id : String

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # An array of ByteMatchSetUpdate objects that you want to insert into or delete from a ByteMatchSet .
        # For more information, see the applicable data types: ByteMatchSetUpdate : Contains Action and
        # ByteMatchTuple ByteMatchTuple : Contains FieldToMatch , PositionalConstraint , TargetString , and
        # TextTransformation FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::ByteMatchSetUpdate)

        def initialize(
          @byte_match_set_id : String,
          @change_token : String,
          @updates : Array(Types::ByteMatchSetUpdate)
        )
        end
      end


      struct UpdateByteMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateByteMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateGeoMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The GeoMatchSetId of the GeoMatchSet that you want to update. GeoMatchSetId is returned by
        # CreateGeoMatchSet and by ListGeoMatchSets .

        @[JSON::Field(key: "GeoMatchSetId")]
        getter geo_match_set_id : String

        # An array of GeoMatchSetUpdate objects that you want to insert into or delete from an GeoMatchSet .
        # For more information, see the applicable data types: GeoMatchSetUpdate : Contains Action and
        # GeoMatchConstraint GeoMatchConstraint : Contains Type and Value You can have only one Type and Value
        # per GeoMatchConstraint . To add multiple countries, include multiple GeoMatchSetUpdate objects in
        # your request.

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::GeoMatchSetUpdate)

        def initialize(
          @change_token : String,
          @geo_match_set_id : String,
          @updates : Array(Types::GeoMatchSetUpdate)
        )
        end
      end


      struct UpdateGeoMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateGeoMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateIPSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The IPSetId of the IPSet that you want to update. IPSetId is returned by CreateIPSet and by
        # ListIPSets .

        @[JSON::Field(key: "IPSetId")]
        getter ip_set_id : String

        # An array of IPSetUpdate objects that you want to insert into or delete from an IPSet . For more
        # information, see the applicable data types: IPSetUpdate : Contains Action and IPSetDescriptor
        # IPSetDescriptor : Contains Type and Value You can insert a maximum of 1000 addresses in a single
        # request.

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::IPSetUpdate)

        def initialize(
          @change_token : String,
          @ip_set_id : String,
          @updates : Array(Types::IPSetUpdate)
        )
        end
      end


      struct UpdateIPSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateIPSet request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateRateBasedRuleRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The maximum number of requests, which have an identical value in the field specified by the RateKey
        # , allowed in a five-minute period. If the number of requests exceeds the RateLimit and the other
        # predicates specified in the rule are also met, AWS WAF triggers the action that is specified for
        # this rule.

        @[JSON::Field(key: "RateLimit")]
        getter rate_limit : Int64

        # The RuleId of the RateBasedRule that you want to update. RuleId is returned by CreateRateBasedRule
        # and by ListRateBasedRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # An array of RuleUpdate objects that you want to insert into or delete from a RateBasedRule .

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::RuleUpdate)

        def initialize(
          @change_token : String,
          @rate_limit : Int64,
          @rule_id : String,
          @updates : Array(Types::RuleUpdate)
        )
        end
      end


      struct UpdateRateBasedRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateRateBasedRule request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateRegexMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RegexMatchSetId of the RegexMatchSet that you want to update. RegexMatchSetId is returned by
        # CreateRegexMatchSet and by ListRegexMatchSets .

        @[JSON::Field(key: "RegexMatchSetId")]
        getter regex_match_set_id : String

        # An array of RegexMatchSetUpdate objects that you want to insert into or delete from a RegexMatchSet
        # . For more information, see RegexMatchTuple .

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::RegexMatchSetUpdate)

        def initialize(
          @change_token : String,
          @regex_match_set_id : String,
          @updates : Array(Types::RegexMatchSetUpdate)
        )
        end
      end


      struct UpdateRegexMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateRegexMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateRegexPatternSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RegexPatternSetId of the RegexPatternSet that you want to update. RegexPatternSetId is returned
        # by CreateRegexPatternSet and by ListRegexPatternSets .

        @[JSON::Field(key: "RegexPatternSetId")]
        getter regex_pattern_set_id : String

        # An array of RegexPatternSetUpdate objects that you want to insert into or delete from a
        # RegexPatternSet .

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::RegexPatternSetUpdate)

        def initialize(
          @change_token : String,
          @regex_pattern_set_id : String,
          @updates : Array(Types::RegexPatternSetUpdate)
        )
        end
      end


      struct UpdateRegexPatternSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateRegexPatternSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateRuleGroupRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RuleGroupId of the RuleGroup that you want to update. RuleGroupId is returned by CreateRuleGroup
        # and by ListRuleGroups .

        @[JSON::Field(key: "RuleGroupId")]
        getter rule_group_id : String

        # An array of RuleGroupUpdate objects that you want to insert into or delete from a RuleGroup . You
        # can only insert REGULAR rules into a rule group. ActivatedRule|OverrideAction applies only when
        # updating or adding a RuleGroup to a WebACL . In this case you do not use ActivatedRule|Action . For
        # all other update requests, ActivatedRule|Action is used instead of ActivatedRule|OverrideAction .

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::RuleGroupUpdate)

        def initialize(
          @change_token : String,
          @rule_group_id : String,
          @updates : Array(Types::RuleGroupUpdate)
        )
        end
      end


      struct UpdateRuleGroupResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateRuleGroup request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateRuleRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The RuleId of the Rule that you want to update. RuleId is returned by CreateRule and by ListRules .

        @[JSON::Field(key: "RuleId")]
        getter rule_id : String

        # An array of RuleUpdate objects that you want to insert into or delete from a Rule . For more
        # information, see the applicable data types: RuleUpdate : Contains Action and Predicate Predicate :
        # Contains DataId , Negated , and Type FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::RuleUpdate)

        def initialize(
          @change_token : String,
          @rule_id : String,
          @updates : Array(Types::RuleUpdate)
        )
        end
      end


      struct UpdateRuleResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateRule request. You can also use this value to query
        # the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateSizeConstraintSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The SizeConstraintSetId of the SizeConstraintSet that you want to update. SizeConstraintSetId is
        # returned by CreateSizeConstraintSet and by ListSizeConstraintSets .

        @[JSON::Field(key: "SizeConstraintSetId")]
        getter size_constraint_set_id : String

        # An array of SizeConstraintSetUpdate objects that you want to insert into or delete from a
        # SizeConstraintSet . For more information, see the applicable data types: SizeConstraintSetUpdate :
        # Contains Action and SizeConstraint SizeConstraint : Contains FieldToMatch , TextTransformation ,
        # ComparisonOperator , and Size FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::SizeConstraintSetUpdate)

        def initialize(
          @change_token : String,
          @size_constraint_set_id : String,
          @updates : Array(Types::SizeConstraintSetUpdate)
        )
        end
      end


      struct UpdateSizeConstraintSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateSizeConstraintSet request. You can also use this
        # value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end

      # A request to update a SqlInjectionMatchSet .

      struct UpdateSqlInjectionMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to update.
        # SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets .

        @[JSON::Field(key: "SqlInjectionMatchSetId")]
        getter sql_injection_match_set_id : String

        # An array of SqlInjectionMatchSetUpdate objects that you want to insert into or delete from a
        # SqlInjectionMatchSet . For more information, see the applicable data types:
        # SqlInjectionMatchSetUpdate : Contains Action and SqlInjectionMatchTuple SqlInjectionMatchTuple :
        # Contains FieldToMatch and TextTransformation FieldToMatch : Contains Data and Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::SqlInjectionMatchSetUpdate)

        def initialize(
          @change_token : String,
          @sql_injection_match_set_id : String,
          @updates : Array(Types::SqlInjectionMatchSetUpdate)
        )
        end
      end

      # The response to an UpdateSqlInjectionMatchSets request.

      struct UpdateSqlInjectionMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateSqlInjectionMatchSet request. You can also use
        # this value to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct UpdateWebACLRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # The WebACLId of the WebACL that you want to update. WebACLId is returned by CreateWebACL and by
        # ListWebACLs .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        # A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs the default action if a
        # request doesn't match the criteria in any of the rules in a web ACL.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::WafAction?

        # An array of updates to make to the WebACL . An array of WebACLUpdate objects that you want to insert
        # into or delete from a WebACL . For more information, see the applicable data types: WebACLUpdate :
        # Contains Action and ActivatedRule ActivatedRule : Contains Action , OverrideAction , Priority ,
        # RuleId , and Type . ActivatedRule|OverrideAction applies only when updating or adding a RuleGroup to
        # a WebACL . In this case, you do not use ActivatedRule|Action . For all other update requests,
        # ActivatedRule|Action is used instead of ActivatedRule|OverrideAction . WafAction : Contains Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::WebACLUpdate)?

        def initialize(
          @change_token : String,
          @web_acl_id : String,
          @default_action : Types::WafAction? = nil,
          @updates : Array(Types::WebACLUpdate)? = nil
        )
        end
      end


      struct UpdateWebACLResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateWebACL request. You can also use this value to
        # query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end

      # A request to update an XssMatchSet .

      struct UpdateXssMatchSetRequest
        include JSON::Serializable

        # The value returned by the most recent call to GetChangeToken .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String

        # An array of XssMatchSetUpdate objects that you want to insert into or delete from an XssMatchSet .
        # For more information, see the applicable data types: XssMatchSetUpdate : Contains Action and
        # XssMatchTuple XssMatchTuple : Contains FieldToMatch and TextTransformation FieldToMatch : Contains
        # Data and Type

        @[JSON::Field(key: "Updates")]
        getter updates : Array(Types::XssMatchSetUpdate)

        # The XssMatchSetId of the XssMatchSet that you want to update. XssMatchSetId is returned by
        # CreateXssMatchSet and by ListXssMatchSets .

        @[JSON::Field(key: "XssMatchSetId")]
        getter xss_match_set_id : String

        def initialize(
          @change_token : String,
          @updates : Array(Types::XssMatchSetUpdate),
          @xss_match_set_id : String
        )
        end
      end

      # The response to an UpdateXssMatchSets request.

      struct UpdateXssMatchSetResponse
        include JSON::Serializable

        # The ChangeToken that you used to submit the UpdateXssMatchSet request. You can also use this value
        # to query the status of the request. For more information, see GetChangeTokenStatus .

        @[JSON::Field(key: "ChangeToken")]
        getter change_token : String?

        def initialize(
          @change_token : String? = nil
        )
        end
      end


      struct WAFBadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The name specified is invalid.

      struct WAFDisallowedNameException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed due to a problem with the migration. The failure cause is provided in the
      # exception, in the MigrationErrorType : ENTITY_NOT_SUPPORTED - The web ACL has an unsupported entity
      # but the IgnoreUnsupportedType is not set to true. ENTITY_NOT_FOUND - The web ACL doesn't exist.
      # S3_BUCKET_NO_PERMISSION - You don't have permission to perform the PutObject action to the specified
      # Amazon S3 bucket. S3_BUCKET_NOT_ACCESSIBLE - The bucket policy doesn't allow AWS WAF to perform the
      # PutObject action in the bucket. S3_BUCKET_NOT_FOUND - The S3 bucket doesn't exist.
      # S3_BUCKET_INVALID_REGION - The S3 bucket is not in the same Region as the web ACL. S3_INTERNAL_ERROR
      # - AWS WAF failed to create the template in the S3 bucket for another reason.

      struct WAFEntityMigrationException
        include JSON::Serializable


        @[JSON::Field(key: "MigrationErrorReason")]
        getter migration_error_reason : String?


        @[JSON::Field(key: "MigrationErrorType")]
        getter migration_error_type : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @migration_error_reason : String? = nil,
          @migration_error_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The operation failed because of a system problem, even though the request was valid. Retry your
      # request.

      struct WAFInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you tried to create, update, or delete an object by using an invalid
      # account identifier.

      struct WAFInvalidAccountException
        include JSON::Serializable

        def initialize
        end
      end

      # The operation failed because there was nothing to do. For example: You tried to remove a Rule from a
      # WebACL , but the Rule isn't in the specified WebACL . You tried to remove an IP address from an
      # IPSet , but the IP address isn't in the specified IPSet . You tried to remove a ByteMatchTuple from
      # a ByteMatchSet , but the ByteMatchTuple isn't in the specified WebACL . You tried to add a Rule to a
      # WebACL , but the Rule already exists in the specified WebACL . You tried to add a ByteMatchTuple to
      # a ByteMatchSet , but the ByteMatchTuple already exists in the specified WebACL .

      struct WAFInvalidOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because AWS WAF didn't recognize a parameter in the request. For example: You
      # specified an invalid parameter name. You specified an invalid value. You tried to update an object (
      # ByteMatchSet , IPSet , Rule , or WebACL ) using an action other than INSERT or DELETE . You tried to
      # create a WebACL with a DefaultAction Type other than ALLOW , BLOCK , or COUNT . You tried to create
      # a RateBasedRule with a RateKey value other than IP . You tried to update a WebACL with a WafAction
      # Type other than ALLOW , BLOCK , or COUNT . You tried to update a ByteMatchSet with a FieldToMatch
      # Type other than HEADER, METHOD, QUERY_STRING, URI, or BODY. You tried to update a ByteMatchSet with
      # a Field of HEADER but no value for Data . Your request references an ARN that is malformed, or
      # corresponds to a resource with which a web ACL cannot be associated.

      struct WAFInvalidParameterException
        include JSON::Serializable


        @[JSON::Field(key: "field")]
        getter field : String?


        @[JSON::Field(key: "parameter")]
        getter parameter : String?


        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field : String? = nil,
          @parameter : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The operation failed because the specified policy is not in the proper format. The policy is subject
      # to the following restrictions: You can attach only one policy with each PutPermissionPolicy request.
      # The policy must include an Effect , Action and Principal . Effect must specify Allow . The Action in
      # the policy must be waf:UpdateWebACL , waf-regional:UpdateWebACL , waf:GetRuleGroup and
      # waf-regional:GetRuleGroup . Any extra or wildcard actions in the policy will be rejected. The policy
      # cannot include a Resource parameter. The ARN in the request must be a valid WAF RuleGroup ARN and
      # the RuleGroup must exist in the same region. The user making the request must be the owner of the
      # RuleGroup. Your policy must be composed using IAM Policy version 2012-10-17.

      struct WAFInvalidPermissionPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The regular expression (regex) you specified in RegexPatternString is invalid.

      struct WAFInvalidRegexPatternException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation exceeds a resource limit, for example, the maximum number of WebACL objects that you
      # can create for an AWS account. For more information, see Limits in the AWS WAF Developer Guide .

      struct WAFLimitsExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you tried to delete an object that isn't empty. For example: You tried
      # to delete a WebACL that still contains one or more Rule objects. You tried to delete a Rule that
      # still contains one or more ByteMatchSet objects or other predicates. You tried to delete a
      # ByteMatchSet that contains one or more ByteMatchTuple objects. You tried to delete an IPSet that
      # references one or more IP addresses.

      struct WAFNonEmptyEntityException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you tried to add an object to or delete an object from another object
      # that doesn't exist. For example: You tried to add a Rule to or delete a Rule from a WebACL that
      # doesn't exist. You tried to add a ByteMatchSet to or delete a ByteMatchSet from a Rule that doesn't
      # exist. You tried to add an IP address to or delete an IP address from an IPSet that doesn't exist.
      # You tried to add a ByteMatchTuple to or delete a ByteMatchTuple from a ByteMatchSet that doesn't
      # exist.

      struct WAFNonexistentContainerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because the referenced object doesn't exist.

      struct WAFNonexistentItemException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you tried to delete an object that is still in use. For example: You
      # tried to delete a ByteMatchSet that is still referenced by a Rule . You tried to delete a Rule that
      # is still referenced by a WebACL .

      struct WAFReferencedItemException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # AWS WAF is not able to access the service linked role. This can be caused by a previous
      # PutLoggingConfiguration request, which can lock the service linked role for about 20 seconds. Please
      # try your request again. The service linked role can also be locked by a previous
      # DeleteServiceLinkedRole request, which can lock the role for 15 minutes or more. If you recently
      # made a DeleteServiceLinkedRole , wait at least 15 minutes and try the request again. If you receive
      # this same exception again, you will have to wait additional time until the role is unlocked.

      struct WAFServiceLinkedRoleErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation failed because you tried to create, update, or delete an object by using a change
      # token that has already been used.

      struct WAFStaleDataException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified subscription does not exist.

      struct WAFSubscriptionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct WAFTagOperationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct WAFTagOperationInternalErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. For
      # the action that is associated with a rule in a WebACL , specifies the action that you want AWS WAF
      # to perform when a web request matches all of the conditions in a rule. For the default action in a
      # WebACL , specifies the action that you want AWS WAF to take when a web request doesn't match all of
      # the conditions in any of the rules in a WebACL .

      struct WafAction
        include JSON::Serializable

        # Specifies how you want AWS WAF to respond to requests that match the settings in a Rule . Valid
        # settings include the following: ALLOW : AWS WAF allows requests BLOCK : AWS WAF blocks requests
        # COUNT : AWS WAF increments a counter of the requests that match all of the conditions in the rule.
        # AWS WAF then continues to inspect the web request based on the remaining rules in the web ACL. You
        # can't specify COUNT for the default action for a WebACL .

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The
      # action to take if any rule within the RuleGroup matches a request.

      struct WafOverrideAction
        include JSON::Serializable

        # COUNT overrides the action specified by the individual rule within a RuleGroup . If set to NONE ,
        # the rule's action will take place.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the Rules that identify the requests that you want to allow, block, or count. In a WebACL ,
      # you also specify a default action ( ALLOW or BLOCK ), and the action for each Rule that you add to a
      # WebACL , for example, block requests from specified IP addresses or block requests from specified
      # referrers. You also associate the WebACL with a CloudFront distribution to identify the requests
      # that you want AWS WAF to filter. If you add more than one Rule to a WebACL , a request needs to
      # match only one of the specifications to be allowed, blocked, or counted. For more information, see
      # UpdateWebACL .

      struct WebACL
        include JSON::Serializable

        # The action to perform if none of the Rules contained in the WebACL match. The action is specified by
        # the WafAction object.

        @[JSON::Field(key: "DefaultAction")]
        getter default_action : Types::WafAction

        # An array that contains the action for each Rule in a WebACL , the priority of the Rule , and the ID
        # of the Rule .

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::ActivatedRule)

        # A unique identifier for a WebACL . You use WebACLId to get information about a WebACL (see GetWebACL
        # ), update a WebACL (see UpdateWebACL ), and delete a WebACL from AWS WAF (see DeleteWebACL ).
        # WebACLId is returned by CreateWebACL and by ListWebACLs .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        # A friendly name or description for the metrics for this WebACL . The name can contain only
        # alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't
        # contain whitespace or metric names reserved for AWS WAF, including "All" and "Default_Action." You
        # can't change MetricName after you create the WebACL .

        @[JSON::Field(key: "MetricName")]
        getter metric_name : String?

        # A friendly name or description of the WebACL . You can't change the name of a WebACL after you
        # create it.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Tha Amazon Resource Name (ARN) of the web ACL.

        @[JSON::Field(key: "WebACLArn")]
        getter web_acl_arn : String?

        def initialize(
          @default_action : Types::WafAction,
          @rules : Array(Types::ActivatedRule),
          @web_acl_id : String,
          @metric_name : String? = nil,
          @name : String? = nil,
          @web_acl_arn : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Contains the identifier and the name or description of the WebACL .

      struct WebACLSummary
        include JSON::Serializable

        # A friendly name or description of the WebACL . You can't change the name of a WebACL after you
        # create it.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for a WebACL . You use WebACLId to get information about a WebACL (see GetWebACL
        # ), update a WebACL (see UpdateWebACL ), and delete a WebACL from AWS WAF (see DeleteWebACL ).
        # WebACLId is returned by CreateWebACL and by ListWebACLs .

        @[JSON::Field(key: "WebACLId")]
        getter web_acl_id : String

        def initialize(
          @name : String,
          @web_acl_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies whether to insert a Rule into or delete a Rule from a WebACL .

      struct WebACLUpdate
        include JSON::Serializable

        # Specifies whether to insert a Rule into or delete a Rule from a WebACL .

        @[JSON::Field(key: "Action")]
        getter action : String

        # The ActivatedRule object in an UpdateWebACL request specifies a Rule that you want to insert or
        # delete, the priority of the Rule in the WebACL , and the action that you want AWS WAF to take when a
        # web request matches the Rule ( ALLOW , BLOCK , or COUNT ).

        @[JSON::Field(key: "ActivatedRule")]
        getter activated_rule : Types::ActivatedRule

        def initialize(
          @action : String,
          @activated_rule : Types::ActivatedRule
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. A
      # complex type that contains XssMatchTuple objects, which specify the parts of web requests that you
      # want AWS WAF to inspect for cross-site scripting attacks and, if you want AWS WAF to inspect a
      # header, the name of the header. If a XssMatchSet contains more than one XssMatchTuple object, a
      # request needs to include cross-site scripting attacks in only one of the specified parts of the
      # request to be considered a match.

      struct XssMatchSet
        include JSON::Serializable

        # A unique identifier for an XssMatchSet . You use XssMatchSetId to get information about an
        # XssMatchSet (see GetXssMatchSet ), update an XssMatchSet (see UpdateXssMatchSet ), insert an
        # XssMatchSet into a Rule or delete one from a Rule (see UpdateRule ), and delete an XssMatchSet from
        # AWS WAF (see DeleteXssMatchSet ). XssMatchSetId is returned by CreateXssMatchSet and by
        # ListXssMatchSets .

        @[JSON::Field(key: "XssMatchSetId")]
        getter xss_match_set_id : String

        # Specifies the parts of web requests that you want to inspect for cross-site scripting attacks.

        @[JSON::Field(key: "XssMatchTuples")]
        getter xss_match_tuples : Array(Types::XssMatchTuple)

        # The name, if any, of the XssMatchSet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @xss_match_set_id : String,
          @xss_match_tuples : Array(Types::XssMatchTuple),
          @name : String? = nil
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use. The Id
      # and Name of an XssMatchSet .

      struct XssMatchSetSummary
        include JSON::Serializable

        # The name of the XssMatchSet , if any, specified by Id .

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique identifier for an XssMatchSet . You use XssMatchSetId to get information about a
        # XssMatchSet (see GetXssMatchSet ), update an XssMatchSet (see UpdateXssMatchSet ), insert an
        # XssMatchSet into a Rule or delete one from a Rule (see UpdateRule ), and delete an XssMatchSet from
        # AWS WAF (see DeleteXssMatchSet ). XssMatchSetId is returned by CreateXssMatchSet and by
        # ListXssMatchSets .

        @[JSON::Field(key: "XssMatchSetId")]
        getter xss_match_set_id : String

        def initialize(
          @name : String,
          @xss_match_set_id : String
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the part of a web request that you want to inspect for cross-site scripting attacks and
      # indicates whether you want to add the specification to an XssMatchSet or delete it from an
      # XssMatchSet .

      struct XssMatchSetUpdate
        include JSON::Serializable

        # Specify INSERT to add an XssMatchSetUpdate to an XssMatchSet . Use DELETE to remove an
        # XssMatchSetUpdate from an XssMatchSet .

        @[JSON::Field(key: "Action")]
        getter action : String

        # Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting
        # attacks and, if you want AWS WAF to inspect a header, the name of the header.

        @[JSON::Field(key: "XssMatchTuple")]
        getter xss_match_tuple : Types::XssMatchTuple

        def initialize(
          @action : String,
          @xss_match_tuple : Types::XssMatchTuple
        )
        end
      end

      # This is AWS WAF Classic documentation. For more information, see AWS WAF Classic in the developer
      # guide. For the latest version of AWS WAF , use the AWS WAFV2 API and see the AWS WAF Developer Guide
      # . With the latest version, AWS WAF has a single set of endpoints for regional and global use.
      # Specifies the part of a web request that you want AWS WAF to inspect for cross-site scripting
      # attacks and, if you want AWS WAF to inspect a header, the name of the header.

      struct XssMatchTuple
        include JSON::Serializable

        # Specifies where in a web request to look for cross-site scripting attacks.

        @[JSON::Field(key: "FieldToMatch")]
        getter field_to_match : Types::FieldToMatch

        # Text transformations eliminate some of the unusual formatting that attackers use in web requests in
        # an effort to bypass AWS WAF. If you specify a transformation, AWS WAF performs the transformation on
        # FieldToMatch before inspecting it for a match. You can only specify a single type of
        # TextTransformation. CMD_LINE When you're concerned that attackers are injecting an operating system
        # command line command and using unusual formatting to disguise some or all of the command, use this
        # option to perform the following transformations: Delete the following characters: \ " ' ^ Delete
        # spaces before the following characters: / ( Replace the following characters with a space: , ;
        # Replace multiple spaces with one space Convert uppercase letters (A-Z) to lowercase (a-z)
        # COMPRESS_WHITE_SPACE Use this option to replace the following characters with a space character
        # (decimal 32): \f, formfeed, decimal 12 \t, tab, decimal 9 \n, newline, decimal 10 \r, carriage
        # return, decimal 13 \v, vertical tab, decimal 11 non-breaking space, decimal 160 COMPRESS_WHITE_SPACE
        # also replaces multiple spaces with one space. HTML_ENTITY_DECODE Use this option to replace
        # HTML-encoded characters with unencoded characters. HTML_ENTITY_DECODE performs the following
        # operations: Replaces (ampersand)quot; with " Replaces (ampersand)nbsp; with a non-breaking space,
        # decimal 160 Replaces (ampersand)lt; with a "less than" symbol Replaces (ampersand)gt; with &gt;
        # Replaces characters that are represented in hexadecimal format, (ampersand)#xhhhh; , with the
        # corresponding characters Replaces characters that are represented in decimal format,
        # (ampersand)#nnnn; , with the corresponding characters LOWERCASE Use this option to convert uppercase
        # letters (A-Z) to lowercase (a-z). URL_DECODE Use this option to decode a URL-encoded value. NONE
        # Specify NONE if you don't want to perform any text transformations.

        @[JSON::Field(key: "TextTransformation")]
        getter text_transformation : String

        def initialize(
          @field_to_match : Types::FieldToMatch,
          @text_transformation : String
        )
        end
      end
    end
  end
end
