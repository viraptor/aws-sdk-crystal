require "json"
require "time"

module Aws
  module Schemas
    module Types


      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct CodeBindingOutput
        include JSON::Serializable

        # The time and date that the code binding was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The date and time that code bindings were modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The version number of the schema.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # The current status of code binding generation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified : Time? = nil,
          @schema_version : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct CreateDiscovererInput
        include JSON::Serializable

        # The ARN of the event bus.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String

        # Support discovery of schemas in events sent to the bus from another account. (default: true)

        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?

        # A description for the discoverer.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_arn : String,
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String


        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @source_arn : String,
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDiscovererResponse
        include JSON::Serializable


        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "DiscovererArn")]
        getter discoverer_arn : String?


        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?


        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?


        @[JSON::Field(key: "State")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @discoverer_arn : String? = nil,
          @discoverer_id : String? = nil,
          @source_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRegistryInput
        include JSON::Serializable

        # A description of the registry to be created.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags to associate with the registry.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRegistryRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @registry_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRegistryResponse
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "RegistryArn")]
        getter registry_arn : String?


        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @registry_arn : String? = nil,
          @registry_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSchemaInput
        include JSON::Serializable

        # The source of the schema definition.

        @[JSON::Field(key: "Content")]
        getter content : String

        # The type of schema.

        @[JSON::Field(key: "Type")]
        getter type : String

        # A description of the schema.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags associated with the schema.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : String,
          @type : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "Content")]
        getter content : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "Type")]
        getter type : String


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : String,
          @registry_name : String,
          @schema_name : String,
          @type : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSchemaResponse
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?


        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "Type")]
        getter type : String?


        @[JSON::Field(key: "VersionCreatedDate")]
        getter version_created_date : Time?

        def initialize(
          @description : String? = nil,
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version_created_date : Time? = nil
        )
        end
      end


      struct DeleteDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererId")]
        getter discoverer_id : String

        def initialize(
          @discoverer_id : String
        )
        end
      end


      struct DeleteRegistryRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String

        def initialize(
          @registry_name : String
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String?

        def initialize(
          @registry_name : String? = nil
        )
        end
      end


      struct DeleteSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String

        def initialize(
          @registry_name : String,
          @schema_name : String
        )
        end
      end


      struct DeleteSchemaVersionRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        def initialize(
          @registry_name : String,
          @schema_name : String,
          @schema_version : String
        )
        end
      end


      struct DescribeCodeBindingRequest
        include JSON::Serializable


        @[JSON::Field(key: "language")]
        getter language : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        def initialize(
          @language : String,
          @registry_name : String,
          @schema_name : String,
          @schema_version : String? = nil
        )
        end
      end


      struct DescribeCodeBindingResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?


        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified : Time? = nil,
          @schema_version : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererId")]
        getter discoverer_id : String

        def initialize(
          @discoverer_id : String
        )
        end
      end


      struct DescribeDiscovererResponse
        include JSON::Serializable


        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "DiscovererArn")]
        getter discoverer_arn : String?


        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?


        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?


        @[JSON::Field(key: "State")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @discoverer_arn : String? = nil,
          @discoverer_id : String? = nil,
          @source_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeRegistryRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String

        def initialize(
          @registry_name : String
        )
        end
      end


      struct DescribeRegistryResponse
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "RegistryArn")]
        getter registry_arn : String?


        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @registry_arn : String? = nil,
          @registry_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DescribeSchemaOutput
        include JSON::Serializable

        # The source of the schema definition.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The description of the schema.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time that schema was modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The ARN of the schema.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The version number of the schema

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # Tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the schema.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date the schema version was created.

        @[JSON::Field(key: "VersionCreatedDate")]
        getter version_created_date : Time?

        def initialize(
          @content : String? = nil,
          @description : String? = nil,
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version_created_date : Time? = nil
        )
        end
      end


      struct DescribeSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        def initialize(
          @registry_name : String,
          @schema_name : String,
          @schema_version : String? = nil
        )
        end
      end


      struct DescribeSchemaResponse
        include JSON::Serializable


        @[JSON::Field(key: "Content")]
        getter content : String?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?


        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "Type")]
        getter type : String?


        @[JSON::Field(key: "VersionCreatedDate")]
        getter version_created_date : Time?

        def initialize(
          @content : String? = nil,
          @description : String? = nil,
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version_created_date : Time? = nil
        )
        end
      end


      struct DiscovererOutput
        include JSON::Serializable

        # The Status if the discoverer will discover schemas from events sent from another account.

        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?

        # The description of the discoverer.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the discoverer.

        @[JSON::Field(key: "DiscovererArn")]
        getter discoverer_arn : String?

        # The ID of the discoverer.

        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?

        # The ARN of the event bus.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The state of the discoverer.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @discoverer_arn : String? = nil,
          @discoverer_id : String? = nil,
          @source_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct DiscovererStateOutput
        include JSON::Serializable

        # The ID of the discoverer.

        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?

        # The state of the discoverer.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @discoverer_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DiscovererSummary
        include JSON::Serializable

        # The Status if the discoverer will discover schemas from events sent from another account.

        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?

        # The ARN of the discoverer.

        @[JSON::Field(key: "DiscovererArn")]
        getter discoverer_arn : String?

        # The ID of the discoverer.

        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?

        # The ARN of the event bus.

        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?

        # The state of the discoverer.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cross_account : Bool? = nil,
          @discoverer_arn : String? = nil,
          @discoverer_id : String? = nil,
          @source_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ErrorOutput
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "Code")]
        getter code : String

        # The message string of the error output.

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct ExportSchemaOutput
        include JSON::Serializable

        # The content of the schema.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The ARN of the schema to export.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema to export.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The version of the schema to export.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?

        # The type of schema to export.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ExportSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "type")]
        getter type : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        def initialize(
          @registry_name : String,
          @schema_name : String,
          @type : String,
          @schema_version : String? = nil
        )
        end
      end


      struct ExportSchemaResponse
        include JSON::Serializable


        @[JSON::Field(key: "Content")]
        getter content : String?


        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?


        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @content : String? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct GetCodeBindingSourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "language")]
        getter language : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        def initialize(
          @language : String,
          @registry_name : String,
          @schema_name : String,
          @schema_version : String? = nil
        )
        end
      end


      struct GetCodeBindingSourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "Body")]
        getter body : Bytes?

        def initialize(
          @body : Bytes? = nil
        )
        end
      end


      struct GetDiscoveredSchemaInput
        include JSON::Serializable

        # An array of strings where each string is a JSON event. These are the events that were used to
        # generate the schema. The array includes a single type of event and has a maximum size of 10 events.

        @[JSON::Field(key: "Events")]
        getter events : Array(String)

        # The type of event.

        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @events : Array(String),
          @type : String
        )
        end
      end


      struct GetDiscoveredSchemaOutput
        include JSON::Serializable

        # The source of the schema definition.

        @[JSON::Field(key: "Content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end


      struct GetDiscoveredSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "Events")]
        getter events : Array(String)


        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @events : Array(String),
          @type : String
        )
        end
      end


      struct GetDiscoveredSchemaResponse
        include JSON::Serializable


        @[JSON::Field(key: "Content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # Information about the policy.

      struct GetResourcePolicyOutput
        include JSON::Serializable

        # The resource-based policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The revision ID.

        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String?

        def initialize(
          @registry_name : String? = nil
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable


        @[JSON::Field(key: "Policy")]
        getter policy : String?


        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct GoneException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct ListDiscoverersOutput
        include JSON::Serializable


        @[JSON::Field(key: "Discoverers")]
        getter discoverers : Array(Types::DiscovererSummary)?

        # The token that specifies the next page of results to return. To request the first page, leave
        # NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @discoverers : Array(Types::DiscovererSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDiscoverersRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererIdPrefix")]
        getter discoverer_id_prefix : String?


        @[JSON::Field(key: "limit")]
        getter limit : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "sourceArnPrefix")]
        getter source_arn_prefix : String?

        def initialize(
          @discoverer_id_prefix : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @source_arn_prefix : String? = nil
        )
        end
      end


      struct ListDiscoverersResponse
        include JSON::Serializable


        @[JSON::Field(key: "Discoverers")]
        getter discoverers : Array(Types::DiscovererSummary)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @discoverers : Array(Types::DiscovererSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # List the registries.

      struct ListRegistriesOutput
        include JSON::Serializable

        # The token that specifies the next page of results to return. To request the first page, leave
        # NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of registry summaries.

        @[JSON::Field(key: "Registries")]
        getter registries : Array(Types::RegistrySummary)?

        def initialize(
          @next_token : String? = nil,
          @registries : Array(Types::RegistrySummary)? = nil
        )
        end
      end


      struct ListRegistriesRequest
        include JSON::Serializable


        @[JSON::Field(key: "limit")]
        getter limit : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "registryNamePrefix")]
        getter registry_name_prefix : String?


        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @registry_name_prefix : String? = nil,
          @scope : String? = nil
        )
        end
      end


      struct ListRegistriesResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Registries")]
        getter registries : Array(Types::RegistrySummary)?

        def initialize(
          @next_token : String? = nil,
          @registries : Array(Types::RegistrySummary)? = nil
        )
        end
      end


      struct ListSchemaVersionsOutput
        include JSON::Serializable

        # The token that specifies the next page of results to return. To request the first page, leave
        # NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of schema version summaries.

        @[JSON::Field(key: "SchemaVersions")]
        getter schema_versions : Array(Types::SchemaVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @schema_versions : Array(Types::SchemaVersionSummary)? = nil
        )
        end
      end


      struct ListSchemaVersionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "limit")]
        getter limit : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @registry_name : String,
          @schema_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchemaVersionsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "SchemaVersions")]
        getter schema_versions : Array(Types::SchemaVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @schema_versions : Array(Types::SchemaVersionSummary)? = nil
        )
        end
      end


      struct ListSchemasOutput
        include JSON::Serializable

        # The token that specifies the next page of results to return. To request the first page, leave
        # NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of schema summaries.

        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(Types::SchemaSummary)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::SchemaSummary)? = nil
        )
        end
      end


      struct ListSchemasRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "limit")]
        getter limit : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "schemaNamePrefix")]
        getter schema_name_prefix : String?

        def initialize(
          @registry_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @schema_name_prefix : String? = nil
        )
        end
      end


      struct ListSchemasResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(Types::SchemaSummary)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::SchemaSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct PreconditionFailedException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct PutCodeBindingRequest
        include JSON::Serializable


        @[JSON::Field(key: "language")]
        getter language : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String?

        def initialize(
          @language : String,
          @registry_name : String,
          @schema_name : String,
          @schema_version : String? = nil
        )
        end
      end


      struct PutCodeBindingResponse
        include JSON::Serializable


        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?


        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_date : Time? = nil,
          @last_modified : Time? = nil,
          @schema_version : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Only update the policy if the revision ID matches the ID that's specified. Use this option to avoid
      # modifying a policy that has changed since you last read it.

      struct PutResourcePolicyInput
        include JSON::Serializable

        # The resource-based policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The revision ID of the policy.

        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String,
          @revision_id : String? = nil
        )
        end
      end

      # The resource-based policy.

      struct PutResourcePolicyOutput
        include JSON::Serializable

        # The resource-based policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The revision ID of the policy.

        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "Policy")]
        getter policy : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String?


        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String,
          @registry_name : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable


        @[JSON::Field(key: "Policy")]
        getter policy : String?


        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct RegistryOutput
        include JSON::Serializable

        # The description of the registry.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the registry.

        @[JSON::Field(key: "RegistryArn")]
        getter registry_arn : String?

        # The name of the registry.

        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?

        # Tags associated with the registry.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @registry_arn : String? = nil,
          @registry_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct RegistrySummary
        include JSON::Serializable

        # The ARN of the registry.

        @[JSON::Field(key: "RegistryArn")]
        getter registry_arn : String?

        # The name of the registry.

        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?

        # Tags associated with the registry.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @registry_arn : String? = nil,
          @registry_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct SchemaOutput
        include JSON::Serializable

        # The description of the schema.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time that schema was modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The ARN of the schema.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The version number of the schema

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the schema.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The date the schema version was created.

        @[JSON::Field(key: "VersionCreatedDate")]
        getter version_created_date : Time?

        def initialize(
          @description : String? = nil,
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version_created_date : Time? = nil
        )
        end
      end

      # A summary of schema details.

      struct SchemaSummary
        include JSON::Serializable

        # The date and time that schema was modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The ARN of the schema.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # Tags associated with the schema.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The number of versions available for the schema.

        @[JSON::Field(key: "VersionCount")]
        getter version_count : Int64?

        def initialize(
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version_count : Int64? = nil
        )
        end
      end


      struct SchemaVersionSummary
        include JSON::Serializable

        # The ARN of the schema version.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # The version number of the schema.

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct SearchSchemaSummary
        include JSON::Serializable

        # The name of the registry.

        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?

        # The ARN of the schema.

        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?

        # The name of the schema.

        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?

        # An array of schema version summaries.

        @[JSON::Field(key: "SchemaVersions")]
        getter schema_versions : Array(Types::SearchSchemaVersionSummary)?

        def initialize(
          @registry_name : String? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_versions : Array(Types::SearchSchemaVersionSummary)? = nil
        )
        end
      end


      struct SearchSchemaVersionSummary
        include JSON::Serializable

        # The date the schema version was created.

        @[JSON::Field(key: "CreatedDate")]
        getter created_date : Time?

        # The version number of the schema

        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @created_date : Time? = nil,
          @schema_version : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct SearchSchemasOutput
        include JSON::Serializable

        # The token that specifies the next page of results to return. To request the first page, leave
        # NextToken empty. The token will expire in 24 hours, and cannot be shared with other accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of SearchSchemaSummary information.

        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(Types::SearchSchemaSummary)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::SearchSchemaSummary)? = nil
        )
        end
      end


      struct SearchSchemasRequest
        include JSON::Serializable


        @[JSON::Field(key: "keywords")]
        getter keywords : String


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "limit")]
        getter limit : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @keywords : String,
          @registry_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct SearchSchemasResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?


        @[JSON::Field(key: "Schemas")]
        getter schemas : Array(Types::SearchSchemaSummary)?

        def initialize(
          @next_token : String? = nil,
          @schemas : Array(Types::SearchSchemaSummary)? = nil
        )
        end
      end


      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct StartDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererId")]
        getter discoverer_id : String

        def initialize(
          @discoverer_id : String
        )
        end
      end


      struct StartDiscovererResponse
        include JSON::Serializable


        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?


        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @discoverer_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct StopDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererId")]
        getter discoverer_id : String

        def initialize(
          @discoverer_id : String
        )
        end
      end


      struct StopDiscovererResponse
        include JSON::Serializable


        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?


        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @discoverer_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # Tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct UnauthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @code : String,
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateDiscovererInput
        include JSON::Serializable

        # Support discovery of schemas in events sent to the bus from another account. (default: true)

        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?

        # The description of the discoverer to update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @cross_account : Bool? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateDiscovererRequest
        include JSON::Serializable


        @[JSON::Field(key: "discovererId")]
        getter discoverer_id : String


        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?


        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @discoverer_id : String,
          @cross_account : Bool? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateDiscovererResponse
        include JSON::Serializable


        @[JSON::Field(key: "CrossAccount")]
        getter cross_account : Bool?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "DiscovererArn")]
        getter discoverer_arn : String?


        @[JSON::Field(key: "DiscovererId")]
        getter discoverer_id : String?


        @[JSON::Field(key: "SourceArn")]
        getter source_arn : String?


        @[JSON::Field(key: "State")]
        getter state : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @cross_account : Bool? = nil,
          @description : String? = nil,
          @discoverer_arn : String? = nil,
          @discoverer_id : String? = nil,
          @source_arn : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateRegistryInput
        include JSON::Serializable

        # The description of the registry to update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct UpdateRegistryRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @registry_name : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateRegistryResponse
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "RegistryArn")]
        getter registry_arn : String?


        @[JSON::Field(key: "RegistryName")]
        getter registry_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @registry_arn : String? = nil,
          @registry_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateSchemaInput
        include JSON::Serializable

        # The ID of the client token.

        @[JSON::Field(key: "ClientTokenId")]
        getter client_token_id : String?

        # The source of the schema definition.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The description of the schema.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The schema type for the events schema.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @client_token_id : String? = nil,
          @content : String? = nil,
          @description : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateSchemaRequest
        include JSON::Serializable


        @[JSON::Field(key: "registryName")]
        getter registry_name : String


        @[JSON::Field(key: "schemaName")]
        getter schema_name : String


        @[JSON::Field(key: "ClientTokenId")]
        getter client_token_id : String?


        @[JSON::Field(key: "Content")]
        getter content : String?


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @registry_name : String,
          @schema_name : String,
          @client_token_id : String? = nil,
          @content : String? = nil,
          @description : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct UpdateSchemaResponse
        include JSON::Serializable


        @[JSON::Field(key: "Description")]
        getter description : String?


        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "SchemaArn")]
        getter schema_arn : String?


        @[JSON::Field(key: "SchemaName")]
        getter schema_name : String?


        @[JSON::Field(key: "SchemaVersion")]
        getter schema_version : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "Type")]
        getter type : String?


        @[JSON::Field(key: "VersionCreatedDate")]
        getter version_created_date : Time?

        def initialize(
          @description : String? = nil,
          @last_modified : Time? = nil,
          @schema_arn : String? = nil,
          @schema_name : String? = nil,
          @schema_version : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @version_created_date : Time? = nil
        )
        end
      end
    end
  end
end
