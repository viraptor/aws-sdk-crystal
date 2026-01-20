module AwsSdk
  module CloudDirectory
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

      # Adds a new Facet to an object. An object can have more than one facet applied on it.

      def add_facet_to_object(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        schema_facet : Types::SchemaFacet,
        object_attribute_list : Array(Types::AttributeKeyAndValue)? = nil
      ) : Protocol::Request
        input = Types::AddFacetToObjectRequest.new(directory_arn: directory_arn, object_reference: object_reference, schema_facet: schema_facet, object_attribute_list: object_attribute_list)
        add_facet_to_object(input)
      end

      def add_facet_to_object(input : Types::AddFacetToObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_FACET_TO_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Copies the input published schema, at the specified version, into the Directory with the same name
      # and version as that of the published schema.

      def apply_schema(
        directory_arn : String,
        published_schema_arn : String
      ) : Protocol::Request
        input = Types::ApplySchemaRequest.new(directory_arn: directory_arn, published_schema_arn: published_schema_arn)
        apply_schema(input)
      end

      def apply_schema(input : Types::ApplySchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::APPLY_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches an existing object to another object. An object can be accessed in two ways: Using the path
      # Using ObjectIdentifier

      def attach_object(
        child_reference : Types::ObjectReference,
        directory_arn : String,
        link_name : String,
        parent_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::AttachObjectRequest.new(child_reference: child_reference, directory_arn: directory_arn, link_name: link_name, parent_reference: parent_reference)
        attach_object(input)
      end

      def attach_object(input : Types::AttachObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a policy object to a regular object. An object can have a limited number of attached
      # policies.

      def attach_policy(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        policy_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::AttachPolicyRequest.new(directory_arn: directory_arn, object_reference: object_reference, policy_reference: policy_reference)
        attach_policy(input)
      end

      def attach_policy(input : Types::AttachPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches the specified object to the specified index.

      def attach_to_index(
        directory_arn : String,
        index_reference : Types::ObjectReference,
        target_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::AttachToIndexRequest.new(directory_arn: directory_arn, index_reference: index_reference, target_reference: target_reference)
        attach_to_index(input)
      end

      def attach_to_index(input : Types::AttachToIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_TO_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a typed link to a specified source and target object. For more information, see Typed Links
      # .

      def attach_typed_link(
        attributes : Array(Types::AttributeNameAndValue),
        directory_arn : String,
        source_object_reference : Types::ObjectReference,
        target_object_reference : Types::ObjectReference,
        typed_link_facet : Types::TypedLinkSchemaAndFacetName
      ) : Protocol::Request
        input = Types::AttachTypedLinkRequest.new(attributes: attributes, directory_arn: directory_arn, source_object_reference: source_object_reference, target_object_reference: target_object_reference, typed_link_facet: typed_link_facet)
        attach_typed_link(input)
      end

      def attach_typed_link(input : Types::AttachTypedLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ATTACH_TYPED_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs all the read operations in a batch.

      def batch_read(
        directory_arn : String,
        operations : Array(Types::BatchReadOperation),
        consistency_level : String? = nil
      ) : Protocol::Request
        input = Types::BatchReadRequest.new(directory_arn: directory_arn, operations: operations, consistency_level: consistency_level)
        batch_read(input)
      end

      def batch_read(input : Types::BatchReadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_READ, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Performs all the write operations in a batch. Either all the operations succeed or none.

      def batch_write(
        directory_arn : String,
        operations : Array(Types::BatchWriteOperation)
      ) : Protocol::Request
        input = Types::BatchWriteRequest.new(directory_arn: directory_arn, operations: operations)
        batch_write(input)
      end

      def batch_write(input : Types::BatchWriteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_WRITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Directory by copying the published schema into the directory. A directory cannot be
      # created without a schema. You can also quickly create a directory using a managed schema, called the
      # QuickStartSchema . For more information, see Managed Schema in the Amazon Cloud Directory Developer
      # Guide .

      def create_directory(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::CreateDirectoryRequest.new(name: name, schema_arn: schema_arn)
        create_directory(input)
      end

      def create_directory(input : Types::CreateDirectoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DIRECTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Facet in a schema. Facet creation is allowed only in development or applied schemas.

      def create_facet(
        name : String,
        schema_arn : String,
        attributes : Array(Types::FacetAttribute)? = nil,
        facet_style : String? = nil,
        object_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateFacetRequest.new(name: name, schema_arn: schema_arn, attributes: attributes, facet_style: facet_style, object_type: object_type)
        create_facet(input)
      end

      def create_facet(input : Types::CreateFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an index object. See Indexing and search for more information.

      def create_index(
        directory_arn : String,
        is_unique : Bool,
        ordered_indexed_attribute_list : Array(Types::AttributeKey),
        link_name : String? = nil,
        parent_reference : Types::ObjectReference? = nil
      ) : Protocol::Request
        input = Types::CreateIndexRequest.new(directory_arn: directory_arn, is_unique: is_unique, ordered_indexed_attribute_list: ordered_indexed_attribute_list, link_name: link_name, parent_reference: parent_reference)
        create_index(input)
      end

      def create_index(input : Types::CreateIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an object in a Directory . Additionally attaches the object to a parent, if a parent
      # reference and LinkName is specified. An object is simply a collection of Facet attributes. You can
      # also use this API call to create a policy object, if the facet from which you create the object is a
      # policy facet.

      def create_object(
        directory_arn : String,
        schema_facets : Array(Types::SchemaFacet),
        link_name : String? = nil,
        object_attribute_list : Array(Types::AttributeKeyAndValue)? = nil,
        parent_reference : Types::ObjectReference? = nil
      ) : Protocol::Request
        input = Types::CreateObjectRequest.new(directory_arn: directory_arn, schema_facets: schema_facets, link_name: link_name, object_attribute_list: object_attribute_list, parent_reference: parent_reference)
        create_object(input)
      end

      def create_object(input : Types::CreateObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new schema in a development state. A schema can exist in three phases: Development: This
      # is a mutable phase of the schema. All new schemas are in the development phase. Once the schema is
      # finalized, it can be published. Published: Published schemas are immutable and have a version
      # associated with them. Applied: Applied schemas are mutable in a way that allows you to add new
      # schema facets. You can also add new, nonrequired attributes to existing schema facets. You can apply
      # only published schemas to directories.

      def create_schema(
        name : String
      ) : Protocol::Request
        input = Types::CreateSchemaRequest.new(name: name)
        create_schema(input)
      end

      def create_schema(input : Types::CreateSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a TypedLinkFacet . For more information, see Typed Links .

      def create_typed_link_facet(
        facet : Types::TypedLinkFacet,
        schema_arn : String
      ) : Protocol::Request
        input = Types::CreateTypedLinkFacetRequest.new(facet: facet, schema_arn: schema_arn)
        create_typed_link_facet(input)
      end

      def create_typed_link_facet(input : Types::CreateTypedLinkFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TYPED_LINK_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a directory. Only disabled directories can be deleted. A deleted directory cannot be undone.
      # Exercise extreme caution when deleting directories.

      def delete_directory(
        directory_arn : String
      ) : Protocol::Request
        input = Types::DeleteDirectoryRequest.new(directory_arn: directory_arn)
        delete_directory(input)
      end

      def delete_directory(input : Types::DeleteDirectoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DIRECTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a given Facet . All attributes and Rule s that are associated with the facet will be
      # deleted. Only development schema facets are allowed deletion.

      def delete_facet(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::DeleteFacetRequest.new(name: name, schema_arn: schema_arn)
        delete_facet(input)
      end

      def delete_facet(input : Types::DeleteFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an object and its associated attributes. Only objects with no children and no parents can be
      # deleted. The maximum number of attributes that can be deleted during an object deletion is 30. For
      # more information, see Amazon Cloud Directory Limits .

      def delete_object(
        directory_arn : String,
        object_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::DeleteObjectRequest.new(directory_arn: directory_arn, object_reference: object_reference)
        delete_object(input)
      end

      def delete_object(input : Types::DeleteObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a given schema. Schemas in a development and published state can only be deleted.

      def delete_schema(
        schema_arn : String
      ) : Protocol::Request
        input = Types::DeleteSchemaRequest.new(schema_arn: schema_arn)
        delete_schema(input)
      end

      def delete_schema(input : Types::DeleteSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a TypedLinkFacet . For more information, see Typed Links .

      def delete_typed_link_facet(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::DeleteTypedLinkFacetRequest.new(name: name, schema_arn: schema_arn)
        delete_typed_link_facet(input)
      end

      def delete_typed_link_facet(input : Types::DeleteTypedLinkFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TYPED_LINK_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches the specified object from the specified index.

      def detach_from_index(
        directory_arn : String,
        index_reference : Types::ObjectReference,
        target_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::DetachFromIndexRequest.new(directory_arn: directory_arn, index_reference: index_reference, target_reference: target_reference)
        detach_from_index(input)
      end

      def detach_from_index(input : Types::DetachFromIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_FROM_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a given object from the parent object. The object that is to be detached from the parent is
      # specified by the link name.

      def detach_object(
        directory_arn : String,
        link_name : String,
        parent_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::DetachObjectRequest.new(directory_arn: directory_arn, link_name: link_name, parent_reference: parent_reference)
        detach_object(input)
      end

      def detach_object(input : Types::DetachObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a policy from an object.

      def detach_policy(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        policy_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::DetachPolicyRequest.new(directory_arn: directory_arn, object_reference: object_reference, policy_reference: policy_reference)
        detach_policy(input)
      end

      def detach_policy(input : Types::DetachPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a typed link from a specified source and target object. For more information, see Typed
      # Links .

      def detach_typed_link(
        directory_arn : String,
        typed_link_specifier : Types::TypedLinkSpecifier
      ) : Protocol::Request
        input = Types::DetachTypedLinkRequest.new(directory_arn: directory_arn, typed_link_specifier: typed_link_specifier)
        detach_typed_link(input)
      end

      def detach_typed_link(input : Types::DetachTypedLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DETACH_TYPED_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the specified directory. Disabled directories cannot be read or written to. Only enabled
      # directories can be disabled. Disabled directories may be reenabled.

      def disable_directory(
        directory_arn : String
      ) : Protocol::Request
        input = Types::DisableDirectoryRequest.new(directory_arn: directory_arn)
        disable_directory(input)
      end

      def disable_directory(input : Types::DisableDirectoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_DIRECTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the specified directory. Only disabled directories can be enabled. Once enabled, the
      # directory can then be read and written to.

      def enable_directory(
        directory_arn : String
      ) : Protocol::Request
        input = Types::EnableDirectoryRequest.new(directory_arn: directory_arn)
        enable_directory(input)
      end

      def enable_directory(input : Types::EnableDirectoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_DIRECTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns current applied schema version ARN, including the minor version in use.

      def get_applied_schema_version(
        schema_arn : String
      ) : Protocol::Request
        input = Types::GetAppliedSchemaVersionRequest.new(schema_arn: schema_arn)
        get_applied_schema_version(input)
      end

      def get_applied_schema_version(input : Types::GetAppliedSchemaVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLIED_SCHEMA_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata about a directory.

      def get_directory(
        directory_arn : String
      ) : Protocol::Request
        input = Types::GetDirectoryRequest.new(directory_arn: directory_arn)
        get_directory(input)
      end

      def get_directory(input : Types::GetDirectoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DIRECTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details of the Facet , such as facet name, attributes, Rule s, or ObjectType . You can call
      # this on all kinds of schema facets -- published, development, or applied.

      def get_facet(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::GetFacetRequest.new(name: name, schema_arn: schema_arn)
        get_facet(input)
      end

      def get_facet(input : Types::GetFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves attributes that are associated with a typed link.

      def get_link_attributes(
        attribute_names : Array(String),
        directory_arn : String,
        typed_link_specifier : Types::TypedLinkSpecifier,
        consistency_level : String? = nil
      ) : Protocol::Request
        input = Types::GetLinkAttributesRequest.new(attribute_names: attribute_names, directory_arn: directory_arn, typed_link_specifier: typed_link_specifier, consistency_level: consistency_level)
        get_link_attributes(input)
      end

      def get_link_attributes(input : Types::GetLinkAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINK_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves attributes within a facet that are associated with an object.

      def get_object_attributes(
        attribute_names : Array(String),
        directory_arn : String,
        object_reference : Types::ObjectReference,
        schema_facet : Types::SchemaFacet,
        consistency_level : String? = nil
      ) : Protocol::Request
        input = Types::GetObjectAttributesRequest.new(attribute_names: attribute_names, directory_arn: directory_arn, object_reference: object_reference, schema_facet: schema_facet, consistency_level: consistency_level)
        get_object_attributes(input)
      end

      def get_object_attributes(input : Types::GetObjectAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OBJECT_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves metadata about an object.

      def get_object_information(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil
      ) : Protocol::Request
        input = Types::GetObjectInformationRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level)
        get_object_information(input)
      end

      def get_object_information(input : Types::GetObjectInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OBJECT_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a JSON representation of the schema. See JSON Schema Format for more information.

      def get_schema_as_json(
        schema_arn : String
      ) : Protocol::Request
        input = Types::GetSchemaAsJsonRequest.new(schema_arn: schema_arn)
        get_schema_as_json(input)
      end

      def get_schema_as_json(input : Types::GetSchemaAsJsonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA_AS_JSON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the identity attribute order for a specific TypedLinkFacet . For more information, see Typed
      # Links .

      def get_typed_link_facet_information(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::GetTypedLinkFacetInformationRequest.new(name: name, schema_arn: schema_arn)
        get_typed_link_facet_information(input)
      end

      def get_typed_link_facet_information(input : Types::GetTypedLinkFacetInformationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TYPED_LINK_FACET_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists schema major versions applied to a directory. If SchemaArn is provided, lists the minor
      # version.

      def list_applied_schema_arns(
        directory_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListAppliedSchemaArnsRequest.new(directory_arn: directory_arn, max_results: max_results, next_token: next_token, schema_arn: schema_arn)
        list_applied_schema_arns(input)
      end

      def list_applied_schema_arns(input : Types::ListAppliedSchemaArnsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLIED_SCHEMA_ARNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists indices attached to the specified object.

      def list_attached_indices(
        directory_arn : String,
        target_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttachedIndicesRequest.new(directory_arn: directory_arn, target_reference: target_reference, consistency_level: consistency_level, max_results: max_results, next_token: next_token)
        list_attached_indices(input)
      end

      def list_attached_indices(input : Types::ListAttachedIndicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTACHED_INDICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves each Amazon Resource Name (ARN) of schemas in the development state.

      def list_development_schema_arns(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDevelopmentSchemaArnsRequest.new(max_results: max_results, next_token: next_token)
        list_development_schema_arns(input)
      end

      def list_development_schema_arns(input : Types::ListDevelopmentSchemaArnsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEVELOPMENT_SCHEMA_ARNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists directories created within an account.

      def list_directories(
        max_results : Int32? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListDirectoriesRequest.new(max_results: max_results, next_token: next_token, state: state)
        list_directories(input)
      end

      def list_directories(input : Types::ListDirectoriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DIRECTORIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves attributes attached to the facet.

      def list_facet_attributes(
        name : String,
        schema_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFacetAttributesRequest.new(name: name, schema_arn: schema_arn, max_results: max_results, next_token: next_token)
        list_facet_attributes(input)
      end

      def list_facet_attributes(input : Types::ListFacetAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FACET_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the names of facets that exist in a schema.

      def list_facet_names(
        schema_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFacetNamesRequest.new(schema_arn: schema_arn, max_results: max_results, next_token: next_token)
        list_facet_names(input)
      end

      def list_facet_names(input : Types::ListFacetNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FACET_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of all the incoming TypedLinkSpecifier information for an object. It also
      # supports filtering by typed link facet and identity attributes. For more information, see Typed
      # Links .

      def list_incoming_typed_links(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
        filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIncomingTypedLinksRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, filter_attribute_ranges: filter_attribute_ranges, filter_typed_link: filter_typed_link, max_results: max_results, next_token: next_token)
        list_incoming_typed_links(input)
      end

      def list_incoming_typed_links(input : Types::ListIncomingTypedLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INCOMING_TYPED_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists objects attached to the specified index.

      def list_index(
        directory_arn : String,
        index_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        ranges_on_indexed_values : Array(Types::ObjectAttributeRange)? = nil
      ) : Protocol::Request
        input = Types::ListIndexRequest.new(directory_arn: directory_arn, index_reference: index_reference, consistency_level: consistency_level, max_results: max_results, next_token: next_token, ranges_on_indexed_values: ranges_on_indexed_values)
        list_index(input)
      end

      def list_index(input : Types::ListIndexRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INDEX, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the major version families of each managed schema. If a major version ARN is provided as
      # SchemaArn, the minor version revisions in that family are listed instead.

      def list_managed_schema_arns(
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListManagedSchemaArnsRequest.new(max_results: max_results, next_token: next_token, schema_arn: schema_arn)
        list_managed_schema_arns(input)
      end

      def list_managed_schema_arns(input : Types::ListManagedSchemaArnsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_SCHEMA_ARNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all attributes that are associated with an object.

      def list_object_attributes(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        facet_filter : Types::SchemaFacet? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectAttributesRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, facet_filter: facet_filter, max_results: max_results, next_token: next_token)
        list_object_attributes(input)
      end

      def list_object_attributes(input : Types::ListObjectAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of child objects that are associated with a given object.

      def list_object_children(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectChildrenRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, max_results: max_results, next_token: next_token)
        list_object_children(input)
      end

      def list_object_children(input : Types::ListObjectChildrenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_CHILDREN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all available parent paths for any object type such as node, leaf node, policy node, and
      # index node objects. For more information about objects, see Directory Structure . Use this API to
      # evaluate all parents for an object. The call returns all objects from the root of the directory up
      # to the requested object. The API returns the number of paths based on user-defined MaxResults , in
      # case there are multiple paths to the parent. The order of the paths and nodes returned is consistent
      # among multiple API calls unless the objects are deleted or moved. Paths not leading to the directory
      # root are ignored from the target object.

      def list_object_parent_paths(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectParentPathsRequest.new(directory_arn: directory_arn, object_reference: object_reference, max_results: max_results, next_token: next_token)
        list_object_parent_paths(input)
      end

      def list_object_parent_paths(input : Types::ListObjectParentPathsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_PARENT_PATHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists parent objects that are associated with a given object in pagination fashion.

      def list_object_parents(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        include_all_links_to_each_parent : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectParentsRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, include_all_links_to_each_parent: include_all_links_to_each_parent, max_results: max_results, next_token: next_token)
        list_object_parents(input)
      end

      def list_object_parents(input : Types::ListObjectParentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_PARENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns policies attached to an object in pagination fashion.

      def list_object_policies(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListObjectPoliciesRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, max_results: max_results, next_token: next_token)
        list_object_policies(input)
      end

      def list_object_policies(input : Types::ListObjectPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OBJECT_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of all the outgoing TypedLinkSpecifier information for an object. It also
      # supports filtering by typed link facet and identity attributes. For more information, see Typed
      # Links .

      def list_outgoing_typed_links(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        filter_attribute_ranges : Array(Types::TypedLinkAttributeRange)? = nil,
        filter_typed_link : Types::TypedLinkSchemaAndFacetName? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOutgoingTypedLinksRequest.new(directory_arn: directory_arn, object_reference: object_reference, consistency_level: consistency_level, filter_attribute_ranges: filter_attribute_ranges, filter_typed_link: filter_typed_link, max_results: max_results, next_token: next_token)
        list_outgoing_typed_links(input)
      end

      def list_outgoing_typed_links(input : Types::ListOutgoingTypedLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OUTGOING_TYPED_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all of the ObjectIdentifiers to which a given policy is attached.

      def list_policy_attachments(
        directory_arn : String,
        policy_reference : Types::ObjectReference,
        consistency_level : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyAttachmentsRequest.new(directory_arn: directory_arn, policy_reference: policy_reference, consistency_level: consistency_level, max_results: max_results, next_token: next_token)
        list_policy_attachments(input)
      end

      def list_policy_attachments(input : Types::ListPolicyAttachmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_ATTACHMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the major version families of each published schema. If a major version ARN is provided as
      # SchemaArn , the minor version revisions in that family are listed instead.

      def list_published_schema_arns(
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListPublishedSchemaArnsRequest.new(max_results: max_results, next_token: next_token, schema_arn: schema_arn)
        list_published_schema_arns(input)
      end

      def list_published_schema_arns(input : Types::ListPublishedSchemaArnsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PUBLISHED_SCHEMA_ARNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns tags for a resource. Tagging is currently supported only for directories with a limit of 50
      # tags per directory. All 50 tags are returned for a given directory with this API call.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of all attribute definitions for a particular TypedLinkFacet . For more
      # information, see Typed Links .

      def list_typed_link_facet_attributes(
        name : String,
        schema_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTypedLinkFacetAttributesRequest.new(name: name, schema_arn: schema_arn, max_results: max_results, next_token: next_token)
        list_typed_link_facet_attributes(input)
      end

      def list_typed_link_facet_attributes(input : Types::ListTypedLinkFacetAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TYPED_LINK_FACET_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of TypedLink facet names for a particular schema. For more information, see
      # Typed Links .

      def list_typed_link_facet_names(
        schema_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTypedLinkFacetNamesRequest.new(schema_arn: schema_arn, max_results: max_results, next_token: next_token)
        list_typed_link_facet_names(input)
      end

      def list_typed_link_facet_names(input : Types::ListTypedLinkFacetNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TYPED_LINK_FACET_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all policies from the root of the Directory to the object specified. If there are no policies
      # present, an empty list is returned. If policies are present, and if some objects don't have the
      # policies attached, it returns the ObjectIdentifier for such objects. If policies are present, it
      # returns ObjectIdentifier , policyId , and policyType . Paths that don't lead to the root from the
      # target object are ignored. For more information, see Policies .

      def lookup_policy(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::LookupPolicyRequest.new(directory_arn: directory_arn, object_reference: object_reference, max_results: max_results, next_token: next_token)
        lookup_policy(input)
      end

      def lookup_policy(input : Types::LookupPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LOOKUP_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a development schema with a major version and a recommended minor version.

      def publish_schema(
        development_schema_arn : String,
        version : String,
        minor_version : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::PublishSchemaRequest.new(development_schema_arn: development_schema_arn, version: version, minor_version: minor_version, name: name)
        publish_schema(input)
      end

      def publish_schema(input : Types::PublishSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a schema to be updated using JSON upload. Only available for development schemas. See JSON
      # Schema Format for more information.

      def put_schema_from_json(
        document : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::PutSchemaFromJsonRequest.new(document: document, schema_arn: schema_arn)
        put_schema_from_json(input)
      end

      def put_schema_from_json(input : Types::PutSchemaFromJsonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SCHEMA_FROM_JSON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified facet from the specified object.

      def remove_facet_from_object(
        directory_arn : String,
        object_reference : Types::ObjectReference,
        schema_facet : Types::SchemaFacet
      ) : Protocol::Request
        input = Types::RemoveFacetFromObjectRequest.new(directory_arn: directory_arn, object_reference: object_reference, schema_facet: schema_facet)
        remove_facet_from_object(input)
      end

      def remove_facet_from_object(input : Types::RemoveFacetFromObjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_FACET_FROM_OBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # An API operation for adding tags to a resource.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # An API operation for removing tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Does the following: Adds new Attributes , Rules , or ObjectTypes . Updates existing Attributes ,
      # Rules , or ObjectTypes . Deletes existing Attributes , Rules , or ObjectTypes .

      def update_facet(
        name : String,
        schema_arn : String,
        attribute_updates : Array(Types::FacetAttributeUpdate)? = nil,
        object_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFacetRequest.new(name: name, schema_arn: schema_arn, attribute_updates: attribute_updates, object_type: object_type)
        update_facet(input)
      end

      def update_facet(input : Types::UpdateFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a given typed link’s attributes. Attributes to be updated must not contribute to the typed
      # link’s identity, as defined by its IdentityAttributeOrder .

      def update_link_attributes(
        attribute_updates : Array(Types::LinkAttributeUpdate),
        directory_arn : String,
        typed_link_specifier : Types::TypedLinkSpecifier
      ) : Protocol::Request
        input = Types::UpdateLinkAttributesRequest.new(attribute_updates: attribute_updates, directory_arn: directory_arn, typed_link_specifier: typed_link_specifier)
        update_link_attributes(input)
      end

      def update_link_attributes(input : Types::UpdateLinkAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LINK_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a given object's attributes.

      def update_object_attributes(
        attribute_updates : Array(Types::ObjectAttributeUpdate),
        directory_arn : String,
        object_reference : Types::ObjectReference
      ) : Protocol::Request
        input = Types::UpdateObjectAttributesRequest.new(attribute_updates: attribute_updates, directory_arn: directory_arn, object_reference: object_reference)
        update_object_attributes(input)
      end

      def update_object_attributes(input : Types::UpdateObjectAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_OBJECT_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the schema name with a new name. Only development schema names can be updated.

      def update_schema(
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::UpdateSchemaRequest.new(name: name, schema_arn: schema_arn)
        update_schema(input)
      end

      def update_schema(input : Types::UpdateSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a TypedLinkFacet . For more information, see Typed Links .

      def update_typed_link_facet(
        attribute_updates : Array(Types::TypedLinkFacetAttributeUpdate),
        identity_attribute_order : Array(String),
        name : String,
        schema_arn : String
      ) : Protocol::Request
        input = Types::UpdateTypedLinkFacetRequest.new(attribute_updates: attribute_updates, identity_attribute_order: identity_attribute_order, name: name, schema_arn: schema_arn)
        update_typed_link_facet(input)
      end

      def update_typed_link_facet(input : Types::UpdateTypedLinkFacetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TYPED_LINK_FACET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upgrades a single directory in-place using the PublishedSchemaArn with schema updates found in
      # MinorVersion . Backwards-compatible minor version upgrades are instantaneously available for readers
      # on all objects in the directory. Note: This is a synchronous API call and upgrades only one schema
      # on a given directory per call. To upgrade multiple directories from one schema, you would need to
      # call this API on each directory.

      def upgrade_applied_schema(
        directory_arn : String,
        published_schema_arn : String,
        dry_run : Bool? = nil
      ) : Protocol::Request
        input = Types::UpgradeAppliedSchemaRequest.new(directory_arn: directory_arn, published_schema_arn: published_schema_arn, dry_run: dry_run)
        upgrade_applied_schema(input)
      end

      def upgrade_applied_schema(input : Types::UpgradeAppliedSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_APPLIED_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upgrades a published schema under a new minor version revision using the current contents of
      # DevelopmentSchemaArn .

      def upgrade_published_schema(
        development_schema_arn : String,
        minor_version : String,
        published_schema_arn : String,
        dry_run : Bool? = nil
      ) : Protocol::Request
        input = Types::UpgradePublishedSchemaRequest.new(development_schema_arn: development_schema_arn, minor_version: minor_version, published_schema_arn: published_schema_arn, dry_run: dry_run)
        upgrade_published_schema(input)
      end

      def upgrade_published_schema(input : Types::UpgradePublishedSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_PUBLISHED_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
