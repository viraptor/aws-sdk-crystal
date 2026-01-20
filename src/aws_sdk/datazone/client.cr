module AwsSdk
  module DataZone
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

      # Accepts automatically generated business-friendly metadata for your Amazon DataZone assets.

      def accept_predictions(
        domain_identifier : String,
        identifier : String,
        accept_choices : Array(Types::AcceptChoice)? = nil,
        accept_rule : Types::AcceptRule? = nil,
        client_token : String? = nil,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::AcceptPredictionsInput.new(domain_identifier: domain_identifier, identifier: identifier, accept_choices: accept_choices, accept_rule: accept_rule, client_token: client_token, revision: revision)
        accept_predictions(input)
      end

      def accept_predictions(input : Types::AcceptPredictionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_PREDICTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Accepts a subscription request to a specific asset.

      def accept_subscription_request(
        domain_identifier : String,
        identifier : String,
        asset_permissions : Array(Types::AssetPermission)? = nil,
        asset_scopes : Array(Types::AcceptedAssetScope)? = nil,
        decision_comment : String? = nil
      ) : Protocol::Request
        input = Types::AcceptSubscriptionRequestInput.new(domain_identifier: domain_identifier, identifier: identifier, asset_permissions: asset_permissions, asset_scopes: asset_scopes, decision_comment: decision_comment)
        accept_subscription_request(input)
      end

      def accept_subscription_request(input : Types::AcceptSubscriptionRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_SUBSCRIPTION_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the owner of an entity (a domain unit).

      def add_entity_owner(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        owner : Types::OwnerProperties,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AddEntityOwnerInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, owner: owner, client_token: client_token)
        add_entity_owner(input)
      end

      def add_entity_owner(input : Types::AddEntityOwnerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_ENTITY_OWNER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a policy grant (an authorization policy) to a specified entity, including domain units,
      # environment blueprint configurations, or environment profiles.

      def add_policy_grant(
        detail : Types::PolicyGrantDetail,
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        policy_type : String,
        principal : Types::PolicyGrantPrincipal,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AddPolicyGrantInput.new(detail: detail, domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, policy_type: policy_type, principal: principal, client_token: client_token)
        add_policy_grant(input)
      end

      def add_policy_grant(input : Types::AddPolicyGrantInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_POLICY_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the environment role in Amazon DataZone.

      def associate_environment_role(
        domain_identifier : String,
        environment_identifier : String,
        environment_role_arn : String
      ) : Protocol::Request
        input = Types::AssociateEnvironmentRoleInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, environment_role_arn: environment_role_arn)
        associate_environment_role(input)
      end

      def associate_environment_role(input : Types::AssociateEnvironmentRoleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ENVIRONMENT_ROLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates governed terms with an asset.

      def associate_governed_terms(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        governed_glossary_terms : Array(String)
      ) : Protocol::Request
        input = Types::AssociateGovernedTermsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, governed_glossary_terms: governed_glossary_terms)
        associate_governed_terms(input)
      end

      def associate_governed_terms(input : Types::AssociateGovernedTermsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_GOVERNED_TERMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the attribute metadata.

      def batch_get_attributes_metadata(
        attribute_identifiers : Array(String),
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        entity_revision : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetAttributesMetadataInput.new(attribute_identifiers: attribute_identifiers, domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, entity_revision: entity_revision)
        batch_get_attributes_metadata(input)
      end

      def batch_get_attributes_metadata(input : Types::BatchGetAttributesMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ATTRIBUTES_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Writes the attribute metadata.

      def batch_put_attributes_metadata(
        attributes : Array(Types::AttributeInput),
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchPutAttributesMetadataInput.new(attributes: attributes, domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, client_token: client_token)
        batch_put_attributes_metadata(input)
      end

      def batch_put_attributes_metadata(input : Types::BatchPutAttributesMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_ATTRIBUTES_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the metadata generation run. Prerequisites: The run must exist and be in a cancelable status
      # (e.g., SUBMITTED, IN_PROGRESS). Runs in SUCCEEDED status cannot be cancelled. User must have access
      # to the run and cancel permissions.

      def cancel_metadata_generation_run(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::CancelMetadataGenerationRunInput.new(domain_identifier: domain_identifier, identifier: identifier)
        cancel_metadata_generation_run(input)
      end

      def cancel_metadata_generation_run(input : Types::CancelMetadataGenerationRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_METADATA_GENERATION_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the subscription to the specified asset.

      def cancel_subscription(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::CancelSubscriptionInput.new(domain_identifier: domain_identifier, identifier: identifier)
        cancel_subscription(input)
      end

      def cancel_subscription(input : Types::CancelSubscriptionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an account pool.

      def create_account_pool(
        account_source : Types::AccountSource,
        domain_identifier : String,
        name : String,
        resolution_strategy : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateAccountPoolInput.new(account_source: account_source, domain_identifier: domain_identifier, name: name, resolution_strategy: resolution_strategy, description: description)
        create_account_pool(input)
      end

      def create_account_pool(input : Types::CreateAccountPoolInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCOUNT_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an asset in Amazon DataZone catalog. Before creating assets, make sure that the following
      # requirements are met: --domain-identifier must refer to an existing domain.
      # --owning-project-identifier must be a valid project within the domain. Asset type must be created
      # beforehand using create-asset-type , or be a supported system-defined type. For more information,
      # see create-asset-type . --type-revision (if used) must match a valid revision of the asset type.
      # formsInput is required when it is associated as required in the asset-type . For more information,
      # see create-form-type . Form content must include all required fields as per the form schema (e.g.,
      # bucketArn ). You must invoke the following pre-requisite commands before invoking this API:
      # CreateFormType CreateAssetType

      def create_asset(
        domain_identifier : String,
        name : String,
        owning_project_identifier : String,
        type_identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        external_identifier : String? = nil,
        forms_input : Array(Types::FormInput)? = nil,
        glossary_terms : Array(String)? = nil,
        prediction_configuration : Types::PredictionConfiguration? = nil,
        type_revision : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssetInput.new(domain_identifier: domain_identifier, name: name, owning_project_identifier: owning_project_identifier, type_identifier: type_identifier, client_token: client_token, description: description, external_identifier: external_identifier, forms_input: forms_input, glossary_terms: glossary_terms, prediction_configuration: prediction_configuration, type_revision: type_revision)
        create_asset(input)
      end

      def create_asset(input : Types::CreateAssetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data asset filter. Asset filters provide a sophisticated way to create controlled views of
      # data assets by selecting specific columns or applying row-level filters. This capability is crucial
      # for organizations that need to share data while maintaining security and privacy controls. For
      # example, your database might be filtered to show only non-PII fields to certain users, or sales data
      # might be filtered by region for different regional teams. Asset filters enable fine-grained access
      # control while maintaining a single source of truth. Prerequisites: A valid domain (
      # --domain-identifier ) must exist. A data asset ( --asset-identifier ) must already be created under
      # that domain. The asset must have the referenced columns available in its schema for column-based
      # filtering. You cannot specify both ( columnConfiguration , rowConfiguration )at the same time.

      def create_asset_filter(
        asset_identifier : String,
        configuration : Types::AssetFilterConfiguration,
        domain_identifier : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssetFilterInput.new(asset_identifier: asset_identifier, configuration: configuration, domain_identifier: domain_identifier, name: name, client_token: client_token, description: description)
        create_asset_filter(input)
      end

      def create_asset_filter(input : Types::CreateAssetFilterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a revision of the asset. Asset revisions represent new versions of existing assets,
      # capturing changes to either the underlying data or its metadata. They maintain a historical record
      # of how assets evolve over time, who made changes, and when those changes occurred. This versioning
      # capability is crucial for governance and compliance, allowing organizations to track changes,
      # understand their impact, and roll back if necessary. Prerequisites: Asset must already exist in the
      # domain with identifier. formsInput is required when asset has the form type. typeRevision should be
      # the latest version of form type. The form content must include all required fields (e.g., bucketArn
      # for S3ObjectCollectionForm ). The owning project of the original asset must still exist and be
      # active. User must have write access to the project and domain.

      def create_asset_revision(
        domain_identifier : String,
        identifier : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        forms_input : Array(Types::FormInput)? = nil,
        glossary_terms : Array(String)? = nil,
        prediction_configuration : Types::PredictionConfiguration? = nil,
        type_revision : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssetRevisionInput.new(domain_identifier: domain_identifier, identifier: identifier, name: name, client_token: client_token, description: description, forms_input: forms_input, glossary_terms: glossary_terms, prediction_configuration: prediction_configuration, type_revision: type_revision)
        create_asset_revision(input)
      end

      def create_asset_revision(input : Types::CreateAssetRevisionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom asset type. Prerequisites: The formsInput field is required, however, can be passed
      # as empty (e.g. -forms-input {}) . You must have CreateAssetType permissions. The domain-identifier
      # and owning-project-identifier must be valid and active. The name of the asset type must be unique
      # within the domain — duplicate names will cause failure. JSON input must be valid — incorrect
      # formatting causes Invalid JSON errors.

      def create_asset_type(
        domain_identifier : String,
        forms_input : Hash(String, Types::FormEntryInput),
        name : String,
        owning_project_identifier : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateAssetTypeInput.new(domain_identifier: domain_identifier, forms_input: forms_input, name: name, owning_project_identifier: owning_project_identifier, description: description)
        create_asset_type(input)
      end

      def create_asset_type(input : Types::CreateAssetTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ASSET_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new connection. In Amazon DataZone, a connection enables you to connect your resources
      # (domains, projects, and environments) to external resources and services.

      def create_connection(
        domain_identifier : String,
        name : String,
        aws_location : Types::AwsLocation? = nil,
        client_token : String? = nil,
        description : String? = nil,
        enable_trusted_identity_propagation : Bool? = nil,
        environment_identifier : String? = nil,
        props : Types::ConnectionPropertiesInput? = nil,
        scope : String? = nil
      ) : Protocol::Request
        input = Types::CreateConnectionInput.new(domain_identifier: domain_identifier, name: name, aws_location: aws_location, client_token: client_token, description: description, enable_trusted_identity_propagation: enable_trusted_identity_propagation, environment_identifier: environment_identifier, props: props, scope: scope)
        create_connection(input)
      end

      def create_connection(input : Types::CreateConnectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data product. A data product is a comprehensive package that combines data assets with
      # their associated metadata, documentation, and access controls. It's designed to serve specific
      # business needs or use cases, making it easier for users to find and consume data appropriately. Data
      # products include important information about data quality, freshness, and usage guidelines,
      # effectively bridging the gap between data producers and consumers while ensuring proper governance.
      # Prerequisites: The domain must exist and be accessible. The owning project must be valid and active.
      # The name must be unique within the domain (no existing data product with the same name). User must
      # have create permissions for data products in the project.

      def create_data_product(
        domain_identifier : String,
        name : String,
        owning_project_identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        forms_input : Array(Types::FormInput)? = nil,
        glossary_terms : Array(String)? = nil,
        items : Array(Types::DataProductItem)? = nil
      ) : Protocol::Request
        input = Types::CreateDataProductInput.new(domain_identifier: domain_identifier, name: name, owning_project_identifier: owning_project_identifier, client_token: client_token, description: description, forms_input: forms_input, glossary_terms: glossary_terms, items: items)
        create_data_product(input)
      end

      def create_data_product(input : Types::CreateDataProductInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data product revision. Prerequisites: The original data product must exist in the given
      # domain. User must have permissions on the data product. The domain must be valid and accessible. The
      # new revision name must comply with naming constraints (if required).

      def create_data_product_revision(
        domain_identifier : String,
        identifier : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        forms_input : Array(Types::FormInput)? = nil,
        glossary_terms : Array(String)? = nil,
        items : Array(Types::DataProductItem)? = nil
      ) : Protocol::Request
        input = Types::CreateDataProductRevisionInput.new(domain_identifier: domain_identifier, identifier: identifier, name: name, client_token: client_token, description: description, forms_input: forms_input, glossary_terms: glossary_terms, items: items)
        create_data_product_revision(input)
      end

      def create_data_product_revision(input : Types::CreateDataProductRevisionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_PRODUCT_REVISION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon DataZone data source.

      def create_data_source(
        domain_identifier : String,
        name : String,
        project_identifier : String,
        type : String,
        asset_forms_input : Array(Types::FormInput)? = nil,
        client_token : String? = nil,
        configuration : Types::DataSourceConfigurationInput? = nil,
        connection_identifier : String? = nil,
        description : String? = nil,
        enable_setting : String? = nil,
        environment_identifier : String? = nil,
        publish_on_import : Bool? = nil,
        recommendation : Types::RecommendationConfiguration? = nil,
        schedule : Types::ScheduleConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateDataSourceInput.new(domain_identifier: domain_identifier, name: name, project_identifier: project_identifier, type: type, asset_forms_input: asset_forms_input, client_token: client_token, configuration: configuration, connection_identifier: connection_identifier, description: description, enable_setting: enable_setting, environment_identifier: environment_identifier, publish_on_import: publish_on_import, recommendation: recommendation, schedule: schedule)
        create_data_source(input)
      end

      def create_data_source(input : Types::CreateDataSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon DataZone domain.

      def create_domain(
        domain_execution_role : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        domain_version : String? = nil,
        kms_key_identifier : String? = nil,
        service_role : String? = nil,
        single_sign_on : Types::SingleSignOn? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainInput.new(domain_execution_role: domain_execution_role, name: name, client_token: client_token, description: description, domain_version: domain_version, kms_key_identifier: kms_key_identifier, service_role: service_role, single_sign_on: single_sign_on, tags: tags)
        create_domain(input)
      end

      def create_domain(input : Types::CreateDomainInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain unit in Amazon DataZone.

      def create_domain_unit(
        domain_identifier : String,
        name : String,
        parent_domain_unit_identifier : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateDomainUnitInput.new(domain_identifier: domain_identifier, name: name, parent_domain_unit_identifier: parent_domain_unit_identifier, client_token: client_token, description: description)
        create_domain_unit(input)
      end

      def create_domain_unit(input : Types::CreateDomainUnitInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an Amazon DataZone environment.

      def create_environment(
        domain_identifier : String,
        name : String,
        project_identifier : String,
        deployment_order : Int32? = nil,
        description : String? = nil,
        environment_account_identifier : String? = nil,
        environment_account_region : String? = nil,
        environment_blueprint_identifier : String? = nil,
        environment_configuration_id : String? = nil,
        environment_profile_identifier : String? = nil,
        glossary_terms : Array(String)? = nil,
        user_parameters : Array(Types::EnvironmentParameter)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentInput.new(domain_identifier: domain_identifier, name: name, project_identifier: project_identifier, deployment_order: deployment_order, description: description, environment_account_identifier: environment_account_identifier, environment_account_region: environment_account_region, environment_blueprint_identifier: environment_blueprint_identifier, environment_configuration_id: environment_configuration_id, environment_profile_identifier: environment_profile_identifier, glossary_terms: glossary_terms, user_parameters: user_parameters)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an action for the environment, for example, creates a console link for an analytics tool
      # that is available in this environment.

      def create_environment_action(
        domain_identifier : String,
        environment_identifier : String,
        name : String,
        parameters : Types::ActionParameters,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentActionInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, name: name, parameters: parameters, description: description)
        create_environment_action(input)
      end

      def create_environment_action(input : Types::CreateEnvironmentActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Amazon DataZone blueprint.

      def create_environment_blueprint(
        domain_identifier : String,
        name : String,
        provisioning_properties : Types::ProvisioningProperties,
        description : String? = nil,
        user_parameters : Array(Types::CustomParameter)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentBlueprintInput.new(domain_identifier: domain_identifier, name: name, provisioning_properties: provisioning_properties, description: description, user_parameters: user_parameters)
        create_environment_blueprint(input)
      end

      def create_environment_blueprint(input : Types::CreateEnvironmentBlueprintInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon DataZone environment profile.

      def create_environment_profile(
        domain_identifier : String,
        environment_blueprint_identifier : String,
        name : String,
        project_identifier : String,
        aws_account_id : String? = nil,
        aws_account_region : String? = nil,
        description : String? = nil,
        user_parameters : Array(Types::EnvironmentParameter)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentProfileInput.new(domain_identifier: domain_identifier, environment_blueprint_identifier: environment_blueprint_identifier, name: name, project_identifier: project_identifier, aws_account_id: aws_account_id, aws_account_region: aws_account_region, description: description, user_parameters: user_parameters)
        create_environment_profile(input)
      end

      def create_environment_profile(input : Types::CreateEnvironmentProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a metadata form type. Prerequisites: The domain must exist and be in an ENABLED state. The
      # owning project must exist and be accessible. The name must be unique within the domain. For custom
      # form types, to indicate that a field should be searchable, annotate it with
      # @amazon.datazone#searchable . By default, searchable fields are indexed for semantic search, where
      # related query terms will match the attribute value even if they are not stemmed or keyword matches.
      # To indicate that a field should be indexed for lexical search (which disables semantic search but
      # supports stemmed and partial matches), annotate it with
      # @amazon.datazone#searchable(modes:["LEXICAL"]) . To indicate that a field should be indexed for
      # technical identifier search (for more information on technical identifier search, see:
      # https://aws.amazon.com/blogs/big-data/streamline-data-discovery-with-precise-technical-identifier-search-in-amazon-sagemaker-unified-studio/
      # ), annotate it with @amazon.datazone#searchable(modes:["TECHNICAL"]) . To denote that a field will
      # store glossary term ids (which are filterable via the Search/SearchListings APIs), annotate it with
      # @amazon.datazone#glossaryterm("${GLOSSARY_ID}") , where ${GLOSSARY_ID} is the id of the glossary
      # that the glossary terms stored in the field belong to.

      def create_form_type(
        domain_identifier : String,
        model : Types::Model,
        name : String,
        owning_project_identifier : String,
        description : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::CreateFormTypeInput.new(domain_identifier: domain_identifier, model: model, name: name, owning_project_identifier: owning_project_identifier, description: description, status: status)
        create_form_type(input)
      end

      def create_form_type(input : Types::CreateFormTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FORM_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon DataZone business glossary. Specifies that this is a create glossary policy. A
      # glossary serves as the central repository for business terminology and definitions within an
      # organization. It helps establish and maintain a common language across different departments and
      # teams, reducing miscommunication and ensuring consistent interpretation of business concepts.
      # Glossaries can include hierarchical relationships between terms, cross-references, and links to
      # actual data assets, making them invaluable for both business users and technical teams trying to
      # understand and use data correctly. Prerequisites: Domain must exist and be in an active state.
      # Owning project must exist and be accessible by the caller. The glossary name must be unique within
      # the domain.

      def create_glossary(
        domain_identifier : String,
        name : String,
        owning_project_identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        status : String? = nil,
        usage_restrictions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateGlossaryInput.new(domain_identifier: domain_identifier, name: name, owning_project_identifier: owning_project_identifier, client_token: client_token, description: description, status: status, usage_restrictions: usage_restrictions)
        create_glossary(input)
      end

      def create_glossary(input : Types::CreateGlossaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GLOSSARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a business glossary term. A glossary term represents an individual entry within the Amazon
      # DataZone glossary, serving as a standardized definition for a specific business concept or data
      # element. Each term can include rich metadata such as detailed definitions, synonyms, related terms,
      # and usage examples. Glossary terms can be linked directly to data assets, providing business context
      # to technical data elements. This linking capability helps users understand the business meaning of
      # data fields and ensures consistent interpretation across different systems and teams. Terms can also
      # have relationships with other terms, creating a semantic network that reflects the complexity of
      # business concepts. Prerequisites: Domain must exist. Glossary must exist. The term name must be
      # unique within the glossary. Ensure term does not conflict with existing terms in hierarchy.

      def create_glossary_term(
        domain_identifier : String,
        glossary_identifier : String,
        name : String,
        client_token : String? = nil,
        long_description : String? = nil,
        short_description : String? = nil,
        status : String? = nil,
        term_relations : Types::TermRelations? = nil
      ) : Protocol::Request
        input = Types::CreateGlossaryTermInput.new(domain_identifier: domain_identifier, glossary_identifier: glossary_identifier, name: name, client_token: client_token, long_description: long_description, short_description: short_description, status: status, term_relations: term_relations)
        create_glossary_term(input)
      end

      def create_glossary_term(input : Types::CreateGlossaryTermInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GLOSSARY_TERM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a group profile in Amazon DataZone.

      def create_group_profile(
        domain_identifier : String,
        group_identifier : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateGroupProfileInput.new(domain_identifier: domain_identifier, group_identifier: group_identifier, client_token: client_token)
        create_group_profile(input)
      end

      def create_group_profile(input : Types::CreateGroupProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a listing (a record of an asset at a given time) or removes a listing from the catalog.

      def create_listing_change_set(
        action : String,
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        client_token : String? = nil,
        entity_revision : String? = nil
      ) : Protocol::Request
        input = Types::CreateListingChangeSetInput.new(action: action, domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, client_token: client_token, entity_revision: entity_revision)
        create_listing_change_set(input)
      end

      def create_listing_change_set(input : Types::CreateListingChangeSetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LISTING_CHANGE_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon DataZone project.

      def create_project(
        domain_identifier : String,
        name : String,
        description : String? = nil,
        domain_unit_id : String? = nil,
        glossary_terms : Array(String)? = nil,
        project_profile_id : String? = nil,
        resource_tags : Hash(String, String)? = nil,
        user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
      ) : Protocol::Request
        input = Types::CreateProjectInput.new(domain_identifier: domain_identifier, name: name, description: description, domain_unit_id: domain_unit_id, glossary_terms: glossary_terms, project_profile_id: project_profile_id, resource_tags: resource_tags, user_parameters: user_parameters)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a project membership in Amazon DataZone.

      def create_project_membership(
        designation : String,
        domain_identifier : String,
        member : Types::Member,
        project_identifier : String
      ) : Protocol::Request
        input = Types::CreateProjectMembershipInput.new(designation: designation, domain_identifier: domain_identifier, member: member, project_identifier: project_identifier)
        create_project_membership(input)
      end

      def create_project_membership(input : Types::CreateProjectMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a project profile.

      def create_project_profile(
        domain_identifier : String,
        name : String,
        allow_custom_project_resource_tags : Bool? = nil,
        description : String? = nil,
        domain_unit_identifier : String? = nil,
        environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
        project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
        project_resource_tags_description : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::CreateProjectProfileInput.new(domain_identifier: domain_identifier, name: name, allow_custom_project_resource_tags: allow_custom_project_resource_tags, description: description, domain_unit_identifier: domain_unit_identifier, environment_configurations: environment_configurations, project_resource_tags: project_resource_tags, project_resource_tags_description: project_resource_tags_description, status: status)
        create_project_profile(input)
      end

      def create_project_profile(input : Types::CreateProjectProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a rule in Amazon DataZone. A rule is a formal agreement that enforces specific requirements
      # across user workflows (e.g., publishing assets to the catalog, requesting subscriptions, creating
      # projects) within the Amazon DataZone data portal. These rules help maintain consistency, ensure
      # compliance, and uphold governance standards in data management processes. For instance, a metadata
      # enforcement rule can specify the required information for creating a subscription request or
      # publishing a data asset to the catalog, ensuring alignment with organizational standards.

      def create_rule(
        action : String,
        detail : Types::RuleDetail,
        domain_identifier : String,
        name : String,
        scope : Types::RuleScope,
        target : Types::RuleTarget,
        client_token : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateRuleInput.new(action: action, detail: detail, domain_identifier: domain_identifier, name: name, scope: scope, target: target, client_token: client_token, description: description)
        create_rule(input)
      end

      def create_rule(input : Types::CreateRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a subsscription grant in Amazon DataZone.

      def create_subscription_grant(
        domain_identifier : String,
        environment_identifier : String,
        granted_entity : Types::GrantedEntityInput,
        asset_target_names : Array(Types::AssetTargetNameMap)? = nil,
        client_token : String? = nil,
        subscription_target_identifier : String? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionGrantInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, granted_entity: granted_entity, asset_target_names: asset_target_names, client_token: client_token, subscription_target_identifier: subscription_target_identifier)
        create_subscription_grant(input)
      end

      def create_subscription_grant(input : Types::CreateSubscriptionGrantInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a subscription request in Amazon DataZone.

      def create_subscription_request(
        domain_identifier : String,
        request_reason : String,
        subscribed_listings : Array(Types::SubscribedListingInput),
        subscribed_principals : Array(Types::SubscribedPrincipalInput),
        asset_permissions : Array(Types::AssetPermission)? = nil,
        asset_scopes : Array(Types::AcceptedAssetScope)? = nil,
        client_token : String? = nil,
        metadata_forms : Array(Types::FormInput)? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionRequestInput.new(domain_identifier: domain_identifier, request_reason: request_reason, subscribed_listings: subscribed_listings, subscribed_principals: subscribed_principals, asset_permissions: asset_permissions, asset_scopes: asset_scopes, client_token: client_token, metadata_forms: metadata_forms)
        create_subscription_request(input)
      end

      def create_subscription_request(input : Types::CreateSubscriptionRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a subscription target in Amazon DataZone.

      def create_subscription_target(
        applicable_asset_types : Array(String),
        authorized_principals : Array(String),
        domain_identifier : String,
        environment_identifier : String,
        manage_access_role : String,
        name : String,
        subscription_target_config : Array(Types::SubscriptionTargetForm),
        type : String,
        client_token : String? = nil,
        provider : String? = nil,
        subscription_grant_creation_mode : String? = nil
      ) : Protocol::Request
        input = Types::CreateSubscriptionTargetInput.new(applicable_asset_types: applicable_asset_types, authorized_principals: authorized_principals, domain_identifier: domain_identifier, environment_identifier: environment_identifier, manage_access_role: manage_access_role, name: name, subscription_target_config: subscription_target_config, type: type, client_token: client_token, provider: provider, subscription_grant_creation_mode: subscription_grant_creation_mode)
        create_subscription_target(input)
      end

      def create_subscription_target(input : Types::CreateSubscriptionTargetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SUBSCRIPTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user profile in Amazon DataZone.

      def create_user_profile(
        domain_identifier : String,
        user_identifier : String,
        client_token : String? = nil,
        user_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateUserProfileInput.new(domain_identifier: domain_identifier, user_identifier: user_identifier, client_token: client_token, user_type: user_type)
        create_user_profile(input)
      end

      def create_user_profile(input : Types::CreateUserProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an account pool.

      def delete_account_pool(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteAccountPoolInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_account_pool(input)
      end

      def delete_account_pool(input : Types::DeleteAccountPoolInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an asset in Amazon DataZone. --domain-identifier must refer to a valid and existing domain.
      # --identifier must refer to an existing asset in the specified domain. Asset must not be referenced
      # in any existing asset filters. Asset must not be linked to any draft or published data product. User
      # must have delete permissions for the domain and project.

      def delete_asset(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteAssetInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_asset(input)
      end

      def delete_asset(input : Types::DeleteAssetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an asset filter. Prerequisites: The asset filter must exist. The domain and asset must not
      # have been deleted. Ensure the --identifier refers to a valid filter ID.

      def delete_asset_filter(
        asset_identifier : String,
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteAssetFilterInput.new(asset_identifier: asset_identifier, domain_identifier: domain_identifier, identifier: identifier)
        delete_asset_filter(input)
      end

      def delete_asset_filter(input : Types::DeleteAssetFilterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an asset type in Amazon DataZone. Prerequisites: The asset type must exist in the domain.
      # You must have DeleteAssetType permission. The asset type must not be in use (e.g., assigned to any
      # asset). If used, deletion will fail. You should retrieve the asset type using get-asset-type to
      # confirm its presence before deletion.

      def delete_asset_type(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteAssetTypeInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_asset_type(input)
      end

      def delete_asset_type(input : Types::DeleteAssetTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ASSET_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes and connection. In Amazon DataZone, a connection enables you to connect your resources
      # (domains, projects, and environments) to external resources and services.

      def delete_connection(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteConnectionInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_connection(input)
      end

      def delete_connection(input : Types::DeleteConnectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a data product in Amazon DataZone. Prerequisites: The data product must exist and not be
      # deleted or archived. The user must have delete permissions for the data product. Domain and project
      # must be active.

      def delete_data_product(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteDataProductInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_data_product(input)
      end

      def delete_data_product(input : Types::DeleteDataProductInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a data source in Amazon DataZone.

      def delete_data_source(
        domain_identifier : String,
        identifier : String,
        client_token : String? = nil,
        retain_permissions_on_revoke_failure : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteDataSourceInput.new(domain_identifier: domain_identifier, identifier: identifier, client_token: client_token, retain_permissions_on_revoke_failure: retain_permissions_on_revoke_failure)
        delete_data_source(input)
      end

      def delete_data_source(input : Types::DeleteDataSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Amazon DataZone domain.

      def delete_domain(
        identifier : String,
        client_token : String? = nil,
        skip_deletion_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteDomainInput.new(identifier: identifier, client_token: client_token, skip_deletion_check: skip_deletion_check)
        delete_domain(input)
      end

      def delete_domain(input : Types::DeleteDomainInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a domain unit.

      def delete_domain_unit(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteDomainUnitInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_domain_unit(input)
      end

      def delete_domain_unit(input : Types::DeleteDomainUnitInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an environment in Amazon DataZone.

      def delete_environment(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an action for the environment, for example, deletes a console link for an analytics tool
      # that is available in this environment.

      def delete_environment_action(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentActionInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier)
        delete_environment_action(input)
      end

      def delete_environment_action(input : Types::DeleteEnvironmentActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a blueprint in Amazon DataZone.

      def delete_environment_blueprint(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentBlueprintInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_environment_blueprint(input)
      end

      def delete_environment_blueprint(input : Types::DeleteEnvironmentBlueprintInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the blueprint configuration in Amazon DataZone.

      def delete_environment_blueprint_configuration(
        domain_identifier : String,
        environment_blueprint_identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentBlueprintConfigurationInput.new(domain_identifier: domain_identifier, environment_blueprint_identifier: environment_blueprint_identifier)
        delete_environment_blueprint_configuration(input)
      end

      def delete_environment_blueprint_configuration(input : Types::DeleteEnvironmentBlueprintConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT_BLUEPRINT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an environment profile in Amazon DataZone.

      def delete_environment_profile(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentProfileInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_environment_profile(input)
      end

      def delete_environment_profile(input : Types::DeleteEnvironmentProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes and metadata form type in Amazon DataZone. Prerequisites: The form type must exist in the
      # domain. The form type must not be in use by any asset types or assets. The domain must be valid and
      # accessible. User must have delete permissions on the form type. Any dependencies (such as linked
      # asset types) must be removed first.

      def delete_form_type(
        domain_identifier : String,
        form_type_identifier : String
      ) : Protocol::Request
        input = Types::DeleteFormTypeInput.new(domain_identifier: domain_identifier, form_type_identifier: form_type_identifier)
        delete_form_type(input)
      end

      def delete_form_type(input : Types::DeleteFormTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FORM_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a business glossary in Amazon DataZone. Prerequisites: The glossary must be in DISABLED
      # state. The glossary must not have any glossary terms associated with it. The glossary must exist in
      # the specified domain. The caller must have the datazone:DeleteGlossary permission in the domain and
      # glossary. Glossary should not be linked to any active metadata forms.

      def delete_glossary(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteGlossaryInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_glossary(input)
      end

      def delete_glossary(input : Types::DeleteGlossaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GLOSSARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a business glossary term in Amazon DataZone. Prerequisites: Glossary term must exist and be
      # active. The term must not be linked to other assets or child terms. Caller must have delete
      # permissions in the domain/glossary. Ensure all associations (such as to assets or parent terms) are
      # removed before deletion.

      def delete_glossary_term(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteGlossaryTermInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_glossary_term(input)
      end

      def delete_glossary_term(input : Types::DeleteGlossaryTermInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GLOSSARY_TERM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a listing (a record of an asset at a given time).

      def delete_listing(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteListingInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_listing(input)
      end

      def delete_listing(input : Types::DeleteListingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LISTING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a project in Amazon DataZone.

      def delete_project(
        domain_identifier : String,
        identifier : String,
        skip_deletion_check : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteProjectInput.new(domain_identifier: domain_identifier, identifier: identifier, skip_deletion_check: skip_deletion_check)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes project membership in Amazon DataZone.

      def delete_project_membership(
        domain_identifier : String,
        member : Types::Member,
        project_identifier : String
      ) : Protocol::Request
        input = Types::DeleteProjectMembershipInput.new(domain_identifier: domain_identifier, member: member, project_identifier: project_identifier)
        delete_project_membership(input)
      end

      def delete_project_membership(input : Types::DeleteProjectMembershipInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a project profile.

      def delete_project_profile(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteProjectProfileInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_project_profile(input)
      end

      def delete_project_profile(input : Types::DeleteProjectProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a rule in Amazon DataZone. A rule is a formal agreement that enforces specific requirements
      # across user workflows (e.g., publishing assets to the catalog, requesting subscriptions, creating
      # projects) within the Amazon DataZone data portal. These rules help maintain consistency, ensure
      # compliance, and uphold governance standards in data management processes. For instance, a metadata
      # enforcement rule can specify the required information for creating a subscription request or
      # publishing a data asset to the catalog, ensuring alignment with organizational standards.

      def delete_rule(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteRuleInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_rule(input)
      end

      def delete_rule(input : Types::DeleteRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes and subscription grant in Amazon DataZone.

      def delete_subscription_grant(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteSubscriptionGrantInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_subscription_grant(input)
      end

      def delete_subscription_grant(input : Types::DeleteSubscriptionGrantInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIPTION_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a subscription request in Amazon DataZone.

      def delete_subscription_request(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteSubscriptionRequestInput.new(domain_identifier: domain_identifier, identifier: identifier)
        delete_subscription_request(input)
      end

      def delete_subscription_request(input : Types::DeleteSubscriptionRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIPTION_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a subscription target in Amazon DataZone.

      def delete_subscription_target(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteSubscriptionTargetInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier)
        delete_subscription_target(input)
      end

      def delete_subscription_target(input : Types::DeleteSubscriptionTargetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUBSCRIPTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified time series form for the specified asset.

      def delete_time_series_data_points(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        form_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteTimeSeriesDataPointsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, form_name: form_name, client_token: client_token)
        delete_time_series_data_points(input)
      end

      def delete_time_series_data_points(input : Types::DeleteTimeSeriesDataPointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TIME_SERIES_DATA_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the environment role in Amazon DataZone.

      def disassociate_environment_role(
        domain_identifier : String,
        environment_identifier : String,
        environment_role_arn : String
      ) : Protocol::Request
        input = Types::DisassociateEnvironmentRoleInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, environment_role_arn: environment_role_arn)
        disassociate_environment_role(input)
      end

      def disassociate_environment_role(input : Types::DisassociateEnvironmentRoleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ENVIRONMENT_ROLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates restricted terms from an asset.

      def disassociate_governed_terms(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        governed_glossary_terms : Array(String)
      ) : Protocol::Request
        input = Types::DisassociateGovernedTermsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, governed_glossary_terms: governed_glossary_terms)
        disassociate_governed_terms(input)
      end

      def disassociate_governed_terms(input : Types::DisassociateGovernedTermsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_GOVERNED_TERMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of the account pool.

      def get_account_pool(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetAccountPoolInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_account_pool(input)
      end

      def get_account_pool(input : Types::GetAccountPoolInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone asset. An asset is the fundamental building block in Amazon DataZone,
      # representing any data resource that needs to be cataloged and managed. It can take many forms, from
      # Amazon S3 buckets and database tables to dashboards and machine learning models. Each asset contains
      # comprehensive metadata about the resource, including its location, schema, ownership, and lineage
      # information. Assets are essential for organizing and managing data resources across an organization,
      # making them discoverable and usable while maintaining proper governance. Before using the Amazon
      # DataZone GetAsset command, ensure the following prerequisites are met: Domain identifier must exist
      # and be valid Asset identifier must exist User must have the required permissions to perform the
      # action

      def get_asset(
        domain_identifier : String,
        identifier : String,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::GetAssetInput.new(domain_identifier: domain_identifier, identifier: identifier, revision: revision)
        get_asset(input)
      end

      def get_asset(input : Types::GetAssetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an asset filter. Prerequisites: Domain ( --domain-identifier ), asset ( --asset-identifier ),
      # and filter ( --identifier ) must all exist. The asset filter should not have been deleted. The asset
      # must still exist (since the filter is linked to it).

      def get_asset_filter(
        asset_identifier : String,
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetAssetFilterInput.new(asset_identifier: asset_identifier, domain_identifier: domain_identifier, identifier: identifier)
        get_asset_filter(input)
      end

      def get_asset_filter(input : Types::GetAssetFilterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone asset type. Asset types define the categories and characteristics of
      # different kinds of data assets within Amazon DataZone.. They determine what metadata fields are
      # required, what operations are possible, and how the asset integrates with other Amazon Web Services
      # services. Asset types can range from built-in types like Amazon S3 buckets and Amazon Web Services
      # Glue tables to custom types defined for specific organizational needs. Understanding asset types is
      # crucial for properly organizing and managing different kinds of data resources. Prerequisites: The
      # asset type with identifier must exist in the domain. ResourceNotFoundException. You must have the
      # GetAssetType permission. Ensure the domain-identifier value is correct and accessible.

      def get_asset_type(
        domain_identifier : String,
        identifier : String,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::GetAssetTypeInput.new(domain_identifier: domain_identifier, identifier: identifier, revision: revision)
        get_asset_type(input)
      end

      def get_asset_type(input : Types::GetAssetTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a connection. In Amazon DataZone, a connection enables you to connect your resources (domains,
      # projects, and environments) to external resources and services.

      def get_connection(
        domain_identifier : String,
        identifier : String,
        with_secret : Bool? = nil
      ) : Protocol::Request
        input = Types::GetConnectionInput.new(domain_identifier: domain_identifier, identifier: identifier, with_secret: with_secret)
        get_connection(input)
      end

      def get_connection(input : Types::GetConnectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets data export configuration details.

      def get_data_export_configuration(
        domain_identifier : String
      ) : Protocol::Request
        input = Types::GetDataExportConfigurationInput.new(domain_identifier: domain_identifier)
        get_data_export_configuration(input)
      end

      def get_data_export_configuration(input : Types::GetDataExportConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_EXPORT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the data product. Prerequisites: The data product ID must exist. The domain must be valid and
      # accessible. User must have read or discovery permissions for the data product.

      def get_data_product(
        domain_identifier : String,
        identifier : String,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::GetDataProductInput.new(domain_identifier: domain_identifier, identifier: identifier, revision: revision)
        get_data_product(input)
      end

      def get_data_product(input : Types::GetDataProductInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone data source.

      def get_data_source(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetDataSourceInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_data_source(input)
      end

      def get_data_source(input : Types::GetDataSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone data source run.

      def get_data_source_run(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetDataSourceRunInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_data_source_run(input)
      end

      def get_data_source_run(input : Types::GetDataSourceRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone domain.

      def get_domain(
        identifier : String
      ) : Protocol::Request
        input = Types::GetDomainInput.new(identifier: identifier)
        get_domain(input)
      end

      def get_domain(input : Types::GetDomainInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of the specified domain unit.

      def get_domain_unit(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetDomainUnitInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_domain_unit(input)
      end

      def get_domain_unit(input : Types::GetDomainUnitInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone environment.

      def get_environment(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the specified environment action.

      def get_environment_action(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentActionInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier)
        get_environment_action(input)
      end

      def get_environment_action(input : Types::GetEnvironmentActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon DataZone blueprint.

      def get_environment_blueprint(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentBlueprintInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_environment_blueprint(input)
      end

      def get_environment_blueprint(input : Types::GetEnvironmentBlueprintInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the blueprint configuration in Amazon DataZone.

      def get_environment_blueprint_configuration(
        domain_identifier : String,
        environment_blueprint_identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentBlueprintConfigurationInput.new(domain_identifier: domain_identifier, environment_blueprint_identifier: environment_blueprint_identifier)
        get_environment_blueprint_configuration(input)
      end

      def get_environment_blueprint_configuration(input : Types::GetEnvironmentBlueprintConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT_BLUEPRINT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the credentials of an environment in Amazon DataZone.

      def get_environment_credentials(
        domain_identifier : String,
        environment_identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentCredentialsInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier)
        get_environment_credentials(input)
      end

      def get_environment_credentials(input : Types::GetEnvironmentCredentialsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an evinronment profile in Amazon DataZone.

      def get_environment_profile(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentProfileInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_environment_profile(input)
      end

      def get_environment_profile(input : Types::GetEnvironmentProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a metadata form type in Amazon DataZone. Form types define the structure and validation rules
      # for collecting metadata about assets in Amazon DataZone. They act as templates that ensure
      # consistent metadata capture across similar types of assets, while allowing for customization to meet
      # specific organizational needs. Form types can include required fields, validation rules, and
      # dependencies, helping maintain high-quality metadata that makes data assets more discoverable and
      # usable. The form type with the specified identifier must exist in the given domain. The domain must
      # be valid and active. User must have permission on the form type. The form type should not be deleted
      # or in an invalid state. One use case for this API is to determine whether a form field is indexed
      # for search. A searchable field will be annotated with @amazon.datazone#searchable . By default,
      # searchable fields are indexed for semantic search, where related query terms will match the
      # attribute value even if they are not stemmed or keyword matches. If a field is indexed technical
      # identifier search, it will be annotated with @amazon.datazone#searchable(modes:["TECHNICAL"]) . If a
      # field is indexed for lexical search (supports stemmed and prefix matches but not semantic matches),
      # it will be annotated with @amazon.datazone#searchable(modes:["LEXICAL"]) . A field storing glossary
      # term IDs (which is filterable) will be annotated with @amazon.datazone#glossaryterm("${glossaryId}")
      # .

      def get_form_type(
        domain_identifier : String,
        form_type_identifier : String,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::GetFormTypeInput.new(domain_identifier: domain_identifier, form_type_identifier: form_type_identifier, revision: revision)
        get_form_type(input)
      end

      def get_form_type(input : Types::GetFormTypeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FORM_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a business glossary in Amazon DataZone. Prerequisites: The specified glossary ID must exist and
      # be associated with the given domain. The caller must have the datazone:GetGlossary permission on the
      # domain.

      def get_glossary(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetGlossaryInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_glossary(input)
      end

      def get_glossary(input : Types::GetGlossaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOSSARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a business glossary term in Amazon DataZone. Prerequisites: Glossary term with identifier must
      # exist in the domain. User must have permission on the glossary term. Domain must be accessible and
      # active.

      def get_glossary_term(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetGlossaryTermInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_glossary_term(input)
      end

      def get_glossary_term(input : Types::GetGlossaryTermInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOSSARY_TERM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a group profile in Amazon DataZone.

      def get_group_profile(
        domain_identifier : String,
        group_identifier : String
      ) : Protocol::Request
        input = Types::GetGroupProfileInput.new(domain_identifier: domain_identifier, group_identifier: group_identifier)
        get_group_profile(input)
      end

      def get_group_profile(input : Types::GetGroupProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GROUP_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the data portal URL for the specified Amazon DataZone domain.

      def get_iam_portal_login_url(
        domain_identifier : String
      ) : Protocol::Request
        input = Types::GetIamPortalLoginUrlInput.new(domain_identifier: domain_identifier)
        get_iam_portal_login_url(input)
      end

      def get_iam_portal_login_url(input : Types::GetIamPortalLoginUrlInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IAM_PORTAL_LOGIN_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The details of the job run.

      def get_job_run(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetJobRunInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_job_run(input)
      end

      def get_job_run(input : Types::GetJobRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the lineage event.

      def get_lineage_event(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetLineageEventInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_lineage_event(input)
      end

      def get_lineage_event(input : Types::GetLineageEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINEAGE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the data lineage node.

      def get_lineage_node(
        domain_identifier : String,
        identifier : String,
        event_timestamp : Time? = nil
      ) : Protocol::Request
        input = Types::GetLineageNodeInput.new(domain_identifier: domain_identifier, identifier: identifier, event_timestamp: event_timestamp)
        get_lineage_node(input)
      end

      def get_lineage_node(input : Types::GetLineageNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LINEAGE_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a listing (a record of an asset at a given time). If you specify a listing version, only
      # details that are specific to that version are returned.

      def get_listing(
        domain_identifier : String,
        identifier : String,
        listing_revision : String? = nil
      ) : Protocol::Request
        input = Types::GetListingInput.new(domain_identifier: domain_identifier, identifier: identifier, listing_revision: listing_revision)
        get_listing(input)
      end

      def get_listing(input : Types::GetListingInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LISTING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a metadata generation run in Amazon DataZone. Prerequisites: Valid domain and run identifier.
      # The metadata generation run must exist. User must have read access to the metadata run.

      def get_metadata_generation_run(
        domain_identifier : String,
        identifier : String,
        type : String? = nil
      ) : Protocol::Request
        input = Types::GetMetadataGenerationRunInput.new(domain_identifier: domain_identifier, identifier: identifier, type: type)
        get_metadata_generation_run(input)
      end

      def get_metadata_generation_run(input : Types::GetMetadataGenerationRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METADATA_GENERATION_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a project in Amazon DataZone.

      def get_project(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetProjectInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_project(input)
      end

      def get_project(input : Types::GetProjectInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The details of the project profile.

      def get_project_profile(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetProjectProfileInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_project_profile(input)
      end

      def get_project_profile(input : Types::GetProjectProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROJECT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a rule in Amazon DataZone. A rule is a formal agreement that enforces specific
      # requirements across user workflows (e.g., publishing assets to the catalog, requesting
      # subscriptions, creating projects) within the Amazon DataZone data portal. These rules help maintain
      # consistency, ensure compliance, and uphold governance standards in data management processes. For
      # instance, a metadata enforcement rule can specify the required information for creating a
      # subscription request or publishing a data asset to the catalog, ensuring alignment with
      # organizational standards.

      def get_rule(
        domain_identifier : String,
        identifier : String,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::GetRuleInput.new(domain_identifier: domain_identifier, identifier: identifier, revision: revision)
        get_rule(input)
      end

      def get_rule(input : Types::GetRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a subscription in Amazon DataZone.

      def get_subscription(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetSubscriptionInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_subscription(input)
      end

      def get_subscription(input : Types::GetSubscriptionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the subscription grant in Amazon DataZone.

      def get_subscription_grant(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetSubscriptionGrantInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_subscription_grant(input)
      end

      def get_subscription_grant(input : Types::GetSubscriptionGrantInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of the specified subscription request.

      def get_subscription_request_details(
        domain_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetSubscriptionRequestDetailsInput.new(domain_identifier: domain_identifier, identifier: identifier)
        get_subscription_request_details(input)
      end

      def get_subscription_request_details(input : Types::GetSubscriptionRequestDetailsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION_REQUEST_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the subscription target in Amazon DataZone.

      def get_subscription_target(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetSubscriptionTargetInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier)
        get_subscription_target(input)
      end

      def get_subscription_target(input : Types::GetSubscriptionTargetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBSCRIPTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the existing data point for the asset.

      def get_time_series_data_point(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        form_name : String,
        identifier : String
      ) : Protocol::Request
        input = Types::GetTimeSeriesDataPointInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, form_name: form_name, identifier: identifier)
        get_time_series_data_point(input)
      end

      def get_time_series_data_point(input : Types::GetTimeSeriesDataPointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TIME_SERIES_DATA_POINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a user profile in Amazon DataZone.

      def get_user_profile(
        domain_identifier : String,
        user_identifier : String,
        type : String? = nil
      ) : Protocol::Request
        input = Types::GetUserProfileInput.new(domain_identifier: domain_identifier, user_identifier: user_identifier, type: type)
        get_user_profile(input)
      end

      def get_user_profile(input : Types::GetUserProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USER_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists existing account pools.

      def list_account_pools(
        domain_identifier : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountPoolsInput.new(domain_identifier: domain_identifier, max_results: max_results, name: name, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_account_pools(input)
      end

      def list_account_pools(input : Types::ListAccountPoolsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNT_POOLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the accounts in the specified account pool.

      def list_accounts_in_account_pool(
        domain_identifier : String,
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccountsInAccountPoolInput.new(domain_identifier: domain_identifier, identifier: identifier, max_results: max_results, next_token: next_token)
        list_accounts_in_account_pool(input)
      end

      def list_accounts_in_account_pool(input : Types::ListAccountsInAccountPoolInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCOUNTS_IN_ACCOUNT_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists asset filters. Prerequisites: A valid domain and asset must exist. The asset must have at
      # least one filter created to return results.

      def list_asset_filters(
        asset_identifier : String,
        domain_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetFiltersInput.new(asset_identifier: asset_identifier, domain_identifier: domain_identifier, max_results: max_results, next_token: next_token, status: status)
        list_asset_filters(input)
      end

      def list_asset_filters(input : Types::ListAssetFiltersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_FILTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the revisions for the asset. Prerequisites: The asset must exist in the domain. There must be
      # at least one revision of the asset (which happens automatically after creation). The domain must be
      # valid and active. User must have permissions on the asset and domain.

      def list_asset_revisions(
        domain_identifier : String,
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetRevisionsInput.new(domain_identifier: domain_identifier, identifier: identifier, max_results: max_results, next_token: next_token)
        list_asset_revisions(input)
      end

      def list_asset_revisions(input : Types::ListAssetRevisionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_REVISIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists connections. In Amazon DataZone, a connection enables you to connect your resources (domains,
      # projects, and environments) to external resources and services.

      def list_connections(
        domain_identifier : String,
        environment_identifier : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        project_identifier : String? = nil,
        scope : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectionsInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, max_results: max_results, name: name, next_token: next_token, project_identifier: project_identifier, scope: scope, sort_by: sort_by, sort_order: sort_order, type: type)
        list_connections(input)
      end

      def list_connections(input : Types::ListConnectionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data product revisions. Prerequisites: The data product ID must exist within the domain. User
      # must have view permissions on the data product. The domain must be in a valid and accessible state.

      def list_data_product_revisions(
        domain_identifier : String,
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataProductRevisionsInput.new(domain_identifier: domain_identifier, identifier: identifier, max_results: max_results, next_token: next_token)
        list_data_product_revisions(input)
      end

      def list_data_product_revisions(input : Types::ListDataProductRevisionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_PRODUCT_REVISIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data source run activities.

      def list_data_source_run_activities(
        domain_identifier : String,
        identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourceRunActivitiesInput.new(domain_identifier: domain_identifier, identifier: identifier, max_results: max_results, next_token: next_token, status: status)
        list_data_source_run_activities(input)
      end

      def list_data_source_run_activities(input : Types::ListDataSourceRunActivitiesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCE_RUN_ACTIVITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data source runs in Amazon DataZone.

      def list_data_source_runs(
        data_source_identifier : String,
        domain_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourceRunsInput.new(data_source_identifier: data_source_identifier, domain_identifier: domain_identifier, max_results: max_results, next_token: next_token, status: status)
        list_data_source_runs(input)
      end

      def list_data_source_runs(input : Types::ListDataSourceRunsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCE_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data sources in Amazon DataZone.

      def list_data_sources(
        domain_identifier : String,
        project_identifier : String,
        connection_identifier : String? = nil,
        environment_identifier : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        status : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourcesInput.new(domain_identifier: domain_identifier, project_identifier: project_identifier, connection_identifier: connection_identifier, environment_identifier: environment_identifier, max_results: max_results, name: name, next_token: next_token, status: status, type: type)
        list_data_sources(input)
      end

      def list_data_sources(input : Types::ListDataSourcesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists child domain units for the specified parent domain unit.

      def list_domain_units_for_parent(
        domain_identifier : String,
        parent_domain_unit_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainUnitsForParentInput.new(domain_identifier: domain_identifier, parent_domain_unit_identifier: parent_domain_unit_identifier, max_results: max_results, next_token: next_token)
        list_domain_units_for_parent(input)
      end

      def list_domain_units_for_parent(input : Types::ListDomainUnitsForParentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_UNITS_FOR_PARENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon DataZone domains.

      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainsInput.new(max_results: max_results, next_token: next_token, status: status)
        list_domains(input)
      end

      def list_domains(input : Types::ListDomainsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the entity (domain units) owners.

      def list_entity_owners(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEntityOwnersInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, max_results: max_results, next_token: next_token)
        list_entity_owners(input)
      end

      def list_entity_owners(input : Types::ListEntityOwnersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITY_OWNERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists existing environment actions.

      def list_environment_actions(
        domain_identifier : String,
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentActionsInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, max_results: max_results, next_token: next_token)
        list_environment_actions(input)
      end

      def list_environment_actions(input : Types::ListEnvironmentActionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENT_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists blueprint configurations for a Amazon DataZone environment.

      def list_environment_blueprint_configurations(
        domain_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentBlueprintConfigurationsInput.new(domain_identifier: domain_identifier, max_results: max_results, next_token: next_token)
        list_environment_blueprint_configurations(input)
      end

      def list_environment_blueprint_configurations(input : Types::ListEnvironmentBlueprintConfigurationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENT_BLUEPRINT_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists blueprints in an Amazon DataZone environment.

      def list_environment_blueprints(
        domain_identifier : String,
        managed : Bool? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentBlueprintsInput.new(domain_identifier: domain_identifier, managed: managed, max_results: max_results, name: name, next_token: next_token)
        list_environment_blueprints(input)
      end

      def list_environment_blueprints(input : Types::ListEnvironmentBlueprintsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENT_BLUEPRINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon DataZone environment profiles.

      def list_environment_profiles(
        domain_identifier : String,
        aws_account_id : String? = nil,
        aws_account_region : String? = nil,
        environment_blueprint_identifier : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        project_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentProfilesInput.new(domain_identifier: domain_identifier, aws_account_id: aws_account_id, aws_account_region: aws_account_region, environment_blueprint_identifier: environment_blueprint_identifier, max_results: max_results, name: name, next_token: next_token, project_identifier: project_identifier)
        list_environment_profiles(input)
      end

      def list_environment_profiles(input : Types::ListEnvironmentProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENT_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon DataZone environments.

      def list_environments(
        domain_identifier : String,
        project_identifier : String,
        aws_account_id : String? = nil,
        aws_account_region : String? = nil,
        environment_blueprint_identifier : String? = nil,
        environment_profile_identifier : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        provider : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsInput.new(domain_identifier: domain_identifier, project_identifier: project_identifier, aws_account_id: aws_account_id, aws_account_region: aws_account_region, environment_blueprint_identifier: environment_blueprint_identifier, environment_profile_identifier: environment_profile_identifier, max_results: max_results, name: name, next_token: next_token, provider: provider, status: status)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists job runs.

      def list_job_runs(
        domain_identifier : String,
        job_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListJobRunsInput.new(domain_identifier: domain_identifier, job_identifier: job_identifier, max_results: max_results, next_token: next_token, sort_order: sort_order, status: status)
        list_job_runs(input)
      end

      def list_job_runs(input : Types::ListJobRunsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists lineage events.

      def list_lineage_events(
        domain_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        processing_status : String? = nil,
        sort_order : String? = nil,
        timestamp_after : Time? = nil,
        timestamp_before : Time? = nil
      ) : Protocol::Request
        input = Types::ListLineageEventsInput.new(domain_identifier: domain_identifier, max_results: max_results, next_token: next_token, processing_status: processing_status, sort_order: sort_order, timestamp_after: timestamp_after, timestamp_before: timestamp_before)
        list_lineage_events(input)
      end

      def list_lineage_events(input : Types::ListLineageEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINEAGE_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the history of the specified data lineage node.

      def list_lineage_node_history(
        domain_identifier : String,
        identifier : String,
        direction : String? = nil,
        event_timestamp_gte : Time? = nil,
        event_timestamp_lte : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListLineageNodeHistoryInput.new(domain_identifier: domain_identifier, identifier: identifier, direction: direction, event_timestamp_gte: event_timestamp_gte, event_timestamp_lte: event_timestamp_lte, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_lineage_node_history(input)
      end

      def list_lineage_node_history(input : Types::ListLineageNodeHistoryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LINEAGE_NODE_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all metadata generation runs. Metadata generation runs represent automated processes that
      # leverage AI/ML capabilities to create or enhance asset metadata at scale. This feature helps
      # organizations maintain comprehensive and consistent metadata across large numbers of assets without
      # manual intervention. It can automatically generate business descriptions, tags, and other metadata
      # elements, significantly reducing the time and effort required for metadata management while
      # improving consistency and completeness. Prerequisites: Valid domain identifier. User must have
      # access to metadata generation runs in the domain.

      def list_metadata_generation_runs(
        domain_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        target_identifier : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListMetadataGenerationRunsInput.new(domain_identifier: domain_identifier, max_results: max_results, next_token: next_token, status: status, target_identifier: target_identifier, type: type)
        list_metadata_generation_runs(input)
      end

      def list_metadata_generation_runs(input : Types::ListMetadataGenerationRunsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_METADATA_GENERATION_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Amazon DataZone notifications.

      def list_notifications(
        domain_identifier : String,
        type : String,
        after_timestamp : Time? = nil,
        before_timestamp : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        subjects : Array(String)? = nil,
        task_status : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationsInput.new(domain_identifier: domain_identifier, type: type, after_timestamp: after_timestamp, before_timestamp: before_timestamp, max_results: max_results, next_token: next_token, subjects: subjects, task_status: task_status)
        list_notifications(input)
      end

      def list_notifications(input : Types::ListNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists policy grants.

      def list_policy_grants(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        policy_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyGrantsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, policy_type: policy_type, max_results: max_results, next_token: next_token)
        list_policy_grants(input)
      end

      def list_policy_grants(input : Types::ListPolicyGrantsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_GRANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all members of the specified project.

      def list_project_memberships(
        domain_identifier : String,
        project_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectMembershipsInput.new(domain_identifier: domain_identifier, project_identifier: project_identifier, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_project_memberships(input)
      end

      def list_project_memberships(input : Types::ListProjectMembershipsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECT_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists project profiles.

      def list_project_profiles(
        domain_identifier : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectProfilesInput.new(domain_identifier: domain_identifier, max_results: max_results, name: name, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_project_profiles(input)
      end

      def list_project_profiles(input : Types::ListProjectProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECT_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon DataZone projects.

      def list_projects(
        domain_identifier : String,
        group_identifier : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        user_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectsInput.new(domain_identifier: domain_identifier, group_identifier: group_identifier, max_results: max_results, name: name, next_token: next_token, user_identifier: user_identifier)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists existing rules. In Amazon DataZone, a rule is a formal agreement that enforces specific
      # requirements across user workflows (e.g., publishing assets to the catalog, requesting
      # subscriptions, creating projects) within the Amazon DataZone data portal. These rules help maintain
      # consistency, ensure compliance, and uphold governance standards in data management processes. For
      # instance, a metadata enforcement rule can specify the required information for creating a
      # subscription request or publishing a data asset to the catalog, ensuring alignment with
      # organizational standards.

      def list_rules(
        domain_identifier : String,
        target_identifier : String,
        target_type : String,
        action : String? = nil,
        asset_types : Array(String)? = nil,
        data_product : Bool? = nil,
        include_cascaded : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_ids : Array(String)? = nil,
        rule_type : String? = nil
      ) : Protocol::Request
        input = Types::ListRulesInput.new(domain_identifier: domain_identifier, target_identifier: target_identifier, target_type: target_type, action: action, asset_types: asset_types, data_product: data_product, include_cascaded: include_cascaded, max_results: max_results, next_token: next_token, project_ids: project_ids, rule_type: rule_type)
        list_rules(input)
      end

      def list_rules(input : Types::ListRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists subscription grants.

      def list_subscription_grants(
        domain_identifier : String,
        environment_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owning_group_id : String? = nil,
        owning_iam_principal_arn : String? = nil,
        owning_project_id : String? = nil,
        owning_user_id : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        subscribed_listing_id : String? = nil,
        subscription_id : String? = nil,
        subscription_target_id : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionGrantsInput.new(domain_identifier: domain_identifier, environment_id: environment_id, max_results: max_results, next_token: next_token, owning_group_id: owning_group_id, owning_iam_principal_arn: owning_iam_principal_arn, owning_project_id: owning_project_id, owning_user_id: owning_user_id, sort_by: sort_by, sort_order: sort_order, subscribed_listing_id: subscribed_listing_id, subscription_id: subscription_id, subscription_target_id: subscription_target_id)
        list_subscription_grants(input)
      end

      def list_subscription_grants(input : Types::ListSubscriptionGrantsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTION_GRANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon DataZone subscription requests.

      def list_subscription_requests(
        domain_identifier : String,
        approver_project_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owning_group_id : String? = nil,
        owning_iam_principal_arn : String? = nil,
        owning_project_id : String? = nil,
        owning_user_id : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : String? = nil,
        subscribed_listing_id : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionRequestsInput.new(domain_identifier: domain_identifier, approver_project_id: approver_project_id, max_results: max_results, next_token: next_token, owning_group_id: owning_group_id, owning_iam_principal_arn: owning_iam_principal_arn, owning_project_id: owning_project_id, owning_user_id: owning_user_id, sort_by: sort_by, sort_order: sort_order, status: status, subscribed_listing_id: subscribed_listing_id)
        list_subscription_requests(input)
      end

      def list_subscription_requests(input : Types::ListSubscriptionRequestsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTION_REQUESTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists subscription targets in Amazon DataZone.

      def list_subscription_targets(
        domain_identifier : String,
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionTargetsInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_subscription_targets(input)
      end

      def list_subscription_targets(input : Types::ListSubscriptionTargetsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTION_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists subscriptions in Amazon DataZone.

      def list_subscriptions(
        domain_identifier : String,
        approver_project_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owning_group_id : String? = nil,
        owning_iam_principal_arn : String? = nil,
        owning_project_id : String? = nil,
        owning_user_id : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : String? = nil,
        subscribed_listing_id : String? = nil,
        subscription_request_identifier : String? = nil
      ) : Protocol::Request
        input = Types::ListSubscriptionsInput.new(domain_identifier: domain_identifier, approver_project_id: approver_project_id, max_results: max_results, next_token: next_token, owning_group_id: owning_group_id, owning_iam_principal_arn: owning_iam_principal_arn, owning_project_id: owning_project_id, owning_user_id: owning_user_id, sort_by: sort_by, sort_order: sort_order, status: status, subscribed_listing_id: subscribed_listing_id, subscription_request_identifier: subscription_request_identifier)
        list_subscriptions(input)
      end

      def list_subscriptions(input : Types::ListSubscriptionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags for the specified resource in Amazon DataZone.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists time series data points.

      def list_time_series_data_points(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        form_name : String,
        ended_at : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        started_at : Time? = nil
      ) : Protocol::Request
        input = Types::ListTimeSeriesDataPointsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, form_name: form_name, ended_at: ended_at, max_results: max_results, next_token: next_token, started_at: started_at)
        list_time_series_data_points(input)
      end

      def list_time_series_data_points(input : Types::ListTimeSeriesDataPointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TIME_SERIES_DATA_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Posts a data lineage event.

      def post_lineage_event(
        domain_identifier : String,
        event : Bytes,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PostLineageEventInput.new(domain_identifier: domain_identifier, event: event, client_token: client_token)
        post_lineage_event(input)
      end

      def post_lineage_event(input : Types::PostLineageEventInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_LINEAGE_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Posts time series data points to Amazon DataZone for the specified asset.

      def post_time_series_data_points(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        forms : Array(Types::TimeSeriesDataPointFormInput),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PostTimeSeriesDataPointsInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, forms: forms, client_token: client_token)
        post_time_series_data_points(input)
      end

      def post_time_series_data_points(input : Types::PostTimeSeriesDataPointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::POST_TIME_SERIES_DATA_POINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates data export configuration details. In the current release, you can enable exporting asset
      # metadata only for one domain per Amazon Web Services account per region. If you disable exporting
      # asset metadata feature for a domain where it's already enabled, you cannot enable this feature for
      # another domain in the same Amazon Web Services account and region.

      def put_data_export_configuration(
        domain_identifier : String,
        enable_export : Bool,
        client_token : String? = nil,
        encryption_configuration : Types::EncryptionConfiguration? = nil
      ) : Protocol::Request
        input = Types::PutDataExportConfigurationInput.new(domain_identifier: domain_identifier, enable_export: enable_export, client_token: client_token, encryption_configuration: encryption_configuration)
        put_data_export_configuration(input)
      end

      def put_data_export_configuration(input : Types::PutDataExportConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DATA_EXPORT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Writes the configuration for the specified environment blueprint in Amazon DataZone.

      def put_environment_blueprint_configuration(
        domain_identifier : String,
        enabled_regions : Array(String),
        environment_blueprint_identifier : String,
        environment_role_permission_boundary : String? = nil,
        global_parameters : Hash(String, String)? = nil,
        manage_access_role_arn : String? = nil,
        provisioning_configurations : Array(Types::ProvisioningConfiguration)? = nil,
        provisioning_role_arn : String? = nil,
        regional_parameters : Hash(String, Hash(String, String))? = nil
      ) : Protocol::Request
        input = Types::PutEnvironmentBlueprintConfigurationInput.new(domain_identifier: domain_identifier, enabled_regions: enabled_regions, environment_blueprint_identifier: environment_blueprint_identifier, environment_role_permission_boundary: environment_role_permission_boundary, global_parameters: global_parameters, manage_access_role_arn: manage_access_role_arn, provisioning_configurations: provisioning_configurations, provisioning_role_arn: provisioning_role_arn, regional_parameters: regional_parameters)
        put_environment_blueprint_configuration(input)
      end

      def put_environment_blueprint_configuration(input : Types::PutEnvironmentBlueprintConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ENVIRONMENT_BLUEPRINT_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects automatically generated business-friendly metadata for your Amazon DataZone assets.

      def reject_predictions(
        domain_identifier : String,
        identifier : String,
        client_token : String? = nil,
        reject_choices : Array(Types::RejectChoice)? = nil,
        reject_rule : Types::RejectRule? = nil,
        revision : String? = nil
      ) : Protocol::Request
        input = Types::RejectPredictionsInput.new(domain_identifier: domain_identifier, identifier: identifier, client_token: client_token, reject_choices: reject_choices, reject_rule: reject_rule, revision: revision)
        reject_predictions(input)
      end

      def reject_predictions(input : Types::RejectPredictionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_PREDICTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects the specified subscription request.

      def reject_subscription_request(
        domain_identifier : String,
        identifier : String,
        decision_comment : String? = nil
      ) : Protocol::Request
        input = Types::RejectSubscriptionRequestInput.new(domain_identifier: domain_identifier, identifier: identifier, decision_comment: decision_comment)
        reject_subscription_request(input)
      end

      def reject_subscription_request(input : Types::RejectSubscriptionRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_SUBSCRIPTION_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an owner from an entity.

      def remove_entity_owner(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        owner : Types::OwnerProperties,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::RemoveEntityOwnerInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, owner: owner, client_token: client_token)
        remove_entity_owner(input)
      end

      def remove_entity_owner(input : Types::RemoveEntityOwnerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_ENTITY_OWNER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a policy grant.

      def remove_policy_grant(
        domain_identifier : String,
        entity_identifier : String,
        entity_type : String,
        policy_type : String,
        principal : Types::PolicyGrantPrincipal,
        client_token : String? = nil,
        grant_identifier : String? = nil
      ) : Protocol::Request
        input = Types::RemovePolicyGrantInput.new(domain_identifier: domain_identifier, entity_identifier: entity_identifier, entity_type: entity_type, policy_type: policy_type, principal: principal, client_token: client_token, grant_identifier: grant_identifier)
        remove_policy_grant(input)
      end

      def remove_policy_grant(input : Types::RemovePolicyGrantInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_POLICY_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Revokes a specified subscription in Amazon DataZone.

      def revoke_subscription(
        domain_identifier : String,
        identifier : String,
        retain_permissions : Bool? = nil
      ) : Protocol::Request
        input = Types::RevokeSubscriptionInput.new(domain_identifier: domain_identifier, identifier: identifier, retain_permissions: retain_permissions)
        revoke_subscription(input)
      end

      def revoke_subscription(input : Types::RevokeSubscriptionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REVOKE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for assets in Amazon DataZone. Search in Amazon DataZone is a powerful capability that
      # enables users to discover and explore data assets, glossary terms, and data products across their
      # organization. It provides both basic and advanced search functionality, allowing users to find
      # resources based on names, descriptions, metadata, and other attributes. Search can be scoped to
      # specific types of resources (like assets, glossary terms, or data products) and can be filtered
      # using various criteria such as creation date, owner, or status. The search functionality is
      # essential for making the wealth of data resources in an organization discoverable and usable,
      # helping users find the right data for their needs quickly and efficiently. Many search commands in
      # Amazon DataZone are paginated, including search and search-types . When the result set is large,
      # Amazon DataZone returns a nextToken in the response. This token can be used to retrieve the next
      # page of results. Prerequisites: The --domain-identifier must refer to an existing Amazon DataZone
      # domain. --search-scope must be one of: ASSET, GLOSSARY_TERM, DATA_PRODUCT, or GLOSSARY. The user
      # must have search permissions in the specified domain. If using --filters, ensure that the JSON is
      # well-formed and that each filter includes valid attribute and value keys. For paginated results, be
      # prepared to use --next-token to fetch additional pages. To run a standard free-text search, the
      # searchText parameter must be supplied. By default, all searchable fields are indexed for semantic
      # search and will return semantic matches for SearchListings queries. To prevent semantic search
      # indexing for a custom form attribute, see the CreateFormType API documentation . To run a lexical
      # search query, enclose the query with double quotes (""). This will disable semantic search even for
      # fields that have semantic search enabled and will only return results that contain the keywords
      # wrapped by double quotes (order of tokens in the query is not enforced). Free-text search is
      # supported for all attributes annotated with @amazon.datazone#searchable. To run a filtered search,
      # provide filter clause using the filters parameter. To filter on glossary terms, use the special
      # attribute __DataZoneGlossaryTerms . To filter on an indexed numeric attribute (i.e., a numeric
      # attribute annotated with @amazon.datazone#sortable ), provide a filter using the intValue parameter.
      # The filters parameter can also be used to run more advanced free-text searches that target specific
      # attributes (attributes must be annotated with @amazon.datazone#searchable for free-text search).
      # Create/update timestamp filtering is supported using the special creationTime / lastUpdatedTime
      # attributes. Filter types can be mixed and matched to power complex queries. To find out whether an
      # attribute has been annotated and indexed for a given search type, use the GetFormType API to
      # retrieve the form containing the attribute.

      def search(
        domain_identifier : String,
        search_scope : String,
        additional_attributes : Array(String)? = nil,
        filters : Types::FilterClause? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owning_project_identifier : String? = nil,
        search_in : Array(Types::SearchInItem)? = nil,
        search_text : String? = nil,
        sort : Types::SearchSort? = nil
      ) : Protocol::Request
        input = Types::SearchInput.new(domain_identifier: domain_identifier, search_scope: search_scope, additional_attributes: additional_attributes, filters: filters, max_results: max_results, next_token: next_token, owning_project_identifier: owning_project_identifier, search_in: search_in, search_text: search_text, sort: sort)
        search(input)
      end

      def search(input : Types::SearchInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches group profiles in Amazon DataZone.

      def search_group_profiles(
        domain_identifier : String,
        group_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_text : String? = nil
      ) : Protocol::Request
        input = Types::SearchGroupProfilesInput.new(domain_identifier: domain_identifier, group_type: group_type, max_results: max_results, next_token: next_token, search_text: search_text)
        search_group_profiles(input)
      end

      def search_group_profiles(input : Types::SearchGroupProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_GROUP_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches listings in Amazon DataZone. SearchListings is a powerful capability that enables users to
      # discover and explore published assets and data products across their organization. It provides both
      # basic and advanced search functionality, allowing users to find resources based on names,
      # descriptions, metadata, and other attributes. SearchListings also supports filtering using various
      # criteria such as creation date, owner, or status. This API is essential for making the wealth of
      # data resources in an organization discoverable and usable, helping users find the right data for
      # their needs quickly and efficiently. SearchListings returns results in a paginated format. When the
      # result set is large, the response will include a nextToken, which can be used to retrieve the next
      # page of results. The SearchListings API gives users flexibility in specifying what kind of search is
      # run. To run a standard free-text search, the searchText parameter must be supplied. By default, all
      # searchable fields are indexed for semantic search and will return semantic matches for
      # SearchListings queries. To prevent semantic search indexing for a custom form attribute, see the
      # CreateFormType API documentation . To run a lexical search query, enclose the query with double
      # quotes (""). This will disable semantic search even for fields that have semantic search enabled and
      # will only return results that contain the keywords wrapped by double quotes (order of tokens in the
      # query is not enforced). Free-text search is supported for all attributes annotated with
      # @amazon.datazone#searchable. To run a filtered search, provide filter clause using the filters
      # parameter. To filter on glossary terms, use the special attribute __DataZoneGlossaryTerms . To
      # filter on an indexed numeric attribute (i.e., a numeric attribute annotated with
      # @amazon.datazone#sortable ), provide a filter using the intValue parameter. The filters parameter
      # can also be used to run more advanced free-text searches that target specific attributes (attributes
      # must be annotated with @amazon.datazone#searchable for free-text search). Create/update timestamp
      # filtering is supported using the special creationTime / lastUpdatedTime attributes. Filter types can
      # be mixed and matched to power complex queries. To find out whether an attribute has been annotated
      # and indexed for a given search type, use the GetFormType API to retrieve the form containing the
      # attribute.

      def search_listings(
        domain_identifier : String,
        additional_attributes : Array(String)? = nil,
        aggregations : Array(Types::AggregationListItem)? = nil,
        filters : Types::FilterClause? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_in : Array(Types::SearchInItem)? = nil,
        search_text : String? = nil,
        sort : Types::SearchSort? = nil
      ) : Protocol::Request
        input = Types::SearchListingsInput.new(domain_identifier: domain_identifier, additional_attributes: additional_attributes, aggregations: aggregations, filters: filters, max_results: max_results, next_token: next_token, search_in: search_in, search_text: search_text, sort: sort)
        search_listings(input)
      end

      def search_listings(input : Types::SearchListingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_LISTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for types in Amazon DataZone. Prerequisites: The --domain-identifier must refer to an
      # existing Amazon DataZone domain. --search-scope must be one of the valid values including:
      # ASSET_TYPE, GLOSSARY_TERM_TYPE, DATA_PRODUCT_TYPE. The --managed flag must be present without a
      # value. The user must have permissions for form or asset types in the domain. If using --filters,
      # ensure that the JSON is valid. Filters contain correct structure (attribute, value, operator).

      def search_types(
        domain_identifier : String,
        managed : Bool,
        search_scope : String,
        filters : Types::FilterClause? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_in : Array(Types::SearchInItem)? = nil,
        search_text : String? = nil,
        sort : Types::SearchSort? = nil
      ) : Protocol::Request
        input = Types::SearchTypesInput.new(domain_identifier: domain_identifier, managed: managed, search_scope: search_scope, filters: filters, max_results: max_results, next_token: next_token, search_in: search_in, search_text: search_text, sort: sort)
        search_types(input)
      end

      def search_types(input : Types::SearchTypesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches user profiles in Amazon DataZone.

      def search_user_profiles(
        domain_identifier : String,
        user_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_text : String? = nil
      ) : Protocol::Request
        input = Types::SearchUserProfilesInput.new(domain_identifier: domain_identifier, user_type: user_type, max_results: max_results, next_token: next_token, search_text: search_text)
        search_user_profiles(input)
      end

      def search_user_profiles(input : Types::SearchUserProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_USER_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Start the run of the specified data source in Amazon DataZone.

      def start_data_source_run(
        data_source_identifier : String,
        domain_identifier : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartDataSourceRunInput.new(data_source_identifier: data_source_identifier, domain_identifier: domain_identifier, client_token: client_token)
        start_data_source_run(input)
      end

      def start_data_source_run(input : Types::StartDataSourceRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DATA_SOURCE_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the metadata generation run. Prerequisites: Asset must be created and belong to the specified
      # domain and project. Asset type must be supported for metadata generation (e.g., Amazon Web Services
      # Glue table). Asset must have a structured schema with valid rows and columns. Valid values for
      # --type: BUSINESS_DESCRIPTIONS, BUSINESS_NAMES, BUSINESS_GLOSSARY_ASSOCIATIONS. The user must have
      # permission to run metadata generation in the domain/project.

      def start_metadata_generation_run(
        domain_identifier : String,
        owning_project_identifier : String,
        target : Types::MetadataGenerationRunTarget,
        client_token : String? = nil,
        type : String? = nil,
        types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::StartMetadataGenerationRunInput.new(domain_identifier: domain_identifier, owning_project_identifier: owning_project_identifier, target: target, client_token: client_token, type: type, types: types)
        start_metadata_generation_run(input)
      end

      def start_metadata_generation_run(input : Types::StartMetadataGenerationRunInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_METADATA_GENERATION_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource in Amazon DataZone.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Untags a resource in Amazon DataZone.

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

      # Updates the account pool.

      def update_account_pool(
        domain_identifier : String,
        identifier : String,
        account_source : Types::AccountSource? = nil,
        description : String? = nil,
        name : String? = nil,
        resolution_strategy : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountPoolInput.new(domain_identifier: domain_identifier, identifier: identifier, account_source: account_source, description: description, name: name, resolution_strategy: resolution_strategy)
        update_account_pool(input)
      end

      def update_account_pool(input : Types::UpdateAccountPoolInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an asset filter. Prerequisites: The domain, asset, and asset filter identifier must all
      # exist. The asset must contain the columns being referenced in the update. If applying a row filter,
      # ensure the column referenced in the expression exists in the asset schema.

      def update_asset_filter(
        asset_identifier : String,
        domain_identifier : String,
        identifier : String,
        configuration : Types::AssetFilterConfiguration? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAssetFilterInput.new(asset_identifier: asset_identifier, domain_identifier: domain_identifier, identifier: identifier, configuration: configuration, description: description, name: name)
        update_asset_filter(input)
      end

      def update_asset_filter(input : Types::UpdateAssetFilterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ASSET_FILTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a connection. In Amazon DataZone, a connection enables you to connect your resources
      # (domains, projects, and environments) to external resources and services.

      def update_connection(
        domain_identifier : String,
        identifier : String,
        aws_location : Types::AwsLocation? = nil,
        description : String? = nil,
        props : Types::ConnectionPropertiesPatch? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectionInput.new(domain_identifier: domain_identifier, identifier: identifier, aws_location: aws_location, description: description, props: props)
        update_connection(input)
      end

      def update_connection(input : Types::UpdateConnectionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified data source in Amazon DataZone.

      def update_data_source(
        domain_identifier : String,
        identifier : String,
        asset_forms_input : Array(Types::FormInput)? = nil,
        configuration : Types::DataSourceConfigurationInput? = nil,
        description : String? = nil,
        enable_setting : String? = nil,
        name : String? = nil,
        publish_on_import : Bool? = nil,
        recommendation : Types::RecommendationConfiguration? = nil,
        retain_permissions_on_revoke_failure : Bool? = nil,
        schedule : Types::ScheduleConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceInput.new(domain_identifier: domain_identifier, identifier: identifier, asset_forms_input: asset_forms_input, configuration: configuration, description: description, enable_setting: enable_setting, name: name, publish_on_import: publish_on_import, recommendation: recommendation, retain_permissions_on_revoke_failure: retain_permissions_on_revoke_failure, schedule: schedule)
        update_data_source(input)
      end

      def update_data_source(input : Types::UpdateDataSourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Amazon DataZone domain.

      def update_domain(
        identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        domain_execution_role : String? = nil,
        name : String? = nil,
        service_role : String? = nil,
        single_sign_on : Types::SingleSignOn? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainInput.new(identifier: identifier, client_token: client_token, description: description, domain_execution_role: domain_execution_role, name: name, service_role: service_role, single_sign_on: single_sign_on)
        update_domain(input)
      end

      def update_domain(input : Types::UpdateDomainInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the domain unit.

      def update_domain_unit(
        domain_identifier : String,
        identifier : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainUnitInput.new(domain_identifier: domain_identifier, identifier: identifier, description: description, name: name)
        update_domain_unit(input)
      end

      def update_domain_unit(input : Types::UpdateDomainUnitInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_UNIT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified environment in Amazon DataZone.

      def update_environment(
        domain_identifier : String,
        identifier : String,
        blueprint_version : String? = nil,
        description : String? = nil,
        glossary_terms : Array(String)? = nil,
        name : String? = nil,
        user_parameters : Array(Types::EnvironmentParameter)? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentInput.new(domain_identifier: domain_identifier, identifier: identifier, blueprint_version: blueprint_version, description: description, glossary_terms: glossary_terms, name: name, user_parameters: user_parameters)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an environment action.

      def update_environment_action(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String,
        description : String? = nil,
        name : String? = nil,
        parameters : Types::ActionParameters? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentActionInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier, description: description, name: name, parameters: parameters)
        update_environment_action(input)
      end

      def update_environment_action(input : Types::UpdateEnvironmentActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an environment blueprint in Amazon DataZone.

      def update_environment_blueprint(
        domain_identifier : String,
        identifier : String,
        description : String? = nil,
        provisioning_properties : Types::ProvisioningProperties? = nil,
        user_parameters : Array(Types::CustomParameter)? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentBlueprintInput.new(domain_identifier: domain_identifier, identifier: identifier, description: description, provisioning_properties: provisioning_properties, user_parameters: user_parameters)
        update_environment_blueprint(input)
      end

      def update_environment_blueprint(input : Types::UpdateEnvironmentBlueprintInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT_BLUEPRINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified environment profile in Amazon DataZone.

      def update_environment_profile(
        domain_identifier : String,
        identifier : String,
        aws_account_id : String? = nil,
        aws_account_region : String? = nil,
        description : String? = nil,
        name : String? = nil,
        user_parameters : Array(Types::EnvironmentParameter)? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentProfileInput.new(domain_identifier: domain_identifier, identifier: identifier, aws_account_id: aws_account_id, aws_account_region: aws_account_region, description: description, name: name, user_parameters: user_parameters)
        update_environment_profile(input)
      end

      def update_environment_profile(input : Types::UpdateEnvironmentProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the business glossary in Amazon DataZone. Prerequisites: The glossary must exist in the
      # given domain. The caller must have the datazone:UpdateGlossary permission to update it. When
      # updating the name, the new name must be unique within the domain. The glossary must not be deleted
      # or in a terminal state.

      def update_glossary(
        domain_identifier : String,
        identifier : String,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGlossaryInput.new(domain_identifier: domain_identifier, identifier: identifier, client_token: client_token, description: description, name: name, status: status)
        update_glossary(input)
      end

      def update_glossary(input : Types::UpdateGlossaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOSSARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a business glossary term in Amazon DataZone. Prerequisites: Glossary term must exist in the
      # specified domain. New name must not conflict with existing terms in the same glossary. User must
      # have permissions on the term. The term must not be in DELETED status.

      def update_glossary_term(
        domain_identifier : String,
        identifier : String,
        glossary_identifier : String? = nil,
        long_description : String? = nil,
        name : String? = nil,
        short_description : String? = nil,
        status : String? = nil,
        term_relations : Types::TermRelations? = nil
      ) : Protocol::Request
        input = Types::UpdateGlossaryTermInput.new(domain_identifier: domain_identifier, identifier: identifier, glossary_identifier: glossary_identifier, long_description: long_description, name: name, short_description: short_description, status: status, term_relations: term_relations)
        update_glossary_term(input)
      end

      def update_glossary_term(input : Types::UpdateGlossaryTermInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOSSARY_TERM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified group profile in Amazon DataZone.

      def update_group_profile(
        domain_identifier : String,
        group_identifier : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateGroupProfileInput.new(domain_identifier: domain_identifier, group_identifier: group_identifier, status: status)
        update_group_profile(input)
      end

      def update_group_profile(input : Types::UpdateGroupProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified project in Amazon DataZone.

      def update_project(
        domain_identifier : String,
        identifier : String,
        description : String? = nil,
        domain_unit_id : String? = nil,
        environment_deployment_details : Types::EnvironmentDeploymentDetails? = nil,
        glossary_terms : Array(String)? = nil,
        name : String? = nil,
        project_profile_version : String? = nil,
        resource_tags : Hash(String, String)? = nil,
        user_parameters : Array(Types::EnvironmentConfigurationUserParameter)? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectInput.new(domain_identifier: domain_identifier, identifier: identifier, description: description, domain_unit_id: domain_unit_id, environment_deployment_details: environment_deployment_details, glossary_terms: glossary_terms, name: name, project_profile_version: project_profile_version, resource_tags: resource_tags, user_parameters: user_parameters)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a project profile.

      def update_project_profile(
        domain_identifier : String,
        identifier : String,
        allow_custom_project_resource_tags : Bool? = nil,
        description : String? = nil,
        domain_unit_identifier : String? = nil,
        environment_configurations : Array(Types::EnvironmentConfiguration)? = nil,
        name : String? = nil,
        project_resource_tags : Array(Types::ResourceTagParameter)? = nil,
        project_resource_tags_description : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectProfileInput.new(domain_identifier: domain_identifier, identifier: identifier, allow_custom_project_resource_tags: allow_custom_project_resource_tags, description: description, domain_unit_identifier: domain_unit_identifier, environment_configurations: environment_configurations, name: name, project_resource_tags: project_resource_tags, project_resource_tags_description: project_resource_tags_description, status: status)
        update_project_profile(input)
      end

      def update_project_profile(input : Types::UpdateProjectProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the owner of the root domain unit.

      def update_root_domain_unit_owner(
        current_owner : String,
        domain_identifier : String,
        new_owner : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRootDomainUnitOwnerInput.new(current_owner: current_owner, domain_identifier: domain_identifier, new_owner: new_owner, client_token: client_token)
        update_root_domain_unit_owner(input)
      end

      def update_root_domain_unit_owner(input : Types::UpdateRootDomainUnitOwnerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROOT_DOMAIN_UNIT_OWNER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a rule. In Amazon DataZone, a rule is a formal agreement that enforces specific requirements
      # across user workflows (e.g., publishing assets to the catalog, requesting subscriptions, creating
      # projects) within the Amazon DataZone data portal. These rules help maintain consistency, ensure
      # compliance, and uphold governance standards in data management processes. For instance, a metadata
      # enforcement rule can specify the required information for creating a subscription request or
      # publishing a data asset to the catalog, ensuring alignment with organizational standards.

      def update_rule(
        domain_identifier : String,
        identifier : String,
        description : String? = nil,
        detail : Types::RuleDetail? = nil,
        include_child_domain_units : Bool? = nil,
        name : String? = nil,
        scope : Types::RuleScope? = nil
      ) : Protocol::Request
        input = Types::UpdateRuleInput.new(domain_identifier: domain_identifier, identifier: identifier, description: description, detail: detail, include_child_domain_units: include_child_domain_units, name: name, scope: scope)
        update_rule(input)
      end

      def update_rule(input : Types::UpdateRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of the specified subscription grant status in Amazon DataZone.

      def update_subscription_grant_status(
        asset_identifier : String,
        domain_identifier : String,
        identifier : String,
        status : String,
        failure_cause : Types::FailureCause? = nil,
        target_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSubscriptionGrantStatusInput.new(asset_identifier: asset_identifier, domain_identifier: domain_identifier, identifier: identifier, status: status, failure_cause: failure_cause, target_name: target_name)
        update_subscription_grant_status(input)
      end

      def update_subscription_grant_status(input : Types::UpdateSubscriptionGrantStatusInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIPTION_GRANT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specified subscription request in Amazon DataZone.

      def update_subscription_request(
        domain_identifier : String,
        identifier : String,
        request_reason : String
      ) : Protocol::Request
        input = Types::UpdateSubscriptionRequestInput.new(domain_identifier: domain_identifier, identifier: identifier, request_reason: request_reason)
        update_subscription_request(input)
      end

      def update_subscription_request(input : Types::UpdateSubscriptionRequestInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIPTION_REQUEST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified subscription target in Amazon DataZone.

      def update_subscription_target(
        domain_identifier : String,
        environment_identifier : String,
        identifier : String,
        applicable_asset_types : Array(String)? = nil,
        authorized_principals : Array(String)? = nil,
        manage_access_role : String? = nil,
        name : String? = nil,
        provider : String? = nil,
        subscription_grant_creation_mode : String? = nil,
        subscription_target_config : Array(Types::SubscriptionTargetForm)? = nil
      ) : Protocol::Request
        input = Types::UpdateSubscriptionTargetInput.new(domain_identifier: domain_identifier, environment_identifier: environment_identifier, identifier: identifier, applicable_asset_types: applicable_asset_types, authorized_principals: authorized_principals, manage_access_role: manage_access_role, name: name, provider: provider, subscription_grant_creation_mode: subscription_grant_creation_mode, subscription_target_config: subscription_target_config)
        update_subscription_target(input)
      end

      def update_subscription_target(input : Types::UpdateSubscriptionTargetInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SUBSCRIPTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified user profile in Amazon DataZone.

      def update_user_profile(
        domain_identifier : String,
        status : String,
        user_identifier : String,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserProfileInput.new(domain_identifier: domain_identifier, status: status, user_identifier: user_identifier, type: type)
        update_user_profile(input)
      end

      def update_user_profile(input : Types::UpdateUserProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
