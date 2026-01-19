module AwsSdk
  module MarketplaceMetering
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

      # The CustomerIdentifier parameter is scheduled for deprecation on March 31, 2026. Use
      # CustomerAWSAccountID instead. These parameters are mutually exclusive. You can't specify both
      # CustomerIdentifier and CustomerAWSAccountID in the same request. To post metering records for
      # customers, SaaS applications call BatchMeterUsage , which is used for metering SaaS flexible
      # consumption pricing (FCP). Identical requests are idempotent and can be retried with the same
      # records or a subset of records. Each BatchMeterUsage request is for only one product. If you want to
      # meter usage for multiple products, you must make multiple BatchMeterUsage calls. Usage records
      # should be submitted in quick succession following a recorded event. Usage records aren't accepted 6
      # hours or more after an event. BatchMeterUsage can process up to 25 UsageRecords at a time, and each
      # request must be less than 1 MB in size. Optionally, you can have multiple usage allocations for
      # usage data that's split into buckets according to predefined tags. BatchMeterUsage returns a list of
      # UsageRecordResult objects, which have each UsageRecord . It also returns a list of
      # UnprocessedRecords , which indicate errors on the service side that should be retried. For Amazon
      # Web Services Regions that support BatchMeterUsage , see BatchMeterUsage Region support . For an
      # example of BatchMeterUsage , see BatchMeterUsage code example in the Amazon Web Services Marketplace
      # Seller Guide .
      def batch_meter_usage(
        product_code : String,
        usage_records : Array(Types::UsageRecord)
      ) : Types::BatchMeterUsageResult
        input = Types::BatchMeterUsageRequest.new(product_code: product_code, usage_records: usage_records)
        batch_meter_usage(input)
      end
      def batch_meter_usage(input : Types::BatchMeterUsageRequest) : Types::BatchMeterUsageResult
        request = Protocol::JsonRpc.build_request(Model::BATCH_METER_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchMeterUsageResult, "BatchMeterUsage")
      end

      # API to emit metering records. For identical requests, the API is idempotent and returns the metering
      # record ID. This is used for metering flexible consumption pricing (FCP) Amazon Machine Images (AMI)
      # and container products. MeterUsage is authenticated on the buyer's Amazon Web Services account using
      # credentials from the Amazon EC2 instance, Amazon ECS task, or Amazon EKS pod. MeterUsage can
      # optionally include multiple usage allocations, to provide customers with usage data split into
      # buckets by tags that you define (or allow the customer to define). Submit usage records to report
      # events from the previous hour. If you submit records that are greater than six hours after events
      # occur, the records won’t be accepted. The timestamp in your request determines when an event is
      # recorded. You can only report usage once per hour for each dimension. For AMI-based products, this
      # is per dimension and per EC2 instance. For container products, this is per dimension and per ECS
      # task or EKS pod. You can’t modify values after they’re recorded. If you report usage before the
      # current hour ends, you will be unable to report additional usage until the next hour begins. For
      # Amazon Web Services Regions that support MeterUsage , see MeterUsage Region support for Amazon EC2
      # and MeterUsage Region support for Amazon ECS and Amazon EKS .
      def meter_usage(
        product_code : String,
        timestamp : Time,
        usage_dimension : String,
        client_token : String? = nil,
        dry_run : Bool? = nil,
        usage_allocations : Array(Types::UsageAllocation)? = nil,
        usage_quantity : Int32? = nil
      ) : Types::MeterUsageResult
        input = Types::MeterUsageRequest.new(product_code: product_code, timestamp: timestamp, usage_dimension: usage_dimension, client_token: client_token, dry_run: dry_run, usage_allocations: usage_allocations, usage_quantity: usage_quantity)
        meter_usage(input)
      end
      def meter_usage(input : Types::MeterUsageRequest) : Types::MeterUsageResult
        request = Protocol::JsonRpc.build_request(Model::METER_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MeterUsageResult, "MeterUsage")
      end

      # Paid container software products sold through Amazon Web Services Marketplace must integrate with
      # the Amazon Web Services Marketplace Metering Service and call the RegisterUsage operation for
      # software entitlement and metering. Free and BYOL products for Amazon ECS or Amazon EKS aren't
      # required to call RegisterUsage , but you may choose to do so if you would like to receive usage data
      # in your seller reports. The sections below explain the behavior of RegisterUsage . RegisterUsage
      # performs two primary functions: metering and entitlement. Entitlement : RegisterUsage allows you to
      # verify that the customer running your paid software is subscribed to your product on Amazon Web
      # Services Marketplace, enabling you to guard against unauthorized use. Your container image that
      # integrates with RegisterUsage is only required to guard against unauthorized use at container
      # startup, as such a CustomerNotSubscribedException or PlatformNotSupportedException will only be
      # thrown on the initial call to RegisterUsage . Subsequent calls from the same Amazon ECS task
      # instance (e.g. task-id) or Amazon EKS pod will not throw a CustomerNotSubscribedException , even if
      # the customer unsubscribes while the Amazon ECS task or Amazon EKS pod is still running. Metering :
      # RegisterUsage meters software use per ECS task, per hour, or per pod for Amazon EKS with usage
      # prorated to the second. A minimum of 1 minute of usage applies to tasks that are short lived. For
      # example, if a customer has a 10 node Amazon ECS or Amazon EKS cluster and a service configured as a
      # Daemon Set, then Amazon ECS or Amazon EKS will launch a task on all 10 cluster nodes and the
      # customer will be charged for 10 tasks. Software metering is handled by the Amazon Web Services
      # Marketplace metering control plane—your software is not required to perform metering-specific
      # actions other than to call RegisterUsage to commence metering. The Amazon Web Services Marketplace
      # metering control plane will also bill customers for running ECS tasks and Amazon EKS pods,
      # regardless of the customer's subscription state, which removes the need for your software to run
      # entitlement checks at runtime. For containers, RegisterUsage should be called immediately at launch.
      # If you don’t register the container within the first 6 hours of the launch, Amazon Web Services
      # Marketplace Metering Service doesn’t provide any metering guarantees for previous months. Metering
      # will continue, however, for the current month forward until the container ends. RegisterUsage is for
      # metering paid hourly container products. For Amazon Web Services Regions that support RegisterUsage
      # , see RegisterUsage Region support .
      def register_usage(
        product_code : String,
        public_key_version : Int32,
        nonce : String? = nil
      ) : Types::RegisterUsageResult
        input = Types::RegisterUsageRequest.new(product_code: product_code, public_key_version: public_key_version, nonce: nonce)
        register_usage(input)
      end
      def register_usage(input : Types::RegisterUsageRequest) : Types::RegisterUsageResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_USAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterUsageResult, "RegisterUsage")
      end

      # ResolveCustomer is called by a SaaS application during the registration process. When a buyer visits
      # your website during the registration process, the buyer submits a registration token through their
      # browser. The registration token is resolved through this API to obtain a CustomerIdentifier along
      # with the CustomerAWSAccountId and ProductCode . To successfully resolve the token, the API must be
      # called from the account that was used to publish the SaaS application. For an example of using
      # ResolveCustomer , see ResolveCustomer code example in the Amazon Web Services Marketplace Seller
      # Guide . Permission is required for this operation. Your IAM role or user performing this operation
      # requires a policy to allow the aws-marketplace:ResolveCustomer action. For more information, see
      # Actions, resources, and condition keys for Amazon Web Services Marketplace Metering Service in the
      # Service Authorization Reference . For Amazon Web Services Regions that support ResolveCustomer , see
      # ResolveCustomer Region support .
      def resolve_customer(
        registration_token : String
      ) : Types::ResolveCustomerResult
        input = Types::ResolveCustomerRequest.new(registration_token: registration_token)
        resolve_customer(input)
      end
      def resolve_customer(input : Types::ResolveCustomerRequest) : Types::ResolveCustomerResult
        request = Protocol::JsonRpc.build_request(Model::RESOLVE_CUSTOMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResolveCustomerResult, "ResolveCustomer")
      end
    end
  end
end
