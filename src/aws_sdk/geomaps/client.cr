module AwsSdk
  module GeoMaps
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

      # GetGlyphs returns the map's glyphs. For more information, see Style labels with glyphs in the Amazon
      # Location Service Developer Guide .

      def get_glyphs(
        font_stack : String,
        font_unicode_range : String
      ) : Protocol::Request
        input = Types::GetGlyphsRequest.new(font_stack: font_stack, font_unicode_range: font_unicode_range)
        get_glyphs(input)
      end

      def get_glyphs(input : Types::GetGlyphsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLYPHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # GetSprites returns the map's sprites. For more information, see Style iconography with sprites in
      # the Amazon Location Service Developer Guide .

      def get_sprites(
        color_scheme : String,
        file_name : String,
        style : String,
        variant : String
      ) : Protocol::Request
        input = Types::GetSpritesRequest.new(color_scheme: color_scheme, file_name: file_name, style: style, variant: variant)
        get_sprites(input)
      end

      def get_sprites(input : Types::GetSpritesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SPRITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # GetStaticMap provides high-quality static map images with customizable options. You can modify the
      # map's appearance and overlay additional information. It's an ideal solution for applications
      # requiring tailored static map snapshots. For more information, see the following topics in the
      # Amazon Location Service Developer Guide : Static maps Customize static maps Overlay on the static
      # map

      def get_static_map(
        file_name : String,
        height : Int32,
        width : Int32,
        bounded_positions : String? = nil,
        bounding_box : String? = nil,
        center : String? = nil,
        color_scheme : String? = nil,
        compact_overlay : String? = nil,
        crop_labels : Bool? = nil,
        geo_json_overlay : String? = nil,
        key : String? = nil,
        label_size : String? = nil,
        language : String? = nil,
        padding : Int32? = nil,
        points_of_interests : String? = nil,
        political_view : String? = nil,
        radius : Int64? = nil,
        scale_bar_unit : String? = nil,
        style : String? = nil,
        zoom : Float64? = nil
      ) : Protocol::Request
        input = Types::GetStaticMapRequest.new(file_name: file_name, height: height, width: width, bounded_positions: bounded_positions, bounding_box: bounding_box, center: center, color_scheme: color_scheme, compact_overlay: compact_overlay, crop_labels: crop_labels, geo_json_overlay: geo_json_overlay, key: key, label_size: label_size, language: language, padding: padding, points_of_interests: points_of_interests, political_view: political_view, radius: radius, scale_bar_unit: scale_bar_unit, style: style, zoom: zoom)
        get_static_map(input)
      end

      def get_static_map(input : Types::GetStaticMapRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STATIC_MAP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # GetStyleDescriptor returns information about the style. For more information, see Style dynamic maps
      # in the Amazon Location Service Developer Guide .

      def get_style_descriptor(
        style : String,
        color_scheme : String? = nil,
        contour_density : String? = nil,
        key : String? = nil,
        political_view : String? = nil,
        terrain : String? = nil,
        traffic : String? = nil,
        travel_modes : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetStyleDescriptorRequest.new(style: style, color_scheme: color_scheme, contour_density: contour_density, key: key, political_view: political_view, terrain: terrain, traffic: traffic, travel_modes: travel_modes)
        get_style_descriptor(input)
      end

      def get_style_descriptor(input : Types::GetStyleDescriptorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STYLE_DESCRIPTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # GetTile returns a tile. Map tiles are used by clients to render a map. they're addressed using a
      # grid arrangement with an X coordinate, Y coordinate, and Z (zoom) level. For more information, see
      # Tiles in the Amazon Location Service Developer Guide .

      def get_tile(
        tileset : String,
        x : String,
        y : String,
        z : String,
        additional_features : Array(String)? = nil,
        key : String? = nil
      ) : Protocol::Request
        input = Types::GetTileRequest.new(tileset: tileset, x: x, y: y, z: z, additional_features: additional_features, key: key)
        get_tile(input)
      end

      def get_tile(input : Types::GetTileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
