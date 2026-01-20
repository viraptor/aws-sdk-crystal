module Aws
  module Resiliencehub
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Accepts the resource grouping recommendations suggested by Resilience Hub for your application.

      def accept_resource_grouping_recommendations(
        app_arn : String,
        entries : Array(Types::AcceptGroupingRecommendationEntry)
      ) : Protocol::Request
        input = Types::AcceptResourceGroupingRecommendationsRequest.new(app_arn: app_arn, entries: entries)
        accept_resource_grouping_recommendations(input)
      end

      def accept_resource_grouping_recommendations(input : Types::AcceptResourceGroupingRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_RESOURCE_GROUPING_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the source of resource-maps to the draft version of an application. During assessment,
      # Resilience Hub will use these resource-maps to resolve the latest physical ID for each resource in
      # the application template. For more information about different types of resources supported by
      # Resilience Hub and how to add them in your application, see Step 2: How is your application managed?
      # in the Resilience Hub User Guide.

      def add_draft_app_version_resource_mappings(
        app_arn : String,
        resource_mappings : Array(Types::ResourceMapping)
      ) : Protocol::Request
        input = Types::AddDraftAppVersionResourceMappingsRequest.new(app_arn: app_arn, resource_mappings: resource_mappings)
        add_draft_app_version_resource_mappings(input)
      end

      def add_draft_app_version_resource_mappings(input : Types::AddDraftAppVersionResourceMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ADD_DRAFT_APP_VERSION_RESOURCE_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to include or exclude one or more operational recommendations.

      def batch_update_recommendation_status(
        app_arn : String,
        request_entries : Array(Types::UpdateRecommendationStatusRequestEntry)
      ) : Protocol::Request
        input = Types::BatchUpdateRecommendationStatusRequest.new(app_arn: app_arn, request_entries: request_entries)
        batch_update_recommendation_status(input)
      end

      def batch_update_recommendation_status(input : Types::BatchUpdateRecommendationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_RECOMMENDATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Resilience Hub application. An Resilience Hub application is a collection of Amazon Web
      # Services resources structured to prevent and recover Amazon Web Services application disruptions. To
      # describe a Resilience Hub application, you provide an application name, resources from one or more
      # CloudFormation stacks, Resource Groups, Terraform state files, AppRegistry applications, and an
      # appropriate resiliency policy. In addition, you can also add resources that are located on Amazon
      # Elastic Kubernetes Service (Amazon EKS) clusters as optional resources. For more information about
      # the number of resources supported per application, see Service quotas . After you create an
      # Resilience Hub application, you publish it so that you can run a resiliency assessment on it. You
      # can then use recommendations from the assessment to improve resiliency by running another
      # assessment, comparing results, and then iterating the process until you achieve your goals for
      # recovery time objective (RTO) and recovery point objective (RPO).

      def create_app(
        name : String,
        assessment_schedule : String? = nil,
        aws_application_arn : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        event_subscriptions : Array(Types::EventSubscription)? = nil,
        permission_model : Types::PermissionModel? = nil,
        policy_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAppRequest.new(name: name, assessment_schedule: assessment_schedule, aws_application_arn: aws_application_arn, client_token: client_token, description: description, event_subscriptions: event_subscriptions, permission_model: permission_model, policy_arn: policy_arn, tags: tags)
        create_app(input)
      end

      def create_app(input : Types::CreateAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Application Component in the Resilience Hub application. This API updates the
      # Resilience Hub application draft version. To use this Application Component for running assessments,
      # you must publish the Resilience Hub application using the PublishAppVersion API.

      def create_app_version_app_component(
        app_arn : String,
        name : String,
        type : String,
        additional_info : Hash(String, Array(String))? = nil,
        client_token : String? = nil,
        id : String? = nil
      ) : Protocol::Request
        input = Types::CreateAppVersionAppComponentRequest.new(app_arn: app_arn, name: name, type: type, additional_info: additional_info, client_token: client_token, id: id)
        create_app_version_app_component(input)
      end

      def create_app_version_app_component(input : Types::CreateAppVersionAppComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_VERSION_APP_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a resource to the Resilience Hub application and assigns it to the specified Application
      # Components. If you specify a new Application Component, Resilience Hub will automatically create the
      # Application Component. This action has no effect outside Resilience Hub. This API updates the
      # Resilience Hub application draft version. To use this resource for running resiliency assessments,
      # you must publish the Resilience Hub application using the PublishAppVersion API. To update
      # application version with new physicalResourceID , you must call ResolveAppVersionResources API.

      def create_app_version_resource(
        app_arn : String,
        app_components : Array(String),
        logical_resource_id : Types::LogicalResourceId,
        physical_resource_id : String,
        resource_type : String,
        additional_info : Hash(String, Array(String))? = nil,
        aws_account_id : String? = nil,
        aws_region : String? = nil,
        client_token : String? = nil,
        resource_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateAppVersionResourceRequest.new(app_arn: app_arn, app_components: app_components, logical_resource_id: logical_resource_id, physical_resource_id: physical_resource_id, resource_type: resource_type, additional_info: additional_info, aws_account_id: aws_account_id, aws_region: aws_region, client_token: client_token, resource_name: resource_name)
        create_app_version_resource(input)
      end

      def create_app_version_resource(input : Types::CreateAppVersionResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APP_VERSION_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new recommendation template for the Resilience Hub application.

      def create_recommendation_template(
        assessment_arn : String,
        name : String,
        bucket_name : String? = nil,
        client_token : String? = nil,
        format : String? = nil,
        recommendation_ids : Array(String)? = nil,
        recommendation_types : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRecommendationTemplateRequest.new(assessment_arn: assessment_arn, name: name, bucket_name: bucket_name, client_token: client_token, format: format, recommendation_ids: recommendation_ids, recommendation_types: recommendation_types, tags: tags)
        create_recommendation_template(input)
      end

      def create_recommendation_template(input : Types::CreateRecommendationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RECOMMENDATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a resiliency policy for an application. Resilience Hub allows you to provide a value of zero
      # for rtoInSecs and rpoInSecs of your resiliency policy. But, while assessing your application, the
      # lowest possible assessment result is near zero. Hence, if you provide value zero for rtoInSecs and
      # rpoInSecs , the estimated workload RTO and estimated workload RPO result will be near zero and the
      # Compliance status for your application will be set to Policy breached .

      def create_resiliency_policy(
        policy : Hash(String, Types::FailurePolicy),
        policy_name : String,
        tier : String,
        client_token : String? = nil,
        data_location_constraint : String? = nil,
        policy_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateResiliencyPolicyRequest.new(policy: policy, policy_name: policy_name, tier: tier, client_token: client_token, data_location_constraint: data_location_constraint, policy_description: policy_description, tags: tags)
        create_resiliency_policy(input)
      end

      def create_resiliency_policy(input : Types::CreateResiliencyPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESILIENCY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Resilience Hub application. This is a destructive action that can't be undone.

      def delete_app(
        app_arn : String,
        client_token : String? = nil,
        force_delete : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAppRequest.new(app_arn: app_arn, client_token: client_token, force_delete: force_delete)
        delete_app(input)
      end

      def delete_app(input : Types::DeleteAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Resilience Hub application assessment. This is a destructive action that can't be undone.

      def delete_app_assessment(
        assessment_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAppAssessmentRequest.new(assessment_arn: assessment_arn, client_token: client_token)
        delete_app_assessment(input)
      end

      def delete_app_assessment(input : Types::DeleteAppAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the input source and all of its imported resources from the Resilience Hub application.

      def delete_app_input_source(
        app_arn : String,
        client_token : String? = nil,
        eks_source_cluster_namespace : Types::EksSourceClusterNamespace? = nil,
        source_arn : String? = nil,
        terraform_source : Types::TerraformSource? = nil
      ) : Protocol::Request
        input = Types::DeleteAppInputSourceRequest.new(app_arn: app_arn, client_token: client_token, eks_source_cluster_namespace: eks_source_cluster_namespace, source_arn: source_arn, terraform_source: terraform_source)
        delete_app_input_source(input)
      end

      def delete_app_input_source(input : Types::DeleteAppInputSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_INPUT_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Application Component from the Resilience Hub application. This API updates the
      # Resilience Hub application draft version. To use this Application Component for running assessments,
      # you must publish the Resilience Hub application using the PublishAppVersion API. You will not be
      # able to delete an Application Component if it has resources associated with it.

      def delete_app_version_app_component(
        app_arn : String,
        id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAppVersionAppComponentRequest.new(app_arn: app_arn, id: id, client_token: client_token)
        delete_app_version_app_component(input)
      end

      def delete_app_version_app_component(input : Types::DeleteAppVersionAppComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_VERSION_APP_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resource from the Resilience Hub application. You can only delete a manually added
      # resource. To exclude non-manually added resources, use the UpdateAppVersionResource API. This action
      # has no effect outside Resilience Hub. This API updates the Resilience Hub application draft version.
      # To use this resource for running resiliency assessments, you must publish the Resilience Hub
      # application using the PublishAppVersion API.

      def delete_app_version_resource(
        app_arn : String,
        aws_account_id : String? = nil,
        aws_region : String? = nil,
        client_token : String? = nil,
        logical_resource_id : Types::LogicalResourceId? = nil,
        physical_resource_id : String? = nil,
        resource_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAppVersionResourceRequest.new(app_arn: app_arn, aws_account_id: aws_account_id, aws_region: aws_region, client_token: client_token, logical_resource_id: logical_resource_id, physical_resource_id: physical_resource_id, resource_name: resource_name)
        delete_app_version_resource(input)
      end

      def delete_app_version_resource(input : Types::DeleteAppVersionResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APP_VERSION_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a recommendation template. This is a destructive action that can't be undone.

      def delete_recommendation_template(
        recommendation_template_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRecommendationTemplateRequest.new(recommendation_template_arn: recommendation_template_arn, client_token: client_token)
        delete_recommendation_template(input)
      end

      def delete_recommendation_template(input : Types::DeleteRecommendationTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RECOMMENDATION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a resiliency policy. This is a destructive action that can't be undone.

      def delete_resiliency_policy(
        policy_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResiliencyPolicyRequest.new(policy_arn: policy_arn, client_token: client_token)
        delete_resiliency_policy(input)
      end

      def delete_resiliency_policy(input : Types::DeleteResiliencyPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESILIENCY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Resilience Hub application.

      def describe_app(
        app_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppRequest.new(app_arn: app_arn)
        describe_app(input)
      end

      def describe_app(input : Types::DescribeAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an assessment for an Resilience Hub application.

      def describe_app_assessment(
        assessment_arn : String
      ) : Protocol::Request
        input = Types::DescribeAppAssessmentRequest.new(assessment_arn: assessment_arn)
        describe_app_assessment(input)
      end

      def describe_app_assessment(input : Types::DescribeAppAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the Resilience Hub application version.

      def describe_app_version(
        app_arn : String,
        app_version : String
      ) : Protocol::Request
        input = Types::DescribeAppVersionRequest.new(app_arn: app_arn, app_version: app_version)
        describe_app_version(input)
      end

      def describe_app_version(input : Types::DescribeAppVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Application Component in the Resilience Hub application.

      def describe_app_version_app_component(
        app_arn : String,
        app_version : String,
        id : String
      ) : Protocol::Request
        input = Types::DescribeAppVersionAppComponentRequest.new(app_arn: app_arn, app_version: app_version, id: id)
        describe_app_version_app_component(input)
      end

      def describe_app_version_app_component(input : Types::DescribeAppVersionAppComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_VERSION_APP_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a resource of the Resilience Hub application. This API accepts only one of the following
      # parameters to describe the resource: resourceName logicalResourceId physicalResourceId (Along with
      # physicalResourceId , you can also provide awsAccountId , and awsRegion )

      def describe_app_version_resource(
        app_arn : String,
        app_version : String,
        aws_account_id : String? = nil,
        aws_region : String? = nil,
        logical_resource_id : Types::LogicalResourceId? = nil,
        physical_resource_id : String? = nil,
        resource_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAppVersionResourceRequest.new(app_arn: app_arn, app_version: app_version, aws_account_id: aws_account_id, aws_region: aws_region, logical_resource_id: logical_resource_id, physical_resource_id: physical_resource_id, resource_name: resource_name)
        describe_app_version_resource(input)
      end

      def describe_app_version_resource(input : Types::DescribeAppVersionResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_VERSION_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the resolution status for the specified resolution identifier for an application version. If
      # resolutionId is not specified, the current resolution status is returned.

      def describe_app_version_resources_resolution_status(
        app_arn : String,
        app_version : String,
        resolution_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeAppVersionResourcesResolutionStatusRequest.new(app_arn: app_arn, app_version: app_version, resolution_id: resolution_id)
        describe_app_version_resources_resolution_status(input)
      end

      def describe_app_version_resources_resolution_status(input : Types::DescribeAppVersionResourcesResolutionStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_VERSION_RESOURCES_RESOLUTION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes details about an Resilience Hub application.

      def describe_app_version_template(
        app_arn : String,
        app_version : String
      ) : Protocol::Request
        input = Types::DescribeAppVersionTemplateRequest.new(app_arn: app_arn, app_version: app_version)
        describe_app_version_template(input)
      end

      def describe_app_version_template(input : Types::DescribeAppVersionTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_APP_VERSION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the status of importing resources to an application version. If you get a 404 error with
      # ResourceImportStatusNotFoundAppMetadataException , you must call importResourcesToDraftAppVersion
      # after creating the application and before calling describeDraftAppVersionResourcesImportStatus to
      # obtain the status.

      def describe_draft_app_version_resources_import_status(
        app_arn : String
      ) : Protocol::Request
        input = Types::DescribeDraftAppVersionResourcesImportStatusRequest.new(app_arn: app_arn)
        describe_draft_app_version_resources_import_status(input)
      end

      def describe_draft_app_version_resources_import_status(input : Types::DescribeDraftAppVersionResourcesImportStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DRAFT_APP_VERSION_RESOURCES_IMPORT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the metrics of the application configuration being exported.

      def describe_metrics_export(
        metrics_export_id : String
      ) : Protocol::Request
        input = Types::DescribeMetricsExportRequest.new(metrics_export_id: metrics_export_id)
        describe_metrics_export(input)
      end

      def describe_metrics_export(input : Types::DescribeMetricsExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_METRICS_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a specified resiliency policy for an Resilience Hub application. The returned policy
      # object includes creation time, data location constraints, the Amazon Resource Name (ARN) for the
      # policy, tags, tier, and more.

      def describe_resiliency_policy(
        policy_arn : String
      ) : Protocol::Request
        input = Types::DescribeResiliencyPolicyRequest.new(policy_arn: policy_arn)
        describe_resiliency_policy(input)
      end

      def describe_resiliency_policy(input : Types::DescribeResiliencyPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESILIENCY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the resource grouping recommendation tasks run by Resilience Hub for your application.

      def describe_resource_grouping_recommendation_task(
        app_arn : String,
        grouping_id : String? = nil
      ) : Protocol::Request
        input = Types::DescribeResourceGroupingRecommendationTaskRequest.new(app_arn: app_arn, grouping_id: grouping_id)
        describe_resource_grouping_recommendation_task(input)
      end

      def describe_resource_grouping_recommendation_task(input : Types::DescribeResourceGroupingRecommendationTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RESOURCE_GROUPING_RECOMMENDATION_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports resources to Resilience Hub application draft version from different input sources. For more
      # information about the input sources supported by Resilience Hub, see Discover the structure and
      # describe your Resilience Hub application .

      def import_resources_to_draft_app_version(
        app_arn : String,
        eks_sources : Array(Types::EksSource)? = nil,
        import_strategy : String? = nil,
        source_arns : Array(String)? = nil,
        terraform_sources : Array(Types::TerraformSource)? = nil
      ) : Protocol::Request
        input = Types::ImportResourcesToDraftAppVersionRequest.new(app_arn: app_arn, eks_sources: eks_sources, import_strategy: import_strategy, source_arns: source_arns, terraform_sources: terraform_sources)
        import_resources_to_draft_app_version(input)
      end

      def import_resources_to_draft_app_version(input : Types::ImportResourcesToDraftAppVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_RESOURCES_TO_DRAFT_APP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the alarm recommendations for an Resilience Hub application.

      def list_alarm_recommendations(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAlarmRecommendationsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_alarm_recommendations(input)
      end

      def list_alarm_recommendations(input : Types::ListAlarmRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ALARM_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of compliance drifts that were detected while running an assessment.

      def list_app_assessment_compliance_drifts(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppAssessmentComplianceDriftsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_app_assessment_compliance_drifts(input)
      end

      def list_app_assessment_compliance_drifts(input : Types::ListAppAssessmentComplianceDriftsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_ASSESSMENT_COMPLIANCE_DRIFTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of resource drifts that were detected while running an assessment.

      def list_app_assessment_resource_drifts(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppAssessmentResourceDriftsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_app_assessment_resource_drifts(input)
      end

      def list_app_assessment_resource_drifts(input : Types::ListAppAssessmentResourceDriftsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_ASSESSMENT_RESOURCE_DRIFTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the assessments for an Resilience Hub application. You can use request parameters to refine
      # the results for the response object.

      def list_app_assessments(
        app_arn : String? = nil,
        assessment_name : String? = nil,
        assessment_status : Array(String)? = nil,
        compliance_status : String? = nil,
        invoker : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Protocol::Request
        input = Types::ListAppAssessmentsRequest.new(app_arn: app_arn, assessment_name: assessment_name, assessment_status: assessment_status, compliance_status: compliance_status, invoker: invoker, max_results: max_results, next_token: next_token, reverse_order: reverse_order)
        list_app_assessments(input)
      end

      def list_app_assessments(input : Types::ListAppAssessmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_ASSESSMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the compliances for an Resilience Hub Application Component.

      def list_app_component_compliances(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppComponentCompliancesRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_app_component_compliances(input)
      end

      def list_app_component_compliances(input : Types::ListAppComponentCompliancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_COMPONENT_COMPLIANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the recommendations for an Resilience Hub Application Component.

      def list_app_component_recommendations(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppComponentRecommendationsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_app_component_recommendations(input)
      end

      def list_app_component_recommendations(input : Types::ListAppComponentRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_COMPONENT_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the input sources of the Resilience Hub application. For more information about the input
      # sources supported by Resilience Hub, see Discover the structure and describe your Resilience Hub
      # application .

      def list_app_input_sources(
        app_arn : String,
        app_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppInputSourcesRequest.new(app_arn: app_arn, app_version: app_version, max_results: max_results, next_token: next_token)
        list_app_input_sources(input)
      end

      def list_app_input_sources(input : Types::ListAppInputSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_INPUT_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Application Components in the Resilience Hub application.

      def list_app_version_app_components(
        app_arn : String,
        app_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppVersionAppComponentsRequest.new(app_arn: app_arn, app_version: app_version, max_results: max_results, next_token: next_token)
        list_app_version_app_components(input)
      end

      def list_app_version_app_components(input : Types::ListAppVersionAppComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_VERSION_APP_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists how the resources in an application version are mapped/sourced from. Mappings can be physical
      # resource identifiers, CloudFormation stacks, resource-groups, or an application registry app.

      def list_app_version_resource_mappings(
        app_arn : String,
        app_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAppVersionResourceMappingsRequest.new(app_arn: app_arn, app_version: app_version, max_results: max_results, next_token: next_token)
        list_app_version_resource_mappings(input)
      end

      def list_app_version_resource_mappings(input : Types::ListAppVersionResourceMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_VERSION_RESOURCE_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the resources in an Resilience Hub application.

      def list_app_version_resources(
        app_arn : String,
        app_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resolution_id : String? = nil
      ) : Protocol::Request
        input = Types::ListAppVersionResourcesRequest.new(app_arn: app_arn, app_version: app_version, max_results: max_results, next_token: next_token, resolution_id: resolution_id)
        list_app_version_resources(input)
      end

      def list_app_version_resources(input : Types::ListAppVersionResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_VERSION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the different versions for the Resilience Hub applications.

      def list_app_versions(
        app_arn : String,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListAppVersionsRequest.new(app_arn: app_arn, end_time: end_time, max_results: max_results, next_token: next_token, start_time: start_time)
        list_app_versions(input)
      end

      def list_app_versions(input : Types::ListAppVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APP_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your Resilience Hub applications. You can filter applications using only one filter at a time
      # or without using any filter. If you try to filter applications using multiple filters, you will get
      # the following error: An error occurred (ValidationException) when calling the ListApps operation:
      # Only one filter is supported for this operation.

      def list_apps(
        app_arn : String? = nil,
        aws_application_arn : String? = nil,
        from_last_assessment_time : Time? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        reverse_order : Bool? = nil,
        to_last_assessment_time : Time? = nil
      ) : Protocol::Request
        input = Types::ListAppsRequest.new(app_arn: app_arn, aws_application_arn: aws_application_arn, from_last_assessment_time: from_last_assessment_time, max_results: max_results, name: name, next_token: next_token, reverse_order: reverse_order, to_last_assessment_time: to_last_assessment_time)
        list_apps(input)
      end

      def list_apps(input : Types::ListAppsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the metrics that can be exported.

      def list_metrics(
        conditions : Array(Types::Condition)? = nil,
        data_source : String? = nil,
        fields : Array(Types::Field)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sorts : Array(Types::Sort)? = nil
      ) : Protocol::Request
        input = Types::ListMetricsRequest.new(conditions: conditions, data_source: data_source, fields: fields, max_results: max_results, next_token: next_token, sorts: sorts)
        list_metrics(input)
      end

      def list_metrics(input : Types::ListMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the recommendation templates for the Resilience Hub applications.

      def list_recommendation_templates(
        assessment_arn : String? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        recommendation_template_arn : String? = nil,
        reverse_order : Bool? = nil,
        status : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationTemplatesRequest.new(assessment_arn: assessment_arn, max_results: max_results, name: name, next_token: next_token, recommendation_template_arn: recommendation_template_arn, reverse_order: reverse_order, status: status)
        list_recommendation_templates(input)
      end

      def list_recommendation_templates(input : Types::ListRecommendationTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATION_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resiliency policies for the Resilience Hub applications.

      def list_resiliency_policies(
        max_results : Int32? = nil,
        next_token : String? = nil,
        policy_name : String? = nil
      ) : Protocol::Request
        input = Types::ListResiliencyPoliciesRequest.new(max_results: max_results, next_token: next_token, policy_name: policy_name)
        list_resiliency_policies(input)
      end

      def list_resiliency_policies(input : Types::ListResiliencyPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESILIENCY_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resource grouping recommendations suggested by Resilience Hub for your application.

      def list_resource_grouping_recommendations(
        app_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResourceGroupingRecommendationsRequest.new(app_arn: app_arn, max_results: max_results, next_token: next_token)
        list_resource_grouping_recommendations(input)
      end

      def list_resource_grouping_recommendations(input : Types::ListResourceGroupingRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_GROUPING_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the standard operating procedure (SOP) recommendations for the Resilience Hub applications.

      def list_sop_recommendations(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSopRecommendationsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_sop_recommendations(input)
      end

      def list_sop_recommendations(input : Types::ListSopRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOP_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the suggested resiliency policies for the Resilience Hub applications.

      def list_suggested_resiliency_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSuggestedResiliencyPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_suggested_resiliency_policies(input)
      end

      def list_suggested_resiliency_policies(input : Types::ListSuggestedResiliencyPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUGGESTED_RESILIENCY_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for your resources in your Resilience Hub applications.

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

      # Lists the test recommendations for the Resilience Hub application.

      def list_test_recommendations(
        assessment_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTestRecommendationsRequest.new(assessment_arn: assessment_arn, max_results: max_results, next_token: next_token)
        list_test_recommendations(input)
      end

      def list_test_recommendations(input : Types::ListTestRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEST_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resources that are not currently supported in Resilience Hub. An unsupported resource is a
      # resource that exists in the object that was used to create an app, but is not supported by
      # Resilience Hub.

      def list_unsupported_app_version_resources(
        app_arn : String,
        app_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resolution_id : String? = nil
      ) : Protocol::Request
        input = Types::ListUnsupportedAppVersionResourcesRequest.new(app_arn: app_arn, app_version: app_version, max_results: max_results, next_token: next_token, resolution_id: resolution_id)
        list_unsupported_app_version_resources(input)
      end

      def list_unsupported_app_version_resources(input : Types::ListUnsupportedAppVersionResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_UNSUPPORTED_APP_VERSION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a new version of a specific Resilience Hub application.

      def publish_app_version(
        app_arn : String,
        version_name : String? = nil
      ) : Protocol::Request
        input = Types::PublishAppVersionRequest.new(app_arn: app_arn, version_name: version_name)
        publish_app_version(input)
      end

      def publish_app_version(input : Types::PublishAppVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_APP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates the app template for an Resilience Hub application draft version.

      def put_draft_app_version_template(
        app_arn : String,
        app_template_body : String
      ) : Protocol::Request
        input = Types::PutDraftAppVersionTemplateRequest.new(app_arn: app_arn, app_template_body: app_template_body)
        put_draft_app_version_template(input)
      end

      def put_draft_app_version_template(input : Types::PutDraftAppVersionTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DRAFT_APP_VERSION_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects resource grouping recommendations.

      def reject_resource_grouping_recommendations(
        app_arn : String,
        entries : Array(Types::RejectGroupingRecommendationEntry)
      ) : Protocol::Request
        input = Types::RejectResourceGroupingRecommendationsRequest.new(app_arn: app_arn, entries: entries)
        reject_resource_grouping_recommendations(input)
      end

      def reject_resource_grouping_recommendations(input : Types::RejectResourceGroupingRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_RESOURCE_GROUPING_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes resource mappings from a draft application version.

      def remove_draft_app_version_resource_mappings(
        app_arn : String,
        app_registry_app_names : Array(String)? = nil,
        eks_source_names : Array(String)? = nil,
        logical_stack_names : Array(String)? = nil,
        resource_group_names : Array(String)? = nil,
        resource_names : Array(String)? = nil,
        terraform_source_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RemoveDraftAppVersionResourceMappingsRequest.new(app_arn: app_arn, app_registry_app_names: app_registry_app_names, eks_source_names: eks_source_names, logical_stack_names: logical_stack_names, resource_group_names: resource_group_names, resource_names: resource_names, terraform_source_names: terraform_source_names)
        remove_draft_app_version_resource_mappings(input)
      end

      def remove_draft_app_version_resource_mappings(input : Types::RemoveDraftAppVersionResourceMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REMOVE_DRAFT_APP_VERSION_RESOURCE_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resolves the resources for an application version.

      def resolve_app_version_resources(
        app_arn : String,
        app_version : String
      ) : Protocol::Request
        input = Types::ResolveAppVersionResourcesRequest.new(app_arn: app_arn, app_version: app_version)
        resolve_app_version_resources(input)
      end

      def resolve_app_version_resources(input : Types::ResolveAppVersionResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESOLVE_APP_VERSION_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new application assessment for an application.

      def start_app_assessment(
        app_arn : String,
        app_version : String,
        assessment_name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartAppAssessmentRequest.new(app_arn: app_arn, app_version: app_version, assessment_name: assessment_name, client_token: client_token, tags: tags)
        start_app_assessment(input)
      end

      def start_app_assessment(input : Types::StartAppAssessmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_APP_ASSESSMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates the export task of metrics.

      def start_metrics_export(
        bucket_name : String? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartMetricsExportRequest.new(bucket_name: bucket_name, client_token: client_token)
        start_metrics_export(input)
      end

      def start_metrics_export(input : Types::StartMetricsExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_METRICS_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts grouping recommendation task.

      def start_resource_grouping_recommendation_task(
        app_arn : String
      ) : Protocol::Request
        input = Types::StartResourceGroupingRecommendationTaskRequest.new(app_arn: app_arn)
        start_resource_grouping_recommendation_task(input)
      end

      def start_resource_grouping_recommendation_task(input : Types::StartResourceGroupingRecommendationTaskRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RESOURCE_GROUPING_RECOMMENDATION_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Applies one or more tags to a resource.

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

      # Removes one or more tags from a resource.

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

      # Updates an application.

      def update_app(
        app_arn : String,
        assessment_schedule : String? = nil,
        clear_resiliency_policy_arn : Bool? = nil,
        description : String? = nil,
        event_subscriptions : Array(Types::EventSubscription)? = nil,
        permission_model : Types::PermissionModel? = nil,
        policy_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAppRequest.new(app_arn: app_arn, assessment_schedule: assessment_schedule, clear_resiliency_policy_arn: clear_resiliency_policy_arn, description: description, event_subscriptions: event_subscriptions, permission_model: permission_model, policy_arn: policy_arn)
        update_app(input)
      end

      def update_app(input : Types::UpdateAppRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Resilience Hub application version. This API updates the Resilience Hub application
      # draft version. To use this information for running resiliency assessments, you must publish the
      # Resilience Hub application using the PublishAppVersion API.

      def update_app_version(
        app_arn : String,
        additional_info : Hash(String, Array(String))? = nil
      ) : Protocol::Request
        input = Types::UpdateAppVersionRequest.new(app_arn: app_arn, additional_info: additional_info)
        update_app_version(input)
      end

      def update_app_version(input : Types::UpdateAppVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Application Component in the Resilience Hub application. This API updates the
      # Resilience Hub application draft version. To use this Application Component for running assessments,
      # you must publish the Resilience Hub application using the PublishAppVersion API.

      def update_app_version_app_component(
        app_arn : String,
        id : String,
        additional_info : Hash(String, Array(String))? = nil,
        name : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAppVersionAppComponentRequest.new(app_arn: app_arn, id: id, additional_info: additional_info, name: name, type: type)
        update_app_version_app_component(input)
      end

      def update_app_version_app_component(input : Types::UpdateAppVersionAppComponentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_VERSION_APP_COMPONENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the resource details in the Resilience Hub application. This action has no effect outside
      # Resilience Hub. This API updates the Resilience Hub application draft version. To use this resource
      # for running resiliency assessments, you must publish the Resilience Hub application using the
      # PublishAppVersion API. To update application version with new physicalResourceID , you must call
      # ResolveAppVersionResources API.

      def update_app_version_resource(
        app_arn : String,
        additional_info : Hash(String, Array(String))? = nil,
        app_components : Array(String)? = nil,
        aws_account_id : String? = nil,
        aws_region : String? = nil,
        excluded : Bool? = nil,
        logical_resource_id : Types::LogicalResourceId? = nil,
        physical_resource_id : String? = nil,
        resource_name : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAppVersionResourceRequest.new(app_arn: app_arn, additional_info: additional_info, app_components: app_components, aws_account_id: aws_account_id, aws_region: aws_region, excluded: excluded, logical_resource_id: logical_resource_id, physical_resource_id: physical_resource_id, resource_name: resource_name, resource_type: resource_type)
        update_app_version_resource(input)
      end

      def update_app_version_resource(input : Types::UpdateAppVersionResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APP_VERSION_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a resiliency policy. Resilience Hub allows you to provide a value of zero for rtoInSecs and
      # rpoInSecs of your resiliency policy. But, while assessing your application, the lowest possible
      # assessment result is near zero. Hence, if you provide value zero for rtoInSecs and rpoInSecs , the
      # estimated workload RTO and estimated workload RPO result will be near zero and the Compliance status
      # for your application will be set to Policy breached .

      def update_resiliency_policy(
        policy_arn : String,
        data_location_constraint : String? = nil,
        policy : Hash(String, Types::FailurePolicy)? = nil,
        policy_description : String? = nil,
        policy_name : String? = nil,
        tier : String? = nil
      ) : Protocol::Request
        input = Types::UpdateResiliencyPolicyRequest.new(policy_arn: policy_arn, data_location_constraint: data_location_constraint, policy: policy, policy_description: policy_description, policy_name: policy_name, tier: tier)
        update_resiliency_policy(input)
      end

      def update_resiliency_policy(input : Types::UpdateResiliencyPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESILIENCY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
