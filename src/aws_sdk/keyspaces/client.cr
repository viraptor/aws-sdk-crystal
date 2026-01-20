module AwsSdk
  module Keyspaces
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # The CreateKeyspace operation adds a new keyspace to your account. In an Amazon Web Services account,
      # keyspace names must be unique within each Region. CreateKeyspace is an asynchronous operation. You
      # can monitor the creation status of the new keyspace by using the GetKeyspace operation. For more
      # information, see Create a keyspace in the Amazon Keyspaces Developer Guide .

      def create_keyspace(
        keyspace_name : String,
        replication_specification : Types::ReplicationSpecification? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateKeyspaceResponse

        input = Types::CreateKeyspaceRequest.new(keyspace_name: keyspace_name, replication_specification: replication_specification, tags: tags)
        create_keyspace(input)
      end

      def create_keyspace(input : Types::CreateKeyspaceRequest) : Types::CreateKeyspaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_KEYSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateKeyspaceResponse, "CreateKeyspace")
      end

      # The CreateTable operation adds a new table to the specified keyspace. Within a keyspace, table names
      # must be unique. CreateTable is an asynchronous operation. When the request is received, the status
      # of the table is set to CREATING . You can monitor the creation status of the new table by using the
      # GetTable operation, which returns the current status of the table. You can start using a table when
      # the status is ACTIVE . For more information, see Create a table in the Amazon Keyspaces Developer
      # Guide .

      def create_table(
        keyspace_name : String,
        schema_definition : Types::SchemaDefinition,
        table_name : String,
        auto_scaling_specification : Types::AutoScalingSpecification? = nil,
        capacity_specification : Types::CapacitySpecification? = nil,
        cdc_specification : Types::CdcSpecification? = nil,
        client_side_timestamps : Types::ClientSideTimestamps? = nil,
        comment : Types::Comment? = nil,
        default_time_to_live : Int32? = nil,
        encryption_specification : Types::EncryptionSpecification? = nil,
        point_in_time_recovery : Types::PointInTimeRecovery? = nil,
        replica_specifications : Array(Types::ReplicaSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        ttl : Types::TimeToLive? = nil
      ) : Types::CreateTableResponse

        input = Types::CreateTableRequest.new(keyspace_name: keyspace_name, schema_definition: schema_definition, table_name: table_name, auto_scaling_specification: auto_scaling_specification, capacity_specification: capacity_specification, cdc_specification: cdc_specification, client_side_timestamps: client_side_timestamps, comment: comment, default_time_to_live: default_time_to_live, encryption_specification: encryption_specification, point_in_time_recovery: point_in_time_recovery, replica_specifications: replica_specifications, tags: tags, ttl: ttl)
        create_table(input)
      end

      def create_table(input : Types::CreateTableRequest) : Types::CreateTableResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTableResponse, "CreateTable")
      end

      # The CreateType operation creates a new user-defined type in the specified keyspace. To configure the
      # required permissions, see Permissions to create a UDT in the Amazon Keyspaces Developer Guide . For
      # more information, see User-defined types (UDTs) in the Amazon Keyspaces Developer Guide .

      def create_type(
        field_definitions : Array(Types::FieldDefinition),
        keyspace_name : String,
        type_name : String
      ) : Types::CreateTypeResponse

        input = Types::CreateTypeRequest.new(field_definitions: field_definitions, keyspace_name: keyspace_name, type_name: type_name)
        create_type(input)
      end

      def create_type(input : Types::CreateTypeRequest) : Types::CreateTypeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTypeResponse, "CreateType")
      end

      # The DeleteKeyspace operation deletes a keyspace and all of its tables.

      def delete_keyspace(
        keyspace_name : String
      ) : Types::DeleteKeyspaceResponse

        input = Types::DeleteKeyspaceRequest.new(keyspace_name: keyspace_name)
        delete_keyspace(input)
      end

      def delete_keyspace(input : Types::DeleteKeyspaceRequest) : Types::DeleteKeyspaceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_KEYSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteKeyspaceResponse, "DeleteKeyspace")
      end

      # The DeleteTable operation deletes a table and all of its data. After a DeleteTable request is
      # received, the specified table is in the DELETING state until Amazon Keyspaces completes the
      # deletion. If the table is in the ACTIVE state, you can delete it. If a table is either in the
      # CREATING or UPDATING states, then Amazon Keyspaces returns a ResourceInUseException . If the
      # specified table does not exist, Amazon Keyspaces returns a ResourceNotFoundException . If the table
      # is already in the DELETING state, no error is returned.

      def delete_table(
        keyspace_name : String,
        table_name : String
      ) : Types::DeleteTableResponse

        input = Types::DeleteTableRequest.new(keyspace_name: keyspace_name, table_name: table_name)
        delete_table(input)
      end

      def delete_table(input : Types::DeleteTableRequest) : Types::DeleteTableResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTableResponse, "DeleteTable")
      end

      # The DeleteType operation deletes a user-defined type (UDT). You can only delete a type that is not
      # used in a table or another UDT. To configure the required permissions, see Permissions to delete a
      # UDT in the Amazon Keyspaces Developer Guide .

      def delete_type(
        keyspace_name : String,
        type_name : String
      ) : Types::DeleteTypeResponse

        input = Types::DeleteTypeRequest.new(keyspace_name: keyspace_name, type_name: type_name)
        delete_type(input)
      end

      def delete_type(input : Types::DeleteTypeRequest) : Types::DeleteTypeResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTypeResponse, "DeleteType")
      end

      # Returns the name of the specified keyspace, the Amazon Resource Name (ARN), the replication
      # strategy, the Amazon Web Services Regions of a multi-Region keyspace, and the status of newly added
      # Regions after an UpdateKeyspace operation.

      def get_keyspace(
        keyspace_name : String
      ) : Types::GetKeyspaceResponse

        input = Types::GetKeyspaceRequest.new(keyspace_name: keyspace_name)
        get_keyspace(input)
      end

      def get_keyspace(input : Types::GetKeyspaceRequest) : Types::GetKeyspaceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_KEYSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetKeyspaceResponse, "GetKeyspace")
      end

      # Returns information about the table, including the table's name and current status, the keyspace
      # name, configuration settings, and metadata. To read table metadata using GetTable , the IAM
      # principal needs Select action permissions for the table and the system keyspace.

      def get_table(
        keyspace_name : String,
        table_name : String
      ) : Types::GetTableResponse

        input = Types::GetTableRequest.new(keyspace_name: keyspace_name, table_name: table_name)
        get_table(input)
      end

      def get_table(input : Types::GetTableRequest) : Types::GetTableResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableResponse, "GetTable")
      end

      # Returns auto scaling related settings of the specified table in JSON format. If the table is a
      # multi-Region table, the Amazon Web Services Region specific auto scaling settings of the table are
      # included. Amazon Keyspaces auto scaling helps you provision throughput capacity for variable
      # workloads efficiently by increasing and decreasing your table's read and write capacity
      # automatically in response to application traffic. For more information, see Managing throughput
      # capacity automatically with Amazon Keyspaces auto scaling in the Amazon Keyspaces Developer Guide .
      # GetTableAutoScalingSettings can't be used as an action in an IAM policy. To define permissions for
      # GetTableAutoScalingSettings , you must allow the following two actions in the IAM policy statement's
      # Action element: application-autoscaling:DescribeScalableTargets
      # application-autoscaling:DescribeScalingPolicies

      def get_table_auto_scaling_settings(
        keyspace_name : String,
        table_name : String
      ) : Types::GetTableAutoScalingSettingsResponse

        input = Types::GetTableAutoScalingSettingsRequest.new(keyspace_name: keyspace_name, table_name: table_name)
        get_table_auto_scaling_settings(input)
      end

      def get_table_auto_scaling_settings(input : Types::GetTableAutoScalingSettingsRequest) : Types::GetTableAutoScalingSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TABLE_AUTO_SCALING_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTableAutoScalingSettingsResponse, "GetTableAutoScalingSettings")
      end

      # The GetType operation returns information about the type, for example the field definitions, the
      # timestamp when the type was last modified, the level of nesting, the status, and details about if
      # the type is used in other types and tables. To read keyspace metadata using GetType , the IAM
      # principal needs Select action permissions for the system keyspace. To configure the required
      # permissions, see Permissions to view a UDT in the Amazon Keyspaces Developer Guide .

      def get_type(
        keyspace_name : String,
        type_name : String
      ) : Types::GetTypeResponse

        input = Types::GetTypeRequest.new(keyspace_name: keyspace_name, type_name: type_name)
        get_type(input)
      end

      def get_type(input : Types::GetTypeRequest) : Types::GetTypeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTypeResponse, "GetType")
      end

      # The ListKeyspaces operation returns a list of keyspaces.

      def list_keyspaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListKeyspacesResponse

        input = Types::ListKeyspacesRequest.new(max_results: max_results, next_token: next_token)
        list_keyspaces(input)
      end

      def list_keyspaces(input : Types::ListKeyspacesRequest) : Types::ListKeyspacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_KEYSPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListKeyspacesResponse, "ListKeyspaces")
      end

      # The ListTables operation returns a list of tables for a specified keyspace. To read keyspace
      # metadata using ListTables , the IAM principal needs Select action permissions for the system
      # keyspace.

      def list_tables(
        keyspace_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTablesResponse

        input = Types::ListTablesRequest.new(keyspace_name: keyspace_name, max_results: max_results, next_token: next_token)
        list_tables(input)
      end

      def list_tables(input : Types::ListTablesRequest) : Types::ListTablesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TABLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTablesResponse, "ListTables")
      end

      # Returns a list of all tags associated with the specified Amazon Keyspaces resource. To read keyspace
      # metadata using ListTagsForResource , the IAM principal needs Select action permissions for the
      # specified resource and the system keyspace.

      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # The ListTypes operation returns a list of types for a specified keyspace. To read keyspace metadata
      # using ListTypes , the IAM principal needs Select action permissions for the system keyspace. To
      # configure the required permissions, see Permissions to view a UDT in the Amazon Keyspaces Developer
      # Guide .

      def list_types(
        keyspace_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTypesResponse

        input = Types::ListTypesRequest.new(keyspace_name: keyspace_name, max_results: max_results, next_token: next_token)
        list_types(input)
      end

      def list_types(input : Types::ListTypesRequest) : Types::ListTypesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTypesResponse, "ListTypes")
      end

      # Restores the table to the specified point in time within the earliest_restorable_timestamp and the
      # current time. For more information about restore points, see Time window for PITR continuous backups
      # in the Amazon Keyspaces Developer Guide . Any number of users can execute up to 4 concurrent
      # restores (any type of restore) in a given account. When you restore using point in time recovery,
      # Amazon Keyspaces restores your source table's schema and data to the state based on the selected
      # timestamp (day:hour:minute:second) to a new table. The Time to Live (TTL) settings are also restored
      # to the state based on the selected timestamp. In addition to the table's schema, data, and TTL
      # settings, RestoreTable restores the capacity mode, auto scaling settings, encryption settings, and
      # point-in-time recovery settings from the source table. Unlike the table's schema data and TTL
      # settings, which are restored based on the selected timestamp, these settings are always restored
      # based on the table's settings as of the current time or when the table was deleted. You can also
      # overwrite these settings during restore: Read/write capacity mode Provisioned throughput capacity
      # units Auto scaling settings Point-in-time (PITR) settings Tags For more information, see PITR
      # restore settings in the Amazon Keyspaces Developer Guide . Note that the following settings are not
      # restored, and you must configure them manually for the new table: Identity and Access Management
      # (IAM) policies Amazon CloudWatch metrics and alarms

      def restore_table(
        source_keyspace_name : String,
        source_table_name : String,
        target_keyspace_name : String,
        target_table_name : String,
        auto_scaling_specification : Types::AutoScalingSpecification? = nil,
        capacity_specification_override : Types::CapacitySpecification? = nil,
        encryption_specification_override : Types::EncryptionSpecification? = nil,
        point_in_time_recovery_override : Types::PointInTimeRecovery? = nil,
        replica_specifications : Array(Types::ReplicaSpecification)? = nil,
        restore_timestamp : Time? = nil,
        tags_override : Array(Types::Tag)? = nil
      ) : Types::RestoreTableResponse

        input = Types::RestoreTableRequest.new(source_keyspace_name: source_keyspace_name, source_table_name: source_table_name, target_keyspace_name: target_keyspace_name, target_table_name: target_table_name, auto_scaling_specification: auto_scaling_specification, capacity_specification_override: capacity_specification_override, encryption_specification_override: encryption_specification_override, point_in_time_recovery_override: point_in_time_recovery_override, replica_specifications: replica_specifications, restore_timestamp: restore_timestamp, tags_override: tags_override)
        restore_table(input)
      end

      def restore_table(input : Types::RestoreTableRequest) : Types::RestoreTableResponse
        request = Protocol::JsonRpc.build_request(Model::RESTORE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RestoreTableResponse, "RestoreTable")
      end

      # Associates a set of tags with a Amazon Keyspaces resource. You can then activate these user-defined
      # tags so that they appear on the Cost Management Console for cost allocation tracking. For more
      # information, see Adding tags and labels to Amazon Keyspaces resources in the Amazon Keyspaces
      # Developer Guide . For IAM policy examples that show how to control access to Amazon Keyspaces
      # resources based on tags, see Amazon Keyspaces resource access based on tags in the Amazon Keyspaces
      # Developer Guide .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the association of tags from a Amazon Keyspaces resource.

      def untag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Adds a new Amazon Web Services Region to the keyspace. You can add a new Region to a keyspace that
      # is either a single or a multi-Region keyspace. Amazon Keyspaces is going to replicate all tables in
      # the keyspace to the new Region. To successfully replicate all tables to the new Region, they must
      # use client-side timestamps for conflict resolution. To enable client-side timestamps, specify
      # clientSideTimestamps.status = enabled when invoking the API. For more information about client-side
      # timestamps, see Client-side timestamps in Amazon Keyspaces in the Amazon Keyspaces Developer Guide .
      # To add a Region to a keyspace using the UpdateKeyspace API, the IAM principal needs permissions for
      # the following IAM actions: cassandra:Alter cassandra:AlterMultiRegionResource cassandra:Create
      # cassandra:CreateMultiRegionResource cassandra:Select cassandra:SelectMultiRegionResource
      # cassandra:Modify cassandra:ModifyMultiRegionResource If the keyspace contains a table that is
      # configured in provisioned mode with auto scaling enabled, the following additional IAM actions need
      # to be allowed. application-autoscaling:RegisterScalableTarget
      # application-autoscaling:DeregisterScalableTarget application-autoscaling:DescribeScalableTargets
      # application-autoscaling:PutScalingPolicy application-autoscaling:DescribeScalingPolicies To use the
      # UpdateKeyspace API, the IAM principal also needs permissions to create a service-linked role with
      # the following elements: iam:CreateServiceLinkedRole - The action the principal can perform.
      # arn:aws:iam::*:role/aws-service-role/replication.cassandra.amazonaws.com/AWSServiceRoleForKeyspacesReplication
      # - The resource that the action can be performed on. iam:AWSServiceName:
      # replication.cassandra.amazonaws.com - The only Amazon Web Services service that this role can be
      # attached to is Amazon Keyspaces. For more information, see Configure the IAM permissions required to
      # add an Amazon Web Services Region to a keyspace in the Amazon Keyspaces Developer Guide .

      def update_keyspace(
        keyspace_name : String,
        replication_specification : Types::ReplicationSpecification,
        client_side_timestamps : Types::ClientSideTimestamps? = nil
      ) : Types::UpdateKeyspaceResponse

        input = Types::UpdateKeyspaceRequest.new(keyspace_name: keyspace_name, replication_specification: replication_specification, client_side_timestamps: client_side_timestamps)
        update_keyspace(input)
      end

      def update_keyspace(input : Types::UpdateKeyspaceRequest) : Types::UpdateKeyspaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_KEYSPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateKeyspaceResponse, "UpdateKeyspace")
      end

      # Adds new columns to the table or updates one of the table's settings, for example capacity mode,
      # auto scaling, encryption, point-in-time recovery, or ttl settings. Note that you can only update one
      # specific table setting per update operation.

      def update_table(
        keyspace_name : String,
        table_name : String,
        add_columns : Array(Types::ColumnDefinition)? = nil,
        auto_scaling_specification : Types::AutoScalingSpecification? = nil,
        capacity_specification : Types::CapacitySpecification? = nil,
        cdc_specification : Types::CdcSpecification? = nil,
        client_side_timestamps : Types::ClientSideTimestamps? = nil,
        default_time_to_live : Int32? = nil,
        encryption_specification : Types::EncryptionSpecification? = nil,
        point_in_time_recovery : Types::PointInTimeRecovery? = nil,
        replica_specifications : Array(Types::ReplicaSpecification)? = nil,
        ttl : Types::TimeToLive? = nil
      ) : Types::UpdateTableResponse

        input = Types::UpdateTableRequest.new(keyspace_name: keyspace_name, table_name: table_name, add_columns: add_columns, auto_scaling_specification: auto_scaling_specification, capacity_specification: capacity_specification, cdc_specification: cdc_specification, client_side_timestamps: client_side_timestamps, default_time_to_live: default_time_to_live, encryption_specification: encryption_specification, point_in_time_recovery: point_in_time_recovery, replica_specifications: replica_specifications, ttl: ttl)
        update_table(input)
      end

      def update_table(input : Types::UpdateTableRequest) : Types::UpdateTableResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TABLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTableResponse, "UpdateTable")
      end
    end
  end
end
