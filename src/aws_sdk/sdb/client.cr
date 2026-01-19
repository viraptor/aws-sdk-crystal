module AwsSdk
  module Sdb
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

      # Performs multiple DeleteAttributes operations in a single call, which reduces round trips and
      # latencies. This enables Amazon SimpleDB to optimize requests, which generally yields better
      # throughput. The following limitations are enforced for this operation: 1 MB request size 25 item
      # limit per BatchDeleteAttributes operation
      def batch_delete_attributes(
        domain_name : String,
        items : Array(Types::DeletableItem)
      ) : Nil
        input = Types::BatchDeleteAttributesRequest.new(domain_name: domain_name, items: items)
        batch_delete_attributes(input)
      end
      def batch_delete_attributes(input : Types::BatchDeleteAttributesRequest) : Nil
        request = Protocol::Query.build_request(Model::BATCH_DELETE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # The BatchPutAttributes operation creates or replaces attributes within one or more items. By using
      # this operation, the client can perform multiple PutAttribute operation with a single call. This
      # helps yield savings in round trips and latencies, enabling Amazon SimpleDB to optimize requests and
      # generally produce better throughput. The client may specify the item name with the Item.X.ItemName
      # parameter. The client may specify new attributes using a combination of the Item.X.Attribute.Y.Name
      # and Item.X.Attribute.Y.Value parameters. The client may specify the first attribute for the first
      # item using the parameters Item.0.Attribute.0.Name and Item.0.Attribute.0.Value , and for the second
      # attribute for the first item by the parameters Item.0.Attribute.1.Name and Item.0.Attribute.1.Value
      # , and so on. Attributes are uniquely identified within an item by their name/value combination. For
      # example, a single item can have the attributes { "first_name", "first_value" } and { "first_name",
      # "second_value" } . However, it cannot have two attribute instances where both the
      # Item.X.Attribute.Y.Name and Item.X.Attribute.Y.Value are the same. Optionally, the requester can
      # supply the Replace parameter for each individual value. Setting this value to true will cause the
      # new attribute values to replace the existing attribute values. For example, if an item I has the
      # attributes { 'a', '1' }, { 'b', '2'} and { 'b', '3' } and the requester does a BatchPutAttributes of
      # {'I', 'b', '4' } with the Replace parameter set to true, the final attributes of the item will be {
      # 'a', '1' } and { 'b', '4' } , replacing the previous values of the 'b' attribute with the new value.
      # This operation is vulnerable to exceeding the maximum URL size when making a REST request using the
      # HTTP GET method. This operation does not support conditions using Expected.X.Name , Expected.X.Value
      # , or Expected.X.Exists . You can execute multiple BatchPutAttributes operations and other operations
      # in parallel. However, large numbers of concurrent BatchPutAttributes calls can result in Service
      # Unavailable (503) responses. The following limitations are enforced for this operation: 256
      # attribute name-value pairs per item 1 MB request size 1 billion attributes per domain 10 GB of total
      # user data storage per domain 25 item limit per BatchPutAttributes operation
      def batch_put_attributes(
        domain_name : String,
        items : Array(Types::ReplaceableItem)
      ) : Nil
        input = Types::BatchPutAttributesRequest.new(domain_name: domain_name, items: items)
        batch_put_attributes(input)
      end
      def batch_put_attributes(input : Types::BatchPutAttributesRequest) : Nil
        request = Protocol::Query.build_request(Model::BATCH_PUT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # The CreateDomain operation creates a new domain. The domain name should be unique among the domains
      # associated with the Access Key ID provided in the request. The CreateDomain operation may take 10 or
      # more seconds to complete. The client can create up to 100 domains per account. If the client
      # requires additional domains, go to http://aws.amazon.com/contact-us/simpledb-limit-request/ .
      def create_domain(
        domain_name : String
      ) : Nil
        input = Types::CreateDomainRequest.new(domain_name: domain_name)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Nil
        request = Protocol::Query.build_request(Model::CREATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes one or more attributes associated with an item. If all attributes of the item are deleted,
      # the item is deleted. DeleteAttributes is an idempotent operation; running it multiple times on the
      # same item or attribute does not result in an error response. Because Amazon SimpleDB makes multiple
      # copies of item data and uses an eventual consistency update model, performing a GetAttributes or
      # Select operation (read) immediately after a DeleteAttributes or PutAttributes operation (write)
      # might not return updated item data.
      def delete_attributes(
        domain_name : String,
        item_name : String,
        attributes : Array(Types::Attribute)? = nil,
        expected : Types::UpdateCondition? = nil
      ) : Nil
        input = Types::DeleteAttributesRequest.new(domain_name: domain_name, item_name: item_name, attributes: attributes, expected: expected)
        delete_attributes(input)
      end
      def delete_attributes(input : Types::DeleteAttributesRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # The DeleteDomain operation deletes a domain. Any items (and their attributes) in the domain are
      # deleted as well. The DeleteDomain operation might take 10 or more seconds to complete.
      def delete_domain(
        domain_name : String
      ) : Nil
        input = Types::DeleteDomainRequest.new(domain_name: domain_name)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Nil
        request = Protocol::Query.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # Returns information about the domain, including when the domain was created, the number of items and
      # attributes in the domain, and the size of the attribute names and values.
      def domain_metadata(
        domain_name : String
      ) : Types::DomainMetadataResult
        input = Types::DomainMetadataRequest.new(domain_name: domain_name)
        domain_metadata(input)
      end
      def domain_metadata(input : Types::DomainMetadataRequest) : Types::DomainMetadataResult
        request = Protocol::Query.build_request(Model::DOMAIN_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::DomainMetadataResult, "DomainMetadata")
      end

      # Returns all of the attributes associated with the specified item. Optionally, the attributes
      # returned can be limited to one or more attributes by specifying an attribute name parameter. If the
      # item does not exist on the replica that was accessed for this operation, an empty set is returned.
      # The system does not return an error as it cannot guarantee the item does not exist on other
      # replicas.
      def get_attributes(
        domain_name : String,
        item_name : String,
        attribute_names : Array(String)? = nil,
        consistent_read : Bool? = nil
      ) : Types::GetAttributesResult
        input = Types::GetAttributesRequest.new(domain_name: domain_name, item_name: item_name, attribute_names: attribute_names, consistent_read: consistent_read)
        get_attributes(input)
      end
      def get_attributes(input : Types::GetAttributesRequest) : Types::GetAttributesResult
        request = Protocol::Query.build_request(Model::GET_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::GetAttributesResult, "GetAttributes")
      end

      # The ListDomains operation lists all domains associated with the Access Key ID. It returns domain
      # names up to the limit set by MaxNumberOfDomains . A NextToken is returned if there are more than
      # MaxNumberOfDomains domains. Calling ListDomains successive times with the NextToken provided by the
      # operation returns up to MaxNumberOfDomains more domain names with each successive operation call.
      def list_domains(
        max_number_of_domains : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDomainsResult
        input = Types::ListDomainsRequest.new(max_number_of_domains: max_number_of_domains, next_token: next_token)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Types::ListDomainsResult
        request = Protocol::Query.build_request(Model::LIST_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::ListDomainsResult, "ListDomains")
      end

      # The PutAttributes operation creates or replaces attributes in an item. The client may specify new
      # attributes using a combination of the Attribute.X.Name and Attribute.X.Value parameters. The client
      # specifies the first attribute by the parameters Attribute.0.Name and Attribute.0.Value , the second
      # attribute by the parameters Attribute.1.Name and Attribute.1.Value , and so on. Attributes are
      # uniquely identified in an item by their name/value combination. For example, a single item can have
      # the attributes { "first_name", "first_value" } and { "first_name", second_value" } . However, it
      # cannot have two attribute instances where both the Attribute.X.Name and Attribute.X.Value are the
      # same. Optionally, the requestor can supply the Replace parameter for each individual attribute.
      # Setting this value to true causes the new attribute value to replace the existing attribute
      # value(s). For example, if an item has the attributes { 'a', '1' } , { 'b', '2'} and { 'b', '3' } and
      # the requestor calls PutAttributes using the attributes { 'b', '4' } with the Replace parameter set
      # to true, the final attributes of the item are changed to { 'a', '1' } and { 'b', '4' } , which
      # replaces the previous values of the 'b' attribute with the new value. You cannot specify an empty
      # string as an attribute name. Because Amazon SimpleDB makes multiple copies of client data and uses
      # an eventual consistency update model, an immediate GetAttributes or Select operation (read)
      # immediately after a PutAttributes or DeleteAttributes operation (write) might not return the updated
      # data. The following limitations are enforced for this operation: 256 total attribute name-value
      # pairs per item One billion attributes per domain 10 GB of total user data storage per domain
      def put_attributes(
        attributes : Array(Types::ReplaceableAttribute),
        domain_name : String,
        item_name : String,
        expected : Types::UpdateCondition? = nil
      ) : Nil
        input = Types::PutAttributesRequest.new(attributes: attributes, domain_name: domain_name, item_name: item_name, expected: expected)
        put_attributes(input)
      end
      def put_attributes(input : Types::PutAttributesRequest) : Nil
        request = Protocol::Query.build_request(Model::PUT_ATTRIBUTES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        nil
      end

      # The Select operation returns a set of attributes for ItemNames that match the select expression.
      # Select is similar to the standard SQL SELECT statement. The total size of the response cannot exceed
      # 1 MB in total size. Amazon SimpleDB automatically adjusts the number of items returned per page to
      # enforce this limit. For example, if the client asks to retrieve 2500 items, but each individual item
      # is 10 kB in size, the system returns 100 items and an appropriate NextToken so the client can access
      # the next page of results. For information on how to construct select expressions, see Using Select
      # to Create Amazon SimpleDB Queries in the Developer Guide.
      def select(
        select_expression : String,
        consistent_read : Bool? = nil,
        next_token : String? = nil
      ) : Types::SelectResult
        input = Types::SelectRequest.new(select_expression: select_expression, consistent_read: consistent_read, next_token: next_token)
        select(input)
      end
      def select(input : Types::SelectRequest) : Types::SelectResult
        request = Protocol::Query.build_request(Model::SELECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::Query.parse_error(response) if response.status >= 300
        Protocol::Query.parse_response(response, Types::SelectResult, "Select")
      end
    end
  end
end
