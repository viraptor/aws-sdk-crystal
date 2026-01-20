module Aws
  module GeoPlaces
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

      # Autocomplete completes potential places and addresses as the user types, based on the partial input.
      # The API enhances the efficiency and accuracy of address by completing query based on a few entered
      # keystrokes. It helps you by completing partial queries with valid address completion. Also, the API
      # supports the filtering of results based on geographic location, country, or specific place types,
      # and can be tailored using optional parameters like language and political views. For more
      # information, see Autocomplete in the Amazon Location Service Developer Guide .

      def autocomplete(
        query_text : String,
        additional_features : Array(String)? = nil,
        bias_position : Array(Float64)? = nil,
        filter : Types::AutocompleteFilter? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        political_view : String? = nil,
        postal_code_mode : String? = nil
      ) : Protocol::Request
        input = Types::AutocompleteRequest.new(query_text: query_text, additional_features: additional_features, bias_position: bias_position, filter: filter, intended_use: intended_use, key: key, language: language, max_results: max_results, political_view: political_view, postal_code_mode: postal_code_mode)
        autocomplete(input)
      end

      def autocomplete(input : Types::AutocompleteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::AUTOCOMPLETE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Geocode converts a textual address or place into geographic coordinates. You can obtain geographic
      # coordinates, address component, and other related information. It supports flexible queries,
      # including free-form text or structured queries with components like street names, postal codes, and
      # regions. The Geocode API can also provide additional features such as time zone information and the
      # inclusion of political views. For more information, see Geocode in the Amazon Location Service
      # Developer Guide .

      def geocode(
        additional_features : Array(String)? = nil,
        bias_position : Array(Float64)? = nil,
        filter : Types::GeocodeFilter? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        political_view : String? = nil,
        query_components : Types::GeocodeQueryComponents? = nil,
        query_text : String? = nil
      ) : Protocol::Request
        input = Types::GeocodeRequest.new(additional_features: additional_features, bias_position: bias_position, filter: filter, intended_use: intended_use, key: key, language: language, max_results: max_results, political_view: political_view, query_components: query_components, query_text: query_text)
        geocode(input)
      end

      def geocode(input : Types::GeocodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GEOCODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # GetPlace finds a place by its unique ID. A PlaceId is returned by other place operations. For more
      # information, see GetPlace in the Amazon Location Service Developer Guide .

      def get_place(
        place_id : String,
        additional_features : Array(String)? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        political_view : String? = nil
      ) : Protocol::Request
        input = Types::GetPlaceRequest.new(place_id: place_id, additional_features: additional_features, intended_use: intended_use, key: key, language: language, political_view: political_view)
        get_place(input)
      end

      def get_place(input : Types::GetPlaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PLACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # ReverseGeocode converts geographic coordinates into a human-readable address or place. You can
      # obtain address component, and other related information such as place type, category, street
      # information. The Reverse Geocode API supports filtering to on place type so that you can refine
      # result based on your need. Also, The Reverse Geocode API can also provide additional features such
      # as time zone information and the inclusion of political views. For more information, see Reverse
      # Geocode in the Amazon Location Service Developer Guide .

      def reverse_geocode(
        query_position : Array(Float64),
        additional_features : Array(String)? = nil,
        filter : Types::ReverseGeocodeFilter? = nil,
        heading : Float64? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        political_view : String? = nil,
        query_radius : Int64? = nil
      ) : Protocol::Request
        input = Types::ReverseGeocodeRequest.new(query_position: query_position, additional_features: additional_features, filter: filter, heading: heading, intended_use: intended_use, key: key, language: language, max_results: max_results, political_view: political_view, query_radius: query_radius)
        reverse_geocode(input)
      end

      def reverse_geocode(input : Types::ReverseGeocodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVERSE_GEOCODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # SearchNearby queries for points of interest within a radius from a central coordinates, returning
      # place results with optional filters such as categories, business chains, food types and more. The
      # API returns details such as a place name, address, phone, category, food type, contact, opening
      # hours. Also, the API can return phonemes, time zones and more based on requested parameters. For
      # more information, see Search Nearby in the Amazon Location Service Developer Guide .

      def search_nearby(
        query_position : Array(Float64),
        additional_features : Array(String)? = nil,
        filter : Types::SearchNearbyFilter? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        political_view : String? = nil,
        query_radius : Int64? = nil
      ) : Protocol::Request
        input = Types::SearchNearbyRequest.new(query_position: query_position, additional_features: additional_features, filter: filter, intended_use: intended_use, key: key, language: language, max_results: max_results, next_token: next_token, political_view: political_view, query_radius: query_radius)
        search_nearby(input)
      end

      def search_nearby(input : Types::SearchNearbyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_NEARBY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # SearchText searches for geocode and place information. You can then complete a follow-up query
      # suggested from the Suggest API via a query id. For more information, see Search Text in the Amazon
      # Location Service Developer Guide .

      def search_text(
        additional_features : Array(String)? = nil,
        bias_position : Array(Float64)? = nil,
        filter : Types::SearchTextFilter? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        political_view : String? = nil,
        query_id : String? = nil,
        query_text : String? = nil
      ) : Protocol::Request
        input = Types::SearchTextRequest.new(additional_features: additional_features, bias_position: bias_position, filter: filter, intended_use: intended_use, key: key, language: language, max_results: max_results, next_token: next_token, political_view: political_view, query_id: query_id, query_text: query_text)
        search_text(input)
      end

      def search_text(input : Types::SearchTextRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_TEXT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Suggest provides intelligent predictions or recommendations based on the user's input or context,
      # such as relevant places, points of interest, query terms or search category. It is designed to help
      # users find places or point of interests candidates or identify a follow on query based on incomplete
      # or misspelled queries. It returns a list of possible matches or refinements that can be used to
      # formulate a more accurate query. Users can select the most appropriate suggestion and use it for
      # further searching. The API provides options for filtering results by location and other attributes,
      # and allows for additional features like phonemes and timezones. The response includes refined query
      # terms and detailed place information. For more information, see Suggest in the Amazon Location
      # Service Developer Guide .

      def suggest(
        query_text : String,
        additional_features : Array(String)? = nil,
        bias_position : Array(Float64)? = nil,
        filter : Types::SuggestFilter? = nil,
        intended_use : String? = nil,
        key : String? = nil,
        language : String? = nil,
        max_query_refinements : Int32? = nil,
        max_results : Int32? = nil,
        political_view : String? = nil
      ) : Protocol::Request
        input = Types::SuggestRequest.new(query_text: query_text, additional_features: additional_features, bias_position: bias_position, filter: filter, intended_use: intended_use, key: key, language: language, max_query_refinements: max_query_refinements, max_results: max_results, political_view: political_view)
        suggest(input)
      end

      def suggest(input : Types::SuggestRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUGGEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
