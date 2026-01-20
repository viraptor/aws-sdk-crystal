module Aws
  module KinesisVideoMedia
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

      # Use this API to retrieve media content from a Kinesis video stream. In the request, you identify the
      # stream name or stream Amazon Resource Name (ARN), and the starting chunk. Kinesis Video Streams then
      # returns a stream of chunks in order by fragment number. You must first call the GetDataEndpoint API
      # to get an endpoint. Then send the GetMedia requests to this endpoint using the --endpoint-url
      # parameter . When you put media data (fragments) on a stream, Kinesis Video Streams stores each
      # incoming fragment and related metadata in what is called a "chunk." For more information, see
      # PutMedia . The GetMedia API returns a stream of these chunks starting from the chunk that you
      # specify in the request. The following limits apply when using the GetMedia API: A client can call
      # GetMedia up to five times per second per stream. Kinesis Video Streams sends media data at a rate of
      # up to 25 megabytes per second (or 200 megabits per second) during a GetMedia session. If an error is
      # thrown after invoking a Kinesis Video Streams media API, in addition to the HTTP status code and the
      # response body, it includes the following pieces of information: x-amz-ErrorType HTTP header –
      # contains a more specific error type in addition to what the HTTP status code provides.
      # x-amz-RequestId HTTP header – if you want to report an issue to AWS, the support team can better
      # diagnose the problem if given the Request Id. Both the HTTP status code and the ErrorType header can
      # be utilized to make programmatic decisions about whether errors are retry-able and under what
      # conditions, as well as provide information on what actions the client programmer might need to take
      # in order to successfully try again. For more information, see the Errors section at the bottom of
      # this topic, as well as Common Errors .

      def get_media(
        start_selector : Types::StartSelector,
        stream_arn : String? = nil,
        stream_name : String? = nil
      ) : Protocol::Request
        input = Types::GetMediaInput.new(start_selector: start_selector, stream_arn: stream_arn, stream_name: stream_name)
        get_media(input)
      end

      def get_media(input : Types::GetMediaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
