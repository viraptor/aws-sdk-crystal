module Aws
  module ComputeOptimizer
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Deletes a recommendation preference, such as enhanced infrastructure metrics. For more information,
      # see Activating enhanced infrastructure metrics in the Compute Optimizer User Guide .

      def delete_recommendation_preferences(
        recommendation_preference_names : Array(String),
        resource_type : String,
        scope : Types::Scope? = nil
      ) : Types::DeleteRecommendationPreferencesResponse

        input = Types::DeleteRecommendationPreferencesRequest.new(recommendation_preference_names: recommendation_preference_names, resource_type: resource_type, scope: scope)
        delete_recommendation_preferences(input)
      end

      def delete_recommendation_preferences(input : Types::DeleteRecommendationPreferencesRequest) : Types::DeleteRecommendationPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RECOMMENDATION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRecommendationPreferencesResponse, "DeleteRecommendationPreferences")
      end

      # Describes recommendation export jobs created in the last seven days. Use the
      # ExportAutoScalingGroupRecommendations or ExportEC2InstanceRecommendations actions to request an
      # export of your recommendations. Then use the DescribeRecommendationExportJobs action to view your
      # export jobs.

      def describe_recommendation_export_jobs(
        filters : Array(Types::JobFilter)? = nil,
        job_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeRecommendationExportJobsResponse

        input = Types::DescribeRecommendationExportJobsRequest.new(filters: filters, job_ids: job_ids, max_results: max_results, next_token: next_token)
        describe_recommendation_export_jobs(input)
      end

      def describe_recommendation_export_jobs(input : Types::DescribeRecommendationExportJobsRequest) : Types::DescribeRecommendationExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RECOMMENDATION_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRecommendationExportJobsResponse, "DescribeRecommendationExportJobs")
      end

      # Exports optimization recommendations for Amazon EC2 Auto Scaling groups. Recommendations are
      # exported in a comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation
      # (JSON) (.json) file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you
      # specify. For more information, see Exporting Recommendations in the Compute Optimizer User Guide .
      # You can have only one Amazon EC2 Auto Scaling group export job in progress per Amazon Web Services
      # Region.

      def export_auto_scaling_group_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_member_accounts : Bool? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::ExportAutoScalingGroupRecommendationsResponse

        input = Types::ExportAutoScalingGroupRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts, recommendation_preferences: recommendation_preferences)
        export_auto_scaling_group_recommendations(input)
      end

      def export_auto_scaling_group_recommendations(input : Types::ExportAutoScalingGroupRecommendationsRequest) : Types::ExportAutoScalingGroupRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_AUTO_SCALING_GROUP_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportAutoScalingGroupRecommendationsResponse, "ExportAutoScalingGroupRecommendations")
      end

      # Exports optimization recommendations for Amazon EBS volumes. Recommendations are exported in a
      # comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (JSON) (.json)
      # file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more
      # information, see Exporting Recommendations in the Compute Optimizer User Guide . You can have only
      # one Amazon EBS volume export job in progress per Amazon Web Services Region.

      def export_ebs_volume_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::EBSFilter)? = nil,
        include_member_accounts : Bool? = nil
      ) : Types::ExportEBSVolumeRecommendationsResponse

        input = Types::ExportEBSVolumeRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts)
        export_ebs_volume_recommendations(input)
      end

      def export_ebs_volume_recommendations(input : Types::ExportEBSVolumeRecommendationsRequest) : Types::ExportEBSVolumeRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_EBS_VOLUME_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportEBSVolumeRecommendationsResponse, "ExportEBSVolumeRecommendations")
      end

      # Exports optimization recommendations for Amazon EC2 instances. Recommendations are exported in a
      # comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (JSON) (.json)
      # file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more
      # information, see Exporting Recommendations in the Compute Optimizer User Guide . You can have only
      # one Amazon EC2 instance export job in progress per Amazon Web Services Region.

      def export_ec2_instance_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::Filter)? = nil,
        include_member_accounts : Bool? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::ExportEC2InstanceRecommendationsResponse

        input = Types::ExportEC2InstanceRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts, recommendation_preferences: recommendation_preferences)
        export_ec2_instance_recommendations(input)
      end

      def export_ec2_instance_recommendations(input : Types::ExportEC2InstanceRecommendationsRequest) : Types::ExportEC2InstanceRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_EC2_INSTANCE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportEC2InstanceRecommendationsResponse, "ExportEC2InstanceRecommendations")
      end

      # Exports optimization recommendations for Amazon ECS services on Fargate. Recommendations are
      # exported in a CSV file, and its metadata in a JSON file, to an existing Amazon Simple Storage
      # Service (Amazon S3) bucket that you specify. For more information, see Exporting Recommendations in
      # the Compute Optimizer User Guide . You can only have one Amazon ECS service export job in progress
      # per Amazon Web Services Region.

      def export_ecs_service_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::ECSServiceRecommendationFilter)? = nil,
        include_member_accounts : Bool? = nil
      ) : Types::ExportECSServiceRecommendationsResponse

        input = Types::ExportECSServiceRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts)
        export_ecs_service_recommendations(input)
      end

      def export_ecs_service_recommendations(input : Types::ExportECSServiceRecommendationsRequest) : Types::ExportECSServiceRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_ECS_SERVICE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportECSServiceRecommendationsResponse, "ExportECSServiceRecommendations")
      end

      # Export optimization recommendations for your idle resources. Recommendations are exported in a
      # comma-separated values (CSV) file, and its metadata in a JavaScript Object Notation (JSON) file, to
      # an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information,
      # see Exporting Recommendations in the Compute Optimizer User Guide . You can have only one idle
      # resource export job in progress per Amazon Web Services Region.

      def export_idle_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::IdleRecommendationFilter)? = nil,
        include_member_accounts : Bool? = nil
      ) : Types::ExportIdleRecommendationsResponse

        input = Types::ExportIdleRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts)
        export_idle_recommendations(input)
      end

      def export_idle_recommendations(input : Types::ExportIdleRecommendationsRequest) : Types::ExportIdleRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_IDLE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportIdleRecommendationsResponse, "ExportIdleRecommendations")
      end

      # Exports optimization recommendations for Lambda functions. Recommendations are exported in a
      # comma-separated values (.csv) file, and its metadata in a JavaScript Object Notation (JSON) (.json)
      # file, to an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more
      # information, see Exporting Recommendations in the Compute Optimizer User Guide . You can have only
      # one Lambda function export job in progress per Amazon Web Services Region.

      def export_lambda_function_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::LambdaFunctionRecommendationFilter)? = nil,
        include_member_accounts : Bool? = nil
      ) : Types::ExportLambdaFunctionRecommendationsResponse

        input = Types::ExportLambdaFunctionRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts)
        export_lambda_function_recommendations(input)
      end

      def export_lambda_function_recommendations(input : Types::ExportLambdaFunctionRecommendationsRequest) : Types::ExportLambdaFunctionRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_LAMBDA_FUNCTION_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportLambdaFunctionRecommendationsResponse, "ExportLambdaFunctionRecommendations")
      end

      # Export optimization recommendations for your licenses. Recommendations are exported in a
      # comma-separated values (CSV) file, and its metadata in a JavaScript Object Notation (JSON) file, to
      # an existing Amazon Simple Storage Service (Amazon S3) bucket that you specify. For more information,
      # see Exporting Recommendations in the Compute Optimizer User Guide . You can have only one license
      # export job in progress per Amazon Web Services Region.

      def export_license_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::LicenseRecommendationFilter)? = nil,
        include_member_accounts : Bool? = nil
      ) : Types::ExportLicenseRecommendationsResponse

        input = Types::ExportLicenseRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts)
        export_license_recommendations(input)
      end

      def export_license_recommendations(input : Types::ExportLicenseRecommendationsRequest) : Types::ExportLicenseRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_LICENSE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportLicenseRecommendationsResponse, "ExportLicenseRecommendations")
      end

      # Export optimization recommendations for your Amazon Aurora and Amazon Relational Database Service
      # (Amazon RDS) databases. Recommendations are exported in a comma-separated values (CSV) file, and its
      # metadata in a JavaScript Object Notation (JSON) file, to an existing Amazon Simple Storage Service
      # (Amazon S3) bucket that you specify. For more information, see Exporting Recommendations in the
      # Compute Optimizer User Guide . You can have only one Amazon Aurora or RDS export job in progress per
      # Amazon Web Services Region.

      def export_rds_database_recommendations(
        s3_destination_config : Types::S3DestinationConfig,
        account_ids : Array(String)? = nil,
        fields_to_export : Array(String)? = nil,
        file_format : String? = nil,
        filters : Array(Types::RDSDBRecommendationFilter)? = nil,
        include_member_accounts : Bool? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::ExportRDSDatabaseRecommendationsResponse

        input = Types::ExportRDSDatabaseRecommendationsRequest.new(s3_destination_config: s3_destination_config, account_ids: account_ids, fields_to_export: fields_to_export, file_format: file_format, filters: filters, include_member_accounts: include_member_accounts, recommendation_preferences: recommendation_preferences)
        export_rds_database_recommendations(input)
      end

      def export_rds_database_recommendations(input : Types::ExportRDSDatabaseRecommendationsRequest) : Types::ExportRDSDatabaseRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::EXPORT_RDS_DATABASE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ExportRDSDatabaseRecommendationsResponse, "ExportRDSDatabaseRecommendations")
      end

      # Returns Amazon EC2 Auto Scaling group recommendations. Compute Optimizer generates recommendations
      # for Amazon EC2 Auto Scaling groups that meet a specific set of requirements. For more information,
      # see the Supported resources and requirements in the Compute Optimizer User Guide .

      def get_auto_scaling_group_recommendations(
        account_ids : Array(String)? = nil,
        auto_scaling_group_arns : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::GetAutoScalingGroupRecommendationsResponse

        input = Types::GetAutoScalingGroupRecommendationsRequest.new(account_ids: account_ids, auto_scaling_group_arns: auto_scaling_group_arns, filters: filters, max_results: max_results, next_token: next_token, recommendation_preferences: recommendation_preferences)
        get_auto_scaling_group_recommendations(input)
      end

      def get_auto_scaling_group_recommendations(input : Types::GetAutoScalingGroupRecommendationsRequest) : Types::GetAutoScalingGroupRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AUTO_SCALING_GROUP_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutoScalingGroupRecommendationsResponse, "GetAutoScalingGroupRecommendations")
      end

      # Returns Amazon Elastic Block Store (Amazon EBS) volume recommendations. Compute Optimizer generates
      # recommendations for Amazon EBS volumes that meet a specific set of requirements. For more
      # information, see the Supported resources and requirements in the Compute Optimizer User Guide .

      def get_ebs_volume_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::EBSFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        volume_arns : Array(String)? = nil
      ) : Types::GetEBSVolumeRecommendationsResponse

        input = Types::GetEBSVolumeRecommendationsRequest.new(account_ids: account_ids, filters: filters, max_results: max_results, next_token: next_token, volume_arns: volume_arns)
        get_ebs_volume_recommendations(input)
      end

      def get_ebs_volume_recommendations(input : Types::GetEBSVolumeRecommendationsRequest) : Types::GetEBSVolumeRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EBS_VOLUME_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEBSVolumeRecommendationsResponse, "GetEBSVolumeRecommendations")
      end

      # Returns Amazon EC2 instance recommendations. Compute Optimizer generates recommendations for Amazon
      # Elastic Compute Cloud (Amazon EC2) instances that meet a specific set of requirements. For more
      # information, see the Supported resources and requirements in the Compute Optimizer User Guide .

      def get_ec2_instance_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::Filter)? = nil,
        instance_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::GetEC2InstanceRecommendationsResponse

        input = Types::GetEC2InstanceRecommendationsRequest.new(account_ids: account_ids, filters: filters, instance_arns: instance_arns, max_results: max_results, next_token: next_token, recommendation_preferences: recommendation_preferences)
        get_ec2_instance_recommendations(input)
      end

      def get_ec2_instance_recommendations(input : Types::GetEC2InstanceRecommendationsRequest) : Types::GetEC2InstanceRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EC2_INSTANCE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEC2InstanceRecommendationsResponse, "GetEC2InstanceRecommendations")
      end

      # Returns the projected utilization metrics of Amazon EC2 instance recommendations. The Cpu and Memory
      # metrics are the only projected utilization metrics returned when you run this action. Additionally,
      # the Memory metric is returned only for resources that have the unified CloudWatch agent installed on
      # them. For more information, see Enabling Memory Utilization with the CloudWatch Agent .

      def get_ec2_recommendation_projected_metrics(
        end_time : Time,
        instance_arn : String,
        period : Int32,
        start_time : Time,
        stat : String,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::GetEC2RecommendationProjectedMetricsResponse

        input = Types::GetEC2RecommendationProjectedMetricsRequest.new(end_time: end_time, instance_arn: instance_arn, period: period, start_time: start_time, stat: stat, recommendation_preferences: recommendation_preferences)
        get_ec2_recommendation_projected_metrics(input)
      end

      def get_ec2_recommendation_projected_metrics(input : Types::GetEC2RecommendationProjectedMetricsRequest) : Types::GetEC2RecommendationProjectedMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EC2_RECOMMENDATION_PROJECTED_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEC2RecommendationProjectedMetricsResponse, "GetEC2RecommendationProjectedMetrics")
      end

      # Returns the projected metrics of Amazon ECS service recommendations.

      def get_ecs_service_recommendation_projected_metrics(
        end_time : Time,
        period : Int32,
        service_arn : String,
        start_time : Time,
        stat : String
      ) : Types::GetECSServiceRecommendationProjectedMetricsResponse

        input = Types::GetECSServiceRecommendationProjectedMetricsRequest.new(end_time: end_time, period: period, service_arn: service_arn, start_time: start_time, stat: stat)
        get_ecs_service_recommendation_projected_metrics(input)
      end

      def get_ecs_service_recommendation_projected_metrics(input : Types::GetECSServiceRecommendationProjectedMetricsRequest) : Types::GetECSServiceRecommendationProjectedMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ECS_SERVICE_RECOMMENDATION_PROJECTED_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetECSServiceRecommendationProjectedMetricsResponse, "GetECSServiceRecommendationProjectedMetrics")
      end

      # Returns Amazon ECS service recommendations. Compute Optimizer generates recommendations for Amazon
      # ECS services on Fargate that meet a specific set of requirements. For more information, see the
      # Supported resources and requirements in the Compute Optimizer User Guide .

      def get_ecs_service_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::ECSServiceRecommendationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_arns : Array(String)? = nil
      ) : Types::GetECSServiceRecommendationsResponse

        input = Types::GetECSServiceRecommendationsRequest.new(account_ids: account_ids, filters: filters, max_results: max_results, next_token: next_token, service_arns: service_arns)
        get_ecs_service_recommendations(input)
      end

      def get_ecs_service_recommendations(input : Types::GetECSServiceRecommendationsRequest) : Types::GetECSServiceRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ECS_SERVICE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetECSServiceRecommendationsResponse, "GetECSServiceRecommendations")
      end

      # Returns the recommendation preferences that are in effect for a given resource, such as enhanced
      # infrastructure metrics. Considers all applicable preferences that you might have set at the
      # resource, account, and organization level. When you create a recommendation preference, you can set
      # its status to Active or Inactive . Use this action to view the recommendation preferences that are
      # in effect, or Active .

      def get_effective_recommendation_preferences(
        resource_arn : String
      ) : Types::GetEffectiveRecommendationPreferencesResponse

        input = Types::GetEffectiveRecommendationPreferencesRequest.new(resource_arn: resource_arn)
        get_effective_recommendation_preferences(input)
      end

      def get_effective_recommendation_preferences(input : Types::GetEffectiveRecommendationPreferencesRequest) : Types::GetEffectiveRecommendationPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EFFECTIVE_RECOMMENDATION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEffectiveRecommendationPreferencesResponse, "GetEffectiveRecommendationPreferences")
      end

      # Returns the enrollment (opt in) status of an account to the Compute Optimizer service. If the
      # account is the management account of an organization, this action also confirms the enrollment
      # status of member accounts of the organization. Use the GetEnrollmentStatusesForOrganization action
      # to get detailed information about the enrollment status of member accounts of an organization.

      def get_enrollment_status : Types::GetEnrollmentStatusResponse
        input = Types::GetEnrollmentStatusRequest.new
        get_enrollment_status(input)
      end

      def get_enrollment_status(input : Types::GetEnrollmentStatusRequest) : Types::GetEnrollmentStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENROLLMENT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnrollmentStatusResponse, "GetEnrollmentStatus")
      end

      # Returns the Compute Optimizer enrollment (opt-in) status of organization member accounts, if your
      # account is an organization management account. To get the enrollment status of standalone accounts,
      # use the GetEnrollmentStatus action.

      def get_enrollment_statuses_for_organization(
        filters : Array(Types::EnrollmentFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetEnrollmentStatusesForOrganizationResponse

        input = Types::GetEnrollmentStatusesForOrganizationRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        get_enrollment_statuses_for_organization(input)
      end

      def get_enrollment_statuses_for_organization(input : Types::GetEnrollmentStatusesForOrganizationRequest) : Types::GetEnrollmentStatusesForOrganizationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENROLLMENT_STATUSES_FOR_ORGANIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEnrollmentStatusesForOrganizationResponse, "GetEnrollmentStatusesForOrganization")
      end

      # Returns idle resource recommendations. Compute Optimizer generates recommendations for idle
      # resources that meet a specific set of requirements. For more information, see Resource requirements
      # in the Compute Optimizer User Guide

      def get_idle_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::IdleRecommendationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by : Types::OrderBy? = nil,
        resource_arns : Array(String)? = nil
      ) : Types::GetIdleRecommendationsResponse

        input = Types::GetIdleRecommendationsRequest.new(account_ids: account_ids, filters: filters, max_results: max_results, next_token: next_token, order_by: order_by, resource_arns: resource_arns)
        get_idle_recommendations(input)
      end

      def get_idle_recommendations(input : Types::GetIdleRecommendationsRequest) : Types::GetIdleRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IDLE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdleRecommendationsResponse, "GetIdleRecommendations")
      end

      # Returns Lambda function recommendations. Compute Optimizer generates recommendations for functions
      # that meet a specific set of requirements. For more information, see the Supported resources and
      # requirements in the Compute Optimizer User Guide .

      def get_lambda_function_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::LambdaFunctionRecommendationFilter)? = nil,
        function_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetLambdaFunctionRecommendationsResponse

        input = Types::GetLambdaFunctionRecommendationsRequest.new(account_ids: account_ids, filters: filters, function_arns: function_arns, max_results: max_results, next_token: next_token)
        get_lambda_function_recommendations(input)
      end

      def get_lambda_function_recommendations(input : Types::GetLambdaFunctionRecommendationsRequest) : Types::GetLambdaFunctionRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LAMBDA_FUNCTION_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLambdaFunctionRecommendationsResponse, "GetLambdaFunctionRecommendations")
      end

      # Returns license recommendations for Amazon EC2 instances that run on a specific license. Compute
      # Optimizer generates recommendations for licenses that meet a specific set of requirements. For more
      # information, see the Supported resources and requirements in the Compute Optimizer User Guide .

      def get_license_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::LicenseRecommendationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_arns : Array(String)? = nil
      ) : Types::GetLicenseRecommendationsResponse

        input = Types::GetLicenseRecommendationsRequest.new(account_ids: account_ids, filters: filters, max_results: max_results, next_token: next_token, resource_arns: resource_arns)
        get_license_recommendations(input)
      end

      def get_license_recommendations(input : Types::GetLicenseRecommendationsRequest) : Types::GetLicenseRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LICENSE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLicenseRecommendationsResponse, "GetLicenseRecommendations")
      end

      # Returns the projected metrics of Aurora and RDS database recommendations.

      def get_rds_database_recommendation_projected_metrics(
        end_time : Time,
        period : Int32,
        resource_arn : String,
        start_time : Time,
        stat : String,
        recommendation_preferences : Types::RecommendationPreferences? = nil
      ) : Types::GetRDSDatabaseRecommendationProjectedMetricsResponse

        input = Types::GetRDSDatabaseRecommendationProjectedMetricsRequest.new(end_time: end_time, period: period, resource_arn: resource_arn, start_time: start_time, stat: stat, recommendation_preferences: recommendation_preferences)
        get_rds_database_recommendation_projected_metrics(input)
      end

      def get_rds_database_recommendation_projected_metrics(input : Types::GetRDSDatabaseRecommendationProjectedMetricsRequest) : Types::GetRDSDatabaseRecommendationProjectedMetricsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RDS_DATABASE_RECOMMENDATION_PROJECTED_METRICS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRDSDatabaseRecommendationProjectedMetricsResponse, "GetRDSDatabaseRecommendationProjectedMetrics")
      end

      # Returns Amazon Aurora and RDS database recommendations. Compute Optimizer generates recommendations
      # for Amazon Aurora and RDS databases that meet a specific set of requirements. For more information,
      # see the Supported resources and requirements in the Compute Optimizer User Guide .

      def get_rds_database_recommendations(
        account_ids : Array(String)? = nil,
        filters : Array(Types::RDSDBRecommendationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        recommendation_preferences : Types::RecommendationPreferences? = nil,
        resource_arns : Array(String)? = nil
      ) : Types::GetRDSDatabaseRecommendationsResponse

        input = Types::GetRDSDatabaseRecommendationsRequest.new(account_ids: account_ids, filters: filters, max_results: max_results, next_token: next_token, recommendation_preferences: recommendation_preferences, resource_arns: resource_arns)
        get_rds_database_recommendations(input)
      end

      def get_rds_database_recommendations(input : Types::GetRDSDatabaseRecommendationsRequest) : Types::GetRDSDatabaseRecommendationsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RDS_DATABASE_RECOMMENDATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRDSDatabaseRecommendationsResponse, "GetRDSDatabaseRecommendations")
      end

      # Returns existing recommendation preferences, such as enhanced infrastructure metrics. Use the scope
      # parameter to specify which preferences to return. You can specify to return preferences for an
      # organization, a specific account ID, or a specific EC2 instance or Amazon EC2 Auto Scaling group
      # Amazon Resource Name (ARN). For more information, see Activating enhanced infrastructure metrics in
      # the Compute Optimizer User Guide .

      def get_recommendation_preferences(
        resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scope : Types::Scope? = nil
      ) : Types::GetRecommendationPreferencesResponse

        input = Types::GetRecommendationPreferencesRequest.new(resource_type: resource_type, max_results: max_results, next_token: next_token, scope: scope)
        get_recommendation_preferences(input)
      end

      def get_recommendation_preferences(input : Types::GetRecommendationPreferencesRequest) : Types::GetRecommendationPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RECOMMENDATION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecommendationPreferencesResponse, "GetRecommendationPreferences")
      end

      # Returns the optimization findings for an account. It returns the number of: Amazon EC2 instances in
      # an account that are Underprovisioned , Overprovisioned , or Optimized . EC2Amazon EC2 Auto Scaling
      # groups in an account that are NotOptimized , or Optimized . Amazon EBS volumes in an account that
      # are NotOptimized , or Optimized . Lambda functions in an account that are NotOptimized , or
      # Optimized . Amazon ECS services in an account that are Underprovisioned , Overprovisioned , or
      # Optimized . Commercial software licenses in an account that are InsufficientMetrics , NotOptimized
      # or Optimized . Amazon Aurora and Amazon RDS databases in an account that are Underprovisioned ,
      # Overprovisioned , Optimized , or NotOptimized .

      def get_recommendation_summaries(
        account_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetRecommendationSummariesResponse

        input = Types::GetRecommendationSummariesRequest.new(account_ids: account_ids, max_results: max_results, next_token: next_token)
        get_recommendation_summaries(input)
      end

      def get_recommendation_summaries(input : Types::GetRecommendationSummariesRequest) : Types::GetRecommendationSummariesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RECOMMENDATION_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRecommendationSummariesResponse, "GetRecommendationSummaries")
      end

      # Creates a new recommendation preference or updates an existing recommendation preference, such as
      # enhanced infrastructure metrics. For more information, see Activating enhanced infrastructure
      # metrics in the Compute Optimizer User Guide .

      def put_recommendation_preferences(
        resource_type : String,
        enhanced_infrastructure_metrics : String? = nil,
        external_metrics_preference : Types::ExternalMetricsPreference? = nil,
        inferred_workload_types : String? = nil,
        look_back_period : String? = nil,
        preferred_resources : Array(Types::PreferredResource)? = nil,
        savings_estimation_mode : String? = nil,
        scope : Types::Scope? = nil,
        utilization_preferences : Array(Types::UtilizationPreference)? = nil
      ) : Types::PutRecommendationPreferencesResponse

        input = Types::PutRecommendationPreferencesRequest.new(resource_type: resource_type, enhanced_infrastructure_metrics: enhanced_infrastructure_metrics, external_metrics_preference: external_metrics_preference, inferred_workload_types: inferred_workload_types, look_back_period: look_back_period, preferred_resources: preferred_resources, savings_estimation_mode: savings_estimation_mode, scope: scope, utilization_preferences: utilization_preferences)
        put_recommendation_preferences(input)
      end

      def put_recommendation_preferences(input : Types::PutRecommendationPreferencesRequest) : Types::PutRecommendationPreferencesResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RECOMMENDATION_PREFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRecommendationPreferencesResponse, "PutRecommendationPreferences")
      end

      # Updates the enrollment (opt in and opt out) status of an account to the Compute Optimizer service.
      # If the account is a management account of an organization, this action can also be used to enroll
      # member accounts of the organization. You must have the appropriate permissions to opt in to Compute
      # Optimizer, to view its recommendations, and to opt out. For more information, see Controlling access
      # with Amazon Web Services Identity and Access Management in the Compute Optimizer User Guide . When
      # you opt in, Compute Optimizer automatically creates a service-linked role in your account to access
      # its data. For more information, see Using Service-Linked Roles for Compute Optimizer in the Compute
      # Optimizer User Guide .

      def update_enrollment_status(
        status : String,
        include_member_accounts : Bool? = nil
      ) : Types::UpdateEnrollmentStatusResponse

        input = Types::UpdateEnrollmentStatusRequest.new(status: status, include_member_accounts: include_member_accounts)
        update_enrollment_status(input)
      end

      def update_enrollment_status(input : Types::UpdateEnrollmentStatusRequest) : Types::UpdateEnrollmentStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENROLLMENT_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEnrollmentStatusResponse, "UpdateEnrollmentStatus")
      end
    end
  end
end
