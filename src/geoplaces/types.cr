require "json"

module Aws
  module GeoPlaces
    module Types

      # You don't have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Position of the access point represented by longitude and latitude for a vehicle.

      struct AccessPoint
        include JSON::Serializable

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        def initialize(
          @position : Array(Float64)? = nil
        )
        end
      end

      # Indicates if the access location is restricted. Index correlates to that of an access point and
      # indicates if access through this point has some form of restriction.

      struct AccessRestriction
        include JSON::Serializable

        # Categories of results that results must belong too.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # The restriction.

        @[JSON::Field(key: "Restricted")]
        getter restricted : Bool?

        def initialize(
          @categories : Array(Types::Category)? = nil,
          @restricted : Bool? = nil
        )
        end
      end

      # The place address.

      struct Address
        include JSON::Serializable

        # The number that identifies an address within a street.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : String?

        # Name of the block. Example: Sunny Mansion 203 block: 2 Chome

        @[JSON::Field(key: "Block")]
        getter block : String?

        # The name of the building at the address.

        @[JSON::Field(key: "Building")]
        getter building : String?

        # The country component of the address.

        @[JSON::Field(key: "Country")]
        getter country : Types::Country?

        # The district or division of a locality associated with this address.

        @[JSON::Field(key: "District")]
        getter district : String?

        # Name of the streets in the intersection. Example: ["Friedrichstraße","Unter den Linden"]

        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(String)?

        # Assembled address value built out of the address components, according to the regional postal rules.
        # This is the correctly formatted address.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The city or locality of the address. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : String?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code, for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The region or state results should be present in. Example: North Rhine-Westphalia .

        @[JSON::Field(key: "Region")]
        getter region : Types::Region?

        # Components that correspond to secondary identifiers on an Address. Secondary address components
        # include information such as Suite or Unit Number, Building, or Floor. Coverage for
        # Address.SecondaryAddressComponents is available in the following countries: AUS, CAN, NZL, USA, PRI

        @[JSON::Field(key: "SecondaryAddressComponents")]
        getter secondary_address_components : Array(Types::SecondaryAddressComponent)?

        # The name of the street results should be present in.

        @[JSON::Field(key: "Street")]
        getter street : String?

        # Components of the street. Example: Younge from the "Younge street".

        @[JSON::Field(key: "StreetComponents")]
        getter street_components : Array(Types::StreetComponents)?

        # Name of sub-block. Example: Sunny Mansion 203 sub-block: 4

        @[JSON::Field(key: "SubBlock")]
        getter sub_block : String?

        # A subdivision of a district. Example: Minden-Lübbecke .

        @[JSON::Field(key: "SubDistrict")]
        getter sub_district : String?

        # The sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : Types::SubRegion?

        def initialize(
          @address_number : String? = nil,
          @block : String? = nil,
          @building : String? = nil,
          @country : Types::Country? = nil,
          @district : String? = nil,
          @intersection : Array(String)? = nil,
          @label : String? = nil,
          @locality : String? = nil,
          @postal_code : String? = nil,
          @region : Types::Region? = nil,
          @secondary_address_components : Array(Types::SecondaryAddressComponent)? = nil,
          @street : String? = nil,
          @street_components : Array(Types::StreetComponents)? = nil,
          @sub_block : String? = nil,
          @sub_district : String? = nil,
          @sub_region : Types::SubRegion? = nil
        )
        end
      end

      # Indicates how well the entire input matches the returned. It is equal to 1 if all input tokens are
      # recognized and matched.

      struct AddressComponentMatchScores
        include JSON::Serializable

        # The house number or address results should have.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : Float64?

        # Name of the block. Example: Sunny Mansion 203 block: 2 Chome

        @[JSON::Field(key: "Block")]
        getter block : Float64?

        # The name of the building at the address.

        @[JSON::Field(key: "Building")]
        getter building : Float64?

        # The alpha-2 or alpha-3 character code for the country that the results will be present in.

        @[JSON::Field(key: "Country")]
        getter country : Float64?

        # The district or division of a city the results should be present in.

        @[JSON::Field(key: "District")]
        getter district : Float64?

        # Name of the streets in the intersection. Example: ["Friedrichstraße","Unter den Linden"]

        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Float64)?

        # The city or locality results should be present in. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : Float64?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code, for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : Float64?

        # The region or state results should be to be present in. Example: North Rhine-Westphalia .

        @[JSON::Field(key: "Region")]
        getter region : Float64?

        # Match scores for the secondary address components in the result. Coverage for this functionality is
        # available in the following countries: AUS, AUT, BRA, CAN, ESP, FRA, GBR, IDN, IND, NZL, TUR, TWN,
        # USA.

        @[JSON::Field(key: "SecondaryAddressComponents")]
        getter secondary_address_components : Array(Types::SecondaryAddressComponentMatchScore)?

        # Name of sub-block. Example: Sunny Mansion 203 sub-block: 4

        @[JSON::Field(key: "SubBlock")]
        getter sub_block : Float64?

        # A subdivision of a district. Example: Minden-Lübbecke

        @[JSON::Field(key: "SubDistrict")]
        getter sub_district : Float64?

        # The sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : Float64?

        def initialize(
          @address_number : Float64? = nil,
          @block : Float64? = nil,
          @building : Float64? = nil,
          @country : Float64? = nil,
          @district : Float64? = nil,
          @intersection : Array(Float64)? = nil,
          @locality : Float64? = nil,
          @postal_code : Float64? = nil,
          @region : Float64? = nil,
          @secondary_address_components : Array(Types::SecondaryAddressComponentMatchScore)? = nil,
          @sub_block : Float64? = nil,
          @sub_district : Float64? = nil,
          @sub_region : Float64? = nil
        )
        end
      end

      # How to pronounce the various components of the address or place.

      struct AddressComponentPhonemes
        include JSON::Serializable

        # How to pronounce the name of the block.

        @[JSON::Field(key: "Block")]
        getter block : Array(Types::PhonemeTranscription)?

        # The alpha-2 or alpha-3 character code for the country that the results will be present in.

        @[JSON::Field(key: "Country")]
        getter country : Array(Types::PhonemeTranscription)?

        # How to pronounce the district or division of a city results should be present in.

        @[JSON::Field(key: "District")]
        getter district : Array(Types::PhonemeTranscription)?

        # How to pronounce the city or locality results should be present in. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : Array(Types::PhonemeTranscription)?

        # How to pronounce the region or state results should be to be present in.

        @[JSON::Field(key: "Region")]
        getter region : Array(Types::PhonemeTranscription)?

        # How to pronounce the name of the street results should be present in.

        @[JSON::Field(key: "Street")]
        getter street : Array(Types::PhonemeTranscription)?

        # How to pronounce the name of the sub-block.

        @[JSON::Field(key: "SubBlock")]
        getter sub_block : Array(Types::PhonemeTranscription)?

        # How to pronounce the sub-district or division of a city results should be present in.

        @[JSON::Field(key: "SubDistrict")]
        getter sub_district : Array(Types::PhonemeTranscription)?

        # How to pronounce the sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : Array(Types::PhonemeTranscription)?

        def initialize(
          @block : Array(Types::PhonemeTranscription)? = nil,
          @country : Array(Types::PhonemeTranscription)? = nil,
          @district : Array(Types::PhonemeTranscription)? = nil,
          @locality : Array(Types::PhonemeTranscription)? = nil,
          @region : Array(Types::PhonemeTranscription)? = nil,
          @street : Array(Types::PhonemeTranscription)? = nil,
          @sub_block : Array(Types::PhonemeTranscription)? = nil,
          @sub_district : Array(Types::PhonemeTranscription)? = nil,
          @sub_region : Array(Types::PhonemeTranscription)? = nil
        )
        end
      end

      # Describes how the parts of the response element matched the input query by returning the sections of
      # the response which matched to input query terms.

      struct AutocompleteAddressHighlights
        include JSON::Serializable

        # The house number or address results should have.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : Array(Types::Highlight)?

        # Name of the block. Example: Sunny Mansion 203 block: 2 Chome

        @[JSON::Field(key: "Block")]
        getter block : Array(Types::Highlight)?

        # The name of the building at the address.

        @[JSON::Field(key: "Building")]
        getter building : Array(Types::Highlight)?

        # The alpha-2 or alpha-3 character code for the country that the results will be present in.

        @[JSON::Field(key: "Country")]
        getter country : Types::CountryHighlights?

        # The district or division of a city the results should be present in.

        @[JSON::Field(key: "District")]
        getter district : Array(Types::Highlight)?

        # Name of the streets in the intersection. For example: e.g. ["Friedrichstraße","Unter den Linden"]

        @[JSON::Field(key: "Intersection")]
        getter intersection : Array(Array(Types::Highlight))?

        # Indicates the starting and ending indexes for result items where they are identified to match the
        # input query. This should be used to provide emphasis to output display to make selecting the correct
        # result from a list easier for end users.

        @[JSON::Field(key: "Label")]
        getter label : Array(Types::Highlight)?

        # The city or locality results should be present in. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : Array(Types::Highlight)?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : Array(Types::Highlight)?

        # The region or state results should be to be present in. Example: North Rhine-Westphalia .

        @[JSON::Field(key: "Region")]
        getter region : Types::RegionHighlights?

        # The name of the street results should be present in.

        @[JSON::Field(key: "Street")]
        getter street : Array(Types::Highlight)?

        # Name of sub-block. Example: Sunny Mansion 203 sub-block: 4

        @[JSON::Field(key: "SubBlock")]
        getter sub_block : Array(Types::Highlight)?

        # Indicates the starting and ending index of the title in the text query that match the found title.

        @[JSON::Field(key: "SubDistrict")]
        getter sub_district : Array(Types::Highlight)?

        # The sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : Types::SubRegionHighlights?

        def initialize(
          @address_number : Array(Types::Highlight)? = nil,
          @block : Array(Types::Highlight)? = nil,
          @building : Array(Types::Highlight)? = nil,
          @country : Types::CountryHighlights? = nil,
          @district : Array(Types::Highlight)? = nil,
          @intersection : Array(Array(Types::Highlight))? = nil,
          @label : Array(Types::Highlight)? = nil,
          @locality : Array(Types::Highlight)? = nil,
          @postal_code : Array(Types::Highlight)? = nil,
          @region : Types::RegionHighlights? = nil,
          @street : Array(Types::Highlight)? = nil,
          @sub_block : Array(Types::Highlight)? = nil,
          @sub_district : Array(Types::Highlight)? = nil,
          @sub_region : Types::SubRegionHighlights? = nil
        )
        end
      end

      # Autocomplete structure which contains a set of inclusion/exclusion properties that results must
      # possess in order to be returned as a result.

      struct AutocompleteFilter
        include JSON::Serializable

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?


        @[JSON::Field(key: "Circle")]
        getter circle : Types::FilterCircle?

        # A list of countries that all results must be in. Countries are represented by either their alpha-2
        # or alpha-3 character codes.

        @[JSON::Field(key: "IncludeCountries")]
        getter include_countries : Array(String)?

        # The included place types.

        @[JSON::Field(key: "IncludePlaceTypes")]
        getter include_place_types : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @circle : Types::FilterCircle? = nil,
          @include_countries : Array(String)? = nil,
          @include_place_types : Array(String)? = nil
        )
        end
      end

      # Describes how the parts of the response element matched the input query by returning the sections of
      # the response which matched to input query terms.

      struct AutocompleteHighlights
        include JSON::Serializable

        # Describes how part of the result address match the input query.

        @[JSON::Field(key: "Address")]
        getter address : Types::AutocompleteAddressHighlights?

        # Indicates where the title field in the result matches the input query.

        @[JSON::Field(key: "Title")]
        getter title : Array(Types::Highlight)?

        def initialize(
          @address : Types::AutocompleteAddressHighlights? = nil,
          @title : Array(Types::Highlight)? = nil
        )
        end
      end


      struct AutocompleteRequest
        include JSON::Serializable

        # The free-form text query to match addresses against. This is usually a partially typed address from
        # an end user in an address box or form. The fields QueryText , and QueryID are mutually exclusive.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String

        # A list of optional additional parameters that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # The position in longitude and latitude that the results should be close to. Typically, place results
        # returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in the WGS
        # 84 format. The fields BiasPosition , FilterBoundingBox , and FilterCircle are mutually exclusive.

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::AutocompleteFilter?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional limit for the number of results returned in a single call. Default value: 5

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country. The following political views are currently supported: ARG :
        # Argentina's view on the Southern Patagonian Ice Field and Tierra Del Fuego, including the Falkland
        # Islands, South Georgia, and South Sandwich Islands EGY : Egypt's view on Bir Tawil IND : India's
        # view on Gilgit-Baltistan KEN : Kenya's view on the Ilemi Triangle MAR : Morocco's view on Western
        # Sahara RUS : Russia's view on Crimea SDN : Sudan's view on the Halaib Triangle SRB : Serbia's view
        # on Kosovo, Vukovar, and Sarengrad Islands SUR : Suriname's view on the Courantyne Headwaters and
        # Lawa Headwaters SYR : Syria's view on the Golan Heights TUR : Turkey's view on Cyprus and Northern
        # Cyprus TZA : Tanzania's view on Lake Malawi URY : Uruguay's view on Rincon de Artigas VNM :
        # Vietnam's view on the Paracel Islands and Spratly Islands

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The PostalCodeMode affects how postal code results are returned. If a postal code spans multiple
        # localities and this value is empty, partial district or locality information may be returned under a
        # single postal code result entry. If it's populated with the value EnumerateSpannedLocalities , all
        # cities in that postal code are returned.

        @[JSON::Field(key: "PostalCodeMode")]
        getter postal_code_mode : String?

        def initialize(
          @query_text : String,
          @additional_features : Array(String)? = nil,
          @bias_position : Array(Float64)? = nil,
          @filter : Types::AutocompleteFilter? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @political_view : String? = nil,
          @postal_code_mode : String? = nil
        )
        end
      end


      struct AutocompleteResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::AutocompleteResultItem)?

        def initialize(
          @pricing_bucket : String,
          @result_items : Array(Types::AutocompleteResultItem)? = nil
        )
        end
      end

      # A result matching the input query text.

      struct AutocompleteResultItem
        include JSON::Serializable

        # The PlaceId of the place associated with this result. This can be used to look up additional details
        # about the result via GetPlace.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # PlaceType describes the type of result entry returned.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # A formatted string for display when presenting this result to an end user.

        @[JSON::Field(key: "Title")]
        getter title : String

        # The address associated with this result.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The distance in meters between the center of the search area and this result. Useful to evaluate how
        # far away from the original bias position the result is.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # Indicates the starting and ending index of the place in the text query that match the found title.

        @[JSON::Field(key: "Highlights")]
        getter highlights : Types::AutocompleteHighlights?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @address : Types::Address? = nil,
          @distance : Int64? = nil,
          @highlights : Types::AutocompleteHighlights? = nil,
          @language : String? = nil,
          @political_view : String? = nil
        )
        end
      end

      # A businesschain is a chain of businesses that belong to the same brand. For example 7-11 .

      struct BusinessChain
        include JSON::Serializable

        # The Business Chain Id.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The business chain name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Category of the Place returned.

      struct Category
        include JSON::Serializable

        # The category ID.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The category name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Localized name of the category type.

        @[JSON::Field(key: "LocalizedName")]
        getter localized_name : String?

        # Boolean which indicates if this category is the primary offered by the place.

        @[JSON::Field(key: "Primary")]
        getter primary : Bool?

        def initialize(
          @id : String,
          @name : String,
          @localized_name : String? = nil,
          @primary : Bool? = nil
        )
        end
      end

      # Indicates how well the returned title and address components matches the input TextQuery. For each
      # component a score is provied with 1 indicating all tokens were matched and 0 indicating no tokens
      # were matched.

      struct ComponentMatchScores
        include JSON::Serializable

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::AddressComponentMatchScores?

        # Indicates the match score of the title in the text query that match the found title.

        @[JSON::Field(key: "Title")]
        getter title : Float64?

        def initialize(
          @address : Types::AddressComponentMatchScores? = nil,
          @title : Float64? = nil
        )
        end
      end

      # Details related to contacts.

      struct ContactDetails
        include JSON::Serializable

        # Categories of results that results must belong too.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # The contact's label.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The contact's value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @categories : Array(Types::Category)? = nil,
          @label : String? = nil,
          @value : String? = nil
        )
        end
      end

      # A list of potential contact methods for the result/place.

      struct Contacts
        include JSON::Serializable

        # List of emails for contacts of the result.

        @[JSON::Field(key: "Emails")]
        getter emails : Array(Types::ContactDetails)?

        # List of fax addresses for the result contact.

        @[JSON::Field(key: "Faxes")]
        getter faxes : Array(Types::ContactDetails)?

        # List of phone numbers for the results contact.

        @[JSON::Field(key: "Phones")]
        getter phones : Array(Types::ContactDetails)?

        # List of website URLs that belong to the result.

        @[JSON::Field(key: "Websites")]
        getter websites : Array(Types::ContactDetails)?

        def initialize(
          @emails : Array(Types::ContactDetails)? = nil,
          @faxes : Array(Types::ContactDetails)? = nil,
          @phones : Array(Types::ContactDetails)? = nil,
          @websites : Array(Types::ContactDetails)? = nil
        )
        end
      end

      # The alpha-2 or alpha-3 character code for the country that the results will be present in.

      struct Country
        include JSON::Serializable

        # Country, represented by its alpha 2-character code.

        @[JSON::Field(key: "Code2")]
        getter code2 : String?

        # Country, represented by its alpha t-character code.

        @[JSON::Field(key: "Code3")]
        getter code3 : String?

        # Name of the country.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @code2 : String? = nil,
          @code3 : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Indicates the starting and ending index of the country in the text query that match the found title.

      struct CountryHighlights
        include JSON::Serializable

        # Indicates the starting and ending index of the country code in the text query that match the found
        # title.

        @[JSON::Field(key: "Code")]
        getter code : Array(Types::Highlight)?

        # Indicates the starting and ending index of the country code in the text query that match the found
        # title.

        @[JSON::Field(key: "Name")]
        getter name : Array(Types::Highlight)?

        def initialize(
          @code : Array(Types::Highlight)? = nil,
          @name : Array(Types::Highlight)? = nil
        )
        end
      end

      # The Circle that all results must be in.

      struct FilterCircle
        include JSON::Serializable

        # The center position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Center")]
        getter center : Array(Float64)

        # The radius, in meters, of the FilterCircle .

        @[JSON::Field(key: "Radius")]
        getter radius : Int64

        def initialize(
          @center : Array(Float64),
          @radius : Int64
        )
        end
      end

      # List of Food types offered by this result.

      struct FoodType
        include JSON::Serializable

        # Localized name of the food type.

        @[JSON::Field(key: "LocalizedName")]
        getter localized_name : String

        # The Food Type Id.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Boolean which indicates if this food type is the primary offered by the place. For example, if a
        # location serves fast food, but also dessert, he primary would likely be fast food.

        @[JSON::Field(key: "Primary")]
        getter primary : Bool?

        def initialize(
          @localized_name : String,
          @id : String? = nil,
          @primary : Bool? = nil
        )
        end
      end

      # Geocode structure which contains a set of inclusion/exclusion properties that results must possess
      # in order to be returned as a result.

      struct GeocodeFilter
        include JSON::Serializable

        # A list of countries that all results must be in. Countries are represented by either their alpha-2
        # or alpha-3 character codes.

        @[JSON::Field(key: "IncludeCountries")]
        getter include_countries : Array(String)?

        # The included place types.

        @[JSON::Field(key: "IncludePlaceTypes")]
        getter include_place_types : Array(String)?

        def initialize(
          @include_countries : Array(String)? = nil,
          @include_place_types : Array(String)? = nil
        )
        end
      end

      # Parsed components in the provided QueryText.

      struct GeocodeParsedQuery
        include JSON::Serializable

        # The place address.

        @[JSON::Field(key: "Address")]
        getter address : Types::GeocodeParsedQueryAddressComponents?

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : Array(Types::ParsedQueryComponent)?

        def initialize(
          @address : Types::GeocodeParsedQueryAddressComponents? = nil,
          @title : Array(Types::ParsedQueryComponent)? = nil
        )
        end
      end

      # Parsed address components in the provided QueryText.

      struct GeocodeParsedQueryAddressComponents
        include JSON::Serializable

        # The number that identifies an address within a street.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : Array(Types::ParsedQueryComponent)?

        # Name of the block. Example: Sunny Mansion 203 block: 2 Chome

        @[JSON::Field(key: "Block")]
        getter block : Array(Types::ParsedQueryComponent)?

        # The name of the building at the address.

        @[JSON::Field(key: "Building")]
        getter building : Array(Types::ParsedQueryComponent)?

        # The alpha-2 or alpha-3 character code for the country that the results will be present in.

        @[JSON::Field(key: "Country")]
        getter country : Array(Types::ParsedQueryComponent)?

        # The district or division of a city the results should be present in.

        @[JSON::Field(key: "District")]
        getter district : Array(Types::ParsedQueryComponent)?

        # The city or locality of the address. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : Array(Types::ParsedQueryComponent)?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code, for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : Array(Types::ParsedQueryComponent)?

        # The region or state results should be present in. Example: North Rhine-Westphalia .

        @[JSON::Field(key: "Region")]
        getter region : Array(Types::ParsedQueryComponent)?

        # Parsed secondary address components from the provided query text. Coverage for
        # ParsedQuery.Address.SecondaryAddressComponents is available in the following countries: AUS, AUT,
        # BRA, CAN, ESP, FRA, GBR, HKG, IDN, IND, NZL, TUR, TWN, USA

        @[JSON::Field(key: "SecondaryAddressComponents")]
        getter secondary_address_components : Array(Types::ParsedQuerySecondaryAddressComponent)?

        # The name of the street results should be present in.

        @[JSON::Field(key: "Street")]
        getter street : Array(Types::ParsedQueryComponent)?

        # Name of sub-block. Example: Sunny Mansion 203 sub-block: 4

        @[JSON::Field(key: "SubBlock")]
        getter sub_block : Array(Types::ParsedQueryComponent)?

        # A subdivision of a district. Example: Minden-Lübbecke .

        @[JSON::Field(key: "SubDistrict")]
        getter sub_district : Array(Types::ParsedQueryComponent)?

        # The sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : Array(Types::ParsedQueryComponent)?

        def initialize(
          @address_number : Array(Types::ParsedQueryComponent)? = nil,
          @block : Array(Types::ParsedQueryComponent)? = nil,
          @building : Array(Types::ParsedQueryComponent)? = nil,
          @country : Array(Types::ParsedQueryComponent)? = nil,
          @district : Array(Types::ParsedQueryComponent)? = nil,
          @locality : Array(Types::ParsedQueryComponent)? = nil,
          @postal_code : Array(Types::ParsedQueryComponent)? = nil,
          @region : Array(Types::ParsedQueryComponent)? = nil,
          @secondary_address_components : Array(Types::ParsedQuerySecondaryAddressComponent)? = nil,
          @street : Array(Types::ParsedQueryComponent)? = nil,
          @sub_block : Array(Types::ParsedQueryComponent)? = nil,
          @sub_district : Array(Types::ParsedQueryComponent)? = nil,
          @sub_region : Array(Types::ParsedQueryComponent)? = nil
        )
        end
      end

      # A structured free text query allows you to search for places by the name or text representation of
      # specific properties of the place.

      struct GeocodeQueryComponents
        include JSON::Serializable

        # The house number or address results should have.

        @[JSON::Field(key: "AddressNumber")]
        getter address_number : String?

        # The alpha-2 or alpha-3 character code for the country that the results will be present in.

        @[JSON::Field(key: "Country")]
        getter country : String?

        # The district or division of a city the results should be present in.

        @[JSON::Field(key: "District")]
        getter district : String?

        # The city or locality results should be present in. Example: Vancouver .

        @[JSON::Field(key: "Locality")]
        getter locality : String?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The region or state results should be to be present in. Example: North Rhine-Westphalia .

        @[JSON::Field(key: "Region")]
        getter region : String?

        # The name of the street results should be present in.

        @[JSON::Field(key: "Street")]
        getter street : String?

        # The sub-region or county for which results should be present in.

        @[JSON::Field(key: "SubRegion")]
        getter sub_region : String?

        def initialize(
          @address_number : String? = nil,
          @country : String? = nil,
          @district : String? = nil,
          @locality : String? = nil,
          @postal_code : String? = nil,
          @region : String? = nil,
          @street : String? = nil,
          @sub_region : String? = nil
        )
        end
      end


      struct GeocodeRequest
        include JSON::Serializable

        # A list of optional additional parameters, such as time zone, that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # The position, in longitude and latitude, that the results should be close to. Typically, place
        # results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in
        # the WGS 84 format.

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::GeocodeFilter?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty. Storing the response
        # of an Geocode query is required to comply with service terms, but charged at a higher cost per
        # request. Please review the user agreement and service pricing structure to determine the correct
        # setting for your use case.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional limit for the number of results returned in a single call. Default value: 20

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?


        @[JSON::Field(key: "QueryComponents")]
        getter query_components : Types::GeocodeQueryComponents?

        # The free-form text query to match addresses against. This is usually a partially typed address from
        # an end user in an address box or form.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String?

        def initialize(
          @additional_features : Array(String)? = nil,
          @bias_position : Array(Float64)? = nil,
          @filter : Types::GeocodeFilter? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @political_view : String? = nil,
          @query_components : Types::GeocodeQueryComponents? = nil,
          @query_text : String? = nil
        )
        end
      end


      struct GeocodeResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at, or the maximum pricing bucket when the query
        # is charged per item within the query. For more information on pricing, please visit Amazon Location
        # Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::GeocodeResultItem)?

        def initialize(
          @pricing_bucket : String,
          @result_items : Array(Types::GeocodeResultItem)? = nil
        )
        end
      end

      # The Geocoded result.

      struct GeocodeResultItem
        include JSON::Serializable

        # The PlaceId of the place result.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Boolean indicating if the address provided has been corrected.

        @[JSON::Field(key: "AddressNumberCorrected")]
        getter address_number_corrected : Bool?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # All Intersections that are near the provided address.

        @[JSON::Field(key: "Intersections")]
        getter intersections : Array(Types::Intersection)?

        # The main address corresponding to a place of type Secondary Address.

        @[JSON::Field(key: "MainAddress")]
        getter main_address : Types::RelatedPlace?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # Indicates how well the entire input matches the returned. It is equal to 1 if all input tokens are
        # recognized and matched.

        @[JSON::Field(key: "MatchScores")]
        getter match_scores : Types::MatchScoreDetails?

        # Free-form text query.

        @[JSON::Field(key: "ParsedQuery")]
        getter parsed_query : Types::GeocodeParsedQuery?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # Contains details about the postal code of the place/result.

        @[JSON::Field(key: "PostalCodeDetails")]
        getter postal_code_details : Array(Types::PostalCodeDetails)?

        # All secondary addresses that are associated with a main address. A secondary address is one that
        # includes secondary designators, such as a Suite or Unit Number, Building, or Floor information.
        # Coverage for this functionality is available in the following countries: AUS, CAN, NZL, USA, PRI.

        @[JSON::Field(key: "SecondaryAddresses")]
        getter secondary_addresses : Array(Types::RelatedPlace)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @address : Types::Address? = nil,
          @address_number_corrected : Bool? = nil,
          @categories : Array(Types::Category)? = nil,
          @distance : Int64? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @intersections : Array(Types::Intersection)? = nil,
          @main_address : Types::RelatedPlace? = nil,
          @map_view : Array(Float64)? = nil,
          @match_scores : Types::MatchScoreDetails? = nil,
          @parsed_query : Types::GeocodeParsedQuery? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @postal_code_details : Array(Types::PostalCodeDetails)? = nil,
          @secondary_addresses : Array(Types::RelatedPlace)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end


      struct GetPlaceRequest
        include JSON::Serializable

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A list of optional additional parameters such as time zone that can be requested for each result.

        @[JSON::Field(key: "additional-features")]
        getter additional_features : Array(String)?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty. Storing the response
        # of an GetPlace query is required to comply with service terms, but charged at a higher cost per
        # request. Please review the user agreement and service pricing structure to determine the correct
        # setting for your use case.

        @[JSON::Field(key: "intended-use")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "political-view")]
        getter political_view : String?

        def initialize(
          @place_id : String,
          @additional_features : Array(String)? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @political_view : String? = nil
        )
        end
      end


      struct GetPlaceResponse
        include JSON::Serializable

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # Indicates known access restrictions on a vehicle access point. The index correlates to an access
        # point and indicates if access through this point has some form of restriction.

        @[JSON::Field(key: "AccessRestrictions")]
        getter access_restrictions : Array(Types::AccessRestriction)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Boolean indicating if the address provided has been corrected.

        @[JSON::Field(key: "AddressNumberCorrected")]
        getter address_number_corrected : Bool?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "BusinessChains")]
        getter business_chains : Array(Types::BusinessChain)?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # List of potential contact methods for the result/place.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Types::Contacts?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # The main address corresponding to a place of type Secondary Address.

        @[JSON::Field(key: "MainAddress")]
        getter main_address : Types::RelatedPlace?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set of four coordinates: [{westward lng}, {southern lat},
        # {eastward lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # List of opening hours objects.

        @[JSON::Field(key: "OpeningHours")]
        getter opening_hours : Array(Types::OpeningHours)?

        # How the various components of the result's address are pronounced in various languages.

        @[JSON::Field(key: "Phonemes")]
        getter phonemes : Types::PhonemeDetails?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # Contains details about the postal code of the place/result.

        @[JSON::Field(key: "PostalCodeDetails")]
        getter postal_code_details : Array(Types::PostalCodeDetails)?

        # All secondary addresses that are associated with a main address. A secondary address is one that
        # includes secondary designators, such as a Suite or Unit Number, Building, or Floor information.
        # Coverage for this functionality is available in the following countries: AUS, CAN, NZL, USA, PRI.

        @[JSON::Field(key: "SecondaryAddresses")]
        getter secondary_addresses : Array(Types::RelatedPlace)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @place_id : String,
          @place_type : String,
          @pricing_bucket : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @access_restrictions : Array(Types::AccessRestriction)? = nil,
          @address : Types::Address? = nil,
          @address_number_corrected : Bool? = nil,
          @business_chains : Array(Types::BusinessChain)? = nil,
          @categories : Array(Types::Category)? = nil,
          @contacts : Types::Contacts? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @main_address : Types::RelatedPlace? = nil,
          @map_view : Array(Float64)? = nil,
          @opening_hours : Array(Types::OpeningHours)? = nil,
          @phonemes : Types::PhonemeDetails? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @postal_code_details : Array(Types::PostalCodeDetails)? = nil,
          @secondary_addresses : Array(Types::RelatedPlace)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end

      # Indicates the starting and ending index of the text query that match the found title.

      struct Highlight
        include JSON::Serializable

        # End index of the highlight.

        @[JSON::Field(key: "EndIndex")]
        getter end_index : Int32?

        # Start index of the highlight.

        @[JSON::Field(key: "StartIndex")]
        getter start_index : Int32?

        # The highlight's value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @end_index : Int32? = nil,
          @start_index : Int32? = nil,
          @value : String? = nil
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

      # All Intersections that are near the provided address.

      struct Intersection
        include JSON::Serializable

        # The PlaceId of the place result.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?


        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set of four coordinates: [{westward lng}, {southern lat},
        # {eastward lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # The distance from the routing position of the nearby address to the street result.

        @[JSON::Field(key: "RouteDistance")]
        getter route_distance : Int64?

        def initialize(
          @place_id : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @address : Types::Address? = nil,
          @distance : Int64? = nil,
          @map_view : Array(Float64)? = nil,
          @position : Array(Float64)? = nil,
          @route_distance : Int64? = nil
        )
        end
      end

      # Details related to the match score.

      struct MatchScoreDetails
        include JSON::Serializable

        # Indicates how well the component input matches the returned. It is equal to 1 if all input tokens
        # are recognized and matched.

        @[JSON::Field(key: "Components")]
        getter components : Types::ComponentMatchScores?

        # Indicates how well the entire input matches the returned. It is equal to 1 if all input tokens are
        # recognized and matched.

        @[JSON::Field(key: "Overall")]
        getter overall : Float64?

        def initialize(
          @components : Types::ComponentMatchScores? = nil,
          @overall : Float64? = nil
        )
        end
      end

      # List of opening hours objects.

      struct OpeningHours
        include JSON::Serializable

        # Categories of results that results must belong too.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # Components of the opening hours object.

        @[JSON::Field(key: "Components")]
        getter components : Array(Types::OpeningHoursComponents)?

        # List of opening hours in the format they are displayed in. This can vary by result and in most cases
        # represents how the result uniquely formats their opening hours.

        @[JSON::Field(key: "Display")]
        getter display : Array(String)?

        # Boolean which indicates if the result/place is currently open.

        @[JSON::Field(key: "OpenNow")]
        getter open_now : Bool?

        def initialize(
          @categories : Array(Types::Category)? = nil,
          @components : Array(Types::OpeningHoursComponents)? = nil,
          @display : Array(String)? = nil,
          @open_now : Bool? = nil
        )
        end
      end

      # Components of the opening hours object.

      struct OpeningHoursComponents
        include JSON::Serializable

        # String which represents the duration of the opening period, such as "PT12H00M" .

        @[JSON::Field(key: "OpenDuration")]
        getter open_duration : String?

        # String which represents the opening hours, such as "T070000" .

        @[JSON::Field(key: "OpenTime")]
        getter open_time : String?

        # Days or periods when the provided opening hours are in affect. Example:
        # FREQ:DAILY;BYDAY:MO,TU,WE,TH,SU

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : String?

        def initialize(
          @open_duration : String? = nil,
          @open_time : String? = nil,
          @recurrence : String? = nil
        )
        end
      end

      # Parsed components in the provided QueryText.

      struct ParsedQueryComponent
        include JSON::Serializable

        # End index of the parsed query component.

        @[JSON::Field(key: "EndIndex")]
        getter end_index : Int32?

        # The address component that the parsed query component corresponds to.

        @[JSON::Field(key: "QueryComponent")]
        getter query_component : String?

        # Start index of the parsed query component.

        @[JSON::Field(key: "StartIndex")]
        getter start_index : Int32?

        # Value of the parsed query component.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @end_index : Int32? = nil,
          @query_component : String? = nil,
          @start_index : Int32? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about a secondary address component parsed from the query text.

      struct ParsedQuerySecondaryAddressComponent
        include JSON::Serializable

        # Secondary address designator provided in the query.

        @[JSON::Field(key: "Designator")]
        getter designator : String

        # End index of the parsed secondary address component in the query text.

        @[JSON::Field(key: "EndIndex")]
        getter end_index : Int32

        # Secondary address number provided in the query.

        @[JSON::Field(key: "Number")]
        getter number : String

        # Start index of the parsed secondary address component in the query text.

        @[JSON::Field(key: "StartIndex")]
        getter start_index : Int32

        # Value of the parsed secondary address component.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @designator : String,
          @end_index : Int32,
          @number : String,
          @start_index : Int32,
          @value : String
        )
        end
      end

      # The phoneme details.

      struct PhonemeDetails
        include JSON::Serializable

        # How to pronounce the address.

        @[JSON::Field(key: "Address")]
        getter address : Types::AddressComponentPhonemes?

        # List of PhonemeTranscription . See PhonemeTranscription for fields.

        @[JSON::Field(key: "Title")]
        getter title : Array(Types::PhonemeTranscription)?

        def initialize(
          @address : Types::AddressComponentPhonemes? = nil,
          @title : Array(Types::PhonemeTranscription)? = nil
        )
        end
      end

      # How to pronounce the various components of the address or place.

      struct PhonemeTranscription
        include JSON::Serializable

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # Boolean which indicates if it the preferred pronunciation.

        @[JSON::Field(key: "Preferred")]
        getter preferred : Bool?

        # Value which indicates how to pronounce the value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @language : String? = nil,
          @preferred : Bool? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains details about the postal code of the place or result.

      struct PostalCodeDetails
        include JSON::Serializable

        # The postal authority or entity. This could be a governmental authority, a regulatory authority, or a
        # designated postal operator.

        @[JSON::Field(key: "PostalAuthority")]
        getter postal_authority : String?

        # An alphanumeric string included in a postal address to facilitate mail sorting, such as post code,
        # postcode, or ZIP code for which the result should possess.

        @[JSON::Field(key: "PostalCode")]
        getter postal_code : String?

        # The postal code type.

        @[JSON::Field(key: "PostalCodeType")]
        getter postal_code_type : String?

        # The ZIP Classification Code, or in other words what type of postal code is it.

        @[JSON::Field(key: "UspsZip")]
        getter usps_zip : Types::UspsZip?

        # The USPS ZIP+4 Record Type Code.

        @[JSON::Field(key: "UspsZipPlus4")]
        getter usps_zip_plus4 : Types::UspsZipPlus4?

        def initialize(
          @postal_authority : String? = nil,
          @postal_code : String? = nil,
          @postal_code_type : String? = nil,
          @usps_zip : Types::UspsZip? = nil,
          @usps_zip_plus4 : Types::UspsZipPlus4? = nil
        )
        end
      end

      # Suggestions for refining individual query terms. Suggestions are returned as objects which note the
      # term, suggested replacement, and its index in the query.

      struct QueryRefinement
        include JSON::Serializable

        # End index of the parsed query.

        @[JSON::Field(key: "EndIndex")]
        getter end_index : Int32

        # The sub-string of the original query that is replaced by this query term.

        @[JSON::Field(key: "OriginalTerm")]
        getter original_term : String

        # The term that will be suggested to the user.

        @[JSON::Field(key: "RefinedTerm")]
        getter refined_term : String

        # Start index of the parsed component.

        @[JSON::Field(key: "StartIndex")]
        getter start_index : Int32

        def initialize(
          @end_index : Int32,
          @original_term : String,
          @refined_term : String,
          @start_index : Int32
        )
        end
      end

      # The region or state results should be to be present in. Example: North Rhine-Westphalia .

      struct Region
        include JSON::Serializable

        # Abbreviated code for a the state, province or region of the country. Example: BC .

        @[JSON::Field(key: "Code")]
        getter code : String?

        # Name for a the state, province, or region of the country. Example: British Columbia .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Indicates the starting and ending index of the region in the text query that match the found title.

      struct RegionHighlights
        include JSON::Serializable

        # Indicates the starting and ending index of the region in the text query that match the found title.

        @[JSON::Field(key: "Code")]
        getter code : Array(Types::Highlight)?

        # Indicates the starting and ending index of the region name in the text query that match the found
        # title.

        @[JSON::Field(key: "Name")]
        getter name : Array(Types::Highlight)?

        def initialize(
          @code : Array(Types::Highlight)? = nil,
          @name : Array(Types::Highlight)? = nil
        )
        end
      end

      # Place that is related to the result item.

      struct RelatedPlace
        include JSON::Serializable

        # The PlaceId of the place result.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?


        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @address : Types::Address? = nil,
          @position : Array(Float64)? = nil
        )
        end
      end

      # The included place types.

      struct ReverseGeocodeFilter
        include JSON::Serializable

        # The included place types.

        @[JSON::Field(key: "IncludePlaceTypes")]
        getter include_place_types : Array(String)?

        def initialize(
          @include_place_types : Array(String)? = nil
        )
        end
      end


      struct ReverseGeocodeRequest
        include JSON::Serializable

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude] for which you are
        # querying nearby results for. Results closer to the position will be ranked higher then results
        # further away from the position

        @[JSON::Field(key: "QueryPosition")]
        getter query_position : Array(Float64)

        # A list of optional additional parameters, such as time zone that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ReverseGeocodeFilter?

        # The heading in degrees from true north in a navigation context. The heading is measured as the angle
        # clockwise from the North direction. Example: North is 0 degrees, East is 90 degrees, South is 180
        # degrees, and West is 270 degrees.

        @[JSON::Field(key: "Heading")]
        getter heading : Float64?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty. Storing the response
        # of an ReverseGeocode query is required to comply with service terms, but charged at a higher cost
        # per request. Please review the user agreement and service pricing structure to determine the correct
        # setting for your use case.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional limit for the number of results returned in a single call. Default value: 1

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The maximum distance in meters from the QueryPosition from which a result will be returned.

        @[JSON::Field(key: "QueryRadius")]
        getter query_radius : Int64?

        def initialize(
          @query_position : Array(Float64),
          @additional_features : Array(String)? = nil,
          @filter : Types::ReverseGeocodeFilter? = nil,
          @heading : Float64? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @political_view : String? = nil,
          @query_radius : Int64? = nil
        )
        end
      end


      struct ReverseGeocodeResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::ReverseGeocodeResultItem)?

        def initialize(
          @pricing_bucket : String,
          @result_items : Array(Types::ReverseGeocodeResultItem)? = nil
        )
        end
      end

      # The returned location from the Reverse Geocode action.

      struct ReverseGeocodeResultItem
        include JSON::Serializable

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The localized display name of this result item based on request parameter language .

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Boolean indicating if the address provided has been corrected.

        @[JSON::Field(key: "AddressNumberCorrected")]
        getter address_number_corrected : Bool?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # All Intersections that are near the provided address.

        @[JSON::Field(key: "Intersections")]
        getter intersections : Array(Types::Intersection)?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # Contains details about the postal code of the place/result.

        @[JSON::Field(key: "PostalCodeDetails")]
        getter postal_code_details : Array(Types::PostalCodeDetails)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @address : Types::Address? = nil,
          @address_number_corrected : Bool? = nil,
          @categories : Array(Types::Category)? = nil,
          @distance : Int64? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @intersections : Array(Types::Intersection)? = nil,
          @map_view : Array(Float64)? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @postal_code_details : Array(Types::PostalCodeDetails)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end

      # SearchNearby structure which contains a set of inclusion/exclusion properties that results must
      # possess in order to be returned as a result.

      struct SearchNearbyFilter
        include JSON::Serializable

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "ExcludeBusinessChains")]
        getter exclude_business_chains : Array(String)?

        # Categories of results that results are excluded from.

        @[JSON::Field(key: "ExcludeCategories")]
        getter exclude_categories : Array(String)?

        # Food types that results are excluded from.

        @[JSON::Field(key: "ExcludeFoodTypes")]
        getter exclude_food_types : Array(String)?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "IncludeBusinessChains")]
        getter include_business_chains : Array(String)?

        # Categories of results that results must belong too.

        @[JSON::Field(key: "IncludeCategories")]
        getter include_categories : Array(String)?

        # A list of countries that all results must be in. Countries are represented by either their alpha-2
        # or alpha-3 character codes.

        @[JSON::Field(key: "IncludeCountries")]
        getter include_countries : Array(String)?

        # Food types that results are included from.

        @[JSON::Field(key: "IncludeFoodTypes")]
        getter include_food_types : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @exclude_business_chains : Array(String)? = nil,
          @exclude_categories : Array(String)? = nil,
          @exclude_food_types : Array(String)? = nil,
          @include_business_chains : Array(String)? = nil,
          @include_categories : Array(String)? = nil,
          @include_countries : Array(String)? = nil,
          @include_food_types : Array(String)? = nil
        )
        end
      end


      struct SearchNearbyRequest
        include JSON::Serializable

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude] for which you are
        # querying nearby results for. Results closer to the position will be ranked higher then results
        # further away from the position

        @[JSON::Field(key: "QueryPosition")]
        getter query_position : Array(Float64)

        # A list of optional additional parameters, such as time zone, that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::SearchNearbyFilter?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty. Storing the response
        # of an SearchNearby query is required to comply with service terms, but charged at a higher cost per
        # request. Please review the user agreement and service pricing structure to determine the correct
        # setting for your use case.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional limit for the number of results returned in a single call. Default value: 20

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The maximum distance in meters from the QueryPosition from which a result will be returned. The
        # fields QueryText , and QueryID are mutually exclusive.

        @[JSON::Field(key: "QueryRadius")]
        getter query_radius : Int64?

        def initialize(
          @query_position : Array(Float64),
          @additional_features : Array(String)? = nil,
          @filter : Types::SearchNearbyFilter? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @political_view : String? = nil,
          @query_radius : Int64? = nil
        )
        end
      end


      struct SearchNearbyResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::SearchNearbyResultItem)?

        def initialize(
          @pricing_bucket : String,
          @next_token : String? = nil,
          @result_items : Array(Types::SearchNearbyResultItem)? = nil
        )
        end
      end

      # The search results of nearby places.

      struct SearchNearbyResultItem
        include JSON::Serializable

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The item's title.

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # Indicates known access restrictions on a vehicle access point. The index correlates to an access
        # point and indicates if access through this point has some form of restriction.

        @[JSON::Field(key: "AccessRestrictions")]
        getter access_restrictions : Array(Types::AccessRestriction)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Boolean indicating if the address provided has been corrected.

        @[JSON::Field(key: "AddressNumberCorrected")]
        getter address_number_corrected : Bool?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "BusinessChains")]
        getter business_chains : Array(Types::BusinessChain)?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # List of potential contact methods for the result/place.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Types::Contacts?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # List of opening hours objects.

        @[JSON::Field(key: "OpeningHours")]
        getter opening_hours : Array(Types::OpeningHours)?

        # How the various components of the result's address are pronounced in various languages.

        @[JSON::Field(key: "Phonemes")]
        getter phonemes : Types::PhonemeDetails?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @access_restrictions : Array(Types::AccessRestriction)? = nil,
          @address : Types::Address? = nil,
          @address_number_corrected : Bool? = nil,
          @business_chains : Array(Types::BusinessChain)? = nil,
          @categories : Array(Types::Category)? = nil,
          @contacts : Types::Contacts? = nil,
          @distance : Int64? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @map_view : Array(Float64)? = nil,
          @opening_hours : Array(Types::OpeningHours)? = nil,
          @phonemes : Types::PhonemeDetails? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end

      # SearchText structure which contains a set of inclusion/exclusion properties that results must
      # possess in order to be returned as a result.

      struct SearchTextFilter
        include JSON::Serializable

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?


        @[JSON::Field(key: "Circle")]
        getter circle : Types::FilterCircle?

        # A list of countries that all results must be in. Countries are represented by either their alpha-2
        # or alpha-3 character codes.

        @[JSON::Field(key: "IncludeCountries")]
        getter include_countries : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @circle : Types::FilterCircle? = nil,
          @include_countries : Array(String)? = nil
        )
        end
      end


      struct SearchTextRequest
        include JSON::Serializable

        # A list of optional additional parameters, such as time zone, that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # The position, in longitude and latitude, that the results should be close to. Typically, place
        # results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in
        # the WGS 84 format. Exactly one of the following fields must be set: BiasPosition ,
        # Filter.BoundingBox , or Filter.Circle .

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::SearchTextFilter?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty. Storing the response
        # of an SearchText query is required to comply with service terms, but charged at a higher cost per
        # request. Please review the user agreement and service pricing structure to determine the correct
        # setting for your use case.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # An optional limit for the number of results returned in a single call. Default value: 20

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The query Id returned by the suggest API. If passed in the request, the SearchText API will preform
        # a SearchText query with the improved query terms for the original query made to the suggest API.
        # Exactly one of the following fields must be set: QueryText or QueryId .

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The free-form text query to match addresses against. This is usually a partially typed address from
        # an end user in an address box or form. Exactly one of the following fields must be set: QueryText or
        # QueryId .

        @[JSON::Field(key: "QueryText")]
        getter query_text : String?

        def initialize(
          @additional_features : Array(String)? = nil,
          @bias_position : Array(Float64)? = nil,
          @filter : Types::SearchTextFilter? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @political_view : String? = nil,
          @query_id : String? = nil,
          @query_text : String? = nil
        )
        end
      end


      struct SearchTextResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::SearchTextResultItem)?

        def initialize(
          @pricing_bucket : String,
          @next_token : String? = nil,
          @result_items : Array(Types::SearchTextResultItem)? = nil
        )
        end
      end

      # The text search result.

      struct SearchTextResultItem
        include JSON::Serializable

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String

        # The item's title.

        @[JSON::Field(key: "Title")]
        getter title : String

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # Indicates known access restrictions on a vehicle access point. The index correlates to an access
        # point and indicates if access through this point has some form of restriction.

        @[JSON::Field(key: "AccessRestrictions")]
        getter access_restrictions : Array(Types::AccessRestriction)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # Boolean indicating if the address provided has been corrected.

        @[JSON::Field(key: "AddressNumberCorrected")]
        getter address_number_corrected : Bool?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "BusinessChains")]
        getter business_chains : Array(Types::BusinessChain)?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # List of potential contact methods for the result/place.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Types::Contacts?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # List of opening hours objects.

        @[JSON::Field(key: "OpeningHours")]
        getter opening_hours : Array(Types::OpeningHours)?

        # How the various components of the result's address are pronounced in various languages.

        @[JSON::Field(key: "Phonemes")]
        getter phonemes : Types::PhonemeDetails?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @place_id : String,
          @place_type : String,
          @title : String,
          @access_points : Array(Types::AccessPoint)? = nil,
          @access_restrictions : Array(Types::AccessRestriction)? = nil,
          @address : Types::Address? = nil,
          @address_number_corrected : Bool? = nil,
          @business_chains : Array(Types::BusinessChain)? = nil,
          @categories : Array(Types::Category)? = nil,
          @contacts : Types::Contacts? = nil,
          @distance : Int64? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @map_view : Array(Float64)? = nil,
          @opening_hours : Array(Types::OpeningHours)? = nil,
          @phonemes : Types::PhonemeDetails? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end

      # Components that correspond to secondary identifiers on an address. The only component type supported
      # currently is Unit.

      struct SecondaryAddressComponent
        include JSON::Serializable

        # Number that uniquely identifies a secondary address.

        @[JSON::Field(key: "Number")]
        getter number : String

        # The designator of the secondary address component. Example: Apt .

        @[JSON::Field(key: "Designator")]
        getter designator : String?

        def initialize(
          @number : String,
          @designator : String? = nil
        )
        end
      end

      # Match score for a secondary address component in the result.

      struct SecondaryAddressComponentMatchScore
        include JSON::Serializable

        # Match score for the secondary address number.

        @[JSON::Field(key: "Number")]
        getter number : Float64?

        def initialize(
          @number : Float64? = nil
        )
        end
      end

      # Components of a street.

      struct StreetComponents
        include JSON::Serializable

        # Base name part of the street name. Example: Younge from the "Younge street".

        @[JSON::Field(key: "BaseName")]
        getter base_name : String?

        # Indicates the official directional identifiers assigned to highways.

        @[JSON::Field(key: "Direction")]
        getter direction : String?

        # A BCP 47 compliant language codes for the results to be rendered in. If there is no data for the
        # result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # A prefix is a directional identifier that precedes, but is not included in, the base name of a road.
        # Example: E for East.

        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        # A suffix is a directional identifier that follows, but is not included in, the base name of a road.
        # Example W for West.

        @[JSON::Field(key: "Suffix")]
        getter suffix : String?

        # Street type part of the street name. Example: "avenue" .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # Defines if the street type is before or after the base name.

        @[JSON::Field(key: "TypePlacement")]
        getter type_placement : String?

        # Defines a separator character such as "" or " " between the base name and type.

        @[JSON::Field(key: "TypeSeparator")]
        getter type_separator : String?

        def initialize(
          @base_name : String? = nil,
          @direction : String? = nil,
          @language : String? = nil,
          @prefix : String? = nil,
          @suffix : String? = nil,
          @type : String? = nil,
          @type_placement : String? = nil,
          @type_separator : String? = nil
        )
        end
      end

      # The sub-region.

      struct SubRegion
        include JSON::Serializable

        # Abbreviated code for the county or sub-region.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # Name for the county or sub-region.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Indicates the starting and ending index of the sub-region in the text query that match the found
      # title.

      struct SubRegionHighlights
        include JSON::Serializable

        # Indicates the starting and ending index of the sub-region in the text query that match the found
        # title.

        @[JSON::Field(key: "Code")]
        getter code : Array(Types::Highlight)?

        # Indicates the starting and ending index of the name in the text query that match the found title.

        @[JSON::Field(key: "Name")]
        getter name : Array(Types::Highlight)?

        def initialize(
          @code : Array(Types::Highlight)? = nil,
          @name : Array(Types::Highlight)? = nil
        )
        end
      end

      # Describes how the parts of the textQuery matched the input query by returning the sections of the
      # response which matched to textQuery terms.

      struct SuggestAddressHighlights
        include JSON::Serializable

        # Indicates the starting and ending indexes of the places in the result which were identified to match
        # the textQuery. This result is useful for providing emphasis to results where the user query directly
        # matched to make selecting the correct result from a list easier for an end user.

        @[JSON::Field(key: "Label")]
        getter label : Array(Types::Highlight)?

        def initialize(
          @label : Array(Types::Highlight)? = nil
        )
        end
      end

      # SuggestFilter structure which contains a set of inclusion/exclusion properties that results must
      # possess in order to be returned as a result.

      struct SuggestFilter
        include JSON::Serializable

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Array(Float64)?


        @[JSON::Field(key: "Circle")]
        getter circle : Types::FilterCircle?

        # A list of countries that all results must be in. Countries are represented by either their alpha-2
        # or alpha-3 character codes.

        @[JSON::Field(key: "IncludeCountries")]
        getter include_countries : Array(String)?

        def initialize(
          @bounding_box : Array(Float64)? = nil,
          @circle : Types::FilterCircle? = nil,
          @include_countries : Array(String)? = nil
        )
        end
      end

      # Describes how the parts of the textQuery matched the input query by returning the sections of the
      # response which matched to textQuery terms.

      struct SuggestHighlights
        include JSON::Serializable

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::SuggestAddressHighlights?

        # Indicates the starting and ending index of the title in the text query that match the found title.

        @[JSON::Field(key: "Title")]
        getter title : Array(Types::Highlight)?

        def initialize(
          @address : Types::SuggestAddressHighlights? = nil,
          @title : Array(Types::Highlight)? = nil
        )
        end
      end

      # The suggested place results.

      struct SuggestPlaceResult
        include JSON::Serializable

        # Position of the access point in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "AccessPoints")]
        getter access_points : Array(Types::AccessPoint)?

        # Indicates known access restrictions on a vehicle access point. The index correlates to an access
        # point and indicates if access through this point has some form of restriction.

        @[JSON::Field(key: "AccessRestrictions")]
        getter access_restrictions : Array(Types::AccessRestriction)?

        # The place's address.

        @[JSON::Field(key: "Address")]
        getter address : Types::Address?

        # The Business Chains associated with the place.

        @[JSON::Field(key: "BusinessChains")]
        getter business_chains : Array(Types::BusinessChain)?

        # Categories of results that results must belong to.

        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::Category)?

        # The distance in meters from the QueryPosition.

        @[JSON::Field(key: "Distance")]
        getter distance : Int64?

        # List of food types offered by this result.

        @[JSON::Field(key: "FoodTypes")]
        getter food_types : Array(Types::FoodType)?

        # The bounding box enclosing the geometric shape (area or line) that an individual result covers. The
        # bounding box formed is defined as a set 4 coordinates: [{westward lng}, {southern lat}, {eastward
        # lng}, {northern lat}]

        @[JSON::Field(key: "MapView")]
        getter map_view : Array(Float64)?

        # How the various components of the result's address are pronounced in various languages.

        @[JSON::Field(key: "Phonemes")]
        getter phonemes : Types::PhonemeDetails?

        # The PlaceId of the place you wish to receive the information for.

        @[JSON::Field(key: "PlaceId")]
        getter place_id : String?

        # A PlaceType is a category that the result place must belong to.

        @[JSON::Field(key: "PlaceType")]
        getter place_type : String?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        # The position in World Geodetic System (WGS 84) format: [longitude, latitude].

        @[JSON::Field(key: "Position")]
        getter position : Array(Float64)?

        # The time zone in which the place is located.

        @[JSON::Field(key: "TimeZone")]
        getter time_zone : Types::TimeZone?

        def initialize(
          @access_points : Array(Types::AccessPoint)? = nil,
          @access_restrictions : Array(Types::AccessRestriction)? = nil,
          @address : Types::Address? = nil,
          @business_chains : Array(Types::BusinessChain)? = nil,
          @categories : Array(Types::Category)? = nil,
          @distance : Int64? = nil,
          @food_types : Array(Types::FoodType)? = nil,
          @map_view : Array(Float64)? = nil,
          @phonemes : Types::PhonemeDetails? = nil,
          @place_id : String? = nil,
          @place_type : String? = nil,
          @political_view : String? = nil,
          @position : Array(Float64)? = nil,
          @time_zone : Types::TimeZone? = nil
        )
        end
      end

      # The suggested query results.

      struct SuggestQueryResult
        include JSON::Serializable

        # QueryId can be used to complete a follow up query through the SearchText API. The QueryId retains
        # context from the original Suggest request such as filters, political view and language. See the
        # SearchText API documentation for more details SearchText API docs . The fields QueryText , and
        # QueryID are mutually exclusive.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The query type. Category queries will search for places which have an entry matching the given
        # category, for example "doctor office". BusinessChain queries will search for instances of a given
        # business.

        @[JSON::Field(key: "QueryType")]
        getter query_type : String?

        def initialize(
          @query_id : String? = nil,
          @query_type : String? = nil
        )
        end
      end


      struct SuggestRequest
        include JSON::Serializable

        # The free-form text query to match addresses against. This is usually a partially typed address from
        # an end user in an address box or form. The fields QueryText and QueryID are mutually exclusive.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String

        # A list of optional additional parameters, such as time zone, that can be requested for each result.

        @[JSON::Field(key: "AdditionalFeatures")]
        getter additional_features : Array(String)?

        # The position, in longitude and latitude, that the results should be close to. Typically, place
        # results returned are ranked higher the closer they are to this position. Stored in [lng, lat] and in
        # the WGS 84 format. The fields BiasPosition , FilterBoundingBox , and FilterCircle are mutually
        # exclusive.

        @[JSON::Field(key: "BiasPosition")]
        getter bias_position : Array(Float64)?

        # A structure which contains a set of inclusion/exclusion properties that results must possess in
        # order to be returned as a result.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::SuggestFilter?

        # Indicates if the results will be stored. Defaults to SingleUse , if left empty.

        @[JSON::Field(key: "IntendedUse")]
        getter intended_use : String?

        # Optional: The API key to be used for authorization. Either an API key or valid SigV4 signature must
        # be provided when making a request.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A list of BCP 47 compliant language codes for the results to be rendered in. If there is no data for
        # the result in the requested language, data will be returned in the default language for the entry.

        @[JSON::Field(key: "Language")]
        getter language : String?

        # Maximum number of query terms to be returned for use with a search text query.

        @[JSON::Field(key: "MaxQueryRefinements")]
        getter max_query_refinements : Int32?

        # An optional limit for the number of results returned in a single call. Default value: 20

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The alpha-2 or alpha-3 character code for the political view of a country. The political view
        # applies to the results of the request to represent unresolved territorial claims through the point
        # of view of the specified country.

        @[JSON::Field(key: "PoliticalView")]
        getter political_view : String?

        def initialize(
          @query_text : String,
          @additional_features : Array(String)? = nil,
          @bias_position : Array(Float64)? = nil,
          @filter : Types::SuggestFilter? = nil,
          @intended_use : String? = nil,
          @key : String? = nil,
          @language : String? = nil,
          @max_query_refinements : Int32? = nil,
          @max_results : Int32? = nil,
          @political_view : String? = nil
        )
        end
      end


      struct SuggestResponse
        include JSON::Serializable

        # The pricing bucket for which the query is charged at. For more information on pricing, please visit
        # Amazon Location Service Pricing .

        @[JSON::Field(key: "x-amz-geo-pricing-bucket")]
        getter pricing_bucket : String

        # Maximum number of query terms to be returned for use with a search text query.

        @[JSON::Field(key: "QueryRefinements")]
        getter query_refinements : Array(Types::QueryRefinement)?

        # List of places or results returned for a query.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::SuggestResultItem)?

        def initialize(
          @pricing_bucket : String,
          @query_refinements : Array(Types::QueryRefinement)? = nil,
          @result_items : Array(Types::SuggestResultItem)? = nil
        )
        end
      end

      # The resulting item from the suggested query.

      struct SuggestResultItem
        include JSON::Serializable

        # The result type. Place results represent the final result for a point of interest, Query results
        # represent a follow up query which can be completed through the SearchText operation.

        @[JSON::Field(key: "SuggestResultItemType")]
        getter suggest_result_item_type : String

        # The display title that should be used when presenting this option to the end user.

        @[JSON::Field(key: "Title")]
        getter title : String

        # Describes how the parts of the response element matched the input query by returning the sections of
        # the response which matched to input query terms.

        @[JSON::Field(key: "Highlights")]
        getter highlights : Types::SuggestHighlights?

        # The suggested place by its unique ID.

        @[JSON::Field(key: "Place")]
        getter place : Types::SuggestPlaceResult?


        @[JSON::Field(key: "Query")]
        getter query : Types::SuggestQueryResult?

        def initialize(
          @suggest_result_item_type : String,
          @title : String,
          @highlights : Types::SuggestHighlights? = nil,
          @place : Types::SuggestPlaceResult? = nil,
          @query : Types::SuggestQueryResult? = nil
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

      # The time zone in which the place is located.

      struct TimeZone
        include JSON::Serializable

        # The time zone name.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Time zone offset of the timezone from UTC.

        @[JSON::Field(key: "Offset")]
        getter offset : String?

        # The offset of the time zone from UTC, in seconds.

        @[JSON::Field(key: "OffsetSeconds")]
        getter offset_seconds : Int64?

        def initialize(
          @name : String,
          @offset : String? = nil,
          @offset_seconds : Int64? = nil
        )
        end
      end

      # The USPS zip code.

      struct UspsZip
        include JSON::Serializable

        # The ZIP Classification Code, or in other words what type of postal code is it.

        @[JSON::Field(key: "ZipClassificationCode")]
        getter zip_classification_code : String?

        def initialize(
          @zip_classification_code : String? = nil
        )
        end
      end

      # The USPS zip+4 code.

      struct UspsZipPlus4
        include JSON::Serializable

        # The USPS ZIP+4 Record Type Code.

        @[JSON::Field(key: "RecordTypeCode")]
        getter record_type_code : String?

        def initialize(
          @record_type_code : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.

      struct ValidationException
        include JSON::Serializable

        # Test stub for FieldList.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)


        @[JSON::Field(key: "message")]
        getter message : String

        # Test stub for reason

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
