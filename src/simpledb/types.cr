require "json"

module Aws
  module SimpleDB
    module Types


      struct Attribute
        include JSON::Serializable

        # The name of the attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : String


        @[JSON::Field(key: "AlternateNameEncoding")]
        getter alternate_name_encoding : String?


        @[JSON::Field(key: "AlternateValueEncoding")]
        getter alternate_value_encoding : String?

        def initialize(
          @name : String,
          @value : String,
          @alternate_name_encoding : String? = nil,
          @alternate_value_encoding : String? = nil
        )
        end
      end

      # The specified attribute does not exist.

      struct AttributeDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end


      struct BatchDeleteAttributesRequest
        include JSON::Serializable

        # The name of the domain in which the attributes are being deleted.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of items on which to perform the operation.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::DeletableItem)

        def initialize(
          @domain_name : String,
          @items : Array(Types::DeletableItem)
        )
        end
      end


      struct BatchPutAttributesRequest
        include JSON::Serializable

        # The name of the domain in which the attributes are being stored.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # A list of items on which to perform the operation.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::ReplaceableItem)

        def initialize(
          @domain_name : String,
          @items : Array(Types::ReplaceableItem)
        )
        end
      end


      struct CreateDomainRequest
        include JSON::Serializable

        # The name of the domain to create. The name can range between 3 and 255 characters and can contain
        # the following characters: a-z, A-Z, 0-9, '_', '-', and '.'.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DeletableItem
        include JSON::Serializable


        @[JSON::Field(key: "ItemName")]
        getter name : String


        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @name : String,
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end


      struct DeleteAttributesRequest
        include JSON::Serializable

        # The name of the domain in which to perform the operation.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the item. Similar to rows on a spreadsheet, items represent individual objects that
        # contain one or more value-attribute pairs.

        @[JSON::Field(key: "ItemName")]
        getter item_name : String

        # A list of Attributes. Similar to columns on a spreadsheet, attributes represent categories of data
        # that can be assigned to items.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)?

        # The update condition which, if specified, determines whether the specified attributes will be
        # deleted or not. The update condition must be satisfied in order for this request to be processed and
        # the attributes to be deleted.

        @[JSON::Field(key: "Expected")]
        getter expected : Types::UpdateCondition?

        def initialize(
          @domain_name : String,
          @item_name : String,
          @attributes : Array(Types::Attribute)? = nil,
          @expected : Types::UpdateCondition? = nil
        )
        end
      end


      struct DeleteDomainRequest
        include JSON::Serializable

        # The name of the domain to delete.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DomainMetadataRequest
        include JSON::Serializable

        # The name of the domain for which to display the metadata of.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DomainMetadataResult
        include JSON::Serializable

        # The number of unique attribute names in the domain.

        @[JSON::Field(key: "AttributeNameCount")]
        getter attribute_name_count : Int32?

        # The total size of all unique attribute names in the domain, in bytes.

        @[JSON::Field(key: "AttributeNamesSizeBytes")]
        getter attribute_names_size_bytes : Int64?

        # The number of all attribute name/value pairs in the domain.

        @[JSON::Field(key: "AttributeValueCount")]
        getter attribute_value_count : Int32?

        # The total size of all attribute values in the domain, in bytes.

        @[JSON::Field(key: "AttributeValuesSizeBytes")]
        getter attribute_values_size_bytes : Int64?

        # The number of all items in the domain.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32?

        # The total size of all item names in the domain, in bytes.

        @[JSON::Field(key: "ItemNamesSizeBytes")]
        getter item_names_size_bytes : Int64?

        # The data and time when metadata was calculated, in Epoch (UNIX) seconds.

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int32?

        def initialize(
          @attribute_name_count : Int32? = nil,
          @attribute_names_size_bytes : Int64? = nil,
          @attribute_value_count : Int32? = nil,
          @attribute_values_size_bytes : Int64? = nil,
          @item_count : Int32? = nil,
          @item_names_size_bytes : Int64? = nil,
          @timestamp : Int32? = nil
        )
        end
      end

      # The item name was specified more than once.

      struct DuplicateItemName
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end


      struct GetAttributesRequest
        include JSON::Serializable

        # The name of the domain in which to perform the operation.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the item.

        @[JSON::Field(key: "ItemName")]
        getter item_name : String

        # The names of the attributes.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        # Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If
        # true , any data previously written to SimpleDB will be returned. Otherwise, results will be
        # consistent eventually, and the client may not see data that was written immediately before your
        # read.

        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        def initialize(
          @domain_name : String,
          @item_name : String,
          @attribute_names : Array(String)? = nil,
          @consistent_read : Bool? = nil
        )
        end
      end


      struct GetAttributesResult
        include JSON::Serializable

        # The list of attributes returned by the operation.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      # The specified NextToken is not valid.

      struct InvalidNextToken
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many predicates exist in the query expression.

      struct InvalidNumberPredicates
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many predicates exist in the query expression.

      struct InvalidNumberValueTests
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # The value for a parameter is invalid.

      struct InvalidParameterValue
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # The specified query expression syntax is not valid.

      struct InvalidQueryExpression
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end


      struct Item
        include JSON::Serializable

        # A list of attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)

        # The name of the item.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "AlternateNameEncoding")]
        getter alternate_name_encoding : String?

        def initialize(
          @attributes : Array(Types::Attribute),
          @name : String,
          @alternate_name_encoding : String? = nil
        )
        end
      end


      struct ListDomainsRequest
        include JSON::Serializable

        # The maximum number of domain names you want returned. The range is 1 to 100. The default setting is
        # 100.

        @[JSON::Field(key: "MaxNumberOfDomains")]
        getter max_number_of_domains : Int32?

        # A string informing Amazon SimpleDB where to start the next list of domain names.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_number_of_domains : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDomainsResult
        include JSON::Serializable

        # A list of domain names that match the expression.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(String)?

        # An opaque token indicating that there are more domains than the specified MaxNumberOfDomains still
        # available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @domain_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request must contain the specified missing parameter.

      struct MissingParameter
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # The specified domain does not exist.

      struct NoSuchDomain
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many attributes in this domain.

      struct NumberDomainAttributesExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many bytes in this domain.

      struct NumberDomainBytesExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many domains exist per this account.

      struct NumberDomainsExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many attributes in this item.

      struct NumberItemAttributesExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many attributes exist in a single call.

      struct NumberSubmittedAttributesExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Too many items exist in a single call.

      struct NumberSubmittedItemsExceeded
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end


      struct PutAttributesRequest
        include JSON::Serializable

        # The list of attributes.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ReplaceableAttribute)

        # The name of the domain in which to perform the operation.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the item.

        @[JSON::Field(key: "ItemName")]
        getter item_name : String

        # The update condition which, if specified, determines whether the specified attributes will be
        # updated or not. The update condition must be satisfied in order for this request to be processed and
        # the attributes to be updated.

        @[JSON::Field(key: "Expected")]
        getter expected : Types::UpdateCondition?

        def initialize(
          @attributes : Array(Types::ReplaceableAttribute),
          @domain_name : String,
          @item_name : String,
          @expected : Types::UpdateCondition? = nil
        )
        end
      end


      struct ReplaceableAttribute
        include JSON::Serializable

        # The name of the replaceable attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value of the replaceable attribute.

        @[JSON::Field(key: "Value")]
        getter value : String

        # A flag specifying whether or not to replace the attribute/value pair or to add a new attribute/value
        # pair. The default setting is false .

        @[JSON::Field(key: "Replace")]
        getter replace : Bool?

        def initialize(
          @name : String,
          @value : String,
          @replace : Bool? = nil
        )
        end
      end


      struct ReplaceableItem
        include JSON::Serializable

        # The list of attributes for a replaceable item.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ReplaceableAttribute)

        # The name of the replaceable item.

        @[JSON::Field(key: "ItemName")]
        getter name : String

        def initialize(
          @attributes : Array(Types::ReplaceableAttribute),
          @name : String
        )
        end
      end

      # A timeout occurred when attempting to query the specified domain with specified query expression.

      struct RequestTimeout
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end


      struct SelectRequest
        include JSON::Serializable

        # The expression used to query the domain.

        @[JSON::Field(key: "SelectExpression")]
        getter select_expression : String

        # Determines whether or not strong consistency should be enforced when data is read from SimpleDB. If
        # true , any data previously written to SimpleDB will be returned. Otherwise, results will be
        # consistent eventually, and the client may not see data that was written immediately before your
        # read.

        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # A string informing Amazon SimpleDB where to start the next list of ItemNames .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @select_expression : String,
          @consistent_read : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SelectResult
        include JSON::Serializable

        # A list of items that match the select expression.

        @[JSON::Field(key: "Items")]
        getter items : Array(Types::Item)?

        # An opaque token indicating that more items than MaxNumberOfItems were matched, the response size
        # exceeded 1 megabyte, or the execution time exceeded 5 seconds.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Item)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Too many attributes requested.

      struct TooManyRequestedAttributes
        include JSON::Serializable


        @[JSON::Field(key: "BoxUsage")]
        getter box_usage : Float64?

        def initialize(
          @box_usage : Float64? = nil
        )
        end
      end

      # Specifies the conditions under which data should be updated. If an update condition is specified for
      # a request, the data will only be updated if the condition is satisfied. For example, if an attribute
      # with a specific name and value exists, or if a specific attribute doesn't exist.

      struct UpdateCondition
        include JSON::Serializable

        # A value specifying whether or not the specified attribute must exist with the specified value in
        # order for the update condition to be satisfied. Specify true if the attribute must exist for the
        # update condition to be satisfied. Specify false if the attribute should not exist in order for the
        # update condition to be satisfied.

        @[JSON::Field(key: "Exists")]
        getter exists : Bool?

        # The name of the attribute involved in the condition.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of an attribute. This value can only be specified when the Exists parameter is equal to
        # true .

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @exists : Bool? = nil,
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end
    end
  end
end
