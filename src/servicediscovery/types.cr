require "json"
require "time"

module Aws
  module ServiceDiscovery
    module Types


      struct CreateHttpNamespaceRequest
        include JSON::Serializable

        # The name that you want to assign to this namespace.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique string that identifies the request and that allows failed CreateHttpNamespace requests to
        # be retried without the risk of running the operation twice. CreatorRequestId can be any unique
        # string (for example, a date/time stamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A description for the namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags to add to the namespace. Each tag consists of a key and an optional value that you define.
        # Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in
        # length.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateHttpNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct CreatePrivateDnsNamespaceRequest
        include JSON::Serializable

        # The name that you want to assign to this namespace. When you create a private DNS namespace, Cloud
        # Map automatically creates an Amazon Route 53 private hosted zone that has the same name as the
        # namespace.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ID of the Amazon VPC that you want to associate the namespace with.

        @[JSON::Field(key: "Vpc")]
        getter vpc : String

        # A unique string that identifies the request and that allows failed CreatePrivateDnsNamespace
        # requests to be retried without the risk of running the operation twice. CreatorRequestId can be any
        # unique string (for example, a date/timestamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A description for the namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Properties for the private DNS namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::PrivateDnsNamespaceProperties?

        # The tags to add to the namespace. Each tag consists of a key and an optional value that you define.
        # Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in
        # length.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @vpc : String,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @properties : Types::PrivateDnsNamespaceProperties? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePrivateDnsNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct CreatePublicDnsNamespaceRequest
        include JSON::Serializable

        # The name that you want to assign to this namespace. Do not include sensitive information in the
        # name. The name is publicly available using DNS queries.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique string that identifies the request and that allows failed CreatePublicDnsNamespace requests
        # to be retried without the risk of running the operation twice. CreatorRequestId can be any unique
        # string (for example, a date/timestamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A description for the namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Properties for the public DNS namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::PublicDnsNamespaceProperties?

        # The tags to add to the namespace. Each tag consists of a key and an optional value that you define.
        # Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in
        # length.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @properties : Types::PublicDnsNamespaceProperties? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePublicDnsNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct CreateServiceRequest
        include JSON::Serializable

        # The name that you want to assign to the service. Do not include sensitive information in the name if
        # the namespace is discoverable by public DNS queries. If you want Cloud Map to create an SRV record
        # when you register an instance and you're using a system that requires a specific SRV format, such as
        # HAProxy , specify the following for Name : Start the name with an underscore (_), such as
        # _exampleservice . End the name with ._protocol , such as ._tcp . When you register an instance,
        # Cloud Map creates an SRV record and assigns a name to the record by concatenating the service name
        # and the namespace name (for example, _exampleservice._tcp.example.com ). For services that are
        # accessible by DNS queries, you can't create multiple services with names that differ only by case
        # (such as EXAMPLE and example). Otherwise, these services have the same DNS name and can't be
        # distinguished. However, if you use a namespace that's only accessible by API calls, then you can
        # create services that with names that differ only by case.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique string that identifies the request and that allows failed CreateService requests to be
        # retried without the risk of running the operation twice. CreatorRequestId can be any unique string
        # (for example, a date/timestamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # A description for the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains information about the Amazon Route 53 records that you want Cloud Map
        # to create when you register an instance.

        @[JSON::Field(key: "DnsConfig")]
        getter dns_config : Types::DnsConfig?

        # Public DNS and HTTP namespaces only. A complex type that contains settings for an optional Route 53
        # health check. If you specify settings for a health check, Cloud Map associates the health check with
        # all the Route 53 DNS records that you specify in DnsConfig . If you specify a health check
        # configuration, you can specify either HealthCheckCustomConfig or HealthCheckConfig but not both. For
        # information about the charges for health checks, see Cloud Map Pricing .

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig?

        # A complex type that contains information about an optional custom health check. If you specify a
        # health check configuration, you can specify either HealthCheckCustomConfig or HealthCheckConfig but
        # not both. You can't add, update, or delete a HealthCheckCustomConfig configuration from an existing
        # service.

        @[JSON::Field(key: "HealthCheckCustomConfig")]
        getter health_check_custom_config : Types::HealthCheckCustomConfig?

        # The ID or Amazon Resource Name (ARN) of the namespace that you want to use to create the service.
        # For namespaces shared with your Amazon Web Services account, specify the namespace ARN. For more
        # information about shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map
        # Developer Guide .

        @[JSON::Field(key: "NamespaceId")]
        getter namespace_id : String?

        # The tags to add to the service. Each tag consists of a key and an optional value that you define.
        # Tags keys can be up to 128 characters in length, and tag values can be up to 256 characters in
        # length.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # If present, specifies that the service instances are only discoverable using the DiscoverInstances
        # API operation. No DNS records is registered for the service instances. The only valid value is HTTP
        # .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @name : String,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @dns_config : Types::DnsConfig? = nil,
          @health_check_config : Types::HealthCheckConfig? = nil,
          @health_check_custom_config : Types::HealthCheckCustomConfig? = nil,
          @namespace_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateServiceResponse
        include JSON::Serializable

        # A complex type that contains information about the new service.

        @[JSON::Field(key: "Service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end

      # The health check for the instance that's specified by ServiceId and InstanceId isn't a custom health
      # check.

      struct CustomHealthNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteNamespaceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the namespace that you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct DeleteServiceAttributesRequest
        include JSON::Serializable

        # A list of keys corresponding to each attribute that you want to delete.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(String)

        # The ID or Amazon Resource Name (ARN) of the service from which the attributes will be deleted. For
        # services created in a namespace shared with your Amazon Web Services account, specify the service
        # ARN. For more information about shared namespaces, see Cross-account Cloud Map namespace sharing in
        # the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        def initialize(
          @attributes : Array(String),
          @service_id : String
        )
        end
      end


      struct DeleteServiceAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteServiceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that you want to delete. If the namespace
        # associated with the service is shared with your Amazon Web Services account, specify the service
        # ARN. For more information about shared namespaces, see Cross-account Cloud Map namespace sharing .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeleteServiceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterInstanceRequest
        include JSON::Serializable

        # The value that you specified for Id in the RegisterInstance request.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The ID or Amazon Resource Name (ARN) of the service that the instance is associated with. If the
        # namespace associated with the service is shared with your account, specify the service ARN. For more
        # information about shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map
        # Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        def initialize(
          @instance_id : String,
          @service_id : String
        )
        end
      end


      struct DeregisterInstanceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct DiscoverInstancesRequest
        include JSON::Serializable

        # The HttpName name of the namespace. The HttpName is found in the HttpProperties member of the
        # Properties member of the namespace. In most cases, Name and HttpName match. However, if you reuse
        # Name for namespace creation, a generated hash is added to HttpName to distinguish the two.

        @[JSON::Field(key: "NamespaceName")]
        getter namespace_name : String

        # The name of the service that you specified when you registered the instance.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The health status of the instances that you want to discover. This parameter is ignored for services
        # that don't have a health check configured, and all instances are returned. HEALTHY Returns healthy
        # instances. UNHEALTHY Returns unhealthy instances. ALL Returns all instances. HEALTHY_OR_ELSE_ALL
        # Returns healthy instances, unless none are reporting a healthy state. In that case, return all
        # instances. This is also called failing open.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The maximum number of instances that you want Cloud Map to return in the response to a
        # DiscoverInstances request. If you don't specify a value for MaxResults , Cloud Map returns up to 100
        # instances.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Opportunistic filters to scope the results based on custom attributes. If there are instances that
        # match both the filters specified in both the QueryParameters parameter and this parameter, all of
        # these instances are returned. Otherwise, the filters are ignored, and only instances that match the
        # filters that are specified in the QueryParameters parameter are returned.

        @[JSON::Field(key: "OptionalParameters")]
        getter optional_parameters : Hash(String, String)?

        # The ID of the Amazon Web Services account that owns the namespace associated with the instance, as
        # specified in the namespace ResourceOwner field. For instances associated with namespaces that are
        # shared with your account, you must specify an OwnerAccount .

        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # Filters to scope the results based on custom attributes for the instance (for example, {version=v1,
        # az=1a} ). Only instances that match all the specified key-value pairs are returned.

        @[JSON::Field(key: "QueryParameters")]
        getter query_parameters : Hash(String, String)?

        def initialize(
          @namespace_name : String,
          @service_name : String,
          @health_status : String? = nil,
          @max_results : Int32? = nil,
          @optional_parameters : Hash(String, String)? = nil,
          @owner_account : String? = nil,
          @query_parameters : Hash(String, String)? = nil
        )
        end
      end


      struct DiscoverInstancesResponse
        include JSON::Serializable

        # A complex type that contains one HttpInstanceSummary for each registered instance.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::HttpInstanceSummary)?

        # The increasing revision associated to the response Instances list. If a new instance is registered
        # or deregistered, the InstancesRevision updates. The health status updates don't update
        # InstancesRevision .

        @[JSON::Field(key: "InstancesRevision")]
        getter instances_revision : Int64?

        def initialize(
          @instances : Array(Types::HttpInstanceSummary)? = nil,
          @instances_revision : Int64? = nil
        )
        end
      end


      struct DiscoverInstancesRevisionRequest
        include JSON::Serializable

        # The HttpName name of the namespace. The HttpName is found in the HttpProperties member of the
        # Properties member of the namespace.

        @[JSON::Field(key: "NamespaceName")]
        getter namespace_name : String

        # The name of the service that you specified when you registered the instance.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String

        # The ID of the Amazon Web Services account that owns the namespace associated with the instance, as
        # specified in the namespace ResourceOwner field. For instances associated with namespaces that are
        # shared with your account, you must specify an OwnerAccount . For more information about shared
        # namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        def initialize(
          @namespace_name : String,
          @service_name : String,
          @owner_account : String? = nil
        )
        end
      end


      struct DiscoverInstancesRevisionResponse
        include JSON::Serializable

        # The increasing revision associated to the response Instances list. If a new instance is registered
        # or deregistered, the InstancesRevision updates. The health status updates don't update
        # InstancesRevision .

        @[JSON::Field(key: "InstancesRevision")]
        getter instances_revision : Int64?

        def initialize(
          @instances_revision : Int64? = nil
        )
        end
      end

      # A complex type that contains information about the Amazon Route 53 DNS records that you want Cloud
      # Map to create when you register an instance.

      struct DnsConfig
        include JSON::Serializable

        # An array that contains one DnsRecord object for each Route 53 DNS record that you want Cloud Map to
        # create when you register an instance. The record type of a service specified in a DnsRecord object
        # can't be updated. To change a record type, you need to delete the service and recreate it with a new
        # DnsConfig .

        @[JSON::Field(key: "DnsRecords")]
        getter dns_records : Array(Types::DnsRecord)

        # Use NamespaceId in Service instead. The ID of the namespace to use for DNS configuration.

        @[JSON::Field(key: "NamespaceId")]
        getter namespace_id : String?

        # The routing policy that you want to apply to all Route 53 DNS records that Cloud Map creates when
        # you register an instance and specify this service. If you want to use this service to register
        # instances that create alias records, specify WEIGHTED for the routing policy. You can specify the
        # following values: MULTIVALUE If you define a health check for the service and the health check is
        # healthy, Route 53 returns the applicable value for up to eight instances. For example, suppose that
        # the service includes configurations for one A record and a health check. You use the service to
        # register 10 instances. Route 53 responds to DNS queries with IP addresses for up to eight healthy
        # instances. If fewer than eight instances are healthy, Route 53 responds to every DNS query with the
        # IP addresses for all of the healthy instances. If you don't define a health check for the service,
        # Route 53 assumes that all instances are healthy and returns the values for up to eight instances.
        # For more information about the multivalue routing policy, see Multivalue Answer Routing in the Route
        # 53 Developer Guide . WEIGHTED Route 53 returns the applicable value from one randomly selected
        # instance from among the instances that you registered using the same service. Currently, all records
        # have the same weight, so you can't route more or less traffic to any instances. For example, suppose
        # that the service includes configurations for one A record and a health check. You use the service to
        # register 10 instances. Route 53 responds to DNS queries with the IP address for one randomly
        # selected instance from among the healthy instances. If no instances are healthy, Route 53 responds
        # to DNS queries as if all of the instances were healthy. If you don't define a health check for the
        # service, Route 53 assumes that all instances are healthy and returns the applicable value for one
        # randomly selected instance. For more information about the weighted routing policy, see Weighted
        # Routing in the Route 53 Developer Guide .

        @[JSON::Field(key: "RoutingPolicy")]
        getter routing_policy : String?

        def initialize(
          @dns_records : Array(Types::DnsRecord),
          @namespace_id : String? = nil,
          @routing_policy : String? = nil
        )
        end
      end

      # A complex type that contains information about changes to the Route 53 DNS records that Cloud Map
      # creates when you register an instance.

      struct DnsConfigChange
        include JSON::Serializable

        # An array that contains one DnsRecord object for each Route 53 record that you want Cloud Map to
        # create when you register an instance.

        @[JSON::Field(key: "DnsRecords")]
        getter dns_records : Array(Types::DnsRecord)

        def initialize(
          @dns_records : Array(Types::DnsRecord)
        )
        end
      end

      # A complex type that contains the ID for the Route 53 hosted zone that Cloud Map creates when you
      # create a namespace.

      struct DnsProperties
        include JSON::Serializable

        # The ID for the Route 53 hosted zone that Cloud Map creates when you create a namespace.

        @[JSON::Field(key: "HostedZoneId")]
        getter hosted_zone_id : String?

        # Start of Authority (SOA) record for the hosted zone.

        @[JSON::Field(key: "SOA")]
        getter soa : Types::SOA?

        def initialize(
          @hosted_zone_id : String? = nil,
          @soa : Types::SOA? = nil
        )
        end
      end

      # A complex type that contains information about the Route 53 DNS records that you want Cloud Map to
      # create when you register an instance.

      struct DnsRecord
        include JSON::Serializable

        # The amount of time, in seconds, that you want DNS resolvers to cache the settings for this record.
        # Alias records don't include a TTL because Route 53 uses the TTL for the Amazon Web Services resource
        # that an alias record routes traffic to. If you include the AWS_ALIAS_DNS_NAME attribute when you
        # submit a RegisterInstance request, the TTL value is ignored. Always specify a TTL for the service;
        # you can use a service to register instances that create either alias or non-alias records.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        # The type of the resource, which indicates the type of value that Route 53 returns in response to DNS
        # queries. You can specify values for Type in the following combinations: A AAAA A and AAAA SRV CNAME
        # If you want Cloud Map to create a Route 53 alias record when you register an instance, specify A or
        # AAAA for Type . You specify other settings, such as the IP address for A and AAAA records, when you
        # register an instance. For more information, see RegisterInstance . The following values are
        # supported: A Route 53 returns the IP address of the resource in IPv4 format, such as 192.0.2.44.
        # AAAA Route 53 returns the IP address of the resource in IPv6 format, such as
        # 2001:0db8:85a3:0000:0000:abcd:0001:2345. CNAME Route 53 returns the domain name of the resource,
        # such as www.example.com. Note the following: You specify the domain name that you want to route
        # traffic to when you register an instance. For more information, see Attributes in the topic
        # RegisterInstance . You must specify WEIGHTED for the value of RoutingPolicy . You can't specify both
        # CNAME for Type and settings for HealthCheckConfig . If you do, the request will fail with an
        # InvalidInput error. SRV Route 53 returns the value for an SRV record. The value for an SRV record
        # uses the following values: priority weight port service-hostname Note the following about the
        # values: The values of priority and weight are both set to 1 and can't be changed. The value of port
        # comes from the value that you specify for the AWS_INSTANCE_PORT attribute when you submit a
        # RegisterInstance request. The value of service-hostname is a concatenation of the following values:
        # The value that you specify for InstanceId when you register an instance. The name of the service.
        # The name of the namespace. For example, if the value of InstanceId is test , the name of the service
        # is backend , and the name of the namespace is example.com , the value of service-hostname is the
        # following: test.backend.example.com If you specify settings for an SRV record, note the following:
        # If you specify values for AWS_INSTANCE_IPV4 , AWS_INSTANCE_IPV6 , or both in the RegisterInstance
        # request, Cloud Map automatically creates A and/or AAAA records that have the same name as the value
        # of service-hostname in the SRV record. You can ignore these records. If you're using a system that
        # requires a specific SRV format, such as HAProxy, see the Name element in the documentation about
        # CreateService for information about how to specify the correct name format.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @ttl : Int64,
          @type : String
        )
        end
      end

      # The operation is already in progress.

      struct DuplicateRequest
        include JSON::Serializable

        # The ID of the operation that's already in progress.

        @[JSON::Field(key: "DuplicateOperationId")]
        getter duplicate_operation_id : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @duplicate_operation_id : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct GetInstanceRequest
        include JSON::Serializable

        # The ID of the instance that you want to get information about.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The ID or Amazon Resource Name (ARN) of the service that the instance is associated with. For
        # services created in a shared namespace, specify the service ARN. For more information about shared
        # namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        def initialize(
          @instance_id : String,
          @service_id : String
        )
        end
      end


      struct GetInstanceResponse
        include JSON::Serializable

        # A complex type that contains information about a specified instance.

        @[JSON::Field(key: "Instance")]
        getter instance : Types::Instance?

        # The ID of the Amazon Web Services account that created the namespace that contains the service that
        # the instance is associated with. If this isn't your account ID, it's the ID of the account that
        # shared the namespace with your account.

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        def initialize(
          @instance : Types::Instance? = nil,
          @resource_owner : String? = nil
        )
        end
      end


      struct GetInstancesHealthStatusRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that the instance is associated with. For
        # services created in a shared namespace, specify the service ARN. For more information about shared
        # namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        # An array that contains the IDs of all the instances that you want to get the health status for. If
        # you omit Instances , Cloud Map returns the health status for all the instances that are associated
        # with the specified service. To get the IDs for the instances that you've registered by using a
        # specified service, submit a ListInstances request.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(String)?

        # The maximum number of instances that you want Cloud Map to return in the response to a
        # GetInstancesHealthStatus request. If you don't specify a value for MaxResults , Cloud Map returns up
        # to 100 instances.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first GetInstancesHealthStatus request, omit this value. If more than MaxResults instances
        # match the specified criteria, you can submit another GetInstancesHealthStatus request to get the
        # next group of results. Specify the value of NextToken from the previous response in the next
        # request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_id : String,
          @instances : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetInstancesHealthStatusResponse
        include JSON::Serializable

        # If more than MaxResults instances match the specified criteria, you can submit another
        # GetInstancesHealthStatus request to get the next group of results. Specify the value of NextToken
        # from the previous response in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A complex type that contains the IDs and the health status of the instances that you specified in
        # the GetInstancesHealthStatus request.

        @[JSON::Field(key: "Status")]
        getter status : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @status : Hash(String, String)? = nil
        )
        end
      end


      struct GetNamespaceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the namespace that you want to get information about. For
        # namespaces shared with your Amazon Web Services account, specify the namespace ARN. For more
        # information about shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map
        # Developer Guide

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetNamespaceResponse
        include JSON::Serializable

        # A complex type that contains information about the specified namespace.

        @[JSON::Field(key: "Namespace")]
        getter namespace : Types::Namespace?

        def initialize(
          @namespace : Types::Namespace? = nil
        )
        end
      end


      struct GetOperationRequest
        include JSON::Serializable

        # The ID of the operation that you want to get more information about.

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String

        # The ID of the Amazon Web Services account that owns the namespace associated with the operation, as
        # specified in the namespace ResourceOwner field. For operations associated with namespaces that are
        # shared with your account, you must specify an OwnerAccount .

        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        def initialize(
          @operation_id : String,
          @owner_account : String? = nil
        )
        end
      end


      struct GetOperationResponse
        include JSON::Serializable

        # A complex type that contains information about the operation.

        @[JSON::Field(key: "Operation")]
        getter operation : Types::Operation?

        def initialize(
          @operation : Types::Operation? = nil
        )
        end
      end


      struct GetServiceAttributesRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that you want to get attributes for. For
        # services created in a namespace shared with your Amazon Web Services account, specify the service
        # ARN. For more information about shared namespaces, see Cross-account Cloud Map namespace sharing in
        # the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        def initialize(
          @service_id : String
        )
        end
      end


      struct GetServiceAttributesResponse
        include JSON::Serializable

        # A complex type that contains the service ARN and a list of attribute key-value pairs associated with
        # the service.

        @[JSON::Field(key: "ServiceAttributes")]
        getter service_attributes : Types::ServiceAttributes?

        def initialize(
          @service_attributes : Types::ServiceAttributes? = nil
        )
        end
      end


      struct GetServiceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that you want to get settings for. For services
        # created by consumers in a shared namespace, specify the service ARN. For more information about
        # shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct GetServiceResponse
        include JSON::Serializable

        # A complex type that contains information about the service.

        @[JSON::Field(key: "Service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end

      # Public DNS and HTTP namespaces only. A complex type that contains settings for an optional health
      # check. If you specify settings for a health check, Cloud Map associates the health check with the
      # records that you specify in DnsConfig . If you specify a health check configuration, you can specify
      # either HealthCheckCustomConfig or HealthCheckConfig but not both. Health checks are basic Route 53
      # health checks that monitor an Amazon Web Services endpoint. For information about pricing for health
      # checks, see Amazon Route 53 Pricing . Note the following about configuring health checks. A and AAAA
      # records If DnsConfig includes configurations for both A and AAAA records, Cloud Map creates a health
      # check that uses the IPv4 address to check the health of the resource. If the endpoint tthat's
      # specified by the IPv4 address is unhealthy, Route 53 considers both the A and AAAA records to be
      # unhealthy. CNAME records You can't specify settings for HealthCheckConfig when the DNSConfig
      # includes CNAME for the value of Type . If you do, the CreateService request will fail with an
      # InvalidInput error. Request interval A Route 53 health checker in each health-checking Amazon Web
      # Services Region sends a health check request to an endpoint every 30 seconds. On average, your
      # endpoint receives a health check request about every two seconds. However, health checkers don't
      # coordinate with one another. Therefore, you might sometimes see several requests in one second
      # that's followed by a few seconds with no health checks at all. Health checking regions Health
      # checkers perform checks from all Route 53 health-checking Regions. For a list of the current
      # Regions, see Regions . Alias records When you register an instance, if you include the
      # AWS_ALIAS_DNS_NAME attribute, Cloud Map creates a Route 53 alias record. Note the following: Route
      # 53 automatically sets EvaluateTargetHealth to true for alias records. When EvaluateTargetHealth is
      # true, the alias record inherits the health of the referenced Amazon Web Services resource. such as
      # an ELB load balancer. For more information, see EvaluateTargetHealth . If you include
      # HealthCheckConfig and then use the service to register an instance that creates an alias record,
      # Route 53 doesn't create the health check. Charges for health checks Health checks are basic Route 53
      # health checks that monitor an Amazon Web Services endpoint. For information about pricing for health
      # checks, see Amazon Route 53 Pricing .

      struct HealthCheckConfig
        include JSON::Serializable

        # The type of health check that you want to create, which indicates how Route 53 determines whether an
        # endpoint is healthy. You can't change the value of Type after you create a health check. You can
        # create the following types of health checks: HTTP : Route 53 tries to establish a TCP connection. If
        # successful, Route 53 submits an HTTP request and waits for an HTTP status code of 200 or greater and
        # less than 400. HTTPS : Route 53 tries to establish a TCP connection. If successful, Route 53 submits
        # an HTTPS request and waits for an HTTP status code of 200 or greater and less than 400. If you
        # specify HTTPS for the value of Type , the endpoint must support TLS v1.0 or later. TCP : Route 53
        # tries to establish a TCP connection. If you specify TCP for Type , don't specify a value for
        # ResourcePath . For more information, see How Route 53 Determines Whether an Endpoint Is Healthy in
        # the Route 53 Developer Guide .

        @[JSON::Field(key: "Type")]
        getter type : String

        # The number of consecutive health checks that an endpoint must pass or fail for Route 53 to change
        # the current status of the endpoint from unhealthy to healthy or the other way around. For more
        # information, see How Route 53 Determines Whether an Endpoint Is Healthy in the Route 53 Developer
        # Guide .

        @[JSON::Field(key: "FailureThreshold")]
        getter failure_threshold : Int32?

        # The path that you want Route 53 to request when performing health checks. The path can be any value
        # that your endpoint returns an HTTP status code of a 2xx or 3xx format for when the endpoint is
        # healthy. An example file is /docs/route53-health-check.html . Route 53 automatically adds the DNS
        # name for the service. If you don't specify a value for ResourcePath , the default value is / . If
        # you specify TCP for Type , you must not specify a value for ResourcePath .

        @[JSON::Field(key: "ResourcePath")]
        getter resource_path : String?

        def initialize(
          @type : String,
          @failure_threshold : Int32? = nil,
          @resource_path : String? = nil
        )
        end
      end

      # A complex type that contains information about an optional custom health check. A custom health
      # check, which requires that you use a third-party health checker to evaluate the health of your
      # resources, is useful in the following circumstances: You can't use a health check that's defined by
      # HealthCheckConfig because the resource isn't available over the internet. For example, you can use a
      # custom health check when the instance is in an Amazon VPC. (To check the health of resources in a
      # VPC, the health checker must also be in the VPC.) You want to use a third-party health checker
      # regardless of where your resources are located. If you specify a health check configuration, you can
      # specify either HealthCheckCustomConfig or HealthCheckConfig but not both. To change the status of a
      # custom health check, submit an UpdateInstanceCustomHealthStatus request. Cloud Map doesn't monitor
      # the status of the resource, it just keeps a record of the status specified in the most recent
      # UpdateInstanceCustomHealthStatus request. Here's how custom health checks work: You create a
      # service. You register an instance. You configure a third-party health checker to monitor the
      # resource that's associated with the new instance. Cloud Map doesn't check the health of the resource
      # directly. The third-party health-checker determines that the resource is unhealthy and notifies your
      # application. Your application submits an UpdateInstanceCustomHealthStatus request. Cloud Map waits
      # for 30 seconds. If another UpdateInstanceCustomHealthStatus request doesn't arrive during that time
      # to change the status back to healthy, Cloud Map stops routing traffic to the resource.

      struct HealthCheckCustomConfig
        include JSON::Serializable

        # This parameter is no longer supported and is always set to 1. Cloud Map waits for approximately 30
        # seconds after receiving an UpdateInstanceCustomHealthStatus request before changing the status of
        # the service instance. The number of 30-second intervals that you want Cloud Map to wait after
        # receiving an UpdateInstanceCustomHealthStatus request before it changes the health status of a
        # service instance. Sending a second or subsequent UpdateInstanceCustomHealthStatus request with the
        # same value before 30 seconds has passed doesn't accelerate the change. Cloud Map still waits 30
        # seconds after the first request to make the change.

        @[JSON::Field(key: "FailureThreshold")]
        getter failure_threshold : Int32?

        def initialize(
          @failure_threshold : Int32? = nil
        )
        end
      end

      # In a response to a DiscoverInstances request, HttpInstanceSummary contains information about one
      # instance that matches the values that you specified in the request.

      struct HttpInstanceSummary
        include JSON::Serializable

        # If you included any attributes when you registered the instance, the values of those attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # If you configured health checking in the service, the current health status of the service instance.

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The ID of an instance that matches the values that you specified in the request.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The HttpName name of the namespace. It's found in the HttpProperties member of the Properties member
        # of the namespace.

        @[JSON::Field(key: "NamespaceName")]
        getter namespace_name : String?

        # The name of the service that you specified when you registered the instance.

        @[JSON::Field(key: "ServiceName")]
        getter service_name : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @health_status : String? = nil,
          @instance_id : String? = nil,
          @namespace_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # Updated properties for the HTTP namespace.

      struct HttpNamespaceChange
        include JSON::Serializable

        # An updated description for the HTTP namespace.

        @[JSON::Field(key: "Description")]
        getter description : String

        def initialize(
          @description : String
        )
        end
      end

      # A complex type that contains the name of an HTTP namespace.

      struct HttpProperties
        include JSON::Serializable

        # The name of an HTTP namespace.

        @[JSON::Field(key: "HttpName")]
        getter http_name : String?

        def initialize(
          @http_name : String? = nil
        )
        end
      end

      # A complex type that contains information about an instance that Cloud Map creates when you submit a
      # RegisterInstance request.

      struct Instance
        include JSON::Serializable

        # An identifier that you want to associate with the instance. Note the following: If the service
        # that's specified by ServiceId includes settings for an SRV record, the value of InstanceId is
        # automatically included as part of the value for the SRV record. For more information, see DnsRecord
        # &gt; Type . You can use this value to update an existing instance. To register a new instance, you
        # must specify a value that's unique among instances that you register by using the same service. If
        # you specify an existing InstanceId and ServiceId , Cloud Map updates the existing DNS records. If
        # there's also an existing health check, Cloud Map deletes the old health check and creates a new one.
        # The health check isn't deleted immediately, so it will still appear for a while if you submit a
        # ListHealthChecks request, for example.

        @[JSON::Field(key: "Id")]
        getter id : String

        # A string map that contains the following information for the service that you specify in ServiceId :
        # The attributes that apply to the records that are defined in the service. For each attribute, the
        # applicable value. Do not include sensitive information in the attributes if the namespace is
        # discoverable by public DNS queries. Supported attribute keys include the following:
        # AWS_ALIAS_DNS_NAME If you want Cloud Map to create a Route 53 alias record that routes traffic to an
        # Elastic Load Balancing load balancer, specify the DNS name that's associated with the load balancer.
        # For information about how to get the DNS name, see AliasTarget-&gt;DNSName in the Route 53 API
        # Reference . Note the following: The configuration for the service that's specified by ServiceId must
        # include settings for an A record, an AAAA record, or both. In the service that's specified by
        # ServiceId , the value of RoutingPolicy must be WEIGHTED . If the service that's specified by
        # ServiceId includes HealthCheckConfig settings, Cloud Map creates the health check, but it won't
        # associate the health check with the alias record. Auto naming currently doesn't support creating
        # alias records that route traffic to Amazon Web Services resources other than ELB load balancers. If
        # you specify a value for AWS_ALIAS_DNS_NAME , don't specify values for any of the AWS_INSTANCE
        # attributes. AWS_EC2_INSTANCE_ID HTTP namespaces only. The Amazon EC2 instance ID for the instance.
        # The AWS_INSTANCE_IPV4 attribute contains the primary private IPv4 address. AWS_INIT_HEALTH_STATUS If
        # the service configuration includes HealthCheckCustomConfig , you can optionally use
        # AWS_INIT_HEALTH_STATUS to specify the initial status of the custom health check, HEALTHY or
        # UNHEALTHY . If you don't specify a value for AWS_INIT_HEALTH_STATUS , the initial status is HEALTHY
        # . AWS_INSTANCE_CNAME If the service configuration includes a CNAME record, the domain name that you
        # want Route 53 to return in response to DNS queries (for example, example.com ). This value is
        # required if the service specified by ServiceId includes settings for an CNAME record.
        # AWS_INSTANCE_IPV4 If the service configuration includes an A record, the IPv4 address that you want
        # Route 53 to return in response to DNS queries (for example, 192.0.2.44 ). This value is required if
        # the service specified by ServiceId includes settings for an A record. If the service includes
        # settings for an SRV record, you must specify a value for AWS_INSTANCE_IPV4 , AWS_INSTANCE_IPV6 , or
        # both. AWS_INSTANCE_IPV6 If the service configuration includes an AAAA record, the IPv6 address that
        # you want Route 53 to return in response to DNS queries (for example,
        # 2001:0db8:85a3:0000:0000:abcd:0001:2345 ). This value is required if the service specified by
        # ServiceId includes settings for an AAAA record. If the service includes settings for an SRV record,
        # you must specify a value for AWS_INSTANCE_IPV4 , AWS_INSTANCE_IPV6 , or both. AWS_INSTANCE_PORT If
        # the service includes an SRV record, the value that you want Route 53 to return for the port. If the
        # service includes HealthCheckConfig , the port on the endpoint that you want Route 53 to send
        # requests to. This value is required if you specified settings for an SRV record or a Route 53 health
        # check when you created the service.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The ID of the Amazon Web Services account that registered the instance. If this isn't your account
        # ID, it's the ID of the account that shared the namespace with your account or the ID of another
        # account with which the namespace has been shared. For more information about shared namespaces, see
        # Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "CreatedByAccount")]
        getter created_by_account : String?

        # A unique string that identifies the request and that allows failed RegisterInstance requests to be
        # retried without the risk of executing the operation twice. You must use a unique CreatorRequestId
        # string every time you submit a RegisterInstance request if you're registering additional instances
        # for the same namespace and service. CreatorRequestId can be any unique string (for example, a
        # date/time stamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        def initialize(
          @id : String,
          @attributes : Hash(String, String)? = nil,
          @created_by_account : String? = nil,
          @creator_request_id : String? = nil
        )
        end
      end

      # No instance exists with the specified ID, or the instance was recently registered, and information
      # about the instance hasn't propagated yet.

      struct InstanceNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about the instances that you registered by using a
      # specified service.

      struct InstanceSummary
        include JSON::Serializable

        # A string map that contains the following information: The attributes that are associated with the
        # instance. For each attribute, the applicable value. Supported attribute keys include the following:
        # AWS_ALIAS_DNS_NAME For an alias record that routes traffic to an Elastic Load Balancing load
        # balancer, the DNS name that's associated with the load balancer. AWS_EC2_INSTANCE_ID (HTTP
        # namespaces only) The Amazon EC2 instance ID for the instance. When the AWS_EC2_INSTANCE_ID attribute
        # is specified, then the AWS_INSTANCE_IPV4 attribute contains the primary private IPv4 address.
        # AWS_INIT_HEALTH_STATUS If the service configuration includes HealthCheckCustomConfig , you can
        # optionally use AWS_INIT_HEALTH_STATUS to specify the initial status of the custom health check,
        # HEALTHY or UNHEALTHY . If you don't specify a value for AWS_INIT_HEALTH_STATUS , the initial status
        # is HEALTHY . AWS_INSTANCE_CNAME For a CNAME record, the domain name that Route 53 returns in
        # response to DNS queries (for example, example.com ). AWS_INSTANCE_IPV4 For an A record, the IPv4
        # address that Route 53 returns in response to DNS queries (for example, 192.0.2.44 ).
        # AWS_INSTANCE_IPV6 For an AAAA record, the IPv6 address that Route 53 returns in response to DNS
        # queries (for example, 2001:0db8:85a3:0000:0000:abcd:0001:2345 ). AWS_INSTANCE_PORT For an SRV
        # record, the value that Route 53 returns for the port. In addition, if the service includes
        # HealthCheckConfig , the port on the endpoint that Route 53 sends requests to.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The ID of the Amazon Web Services account that registered the instance. If this isn't your account
        # ID, it's the ID of the account that shared the namespace with your account or the ID of another
        # account with which the namespace has been shared. For more information about shared namespaces, see
        # Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "CreatedByAccount")]
        getter created_by_account : String?

        # The ID for an instance that you created by using a specified service.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @created_by_account : String? = nil,
          @id : String? = nil
        )
        end
      end

      # One or more specified values aren't valid. For example, a required value might be missing, a numeric
      # value might be outside the allowed range, or a string value might exceed length constraints.

      struct InvalidInput
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListInstancesRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that you want to list instances for. For
        # services created in a shared namespace, specify the service ARN. For more information about shared
        # namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        # The maximum number of instances that you want Cloud Map to return in the response to a ListInstances
        # request. If you don't specify a value for MaxResults , Cloud Map returns up to 100 instances.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListInstances request, omit this value. If more than MaxResults instances match the
        # specified criteria, you can submit another ListInstances request to get the next group of results.
        # Specify the value of NextToken from the previous response in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @service_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInstancesResponse
        include JSON::Serializable

        # Summary information about the instances that are associated with the specified service.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::InstanceSummary)?

        # If more than MaxResults instances match the specified criteria, you can submit another ListInstances
        # request to get the next group of results. Specify the value of NextToken from the previous response
        # in the next request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the Amazon Web Services account that created the namespace that contains the specified
        # service. If this isn't your account ID, it's the ID of the account that shared the namespace with
        # your account.

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        def initialize(
          @instances : Array(Types::InstanceSummary)? = nil,
          @next_token : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end


      struct ListNamespacesRequest
        include JSON::Serializable

        # A complex type that contains specifications for the namespaces that you want to list. If you specify
        # more than one filter, a namespace must match all filters to be returned by ListNamespaces .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::NamespaceFilter)?

        # The maximum number of namespaces that you want Cloud Map to return in the response to a
        # ListNamespaces request. If you don't specify a value for MaxResults , Cloud Map returns up to 100
        # namespaces.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListNamespaces request, omit this value. If the response contains NextToken , submit
        # another ListNamespaces request to get the next group of results. Specify the value of NextToken from
        # the previous response in the next request. Cloud Map gets MaxResults namespaces and then filters
        # them based on the specified criteria. It's possible that no namespaces in the first MaxResults
        # namespaces matched the specified criteria but that subsequent groups of MaxResults namespaces do
        # contain namespaces that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::NamespaceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListNamespacesResponse
        include JSON::Serializable

        # An array that contains one NamespaceSummary object for each namespace that matches the specified
        # filter criteria.

        @[JSON::Field(key: "Namespaces")]
        getter namespaces : Array(Types::NamespaceSummary)?

        # If the response contains NextToken , submit another ListNamespaces request to get the next group of
        # results. Specify the value of NextToken from the previous response in the next request. Cloud Map
        # gets MaxResults namespaces and then filters them based on the specified criteria. It's possible that
        # no namespaces in the first MaxResults namespaces matched the specified criteria but that subsequent
        # groups of MaxResults namespaces do contain namespaces that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @namespaces : Array(Types::NamespaceSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOperationsRequest
        include JSON::Serializable

        # A complex type that contains specifications for the operations that you want to list, for example,
        # operations that you started between a specified start date and end date. If you specify more than
        # one filter, an operation must match all filters to be returned by ListOperations .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::OperationFilter)?

        # The maximum number of items that you want Cloud Map to return in the response to a ListOperations
        # request. If you don't specify a value for MaxResults , Cloud Map returns up to 100 operations.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListOperations request, omit this value. If the response contains NextToken , submit
        # another ListOperations request to get the next group of results. Specify the value of NextToken from
        # the previous response in the next request. Cloud Map gets MaxResults operations and then filters
        # them based on the specified criteria. It's possible that no operations in the first MaxResults
        # operations matched the specified criteria but that subsequent groups of MaxResults operations do
        # contain operations that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::OperationFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOperationsResponse
        include JSON::Serializable

        # If the response contains NextToken , submit another ListOperations request to get the next group of
        # results. Specify the value of NextToken from the previous response in the next request. Cloud Map
        # gets MaxResults operations and then filters them based on the specified criteria. It's possible that
        # no operations in the first MaxResults operations matched the specified criteria but that subsequent
        # groups of MaxResults operations do contain operations that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Summary information about the operations that match the specified criteria.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::OperationSummary)?

        def initialize(
          @next_token : String? = nil,
          @operations : Array(Types::OperationSummary)? = nil
        )
        end
      end


      struct ListServicesRequest
        include JSON::Serializable

        # A complex type that contains specifications for the namespaces that you want to list services for.
        # If you specify more than one filter, an operation must match all filters to be returned by
        # ListServices .

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::ServiceFilter)?

        # The maximum number of services that you want Cloud Map to return in the response to a ListServices
        # request. If you don't specify a value for MaxResults , Cloud Map returns up to 100 services.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For the first ListServices request, omit this value. If the response contains NextToken , submit
        # another ListServices request to get the next group of results. Specify the value of NextToken from
        # the previous response in the next request. Cloud Map gets MaxResults services and then filters them
        # based on the specified criteria. It's possible that no services in the first MaxResults services
        # matched the specified criteria but that subsequent groups of MaxResults services do contain services
        # that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::ServiceFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicesResponse
        include JSON::Serializable

        # If the response contains NextToken , submit another ListServices request to get the next group of
        # results. Specify the value of NextToken from the previous response in the next request. Cloud Map
        # gets MaxResults services and then filters them based on the specified criteria. It's possible that
        # no services in the first MaxResults services matched the specified criteria but that subsequent
        # groups of MaxResults services do contain services that match the criteria.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array that contains one ServiceSummary object for each service that matches the specified filter
        # criteria.

        @[JSON::Field(key: "Services")]
        getter services : Array(Types::ServiceSummary)?

        def initialize(
          @next_token : String? = nil,
          @services : Array(Types::ServiceSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags that are assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A complex type that contains information about a specified namespace.

      struct Namespace
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date that the namespace was created, in Unix date/time format and Coordinated Universal Time
        # (UTC). The value of CreateDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time?

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running an operation twice.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The description that you specify for the namespace when you create it.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of a namespace.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the namespace, such as example.com .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A complex type that contains information that's specific to the type of the namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::NamespaceProperties?

        # The ID of the Amazon Web Services account that created the namespace. If this isn't your account ID,
        # it's the ID of the account that shared the namespace with your account. For more information about
        # shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The number of services that are associated with the namespace.

        @[JSON::Field(key: "ServiceCount")]
        getter service_count : Int32?

        # The type of the namespace. The methods for discovering instances depends on the value that you
        # specify: HTTP Instances can be discovered only programmatically, using the Cloud Map
        # DiscoverInstances API. DNS_PUBLIC Instances can be discovered using public DNS queries and using the
        # DiscoverInstances API. DNS_PRIVATE Instances can be discovered using DNS queries in VPCs and using
        # the DiscoverInstances API.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @create_date : Time? = nil,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @properties : Types::NamespaceProperties? = nil,
          @resource_owner : String? = nil,
          @service_count : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # The namespace that you're trying to create already exists.

      struct NamespaceAlreadyExists
        include JSON::Serializable

        # The CreatorRequestId that was used to create the namespace.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the existing namespace.

        @[JSON::Field(key: "NamespaceId")]
        getter namespace_id : String?

        def initialize(
          @creator_request_id : String? = nil,
          @message : String? = nil,
          @namespace_id : String? = nil
        )
        end
      end

      # A complex type that identifies the namespaces that you want to list. You can choose to list public
      # or private namespaces.

      struct NamespaceFilter
        include JSON::Serializable

        # Specify the namespaces that you want to get using one of the following. TYPE : Gets the namespaces
        # of the specified type. NAME : Gets the namespaces with the specified name. HTTP_NAME : Gets the
        # namespaces with the specified HTTP name. RESOURCE_OWNER : Gets the namespaces created by your Amazon
        # Web Services account or by other accounts. This can be used to filter for shared namespaces. For
        # more information about shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud
        # Map Developer Guide .

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specify the values that are applicable to the value that you specify for Name . TYPE : Specify HTTP
        # , DNS_PUBLIC , or DNS_PRIVATE . NAME : Specify the name of the namespace, which is found in
        # Namespace.Name . HTTP_NAME : Specify the HTTP name of the namespace, which is found in
        # Namespace.Properties.HttpProperties.HttpName . RESOURCE_OWNER : Specify one of SELF or
        # OTHER_ACCOUNTS . SELF can be used to filter namespaces created by you and OTHER_ACCOUNTS can be used
        # to filter namespaces shared with you that were created by other accounts.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # Specify the operator that you want to use to determine whether a namespace matches the specified
        # value. Valid values for Condition are one of the following. EQ : When you specify EQ for Condition ,
        # you can specify only one value. EQ is supported for TYPE , NAME , RESOURCE_OWNER and HTTP_NAME . EQ
        # is the default condition and can be omitted. BEGINS_WITH : When you specify BEGINS_WITH for
        # Condition , you can specify only one value. BEGINS_WITH is supported for TYPE , NAME , and HTTP_NAME
        # .

        @[JSON::Field(key: "Condition")]
        getter condition : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @condition : String? = nil
        )
        end
      end

      # No namespace exists with the specified ID.

      struct NamespaceNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information that's specific to the namespace type.

      struct NamespaceProperties
        include JSON::Serializable

        # A complex type that contains the ID for the Route 53 hosted zone that Cloud Map creates when you
        # create a namespace.

        @[JSON::Field(key: "DnsProperties")]
        getter dns_properties : Types::DnsProperties?

        # A complex type that contains the name of an HTTP namespace.

        @[JSON::Field(key: "HttpProperties")]
        getter http_properties : Types::HttpProperties?

        def initialize(
          @dns_properties : Types::DnsProperties? = nil,
          @http_properties : Types::HttpProperties? = nil
        )
        end
      end

      # A complex type that contains information about a namespace.

      struct NamespaceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the namespace was created.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time?

        # A description for the namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the namespace.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the namespace. When you create a namespace, Cloud Map automatically creates a Route 53
        # hosted zone that has the same name as the namespace.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The properties of the namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::NamespaceProperties?

        # The ID of the Amazon Web Services account that created the namespace. If this isn't your account ID,
        # it's the ID of the account that shared the namespace with your account. For more information about
        # shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The number of services that were created using the namespace.

        @[JSON::Field(key: "ServiceCount")]
        getter service_count : Int32?

        # The type of the namespace, either public or private.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @create_date : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @properties : Types::NamespaceProperties? = nil,
          @resource_owner : String? = nil,
          @service_count : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # A complex type that contains information about a specified operation.

      struct Operation
        include JSON::Serializable

        # The date and time that the request was submitted, in Unix date/time format and Coordinated Universal
        # Time (UTC). The value of CreateDate is accurate to milliseconds. For example, the value
        # 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time?

        # The code associated with ErrorMessage . Values for ErrorCode include the following: ACCESS_DENIED
        # CANNOT_CREATE_HOSTED_ZONE EXPIRED_TOKEN HOSTED_ZONE_NOT_FOUND INTERNAL_FAILURE INVALID_CHANGE_BATCH
        # THROTTLED_REQUEST

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # If the value of Status is FAIL , the reason that the operation failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the operation that you want to get information about.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The ID of the Amazon Web Services account that owns the namespace associated with the operation.

        @[JSON::Field(key: "OwnerAccount")]
        getter owner_account : String?

        # The status of the operation. Values include the following: SUBMITTED This is the initial state that
        # occurs immediately after you submit a request. PENDING Cloud Map is performing the operation.
        # SUCCESS The operation succeeded. FAIL The operation failed. For the failure reason, see ErrorMessage
        # .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the target entity that's associated with the operation: NAMESPACE The namespace ID is
        # returned in the ResourceId property. SERVICE The service ID is returned in the ResourceId property.
        # INSTANCE The instance ID is returned in the ResourceId property.

        @[JSON::Field(key: "Targets")]
        getter targets : Hash(String, String)?

        # The name of the operation that's associated with the specified ID.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date and time that the value of Status changed to the current value, in Unix date/time format
        # and Coordinated Universal Time (UTC). The value of UpdateDate is accurate to milliseconds. For
        # example, the value 1516925490.087 represents Friday, January 26, 2018 12:11:30.087 AM.

        @[JSON::Field(key: "UpdateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter update_date : Time?

        def initialize(
          @create_date : Time? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @owner_account : String? = nil,
          @status : String? = nil,
          @targets : Hash(String, String)? = nil,
          @type : String? = nil,
          @update_date : Time? = nil
        )
        end
      end

      # A complex type that lets you select the operations that you want to list.

      struct OperationFilter
        include JSON::Serializable

        # Specify the operations that you want to get: NAMESPACE_ID : Gets operations related to specified
        # namespaces. SERVICE_ID : Gets operations related to specified services. STATUS : Gets operations
        # based on the status of the operations: SUBMITTED , PENDING , SUCCEED , or FAIL . TYPE : Gets
        # specified types of operation. UPDATE_DATE : Gets operations that changed status during a specified
        # date/time range.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specify values that are applicable to the value that you specify for Name : NAMESPACE_ID : Specify
        # one namespace ID. SERVICE_ID : Specify one service ID. STATUS : Specify one or more statuses:
        # SUBMITTED , PENDING , SUCCEED , or FAIL . TYPE : Specify one or more of the following types:
        # CREATE_NAMESPACE , DELETE_NAMESPACE , UPDATE_SERVICE , REGISTER_INSTANCE , or DEREGISTER_INSTANCE .
        # UPDATE_DATE : Specify a start date and an end date in Unix date/time format and Coordinated
        # Universal Time (UTC). The start date must be the first value.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The operator that you want to use to determine whether an operation matches the specified value.
        # Valid values for condition include: EQ : When you specify EQ for the condition, you can specify only
        # one value. EQ is supported for NAMESPACE_ID , SERVICE_ID , STATUS , and TYPE . EQ is the default
        # condition and can be omitted. IN : When you specify IN for the condition, you can specify a list of
        # one or more values. IN is supported for STATUS and TYPE . An operation must match one of the
        # specified values to be returned in the response. BETWEEN : Specify a start date and an end date in
        # Unix date/time format and Coordinated Universal Time (UTC). The start date must be the first value.
        # BETWEEN is supported for UPDATE_DATE .

        @[JSON::Field(key: "Condition")]
        getter condition : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @condition : String? = nil
        )
        end
      end

      # No operation exists with the specified ID.

      struct OperationNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about an operation that matches the criteria that you
      # specified in a ListOperations request.

      struct OperationSummary
        include JSON::Serializable

        # The ID for an operation.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The status of the operation. Values include the following: SUBMITTED : This is the initial state
        # immediately after you submit a request. PENDING : Cloud Map is performing the operation. SUCCESS :
        # The operation succeeded. FAIL : The operation failed. For the failure reason, see ErrorMessage .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Updated properties for the private DNS namespace.

      struct PrivateDnsNamespaceChange
        include JSON::Serializable

        # An updated description for the private DNS namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Properties to be updated in the private DNS namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::PrivateDnsNamespacePropertiesChange?

        def initialize(
          @description : String? = nil,
          @properties : Types::PrivateDnsNamespacePropertiesChange? = nil
        )
        end
      end

      # DNS properties for the private DNS namespace.

      struct PrivateDnsNamespaceProperties
        include JSON::Serializable

        # DNS properties for the private DNS namespace.

        @[JSON::Field(key: "DnsProperties")]
        getter dns_properties : Types::PrivateDnsPropertiesMutable

        def initialize(
          @dns_properties : Types::PrivateDnsPropertiesMutable
        )
        end
      end

      # Updated properties for the private DNS namespace.

      struct PrivateDnsNamespacePropertiesChange
        include JSON::Serializable

        # Updated DNS properties for the private DNS namespace.

        @[JSON::Field(key: "DnsProperties")]
        getter dns_properties : Types::PrivateDnsPropertiesMutableChange

        def initialize(
          @dns_properties : Types::PrivateDnsPropertiesMutableChange
        )
        end
      end

      # DNS properties for the private DNS namespace.

      struct PrivateDnsPropertiesMutable
        include JSON::Serializable

        # Fields for the Start of Authority (SOA) record for the hosted zone for the private DNS namespace.

        @[JSON::Field(key: "SOA")]
        getter soa : Types::SOA

        def initialize(
          @soa : Types::SOA
        )
        end
      end

      # Updated DNS properties for the private DNS namespace.

      struct PrivateDnsPropertiesMutableChange
        include JSON::Serializable

        # Updated fields for the Start of Authority (SOA) record for the hosted zone for the private DNS
        # namespace.

        @[JSON::Field(key: "SOA")]
        getter soa : Types::SOAChange

        def initialize(
          @soa : Types::SOAChange
        )
        end
      end

      # Updated properties for the public DNS namespace.

      struct PublicDnsNamespaceChange
        include JSON::Serializable

        # An updated description for the public DNS namespace.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Properties to be updated in the public DNS namespace.

        @[JSON::Field(key: "Properties")]
        getter properties : Types::PublicDnsNamespacePropertiesChange?

        def initialize(
          @description : String? = nil,
          @properties : Types::PublicDnsNamespacePropertiesChange? = nil
        )
        end
      end

      # DNS properties for the public DNS namespace.

      struct PublicDnsNamespaceProperties
        include JSON::Serializable

        # DNS properties for the public DNS namespace.

        @[JSON::Field(key: "DnsProperties")]
        getter dns_properties : Types::PublicDnsPropertiesMutable

        def initialize(
          @dns_properties : Types::PublicDnsPropertiesMutable
        )
        end
      end

      # Updated properties for the public DNS namespace.

      struct PublicDnsNamespacePropertiesChange
        include JSON::Serializable

        # Updated DNS properties for the hosted zone for the public DNS namespace.

        @[JSON::Field(key: "DnsProperties")]
        getter dns_properties : Types::PublicDnsPropertiesMutableChange

        def initialize(
          @dns_properties : Types::PublicDnsPropertiesMutableChange
        )
        end
      end

      # DNS properties for the public DNS namespace.

      struct PublicDnsPropertiesMutable
        include JSON::Serializable

        # Start of Authority (SOA) record for the hosted zone for the public DNS namespace.

        @[JSON::Field(key: "SOA")]
        getter soa : Types::SOA

        def initialize(
          @soa : Types::SOA
        )
        end
      end

      # Updated DNS properties for the public DNS namespace.

      struct PublicDnsPropertiesMutableChange
        include JSON::Serializable

        # Updated fields for the Start of Authority (SOA) record for the hosted zone for the public DNS
        # namespace.

        @[JSON::Field(key: "SOA")]
        getter soa : Types::SOAChange

        def initialize(
          @soa : Types::SOAChange
        )
        end
      end


      struct RegisterInstanceRequest
        include JSON::Serializable

        # A string map that contains the following information for the service that you specify in ServiceId :
        # The attributes that apply to the records that are defined in the service. For each attribute, the
        # applicable value. Do not include sensitive information in the attributes if the namespace is
        # discoverable by public DNS queries. The following are the supported attribute keys.
        # AWS_ALIAS_DNS_NAME If you want Cloud Map to create an Amazon Route 53 alias record that routes
        # traffic to an Elastic Load Balancing load balancer, specify the DNS name that's associated with the
        # load balancer. For information about how to get the DNS name, see "DNSName" in the topic AliasTarget
        # in the Route 53 API Reference . Note the following: The configuration for the service that's
        # specified by ServiceId must include settings for an A record, an AAAA record, or both. In the
        # service that's specified by ServiceId , the value of RoutingPolicy must be WEIGHTED . If the service
        # that's specified by ServiceId includes HealthCheckConfig settings, Cloud Map will create the Route
        # 53 health check, but it doesn't associate the health check with the alias record. Cloud Map
        # currently doesn't support creating alias records that route traffic to Amazon Web Services resources
        # other than Elastic Load Balancing load balancers. If you specify a value for AWS_ALIAS_DNS_NAME ,
        # don't specify values for any of the AWS_INSTANCE attributes. The AWS_ALIAS_DNS_NAME is not supported
        # in the GovCloud (US) Regions. AWS_EC2_INSTANCE_ID HTTP namespaces only. The Amazon EC2 instance ID
        # for the instance. If the AWS_EC2_INSTANCE_ID attribute is specified, then the only other attribute
        # that can be specified is AWS_INIT_HEALTH_STATUS . When the AWS_EC2_INSTANCE_ID attribute is
        # specified, then the AWS_INSTANCE_IPV4 attribute will be filled out with the primary private IPv4
        # address. AWS_INIT_HEALTH_STATUS If the service configuration includes HealthCheckCustomConfig , you
        # can optionally use AWS_INIT_HEALTH_STATUS to specify the initial status of the custom health check,
        # HEALTHY or UNHEALTHY . If you don't specify a value for AWS_INIT_HEALTH_STATUS , the initial status
        # is HEALTHY . AWS_INSTANCE_CNAME If the service configuration includes a CNAME record, the domain
        # name that you want Route 53 to return in response to DNS queries (for example, example.com ). This
        # value is required if the service specified by ServiceId includes settings for an CNAME record.
        # AWS_INSTANCE_IPV4 If the service configuration includes an A record, the IPv4 address that you want
        # Route 53 to return in response to DNS queries (for example, 192.0.2.44 ). This value is required if
        # the service specified by ServiceId includes settings for an A record. If the service includes
        # settings for an SRV record, you must specify a value for AWS_INSTANCE_IPV4 , AWS_INSTANCE_IPV6 , or
        # both. AWS_INSTANCE_IPV6 If the service configuration includes an AAAA record, the IPv6 address that
        # you want Route 53 to return in response to DNS queries (for example,
        # 2001:0db8:85a3:0000:0000:abcd:0001:2345 ). This value is required if the service specified by
        # ServiceId includes settings for an AAAA record. If the service includes settings for an SRV record,
        # you must specify a value for AWS_INSTANCE_IPV4 , AWS_INSTANCE_IPV6 , or both. AWS_INSTANCE_PORT If
        # the service includes an SRV record, the value that you want Route 53 to return for the port. If the
        # service includes HealthCheckConfig , the port on the endpoint that you want Route 53 to send
        # requests to. This value is required if you specified settings for an SRV record or a Route 53 health
        # check when you created the service. Custom attributes You can add up to 30 custom attributes. For
        # each key-value pair, the maximum length of the attribute name is 255 characters, and the maximum
        # length of the attribute value is 1,024 characters. The total size of all provided attributes (sum of
        # all keys and values) must not exceed 5,000 characters.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # An identifier that you want to associate with the instance. Note the following: If the service
        # that's specified by ServiceId includes settings for an SRV record, the value of InstanceId is
        # automatically included as part of the value for the SRV record. For more information, see DnsRecord
        # &gt; Type . You can use this value to update an existing instance. To register a new instance, you
        # must specify a value that's unique among instances that you register by using the same service. If
        # you specify an existing InstanceId and ServiceId , Cloud Map updates the existing DNS records, if
        # any. If there's also an existing health check, Cloud Map deletes the old health check and creates a
        # new one. The health check isn't deleted immediately, so it will still appear for a while if you
        # submit a ListHealthChecks request, for example. Do not include sensitive information in InstanceId
        # if the namespace is discoverable by public DNS queries and any Type member of DnsRecord for the
        # service contains SRV because the InstanceId is discoverable by public DNS queries.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The ID or Amazon Resource Name (ARN) of the service that you want to use for settings for the
        # instance. For services created in a shared namespace, specify the service ARN. For more information
        # about shared namespaces, see Cross-account Cloud Map namespace sharing in the Cloud Map Developer
        # Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        # A unique string that identifies the request and that allows failed RegisterInstance requests to be
        # retried without the risk of executing the operation twice. You must use a unique CreatorRequestId
        # string every time you submit a RegisterInstance request if you're registering additional instances
        # for the same namespace and service. CreatorRequestId can be any unique string (for example, a
        # date/time stamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        def initialize(
          @attributes : Hash(String, String),
          @instance_id : String,
          @service_id : String,
          @creator_request_id : String? = nil
        )
        end
      end


      struct RegisterInstanceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end

      # The operation can't be completed because you've reached the quota for the number of requests. For
      # more information, see Cloud Map API request throttling quota in the Cloud Map Developer Guide .

      struct RequestLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource can't be deleted because it contains other resources. For example, you can't
      # delete a service that contains any instances.

      struct ResourceInUse
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource can't be created because you've reached the quota on the number of resources.

      struct ResourceLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation can't be completed because the resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Start of Authority (SOA) properties for a public or private DNS namespace.

      struct SOA
        include JSON::Serializable

        # The time to live (TTL) for purposes of negative caching.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        def initialize(
          @ttl : Int64
        )
        end
      end

      # Updated Start of Authority (SOA) properties for a public or private DNS namespace.

      struct SOAChange
        include JSON::Serializable

        # The updated time to live (TTL) for purposes of negative caching.

        @[JSON::Field(key: "TTL")]
        getter ttl : Int64

        def initialize(
          @ttl : Int64
        )
        end
      end

      # A complex type that contains information about the specified service.

      struct Service
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the service was created, in Unix format and Coordinated Universal Time (UTC).
        # The value of CreateDate is accurate to milliseconds. For example, the value 1516925490.087
        # represents Friday, January 26, 2018 12:11:30.087 AM.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time?

        # The ID of the Amazon Web Services account that created the service. If this isn't your account ID,
        # it is the ID of account of the namespace owner or of another account with which the namespace has
        # been shared. For more information about shared namespaces, see Cross-account Cloud Map namespace
        # sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "CreatedByAccount")]
        getter created_by_account : String?

        # A unique string that identifies the request and that allows failed requests to be retried without
        # the risk of running the operation twice. CreatorRequestId can be any unique string (for example, a
        # date/timestamp).

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?

        # The description of the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A complex type that contains information about the Route 53 DNS records that you want Cloud Map to
        # create when you register an instance. The record types of a service can only be changed by deleting
        # the service and recreating it with a new Dnsconfig .

        @[JSON::Field(key: "DnsConfig")]
        getter dns_config : Types::DnsConfig?

        # Public DNS and HTTP namespaces only. A complex type that contains settings for an optional health
        # check. If you specify settings for a health check, Cloud Map associates the health check with the
        # records that you specify in DnsConfig . For information about the charges for health checks, see
        # Amazon Route 53 Pricing .

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig?

        # A complex type that contains information about an optional custom health check. If you specify a
        # health check configuration, you can specify either HealthCheckCustomConfig or HealthCheckConfig but
        # not both.

        @[JSON::Field(key: "HealthCheckCustomConfig")]
        getter health_check_custom_config : Types::HealthCheckCustomConfig?

        # The ID that Cloud Map assigned to the service when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of instances that are currently associated with the service. Instances that were
        # previously associated with the service but that are deleted aren't included in the count. The count
        # might not reflect pending registrations and deregistrations.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the namespace that was used to create the service.

        @[JSON::Field(key: "NamespaceId")]
        getter namespace_id : String?

        # The ID of the Amazon Web Services account that created the namespace with which the service is
        # associated. If this isn't your account ID, it is the ID of the account that shared the namespace
        # with your account. For more information about shared namespaces, see Cross-account Cloud Map
        # namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # Describes the systems that can be used to discover the service instances. DNS_HTTP The service
        # instances can be discovered using either DNS queries or the DiscoverInstances API operation. HTTP
        # The service instances can only be discovered using the DiscoverInstances API operation. DNS
        # Reserved.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @create_date : Time? = nil,
          @created_by_account : String? = nil,
          @creator_request_id : String? = nil,
          @description : String? = nil,
          @dns_config : Types::DnsConfig? = nil,
          @health_check_config : Types::HealthCheckConfig? = nil,
          @health_check_custom_config : Types::HealthCheckCustomConfig? = nil,
          @id : String? = nil,
          @instance_count : Int32? = nil,
          @name : String? = nil,
          @namespace_id : String? = nil,
          @resource_owner : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The service can't be created because a service with the same name already exists.

      struct ServiceAlreadyExists
        include JSON::Serializable

        # The CreatorRequestId that was used to create the service.

        @[JSON::Field(key: "CreatorRequestId")]
        getter creator_request_id : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the existing service.

        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        # The ID of the existing service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        def initialize(
          @creator_request_id : String? = nil,
          @message : String? = nil,
          @service_arn : String? = nil,
          @service_id : String? = nil
        )
        end
      end

      # A complex type that contains information about attributes associated with a specific service.

      struct ServiceAttributes
        include JSON::Serializable

        # A string map that contains the following information for the service that you specify in ServiceArn
        # : The attributes that apply to the service. For each attribute, the applicable value. You can
        # specify a total of 30 attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)?

        # The ID of the Amazon Web Services account that created the namespace with which the service is
        # associated. If this isn't your account ID, it is the ID of the account that shared the namespace
        # with your account. For more information about shared namespaces, see Cross-account Cloud Map
        # namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # The ARN of the service that the attributes are associated with.

        @[JSON::Field(key: "ServiceArn")]
        getter service_arn : String?

        def initialize(
          @attributes : Hash(String, String)? = nil,
          @resource_owner : String? = nil,
          @service_arn : String? = nil
        )
        end
      end

      # The attribute can't be added to the service because you've exceeded the quota for the number of
      # attributes you can add to a service.

      struct ServiceAttributesLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains changes to an existing service.

      struct ServiceChange
        include JSON::Serializable

        # A description for the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the Route 53 DNS records that you want Cloud Map to create when you register an
        # instance.

        @[JSON::Field(key: "DnsConfig")]
        getter dns_config : Types::DnsConfigChange?

        # Public DNS and HTTP namespaces only. Settings for an optional health check. If you specify settings
        # for a health check, Cloud Map associates the health check with the records that you specify in
        # DnsConfig .

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig?

        def initialize(
          @description : String? = nil,
          @dns_config : Types::DnsConfigChange? = nil,
          @health_check_config : Types::HealthCheckConfig? = nil
        )
        end
      end

      # A complex type that lets you specify the namespaces that you want to list services for.

      struct ServiceFilter
        include JSON::Serializable

        # Specify the services that you want to get using one of the following. NAMESPACE_ID : Gets the
        # services associated with the specified namespace. RESOURCE_OWNER : Gets the services associated with
        # the namespaces created by your Amazon Web Services account or by other accounts. This can be used to
        # filter for services created in a shared namespace. For more information about shared namespaces, see
        # Cross-account Cloud Map namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The values that are applicable to the value that you specify for Condition to filter the list of
        # services. NAMESPACE_ID : Specify one namespace ID or ARN. Specify the namespace ARN for namespaces
        # that are shared with your Amazon Web Services account. RESOURCE_OWNER : Specify one of SELF or
        # OTHER_ACCOUNTS . SELF can be used to filter services associated with namespaces created by you and
        # OTHER_ACCOUNTS can be used to filter services associated with namespaces that were shared with you.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        # The operator that you want to use to determine whether a service is returned by ListServices . Valid
        # values for Condition include the following: EQ : When you specify EQ , specify one value. EQ is the
        # default condition and can be omitted.

        @[JSON::Field(key: "Condition")]
        getter condition : String?

        def initialize(
          @name : String,
          @values : Array(String),
          @condition : String? = nil
        )
        end
      end

      # No service exists with the specified ID.

      struct ServiceNotFound
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A complex type that contains information about a specified service.

      struct ServiceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the service was created.

        @[JSON::Field(key: "CreateDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_date : Time?

        # The ID of the Amazon Web Services account that created the service. If this isn't your account ID,
        # it is the account ID of the namespace owner or of another account with which the namespace has been
        # shared. For more information about shared namespaces, see Cross-account Cloud Map namespace sharing
        # in the Cloud Map Developer Guide .

        @[JSON::Field(key: "CreatedByAccount")]
        getter created_by_account : String?

        # The description that you specify when you create the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Information about the Route 53 DNS records that you want Cloud Map to create when you register an
        # instance.

        @[JSON::Field(key: "DnsConfig")]
        getter dns_config : Types::DnsConfig?

        # Public DNS and HTTP namespaces only. Settings for an optional health check. If you specify settings
        # for a health check, Cloud Map associates the health check with the records that you specify in
        # DnsConfig .

        @[JSON::Field(key: "HealthCheckConfig")]
        getter health_check_config : Types::HealthCheckConfig?

        # Information about an optional custom health check. A custom health check, which requires that you
        # use a third-party health checker to evaluate the health of your resources, is useful in the
        # following circumstances: You can't use a health check that's defined by HealthCheckConfig because
        # the resource isn't available over the internet. For example, you can use a custom health check when
        # the instance is in an Amazon VPC. (To check the health of resources in a VPC, the health checker
        # must also be in the VPC.) You want to use a third-party health checker regardless of where your
        # resources are located. If you specify a health check configuration, you can specify either
        # HealthCheckCustomConfig or HealthCheckConfig but not both.

        @[JSON::Field(key: "HealthCheckCustomConfig")]
        getter health_check_custom_config : Types::HealthCheckCustomConfig?

        # The ID that Cloud Map assigned to the service when you created it.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of instances that are currently associated with the service. Instances that were
        # previously associated with the service but that are deleted aren't included in the count. The count
        # might not reflect pending registrations and deregistrations.

        @[JSON::Field(key: "InstanceCount")]
        getter instance_count : Int32?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ID of the Amazon Web Services account that created the namespace with which the service is
        # associated. If this isn't your account ID, it is the ID of the account that shared the namespace
        # with your account. For more information about shared namespaces, see Cross-account Cloud Map
        # namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ResourceOwner")]
        getter resource_owner : String?

        # Describes the systems that can be used to discover the service instances. DNS_HTTP The service
        # instances can be discovered using either DNS queries or the DiscoverInstances API operation. HTTP
        # The service instances can only be discovered using the DiscoverInstances API operation. DNS
        # Reserved.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @create_date : Time? = nil,
          @created_by_account : String? = nil,
          @description : String? = nil,
          @dns_config : Types::DnsConfig? = nil,
          @health_check_config : Types::HealthCheckConfig? = nil,
          @health_check_custom_config : Types::HealthCheckCustomConfig? = nil,
          @id : String? = nil,
          @instance_count : Int32? = nil,
          @name : String? = nil,
          @resource_owner : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A custom key-value pair that's associated with a resource.

      struct Tag
        include JSON::Serializable

        # The key identifier, or name, of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The string value that's associated with the key of the tag. You can set the value of a tag to an
        # empty string, but you can't set the value of a tag to null.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tags to add to the specified resource. Specifying the tag key is required. You can set the value
        # of a tag to an empty string, but you can't set the value of a tag to null.

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

      # The list of tags on the resource is over the quota. The maximum number of tags that can be applied
      # to a resource is 50.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the resource.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag keys to remove from the specified resource.

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


      struct UpdateHttpNamespaceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the namespace that you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Updated properties for the the HTTP namespace.

        @[JSON::Field(key: "Namespace")]
        getter namespace : Types::HttpNamespaceChange

        # A unique string that identifies the request and that allows failed UpdateHttpNamespace requests to
        # be retried without the risk of running the operation twice. UpdaterRequestId can be any unique
        # string (for example, a date/timestamp).

        @[JSON::Field(key: "UpdaterRequestId")]
        getter updater_request_id : String?

        def initialize(
          @id : String,
          @namespace : Types::HttpNamespaceChange,
          @updater_request_id : String? = nil
        )
        end
      end


      struct UpdateHttpNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct UpdateInstanceCustomHealthStatusRequest
        include JSON::Serializable

        # The ID of the instance that you want to change the health status for.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The ID or Amazon Resource Name (ARN) of the service that includes the configuration for the custom
        # health check that you want to change the status for. For services created in a shared namespace,
        # specify the service ARN. For more information about shared namespaces, see Cross-account Cloud Map
        # namespace sharing in the Cloud Map Developer Guide .

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        # The new status of the instance, HEALTHY or UNHEALTHY .

        @[JSON::Field(key: "Status")]
        getter status : String

        def initialize(
          @instance_id : String,
          @service_id : String,
          @status : String
        )
        end
      end


      struct UpdatePrivateDnsNamespaceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the namespace that you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Updated properties for the private DNS namespace.

        @[JSON::Field(key: "Namespace")]
        getter namespace : Types::PrivateDnsNamespaceChange

        # A unique string that identifies the request and that allows failed UpdatePrivateDnsNamespace
        # requests to be retried without the risk of running the operation twice. UpdaterRequestId can be any
        # unique string (for example, a date/timestamp).

        @[JSON::Field(key: "UpdaterRequestId")]
        getter updater_request_id : String?

        def initialize(
          @id : String,
          @namespace : Types::PrivateDnsNamespaceChange,
          @updater_request_id : String? = nil
        )
        end
      end


      struct UpdatePrivateDnsNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct UpdatePublicDnsNamespaceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the namespace being updated.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Updated properties for the public DNS namespace.

        @[JSON::Field(key: "Namespace")]
        getter namespace : Types::PublicDnsNamespaceChange

        # A unique string that identifies the request and that allows failed UpdatePublicDnsNamespace requests
        # to be retried without the risk of running the operation twice. UpdaterRequestId can be any unique
        # string (for example, a date/timestamp).

        @[JSON::Field(key: "UpdaterRequestId")]
        getter updater_request_id : String?

        def initialize(
          @id : String,
          @namespace : Types::PublicDnsNamespaceChange,
          @updater_request_id : String? = nil
        )
        end
      end


      struct UpdatePublicDnsNamespaceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end


      struct UpdateServiceAttributesRequest
        include JSON::Serializable

        # A string map that contains attribute key-value pairs.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, String)

        # The ID or Amazon Resource Name (ARN) of the service that you want to update. For services created in
        # a namespace shared with your Amazon Web Services account, specify the service ARN.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String

        def initialize(
          @attributes : Hash(String, String),
          @service_id : String
        )
        end
      end


      struct UpdateServiceAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateServiceRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the service that you want to update. If the namespace
        # associated with the service is shared with your Amazon Web Services account, specify the service
        # ARN. For more information about shared namespaces, see Cross-account Cloud Map namespace sharing in
        # the Cloud Map Developer Guide

        @[JSON::Field(key: "Id")]
        getter id : String

        # A complex type that contains the new settings for the service. You can specify a maximum of 30
        # attributes (key-value pairs).

        @[JSON::Field(key: "Service")]
        getter service : Types::ServiceChange

        def initialize(
          @id : String,
          @service : Types::ServiceChange
        )
        end
      end


      struct UpdateServiceResponse
        include JSON::Serializable

        # A value that you can use to determine whether the request completed successfully. To get the status
        # of the operation, see GetOperation .

        @[JSON::Field(key: "OperationId")]
        getter operation_id : String?

        def initialize(
          @operation_id : String? = nil
        )
        end
      end
    end
  end
end
