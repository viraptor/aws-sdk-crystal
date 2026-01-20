module AwsSdk
  module QuickSight
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

      # Creates new reviewed answers for a Q Topic.

      def batch_create_topic_reviewed_answer(
        answers : Array(Types::CreateTopicReviewedAnswer),
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::BatchCreateTopicReviewedAnswerRequest.new(answers: answers, aws_account_id: aws_account_id, topic_id: topic_id)
        batch_create_topic_reviewed_answer(input)
      end

      def batch_create_topic_reviewed_answer(input : Types::BatchCreateTopicReviewedAnswerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_TOPIC_REVIEWED_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes reviewed answers for Q Topic.

      def batch_delete_topic_reviewed_answer(
        aws_account_id : String,
        topic_id : String,
        answer_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::BatchDeleteTopicReviewedAnswerRequest.new(aws_account_id: aws_account_id, topic_id: topic_id, answer_ids: answer_ids)
        batch_delete_topic_reviewed_answer(input)
      end

      def batch_delete_topic_reviewed_answer(input : Types::BatchDeleteTopicReviewedAnswerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_TOPIC_REVIEWED_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an ongoing ingestion of data into SPICE.

      def cancel_ingestion(
        aws_account_id : String,
        data_set_id : String,
        ingestion_id : String
      ) : Protocol::Request
        input = Types::CancelIngestionRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, ingestion_id: ingestion_id)
        cancel_ingestion(input)
      end

      def cancel_ingestion(input : Types::CancelIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates Amazon Quick Sight customizations. Currently, you can add a custom default theme by using
      # the CreateAccountCustomization or UpdateAccountCustomization API operation. To further customize
      # Amazon Quick Sight by removing Amazon Quick Sight sample assets and videos for all new users, see
      # Customizing Quick Sight in the Amazon Quick Sight User Guide. You can create customizations for your
      # Amazon Web Services account or, if you specify a namespace, for a Quick Sight namespace instead.
      # Customizations that apply to a namespace always override customizations that apply to an Amazon Web
      # Services account. To find out which customizations apply, use the DescribeAccountCustomization API
      # operation. Before you use the CreateAccountCustomization API operation to add a theme as the
      # namespace default, make sure that you first share the theme with the namespace. If you don't share
      # it with the namespace, the theme isn't visible to your users even if you make it the default theme.
      # To check if the theme is shared, view the current permissions by using the DescribeThemePermissions
      # API operation. To share the theme, grant permissions by using the UpdateThemePermissions API
      # operation.

      def create_account_customization(
        account_customization : Types::AccountCustomization,
        aws_account_id : String,
        namespace : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateAccountCustomizationRequest.new(account_customization: account_customization, aws_account_id: aws_account_id, namespace: namespace, tags: tags)
        create_account_customization(input)
      end

      def create_account_customization(input : Types::CreateAccountCustomizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCOUNT_CUSTOMIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Quick Sight account, or subscribes to Amazon Quick Sight Q. The Amazon Web
      # Services Region for the account is derived from what is configured in the CLI or SDK. Before you use
      # this operation, make sure that you can connect to an existing Amazon Web Services account. If you
      # don't have an Amazon Web Services account, see Sign up for Amazon Web Services in the Amazon Quick
      # Sight User Guide . The person who signs up for Amazon Quick Sight needs to have the correct Identity
      # and Access Management (IAM) permissions. For more information, see IAM Policy Examples for Amazon
      # Quick Sight in the Amazon Quick Sight User Guide . If your IAM policy includes both the Subscribe
      # and CreateAccountSubscription actions, make sure that both actions are set to Allow . If either
      # action is set to Deny , the Deny action prevails and your API call fails. You can't pass an existing
      # IAM role to access other Amazon Web Services services using this API operation. To pass your
      # existing IAM role to Amazon Quick Sight, see Passing IAM roles to Amazon Quick Sight in the Amazon
      # Quick Sight User Guide . You can't set default resource access on the new account from the Amazon
      # Quick Sight API. Instead, add default resource access from the Amazon Quick Sight console. For more
      # information about setting default resource access to Amazon Web Services services, see Setting
      # default resource access to Amazon Web Services services in the Amazon Quick Sight User Guide .

      def create_account_subscription(
        account_name : String,
        authentication_method : String,
        aws_account_id : String,
        notification_email : String,
        active_directory_name : String? = nil,
        admin_group : Array(String)? = nil,
        admin_pro_group : Array(String)? = nil,
        author_group : Array(String)? = nil,
        author_pro_group : Array(String)? = nil,
        contact_number : String? = nil,
        directory_id : String? = nil,
        edition : String? = nil,
        email_address : String? = nil,
        first_name : String? = nil,
        iam_identity_center_instance_arn : String? = nil,
        last_name : String? = nil,
        reader_group : Array(String)? = nil,
        reader_pro_group : Array(String)? = nil,
        realm : String? = nil
      ) : Protocol::Request
        input = Types::CreateAccountSubscriptionRequest.new(account_name: account_name, authentication_method: authentication_method, aws_account_id: aws_account_id, notification_email: notification_email, active_directory_name: active_directory_name, admin_group: admin_group, admin_pro_group: admin_pro_group, author_group: author_group, author_pro_group: author_pro_group, contact_number: contact_number, directory_id: directory_id, edition: edition, email_address: email_address, first_name: first_name, iam_identity_center_instance_arn: iam_identity_center_instance_arn, last_name: last_name, reader_group: reader_group, reader_pro_group: reader_pro_group, realm: realm)
        create_account_subscription(input)
      end

      def create_account_subscription(input : Types::CreateAccountSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCOUNT_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an action connector that enables Amazon Quick Sight to connect to external services and
      # perform actions. Action connectors support various authentication methods and can be configured with
      # specific actions from supported connector types like Amazon S3, Salesforce, JIRA.

      def create_action_connector(
        action_connector_id : String,
        authentication_config : Types::AuthConfig,
        aws_account_id : String,
        name : String,
        type : String,
        description : String? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_connection_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateActionConnectorRequest.new(action_connector_id: action_connector_id, authentication_config: authentication_config, aws_account_id: aws_account_id, name: name, type: type, description: description, permissions: permissions, tags: tags, vpc_connection_arn: vpc_connection_arn)
        create_action_connector(input)
      end

      def create_action_connector(input : Types::CreateActionConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACTION_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an analysis in Amazon Quick Sight. Analyses can be created either from a template or from an
      # AnalysisDefinition .

      def create_analysis(
        analysis_id : String,
        aws_account_id : String,
        name : String,
        definition : Types::AnalysisDefinition? = nil,
        folder_arns : Array(String)? = nil,
        parameters : Types::Parameters? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        source_entity : Types::AnalysisSourceEntity? = nil,
        tags : Array(Types::Tag)? = nil,
        theme_arn : String? = nil,
        validation_strategy : Types::ValidationStrategy? = nil
      ) : Protocol::Request
        input = Types::CreateAnalysisRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id, name: name, definition: definition, folder_arns: folder_arns, parameters: parameters, permissions: permissions, source_entity: source_entity, tags: tags, theme_arn: theme_arn, validation_strategy: validation_strategy)
        create_analysis(input)
      end

      def create_analysis(input : Types::CreateAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Quick Sight brand.

      def create_brand(
        aws_account_id : String,
        brand_id : String,
        brand_definition : Types::BrandDefinition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateBrandRequest.new(aws_account_id: aws_account_id, brand_id: brand_id, brand_definition: brand_definition, tags: tags)
        create_brand(input)
      end

      def create_brand(input : Types::CreateBrandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BRAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom permissions profile.

      def create_custom_permissions(
        aws_account_id : String,
        custom_permissions_name : String,
        capabilities : Types::Capabilities? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomPermissionsRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name, capabilities: capabilities, tags: tags)
        create_custom_permissions(input)
      end

      def create_custom_permissions(input : Types::CreateCustomPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a dashboard from either a template or directly with a DashboardDefinition . To first create
      # a template, see the CreateTemplate API operation. A dashboard is an entity in Amazon Quick Sight
      # that identifies Amazon Quick Sight reports, created from analyses. You can share Amazon Quick Sight
      # dashboards. With the right permissions, you can create scheduled email reports from them. If you
      # have the correct permissions, you can create a dashboard from a template that exists in a different
      # Amazon Web Services account.

      def create_dashboard(
        aws_account_id : String,
        dashboard_id : String,
        name : String,
        dashboard_publish_options : Types::DashboardPublishOptions? = nil,
        definition : Types::DashboardVersionDefinition? = nil,
        folder_arns : Array(String)? = nil,
        link_entities : Array(String)? = nil,
        link_sharing_configuration : Types::LinkSharingConfiguration? = nil,
        parameters : Types::Parameters? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        source_entity : Types::DashboardSourceEntity? = nil,
        tags : Array(Types::Tag)? = nil,
        theme_arn : String? = nil,
        validation_strategy : Types::ValidationStrategy? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateDashboardRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, name: name, dashboard_publish_options: dashboard_publish_options, definition: definition, folder_arns: folder_arns, link_entities: link_entities, link_sharing_configuration: link_sharing_configuration, parameters: parameters, permissions: permissions, source_entity: source_entity, tags: tags, theme_arn: theme_arn, validation_strategy: validation_strategy, version_description: version_description)
        create_dashboard(input)
      end

      def create_dashboard(input : Types::CreateDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a dataset. This operation doesn't support datasets that include uploaded files as a source.

      def create_data_set(
        aws_account_id : String,
        data_set_id : String,
        import_mode : String,
        name : String,
        physical_table_map : Hash(String, Types::PhysicalTable),
        column_groups : Array(Types::ColumnGroup)? = nil,
        column_level_permission_rules : Array(Types::ColumnLevelPermissionRule)? = nil,
        data_prep_configuration : Types::DataPrepConfiguration? = nil,
        data_set_usage_configuration : Types::DataSetUsageConfiguration? = nil,
        dataset_parameters : Array(Types::DatasetParameter)? = nil,
        field_folders : Hash(String, Types::FieldFolder)? = nil,
        folder_arns : Array(String)? = nil,
        logical_table_map : Hash(String, Types::LogicalTable)? = nil,
        performance_configuration : Types::PerformanceConfiguration? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        row_level_permission_data_set : Types::RowLevelPermissionDataSet? = nil,
        row_level_permission_tag_configuration : Types::RowLevelPermissionTagConfiguration? = nil,
        semantic_model_configuration : Types::SemanticModelConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        use_as : String? = nil
      ) : Protocol::Request
        input = Types::CreateDataSetRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, import_mode: import_mode, name: name, physical_table_map: physical_table_map, column_groups: column_groups, column_level_permission_rules: column_level_permission_rules, data_prep_configuration: data_prep_configuration, data_set_usage_configuration: data_set_usage_configuration, dataset_parameters: dataset_parameters, field_folders: field_folders, folder_arns: folder_arns, logical_table_map: logical_table_map, performance_configuration: performance_configuration, permissions: permissions, row_level_permission_data_set: row_level_permission_data_set, row_level_permission_tag_configuration: row_level_permission_tag_configuration, semantic_model_configuration: semantic_model_configuration, tags: tags, use_as: use_as)
        create_data_set(input)
      end

      def create_data_set(input : Types::CreateDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a data source.

      def create_data_source(
        aws_account_id : String,
        data_source_id : String,
        name : String,
        type : String,
        credentials : Types::DataSourceCredentials? = nil,
        data_source_parameters : Types::DataSourceParameters? = nil,
        folder_arns : Array(String)? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        ssl_properties : Types::SslProperties? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_connection_properties : Types::VpcConnectionProperties? = nil
      ) : Protocol::Request
        input = Types::CreateDataSourceRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id, name: name, type: type, credentials: credentials, data_source_parameters: data_source_parameters, folder_arns: folder_arns, permissions: permissions, ssl_properties: ssl_properties, tags: tags, vpc_connection_properties: vpc_connection_properties)
        create_data_source(input)
      end

      def create_data_source(input : Types::CreateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an empty shared folder.

      def create_folder(
        aws_account_id : String,
        folder_id : String,
        folder_type : String? = nil,
        name : String? = nil,
        parent_folder_arn : String? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        sharing_model : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateFolderRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, folder_type: folder_type, name: name, parent_folder_arn: parent_folder_arn, permissions: permissions, sharing_model: sharing_model, tags: tags)
        create_folder(input)
      end

      def create_folder(input : Types::CreateFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an asset, such as a dashboard, analysis, or dataset into a folder.

      def create_folder_membership(
        aws_account_id : String,
        folder_id : String,
        member_id : String,
        member_type : String
      ) : Protocol::Request
        input = Types::CreateFolderMembershipRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, member_id: member_id, member_type: member_type)
        create_folder_membership(input)
      end

      def create_folder_membership(input : Types::CreateFolderMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FOLDER_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the CreateGroup operation to create a group in Quick Sight. You can create up to 10,000 groups
      # in a namespace. If you want to create more than 10,000 groups in a namespace, contact Amazon Web
      # Services Support. The permissions resource is arn:aws:quicksight:&lt;your-region&gt;:
      # &lt;relevant-aws-account-id&gt; :group/default/ &lt;group-name&gt; . The response is a group object.

      def create_group(
        aws_account_id : String,
        group_name : String,
        namespace : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateGroupRequest.new(aws_account_id: aws_account_id, group_name: group_name, namespace: namespace, description: description)
        create_group(input)
      end

      def create_group(input : Types::CreateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an Amazon Quick Sight user to an Amazon Quick Sight group.

      def create_group_membership(
        aws_account_id : String,
        group_name : String,
        member_name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::CreateGroupMembershipRequest.new(aws_account_id: aws_account_id, group_name: group_name, member_name: member_name, namespace: namespace)
        create_group_membership(input)
      end

      def create_group_membership(input : Types::CreateGroupMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GROUP_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an assignment with one specified IAM policy, identified by its Amazon Resource Name (ARN).
      # This policy assignment is attached to the specified groups or users of Amazon Quick Sight.
      # Assignment names are unique per Amazon Web Services account. To avoid overwriting rules in other
      # namespaces, use assignment names that are unique.

      def create_iam_policy_assignment(
        assignment_name : String,
        assignment_status : String,
        aws_account_id : String,
        namespace : String,
        identities : Hash(String, Array(String))? = nil,
        policy_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateIAMPolicyAssignmentRequest.new(assignment_name: assignment_name, assignment_status: assignment_status, aws_account_id: aws_account_id, namespace: namespace, identities: identities, policy_arn: policy_arn)
        create_iam_policy_assignment(input)
      end

      def create_iam_policy_assignment(input : Types::CreateIAMPolicyAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IAM_POLICY_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and starts a new SPICE ingestion for a dataset. You can manually refresh datasets in an
      # Enterprise edition account 32 times in a 24-hour period. You can manually refresh datasets in a
      # Standard edition account 8 times in a 24-hour period. Each 24-hour period is measured starting 24
      # hours before the current date and time. Any ingestions operating on tagged datasets inherit the same
      # tags automatically for use in access control. For an example, see How do I create an IAM policy to
      # control access to Amazon EC2 resources using tags? in the Amazon Web Services Knowledge Center. Tags
      # are visible on the tagged dataset, but not on the ingestion resource.

      def create_ingestion(
        aws_account_id : String,
        data_set_id : String,
        ingestion_id : String,
        ingestion_type : String? = nil
      ) : Protocol::Request
        input = Types::CreateIngestionRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, ingestion_id: ingestion_id, ingestion_type: ingestion_type)
        create_ingestion(input)
      end

      def create_ingestion(input : Types::CreateIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # (Enterprise edition only) Creates a new namespace for you to use with Amazon Quick Sight. A
      # namespace allows you to isolate the Quick Sight users and groups that are registered for that
      # namespace. Users that access the namespace can share assets only with other users or groups in the
      # same namespace. They can't see users and groups in other namespaces. You can create a namespace
      # after your Amazon Web Services account is subscribed to Quick Sight. The namespace must be unique
      # within the Amazon Web Services account. By default, there is a limit of 100 namespaces per Amazon
      # Web Services account. To increase your limit, create a ticket with Amazon Web Services Support.

      def create_namespace(
        aws_account_id : String,
        identity_store : String,
        namespace : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateNamespaceRequest.new(aws_account_id: aws_account_id, identity_store: identity_store, namespace: namespace, tags: tags)
        create_namespace(input)
      end

      def create_namespace(input : Types::CreateNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a refresh schedule for a dataset. You can create up to 5 different schedules for a single
      # dataset.

      def create_refresh_schedule(
        aws_account_id : String,
        data_set_id : String,
        schedule : Types::RefreshSchedule
      ) : Protocol::Request
        input = Types::CreateRefreshScheduleRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, schedule: schedule)
        create_refresh_schedule(input)
      end

      def create_refresh_schedule(input : Types::CreateRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use CreateRoleMembership to add an existing Quick Sight group to an existing role.

      def create_role_membership(
        aws_account_id : String,
        member_name : String,
        namespace : String,
        role : String
      ) : Protocol::Request
        input = Types::CreateRoleMembershipRequest.new(aws_account_id: aws_account_id, member_name: member_name, namespace: namespace, role: role)
        create_role_membership(input)
      end

      def create_role_membership(input : Types::CreateRoleMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROLE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a template either from a TemplateDefinition or from an existing Quick Sight analysis or
      # template. You can use the resulting template to create additional dashboards, templates, or
      # analyses. A template is an entity in Quick Sight that encapsulates the metadata required to create
      # an analysis and that you can use to create s dashboard. A template adds a layer of abstraction by
      # using placeholders to replace the dataset associated with the analysis. You can use templates to
      # create dashboards by replacing dataset placeholders with datasets that follow the same schema that
      # was used to create the source analysis and template.

      def create_template(
        aws_account_id : String,
        template_id : String,
        definition : Types::TemplateVersionDefinition? = nil,
        name : String? = nil,
        permissions : Array(Types::ResourcePermission)? = nil,
        source_entity : Types::TemplateSourceEntity? = nil,
        tags : Array(Types::Tag)? = nil,
        validation_strategy : Types::ValidationStrategy? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateTemplateRequest.new(aws_account_id: aws_account_id, template_id: template_id, definition: definition, name: name, permissions: permissions, source_entity: source_entity, tags: tags, validation_strategy: validation_strategy, version_description: version_description)
        create_template(input)
      end

      def create_template(input : Types::CreateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a template alias for a template.

      def create_template_alias(
        alias_name : String,
        aws_account_id : String,
        template_id : String,
        template_version_number : Int64
      ) : Protocol::Request
        input = Types::CreateTemplateAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, template_id: template_id, template_version_number: template_version_number)
        create_template_alias(input)
      end

      def create_template_alias(input : Types::CreateTemplateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a theme. A theme is set of configuration options for color and layout. Themes apply to
      # analyses and dashboards. For more information, see Using Themes in Amazon Quick Sight in the Amazon
      # Quick Sight User Guide .

      def create_theme(
        aws_account_id : String,
        base_theme_id : String,
        configuration : Types::ThemeConfiguration,
        name : String,
        theme_id : String,
        permissions : Array(Types::ResourcePermission)? = nil,
        tags : Array(Types::Tag)? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::CreateThemeRequest.new(aws_account_id: aws_account_id, base_theme_id: base_theme_id, configuration: configuration, name: name, theme_id: theme_id, permissions: permissions, tags: tags, version_description: version_description)
        create_theme(input)
      end

      def create_theme(input : Types::CreateThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a theme alias for a theme.

      def create_theme_alias(
        alias_name : String,
        aws_account_id : String,
        theme_id : String,
        theme_version_number : Int64
      ) : Protocol::Request
        input = Types::CreateThemeAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, theme_id: theme_id, theme_version_number: theme_version_number)
        create_theme_alias(input)
      end

      def create_theme_alias(input : Types::CreateThemeAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_THEME_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Q topic.

      def create_topic(
        aws_account_id : String,
        topic : Types::TopicDetails,
        topic_id : String,
        custom_instructions : Types::CustomInstructions? = nil,
        folder_arns : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTopicRequest.new(aws_account_id: aws_account_id, topic: topic, topic_id: topic_id, custom_instructions: custom_instructions, folder_arns: folder_arns, tags: tags)
        create_topic(input)
      end

      def create_topic(input : Types::CreateTopicRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOPIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a topic refresh schedule.

      def create_topic_refresh_schedule(
        aws_account_id : String,
        dataset_arn : String,
        refresh_schedule : Types::TopicRefreshSchedule,
        topic_id : String,
        dataset_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateTopicRefreshScheduleRequest.new(aws_account_id: aws_account_id, dataset_arn: dataset_arn, refresh_schedule: refresh_schedule, topic_id: topic_id, dataset_name: dataset_name)
        create_topic_refresh_schedule(input)
      end

      def create_topic_refresh_schedule(input : Types::CreateTopicRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TOPIC_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new VPC connection.

      def create_vpc_connection(
        aws_account_id : String,
        name : String,
        role_arn : String,
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_connection_id : String,
        dns_resolvers : Array(String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateVPCConnectionRequest.new(aws_account_id: aws_account_id, name: name, role_arn: role_arn, security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_connection_id: vpc_connection_id, dns_resolvers: dns_resolvers, tags: tags)
        create_vpc_connection(input)
      end

      def create_vpc_connection(input : Types::CreateVPCConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Unapplies a custom permissions profile from an account.

      def delete_account_custom_permission(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DeleteAccountCustomPermissionRequest.new(aws_account_id: aws_account_id)
        delete_account_custom_permission(input)
      end

      def delete_account_custom_permission(input : Types::DeleteAccountCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API permanently deletes all Quick Sight customizations for the specified Amazon Web Services
      # account and namespace. When you delete account customizations: All customizations are removed
      # including themes, branding, and visual settings This action cannot be undone through the API Users
      # will see default Quick Sight styling after customizations are deleted Before proceeding: Ensure you
      # have backups of any custom themes or branding elements you may want to recreate. Deletes all Amazon
      # Quick Sight customizations for the specified Amazon Web Services account and Quick Sight namespace.

      def delete_account_customization(
        aws_account_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAccountCustomizationRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        delete_account_customization(input)
      end

      def delete_account_customization(input : Types::DeleteAccountCustomizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_CUSTOMIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deleting your Quick Sight account subscription has permanent, irreversible consequences across all
      # Amazon Web Services regions: Global deletion – Running this operation from any single region will
      # delete your Quick Sight account and all data in every Amazon Web Services region where you have
      # Quick Sight resources. Complete data loss – All dashboards, analyses, datasets, data sources, and
      # custom visuals will be permanently deleted across all regions. Embedded content failure – All
      # embedded dashboards and visuals in your applications will immediately stop working and display
      # errors to end users. Shared resources removed – All shared dashboards, folders, and resources will
      # become inaccessible to other users and external recipients. User access terminated – All Quick Sight
      # users in your account will lose access immediately, including authors, readers, and administrators.
      # No recovery possible – Once deleted, your Quick Sight account and all associated data cannot be
      # restored. Consider exporting critical dashboards and data before proceeding with account deletion.
      # Use the DeleteAccountSubscription operation to delete an Quick Sight account. This operation will
      # result in an error message if you have configured your account termination protection settings to
      # True . To change this setting and delete your account, call the UpdateAccountSettings API and set
      # the value of the TerminationProtectionEnabled parameter to False , then make another call to the
      # DeleteAccountSubscription API.

      def delete_account_subscription(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DeleteAccountSubscriptionRequest.new(aws_account_id: aws_account_id)
        delete_account_subscription(input)
      end

      def delete_account_subscription(input : Types::DeleteAccountSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCOUNT_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Hard deletes an action connector, making it unrecoverable. This operation removes the connector and
      # all its associated configurations. Any resources currently using this action connector will no
      # longer be able to perform actions through it.

      def delete_action_connector(
        action_connector_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DeleteActionConnectorRequest.new(action_connector_id: action_connector_id, aws_account_id: aws_account_id)
        delete_action_connector(input)
      end

      def delete_action_connector(input : Types::DeleteActionConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACTION_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an analysis from Amazon Quick Sight. You can optionally include a recovery window during
      # which you can restore the analysis. If you don't specify a recovery window value, the operation
      # defaults to 30 days. Amazon Quick Sight attaches a DeletionTime stamp to the response that specifies
      # the end of the recovery window. At the end of the recovery window, Amazon Quick Sight deletes the
      # analysis permanently. At any time before recovery window ends, you can use the RestoreAnalysis API
      # operation to remove the DeletionTime stamp and cancel the deletion of the analysis. The analysis
      # remains visible in the API until it's deleted, so you can describe it but you can't make a template
      # from it. An analysis that's scheduled for deletion isn't accessible in the Amazon Quick Sight
      # console. To access it in the console, restore it. Deleting an analysis doesn't delete the dashboards
      # that you publish from it.

      def delete_analysis(
        analysis_id : String,
        aws_account_id : String,
        force_delete_without_recovery : Bool? = nil,
        recovery_window_in_days : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteAnalysisRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id, force_delete_without_recovery: force_delete_without_recovery, recovery_window_in_days: recovery_window_in_days)
        delete_analysis(input)
      end

      def delete_analysis(input : Types::DeleteAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API permanently deletes the specified Quick Sight brand. When you delete a brand: The brand and
      # all its associated branding elements are permanently removed Any applications or dashboards using
      # this brand will revert to default styling This action cannot be undone through the API Before
      # proceeding: Verify that the brand is no longer needed and consider the impact on any applications
      # currently using this brand. Deletes an Quick Sight brand.

      def delete_brand(
        aws_account_id : String,
        brand_id : String
      ) : Protocol::Request
        input = Types::DeleteBrandRequest.new(aws_account_id: aws_account_id, brand_id: brand_id)
        delete_brand(input)
      end

      def delete_brand(input : Types::DeleteBrandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BRAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a brand assignment.

      def delete_brand_assignment(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DeleteBrandAssignmentRequest.new(aws_account_id: aws_account_id)
        delete_brand_assignment(input)
      end

      def delete_brand_assignment(input : Types::DeleteBrandAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BRAND_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom permissions profile.

      def delete_custom_permissions(
        aws_account_id : String,
        custom_permissions_name : String
      ) : Protocol::Request
        input = Types::DeleteCustomPermissionsRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name)
        delete_custom_permissions(input)
      end

      def delete_custom_permissions(input : Types::DeleteCustomPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dashboard.

      def delete_dashboard(
        aws_account_id : String,
        dashboard_id : String,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteDashboardRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, version_number: version_number)
        delete_dashboard(input)
      end

      def delete_dashboard(input : Types::DeleteDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a dataset.

      def delete_data_set(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSetRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        delete_data_set(input)
      end

      def delete_data_set(input : Types::DeleteDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the dataset refresh properties of the dataset.

      def delete_data_set_refresh_properties(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSetRefreshPropertiesRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        delete_data_set_refresh_properties(input)
      end

      def delete_data_set_refresh_properties(input : Types::DeleteDataSetRefreshPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SET_REFRESH_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the data source permanently. This operation breaks all the datasets that reference the
      # deleted data source.

      def delete_data_source(
        aws_account_id : String,
        data_source_id : String
      ) : Protocol::Request
        input = Types::DeleteDataSourceRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id)
        delete_data_source(input)
      end

      def delete_data_source(input : Types::DeleteDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a linked Amazon Q Business application from an Quick Sight account

      def delete_default_q_business_application(
        aws_account_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDefaultQBusinessApplicationRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        delete_default_q_business_application(input)
      end

      def delete_default_q_business_application(input : Types::DeleteDefaultQBusinessApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEFAULT_Q_BUSINESS_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an empty folder.

      def delete_folder(
        aws_account_id : String,
        folder_id : String
      ) : Protocol::Request
        input = Types::DeleteFolderRequest.new(aws_account_id: aws_account_id, folder_id: folder_id)
        delete_folder(input)
      end

      def delete_folder(input : Types::DeleteFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an asset, such as a dashboard, analysis, or dataset, from a folder.

      def delete_folder_membership(
        aws_account_id : String,
        folder_id : String,
        member_id : String,
        member_type : String
      ) : Protocol::Request
        input = Types::DeleteFolderMembershipRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, member_id: member_id, member_type: member_type)
        delete_folder_membership(input)
      end

      def delete_folder_membership(input : Types::DeleteFolderMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FOLDER_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a user group from Amazon Quick Sight.

      def delete_group(
        aws_account_id : String,
        group_name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DeleteGroupRequest.new(aws_account_id: aws_account_id, group_name: group_name, namespace: namespace)
        delete_group(input)
      end

      def delete_group(input : Types::DeleteGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a user from a group so that the user is no longer a member of the group.

      def delete_group_membership(
        aws_account_id : String,
        group_name : String,
        member_name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DeleteGroupMembershipRequest.new(aws_account_id: aws_account_id, group_name: group_name, member_name: member_name, namespace: namespace)
        delete_group_membership(input)
      end

      def delete_group_membership(input : Types::DeleteGroupMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GROUP_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing IAM policy assignment.

      def delete_iam_policy_assignment(
        assignment_name : String,
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DeleteIAMPolicyAssignmentRequest.new(assignment_name: assignment_name, aws_account_id: aws_account_id, namespace: namespace)
        delete_iam_policy_assignment(input)
      end

      def delete_iam_policy_assignment(input : Types::DeleteIAMPolicyAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IAM_POLICY_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes all access scopes and authorized targets that are associated with a service from the Quick
      # Sight IAM Identity Center application. This operation is only supported for Quick Sight accounts
      # that use IAM Identity Center.

      def delete_identity_propagation_config(
        aws_account_id : String,
        service : String
      ) : Protocol::Request
        input = Types::DeleteIdentityPropagationConfigRequest.new(aws_account_id: aws_account_id, service: service)
        delete_identity_propagation_config(input)
      end

      def delete_identity_propagation_config(input : Types::DeleteIdentityPropagationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_IDENTITY_PROPAGATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a namespace and the users and groups that are associated with the namespace. This is an
      # asynchronous process. Assets including dashboards, analyses, datasets and data sources are not
      # deleted. To delete these assets, you use the API operations for the relevant asset.

      def delete_namespace(
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DeleteNamespaceRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        delete_namespace(input)
      end

      def delete_namespace(input : Types::DeleteNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a refresh schedule from a dataset.

      def delete_refresh_schedule(
        aws_account_id : String,
        data_set_id : String,
        schedule_id : String
      ) : Protocol::Request
        input = Types::DeleteRefreshScheduleRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, schedule_id: schedule_id)
        delete_refresh_schedule(input)
      end

      def delete_refresh_schedule(input : Types::DeleteRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes custom permissions from the role.

      def delete_role_custom_permission(
        aws_account_id : String,
        namespace : String,
        role : String
      ) : Protocol::Request
        input = Types::DeleteRoleCustomPermissionRequest.new(aws_account_id: aws_account_id, namespace: namespace, role: role)
        delete_role_custom_permission(input)
      end

      def delete_role_custom_permission(input : Types::DeleteRoleCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROLE_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a group from a role.

      def delete_role_membership(
        aws_account_id : String,
        member_name : String,
        namespace : String,
        role : String
      ) : Protocol::Request
        input = Types::DeleteRoleMembershipRequest.new(aws_account_id: aws_account_id, member_name: member_name, namespace: namespace, role: role)
        delete_role_membership(input)
      end

      def delete_role_membership(input : Types::DeleteRoleMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROLE_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a template.

      def delete_template(
        aws_account_id : String,
        template_id : String,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteTemplateRequest.new(aws_account_id: aws_account_id, template_id: template_id, version_number: version_number)
        delete_template(input)
      end

      def delete_template(input : Types::DeleteTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the item that the specified template alias points to. If you provide a specific alias, you
      # delete the version of the template that the alias points to.

      def delete_template_alias(
        alias_name : String,
        aws_account_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::DeleteTemplateAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, template_id: template_id)
        delete_template_alias(input)
      end

      def delete_template_alias(input : Types::DeleteTemplateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a theme.

      def delete_theme(
        aws_account_id : String,
        theme_id : String,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DeleteThemeRequest.new(aws_account_id: aws_account_id, theme_id: theme_id, version_number: version_number)
        delete_theme(input)
      end

      def delete_theme(input : Types::DeleteThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the version of the theme that the specified theme alias points to. If you provide a specific
      # alias, you delete the version of the theme that the alias points to.

      def delete_theme_alias(
        alias_name : String,
        aws_account_id : String,
        theme_id : String
      ) : Protocol::Request
        input = Types::DeleteThemeAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, theme_id: theme_id)
        delete_theme_alias(input)
      end

      def delete_theme_alias(input : Types::DeleteThemeAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_THEME_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a topic.

      def delete_topic(
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DeleteTopicRequest.new(aws_account_id: aws_account_id, topic_id: topic_id)
        delete_topic(input)
      end

      def delete_topic(input : Types::DeleteTopicRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TOPIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a topic refresh schedule.

      def delete_topic_refresh_schedule(
        aws_account_id : String,
        dataset_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DeleteTopicRefreshScheduleRequest.new(aws_account_id: aws_account_id, dataset_id: dataset_id, topic_id: topic_id)
        delete_topic_refresh_schedule(input)
      end

      def delete_topic_refresh_schedule(input : Types::DeleteTopicRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TOPIC_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Amazon Quick Sight user that is associated with the identity of the IAM user or role
      # that's making the call. The IAM user isn't deleted as a result of this call.

      def delete_user(
        aws_account_id : String,
        namespace : String,
        user_name : String
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(aws_account_id: aws_account_id, namespace: namespace, user_name: user_name)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user identified by its principal ID.

      def delete_user_by_principal_id(
        aws_account_id : String,
        namespace : String,
        principal_id : String
      ) : Protocol::Request
        input = Types::DeleteUserByPrincipalIdRequest.new(aws_account_id: aws_account_id, namespace: namespace, principal_id: principal_id)
        delete_user_by_principal_id(input)
      end

      def delete_user_by_principal_id(input : Types::DeleteUserByPrincipalIdRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_BY_PRINCIPAL_ID, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom permissions profile from a user.

      def delete_user_custom_permission(
        aws_account_id : String,
        namespace : String,
        user_name : String
      ) : Protocol::Request
        input = Types::DeleteUserCustomPermissionRequest.new(aws_account_id: aws_account_id, namespace: namespace, user_name: user_name)
        delete_user_custom_permission(input)
      end

      def delete_user_custom_permission(input : Types::DeleteUserCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a VPC connection.

      def delete_vpc_connection(
        aws_account_id : String,
        vpc_connection_id : String
      ) : Protocol::Request
        input = Types::DeleteVPCConnectionRequest.new(aws_account_id: aws_account_id, vpc_connection_id: vpc_connection_id)
        delete_vpc_connection(input)
      end

      def delete_vpc_connection(input : Types::DeleteVPCConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the custom permissions profile that is applied to an account.

      def describe_account_custom_permission(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAccountCustomPermissionRequest.new(aws_account_id: aws_account_id)
        describe_account_custom_permission(input)
      end

      def describe_account_custom_permission(input : Types::DescribeAccountCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the customizations associated with the provided Amazon Web Services account and Amazon
      # Quick Sight namespace. The Quick Sight console evaluates which customizations to apply by running
      # this API operation with the Resolved flag included. To determine what customizations display when
      # you run this command, it can help to visualize the relationship of the entities involved. Amazon Web
      # Services account - The Amazon Web Services account exists at the top of the hierarchy. It has the
      # potential to use all of the Amazon Web Services Regions and Amazon Web Services Services. When you
      # subscribe to Quick Sight, you choose one Amazon Web Services Region to use as your home Region.
      # That's where your free SPICE capacity is located. You can use Quick Sight in any supported Amazon
      # Web Services Region. Amazon Web Services Region - You can sign in to Quick Sight in any Amazon Web
      # Services Region. If you have a user directory, it resides in us-east-1, which is US East (N.
      # Virginia). Generally speaking, these users have access to Quick Sight in any Amazon Web Services
      # Region, unless they are constrained to a namespace. To run the command in a different Amazon Web
      # Services Region, you change your Region settings. If you're using the CLI, you can use one of the
      # following options: Use command line options . Use named profiles . Run aws configure to change your
      # default Amazon Web Services Region. Use Enter to key the same settings for your keys. For more
      # information, see Configuring the CLI . Namespace - A Quick Sight namespace is a partition that
      # contains users and assets (data sources, datasets, dashboards, and so on). To access assets that are
      # in a specific namespace, users and groups must also be part of the same namespace. People who share
      # a namespace are completely isolated from users and assets in other namespaces, even if they are in
      # the same Amazon Web Services account and Amazon Web Services Region. Applied customizations - Quick
      # Sight customizations can apply to an Amazon Web Services account or to a namespace. Settings that
      # you apply to a namespace override settings that you apply to an Amazon Web Services account.

      def describe_account_customization(
        aws_account_id : String,
        namespace : String? = nil,
        resolved : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeAccountCustomizationRequest.new(aws_account_id: aws_account_id, namespace: namespace, resolved: resolved)
        describe_account_customization(input)
      end

      def describe_account_customization(input : Types::DescribeAccountCustomizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_CUSTOMIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the settings that were used when your Quick Sight subscription was first created in this
      # Amazon Web Services account.

      def describe_account_settings(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAccountSettingsRequest.new(aws_account_id: aws_account_id)
        describe_account_settings(input)
      end

      def describe_account_settings(input : Types::DescribeAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the DescribeAccountSubscription operation to receive a description of an Quick Sight account's
      # subscription. A successful API call returns an AccountInfo object that includes an account's name,
      # subscription status, authentication type, edition, and notification email address.

      def describe_account_subscription(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAccountSubscriptionRequest.new(aws_account_id: aws_account_id)
        describe_account_subscription(input)
      end

      def describe_account_subscription(input : Types::DescribeAccountSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCOUNT_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about an action connector, including its configuration,
      # authentication settings, enabled actions, and current status.

      def describe_action_connector(
        action_connector_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeActionConnectorRequest.new(action_connector_id: action_connector_id, aws_account_id: aws_account_id)
        describe_action_connector(input)
      end

      def describe_action_connector(input : Types::DescribeActionConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACTION_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the permissions configuration for an action connector, showing which users, groups, and
      # namespaces have access and what operations they can perform.

      def describe_action_connector_permissions(
        action_connector_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeActionConnectorPermissionsRequest.new(action_connector_id: action_connector_id, aws_account_id: aws_account_id)
        describe_action_connector_permissions(input)
      end

      def describe_action_connector_permissions(input : Types::DescribeActionConnectorPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACTION_CONNECTOR_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a summary of the metadata for an analysis.

      def describe_analysis(
        analysis_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAnalysisRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id)
        describe_analysis(input)
      end

      def describe_analysis(input : Types::DescribeAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a detailed description of the definition of an analysis. If you do not need to know details
      # about the content of an Analysis, for instance if you are trying to check the status of a recently
      # created or updated Analysis, use the DescribeAnalysis instead.

      def describe_analysis_definition(
        analysis_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAnalysisDefinitionRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id)
        describe_analysis_definition(input)
      end

      def describe_analysis_definition(input : Types::DescribeAnalysisDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ANALYSIS_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the read and write permissions for an analysis.

      def describe_analysis_permissions(
        analysis_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAnalysisPermissionsRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id)
        describe_analysis_permissions(input)
      end

      def describe_analysis_permissions(input : Types::DescribeAnalysisPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ANALYSIS_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing export job. Poll job descriptions after a job starts to know the status of the
      # job. When a job succeeds, a URL is provided to download the exported assets' data from. Download
      # URLs are valid for five minutes after they are generated. You can call the
      # DescribeAssetBundleExportJob API for a new download URL as needed. Job descriptions are available
      # for 14 days after the job starts.

      def describe_asset_bundle_export_job(
        asset_bundle_export_job_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAssetBundleExportJobRequest.new(asset_bundle_export_job_id: asset_bundle_export_job_id, aws_account_id: aws_account_id)
        describe_asset_bundle_export_job(input)
      end

      def describe_asset_bundle_export_job(input : Types::DescribeAssetBundleExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_BUNDLE_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing import job. Poll job descriptions after starting a job to know when it has
      # succeeded or failed. Job descriptions are available for 14 days after job starts.

      def describe_asset_bundle_import_job(
        asset_bundle_import_job_id : String,
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeAssetBundleImportJobRequest.new(asset_bundle_import_job_id: asset_bundle_import_job_id, aws_account_id: aws_account_id)
        describe_asset_bundle_import_job(input)
      end

      def describe_asset_bundle_import_job(input : Types::DescribeAssetBundleImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ASSET_BUNDLE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a brand.

      def describe_brand(
        aws_account_id : String,
        brand_id : String,
        version_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeBrandRequest.new(aws_account_id: aws_account_id, brand_id: brand_id, version_id: version_id)
        describe_brand(input)
      end

      def describe_brand(input : Types::DescribeBrandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BRAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a brand assignment.

      def describe_brand_assignment(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeBrandAssignmentRequest.new(aws_account_id: aws_account_id)
        describe_brand_assignment(input)
      end

      def describe_brand_assignment(input : Types::DescribeBrandAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BRAND_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the published version of the brand.

      def describe_brand_published_version(
        aws_account_id : String,
        brand_id : String
      ) : Protocol::Request
        input = Types::DescribeBrandPublishedVersionRequest.new(aws_account_id: aws_account_id, brand_id: brand_id)
        describe_brand_published_version(input)
      end

      def describe_brand_published_version(input : Types::DescribeBrandPublishedVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_BRAND_PUBLISHED_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a custom permissions profile.

      def describe_custom_permissions(
        aws_account_id : String,
        custom_permissions_name : String
      ) : Protocol::Request
        input = Types::DescribeCustomPermissionsRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name)
        describe_custom_permissions(input)
      end

      def describe_custom_permissions(input : Types::DescribeCustomPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CUSTOM_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a summary for a dashboard.

      def describe_dashboard(
        aws_account_id : String,
        dashboard_id : String,
        alias_name : String? = nil,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeDashboardRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, alias_name: alias_name, version_number: version_number)
        describe_dashboard(input)
      end

      def describe_dashboard(input : Types::DescribeDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a detailed description of the definition of a dashboard. If you do not need to know details
      # about the content of a dashboard, for instance if you are trying to check the status of a recently
      # created or updated dashboard, use the DescribeDashboard instead.

      def describe_dashboard_definition(
        aws_account_id : String,
        dashboard_id : String,
        alias_name : String? = nil,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeDashboardDefinitionRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, alias_name: alias_name, version_number: version_number)
        describe_dashboard_definition(input)
      end

      def describe_dashboard_definition(input : Types::DescribeDashboardDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes read and write permissions for a dashboard.

      def describe_dashboard_permissions(
        aws_account_id : String,
        dashboard_id : String
      ) : Protocol::Request
        input = Types::DescribeDashboardPermissionsRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id)
        describe_dashboard_permissions(input)
      end

      def describe_dashboard_permissions(input : Types::DescribeDashboardPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing snapshot job. Poll job descriptions after a job starts to know the status of
      # the job. For information on available status codes, see JobStatus . Registered user support This API
      # can be called as before to get status of a job started by the same Quick Sight user. Possible error
      # scenarios Request will fail with an Access Denied error in the following scenarios: The credentials
      # have expired. Job has been started by a different user. Impersonated Quick Sight user doesn't have
      # access to the specified dashboard in the job.

      def describe_dashboard_snapshot_job(
        aws_account_id : String,
        dashboard_id : String,
        snapshot_job_id : String
      ) : Protocol::Request
        input = Types::DescribeDashboardSnapshotJobRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, snapshot_job_id: snapshot_job_id)
        describe_dashboard_snapshot_job(input)
      end

      def describe_dashboard_snapshot_job(input : Types::DescribeDashboardSnapshotJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD_SNAPSHOT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the result of an existing snapshot job that has finished running. A finished snapshot job
      # will return a COMPLETED or FAILED status when you poll the job with a DescribeDashboardSnapshotJob
      # API call. If the job has not finished running, this operation returns a message that says Dashboard
      # Snapshot Job with id &lt;SnapshotjobId&gt; has not reached a terminal state. . Registered user
      # support This API can be called as before to get the result of a job started by the same Quick Sight
      # user. The result for the user will be returned in RegisteredUsers response attribute. The attribute
      # will contain a list with at most one object in it. Possible error scenarios The request fails with
      # an Access Denied error in the following scenarios: The credentials have expired. The job was started
      # by a different user. The registered user doesn't have access to the specified dashboard. The request
      # succeeds but the job fails in the following scenarios: DASHBOARD_ACCESS_DENIED - The registered user
      # lost access to the dashboard. CAPABILITY_RESTRICTED - The registered user is restricted from
      # exporting data in all selected formats. The request succeeds but the response contains an error code
      # in the following scenarios: CAPABILITY_RESTRICTED - The registered user is restricted from exporting
      # data in some selected formats. RLS_CHANGED - Row-level security settings have changed. Re-run the
      # job with current settings. CLS_CHANGED - Column-level security settings have changed. Re-run the job
      # with current settings. DATASET_DELETED - The dataset has been deleted. Verify the dataset exists
      # before re-running the job.

      def describe_dashboard_snapshot_job_result(
        aws_account_id : String,
        dashboard_id : String,
        snapshot_job_id : String
      ) : Protocol::Request
        input = Types::DescribeDashboardSnapshotJobResultRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, snapshot_job_id: snapshot_job_id)
        describe_dashboard_snapshot_job_result(input)
      end

      def describe_dashboard_snapshot_job_result(input : Types::DescribeDashboardSnapshotJobResultRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARD_SNAPSHOT_JOB_RESULT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing dashboard QA configuration.

      def describe_dashboards_qa_configuration(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeDashboardsQAConfigurationRequest.new(aws_account_id: aws_account_id)
        describe_dashboards_qa_configuration(input)
      end

      def describe_dashboards_qa_configuration(input : Types::DescribeDashboardsQAConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DASHBOARDS_QA_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a dataset. This operation doesn't support datasets that include uploaded files as a
      # source.

      def describe_data_set(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::DescribeDataSetRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        describe_data_set(input)
      end

      def describe_data_set(input : Types::DescribeDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the permissions on a dataset. The permissions resource is
      # arn:aws:quicksight:region:aws-account-id:dataset/data-set-id .

      def describe_data_set_permissions(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::DescribeDataSetPermissionsRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        describe_data_set_permissions(input)
      end

      def describe_data_set_permissions(input : Types::DescribeDataSetPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_SET_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the refresh properties of a dataset.

      def describe_data_set_refresh_properties(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::DescribeDataSetRefreshPropertiesRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        describe_data_set_refresh_properties(input)
      end

      def describe_data_set_refresh_properties(input : Types::DescribeDataSetRefreshPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_SET_REFRESH_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a data source.

      def describe_data_source(
        aws_account_id : String,
        data_source_id : String
      ) : Protocol::Request
        input = Types::DescribeDataSourceRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id)
        describe_data_source(input)
      end

      def describe_data_source(input : Types::DescribeDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the resource permissions for a data source.

      def describe_data_source_permissions(
        aws_account_id : String,
        data_source_id : String
      ) : Protocol::Request
        input = Types::DescribeDataSourcePermissionsRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id)
        describe_data_source_permissions(input)
      end

      def describe_data_source_permissions(input : Types::DescribeDataSourcePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_SOURCE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a Amazon Q Business application that is linked to an Quick Sight account.

      def describe_default_q_business_application(
        aws_account_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::DescribeDefaultQBusinessApplicationRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        describe_default_q_business_application(input)
      end

      def describe_default_q_business_application(input : Types::DescribeDefaultQBusinessApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DEFAULT_Q_BUSINESS_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a folder.

      def describe_folder(
        aws_account_id : String,
        folder_id : String
      ) : Protocol::Request
        input = Types::DescribeFolderRequest.new(aws_account_id: aws_account_id, folder_id: folder_id)
        describe_folder(input)
      end

      def describe_folder(input : Types::DescribeFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes permissions for a folder.

      def describe_folder_permissions(
        aws_account_id : String,
        folder_id : String,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeFolderPermissionsRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, max_results: max_results, namespace: namespace, next_token: next_token)
        describe_folder_permissions(input)
      end

      def describe_folder_permissions(input : Types::DescribeFolderPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FOLDER_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the folder resolved permissions. Permissions consists of both folder direct permissions
      # and the inherited permissions from the ancestor folders.

      def describe_folder_resolved_permissions(
        aws_account_id : String,
        folder_id : String,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeFolderResolvedPermissionsRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, max_results: max_results, namespace: namespace, next_token: next_token)
        describe_folder_resolved_permissions(input)
      end

      def describe_folder_resolved_permissions(input : Types::DescribeFolderResolvedPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FOLDER_RESOLVED_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an Amazon Quick Sight group's description and Amazon Resource Name (ARN).

      def describe_group(
        aws_account_id : String,
        group_name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DescribeGroupRequest.new(aws_account_id: aws_account_id, group_name: group_name, namespace: namespace)
        describe_group(input)
      end

      def describe_group(input : Types::DescribeGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the DescribeGroupMembership operation to determine if a user is a member of the specified group.
      # If the user exists and is a member of the specified group, an associated GroupMember object is
      # returned.

      def describe_group_membership(
        aws_account_id : String,
        group_name : String,
        member_name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DescribeGroupMembershipRequest.new(aws_account_id: aws_account_id, group_name: group_name, member_name: member_name, namespace: namespace)
        describe_group_membership(input)
      end

      def describe_group_membership(input : Types::DescribeGroupMembershipRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GROUP_MEMBERSHIP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing IAM policy assignment, as specified by the assignment name.

      def describe_iam_policy_assignment(
        assignment_name : String,
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DescribeIAMPolicyAssignmentRequest.new(assignment_name: assignment_name, aws_account_id: aws_account_id, namespace: namespace)
        describe_iam_policy_assignment(input)
      end

      def describe_iam_policy_assignment(input : Types::DescribeIAMPolicyAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IAM_POLICY_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a SPICE ingestion.

      def describe_ingestion(
        aws_account_id : String,
        data_set_id : String,
        ingestion_id : String
      ) : Protocol::Request
        input = Types::DescribeIngestionRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, ingestion_id: ingestion_id)
        describe_ingestion(input)
      end

      def describe_ingestion(input : Types::DescribeIngestionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INGESTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a summary and status of IP rules.

      def describe_ip_restriction(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeIpRestrictionRequest.new(aws_account_id: aws_account_id)
        describe_ip_restriction(input)
      end

      def describe_ip_restriction(input : Types::DescribeIpRestrictionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IP_RESTRICTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes all customer managed key registrations in a Quick Sight account.

      def describe_key_registration(
        aws_account_id : String,
        default_key_only : Bool? = nil
      ) : Protocol::Request
        input = Types::DescribeKeyRegistrationRequest.new(aws_account_id: aws_account_id, default_key_only: default_key_only)
        describe_key_registration(input)
      end

      def describe_key_registration(input : Types::DescribeKeyRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_KEY_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the current namespace.

      def describe_namespace(
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DescribeNamespaceRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        describe_namespace(input)
      end

      def describe_namespace(input : Types::DescribeNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a personalization configuration.

      def describe_q_personalization_configuration(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeQPersonalizationConfigurationRequest.new(aws_account_id: aws_account_id)
        describe_q_personalization_configuration(input)
      end

      def describe_q_personalization_configuration(input : Types::DescribeQPersonalizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_Q_PERSONALIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the state of a Quick Sight Q Search configuration.

      def describe_quick_sight_q_search_configuration(
        aws_account_id : String
      ) : Protocol::Request
        input = Types::DescribeQuickSightQSearchConfigurationRequest.new(aws_account_id: aws_account_id)
        describe_quick_sight_q_search_configuration(input)
      end

      def describe_quick_sight_q_search_configuration(input : Types::DescribeQuickSightQSearchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_QUICK_SIGHT_Q_SEARCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a summary of a refresh schedule.

      def describe_refresh_schedule(
        aws_account_id : String,
        data_set_id : String,
        schedule_id : String
      ) : Protocol::Request
        input = Types::DescribeRefreshScheduleRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, schedule_id: schedule_id)
        describe_refresh_schedule(input)
      end

      def describe_refresh_schedule(input : Types::DescribeRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes all custom permissions that are mapped to a role.

      def describe_role_custom_permission(
        aws_account_id : String,
        namespace : String,
        role : String
      ) : Protocol::Request
        input = Types::DescribeRoleCustomPermissionRequest.new(aws_account_id: aws_account_id, namespace: namespace, role: role)
        describe_role_custom_permission(input)
      end

      def describe_role_custom_permission(input : Types::DescribeRoleCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROLE_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the self-upgrade configuration for a Quick Suite account.

      def describe_self_upgrade_configuration(
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DescribeSelfUpgradeConfigurationRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        describe_self_upgrade_configuration(input)
      end

      def describe_self_upgrade_configuration(input : Types::DescribeSelfUpgradeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SELF_UPGRADE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a template's metadata.

      def describe_template(
        aws_account_id : String,
        template_id : String,
        alias_name : String? = nil,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeTemplateRequest.new(aws_account_id: aws_account_id, template_id: template_id, alias_name: alias_name, version_number: version_number)
        describe_template(input)
      end

      def describe_template(input : Types::DescribeTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the template alias for a template.

      def describe_template_alias(
        alias_name : String,
        aws_account_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::DescribeTemplateAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, template_id: template_id)
        describe_template_alias(input)
      end

      def describe_template_alias(input : Types::DescribeTemplateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEMPLATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a detailed description of the definition of a template. If you do not need to know details
      # about the content of a template, for instance if you are trying to check the status of a recently
      # created or updated template, use the DescribeTemplate instead.

      def describe_template_definition(
        aws_account_id : String,
        template_id : String,
        alias_name : String? = nil,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeTemplateDefinitionRequest.new(aws_account_id: aws_account_id, template_id: template_id, alias_name: alias_name, version_number: version_number)
        describe_template_definition(input)
      end

      def describe_template_definition(input : Types::DescribeTemplateDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEMPLATE_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes read and write permissions on a template.

      def describe_template_permissions(
        aws_account_id : String,
        template_id : String
      ) : Protocol::Request
        input = Types::DescribeTemplatePermissionsRequest.new(aws_account_id: aws_account_id, template_id: template_id)
        describe_template_permissions(input)
      end

      def describe_template_permissions(input : Types::DescribeTemplatePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TEMPLATE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a theme.

      def describe_theme(
        aws_account_id : String,
        theme_id : String,
        alias_name : String? = nil,
        version_number : Int64? = nil
      ) : Protocol::Request
        input = Types::DescribeThemeRequest.new(aws_account_id: aws_account_id, theme_id: theme_id, alias_name: alias_name, version_number: version_number)
        describe_theme(input)
      end

      def describe_theme(input : Types::DescribeThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the alias for a theme.

      def describe_theme_alias(
        alias_name : String,
        aws_account_id : String,
        theme_id : String
      ) : Protocol::Request
        input = Types::DescribeThemeAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, theme_id: theme_id)
        describe_theme_alias(input)
      end

      def describe_theme_alias(input : Types::DescribeThemeAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THEME_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the read and write permissions for a theme.

      def describe_theme_permissions(
        aws_account_id : String,
        theme_id : String
      ) : Protocol::Request
        input = Types::DescribeThemePermissionsRequest.new(aws_account_id: aws_account_id, theme_id: theme_id)
        describe_theme_permissions(input)
      end

      def describe_theme_permissions(input : Types::DescribeThemePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_THEME_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a topic.

      def describe_topic(
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DescribeTopicRequest.new(aws_account_id: aws_account_id, topic_id: topic_id)
        describe_topic(input)
      end

      def describe_topic(input : Types::DescribeTopicRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the permissions of a topic.

      def describe_topic_permissions(
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DescribeTopicPermissionsRequest.new(aws_account_id: aws_account_id, topic_id: topic_id)
        describe_topic_permissions(input)
      end

      def describe_topic_permissions(input : Types::DescribeTopicPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the status of a topic refresh.

      def describe_topic_refresh(
        aws_account_id : String,
        refresh_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DescribeTopicRefreshRequest.new(aws_account_id: aws_account_id, refresh_id: refresh_id, topic_id: topic_id)
        describe_topic_refresh(input)
      end

      def describe_topic_refresh(input : Types::DescribeTopicRefreshRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC_REFRESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a topic refresh schedule.

      def describe_topic_refresh_schedule(
        aws_account_id : String,
        dataset_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::DescribeTopicRefreshScheduleRequest.new(aws_account_id: aws_account_id, dataset_id: dataset_id, topic_id: topic_id)
        describe_topic_refresh_schedule(input)
      end

      def describe_topic_refresh_schedule(input : Types::DescribeTopicRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TOPIC_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a user, given the user name.

      def describe_user(
        aws_account_id : String,
        namespace : String,
        user_name : String
      ) : Protocol::Request
        input = Types::DescribeUserRequest.new(aws_account_id: aws_account_id, namespace: namespace, user_name: user_name)
        describe_user(input)
      end

      def describe_user(input : Types::DescribeUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a VPC connection.

      def describe_vpc_connection(
        aws_account_id : String,
        vpc_connection_id : String
      ) : Protocol::Request
        input = Types::DescribeVPCConnectionRequest.new(aws_account_id: aws_account_id, vpc_connection_id: vpc_connection_id)
        describe_vpc_connection(input)
      end

      def describe_vpc_connection(input : Types::DescribeVPCConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates an embed URL that you can use to embed an Amazon Quick Suite dashboard or visual in your
      # website, without having to register any reader users. Before you use this action, make sure that you
      # have configured the dashboards and permissions. The following rules apply to the generated URL: It
      # contains a temporary bearer token. It is valid for 5 minutes after it is generated. Once redeemed
      # within this period, it cannot be re-used again. The URL validity period should not be confused with
      # the actual session lifetime that can be customized using the SessionLifetimeInMinutes parameter. The
      # resulting user session is valid for 15 minutes (minimum) to 10 hours (maximum). The default session
      # duration is 10 hours. You are charged only when the URL is used or there is interaction with Amazon
      # Quick Suite. For more information, see Embedded Analytics in the Amazon Quick Suite User Guide . For
      # more information about the high-level steps for embedding and for an interactive demo of the ways
      # you can customize embedding, visit the Amazon Quick Suite Developer Portal .

      def generate_embed_url_for_anonymous_user(
        authorized_resource_arns : Array(String),
        aws_account_id : String,
        experience_configuration : Types::AnonymousUserEmbeddingExperienceConfiguration,
        namespace : String,
        allowed_domains : Array(String)? = nil,
        session_lifetime_in_minutes : Int64? = nil,
        session_tags : Array(Types::SessionTag)? = nil
      ) : Protocol::Request
        input = Types::GenerateEmbedUrlForAnonymousUserRequest.new(authorized_resource_arns: authorized_resource_arns, aws_account_id: aws_account_id, experience_configuration: experience_configuration, namespace: namespace, allowed_domains: allowed_domains, session_lifetime_in_minutes: session_lifetime_in_minutes, session_tags: session_tags)
        generate_embed_url_for_anonymous_user(input)
      end

      def generate_embed_url_for_anonymous_user(input : Types::GenerateEmbedUrlForAnonymousUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_EMBED_URL_FOR_ANONYMOUS_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates an embed URL that you can use to embed an Amazon Quick Suite experience in your website.
      # This action can be used for any type of user registered in an Amazon Quick Suite account. Before you
      # use this action, make sure that you have configured the relevant Amazon Quick Suite resource and
      # permissions. The following rules apply to the generated URL: It contains a temporary bearer token.
      # It is valid for 5 minutes after it is generated. Once redeemed within this period, it cannot be
      # re-used again. The URL validity period should not be confused with the actual session lifetime that
      # can be customized using the SessionLifetimeInMinutes parameter. The resulting user session is valid
      # for 15 minutes (minimum) to 10 hours (maximum). The default session duration is 10 hours. You are
      # charged only when the URL is used or there is interaction with Amazon Quick Suite. For more
      # information, see Embedded Analytics in the Amazon Quick Suite User Guide . For more information
      # about the high-level steps for embedding and for an interactive demo of the ways you can customize
      # embedding, visit the Amazon Quick Suite Developer Portal .

      def generate_embed_url_for_registered_user(
        aws_account_id : String,
        experience_configuration : Types::RegisteredUserEmbeddingExperienceConfiguration,
        user_arn : String,
        allowed_domains : Array(String)? = nil,
        session_lifetime_in_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::GenerateEmbedUrlForRegisteredUserRequest.new(aws_account_id: aws_account_id, experience_configuration: experience_configuration, user_arn: user_arn, allowed_domains: allowed_domains, session_lifetime_in_minutes: session_lifetime_in_minutes)
        generate_embed_url_for_registered_user(input)
      end

      def generate_embed_url_for_registered_user(input : Types::GenerateEmbedUrlForRegisteredUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_EMBED_URL_FOR_REGISTERED_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates an embed URL that you can use to embed an Amazon Quick Sight experience in your website.
      # This action can be used for any type of user that is registered in an Amazon Quick Sight account
      # that uses IAM Identity Center for authentication. This API requires identity-enhanced IAM Role
      # sessions for the authenticated user that the API call is being made for. This API uses trusted
      # identity propagation to ensure that an end user is authenticated and receives the embed URL that is
      # specific to that user. The IAM Identity Center application that the user has logged into needs to
      # have trusted Identity Propagation enabled for Amazon Quick Sight with the scope value set to
      # quicksight:read . Before you use this action, make sure that you have configured the relevant Amazon
      # Quick Sight resource and permissions.

      def generate_embed_url_for_registered_user_with_identity(
        aws_account_id : String,
        experience_configuration : Types::RegisteredUserEmbeddingExperienceConfiguration,
        allowed_domains : Array(String)? = nil,
        session_lifetime_in_minutes : Int64? = nil
      ) : Protocol::Request
        input = Types::GenerateEmbedUrlForRegisteredUserWithIdentityRequest.new(aws_account_id: aws_account_id, experience_configuration: experience_configuration, allowed_domains: allowed_domains, session_lifetime_in_minutes: session_lifetime_in_minutes)
        generate_embed_url_for_registered_user_with_identity(input)
      end

      def generate_embed_url_for_registered_user_with_identity(input : Types::GenerateEmbedUrlForRegisteredUserWithIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_EMBED_URL_FOR_REGISTERED_USER_WITH_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a temporary session URL and authorization code(bearer token) that you can use to embed an
      # Amazon Quick Sight read-only dashboard in your website or application. Before you use this command,
      # make sure that you have configured the dashboards and permissions. Currently, you can use
      # GetDashboardEmbedURL only from the server, not from the user's browser. The following rules apply to
      # the generated URL: They must be used together. They can be used one time only. They are valid for 5
      # minutes after you run this command. You are charged only when the URL is used or there is
      # interaction with Quick Suite. The resulting user session is valid for 15 minutes (default) up to 10
      # hours (maximum). You can use the optional SessionLifetimeInMinutes parameter to customize session
      # duration. For more information, see Embedding Analytics Using GetDashboardEmbedUrl in the Amazon
      # Quick Suite User Guide . For more information about the high-level steps for embedding and for an
      # interactive demo of the ways you can customize embedding, visit the Amazon Quick Suite Developer
      # Portal .

      def get_dashboard_embed_url(
        aws_account_id : String,
        dashboard_id : String,
        identity_type : String,
        additional_dashboard_ids : Array(String)? = nil,
        namespace : String? = nil,
        reset_disabled : Bool? = nil,
        session_lifetime_in_minutes : Int64? = nil,
        state_persistence_enabled : Bool? = nil,
        undo_redo_disabled : Bool? = nil,
        user_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetDashboardEmbedUrlRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, identity_type: identity_type, additional_dashboard_ids: additional_dashboard_ids, namespace: namespace, reset_disabled: reset_disabled, session_lifetime_in_minutes: session_lifetime_in_minutes, state_persistence_enabled: state_persistence_enabled, undo_redo_disabled: undo_redo_disabled, user_arn: user_arn)
        get_dashboard_embed_url(input)
      end

      def get_dashboard_embed_url(input : Types::GetDashboardEmbedUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DASHBOARD_EMBED_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the metadata of a flow, not including its definition specifying the steps.

      def get_flow_metadata(
        aws_account_id : String,
        flow_id : String
      ) : Protocol::Request
        input = Types::GetFlowMetadataInput.new(aws_account_id: aws_account_id, flow_id: flow_id)
        get_flow_metadata(input)
      end

      def get_flow_metadata(input : Types::GetFlowMetadataInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get permissions for a flow.

      def get_flow_permissions(
        aws_account_id : String,
        flow_id : String
      ) : Protocol::Request
        input = Types::GetFlowPermissionsInput.new(aws_account_id: aws_account_id, flow_id: flow_id)
        get_flow_permissions(input)
      end

      def get_flow_permissions(input : Types::GetFlowPermissionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the identity context for a Quick Sight user in a specified namespace, allowing you to
      # obtain identity tokens that can be used with identity-enhanced IAM role sessions to call
      # identity-aware APIs. Currently, you can call the following APIs with identity-enhanced Credentials
      # StartDashboardSnapshotJob DescribeDashboardSnapshotJob DescribeDashboardSnapshotJobResult Supported
      # Authentication Methods This API supports Quick Sight native users, IAM federated users, and Active
      # Directory users. For Quick Sight users authenticated by Amazon Web Services Identity Center, see
      # Identity Center documentation on identity-enhanced IAM role sessions . Getting Identity-Enhanced
      # Credentials To obtain identity-enhanced credentials, follow these steps: Call the GetIdentityContext
      # API to retrieve an identity token for the specified user. Use the identity token with the STS
      # AssumeRole API to obtain identity-enhanced IAM role session credentials. Usage with STS AssumeRole
      # The identity token returned by this API should be used with the STS AssumeRole API to obtain
      # credentials for an identity-enhanced IAM role session. When calling AssumeRole, include the identity
      # token in the ProvidedContexts parameter with ProviderArn set to
      # arn:aws:iam::aws:contextProvider/QuickSight and ContextAssertion set to the identity token received
      # from this API. The assumed role must allow the sts:SetContext action in addition to sts:AssumeRole
      # in its trust relationship policy. The trust policy should include both actions for the principal
      # that will be assuming the role.

      def get_identity_context(
        aws_account_id : String,
        user_identifier : Types::UserIdentifier,
        namespace : String? = nil,
        session_expires_at : Time? = nil
      ) : Protocol::Request
        input = Types::GetIdentityContextRequest.new(aws_account_id: aws_account_id, user_identifier: user_identifier, namespace: namespace, session_expires_at: session_expires_at)
        get_identity_context(input)
      end

      def get_identity_context(input : Types::GetIdentityContextRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IDENTITY_CONTEXT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a session URL and authorization code that you can use to embed the Amazon Amazon Quick
      # Sight console in your web server code. Use GetSessionEmbedUrl where you want to provide an authoring
      # portal that allows users to create data sources, datasets, analyses, and dashboards. The users who
      # access an embedded Amazon Quick Sight console need belong to the author or admin security cohort. If
      # you want to restrict permissions to some of these features, add a custom permissions profile to the
      # user with the UpdateUser API operation. Use RegisterUser API operation to add a new user with a
      # custom permission profile attached. For more information, see the following sections in the Amazon
      # Quick Suite User Guide : Embedding Analytics Customizing Access to the Amazon Quick Suite Console

      def get_session_embed_url(
        aws_account_id : String,
        entry_point : String? = nil,
        session_lifetime_in_minutes : Int64? = nil,
        user_arn : String? = nil
      ) : Protocol::Request
        input = Types::GetSessionEmbedUrlRequest.new(aws_account_id: aws_account_id, entry_point: entry_point, session_lifetime_in_minutes: session_lifetime_in_minutes, user_arn: user_arn)
        get_session_embed_url(input)
      end

      def get_session_embed_url(input : Types::GetSessionEmbedUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SESSION_EMBED_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all action connectors in the specified Amazon Web Services account. Returns summary
      # information for each connector including its name, type, creation time, and status.

      def list_action_connectors(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListActionConnectorsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_action_connectors(input)
      end

      def list_action_connectors(input : Types::ListActionConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACTION_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Quick Sight analyses that exist in the specified Amazon Web Services account.

      def list_analyses(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalysesRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_analyses(input)
      end

      def list_analyses(input : Types::ListAnalysesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all asset bundle export jobs that have been taken place in the last 14 days. Jobs created more
      # than 14 days ago are deleted forever and are not returned. If you are using the same job ID for
      # multiple jobs, ListAssetBundleExportJobs only returns the most recent job that uses the repeated job
      # ID.

      def list_asset_bundle_export_jobs(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetBundleExportJobsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_asset_bundle_export_jobs(input)
      end

      def list_asset_bundle_export_jobs(input : Types::ListAssetBundleExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_BUNDLE_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all asset bundle import jobs that have taken place in the last 14 days. Jobs created more than
      # 14 days ago are deleted forever and are not returned. If you are using the same job ID for multiple
      # jobs, ListAssetBundleImportJobs only returns the most recent job that uses the repeated job ID.

      def list_asset_bundle_import_jobs(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetBundleImportJobsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_asset_bundle_import_jobs(input)
      end

      def list_asset_bundle_import_jobs(input : Types::ListAssetBundleImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_BUNDLE_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all brands in an Quick Sight account.

      def list_brands(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBrandsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_brands(input)
      end

      def list_brands(input : Types::ListBrandsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BRANDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the custom permissions profiles.

      def list_custom_permissions(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCustomPermissionsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_custom_permissions(input)
      end

      def list_custom_permissions(input : Types::ListCustomPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the versions of the dashboards in the Amazon Quick Sight subscription.

      def list_dashboard_versions(
        aws_account_id : String,
        dashboard_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDashboardVersionsRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, max_results: max_results, next_token: next_token)
        list_dashboard_versions(input)
      end

      def list_dashboard_versions(input : Types::ListDashboardVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DASHBOARD_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists dashboards in an Amazon Web Services account.

      def list_dashboards(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDashboardsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_dashboards(input)
      end

      def list_dashboards(input : Types::ListDashboardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DASHBOARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the datasets belonging to the current Amazon Web Services account in an Amazon Web
      # Services Region. The permissions resource is arn:aws:quicksight:region:aws-account-id:dataset/* .

      def list_data_sets(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSetsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_data_sets(input)
      end

      def list_data_sets(input : Types::ListDataSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists data sources in current Amazon Web Services Region that belong to this Amazon Web Services
      # account.

      def list_data_sources(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourcesRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_data_sources(input)
      end

      def list_data_sources(input : Types::ListDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists flows in an Amazon Web Services account.

      def list_flows(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowsInput.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_flows(input)
      end

      def list_flows(input : Types::ListFlowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all assets ( DASHBOARD , ANALYSIS , and DATASET ) in a folder.

      def list_folder_members(
        aws_account_id : String,
        folder_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFolderMembersRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, max_results: max_results, next_token: next_token)
        list_folder_members(input)
      end

      def list_folder_members(input : Types::ListFolderMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FOLDER_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all folders in an account.

      def list_folders(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFoldersRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_folders(input)
      end

      def list_folders(input : Types::ListFoldersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FOLDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all folders that a resource is a member of.

      def list_folders_for_resource(
        aws_account_id : String,
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFoldersForResourceRequest.new(aws_account_id: aws_account_id, resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_folders_for_resource(input)
      end

      def list_folders_for_resource(input : Types::ListFoldersForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FOLDERS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists member users in a group.

      def list_group_memberships(
        aws_account_id : String,
        group_name : String,
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupMembershipsRequest.new(aws_account_id: aws_account_id, group_name: group_name, namespace: namespace, max_results: max_results, next_token: next_token)
        list_group_memberships(input)
      end

      def list_group_memberships(input : Types::ListGroupMembershipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUP_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all user groups in Amazon Quick Sight.

      def list_groups(
        aws_account_id : String,
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGroupsRequest.new(aws_account_id: aws_account_id, namespace: namespace, max_results: max_results, next_token: next_token)
        list_groups(input)
      end

      def list_groups(input : Types::ListGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the IAM policy assignments in the current Amazon Quick Sight account.

      def list_iam_policy_assignments(
        aws_account_id : String,
        namespace : String,
        assignment_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIAMPolicyAssignmentsRequest.new(aws_account_id: aws_account_id, namespace: namespace, assignment_status: assignment_status, max_results: max_results, next_token: next_token)
        list_iam_policy_assignments(input)
      end

      def list_iam_policy_assignments(input : Types::ListIAMPolicyAssignmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IAM_POLICY_ASSIGNMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the IAM policy assignments, including the Amazon Resource Names (ARNs), for the IAM
      # policies assigned to the specified user and group, or groups that the user belongs to.

      def list_iam_policy_assignments_for_user(
        aws_account_id : String,
        namespace : String,
        user_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIAMPolicyAssignmentsForUserRequest.new(aws_account_id: aws_account_id, namespace: namespace, user_name: user_name, max_results: max_results, next_token: next_token)
        list_iam_policy_assignments_for_user(input)
      end

      def list_iam_policy_assignments_for_user(input : Types::ListIAMPolicyAssignmentsForUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IAM_POLICY_ASSIGNMENTS_FOR_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all services and authorized targets that the Quick Sight IAM Identity Center application can
      # access. This operation is only supported for Quick Sight accounts that use IAM Identity Center.

      def list_identity_propagation_configs(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityPropagationConfigsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_identity_propagation_configs(input)
      end

      def list_identity_propagation_configs(input : Types::ListIdentityPropagationConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_PROPAGATION_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the history of SPICE ingestions for a dataset. Limited to 5 TPS per user and 25 TPS per
      # account.

      def list_ingestions(
        aws_account_id : String,
        data_set_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIngestionsRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, max_results: max_results, next_token: next_token)
        list_ingestions(input)
      end

      def list_ingestions(input : Types::ListIngestionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INGESTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the namespaces for the specified Amazon Web Services account. This operation doesn't list
      # deleted namespaces.

      def list_namespaces(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNamespacesRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_namespaces(input)
      end

      def list_namespaces(input : Types::ListNamespacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the refresh schedules of a dataset. Each dataset can have up to 5 schedules.

      def list_refresh_schedules(
        aws_account_id : String,
        data_set_id : String
      ) : Protocol::Request
        input = Types::ListRefreshSchedulesRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id)
        list_refresh_schedules(input)
      end

      def list_refresh_schedules(input : Types::ListRefreshSchedulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REFRESH_SCHEDULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all groups that are associated with a role.

      def list_role_memberships(
        aws_account_id : String,
        namespace : String,
        role : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoleMembershipsRequest.new(aws_account_id: aws_account_id, namespace: namespace, role: role, max_results: max_results, next_token: next_token)
        list_role_memberships(input)
      end

      def list_role_memberships(input : Types::ListRoleMembershipsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROLE_MEMBERSHIPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all self-upgrade requests for a Quick Suite account.

      def list_self_upgrades(
        aws_account_id : String,
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSelfUpgradesRequest.new(aws_account_id: aws_account_id, namespace: namespace, max_results: max_results, next_token: next_token)
        list_self_upgrades(input)
      end

      def list_self_upgrades(input : Types::ListSelfUpgradesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SELF_UPGRADES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to a resource.

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

      # Lists all the aliases of a template.

      def list_template_aliases(
        aws_account_id : String,
        template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateAliasesRequest.new(aws_account_id: aws_account_id, template_id: template_id, max_results: max_results, next_token: next_token)
        list_template_aliases(input)
      end

      def list_template_aliases(input : Types::ListTemplateAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the versions of the templates in the current Amazon Quick Sight account.

      def list_template_versions(
        aws_account_id : String,
        template_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateVersionsRequest.new(aws_account_id: aws_account_id, template_id: template_id, max_results: max_results, next_token: next_token)
        list_template_versions(input)
      end

      def list_template_versions(input : Types::ListTemplateVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the templates in the current Amazon Quick Sight account.

      def list_templates(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplatesRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_templates(input)
      end

      def list_templates(input : Types::ListTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the aliases of a theme.

      def list_theme_aliases(
        aws_account_id : String,
        theme_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThemeAliasesRequest.new(aws_account_id: aws_account_id, theme_id: theme_id, max_results: max_results, next_token: next_token)
        list_theme_aliases(input)
      end

      def list_theme_aliases(input : Types::ListThemeAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THEME_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the versions of the themes in the current Amazon Web Services account.

      def list_theme_versions(
        aws_account_id : String,
        theme_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListThemeVersionsRequest.new(aws_account_id: aws_account_id, theme_id: theme_id, max_results: max_results, next_token: next_token)
        list_theme_versions(input)
      end

      def list_theme_versions(input : Types::ListThemeVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THEME_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the themes in the current Amazon Web Services account.

      def list_themes(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListThemesRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token, type: type)
        list_themes(input)
      end

      def list_themes(input : Types::ListThemesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_THEMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the refresh schedules for a topic.

      def list_topic_refresh_schedules(
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::ListTopicRefreshSchedulesRequest.new(aws_account_id: aws_account_id, topic_id: topic_id)
        list_topic_refresh_schedules(input)
      end

      def list_topic_refresh_schedules(input : Types::ListTopicRefreshSchedulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPIC_REFRESH_SCHEDULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all reviewed answers for a Q Topic.

      def list_topic_reviewed_answers(
        aws_account_id : String,
        topic_id : String
      ) : Protocol::Request
        input = Types::ListTopicReviewedAnswersRequest.new(aws_account_id: aws_account_id, topic_id: topic_id)
        list_topic_reviewed_answers(input)
      end

      def list_topic_reviewed_answers(input : Types::ListTopicReviewedAnswersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPIC_REVIEWED_ANSWERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the topics within an account.

      def list_topics(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTopicsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_topics(input)
      end

      def list_topics(input : Types::ListTopicsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOPICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon Quick Sight groups that an Amazon Quick Sight user is a member of.

      def list_user_groups(
        aws_account_id : String,
        namespace : String,
        user_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserGroupsRequest.new(aws_account_id: aws_account_id, namespace: namespace, user_name: user_name, max_results: max_results, next_token: next_token)
        list_user_groups(input)
      end

      def list_user_groups(input : Types::ListUserGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of the Amazon Quick Sight users belonging to this account.

      def list_users(
        aws_account_id : String,
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(aws_account_id: aws_account_id, namespace: namespace, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the VPC connections in the current set Amazon Web Services Region of an Amazon Web
      # Services account.

      def list_vpc_connections(
        aws_account_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVPCConnectionsRequest.new(aws_account_id: aws_account_id, max_results: max_results, next_token: next_token)
        list_vpc_connections(input)
      end

      def list_vpc_connections(input : Types::ListVPCConnectionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VPC_CONNECTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Predicts existing visuals or generates new visuals to answer a given query. This API uses trusted
      # identity propagation to ensure that an end user is authenticated and receives the embed URL that is
      # specific to that user. The IAM Identity Center application that the user has logged into needs to
      # have trusted Identity Propagation enabled for Quick Suite with the scope value set to
      # quicksight:read . Before you use this action, make sure that you have configured the relevant Quick
      # Suite resource and permissions. We recommend enabling the QSearchStatus API to unlock the full
      # potential of PredictQnA . When QSearchStatus is enabled, it first checks the specified dashboard for
      # any existing visuals that match the question. If no matching visuals are found, PredictQnA uses
      # generative Q&amp;A to provide an answer. To update the QSearchStatus , see
      # UpdateQuickSightQSearchConfiguration .

      def predict_qa_results(
        aws_account_id : String,
        query_text : String,
        include_generated_answer : String? = nil,
        include_quick_sight_q_index : String? = nil,
        max_topics_to_consider : Int32? = nil
      ) : Protocol::Request
        input = Types::PredictQAResultsRequest.new(aws_account_id: aws_account_id, query_text: query_text, include_generated_answer: include_generated_answer, include_quick_sight_q_index: include_quick_sight_q_index, max_topics_to_consider: max_topics_to_consider)
        predict_qa_results(input)
      end

      def predict_qa_results(input : Types::PredictQAResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREDICT_QA_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates the dataset refresh properties for the dataset.

      def put_data_set_refresh_properties(
        aws_account_id : String,
        data_set_id : String,
        data_set_refresh_properties : Types::DataSetRefreshProperties
      ) : Protocol::Request
        input = Types::PutDataSetRefreshPropertiesRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, data_set_refresh_properties: data_set_refresh_properties)
        put_data_set_refresh_properties(input)
      end

      def put_data_set_refresh_properties(input : Types::PutDataSetRefreshPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DATA_SET_REFRESH_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Quick Sight user whose identity is associated with the Identity and Access
      # Management (IAM) identity or role specified in the request. When you register a new user from the
      # Quick Sight API, Quick Sight generates a registration URL. The user accesses this registration URL
      # to create their account. Quick Sight doesn't send a registration email to users who are registered
      # from the Quick Sight API. If you want new users to receive a registration email, then add those
      # users in the Quick Sight console. For more information on registering a new user in the Quick Sight
      # console, see Inviting users to access Quick Sight .

      def register_user(
        aws_account_id : String,
        email : String,
        identity_type : String,
        namespace : String,
        user_role : String,
        custom_federation_provider_url : String? = nil,
        custom_permissions_name : String? = nil,
        external_login_federation_provider_type : String? = nil,
        external_login_id : String? = nil,
        iam_arn : String? = nil,
        session_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        user_name : String? = nil
      ) : Protocol::Request
        input = Types::RegisterUserRequest.new(aws_account_id: aws_account_id, email: email, identity_type: identity_type, namespace: namespace, user_role: user_role, custom_federation_provider_url: custom_federation_provider_url, custom_permissions_name: custom_permissions_name, external_login_federation_provider_type: external_login_federation_provider_type, external_login_id: external_login_id, iam_arn: iam_arn, session_name: session_name, tags: tags, user_name: user_name)
        register_user(input)
      end

      def register_user(input : Types::RegisterUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restores an analysis.

      def restore_analysis(
        analysis_id : String,
        aws_account_id : String,
        restore_to_folders : Bool? = nil
      ) : Protocol::Request
        input = Types::RestoreAnalysisRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id, restore_to_folders: restore_to_folders)
        restore_analysis(input)
      end

      def restore_analysis(input : Types::RestoreAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for action connectors in the specified Amazon Web Services account using filters. You can
      # search by connector name, type, or user permissions.

      def search_action_connectors(
        aws_account_id : String,
        filters : Array(Types::ActionConnectorSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchActionConnectorsRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_action_connectors(input)
      end

      def search_action_connectors(input : Types::SearchActionConnectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ACTION_CONNECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for analyses that belong to the user specified in the filter. This operation is eventually
      # consistent. The results are best effort and may not reflect very recent updates and changes.

      def search_analyses(
        aws_account_id : String,
        filters : Array(Types::AnalysisSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchAnalysesRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_analyses(input)
      end

      def search_analyses(input : Types::SearchAnalysesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ANALYSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for dashboards that belong to a user. This operation is eventually consistent. The results
      # are best effort and may not reflect very recent updates and changes.

      def search_dashboards(
        aws_account_id : String,
        filters : Array(Types::DashboardSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchDashboardsRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_dashboards(input)
      end

      def search_dashboards(input : Types::SearchDashboardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DASHBOARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the SearchDataSets operation to search for datasets that belong to an account.

      def search_data_sets(
        aws_account_id : String,
        filters : Array(Types::DataSetSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchDataSetsRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_data_sets(input)
      end

      def search_data_sets(input : Types::SearchDataSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DATA_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the SearchDataSources operation to search for data sources that belong to an account.

      def search_data_sources(
        aws_account_id : String,
        filters : Array(Types::DataSourceSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchDataSourcesRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_data_sources(input)
      end

      def search_data_sources(input : Types::SearchDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Search for the flows in an Amazon Web Services account.

      def search_flows(
        aws_account_id : String,
        filters : Array(Types::SearchFlowsFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchFlowsInput.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_flows(input)
      end

      def search_flows(input : Types::SearchFlowsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the subfolders in a folder.

      def search_folders(
        aws_account_id : String,
        filters : Array(Types::FolderSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchFoldersRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_folders(input)
      end

      def search_folders(input : Types::SearchFoldersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_FOLDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use the SearchGroups operation to search groups in a specified Quick Sight namespace using the
      # supplied filters.

      def search_groups(
        aws_account_id : String,
        filters : Array(Types::GroupSearchFilter),
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchGroupsRequest.new(aws_account_id: aws_account_id, filters: filters, namespace: namespace, max_results: max_results, next_token: next_token)
        search_groups(input)
      end

      def search_groups(input : Types::SearchGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for any Q topic that exists in an Quick Suite account.

      def search_topics(
        aws_account_id : String,
        filters : Array(Types::TopicSearchFilter),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchTopicsRequest.new(aws_account_id: aws_account_id, filters: filters, max_results: max_results, next_token: next_token)
        search_topics(input)
      end

      def search_topics(input : Types::SearchTopicsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_TOPICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an Asset Bundle export job. An Asset Bundle export job exports specified Amazon Quick Sight
      # assets. You can also choose to export any asset dependencies in the same job. Export jobs run
      # asynchronously and can be polled with a DescribeAssetBundleExportJob API call. When a job is
      # successfully completed, a download URL that contains the exported assets is returned. The URL is
      # valid for 5 minutes and can be refreshed with a DescribeAssetBundleExportJob API call. Each Amazon
      # Quick Sight account can run up to 5 export jobs concurrently. The API caller must have the necessary
      # permissions in their IAM role to access each resource before the resources can be exported.

      def start_asset_bundle_export_job(
        asset_bundle_export_job_id : String,
        aws_account_id : String,
        export_format : String,
        resource_arns : Array(String),
        cloud_formation_override_property_configuration : Types::AssetBundleCloudFormationOverridePropertyConfiguration? = nil,
        include_all_dependencies : Bool? = nil,
        include_folder_members : String? = nil,
        include_folder_memberships : Bool? = nil,
        include_permissions : Bool? = nil,
        include_tags : Bool? = nil,
        validation_strategy : Types::AssetBundleExportJobValidationStrategy? = nil
      ) : Protocol::Request
        input = Types::StartAssetBundleExportJobRequest.new(asset_bundle_export_job_id: asset_bundle_export_job_id, aws_account_id: aws_account_id, export_format: export_format, resource_arns: resource_arns, cloud_formation_override_property_configuration: cloud_formation_override_property_configuration, include_all_dependencies: include_all_dependencies, include_folder_members: include_folder_members, include_folder_memberships: include_folder_memberships, include_permissions: include_permissions, include_tags: include_tags, validation_strategy: validation_strategy)
        start_asset_bundle_export_job(input)
      end

      def start_asset_bundle_export_job(input : Types::StartAssetBundleExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ASSET_BUNDLE_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an Asset Bundle import job. An Asset Bundle import job imports specified Amazon Quick Sight
      # assets into an Amazon Quick Sight account. You can also choose to import a naming prefix and
      # specified configuration overrides. The assets that are contained in the bundle file that you provide
      # are used to create or update a new or existing asset in your Amazon Quick Sight account. Each Amazon
      # Quick Sight account can run up to 5 import jobs concurrently. The API caller must have the necessary
      # "create" , "describe" , and "update" permissions in their IAM role to access each resource type that
      # is contained in the bundle file before the resources can be imported.

      def start_asset_bundle_import_job(
        asset_bundle_import_job_id : String,
        asset_bundle_import_source : Types::AssetBundleImportSource,
        aws_account_id : String,
        failure_action : String? = nil,
        override_parameters : Types::AssetBundleImportJobOverrideParameters? = nil,
        override_permissions : Types::AssetBundleImportJobOverridePermissions? = nil,
        override_tags : Types::AssetBundleImportJobOverrideTags? = nil,
        override_validation_strategy : Types::AssetBundleImportJobOverrideValidationStrategy? = nil
      ) : Protocol::Request
        input = Types::StartAssetBundleImportJobRequest.new(asset_bundle_import_job_id: asset_bundle_import_job_id, asset_bundle_import_source: asset_bundle_import_source, aws_account_id: aws_account_id, failure_action: failure_action, override_parameters: override_parameters, override_permissions: override_permissions, override_tags: override_tags, override_validation_strategy: override_validation_strategy)
        start_asset_bundle_import_job(input)
      end

      def start_asset_bundle_import_job(input : Types::StartAssetBundleImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ASSET_BUNDLE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an asynchronous job that generates a snapshot of a dashboard's output. You can request one or
      # several of the following format configurations in each API call. 1 Paginated PDF 1 Excel workbook
      # that includes up to 5 table or pivot table visuals 5 CSVs from table or pivot table visuals The
      # status of a submitted job can be polled with the DescribeDashboardSnapshotJob API. When you call the
      # DescribeDashboardSnapshotJob API, check the JobStatus field in the response. Once the job reaches a
      # COMPLETED or FAILED status, use the DescribeDashboardSnapshotJobResult API to obtain the URLs for
      # the generated files. If the job fails, the DescribeDashboardSnapshotJobResult API returns detailed
      # information about the error that occurred. StartDashboardSnapshotJob API throttling Quick Sight
      # utilizes API throttling to create a more consistent user experience within a time span for customers
      # when they call the StartDashboardSnapshotJob . By default, 12 jobs can run simlutaneously in one
      # Amazon Web Services account and users can submit up 10 API requests per second before an account is
      # throttled. If an overwhelming number of API requests are made by the same user in a short period of
      # time, Quick Sight throttles the API calls to maintin an optimal experience and reliability for all
      # Quick Sight users. Common throttling scenarios The following list provides information about the
      # most commin throttling scenarios that can occur. A large number of SnapshotExport API jobs are
      # running simultaneously on an Amazon Web Services account. When a new StartDashboardSnapshotJob is
      # created and there are already 12 jobs with the RUNNING status, the new job request fails and returns
      # a LimitExceededException error. Wait for a current job to comlpete before you resubmit the new job.
      # A large number of API requests are submitted on an Amazon Web Services account. When a user makes
      # more than 10 API calls to the Quick Sight API in one second, a ThrottlingException is returned. If
      # your use case requires a higher throttling limit, contact your account admin or Amazon Web
      # ServicesSupport to explore options to tailor a more optimal expereince for your account. Best
      # practices to handle throttling If your use case projects high levels of API traffic, try to reduce
      # the degree of frequency and parallelism of API calls as much as you can to avoid throttling. You can
      # also perform a timing test to calculate an estimate for the total processing time of your projected
      # load that stays within the throttling limits of the Quick Sight APIs. For example, if your projected
      # traffic is 100 snapshot jobs before 12:00 PM per day, start 12 jobs in parallel and measure the
      # amount of time it takes to proccess all 12 jobs. Once you obtain the result, multiply the duration
      # by 9, for example (12 minutes * 9 = 108 minutes) . Use the new result to determine the latest time
      # at which the jobs need to be started to meet your target deadline. The time that it takes to process
      # a job can be impacted by the following factors: The dataset type (Direct Query or SPICE). The size
      # of the dataset. The complexity of the calculated fields that are used in the dashboard. The number
      # of visuals that are on a sheet. The types of visuals that are on the sheet. The number of formats
      # and snapshots that are requested in the job configuration. The size of the generated snapshots.
      # Registered user support You can generate snapshots for registered Quick Sight users by using the
      # Snapshot Job APIs with identity-enhanced IAM role session credentials . This approach allows you to
      # create snapshots on behalf of specific Quick Sight users while respecting their row-level security
      # (RLS), column-level security (CLS), dynamic default parameters and dashboard parameter/filter
      # settings. To generate snapshots for registered Quick Sight users, you need to: Obtain
      # identity-enhanced IAM role session credentials from Amazon Web Services Security Token Service
      # (STS). Use these credentials to call the Snapshot Job APIs. Identity-enhanced credentials are
      # credentials that contain information about the end user (e.g., registered Quick Sight user). If your
      # Quick Sight users are backed by Amazon Web Services Identity Center , then you need to set up a
      # trusted token issuer . Then, getting identity-enhanced IAM credentials for a Quick Sight user will
      # look like the following: Authenticate user with your OIDC compliant Identity Provider. You should
      # get auth tokens back. Use the OIDC API, CreateTokenWithIAM , to exchange auth tokens to IAM tokens.
      # One of the resulted tokens will be identity token. Call STS AssumeRole API as you normally would,
      # but provide an extra ProvidedContexts parameter in the API request. The list of contexts must have a
      # single trusted context assertion. The ProviderArn should be
      # arn:aws:iam::aws:contextProvider/IdentityCenter while ContextAssertion will be the identity token
      # you received in response from CreateTokenWithIAM For more details, see IdC documentation on
      # Identity-enhanced IAM role sessions . To obtain Identity-enhanced credentials for Quick Sight native
      # users, IAM federated users, or Active Directory users, follow the steps below: Call Quick Sight
      # GetIdentityContext API to get identity token. Call STS AssumeRole API as you normally would, but
      # provide extra ProvidedContexts parameter in the API request. The list of contexts must have a single
      # trusted context assertion. The ProviderArn should be arn:aws:iam::aws:contextProvider/QuickSight
      # while ContextAssertion will be the identity token you received in response from GetIdentityContext
      # After obtaining the identity-enhanced IAM role session credentials, you can use them to start a job,
      # describe the job and describe job result. You can use the same credentials as long as they haven't
      # expired. All API requests made with these credentials are considered to be made by the impersonated
      # Quick Sight user. When using identity-enhanced session credentials, set the UserConfiguration
      # request attribute to null. Otherwise, the request will be invalid. Possible error scenarios The
      # request fails with an Access Denied error in the following scenarios: The credentials have expired.
      # The impersonated Quick Sight user doesn't have access to the specified dashboard. The impersonated
      # Quick Sight user is restricted from exporting data in the selected formats. For more information
      # about export restrictions, see Customizing access to Amazon Quick Sight capabilities .

      def start_dashboard_snapshot_job(
        aws_account_id : String,
        dashboard_id : String,
        snapshot_configuration : Types::SnapshotConfiguration,
        snapshot_job_id : String,
        user_configuration : Types::SnapshotUserConfiguration? = nil
      ) : Protocol::Request
        input = Types::StartDashboardSnapshotJobRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, snapshot_configuration: snapshot_configuration, snapshot_job_id: snapshot_job_id, user_configuration: user_configuration)
        start_dashboard_snapshot_job(input)
      end

      def start_dashboard_snapshot_job(input : Types::StartDashboardSnapshotJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DASHBOARD_SNAPSHOT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an asynchronous job that runs an existing dashboard schedule and sends the dashboard snapshot
      # through email. Only one job can run simultaneously in a given schedule. Repeated requests are
      # skipped with a 202 HTTP status code. For more information, see Scheduling and sending Amazon Quick
      # Sight reports by email and Configuring email report settings for a Amazon Quick Sight dashboard in
      # the Amazon Quick Sight User Guide .

      def start_dashboard_snapshot_job_schedule(
        aws_account_id : String,
        dashboard_id : String,
        schedule_id : String
      ) : Protocol::Request
        input = Types::StartDashboardSnapshotJobScheduleRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, schedule_id: schedule_id)
        start_dashboard_snapshot_job_schedule(input)
      end

      def start_dashboard_snapshot_job_schedule(input : Types::StartDashboardSnapshotJobScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DASHBOARD_SNAPSHOT_JOB_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified Amazon Quick Sight resource. Tags can
      # help you organize and categorize your resources. You can also use them to scope user permissions, by
      # granting a user permission to access or change only resources with certain tag values. You can use
      # the TagResource operation with a resource that already has tags. If you specify a new tag key for
      # the resource, this tag is appended to the list of tags associated with the resource. If you specify
      # a tag key that is already associated with the resource, the new tag value that you specify replaces
      # the previous value for that tag. You can associate as many as 50 tags with a resource. Amazon Quick
      # Sight supports tagging on data set, data source, dashboard, template, topic, and user. Tagging for
      # Amazon Quick Sight works in a similar way to tagging for other Amazon Web Services services, except
      # for the following: Tags are used to track costs for users in Amazon Quick Sight. You can't tag other
      # resources that Amazon Quick Sight costs are based on, such as storage capacoty (SPICE), session
      # usage, alert consumption, or reporting units. Amazon Quick Sight doesn't currently support the tag
      # editor for Resource Groups.

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

      # Removes a tag or tags from a resource.

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

      # Applies a custom permissions profile to an account.

      def update_account_custom_permission(
        aws_account_id : String,
        custom_permissions_name : String
      ) : Protocol::Request
        input = Types::UpdateAccountCustomPermissionRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name)
        update_account_custom_permission(input)
      end

      def update_account_custom_permission(input : Types::UpdateAccountCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates Amazon Quick Sight customizations. Currently, the only customization that you can use is a
      # theme. You can use customizations for your Amazon Web Services account or, if you specify a
      # namespace, for a Quick Sight namespace instead. Customizations that apply to a namespace override
      # customizations that apply to an Amazon Web Services account. To find out which customizations apply,
      # use the DescribeAccountCustomization API operation.

      def update_account_customization(
        account_customization : Types::AccountCustomization,
        aws_account_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountCustomizationRequest.new(account_customization: account_customization, aws_account_id: aws_account_id, namespace: namespace)
        update_account_customization(input)
      end

      def update_account_customization(input : Types::UpdateAccountCustomizationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_CUSTOMIZATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Amazon Quick Sight settings in your Amazon Web Services account.

      def update_account_settings(
        aws_account_id : String,
        default_namespace : String,
        notification_email : String? = nil,
        termination_protection_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountSettingsRequest.new(aws_account_id: aws_account_id, default_namespace: default_namespace, notification_email: notification_email, termination_protection_enabled: termination_protection_enabled)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing action connector with new configuration details, authentication settings, or
      # enabled actions. You can modify the connector's name, description, authentication configuration, and
      # which actions are enabled. For more information,
      # https://docs.aws.amazon.com/quicksuite/latest/userguide/quick-action-auth.html .

      def update_action_connector(
        action_connector_id : String,
        authentication_config : Types::AuthConfig,
        aws_account_id : String,
        name : String,
        description : String? = nil,
        vpc_connection_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateActionConnectorRequest.new(action_connector_id: action_connector_id, authentication_config: authentication_config, aws_account_id: aws_account_id, name: name, description: description, vpc_connection_arn: vpc_connection_arn)
        update_action_connector(input)
      end

      def update_action_connector(input : Types::UpdateActionConnectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACTION_CONNECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the permissions for an action connector by granting or revoking access for specific users
      # and groups. You can control who can view, use, or manage the action connector.

      def update_action_connector_permissions(
        action_connector_id : String,
        aws_account_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateActionConnectorPermissionsRequest.new(action_connector_id: action_connector_id, aws_account_id: aws_account_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_action_connector_permissions(input)
      end

      def update_action_connector_permissions(input : Types::UpdateActionConnectorPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACTION_CONNECTOR_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an analysis in Amazon Quick Sight

      def update_analysis(
        analysis_id : String,
        aws_account_id : String,
        name : String,
        definition : Types::AnalysisDefinition? = nil,
        parameters : Types::Parameters? = nil,
        source_entity : Types::AnalysisSourceEntity? = nil,
        theme_arn : String? = nil,
        validation_strategy : Types::ValidationStrategy? = nil
      ) : Protocol::Request
        input = Types::UpdateAnalysisRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id, name: name, definition: definition, parameters: parameters, source_entity: source_entity, theme_arn: theme_arn, validation_strategy: validation_strategy)
        update_analysis(input)
      end

      def update_analysis(input : Types::UpdateAnalysisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANALYSIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the read and write permissions for an analysis.

      def update_analysis_permissions(
        analysis_id : String,
        aws_account_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateAnalysisPermissionsRequest.new(analysis_id: analysis_id, aws_account_id: aws_account_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_analysis_permissions(input)
      end

      def update_analysis_permissions(input : Types::UpdateAnalysisPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANALYSIS_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Quick Suite application with a token exchange grant. This operation only supports Quick
      # Suite applications that are registered with IAM Identity Center.

      def update_application_with_token_exchange_grant(
        aws_account_id : String,
        namespace : String
      ) : Protocol::Request
        input = Types::UpdateApplicationWithTokenExchangeGrantRequest.new(aws_account_id: aws_account_id, namespace: namespace)
        update_application_with_token_exchange_grant(input)
      end

      def update_application_with_token_exchange_grant(input : Types::UpdateApplicationWithTokenExchangeGrantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION_WITH_TOKEN_EXCHANGE_GRANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a brand.

      def update_brand(
        aws_account_id : String,
        brand_id : String,
        brand_definition : Types::BrandDefinition? = nil
      ) : Protocol::Request
        input = Types::UpdateBrandRequest.new(aws_account_id: aws_account_id, brand_id: brand_id, brand_definition: brand_definition)
        update_brand(input)
      end

      def update_brand(input : Types::UpdateBrandRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRAND, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a brand assignment.

      def update_brand_assignment(
        aws_account_id : String,
        brand_arn : String
      ) : Protocol::Request
        input = Types::UpdateBrandAssignmentRequest.new(aws_account_id: aws_account_id, brand_arn: brand_arn)
        update_brand_assignment(input)
      end

      def update_brand_assignment(input : Types::UpdateBrandAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRAND_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the published version of a brand.

      def update_brand_published_version(
        aws_account_id : String,
        brand_id : String,
        version_id : String
      ) : Protocol::Request
        input = Types::UpdateBrandPublishedVersionRequest.new(aws_account_id: aws_account_id, brand_id: brand_id, version_id: version_id)
        update_brand_published_version(input)
      end

      def update_brand_published_version(input : Types::UpdateBrandPublishedVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BRAND_PUBLISHED_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom permissions profile.

      def update_custom_permissions(
        aws_account_id : String,
        custom_permissions_name : String,
        capabilities : Types::Capabilities? = nil
      ) : Protocol::Request
        input = Types::UpdateCustomPermissionsRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name, capabilities: capabilities)
        update_custom_permissions(input)
      end

      def update_custom_permissions(input : Types::UpdateCustomPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a dashboard in an Amazon Web Services account. Updating a Dashboard creates a new dashboard
      # version but does not immediately publish the new version. You can update the published version of a
      # dashboard by using the UpdateDashboardPublishedVersion API operation.

      def update_dashboard(
        aws_account_id : String,
        dashboard_id : String,
        name : String,
        dashboard_publish_options : Types::DashboardPublishOptions? = nil,
        definition : Types::DashboardVersionDefinition? = nil,
        parameters : Types::Parameters? = nil,
        source_entity : Types::DashboardSourceEntity? = nil,
        theme_arn : String? = nil,
        validation_strategy : Types::ValidationStrategy? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDashboardRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, name: name, dashboard_publish_options: dashboard_publish_options, definition: definition, parameters: parameters, source_entity: source_entity, theme_arn: theme_arn, validation_strategy: validation_strategy, version_description: version_description)
        update_dashboard(input)
      end

      def update_dashboard(input : Types::UpdateDashboardRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the linked analyses on a dashboard.

      def update_dashboard_links(
        aws_account_id : String,
        dashboard_id : String,
        link_entities : Array(String)
      ) : Protocol::Request
        input = Types::UpdateDashboardLinksRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, link_entities: link_entities)
        update_dashboard_links(input)
      end

      def update_dashboard_links(input : Types::UpdateDashboardLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARD_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates read and write permissions on a dashboard.

      def update_dashboard_permissions(
        aws_account_id : String,
        dashboard_id : String,
        grant_link_permissions : Array(Types::ResourcePermission)? = nil,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_link_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateDashboardPermissionsRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, grant_link_permissions: grant_link_permissions, grant_permissions: grant_permissions, revoke_link_permissions: revoke_link_permissions, revoke_permissions: revoke_permissions)
        update_dashboard_permissions(input)
      end

      def update_dashboard_permissions(input : Types::UpdateDashboardPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARD_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the published version of a dashboard.

      def update_dashboard_published_version(
        aws_account_id : String,
        dashboard_id : String,
        version_number : Int64
      ) : Protocol::Request
        input = Types::UpdateDashboardPublishedVersionRequest.new(aws_account_id: aws_account_id, dashboard_id: dashboard_id, version_number: version_number)
        update_dashboard_published_version(input)
      end

      def update_dashboard_published_version(input : Types::UpdateDashboardPublishedVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARD_PUBLISHED_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Dashboard QA configuration.

      def update_dashboards_qa_configuration(
        aws_account_id : String,
        dashboards_qa_status : String
      ) : Protocol::Request
        input = Types::UpdateDashboardsQAConfigurationRequest.new(aws_account_id: aws_account_id, dashboards_qa_status: dashboards_qa_status)
        update_dashboards_qa_configuration(input)
      end

      def update_dashboards_qa_configuration(input : Types::UpdateDashboardsQAConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DASHBOARDS_QA_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a dataset. This operation doesn't support datasets that include uploaded files as a source.
      # Partial updates are not supported by this operation.

      def update_data_set(
        aws_account_id : String,
        data_set_id : String,
        import_mode : String,
        name : String,
        physical_table_map : Hash(String, Types::PhysicalTable),
        column_groups : Array(Types::ColumnGroup)? = nil,
        column_level_permission_rules : Array(Types::ColumnLevelPermissionRule)? = nil,
        data_prep_configuration : Types::DataPrepConfiguration? = nil,
        data_set_usage_configuration : Types::DataSetUsageConfiguration? = nil,
        dataset_parameters : Array(Types::DatasetParameter)? = nil,
        field_folders : Hash(String, Types::FieldFolder)? = nil,
        logical_table_map : Hash(String, Types::LogicalTable)? = nil,
        performance_configuration : Types::PerformanceConfiguration? = nil,
        row_level_permission_data_set : Types::RowLevelPermissionDataSet? = nil,
        row_level_permission_tag_configuration : Types::RowLevelPermissionTagConfiguration? = nil,
        semantic_model_configuration : Types::SemanticModelConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSetRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, import_mode: import_mode, name: name, physical_table_map: physical_table_map, column_groups: column_groups, column_level_permission_rules: column_level_permission_rules, data_prep_configuration: data_prep_configuration, data_set_usage_configuration: data_set_usage_configuration, dataset_parameters: dataset_parameters, field_folders: field_folders, logical_table_map: logical_table_map, performance_configuration: performance_configuration, row_level_permission_data_set: row_level_permission_data_set, row_level_permission_tag_configuration: row_level_permission_tag_configuration, semantic_model_configuration: semantic_model_configuration)
        update_data_set(input)
      end

      def update_data_set(input : Types::UpdateDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the permissions on a dataset. The permissions resource is
      # arn:aws:quicksight:region:aws-account-id:dataset/data-set-id .

      def update_data_set_permissions(
        aws_account_id : String,
        data_set_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSetPermissionsRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_data_set_permissions(input)
      end

      def update_data_set_permissions(input : Types::UpdateDataSetPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SET_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a data source.

      def update_data_source(
        aws_account_id : String,
        data_source_id : String,
        name : String,
        credentials : Types::DataSourceCredentials? = nil,
        data_source_parameters : Types::DataSourceParameters? = nil,
        ssl_properties : Types::SslProperties? = nil,
        vpc_connection_properties : Types::VpcConnectionProperties? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id, name: name, credentials: credentials, data_source_parameters: data_source_parameters, ssl_properties: ssl_properties, vpc_connection_properties: vpc_connection_properties)
        update_data_source(input)
      end

      def update_data_source(input : Types::UpdateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the permissions to a data source.

      def update_data_source_permissions(
        aws_account_id : String,
        data_source_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourcePermissionsRequest.new(aws_account_id: aws_account_id, data_source_id: data_source_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_data_source_permissions(input)
      end

      def update_data_source_permissions(input : Types::UpdateDataSourcePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Amazon Q Business application that is linked to a Quick Sight account.

      def update_default_q_business_application(
        application_id : String,
        aws_account_id : String,
        namespace : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDefaultQBusinessApplicationRequest.new(application_id: application_id, aws_account_id: aws_account_id, namespace: namespace)
        update_default_q_business_application(input)
      end

      def update_default_q_business_application(input : Types::UpdateDefaultQBusinessApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEFAULT_Q_BUSINESS_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates permissions against principals on a flow.

      def update_flow_permissions(
        aws_account_id : String,
        flow_id : String,
        grant_permissions : Array(Types::Permission)? = nil,
        revoke_permissions : Array(Types::Permission)? = nil
      ) : Protocol::Request
        input = Types::UpdateFlowPermissionsInput.new(aws_account_id: aws_account_id, flow_id: flow_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_flow_permissions(input)
      end

      def update_flow_permissions(input : Types::UpdateFlowPermissionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FLOW_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name of a folder.

      def update_folder(
        aws_account_id : String,
        folder_id : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateFolderRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, name: name)
        update_folder(input)
      end

      def update_folder(input : Types::UpdateFolderRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FOLDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates permissions of a folder.

      def update_folder_permissions(
        aws_account_id : String,
        folder_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateFolderPermissionsRequest.new(aws_account_id: aws_account_id, folder_id: folder_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_folder_permissions(input)
      end

      def update_folder_permissions(input : Types::UpdateFolderPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FOLDER_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes a group description.

      def update_group(
        aws_account_id : String,
        group_name : String,
        namespace : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGroupRequest.new(aws_account_id: aws_account_id, group_name: group_name, namespace: namespace, description: description)
        update_group(input)
      end

      def update_group(input : Types::UpdateGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing IAM policy assignment. This operation updates only the optional parameter or
      # parameters that are specified in the request. This overwrites all of the users included in
      # Identities .

      def update_iam_policy_assignment(
        assignment_name : String,
        aws_account_id : String,
        namespace : String,
        assignment_status : String? = nil,
        identities : Hash(String, Array(String))? = nil,
        policy_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIAMPolicyAssignmentRequest.new(assignment_name: assignment_name, aws_account_id: aws_account_id, namespace: namespace, assignment_status: assignment_status, identities: identities, policy_arn: policy_arn)
        update_iam_policy_assignment(input)
      end

      def update_iam_policy_assignment(input : Types::UpdateIAMPolicyAssignmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IAM_POLICY_ASSIGNMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates services and authorized targets to configure what the Quick Sight IAM Identity
      # Center application can access. This operation is only supported for Quick Sight accounts using IAM
      # Identity Center

      def update_identity_propagation_config(
        aws_account_id : String,
        service : String,
        authorized_targets : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateIdentityPropagationConfigRequest.new(aws_account_id: aws_account_id, service: service, authorized_targets: authorized_targets)
        update_identity_propagation_config(input)
      end

      def update_identity_propagation_config(input : Types::UpdateIdentityPropagationConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IDENTITY_PROPAGATION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the content and status of IP rules. Traffic from a source is allowed when the source
      # satisfies either the IpRestrictionRule , VpcIdRestrictionRule , or VpcEndpointIdRestrictionRule . To
      # use this operation, you must provide the entire map of rules. You can use the DescribeIpRestriction
      # operation to get the current rule map.

      def update_ip_restriction(
        aws_account_id : String,
        enabled : Bool? = nil,
        ip_restriction_rule_map : Hash(String, String)? = nil,
        vpc_endpoint_id_restriction_rule_map : Hash(String, String)? = nil,
        vpc_id_restriction_rule_map : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateIpRestrictionRequest.new(aws_account_id: aws_account_id, enabled: enabled, ip_restriction_rule_map: ip_restriction_rule_map, vpc_endpoint_id_restriction_rule_map: vpc_endpoint_id_restriction_rule_map, vpc_id_restriction_rule_map: vpc_id_restriction_rule_map)
        update_ip_restriction(input)
      end

      def update_ip_restriction(input : Types::UpdateIpRestrictionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_IP_RESTRICTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a customer managed key in a Quick Sight account.

      def update_key_registration(
        aws_account_id : String,
        key_registration : Array(Types::RegisteredCustomerManagedKey)
      ) : Protocol::Request
        input = Types::UpdateKeyRegistrationRequest.new(aws_account_id: aws_account_id, key_registration: key_registration)
        update_key_registration(input)
      end

      def update_key_registration(input : Types::UpdateKeyRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KEY_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API controls public sharing settings for your entire Quick Sight account, affecting data
      # security and access. When you enable public sharing: Dashboards can be shared publicly This setting
      # affects your entire Amazon Web Services account and all Quick Sight users Before proceeding: Ensure
      # you understand the security implications and have proper IAM permissions configured. Use the
      # UpdatePublicSharingSettings operation to turn on or turn off the public sharing settings of an
      # Amazon Quick Sight dashboard. To use this operation, turn on session capacity pricing for your
      # Amazon Quick Sight account. Before you can turn on public sharing on your account, make sure to give
      # public sharing permissions to an administrative user in the Identity and Access Management (IAM)
      # console. For more information on using IAM with Amazon Quick Sight, see Using Quick Suite with IAM
      # in the Amazon Quick Sight User Guide .

      def update_public_sharing_settings(
        aws_account_id : String,
        public_sharing_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdatePublicSharingSettingsRequest.new(aws_account_id: aws_account_id, public_sharing_enabled: public_sharing_enabled)
        update_public_sharing_settings(input)
      end

      def update_public_sharing_settings(input : Types::UpdatePublicSharingSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PUBLIC_SHARING_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a personalization configuration.

      def update_q_personalization_configuration(
        aws_account_id : String,
        personalization_mode : String
      ) : Protocol::Request
        input = Types::UpdateQPersonalizationConfigurationRequest.new(aws_account_id: aws_account_id, personalization_mode: personalization_mode)
        update_q_personalization_configuration(input)
      end

      def update_q_personalization_configuration(input : Types::UpdateQPersonalizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_Q_PERSONALIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the state of a Quick Sight Q Search configuration.

      def update_quick_sight_q_search_configuration(
        aws_account_id : String,
        q_search_status : String
      ) : Protocol::Request
        input = Types::UpdateQuickSightQSearchConfigurationRequest.new(aws_account_id: aws_account_id, q_search_status: q_search_status)
        update_quick_sight_q_search_configuration(input)
      end

      def update_quick_sight_q_search_configuration(input : Types::UpdateQuickSightQSearchConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUICK_SIGHT_Q_SEARCH_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a refresh schedule for a dataset.

      def update_refresh_schedule(
        aws_account_id : String,
        data_set_id : String,
        schedule : Types::RefreshSchedule
      ) : Protocol::Request
        input = Types::UpdateRefreshScheduleRequest.new(aws_account_id: aws_account_id, data_set_id: data_set_id, schedule: schedule)
        update_refresh_schedule(input)
      end

      def update_refresh_schedule(input : Types::UpdateRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the custom permissions that are associated with a role.

      def update_role_custom_permission(
        aws_account_id : String,
        custom_permissions_name : String,
        namespace : String,
        role : String
      ) : Protocol::Request
        input = Types::UpdateRoleCustomPermissionRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name, namespace: namespace, role: role)
        update_role_custom_permission(input)
      end

      def update_role_custom_permission(input : Types::UpdateRoleCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROLE_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the SPICE capacity configuration for a Quick Sight account.

      def update_spice_capacity_configuration(
        aws_account_id : String,
        purchase_mode : String
      ) : Protocol::Request
        input = Types::UpdateSPICECapacityConfigurationRequest.new(aws_account_id: aws_account_id, purchase_mode: purchase_mode)
        update_spice_capacity_configuration(input)
      end

      def update_spice_capacity_configuration(input : Types::UpdateSPICECapacityConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SPICE_CAPACITY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a self-upgrade request for a Quick Suite user by approving, denying, or verifying the
      # request.

      def update_self_upgrade(
        action : String,
        aws_account_id : String,
        namespace : String,
        upgrade_request_id : String
      ) : Protocol::Request
        input = Types::UpdateSelfUpgradeRequest.new(action: action, aws_account_id: aws_account_id, namespace: namespace, upgrade_request_id: upgrade_request_id)
        update_self_upgrade(input)
      end

      def update_self_upgrade(input : Types::UpdateSelfUpgradeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SELF_UPGRADE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the self-upgrade configuration for a Quick Suite account.

      def update_self_upgrade_configuration(
        aws_account_id : String,
        namespace : String,
        self_upgrade_status : String
      ) : Protocol::Request
        input = Types::UpdateSelfUpgradeConfigurationRequest.new(aws_account_id: aws_account_id, namespace: namespace, self_upgrade_status: self_upgrade_status)
        update_self_upgrade_configuration(input)
      end

      def update_self_upgrade_configuration(input : Types::UpdateSelfUpgradeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SELF_UPGRADE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a template from an existing Amazon Quick Sight analysis or another template.

      def update_template(
        aws_account_id : String,
        template_id : String,
        definition : Types::TemplateVersionDefinition? = nil,
        name : String? = nil,
        source_entity : Types::TemplateSourceEntity? = nil,
        validation_strategy : Types::ValidationStrategy? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplateRequest.new(aws_account_id: aws_account_id, template_id: template_id, definition: definition, name: name, source_entity: source_entity, validation_strategy: validation_strategy, version_description: version_description)
        update_template(input)
      end

      def update_template(input : Types::UpdateTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the template alias of a template.

      def update_template_alias(
        alias_name : String,
        aws_account_id : String,
        template_id : String,
        template_version_number : Int64
      ) : Protocol::Request
        input = Types::UpdateTemplateAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, template_id: template_id, template_version_number: template_version_number)
        update_template_alias(input)
      end

      def update_template_alias(input : Types::UpdateTemplateAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resource permissions for a template.

      def update_template_permissions(
        aws_account_id : String,
        template_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateTemplatePermissionsRequest.new(aws_account_id: aws_account_id, template_id: template_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_template_permissions(input)
      end

      def update_template_permissions(input : Types::UpdateTemplatePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TEMPLATE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a theme.

      def update_theme(
        aws_account_id : String,
        base_theme_id : String,
        theme_id : String,
        configuration : Types::ThemeConfiguration? = nil,
        name : String? = nil,
        version_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateThemeRequest.new(aws_account_id: aws_account_id, base_theme_id: base_theme_id, theme_id: theme_id, configuration: configuration, name: name, version_description: version_description)
        update_theme(input)
      end

      def update_theme(input : Types::UpdateThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an alias of a theme.

      def update_theme_alias(
        alias_name : String,
        aws_account_id : String,
        theme_id : String,
        theme_version_number : Int64
      ) : Protocol::Request
        input = Types::UpdateThemeAliasRequest.new(alias_name: alias_name, aws_account_id: aws_account_id, theme_id: theme_id, theme_version_number: theme_version_number)
        update_theme_alias(input)
      end

      def update_theme_alias(input : Types::UpdateThemeAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THEME_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resource permissions for a theme. Permissions apply to the action to grant or revoke
      # permissions on, for example "quicksight:DescribeTheme" . Theme permissions apply in groupings. Valid
      # groupings include the following for the three levels of permissions, which are user, owner, or no
      # permissions: User "quicksight:DescribeTheme" "quicksight:DescribeThemeAlias"
      # "quicksight:ListThemeAliases" "quicksight:ListThemeVersions" Owner "quicksight:DescribeTheme"
      # "quicksight:DescribeThemeAlias" "quicksight:ListThemeAliases" "quicksight:ListThemeVersions"
      # "quicksight:DeleteTheme" "quicksight:UpdateTheme" "quicksight:CreateThemeAlias"
      # "quicksight:DeleteThemeAlias" "quicksight:UpdateThemeAlias" "quicksight:UpdateThemePermissions"
      # "quicksight:DescribeThemePermissions" To specify no permissions, omit the permissions list.

      def update_theme_permissions(
        aws_account_id : String,
        theme_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateThemePermissionsRequest.new(aws_account_id: aws_account_id, theme_id: theme_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_theme_permissions(input)
      end

      def update_theme_permissions(input : Types::UpdateThemePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_THEME_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a topic.

      def update_topic(
        aws_account_id : String,
        topic : Types::TopicDetails,
        topic_id : String,
        custom_instructions : Types::CustomInstructions? = nil
      ) : Protocol::Request
        input = Types::UpdateTopicRequest.new(aws_account_id: aws_account_id, topic: topic, topic_id: topic_id, custom_instructions: custom_instructions)
        update_topic(input)
      end

      def update_topic(input : Types::UpdateTopicRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TOPIC, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the permissions of a topic.

      def update_topic_permissions(
        aws_account_id : String,
        topic_id : String,
        grant_permissions : Array(Types::ResourcePermission)? = nil,
        revoke_permissions : Array(Types::ResourcePermission)? = nil
      ) : Protocol::Request
        input = Types::UpdateTopicPermissionsRequest.new(aws_account_id: aws_account_id, topic_id: topic_id, grant_permissions: grant_permissions, revoke_permissions: revoke_permissions)
        update_topic_permissions(input)
      end

      def update_topic_permissions(input : Types::UpdateTopicPermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TOPIC_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a topic refresh schedule.

      def update_topic_refresh_schedule(
        aws_account_id : String,
        dataset_id : String,
        refresh_schedule : Types::TopicRefreshSchedule,
        topic_id : String
      ) : Protocol::Request
        input = Types::UpdateTopicRefreshScheduleRequest.new(aws_account_id: aws_account_id, dataset_id: dataset_id, refresh_schedule: refresh_schedule, topic_id: topic_id)
        update_topic_refresh_schedule(input)
      end

      def update_topic_refresh_schedule(input : Types::UpdateTopicRefreshScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TOPIC_REFRESH_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon Quick Sight user.

      def update_user(
        aws_account_id : String,
        email : String,
        namespace : String,
        role : String,
        user_name : String,
        custom_federation_provider_url : String? = nil,
        custom_permissions_name : String? = nil,
        external_login_federation_provider_type : String? = nil,
        external_login_id : String? = nil,
        unapply_custom_permissions : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateUserRequest.new(aws_account_id: aws_account_id, email: email, namespace: namespace, role: role, user_name: user_name, custom_federation_provider_url: custom_federation_provider_url, custom_permissions_name: custom_permissions_name, external_login_federation_provider_type: external_login_federation_provider_type, external_login_id: external_login_id, unapply_custom_permissions: unapply_custom_permissions)
        update_user(input)
      end

      def update_user(input : Types::UpdateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom permissions profile for a user.

      def update_user_custom_permission(
        aws_account_id : String,
        custom_permissions_name : String,
        namespace : String,
        user_name : String
      ) : Protocol::Request
        input = Types::UpdateUserCustomPermissionRequest.new(aws_account_id: aws_account_id, custom_permissions_name: custom_permissions_name, namespace: namespace, user_name: user_name)
        update_user_custom_permission(input)
      end

      def update_user_custom_permission(input : Types::UpdateUserCustomPermissionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_CUSTOM_PERMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a VPC connection.

      def update_vpc_connection(
        aws_account_id : String,
        name : String,
        role_arn : String,
        security_group_ids : Array(String),
        subnet_ids : Array(String),
        vpc_connection_id : String,
        dns_resolvers : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateVPCConnectionRequest.new(aws_account_id: aws_account_id, name: name, role_arn: role_arn, security_group_ids: security_group_ids, subnet_ids: subnet_ids, vpc_connection_id: vpc_connection_id, dns_resolvers: dns_resolvers)
        update_vpc_connection(input)
      end

      def update_vpc_connection(input : Types::UpdateVPCConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VPC_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
