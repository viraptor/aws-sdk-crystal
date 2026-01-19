module AwsSdk
  module OAM
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates a link between a source account and a sink that you have created in a monitoring account.
      # After the link is created, data is sent from the source account to the monitoring account. When you
      # create a link, you can optionally specify filters that specify which metric namespaces and which log
      # groups are shared from the source account to the monitoring account. Before you create a link, you
      # must create a sink in the monitoring account and create a sink policy in that account. The sink
      # policy must permit the source account to link to it. You can grant permission to source accounts by
      # granting permission to an entire organization or to individual accounts. For more information, see
      # CreateSink and PutSinkPolicy . Each monitoring account can be linked to as many as 100,000 source
      # accounts. Each source account can be linked to as many as five monitoring accounts.
      def create_link(
        label_template : String,
        resource_types : Array(String),
        sink_identifier : String,
        link_configuration : Types::LinkConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLinkInput.new(label_template: label_template, resource_types: resource_types, sink_identifier: sink_identifier, link_configuration: link_configuration, tags: tags)
        create_link(input)
      end
      def create_link(input : Types::CreateLinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this to create a sink in the current account, so that it can be used as a monitoring account in
      # CloudWatch cross-account observability. A sink is a resource that represents an attachment point in
      # a monitoring account. Source accounts can link to the sink to send observability data. After you
      # create a sink, you must create a sink policy that allows source accounts to attach to it. For more
      # information, see PutSinkPolicy . Each account can contain one sink per Region. If you delete a sink,
      # you can then create a new one in that Region.
      def create_sink(
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSinkInput.new(name: name, tags: tags)
        create_sink(input)
      end
      def create_sink(input : Types::CreateSinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a link between a monitoring account sink and a source account. You must run this operation
      # in the source account.
      def delete_link(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteLinkInput.new(identifier: identifier)
        delete_link(input)
      end
      def delete_link(input : Types::DeleteLinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a sink. You must delete all links to a sink before you can delete that sink.
      def delete_sink(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteSinkInput.new(identifier: identifier)
        delete_sink(input)
      end
      def delete_sink(input : Types::DeleteSinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns complete information about one link. To use this operation, provide the link ARN. To
      # retrieve a list of link ARNs, use ListLinks .
      def get_link(
        identifier : String,
        include_tags : Bool? = nil
      ) : Protocol::Request
        input = Types::GetLinkInput.new(identifier: identifier, include_tags: include_tags)
        get_link(input)
      end
      def get_link(input : Types::GetLinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns complete information about one monitoring account sink. To use this operation, provide the
      # sink ARN. To retrieve a list of sink ARNs, use ListSinks .
      def get_sink(
        identifier : String,
        include_tags : Bool? = nil
      ) : Protocol::Request
        input = Types::GetSinkInput.new(identifier: identifier, include_tags: include_tags)
        get_sink(input)
      end
      def get_sink(input : Types::GetSinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current sink policy attached to this sink. The sink policy specifies what accounts can
      # attach to this sink as source accounts, and what types of data they can share.
      def get_sink_policy(
        sink_identifier : String
      ) : Protocol::Request
        input = Types::GetSinkPolicyInput.new(sink_identifier: sink_identifier)
        get_sink_policy(input)
      end
      def get_sink_policy(input : Types::GetSinkPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SINK_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of source account links that are linked to this monitoring account sink. To use this
      # operation, provide the sink ARN. To retrieve a list of sink ARNs, use ListSinks . To find a list of
      # links for one source account, use ListLinks .
      def list_attached_links(
        sink_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttachedLinksInput.new(sink_identifier: sink_identifier, max_results: max_results, next_token: next_token)
        list_attached_links(input)
      end
      def list_attached_links(input : Types::ListAttachedLinksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHED_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation in a source account to return a list of links to monitoring account sinks that
      # this source account has. To find a list of links for one monitoring account sink, use
      # ListAttachedLinks from within the monitoring account.
      def list_links(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLinksInput.new(max_results: max_results, next_token: next_token)
        list_links(input)
      end
      def list_links(input : Types::ListLinksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation in a monitoring account to return the list of sinks created in that account.
      def list_sinks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSinksInput.new(max_results: max_results, next_token: next_token)
        list_sinks(input)
      end
      def list_sinks(input : Types::ListSinksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with a resource. Both sinks and links support tagging.
      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the resource policy that grants permissions to source accounts to link to the
      # monitoring account sink. When you create a sink policy, you can grant permissions to all accounts in
      # an organization or to individual accounts. You can also use a sink policy to limit the types of data
      # that is shared. The six types of services with their respective resource types that you can allow or
      # deny are: Metrics - Specify with AWS::CloudWatch::Metric Log groups - Specify with
      # AWS::Logs::LogGroup Traces - Specify with AWS::XRay::Trace Application Insights - Applications -
      # Specify with AWS::ApplicationInsights::Application Internet Monitor - Specify with
      # AWS::InternetMonitor::Monitor Application Signals - Specify with AWS::ApplicationSignals::Service
      # and AWS::ApplicationSignals::ServiceLevelObjective See the examples in this section to see how to
      # specify permitted source accounts and data types.
      def put_sink_policy(
        policy : String,
        sink_identifier : String
      ) : Protocol::Request
        input = Types::PutSinkPolicyInput.new(policy: policy, sink_identifier: sink_identifier)
        put_sink_policy(input)
      end
      def put_sink_policy(input : Types::PutSinkPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SINK_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified resource. Both sinks and links can be
      # tagged. Tags can help you organize and categorize your resources. You can also use them to scope
      # user permissions by granting a user permission to access or change only resources with certain tag
      # values. Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as
      # strings of characters. You can use the TagResource action with a resource that already has tags. If
      # you specify a new tag key for the alarm, this tag is appended to the list of tags associated with
      # the alarm. If you specify a tag key that is already associated with the alarm, the new tag value
      # that you specify replaces the previous value for that tag. You can associate as many as 50 tags with
      # a resource. Unlike tagging permissions in other Amazon Web Services services, to tag or untag links
      # and sinks you must have the oam:ResourceTag permission. The iam:ResourceTag permission does not
      # allow you to tag and untag links and sinks.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified resource. Unlike tagging permissions in other Amazon Web
      # Services services, to tag or untag links and sinks you must have the oam:ResourceTag permission. The
      # iam:TagResource permission does not allow you to tag and untag links and sinks.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to change what types of data are shared from a source account to its linked
      # monitoring account sink. You can't change the sink or change the monitoring account with this
      # operation. When you update a link, you can optionally specify filters that specify which metric
      # namespaces and which log groups are shared from the source account to the monitoring account. To
      # update the list of tags associated with the sink, use TagResource .
      def update_link(
        identifier : String,
        resource_types : Array(String),
        include_tags : Bool? = nil,
        link_configuration : Types::LinkConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateLinkInput.new(identifier: identifier, resource_types: resource_types, include_tags: include_tags, link_configuration: link_configuration)
        update_link(input)
      end
      def update_link(input : Types::UpdateLinkInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
