module AwsSdk
  module LakeFormation
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

      # Attaches one or more LF-tags to an existing resource.

      def add_lf_tags_to_resource(
        lf_tags : Array(Types::LFTagPair),
        resource : Types::Resource,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::AddLFTagsToResourceRequest.new(lf_tags: lf_tags, resource: resource, catalog_id: catalog_id)
        add_lf_tags_to_resource(input)
      end

      def add_lf_tags_to_resource(input : Types::AddLFTagsToResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_LF_TAGS_TO_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a caller to assume an IAM role decorated as the SAML user specified in the SAML assertion
      # included in the request. This decoration allows Lake Formation to enforce access policies against
      # the SAML users and groups. This API operation requires SAML federation setup in the caller’s account
      # as it can only be called with valid SAML assertions. Lake Formation does not scope down the
      # permission of the assumed role. All permissions attached to the role via the SAML federation setup
      # will be included in the role session. This decorated role is expected to access data in Amazon S3 by
      # getting temporary access from Lake Formation which is authorized via the virtual API GetDataAccess .
      # Therefore, all SAML roles that can be assumed via AssumeDecoratedRoleWithSAML must at a minimum
      # include lakeformation:GetDataAccess in their role policies. A typical IAM policy attached to such a
      # role would include the following actions: glue:*Database* glue:*Table* glue:*Partition*
      # glue:*UserDefinedFunction* lakeformation:GetDataAccess

      def assume_decorated_role_with_saml(
        principal_arn : String,
        role_arn : String,
        saml_assertion : String,
        duration_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::AssumeDecoratedRoleWithSAMLRequest.new(principal_arn: principal_arn, role_arn: role_arn, saml_assertion: saml_assertion, duration_seconds: duration_seconds)
        assume_decorated_role_with_saml(input)
      end

      def assume_decorated_role_with_saml(input : Types::AssumeDecoratedRoleWithSAMLRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSUME_DECORATED_ROLE_WITH_SAML, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Batch operation to grant permissions to the principal.

      def batch_grant_permissions(
        entries : Array(Types::BatchPermissionsRequestEntry),
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchGrantPermissionsRequest.new(entries: entries, catalog_id: catalog_id)
        batch_grant_permissions(input)
      end

      def batch_grant_permissions(input : Types::BatchGrantPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GRANT_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Batch operation to revoke permissions from the principal.

      def batch_revoke_permissions(
        entries : Array(Types::BatchPermissionsRequestEntry),
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchRevokePermissionsRequest.new(entries: entries, catalog_id: catalog_id)
        batch_revoke_permissions(input)
      end

      def batch_revoke_permissions(input : Types::BatchRevokePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_REVOKE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attempts to cancel the specified transaction. Returns an exception if the transaction was previously
      # committed.

      def cancel_transaction(
        transaction_id : String
      ) : Protocol::Request
        input = Types::CancelTransactionRequest.new(transaction_id: transaction_id)
        cancel_transaction(input)
      end

      def cancel_transaction(input : Types::CancelTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attempts to commit the specified transaction. Returns an exception if the transaction was previously
      # aborted. This API action is idempotent if called multiple times for the same transaction.

      def commit_transaction(
        transaction_id : String
      ) : Protocol::Request
        input = Types::CommitTransactionRequest.new(transaction_id: transaction_id)
        commit_transaction(input)
      end

      def commit_transaction(input : Types::CommitTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMMIT_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data cell filter to allow one to grant access to certain columns on certain rows.

      def create_data_cells_filter(
        table_data : Types::DataCellsFilter
      ) : Protocol::Request
        input = Types::CreateDataCellsFilterRequest.new(table_data: table_data)
        create_data_cells_filter(input)
      end

      def create_data_cells_filter(input : Types::CreateDataCellsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_CELLS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an LF-tag with the specified name and values.

      def create_lf_tag(
        tag_key : String,
        tag_values : Array(String),
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateLFTagRequest.new(tag_key: tag_key, tag_values: tag_values, catalog_id: catalog_id)
        create_lf_tag(input)
      end

      def create_lf_tag(input : Types::CreateLFTagRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LF_TAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new LF-Tag expression with the provided name, description, catalog ID, and expression
      # body. This call fails if a LF-Tag expression with the same name already exists in the caller’s
      # account or if the underlying LF-Tags don't exist. To call this API operation, caller needs the
      # following Lake Formation permissions: CREATE_LF_TAG_EXPRESSION on the root catalog resource.
      # GRANT_WITH_LF_TAG_EXPRESSION on all underlying LF-Tag key:value pairs included in the expression.

      def create_lf_tag_expression(
        expression : Array(Types::LFTag),
        name : String,
        catalog_id : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateLFTagExpressionRequest.new(expression: expression, name: name, catalog_id: catalog_id, description: description)
        create_lf_tag_expression(input)
      end

      def create_lf_tag_expression(input : Types::CreateLFTagExpressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LF_TAG_EXPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IAM Identity Center connection with Lake Formation to allow IAM Identity Center users and
      # groups to access Data Catalog resources.

      def create_lake_formation_identity_center_configuration(
        catalog_id : String? = nil,
        external_filtering : Types::ExternalFilteringConfiguration? = nil,
        instance_arn : String? = nil,
        service_integrations : Array(Types::ServiceIntegrationUnion)? = nil,
        share_recipients : Array(Types::DataLakePrincipal)? = nil
      ) : Protocol::Request
        input = Types::CreateLakeFormationIdentityCenterConfigurationRequest.new(catalog_id: catalog_id, external_filtering: external_filtering, instance_arn: instance_arn, service_integrations: service_integrations, share_recipients: share_recipients)
        create_lake_formation_identity_center_configuration(input)
      end

      def create_lake_formation_identity_center_configuration(input : Types::CreateLakeFormationIdentityCenterConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enforce Lake Formation permissions for the given databases, tables, and principals.

      def create_lake_formation_opt_in(
        principal : Types::DataLakePrincipal,
        resource : Types::Resource,
        condition : Types::Condition? = nil
      ) : Protocol::Request
        input = Types::CreateLakeFormationOptInRequest.new(principal: principal, resource: resource, condition: condition)
        create_lake_formation_opt_in(input)
      end

      def create_lake_formation_opt_in(input : Types::CreateLakeFormationOptInRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LAKE_FORMATION_OPT_IN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a data cell filter.

      def delete_data_cells_filter(
        database_name : String? = nil,
        name : String? = nil,
        table_catalog_id : String? = nil,
        table_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDataCellsFilterRequest.new(database_name: database_name, name: name, table_catalog_id: table_catalog_id, table_name: table_name)
        delete_data_cells_filter(input)
      end

      def delete_data_cells_filter(input : Types::DeleteDataCellsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_CELLS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an LF-tag by its key name. The operation fails if the specified tag key doesn't exist. When
      # you delete an LF-Tag: The associated LF-Tag policy becomes invalid. Resources that had this tag
      # assigned will no longer have the tag policy applied to them.

      def delete_lf_tag(
        tag_key : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteLFTagRequest.new(tag_key: tag_key, catalog_id: catalog_id)
        delete_lf_tag(input)
      end

      def delete_lf_tag(input : Types::DeleteLFTagRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LF_TAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the LF-Tag expression. The caller must be a data lake admin or have DROP permissions on the
      # LF-Tag expression. Deleting a LF-Tag expression will also delete all LFTagPolicy permissions
      # referencing the LF-Tag expression.

      def delete_lf_tag_expression(
        name : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteLFTagExpressionRequest.new(name: name, catalog_id: catalog_id)
        delete_lf_tag_expression(input)
      end

      def delete_lf_tag_expression(input : Types::DeleteLFTagExpressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LF_TAG_EXPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an IAM Identity Center connection with Lake Formation.

      def delete_lake_formation_identity_center_configuration(
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteLakeFormationIdentityCenterConfigurationRequest.new(catalog_id: catalog_id)
        delete_lake_formation_identity_center_configuration(input)
      end

      def delete_lake_formation_identity_center_configuration(input : Types::DeleteLakeFormationIdentityCenterConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove the Lake Formation permissions enforcement of the given databases, tables, and principals.

      def delete_lake_formation_opt_in(
        principal : Types::DataLakePrincipal,
        resource : Types::Resource,
        condition : Types::Condition? = nil
      ) : Protocol::Request
        input = Types::DeleteLakeFormationOptInRequest.new(principal: principal, resource: resource, condition: condition)
        delete_lake_formation_opt_in(input)
      end

      def delete_lake_formation_opt_in(input : Types::DeleteLakeFormationOptInRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAKE_FORMATION_OPT_IN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For a specific governed table, provides a list of Amazon S3 objects that will be written during the
      # current transaction and that can be automatically deleted if the transaction is canceled. Without
      # this call, no Amazon S3 objects are automatically deleted when a transaction cancels. The Glue ETL
      # library function write_dynamic_frame.from_catalog() includes an option to automatically call
      # DeleteObjectsOnCancel before writes. For more information, see Rolling Back Amazon S3 Writes .

      def delete_objects_on_cancel(
        database_name : String,
        objects : Array(Types::VirtualObject),
        table_name : String,
        transaction_id : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteObjectsOnCancelRequest.new(database_name: database_name, objects: objects, table_name: table_name, transaction_id: transaction_id, catalog_id: catalog_id)
        delete_objects_on_cancel(input)
      end

      def delete_objects_on_cancel(input : Types::DeleteObjectsOnCancelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OBJECTS_ON_CANCEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters the resource as managed by the Data Catalog. When you deregister a path, Lake Formation
      # removes the path from the inline policy attached to your service-linked role.

      def deregister_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DeregisterResourceRequest.new(resource_arn: resource_arn)
        deregister_resource(input)
      end

      def deregister_resource(input : Types::DeregisterResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the instance ARN and application ARN for the connection.

      def describe_lake_formation_identity_center_configuration(
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeLakeFormationIdentityCenterConfigurationRequest.new(catalog_id: catalog_id)
        describe_lake_formation_identity_center_configuration(input)
      end

      def describe_lake_formation_identity_center_configuration(input : Types::DescribeLakeFormationIdentityCenterConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current data access role for the given resource registered in Lake Formation.

      def describe_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::DescribeResourceRequest.new(resource_arn: resource_arn)
        describe_resource(input)
      end

      def describe_resource(input : Types::DescribeResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details of a single transaction.

      def describe_transaction(
        transaction_id : String
      ) : Protocol::Request
        input = Types::DescribeTransactionRequest.new(transaction_id: transaction_id)
        describe_transaction(input)
      end

      def describe_transaction(input : Types::DescribeTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Indicates to the service that the specified transaction is still active and should not be treated as
      # idle and aborted. Write transactions that remain idle for a long period are automatically aborted
      # unless explicitly extended.

      def extend_transaction(
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::ExtendTransactionRequest.new(transaction_id: transaction_id)
        extend_transaction(input)
      end

      def extend_transaction(input : Types::ExtendTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXTEND_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a data cells filter.

      def get_data_cells_filter(
        database_name : String,
        name : String,
        table_catalog_id : String,
        table_name : String
      ) : Protocol::Request
        input = Types::GetDataCellsFilterRequest.new(database_name: database_name, name: name, table_catalog_id: table_catalog_id, table_name: table_name)
        get_data_cells_filter(input)
      end

      def get_data_cells_filter(input : Types::GetDataCellsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_CELLS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the identity of the invoking principal.

      def get_data_lake_principal : Protocol::Request
        input = Types::GetDataLakePrincipalRequest.new
        get_data_lake_principal(input)
      end

      def get_data_lake_principal(input : Types::GetDataLakePrincipalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_PRINCIPAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of the data lake administrators of a Lake Formation-managed data lake.

      def get_data_lake_settings(
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::GetDataLakeSettingsRequest.new(catalog_id: catalog_id)
        get_data_lake_settings(input)
      end

      def get_data_lake_settings(input : Types::GetDataLakeSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the Lake Formation permissions for a specified table or database resource located at a path
      # in Amazon S3. GetEffectivePermissionsForPath will not return databases and tables if the catalog is
      # encrypted.

      def get_effective_permissions_for_path(
        resource_arn : String,
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetEffectivePermissionsForPathRequest.new(resource_arn: resource_arn, catalog_id: catalog_id, max_results: max_results, next_token: next_token)
        get_effective_permissions_for_path(input)
      end

      def get_effective_permissions_for_path(input : Types::GetEffectivePermissionsForPathRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EFFECTIVE_PERMISSIONS_FOR_PATH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an LF-tag definition.

      def get_lf_tag(
        tag_key : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::GetLFTagRequest.new(tag_key: tag_key, catalog_id: catalog_id)
        get_lf_tag(input)
      end

      def get_lf_tag(input : Types::GetLFTagRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LF_TAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about the LF-Tag expression. The caller must be a data lake admin or must have
      # DESCRIBE permission on the LF-Tag expression resource.

      def get_lf_tag_expression(
        name : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::GetLFTagExpressionRequest.new(name: name, catalog_id: catalog_id)
        get_lf_tag_expression(input)
      end

      def get_lf_tag_expression(input : Types::GetLFTagExpressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LF_TAG_EXPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the state of a query previously submitted. Clients are expected to poll GetQueryState to
      # monitor the current state of the planning before retrieving the work units. A query state is only
      # visible to the principal that made the initial call to StartQueryPlanning .

      def get_query_state(
        query_id : String
      ) : Protocol::Request
        input = Types::GetQueryStateRequest.new(query_id: query_id)
        get_query_state(input)
      end

      def get_query_state(input : Types::GetQueryStateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves statistics on the planning and execution of a query.

      def get_query_statistics(
        query_id : String
      ) : Protocol::Request
        input = Types::GetQueryStatisticsRequest.new(query_id: query_id)
        get_query_statistics(input)
      end

      def get_query_statistics(input : Types::GetQueryStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the LF-tags applied to a resource.

      def get_resource_lf_tags(
        resource : Types::Resource,
        catalog_id : String? = nil,
        show_assigned_lf_tags : Bool? = nil
      ) : Protocol::Request
        input = Types::GetResourceLFTagsRequest.new(resource: resource, catalog_id: catalog_id, show_assigned_lf_tags: show_assigned_lf_tags)
        get_resource_lf_tags(input)
      end

      def get_resource_lf_tags(input : Types::GetResourceLFTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_LF_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the set of Amazon S3 objects that make up the specified governed table. A transaction ID or
      # timestamp can be specified for time-travel queries.

      def get_table_objects(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        partition_predicate : String? = nil,
        query_as_of_time : Time? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::GetTableObjectsRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, max_results: max_results, next_token: next_token, partition_predicate: partition_predicate, query_as_of_time: query_as_of_time, transaction_id: transaction_id)
        get_table_objects(input)
      end

      def get_table_objects(input : Types::GetTableObjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TABLE_OBJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a user or application in a secure environment to access data in a specific Amazon S3 location
      # registered with Lake Formation by providing temporary scoped credentials that are limited to the
      # requested data location and the caller's authorized access level. The API operation returns an error
      # in the following scenarios: The data location is not registered with Lake Formation. No Glue table
      # is associated with the data location. The caller doesn't have required permissions on the associated
      # table. The caller must have SELECT or SUPER permissions on the associated table, and credential
      # vending for full table access must be enabled in the data lake settings. For more information, see
      # Application integration for full table access . The data location is in a different Amazon Web
      # Services Region. Lake Formation doesn't support cross-Region access when vending credentials for a
      # data location. Lake Formation only supports Amazon S3 paths registered within the same Region as the
      # API call.

      def get_temporary_data_location_credentials(
        audit_context : Types::AuditContext? = nil,
        credentials_scope : String? = nil,
        data_locations : Array(String)? = nil,
        duration_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::GetTemporaryDataLocationCredentialsRequest.new(audit_context: audit_context, credentials_scope: credentials_scope, data_locations: data_locations, duration_seconds: duration_seconds)
        get_temporary_data_location_credentials(input)
      end

      def get_temporary_data_location_credentials(input : Types::GetTemporaryDataLocationCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPORARY_DATA_LOCATION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is identical to GetTemporaryTableCredentials except that this is used when the target Data
      # Catalog resource is of type Partition. Lake Formation restricts the permission of the vended
      # credentials with the same scope down policy which restricts access to a single Amazon S3 prefix.

      def get_temporary_glue_partition_credentials(
        partition : Types::PartitionValueList,
        table_arn : String,
        audit_context : Types::AuditContext? = nil,
        duration_seconds : Int32? = nil,
        permissions : Array(String)? = nil,
        supported_permission_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetTemporaryGluePartitionCredentialsRequest.new(partition: partition, table_arn: table_arn, audit_context: audit_context, duration_seconds: duration_seconds, permissions: permissions, supported_permission_types: supported_permission_types)
        get_temporary_glue_partition_credentials(input)
      end

      def get_temporary_glue_partition_credentials(input : Types::GetTemporaryGluePartitionCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPORARY_GLUE_PARTITION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows a caller in a secure environment to assume a role with permission to access Amazon S3. In
      # order to vend such credentials, Lake Formation assumes the role associated with a registered
      # location, for example an Amazon S3 bucket, with a scope down policy which restricts the access to a
      # single prefix. To call this API, the role that the service assumes must have
      # lakeformation:GetDataAccess permission on the resource.

      def get_temporary_glue_table_credentials(
        table_arn : String,
        audit_context : Types::AuditContext? = nil,
        duration_seconds : Int32? = nil,
        permissions : Array(String)? = nil,
        query_session_context : Types::QuerySessionContext? = nil,
        s3_path : String? = nil,
        supported_permission_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetTemporaryGlueTableCredentialsRequest.new(table_arn: table_arn, audit_context: audit_context, duration_seconds: duration_seconds, permissions: permissions, query_session_context: query_session_context, s3_path: s3_path, supported_permission_types: supported_permission_types)
        get_temporary_glue_table_credentials(input)
      end

      def get_temporary_glue_table_credentials(input : Types::GetTemporaryGlueTableCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TEMPORARY_GLUE_TABLE_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the work units resulting from the query. Work units can be executed in any order and in
      # parallel.

      def get_work_unit_results(
        query_id : String,
        work_unit_id : Int64,
        work_unit_token : String
      ) : Protocol::Request
        input = Types::GetWorkUnitResultsRequest.new(query_id: query_id, work_unit_id: work_unit_id, work_unit_token: work_unit_token)
        get_work_unit_results(input)
      end

      def get_work_unit_results(input : Types::GetWorkUnitResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORK_UNIT_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the work units generated by the StartQueryPlanning operation.

      def get_work_units(
        query_id : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::GetWorkUnitsRequest.new(query_id: query_id, next_token: next_token, page_size: page_size)
        get_work_units(input)
      end

      def get_work_units(input : Types::GetWorkUnitsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORK_UNITS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permissions to the principal to access metadata in the Data Catalog and data organized in
      # underlying data storage such as Amazon S3. For information about permissions, see Security and
      # Access Control to Metadata and Data .

      def grant_permissions(
        permissions : Array(String),
        principal : Types::DataLakePrincipal,
        resource : Types::Resource,
        catalog_id : String? = nil,
        condition : Types::Condition? = nil,
        permissions_with_grant_option : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GrantPermissionsRequest.new(permissions: permissions, principal: principal, resource: resource, catalog_id: catalog_id, condition: condition, permissions_with_grant_option: permissions_with_grant_option)
        grant_permissions(input)
      end

      def grant_permissions(input : Types::GrantPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GRANT_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the data cell filters on a table.

      def list_data_cells_filter(
        max_results : Int32? = nil,
        next_token : String? = nil,
        table : Types::TableResource? = nil
      ) : Protocol::Request
        input = Types::ListDataCellsFilterRequest.new(max_results: max_results, next_token: next_token, table: table)
        list_data_cells_filter(input)
      end

      def list_data_cells_filter(input : Types::ListDataCellsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_CELLS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the LF-Tag expressions in caller’s account filtered based on caller's permissions. Data Lake
      # and read only admins implicitly can see all tag expressions in their account, else caller needs
      # DESCRIBE permissions on tag expression.

      def list_lf_tag_expressions(
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLFTagExpressionsRequest.new(catalog_id: catalog_id, max_results: max_results, next_token: next_token)
        list_lf_tag_expressions(input)
      end

      def list_lf_tag_expressions(input : Types::ListLFTagExpressionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LF_TAG_EXPRESSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists LF-tags that the requester has permission to view.

      def list_lf_tags(
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_share_type : String? = nil
      ) : Protocol::Request
        input = Types::ListLFTagsRequest.new(catalog_id: catalog_id, max_results: max_results, next_token: next_token, resource_share_type: resource_share_type)
        list_lf_tags(input)
      end

      def list_lf_tags(input : Types::ListLFTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LF_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the current list of resources and principals that are opt in to enforce Lake Formation
      # permissions.

      def list_lake_formation_opt_ins(
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal : Types::DataLakePrincipal? = nil,
        resource : Types::Resource? = nil
      ) : Protocol::Request
        input = Types::ListLakeFormationOptInsRequest.new(max_results: max_results, next_token: next_token, principal: principal, resource: resource)
        list_lake_formation_opt_ins(input)
      end

      def list_lake_formation_opt_ins(input : Types::ListLakeFormationOptInsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAKE_FORMATION_OPT_INS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the principal permissions on the resource, filtered by the permissions of the
      # caller. For example, if you are granted an ALTER permission, you are able to see only the principal
      # permissions for ALTER. This operation returns only those permissions that have been explicitly
      # granted. If both Principal and Resource parameters are provided, the response returns effective
      # permissions rather than the explicitly granted permissions. For information about permissions, see
      # Security and Access Control to Metadata and Data .

      def list_permissions(
        catalog_id : String? = nil,
        include_related : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal : Types::DataLakePrincipal? = nil,
        resource : Types::Resource? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListPermissionsRequest.new(catalog_id: catalog_id, include_related: include_related, max_results: max_results, next_token: next_token, principal: principal, resource: resource, resource_type: resource_type)
        list_permissions(input)
      end

      def list_permissions(input : Types::ListPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resources registered to be managed by the Data Catalog.

      def list_resources(
        filter_condition_list : Array(Types::FilterCondition)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourcesRequest.new(filter_condition_list: filter_condition_list, max_results: max_results, next_token: next_token)
        list_resources(input)
      end

      def list_resources(input : Types::ListResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the configuration of all storage optimizers associated with a specified table.

      def list_table_storage_optimizers(
        database_name : String,
        table_name : String,
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        storage_optimizer_type : String? = nil
      ) : Protocol::Request
        input = Types::ListTableStorageOptimizersRequest.new(database_name: database_name, table_name: table_name, catalog_id: catalog_id, max_results: max_results, next_token: next_token, storage_optimizer_type: storage_optimizer_type)
        list_table_storage_optimizers(input)
      end

      def list_table_storage_optimizers(input : Types::ListTableStorageOptimizersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TABLE_STORAGE_OPTIMIZERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata about transactions and their status. To prevent the response from growing
      # indefinitely, only uncommitted transactions and those available for time-travel queries are
      # returned. This operation can help you identify uncommitted transactions or to get information about
      # transactions.

      def list_transactions(
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListTransactionsRequest.new(catalog_id: catalog_id, max_results: max_results, next_token: next_token, status_filter: status_filter)
        list_transactions(input)
      end

      def list_transactions(input : Types::ListTransactionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRANSACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets the list of data lake administrators who have admin privileges on all resources managed by Lake
      # Formation. For more information on admin privileges, see Granting Lake Formation Permissions . This
      # API replaces the current list of data lake admins with the new list being passed. To add an admin,
      # fetch the current list and add the new admin to that list and pass that list in this API.

      def put_data_lake_settings(
        data_lake_settings : Types::DataLakeSettings,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::PutDataLakeSettingsRequest.new(data_lake_settings: data_lake_settings, catalog_id: catalog_id)
        put_data_lake_settings(input)
      end

      def put_data_lake_settings(input : Types::PutDataLakeSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DATA_LAKE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Registers the resource as managed by the Data Catalog. To add or update data, Lake Formation needs
      # read/write access to the chosen data location. Choose a role that you know has permission to do
      # this, or choose the AWSServiceRoleForLakeFormationDataAccess service-linked role. When you register
      # the first Amazon S3 path, the service-linked role and a new inline policy are created on your
      # behalf. Lake Formation adds the first path to the inline policy and attaches it to the
      # service-linked role. When you register subsequent paths, Lake Formation adds the path to the
      # existing policy. The following request registers a new location and gives Lake Formation permission
      # to use the service-linked role to access that location. ResourceArn = arn:aws:s3:::my-bucket/
      # UseServiceLinkedRole = true If UseServiceLinkedRole is not set to true, you must provide or set the
      # RoleArn : arn:aws:iam::12345:role/my-data-access-role

      def register_resource(
        resource_arn : String,
        expected_resource_owner_account : String? = nil,
        hybrid_access_enabled : Bool? = nil,
        role_arn : String? = nil,
        use_service_linked_role : Bool? = nil,
        with_federation : Bool? = nil,
        with_privileged_access : Bool? = nil
      ) : Protocol::Request
        input = Types::RegisterResourceRequest.new(resource_arn: resource_arn, expected_resource_owner_account: expected_resource_owner_account, hybrid_access_enabled: hybrid_access_enabled, role_arn: role_arn, use_service_linked_role: use_service_linked_role, with_federation: with_federation, with_privileged_access: with_privileged_access)
        register_resource(input)
      end

      def register_resource(input : Types::RegisterResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an LF-tag from the resource. Only database, table, or tableWithColumns resource are allowed.
      # To tag columns, use the column inclusion list in tableWithColumns to specify column input.

      def remove_lf_tags_from_resource(
        lf_tags : Array(Types::LFTagPair),
        resource : Types::Resource,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::RemoveLFTagsFromResourceRequest.new(lf_tags: lf_tags, resource: resource, catalog_id: catalog_id)
        remove_lf_tags_from_resource(input)
      end

      def remove_lf_tags_from_resource(input : Types::RemoveLFTagsFromResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_LF_TAGS_FROM_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes permissions to the principal to access metadata in the Data Catalog and data organized in
      # underlying data storage such as Amazon S3.

      def revoke_permissions(
        permissions : Array(String),
        principal : Types::DataLakePrincipal,
        resource : Types::Resource,
        catalog_id : String? = nil,
        condition : Types::Condition? = nil,
        permissions_with_grant_option : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RevokePermissionsRequest.new(permissions: permissions, principal: principal, resource: resource, catalog_id: catalog_id, condition: condition, permissions_with_grant_option: permissions_with_grant_option)
        revoke_permissions(input)
      end

      def revoke_permissions(input : Types::RevokePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation allows a search on DATABASE resources by TagCondition . This operation is used by
      # admins who want to grant user permissions on certain TagConditions . Before making a grant, the
      # admin can use SearchDatabasesByTags to find all resources where the given TagConditions are valid to
      # verify whether the returned resources can be shared.

      def search_databases_by_lf_tags(
        expression : Array(Types::LFTag),
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchDatabasesByLFTagsRequest.new(expression: expression, catalog_id: catalog_id, max_results: max_results, next_token: next_token)
        search_databases_by_lf_tags(input)
      end

      def search_databases_by_lf_tags(input : Types::SearchDatabasesByLFTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DATABASES_BY_LF_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation allows a search on TABLE resources by LFTag s. This will be used by admins who want
      # to grant user permissions on certain LF-tags. Before making a grant, the admin can use
      # SearchTablesByLFTags to find all resources where the given LFTag s are valid to verify whether the
      # returned resources can be shared.

      def search_tables_by_lf_tags(
        expression : Array(Types::LFTag),
        catalog_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchTablesByLFTagsRequest.new(expression: expression, catalog_id: catalog_id, max_results: max_results, next_token: next_token)
        search_tables_by_lf_tags(input)
      end

      def search_tables_by_lf_tags(input : Types::SearchTablesByLFTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_TABLES_BY_LF_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits a request to process a query statement. This operation generates work units that can be
      # retrieved with the GetWorkUnits operation as soon as the query state is WORKUNITS_AVAILABLE or
      # FINISHED.

      def start_query_planning(
        query_planning_context : Types::QueryPlanningContext,
        query_string : String
      ) : Protocol::Request
        input = Types::StartQueryPlanningRequest.new(query_planning_context: query_planning_context, query_string: query_string)
        start_query_planning(input)
      end

      def start_query_planning(input : Types::StartQueryPlanningRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_QUERY_PLANNING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a new transaction and returns its transaction ID. Transaction IDs are opaque objects that you
      # can use to identify a transaction.

      def start_transaction(
        transaction_type : String? = nil
      ) : Protocol::Request
        input = Types::StartTransactionRequest.new(transaction_type: transaction_type)
        start_transaction(input)
      end

      def start_transaction(input : Types::StartTransactionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a data cell filter.

      def update_data_cells_filter(
        table_data : Types::DataCellsFilter
      ) : Protocol::Request
        input = Types::UpdateDataCellsFilterRequest.new(table_data: table_data)
        update_data_cells_filter(input)
      end

      def update_data_cells_filter(input : Types::UpdateDataCellsFilterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_CELLS_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the list of possible values for the specified LF-tag key. If the LF-tag does not exist, the
      # operation throws an EntityNotFoundException. The values in the delete key values will be deleted
      # from list of possible values. If any value in the delete key values is attached to a resource, then
      # API errors out with a 400 Exception - "Update not allowed". Untag the attribute before deleting the
      # LF-tag key's value.

      def update_lf_tag(
        tag_key : String,
        catalog_id : String? = nil,
        tag_values_to_add : Array(String)? = nil,
        tag_values_to_delete : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateLFTagRequest.new(tag_key: tag_key, catalog_id: catalog_id, tag_values_to_add: tag_values_to_add, tag_values_to_delete: tag_values_to_delete)
        update_lf_tag(input)
      end

      def update_lf_tag(input : Types::UpdateLFTagRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LF_TAG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name of the LF-Tag expression to the new description and expression body provided.
      # Updating a LF-Tag expression immediately changes the permission boundaries of all existing
      # LFTagPolicy permission grants that reference the given LF-Tag expression.

      def update_lf_tag_expression(
        expression : Array(Types::LFTag),
        name : String,
        catalog_id : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLFTagExpressionRequest.new(expression: expression, name: name, catalog_id: catalog_id, description: description)
        update_lf_tag_expression(input)
      end

      def update_lf_tag_expression(input : Types::UpdateLFTagExpressionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LF_TAG_EXPRESSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the IAM Identity Center connection parameters.

      def update_lake_formation_identity_center_configuration(
        application_status : String? = nil,
        catalog_id : String? = nil,
        external_filtering : Types::ExternalFilteringConfiguration? = nil,
        service_integrations : Array(Types::ServiceIntegrationUnion)? = nil,
        share_recipients : Array(Types::DataLakePrincipal)? = nil
      ) : Protocol::Request
        input = Types::UpdateLakeFormationIdentityCenterConfigurationRequest.new(application_status: application_status, catalog_id: catalog_id, external_filtering: external_filtering, service_integrations: service_integrations, share_recipients: share_recipients)
        update_lake_formation_identity_center_configuration(input)
      end

      def update_lake_formation_identity_center_configuration(input : Types::UpdateLakeFormationIdentityCenterConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAKE_FORMATION_IDENTITY_CENTER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data access role used for vending access to the given (registered) resource in Lake
      # Formation.

      def update_resource(
        resource_arn : String,
        role_arn : String,
        expected_resource_owner_account : String? = nil,
        hybrid_access_enabled : Bool? = nil,
        with_federation : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceRequest.new(resource_arn: resource_arn, role_arn: role_arn, expected_resource_owner_account: expected_resource_owner_account, hybrid_access_enabled: hybrid_access_enabled, with_federation: with_federation)
        update_resource(input)
      end

      def update_resource(input : Types::UpdateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the manifest of Amazon S3 objects that make up the specified governed table.

      def update_table_objects(
        database_name : String,
        table_name : String,
        write_operations : Array(Types::WriteOperation),
        catalog_id : String? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTableObjectsRequest.new(database_name: database_name, table_name: table_name, write_operations: write_operations, catalog_id: catalog_id, transaction_id: transaction_id)
        update_table_objects(input)
      end

      def update_table_objects(input : Types::UpdateTableObjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TABLE_OBJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of the storage optimizers for a table.

      def update_table_storage_optimizer(
        database_name : String,
        storage_optimizer_config : Hash(String, Hash(String, String)),
        table_name : String,
        catalog_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTableStorageOptimizerRequest.new(database_name: database_name, storage_optimizer_config: storage_optimizer_config, table_name: table_name, catalog_id: catalog_id)
        update_table_storage_optimizer(input)
      end

      def update_table_storage_optimizer(input : Types::UpdateTableStorageOptimizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TABLE_STORAGE_OPTIMIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
