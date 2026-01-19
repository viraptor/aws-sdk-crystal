require "json"

module AwsSdk
  module GeoMaps
    module Types

      # The request was denied because of insufficient access or permissions. Check with an administrator to
      # verify your permissions.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct GetGlyphsRequest
        include JSON::Serializable

        # Name of the FontStack to retrieve. Example: Amazon Ember Bold,Noto Sans Bold . The supported font
        # stacks are as follows: Amazon Ember Bold Amazon Ember Bold Italic Amazon Ember Bold,Noto Sans Bold
        # Amazon Ember Bold,Noto Sans Bold,Noto Sans Arabic Bold Amazon Ember Condensed RC BdItalic Amazon
        # Ember Condensed RC Bold Amazon Ember Condensed RC Bold Italic Amazon Ember Condensed RC Bold,Noto
        # Sans Bold Amazon Ember Condensed RC Bold,Noto Sans Bold,Noto Sans Arabic Condensed Bold Amazon Ember
        # Condensed RC Light Amazon Ember Condensed RC Light Italic Amazon Ember Condensed RC LtItalic Amazon
        # Ember Condensed RC Regular Amazon Ember Condensed RC Regular Italic Amazon Ember Condensed RC
        # Regular,Noto Sans Regular Amazon Ember Condensed RC Regular,Noto Sans Regular,Noto Sans Arabic
        # Condensed Regular Amazon Ember Condensed RC RgItalic Amazon Ember Condensed RC ThItalic Amazon Ember
        # Condensed RC Thin Amazon Ember Condensed RC Thin Italic Amazon Ember Heavy Amazon Ember Heavy Italic
        # Amazon Ember Light Amazon Ember Light Italic Amazon Ember Medium Amazon Ember Medium Italic Amazon
        # Ember Medium,Noto Sans Medium Amazon Ember Medium,Noto Sans Medium,Noto Sans Arabic Medium Amazon
        # Ember Regular Amazon Ember Regular Italic Amazon Ember Regular Italic,Noto Sans Italic Amazon Ember
        # Regular Italic,Noto Sans Italic,Noto Sans Arabic Regular Amazon Ember Regular,Noto Sans Regular
        # Amazon Ember Regular,Noto Sans Regular,Noto Sans Arabic Regular Amazon Ember Thin Amazon Ember Thin
        # Italic AmazonEmberCdRC_Bd AmazonEmberCdRC_BdIt AmazonEmberCdRC_Lt AmazonEmberCdRC_LtIt
        # AmazonEmberCdRC_Rg AmazonEmberCdRC_RgIt AmazonEmberCdRC_Th AmazonEmberCdRC_ThIt AmazonEmber_Bd
        # AmazonEmber_BdIt AmazonEmber_He AmazonEmber_HeIt AmazonEmber_Lt AmazonEmber_LtIt AmazonEmber_Md
        # AmazonEmber_MdIt AmazonEmber_Rg AmazonEmber_RgIt AmazonEmber_Th AmazonEmber_ThIt Noto Sans Black
        # Noto Sans Black Italic Noto Sans Bold Noto Sans Bold Italic Noto Sans Extra Bold Noto Sans Extra
        # Bold Italic Noto Sans Extra Light Noto Sans Extra Light Italic Noto Sans Italic Noto Sans Light Noto
        # Sans Light Italic Noto Sans Medium Noto Sans Medium Italic Noto Sans Regular Noto Sans Semi Bold
        # Noto Sans Semi Bold Italic Noto Sans Thin Noto Sans Thin Italic NotoSans-Bold NotoSans-Italic
        # NotoSans-Medium NotoSans-Regular Open Sans Regular,Arial Unicode MS Regular
        @[JSON::Field(key: "FontStack")]
        getter font_stack : String

        # A Unicode range of characters to download glyphs for. This must be aligned to multiples of 256.
        # Example: 0-255.pbf
        @[JSON::Field(key: "FontUnicodeRange")]
        getter font_unicode_range : String

        def initialize(
          @font_stack : String,
          @font_unicode_range : String
        )
        end
      end

      struct GetGlyphsResponse
        include JSON::Serializable

        # The Glyph, as a binary blob.
        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # Header that instructs caching configuration for the client.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Header that represents the format of the response. The response returns the following as the HTTP
        # body.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The glyph's Etag.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      struct GetSpritesRequest
        include JSON::Serializable

        # Sets color tone for map such as dark and light for specific map styles. It applies to only vector
        # map styles such as Standard and Monochrome. Example: Light Default value: Light Valid values for
        # ColorScheme are case sensitive.
        @[JSON::Field(key: "ColorScheme")]
        getter color_scheme : String

        # Sprites API: The name of the sprite ﬁle to retrieve, following pattern sprites(@2x)?\.(png|json) .
        # Example: sprites.png
        @[JSON::Field(key: "FileName")]
        getter file_name : String

        # Style specifies the desired map style for the Sprites APIs.
        @[JSON::Field(key: "Style")]
        getter style : String

        # Optimizes map styles for specific use case or industry. You can choose allowed variant only with
        # Standard map style. Example: Default Valid values for Variant are case sensitive.
        @[JSON::Field(key: "Variant")]
        getter variant : String

        def initialize(
          @color_scheme : String,
          @file_name : String,
          @style : String,
          @variant : String
        )
        end
      end

      struct GetSpritesResponse
        include JSON::Serializable

        # The body of the sprite sheet or JSON offset file (image/png or application/json, depending on
        # input).
        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # Header that instructs caching configuration for the client.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Header that represents the format of the response. The response returns the following as the HTTP
        # body.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The sprite's Etag.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      struct GetStaticMapRequest
        include JSON::Serializable

        # The map scaling parameter to size the image, icons, and labels. It follows the pattern of
        # ^map(@2x)?$ . Example: map, map@2x
        @[JSON::Field(key: "FileName")]
        getter file_name : String

        # Specifies the height of the map image.
        @[JSON::Field(key: "height")]
        getter height : Int32

        # Specifies the width of the map image.
        @[JSON::Field(key: "width")]
        getter width : Int32

        # Takes in two or more pair of coordinates in World Geodetic System (WGS 84) format: [longitude,
        # latitude], with each coordinate separated by a comma. The API will generate an image to encompass
        # all of the provided coordinates. Cannot be used with Zoom and or Radius Example:
        # 97.170451,78.039098,99.045536,27.176178
        @[JSON::Field(key: "bounded-positions")]
        getter bounded_positions : String?

        # Takes in two pairs of coordinates in World Geodetic System (WGS 84) format: [longitude, latitude],
        # denoting south-westerly and north-easterly edges of the image. The underlying area becomes the view
        # of the image. Example: -123.17075,49.26959,-123.08125,49.31429
        @[JSON::Field(key: "bounding-box")]
        getter bounding_box : String?

        # Takes in a pair of coordinates in World Geodetic System (WGS 84) format: [longitude, latitude],
        # which becomes the center point of the image. This parameter requires that either zoom or radius is
        # set. Cannot be used with Zoom and or Radius Example: 49.295,-123.108
        @[JSON::Field(key: "center")]
        getter center : String?

        # Sets color tone for map, such as dark and light for specific map styles. It only applies to vector
        # map styles, such as Standard. Example: Light Default value: Light Valid values for ColorScheme are
        # case sensitive.
        @[JSON::Field(key: "color-scheme")]
        getter color_scheme : String?

        # Takes in a string to draw geometries on the image. The input is a comma separated format as follows
        # format: [Lon, Lat] Example:
        # line:-122.407653,37.798557,-122.413291,37.802443;color=%23DD0000;width=7;outline-color=#00DD00;outline-width=5yd|point:-122.40572,37.80004;label=Fog
        # Hill Market;size=large;text-color=%23DD0000;color=#EE4B2B Currently it supports the following
        # geometry types: point, line and polygon. It does not support multiPoint , multiLine and
        # multiPolgyon.
        @[JSON::Field(key: "compact-overlay")]
        getter compact_overlay : String?

        # It is a flag that takes in true or false. It prevents the labels that are on the edge of the image
        # from being cut or obscured.
        @[JSON::Field(key: "crop-labels")]
        getter crop_labels : Bool?

        # Takes in a string to draw geometries on the image. The input is a valid GeoJSON collection object.
        # Example: {"type":"FeatureCollection","features":
        # [{"type":"Feature","geometry":{"type":"MultiPoint","coordinates":
        # [[-90.076345,51.504107],[-0.074451,51.506892]]},"properties": {"color":"#00DD00"}}]}
        @[JSON::Field(key: "geojson-overlay")]
        getter geo_json_overlay : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Overrides the label size auto-calculated by FileName . Takes in one of the values - Small or Large .
        @[JSON::Field(key: "label-size")]
        getter label_size : String?

        # Specifies the language on the map labels using the BCP 47 language tag, limited to ISO 639-1
        # two-letter language codes. If the specified language data isn't available for the map image, the
        # labels will default to the regional primary language. Supported codes: ar as az be bg bn bs ca cs cy
        # da de el en es et eu fi fo fr ga gl gn gu he hi hr hu hy id is it ja ka kk km kn ko ky lt lv mk ml
        # mr ms mt my nl no or pa pl pt ro ru sk sl sq sr sv ta te th tr uk uz vi zh
        @[JSON::Field(key: "lang")]
        getter language : String?

        # Applies additional space (in pixels) around overlay feature to prevent them from being cut or
        # obscured. Value for max and min is determined by: Min: 1 Max: min(height, width)/4 Example: 100
        @[JSON::Field(key: "padding")]
        getter padding : Int32?

        # Determines if the result image will display icons representing points of interest on the map.
        @[JSON::Field(key: "pois")]
        getter points_of_interests : String?

        # Specifies the political view, using ISO 3166-2 or ISO 3166-3 country code format. The following
        # political views are currently supported: ARG : Argentina's view on the Southern Patagonian Ice Field
        # and Tierra Del Fuego, including the Falkland Islands, South Georgia, and South Sandwich Islands EGY
        # : Egypt's view on Bir Tawil IND : India's view on Gilgit-Baltistan KEN : Kenya's view on the Ilemi
        # Triangle MAR : Morocco's view on Western Sahara RUS : Russia's view on Crimea SDN : Sudan's view on
        # the Halaib Triangle SRB : Serbia's view on Kosovo, Vukovar, and Sarengrad Islands SUR : Suriname's
        # view on the Courantyne Headwaters and Lawa Headwaters SYR : Syria's view on the Golan Heights TUR :
        # Turkey's view on Cyprus and Northern Cyprus TZA : Tanzania's view on Lake Malawi URY : Uruguay's
        # view on Rincon de Artigas VNM : Vietnam's view on the Paracel Islands and Spratly Islands
        @[JSON::Field(key: "political-view")]
        getter political_view : String?

        # Used with center parameter, it specifies the zoom of the image where you can control it on a
        # granular level. Takes in any value &gt;= 1 . Example: 1500 Cannot be used with Zoom . Unit : Meters
        @[JSON::Field(key: "radius")]
        getter radius : Int64?

        # Displays a scale on the bottom right of the map image with the unit specified in the input. Example:
        # KilometersMiles, Miles, Kilometers, MilesKilometers
        @[JSON::Field(key: "scale-unit")]
        getter scale_bar_unit : String?

        # Style specifies the desired map style.
        @[JSON::Field(key: "style")]
        getter style : String?

        # Specifies the zoom level of the map image. Cannot be used with Radius .
        @[JSON::Field(key: "zoom")]
        getter zoom : Float64?

        def initialize(
          @file_name : String,
          @height : Int32,
          @width : Int32,
          @bounded_positions : String? = nil,
          @bounding_box : String? = nil,
          @center : String? = nil,
          @color_scheme : String? = nil,
          @compact_overlay : String? = nil,
          @crop_labels : Bool? = nil,
          @geo_json_overlay : String? = nil,
          @key : String? = nil,
          @label_size : String? = nil,
          @language : String? = nil,
          @padding : Int32? = nil,
          @points_of_interests : String? = nil,
          @political_view : String? = nil,
          @radius : Int64? = nil,
          @scale_bar_unit : String? = nil,
          @style : String? = nil,
          @zoom : Float64? = nil
        )
        end
      end

      struct GetStaticMapResponse
        include JSON::Serializable

        # The pricing bucket for which the request is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # The blob represents a map image as a jpeg for the GetStaticMap API.
        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # Header that instructs caching configuration for the client.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Header that represents the format of the response. The response returns the following as the HTTP
        # body.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The static map's Etag.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @pricing_bucket : String,
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      struct GetStyleDescriptorRequest
        include JSON::Serializable

        # Style specifies the desired map style.
        @[JSON::Field(key: "Style")]
        getter style : String

        # Sets color tone for map such as dark and light for specific map styles. It applies to only vector
        # map styles such as Standard and Monochrome. Example: Light Default value: Light Valid values for
        # ColorScheme are case sensitive.
        @[JSON::Field(key: "color-scheme")]
        getter color_scheme : String?

        # Displays the shape and steepness of terrain features using elevation lines. The density value
        # controls how densely the available contour line information is rendered on the map. This parameter
        # is valid only for the Standard map style.
        @[JSON::Field(key: "contour-density")]
        getter contour_density : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        # Specifies the political view using ISO 3166-2 or ISO 3166-3 country code format. The following
        # political views are currently supported: ARG : Argentina's view on the Southern Patagonian Ice Field
        # and Tierra Del Fuego, including the Falkland Islands, South Georgia, and South Sandwich Islands EGY
        # : Egypt's view on Bir Tawil IND : India's view on Gilgit-Baltistan KEN : Kenya's view on the Ilemi
        # Triangle MAR : Morocco's view on Western Sahara RUS : Russia's view on Crimea SDN : Sudan's view on
        # the Halaib Triangle SRB : Serbia's view on Kosovo, Vukovar, and Sarengrad Islands SUR : Suriname's
        # view on the Courantyne Headwaters and Lawa Headwaters SYR : Syria's view on the Golan Heights TUR :
        # Turkey's view on Cyprus and Northern Cyprus TZA : Tanzania's view on Lake Malawi URY : Uruguay's
        # view on Rincon de Artigas VNM : Vietnam's view on the Paracel Islands and Spratly Islands
        @[JSON::Field(key: "political-view")]
        getter political_view : String?

        # Adjusts how physical terrain details are rendered on the map. The following terrain styles are
        # currently supported: Hillshade : Displays the physical terrain details through shading and
        # highlighting of elevation change and geographic features. This parameter is valid only for the
        # Standard map style.
        @[JSON::Field(key: "terrain")]
        getter terrain : String?

        # Displays real-time traffic information overlay on map, such as incident events and flow events. This
        # parameter is valid only for the Standard map style.
        @[JSON::Field(key: "traffic")]
        getter traffic : String?

        # Renders additional map information relevant to selected travel modes. Information for multiple
        # travel modes can be displayed simultaneously, although this increases the overall information
        # density rendered on the map. This parameter is valid only for the Standard map style.
        @[JSON::Field(key: "travel-modes")]
        getter travel_modes : Array(String)?

        def initialize(
          @style : String,
          @color_scheme : String? = nil,
          @contour_density : String? = nil,
          @key : String? = nil,
          @political_view : String? = nil,
          @terrain : String? = nil,
          @traffic : String? = nil,
          @travel_modes : Array(String)? = nil
        )
        end
      end

      struct GetStyleDescriptorResponse
        include JSON::Serializable

        # This Blob contains the body of the style descriptor which is in application/json format.
        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # Header that instructs caching configuration for the client.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Header that represents the format of the response. The response returns the following as the HTTP
        # body.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The style descriptor's Etag.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      struct GetTileRequest
        include JSON::Serializable

        # Specifies the desired tile set. Valid Values: raster.satellite | vector.basemap
        @[JSON::Field(key: "Tileset")]
        getter tileset : String

        # The X axis value for the map tile. Must be between 0 and 19.
        @[JSON::Field(key: "X")]
        getter x : String

        # The Y axis value for the map tile.
        @[JSON::Field(key: "Y")]
        getter y : String

        # The zoom value for the map tile.
        @[JSON::Field(key: "Z")]
        getter z : String

        # A list of optional additional parameters such as map styles that can be requested for each result.
        @[JSON::Field(key: "additional-features")]
        getter additional_features : Array(String)?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.
        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @tileset : String,
          @x : String,
          @y : String,
          @z : String,
          @additional_features : Array(String)? = nil,
          @key : String? = nil
        )
        end
      end

      struct GetTileResponse
        include JSON::Serializable

        # The pricing bucket for which the request is charged at.
        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # The blob represents a vector tile in mvt or a raster tile in an image format.
        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # Header that instructs caching configuration for the client.
        @[JSON::Field(key: "Cache-Control")]
        getter cache_control : String?

        # Header that represents the format of the response. The response returns the following as the HTTP
        # body.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The pricing bucket for which the request is charged at.
        @[JSON::Field(key: "ETag")]
        getter e_tag : String?

        def initialize(
          @pricing_bucket : String,
          @blob : Bytes? = nil,
          @cache_control : String? = nil,
          @content_type : String? = nil,
          @e_tag : String? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception or failure.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Exception thrown when the associated resource could not be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      struct ValidationException
        include JSON::Serializable

        # A message with the reason for the validation exception error.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)

        @[JSON::Field(key: "message")]
        getter message : String

        # The field where the invalid entry was detected.
        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @field_list : Array(Types::ValidationExceptionField),
          @message : String,
          @reason : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by the Amazon Location service.
      struct ValidationExceptionField
        include JSON::Serializable

        # The error message.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the resource.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
