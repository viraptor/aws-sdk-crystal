require "json"
require "time"

module Aws
  module MediaStore
    module Types

      # This section describes operations that you can perform on an AWS Elemental MediaStore container.

      struct Container
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container. The ARN has the following format:
        # arn:aws:&lt;region&gt;:&lt;account that owns this container&gt;:container/&lt;name of container&gt;
        # For example: arn:aws:mediastore:us-west-2:111122223333:container/movies

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # The state of access logging on the container. This value is false by default, indicating that AWS
        # Elemental MediaStore does not send access logs to Amazon CloudWatch Logs. When you enable access
        # logging on the container, MediaStore changes this value to true , indicating that the service
        # delivers access logs for objects stored in that container to CloudWatch Logs.

        @[JSON::Field(key: "AccessLoggingEnabled")]
        getter access_logging_enabled : Bool?

        # Unix timestamp.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The DNS endpoint of the container. Use the endpoint to identify the specific container when sending
        # requests to the data plane. The service assigns this value when the container is created. Once the
        # value has been assigned, it does not change.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The name of the container.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of container creation or deletion. The status is one of the following: CREATING , ACTIVE
        # , or DELETING . While the service is creating the container, the status is CREATING . When the
        # endpoint is available, the status changes to ACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @arn : String? = nil,
          @access_logging_enabled : Bool? = nil,
          @creation_time : Time? = nil,
          @endpoint : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The container that you specified in the request already exists or is being updated.

      struct ContainerInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The container that you specified in the request does not exist.

      struct ContainerNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The CORS policy that you specified in the request does not exist.

      struct CorsPolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A rule for a CORS policy. You can add up to 100 rules to a CORS policy. If more than one rule
      # applies, the service uses the first applicable rule listed.

      struct CorsRule
        include JSON::Serializable

        # Specifies which headers are allowed in a preflight OPTIONS request through the
        # Access-Control-Request-Headers header. Each header name that is specified in
        # Access-Control-Request-Headers must have a corresponding entry in the rule. Only the headers that
        # were requested are sent back. This element can contain only one wildcard character (*).

        @[JSON::Field(key: "AllowedHeaders")]
        getter allowed_headers : Array(String)

        # One or more response headers that you want users to be able to access from their applications (for
        # example, from a JavaScript XMLHttpRequest object). Each CORS rule must have at least one
        # AllowedOrigins element. The string value can include only one wildcard character (*), for example,
        # http://*.example.com. Additionally, you can specify only one wildcard character to allow
        # cross-origin access for all origins.

        @[JSON::Field(key: "AllowedOrigins")]
        getter allowed_origins : Array(String)

        # Identifies an HTTP method that the origin that is specified in the rule is allowed to execute. Each
        # CORS rule must contain at least one AllowedMethods and one AllowedOrigins element.

        @[JSON::Field(key: "AllowedMethods")]
        getter allowed_methods : Array(String)?

        # One or more headers in the response that you want users to be able to access from their applications
        # (for example, from a JavaScript XMLHttpRequest object). This element is optional for each rule.

        @[JSON::Field(key: "ExposeHeaders")]
        getter expose_headers : Array(String)?

        # The time in seconds that your browser caches the preflight response for the specified resource. A
        # CORS rule can have only one MaxAgeSeconds element.

        @[JSON::Field(key: "MaxAgeSeconds")]
        getter max_age_seconds : Int32?

        def initialize(
          @allowed_headers : Array(String),
          @allowed_origins : Array(String),
          @allowed_methods : Array(String)? = nil,
          @expose_headers : Array(String)? = nil,
          @max_age_seconds : Int32? = nil
        )
        end
      end


      struct CreateContainerInput
        include JSON::Serializable

        # The name for the container. The name must be from 1 to 255 characters. Container names must be
        # unique to your AWS account within a specific region. As an example, you could create a container
        # named movies in every region, as long as you don’t have an existing container with that name.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # An array of key:value pairs that you define. These values can be anything that you want. Typically,
        # the tag key represents a category (such as "environment") and the tag value represents a specific
        # value within that category (such as "test," "development," or "production"). You can add up to 50
        # tags to each container. For more information about tagging, including naming and usage conventions,
        # see Tagging Resources in MediaStore .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @container_name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateContainerOutput
        include JSON::Serializable

        # ContainerARN: The Amazon Resource Name (ARN) of the newly created container. The ARN has the
        # following format: arn:aws:&lt;region&gt;:&lt;account that owns this container&gt;:container/&lt;name
        # of container&gt;. For example: arn:aws:mediastore:us-west-2:111122223333:container/movies
        # ContainerName: The container name as specified in the request. CreationTime: Unix time stamp.
        # Status: The status of container creation or deletion. The status is one of the following: CREATING ,
        # ACTIVE , or DELETING . While the service is creating the container, the status is CREATING . When an
        # endpoint is available, the status changes to ACTIVE . The return value does not include the
        # container's endpoint. To make downstream requests, you must obtain this value by using
        # DescribeContainer or ListContainers .

        @[JSON::Field(key: "Container")]
        getter container : Types::Container

        def initialize(
          @container : Types::Container
        )
        end
      end


      struct DeleteContainerInput
        include JSON::Serializable

        # The name of the container to delete.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct DeleteContainerOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContainerPolicyInput
        include JSON::Serializable

        # The name of the container that holds the policy.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct DeleteContainerPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteCorsPolicyInput
        include JSON::Serializable

        # The name of the container to remove the policy from.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct DeleteCorsPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLifecyclePolicyInput
        include JSON::Serializable

        # The name of the container that holds the object lifecycle policy.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct DeleteLifecyclePolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteMetricPolicyInput
        include JSON::Serializable

        # The name of the container that is associated with the metric policy that you want to delete.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct DeleteMetricPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeContainerInput
        include JSON::Serializable

        # The name of the container to query.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String?

        def initialize(
          @container_name : String? = nil
        )
        end
      end


      struct DescribeContainerOutput
        include JSON::Serializable

        # The name of the queried container.

        @[JSON::Field(key: "Container")]
        getter container : Types::Container?

        def initialize(
          @container : Types::Container? = nil
        )
        end
      end


      struct GetContainerPolicyInput
        include JSON::Serializable

        # The name of the container.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct GetContainerPolicyOutput
        include JSON::Serializable

        # The contents of the access policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @policy : String
        )
        end
      end


      struct GetCorsPolicyInput
        include JSON::Serializable

        # The name of the container that the policy is assigned to.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct GetCorsPolicyOutput
        include JSON::Serializable

        # The CORS policy assigned to the container.

        @[JSON::Field(key: "CorsPolicy")]
        getter cors_policy : Array(Types::CorsRule)

        def initialize(
          @cors_policy : Array(Types::CorsRule)
        )
        end
      end


      struct GetLifecyclePolicyInput
        include JSON::Serializable

        # The name of the container that the object lifecycle policy is assigned to.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct GetLifecyclePolicyOutput
        include JSON::Serializable

        # The object lifecycle policy that is assigned to the container.

        @[JSON::Field(key: "LifecyclePolicy")]
        getter lifecycle_policy : String

        def initialize(
          @lifecycle_policy : String
        )
        end
      end


      struct GetMetricPolicyInput
        include JSON::Serializable

        # The name of the container that is associated with the metric policy.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct GetMetricPolicyOutput
        include JSON::Serializable

        # The metric policy that is associated with the specific container.

        @[JSON::Field(key: "MetricPolicy")]
        getter metric_policy : Types::MetricPolicy

        def initialize(
          @metric_policy : Types::MetricPolicy
        )
        end
      end

      # The service is temporarily unavailable.

      struct InternalServerError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A service limit has been exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListContainersInput
        include JSON::Serializable

        # Enter the maximum number of containers in the response. Use from 1 to 255 characters.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Only if you used MaxResults in the first command, enter the token (which was included in the
        # previous response) to obtain the next set of containers. This token is included in a response only
        # if there actually are more containers to list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContainersOutput
        include JSON::Serializable

        # The names of the containers.

        @[JSON::Field(key: "Containers")]
        getter containers : Array(Types::Container)

        # NextToken is the token to use in the next call to ListContainers . This token is returned only if
        # you included the MaxResults tag in the original command, and only if there are still containers to
        # return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @containers : Array(Types::Container),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the container.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        def initialize(
          @resource : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An array of key:value pairs that are assigned to the container.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The metric policy that is associated with the container. A metric policy allows AWS Elemental
      # MediaStore to send metrics to Amazon CloudWatch. In the policy, you must indicate whether you want
      # MediaStore to send container-level metrics. You can also include rules to define groups of objects
      # that you want MediaStore to send object-level metrics for. To view examples of how to construct a
      # metric policy for your use case, see Example Metric Policies .

      struct MetricPolicy
        include JSON::Serializable

        # A setting to enable or disable metrics at the container level.

        @[JSON::Field(key: "ContainerLevelMetrics")]
        getter container_level_metrics : String

        # A parameter that holds an array of rules that enable metrics at the object level. This parameter is
        # optional, but if you choose to include it, you must also include at least one rule. By default, you
        # can include up to five rules. You can also request a quota increase to allow up to 300 rules per
        # policy.

        @[JSON::Field(key: "MetricPolicyRules")]
        getter metric_policy_rules : Array(Types::MetricPolicyRule)?

        def initialize(
          @container_level_metrics : String,
          @metric_policy_rules : Array(Types::MetricPolicyRule)? = nil
        )
        end
      end

      # A setting that enables metrics at the object level. Each rule contains an object group and an object
      # group name. If the policy includes the MetricPolicyRules parameter, you must include at least one
      # rule. Each metric policy can include up to five rules by default. You can also request a quota
      # increase to allow up to 300 rules per policy.

      struct MetricPolicyRule
        include JSON::Serializable

        # A path or file name that defines which objects to include in the group. Wildcards (*) are
        # acceptable.

        @[JSON::Field(key: "ObjectGroup")]
        getter object_group : String

        # A name that allows you to refer to the object group.

        @[JSON::Field(key: "ObjectGroupName")]
        getter object_group_name : String

        def initialize(
          @object_group : String,
          @object_group_name : String
        )
        end
      end

      # The policy that you specified in the request does not exist.

      struct PolicyNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutContainerPolicyInput
        include JSON::Serializable

        # The name of the container.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The contents of the policy, which includes the following: One Version tag One Statement tag that
        # contains the standard tags for the policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @container_name : String,
          @policy : String
        )
        end
      end


      struct PutContainerPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutCorsPolicyInput
        include JSON::Serializable

        # The name of the container that you want to assign the CORS policy to.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The CORS policy to apply to the container.

        @[JSON::Field(key: "CorsPolicy")]
        getter cors_policy : Array(Types::CorsRule)

        def initialize(
          @container_name : String,
          @cors_policy : Array(Types::CorsRule)
        )
        end
      end


      struct PutCorsPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutLifecyclePolicyInput
        include JSON::Serializable

        # The name of the container that you want to assign the object lifecycle policy to.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The object lifecycle policy to apply to the container.

        @[JSON::Field(key: "LifecyclePolicy")]
        getter lifecycle_policy : String

        def initialize(
          @container_name : String,
          @lifecycle_policy : String
        )
        end
      end


      struct PutLifecyclePolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct PutMetricPolicyInput
        include JSON::Serializable

        # The name of the container that you want to add the metric policy to.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        # The metric policy that you want to associate with the container. In the policy, you must indicate
        # whether you want MediaStore to send container-level metrics. You can also include up to five rules
        # to define groups of objects that you want MediaStore to send object-level metrics for. If you
        # include rules in the policy, construct each rule with both of the following: An object group that
        # defines which objects to include in the group. The definition can be a path or a file name, but it
        # can't have more than 900 characters. Valid characters are: a-z, A-Z, 0-9, _ (underscore), = (equal),
        # : (colon), . (period), - (hyphen), ~ (tilde), / (forward slash), and * (asterisk). Wildcards (*) are
        # acceptable. An object group name that allows you to refer to the object group. The name can't have
        # more than 30 characters. Valid characters are: a-z, A-Z, 0-9, and _ (underscore).

        @[JSON::Field(key: "MetricPolicy")]
        getter metric_policy : Types::MetricPolicy

        def initialize(
          @container_name : String,
          @metric_policy : Types::MetricPolicy
        )
        end
      end


      struct PutMetricPolicyOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StartAccessLoggingInput
        include JSON::Serializable

        # The name of the container that you want to start access logging on.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct StartAccessLoggingOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct StopAccessLoggingInput
        include JSON::Serializable

        # The name of the container that you want to stop access logging on.

        @[JSON::Field(key: "ContainerName")]
        getter container_name : String

        def initialize(
          @container_name : String
        )
        end
      end


      struct StopAccessLoggingOutput
        include JSON::Serializable

        def initialize
        end
      end

      # A collection of tags associated with a container. Each tag consists of a key:value pair, which can
      # be anything you define. Typically, the tag key represents a category (such as "environment") and the
      # tag value represents a specific value within that category (such as "test," "development," or
      # "production"). You can add up to 50 tags to each container. For more information about tagging,
      # including naming and usage conventions, see Tagging Resources in MediaStore .

      struct Tag
        include JSON::Serializable

        # Part of the key:value pair that defines a tag. You can use a tag key to describe a category of
        # information, such as "customer." Tag keys are case-sensitive.

        @[JSON::Field(key: "Key")]
        getter key : String

        # Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value
        # within a category, such as "companyA" or "companyB." Tag values are case-sensitive.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the container.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        # An array of key:value pairs that you want to add to the container. You need to specify only the tags
        # that you want to add or update. For example, suppose a container already has two tags
        # (customer:CompanyA and priority:High). You want to change the priority tag and also add a third tag
        # (type:Contract). For TagResource, you specify the following tags: priority:Medium, type:Contract.
        # The result is that your container has three tags: customer:CompanyA, priority:Medium, and
        # type:Contract.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the container.

        @[JSON::Field(key: "Resource")]
        getter resource : String

        # A comma-separated list of keys for tags that you want to remove from the container. For example, if
        # your container has two tags (customer:CompanyA and priority:High) and you want to remove one of the
        # tags (priority:High), you specify the key for the tag that you want to remove (priority).

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
