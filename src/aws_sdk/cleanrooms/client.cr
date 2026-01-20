module AwsSdk
  module CleanRooms
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

      # Retrieves multiple analysis templates within a collaboration by their Amazon Resource Names (ARNs).

      def batch_get_collaboration_analysis_template(
        analysis_template_arns : Array(String),
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::BatchGetCollaborationAnalysisTemplateInput.new(analysis_template_arns: analysis_template_arns, collaboration_identifier: collaboration_identifier)
        batch_get_collaboration_analysis_template(input)
      end

      def batch_get_collaboration_analysis_template(input : Types::BatchGetCollaborationAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_COLLABORATION_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves multiple schemas by their identifiers.

      def batch_get_schema(
        collaboration_identifier : String,
        names : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetSchemaInput.new(collaboration_identifier: collaboration_identifier, names: names)
        batch_get_schema(input)
      end

      def batch_get_schema(input : Types::BatchGetSchemaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves multiple analysis rule schemas.

      def batch_get_schema_analysis_rule(
        collaboration_identifier : String,
        schema_analysis_rule_requests : Array(Types::SchemaAnalysisRuleRequest)
      ) : Protocol::Request
        input = Types::BatchGetSchemaAnalysisRuleInput.new(collaboration_identifier: collaboration_identifier, schema_analysis_rule_requests: schema_analysis_rule_requests)
        batch_get_schema_analysis_rule(input)
      end

      def batch_get_schema_analysis_rule(input : Types::BatchGetSchemaAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_SCHEMA_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new analysis template.

      def create_analysis_template(
        format : String,
        membership_identifier : String,
        name : String,
        source : Types::AnalysisSource,
        analysis_parameters : Array(Types::AnalysisParameter)? = nil,
        description : String? = nil,
        error_message_configuration : Types::ErrorMessageConfiguration? = nil,
        schema : Types::AnalysisSchema? = nil,
        synthetic_data_parameters : Types::SyntheticDataParameters? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAnalysisTemplateInput.new(format: format, membership_identifier: membership_identifier, name: name, source: source, analysis_parameters: analysis_parameters, description: description, error_message_configuration: error_message_configuration, schema: schema, synthetic_data_parameters: synthetic_data_parameters, tags: tags)
        create_analysis_template(input)
      end

      def create_analysis_template(input : Types::CreateAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new collaboration.

      def create_collaboration(
        creator_display_name : String,
        creator_member_abilities : Array(String),
        description : String,
        members : Array(Types::MemberSpecification),
        name : String,
        query_log_status : String,
        allowed_result_regions : Array(String)? = nil,
        analytics_engine : String? = nil,
        auto_approved_change_request_types : Array(String)? = nil,
        creator_ml_member_abilities : Types::MLMemberAbilities? = nil,
        creator_payment_configuration : Types::PaymentConfiguration? = nil,
        data_encryption_metadata : Types::DataEncryptionMetadata? = nil,
        is_metrics_enabled : Bool? = nil,
        job_log_status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCollaborationInput.new(creator_display_name: creator_display_name, creator_member_abilities: creator_member_abilities, description: description, members: members, name: name, query_log_status: query_log_status, allowed_result_regions: allowed_result_regions, analytics_engine: analytics_engine, auto_approved_change_request_types: auto_approved_change_request_types, creator_ml_member_abilities: creator_ml_member_abilities, creator_payment_configuration: creator_payment_configuration, data_encryption_metadata: data_encryption_metadata, is_metrics_enabled: is_metrics_enabled, job_log_status: job_log_status, tags: tags)
        create_collaboration(input)
      end

      def create_collaboration(input : Types::CreateCollaborationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COLLABORATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new change request to modify an existing collaboration. This enables post-creation
      # modifications to collaborations through a structured API-driven approach.

      def create_collaboration_change_request(
        changes : Array(Types::ChangeInput),
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::CreateCollaborationChangeRequestInput.new(changes: changes, collaboration_identifier: collaboration_identifier)
        create_collaboration_change_request(input)
      end

      def create_collaboration_change_request(input : Types::CreateCollaborationChangeRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COLLABORATION_CHANGE_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details necessary to create a configured audience model association.

      def create_configured_audience_model_association(
        configured_audience_model_arn : String,
        configured_audience_model_association_name : String,
        manage_resource_policies : Bool,
        membership_identifier : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredAudienceModelAssociationInput.new(configured_audience_model_arn: configured_audience_model_arn, configured_audience_model_association_name: configured_audience_model_association_name, manage_resource_policies: manage_resource_policies, membership_identifier: membership_identifier, description: description, tags: tags)
        create_configured_audience_model_association(input)
      end

      def create_configured_audience_model_association(input : Types::CreateConfiguredAudienceModelAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new configured table resource.

      def create_configured_table(
        allowed_columns : Array(String),
        analysis_method : String,
        name : String,
        table_reference : Types::TableReference,
        description : String? = nil,
        selected_analysis_methods : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredTableInput.new(allowed_columns: allowed_columns, analysis_method: analysis_method, name: name, table_reference: table_reference, description: description, selected_analysis_methods: selected_analysis_methods, tags: tags)
        create_configured_table(input)
      end

      def create_configured_table(input : Types::CreateConfiguredTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new analysis rule for a configured table. Currently, only one analysis rule can be created
      # for a given configured table.

      def create_configured_table_analysis_rule(
        analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy,
        analysis_rule_type : String,
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::CreateConfiguredTableAnalysisRuleInput.new(analysis_rule_policy: analysis_rule_policy, analysis_rule_type: analysis_rule_type, configured_table_identifier: configured_table_identifier)
        create_configured_table_analysis_rule(input)
      end

      def create_configured_table_analysis_rule(input : Types::CreateConfiguredTableAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_TABLE_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a configured table association. A configured table association links a configured table with
      # a collaboration.

      def create_configured_table_association(
        configured_table_identifier : String,
        membership_identifier : String,
        name : String,
        role_arn : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfiguredTableAssociationInput.new(configured_table_identifier: configured_table_identifier, membership_identifier: membership_identifier, name: name, role_arn: role_arn, description: description, tags: tags)
        create_configured_table_association(input)
      end

      def create_configured_table_association(input : Types::CreateConfiguredTableAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_TABLE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new analysis rule for an associated configured table.

      def create_configured_table_association_analysis_rule(
        analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy,
        analysis_rule_type : String,
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::CreateConfiguredTableAssociationAnalysisRuleInput.new(analysis_rule_policy: analysis_rule_policy, analysis_rule_type: analysis_rule_type, configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        create_configured_table_association_analysis_rule(input)
      end

      def create_configured_table_association_analysis_rule(input : Types::CreateConfiguredTableAssociationAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an ID mapping table.

      def create_id_mapping_table(
        input_reference_config : Types::IdMappingTableInputReferenceConfig,
        membership_identifier : String,
        name : String,
        description : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIdMappingTableInput.new(input_reference_config: input_reference_config, membership_identifier: membership_identifier, name: name, description: description, kms_key_arn: kms_key_arn, tags: tags)
        create_id_mapping_table(input)
      end

      def create_id_mapping_table(input : Types::CreateIdMappingTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ID_MAPPING_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an ID namespace association.

      def create_id_namespace_association(
        input_reference_config : Types::IdNamespaceAssociationInputReferenceConfig,
        membership_identifier : String,
        name : String,
        description : String? = nil,
        id_mapping_config : Types::IdMappingConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIdNamespaceAssociationInput.new(input_reference_config: input_reference_config, membership_identifier: membership_identifier, name: name, description: description, id_mapping_config: id_mapping_config, tags: tags)
        create_id_namespace_association(input)
      end

      def create_id_namespace_association(input : Types::CreateIdNamespaceAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ID_NAMESPACE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a membership for a specific collaboration identifier and joins the collaboration.

      def create_membership(
        collaboration_identifier : String,
        query_log_status : String,
        default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration? = nil,
        default_result_configuration : Types::MembershipProtectedQueryResultConfiguration? = nil,
        is_metrics_enabled : Bool? = nil,
        job_log_status : String? = nil,
        payment_configuration : Types::MembershipPaymentConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateMembershipInput.new(collaboration_identifier: collaboration_identifier, query_log_status: query_log_status, default_job_result_configuration: default_job_result_configuration, default_result_configuration: default_result_configuration, is_metrics_enabled: is_metrics_enabled, job_log_status: job_log_status, payment_configuration: payment_configuration, tags: tags)
        create_membership(input)
      end

      def create_membership(input : Types::CreateMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a privacy budget template for a specified collaboration. Each collaboration can have only
      # one privacy budget template. If you need to change the privacy budget template, use the
      # UpdatePrivacyBudgetTemplate operation.

      def create_privacy_budget_template(
        membership_identifier : String,
        parameters : Types::PrivacyBudgetTemplateParametersInput,
        privacy_budget_type : String,
        auto_refresh : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePrivacyBudgetTemplateInput.new(membership_identifier: membership_identifier, parameters: parameters, privacy_budget_type: privacy_budget_type, auto_refresh: auto_refresh, tags: tags)
        create_privacy_budget_template(input)
      end

      def create_privacy_budget_template(input : Types::CreatePrivacyBudgetTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRIVACY_BUDGET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an analysis template.

      def delete_analysis_template(
        analysis_template_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteAnalysisTemplateInput.new(analysis_template_identifier: analysis_template_identifier, membership_identifier: membership_identifier)
        delete_analysis_template(input)
      end

      def delete_analysis_template(input : Types::DeleteAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a collaboration. It can only be called by the collaboration owner.

      def delete_collaboration(
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::DeleteCollaborationInput.new(collaboration_identifier: collaboration_identifier)
        delete_collaboration(input)
      end

      def delete_collaboration(input : Types::DeleteCollaborationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COLLABORATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the information necessary to delete a configured audience model association.

      def delete_configured_audience_model_association(
        configured_audience_model_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredAudienceModelAssociationInput.new(configured_audience_model_association_identifier: configured_audience_model_association_identifier, membership_identifier: membership_identifier)
        delete_configured_audience_model_association(input)
      end

      def delete_configured_audience_model_association(input : Types::DeleteConfiguredAudienceModelAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configured table.

      def delete_configured_table(
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredTableInput.new(configured_table_identifier: configured_table_identifier)
        delete_configured_table(input)
      end

      def delete_configured_table(input : Types::DeleteConfiguredTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configured table analysis rule.

      def delete_configured_table_analysis_rule(
        analysis_rule_type : String,
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredTableAnalysisRuleInput.new(analysis_rule_type: analysis_rule_type, configured_table_identifier: configured_table_identifier)
        delete_configured_table_analysis_rule(input)
      end

      def delete_configured_table_analysis_rule(input : Types::DeleteConfiguredTableAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_TABLE_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configured table association.

      def delete_configured_table_association(
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredTableAssociationInput.new(configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        delete_configured_table_association(input)
      end

      def delete_configured_table_association(input : Types::DeleteConfiguredTableAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_TABLE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an analysis rule for a configured table association.

      def delete_configured_table_association_analysis_rule(
        analysis_rule_type : String,
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfiguredTableAssociationAnalysisRuleInput.new(analysis_rule_type: analysis_rule_type, configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        delete_configured_table_association_analysis_rule(input)
      end

      def delete_configured_table_association_analysis_rule(input : Types::DeleteConfiguredTableAssociationAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ID mapping table.

      def delete_id_mapping_table(
        id_mapping_table_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteIdMappingTableInput.new(id_mapping_table_identifier: id_mapping_table_identifier, membership_identifier: membership_identifier)
        delete_id_mapping_table(input)
      end

      def delete_id_mapping_table(input : Types::DeleteIdMappingTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ID_MAPPING_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ID namespace association.

      def delete_id_namespace_association(
        id_namespace_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteIdNamespaceAssociationInput.new(id_namespace_association_identifier: id_namespace_association_identifier, membership_identifier: membership_identifier)
        delete_id_namespace_association(input)
      end

      def delete_id_namespace_association(input : Types::DeleteIdNamespaceAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ID_NAMESPACE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified member from a collaboration. The removed member is placed in the Removed
      # status and can't interact with the collaboration. The removed member's data is inaccessible to
      # active members of the collaboration.

      def delete_member(
        account_id : String,
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::DeleteMemberInput.new(account_id: account_id, collaboration_identifier: collaboration_identifier)
        delete_member(input)
      end

      def delete_member(input : Types::DeleteMemberInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a specified membership. All resources under a membership must be deleted.

      def delete_membership(
        membership_identifier : String
      ) : Protocol::Request
        input = Types::DeleteMembershipInput.new(membership_identifier: membership_identifier)
        delete_membership(input)
      end

      def delete_membership(input : Types::DeleteMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a privacy budget template for a specified collaboration.

      def delete_privacy_budget_template(
        membership_identifier : String,
        privacy_budget_template_identifier : String
      ) : Protocol::Request
        input = Types::DeletePrivacyBudgetTemplateInput.new(membership_identifier: membership_identifier, privacy_budget_template_identifier: privacy_budget_template_identifier)
        delete_privacy_budget_template(input)
      end

      def delete_privacy_budget_template(input : Types::DeletePrivacyBudgetTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRIVACY_BUDGET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an analysis template.

      def get_analysis_template(
        analysis_template_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetAnalysisTemplateInput.new(analysis_template_identifier: analysis_template_identifier, membership_identifier: membership_identifier)
        get_analysis_template(input)
      end

      def get_analysis_template(input : Types::GetAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns metadata about a collaboration.

      def get_collaboration(
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationInput.new(collaboration_identifier: collaboration_identifier)
        get_collaboration(input)
      end

      def get_collaboration(input : Types::GetCollaborationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an analysis template within a collaboration.

      def get_collaboration_analysis_template(
        analysis_template_arn : String,
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationAnalysisTemplateInput.new(analysis_template_arn: analysis_template_arn, collaboration_identifier: collaboration_identifier)
        get_collaboration_analysis_template(input)
      end

      def get_collaboration_analysis_template(input : Types::GetCollaborationAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific collaboration change request.

      def get_collaboration_change_request(
        change_request_identifier : String,
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationChangeRequestInput.new(change_request_identifier: change_request_identifier, collaboration_identifier: collaboration_identifier)
        get_collaboration_change_request(input)
      end

      def get_collaboration_change_request(input : Types::GetCollaborationChangeRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_CHANGE_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a configured audience model association within a collaboration.

      def get_collaboration_configured_audience_model_association(
        collaboration_identifier : String,
        configured_audience_model_association_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationConfiguredAudienceModelAssociationInput.new(collaboration_identifier: collaboration_identifier, configured_audience_model_association_identifier: configured_audience_model_association_identifier)
        get_collaboration_configured_audience_model_association(input)
      end

      def get_collaboration_configured_audience_model_association(input : Types::GetCollaborationConfiguredAudienceModelAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an ID namespace association from a specific collaboration.

      def get_collaboration_id_namespace_association(
        collaboration_identifier : String,
        id_namespace_association_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationIdNamespaceAssociationInput.new(collaboration_identifier: collaboration_identifier, id_namespace_association_identifier: id_namespace_association_identifier)
        get_collaboration_id_namespace_association(input)
      end

      def get_collaboration_id_namespace_association(input : Types::GetCollaborationIdNamespaceAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_ID_NAMESPACE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about a specified privacy budget template.

      def get_collaboration_privacy_budget_template(
        collaboration_identifier : String,
        privacy_budget_template_identifier : String
      ) : Protocol::Request
        input = Types::GetCollaborationPrivacyBudgetTemplateInput.new(collaboration_identifier: collaboration_identifier, privacy_budget_template_identifier: privacy_budget_template_identifier)
        get_collaboration_privacy_budget_template(input)
      end

      def get_collaboration_privacy_budget_template(input : Types::GetCollaborationPrivacyBudgetTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COLLABORATION_PRIVACY_BUDGET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a configured audience model association.

      def get_configured_audience_model_association(
        configured_audience_model_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredAudienceModelAssociationInput.new(configured_audience_model_association_identifier: configured_audience_model_association_identifier, membership_identifier: membership_identifier)
        get_configured_audience_model_association(input)
      end

      def get_configured_audience_model_association(input : Types::GetConfiguredAudienceModelAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a configured table.

      def get_configured_table(
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredTableInput.new(configured_table_identifier: configured_table_identifier)
        get_configured_table(input)
      end

      def get_configured_table(input : Types::GetConfiguredTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a configured table analysis rule.

      def get_configured_table_analysis_rule(
        analysis_rule_type : String,
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredTableAnalysisRuleInput.new(analysis_rule_type: analysis_rule_type, configured_table_identifier: configured_table_identifier)
        get_configured_table_analysis_rule(input)
      end

      def get_configured_table_analysis_rule(input : Types::GetConfiguredTableAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_TABLE_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a configured table association.

      def get_configured_table_association(
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredTableAssociationInput.new(configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        get_configured_table_association(input)
      end

      def get_configured_table_association(input : Types::GetConfiguredTableAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_TABLE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the analysis rule for a configured table association.

      def get_configured_table_association_analysis_rule(
        analysis_rule_type : String,
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetConfiguredTableAssociationAnalysisRuleInput.new(analysis_rule_type: analysis_rule_type, configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        get_configured_table_association_analysis_rule(input)
      end

      def get_configured_table_association_analysis_rule(input : Types::GetConfiguredTableAssociationAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an ID mapping table.

      def get_id_mapping_table(
        id_mapping_table_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetIdMappingTableInput.new(id_mapping_table_identifier: id_mapping_table_identifier, membership_identifier: membership_identifier)
        get_id_mapping_table(input)
      end

      def get_id_mapping_table(input : Types::GetIdMappingTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ID_MAPPING_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an ID namespace association.

      def get_id_namespace_association(
        id_namespace_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetIdNamespaceAssociationInput.new(id_namespace_association_identifier: id_namespace_association_identifier, membership_identifier: membership_identifier)
        get_id_namespace_association(input)
      end

      def get_id_namespace_association(input : Types::GetIdNamespaceAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ID_NAMESPACE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specified membership for an identifier.

      def get_membership(
        membership_identifier : String
      ) : Protocol::Request
        input = Types::GetMembershipInput.new(membership_identifier: membership_identifier)
        get_membership(input)
      end

      def get_membership(input : Types::GetMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details for a specified privacy budget template.

      def get_privacy_budget_template(
        membership_identifier : String,
        privacy_budget_template_identifier : String
      ) : Protocol::Request
        input = Types::GetPrivacyBudgetTemplateInput.new(membership_identifier: membership_identifier, privacy_budget_template_identifier: privacy_budget_template_identifier)
        get_privacy_budget_template(input)
      end

      def get_privacy_budget_template(input : Types::GetPrivacyBudgetTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRIVACY_BUDGET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns job processing metadata.

      def get_protected_job(
        membership_identifier : String,
        protected_job_identifier : String
      ) : Protocol::Request
        input = Types::GetProtectedJobInput.new(membership_identifier: membership_identifier, protected_job_identifier: protected_job_identifier)
        get_protected_job(input)
      end

      def get_protected_job(input : Types::GetProtectedJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROTECTED_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns query processing metadata.

      def get_protected_query(
        membership_identifier : String,
        protected_query_identifier : String
      ) : Protocol::Request
        input = Types::GetProtectedQueryInput.new(membership_identifier: membership_identifier, protected_query_identifier: protected_query_identifier)
        get_protected_query(input)
      end

      def get_protected_query(input : Types::GetProtectedQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROTECTED_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the schema for a relation within a collaboration.

      def get_schema(
        collaboration_identifier : String,
        name : String
      ) : Protocol::Request
        input = Types::GetSchemaInput.new(collaboration_identifier: collaboration_identifier, name: name)
        get_schema(input)
      end

      def get_schema(input : Types::GetSchemaInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a schema analysis rule.

      def get_schema_analysis_rule(
        collaboration_identifier : String,
        name : String,
        type : String
      ) : Protocol::Request
        input = Types::GetSchemaAnalysisRuleInput.new(collaboration_identifier: collaboration_identifier, name: name, type: type)
        get_schema_analysis_rule(input)
      end

      def get_schema_analysis_rule(input : Types::GetSchemaAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists analysis templates that the caller owns.

      def list_analysis_templates(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalysisTemplatesInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_analysis_templates(input)
      end

      def list_analysis_templates(input : Types::ListAnalysisTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYSIS_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists analysis templates within a collaboration.

      def list_collaboration_analysis_templates(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationAnalysisTemplatesInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_analysis_templates(input)
      end

      def list_collaboration_analysis_templates(input : Types::ListCollaborationAnalysisTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_ANALYSIS_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all change requests for a collaboration with pagination support. Returns change requests
      # sorted by creation time.

      def list_collaboration_change_requests(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationChangeRequestsInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token, status: status)
        list_collaboration_change_requests(input)
      end

      def list_collaboration_change_requests(input : Types::ListCollaborationChangeRequestsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_CHANGE_REQUESTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured audience model associations within a collaboration.

      def list_collaboration_configured_audience_model_associations(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationConfiguredAudienceModelAssociationsInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_configured_audience_model_associations(input)
      end

      def list_collaboration_configured_audience_model_associations(input : Types::ListCollaborationConfiguredAudienceModelAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_CONFIGURED_AUDIENCE_MODEL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the ID namespace associations in a collaboration.

      def list_collaboration_id_namespace_associations(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationIdNamespaceAssociationsInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_id_namespace_associations(input)
      end

      def list_collaboration_id_namespace_associations(input : Types::ListCollaborationIdNamespaceAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_ID_NAMESPACE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array that summarizes each privacy budget template in a specified collaboration.

      def list_collaboration_privacy_budget_templates(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationPrivacyBudgetTemplatesInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_collaboration_privacy_budget_templates(input)
      end

      def list_collaboration_privacy_budget_templates(input : Types::ListCollaborationPrivacyBudgetTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_PRIVACY_BUDGET_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an array that summarizes each privacy budget in a specified collaboration. The summary
      # includes the collaboration ARN, creation time, creating account, and privacy budget details.

      def list_collaboration_privacy_budgets(
        collaboration_identifier : String,
        privacy_budget_type : String,
        access_budget_resource_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationPrivacyBudgetsInput.new(collaboration_identifier: collaboration_identifier, privacy_budget_type: privacy_budget_type, access_budget_resource_arn: access_budget_resource_arn, max_results: max_results, next_token: next_token)
        list_collaboration_privacy_budgets(input)
      end

      def list_collaboration_privacy_budgets(input : Types::ListCollaborationPrivacyBudgetsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATION_PRIVACY_BUDGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists collaborations the caller owns, is active in, or has been invited to.

      def list_collaborations(
        max_results : Int32? = nil,
        member_status : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCollaborationsInput.new(max_results: max_results, member_status: member_status, next_token: next_token)
        list_collaborations(input)
      end

      def list_collaborations(input : Types::ListCollaborationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COLLABORATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about requested configured audience model associations.

      def list_configured_audience_model_associations(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredAudienceModelAssociationsInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_configured_audience_model_associations(input)
      end

      def list_configured_audience_model_associations(input : Types::ListConfiguredAudienceModelAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_AUDIENCE_MODEL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured table associations for a membership.

      def list_configured_table_associations(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredTableAssociationsInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_configured_table_associations(input)
      end

      def list_configured_table_associations(input : Types::ListConfiguredTableAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_TABLE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists configured tables.

      def list_configured_tables(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfiguredTablesInput.new(max_results: max_results, next_token: next_token)
        list_configured_tables(input)
      end

      def list_configured_tables(input : Types::ListConfiguredTablesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURED_TABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of ID mapping tables.

      def list_id_mapping_tables(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdMappingTablesInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_id_mapping_tables(input)
      end

      def list_id_mapping_tables(input : Types::ListIdMappingTablesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ID_MAPPING_TABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of ID namespace associations.

      def list_id_namespace_associations(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdNamespaceAssociationsInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_id_namespace_associations(input)
      end

      def list_id_namespace_associations(input : Types::ListIdNamespaceAssociationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ID_NAMESPACE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all members within a collaboration.

      def list_members(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMembersInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token)
        list_members(input)
      end

      def list_members(input : Types::ListMembersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all memberships resources within the caller's account.

      def list_memberships(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListMembershipsInput.new(max_results: max_results, next_token: next_token, status: status)
        list_memberships(input)
      end

      def list_memberships(input : Types::ListMembershipsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about the privacy budget templates in a specified membership.

      def list_privacy_budget_templates(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPrivacyBudgetTemplatesInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token)
        list_privacy_budget_templates(input)
      end

      def list_privacy_budget_templates(input : Types::ListPrivacyBudgetTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRIVACY_BUDGET_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about the privacy budgets in a specified membership.

      def list_privacy_budgets(
        membership_identifier : String,
        privacy_budget_type : String,
        access_budget_resource_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPrivacyBudgetsInput.new(membership_identifier: membership_identifier, privacy_budget_type: privacy_budget_type, access_budget_resource_arn: access_budget_resource_arn, max_results: max_results, next_token: next_token)
        list_privacy_budgets(input)
      end

      def list_privacy_budgets(input : Types::ListPrivacyBudgetsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRIVACY_BUDGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists protected jobs, sorted by most recent job.

      def list_protected_jobs(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListProtectedJobsInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token, status: status)
        list_protected_jobs(input)
      end

      def list_protected_jobs(input : Types::ListProtectedJobsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROTECTED_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists protected queries, sorted by the most recent query.

      def list_protected_queries(
        membership_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListProtectedQueriesInput.new(membership_identifier: membership_identifier, max_results: max_results, next_token: next_token, status: status)
        list_protected_queries(input)
      end

      def list_protected_queries(input : Types::ListProtectedQueriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROTECTED_QUERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the schemas for relations within a collaboration.

      def list_schemas(
        collaboration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        schema_type : String? = nil
      ) : Protocol::Request
        input = Types::ListSchemasInput.new(collaboration_identifier: collaboration_identifier, max_results: max_results, next_token: next_token, schema_type: schema_type)
        list_schemas(input)
      end

      def list_schemas(input : Types::ListSchemasInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEMAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags that have been added to a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Defines the information that's necessary to populate an ID mapping table.

      def populate_id_mapping_table(
        id_mapping_table_identifier : String,
        membership_identifier : String,
        job_type : String? = nil
      ) : Protocol::Request
        input = Types::PopulateIdMappingTableInput.new(id_mapping_table_identifier: id_mapping_table_identifier, membership_identifier: membership_identifier, job_type: job_type)
        populate_id_mapping_table(input)
      end

      def populate_id_mapping_table(input : Types::PopulateIdMappingTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POPULATE_ID_MAPPING_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # An estimate of the number of aggregation functions that the member who can query can run given
      # epsilon and noise parameters.

      def preview_privacy_impact(
        membership_identifier : String,
        parameters : Types::PreviewPrivacyImpactParametersInput
      ) : Protocol::Request
        input = Types::PreviewPrivacyImpactInput.new(membership_identifier: membership_identifier, parameters: parameters)
        preview_privacy_impact(input)
      end

      def preview_privacy_impact(input : Types::PreviewPrivacyImpactInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREVIEW_PRIVACY_IMPACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a protected job that is started by Clean Rooms.

      def start_protected_job(
        job_parameters : Types::ProtectedJobParameters,
        membership_identifier : String,
        type : String,
        compute_configuration : Types::ProtectedJobComputeConfiguration? = nil,
        result_configuration : Types::ProtectedJobResultConfigurationInput? = nil
      ) : Protocol::Request
        input = Types::StartProtectedJobInput.new(job_parameters: job_parameters, membership_identifier: membership_identifier, type: type, compute_configuration: compute_configuration, result_configuration: result_configuration)
        start_protected_job(input)
      end

      def start_protected_job(input : Types::StartProtectedJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PROTECTED_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a protected query that is started by Clean Rooms.

      def start_protected_query(
        membership_identifier : String,
        sql_parameters : Types::ProtectedQuerySQLParameters,
        type : String,
        compute_configuration : Types::ComputeConfiguration? = nil,
        result_configuration : Types::ProtectedQueryResultConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartProtectedQueryInput.new(membership_identifier: membership_identifier, sql_parameters: sql_parameters, type: type, compute_configuration: compute_configuration, result_configuration: result_configuration)
        start_protected_query(input)
      end

      def start_protected_query(input : Types::StartProtectedQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_PROTECTED_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag or list of tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the analysis template metadata.

      def update_analysis_template(
        analysis_template_identifier : String,
        membership_identifier : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAnalysisTemplateInput.new(analysis_template_identifier: analysis_template_identifier, membership_identifier: membership_identifier, description: description)
        update_analysis_template(input)
      end

      def update_analysis_template(input : Types::UpdateAnalysisTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANALYSIS_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates collaboration metadata and can only be called by the collaboration owner.

      def update_collaboration(
        collaboration_identifier : String,
        analytics_engine : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCollaborationInput.new(collaboration_identifier: collaboration_identifier, analytics_engine: analytics_engine, description: description, name: name)
        update_collaboration(input)
      end

      def update_collaboration(input : Types::UpdateCollaborationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COLLABORATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing collaboration change request. This operation allows approval actions for pending
      # change requests in collaborations (APPROVE, DENY, CANCEL, COMMIT). For change requests without
      # automatic approval, a member in the collaboration can manually APPROVE or DENY a change request. The
      # collaboration owner can manually CANCEL or COMMIT a change request.

      def update_collaboration_change_request(
        action : String,
        change_request_identifier : String,
        collaboration_identifier : String
      ) : Protocol::Request
        input = Types::UpdateCollaborationChangeRequestInput.new(action: action, change_request_identifier: change_request_identifier, collaboration_identifier: collaboration_identifier)
        update_collaboration_change_request(input)
      end

      def update_collaboration_change_request(input : Types::UpdateCollaborationChangeRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COLLABORATION_CHANGE_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details necessary to update a configured audience model association.

      def update_configured_audience_model_association(
        configured_audience_model_association_identifier : String,
        membership_identifier : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfiguredAudienceModelAssociationInput.new(configured_audience_model_association_identifier: configured_audience_model_association_identifier, membership_identifier: membership_identifier, description: description, name: name)
        update_configured_audience_model_association(input)
      end

      def update_configured_audience_model_association(input : Types::UpdateConfiguredAudienceModelAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_AUDIENCE_MODEL_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a configured table.

      def update_configured_table(
        configured_table_identifier : String,
        allowed_columns : Array(String)? = nil,
        analysis_method : String? = nil,
        description : String? = nil,
        name : String? = nil,
        selected_analysis_methods : Array(String)? = nil,
        table_reference : Types::TableReference? = nil
      ) : Protocol::Request
        input = Types::UpdateConfiguredTableInput.new(configured_table_identifier: configured_table_identifier, allowed_columns: allowed_columns, analysis_method: analysis_method, description: description, name: name, selected_analysis_methods: selected_analysis_methods, table_reference: table_reference)
        update_configured_table(input)
      end

      def update_configured_table(input : Types::UpdateConfiguredTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a configured table analysis rule.

      def update_configured_table_analysis_rule(
        analysis_rule_policy : Types::ConfiguredTableAnalysisRulePolicy,
        analysis_rule_type : String,
        configured_table_identifier : String
      ) : Protocol::Request
        input = Types::UpdateConfiguredTableAnalysisRuleInput.new(analysis_rule_policy: analysis_rule_policy, analysis_rule_type: analysis_rule_type, configured_table_identifier: configured_table_identifier)
        update_configured_table_analysis_rule(input)
      end

      def update_configured_table_analysis_rule(input : Types::UpdateConfiguredTableAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_TABLE_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a configured table association.

      def update_configured_table_association(
        configured_table_association_identifier : String,
        membership_identifier : String,
        description : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfiguredTableAssociationInput.new(configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier, description: description, role_arn: role_arn)
        update_configured_table_association(input)
      end

      def update_configured_table_association(input : Types::UpdateConfiguredTableAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_TABLE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the analysis rule for a configured table association.

      def update_configured_table_association_analysis_rule(
        analysis_rule_policy : Types::ConfiguredTableAssociationAnalysisRulePolicy,
        analysis_rule_type : String,
        configured_table_association_identifier : String,
        membership_identifier : String
      ) : Protocol::Request
        input = Types::UpdateConfiguredTableAssociationAnalysisRuleInput.new(analysis_rule_policy: analysis_rule_policy, analysis_rule_type: analysis_rule_type, configured_table_association_identifier: configured_table_association_identifier, membership_identifier: membership_identifier)
        update_configured_table_association_analysis_rule(input)
      end

      def update_configured_table_association_analysis_rule(input : Types::UpdateConfiguredTableAssociationAnalysisRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURED_TABLE_ASSOCIATION_ANALYSIS_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details that are necessary to update an ID mapping table.

      def update_id_mapping_table(
        id_mapping_table_identifier : String,
        membership_identifier : String,
        description : String? = nil,
        kms_key_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdMappingTableInput.new(id_mapping_table_identifier: id_mapping_table_identifier, membership_identifier: membership_identifier, description: description, kms_key_arn: kms_key_arn)
        update_id_mapping_table(input)
      end

      def update_id_mapping_table(input : Types::UpdateIdMappingTableInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ID_MAPPING_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details that are necessary to update an ID namespace association.

      def update_id_namespace_association(
        id_namespace_association_identifier : String,
        membership_identifier : String,
        description : String? = nil,
        id_mapping_config : Types::IdMappingConfig? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIdNamespaceAssociationInput.new(id_namespace_association_identifier: id_namespace_association_identifier, membership_identifier: membership_identifier, description: description, id_mapping_config: id_mapping_config, name: name)
        update_id_namespace_association(input)
      end

      def update_id_namespace_association(input : Types::UpdateIdNamespaceAssociationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ID_NAMESPACE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a membership.

      def update_membership(
        membership_identifier : String,
        default_job_result_configuration : Types::MembershipProtectedJobResultConfiguration? = nil,
        default_result_configuration : Types::MembershipProtectedQueryResultConfiguration? = nil,
        job_log_status : String? = nil,
        query_log_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateMembershipInput.new(membership_identifier: membership_identifier, default_job_result_configuration: default_job_result_configuration, default_result_configuration: default_result_configuration, job_log_status: job_log_status, query_log_status: query_log_status)
        update_membership(input)
      end

      def update_membership(input : Types::UpdateMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the privacy budget template for the specified collaboration.

      def update_privacy_budget_template(
        membership_identifier : String,
        privacy_budget_template_identifier : String,
        privacy_budget_type : String,
        parameters : Types::PrivacyBudgetTemplateUpdateParameters? = nil
      ) : Protocol::Request
        input = Types::UpdatePrivacyBudgetTemplateInput.new(membership_identifier: membership_identifier, privacy_budget_template_identifier: privacy_budget_template_identifier, privacy_budget_type: privacy_budget_type, parameters: parameters)
        update_privacy_budget_template(input)
      end

      def update_privacy_budget_template(input : Types::UpdatePrivacyBudgetTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRIVACY_BUDGET_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the processing of a currently running job.

      def update_protected_job(
        membership_identifier : String,
        protected_job_identifier : String,
        target_status : String
      ) : Protocol::Request
        input = Types::UpdateProtectedJobInput.new(membership_identifier: membership_identifier, protected_job_identifier: protected_job_identifier, target_status: target_status)
        update_protected_job(input)
      end

      def update_protected_job(input : Types::UpdateProtectedJobInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROTECTED_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the processing of a currently running query.

      def update_protected_query(
        membership_identifier : String,
        protected_query_identifier : String,
        target_status : String
      ) : Protocol::Request
        input = Types::UpdateProtectedQueryInput.new(membership_identifier: membership_identifier, protected_query_identifier: protected_query_identifier, target_status: target_status)
        update_protected_query(input)
      end

      def update_protected_query(input : Types::UpdateProtectedQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROTECTED_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
