module AwsSdk
  module Amp
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

      # The CreateAlertManagerDefinition operation creates the alert manager definition in a workspace. If a
      # workspace already has an alert manager definition, don't use this operation to update it. Instead,
      # use PutAlertManagerDefinition .

      def create_alert_manager_definition(
        data : Bytes,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateAlertManagerDefinitionRequest.new(data: data, workspace_id: workspace_id, client_token: client_token)
        create_alert_manager_definition(input)
      end

      def create_alert_manager_definition(input : Types::CreateAlertManagerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ALERT_MANAGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an anomaly detector within a workspace using the Random Cut Forest algorithm for time-series
      # analysis. The anomaly detector analyzes Amazon Managed Service for Prometheus metrics to identify
      # unusual patterns and behaviors.

      def create_anomaly_detector(
        alias_ : String,
        configuration : Types::AnomalyDetectorConfiguration,
        workspace_id : String,
        client_token : String? = nil,
        evaluation_interval_in_seconds : Int32? = nil,
        labels : Hash(String, String)? = nil,
        missing_data_action : Types::AnomalyDetectorMissingDataAction? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAnomalyDetectorRequest.new(alias_: alias_, configuration: configuration, workspace_id: workspace_id, client_token: client_token, evaluation_interval_in_seconds: evaluation_interval_in_seconds, labels: labels, missing_data_action: missing_data_action, tags: tags)
        create_anomaly_detector(input)
      end

      def create_anomaly_detector(input : Types::CreateAnomalyDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANOMALY_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The CreateLoggingConfiguration operation creates rules and alerting logging configuration for the
      # workspace. Use this operation to set the CloudWatch log group to which the logs will be published
      # to. These logging configurations are only for rules and alerting logs.

      def create_logging_configuration(
        log_group_arn : String,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateLoggingConfigurationRequest.new(log_group_arn: log_group_arn, workspace_id: workspace_id, client_token: client_token)
        create_logging_configuration(input)
      end

      def create_logging_configuration(input : Types::CreateLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a query logging configuration for the specified workspace. This operation enables logging of
      # queries that exceed the specified QSP threshold.

      def create_query_logging_configuration(
        destinations : Array(Types::LoggingDestination),
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateQueryLoggingConfigurationRequest.new(destinations: destinations, workspace_id: workspace_id, client_token: client_token)
        create_query_logging_configuration(input)
      end

      def create_query_logging_configuration(input : Types::CreateQueryLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUERY_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The CreateRuleGroupsNamespace operation creates a rule groups namespace within a workspace. A rule
      # groups namespace is associated with exactly one rules file. A workspace can have multiple rule
      # groups namespaces. The combined length of a rule group namespace and a rule group name cannot exceed
      # 721 UTF-8 bytes. Use this operation only to create new rule groups namespaces. To update an existing
      # rule groups namespace, use PutRuleGroupsNamespace .

      def create_rule_groups_namespace(
        data : Bytes,
        name : String,
        workspace_id : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRuleGroupsNamespaceRequest.new(data: data, name: name, workspace_id: workspace_id, client_token: client_token, tags: tags)
        create_rule_groups_namespace(input)
      end

      def create_rule_groups_namespace(input : Types::CreateRuleGroupsNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULE_GROUPS_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The CreateScraper operation creates a scraper to collect metrics. A scraper pulls metrics from
      # Prometheus-compatible sources and sends them to your Amazon Managed Service for Prometheus
      # workspace. You can configure scrapers to collect metrics from Amazon EKS clusters, Amazon MSK
      # clusters, or from VPC-based sources that support DNS-based service discovery. Scrapers are flexible,
      # and can be configured to control what metrics are collected, the frequency of collection, what
      # transformations are applied to the metrics, and more. An IAM role will be created for you that
      # Amazon Managed Service for Prometheus uses to access the metrics in your source. You must configure
      # this role with a policy that allows it to scrape metrics from your source. For Amazon EKS sources,
      # see Configuring your Amazon EKS cluster in the Amazon Managed Service for Prometheus User Guide .
      # The scrapeConfiguration parameter contains the base-64 encoded YAML configuration for the scraper.
      # When creating a scraper, the service creates a Network Interface in each Availability Zone that are
      # passed into CreateScraper through subnets. These network interfaces are used to connect to your
      # source within the VPC for scraping metrics. For more information about collectors, including what
      # metrics are collected, and how to configure the scraper, see Using an Amazon Web Services managed
      # collector in the Amazon Managed Service for Prometheus User Guide .

      def create_scraper(
        destination : Types::Destination,
        scrape_configuration : Types::ScrapeConfiguration,
        source : Types::Source,
        alias_ : String? = nil,
        client_token : String? = nil,
        role_configuration : Types::RoleConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateScraperRequest.new(destination: destination, scrape_configuration: scrape_configuration, source: source, alias_: alias_, client_token: client_token, role_configuration: role_configuration, tags: tags)
        create_scraper(input)
      end

      def create_scraper(input : Types::CreateScraperRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCRAPER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Prometheus workspace. A workspace is a logical space dedicated to the storage and querying
      # of Prometheus metrics. You can have one or more workspaces in each Region in your account.

      def create_workspace(
        alias_ : String? = nil,
        client_token : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkspaceRequest.new(alias_: alias_, client_token: client_token, kms_key_arn: kms_key_arn, tags: tags)
        create_workspace(input)
      end

      def create_workspace(input : Types::CreateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the alert manager definition from a workspace.

      def delete_alert_manager_definition(
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAlertManagerDefinitionRequest.new(workspace_id: workspace_id, client_token: client_token)
        delete_alert_manager_definition(input)
      end

      def delete_alert_manager_definition(input : Types::DeleteAlertManagerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ALERT_MANAGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an anomaly detector from a workspace. This operation is idempotent.

      def delete_anomaly_detector(
        anomaly_detector_id : String,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAnomalyDetectorRequest.new(anomaly_detector_id: anomaly_detector_id, workspace_id: workspace_id, client_token: client_token)
        delete_anomaly_detector(input)
      end

      def delete_anomaly_detector(input : Types::DeleteAnomalyDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANOMALY_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the rules and alerting logging configuration for a workspace. These logging configurations
      # are only for rules and alerting logs.

      def delete_logging_configuration(
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteLoggingConfigurationRequest.new(workspace_id: workspace_id, client_token: client_token)
        delete_logging_configuration(input)
      end

      def delete_logging_configuration(input : Types::DeleteLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the query logging configuration for the specified workspace.

      def delete_query_logging_configuration(
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteQueryLoggingConfigurationRequest.new(workspace_id: workspace_id, client_token: client_token)
        delete_query_logging_configuration(input)
      end

      def delete_query_logging_configuration(input : Types::DeleteQueryLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUERY_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource-based policy attached to an Amazon Managed Service for Prometheus workspace.

      def delete_resource_policy(
        workspace_id : String,
        client_token : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(workspace_id: workspace_id, client_token: client_token, revision_id: revision_id)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one rule groups namespace and its associated rule groups definition.

      def delete_rule_groups_namespace(
        name : String,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRuleGroupsNamespaceRequest.new(name: name, workspace_id: workspace_id, client_token: client_token)
        delete_rule_groups_namespace(input)
      end

      def delete_rule_groups_namespace(input : Types::DeleteRuleGroupsNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULE_GROUPS_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The DeleteScraper operation deletes one scraper, and stops any metrics collection that the scraper
      # performs.

      def delete_scraper(
        scraper_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteScraperRequest.new(scraper_id: scraper_id, client_token: client_token)
        delete_scraper(input)
      end

      def delete_scraper(input : Types::DeleteScraperRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCRAPER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the logging configuration for a Amazon Managed Service for Prometheus scraper.

      def delete_scraper_logging_configuration(
        scraper_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteScraperLoggingConfigurationRequest.new(scraper_id: scraper_id, client_token: client_token)
        delete_scraper_logging_configuration(input)
      end

      def delete_scraper_logging_configuration(input : Types::DeleteScraperLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCRAPER_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing workspace. When you delete a workspace, the data that has been ingested into it
      # is not immediately deleted. It will be permanently deleted within one month.

      def delete_workspace(
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteWorkspaceRequest.new(workspace_id: workspace_id, client_token: client_token)
        delete_workspace(input)
      end

      def delete_workspace(input : Types::DeleteWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the full information about the alert manager definition for a workspace.

      def describe_alert_manager_definition(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeAlertManagerDefinitionRequest.new(workspace_id: workspace_id)
        describe_alert_manager_definition(input)
      end

      def describe_alert_manager_definition(input : Types::DescribeAlertManagerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ALERT_MANAGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific anomaly detector, including its status and
      # configuration.

      def describe_anomaly_detector(
        anomaly_detector_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeAnomalyDetectorRequest.new(anomaly_detector_id: anomaly_detector_id, workspace_id: workspace_id)
        describe_anomaly_detector(input)
      end

      def describe_anomaly_detector(input : Types::DescribeAnomalyDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ANOMALY_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns complete information about the current rules and alerting logging configuration of the
      # workspace. These logging configurations are only for rules and alerting logs.

      def describe_logging_configuration(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeLoggingConfigurationRequest.new(workspace_id: workspace_id)
        describe_logging_configuration(input)
      end

      def describe_logging_configuration(input : Types::DescribeLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the details of the query logging configuration for the specified workspace.

      def describe_query_logging_configuration(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeQueryLoggingConfigurationRequest.new(workspace_id: workspace_id)
        describe_query_logging_configuration(input)
      end

      def describe_query_logging_configuration(input : Types::DescribeQueryLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_QUERY_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the resource-based policy attached to an Amazon Managed Service for
      # Prometheus workspace.

      def describe_resource_policy(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeResourcePolicyRequest.new(workspace_id: workspace_id)
        describe_resource_policy(input)
      end

      def describe_resource_policy(input : Types::DescribeResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns complete information about one rule groups namespace. To retrieve a list of rule groups
      # namespaces, use ListRuleGroupsNamespaces .

      def describe_rule_groups_namespace(
        name : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeRuleGroupsNamespaceRequest.new(name: name, workspace_id: workspace_id)
        describe_rule_groups_namespace(input)
      end

      def describe_rule_groups_namespace(input : Types::DescribeRuleGroupsNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RULE_GROUPS_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The DescribeScraper operation displays information about an existing scraper.

      def describe_scraper(
        scraper_id : String
      ) : Protocol::Request
        input = Types::DescribeScraperRequest.new(scraper_id: scraper_id)
        describe_scraper(input)
      end

      def describe_scraper(input : Types::DescribeScraperRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCRAPER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the logging configuration for a Amazon Managed Service for Prometheus scraper.

      def describe_scraper_logging_configuration(
        scraper_id : String
      ) : Protocol::Request
        input = Types::DescribeScraperLoggingConfigurationRequest.new(scraper_id: scraper_id)
        describe_scraper_logging_configuration(input)
      end

      def describe_scraper_logging_configuration(input : Types::DescribeScraperLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCRAPER_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about an existing workspace.

      def describe_workspace(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceRequest.new(workspace_id: workspace_id)
        describe_workspace(input)
      end

      def describe_workspace(input : Types::DescribeWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to return information about the configuration of a workspace. The configuration
      # details returned include workspace configuration status, label set limits, and retention period.

      def describe_workspace_configuration(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceConfigurationRequest.new(workspace_id: workspace_id)
        describe_workspace_configuration(input)
      end

      def describe_workspace_configuration(input : Types::DescribeWorkspaceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The GetDefaultScraperConfiguration operation returns the default scraper configuration used when
      # Amazon EKS creates a scraper for you.

      def get_default_scraper_configuration : Protocol::Request
        input = Types::GetDefaultScraperConfigurationRequest.new
        get_default_scraper_configuration(input)
      end

      def get_default_scraper_configuration(input : Types::GetDefaultScraperConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEFAULT_SCRAPER_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of anomaly detectors for a workspace with optional filtering by alias.

      def list_anomaly_detectors(
        workspace_id : String,
        alias_ : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnomalyDetectorsRequest.new(workspace_id: workspace_id, alias_: alias_, max_results: max_results, next_token: next_token)
        list_anomaly_detectors(input)
      end

      def list_anomaly_detectors(input : Types::ListAnomalyDetectorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANOMALY_DETECTORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of rule groups namespaces in a workspace.

      def list_rule_groups_namespaces(
        workspace_id : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRuleGroupsNamespacesRequest.new(workspace_id: workspace_id, max_results: max_results, name: name, next_token: next_token)
        list_rule_groups_namespaces(input)
      end

      def list_rule_groups_namespaces(input : Types::ListRuleGroupsNamespacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULE_GROUPS_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The ListScrapers operation lists all of the scrapers in your account. This includes scrapers being
      # created or deleted. You can optionally filter the returned list.

      def list_scrapers(
        filters : Hash(String, Array(String))? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScrapersRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_scrapers(input)
      end

      def list_scrapers(input : Types::ListScrapersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCRAPERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The ListTagsForResource operation returns the tags that are associated with an Amazon Managed
      # Service for Prometheus resource. Currently, the only resources that can be tagged are scrapers,
      # workspaces, and rule groups namespaces.

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

      # Lists all of the Amazon Managed Service for Prometheus workspaces in your account. This includes
      # workspaces being created or deleted.

      def list_workspaces(
        alias_ : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspacesRequest.new(alias_: alias_, max_results: max_results, next_token: next_token)
        list_workspaces(input)
      end

      def list_workspaces(input : Types::ListWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing alert manager definition in a workspace. If the workspace does not already have
      # an alert manager definition, don't use this operation to create it. Instead, use
      # CreateAlertManagerDefinition .

      def put_alert_manager_definition(
        data : Bytes,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PutAlertManagerDefinitionRequest.new(data: data, workspace_id: workspace_id, client_token: client_token)
        put_alert_manager_definition(input)
      end

      def put_alert_manager_definition(input : Types::PutAlertManagerDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ALERT_MANAGER_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When you call PutAnomalyDetector , the operation creates a new anomaly detector if one doesn't
      # exist, or updates an existing one. Each call to this operation triggers a complete retraining of the
      # detector, which includes querying the minimum required samples and backfilling the detector with
      # historical data. This process occurs regardless of whether you're making a minor change like
      # updating the evaluation interval or making more substantial modifications. The operation serves as
      # the single method for creating, updating, and retraining anomaly detectors.

      def put_anomaly_detector(
        anomaly_detector_id : String,
        configuration : Types::AnomalyDetectorConfiguration,
        workspace_id : String,
        client_token : String? = nil,
        evaluation_interval_in_seconds : Int32? = nil,
        labels : Hash(String, String)? = nil,
        missing_data_action : Types::AnomalyDetectorMissingDataAction? = nil
      ) : Protocol::Request
        input = Types::PutAnomalyDetectorRequest.new(anomaly_detector_id: anomaly_detector_id, configuration: configuration, workspace_id: workspace_id, client_token: client_token, evaluation_interval_in_seconds: evaluation_interval_in_seconds, labels: labels, missing_data_action: missing_data_action)
        put_anomaly_detector(input)
      end

      def put_anomaly_detector(input : Types::PutAnomalyDetectorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ANOMALY_DETECTOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates a resource-based policy for an Amazon Managed Service for Prometheus workspace.
      # Use resource-based policies to grant permissions to other AWS accounts or services to access your
      # workspace. Only Prometheus-compatible APIs can be used for workspace sharing. You can add
      # non-Prometheus-compatible APIs to the policy, but they will be ignored. For more information, see
      # Prometheus-compatible APIs in the Amazon Managed Service for Prometheus User Guide . If your
      # workspace uses customer-managed KMS keys for encryption, you must grant the principals in your
      # resource-based policy access to those KMS keys. You can do this by creating KMS grants. For more
      # information, see CreateGrant in the AWS Key Management Service API Reference and Encryption at rest
      # in the Amazon Managed Service for Prometheus User Guide . For more information about working with
      # IAM, see Using Amazon Managed Service for Prometheus with IAM in the Amazon Managed Service for
      # Prometheus User Guide .

      def put_resource_policy(
        policy_document : String,
        workspace_id : String,
        client_token : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy_document: policy_document, workspace_id: workspace_id, client_token: client_token, revision_id: revision_id)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing rule groups namespace within a workspace. A rule groups namespace is associated
      # with exactly one rules file. A workspace can have multiple rule groups namespaces. The combined
      # length of a rule group namespace and a rule group name cannot exceed 721 UTF-8 bytes. Use this
      # operation only to update existing rule groups namespaces. To create a new rule groups namespace, use
      # CreateRuleGroupsNamespace . You can't use this operation to add tags to an existing rule groups
      # namespace. Instead, use TagResource .

      def put_rule_groups_namespace(
        data : Bytes,
        name : String,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::PutRuleGroupsNamespaceRequest.new(data: data, name: name, workspace_id: workspace_id, client_token: client_token)
        put_rule_groups_namespace(input)
      end

      def put_rule_groups_namespace(input : Types::PutRuleGroupsNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RULE_GROUPS_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The TagResource operation associates tags with an Amazon Managed Service for Prometheus resource.
      # The only resources that can be tagged are rule groups namespaces, scrapers, and workspaces. If you
      # specify a new tag key for the resource, this tag is appended to the list of tags associated with the
      # resource. If you specify a tag key that is already associated with the resource, the new tag value
      # that you specify replaces the previous value for that tag. To remove a tag, use UntagResource .

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

      # Removes the specified tags from an Amazon Managed Service for Prometheus resource. The only
      # resources that can be tagged are rule groups namespaces, scrapers, and workspaces.

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

      # Updates the log group ARN or the workspace ID of the current rules and alerting logging
      # configuration. These logging configurations are only for rules and alerting logs.

      def update_logging_configuration(
        log_group_arn : String,
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateLoggingConfigurationRequest.new(log_group_arn: log_group_arn, workspace_id: workspace_id, client_token: client_token)
        update_logging_configuration(input)
      end

      def update_logging_configuration(input : Types::UpdateLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the query logging configuration for the specified workspace.

      def update_query_logging_configuration(
        destinations : Array(Types::LoggingDestination),
        workspace_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQueryLoggingConfigurationRequest.new(destinations: destinations, workspace_id: workspace_id, client_token: client_token)
        update_query_logging_configuration(input)
      end

      def update_query_logging_configuration(input : Types::UpdateQueryLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUERY_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing scraper. You can't use this function to update the source from which the scraper
      # is collecting metrics. To change the source, delete the scraper and create a new one.

      def update_scraper(
        scraper_id : String,
        alias_ : String? = nil,
        client_token : String? = nil,
        destination : Types::Destination? = nil,
        role_configuration : Types::RoleConfiguration? = nil,
        scrape_configuration : Types::ScrapeConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateScraperRequest.new(scraper_id: scraper_id, alias_: alias_, client_token: client_token, destination: destination, role_configuration: role_configuration, scrape_configuration: scrape_configuration)
        update_scraper(input)
      end

      def update_scraper(input : Types::UpdateScraperRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCRAPER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the logging configuration for a Amazon Managed Service for Prometheus scraper.

      def update_scraper_logging_configuration(
        logging_destination : Types::ScraperLoggingDestination,
        scraper_id : String,
        scraper_components : Array(Types::ScraperComponent)? = nil
      ) : Protocol::Request
        input = Types::UpdateScraperLoggingConfigurationRequest.new(logging_destination: logging_destination, scraper_id: scraper_id, scraper_components: scraper_components)
        update_scraper_logging_configuration(input)
      end

      def update_scraper_logging_configuration(input : Types::UpdateScraperLoggingConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCRAPER_LOGGING_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the alias of an existing workspace.

      def update_workspace_alias(
        workspace_id : String,
        alias_ : String? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceAliasRequest.new(workspace_id: workspace_id, alias_: alias_, client_token: client_token)
        update_workspace_alias(input)
      end

      def update_workspace_alias(input : Types::UpdateWorkspaceAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to create or update the label sets, label set limits, and retention period of a
      # workspace. You must specify at least one of limitsPerLabelSet or retentionPeriodInDays for the
      # request to be valid.

      def update_workspace_configuration(
        workspace_id : String,
        client_token : String? = nil,
        limits_per_label_set : Array(Types::LimitsPerLabelSet)? = nil,
        retention_period_in_days : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceConfigurationRequest.new(workspace_id: workspace_id, client_token: client_token, limits_per_label_set: limits_per_label_set, retention_period_in_days: retention_period_in_days)
        update_workspace_configuration(input)
      end

      def update_workspace_configuration(input : Types::UpdateWorkspaceConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
