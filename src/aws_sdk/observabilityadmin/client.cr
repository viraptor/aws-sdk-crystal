module AwsSdk
  module ObservabilityAdmin
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

      # Creates a centralization rule that applies across an Amazon Web Services Organization. This
      # operation can only be called by the organization's management account or a delegated administrator
      # account.

      def create_centralization_rule_for_organization(
        rule : Types::CentralizationRule,
        rule_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCentralizationRuleForOrganizationInput.new(rule: rule, rule_name: rule_name, tags: tags)
        create_centralization_rule_for_organization(input)
      end

      def create_centralization_rule_for_organization(input : Types::CreateCentralizationRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CENTRALIZATION_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an integration between CloudWatch and S3 Tables for analytics. This integration enables
      # querying CloudWatch telemetry data using analytics engines like Amazon Athena, Amazon Redshift, and
      # Apache Spark.

      def create_s3_table_integration(
        encryption : Types::Encryption,
        role_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateS3TableIntegrationInput.new(encryption: encryption, role_arn: role_arn, tags: tags)
        create_s3_table_integration(input)
      end

      def create_s3_table_integration(input : Types::CreateS3TableIntegrationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_S3_TABLE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a telemetry pipeline for processing and transforming telemetry data. The pipeline defines
      # how data flows from sources through processors to destinations, enabling data transformation and
      # delivering capabilities.

      def create_telemetry_pipeline(
        configuration : Types::TelemetryPipelineConfiguration,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTelemetryPipelineInput.new(configuration: configuration, name: name, tags: tags)
        create_telemetry_pipeline(input)
      end

      def create_telemetry_pipeline(input : Types::CreateTelemetryPipelineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TELEMETRY_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a telemetry rule that defines how telemetry should be configured for Amazon Web Services
      # resources in your account. The rule specifies which resources should have telemetry enabled and how
      # that telemetry data should be collected based on resource type, telemetry type, and selection
      # criteria.

      def create_telemetry_rule(
        rule : Types::TelemetryRule,
        rule_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTelemetryRuleInput.new(rule: rule, rule_name: rule_name, tags: tags)
        create_telemetry_rule(input)
      end

      def create_telemetry_rule(input : Types::CreateTelemetryRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TELEMETRY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a telemetry rule that applies across an Amazon Web Services Organization. This operation can
      # only be called by the organization's management account or a delegated administrator account.

      def create_telemetry_rule_for_organization(
        rule : Types::TelemetryRule,
        rule_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTelemetryRuleForOrganizationInput.new(rule: rule, rule_name: rule_name, tags: tags)
        create_telemetry_rule_for_organization(input)
      end

      def create_telemetry_rule_for_organization(input : Types::CreateTelemetryRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TELEMETRY_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an organization-wide centralization rule. This operation can only be called by the
      # organization's management account or a delegated administrator account.

      def delete_centralization_rule_for_organization(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::DeleteCentralizationRuleForOrganizationInput.new(rule_identifier: rule_identifier)
        delete_centralization_rule_for_organization(input)
      end

      def delete_centralization_rule_for_organization(input : Types::DeleteCentralizationRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CENTRALIZATION_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an S3 Table integration and its associated data. This operation removes the connection
      # between CloudWatch Observability Admin and S3 Tables.

      def delete_s3_table_integration(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteS3TableIntegrationInput.new(arn: arn)
        delete_s3_table_integration(input)
      end

      def delete_s3_table_integration(input : Types::DeleteS3TableIntegrationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_S3_TABLE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a telemetry pipeline and its associated resources. This operation stops data processing and
      # removes the pipeline configuration.

      def delete_telemetry_pipeline(
        pipeline_identifier : String
      ) : Protocol::Request
        input = Types::DeleteTelemetryPipelineInput.new(pipeline_identifier: pipeline_identifier)
        delete_telemetry_pipeline(input)
      end

      def delete_telemetry_pipeline(input : Types::DeleteTelemetryPipelineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TELEMETRY_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a telemetry rule from your account. Any telemetry configurations previously created by the
      # rule will remain but no new resources will be configured by this rule.

      def delete_telemetry_rule(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::DeleteTelemetryRuleInput.new(rule_identifier: rule_identifier)
        delete_telemetry_rule(input)
      end

      def delete_telemetry_rule(input : Types::DeleteTelemetryRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TELEMETRY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an organization-wide telemetry rule. This operation can only be called by the organization's
      # management account or a delegated administrator account.

      def delete_telemetry_rule_for_organization(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::DeleteTelemetryRuleForOrganizationInput.new(rule_identifier: rule_identifier)
        delete_telemetry_rule_for_organization(input)
      end

      def delete_telemetry_rule_for_organization(input : Types::DeleteTelemetryRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TELEMETRY_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific organization centralization rule. This operation can only be
      # called by the organization's management account or a delegated administrator account.

      def get_centralization_rule_for_organization(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::GetCentralizationRuleForOrganizationInput.new(rule_identifier: rule_identifier)
        get_centralization_rule_for_organization(input)
      end

      def get_centralization_rule_for_organization(input : Types::GetCentralizationRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CENTRALIZATION_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific S3 Table integration, including its configuration, status,
      # and metadata.

      def get_s3_table_integration(
        arn : String
      ) : Protocol::Request
        input = Types::GetS3TableIntegrationInput.new(arn: arn)
        get_s3_table_integration(input)
      end

      def get_s3_table_integration(input : Types::GetS3TableIntegrationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_S3_TABLE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current status of the resource tags for telemetry feature, which enhances telemetry data
      # with additional resource metadata from Resource Explorer.


      def get_telemetry_enrichment_status : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_ENRICHMENT_STATUS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the current onboarding status of the telemetry config feature, including the status of the
      # feature and reason the feature failed to start or stop.


      def get_telemetry_evaluation_status : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_EVALUATION_STATUS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This returns the onboarding status of the telemetry configuration feature for the organization. It
      # can only be called by a Management Account of an Amazon Web Services Organization or an assigned
      # Delegated Admin Account of Amazon CloudWatch telemetry config.


      def get_telemetry_evaluation_status_for_organization : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_EVALUATION_STATUS_FOR_ORGANIZATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific telemetry pipeline, including its configuration, status, and
      # metadata.

      def get_telemetry_pipeline(
        pipeline_identifier : String
      ) : Protocol::Request
        input = Types::GetTelemetryPipelineInput.new(pipeline_identifier: pipeline_identifier)
        get_telemetry_pipeline(input)
      end

      def get_telemetry_pipeline(input : Types::GetTelemetryPipelineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific telemetry rule in your account.

      def get_telemetry_rule(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::GetTelemetryRuleInput.new(rule_identifier: rule_identifier)
        get_telemetry_rule(input)
      end

      def get_telemetry_rule(input : Types::GetTelemetryRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of a specific organization telemetry rule. This operation can only be called
      # by the organization's management account or a delegated administrator account.

      def get_telemetry_rule_for_organization(
        rule_identifier : String
      ) : Protocol::Request
        input = Types::GetTelemetryRuleForOrganizationInput.new(rule_identifier: rule_identifier)
        get_telemetry_rule_for_organization(input)
      end

      def get_telemetry_rule_for_organization(input : Types::GetTelemetryRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TELEMETRY_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all centralization rules in your organization. This operation can only be called by the
      # organization's management account or a delegated administrator account.

      def list_centralization_rules_for_organization(
        all_regions : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        rule_name_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListCentralizationRulesForOrganizationInput.new(all_regions: all_regions, max_results: max_results, next_token: next_token, rule_name_prefix: rule_name_prefix)
        list_centralization_rules_for_organization(input)
      end

      def list_centralization_rules_for_organization(input : Types::ListCentralizationRulesForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CENTRALIZATION_RULES_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of telemetry configurations for Amazon Web Services resources supported by telemetry
      # config. For more information, see Auditing CloudWatch telemetry configurations .

      def list_resource_telemetry(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier_prefix : String? = nil,
        resource_tags : Hash(String, String)? = nil,
        resource_types : Array(String)? = nil,
        telemetry_configuration_state : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ListResourceTelemetryInput.new(max_results: max_results, next_token: next_token, resource_identifier_prefix: resource_identifier_prefix, resource_tags: resource_tags, resource_types: resource_types, telemetry_configuration_state: telemetry_configuration_state)
        list_resource_telemetry(input)
      end

      def list_resource_telemetry(input : Types::ListResourceTelemetryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_TELEMETRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of telemetry configurations for Amazon Web Services resources supported by telemetry
      # config in the organization.

      def list_resource_telemetry_for_organization(
        account_identifiers : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_identifier_prefix : String? = nil,
        resource_tags : Hash(String, String)? = nil,
        resource_types : Array(String)? = nil,
        telemetry_configuration_state : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ListResourceTelemetryForOrganizationInput.new(account_identifiers: account_identifiers, max_results: max_results, next_token: next_token, resource_identifier_prefix: resource_identifier_prefix, resource_tags: resource_tags, resource_types: resource_types, telemetry_configuration_state: telemetry_configuration_state)
        list_resource_telemetry_for_organization(input)
      end

      def list_resource_telemetry_for_organization(input : Types::ListResourceTelemetryForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_TELEMETRY_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all S3 Table integrations in your account. We recommend using pagination to ensure that the
      # operation returns quickly and successfully.

      def list_s3_table_integrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListS3TableIntegrationsInput.new(max_results: max_results, next_token: next_token)
        list_s3_table_integrations(input)
      end

      def list_s3_table_integrations(input : Types::ListS3TableIntegrationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_S3_TABLE_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags attached to the specified resource. Supports telemetry rule resources and telemetry
      # pipeline resources.

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

      # Returns a list of telemetry pipelines in your account. Returns up to 100 results. If more than 100
      # telemetry pipelines exist, include the NextToken value from the response to retrieve the next set of
      # results.

      def list_telemetry_pipelines(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTelemetryPipelinesInput.new(max_results: max_results, next_token: next_token)
        list_telemetry_pipelines(input)
      end

      def list_telemetry_pipelines(input : Types::ListTelemetryPipelinesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TELEMETRY_PIPELINES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all telemetry rules in your account. You can filter the results by specifying a rule name
      # prefix.

      def list_telemetry_rules(
        max_results : Int32? = nil,
        next_token : String? = nil,
        rule_name_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListTelemetryRulesInput.new(max_results: max_results, next_token: next_token, rule_name_prefix: rule_name_prefix)
        list_telemetry_rules(input)
      end

      def list_telemetry_rules(input : Types::ListTelemetryRulesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TELEMETRY_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all telemetry rules in your organization. This operation can only be called by the
      # organization's management account or a delegated administrator account.

      def list_telemetry_rules_for_organization(
        max_results : Int32? = nil,
        next_token : String? = nil,
        rule_name_prefix : String? = nil,
        source_account_ids : Array(String)? = nil,
        source_organization_unit_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListTelemetryRulesForOrganizationInput.new(max_results: max_results, next_token: next_token, rule_name_prefix: rule_name_prefix, source_account_ids: source_account_ids, source_organization_unit_ids: source_organization_unit_ids)
        list_telemetry_rules_for_organization(input)
      end

      def list_telemetry_rules_for_organization(input : Types::ListTelemetryRulesForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TELEMETRY_RULES_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the resource tags for telemetry feature for your account, which enhances telemetry data with
      # additional resource metadata from Resource Explorer to provide richer context for monitoring and
      # observability.


      def start_telemetry_enrichment : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TELEMETRY_ENRICHMENT, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action begins onboarding the caller Amazon Web Services account to the telemetry config
      # feature.


      def start_telemetry_evaluation : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TELEMETRY_EVALUATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This actions begins onboarding the organization and all member accounts to the telemetry config
      # feature.


      def start_telemetry_evaluation_for_organization : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TELEMETRY_EVALUATION_FOR_ORGANIZATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the resource tags for telemetry feature for your account, stopping the enhancement of
      # telemetry data with additional resource metadata.


      def stop_telemetry_enrichment : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_TELEMETRY_ENRICHMENT, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action begins offboarding the caller Amazon Web Services account from the telemetry config
      # feature.


      def stop_telemetry_evaluation : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_TELEMETRY_EVALUATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action offboards the Organization of the caller Amazon Web Services account from the telemetry
      # config feature.


      def stop_telemetry_evaluation_for_organization : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_TELEMETRY_EVALUATION_FOR_ORGANIZATION, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates tags for a resource. Supports telemetry rule resources and telemetry pipeline
      # resources.

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

      # Tests a pipeline configuration with sample records to validate data processing before deployment.
      # This operation helps ensure your pipeline configuration works as expected.

      def test_telemetry_pipeline(
        configuration : Types::TelemetryPipelineConfiguration,
        records : Array(Types::Record)
      ) : Protocol::Request
        input = Types::TestTelemetryPipelineInput.new(configuration: configuration, records: records)
        test_telemetry_pipeline(input)
      end

      def test_telemetry_pipeline(input : Types::TestTelemetryPipelineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_TELEMETRY_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from a resource. Supports telemetry rule resources and telemetry pipeline resources.

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

      # Updates an existing centralization rule that applies across an Amazon Web Services Organization.
      # This operation can only be called by the organization's management account or a delegated
      # administrator account.

      def update_centralization_rule_for_organization(
        rule : Types::CentralizationRule,
        rule_identifier : String
      ) : Protocol::Request
        input = Types::UpdateCentralizationRuleForOrganizationInput.new(rule: rule, rule_identifier: rule_identifier)
        update_centralization_rule_for_organization(input)
      end

      def update_centralization_rule_for_organization(input : Types::UpdateCentralizationRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CENTRALIZATION_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of an existing telemetry pipeline. The following attributes cannot be
      # updated after pipeline creation: Pipeline name - The pipeline name is immutable Pipeline ARN - The
      # ARN is automatically generated and cannot be changed Source type - Once a pipeline is created with a
      # specific source type (such as S3, CloudWatch Logs, GitHub, or third-party sources), it cannot be
      # changed to a different source type Processors can be added, removed, or modified. However, some
      # processors are not supported for third-party pipelines and cannot be added through updates.
      # Source-Specific Update Rules CloudWatch Logs Sources (Vended and Custom) Updatable: sts_role_arn
      # Fixed: data_source_name , data_source_type , sink (must remain @original ) S3 Sources (Crowdstrike,
      # Zscaler, SentinelOne, Custom) Updatable: All SQS configuration parameters, sts_role_arn , codec
      # settings, compression type, bucket ownership settings, sink log group Fixed: notification_type ,
      # aws.region GitHub Audit Logs Updatable: All Amazon Web Services Secrets Manager attributes, scope
      # (can switch between ORGANIZATION/ENTERPRISE), organization or enterprise name, range ,
      # authentication credentials (PAT or GitHub App) Microsoft Sources (Entra ID, Office365, Windows)
      # Updatable: All Amazon Web Services Secrets Manager attributes, tenant_id , workspace_id (Windows
      # only), OAuth2 credentials ( client_id , client_secret ) Okta Sources (SSO, Auth0) Updatable: All
      # Amazon Web Services Secrets Manager attributes, domain , range (SSO only), OAuth2 credentials (
      # client_id , client_secret ) Palo Alto Networks Updatable: All Amazon Web Services Secrets Manager
      # attributes, hostname , basic authentication credentials ( username , password ) ServiceNow CMDB
      # Updatable: All Amazon Web Services Secrets Manager attributes, instance_url , range , OAuth2
      # credentials ( client_id , client_secret ) Wiz CNAPP Updatable: All Amazon Web Services Secrets
      # Manager attributes, region , range , OAuth2 credentials ( client_id , client_secret )

      def update_telemetry_pipeline(
        configuration : Types::TelemetryPipelineConfiguration,
        pipeline_identifier : String
      ) : Protocol::Request
        input = Types::UpdateTelemetryPipelineInput.new(configuration: configuration, pipeline_identifier: pipeline_identifier)
        update_telemetry_pipeline(input)
      end

      def update_telemetry_pipeline(input : Types::UpdateTelemetryPipelineInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TELEMETRY_PIPELINE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing telemetry rule in your account. If multiple users attempt to modify the same
      # telemetry rule simultaneously, a ConflictException is returned to provide specific error information
      # for concurrent modification scenarios.

      def update_telemetry_rule(
        rule : Types::TelemetryRule,
        rule_identifier : String
      ) : Protocol::Request
        input = Types::UpdateTelemetryRuleInput.new(rule: rule, rule_identifier: rule_identifier)
        update_telemetry_rule(input)
      end

      def update_telemetry_rule(input : Types::UpdateTelemetryRuleInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TELEMETRY_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing telemetry rule that applies across an Amazon Web Services Organization. This
      # operation can only be called by the organization's management account or a delegated administrator
      # account.

      def update_telemetry_rule_for_organization(
        rule : Types::TelemetryRule,
        rule_identifier : String
      ) : Protocol::Request
        input = Types::UpdateTelemetryRuleForOrganizationInput.new(rule: rule, rule_identifier: rule_identifier)
        update_telemetry_rule_for_organization(input)
      end

      def update_telemetry_rule_for_organization(input : Types::UpdateTelemetryRuleForOrganizationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TELEMETRY_RULE_FOR_ORGANIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Validates a pipeline configuration without creating the pipeline. This operation checks the
      # configuration for syntax errors and compatibility issues.

      def validate_telemetry_pipeline_configuration(
        configuration : Types::TelemetryPipelineConfiguration
      ) : Protocol::Request
        input = Types::ValidateTelemetryPipelineConfigurationInput.new(configuration: configuration)
        validate_telemetry_pipeline_configuration(input)
      end

      def validate_telemetry_pipeline_configuration(input : Types::ValidateTelemetryPipelineConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_TELEMETRY_PIPELINE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
