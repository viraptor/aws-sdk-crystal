module Aws
  module Route53
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Activates a key-signing key (KSK) so that it can be used for signing by DNSSEC. This operation
      # changes the KSK status to ACTIVE .

      def activate_key_signing_key(
        hosted_zone_id : String,
        name : String
      ) : Types::ActivateKeySigningKeyResponse

        input = Types::ActivateKeySigningKeyRequest.new(hosted_zone_id: hosted_zone_id, name: name)
        activate_key_signing_key(input)
      end

      def activate_key_signing_key(input : Types::ActivateKeySigningKeyRequest) : Types::ActivateKeySigningKeyResponse
        request = Protocol::RestXml.build_request(Model::ACTIVATE_KEY_SIGNING_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ActivateKeySigningKeyResponse, "ActivateKeySigningKey")
      end

      # Associates an Amazon VPC with a private hosted zone. To perform the association, the VPC and the
      # private hosted zone must already exist. You can't convert a public hosted zone into a private hosted
      # zone. If you want to associate a VPC that was created by using one Amazon Web Services account with
      # a private hosted zone that was created by using a different account, the Amazon Web Services account
      # that created the private hosted zone must first submit a CreateVPCAssociationAuthorization request.
      # Then the account that created the VPC must submit an AssociateVPCWithHostedZone request. When
      # granting access, the hosted zone and the Amazon VPC must belong to the same partition. A partition
      # is a group of Amazon Web Services Regions. Each Amazon Web Services account is scoped to one
      # partition. The following are the supported partitions: aws - Amazon Web Services Regions aws-cn -
      # China Regions aws-us-gov - Amazon Web Services GovCloud (US) Region For more information, see Access
      # Management in the Amazon Web Services General Reference .

      def associate_vpc_with_hosted_zone(
        hosted_zone_id : String,
        vpc : Types::VPC,
        comment : String? = nil
      ) : Types::AssociateVPCWithHostedZoneResponse

        input = Types::AssociateVPCWithHostedZoneRequest.new(hosted_zone_id: hosted_zone_id, vpc: vpc, comment: comment)
        associate_vpc_with_hosted_zone(input)
      end

      def associate_vpc_with_hosted_zone(input : Types::AssociateVPCWithHostedZoneRequest) : Types::AssociateVPCWithHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::ASSOCIATE_VPC_WITH_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::AssociateVPCWithHostedZoneResponse, "AssociateVPCWithHostedZone")
      end

      # Creates, changes, or deletes CIDR blocks within a collection. Contains authoritative IP information
      # mapping blocks to one or multiple locations. A change request can update multiple locations in a
      # collection at a time, which is helpful if you want to move one or more CIDR blocks from one location
      # to another in one transaction, without downtime. Limits The max number of CIDR blocks included in
      # the request is 1000. As a result, big updates require multiple API calls. PUT and DELETE_IF_EXISTS
      # Use ChangeCidrCollection to perform the following actions: PUT : Create a CIDR block within the
      # specified collection. DELETE_IF_EXISTS : Delete an existing CIDR block from the collection.

      def change_cidr_collection(
        changes : Array(Types::CidrCollectionChange),
        id : String,
        collection_version : Int64? = nil
      ) : Types::ChangeCidrCollectionResponse

        input = Types::ChangeCidrCollectionRequest.new(changes: changes, id: id, collection_version: collection_version)
        change_cidr_collection(input)
      end

      def change_cidr_collection(input : Types::ChangeCidrCollectionRequest) : Types::ChangeCidrCollectionResponse
        request = Protocol::RestXml.build_request(Model::CHANGE_CIDR_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ChangeCidrCollectionResponse, "ChangeCidrCollection")
      end

      # Creates, changes, or deletes a resource record set, which contains authoritative DNS information for
      # a specified domain name or subdomain name. For example, you can use ChangeResourceRecordSets to
      # create a resource record set that routes traffic for test.example.com to a web server that has an IP
      # address of 192.0.2.44. Deleting Resource Record Sets To delete a resource record set, you must
      # specify all the same values that you specified when you created it. Change Batches and Transactional
      # Changes The request body must include a document with a ChangeResourceRecordSetsRequest element. The
      # request body contains a list of change items, known as a change batch. Change batches are considered
      # transactional changes. Route 53 validates the changes in the request and then either makes all or
      # none of the changes in the change batch request. This ensures that DNS routing isn't adversely
      # affected by partial changes to the resource record sets in a hosted zone. For example, suppose a
      # change batch request contains two changes: it deletes the CNAME resource record set for
      # www.example.com and creates an alias resource record set for www.example.com. If validation for both
      # records succeeds, Route 53 deletes the first resource record set and creates the second resource
      # record set in a single operation. If validation for either the DELETE or the CREATE action fails,
      # then the request is canceled, and the original CNAME record continues to exist. If you try to delete
      # the same resource record set more than once in a single change batch, Route 53 returns an
      # InvalidChangeBatch error. Traffic Flow To create resource record sets for complex routing
      # configurations, use either the traffic flow visual editor in the Route 53 console or the API actions
      # for traffic policies and traffic policy instances. Save the configuration as a traffic policy, then
      # associate the traffic policy with one or more domain names (such as example.com) or subdomain names
      # (such as www.example.com), in the same hosted zone or in multiple hosted zones. You can roll back
      # the updates if the new configuration isn't performing as expected. For more information, see Using
      # Traffic Flow to Route DNS Traffic in the Amazon Route 53 Developer Guide . Create, Delete, and
      # Upsert Use ChangeResourceRecordsSetsRequest to perform the following actions: CREATE : Creates a
      # resource record set that has the specified values. DELETE : Deletes an existing resource record set
      # that has the specified values. UPSERT : If a resource set doesn't exist, Route 53 creates it. If a
      # resource set exists Route 53 updates it with the values in the request. Syntaxes for Creating,
      # Updating, and Deleting Resource Record Sets The syntax for a request depends on the type of resource
      # record set that you want to create, delete, or update, such as weighted, alias, or failover. The XML
      # elements in your request must appear in the order listed in the syntax. For an example for each type
      # of resource record set, see "Examples." Don't refer to the syntax in the "Parameter Syntax" section,
      # which includes all of the elements for every kind of resource record set that you can create,
      # delete, or update by using ChangeResourceRecordSets . Change Propagation to Route 53 DNS Servers
      # When you submit a ChangeResourceRecordSets request, Route 53 propagates your changes to all of the
      # Route 53 authoritative DNS servers managing the hosted zone. While your changes are propagating,
      # GetChange returns a status of PENDING . When propagation is complete, GetChange returns a status of
      # INSYNC . Changes generally propagate to all Route 53 name servers managing the hosted zone within 60
      # seconds. For more information, see GetChange . Limits on ChangeResourceRecordSets Requests For
      # information about the limits on a ChangeResourceRecordSets request, see Limits in the Amazon Route
      # 53 Developer Guide .

      def change_resource_record_sets(
        change_batch : Types::ChangeBatch,
        hosted_zone_id : String
      ) : Types::ChangeResourceRecordSetsResponse

        input = Types::ChangeResourceRecordSetsRequest.new(change_batch: change_batch, hosted_zone_id: hosted_zone_id)
        change_resource_record_sets(input)
      end

      def change_resource_record_sets(input : Types::ChangeResourceRecordSetsRequest) : Types::ChangeResourceRecordSetsResponse
        request = Protocol::RestXml.build_request(Model::CHANGE_RESOURCE_RECORD_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ChangeResourceRecordSetsResponse, "ChangeResourceRecordSets")
      end

      # Adds, edits, or deletes tags for a health check or a hosted zone. For information about using tags
      # for cost allocation, see Using Cost Allocation Tags in the Billing and Cost Management User Guide .

      def change_tags_for_resource(
        resource_id : String,
        resource_type : String,
        add_tags : Array(Types::Tag)? = nil,
        remove_tag_keys : Array(String)? = nil
      ) : Types::ChangeTagsForResourceResponse

        input = Types::ChangeTagsForResourceRequest.new(resource_id: resource_id, resource_type: resource_type, add_tags: add_tags, remove_tag_keys: remove_tag_keys)
        change_tags_for_resource(input)
      end

      def change_tags_for_resource(input : Types::ChangeTagsForResourceRequest) : Types::ChangeTagsForResourceResponse
        request = Protocol::RestXml.build_request(Model::CHANGE_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ChangeTagsForResourceResponse, "ChangeTagsForResource")
      end

      # Creates a CIDR collection in the current Amazon Web Services account.

      def create_cidr_collection(
        caller_reference : String,
        name : String
      ) : Types::CreateCidrCollectionResponse

        input = Types::CreateCidrCollectionRequest.new(caller_reference: caller_reference, name: name)
        create_cidr_collection(input)
      end

      def create_cidr_collection(input : Types::CreateCidrCollectionRequest) : Types::CreateCidrCollectionResponse
        request = Protocol::RestXml.build_request(Model::CREATE_CIDR_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateCidrCollectionResponse, "CreateCidrCollection")
      end

      # Creates a new health check. For information about adding health checks to resource record sets, see
      # HealthCheckId in ChangeResourceRecordSets . ELB Load Balancers If you're registering EC2 instances
      # with an Elastic Load Balancing (ELB) load balancer, do not create Amazon Route 53 health checks for
      # the EC2 instances. When you register an EC2 instance with a load balancer, you configure settings
      # for an ELB health check, which performs a similar function to a Route 53 health check. Private
      # Hosted Zones You can associate health checks with failover resource record sets in a private hosted
      # zone. Note the following: Route 53 health checkers are outside the VPC. To check the health of an
      # endpoint within a VPC by IP address, you must assign a public IP address to the instance in the VPC.
      # You can configure a health checker to check the health of an external resource that the instance
      # relies on, such as a database server. You can create a CloudWatch metric, associate an alarm with
      # the metric, and then create a health check that is based on the state of the alarm. For example, you
      # might create a CloudWatch metric that checks the status of the Amazon EC2 StatusCheckFailed metric,
      # add an alarm to the metric, and then create a health check that is based on the state of the alarm.
      # For information about creating CloudWatch metrics and alarms by using the CloudWatch console, see
      # the Amazon CloudWatch User Guide .

      def create_health_check(
        caller_reference : String,
        health_check_config : Types::HealthCheckConfig
      ) : Types::CreateHealthCheckResponse

        input = Types::CreateHealthCheckRequest.new(caller_reference: caller_reference, health_check_config: health_check_config)
        create_health_check(input)
      end

      def create_health_check(input : Types::CreateHealthCheckRequest) : Types::CreateHealthCheckResponse
        request = Protocol::RestXml.build_request(Model::CREATE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateHealthCheckResponse, "CreateHealthCheck")
      end

      # Creates a new public or private hosted zone. You create records in a public hosted zone to define
      # how you want to route traffic on the internet for a domain, such as example.com, and its subdomains
      # (apex.example.com, acme.example.com). You create records in a private hosted zone to define how you
      # want to route traffic for a domain and its subdomains within one or more Amazon Virtual Private
      # Clouds (Amazon VPCs). You can't convert a public hosted zone to a private hosted zone or vice versa.
      # Instead, you must create a new hosted zone with the same name and create new resource record sets.
      # For more information about charges for hosted zones, see Amazon Route 53 Pricing . Note the
      # following: You can't create a hosted zone for a top-level domain (TLD) such as .com. For public
      # hosted zones, Route 53 automatically creates a default SOA record and four NS records for the zone.
      # For more information about SOA and NS records, see NS and SOA Records that Route 53 Creates for a
      # Hosted Zone in the Amazon Route 53 Developer Guide . If you want to use the same name servers for
      # multiple public hosted zones, you can optionally associate a reusable delegation set with the hosted
      # zone. See the DelegationSetId element. If your domain is registered with a registrar other than
      # Route 53, you must update the name servers with your registrar to make Route 53 the DNS service for
      # the domain. For more information, see Migrating DNS Service for an Existing Domain to Amazon Route
      # 53 in the Amazon Route 53 Developer Guide . When you submit a CreateHostedZone request, the initial
      # status of the hosted zone is PENDING . For public hosted zones, this means that the NS and SOA
      # records are not yet available on all Route 53 DNS servers. When the NS and SOA records are
      # available, the status of the zone changes to INSYNC . The CreateHostedZone request requires the
      # caller to have an ec2:DescribeVpcs permission. When creating private hosted zones, the Amazon VPC
      # must belong to the same partition where the hosted zone is created. A partition is a group of Amazon
      # Web Services Regions. Each Amazon Web Services account is scoped to one partition. The following are
      # the supported partitions: aws - Amazon Web Services Regions aws-cn - China Regions aws-us-gov -
      # Amazon Web Services GovCloud (US) Region For more information, see Access Management in the Amazon
      # Web Services General Reference .

      def create_hosted_zone(
        caller_reference : String,
        name : String,
        delegation_set_id : String? = nil,
        hosted_zone_config : Types::HostedZoneConfig? = nil,
        vpc : Types::VPC? = nil
      ) : Types::CreateHostedZoneResponse

        input = Types::CreateHostedZoneRequest.new(caller_reference: caller_reference, name: name, delegation_set_id: delegation_set_id, hosted_zone_config: hosted_zone_config, vpc: vpc)
        create_hosted_zone(input)
      end

      def create_hosted_zone(input : Types::CreateHostedZoneRequest) : Types::CreateHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::CREATE_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateHostedZoneResponse, "CreateHostedZone")
      end

      # Creates a new key-signing key (KSK) associated with a hosted zone. You can only have two KSKs per
      # hosted zone.

      def create_key_signing_key(
        caller_reference : String,
        hosted_zone_id : String,
        key_management_service_arn : String,
        name : String,
        status : String
      ) : Types::CreateKeySigningKeyResponse

        input = Types::CreateKeySigningKeyRequest.new(caller_reference: caller_reference, hosted_zone_id: hosted_zone_id, key_management_service_arn: key_management_service_arn, name: name, status: status)
        create_key_signing_key(input)
      end

      def create_key_signing_key(input : Types::CreateKeySigningKeyRequest) : Types::CreateKeySigningKeyResponse
        request = Protocol::RestXml.build_request(Model::CREATE_KEY_SIGNING_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateKeySigningKeyResponse, "CreateKeySigningKey")
      end

      # Creates a configuration for DNS query logging. After you create a query logging configuration,
      # Amazon Route 53 begins to publish log data to an Amazon CloudWatch Logs log group. DNS query logs
      # contain information about the queries that Route 53 receives for a specified public hosted zone,
      # such as the following: Route 53 edge location that responded to the DNS query Domain or subdomain
      # that was requested DNS record type, such as A or AAAA DNS response code, such as NoError or ServFail
      # Log Group and Resource Policy Before you create a query logging configuration, perform the following
      # operations. If you create a query logging configuration using the Route 53 console, Route 53
      # performs these operations automatically. Create a CloudWatch Logs log group, and make note of the
      # ARN, which you specify when you create a query logging configuration. Note the following: You must
      # create the log group in the us-east-1 region. You must use the same Amazon Web Services account to
      # create the log group and the hosted zone that you want to configure query logging for. When you
      # create log groups for query logging, we recommend that you use a consistent prefix, for example:
      # /aws/route53/ hosted zone name In the next step, you'll create a resource policy, which controls
      # access to one or more log groups and the associated Amazon Web Services resources, such as Route 53
      # hosted zones. There's a limit on the number of resource policies that you can create, so we
      # recommend that you use a consistent prefix so you can use the same resource policy for all the log
      # groups that you create for query logging. Create a CloudWatch Logs resource policy, and give it the
      # permissions that Route 53 needs to create log streams and to send query logs to log streams. You
      # must create the CloudWatch Logs resource policy in the us-east-1 region. For the value of Resource ,
      # specify the ARN for the log group that you created in the previous step. To use the same resource
      # policy for all the CloudWatch Logs log groups that you created for query logging configurations,
      # replace the hosted zone name with * , for example:
      # arn:aws:logs:us-east-1:123412341234:log-group:/aws/route53/* To avoid the confused deputy problem, a
      # security issue where an entity without a permission for an action can coerce a more-privileged
      # entity to perform it, you can optionally limit the permissions that a service has to a resource in a
      # resource-based policy by supplying the following values: For aws:SourceArn , supply the hosted zone
      # ARN used in creating the query logging configuration. For example, aws:SourceArn:
      # arn:aws:route53:::hostedzone/hosted zone ID . For aws:SourceAccount , supply the account ID for the
      # account that creates the query logging configuration. For example, aws:SourceAccount:111111111111 .
      # For more information, see The confused deputy problem in the Amazon Web Services IAM User Guide .
      # You can't use the CloudWatch console to create or edit a resource policy. You must use the
      # CloudWatch API, one of the Amazon Web Services SDKs, or the CLI. Log Streams and Edge Locations When
      # Route 53 finishes creating the configuration for DNS query logging, it does the following: Creates a
      # log stream for an edge location the first time that the edge location responds to DNS queries for
      # the specified hosted zone. That log stream is used to log all queries that Route 53 responds to for
      # that edge location. Begins to send query logs to the applicable log stream. The name of each log
      # stream is in the following format: hosted zone ID / edge location code The edge location code is a
      # three-letter code and an arbitrarily assigned number, for example, DFW3. The three-letter code
      # typically corresponds with the International Air Transport Association airport code for an airport
      # near the edge location. (These abbreviations might change in the future.) For a list of edge
      # locations, see "The Route 53 Global Network" on the Route 53 Product Details page. Queries That Are
      # Logged Query logs contain only the queries that DNS resolvers forward to Route 53. If a DNS resolver
      # has already cached the response to a query (such as the IP address for a load balancer for
      # example.com), the resolver will continue to return the cached response. It doesn't forward another
      # query to Route 53 until the TTL for the corresponding resource record set expires. Depending on how
      # many DNS queries are submitted for a resource record set, and depending on the TTL for that resource
      # record set, query logs might contain information about only one query out of every several thousand
      # queries that are submitted to DNS. For more information about how DNS works, see Routing Internet
      # Traffic to Your Website or Web Application in the Amazon Route 53 Developer Guide . Log File Format
      # For a list of the values in each query log and the format of each value, see Logging DNS Queries in
      # the Amazon Route 53 Developer Guide . Pricing For information about charges for query logs, see
      # Amazon CloudWatch Pricing . How to Stop Logging If you want Route 53 to stop sending query logs to
      # CloudWatch Logs, delete the query logging configuration. For more information, see
      # DeleteQueryLoggingConfig .

      def create_query_logging_config(
        cloud_watch_logs_log_group_arn : String,
        hosted_zone_id : String
      ) : Types::CreateQueryLoggingConfigResponse

        input = Types::CreateQueryLoggingConfigRequest.new(cloud_watch_logs_log_group_arn: cloud_watch_logs_log_group_arn, hosted_zone_id: hosted_zone_id)
        create_query_logging_config(input)
      end

      def create_query_logging_config(input : Types::CreateQueryLoggingConfigRequest) : Types::CreateQueryLoggingConfigResponse
        request = Protocol::RestXml.build_request(Model::CREATE_QUERY_LOGGING_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateQueryLoggingConfigResponse, "CreateQueryLoggingConfig")
      end

      # Creates a delegation set (a group of four name servers) that can be reused by multiple hosted zones
      # that were created by the same Amazon Web Services account. You can also create a reusable delegation
      # set that uses the four name servers that are associated with an existing hosted zone. Specify the
      # hosted zone ID in the CreateReusableDelegationSet request. You can't associate a reusable delegation
      # set with a private hosted zone. For information about using a reusable delegation set to configure
      # white label name servers, see Configuring White Label Name Servers . The process for migrating
      # existing hosted zones to use a reusable delegation set is comparable to the process for configuring
      # white label name servers. You need to perform the following steps: Create a reusable delegation set.
      # Recreate hosted zones, and reduce the TTL to 60 seconds or less. Recreate resource record sets in
      # the new hosted zones. Change the registrar's name servers to use the name servers for the new hosted
      # zones. Monitor traffic for the website or application. Change TTLs back to their original values. If
      # you want to migrate existing hosted zones to use a reusable delegation set, the existing hosted
      # zones can't use any of the name servers that are assigned to the reusable delegation set. If one or
      # more hosted zones do use one or more name servers that are assigned to the reusable delegation set,
      # you can do one of the following: For small numbers of hosted zones—up to a few hundred—it's
      # relatively easy to create reusable delegation sets until you get one that has four name servers that
      # don't overlap with any of the name servers in your hosted zones. For larger numbers of hosted zones,
      # the easiest solution is to use more than one reusable delegation set. For larger numbers of hosted
      # zones, you can also migrate hosted zones that have overlapping name servers to hosted zones that
      # don't have overlapping name servers, then migrate the hosted zones again to use the reusable
      # delegation set.

      def create_reusable_delegation_set(
        caller_reference : String,
        hosted_zone_id : String? = nil
      ) : Types::CreateReusableDelegationSetResponse

        input = Types::CreateReusableDelegationSetRequest.new(caller_reference: caller_reference, hosted_zone_id: hosted_zone_id)
        create_reusable_delegation_set(input)
      end

      def create_reusable_delegation_set(input : Types::CreateReusableDelegationSetRequest) : Types::CreateReusableDelegationSetResponse
        request = Protocol::RestXml.build_request(Model::CREATE_REUSABLE_DELEGATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateReusableDelegationSetResponse, "CreateReusableDelegationSet")
      end

      # Creates a traffic policy, which you use to create multiple DNS resource record sets for one domain
      # name (such as example.com) or one subdomain name (such as www.example.com).

      def create_traffic_policy(
        document : String,
        name : String,
        comment : String? = nil
      ) : Types::CreateTrafficPolicyResponse

        input = Types::CreateTrafficPolicyRequest.new(document: document, name: name, comment: comment)
        create_traffic_policy(input)
      end

      def create_traffic_policy(input : Types::CreateTrafficPolicyRequest) : Types::CreateTrafficPolicyResponse
        request = Protocol::RestXml.build_request(Model::CREATE_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateTrafficPolicyResponse, "CreateTrafficPolicy")
      end

      # Creates resource record sets in a specified hosted zone based on the settings in a specified traffic
      # policy version. In addition, CreateTrafficPolicyInstance associates the resource record sets with a
      # specified domain name (such as example.com) or subdomain name (such as www.example.com). Amazon
      # Route 53 responds to DNS queries for the domain or subdomain name by using the resource record sets
      # that CreateTrafficPolicyInstance created. After you submit an CreateTrafficPolicyInstance request,
      # there's a brief delay while Amazon Route 53 creates the resource record sets that are specified in
      # the traffic policy definition. Use GetTrafficPolicyInstance with the id of new traffic policy
      # instance to confirm that the CreateTrafficPolicyInstance request completed successfully. For more
      # information, see the State response element.

      def create_traffic_policy_instance(
        hosted_zone_id : String,
        name : String,
        ttl : Int64,
        traffic_policy_id : String,
        traffic_policy_version : Int32
      ) : Types::CreateTrafficPolicyInstanceResponse

        input = Types::CreateTrafficPolicyInstanceRequest.new(hosted_zone_id: hosted_zone_id, name: name, ttl: ttl, traffic_policy_id: traffic_policy_id, traffic_policy_version: traffic_policy_version)
        create_traffic_policy_instance(input)
      end

      def create_traffic_policy_instance(input : Types::CreateTrafficPolicyInstanceRequest) : Types::CreateTrafficPolicyInstanceResponse
        request = Protocol::RestXml.build_request(Model::CREATE_TRAFFIC_POLICY_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateTrafficPolicyInstanceResponse, "CreateTrafficPolicyInstance")
      end

      # Creates a new version of an existing traffic policy. When you create a new version of a traffic
      # policy, you specify the ID of the traffic policy that you want to update and a JSON-formatted
      # document that describes the new version. You use traffic policies to create multiple DNS resource
      # record sets for one domain name (such as example.com) or one subdomain name (such as
      # www.example.com). You can create a maximum of 1000 versions of a traffic policy. If you reach the
      # limit and need to create another version, you'll need to start a new traffic policy.

      def create_traffic_policy_version(
        document : String,
        id : String,
        comment : String? = nil
      ) : Types::CreateTrafficPolicyVersionResponse

        input = Types::CreateTrafficPolicyVersionRequest.new(document: document, id: id, comment: comment)
        create_traffic_policy_version(input)
      end

      def create_traffic_policy_version(input : Types::CreateTrafficPolicyVersionRequest) : Types::CreateTrafficPolicyVersionResponse
        request = Protocol::RestXml.build_request(Model::CREATE_TRAFFIC_POLICY_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateTrafficPolicyVersionResponse, "CreateTrafficPolicyVersion")
      end

      # Authorizes the Amazon Web Services account that created a specified VPC to submit an
      # AssociateVPCWithHostedZone request to associate the VPC with a specified hosted zone that was
      # created by a different account. To submit a CreateVPCAssociationAuthorization request, you must use
      # the account that created the hosted zone. After you authorize the association, use the account that
      # created the VPC to submit an AssociateVPCWithHostedZone request. If you want to associate multiple
      # VPCs that you created by using one account with a hosted zone that you created by using a different
      # account, you must submit one authorization request for each VPC.

      def create_vpc_association_authorization(
        hosted_zone_id : String,
        vpc : Types::VPC
      ) : Types::CreateVPCAssociationAuthorizationResponse

        input = Types::CreateVPCAssociationAuthorizationRequest.new(hosted_zone_id: hosted_zone_id, vpc: vpc)
        create_vpc_association_authorization(input)
      end

      def create_vpc_association_authorization(input : Types::CreateVPCAssociationAuthorizationRequest) : Types::CreateVPCAssociationAuthorizationResponse
        request = Protocol::RestXml.build_request(Model::CREATE_VPC_ASSOCIATION_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::CreateVPCAssociationAuthorizationResponse, "CreateVPCAssociationAuthorization")
      end

      # Deactivates a key-signing key (KSK) so that it will not be used for signing by DNSSEC. This
      # operation changes the KSK status to INACTIVE .

      def deactivate_key_signing_key(
        hosted_zone_id : String,
        name : String
      ) : Types::DeactivateKeySigningKeyResponse

        input = Types::DeactivateKeySigningKeyRequest.new(hosted_zone_id: hosted_zone_id, name: name)
        deactivate_key_signing_key(input)
      end

      def deactivate_key_signing_key(input : Types::DeactivateKeySigningKeyRequest) : Types::DeactivateKeySigningKeyResponse
        request = Protocol::RestXml.build_request(Model::DEACTIVATE_KEY_SIGNING_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeactivateKeySigningKeyResponse, "DeactivateKeySigningKey")
      end

      # Deletes a CIDR collection in the current Amazon Web Services account. The collection must be empty
      # before it can be deleted.

      def delete_cidr_collection(
        id : String
      ) : Types::DeleteCidrCollectionResponse

        input = Types::DeleteCidrCollectionRequest.new(id: id)
        delete_cidr_collection(input)
      end

      def delete_cidr_collection(input : Types::DeleteCidrCollectionRequest) : Types::DeleteCidrCollectionResponse
        request = Protocol::RestXml.build_request(Model::DELETE_CIDR_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteCidrCollectionResponse, "DeleteCidrCollection")
      end

      # Deletes a health check. Amazon Route 53 does not prevent you from deleting a health check even if
      # the health check is associated with one or more resource record sets. If you delete a health check
      # and you don't update the associated resource record sets, the future status of the health check
      # can't be predicted and may change. This will affect the routing of DNS queries for your DNS failover
      # configuration. For more information, see Replacing and Deleting Health Checks in the Amazon Route 53
      # Developer Guide . If you're using Cloud Map and you configured Cloud Map to create a Route 53 health
      # check when you register an instance, you can't use the Route 53 DeleteHealthCheck command to delete
      # the health check. The health check is deleted automatically when you deregister the instance; there
      # can be a delay of several hours before the health check is deleted from Route 53.

      def delete_health_check(
        health_check_id : String
      ) : Types::DeleteHealthCheckResponse

        input = Types::DeleteHealthCheckRequest.new(health_check_id: health_check_id)
        delete_health_check(input)
      end

      def delete_health_check(input : Types::DeleteHealthCheckRequest) : Types::DeleteHealthCheckResponse
        request = Protocol::RestXml.build_request(Model::DELETE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteHealthCheckResponse, "DeleteHealthCheck")
      end

      # Deletes a hosted zone. If the hosted zone was created by another service, such as Cloud Map, see
      # Deleting Public Hosted Zones That Were Created by Another Service in the Amazon Route 53 Developer
      # Guide for information about how to delete it. (The process is the same for public and private hosted
      # zones that were created by another service.) If you want to keep your domain registration but you
      # want to stop routing internet traffic to your website or web application, we recommend that you
      # delete resource record sets in the hosted zone instead of deleting the hosted zone. If you delete a
      # hosted zone, you can't undelete it. You must create a new hosted zone and update the name servers
      # for your domain registration, which can require up to 48 hours to take effect. (If you delegated
      # responsibility for a subdomain to a hosted zone and you delete the child hosted zone, you must
      # update the name servers in the parent hosted zone.) In addition, if you delete a hosted zone,
      # someone could hijack the domain and route traffic to their own resources using your domain name. If
      # you want to avoid the monthly charge for the hosted zone, you can transfer DNS service for the
      # domain to a free DNS service. When you transfer DNS service, you have to update the name servers for
      # the domain registration. If the domain is registered with Route 53, see UpdateDomainNameservers for
      # information about how to replace Route 53 name servers with name servers for the new DNS service. If
      # the domain is registered with another registrar, use the method provided by the registrar to update
      # name servers for the domain registration. For more information, perform an internet search on "free
      # DNS service." You can delete a hosted zone only if it contains only the default SOA and NS records
      # and has DNSSEC signing disabled. If the hosted zone contains other records or has DNSSEC enabled,
      # you must delete the records and disable DNSSEC before deletion. Attempting to delete a hosted zone
      # with additional records or DNSSEC enabled returns a HostedZoneNotEmpty error. For information about
      # deleting records, see ChangeResourceRecordSets . To verify that the hosted zone has been deleted, do
      # one of the following: Use the GetHostedZone action to request information about the hosted zone. Use
      # the ListHostedZones action to get a list of the hosted zones associated with the current Amazon Web
      # Services account.

      def delete_hosted_zone(
        id : String
      ) : Types::DeleteHostedZoneResponse

        input = Types::DeleteHostedZoneRequest.new(id: id)
        delete_hosted_zone(input)
      end

      def delete_hosted_zone(input : Types::DeleteHostedZoneRequest) : Types::DeleteHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::DELETE_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteHostedZoneResponse, "DeleteHostedZone")
      end

      # Deletes a key-signing key (KSK). Before you can delete a KSK, you must deactivate it. The KSK must
      # be deactivated before you can delete it regardless of whether the hosted zone is enabled for DNSSEC
      # signing. You can use DeactivateKeySigningKey to deactivate the key before you delete it. Use
      # GetDNSSEC to verify that the KSK is in an INACTIVE status.

      def delete_key_signing_key(
        hosted_zone_id : String,
        name : String
      ) : Types::DeleteKeySigningKeyResponse

        input = Types::DeleteKeySigningKeyRequest.new(hosted_zone_id: hosted_zone_id, name: name)
        delete_key_signing_key(input)
      end

      def delete_key_signing_key(input : Types::DeleteKeySigningKeyRequest) : Types::DeleteKeySigningKeyResponse
        request = Protocol::RestXml.build_request(Model::DELETE_KEY_SIGNING_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteKeySigningKeyResponse, "DeleteKeySigningKey")
      end

      # Deletes a configuration for DNS query logging. If you delete a configuration, Amazon Route 53 stops
      # sending query logs to CloudWatch Logs. Route 53 doesn't delete any logs that are already in
      # CloudWatch Logs. For more information about DNS query logs, see CreateQueryLoggingConfig .

      def delete_query_logging_config(
        id : String
      ) : Types::DeleteQueryLoggingConfigResponse

        input = Types::DeleteQueryLoggingConfigRequest.new(id: id)
        delete_query_logging_config(input)
      end

      def delete_query_logging_config(input : Types::DeleteQueryLoggingConfigRequest) : Types::DeleteQueryLoggingConfigResponse
        request = Protocol::RestXml.build_request(Model::DELETE_QUERY_LOGGING_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteQueryLoggingConfigResponse, "DeleteQueryLoggingConfig")
      end

      # Deletes a reusable delegation set. You can delete a reusable delegation set only if it isn't
      # associated with any hosted zones. To verify that the reusable delegation set is not associated with
      # any hosted zones, submit a GetReusableDelegationSet request and specify the ID of the reusable
      # delegation set that you want to delete.

      def delete_reusable_delegation_set(
        id : String
      ) : Types::DeleteReusableDelegationSetResponse

        input = Types::DeleteReusableDelegationSetRequest.new(id: id)
        delete_reusable_delegation_set(input)
      end

      def delete_reusable_delegation_set(input : Types::DeleteReusableDelegationSetRequest) : Types::DeleteReusableDelegationSetResponse
        request = Protocol::RestXml.build_request(Model::DELETE_REUSABLE_DELEGATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteReusableDelegationSetResponse, "DeleteReusableDelegationSet")
      end

      # Deletes a traffic policy. When you delete a traffic policy, Route 53 sets a flag on the policy to
      # indicate that it has been deleted. However, Route 53 never fully deletes the traffic policy. Note
      # the following: Deleted traffic policies aren't listed if you run ListTrafficPolicies . There's no
      # way to get a list of deleted policies. If you retain the ID of the policy, you can get information
      # about the policy, including the traffic policy document, by running GetTrafficPolicy .

      def delete_traffic_policy(
        id : String,
        version : Int32
      ) : Types::DeleteTrafficPolicyResponse

        input = Types::DeleteTrafficPolicyRequest.new(id: id, version: version)
        delete_traffic_policy(input)
      end

      def delete_traffic_policy(input : Types::DeleteTrafficPolicyRequest) : Types::DeleteTrafficPolicyResponse
        request = Protocol::RestXml.build_request(Model::DELETE_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteTrafficPolicyResponse, "DeleteTrafficPolicy")
      end

      # Deletes a traffic policy instance and all of the resource record sets that Amazon Route 53 created
      # when you created the instance. In the Route 53 console, traffic policy instances are known as policy
      # records.

      def delete_traffic_policy_instance(
        id : String
      ) : Types::DeleteTrafficPolicyInstanceResponse

        input = Types::DeleteTrafficPolicyInstanceRequest.new(id: id)
        delete_traffic_policy_instance(input)
      end

      def delete_traffic_policy_instance(input : Types::DeleteTrafficPolicyInstanceRequest) : Types::DeleteTrafficPolicyInstanceResponse
        request = Protocol::RestXml.build_request(Model::DELETE_TRAFFIC_POLICY_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteTrafficPolicyInstanceResponse, "DeleteTrafficPolicyInstance")
      end

      # Removes authorization to submit an AssociateVPCWithHostedZone request to associate a specified VPC
      # with a hosted zone that was created by a different account. You must use the account that created
      # the hosted zone to submit a DeleteVPCAssociationAuthorization request. Sending this request only
      # prevents the Amazon Web Services account that created the VPC from associating the VPC with the
      # Amazon Route 53 hosted zone in the future. If the VPC is already associated with the hosted zone,
      # DeleteVPCAssociationAuthorization won't disassociate the VPC from the hosted zone. If you want to
      # delete an existing association, use DisassociateVPCFromHostedZone .

      def delete_vpc_association_authorization(
        hosted_zone_id : String,
        vpc : Types::VPC
      ) : Types::DeleteVPCAssociationAuthorizationResponse

        input = Types::DeleteVPCAssociationAuthorizationRequest.new(hosted_zone_id: hosted_zone_id, vpc: vpc)
        delete_vpc_association_authorization(input)
      end

      def delete_vpc_association_authorization(input : Types::DeleteVPCAssociationAuthorizationRequest) : Types::DeleteVPCAssociationAuthorizationResponse
        request = Protocol::RestXml.build_request(Model::DELETE_VPC_ASSOCIATION_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DeleteVPCAssociationAuthorizationResponse, "DeleteVPCAssociationAuthorization")
      end

      # Disables DNSSEC signing in a specific hosted zone. This action does not deactivate any key-signing
      # keys (KSKs) that are active in the hosted zone.

      def disable_hosted_zone_dnssec(
        hosted_zone_id : String
      ) : Types::DisableHostedZoneDNSSECResponse

        input = Types::DisableHostedZoneDNSSECRequest.new(hosted_zone_id: hosted_zone_id)
        disable_hosted_zone_dnssec(input)
      end

      def disable_hosted_zone_dnssec(input : Types::DisableHostedZoneDNSSECRequest) : Types::DisableHostedZoneDNSSECResponse
        request = Protocol::RestXml.build_request(Model::DISABLE_HOSTED_ZONE_DNSSEC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DisableHostedZoneDNSSECResponse, "DisableHostedZoneDNSSEC")
      end

      # Disassociates an Amazon Virtual Private Cloud (Amazon VPC) from an Amazon Route 53 private hosted
      # zone. Note the following: You can't disassociate the last Amazon VPC from a private hosted zone. You
      # can't convert a private hosted zone into a public hosted zone. You can submit a
      # DisassociateVPCFromHostedZone request using either the account that created the hosted zone or the
      # account that created the Amazon VPC. Some services, such as Cloud Map and Amazon Elastic File System
      # (Amazon EFS) automatically create hosted zones and associate VPCs with the hosted zones. A service
      # can create a hosted zone using your account or using its own account. You can disassociate a VPC
      # from a hosted zone only if the service created the hosted zone using your account. When you run
      # DisassociateVPCFromHostedZone , if the hosted zone has a value for OwningAccount , you can use
      # DisassociateVPCFromHostedZone . If the hosted zone has a value for OwningService , you can't use
      # DisassociateVPCFromHostedZone . When revoking access, the hosted zone and the Amazon VPC must belong
      # to the same partition. A partition is a group of Amazon Web Services Regions. Each Amazon Web
      # Services account is scoped to one partition. The following are the supported partitions: aws -
      # Amazon Web Services Regions aws-cn - China Regions aws-us-gov - Amazon Web Services GovCloud (US)
      # Region For more information, see Access Management in the Amazon Web Services General Reference .

      def disassociate_vpc_from_hosted_zone(
        hosted_zone_id : String,
        vpc : Types::VPC,
        comment : String? = nil
      ) : Types::DisassociateVPCFromHostedZoneResponse

        input = Types::DisassociateVPCFromHostedZoneRequest.new(hosted_zone_id: hosted_zone_id, vpc: vpc, comment: comment)
        disassociate_vpc_from_hosted_zone(input)
      end

      def disassociate_vpc_from_hosted_zone(input : Types::DisassociateVPCFromHostedZoneRequest) : Types::DisassociateVPCFromHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::DISASSOCIATE_VPC_FROM_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::DisassociateVPCFromHostedZoneResponse, "DisassociateVPCFromHostedZone")
      end

      # Enables DNSSEC signing in a specific hosted zone.

      def enable_hosted_zone_dnssec(
        hosted_zone_id : String
      ) : Types::EnableHostedZoneDNSSECResponse

        input = Types::EnableHostedZoneDNSSECRequest.new(hosted_zone_id: hosted_zone_id)
        enable_hosted_zone_dnssec(input)
      end

      def enable_hosted_zone_dnssec(input : Types::EnableHostedZoneDNSSECRequest) : Types::EnableHostedZoneDNSSECResponse
        request = Protocol::RestXml.build_request(Model::ENABLE_HOSTED_ZONE_DNSSEC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::EnableHostedZoneDNSSECResponse, "EnableHostedZoneDNSSEC")
      end

      # Gets the specified limit for the current account, for example, the maximum number of health checks
      # that you can create using the account. For the default limit, see Limits in the Amazon Route 53
      # Developer Guide . To request a higher limit, open a case . You can also view account limits in
      # Amazon Web Services Trusted Advisor. Sign in to the Amazon Web Services Management Console and open
      # the Trusted Advisor console at https://console.aws.amazon.com/trustedadvisor/ . Then choose Service
      # limits in the navigation pane.

      def get_account_limit(
        type : String
      ) : Types::GetAccountLimitResponse

        input = Types::GetAccountLimitRequest.new(type: type)
        get_account_limit(input)
      end

      def get_account_limit(input : Types::GetAccountLimitRequest) : Types::GetAccountLimitResponse
        request = Protocol::RestXml.build_request(Model::GET_ACCOUNT_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetAccountLimitResponse, "GetAccountLimit")
      end

      # Returns the current status of a change batch request. The status is one of the following values:
      # PENDING indicates that the changes in this request have not propagated to all Amazon Route 53 DNS
      # servers managing the hosted zone. This is the initial status of all change batch requests. INSYNC
      # indicates that the changes have propagated to all Route 53 DNS servers managing the hosted zone.

      def get_change(
        id : String
      ) : Types::GetChangeResponse

        input = Types::GetChangeRequest.new(id: id)
        get_change(input)
      end

      def get_change(input : Types::GetChangeRequest) : Types::GetChangeResponse
        request = Protocol::RestXml.build_request(Model::GET_CHANGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetChangeResponse, "GetChange")
      end

      # Route 53 does not perform authorization for this API because it retrieves information that is
      # already available to the public. GetCheckerIpRanges still works, but we recommend that you download
      # ip-ranges.json, which includes IP address ranges for all Amazon Web Services services. For more
      # information, see IP Address Ranges of Amazon Route 53 Servers in the Amazon Route 53 Developer Guide
      # .

      def get_checker_ip_ranges : Types::GetCheckerIpRangesResponse
        input = Types::GetCheckerIpRangesRequest.new
        get_checker_ip_ranges(input)
      end

      def get_checker_ip_ranges(input : Types::GetCheckerIpRangesRequest) : Types::GetCheckerIpRangesResponse
        request = Protocol::RestXml.build_request(Model::GET_CHECKER_IP_RANGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetCheckerIpRangesResponse, "GetCheckerIpRanges")
      end

      # Returns information about DNSSEC for a specific hosted zone, including the key-signing keys (KSKs)
      # in the hosted zone.

      def get_dnssec(
        hosted_zone_id : String
      ) : Types::GetDNSSECResponse

        input = Types::GetDNSSECRequest.new(hosted_zone_id: hosted_zone_id)
        get_dnssec(input)
      end

      def get_dnssec(input : Types::GetDNSSECRequest) : Types::GetDNSSECResponse
        request = Protocol::RestXml.build_request(Model::GET_DNSSEC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetDNSSECResponse, "GetDNSSEC")
      end

      # Gets information about whether a specified geographic location is supported for Amazon Route 53
      # geolocation resource record sets. Route 53 does not perform authorization for this API because it
      # retrieves information that is already available to the public. Use the following syntax to determine
      # whether a continent is supported for geolocation: GET /2013-04-01/geolocation?continentcode=
      # two-letter abbreviation for a continent Use the following syntax to determine whether a country is
      # supported for geolocation: GET /2013-04-01/geolocation?countrycode= two-character country code Use
      # the following syntax to determine whether a subdivision of a country is supported for geolocation:
      # GET /2013-04-01/geolocation?countrycode= two-character country code &amp;subdivisioncode=
      # subdivision code

      def get_geo_location(
        continent_code : String? = nil,
        country_code : String? = nil,
        subdivision_code : String? = nil
      ) : Types::GetGeoLocationResponse

        input = Types::GetGeoLocationRequest.new(continent_code: continent_code, country_code: country_code, subdivision_code: subdivision_code)
        get_geo_location(input)
      end

      def get_geo_location(input : Types::GetGeoLocationRequest) : Types::GetGeoLocationResponse
        request = Protocol::RestXml.build_request(Model::GET_GEO_LOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetGeoLocationResponse, "GetGeoLocation")
      end

      # Gets information about a specified health check.

      def get_health_check(
        health_check_id : String
      ) : Types::GetHealthCheckResponse

        input = Types::GetHealthCheckRequest.new(health_check_id: health_check_id)
        get_health_check(input)
      end

      def get_health_check(input : Types::GetHealthCheckRequest) : Types::GetHealthCheckResponse
        request = Protocol::RestXml.build_request(Model::GET_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHealthCheckResponse, "GetHealthCheck")
      end

      # Retrieves the number of health checks that are associated with the current Amazon Web Services
      # account.

      def get_health_check_count : Types::GetHealthCheckCountResponse
        input = Types::GetHealthCheckCountRequest.new
        get_health_check_count(input)
      end

      def get_health_check_count(input : Types::GetHealthCheckCountRequest) : Types::GetHealthCheckCountResponse
        request = Protocol::RestXml.build_request(Model::GET_HEALTH_CHECK_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHealthCheckCountResponse, "GetHealthCheckCount")
      end

      # Gets the reason that a specified health check failed most recently.

      def get_health_check_last_failure_reason(
        health_check_id : String
      ) : Types::GetHealthCheckLastFailureReasonResponse

        input = Types::GetHealthCheckLastFailureReasonRequest.new(health_check_id: health_check_id)
        get_health_check_last_failure_reason(input)
      end

      def get_health_check_last_failure_reason(input : Types::GetHealthCheckLastFailureReasonRequest) : Types::GetHealthCheckLastFailureReasonResponse
        request = Protocol::RestXml.build_request(Model::GET_HEALTH_CHECK_LAST_FAILURE_REASON, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHealthCheckLastFailureReasonResponse, "GetHealthCheckLastFailureReason")
      end

      # Gets status of a specified health check. This API is intended for use during development to diagnose
      # behavior. It doesn’t support production use-cases with high query rates that require immediate and
      # actionable responses.

      def get_health_check_status(
        health_check_id : String
      ) : Types::GetHealthCheckStatusResponse

        input = Types::GetHealthCheckStatusRequest.new(health_check_id: health_check_id)
        get_health_check_status(input)
      end

      def get_health_check_status(input : Types::GetHealthCheckStatusRequest) : Types::GetHealthCheckStatusResponse
        request = Protocol::RestXml.build_request(Model::GET_HEALTH_CHECK_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHealthCheckStatusResponse, "GetHealthCheckStatus")
      end

      # Gets information about a specified hosted zone including the four name servers assigned to the
      # hosted zone. returns the VPCs associated with the specified hosted zone and does not reflect the VPC
      # associations by Route 53 Profiles. To get the associations to a Profile, call the
      # ListProfileAssociations API.

      def get_hosted_zone(
        id : String
      ) : Types::GetHostedZoneResponse

        input = Types::GetHostedZoneRequest.new(id: id)
        get_hosted_zone(input)
      end

      def get_hosted_zone(input : Types::GetHostedZoneRequest) : Types::GetHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::GET_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHostedZoneResponse, "GetHostedZone")
      end

      # Retrieves the number of hosted zones that are associated with the current Amazon Web Services
      # account.

      def get_hosted_zone_count : Types::GetHostedZoneCountResponse
        input = Types::GetHostedZoneCountRequest.new
        get_hosted_zone_count(input)
      end

      def get_hosted_zone_count(input : Types::GetHostedZoneCountRequest) : Types::GetHostedZoneCountResponse
        request = Protocol::RestXml.build_request(Model::GET_HOSTED_ZONE_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHostedZoneCountResponse, "GetHostedZoneCount")
      end

      # Gets the specified limit for a specified hosted zone, for example, the maximum number of records
      # that you can create in the hosted zone. For the default limit, see Limits in the Amazon Route 53
      # Developer Guide . To request a higher limit, open a case .

      def get_hosted_zone_limit(
        hosted_zone_id : String,
        type : String
      ) : Types::GetHostedZoneLimitResponse

        input = Types::GetHostedZoneLimitRequest.new(hosted_zone_id: hosted_zone_id, type: type)
        get_hosted_zone_limit(input)
      end

      def get_hosted_zone_limit(input : Types::GetHostedZoneLimitRequest) : Types::GetHostedZoneLimitResponse
        request = Protocol::RestXml.build_request(Model::GET_HOSTED_ZONE_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetHostedZoneLimitResponse, "GetHostedZoneLimit")
      end

      # Gets information about a specified configuration for DNS query logging. For more information about
      # DNS query logs, see CreateQueryLoggingConfig and Logging DNS Queries .

      def get_query_logging_config(
        id : String
      ) : Types::GetQueryLoggingConfigResponse

        input = Types::GetQueryLoggingConfigRequest.new(id: id)
        get_query_logging_config(input)
      end

      def get_query_logging_config(input : Types::GetQueryLoggingConfigRequest) : Types::GetQueryLoggingConfigResponse
        request = Protocol::RestXml.build_request(Model::GET_QUERY_LOGGING_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetQueryLoggingConfigResponse, "GetQueryLoggingConfig")
      end

      # Retrieves information about a specified reusable delegation set, including the four name servers
      # that are assigned to the delegation set.

      def get_reusable_delegation_set(
        id : String
      ) : Types::GetReusableDelegationSetResponse

        input = Types::GetReusableDelegationSetRequest.new(id: id)
        get_reusable_delegation_set(input)
      end

      def get_reusable_delegation_set(input : Types::GetReusableDelegationSetRequest) : Types::GetReusableDelegationSetResponse
        request = Protocol::RestXml.build_request(Model::GET_REUSABLE_DELEGATION_SET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetReusableDelegationSetResponse, "GetReusableDelegationSet")
      end

      # Gets the maximum number of hosted zones that you can associate with the specified reusable
      # delegation set. For the default limit, see Limits in the Amazon Route 53 Developer Guide . To
      # request a higher limit, open a case .

      def get_reusable_delegation_set_limit(
        delegation_set_id : String,
        type : String
      ) : Types::GetReusableDelegationSetLimitResponse

        input = Types::GetReusableDelegationSetLimitRequest.new(delegation_set_id: delegation_set_id, type: type)
        get_reusable_delegation_set_limit(input)
      end

      def get_reusable_delegation_set_limit(input : Types::GetReusableDelegationSetLimitRequest) : Types::GetReusableDelegationSetLimitResponse
        request = Protocol::RestXml.build_request(Model::GET_REUSABLE_DELEGATION_SET_LIMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetReusableDelegationSetLimitResponse, "GetReusableDelegationSetLimit")
      end

      # Gets information about a specific traffic policy version. For information about how of deleting a
      # traffic policy affects the response from GetTrafficPolicy , see DeleteTrafficPolicy .

      def get_traffic_policy(
        id : String,
        version : Int32
      ) : Types::GetTrafficPolicyResponse

        input = Types::GetTrafficPolicyRequest.new(id: id, version: version)
        get_traffic_policy(input)
      end

      def get_traffic_policy(input : Types::GetTrafficPolicyRequest) : Types::GetTrafficPolicyResponse
        request = Protocol::RestXml.build_request(Model::GET_TRAFFIC_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetTrafficPolicyResponse, "GetTrafficPolicy")
      end

      # Gets information about a specified traffic policy instance. Use GetTrafficPolicyInstance with the id
      # of new traffic policy instance to confirm that the CreateTrafficPolicyInstance or an
      # UpdateTrafficPolicyInstance request completed successfully. For more information, see the State
      # response element. In the Route 53 console, traffic policy instances are known as policy records.

      def get_traffic_policy_instance(
        id : String
      ) : Types::GetTrafficPolicyInstanceResponse

        input = Types::GetTrafficPolicyInstanceRequest.new(id: id)
        get_traffic_policy_instance(input)
      end

      def get_traffic_policy_instance(input : Types::GetTrafficPolicyInstanceRequest) : Types::GetTrafficPolicyInstanceResponse
        request = Protocol::RestXml.build_request(Model::GET_TRAFFIC_POLICY_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetTrafficPolicyInstanceResponse, "GetTrafficPolicyInstance")
      end

      # Gets the number of traffic policy instances that are associated with the current Amazon Web Services
      # account.

      def get_traffic_policy_instance_count : Types::GetTrafficPolicyInstanceCountResponse
        input = Types::GetTrafficPolicyInstanceCountRequest.new
        get_traffic_policy_instance_count(input)
      end

      def get_traffic_policy_instance_count(input : Types::GetTrafficPolicyInstanceCountRequest) : Types::GetTrafficPolicyInstanceCountResponse
        request = Protocol::RestXml.build_request(Model::GET_TRAFFIC_POLICY_INSTANCE_COUNT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::GetTrafficPolicyInstanceCountResponse, "GetTrafficPolicyInstanceCount")
      end

      # Returns a paginated list of location objects and their CIDR blocks.

      def list_cidr_blocks(
        collection_id : String,
        location_name : String? = nil,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Types::ListCidrBlocksResponse

        input = Types::ListCidrBlocksRequest.new(collection_id: collection_id, location_name: location_name, max_results: max_results, next_token: next_token)
        list_cidr_blocks(input)
      end

      def list_cidr_blocks(input : Types::ListCidrBlocksRequest) : Types::ListCidrBlocksResponse
        request = Protocol::RestXml.build_request(Model::LIST_CIDR_BLOCKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCidrBlocksResponse, "ListCidrBlocks")
      end

      # Returns a paginated list of CIDR collections in the Amazon Web Services account (metadata only).

      def list_cidr_collections(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Types::ListCidrCollectionsResponse

        input = Types::ListCidrCollectionsRequest.new(max_results: max_results, next_token: next_token)
        list_cidr_collections(input)
      end

      def list_cidr_collections(input : Types::ListCidrCollectionsRequest) : Types::ListCidrCollectionsResponse
        request = Protocol::RestXml.build_request(Model::LIST_CIDR_COLLECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCidrCollectionsResponse, "ListCidrCollections")
      end

      # Returns a paginated list of CIDR locations for the given collection (metadata only, does not include
      # CIDR blocks).

      def list_cidr_locations(
        collection_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Types::ListCidrLocationsResponse

        input = Types::ListCidrLocationsRequest.new(collection_id: collection_id, max_results: max_results, next_token: next_token)
        list_cidr_locations(input)
      end

      def list_cidr_locations(input : Types::ListCidrLocationsRequest) : Types::ListCidrLocationsResponse
        request = Protocol::RestXml.build_request(Model::LIST_CIDR_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListCidrLocationsResponse, "ListCidrLocations")
      end

      # Retrieves a list of supported geographic locations. Countries are listed first, and continents are
      # listed last. If Amazon Route 53 supports subdivisions for a country (for example, states or
      # provinces), the subdivisions for that country are listed in alphabetical order immediately after the
      # corresponding country. Route 53 does not perform authorization for this API because it retrieves
      # information that is already available to the public. For a list of supported geolocation codes, see
      # the GeoLocation data type.

      def list_geo_locations(
        max_items : String? = nil,
        start_continent_code : String? = nil,
        start_country_code : String? = nil,
        start_subdivision_code : String? = nil
      ) : Types::ListGeoLocationsResponse

        input = Types::ListGeoLocationsRequest.new(max_items: max_items, start_continent_code: start_continent_code, start_country_code: start_country_code, start_subdivision_code: start_subdivision_code)
        list_geo_locations(input)
      end

      def list_geo_locations(input : Types::ListGeoLocationsRequest) : Types::ListGeoLocationsResponse
        request = Protocol::RestXml.build_request(Model::LIST_GEO_LOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListGeoLocationsResponse, "ListGeoLocations")
      end

      # Retrieve a list of the health checks that are associated with the current Amazon Web Services
      # account.

      def list_health_checks(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListHealthChecksResponse

        input = Types::ListHealthChecksRequest.new(marker: marker, max_items: max_items)
        list_health_checks(input)
      end

      def list_health_checks(input : Types::ListHealthChecksRequest) : Types::ListHealthChecksResponse
        request = Protocol::RestXml.build_request(Model::LIST_HEALTH_CHECKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListHealthChecksResponse, "ListHealthChecks")
      end

      # Retrieves a list of the public and private hosted zones that are associated with the current Amazon
      # Web Services account. The response includes a HostedZones child element for each hosted zone. Amazon
      # Route 53 returns a maximum of 100 items in each response. If you have a lot of hosted zones, you can
      # use the maxitems parameter to list them in groups of up to 100.

      def list_hosted_zones(
        delegation_set_id : String? = nil,
        hosted_zone_type : String? = nil,
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListHostedZonesResponse

        input = Types::ListHostedZonesRequest.new(delegation_set_id: delegation_set_id, hosted_zone_type: hosted_zone_type, marker: marker, max_items: max_items)
        list_hosted_zones(input)
      end

      def list_hosted_zones(input : Types::ListHostedZonesRequest) : Types::ListHostedZonesResponse
        request = Protocol::RestXml.build_request(Model::LIST_HOSTED_ZONES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListHostedZonesResponse, "ListHostedZones")
      end

      # Retrieves a list of your hosted zones in lexicographic order. The response includes a HostedZones
      # child element for each hosted zone created by the current Amazon Web Services account.
      # ListHostedZonesByName sorts hosted zones by name with the labels reversed. For example:
      # com.example.www. Note the trailing dot, which can change the sort order in some circumstances. If
      # the domain name includes escape characters or Punycode, ListHostedZonesByName alphabetizes the
      # domain name using the escaped or Punycoded value, which is the format that Amazon Route 53 saves in
      # its database. For example, to create a hosted zone for exämple.com, you specify ex\344mple.com for
      # the domain name. ListHostedZonesByName alphabetizes it as: com.ex\344mple. The labels are reversed
      # and alphabetized using the escaped value. For more information about valid domain name formats,
      # including internationalized domain names, see DNS Domain Name Format in the Amazon Route 53
      # Developer Guide . Route 53 returns up to 100 items in each response. If you have a lot of hosted
      # zones, use the MaxItems parameter to list them in groups of up to 100. The response includes values
      # that help navigate from one group of MaxItems hosted zones to the next: The DNSName and HostedZoneId
      # elements in the response contain the values, if any, specified for the dnsname and hostedzoneid
      # parameters in the request that produced the current response. The MaxItems element in the response
      # contains the value, if any, that you specified for the maxitems parameter in the request that
      # produced the current response. If the value of IsTruncated in the response is true, there are more
      # hosted zones associated with the current Amazon Web Services account. If IsTruncated is false, this
      # response includes the last hosted zone that is associated with the current account. The NextDNSName
      # element and NextHostedZoneId elements are omitted from the response. The NextDNSName and
      # NextHostedZoneId elements in the response contain the domain name and the hosted zone ID of the next
      # hosted zone that is associated with the current Amazon Web Services account. If you want to list
      # more hosted zones, make another call to ListHostedZonesByName , and specify the value of NextDNSName
      # and NextHostedZoneId in the dnsname and hostedzoneid parameters, respectively.

      def list_hosted_zones_by_name(
        dns_name : String? = nil,
        hosted_zone_id : String? = nil,
        max_items : String? = nil
      ) : Types::ListHostedZonesByNameResponse

        input = Types::ListHostedZonesByNameRequest.new(dns_name: dns_name, hosted_zone_id: hosted_zone_id, max_items: max_items)
        list_hosted_zones_by_name(input)
      end

      def list_hosted_zones_by_name(input : Types::ListHostedZonesByNameRequest) : Types::ListHostedZonesByNameResponse
        request = Protocol::RestXml.build_request(Model::LIST_HOSTED_ZONES_BY_NAME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListHostedZonesByNameResponse, "ListHostedZonesByName")
      end

      # Lists all the private hosted zones that a specified VPC is associated with, regardless of which
      # Amazon Web Services account or Amazon Web Services service owns the hosted zones. The
      # HostedZoneOwner structure in the response contains one of the following values: An OwningAccount
      # element, which contains the account number of either the current Amazon Web Services account or
      # another Amazon Web Services account. Some services, such as Cloud Map, create hosted zones using the
      # current account. An OwningService element, which identifies the Amazon Web Services service that
      # created and owns the hosted zone. For example, if a hosted zone was created by Amazon Elastic File
      # System (Amazon EFS), the value of Owner is efs.amazonaws.com . ListHostedZonesByVPC returns the
      # hosted zones associated with the specified VPC and does not reflect the hosted zone associations to
      # VPCs via Route 53 Profiles. To get the associations to a Profile, call the
      # ListProfileResourceAssociations API. When listing private hosted zones, the hosted zone and the
      # Amazon VPC must belong to the same partition where the hosted zones were created. A partition is a
      # group of Amazon Web Services Regions. Each Amazon Web Services account is scoped to one partition.
      # The following are the supported partitions: aws - Amazon Web Services Regions aws-cn - China Regions
      # aws-us-gov - Amazon Web Services GovCloud (US) Region For more information, see Access Management in
      # the Amazon Web Services General Reference .

      def list_hosted_zones_by_vpc(
        vpc_id : String,
        vpc_region : String,
        max_items : String? = nil,
        next_token : String? = nil
      ) : Types::ListHostedZonesByVPCResponse

        input = Types::ListHostedZonesByVPCRequest.new(vpc_id: vpc_id, vpc_region: vpc_region, max_items: max_items, next_token: next_token)
        list_hosted_zones_by_vpc(input)
      end

      def list_hosted_zones_by_vpc(input : Types::ListHostedZonesByVPCRequest) : Types::ListHostedZonesByVPCResponse
        request = Protocol::RestXml.build_request(Model::LIST_HOSTED_ZONES_BY_VPC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListHostedZonesByVPCResponse, "ListHostedZonesByVPC")
      end

      # Lists the configurations for DNS query logging that are associated with the current Amazon Web
      # Services account or the configuration that is associated with a specified hosted zone. For more
      # information about DNS query logs, see CreateQueryLoggingConfig . Additional information, including
      # the format of DNS query logs, appears in Logging DNS Queries in the Amazon Route 53 Developer Guide
      # .

      def list_query_logging_configs(
        hosted_zone_id : String? = nil,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Types::ListQueryLoggingConfigsResponse

        input = Types::ListQueryLoggingConfigsRequest.new(hosted_zone_id: hosted_zone_id, max_results: max_results, next_token: next_token)
        list_query_logging_configs(input)
      end

      def list_query_logging_configs(input : Types::ListQueryLoggingConfigsRequest) : Types::ListQueryLoggingConfigsResponse
        request = Protocol::RestXml.build_request(Model::LIST_QUERY_LOGGING_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListQueryLoggingConfigsResponse, "ListQueryLoggingConfigs")
      end

      # Lists the resource record sets in a specified hosted zone. ListResourceRecordSets returns up to 300
      # resource record sets at a time in ASCII order, beginning at a position specified by the name and
      # type elements. Sort order ListResourceRecordSets sorts results first by DNS name with the labels
      # reversed, for example: com.example.www. Note the trailing dot, which can change the sort order when
      # the record name contains characters that appear before . (decimal 46) in the ASCII table. These
      # characters include the following: ! " # $ % &amp; ' ( ) * + , - When multiple records have the same
      # DNS name, ListResourceRecordSets sorts results by the record type. Specifying where to start listing
      # records You can use the name and type elements to specify the resource record set that the list
      # begins with: If you do not specify Name or Type The results begin with the first resource record set
      # that the hosted zone contains. If you specify Name but not Type The results begin with the first
      # resource record set in the list whose name is greater than or equal to Name . If you specify Type
      # but not Name Amazon Route 53 returns the InvalidInput error. If you specify both Name and Type The
      # results begin with the first resource record set in the list whose name is greater than or equal to
      # Name , and whose type is greater than or equal to Type . Type is only used to sort between records
      # with the same record Name. Resource record sets that are PENDING This action returns the most
      # current version of the records. This includes records that are PENDING , and that are not yet
      # available on all Route 53 DNS servers. Changing resource record sets To ensure that you get an
      # accurate listing of the resource record sets for a hosted zone at a point in time, do not submit a
      # ChangeResourceRecordSets request while you're paging through the results of a ListResourceRecordSets
      # request. If you do, some pages may display results without the latest changes while other pages
      # display results with the latest changes. Displaying the next page of results If a
      # ListResourceRecordSets command returns more than one page of results, the value of IsTruncated is
      # true . To display the next page of results, get the values of NextRecordName , NextRecordType , and
      # NextRecordIdentifier (if any) from the response. Then submit another ListResourceRecordSets request,
      # and specify those values for StartRecordName , StartRecordType , and StartRecordIdentifier .

      def list_resource_record_sets(
        hosted_zone_id : String,
        max_items : String? = nil,
        start_record_identifier : String? = nil,
        start_record_name : String? = nil,
        start_record_type : String? = nil
      ) : Types::ListResourceRecordSetsResponse

        input = Types::ListResourceRecordSetsRequest.new(hosted_zone_id: hosted_zone_id, max_items: max_items, start_record_identifier: start_record_identifier, start_record_name: start_record_name, start_record_type: start_record_type)
        list_resource_record_sets(input)
      end

      def list_resource_record_sets(input : Types::ListResourceRecordSetsRequest) : Types::ListResourceRecordSetsResponse
        request = Protocol::RestXml.build_request(Model::LIST_RESOURCE_RECORD_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListResourceRecordSetsResponse, "ListResourceRecordSets")
      end

      # Retrieves a list of the reusable delegation sets that are associated with the current Amazon Web
      # Services account.

      def list_reusable_delegation_sets(
        marker : String? = nil,
        max_items : String? = nil
      ) : Types::ListReusableDelegationSetsResponse

        input = Types::ListReusableDelegationSetsRequest.new(marker: marker, max_items: max_items)
        list_reusable_delegation_sets(input)
      end

      def list_reusable_delegation_sets(input : Types::ListReusableDelegationSetsRequest) : Types::ListReusableDelegationSetsResponse
        request = Protocol::RestXml.build_request(Model::LIST_REUSABLE_DELEGATION_SETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListReusableDelegationSetsResponse, "ListReusableDelegationSets")
      end

      # Lists tags for one health check or hosted zone. For information about using tags for cost
      # allocation, see Using Cost Allocation Tags in the Billing and Cost Management User Guide .

      def list_tags_for_resource(
        resource_id : String,
        resource_type : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_id: resource_id, resource_type: resource_type)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::RestXml.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Lists tags for up to 10 health checks or hosted zones. For information about using tags for cost
      # allocation, see Using Cost Allocation Tags in the Billing and Cost Management User Guide .

      def list_tags_for_resources(
        resource_ids : Array(String),
        resource_type : String
      ) : Types::ListTagsForResourcesResponse

        input = Types::ListTagsForResourcesRequest.new(resource_ids: resource_ids, resource_type: resource_type)
        list_tags_for_resources(input)
      end

      def list_tags_for_resources(input : Types::ListTagsForResourcesRequest) : Types::ListTagsForResourcesResponse
        request = Protocol::RestXml.build_request(Model::LIST_TAGS_FOR_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTagsForResourcesResponse, "ListTagsForResources")
      end

      # Gets information about the latest version for every traffic policy that is associated with the
      # current Amazon Web Services account. Policies are listed in the order that they were created in. For
      # information about how of deleting a traffic policy affects the response from ListTrafficPolicies ,
      # see DeleteTrafficPolicy .

      def list_traffic_policies(
        max_items : String? = nil,
        traffic_policy_id_marker : String? = nil
      ) : Types::ListTrafficPoliciesResponse

        input = Types::ListTrafficPoliciesRequest.new(max_items: max_items, traffic_policy_id_marker: traffic_policy_id_marker)
        list_traffic_policies(input)
      end

      def list_traffic_policies(input : Types::ListTrafficPoliciesRequest) : Types::ListTrafficPoliciesResponse
        request = Protocol::RestXml.build_request(Model::LIST_TRAFFIC_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrafficPoliciesResponse, "ListTrafficPolicies")
      end

      # Gets information about the traffic policy instances that you created by using the current Amazon Web
      # Services account. After you submit an UpdateTrafficPolicyInstance request, there's a brief delay
      # while Amazon Route 53 creates the resource record sets that are specified in the traffic policy
      # definition. For more information, see the State response element. Route 53 returns a maximum of 100
      # items in each response. If you have a lot of traffic policy instances, you can use the MaxItems
      # parameter to list them in groups of up to 100.

      def list_traffic_policy_instances(
        hosted_zone_id_marker : String? = nil,
        max_items : String? = nil,
        traffic_policy_instance_name_marker : String? = nil,
        traffic_policy_instance_type_marker : String? = nil
      ) : Types::ListTrafficPolicyInstancesResponse

        input = Types::ListTrafficPolicyInstancesRequest.new(hosted_zone_id_marker: hosted_zone_id_marker, max_items: max_items, traffic_policy_instance_name_marker: traffic_policy_instance_name_marker, traffic_policy_instance_type_marker: traffic_policy_instance_type_marker)
        list_traffic_policy_instances(input)
      end

      def list_traffic_policy_instances(input : Types::ListTrafficPolicyInstancesRequest) : Types::ListTrafficPolicyInstancesResponse
        request = Protocol::RestXml.build_request(Model::LIST_TRAFFIC_POLICY_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrafficPolicyInstancesResponse, "ListTrafficPolicyInstances")
      end

      # Gets information about the traffic policy instances that you created in a specified hosted zone.
      # After you submit a CreateTrafficPolicyInstance or an UpdateTrafficPolicyInstance request, there's a
      # brief delay while Amazon Route 53 creates the resource record sets that are specified in the traffic
      # policy definition. For more information, see the State response element. Route 53 returns a maximum
      # of 100 items in each response. If you have a lot of traffic policy instances, you can use the
      # MaxItems parameter to list them in groups of up to 100.

      def list_traffic_policy_instances_by_hosted_zone(
        hosted_zone_id : String,
        max_items : String? = nil,
        traffic_policy_instance_name_marker : String? = nil,
        traffic_policy_instance_type_marker : String? = nil
      ) : Types::ListTrafficPolicyInstancesByHostedZoneResponse

        input = Types::ListTrafficPolicyInstancesByHostedZoneRequest.new(hosted_zone_id: hosted_zone_id, max_items: max_items, traffic_policy_instance_name_marker: traffic_policy_instance_name_marker, traffic_policy_instance_type_marker: traffic_policy_instance_type_marker)
        list_traffic_policy_instances_by_hosted_zone(input)
      end

      def list_traffic_policy_instances_by_hosted_zone(input : Types::ListTrafficPolicyInstancesByHostedZoneRequest) : Types::ListTrafficPolicyInstancesByHostedZoneResponse
        request = Protocol::RestXml.build_request(Model::LIST_TRAFFIC_POLICY_INSTANCES_BY_HOSTED_ZONE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrafficPolicyInstancesByHostedZoneResponse, "ListTrafficPolicyInstancesByHostedZone")
      end

      # Gets information about the traffic policy instances that you created by using a specify traffic
      # policy version. After you submit a CreateTrafficPolicyInstance or an UpdateTrafficPolicyInstance
      # request, there's a brief delay while Amazon Route 53 creates the resource record sets that are
      # specified in the traffic policy definition. For more information, see the State response element.
      # Route 53 returns a maximum of 100 items in each response. If you have a lot of traffic policy
      # instances, you can use the MaxItems parameter to list them in groups of up to 100.

      def list_traffic_policy_instances_by_policy(
        traffic_policy_id : String,
        traffic_policy_version : Int32,
        hosted_zone_id_marker : String? = nil,
        max_items : String? = nil,
        traffic_policy_instance_name_marker : String? = nil,
        traffic_policy_instance_type_marker : String? = nil
      ) : Types::ListTrafficPolicyInstancesByPolicyResponse

        input = Types::ListTrafficPolicyInstancesByPolicyRequest.new(traffic_policy_id: traffic_policy_id, traffic_policy_version: traffic_policy_version, hosted_zone_id_marker: hosted_zone_id_marker, max_items: max_items, traffic_policy_instance_name_marker: traffic_policy_instance_name_marker, traffic_policy_instance_type_marker: traffic_policy_instance_type_marker)
        list_traffic_policy_instances_by_policy(input)
      end

      def list_traffic_policy_instances_by_policy(input : Types::ListTrafficPolicyInstancesByPolicyRequest) : Types::ListTrafficPolicyInstancesByPolicyResponse
        request = Protocol::RestXml.build_request(Model::LIST_TRAFFIC_POLICY_INSTANCES_BY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrafficPolicyInstancesByPolicyResponse, "ListTrafficPolicyInstancesByPolicy")
      end

      # Gets information about all of the versions for a specified traffic policy. Traffic policy versions
      # are listed in numerical order by VersionNumber .

      def list_traffic_policy_versions(
        id : String,
        max_items : String? = nil,
        traffic_policy_version_marker : String? = nil
      ) : Types::ListTrafficPolicyVersionsResponse

        input = Types::ListTrafficPolicyVersionsRequest.new(id: id, max_items: max_items, traffic_policy_version_marker: traffic_policy_version_marker)
        list_traffic_policy_versions(input)
      end

      def list_traffic_policy_versions(input : Types::ListTrafficPolicyVersionsRequest) : Types::ListTrafficPolicyVersionsResponse
        request = Protocol::RestXml.build_request(Model::LIST_TRAFFIC_POLICY_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListTrafficPolicyVersionsResponse, "ListTrafficPolicyVersions")
      end

      # Gets a list of the VPCs that were created by other accounts and that can be associated with a
      # specified hosted zone because you've submitted one or more CreateVPCAssociationAuthorization
      # requests. The response includes a VPCs element with a VPC child element for each VPC that can be
      # associated with the hosted zone.

      def list_vpc_association_authorizations(
        hosted_zone_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Types::ListVPCAssociationAuthorizationsResponse

        input = Types::ListVPCAssociationAuthorizationsRequest.new(hosted_zone_id: hosted_zone_id, max_results: max_results, next_token: next_token)
        list_vpc_association_authorizations(input)
      end

      def list_vpc_association_authorizations(input : Types::ListVPCAssociationAuthorizationsRequest) : Types::ListVPCAssociationAuthorizationsResponse
        request = Protocol::RestXml.build_request(Model::LIST_VPC_ASSOCIATION_AUTHORIZATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::ListVPCAssociationAuthorizationsResponse, "ListVPCAssociationAuthorizations")
      end

      # Gets the value that Amazon Route 53 returns in response to a DNS request for a specified record name
      # and type. You can optionally specify the IP address of a DNS resolver, an EDNS0 client subnet IP
      # address, and a subnet mask. This call only supports querying public hosted zones. The TestDnsAnswer
      # returns information similar to what you would expect from the answer section of the dig command.
      # Therefore, if you query for the name servers of a subdomain that point to the parent name servers,
      # those will not be returned.

      def test_dns_answer(
        hosted_zone_id : String,
        record_name : String,
        record_type : String,
        edns0_client_subnet_ip : String? = nil,
        edns0_client_subnet_mask : String? = nil,
        resolver_ip : String? = nil
      ) : Types::TestDNSAnswerResponse

        input = Types::TestDNSAnswerRequest.new(hosted_zone_id: hosted_zone_id, record_name: record_name, record_type: record_type, edns0_client_subnet_ip: edns0_client_subnet_ip, edns0_client_subnet_mask: edns0_client_subnet_mask, resolver_ip: resolver_ip)
        test_dns_answer(input)
      end

      def test_dns_answer(input : Types::TestDNSAnswerRequest) : Types::TestDNSAnswerResponse
        request = Protocol::RestXml.build_request(Model::TEST_DNS_ANSWER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::TestDNSAnswerResponse, "TestDNSAnswer")
      end

      # Updates an existing health check. Note that some values can't be updated. For more information about
      # updating health checks, see Creating, Updating, and Deleting Health Checks in the Amazon Route 53
      # Developer Guide .

      def update_health_check(
        health_check_id : String,
        alarm_identifier : Types::AlarmIdentifier? = nil,
        child_health_checks : Array(String)? = nil,
        disabled : Bool? = nil,
        enable_sni : Bool? = nil,
        failure_threshold : Int32? = nil,
        fully_qualified_domain_name : String? = nil,
        health_check_version : Int64? = nil,
        health_threshold : Int32? = nil,
        ip_address : String? = nil,
        insufficient_data_health_status : String? = nil,
        inverted : Bool? = nil,
        port : Int32? = nil,
        regions : Array(String)? = nil,
        reset_elements : Array(String)? = nil,
        resource_path : String? = nil,
        search_string : String? = nil
      ) : Types::UpdateHealthCheckResponse

        input = Types::UpdateHealthCheckRequest.new(health_check_id: health_check_id, alarm_identifier: alarm_identifier, child_health_checks: child_health_checks, disabled: disabled, enable_sni: enable_sni, failure_threshold: failure_threshold, fully_qualified_domain_name: fully_qualified_domain_name, health_check_version: health_check_version, health_threshold: health_threshold, ip_address: ip_address, insufficient_data_health_status: insufficient_data_health_status, inverted: inverted, port: port, regions: regions, reset_elements: reset_elements, resource_path: resource_path, search_string: search_string)
        update_health_check(input)
      end

      def update_health_check(input : Types::UpdateHealthCheckRequest) : Types::UpdateHealthCheckResponse
        request = Protocol::RestXml.build_request(Model::UPDATE_HEALTH_CHECK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateHealthCheckResponse, "UpdateHealthCheck")
      end

      # Updates the comment for a specified hosted zone.

      def update_hosted_zone_comment(
        id : String,
        comment : String? = nil
      ) : Types::UpdateHostedZoneCommentResponse

        input = Types::UpdateHostedZoneCommentRequest.new(id: id, comment: comment)
        update_hosted_zone_comment(input)
      end

      def update_hosted_zone_comment(input : Types::UpdateHostedZoneCommentRequest) : Types::UpdateHostedZoneCommentResponse
        request = Protocol::RestXml.build_request(Model::UPDATE_HOSTED_ZONE_COMMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateHostedZoneCommentResponse, "UpdateHostedZoneComment")
      end

      # Updates the features configuration for a hosted zone. This operation allows you to enable or disable
      # specific features for your hosted zone, such as accelerated recovery. Accelerated recovery enables
      # you to update DNS records in your public hosted zone even when the us-east-1 region is unavailable.

      def update_hosted_zone_features(
        hosted_zone_id : String,
        enable_accelerated_recovery : Bool? = nil
      ) : Types::UpdateHostedZoneFeaturesResponse

        input = Types::UpdateHostedZoneFeaturesRequest.new(hosted_zone_id: hosted_zone_id, enable_accelerated_recovery: enable_accelerated_recovery)
        update_hosted_zone_features(input)
      end

      def update_hosted_zone_features(input : Types::UpdateHostedZoneFeaturesRequest) : Types::UpdateHostedZoneFeaturesResponse
        request = Protocol::RestXml.build_request(Model::UPDATE_HOSTED_ZONE_FEATURES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateHostedZoneFeaturesResponse, "UpdateHostedZoneFeatures")
      end

      # Updates the comment for a specified traffic policy version.

      def update_traffic_policy_comment(
        comment : String,
        id : String,
        version : Int32
      ) : Types::UpdateTrafficPolicyCommentResponse

        input = Types::UpdateTrafficPolicyCommentRequest.new(comment: comment, id: id, version: version)
        update_traffic_policy_comment(input)
      end

      def update_traffic_policy_comment(input : Types::UpdateTrafficPolicyCommentRequest) : Types::UpdateTrafficPolicyCommentResponse
        request = Protocol::RestXml.build_request(Model::UPDATE_TRAFFIC_POLICY_COMMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateTrafficPolicyCommentResponse, "UpdateTrafficPolicyComment")
      end

      # After you submit a UpdateTrafficPolicyInstance request, there's a brief delay while Route 53 creates
      # the resource record sets that are specified in the traffic policy definition. Use
      # GetTrafficPolicyInstance with the id of updated traffic policy instance confirm that the
      # UpdateTrafficPolicyInstance request completed successfully. For more information, see the State
      # response element. Updates the resource record sets in a specified hosted zone that were created
      # based on the settings in a specified traffic policy version. When you update a traffic policy
      # instance, Amazon Route 53 continues to respond to DNS queries for the root resource record set name
      # (such as example.com) while it replaces one group of resource record sets with another. Route 53
      # performs the following operations: Route 53 creates a new group of resource record sets based on the
      # specified traffic policy. This is true regardless of how significant the differences are between the
      # existing resource record sets and the new resource record sets. When all of the new resource record
      # sets have been created, Route 53 starts to respond to DNS queries for the root resource record set
      # name (such as example.com) by using the new resource record sets. Route 53 deletes the old group of
      # resource record sets that are associated with the root resource record set name.

      def update_traffic_policy_instance(
        id : String,
        ttl : Int64,
        traffic_policy_id : String,
        traffic_policy_version : Int32
      ) : Types::UpdateTrafficPolicyInstanceResponse

        input = Types::UpdateTrafficPolicyInstanceRequest.new(id: id, ttl: ttl, traffic_policy_id: traffic_policy_id, traffic_policy_version: traffic_policy_version)
        update_traffic_policy_instance(input)
      end

      def update_traffic_policy_instance(input : Types::UpdateTrafficPolicyInstanceRequest) : Types::UpdateTrafficPolicyInstanceResponse
        request = Protocol::RestXml.build_request(Model::UPDATE_TRAFFIC_POLICY_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::RestXml.parse_error(response) if response.status >= 300
        Protocol::RestXml.parse_response(response, Types::UpdateTrafficPolicyInstanceResponse, "UpdateTrafficPolicyInstance")
      end
    end
  end
end
