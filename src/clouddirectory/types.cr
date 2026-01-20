require "json"
require "time"

module Aws
  module CloudDirectory
    module Types

      # Access denied or directory not found. Either you don't have permissions for this directory or the
      # directory does not exist. Try calling ListDirectories and check your permissions.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct AddFacetToObjectRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the object you are adding the specified facet to.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Identifiers for the facet that you are adding to the object. See SchemaFacet for details.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        # Attributes on the facet that you are adding to the object.

        @[JSON::Field(key: "ObjectAttributeList")]
        getter object_attribute_list : Array(Types::AttributeKeyAndValue)?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet,
          @object_attribute_list : Array(Types::AttributeKeyAndValue)? = nil
        )
        end
      end


      struct AddFacetToObjectResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ApplySchemaRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory into which the schema is
        # copied. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Published schema Amazon Resource Name (ARN) that needs to be copied. For more information, see arns
        # .

        @[JSON::Field(key: "PublishedSchemaArn")]
        getter published_schema_arn : String

        def initialize(
          @directory_arn : String,
          @published_schema_arn : String
        )
        end
      end


      struct ApplySchemaResponse
        include JSON::Serializable

        # The applied schema ARN that is associated with the copied schema in the Directory . You can use this
        # ARN to describe the schema information applied on this directory. For more information, see arns .

        @[JSON::Field(key: "AppliedSchemaArn")]
        getter applied_schema_arn : String?

        # The ARN that is associated with the Directory . For more information, see arns .

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String?

        def initialize(
          @applied_schema_arn : String? = nil,
          @directory_arn : String? = nil
        )
        end
      end


      struct AttachObjectRequest
        include JSON::Serializable

        # The child object reference to be attached to the object.

        @[JSON::Field(key: "ChildReference")]
        getter child_reference : Types::ObjectReference

        # Amazon Resource Name (ARN) that is associated with the Directory where both objects reside. For more
        # information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The link name with which the child object is attached to the parent.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String

        # The parent object reference.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference

        def initialize(
          @child_reference : Types::ObjectReference,
          @directory_arn : String,
          @link_name : String,
          @parent_reference : Types::ObjectReference
        )
        end
      end


      struct AttachObjectResponse
        include JSON::Serializable

        # The attached ObjectIdentifier , which is the child ObjectIdentifier .

        @[JSON::Field(key: "AttachedObjectIdentifier")]
        getter attached_object_identifier : String?

        def initialize(
          @attached_object_identifier : String? = nil
        )
        end
      end


      struct AttachPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where both objects reside. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object to which the policy will be attached.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The reference that is associated with the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @policy_reference : Types::ObjectReference
        )
        end
      end


      struct AttachPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct AttachToIndexRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the directory where the object and index exist.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the index that you are attaching the object to.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # A reference to the object that you are attaching to the index.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @index_reference : Types::ObjectReference,
          @target_reference : Types::ObjectReference
        )
        end
      end


      struct AttachToIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the object that was attached to the index.

        @[JSON::Field(key: "AttachedObjectIdentifier")]
        getter attached_object_identifier : String?

        def initialize(
          @attached_object_identifier : String? = nil
        )
        end
      end


      struct AttachTypedLinkRequest
        include JSON::Serializable

        # A set of attributes that are associated with the typed link.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeNameAndValue)

        # The Amazon Resource Name (ARN) of the directory where you want to attach the typed link.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Identifies the source object that the typed link will attach to.

        @[JSON::Field(key: "SourceObjectReference")]
        getter source_object_reference : Types::ObjectReference

        # Identifies the target object that the typed link will attach to.

        @[JSON::Field(key: "TargetObjectReference")]
        getter target_object_reference : Types::ObjectReference

        # Identifies the typed link facet that is associated with the typed link.

        @[JSON::Field(key: "TypedLinkFacet")]
        getter typed_link_facet : Types::TypedLinkSchemaAndFacetName

        def initialize(
          @attributes : Array(Types::AttributeNameAndValue),
          @directory_arn : String,
          @source_object_reference : Types::ObjectReference,
          @target_object_reference : Types::ObjectReference,
          @typed_link_facet : Types::TypedLinkSchemaAndFacetName
        )
        end
      end


      struct AttachTypedLinkResponse
        include JSON::Serializable

        # Returns a typed link specifier as output.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier?

        def initialize(
          @typed_link_specifier : Types::TypedLinkSpecifier? = nil
        )
        end
      end

      # A unique identifier for an attribute.

      struct AttributeKey
        include JSON::Serializable

        # The name of the facet that the attribute exists within.

        @[JSON::Field(key: "FacetName")]
        getter facet_name : String

        # The name of the attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the schema that contains the facet and attribute.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String

        def initialize(
          @facet_name : String,
          @name : String,
          @schema_arn : String
        )
        end
      end

      # The combination of an attribute key and an attribute value.

      struct AttributeKeyAndValue
        include JSON::Serializable

        # The key of the attribute.

        @[JSON::Field(key: "Key")]
        getter key : Types::AttributeKey

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : Types::TypedAttributeValue

        def initialize(
          @key : Types::AttributeKey,
          @value : Types::TypedAttributeValue
        )
        end
      end

      # Identifies the attribute name and value for a typed link.

      struct AttributeNameAndValue
        include JSON::Serializable

        # The attribute name of the typed link.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The value for the typed link.

        @[JSON::Field(key: "Value")]
        getter value : Types::TypedAttributeValue

        def initialize(
          @attribute_name : String,
          @value : Types::TypedAttributeValue
        )
        end
      end

      # Represents the output of a batch add facet to object operation.

      struct BatchAddFacetToObject
        include JSON::Serializable

        # The attributes to set on the object.

        @[JSON::Field(key: "ObjectAttributeList")]
        getter object_attribute_list : Array(Types::AttributeKeyAndValue)

        # A reference to the object being mutated.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Represents the facet being added to the object.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        def initialize(
          @object_attribute_list : Array(Types::AttributeKeyAndValue),
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet
        )
        end
      end

      # The result of a batch add facet to object operation.

      struct BatchAddFacetToObjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of an AttachObject operation.

      struct BatchAttachObject
        include JSON::Serializable

        # The child object reference that is to be attached to the object.

        @[JSON::Field(key: "ChildReference")]
        getter child_reference : Types::ObjectReference

        # The name of the link.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String

        # The parent object reference.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference

        def initialize(
          @child_reference : Types::ObjectReference,
          @link_name : String,
          @parent_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output batch AttachObject response operation.

      struct BatchAttachObjectResponse
        include JSON::Serializable

        # The ObjectIdentifier of the object that has been attached.

        @[JSON::Field(key: "attachedObjectIdentifier")]
        getter attached_object_identifier : String?

        def initialize(
          @attached_object_identifier : String? = nil
        )
        end
      end

      # Attaches a policy object to a regular object inside a BatchRead operation. For more information, see
      # AttachPolicy and BatchReadRequest$Operations .

      struct BatchAttachPolicy
        include JSON::Serializable

        # The reference that identifies the object to which the policy will be attached.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The reference that is associated with the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        def initialize(
          @object_reference : Types::ObjectReference,
          @policy_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of an AttachPolicy response operation.

      struct BatchAttachPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Attaches the specified object to the specified index inside a BatchRead operation. For more
      # information, see AttachToIndex and BatchReadRequest$Operations .

      struct BatchAttachToIndex
        include JSON::Serializable

        # A reference to the index that you are attaching the object to.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # A reference to the object that you are attaching to the index.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        def initialize(
          @index_reference : Types::ObjectReference,
          @target_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a AttachToIndex response operation.

      struct BatchAttachToIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the object that was attached to the index.

        @[JSON::Field(key: "AttachedObjectIdentifier")]
        getter attached_object_identifier : String?

        def initialize(
          @attached_object_identifier : String? = nil
        )
        end
      end

      # Attaches a typed link to a specified source and target object inside a BatchRead operation. For more
      # information, see AttachTypedLink and BatchReadRequest$Operations .

      struct BatchAttachTypedLink
        include JSON::Serializable

        # A set of attributes that are associated with the typed link.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeNameAndValue)

        # Identifies the source object that the typed link will attach to.

        @[JSON::Field(key: "SourceObjectReference")]
        getter source_object_reference : Types::ObjectReference

        # Identifies the target object that the typed link will attach to.

        @[JSON::Field(key: "TargetObjectReference")]
        getter target_object_reference : Types::ObjectReference

        # Identifies the typed link facet that is associated with the typed link.

        @[JSON::Field(key: "TypedLinkFacet")]
        getter typed_link_facet : Types::TypedLinkSchemaAndFacetName

        def initialize(
          @attributes : Array(Types::AttributeNameAndValue),
          @source_object_reference : Types::ObjectReference,
          @target_object_reference : Types::ObjectReference,
          @typed_link_facet : Types::TypedLinkSchemaAndFacetName
        )
        end
      end

      # Represents the output of a AttachTypedLink response operation.

      struct BatchAttachTypedLinkResponse
        include JSON::Serializable

        # Returns a typed link specifier as output.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier?

        def initialize(
          @typed_link_specifier : Types::TypedLinkSpecifier? = nil
        )
        end
      end

      # Creates an index object inside of a BatchRead operation. For more information, see CreateIndex and
      # BatchReadRequest$Operations .

      struct BatchCreateIndex
        include JSON::Serializable

        # Indicates whether the attribute that is being indexed has unique values or not.

        @[JSON::Field(key: "IsUnique")]
        getter is_unique : Bool

        # Specifies the attributes that should be indexed on. Currently only a single attribute is supported.

        @[JSON::Field(key: "OrderedIndexedAttributeList")]
        getter ordered_indexed_attribute_list : Array(Types::AttributeKey)

        # The batch reference name. See Transaction Support for more information.

        @[JSON::Field(key: "BatchReferenceName")]
        getter batch_reference_name : String?

        # The name of the link between the parent object and the index object.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        # A reference to the parent object that contains the index object.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference?

        def initialize(
          @is_unique : Bool,
          @ordered_indexed_attribute_list : Array(Types::AttributeKey),
          @batch_reference_name : String? = nil,
          @link_name : String? = nil,
          @parent_reference : Types::ObjectReference? = nil
        )
        end
      end

      # Represents the output of a CreateIndex response operation.

      struct BatchCreateIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the index created by this operation.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end

      # Represents the output of a CreateObject operation.

      struct BatchCreateObject
        include JSON::Serializable

        # An attribute map, which contains an attribute ARN as the key and attribute value as the map value.

        @[JSON::Field(key: "ObjectAttributeList")]
        getter object_attribute_list : Array(Types::AttributeKeyAndValue)

        # A list of FacetArns that will be associated with the object. For more information, see arns .

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Array(Types::SchemaFacet)

        # The batch reference name. See Transaction Support for more information.

        @[JSON::Field(key: "BatchReferenceName")]
        getter batch_reference_name : String?

        # The name of the link.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        # If specified, the parent reference to which this object will be attached.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference?

        def initialize(
          @object_attribute_list : Array(Types::AttributeKeyAndValue),
          @schema_facet : Array(Types::SchemaFacet),
          @batch_reference_name : String? = nil,
          @link_name : String? = nil,
          @parent_reference : Types::ObjectReference? = nil
        )
        end
      end

      # Represents the output of a CreateObject response operation.

      struct BatchCreateObjectResponse
        include JSON::Serializable

        # The ID that is associated with the object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end

      # Represents the output of a DeleteObject operation.

      struct BatchDeleteObject
        include JSON::Serializable

        # The reference that identifies the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        def initialize(
          @object_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a DeleteObject response operation.

      struct BatchDeleteObjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Detaches the specified object from the specified index inside a BatchRead operation. For more
      # information, see DetachFromIndex and BatchReadRequest$Operations .

      struct BatchDetachFromIndex
        include JSON::Serializable

        # A reference to the index object.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # A reference to the object being detached from the index.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        def initialize(
          @index_reference : Types::ObjectReference,
          @target_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a DetachFromIndex response operation.

      struct BatchDetachFromIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the object that was detached from the index.

        @[JSON::Field(key: "DetachedObjectIdentifier")]
        getter detached_object_identifier : String?

        def initialize(
          @detached_object_identifier : String? = nil
        )
        end
      end

      # Represents the output of a DetachObject operation.

      struct BatchDetachObject
        include JSON::Serializable

        # The name of the link.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String

        # Parent reference from which the object with the specified link name is detached.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference

        # The batch reference name. See Transaction Support for more information.

        @[JSON::Field(key: "BatchReferenceName")]
        getter batch_reference_name : String?

        def initialize(
          @link_name : String,
          @parent_reference : Types::ObjectReference,
          @batch_reference_name : String? = nil
        )
        end
      end

      # Represents the output of a DetachObject response operation.

      struct BatchDetachObjectResponse
        include JSON::Serializable

        # The ObjectIdentifier of the detached object.

        @[JSON::Field(key: "detachedObjectIdentifier")]
        getter detached_object_identifier : String?

        def initialize(
          @detached_object_identifier : String? = nil
        )
        end
      end

      # Detaches the specified policy from the specified directory inside a BatchWrite operation. For more
      # information, see DetachPolicy and BatchWriteRequest$Operations .

      struct BatchDetachPolicy
        include JSON::Serializable

        # Reference that identifies the object whose policy object will be detached.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Reference that identifies the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        def initialize(
          @object_reference : Types::ObjectReference,
          @policy_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a DetachPolicy response operation.

      struct BatchDetachPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Detaches a typed link from a specified source and target object inside a BatchRead operation. For
      # more information, see DetachTypedLink and BatchReadRequest$Operations .

      struct BatchDetachTypedLink
        include JSON::Serializable

        # Used to accept a typed link specifier as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        def initialize(
          @typed_link_specifier : Types::TypedLinkSpecifier
        )
        end
      end

      # Represents the output of a DetachTypedLink response operation.

      struct BatchDetachTypedLinkResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Retrieves attributes that are associated with a typed link inside a BatchRead operation. For more
      # information, see GetLinkAttributes and BatchReadRequest$Operations .

      struct BatchGetLinkAttributes
        include JSON::Serializable

        # A list of attribute names whose values will be retrieved.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # Allows a typed link specifier to be accepted as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        def initialize(
          @attribute_names : Array(String),
          @typed_link_specifier : Types::TypedLinkSpecifier
        )
        end
      end

      # Represents the output of a GetLinkAttributes response operation.

      struct BatchGetLinkAttributesResponse
        include JSON::Serializable

        # The attributes that are associated with the typed link.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil
        )
        end
      end

      # Retrieves attributes within a facet that are associated with an object inside an BatchRead
      # operation. For more information, see GetObjectAttributes and BatchReadRequest$Operations .

      struct BatchGetObjectAttributes
        include JSON::Serializable

        # List of attribute names whose values will be retrieved.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # Reference that identifies the object whose attributes will be retrieved.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Identifier for the facet whose attributes will be retrieved. See SchemaFacet for details.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        def initialize(
          @attribute_names : Array(String),
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet
        )
        end
      end

      # Represents the output of a GetObjectAttributes response operation.

      struct BatchGetObjectAttributesResponse
        include JSON::Serializable

        # The attribute values that are associated with an object.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil
        )
        end
      end

      # Retrieves metadata about an object inside a BatchRead operation. For more information, see
      # GetObjectInformation and BatchReadRequest$Operations .

      struct BatchGetObjectInformation
        include JSON::Serializable

        # A reference to the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        def initialize(
          @object_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a GetObjectInformation response operation.

      struct BatchGetObjectInformationResponse
        include JSON::Serializable

        # The ObjectIdentifier of the specified object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        # The facets attached to the specified object.

        @[JSON::Field(key: "SchemaFacets")]
        getter schema_facets : Array(Types::SchemaFacet)?

        def initialize(
          @object_identifier : String? = nil,
          @schema_facets : Array(Types::SchemaFacet)? = nil
        )
        end
      end

      # Lists indices attached to an object inside a BatchRead operation. For more information, see
      # ListAttachedIndices and BatchReadRequest$Operations .

      struct BatchListAttachedIndices
        include JSON::Serializable

        # A reference to the object that has indices attached.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @target_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListAttachedIndices response operation.

      struct BatchListAttachedIndicesResponse
        include JSON::Serializable

        # The indices attached to the specified object.

        @[JSON::Field(key: "IndexAttachments")]
        getter index_attachments : Array(Types::IndexAttachment)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_attachments : Array(Types::IndexAttachment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns a paginated list of all the incoming TypedLinkSpecifier information for an object inside a
      # BatchRead operation. For more information, see ListIncomingTypedLinks and
      # BatchReadRequest$Operations .

      struct BatchListIncomingTypedLinks
        include JSON::Serializable

        # The reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Provides range filters for multiple attributes. When providing ranges to typed link selection, any
        # inexact ranges must be specified at the end. Any attributes that do not have a range specified are
        # presumed to match the entire range.

        @[JSON::Field(key: "FilterAttributeRanges")]
        getter filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)?

        # Filters are interpreted in the order of the attributes on the typed link facet, not the order in
        # which they are supplied to any API calls.

        @[JSON::Field(key: "FilterTypedLink")]
        getter filter_typed_link : Types::TypedLinkSchemaAndFacetName?

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
          @filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListIncomingTypedLinks response operation.

      struct BatchListIncomingTypedLinksResponse
        include JSON::Serializable

        # Returns one or more typed link specifiers as output.

        @[JSON::Field(key: "LinkSpecifiers")]
        getter link_specifiers : Array(Types::TypedLinkSpecifier)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @link_specifiers : Array(Types::TypedLinkSpecifier)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Lists objects attached to the specified index inside a BatchRead operation. For more information,
      # see ListIndex and BatchReadRequest$Operations .

      struct BatchListIndex
        include JSON::Serializable

        # The reference to the index to list.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the ranges of indexed values that you want to query.

        @[JSON::Field(key: "RangesOnIndexedValues")]
        getter ranges_on_indexed_values : Array(Types::ObjectAttributeRange)?

        def initialize(
          @index_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ranges_on_indexed_values : Array(Types::ObjectAttributeRange)? = nil
        )
        end
      end

      # Represents the output of a ListIndex response operation.

      struct BatchListIndexResponse
        include JSON::Serializable

        # The objects and indexed values attached to the index.

        @[JSON::Field(key: "IndexAttachments")]
        getter index_attachments : Array(Types::IndexAttachment)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_attachments : Array(Types::IndexAttachment)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectAttributes operation.

      struct BatchListObjectAttributes
        include JSON::Serializable

        # Reference of the object whose attributes need to be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Used to filter the list of object attributes that are associated with a certain facet.

        @[JSON::Field(key: "FacetFilter")]
        getter facet_filter : Types::SchemaFacet?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @facet_filter : Types::SchemaFacet? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectAttributes response operation.

      struct BatchListObjectAttributesResponse
        include JSON::Serializable

        # The attributes map that is associated with the object. AttributeArn is the key; attribute value is
        # the value.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectChildren operation.

      struct BatchListObjectChildren
        include JSON::Serializable

        # Reference of the object for which child objects are being listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectChildren response operation.

      struct BatchListObjectChildrenResponse
        include JSON::Serializable

        # The children structure, which is a map with the key as the LinkName and ObjectIdentifier as the
        # value.

        @[JSON::Field(key: "Children")]
        getter children : Hash(String, String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @children : Hash(String, String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Retrieves all available parent paths for any object type such as node, leaf node, policy node, and
      # index node objects inside a BatchRead operation. For more information, see ListObjectParentPaths and
      # BatchReadRequest$Operations .

      struct BatchListObjectParentPaths
        include JSON::Serializable

        # The reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectParentPaths response operation.

      struct BatchListObjectParentPathsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the path to the ObjectIdentifiers that are associated with the directory.

        @[JSON::Field(key: "PathToObjectIdentifiersList")]
        getter path_to_object_identifiers_list : Array(Types::PathToObjectIdentifiers)?

        def initialize(
          @next_token : String? = nil,
          @path_to_object_identifiers_list : Array(Types::PathToObjectIdentifiers)? = nil
        )
        end
      end

      # Lists parent objects that are associated with a given object in pagination fashion.

      struct BatchListObjectParents
        include JSON::Serializable


        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectParents response operation.

      struct BatchListObjectParentsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of parent reference and LinkName Tuples.

        @[JSON::Field(key: "ParentLinks")]
        getter parent_links : Array(Types::ObjectIdentifierAndLinkNameTuple)?

        def initialize(
          @next_token : String? = nil,
          @parent_links : Array(Types::ObjectIdentifierAndLinkNameTuple)? = nil
        )
        end
      end

      # Returns policies attached to an object in pagination fashion inside a BatchRead operation. For more
      # information, see ListObjectPolicies and BatchReadRequest$Operations .

      struct BatchListObjectPolicies
        include JSON::Serializable

        # The reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListObjectPolicies response operation.

      struct BatchListObjectPoliciesResponse
        include JSON::Serializable

        # A list of policy ObjectIdentifiers , that are attached to the object.

        @[JSON::Field(key: "AttachedPolicyIds")]
        getter attached_policy_ids : Array(String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attached_policy_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns a paginated list of all the outgoing TypedLinkSpecifier information for an object inside a
      # BatchRead operation. For more information, see ListOutgoingTypedLinks and
      # BatchReadRequest$Operations .

      struct BatchListOutgoingTypedLinks
        include JSON::Serializable

        # The reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Provides range filters for multiple attributes. When providing ranges to typed link selection, any
        # inexact ranges must be specified at the end. Any attributes that do not have a range specified are
        # presumed to match the entire range.

        @[JSON::Field(key: "FilterAttributeRanges")]
        getter filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)?

        # Filters are interpreted in the order of the attributes defined on the typed link facet, not the
        # order they are supplied to any API calls.

        @[JSON::Field(key: "FilterTypedLink")]
        getter filter_typed_link : Types::TypedLinkSchemaAndFacetName?

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
          @filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListOutgoingTypedLinks response operation.

      struct BatchListOutgoingTypedLinksResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a typed link specifier as output.

        @[JSON::Field(key: "TypedLinkSpecifiers")]
        getter typed_link_specifiers : Array(Types::TypedLinkSpecifier)?

        def initialize(
          @next_token : String? = nil,
          @typed_link_specifiers : Array(Types::TypedLinkSpecifier)? = nil
        )
        end
      end

      # Returns all of the ObjectIdentifiers to which a given policy is attached inside a BatchRead
      # operation. For more information, see ListPolicyAttachments and BatchReadRequest$Operations .

      struct BatchListPolicyAttachments
        include JSON::Serializable

        # The reference that identifies the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @policy_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListPolicyAttachments response operation.

      struct BatchListPolicyAttachmentsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of ObjectIdentifiers to which the policy is attached.

        @[JSON::Field(key: "ObjectIdentifiers")]
        getter object_identifiers : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @object_identifiers : Array(String)? = nil
        )
        end
      end

      # Lists all policies from the root of the Directory to the object specified inside a BatchRead
      # operation. For more information, see LookupPolicy and BatchReadRequest$Operations .

      struct BatchLookupPolicy
        include JSON::Serializable

        # Reference that identifies the object whose policies will be looked up.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a LookupPolicy response operation.

      struct BatchLookupPolicyResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Provides list of path to policies. Policies contain PolicyId , ObjectIdentifier , and PolicyType .
        # For more information, see Policies .

        @[JSON::Field(key: "PolicyToPathList")]
        getter policy_to_path_list : Array(Types::PolicyToPath)?

        def initialize(
          @next_token : String? = nil,
          @policy_to_path_list : Array(Types::PolicyToPath)? = nil
        )
        end
      end

      # The batch read exception structure, which contains the exception type and message.

      struct BatchReadException
        include JSON::Serializable

        # An exception message that is associated with the failure.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # A type of exception, such as InvalidArnException .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the output of a BatchRead operation.

      struct BatchReadOperation
        include JSON::Serializable

        # Retrieves attributes that are associated with a typed link.

        @[JSON::Field(key: "GetLinkAttributes")]
        getter get_link_attributes : Types::BatchGetLinkAttributes?

        # Retrieves attributes within a facet that are associated with an object.

        @[JSON::Field(key: "GetObjectAttributes")]
        getter get_object_attributes : Types::BatchGetObjectAttributes?

        # Retrieves metadata about an object.

        @[JSON::Field(key: "GetObjectInformation")]
        getter get_object_information : Types::BatchGetObjectInformation?

        # Lists indices attached to an object.

        @[JSON::Field(key: "ListAttachedIndices")]
        getter list_attached_indices : Types::BatchListAttachedIndices?

        # Returns a paginated list of all the incoming TypedLinkSpecifier information for an object. It also
        # supports filtering by typed link facet and identity attributes. For more information, see Typed
        # Links .

        @[JSON::Field(key: "ListIncomingTypedLinks")]
        getter list_incoming_typed_links : Types::BatchListIncomingTypedLinks?

        # Lists objects attached to the specified index.

        @[JSON::Field(key: "ListIndex")]
        getter list_index : Types::BatchListIndex?

        # Lists all attributes that are associated with an object.

        @[JSON::Field(key: "ListObjectAttributes")]
        getter list_object_attributes : Types::BatchListObjectAttributes?

        # Returns a paginated list of child objects that are associated with a given object.

        @[JSON::Field(key: "ListObjectChildren")]
        getter list_object_children : Types::BatchListObjectChildren?

        # Retrieves all available parent paths for any object type such as node, leaf node, policy node, and
        # index node objects. For more information about objects, see Directory Structure .

        @[JSON::Field(key: "ListObjectParentPaths")]
        getter list_object_parent_paths : Types::BatchListObjectParentPaths?

        # Lists parent objects that are associated with a given object in pagination fashion.

        @[JSON::Field(key: "ListObjectParents")]
        getter list_object_parents : Types::BatchListObjectParents?

        # Returns policies attached to an object in pagination fashion.

        @[JSON::Field(key: "ListObjectPolicies")]
        getter list_object_policies : Types::BatchListObjectPolicies?

        # Returns a paginated list of all the outgoing TypedLinkSpecifier information for an object. It also
        # supports filtering by typed link facet and identity attributes. For more information, see Typed
        # Links .

        @[JSON::Field(key: "ListOutgoingTypedLinks")]
        getter list_outgoing_typed_links : Types::BatchListOutgoingTypedLinks?

        # Returns all of the ObjectIdentifiers to which a given policy is attached.

        @[JSON::Field(key: "ListPolicyAttachments")]
        getter list_policy_attachments : Types::BatchListPolicyAttachments?

        # Lists all policies from the root of the Directory to the object specified. If there are no policies
        # present, an empty list is returned. If policies are present, and if some objects don't have the
        # policies attached, it returns the ObjectIdentifier for such objects. If policies are present, it
        # returns ObjectIdentifier , policyId , and policyType . Paths that don't lead to the root from the
        # target object are ignored. For more information, see Policies .

        @[JSON::Field(key: "LookupPolicy")]
        getter lookup_policy : Types::BatchLookupPolicy?

        def initialize(
          @get_link_attributes : Types::BatchGetLinkAttributes? = nil,
          @get_object_attributes : Types::BatchGetObjectAttributes? = nil,
          @get_object_information : Types::BatchGetObjectInformation? = nil,
          @list_attached_indices : Types::BatchListAttachedIndices? = nil,
          @list_incoming_typed_links : Types::BatchListIncomingTypedLinks? = nil,
          @list_index : Types::BatchListIndex? = nil,
          @list_object_attributes : Types::BatchListObjectAttributes? = nil,
          @list_object_children : Types::BatchListObjectChildren? = nil,
          @list_object_parent_paths : Types::BatchListObjectParentPaths? = nil,
          @list_object_parents : Types::BatchListObjectParents? = nil,
          @list_object_policies : Types::BatchListObjectPolicies? = nil,
          @list_outgoing_typed_links : Types::BatchListOutgoingTypedLinks? = nil,
          @list_policy_attachments : Types::BatchListPolicyAttachments? = nil,
          @lookup_policy : Types::BatchLookupPolicy? = nil
        )
        end
      end

      # Represents the output of a BatchRead response operation.

      struct BatchReadOperationResponse
        include JSON::Serializable

        # Identifies which operation in a batch has failed.

        @[JSON::Field(key: "ExceptionResponse")]
        getter exception_response : Types::BatchReadException?

        # Identifies which operation in a batch has succeeded.

        @[JSON::Field(key: "SuccessfulResponse")]
        getter successful_response : Types::BatchReadSuccessfulResponse?

        def initialize(
          @exception_response : Types::BatchReadException? = nil,
          @successful_response : Types::BatchReadSuccessfulResponse? = nil
        )
        end
      end


      struct BatchReadRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory . For more information, see
        # arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A list of operations that are part of the batch.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::BatchReadOperation)

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        def initialize(
          @directory_arn : String,
          @operations : Array(Types::BatchReadOperation),
          @consistency_level : String? = nil
        )
        end
      end


      struct BatchReadResponse
        include JSON::Serializable

        # A list of all the responses for each batch read.

        @[JSON::Field(key: "Responses")]
        getter responses : Array(Types::BatchReadOperationResponse)?

        def initialize(
          @responses : Array(Types::BatchReadOperationResponse)? = nil
        )
        end
      end

      # Represents the output of a BatchRead success response operation.

      struct BatchReadSuccessfulResponse
        include JSON::Serializable

        # The list of attributes to retrieve from the typed link.

        @[JSON::Field(key: "GetLinkAttributes")]
        getter get_link_attributes : Types::BatchGetLinkAttributesResponse?

        # Retrieves attributes within a facet that are associated with an object.

        @[JSON::Field(key: "GetObjectAttributes")]
        getter get_object_attributes : Types::BatchGetObjectAttributesResponse?

        # Retrieves metadata about an object.

        @[JSON::Field(key: "GetObjectInformation")]
        getter get_object_information : Types::BatchGetObjectInformationResponse?

        # Lists indices attached to an object.

        @[JSON::Field(key: "ListAttachedIndices")]
        getter list_attached_indices : Types::BatchListAttachedIndicesResponse?

        # Returns a paginated list of all the incoming TypedLinkSpecifier information for an object. It also
        # supports filtering by typed link facet and identity attributes. For more information, see Typed
        # Links .

        @[JSON::Field(key: "ListIncomingTypedLinks")]
        getter list_incoming_typed_links : Types::BatchListIncomingTypedLinksResponse?

        # Lists objects attached to the specified index.

        @[JSON::Field(key: "ListIndex")]
        getter list_index : Types::BatchListIndexResponse?

        # Lists all attributes that are associated with an object.

        @[JSON::Field(key: "ListObjectAttributes")]
        getter list_object_attributes : Types::BatchListObjectAttributesResponse?

        # Returns a paginated list of child objects that are associated with a given object.

        @[JSON::Field(key: "ListObjectChildren")]
        getter list_object_children : Types::BatchListObjectChildrenResponse?

        # Retrieves all available parent paths for any object type such as node, leaf node, policy node, and
        # index node objects. For more information about objects, see Directory Structure .

        @[JSON::Field(key: "ListObjectParentPaths")]
        getter list_object_parent_paths : Types::BatchListObjectParentPathsResponse?

        # The list of parent objects to retrieve.

        @[JSON::Field(key: "ListObjectParents")]
        getter list_object_parents : Types::BatchListObjectParentsResponse?

        # Returns policies attached to an object in pagination fashion.

        @[JSON::Field(key: "ListObjectPolicies")]
        getter list_object_policies : Types::BatchListObjectPoliciesResponse?

        # Returns a paginated list of all the outgoing TypedLinkSpecifier information for an object. It also
        # supports filtering by typed link facet and identity attributes. For more information, see Typed
        # Links .

        @[JSON::Field(key: "ListOutgoingTypedLinks")]
        getter list_outgoing_typed_links : Types::BatchListOutgoingTypedLinksResponse?

        # Returns all of the ObjectIdentifiers to which a given policy is attached.

        @[JSON::Field(key: "ListPolicyAttachments")]
        getter list_policy_attachments : Types::BatchListPolicyAttachmentsResponse?

        # Lists all policies from the root of the Directory to the object specified. If there are no policies
        # present, an empty list is returned. If policies are present, and if some objects don't have the
        # policies attached, it returns the ObjectIdentifier for such objects. If policies are present, it
        # returns ObjectIdentifier , policyId , and policyType . Paths that don't lead to the root from the
        # target object are ignored. For more information, see Policies .

        @[JSON::Field(key: "LookupPolicy")]
        getter lookup_policy : Types::BatchLookupPolicyResponse?

        def initialize(
          @get_link_attributes : Types::BatchGetLinkAttributesResponse? = nil,
          @get_object_attributes : Types::BatchGetObjectAttributesResponse? = nil,
          @get_object_information : Types::BatchGetObjectInformationResponse? = nil,
          @list_attached_indices : Types::BatchListAttachedIndicesResponse? = nil,
          @list_incoming_typed_links : Types::BatchListIncomingTypedLinksResponse? = nil,
          @list_index : Types::BatchListIndexResponse? = nil,
          @list_object_attributes : Types::BatchListObjectAttributesResponse? = nil,
          @list_object_children : Types::BatchListObjectChildrenResponse? = nil,
          @list_object_parent_paths : Types::BatchListObjectParentPathsResponse? = nil,
          @list_object_parents : Types::BatchListObjectParentsResponse? = nil,
          @list_object_policies : Types::BatchListObjectPoliciesResponse? = nil,
          @list_outgoing_typed_links : Types::BatchListOutgoingTypedLinksResponse? = nil,
          @list_policy_attachments : Types::BatchListPolicyAttachmentsResponse? = nil,
          @lookup_policy : Types::BatchLookupPolicyResponse? = nil
        )
        end
      end

      # A batch operation to remove a facet from an object.

      struct BatchRemoveFacetFromObject
        include JSON::Serializable

        # A reference to the object whose facet will be removed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The facet to remove from the object.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        def initialize(
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet
        )
        end
      end

      # An empty result that represents success.

      struct BatchRemoveFacetFromObjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Updates a given typed link’s attributes inside a BatchRead operation. Attributes to be updated must
      # not contribute to the typed link’s identity, as defined by its IdentityAttributeOrder . For more
      # information, see UpdateLinkAttributes and BatchReadRequest$Operations .

      struct BatchUpdateLinkAttributes
        include JSON::Serializable

        # The attributes update structure.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::LinkAttributeUpdate)

        # Allows a typed link specifier to be accepted as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        def initialize(
          @attribute_updates : Array(Types::LinkAttributeUpdate),
          @typed_link_specifier : Types::TypedLinkSpecifier
        )
        end
      end

      # Represents the output of a UpdateLinkAttributes response operation.

      struct BatchUpdateLinkAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a BatchUpdate operation.

      struct BatchUpdateObjectAttributes
        include JSON::Serializable

        # Attributes update structure.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::ObjectAttributeUpdate)

        # Reference that identifies the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        def initialize(
          @attribute_updates : Array(Types::ObjectAttributeUpdate),
          @object_reference : Types::ObjectReference
        )
        end
      end

      # Represents the output of a BatchUpdate response operation.

      struct BatchUpdateObjectAttributesResponse
        include JSON::Serializable

        # ID that is associated with the object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end

      # A BatchWrite exception has occurred.

      struct BatchWriteException
        include JSON::Serializable


        @[JSON::Field(key: "Index")]
        getter index : Int32?


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @index : Int32? = nil,
          @message : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the output of a BatchWrite operation.

      struct BatchWriteOperation
        include JSON::Serializable

        # A batch operation that adds a facet to an object.

        @[JSON::Field(key: "AddFacetToObject")]
        getter add_facet_to_object : Types::BatchAddFacetToObject?

        # Attaches an object to a Directory .

        @[JSON::Field(key: "AttachObject")]
        getter attach_object : Types::BatchAttachObject?

        # Attaches a policy object to a regular object. An object can have a limited number of attached
        # policies.

        @[JSON::Field(key: "AttachPolicy")]
        getter attach_policy : Types::BatchAttachPolicy?

        # Attaches the specified object to the specified index.

        @[JSON::Field(key: "AttachToIndex")]
        getter attach_to_index : Types::BatchAttachToIndex?

        # Attaches a typed link to a specified source and target object. For more information, see Typed Links
        # .

        @[JSON::Field(key: "AttachTypedLink")]
        getter attach_typed_link : Types::BatchAttachTypedLink?

        # Creates an index object. See Indexing and search for more information.

        @[JSON::Field(key: "CreateIndex")]
        getter create_index : Types::BatchCreateIndex?

        # Creates an object.

        @[JSON::Field(key: "CreateObject")]
        getter create_object : Types::BatchCreateObject?

        # Deletes an object in a Directory .

        @[JSON::Field(key: "DeleteObject")]
        getter delete_object : Types::BatchDeleteObject?

        # Detaches the specified object from the specified index.

        @[JSON::Field(key: "DetachFromIndex")]
        getter detach_from_index : Types::BatchDetachFromIndex?

        # Detaches an object from a Directory .

        @[JSON::Field(key: "DetachObject")]
        getter detach_object : Types::BatchDetachObject?

        # Detaches a policy from a Directory .

        @[JSON::Field(key: "DetachPolicy")]
        getter detach_policy : Types::BatchDetachPolicy?

        # Detaches a typed link from a specified source and target object. For more information, see Typed
        # Links .

        @[JSON::Field(key: "DetachTypedLink")]
        getter detach_typed_link : Types::BatchDetachTypedLink?

        # A batch operation that removes a facet from an object.

        @[JSON::Field(key: "RemoveFacetFromObject")]
        getter remove_facet_from_object : Types::BatchRemoveFacetFromObject?

        # Updates a given object's attributes.

        @[JSON::Field(key: "UpdateLinkAttributes")]
        getter update_link_attributes : Types::BatchUpdateLinkAttributes?

        # Updates a given object's attributes.

        @[JSON::Field(key: "UpdateObjectAttributes")]
        getter update_object_attributes : Types::BatchUpdateObjectAttributes?

        def initialize(
          @add_facet_to_object : Types::BatchAddFacetToObject? = nil,
          @attach_object : Types::BatchAttachObject? = nil,
          @attach_policy : Types::BatchAttachPolicy? = nil,
          @attach_to_index : Types::BatchAttachToIndex? = nil,
          @attach_typed_link : Types::BatchAttachTypedLink? = nil,
          @create_index : Types::BatchCreateIndex? = nil,
          @create_object : Types::BatchCreateObject? = nil,
          @delete_object : Types::BatchDeleteObject? = nil,
          @detach_from_index : Types::BatchDetachFromIndex? = nil,
          @detach_object : Types::BatchDetachObject? = nil,
          @detach_policy : Types::BatchDetachPolicy? = nil,
          @detach_typed_link : Types::BatchDetachTypedLink? = nil,
          @remove_facet_from_object : Types::BatchRemoveFacetFromObject? = nil,
          @update_link_attributes : Types::BatchUpdateLinkAttributes? = nil,
          @update_object_attributes : Types::BatchUpdateObjectAttributes? = nil
        )
        end
      end

      # Represents the output of a BatchWrite response operation.

      struct BatchWriteOperationResponse
        include JSON::Serializable

        # The result of an add facet to object batch operation.

        @[JSON::Field(key: "AddFacetToObject")]
        getter add_facet_to_object : Types::BatchAddFacetToObjectResponse?

        # Attaches an object to a Directory .

        @[JSON::Field(key: "AttachObject")]
        getter attach_object : Types::BatchAttachObjectResponse?

        # Attaches a policy object to a regular object. An object can have a limited number of attached
        # policies.

        @[JSON::Field(key: "AttachPolicy")]
        getter attach_policy : Types::BatchAttachPolicyResponse?

        # Attaches the specified object to the specified index.

        @[JSON::Field(key: "AttachToIndex")]
        getter attach_to_index : Types::BatchAttachToIndexResponse?

        # Attaches a typed link to a specified source and target object. For more information, see Typed Links
        # .

        @[JSON::Field(key: "AttachTypedLink")]
        getter attach_typed_link : Types::BatchAttachTypedLinkResponse?

        # Creates an index object. See Indexing and search for more information.

        @[JSON::Field(key: "CreateIndex")]
        getter create_index : Types::BatchCreateIndexResponse?

        # Creates an object in a Directory .

        @[JSON::Field(key: "CreateObject")]
        getter create_object : Types::BatchCreateObjectResponse?

        # Deletes an object in a Directory .

        @[JSON::Field(key: "DeleteObject")]
        getter delete_object : Types::BatchDeleteObjectResponse?

        # Detaches the specified object from the specified index.

        @[JSON::Field(key: "DetachFromIndex")]
        getter detach_from_index : Types::BatchDetachFromIndexResponse?

        # Detaches an object from a Directory .

        @[JSON::Field(key: "DetachObject")]
        getter detach_object : Types::BatchDetachObjectResponse?

        # Detaches a policy from a Directory .

        @[JSON::Field(key: "DetachPolicy")]
        getter detach_policy : Types::BatchDetachPolicyResponse?

        # Detaches a typed link from a specified source and target object. For more information, see Typed
        # Links .

        @[JSON::Field(key: "DetachTypedLink")]
        getter detach_typed_link : Types::BatchDetachTypedLinkResponse?

        # The result of a batch remove facet from object operation.

        @[JSON::Field(key: "RemoveFacetFromObject")]
        getter remove_facet_from_object : Types::BatchRemoveFacetFromObjectResponse?

        # Represents the output of a BatchWrite response operation.

        @[JSON::Field(key: "UpdateLinkAttributes")]
        getter update_link_attributes : Types::BatchUpdateLinkAttributesResponse?

        # Updates a given object’s attributes.

        @[JSON::Field(key: "UpdateObjectAttributes")]
        getter update_object_attributes : Types::BatchUpdateObjectAttributesResponse?

        def initialize(
          @add_facet_to_object : Types::BatchAddFacetToObjectResponse? = nil,
          @attach_object : Types::BatchAttachObjectResponse? = nil,
          @attach_policy : Types::BatchAttachPolicyResponse? = nil,
          @attach_to_index : Types::BatchAttachToIndexResponse? = nil,
          @attach_typed_link : Types::BatchAttachTypedLinkResponse? = nil,
          @create_index : Types::BatchCreateIndexResponse? = nil,
          @create_object : Types::BatchCreateObjectResponse? = nil,
          @delete_object : Types::BatchDeleteObjectResponse? = nil,
          @detach_from_index : Types::BatchDetachFromIndexResponse? = nil,
          @detach_object : Types::BatchDetachObjectResponse? = nil,
          @detach_policy : Types::BatchDetachPolicyResponse? = nil,
          @detach_typed_link : Types::BatchDetachTypedLinkResponse? = nil,
          @remove_facet_from_object : Types::BatchRemoveFacetFromObjectResponse? = nil,
          @update_link_attributes : Types::BatchUpdateLinkAttributesResponse? = nil,
          @update_object_attributes : Types::BatchUpdateObjectAttributesResponse? = nil
        )
        end
      end


      struct BatchWriteRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory . For more information, see
        # arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A list of operations that are part of the batch.

        @[JSON::Field(key: "Operations")]
        getter operations : Array(Types::BatchWriteOperation)

        def initialize(
          @directory_arn : String,
          @operations : Array(Types::BatchWriteOperation)
        )
        end
      end


      struct BatchWriteResponse
        include JSON::Serializable

        # A list of all the responses for each batch write.

        @[JSON::Field(key: "Responses")]
        getter responses : Array(Types::BatchWriteOperationResponse)?

        def initialize(
          @responses : Array(Types::BatchWriteOperationResponse)? = nil
        )
        end
      end

      # Cannot list the parents of a Directory root.

      struct CannotListParentOfRootException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateDirectoryRequest
        include JSON::Serializable

        # The name of the Directory . Should be unique per account, per region.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the published schema that will be copied into the data Directory .
        # For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct CreateDirectoryResponse
        include JSON::Serializable

        # The ARN of the published schema in the Directory . Once a published schema is copied into the
        # directory, it has its own ARN, which is referred to applied schema ARN. For more information, see
        # arns .

        @[JSON::Field(key: "AppliedSchemaArn")]
        getter applied_schema_arn : String

        # The ARN that is associated with the Directory . For more information, see arns .

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        # The name of the Directory .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The root object node of the created directory.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String

        def initialize(
          @applied_schema_arn : String,
          @directory_arn : String,
          @name : String,
          @object_identifier : String
        )
        end
      end


      struct CreateFacetRequest
        include JSON::Serializable

        # The name of the Facet , which is unique for a given schema.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The schema ARN in which the new Facet will be created. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # The attributes that are associated with the Facet .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::FacetAttribute)?

        # There are two different styles that you can define on any given facet, Static and Dynamic . For
        # static facets, all attributes must be defined in the schema. For dynamic facets, attributes can be
        # defined during data plane operations.

        @[JSON::Field(key: "FacetStyle")]
        getter facet_style : String?

        # Specifies whether a given object created from this facet is of type node, leaf node, policy or
        # index. Node: Can have multiple children but one parent. Leaf node: Cannot have children but can have
        # multiple parents. Policy: Allows you to store a policy document and policy type. For more
        # information, see Policies . Index: Can be created with the Index API.

        @[JSON::Field(key: "ObjectType")]
        getter object_type : String?

        def initialize(
          @name : String,
          @schema_arn : String,
          @attributes : Array(Types::FacetAttribute)? = nil,
          @facet_style : String? = nil,
          @object_type : String? = nil
        )
        end
      end


      struct CreateFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateIndexRequest
        include JSON::Serializable

        # The ARN of the directory where the index should be created.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Indicates whether the attribute that is being indexed has unique values or not.

        @[JSON::Field(key: "IsUnique")]
        getter is_unique : Bool

        # Specifies the attributes that should be indexed on. Currently only a single attribute is supported.

        @[JSON::Field(key: "OrderedIndexedAttributeList")]
        getter ordered_indexed_attribute_list : Array(Types::AttributeKey)

        # The name of the link between the parent object and the index object.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        # A reference to the parent object that contains the index object.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference?

        def initialize(
          @directory_arn : String,
          @is_unique : Bool,
          @ordered_indexed_attribute_list : Array(Types::AttributeKey),
          @link_name : String? = nil,
          @parent_reference : Types::ObjectReference? = nil
        )
        end
      end


      struct CreateIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the index created by this operation.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end


      struct CreateObjectRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory in which the object will be
        # created. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A list of schema facets to be associated with the object. Do not provide minor version components.
        # See SchemaFacet for details.

        @[JSON::Field(key: "SchemaFacets")]
        getter schema_facets : Array(Types::SchemaFacet)

        # The name of link that is used to attach this object to a parent.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        # The attribute map whose attribute ARN contains the key and attribute value as the map value.

        @[JSON::Field(key: "ObjectAttributeList")]
        getter object_attribute_list : Array(Types::AttributeKeyAndValue)?

        # If specified, the parent reference to which this object will be attached.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference?

        def initialize(
          @directory_arn : String,
          @schema_facets : Array(Types::SchemaFacet),
          @link_name : String? = nil,
          @object_attribute_list : Array(Types::AttributeKeyAndValue)? = nil,
          @parent_reference : Types::ObjectReference? = nil
        )
        end
      end


      struct CreateObjectResponse
        include JSON::Serializable

        # The identifier that is associated with the object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end


      struct CreateSchemaRequest
        include JSON::Serializable

        # The name that is associated with the schema. This is unique to each account and in each region.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct CreateSchemaResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @schema_arn : String? = nil
        )
        end
      end


      struct CreateTypedLinkFacetRequest
        include JSON::Serializable

        # Facet structure that is associated with the typed link facet.

        @[JSON::Field(key: "Facet")]
        getter facet : Types::TypedLinkFacet

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @facet : Types::TypedLinkFacet,
          @schema_arn : String
        )
        end
      end


      struct CreateTypedLinkFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDirectoryRequest
        include JSON::Serializable

        # The ARN of the directory to delete.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct DeleteDirectoryResponse
        include JSON::Serializable

        # The ARN of the deleted directory.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct DeleteFacetRequest
        include JSON::Serializable

        # The name of the facet to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the Facet . For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct DeleteFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteObjectRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference that identifies the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference
        )
        end
      end


      struct DeleteObjectResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSchemaRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the development schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @schema_arn : String
        )
        end
      end


      struct DeleteSchemaResponse
        include JSON::Serializable

        # The input ARN that is returned as part of the response. For more information, see arns .

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @schema_arn : String? = nil
        )
        end
      end


      struct DeleteTypedLinkFacetRequest
        include JSON::Serializable

        # The unique name of the typed link facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct DeleteTypedLinkFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachFromIndexRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the directory the index and object exist in.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the index object.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # A reference to the object being detached from the index.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @index_reference : Types::ObjectReference,
          @target_reference : Types::ObjectReference
        )
        end
      end


      struct DetachFromIndexResponse
        include JSON::Serializable

        # The ObjectIdentifier of the object that was detached from the index.

        @[JSON::Field(key: "DetachedObjectIdentifier")]
        getter detached_object_identifier : String?

        def initialize(
          @detached_object_identifier : String? = nil
        )
        end
      end


      struct DetachObjectRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where objects reside. For more
        # information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The link name associated with the object that needs to be detached.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String

        # The parent reference from which the object with the specified link name is detached.

        @[JSON::Field(key: "ParentReference")]
        getter parent_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @link_name : String,
          @parent_reference : Types::ObjectReference
        )
        end
      end


      struct DetachObjectResponse
        include JSON::Serializable

        # The ObjectIdentifier that was detached from the object.

        @[JSON::Field(key: "DetachedObjectIdentifier")]
        getter detached_object_identifier : String?

        def initialize(
          @detached_object_identifier : String? = nil
        )
        end
      end


      struct DetachPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where both objects reside. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Reference that identifies the object whose policy object will be detached.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Reference that identifies the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @policy_reference : Types::ObjectReference
        )
        end
      end


      struct DetachPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DetachTypedLinkRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the directory where you want to detach the typed link.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Used to accept a typed link specifier as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        def initialize(
          @directory_arn : String,
          @typed_link_specifier : Types::TypedLinkSpecifier
        )
        end
      end

      # Directory structure that includes the directory name and directory ARN.

      struct Directory
        include JSON::Serializable

        # The date and time when the directory was created.

        @[JSON::Field(key: "CreationDateTime")]
        getter creation_date_time : Time?

        # The Amazon Resource Name (ARN) that is associated with the directory. For more information, see arns
        # .

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String?

        # The name of the directory.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the directory. Can be either Enabled , Disabled , or Deleted .

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @creation_date_time : Time? = nil,
          @directory_arn : String? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # Indicates that a Directory could not be created due to a naming conflict. Choose a different name
      # and try again.

      struct DirectoryAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A directory that has been deleted and to which access has been attempted. Note: The requested
      # resource will eventually cease to exist.

      struct DirectoryDeletedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An operation can only operate on a disabled directory.

      struct DirectoryNotDisabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Operations are only permitted on enabled directories.

      struct DirectoryNotEnabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DisableDirectoryRequest
        include JSON::Serializable

        # The ARN of the directory to disable.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct DisableDirectoryResponse
        include JSON::Serializable

        # The ARN of the directory that has been disabled.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct EnableDirectoryRequest
        include JSON::Serializable

        # The ARN of the directory to enable.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct EnableDirectoryResponse
        include JSON::Serializable

        # The ARN of the enabled directory.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end

      # A structure that contains Name , ARN , Attributes , Rule s , and ObjectTypes . See Facets for more
      # information.

      struct Facet
        include JSON::Serializable

        # There are two different styles that you can define on any given facet, Static and Dynamic . For
        # static facets, all attributes must be defined in the schema. For dynamic facets, attributes can be
        # defined during data plane operations.

        @[JSON::Field(key: "FacetStyle")]
        getter facet_style : String?

        # The name of the Facet .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The object type that is associated with the facet. See CreateFacetRequest$ObjectType for more
        # details.

        @[JSON::Field(key: "ObjectType")]
        getter object_type : String?

        def initialize(
          @facet_style : String? = nil,
          @name : String? = nil,
          @object_type : String? = nil
        )
        end
      end

      # A facet with the same name already exists.

      struct FacetAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An attribute that is associated with the Facet .

      struct FacetAttribute
        include JSON::Serializable

        # The name of the facet attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A facet attribute consists of either a definition or a reference. This structure contains the
        # attribute definition. See Attribute References for more information.

        @[JSON::Field(key: "AttributeDefinition")]
        getter attribute_definition : Types::FacetAttributeDefinition?

        # An attribute reference that is associated with the attribute. See Attribute References for more
        # information.

        @[JSON::Field(key: "AttributeReference")]
        getter attribute_reference : Types::FacetAttributeReference?

        # The required behavior of the FacetAttribute .

        @[JSON::Field(key: "RequiredBehavior")]
        getter required_behavior : String?

        def initialize(
          @name : String,
          @attribute_definition : Types::FacetAttributeDefinition? = nil,
          @attribute_reference : Types::FacetAttributeReference? = nil,
          @required_behavior : String? = nil
        )
        end
      end

      # A facet attribute definition. See Attribute References for more information.

      struct FacetAttributeDefinition
        include JSON::Serializable

        # The type of the attribute.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The default value of the attribute (if configured).

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Types::TypedAttributeValue?

        # Whether the attribute is mutable or not.

        @[JSON::Field(key: "IsImmutable")]
        getter is_immutable : Bool?

        # Validation rules attached to the attribute definition.

        @[JSON::Field(key: "Rules")]
        getter rules : Hash(String, Types::Rule)?

        def initialize(
          @type : String,
          @default_value : Types::TypedAttributeValue? = nil,
          @is_immutable : Bool? = nil,
          @rules : Hash(String, Types::Rule)? = nil
        )
        end
      end

      # The facet attribute reference that specifies the attribute definition that contains the attribute
      # facet name and attribute name.

      struct FacetAttributeReference
        include JSON::Serializable

        # The target attribute name that is associated with the facet reference. See Attribute References for
        # more information.

        @[JSON::Field(key: "TargetAttributeName")]
        getter target_attribute_name : String

        # The target facet name that is associated with the facet reference. See Attribute References for more
        # information.

        @[JSON::Field(key: "TargetFacetName")]
        getter target_facet_name : String

        def initialize(
          @target_attribute_name : String,
          @target_facet_name : String
        )
        end
      end

      # A structure that contains information used to update an attribute.

      struct FacetAttributeUpdate
        include JSON::Serializable

        # The action to perform when updating the attribute.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # The attribute to update.

        @[JSON::Field(key: "Attribute")]
        getter attribute : Types::FacetAttribute?

        def initialize(
          @action : String? = nil,
          @attribute : Types::FacetAttribute? = nil
        )
        end
      end

      # Occurs when deleting a facet that contains an attribute that is a target to an attribute reference
      # in a different facet.

      struct FacetInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified Facet could not be found.

      struct FacetNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Facet that you provided was not well formed or could not be validated with the schema.

      struct FacetValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetAppliedSchemaVersionRequest
        include JSON::Serializable

        # The ARN of the applied schema.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String

        def initialize(
          @schema_arn : String
        )
        end
      end


      struct GetAppliedSchemaVersionResponse
        include JSON::Serializable

        # Current applied schema ARN, including the minor version in use if one was provided.

        @[JSON::Field(key: "AppliedSchemaArn")]
        getter applied_schema_arn : String?

        def initialize(
          @applied_schema_arn : String? = nil
        )
        end
      end


      struct GetDirectoryRequest
        include JSON::Serializable

        # The ARN of the directory.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        def initialize(
          @directory_arn : String
        )
        end
      end


      struct GetDirectoryResponse
        include JSON::Serializable

        # Metadata about the directory.

        @[JSON::Field(key: "Directory")]
        getter directory : Types::Directory

        def initialize(
          @directory : Types::Directory
        )
        end
      end


      struct GetFacetRequest
        include JSON::Serializable

        # The name of the facet to retrieve.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the Facet . For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct GetFacetResponse
        include JSON::Serializable

        # The Facet structure that is associated with the facet.

        @[JSON::Field(key: "Facet")]
        getter facet : Types::Facet?

        def initialize(
          @facet : Types::Facet? = nil
        )
        end
      end


      struct GetLinkAttributesRequest
        include JSON::Serializable

        # A list of attribute names whose values will be retrieved.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # The Amazon Resource Name (ARN) that is associated with the Directory where the typed link resides.
        # For more information, see arns or Typed Links .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Allows a typed link specifier to be accepted as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        # The consistency level at which to retrieve the attributes on a typed link.

        @[JSON::Field(key: "ConsistencyLevel")]
        getter consistency_level : String?

        def initialize(
          @attribute_names : Array(String),
          @directory_arn : String,
          @typed_link_specifier : Types::TypedLinkSpecifier,
          @consistency_level : String? = nil
        )
        end
      end


      struct GetLinkAttributesResponse
        include JSON::Serializable

        # The attributes that are associated with the typed link.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil
        )
        end
      end


      struct GetObjectAttributesRequest
        include JSON::Serializable

        # List of attribute names whose values will be retrieved.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Reference that identifies the object whose attributes will be retrieved.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Identifier for the facet whose attributes will be retrieved. See SchemaFacet for details.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        # The consistency level at which to retrieve the attributes on an object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        def initialize(
          @attribute_names : Array(String),
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet,
          @consistency_level : String? = nil
        )
        end
      end


      struct GetObjectAttributesResponse
        include JSON::Serializable

        # The attributes that are associated with the object.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil
        )
        end
      end


      struct GetObjectInformationRequest
        include JSON::Serializable

        # The ARN of the directory being retrieved.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The consistency level at which to retrieve the object information.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil
        )
        end
      end


      struct GetObjectInformationResponse
        include JSON::Serializable

        # The ObjectIdentifier of the specified object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        # The facets attached to the specified object. Although the response does not include minor version
        # information, the most recently applied minor version of each Facet is in effect. See
        # GetAppliedSchemaVersion for details.

        @[JSON::Field(key: "SchemaFacets")]
        getter schema_facets : Array(Types::SchemaFacet)?

        def initialize(
          @object_identifier : String? = nil,
          @schema_facets : Array(Types::SchemaFacet)? = nil
        )
        end
      end


      struct GetSchemaAsJsonRequest
        include JSON::Serializable

        # The ARN of the schema to retrieve.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @schema_arn : String
        )
        end
      end


      struct GetSchemaAsJsonResponse
        include JSON::Serializable

        # The JSON representation of the schema document.

        @[JSON::Field(key: "Document")]
        getter document : String?

        # The name of the retrieved schema.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @document : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetTypedLinkFacetInformationRequest
        include JSON::Serializable

        # The unique name of the typed link facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct GetTypedLinkFacetInformationResponse
        include JSON::Serializable

        # The order of identity attributes for the facet, from most significant to least significant. The
        # ability to filter typed links considers the order that the attributes are defined on the typed link
        # facet. When providing ranges to typed link selection, any inexact ranges must be specified at the
        # end. Any attributes that do not have a range specified are presumed to match the entire range.
        # Filters are interpreted in the order of the attributes on the typed link facet, not the order in
        # which they are supplied to any API calls. For more information about identity attributes, see Typed
        # Links .

        @[JSON::Field(key: "IdentityAttributeOrder")]
        getter identity_attribute_order : Array(String)?

        def initialize(
          @identity_attribute_order : Array(String)? = nil
        )
        end
      end

      # Indicates a failure occurred while performing a check for backward compatibility between the
      # specified schema and the schema that is currently applied to the directory.

      struct IncompatibleSchemaException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents an index and an attached object.

      struct IndexAttachment
        include JSON::Serializable

        # The indexed attribute values.

        @[JSON::Field(key: "IndexedAttributes")]
        getter indexed_attributes : Array(Types::AttributeKeyAndValue)?

        # In response to ListIndex , the ObjectIdentifier of the object attached to the index. In response to
        # ListAttachedIndices , the ObjectIdentifier of the index attached to the object. This field will
        # always contain the ObjectIdentifier of the object on the opposite side of the attachment specified
        # in the query.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @indexed_attributes : Array(Types::AttributeKeyAndValue)? = nil,
          @object_identifier : String? = nil
        )
        end
      end

      # An object has been attempted to be attached to an object that does not have the appropriate
      # attribute value.

      struct IndexedAttributeMissingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates a problem that must be resolved by Amazon Web Services. This might be a transient error in
      # which case you can retry your request until it succeeds. Otherwise, go to the AWS Service Health
      # Dashboard site to see if there are any operational issues with the service.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the provided ARN value is not valid.

      struct InvalidArnException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that an attempt to make an attachment was invalid. For example, attaching two nodes with a
      # link type that is not applicable to the nodes or attempting to apply a schema to a directory a
      # second time.

      struct InvalidAttachmentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An attempt to modify a Facet resulted in an invalid schema exception.

      struct InvalidFacetUpdateException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the NextToken value is not valid.

      struct InvalidNextTokenException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Occurs when any of the rule parameter keys or values are invalid.

      struct InvalidRuleException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the provided SchemaDoc value is not valid.

      struct InvalidSchemaDocException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Can occur for multiple reasons such as when you tag a resource that doesn’t exist or if you specify
      # a higher number of tags for a resource than the allowed limit. Allowed limit is 50 tags per
      # resource.

      struct InvalidTaggingRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that limits are exceeded. See Limits for more information.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action to take on a typed link attribute value. Updates are only supported for attributes which
      # don’t contribute to link identity.

      struct LinkAttributeAction
        include JSON::Serializable

        # A type that can be either UPDATE_OR_CREATE or DELETE .

        @[JSON::Field(key: "AttributeActionType")]
        getter attribute_action_type : String?

        # The value that you want to update to.

        @[JSON::Field(key: "AttributeUpdateValue")]
        getter attribute_update_value : Types::TypedAttributeValue?

        def initialize(
          @attribute_action_type : String? = nil,
          @attribute_update_value : Types::TypedAttributeValue? = nil
        )
        end
      end

      # Structure that contains attribute update information.

      struct LinkAttributeUpdate
        include JSON::Serializable

        # The action to perform as part of the attribute update.

        @[JSON::Field(key: "AttributeAction")]
        getter attribute_action : Types::LinkAttributeAction?

        # The key of the attribute being updated.

        @[JSON::Field(key: "AttributeKey")]
        getter attribute_key : Types::AttributeKey?

        def initialize(
          @attribute_action : Types::LinkAttributeAction? = nil,
          @attribute_key : Types::AttributeKey? = nil
        )
        end
      end

      # Indicates that a link could not be created due to a naming conflict. Choose a different name and
      # then try again.

      struct LinkNameAlreadyInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAppliedSchemaArnsRequest
        include JSON::Serializable

        # The ARN of the directory you are listing.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The response for ListAppliedSchemaArns when this parameter is used will list all minor version ARNs
        # for a major version.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @directory_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end


      struct ListAppliedSchemaArnsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs of schemas that are applied to the directory.

        @[JSON::Field(key: "SchemaArns")]
        getter schema_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @schema_arns : Array(String)? = nil
        )
        end
      end


      struct ListAttachedIndicesRequest
        include JSON::Serializable

        # The ARN of the directory.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the object that has indices attached.

        @[JSON::Field(key: "TargetReference")]
        getter target_reference : Types::ObjectReference

        # The consistency level to use for this operation.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @target_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAttachedIndicesResponse
        include JSON::Serializable

        # The indices attached to the specified object.

        @[JSON::Field(key: "IndexAttachments")]
        getter index_attachments : Array(Types::IndexAttachment)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_attachments : Array(Types::IndexAttachment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDevelopmentSchemaArnsRequest
        include JSON::Serializable

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDevelopmentSchemaArnsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs of retrieved development schemas.

        @[JSON::Field(key: "SchemaArns")]
        getter schema_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @schema_arns : Array(String)? = nil
        )
        end
      end


      struct ListDirectoriesRequest
        include JSON::Serializable

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The state of the directories in the list. Can be either Enabled, Disabled, or Deleted.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListDirectoriesResponse
        include JSON::Serializable

        # Lists all directories that are associated with your account in pagination fashion.

        @[JSON::Field(key: "Directories")]
        getter directories : Array(Types::Directory)

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directories : Array(Types::Directory),
          @next_token : String? = nil
        )
        end
      end


      struct ListFacetAttributesRequest
        include JSON::Serializable

        # The name of the facet whose attributes will be retrieved.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the schema where the facet resides.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @schema_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFacetAttributesResponse
        include JSON::Serializable

        # The attributes attached to the facet.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::FacetAttribute)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attributes : Array(Types::FacetAttribute)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFacetNamesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) to retrieve facet names from.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @schema_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFacetNamesResponse
        include JSON::Serializable

        # The names of facets that exist within the schema.

        @[JSON::Field(key: "FacetNames")]
        getter facet_names : Array(String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @facet_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIncomingTypedLinksRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the directory where you want to list the typed links.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The consistency level to execute the request at.

        @[JSON::Field(key: "ConsistencyLevel")]
        getter consistency_level : String?

        # Provides range filters for multiple attributes. When providing ranges to typed link selection, any
        # inexact ranges must be specified at the end. Any attributes that do not have a range specified are
        # presumed to match the entire range.

        @[JSON::Field(key: "FilterAttributeRanges")]
        getter filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)?

        # Filters are interpreted in the order of the attributes on the typed link facet, not the order in
        # which they are supplied to any API calls.

        @[JSON::Field(key: "FilterTypedLink")]
        getter filter_typed_link : Types::TypedLinkSchemaAndFacetName?

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
          @filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIncomingTypedLinksResponse
        include JSON::Serializable

        # Returns one or more typed link specifiers as output.

        @[JSON::Field(key: "LinkSpecifiers")]
        getter link_specifiers : Array(Types::TypedLinkSpecifier)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @link_specifiers : Array(Types::TypedLinkSpecifier)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndexRequest
        include JSON::Serializable

        # The ARN of the directory that the index exists in.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference to the index to list.

        @[JSON::Field(key: "IndexReference")]
        getter index_reference : Types::ObjectReference

        # The consistency level to execute the request at.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # The maximum number of objects in a single page to retrieve from the index during a request. For more
        # information, see Amazon Cloud Directory Limits .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specifies the ranges of indexed values that you want to query.

        @[JSON::Field(key: "RangesOnIndexedValues")]
        getter ranges_on_indexed_values : Array(Types::ObjectAttributeRange)?

        def initialize(
          @directory_arn : String,
          @index_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ranges_on_indexed_values : Array(Types::ObjectAttributeRange)? = nil
        )
        end
      end


      struct ListIndexResponse
        include JSON::Serializable

        # The objects and indexed values attached to the index.

        @[JSON::Field(key: "IndexAttachments")]
        getter index_attachments : Array(Types::IndexAttachment)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_attachments : Array(Types::IndexAttachment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListManagedSchemaArnsRequest
        include JSON::Serializable

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The response for ListManagedSchemaArns. When this parameter is used, all minor version ARNs for a
        # major version are listed.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end


      struct ListManagedSchemaArnsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs for all AWS managed schemas.

        @[JSON::Field(key: "SchemaArns")]
        getter schema_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @schema_arns : Array(String)? = nil
        )
        end
      end


      struct ListObjectAttributesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # Used to filter the list of object attributes that are associated with a certain facet.

        @[JSON::Field(key: "FacetFilter")]
        getter facet_filter : Types::SchemaFacet?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @facet_filter : Types::SchemaFacet? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectAttributesResponse
        include JSON::Serializable

        # Attributes map that is associated with the object. AttributeArn is the key, and attribute value is
        # the value.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::AttributeKeyAndValue)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attributes : Array(Types::AttributeKeyAndValue)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectChildrenRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object for which child objects are being listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectChildrenResponse
        include JSON::Serializable

        # Children structure, which is a map with key as the LinkName and ObjectIdentifier as the value.

        @[JSON::Field(key: "Children")]
        getter children : Hash(String, String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @children : Hash(String, String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectParentPathsRequest
        include JSON::Serializable

        # The ARN of the directory to which the parent path applies.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object whose parent paths are listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectParentPathsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns the path to the ObjectIdentifiers that are associated with the directory.

        @[JSON::Field(key: "PathToObjectIdentifiersList")]
        getter path_to_object_identifiers_list : Array(Types::PathToObjectIdentifiers)?

        def initialize(
          @next_token : String? = nil,
          @path_to_object_identifiers_list : Array(Types::PathToObjectIdentifiers)? = nil
        )
        end
      end


      struct ListObjectParentsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object for which parent objects are being listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # When set to True, returns all ListObjectParentsResponse$ParentLinks . There could be multiple links
        # between a parent-child pair.

        @[JSON::Field(key: "IncludeAllLinksToEachParent")]
        getter include_all_links_to_each_parent : Bool?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @include_all_links_to_each_parent : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectParentsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a list of parent reference and LinkName Tuples.

        @[JSON::Field(key: "ParentLinks")]
        getter parent_links : Array(Types::ObjectIdentifierAndLinkNameTuple)?

        # The parent structure, which is a map with key as the ObjectIdentifier and LinkName as the value.

        @[JSON::Field(key: "Parents")]
        getter parents : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @parent_links : Array(Types::ObjectIdentifierAndLinkNameTuple)? = nil,
          @parents : Hash(String, String)? = nil
        )
        end
      end


      struct ListObjectPoliciesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where objects reside. For more
        # information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Reference that identifies the object for which policies will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListObjectPoliciesResponse
        include JSON::Serializable

        # A list of policy ObjectIdentifiers , that are attached to the object.

        @[JSON::Field(key: "AttachedPolicyIds")]
        getter attached_policy_ids : Array(String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attached_policy_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutgoingTypedLinksRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the directory where you want to list the typed links.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference that identifies the object whose attributes will be listed.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The consistency level to execute the request at.

        @[JSON::Field(key: "ConsistencyLevel")]
        getter consistency_level : String?

        # Provides range filters for multiple attributes. When providing ranges to typed link selection, any
        # inexact ranges must be specified at the end. Any attributes that do not have a range specified are
        # presumed to match the entire range.

        @[JSON::Field(key: "FilterAttributeRanges")]
        getter filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)?

        # Filters are interpreted in the order of the attributes defined on the typed link facet, not the
        # order they are supplied to any API calls.

        @[JSON::Field(key: "FilterTypedLink")]
        getter filter_typed_link : Types::TypedLinkSchemaAndFacetName?

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
          @filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOutgoingTypedLinksResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns a typed link specifier as output.

        @[JSON::Field(key: "TypedLinkSpecifiers")]
        getter typed_link_specifiers : Array(Types::TypedLinkSpecifier)?

        def initialize(
          @next_token : String? = nil,
          @typed_link_specifiers : Array(Types::TypedLinkSpecifier)? = nil
        )
        end
      end


      struct ListPolicyAttachmentsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory where objects reside. For more
        # information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the policy object.

        @[JSON::Field(key: "PolicyReference")]
        getter policy_reference : Types::ObjectReference

        # Represents the manner and timing in which the successful write or update of an object is reflected
        # in a subsequent read operation of that same object.

        @[JSON::Field(key: "x-amz-consistency-level")]
        getter consistency_level : String?

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @policy_reference : Types::ObjectReference,
          @consistency_level : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPolicyAttachmentsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of ObjectIdentifiers to which the policy is attached.

        @[JSON::Field(key: "ObjectIdentifiers")]
        getter object_identifiers : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @object_identifiers : Array(String)? = nil
        )
        end
      end


      struct ListPublishedSchemaArnsRequest
        include JSON::Serializable

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The response for ListPublishedSchemaArns when this parameter is used will list all minor version
        # ARNs for a major version.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end


      struct ListPublishedSchemaArnsResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARNs of published schemas.

        @[JSON::Field(key: "SchemaArns")]
        getter schema_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @schema_arns : Array(String)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. Tagging is only supported for directories.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The MaxResults parameter sets the maximum number of results returned in a single page. This is for
        # future use and is not supported currently.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token. This is for future use. Currently pagination is not supported for tagging.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tag key value pairs that are associated with the response.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTypedLinkFacetAttributesRequest
        include JSON::Serializable

        # The unique name of the typed link facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name : String,
          @schema_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTypedLinkFacetAttributesResponse
        include JSON::Serializable

        # An ordered set of attributes associate with the typed link.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::TypedLinkAttributeDefinition)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attributes : Array(Types::TypedLinkAttributeDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTypedLinkFacetNamesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # The maximum number of results to retrieve.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @schema_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTypedLinkFacetNamesResponse
        include JSON::Serializable

        # The names of typed link facets that exist within the schema.

        @[JSON::Field(key: "FacetNames")]
        getter facet_names : Array(String)?

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @facet_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct LookupPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the Directory . For more information, see
        # arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Reference that identifies the object whose policies will be looked up.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The maximum number of items to be retrieved in a single call. This is an approximate number.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct LookupPolicyResponse
        include JSON::Serializable

        # The pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Provides list of path to policies. Policies contain PolicyId , ObjectIdentifier , and PolicyType .
        # For more information, see Policies .

        @[JSON::Field(key: "PolicyToPathList")]
        getter policy_to_path_list : Array(Types::PolicyToPath)?

        def initialize(
          @next_token : String? = nil,
          @policy_to_path_list : Array(Types::PolicyToPath)? = nil
        )
        end
      end

      # Indicates that the requested operation can only operate on index objects.

      struct NotIndexException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Occurs when any invalid operations are performed on an object that is not a node, such as calling
      # ListObjectChildren for a leaf node object.

      struct NotNodeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the requested operation can only operate on policy objects.

      struct NotPolicyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that the object is not attached to the index.

      struct ObjectAlreadyDetachedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The action to take on the object attribute.

      struct ObjectAttributeAction
        include JSON::Serializable

        # A type that can be either Update or Delete .

        @[JSON::Field(key: "ObjectAttributeActionType")]
        getter object_attribute_action_type : String?

        # The value that you want to update to.

        @[JSON::Field(key: "ObjectAttributeUpdateValue")]
        getter object_attribute_update_value : Types::TypedAttributeValue?

        def initialize(
          @object_attribute_action_type : String? = nil,
          @object_attribute_update_value : Types::TypedAttributeValue? = nil
        )
        end
      end

      # A range of attributes.

      struct ObjectAttributeRange
        include JSON::Serializable

        # The key of the attribute that the attribute range covers.

        @[JSON::Field(key: "AttributeKey")]
        getter attribute_key : Types::AttributeKey?

        # The range of attribute values being selected.

        @[JSON::Field(key: "Range")]
        getter range : Types::TypedAttributeValueRange?

        def initialize(
          @attribute_key : Types::AttributeKey? = nil,
          @range : Types::TypedAttributeValueRange? = nil
        )
        end
      end

      # Structure that contains attribute update information.

      struct ObjectAttributeUpdate
        include JSON::Serializable

        # The action to perform as part of the attribute update.

        @[JSON::Field(key: "ObjectAttributeAction")]
        getter object_attribute_action : Types::ObjectAttributeAction?

        # The key of the attribute being updated.

        @[JSON::Field(key: "ObjectAttributeKey")]
        getter object_attribute_key : Types::AttributeKey?

        def initialize(
          @object_attribute_action : Types::ObjectAttributeAction? = nil,
          @object_attribute_key : Types::AttributeKey? = nil
        )
        end
      end

      # A pair of ObjectIdentifier and LinkName.

      struct ObjectIdentifierAndLinkNameTuple
        include JSON::Serializable

        # The name of the link between the parent and the child object.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        # The ID that is associated with the object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @link_name : String? = nil,
          @object_identifier : String? = nil
        )
        end
      end

      # Indicates that the requested operation cannot be completed because the object has not been detached
      # from the tree.

      struct ObjectNotDetachedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The reference that identifies an object.

      struct ObjectReference
        include JSON::Serializable

        # A path selector supports easy selection of an object by the parent/child links leading to it from
        # the directory root. Use the link names from each parent/child link to construct the path. Path
        # selectors start with a slash (/) and link names are separated by slashes. For more information about
        # paths, see Access Objects . You can identify an object in one of the following ways:
        # $ObjectIdentifier - An object identifier is an opaque string provided by Amazon Cloud Directory.
        # When creating objects, the system will provide you with the identifier of the created object. An
        # object’s identifier is immutable and no two objects will ever share the same object identifier. To
        # identify an object with ObjectIdentifier, the ObjectIdentifier must be wrapped in double quotes.
        # /some/path - Identifies the object based on path #SomeBatchReference - Identifies the object in a
        # batch call

        @[JSON::Field(key: "Selector")]
        getter selector : String?

        def initialize(
          @selector : String? = nil
        )
        end
      end

      # Returns the path to the ObjectIdentifiers that is associated with the directory.

      struct PathToObjectIdentifiers
        include JSON::Serializable

        # Lists ObjectIdentifiers starting from directory root to the object in the request.

        @[JSON::Field(key: "ObjectIdentifiers")]
        getter object_identifiers : Array(String)?

        # The path that is used to identify the object starting from directory root.

        @[JSON::Field(key: "Path")]
        getter path : String?

        def initialize(
          @object_identifiers : Array(String)? = nil,
          @path : String? = nil
        )
        end
      end

      # Contains the PolicyType , PolicyId , and the ObjectIdentifier to which it is attached. For more
      # information, see Policies .

      struct PolicyAttachment
        include JSON::Serializable

        # The ObjectIdentifier that is associated with PolicyAttachment .

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        # The ID of PolicyAttachment .

        @[JSON::Field(key: "PolicyId")]
        getter policy_id : String?

        # The type of policy that can be associated with PolicyAttachment .

        @[JSON::Field(key: "PolicyType")]
        getter policy_type : String?

        def initialize(
          @object_identifier : String? = nil,
          @policy_id : String? = nil,
          @policy_type : String? = nil
        )
        end
      end

      # Used when a regular object exists in a Directory and you want to find all of the policies that are
      # associated with that object and the parent to that object.

      struct PolicyToPath
        include JSON::Serializable

        # The path that is referenced from the root.

        @[JSON::Field(key: "Path")]
        getter path : String?

        # List of policy objects.

        @[JSON::Field(key: "Policies")]
        getter policies : Array(Types::PolicyAttachment)?

        def initialize(
          @path : String? = nil,
          @policies : Array(Types::PolicyAttachment)? = nil
        )
        end
      end


      struct PublishSchemaRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the development schema. For more information,
        # see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter development_schema_arn : String

        # The major version under which the schema will be published. Schemas have both a major and minor
        # version associated with them.

        @[JSON::Field(key: "Version")]
        getter version : String

        # The minor version under which the schema will be published. This parameter is recommended. Schemas
        # have both a major and minor version associated with them.

        @[JSON::Field(key: "MinorVersion")]
        getter minor_version : String?

        # The new name under which the schema will be published. If this is not provided, the development
        # schema is considered.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @development_schema_arn : String,
          @version : String,
          @minor_version : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct PublishSchemaResponse
        include JSON::Serializable

        # The ARN that is associated with the published schema. For more information, see arns .

        @[JSON::Field(key: "PublishedSchemaArn")]
        getter published_schema_arn : String?

        def initialize(
          @published_schema_arn : String? = nil
        )
        end
      end


      struct PutSchemaFromJsonRequest
        include JSON::Serializable

        # The replacement JSON schema.

        @[JSON::Field(key: "Document")]
        getter document : String

        # The ARN of the schema to update.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @document : String,
          @schema_arn : String
        )
        end
      end


      struct PutSchemaFromJsonResponse
        include JSON::Serializable

        # The ARN of the schema to update.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct RemoveFacetFromObjectRequest
        include JSON::Serializable

        # The ARN of the directory in which the object resides.

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # A reference to the object to remove the facet from.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        # The facet to remove. See SchemaFacet for details.

        @[JSON::Field(key: "SchemaFacet")]
        getter schema_facet : Types::SchemaFacet

        def initialize(
          @directory_arn : String,
          @object_reference : Types::ObjectReference,
          @schema_facet : Types::SchemaFacet
        )
        end
      end


      struct RemoveFacetFromObjectResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Occurs when a conflict with a previous successful write is detected. For example, if a write
      # operation occurs on an object and then an attempt is made to read the object using “SERIALIZABLE”
      # consistency, this exception may result. This generally occurs when the previous write did not have
      # time to propagate to the host serving the current request. A retry (with appropriate backoff logic)
      # is the recommended response to this exception.

      struct RetryableConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains an Amazon Resource Name (ARN) and parameters that are associated with the rule.

      struct Rule
        include JSON::Serializable

        # The minimum and maximum parameters that are associated with the rule.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The type of attribute validation rule.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @parameters : Hash(String, String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Indicates that a schema could not be created due to a naming conflict. Please select a different
      # name and then try again.

      struct SchemaAlreadyExistsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Indicates that a schema is already published.

      struct SchemaAlreadyPublishedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A facet.

      struct SchemaFacet
        include JSON::Serializable

        # The name of the facet. If this value is set, SchemaArn must also be set.

        @[JSON::Field(key: "FacetName")]
        getter facet_name : String?

        # The ARN of the schema that contains the facet with no minor component. See arns and In-Place Schema
        # Upgrade for a description of when to provide minor versions. If this value is set, FacetName must
        # also be set.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @facet_name : String? = nil,
          @schema_arn : String? = nil
        )
        end
      end

      # The object could not be deleted because links still exist. Remove the links and then try the
      # operation again.

      struct StillContainsLinksException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The tag structure that contains a tag key and value.

      struct Tag
        include JSON::Serializable

        # The key that is associated with the tag.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value that is associated with the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. Tagging is only supported for directories.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag key-value pairs.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the data for a typed attribute. You can set one, and only one, of the elements. Each
      # attribute in an item is a name-value pair. Attributes have a single value.

      struct TypedAttributeValue
        include JSON::Serializable

        # A binary data value.

        @[JSON::Field(key: "BinaryValue")]
        getter binary_value : Bytes?

        # A Boolean data value.

        @[JSON::Field(key: "BooleanValue")]
        getter boolean_value : Bool?

        # A date and time value.

        @[JSON::Field(key: "DatetimeValue")]
        getter datetime_value : Time?

        # A number data value.

        @[JSON::Field(key: "NumberValue")]
        getter number_value : String?

        # A string data value.

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @binary_value : Bytes? = nil,
          @boolean_value : Bool? = nil,
          @datetime_value : Time? = nil,
          @number_value : String? = nil,
          @string_value : String? = nil
        )
        end
      end

      # A range of attribute values. For more information, see Range Filters .

      struct TypedAttributeValueRange
        include JSON::Serializable

        # The inclusive or exclusive range end.

        @[JSON::Field(key: "EndMode")]
        getter end_mode : String

        # The inclusive or exclusive range start.

        @[JSON::Field(key: "StartMode")]
        getter start_mode : String

        # The attribute value to terminate the range at.

        @[JSON::Field(key: "EndValue")]
        getter end_value : Types::TypedAttributeValue?

        # The value to start the range at.

        @[JSON::Field(key: "StartValue")]
        getter start_value : Types::TypedAttributeValue?

        def initialize(
          @end_mode : String,
          @start_mode : String,
          @end_value : Types::TypedAttributeValue? = nil,
          @start_value : Types::TypedAttributeValue? = nil
        )
        end
      end

      # A typed link attribute definition.

      struct TypedLinkAttributeDefinition
        include JSON::Serializable

        # The unique name of the typed link attribute.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The required behavior of the TypedLinkAttributeDefinition .

        @[JSON::Field(key: "RequiredBehavior")]
        getter required_behavior : String

        # The type of the attribute.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The default value of the attribute (if configured).

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Types::TypedAttributeValue?

        # Whether the attribute is mutable or not.

        @[JSON::Field(key: "IsImmutable")]
        getter is_immutable : Bool?

        # Validation rules that are attached to the attribute definition.

        @[JSON::Field(key: "Rules")]
        getter rules : Hash(String, Types::Rule)?

        def initialize(
          @name : String,
          @required_behavior : String,
          @type : String,
          @default_value : Types::TypedAttributeValue? = nil,
          @is_immutable : Bool? = nil,
          @rules : Hash(String, Types::Rule)? = nil
        )
        end
      end

      # Identifies the range of attributes that are used by a specified filter.

      struct TypedLinkAttributeRange
        include JSON::Serializable

        # The range of attribute values that are being selected.

        @[JSON::Field(key: "Range")]
        getter range : Types::TypedAttributeValueRange

        # The unique name of the typed link attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        def initialize(
          @range : Types::TypedAttributeValueRange,
          @attribute_name : String? = nil
        )
        end
      end

      # Defines the typed links structure and its attributes. To create a typed link facet, use the
      # CreateTypedLinkFacet API.

      struct TypedLinkFacet
        include JSON::Serializable

        # A set of key-value pairs associated with the typed link. Typed link attributes are used when you
        # have data values that are related to the link itself, and not to one of the two objects being
        # linked. Identity attributes also serve to distinguish the link from others of the same type between
        # the same objects.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::TypedLinkAttributeDefinition)

        # The set of attributes that distinguish links made from this facet from each other, in the order of
        # significance. Listing typed links can filter on the values of these attributes. See
        # ListOutgoingTypedLinks and ListIncomingTypedLinks for details.

        @[JSON::Field(key: "IdentityAttributeOrder")]
        getter identity_attribute_order : Array(String)

        # The unique name of the typed link facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @attributes : Array(Types::TypedLinkAttributeDefinition),
          @identity_attribute_order : Array(String),
          @name : String
        )
        end
      end

      # A typed link facet attribute update.

      struct TypedLinkFacetAttributeUpdate
        include JSON::Serializable

        # The action to perform when updating the attribute.

        @[JSON::Field(key: "Action")]
        getter action : String

        # The attribute to update.

        @[JSON::Field(key: "Attribute")]
        getter attribute : Types::TypedLinkAttributeDefinition

        def initialize(
          @action : String,
          @attribute : Types::TypedLinkAttributeDefinition
        )
        end
      end

      # Identifies the schema Amazon Resource Name (ARN) and facet name for the typed link.

      struct TypedLinkSchemaAndFacetName
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String

        # The unique name of the typed link facet.

        @[JSON::Field(key: "TypedLinkName")]
        getter typed_link_name : String

        def initialize(
          @schema_arn : String,
          @typed_link_name : String
        )
        end
      end

      # Contains all the information that is used to uniquely identify a typed link. The parameters
      # discussed in this topic are used to uniquely specify the typed link being operated on. The
      # AttachTypedLink API returns a typed link specifier while the DetachTypedLink API accepts one as
      # input. Similarly, the ListIncomingTypedLinks and ListOutgoingTypedLinks API operations provide typed
      # link specifiers as output. You can also construct a typed link specifier from scratch.

      struct TypedLinkSpecifier
        include JSON::Serializable

        # Identifies the attribute value to update.

        @[JSON::Field(key: "IdentityAttributeValues")]
        getter identity_attribute_values : Array(Types::AttributeNameAndValue)

        # Identifies the source object that the typed link will attach to.

        @[JSON::Field(key: "SourceObjectReference")]
        getter source_object_reference : Types::ObjectReference

        # Identifies the target object that the typed link will attach to.

        @[JSON::Field(key: "TargetObjectReference")]
        getter target_object_reference : Types::ObjectReference

        # Identifies the typed link facet that is associated with the typed link.

        @[JSON::Field(key: "TypedLinkFacet")]
        getter typed_link_facet : Types::TypedLinkSchemaAndFacetName

        def initialize(
          @identity_attribute_values : Array(Types::AttributeNameAndValue),
          @source_object_reference : Types::ObjectReference,
          @target_object_reference : Types::ObjectReference,
          @typed_link_facet : Types::TypedLinkSchemaAndFacetName
        )
        end
      end

      # Indicates that the requested index type is not supported.

      struct UnsupportedIndexTypeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource. Tagging is only supported for directories.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Keys of the tag that need to be removed from the resource.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateFacetRequest
        include JSON::Serializable

        # The name of the facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the Facet . For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        # List of attributes that need to be updated in a given schema Facet . Each attribute is followed by
        # AttributeAction , which specifies the type of update operation to perform.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::FacetAttributeUpdate)?

        # The object type that is associated with the facet. See CreateFacetRequest$ObjectType for more
        # details.

        @[JSON::Field(key: "ObjectType")]
        getter object_type : String?

        def initialize(
          @name : String,
          @schema_arn : String,
          @attribute_updates : Array(Types::FacetAttributeUpdate)? = nil,
          @object_type : String? = nil
        )
        end
      end


      struct UpdateFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateLinkAttributesRequest
        include JSON::Serializable

        # The attributes update structure.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::LinkAttributeUpdate)

        # The Amazon Resource Name (ARN) that is associated with the Directory where the updated typed link
        # resides. For more information, see arns or Typed Links .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # Allows a typed link specifier to be accepted as input.

        @[JSON::Field(key: "TypedLinkSpecifier")]
        getter typed_link_specifier : Types::TypedLinkSpecifier

        def initialize(
          @attribute_updates : Array(Types::LinkAttributeUpdate),
          @directory_arn : String,
          @typed_link_specifier : Types::TypedLinkSpecifier
        )
        end
      end


      struct UpdateLinkAttributesResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateObjectAttributesRequest
        include JSON::Serializable

        # The attributes update structure.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::ObjectAttributeUpdate)

        # The Amazon Resource Name (ARN) that is associated with the Directory where the object resides. For
        # more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter directory_arn : String

        # The reference that identifies the object.

        @[JSON::Field(key: "ObjectReference")]
        getter object_reference : Types::ObjectReference

        def initialize(
          @attribute_updates : Array(Types::ObjectAttributeUpdate),
          @directory_arn : String,
          @object_reference : Types::ObjectReference
        )
        end
      end


      struct UpdateObjectAttributesResponse
        include JSON::Serializable

        # The ObjectIdentifier of the updated object.

        @[JSON::Field(key: "ObjectIdentifier")]
        getter object_identifier : String?

        def initialize(
          @object_identifier : String? = nil
        )
        end
      end


      struct UpdateSchemaRequest
        include JSON::Serializable

        # The name of the schema.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the development schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct UpdateSchemaResponse
        include JSON::Serializable

        # The ARN that is associated with the updated schema. For more information, see arns .

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        def initialize(
          @schema_arn : String? = nil
        )
        end
      end


      struct UpdateTypedLinkFacetRequest
        include JSON::Serializable

        # Attributes update structure.

        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Array(Types::TypedLinkFacetAttributeUpdate)

        # The order of identity attributes for the facet, from most significant to least significant. The
        # ability to filter typed links considers the order that the attributes are defined on the typed link
        # facet. When providing ranges to a typed link selection, any inexact ranges must be specified at the
        # end. Any attributes that do not have a range specified are presumed to match the entire range.
        # Filters are interpreted in the order of the attributes on the typed link facet, not the order in
        # which they are supplied to any API calls. For more information about identity attributes, see Typed
        # Links .

        @[JSON::Field(key: "IdentityAttributeOrder")]
        getter identity_attribute_order : Array(String)

        # The unique name of the typed link facet.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) that is associated with the schema. For more information, see arns .

        @[JSON::Field(key: "x-amz-data-partition")]
        getter schema_arn : String

        def initialize(
          @attribute_updates : Array(Types::TypedLinkFacetAttributeUpdate),
          @identity_attribute_order : Array(String),
          @name : String,
          @schema_arn : String
        )
        end
      end


      struct UpdateTypedLinkFacetResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpgradeAppliedSchemaRequest
        include JSON::Serializable

        # The ARN for the directory to which the upgraded schema will be applied.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String

        # The revision of the published schema to upgrade the directory to.

        @[JSON::Field(key: "PublishedSchemaArn")]
        getter published_schema_arn : String

        # Used for testing whether the major version schemas are backward compatible or not. If schema
        # compatibility fails, an exception would be thrown else the call would succeed but no changes will be
        # saved. This parameter is optional.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @directory_arn : String,
          @published_schema_arn : String,
          @dry_run : Bool? = nil
        )
        end
      end


      struct UpgradeAppliedSchemaResponse
        include JSON::Serializable

        # The ARN of the directory that is returned as part of the response.

        @[JSON::Field(key: "DirectoryArn")]
        getter directory_arn : String?

        # The ARN of the upgraded schema that is returned as part of the response.

        @[JSON::Field(key: "UpgradedSchemaArn")]
        getter upgraded_schema_arn : String?

        def initialize(
          @directory_arn : String? = nil,
          @upgraded_schema_arn : String? = nil
        )
        end
      end


      struct UpgradePublishedSchemaRequest
        include JSON::Serializable

        # The ARN of the development schema with the changes used for the upgrade.

        @[JSON::Field(key: "DevelopmentSchemaArn")]
        getter development_schema_arn : String

        # Identifies the minor version of the published schema that will be created. This parameter is NOT
        # optional.

        @[JSON::Field(key: "MinorVersion")]
        getter minor_version : String

        # The ARN of the published schema to be upgraded.

        @[JSON::Field(key: "PublishedSchemaArn")]
        getter published_schema_arn : String

        # Used for testing whether the Development schema provided is backwards compatible, or not, with the
        # publish schema provided by the user to be upgraded. If schema compatibility fails, an exception
        # would be thrown else the call would succeed. This parameter is optional and defaults to false.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @development_schema_arn : String,
          @minor_version : String,
          @published_schema_arn : String,
          @dry_run : Bool? = nil
        )
        end
      end


      struct UpgradePublishedSchemaResponse
        include JSON::Serializable

        # The ARN of the upgraded schema that is returned as part of the response.

        @[JSON::Field(key: "UpgradedSchemaArn")]
        getter upgraded_schema_arn : String?

        def initialize(
          @upgraded_schema_arn : String? = nil
        )
        end
      end

      # Indicates that your request is malformed in some manner. See the exception message.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
