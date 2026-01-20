module Aws
  module CloudSearchDomain
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Retrieves a list of documents that match the specified search criteria. How you specify the search
      # criteria depends on which query parser you use. Amazon CloudSearch supports four query parsers:
      # simple : search all text and text-array fields for the specified string. Search for phrases,
      # individual terms, and prefixes. structured : search specific fields, construct compound queries
      # using Boolean operators, and use advanced features such as term boosting and proximity searching.
      # lucene : specify search criteria using the Apache Lucene query parser syntax. dismax : specify
      # search criteria using the simplified subset of the Apache Lucene query parser syntax defined by the
      # DisMax query parser. For more information, see Searching Your Data in the Amazon CloudSearch
      # Developer Guide . The endpoint for submitting Search requests is domain-specific. You submit search
      # requests to a domain's search endpoint. To get the search endpoint for your domain, use the Amazon
      # CloudSearch configuration service DescribeDomains action. A domain's endpoints are also displayed on
      # the domain dashboard in the Amazon CloudSearch console.

      def search(
        query : String,
        cursor : String? = nil,
        expr : String? = nil,
        facet : String? = nil,
        filter_query : String? = nil,
        highlight : String? = nil,
        partial : Bool? = nil,
        query_options : String? = nil,
        query_parser : String? = nil,
        return : String? = nil,
        size : Int64? = nil,
        sort : String? = nil,
        start : Int64? = nil,
        stats : String? = nil
      ) : Protocol::Request
        input = Types::SearchRequest.new(query: query, cursor: cursor, expr: expr, facet: facet, filter_query: filter_query, highlight: highlight, partial: partial, query_options: query_options, query_parser: query_parser, return: return, size: size, sort: sort, start: start, stats: stats)
        search(input)
      end

      def search(input : Types::SearchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves autocomplete suggestions for a partial query string. You can use suggestions enable you to
      # display likely matches before users finish typing. In Amazon CloudSearch, suggestions are based on
      # the contents of a particular text field. When you request suggestions, Amazon CloudSearch finds all
      # of the documents whose values in the suggester field start with the specified query string. The
      # beginning of the field must match the query string to be considered a match. For more information
      # about configuring suggesters and retrieving suggestions, see Getting Suggestions in the Amazon
      # CloudSearch Developer Guide . The endpoint for submitting Suggest requests is domain-specific. You
      # submit suggest requests to a domain's search endpoint. To get the search endpoint for your domain,
      # use the Amazon CloudSearch configuration service DescribeDomains action. A domain's endpoints are
      # also displayed on the domain dashboard in the Amazon CloudSearch console.

      def suggest(
        query : String,
        suggester : String,
        size : Int64? = nil
      ) : Protocol::Request
        input = Types::SuggestRequest.new(query: query, suggester: suggester, size: size)
        suggest(input)
      end

      def suggest(input : Types::SuggestRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUGGEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Posts a batch of documents to a search domain for indexing. A document batch is a collection of add
      # and delete operations that represent the documents you want to add, update, or delete from your
      # domain. Batches can be described in either JSON or XML. Each item that you want Amazon CloudSearch
      # to return as a search result (such as a product) is represented as a document. Every document has a
      # unique ID and one or more fields that contain the data that you want to search and return in
      # results. Individual documents cannot contain more than 1 MB of data. The entire batch cannot exceed
      # 5 MB. To get the best possible upload performance, group add and delete operations in batches that
      # are close the 5 MB limit. Submitting a large volume of single-document batches can overload a
      # domain's document service. The endpoint for submitting UploadDocuments requests is domain-specific.
      # To get the document endpoint for your domain, use the Amazon CloudSearch configuration service
      # DescribeDomains action. A domain's endpoints are also displayed on the domain dashboard in the
      # Amazon CloudSearch console. For more information about formatting your data for Amazon CloudSearch,
      # see Preparing Your Data in the Amazon CloudSearch Developer Guide . For more information about
      # uploading data for indexing, see Uploading Data in the Amazon CloudSearch Developer Guide .

      def upload_documents(
        content_type : String,
        documents : Bytes
      ) : Protocol::Request
        input = Types::UploadDocumentsRequest.new(content_type: content_type, documents: documents)
        upload_documents(input)
      end

      def upload_documents(input : Types::UploadDocumentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPLOAD_DOCUMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
