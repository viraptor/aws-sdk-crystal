module AwsSdk
  module Evidently
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

      # This operation assigns feature variation to user sessions. For each user session, you pass in an
      # entityID that represents the user. Evidently then checks the evaluation rules and assigns the
      # variation. The first rules that are evaluated are the override rules. If the user's entityID matches
      # an override rule, the user is served the variation specified by that rule. Next, if there is a
      # launch of the feature, the user might be assigned to a variation in the launch. The chance of this
      # depends on the percentage of users that are allocated to that launch. If the user is enrolled in the
      # launch, the variation they are served depends on the allocation of the various feature variations
      # used for the launch. If the user is not assigned to a launch, and there is an ongoing experiment for
      # this feature, the user might be assigned to a variation in the experiment. The chance of this
      # depends on the percentage of users that are allocated to that experiment. If the user is enrolled in
      # the experiment, the variation they are served depends on the allocation of the various feature
      # variations used for the experiment. If the user is not assigned to a launch or experiment, they are
      # served the default variation.

      def batch_evaluate_feature(
        project : String,
        requests : Array(Types::EvaluationRequest)
      ) : Protocol::Request
        input = Types::BatchEvaluateFeatureRequest.new(project: project, requests: requests)
        batch_evaluate_feature(input)
      end

      def batch_evaluate_feature(input : Types::BatchEvaluateFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_EVALUATE_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Evidently experiment . Before you create an experiment, you must create the feature to
      # use for the experiment. An experiment helps you make feature design decisions based on evidence and
      # data. An experiment can test as many as five variations at once. Evidently collects experiment data
      # and analyzes it by statistical methods, and provides clear recommendations about which variations
      # perform better. You can optionally specify a segment to have the experiment consider only certain
      # audience types in the experiment, such as using only user sessions from a certain location or who
      # use a certain internet browser. Don't use this operation to update an existing experiment. Instead,
      # use UpdateExperiment .

      def create_experiment(
        metric_goals : Array(Types::MetricGoalConfig),
        name : String,
        project : String,
        treatments : Array(Types::TreatmentConfig),
        description : String? = nil,
        online_ab_config : Types::OnlineAbConfig? = nil,
        randomization_salt : String? = nil,
        sampling_rate : Int64? = nil,
        segment : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateExperimentRequest.new(metric_goals: metric_goals, name: name, project: project, treatments: treatments, description: description, online_ab_config: online_ab_config, randomization_salt: randomization_salt, sampling_rate: sampling_rate, segment: segment, tags: tags)
        create_experiment(input)
      end

      def create_experiment(input : Types::CreateExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Evidently feature that you want to launch or test. You can define up to five variations
      # of a feature, and use these variations in your launches and experiments. A feature must be created
      # in a project. For information about creating a project, see CreateProject . Don't use this operation
      # to update an existing feature. Instead, use UpdateFeature .

      def create_feature(
        name : String,
        project : String,
        variations : Array(Types::VariationConfig),
        default_variation : String? = nil,
        description : String? = nil,
        entity_overrides : Hash(String, String)? = nil,
        evaluation_strategy : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFeatureRequest.new(name: name, project: project, variations: variations, default_variation: default_variation, description: description, entity_overrides: entity_overrides, evaluation_strategy: evaluation_strategy, tags: tags)
        create_feature(input)
      end

      def create_feature(input : Types::CreateFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a launch of a given feature. Before you create a launch, you must create the feature to use
      # for the launch. You can use a launch to safely validate new features by serving them to a specified
      # percentage of your users while you roll out the feature. You can monitor the performance of the new
      # feature to help you decide when to ramp up traffic to more users. This helps you reduce risk and
      # identify unintended consequences before you fully launch the feature. Don't use this operation to
      # update an existing launch. Instead, use UpdateLaunch .

      def create_launch(
        groups : Array(Types::LaunchGroupConfig),
        name : String,
        project : String,
        description : String? = nil,
        metric_monitors : Array(Types::MetricMonitorConfig)? = nil,
        randomization_salt : String? = nil,
        scheduled_splits_config : Types::ScheduledSplitsLaunchConfig? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateLaunchRequest.new(groups: groups, name: name, project: project, description: description, metric_monitors: metric_monitors, randomization_salt: randomization_salt, scheduled_splits_config: scheduled_splits_config, tags: tags)
        create_launch(input)
      end

      def create_launch(input : Types::CreateLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a project, which is the logical object in Evidently that can contain features, launches, and
      # experiments. Use projects to group similar features together. To update an existing project, use
      # UpdateProject .

      def create_project(
        name : String,
        app_config_resource : Types::ProjectAppConfigResourceConfig? = nil,
        data_delivery : Types::ProjectDataDeliveryConfig? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProjectRequest.new(name: name, app_config_resource: app_config_resource, data_delivery: data_delivery, description: description, tags: tags)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to define a segment of your audience. A segment is a portion of your audience
      # that share one or more characteristics. Examples could be Chrome browser users, users in Europe, or
      # Firefox browser users in Europe who also fit other criteria that your application collects, such as
      # age. Using a segment in an experiment limits that experiment to evaluate only the users who match
      # the segment criteria. Using one or more segments in a launch allows you to define different traffic
      # splits for the different audience segments. For more information about segment pattern syntax, see
      # Segment rule pattern syntax . The pattern that you define for a segment is matched against the value
      # of evaluationContext , which is passed into Evidently in the EvaluateFeature operation, when
      # Evidently assigns a feature variation to a user.

      def create_segment(
        name : String,
        pattern : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSegmentRequest.new(name: name, pattern: pattern, description: description, tags: tags)
        create_segment(input)
      end

      def create_segment(input : Types::CreateSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Evidently experiment. The feature used for the experiment is not deleted. To stop an
      # experiment without deleting it, use StopExperiment .

      def delete_experiment(
        experiment : String,
        project : String
      ) : Protocol::Request
        input = Types::DeleteExperimentRequest.new(experiment: experiment, project: project)
        delete_experiment(input)
      end

      def delete_experiment(input : Types::DeleteExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Evidently feature.

      def delete_feature(
        feature : String,
        project : String
      ) : Protocol::Request
        input = Types::DeleteFeatureRequest.new(feature: feature, project: project)
        delete_feature(input)
      end

      def delete_feature(input : Types::DeleteFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Evidently launch. The feature used for the launch is not deleted. To stop a launch
      # without deleting it, use StopLaunch .

      def delete_launch(
        launch : String,
        project : String
      ) : Protocol::Request
        input = Types::DeleteLaunchRequest.new(launch: launch, project: project)
        delete_launch(input)
      end

      def delete_launch(input : Types::DeleteLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Evidently project. Before you can delete a project, you must delete all the features that
      # the project contains. To delete a feature, use DeleteFeature .

      def delete_project(
        project : String
      ) : Protocol::Request
        input = Types::DeleteProjectRequest.new(project: project)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a segment. You can't delete a segment that is being used in a launch or experiment, even if
      # that launch or experiment is not currently running.

      def delete_segment(
        segment : String
      ) : Protocol::Request
        input = Types::DeleteSegmentRequest.new(segment: segment)
        delete_segment(input)
      end

      def delete_segment(input : Types::DeleteSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This operation assigns a feature variation to one given user session. You pass in an entityID that
      # represents the user. Evidently then checks the evaluation rules and assigns the variation. The first
      # rules that are evaluated are the override rules. If the user's entityID matches an override rule,
      # the user is served the variation specified by that rule. If there is a current launch with this
      # feature that uses segment overrides, and if the user session's evaluationContext matches a segment
      # rule defined in a segment override, the configuration in the segment overrides is used. For more
      # information about segments, see CreateSegment and Use segments to focus your audience . If there is
      # a launch with no segment overrides, the user might be assigned to a variation in the launch. The
      # chance of this depends on the percentage of users that are allocated to that launch. If the user is
      # enrolled in the launch, the variation they are served depends on the allocation of the various
      # feature variations used for the launch. If the user is not assigned to a launch, and there is an
      # ongoing experiment for this feature, the user might be assigned to a variation in the experiment.
      # The chance of this depends on the percentage of users that are allocated to that experiment. If the
      # experiment uses a segment, then only user sessions with evaluationContext values that match the
      # segment rule are used in the experiment. If the user is enrolled in the experiment, the variation
      # they are served depends on the allocation of the various feature variations used for the experiment.
      # If the user is not assigned to a launch or experiment, they are served the default variation.

      def evaluate_feature(
        entity_id : String,
        feature : String,
        project : String,
        evaluation_context : String? = nil
      ) : Protocol::Request
        input = Types::EvaluateFeatureRequest.new(entity_id: entity_id, feature: feature, project: project, evaluation_context: evaluation_context)
        evaluate_feature(input)
      end

      def evaluate_feature(input : Types::EvaluateFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EVALUATE_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about one experiment. You must already know the experiment name. To retrieve a
      # list of experiments in your account, use ListExperiments .

      def get_experiment(
        experiment : String,
        project : String
      ) : Protocol::Request
        input = Types::GetExperimentRequest.new(experiment: experiment, project: project)
        get_experiment(input)
      end

      def get_experiment(input : Types::GetExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the results of a running or completed experiment. No results are available until there
      # have been 100 events for each variation and at least 10 minutes have passed since the start of the
      # experiment. To increase the statistical power, Evidently performs an additional offline p-value
      # analysis at the end of the experiment. Offline p-value analysis can detect statistical significance
      # in some cases where the anytime p-values used during the experiment do not find statistical
      # significance. Experiment results are available up to 63 days after the start of the experiment. They
      # are not available after that because of CloudWatch data retention policies.

      def get_experiment_results(
        experiment : String,
        metric_names : Array(String),
        project : String,
        treatment_names : Array(String),
        base_stat : String? = nil,
        end_time : Time? = nil,
        period : Int64? = nil,
        report_names : Array(String)? = nil,
        result_stats : Array(String)? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetExperimentResultsRequest.new(experiment: experiment, metric_names: metric_names, project: project, treatment_names: treatment_names, base_stat: base_stat, end_time: end_time, period: period, report_names: report_names, result_stats: result_stats, start_time: start_time)
        get_experiment_results(input)
      end

      def get_experiment_results(input : Types::GetExperimentResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPERIMENT_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about one feature. You must already know the feature name. To retrieve a list of
      # features in your account, use ListFeatures .

      def get_feature(
        feature : String,
        project : String
      ) : Protocol::Request
        input = Types::GetFeatureRequest.new(feature: feature, project: project)
        get_feature(input)
      end

      def get_feature(input : Types::GetFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about one launch. You must already know the launch name. To retrieve a list of
      # launches in your account, use ListLaunches .

      def get_launch(
        launch : String,
        project : String
      ) : Protocol::Request
        input = Types::GetLaunchRequest.new(launch: launch, project: project)
        get_launch(input)
      end

      def get_launch(input : Types::GetLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details about one launch. You must already know the project name. To retrieve a list of
      # projects in your account, use ListProjects .

      def get_project(
        project : String
      ) : Protocol::Request
        input = Types::GetProjectRequest.new(project: project)
        get_project(input)
      end

      def get_project(input : Types::GetProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the specified segment. Specify the segment you want to view by specifying
      # its ARN.

      def get_segment(
        segment : String
      ) : Protocol::Request
        input = Types::GetSegmentRequest.new(segment: segment)
        get_segment(input)
      end

      def get_segment(input : Types::GetSegmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SEGMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configuration details about all the experiments in the specified project.

      def list_experiments(
        project : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListExperimentsRequest.new(project: project, max_results: max_results, next_token: next_token, status: status)
        list_experiments(input)
      end

      def list_experiments(input : Types::ListExperimentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPERIMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configuration details about all the features in the specified project.

      def list_features(
        project : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFeaturesRequest.new(project: project, max_results: max_results, next_token: next_token)
        list_features(input)
      end

      def list_features(input : Types::ListFeaturesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FEATURES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configuration details about all the launches in the specified project.

      def list_launches(
        project : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListLaunchesRequest.new(project: project, max_results: max_results, next_token: next_token, status: status)
        list_launches(input)
      end

      def list_launches(input : Types::ListLaunchesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAUNCHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configuration details about all the projects in the current Region in your account.

      def list_projects(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListProjectsRequest.new(max_results: max_results, next_token: next_token)
        list_projects(input)
      end

      def list_projects(input : Types::ListProjectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Use this operation to find which experiments or launches are using a specified segment.

      def list_segment_references(
        segment : String,
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSegmentReferencesRequest.new(segment: segment, type: type, max_results: max_results, next_token: next_token)
        list_segment_references(input)
      end

      def list_segment_references(input : Types::ListSegmentReferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEGMENT_REFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of audience segments that you have created in your account in this Region.

      def list_segments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSegmentsRequest.new(max_results: max_results, next_token: next_token)
        list_segments(input)
      end

      def list_segments(input : Types::ListSegmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SEGMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the tags associated with an Evidently resource.

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

      # Sends performance events to Evidently. These events can be used to evaluate a launch or an
      # experiment.

      def put_project_events(
        events : Array(Types::Event),
        project : String
      ) : Protocol::Request
        input = Types::PutProjectEventsRequest.new(events: events, project: project)
        put_project_events(input)
      end

      def put_project_events(input : Types::PutProjectEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PROJECT_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an existing experiment. To create an experiment, use CreateExperiment .

      def start_experiment(
        analysis_complete_time : Time,
        experiment : String,
        project : String
      ) : Protocol::Request
        input = Types::StartExperimentRequest.new(analysis_complete_time: analysis_complete_time, experiment: experiment, project: project)
        start_experiment(input)
      end

      def start_experiment(input : Types::StartExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an existing launch. To create a launch, use CreateLaunch .

      def start_launch(
        launch : String,
        project : String
      ) : Protocol::Request
        input = Types::StartLaunchRequest.new(launch: launch, project: project)
        start_launch(input)
      end

      def start_launch(input : Types::StartLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops an experiment that is currently running. If you stop an experiment, you can't resume it or
      # restart it.

      def stop_experiment(
        experiment : String,
        project : String,
        desired_state : String? = nil,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::StopExperimentRequest.new(experiment: experiment, project: project, desired_state: desired_state, reason: reason)
        stop_experiment(input)
      end

      def stop_experiment(input : Types::StopExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops a launch that is currently running. After you stop a launch, you will not be able to resume it
      # or restart it. Also, it will not be evaluated as a rule for traffic allocation, and the traffic that
      # was allocated to the launch will instead be available to the feature's experiment, if there is one.
      # Otherwise, all traffic will be served the default variation after the launch is stopped.

      def stop_launch(
        launch : String,
        project : String,
        desired_state : String? = nil,
        reason : String? = nil
      ) : Protocol::Request
        input = Types::StopLaunchRequest.new(launch: launch, project: project, desired_state: desired_state, reason: reason)
        stop_launch(input)
      end

      def stop_launch(input : Types::StopLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns one or more tags (key-value pairs) to the specified CloudWatch Evidently resource. Projects,
      # features, launches, and experiments can be tagged. Tags can help you organize and categorize your
      # resources. You can also use them to scope user permissions by granting a user permission to access
      # or change only resources with certain tag values. Tags don't have any semantic meaning to Amazon Web
      # Services and are interpreted strictly as strings of characters. You can use the TagResource action
      # with a resource that already has tags. If you specify a new tag key for the resource, this tag is
      # appended to the list of tags associated with the alarm. If you specify a tag key that is already
      # associated with the resource, the new tag value that you specify replaces the previous value for
      # that tag. You can associate as many as 50 tags with a resource. For more information, see Tagging
      # Amazon Web Services resources .

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

      # Use this operation to test a rules pattern that you plan to use to create an audience segment. For
      # more information about segments, see CreateSegment .

      def test_segment_pattern(
        pattern : String,
        payload : String
      ) : Protocol::Request
        input = Types::TestSegmentPatternRequest.new(pattern: pattern, payload: payload)
        test_segment_pattern(input)
      end

      def test_segment_pattern(input : Types::TestSegmentPatternRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_SEGMENT_PATTERN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes one or more tags from the specified resource.

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

      # Updates an Evidently experiment. Don't use this operation to update an experiment's tag. Instead,
      # use TagResource .

      def update_experiment(
        experiment : String,
        project : String,
        description : String? = nil,
        metric_goals : Array(Types::MetricGoalConfig)? = nil,
        online_ab_config : Types::OnlineAbConfig? = nil,
        randomization_salt : String? = nil,
        remove_segment : Bool? = nil,
        sampling_rate : Int64? = nil,
        segment : String? = nil,
        treatments : Array(Types::TreatmentConfig)? = nil
      ) : Protocol::Request
        input = Types::UpdateExperimentRequest.new(experiment: experiment, project: project, description: description, metric_goals: metric_goals, online_ab_config: online_ab_config, randomization_salt: randomization_salt, remove_segment: remove_segment, sampling_rate: sampling_rate, segment: segment, treatments: treatments)
        update_experiment(input)
      end

      def update_experiment(input : Types::UpdateExperimentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EXPERIMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing feature. You can't use this operation to update the tags of an existing feature.
      # Instead, use TagResource .

      def update_feature(
        feature : String,
        project : String,
        add_or_update_variations : Array(Types::VariationConfig)? = nil,
        default_variation : String? = nil,
        description : String? = nil,
        entity_overrides : Hash(String, String)? = nil,
        evaluation_strategy : String? = nil,
        remove_variations : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateFeatureRequest.new(feature: feature, project: project, add_or_update_variations: add_or_update_variations, default_variation: default_variation, description: description, entity_overrides: entity_overrides, evaluation_strategy: evaluation_strategy, remove_variations: remove_variations)
        update_feature(input)
      end

      def update_feature(input : Types::UpdateFeatureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FEATURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a launch of a given feature. Don't use this operation to update the tags of an existing
      # launch. Instead, use TagResource .

      def update_launch(
        launch : String,
        project : String,
        description : String? = nil,
        groups : Array(Types::LaunchGroupConfig)? = nil,
        metric_monitors : Array(Types::MetricMonitorConfig)? = nil,
        randomization_salt : String? = nil,
        scheduled_splits_config : Types::ScheduledSplitsLaunchConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateLaunchRequest.new(launch: launch, project: project, description: description, groups: groups, metric_monitors: metric_monitors, randomization_salt: randomization_salt, scheduled_splits_config: scheduled_splits_config)
        update_launch(input)
      end

      def update_launch(input : Types::UpdateLaunchRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LAUNCH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description of an existing project. To create a new project, use CreateProject . Don't
      # use this operation to update the data storage options of a project. Instead, use
      # UpdateProjectDataDelivery . Don't use this operation to update the tags of a project. Instead, use
      # TagResource .

      def update_project(
        project : String,
        app_config_resource : Types::ProjectAppConfigResourceConfig? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectRequest.new(project: project, app_config_resource: app_config_resource, description: description)
        update_project(input)
      end

      def update_project(input : Types::UpdateProjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the data storage options for this project. If you store evaluation events, you an keep them
      # and analyze them on your own. If you choose not to store evaluation events, Evidently deletes them
      # after using them to produce metrics and other experiment results that you can view. You can't
      # specify both cloudWatchLogs and s3Destination in the same operation.

      def update_project_data_delivery(
        project : String,
        cloud_watch_logs : Types::CloudWatchLogsDestinationConfig? = nil,
        s3_destination : Types::S3DestinationConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateProjectDataDeliveryRequest.new(project: project, cloud_watch_logs: cloud_watch_logs, s3_destination: s3_destination)
        update_project_data_delivery(input)
      end

      def update_project_data_delivery(input : Types::UpdateProjectDataDeliveryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROJECT_DATA_DELIVERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
