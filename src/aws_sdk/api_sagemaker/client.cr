module AwsSdk
  module SageMaker
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

      # Creates an association between the source and the destination. A source can be associated with
      # multiple destinations, and a destination can be associated with multiple sources. An association is
      # a lineage tracking entity. For more information, see Amazon SageMaker ML Lineage Tracking .
      def add_association(
        destination_arn : String,
        source_arn : String,
        association_type : String? = nil
      ) : Types::AddAssociationResponse
        input = Types::AddAssociationRequest.new(destination_arn: destination_arn, source_arn: source_arn, association_type: association_type)
        add_association(input)
      end
      def add_association(input : Types::AddAssociationRequest) : Types::AddAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddAssociationResponse, "AddAssociation")
      end

      # Adds or overwrites one or more tags for the specified SageMaker resource. You can add tags to
      # notebook instances, training jobs, hyperparameter tuning jobs, batch transform jobs, models,
      # labeling jobs, work teams, endpoint configurations, and endpoints. Each tag consists of a key and an
      # optional value. Tag keys must be unique per resource. For more information about tags, see For more
      # information, see Amazon Web Services Tagging Strategies . Tags that you add to a hyperparameter
      # tuning job by calling this API are also added to any training jobs that the hyperparameter tuning
      # job launches after you call this API, but not to training jobs that the hyperparameter tuning job
      # launched before you called this API. To make sure that the tags associated with a hyperparameter
      # tuning job are also added to all training jobs that the hyperparameter tuning job launches, add the
      # tags when you first create the tuning job by specifying them in the Tags parameter of
      # CreateHyperParameterTuningJob Tags that you add to a SageMaker Domain or User Profile by calling
      # this API are also added to any Apps that the Domain or User Profile launches after you call this
      # API, but not to Apps that the Domain or User Profile launched before you called this API. To make
      # sure that the tags associated with a Domain or User Profile are also added to all Apps that the
      # Domain or User Profile launches, add the tags when you first create the Domain or User Profile by
      # specifying them in the Tags parameter of CreateDomain or CreateUserProfile .
      def add_tags(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsOutput
        input = Types::AddTagsInput.new(resource_arn: resource_arn, tags: tags)
        add_tags(input)
      end
      def add_tags(input : Types::AddTagsInput) : Types::AddTagsOutput
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsOutput, "AddTags")
      end

      # Associates a trial component with a trial. A trial component can be associated with multiple trials.
      # To disassociate a trial component from a trial, call the DisassociateTrialComponent API.
      def associate_trial_component(
        trial_component_name : String,
        trial_name : String
      ) : Types::AssociateTrialComponentResponse
        input = Types::AssociateTrialComponentRequest.new(trial_component_name: trial_component_name, trial_name: trial_name)
        associate_trial_component(input)
      end
      def associate_trial_component(input : Types::AssociateTrialComponentRequest) : Types::AssociateTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateTrialComponentResponse, "AssociateTrialComponent")
      end

      # Attaches your Amazon Elastic Block Store (Amazon EBS) volume to a node in your EKS orchestrated
      # HyperPod cluster. This API works with the Amazon Elastic Block Store (Amazon EBS) Container Storage
      # Interface (CSI) driver to manage the lifecycle of persistent storage in your HyperPod EKS clusters.
      def attach_cluster_node_volume(
        cluster_arn : String,
        node_id : String,
        volume_id : String
      ) : Types::AttachClusterNodeVolumeResponse
        input = Types::AttachClusterNodeVolumeRequest.new(cluster_arn: cluster_arn, node_id: node_id, volume_id: volume_id)
        attach_cluster_node_volume(input)
      end
      def attach_cluster_node_volume(input : Types::AttachClusterNodeVolumeRequest) : Types::AttachClusterNodeVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::ATTACH_CLUSTER_NODE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AttachClusterNodeVolumeResponse, "AttachClusterNodeVolume")
      end

      # Adds nodes to a HyperPod cluster by incrementing the target count for one or more instance groups.
      # This operation returns a unique NodeLogicalId for each node being added, which can be used to track
      # the provisioning status of the node. This API provides a safer alternative to UpdateCluster for
      # scaling operations by avoiding unintended configuration changes. This API is only supported for
      # clusters using Continuous as the NodeProvisioningMode .
      def batch_add_cluster_nodes(
        cluster_name : String,
        nodes_to_add : Array(Types::AddClusterNodeSpecification),
        client_token : String? = nil
      ) : Types::BatchAddClusterNodesResponse
        input = Types::BatchAddClusterNodesRequest.new(cluster_name: cluster_name, nodes_to_add: nodes_to_add, client_token: client_token)
        batch_add_cluster_nodes(input)
      end
      def batch_add_cluster_nodes(input : Types::BatchAddClusterNodesRequest) : Types::BatchAddClusterNodesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_ADD_CLUSTER_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchAddClusterNodesResponse, "BatchAddClusterNodes")
      end

      # Deletes specific nodes within a SageMaker HyperPod cluster. BatchDeleteClusterNodes accepts a
      # cluster name and a list of node IDs. To safeguard your work, back up your data to Amazon S3 or an
      # FSx for Lustre file system before invoking the API on a worker node group. This will help prevent
      # any potential data loss from the instance root volume. For more information about backup, see Use
      # the backup script provided by SageMaker HyperPod . If you want to invoke this API on an existing
      # cluster, you'll first need to patch the cluster by running the UpdateClusterSoftware API . For more
      # information about patching a cluster, see Update the SageMaker HyperPod platform software of a
      # cluster .
      def batch_delete_cluster_nodes(
        cluster_name : String,
        node_ids : Array(String)? = nil,
        node_logical_ids : Array(String)? = nil
      ) : Types::BatchDeleteClusterNodesResponse
        input = Types::BatchDeleteClusterNodesRequest.new(cluster_name: cluster_name, node_ids: node_ids, node_logical_ids: node_logical_ids)
        batch_delete_cluster_nodes(input)
      end
      def batch_delete_cluster_nodes(input : Types::BatchDeleteClusterNodesRequest) : Types::BatchDeleteClusterNodesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_DELETE_CLUSTER_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDeleteClusterNodesResponse, "BatchDeleteClusterNodes")
      end

      # This action batch describes a list of versioned model packages
      def batch_describe_model_package(
        model_package_arn_list : Array(String)
      ) : Types::BatchDescribeModelPackageOutput
        input = Types::BatchDescribeModelPackageInput.new(model_package_arn_list: model_package_arn_list)
        batch_describe_model_package(input)
      end
      def batch_describe_model_package(input : Types::BatchDescribeModelPackageInput) : Types::BatchDescribeModelPackageOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_DESCRIBE_MODEL_PACKAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDescribeModelPackageOutput, "BatchDescribeModelPackage")
      end

      # Reboots specific nodes within a SageMaker HyperPod cluster using a soft recovery mechanism.
      # BatchRebootClusterNodes performs a graceful reboot of the specified nodes by calling the Amazon
      # Elastic Compute Cloud RebootInstances API, which attempts to cleanly shut down the operating system
      # before restarting the instance. This operation is useful for recovering from transient issues or
      # applying certain configuration changes that require a restart. Rebooting a node may cause temporary
      # service interruption for workloads running on that node. Ensure your workloads can handle node
      # restarts or use appropriate scheduling to minimize impact. You can reboot up to 25 nodes in a single
      # request. For SageMaker HyperPod clusters using the Slurm workload manager, ensure rebooting nodes
      # will not disrupt critical cluster operations.
      def batch_reboot_cluster_nodes(
        cluster_name : String,
        node_ids : Array(String)? = nil,
        node_logical_ids : Array(String)? = nil
      ) : Types::BatchRebootClusterNodesResponse
        input = Types::BatchRebootClusterNodesRequest.new(cluster_name: cluster_name, node_ids: node_ids, node_logical_ids: node_logical_ids)
        batch_reboot_cluster_nodes(input)
      end
      def batch_reboot_cluster_nodes(input : Types::BatchRebootClusterNodesRequest) : Types::BatchRebootClusterNodesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_REBOOT_CLUSTER_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchRebootClusterNodesResponse, "BatchRebootClusterNodes")
      end

      # Replaces specific nodes within a SageMaker HyperPod cluster with new hardware.
      # BatchReplaceClusterNodes terminates the specified instances and provisions new replacement instances
      # with the same configuration but fresh hardware. The Amazon Machine Image (AMI) and instance
      # configuration remain the same. This operation is useful for recovering from hardware failures or
      # persistent issues that cannot be resolved through a reboot. Data Loss Warning: Replacing nodes
      # destroys all instance volumes, including both root and secondary volumes. All data stored on these
      # volumes will be permanently lost and cannot be recovered. To safeguard your work, back up your data
      # to Amazon S3 or an FSx for Lustre file system before invoking the API on a worker node group. This
      # will help prevent any potential data loss from the instance root volume. For more information about
      # backup, see Use the backup script provided by SageMaker HyperPod . If you want to invoke this API on
      # an existing cluster, you'll first need to patch the cluster by running the UpdateClusterSoftware API
      # . For more information about patching a cluster, see Update the SageMaker HyperPod platform software
      # of a cluster . You can replace up to 25 nodes in a single request.
      def batch_replace_cluster_nodes(
        cluster_name : String,
        node_ids : Array(String)? = nil,
        node_logical_ids : Array(String)? = nil
      ) : Types::BatchReplaceClusterNodesResponse
        input = Types::BatchReplaceClusterNodesRequest.new(cluster_name: cluster_name, node_ids: node_ids, node_logical_ids: node_logical_ids)
        batch_replace_cluster_nodes(input)
      end
      def batch_replace_cluster_nodes(input : Types::BatchReplaceClusterNodesRequest) : Types::BatchReplaceClusterNodesResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_REPLACE_CLUSTER_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchReplaceClusterNodesResponse, "BatchReplaceClusterNodes")
      end

      # Creates an action . An action is a lineage tracking entity that represents an action or activity.
      # For example, a model deployment or an HPO job. Generally, an action involves at least one input or
      # output artifact. For more information, see Amazon SageMaker ML Lineage Tracking .
      def create_action(
        action_name : String,
        action_type : String,
        source : Types::ActionSource,
        description : String? = nil,
        metadata_properties : Types::MetadataProperties? = nil,
        properties : Hash(String, String)? = nil,
        status : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateActionResponse
        input = Types::CreateActionRequest.new(action_name: action_name, action_type: action_type, source: source, description: description, metadata_properties: metadata_properties, properties: properties, status: status, tags: tags)
        create_action(input)
      end
      def create_action(input : Types::CreateActionRequest) : Types::CreateActionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateActionResponse, "CreateAction")
      end

      # Create a machine learning algorithm that you can use in SageMaker and list in the Amazon Web
      # Services Marketplace.
      def create_algorithm(
        algorithm_name : String,
        training_specification : Types::TrainingSpecification,
        algorithm_description : String? = nil,
        certify_for_marketplace : Bool? = nil,
        inference_specification : Types::InferenceSpecification? = nil,
        tags : Array(Types::Tag)? = nil,
        validation_specification : Types::AlgorithmValidationSpecification? = nil
      ) : Types::CreateAlgorithmOutput
        input = Types::CreateAlgorithmInput.new(algorithm_name: algorithm_name, training_specification: training_specification, algorithm_description: algorithm_description, certify_for_marketplace: certify_for_marketplace, inference_specification: inference_specification, tags: tags, validation_specification: validation_specification)
        create_algorithm(input)
      end
      def create_algorithm(input : Types::CreateAlgorithmInput) : Types::CreateAlgorithmOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ALGORITHM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAlgorithmOutput, "CreateAlgorithm")
      end

      # Creates a running app for the specified UserProfile. This operation is automatically invoked by
      # Amazon SageMaker AI upon access to the associated Domain, and when new kernel configurations are
      # selected by the user. A user may have multiple Apps active simultaneously.
      def create_app(
        app_name : String,
        app_type : String,
        domain_id : String,
        recovery_mode : Bool? = nil,
        resource_spec : Types::ResourceSpec? = nil,
        space_name : String? = nil,
        tags : Array(Types::Tag)? = nil,
        user_profile_name : String? = nil
      ) : Types::CreateAppResponse
        input = Types::CreateAppRequest.new(app_name: app_name, app_type: app_type, domain_id: domain_id, recovery_mode: recovery_mode, resource_spec: resource_spec, space_name: space_name, tags: tags, user_profile_name: user_profile_name)
        create_app(input)
      end
      def create_app(input : Types::CreateAppRequest) : Types::CreateAppResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAppResponse, "CreateApp")
      end

      # Creates a configuration for running a SageMaker AI image as a KernelGateway app. The configuration
      # specifies the Amazon Elastic File System storage volume on the image, and a list of the kernels in
      # the image.
      def create_app_image_config(
        app_image_config_name : String,
        code_editor_app_image_config : Types::CodeEditorAppImageConfig? = nil,
        jupyter_lab_app_image_config : Types::JupyterLabAppImageConfig? = nil,
        kernel_gateway_image_config : Types::KernelGatewayImageConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAppImageConfigResponse
        input = Types::CreateAppImageConfigRequest.new(app_image_config_name: app_image_config_name, code_editor_app_image_config: code_editor_app_image_config, jupyter_lab_app_image_config: jupyter_lab_app_image_config, kernel_gateway_image_config: kernel_gateway_image_config, tags: tags)
        create_app_image_config(input)
      end
      def create_app_image_config(input : Types::CreateAppImageConfigRequest) : Types::CreateAppImageConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_APP_IMAGE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAppImageConfigResponse, "CreateAppImageConfig")
      end

      # Creates an artifact . An artifact is a lineage tracking entity that represents a URI addressable
      # object or data. Some examples are the S3 URI of a dataset and the ECR registry path of an image. For
      # more information, see Amazon SageMaker ML Lineage Tracking .
      def create_artifact(
        artifact_type : String,
        source : Types::ArtifactSource,
        artifact_name : String? = nil,
        metadata_properties : Types::MetadataProperties? = nil,
        properties : Hash(String, String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateArtifactResponse
        input = Types::CreateArtifactRequest.new(artifact_type: artifact_type, source: source, artifact_name: artifact_name, metadata_properties: metadata_properties, properties: properties, tags: tags)
        create_artifact(input)
      end
      def create_artifact(input : Types::CreateArtifactRequest) : Types::CreateArtifactResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateArtifactResponse, "CreateArtifact")
      end

      # Creates an Autopilot job also referred to as Autopilot experiment or AutoML job. An AutoML job in
      # SageMaker AI is a fully automated process that allows you to build machine learning models with
      # minimal effort and machine learning expertise. When initiating an AutoML job, you provide your data
      # and optionally specify parameters tailored to your use case. SageMaker AI then automates the entire
      # model development lifecycle, including data preprocessing, model training, tuning, and evaluation.
      # AutoML jobs are designed to simplify and accelerate the model building process by automating various
      # tasks and exploring different combinations of machine learning algorithms, data preprocessing
      # techniques, and hyperparameter values. The output of an AutoML job comprises one or more trained
      # models ready for deployment and inference. Additionally, SageMaker AI AutoML jobs generate a
      # candidate model leaderboard, allowing you to select the best-performing model for deployment. For
      # more information about AutoML jobs, see
      # https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html in the
      # SageMaker AI developer guide. We recommend using the new versions CreateAutoMLJobV2 and
      # DescribeAutoMLJobV2 , which offer backward compatibility. CreateAutoMLJobV2 can manage tabular
      # problem types identical to those of its previous version CreateAutoMLJob , as well as time-series
      # forecasting, non-tabular problem types such as image or text classification, and text generation
      # (LLMs fine-tuning). Find guidelines about how to migrate a CreateAutoMLJob to CreateAutoMLJobV2 in
      # Migrate a CreateAutoMLJob to CreateAutoMLJobV2 . You can find the best-performing model after you
      # run an AutoML job by calling DescribeAutoMLJobV2 (recommended) or DescribeAutoMLJob .
      def create_auto_ml_job(
        auto_ml_job_name : String,
        input_data_config : Array(Types::AutoMLChannel),
        output_data_config : Types::AutoMLOutputDataConfig,
        role_arn : String,
        auto_ml_job_config : Types::AutoMLJobConfig? = nil,
        auto_ml_job_objective : Types::AutoMLJobObjective? = nil,
        generate_candidate_definitions_only : Bool? = nil,
        model_deploy_config : Types::ModelDeployConfig? = nil,
        problem_type : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAutoMLJobResponse
        input = Types::CreateAutoMLJobRequest.new(auto_ml_job_name: auto_ml_job_name, input_data_config: input_data_config, output_data_config: output_data_config, role_arn: role_arn, auto_ml_job_config: auto_ml_job_config, auto_ml_job_objective: auto_ml_job_objective, generate_candidate_definitions_only: generate_candidate_definitions_only, model_deploy_config: model_deploy_config, problem_type: problem_type, tags: tags)
        create_auto_ml_job(input)
      end
      def create_auto_ml_job(input : Types::CreateAutoMLJobRequest) : Types::CreateAutoMLJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_AUTO_ML_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAutoMLJobResponse, "CreateAutoMLJob")
      end

      # Creates an Autopilot job also referred to as Autopilot experiment or AutoML job V2. An AutoML job in
      # SageMaker AI is a fully automated process that allows you to build machine learning models with
      # minimal effort and machine learning expertise. When initiating an AutoML job, you provide your data
      # and optionally specify parameters tailored to your use case. SageMaker AI then automates the entire
      # model development lifecycle, including data preprocessing, model training, tuning, and evaluation.
      # AutoML jobs are designed to simplify and accelerate the model building process by automating various
      # tasks and exploring different combinations of machine learning algorithms, data preprocessing
      # techniques, and hyperparameter values. The output of an AutoML job comprises one or more trained
      # models ready for deployment and inference. Additionally, SageMaker AI AutoML jobs generate a
      # candidate model leaderboard, allowing you to select the best-performing model for deployment. For
      # more information about AutoML jobs, see
      # https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html in the
      # SageMaker AI developer guide. AutoML jobs V2 support various problem types such as regression,
      # binary, and multiclass classification with tabular data, text and image classification, time-series
      # forecasting, and fine-tuning of large language models (LLMs) for text generation. CreateAutoMLJobV2
      # and DescribeAutoMLJobV2 are new versions of CreateAutoMLJob and DescribeAutoMLJob which offer
      # backward compatibility. CreateAutoMLJobV2 can manage tabular problem types identical to those of its
      # previous version CreateAutoMLJob , as well as time-series forecasting, non-tabular problem types
      # such as image or text classification, and text generation (LLMs fine-tuning). Find guidelines about
      # how to migrate a CreateAutoMLJob to CreateAutoMLJobV2 in Migrate a CreateAutoMLJob to
      # CreateAutoMLJobV2 . For the list of available problem types supported by CreateAutoMLJobV2 , see
      # AutoMLProblemTypeConfig . You can find the best-performing model after you run an AutoML job V2 by
      # calling DescribeAutoMLJobV2 .
      def create_auto_ml_job_v2(
        auto_ml_job_input_data_config : Array(Types::AutoMLJobChannel),
        auto_ml_job_name : String,
        auto_ml_problem_type_config : Types::AutoMLProblemTypeConfig,
        output_data_config : Types::AutoMLOutputDataConfig,
        role_arn : String,
        auto_ml_compute_config : Types::AutoMLComputeConfig? = nil,
        auto_ml_job_objective : Types::AutoMLJobObjective? = nil,
        data_split_config : Types::AutoMLDataSplitConfig? = nil,
        model_deploy_config : Types::ModelDeployConfig? = nil,
        security_config : Types::AutoMLSecurityConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateAutoMLJobV2Response
        input = Types::CreateAutoMLJobV2Request.new(auto_ml_job_input_data_config: auto_ml_job_input_data_config, auto_ml_job_name: auto_ml_job_name, auto_ml_problem_type_config: auto_ml_problem_type_config, output_data_config: output_data_config, role_arn: role_arn, auto_ml_compute_config: auto_ml_compute_config, auto_ml_job_objective: auto_ml_job_objective, data_split_config: data_split_config, model_deploy_config: model_deploy_config, security_config: security_config, tags: tags)
        create_auto_ml_job_v2(input)
      end
      def create_auto_ml_job_v2(input : Types::CreateAutoMLJobV2Request) : Types::CreateAutoMLJobV2Response
        request = Protocol::JsonRpc.build_request(Model::CREATE_AUTO_ML_JOB_V2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAutoMLJobV2Response, "CreateAutoMLJobV2")
      end

      # Creates an Amazon SageMaker HyperPod cluster. SageMaker HyperPod is a capability of SageMaker for
      # creating and managing persistent clusters for developing large machine learning models, such as
      # large language models (LLMs) and diffusion models. To learn more, see Amazon SageMaker HyperPod in
      # the Amazon SageMaker Developer Guide .
      def create_cluster(
        cluster_name : String,
        auto_scaling : Types::ClusterAutoScalingConfig? = nil,
        cluster_role : String? = nil,
        instance_groups : Array(Types::ClusterInstanceGroupSpecification)? = nil,
        node_provisioning_mode : String? = nil,
        node_recovery : String? = nil,
        orchestrator : Types::ClusterOrchestrator? = nil,
        restricted_instance_groups : Array(Types::ClusterRestrictedInstanceGroupSpecification)? = nil,
        tags : Array(Types::Tag)? = nil,
        tiered_storage_config : Types::ClusterTieredStorageConfig? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateClusterResponse
        input = Types::CreateClusterRequest.new(cluster_name: cluster_name, auto_scaling: auto_scaling, cluster_role: cluster_role, instance_groups: instance_groups, node_provisioning_mode: node_provisioning_mode, node_recovery: node_recovery, orchestrator: orchestrator, restricted_instance_groups: restricted_instance_groups, tags: tags, tiered_storage_config: tiered_storage_config, vpc_config: vpc_config)
        create_cluster(input)
      end
      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Create cluster policy configuration. This policy is used for task prioritization and fair-share
      # allocation of idle compute. This helps prioritize critical workloads and distributes idle compute
      # across entities.
      def create_cluster_scheduler_config(
        cluster_arn : String,
        name : String,
        scheduler_config : Types::SchedulerConfig,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterSchedulerConfigResponse
        input = Types::CreateClusterSchedulerConfigRequest.new(cluster_arn: cluster_arn, name: name, scheduler_config: scheduler_config, description: description, tags: tags)
        create_cluster_scheduler_config(input)
      end
      def create_cluster_scheduler_config(input : Types::CreateClusterSchedulerConfigRequest) : Types::CreateClusterSchedulerConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER_SCHEDULER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterSchedulerConfigResponse, "CreateClusterSchedulerConfig")
      end

      # Creates a Git repository as a resource in your SageMaker AI account. You can associate the
      # repository with notebook instances so that you can use Git source control for the notebooks you
      # create. The Git repository is a resource in your SageMaker AI account, so it can be associated with
      # more than one notebook instance, and it persists independently from the lifecycle of any notebook
      # instances it is associated with. The repository can be hosted either in Amazon Web Services
      # CodeCommit or in any other Git repository.
      def create_code_repository(
        code_repository_name : String,
        git_config : Types::GitConfig,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCodeRepositoryOutput
        input = Types::CreateCodeRepositoryInput.new(code_repository_name: code_repository_name, git_config: git_config, tags: tags)
        create_code_repository(input)
      end
      def create_code_repository(input : Types::CreateCodeRepositoryInput) : Types::CreateCodeRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_CODE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCodeRepositoryOutput, "CreateCodeRepository")
      end

      # Starts a model compilation job. After the model has been compiled, Amazon SageMaker AI saves the
      # resulting model artifacts to an Amazon Simple Storage Service (Amazon S3) bucket that you specify.
      # If you choose to host your model using Amazon SageMaker AI hosting services, you can use the
      # resulting model artifacts as part of the model. You can also use the artifacts with Amazon Web
      # Services IoT Greengrass. In that case, deploy them as an ML resource. In the request body, you
      # provide the following: A name for the compilation job Information about the input model artifacts
      # The output location for the compiled model and the device (target) that the model runs on The Amazon
      # Resource Name (ARN) of the IAM role that Amazon SageMaker AI assumes to perform the model
      # compilation job. You can also provide a Tag to track the model compilation job's resource use and
      # costs. The response body contains the CompilationJobArn for the compiled job. To stop a model
      # compilation job, use StopCompilationJob . To get information about a particular model compilation
      # job, use DescribeCompilationJob . To get information about multiple model compilation jobs, use
      # ListCompilationJobs .
      def create_compilation_job(
        compilation_job_name : String,
        output_config : Types::OutputConfig,
        role_arn : String,
        stopping_condition : Types::StoppingCondition,
        input_config : Types::InputConfig? = nil,
        model_package_version_arn : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::NeoVpcConfig? = nil
      ) : Types::CreateCompilationJobResponse
        input = Types::CreateCompilationJobRequest.new(compilation_job_name: compilation_job_name, output_config: output_config, role_arn: role_arn, stopping_condition: stopping_condition, input_config: input_config, model_package_version_arn: model_package_version_arn, tags: tags, vpc_config: vpc_config)
        create_compilation_job(input)
      end
      def create_compilation_job(input : Types::CreateCompilationJobRequest) : Types::CreateCompilationJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPILATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCompilationJobResponse, "CreateCompilationJob")
      end

      # Create compute allocation definition. This defines how compute is allocated, shared, and borrowed
      # for specified entities. Specifically, how to lend and borrow idle compute and assign a fair-share
      # weight to the specified entities.
      def create_compute_quota(
        cluster_arn : String,
        compute_quota_config : Types::ComputeQuotaConfig,
        compute_quota_target : Types::ComputeQuotaTarget,
        name : String,
        activation_state : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateComputeQuotaResponse
        input = Types::CreateComputeQuotaRequest.new(cluster_arn: cluster_arn, compute_quota_config: compute_quota_config, compute_quota_target: compute_quota_target, name: name, activation_state: activation_state, description: description, tags: tags)
        create_compute_quota(input)
      end
      def create_compute_quota(input : Types::CreateComputeQuotaRequest) : Types::CreateComputeQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPUTE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateComputeQuotaResponse, "CreateComputeQuota")
      end

      # Creates a context . A context is a lineage tracking entity that represents a logical grouping of
      # other tracking or experiment entities. Some examples are an endpoint and a model package. For more
      # information, see Amazon SageMaker ML Lineage Tracking .
      def create_context(
        context_name : String,
        context_type : String,
        source : Types::ContextSource,
        description : String? = nil,
        properties : Hash(String, String)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateContextResponse
        input = Types::CreateContextRequest.new(context_name: context_name, context_type: context_type, source: source, description: description, properties: properties, tags: tags)
        create_context(input)
      end
      def create_context(input : Types::CreateContextRequest) : Types::CreateContextResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateContextResponse, "CreateContext")
      end

      # Creates a definition for a job that monitors data quality and drift. For information about model
      # monitor, see Amazon SageMaker AI Model Monitor .
      def create_data_quality_job_definition(
        data_quality_app_specification : Types::DataQualityAppSpecification,
        data_quality_job_input : Types::DataQualityJobInput,
        data_quality_job_output_config : Types::MonitoringOutputConfig,
        job_definition_name : String,
        job_resources : Types::MonitoringResources,
        role_arn : String,
        data_quality_baseline_config : Types::DataQualityBaselineConfig? = nil,
        network_config : Types::MonitoringNetworkConfig? = nil,
        stopping_condition : Types::MonitoringStoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateDataQualityJobDefinitionResponse
        input = Types::CreateDataQualityJobDefinitionRequest.new(data_quality_app_specification: data_quality_app_specification, data_quality_job_input: data_quality_job_input, data_quality_job_output_config: data_quality_job_output_config, job_definition_name: job_definition_name, job_resources: job_resources, role_arn: role_arn, data_quality_baseline_config: data_quality_baseline_config, network_config: network_config, stopping_condition: stopping_condition, tags: tags)
        create_data_quality_job_definition(input)
      end
      def create_data_quality_job_definition(input : Types::CreateDataQualityJobDefinitionRequest) : Types::CreateDataQualityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATA_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDataQualityJobDefinitionResponse, "CreateDataQualityJobDefinition")
      end

      # Creates a device fleet.
      def create_device_fleet(
        device_fleet_name : String,
        output_config : Types::EdgeOutputConfig,
        description : String? = nil,
        enable_iot_role_alias : Bool? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Nil
        input = Types::CreateDeviceFleetRequest.new(device_fleet_name: device_fleet_name, output_config: output_config, description: description, enable_iot_role_alias: enable_iot_role_alias, role_arn: role_arn, tags: tags)
        create_device_fleet(input)
      end
      def create_device_fleet(input : Types::CreateDeviceFleetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_DEVICE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a Domain . A domain consists of an associated Amazon Elastic File System volume, a list of
      # authorized users, and a variety of security, application, policy, and Amazon Virtual Private Cloud
      # (VPC) configurations. Users within a domain can share notebook files and other artifacts with each
      # other. EFS storage When a domain is created, an EFS volume is created for use by all of the users
      # within the domain. Each user receives a private home directory within the EFS volume for notebooks,
      # Git repositories, and data files. SageMaker AI uses the Amazon Web Services Key Management Service
      # (Amazon Web Services KMS) to encrypt the EFS volume attached to the domain with an Amazon Web
      # Services managed key by default. For more control, you can specify a customer managed key. For more
      # information, see Protect Data at Rest Using Encryption . VPC configuration All traffic between the
      # domain and the Amazon EFS volume is through the specified VPC and subnets. For other traffic, you
      # can specify the AppNetworkAccessType parameter. AppNetworkAccessType corresponds to the network
      # access type that you choose when you onboard to the domain. The following options are available:
      # PublicInternetOnly - Non-EFS traffic goes through a VPC managed by Amazon SageMaker AI, which allows
      # internet access. This is the default value. VpcOnly - All traffic is through the specified VPC and
      # subnets. Internet access is disabled by default. To allow internet access, you must specify a NAT
      # gateway. When internet access is disabled, you won't be able to run a Amazon SageMaker AI Studio
      # notebook or to train or host models unless your VPC has an interface endpoint to the SageMaker AI
      # API and runtime or a NAT gateway and your security groups allow outbound connections. NFS traffic
      # over TCP on port 2049 needs to be allowed in both inbound and outbound rules in order to launch a
      # Amazon SageMaker AI Studio app successfully. For more information, see Connect Amazon SageMaker AI
      # Studio Notebooks to Resources in a VPC .
      def create_domain(
        auth_mode : String,
        default_user_settings : Types::UserSettings,
        domain_name : String,
        app_network_access_type : String? = nil,
        app_security_group_management : String? = nil,
        default_space_settings : Types::DefaultSpaceSettings? = nil,
        domain_settings : Types::DomainSettings? = nil,
        home_efs_file_system_kms_key_id : String? = nil,
        kms_key_id : String? = nil,
        subnet_ids : Array(String)? = nil,
        tag_propagation : String? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_id : String? = nil
      ) : Types::CreateDomainResponse
        input = Types::CreateDomainRequest.new(auth_mode: auth_mode, default_user_settings: default_user_settings, domain_name: domain_name, app_network_access_type: app_network_access_type, app_security_group_management: app_security_group_management, default_space_settings: default_space_settings, domain_settings: domain_settings, home_efs_file_system_kms_key_id: home_efs_file_system_kms_key_id, kms_key_id: kms_key_id, subnet_ids: subnet_ids, tag_propagation: tag_propagation, tags: tags, vpc_id: vpc_id)
        create_domain(input)
      end
      def create_domain(input : Types::CreateDomainRequest) : Types::CreateDomainResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDomainResponse, "CreateDomain")
      end

      # Creates an edge deployment plan, consisting of multiple stages. Each stage may have a different
      # deployment configuration and devices.
      def create_edge_deployment_plan(
        device_fleet_name : String,
        edge_deployment_plan_name : String,
        model_configs : Array(Types::EdgeDeploymentModelConfig),
        stages : Array(Types::DeploymentStage)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEdgeDeploymentPlanResponse
        input = Types::CreateEdgeDeploymentPlanRequest.new(device_fleet_name: device_fleet_name, edge_deployment_plan_name: edge_deployment_plan_name, model_configs: model_configs, stages: stages, tags: tags)
        create_edge_deployment_plan(input)
      end
      def create_edge_deployment_plan(input : Types::CreateEdgeDeploymentPlanRequest) : Types::CreateEdgeDeploymentPlanResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EDGE_DEPLOYMENT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEdgeDeploymentPlanResponse, "CreateEdgeDeploymentPlan")
      end

      # Creates a new stage in an existing edge deployment plan.
      def create_edge_deployment_stage(
        edge_deployment_plan_name : String,
        stages : Array(Types::DeploymentStage)
      ) : Nil
        input = Types::CreateEdgeDeploymentStageRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, stages: stages)
        create_edge_deployment_stage(input)
      end
      def create_edge_deployment_stage(input : Types::CreateEdgeDeploymentStageRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_EDGE_DEPLOYMENT_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts a SageMaker Edge Manager model packaging job. Edge Manager will use the model artifacts from
      # the Amazon Simple Storage Service bucket that you specify. After the model has been packaged, Amazon
      # SageMaker saves the resulting artifacts to an S3 bucket that you specify.
      def create_edge_packaging_job(
        compilation_job_name : String,
        edge_packaging_job_name : String,
        model_name : String,
        model_version : String,
        output_config : Types::EdgeOutputConfig,
        role_arn : String,
        resource_key : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Nil
        input = Types::CreateEdgePackagingJobRequest.new(compilation_job_name: compilation_job_name, edge_packaging_job_name: edge_packaging_job_name, model_name: model_name, model_version: model_version, output_config: output_config, role_arn: role_arn, resource_key: resource_key, tags: tags)
        create_edge_packaging_job(input)
      end
      def create_edge_packaging_job(input : Types::CreateEdgePackagingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_EDGE_PACKAGING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an endpoint using the endpoint configuration specified in the request. SageMaker uses the
      # endpoint to provision resources and deploy models. You create the endpoint configuration with the
      # CreateEndpointConfig API. Use this API to deploy models using SageMaker hosting services. You must
      # not delete an EndpointConfig that is in use by an endpoint that is live or while the UpdateEndpoint
      # or CreateEndpoint operations are being performed on the endpoint. To update an endpoint, you must
      # create a new EndpointConfig . The endpoint name must be unique within an Amazon Web Services Region
      # in your Amazon Web Services account. When it receives the request, SageMaker creates the endpoint,
      # launches the resources (ML compute instances), and deploys the model(s) on them. When you call
      # CreateEndpoint , a load call is made to DynamoDB to verify that your endpoint configuration exists.
      # When you read data from a DynamoDB table supporting Eventually Consistent Reads , the response might
      # not reflect the results of a recently completed write operation. The response might include some
      # stale data. If the dependent entities are not yet in DynamoDB, this causes a validation error. If
      # you repeat your read request after a short time, the response should return the latest data. So
      # retry logic is recommended to handle these possible issues. We also recommend that customers call
      # DescribeEndpointConfig before calling CreateEndpoint to minimize the potential impact of a DynamoDB
      # eventually consistent read. When SageMaker receives the request, it sets the endpoint status to
      # Creating . After it creates the endpoint, it sets the status to InService . SageMaker can then
      # process incoming requests for inferences. To check the status of an endpoint, use the
      # DescribeEndpoint API. If any of the models hosted at this endpoint get model data from an Amazon S3
      # location, SageMaker uses Amazon Web Services Security Token Service to download model artifacts from
      # the S3 path you provided. Amazon Web Services STS is activated in your Amazon Web Services account
      # by default. If you previously deactivated Amazon Web Services STS for a region, you need to
      # reactivate Amazon Web Services STS for that region. For more information, see Activating and
      # Deactivating Amazon Web Services STS in an Amazon Web Services Region in the Amazon Web Services
      # Identity and Access Management User Guide . To add the IAM role policies for using this API
      # operation, go to the IAM console , and choose Roles in the left navigation pane. Search the IAM role
      # that you want to grant access to use the CreateEndpoint and CreateEndpointConfig API operations, add
      # the following policies to the role. Option 1: For a full SageMaker access, search and attach the
      # AmazonSageMakerFullAccess policy. Option 2: For granting a limited access to an IAM role, paste the
      # following Action elements manually into the JSON file of the IAM role: "Action":
      # ["sagemaker:CreateEndpoint", "sagemaker:CreateEndpointConfig"] "Resource": [
      # "arn:aws:sagemaker:region:account-id:endpoint/endpointName"
      # "arn:aws:sagemaker:region:account-id:endpoint-config/endpointConfigName" ] For more information, see
      # SageMaker API Permissions: Actions, Permissions, and Resources Reference .
      def create_endpoint(
        endpoint_config_name : String,
        endpoint_name : String,
        deployment_config : Types::DeploymentConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateEndpointOutput
        input = Types::CreateEndpointInput.new(endpoint_config_name: endpoint_config_name, endpoint_name: endpoint_name, deployment_config: deployment_config, tags: tags)
        create_endpoint(input)
      end
      def create_endpoint(input : Types::CreateEndpointInput) : Types::CreateEndpointOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointOutput, "CreateEndpoint")
      end

      # Creates an endpoint configuration that SageMaker hosting services uses to deploy models. In the
      # configuration, you identify one or more models, created using the CreateModel API, to deploy and the
      # resources that you want SageMaker to provision. Then you call the CreateEndpoint API. Use this API
      # if you want to use SageMaker hosting services to deploy models into production. In the request, you
      # define a ProductionVariant , for each model that you want to deploy. Each ProductionVariant
      # parameter also describes the resources that you want SageMaker to provision. This includes the
      # number and type of ML compute instances to deploy. If you are hosting multiple models, you also
      # assign a VariantWeight to specify how much traffic you want to allocate to each model. For example,
      # suppose that you want to host two models, A and B, and you assign traffic weight 2 for model A and 1
      # for model B. SageMaker distributes two-thirds of the traffic to Model A, and one-third to model B.
      # When you call CreateEndpoint , a load call is made to DynamoDB to verify that your endpoint
      # configuration exists. When you read data from a DynamoDB table supporting Eventually Consistent
      # Reads , the response might not reflect the results of a recently completed write operation. The
      # response might include some stale data. If the dependent entities are not yet in DynamoDB, this
      # causes a validation error. If you repeat your read request after a short time, the response should
      # return the latest data. So retry logic is recommended to handle these possible issues. We also
      # recommend that customers call DescribeEndpointConfig before calling CreateEndpoint to minimize the
      # potential impact of a DynamoDB eventually consistent read.
      def create_endpoint_config(
        endpoint_config_name : String,
        production_variants : Array(Types::ProductionVariant),
        async_inference_config : Types::AsyncInferenceConfig? = nil,
        data_capture_config : Types::DataCaptureConfig? = nil,
        enable_network_isolation : Bool? = nil,
        execution_role_arn : String? = nil,
        explainer_config : Types::ExplainerConfig? = nil,
        kms_key_id : String? = nil,
        metrics_config : Types::MetricsConfig? = nil,
        shadow_production_variants : Array(Types::ProductionVariant)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateEndpointConfigOutput
        input = Types::CreateEndpointConfigInput.new(endpoint_config_name: endpoint_config_name, production_variants: production_variants, async_inference_config: async_inference_config, data_capture_config: data_capture_config, enable_network_isolation: enable_network_isolation, execution_role_arn: execution_role_arn, explainer_config: explainer_config, kms_key_id: kms_key_id, metrics_config: metrics_config, shadow_production_variants: shadow_production_variants, tags: tags, vpc_config: vpc_config)
        create_endpoint_config(input)
      end
      def create_endpoint_config(input : Types::CreateEndpointConfigInput) : Types::CreateEndpointConfigOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_ENDPOINT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateEndpointConfigOutput, "CreateEndpointConfig")
      end

      # Creates a SageMaker experiment . An experiment is a collection of trials that are observed, compared
      # and evaluated as a group. A trial is a set of steps, called trial components , that produce a
      # machine learning model. In the Studio UI, trials are referred to as run groups and trial components
      # are referred to as runs . The goal of an experiment is to determine the components that produce the
      # best model. Multiple trials are performed, each one isolating and measuring the impact of a change
      # to one or more inputs, while keeping the remaining inputs constant. When you use SageMaker Studio or
      # the SageMaker Python SDK, all experiments, trials, and trial components are automatically tracked,
      # logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must use the
      # logging APIs provided by the SDK. You can add tags to experiments, trials, trial components and then
      # use the Search API to search for the tags. To add a description to an experiment, specify the
      # optional Description parameter. To add a description later, or to change the description, call the
      # UpdateExperiment API. To get a list of all your experiments, call the ListExperiments API. To view
      # an experiment's properties, call the DescribeExperiment API. To get a list of all the trials
      # associated with an experiment, call the ListTrials API. To create a trial call the CreateTrial API.
      def create_experiment(
        experiment_name : String,
        description : String? = nil,
        display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateExperimentResponse
        input = Types::CreateExperimentRequest.new(experiment_name: experiment_name, description: description, display_name: display_name, tags: tags)
        create_experiment(input)
      end
      def create_experiment(input : Types::CreateExperimentRequest) : Types::CreateExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateExperimentResponse, "CreateExperiment")
      end

      # Create a new FeatureGroup . A FeatureGroup is a group of Features defined in the FeatureStore to
      # describe a Record . The FeatureGroup defines the schema and features contained in the FeatureGroup .
      # A FeatureGroup definition is composed of a list of Features , a RecordIdentifierFeatureName , an
      # EventTimeFeatureName and configurations for its OnlineStore and OfflineStore . Check Amazon Web
      # Services service quotas to see the FeatureGroup s quota for your Amazon Web Services account. Note
      # that it can take approximately 10-15 minutes to provision an OnlineStore FeatureGroup with the
      # InMemory StorageType . You must include at least one of OnlineStoreConfig and OfflineStoreConfig to
      # create a FeatureGroup .
      def create_feature_group(
        event_time_feature_name : String,
        feature_definitions : Array(Types::FeatureDefinition),
        feature_group_name : String,
        record_identifier_feature_name : String,
        description : String? = nil,
        offline_store_config : Types::OfflineStoreConfig? = nil,
        online_store_config : Types::OnlineStoreConfig? = nil,
        role_arn : String? = nil,
        tags : Array(Types::Tag)? = nil,
        throughput_config : Types::ThroughputConfig? = nil
      ) : Types::CreateFeatureGroupResponse
        input = Types::CreateFeatureGroupRequest.new(event_time_feature_name: event_time_feature_name, feature_definitions: feature_definitions, feature_group_name: feature_group_name, record_identifier_feature_name: record_identifier_feature_name, description: description, offline_store_config: offline_store_config, online_store_config: online_store_config, role_arn: role_arn, tags: tags, throughput_config: throughput_config)
        create_feature_group(input)
      end
      def create_feature_group(input : Types::CreateFeatureGroupRequest) : Types::CreateFeatureGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FEATURE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFeatureGroupResponse, "CreateFeatureGroup")
      end

      # Creates a flow definition.
      def create_flow_definition(
        flow_definition_name : String,
        output_config : Types::FlowDefinitionOutputConfig,
        role_arn : String,
        human_loop_activation_config : Types::HumanLoopActivationConfig? = nil,
        human_loop_config : Types::HumanLoopConfig? = nil,
        human_loop_request_source : Types::HumanLoopRequestSource? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateFlowDefinitionResponse
        input = Types::CreateFlowDefinitionRequest.new(flow_definition_name: flow_definition_name, output_config: output_config, role_arn: role_arn, human_loop_activation_config: human_loop_activation_config, human_loop_config: human_loop_config, human_loop_request_source: human_loop_request_source, tags: tags)
        create_flow_definition(input)
      end
      def create_flow_definition(input : Types::CreateFlowDefinitionRequest) : Types::CreateFlowDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLOW_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFlowDefinitionResponse, "CreateFlowDefinition")
      end

      # Create a hub.
      def create_hub(
        hub_description : String,
        hub_name : String,
        hub_display_name : String? = nil,
        hub_search_keywords : Array(String)? = nil,
        s3_storage_config : Types::HubS3StorageConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHubResponse
        input = Types::CreateHubRequest.new(hub_description: hub_description, hub_name: hub_name, hub_display_name: hub_display_name, hub_search_keywords: hub_search_keywords, s3_storage_config: s3_storage_config, tags: tags)
        create_hub(input)
      end
      def create_hub(input : Types::CreateHubRequest) : Types::CreateHubResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HUB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHubResponse, "CreateHub")
      end

      # Creates presigned URLs for accessing hub content artifacts. This operation generates time-limited,
      # secure URLs that allow direct download of model artifacts and associated files from Amazon SageMaker
      # hub content, including gated models that require end-user license agreement acceptance.
      def create_hub_content_presigned_urls(
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String,
        access_config : Types::PresignedUrlAccessConfig? = nil,
        hub_content_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::CreateHubContentPresignedUrlsResponse
        input = Types::CreateHubContentPresignedUrlsRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name, access_config: access_config, hub_content_version: hub_content_version, max_results: max_results, next_token: next_token)
        create_hub_content_presigned_urls(input)
      end
      def create_hub_content_presigned_urls(input : Types::CreateHubContentPresignedUrlsRequest) : Types::CreateHubContentPresignedUrlsResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HUB_CONTENT_PRESIGNED_URLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHubContentPresignedUrlsResponse, "CreateHubContentPresignedUrls")
      end

      # Create a hub content reference in order to add a model in the JumpStart public hub to a private hub.
      def create_hub_content_reference(
        hub_name : String,
        sage_maker_public_hub_content_arn : String,
        hub_content_name : String? = nil,
        min_version : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHubContentReferenceResponse
        input = Types::CreateHubContentReferenceRequest.new(hub_name: hub_name, sage_maker_public_hub_content_arn: sage_maker_public_hub_content_arn, hub_content_name: hub_content_name, min_version: min_version, tags: tags)
        create_hub_content_reference(input)
      end
      def create_hub_content_reference(input : Types::CreateHubContentReferenceRequest) : Types::CreateHubContentReferenceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HUB_CONTENT_REFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHubContentReferenceResponse, "CreateHubContentReference")
      end

      # Defines the settings you will use for the human review workflow user interface. Reviewers will see a
      # three-panel interface with an instruction area, the item to review, and an input area.
      def create_human_task_ui(
        human_task_ui_name : String,
        ui_template : Types::UiTemplate,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateHumanTaskUiResponse
        input = Types::CreateHumanTaskUiRequest.new(human_task_ui_name: human_task_ui_name, ui_template: ui_template, tags: tags)
        create_human_task_ui(input)
      end
      def create_human_task_ui(input : Types::CreateHumanTaskUiRequest) : Types::CreateHumanTaskUiResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HUMAN_TASK_UI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHumanTaskUiResponse, "CreateHumanTaskUi")
      end

      # Starts a hyperparameter tuning job. A hyperparameter tuning job finds the best version of a model by
      # running many training jobs on your dataset using the algorithm you choose and values for
      # hyperparameters within ranges that you specify. It then chooses the hyperparameter values that
      # result in a model that performs the best, as measured by an objective metric that you choose. A
      # hyperparameter tuning job automatically creates Amazon SageMaker experiments, trials, and trial
      # components for each training job that it runs. You can view these entities in Amazon SageMaker
      # Studio. For more information, see View Experiments, Trials, and Trial Components . Do not include
      # any security-sensitive information including account access IDs, secrets, or tokens in any
      # hyperparameter fields. As part of the shared responsibility model, you are responsible for any
      # potential exposure, unauthorized access, or compromise of your sensitive data if caused by any
      # security-sensitive information included in the request hyperparameter variable or plain text
      # fields..
      def create_hyper_parameter_tuning_job(
        hyper_parameter_tuning_job_config : Types::HyperParameterTuningJobConfig,
        hyper_parameter_tuning_job_name : String,
        autotune : Types::Autotune? = nil,
        tags : Array(Types::Tag)? = nil,
        training_job_definition : Types::HyperParameterTrainingJobDefinition? = nil,
        training_job_definitions : Array(Types::HyperParameterTrainingJobDefinition)? = nil,
        warm_start_config : Types::HyperParameterTuningJobWarmStartConfig? = nil
      ) : Types::CreateHyperParameterTuningJobResponse
        input = Types::CreateHyperParameterTuningJobRequest.new(hyper_parameter_tuning_job_config: hyper_parameter_tuning_job_config, hyper_parameter_tuning_job_name: hyper_parameter_tuning_job_name, autotune: autotune, tags: tags, training_job_definition: training_job_definition, training_job_definitions: training_job_definitions, warm_start_config: warm_start_config)
        create_hyper_parameter_tuning_job(input)
      end
      def create_hyper_parameter_tuning_job(input : Types::CreateHyperParameterTuningJobRequest) : Types::CreateHyperParameterTuningJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HYPER_PARAMETER_TUNING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHyperParameterTuningJobResponse, "CreateHyperParameterTuningJob")
      end

      # Creates a custom SageMaker AI image. A SageMaker AI image is a set of image versions. Each image
      # version represents a container image stored in Amazon ECR. For more information, see Bring your own
      # SageMaker AI image .
      def create_image(
        image_name : String,
        role_arn : String,
        description : String? = nil,
        display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateImageResponse
        input = Types::CreateImageRequest.new(image_name: image_name, role_arn: role_arn, description: description, display_name: display_name, tags: tags)
        create_image(input)
      end
      def create_image(input : Types::CreateImageRequest) : Types::CreateImageResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImageResponse, "CreateImage")
      end

      # Creates a version of the SageMaker AI image specified by ImageName . The version represents the
      # Amazon ECR container image specified by BaseImage .
      def create_image_version(
        base_image : String,
        client_token : String,
        image_name : String,
        aliases : Array(String)? = nil,
        horovod : Bool? = nil,
        job_type : String? = nil,
        ml_framework : String? = nil,
        processor : String? = nil,
        programming_lang : String? = nil,
        release_notes : String? = nil,
        vendor_guidance : String? = nil
      ) : Types::CreateImageVersionResponse
        input = Types::CreateImageVersionRequest.new(base_image: base_image, client_token: client_token, image_name: image_name, aliases: aliases, horovod: horovod, job_type: job_type, ml_framework: ml_framework, processor: processor, programming_lang: programming_lang, release_notes: release_notes, vendor_guidance: vendor_guidance)
        create_image_version(input)
      end
      def create_image_version(input : Types::CreateImageVersionRequest) : Types::CreateImageVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_IMAGE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateImageVersionResponse, "CreateImageVersion")
      end

      # Creates an inference component, which is a SageMaker AI hosting object that you can use to deploy a
      # model to an endpoint. In the inference component settings, you specify the model, the endpoint, and
      # how the model utilizes the resources that the endpoint hosts. You can optimize resource utilization
      # by tailoring how the required CPU cores, accelerators, and memory are allocated. You can deploy
      # multiple inference components to an endpoint, where each inference component contains one model and
      # the resource utilization needs for that individual model. After you deploy an inference component,
      # you can directly invoke the associated model when you use the InvokeEndpoint API action.
      def create_inference_component(
        endpoint_name : String,
        inference_component_name : String,
        specification : Types::InferenceComponentSpecification,
        runtime_config : Types::InferenceComponentRuntimeConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        variant_name : String? = nil
      ) : Types::CreateInferenceComponentOutput
        input = Types::CreateInferenceComponentInput.new(endpoint_name: endpoint_name, inference_component_name: inference_component_name, specification: specification, runtime_config: runtime_config, tags: tags, variant_name: variant_name)
        create_inference_component(input)
      end
      def create_inference_component(input : Types::CreateInferenceComponentInput) : Types::CreateInferenceComponentOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_INFERENCE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInferenceComponentOutput, "CreateInferenceComponent")
      end

      # Creates an inference experiment using the configurations specified in the request. Use this API to
      # setup and schedule an experiment to compare model variants on a Amazon SageMaker inference endpoint.
      # For more information about inference experiments, see Shadow tests . Amazon SageMaker begins your
      # experiment at the scheduled time and routes traffic to your endpoint's model variants based on your
      # specified configuration. While the experiment is in progress or after it has concluded, you can view
      # metrics that compare your model variants. For more information, see View, monitor, and edit shadow
      # tests .
      def create_inference_experiment(
        endpoint_name : String,
        model_variants : Array(Types::ModelVariantConfig),
        name : String,
        role_arn : String,
        shadow_mode_config : Types::ShadowModeConfig,
        type : String,
        data_storage_config : Types::InferenceExperimentDataStorageConfig? = nil,
        description : String? = nil,
        kms_key : String? = nil,
        schedule : Types::InferenceExperimentSchedule? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInferenceExperimentResponse
        input = Types::CreateInferenceExperimentRequest.new(endpoint_name: endpoint_name, model_variants: model_variants, name: name, role_arn: role_arn, shadow_mode_config: shadow_mode_config, type: type, data_storage_config: data_storage_config, description: description, kms_key: kms_key, schedule: schedule, tags: tags)
        create_inference_experiment(input)
      end
      def create_inference_experiment(input : Types::CreateInferenceExperimentRequest) : Types::CreateInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInferenceExperimentResponse, "CreateInferenceExperiment")
      end

      # Starts a recommendation job. You can create either an instance recommendation or load test job.
      def create_inference_recommendations_job(
        input_config : Types::RecommendationJobInputConfig,
        job_name : String,
        job_type : String,
        role_arn : String,
        job_description : String? = nil,
        output_config : Types::RecommendationJobOutputConfig? = nil,
        stopping_conditions : Types::RecommendationJobStoppingConditions? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateInferenceRecommendationsJobResponse
        input = Types::CreateInferenceRecommendationsJobRequest.new(input_config: input_config, job_name: job_name, job_type: job_type, role_arn: role_arn, job_description: job_description, output_config: output_config, stopping_conditions: stopping_conditions, tags: tags)
        create_inference_recommendations_job(input)
      end
      def create_inference_recommendations_job(input : Types::CreateInferenceRecommendationsJobRequest) : Types::CreateInferenceRecommendationsJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INFERENCE_RECOMMENDATIONS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateInferenceRecommendationsJobResponse, "CreateInferenceRecommendationsJob")
      end

      # Creates a job that uses workers to label the data objects in your input dataset. You can use the
      # labeled data to train machine learning models. You can select your workforce from one of three
      # providers: A private workforce that you create. It can include employees, contractors, and outside
      # experts. Use a private workforce when want the data to stay within your organization or when a
      # specific set of skills is required. One or more vendors that you select from the Amazon Web Services
      # Marketplace. Vendors provide expertise in specific areas. The Amazon Mechanical Turk workforce. This
      # is the largest workforce, but it should only be used for public data or data that has been stripped
      # of any personally identifiable information. You can also use automated data labeling to reduce the
      # number of data objects that need to be labeled by a human. Automated data labeling uses active
      # learning to determine if a data object can be labeled by machine or if it needs to be sent to a
      # human worker. For more information, see Using Automated Data Labeling . The data objects to be
      # labeled are contained in an Amazon S3 bucket. You create a manifest file that describes the location
      # of each object. For more information, see Using Input and Output Data . The output can be used as
      # the manifest file for another labeling job or as training data for your machine learning models. You
      # can use this operation to create a static labeling job or a streaming labeling job. A static
      # labeling job stops if all data objects in the input manifest file identified in ManifestS3Uri have
      # been labeled. A streaming labeling job runs perpetually until it is manually stopped, or remains
      # idle for 10 days. You can send new data objects to an active ( InProgress ) streaming labeling job
      # in real time. To learn how to create a static labeling job, see Create a Labeling Job (API) in the
      # Amazon SageMaker Developer Guide. To learn how to create a streaming labeling job, see Create a
      # Streaming Labeling Job .
      def create_labeling_job(
        human_task_config : Types::HumanTaskConfig,
        input_config : Types::LabelingJobInputConfig,
        label_attribute_name : String,
        labeling_job_name : String,
        output_config : Types::LabelingJobOutputConfig,
        role_arn : String,
        label_category_config_s3_uri : String? = nil,
        labeling_job_algorithms_config : Types::LabelingJobAlgorithmsConfig? = nil,
        stopping_conditions : Types::LabelingJobStoppingConditions? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateLabelingJobResponse
        input = Types::CreateLabelingJobRequest.new(human_task_config: human_task_config, input_config: input_config, label_attribute_name: label_attribute_name, labeling_job_name: labeling_job_name, output_config: output_config, role_arn: role_arn, label_category_config_s3_uri: label_category_config_s3_uri, labeling_job_algorithms_config: labeling_job_algorithms_config, stopping_conditions: stopping_conditions, tags: tags)
        create_labeling_job(input)
      end
      def create_labeling_job(input : Types::CreateLabelingJobRequest) : Types::CreateLabelingJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LABELING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLabelingJobResponse, "CreateLabelingJob")
      end

      # Creates an MLflow Tracking Server using a general purpose Amazon S3 bucket as the artifact store.
      def create_mlflow_app(
        artifact_store_uri : String,
        name : String,
        role_arn : String,
        account_default_status : String? = nil,
        default_domain_id_list : Array(String)? = nil,
        model_registration_mode : String? = nil,
        tags : Array(Types::Tag)? = nil,
        weekly_maintenance_window_start : String? = nil
      ) : Types::CreateMlflowAppResponse
        input = Types::CreateMlflowAppRequest.new(artifact_store_uri: artifact_store_uri, name: name, role_arn: role_arn, account_default_status: account_default_status, default_domain_id_list: default_domain_id_list, model_registration_mode: model_registration_mode, tags: tags, weekly_maintenance_window_start: weekly_maintenance_window_start)
        create_mlflow_app(input)
      end
      def create_mlflow_app(input : Types::CreateMlflowAppRequest) : Types::CreateMlflowAppResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MLFLOW_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMlflowAppResponse, "CreateMlflowApp")
      end

      # Creates an MLflow Tracking Server using a general purpose Amazon S3 bucket as the artifact store.
      # For more information, see Create an MLflow Tracking Server .
      def create_mlflow_tracking_server(
        artifact_store_uri : String,
        role_arn : String,
        tracking_server_name : String,
        automatic_model_registration : Bool? = nil,
        mlflow_version : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tracking_server_size : String? = nil,
        weekly_maintenance_window_start : String? = nil
      ) : Types::CreateMlflowTrackingServerResponse
        input = Types::CreateMlflowTrackingServerRequest.new(artifact_store_uri: artifact_store_uri, role_arn: role_arn, tracking_server_name: tracking_server_name, automatic_model_registration: automatic_model_registration, mlflow_version: mlflow_version, tags: tags, tracking_server_size: tracking_server_size, weekly_maintenance_window_start: weekly_maintenance_window_start)
        create_mlflow_tracking_server(input)
      end
      def create_mlflow_tracking_server(input : Types::CreateMlflowTrackingServerRequest) : Types::CreateMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMlflowTrackingServerResponse, "CreateMlflowTrackingServer")
      end

      # Creates a model in SageMaker. In the request, you name the model and describe a primary container.
      # For the primary container, you specify the Docker image that contains inference code, artifacts
      # (from prior training), and a custom environment map that the inference code uses when you deploy the
      # model for predictions. Use this API to create a model if you want to use SageMaker hosting services
      # or run a batch transform job. To host your model, you create an endpoint configuration with the
      # CreateEndpointConfig API, and then create an endpoint with the CreateEndpoint API. SageMaker then
      # deploys all of the containers that you defined for the model in the hosting environment. To run a
      # batch transform using your model, you start a job with the CreateTransformJob API. SageMaker uses
      # your model and your dataset to get inferences which are then saved to a specified S3 location. In
      # the request, you also provide an IAM role that SageMaker can assume to access model artifacts and
      # docker image for deployment on ML compute hosting instances or for batch transform jobs. In
      # addition, you also use the IAM role to manage permissions the inference code needs. For example, if
      # the inference code access any other Amazon Web Services resources, you grant necessary permissions
      # via this role.
      def create_model(
        model_name : String,
        containers : Array(Types::ContainerDefinition)? = nil,
        enable_network_isolation : Bool? = nil,
        execution_role_arn : String? = nil,
        inference_execution_config : Types::InferenceExecutionConfig? = nil,
        primary_container : Types::ContainerDefinition? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateModelOutput
        input = Types::CreateModelInput.new(model_name: model_name, containers: containers, enable_network_isolation: enable_network_isolation, execution_role_arn: execution_role_arn, inference_execution_config: inference_execution_config, primary_container: primary_container, tags: tags, vpc_config: vpc_config)
        create_model(input)
      end
      def create_model(input : Types::CreateModelInput) : Types::CreateModelOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelOutput, "CreateModel")
      end

      # Creates the definition for a model bias job.
      def create_model_bias_job_definition(
        job_definition_name : String,
        job_resources : Types::MonitoringResources,
        model_bias_app_specification : Types::ModelBiasAppSpecification,
        model_bias_job_input : Types::ModelBiasJobInput,
        model_bias_job_output_config : Types::MonitoringOutputConfig,
        role_arn : String,
        model_bias_baseline_config : Types::ModelBiasBaselineConfig? = nil,
        network_config : Types::MonitoringNetworkConfig? = nil,
        stopping_condition : Types::MonitoringStoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelBiasJobDefinitionResponse
        input = Types::CreateModelBiasJobDefinitionRequest.new(job_definition_name: job_definition_name, job_resources: job_resources, model_bias_app_specification: model_bias_app_specification, model_bias_job_input: model_bias_job_input, model_bias_job_output_config: model_bias_job_output_config, role_arn: role_arn, model_bias_baseline_config: model_bias_baseline_config, network_config: network_config, stopping_condition: stopping_condition, tags: tags)
        create_model_bias_job_definition(input)
      end
      def create_model_bias_job_definition(input : Types::CreateModelBiasJobDefinitionRequest) : Types::CreateModelBiasJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_BIAS_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelBiasJobDefinitionResponse, "CreateModelBiasJobDefinition")
      end

      # Creates an Amazon SageMaker Model Card. For information about how to use model cards, see Amazon
      # SageMaker Model Card .
      def create_model_card(
        content : String,
        model_card_name : String,
        model_card_status : String,
        security_config : Types::ModelCardSecurityConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelCardResponse
        input = Types::CreateModelCardRequest.new(content: content, model_card_name: model_card_name, model_card_status: model_card_status, security_config: security_config, tags: tags)
        create_model_card(input)
      end
      def create_model_card(input : Types::CreateModelCardRequest) : Types::CreateModelCardResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_CARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelCardResponse, "CreateModelCard")
      end

      # Creates an Amazon SageMaker Model Card export job.
      def create_model_card_export_job(
        model_card_export_job_name : String,
        model_card_name : String,
        output_config : Types::ModelCardExportOutputConfig,
        model_card_version : Int32? = nil
      ) : Types::CreateModelCardExportJobResponse
        input = Types::CreateModelCardExportJobRequest.new(model_card_export_job_name: model_card_export_job_name, model_card_name: model_card_name, output_config: output_config, model_card_version: model_card_version)
        create_model_card_export_job(input)
      end
      def create_model_card_export_job(input : Types::CreateModelCardExportJobRequest) : Types::CreateModelCardExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_CARD_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelCardExportJobResponse, "CreateModelCardExportJob")
      end

      # Creates the definition for a model explainability job.
      def create_model_explainability_job_definition(
        job_definition_name : String,
        job_resources : Types::MonitoringResources,
        model_explainability_app_specification : Types::ModelExplainabilityAppSpecification,
        model_explainability_job_input : Types::ModelExplainabilityJobInput,
        model_explainability_job_output_config : Types::MonitoringOutputConfig,
        role_arn : String,
        model_explainability_baseline_config : Types::ModelExplainabilityBaselineConfig? = nil,
        network_config : Types::MonitoringNetworkConfig? = nil,
        stopping_condition : Types::MonitoringStoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelExplainabilityJobDefinitionResponse
        input = Types::CreateModelExplainabilityJobDefinitionRequest.new(job_definition_name: job_definition_name, job_resources: job_resources, model_explainability_app_specification: model_explainability_app_specification, model_explainability_job_input: model_explainability_job_input, model_explainability_job_output_config: model_explainability_job_output_config, role_arn: role_arn, model_explainability_baseline_config: model_explainability_baseline_config, network_config: network_config, stopping_condition: stopping_condition, tags: tags)
        create_model_explainability_job_definition(input)
      end
      def create_model_explainability_job_definition(input : Types::CreateModelExplainabilityJobDefinitionRequest) : Types::CreateModelExplainabilityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_EXPLAINABILITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelExplainabilityJobDefinitionResponse, "CreateModelExplainabilityJobDefinition")
      end

      # Creates a model package that you can use to create SageMaker models or list on Amazon Web Services
      # Marketplace, or a versioned model that is part of a model group. Buyers can subscribe to model
      # packages listed on Amazon Web Services Marketplace to create models in SageMaker. To create a model
      # package by specifying a Docker container that contains your inference code and the Amazon S3
      # location of your model artifacts, provide values for InferenceSpecification . To create a model from
      # an algorithm resource that you created or subscribed to in Amazon Web Services Marketplace, provide
      # a value for SourceAlgorithmSpecification . There are two types of model packages: Versioned - a
      # model that is part of a model group in the model registry. Unversioned - a model package that is not
      # part of a model group.
      def create_model_package(
        additional_inference_specifications : Array(Types::AdditionalInferenceSpecificationDefinition)? = nil,
        certify_for_marketplace : Bool? = nil,
        client_token : String? = nil,
        customer_metadata_properties : Hash(String, String)? = nil,
        domain : String? = nil,
        drift_check_baselines : Types::DriftCheckBaselines? = nil,
        inference_specification : Types::InferenceSpecification? = nil,
        metadata_properties : Types::MetadataProperties? = nil,
        model_approval_status : String? = nil,
        model_card : Types::ModelPackageModelCard? = nil,
        model_life_cycle : Types::ModelLifeCycle? = nil,
        model_metrics : Types::ModelMetrics? = nil,
        model_package_description : String? = nil,
        model_package_group_name : String? = nil,
        model_package_name : String? = nil,
        model_package_registration_type : String? = nil,
        sample_payload_url : String? = nil,
        security_config : Types::ModelPackageSecurityConfig? = nil,
        skip_model_validation : String? = nil,
        source_algorithm_specification : Types::SourceAlgorithmSpecification? = nil,
        source_uri : String? = nil,
        tags : Array(Types::Tag)? = nil,
        task : String? = nil,
        validation_specification : Types::ModelPackageValidationSpecification? = nil
      ) : Types::CreateModelPackageOutput
        input = Types::CreateModelPackageInput.new(additional_inference_specifications: additional_inference_specifications, certify_for_marketplace: certify_for_marketplace, client_token: client_token, customer_metadata_properties: customer_metadata_properties, domain: domain, drift_check_baselines: drift_check_baselines, inference_specification: inference_specification, metadata_properties: metadata_properties, model_approval_status: model_approval_status, model_card: model_card, model_life_cycle: model_life_cycle, model_metrics: model_metrics, model_package_description: model_package_description, model_package_group_name: model_package_group_name, model_package_name: model_package_name, model_package_registration_type: model_package_registration_type, sample_payload_url: sample_payload_url, security_config: security_config, skip_model_validation: skip_model_validation, source_algorithm_specification: source_algorithm_specification, source_uri: source_uri, tags: tags, task: task, validation_specification: validation_specification)
        create_model_package(input)
      end
      def create_model_package(input : Types::CreateModelPackageInput) : Types::CreateModelPackageOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_PACKAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelPackageOutput, "CreateModelPackage")
      end

      # Creates a model group. A model group contains a group of model versions.
      def create_model_package_group(
        model_package_group_name : String,
        model_package_group_description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelPackageGroupOutput
        input = Types::CreateModelPackageGroupInput.new(model_package_group_name: model_package_group_name, model_package_group_description: model_package_group_description, tags: tags)
        create_model_package_group(input)
      end
      def create_model_package_group(input : Types::CreateModelPackageGroupInput) : Types::CreateModelPackageGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_PACKAGE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelPackageGroupOutput, "CreateModelPackageGroup")
      end

      # Creates a definition for a job that monitors model quality and drift. For information about model
      # monitor, see Amazon SageMaker AI Model Monitor .
      def create_model_quality_job_definition(
        job_definition_name : String,
        job_resources : Types::MonitoringResources,
        model_quality_app_specification : Types::ModelQualityAppSpecification,
        model_quality_job_input : Types::ModelQualityJobInput,
        model_quality_job_output_config : Types::MonitoringOutputConfig,
        role_arn : String,
        model_quality_baseline_config : Types::ModelQualityBaselineConfig? = nil,
        network_config : Types::MonitoringNetworkConfig? = nil,
        stopping_condition : Types::MonitoringStoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateModelQualityJobDefinitionResponse
        input = Types::CreateModelQualityJobDefinitionRequest.new(job_definition_name: job_definition_name, job_resources: job_resources, model_quality_app_specification: model_quality_app_specification, model_quality_job_input: model_quality_job_input, model_quality_job_output_config: model_quality_job_output_config, role_arn: role_arn, model_quality_baseline_config: model_quality_baseline_config, network_config: network_config, stopping_condition: stopping_condition, tags: tags)
        create_model_quality_job_definition(input)
      end
      def create_model_quality_job_definition(input : Types::CreateModelQualityJobDefinitionRequest) : Types::CreateModelQualityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MODEL_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateModelQualityJobDefinitionResponse, "CreateModelQualityJobDefinition")
      end

      # Creates a schedule that regularly starts Amazon SageMaker AI Processing Jobs to monitor the data
      # captured for an Amazon SageMaker AI Endpoint.
      def create_monitoring_schedule(
        monitoring_schedule_config : Types::MonitoringScheduleConfig,
        monitoring_schedule_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMonitoringScheduleResponse
        input = Types::CreateMonitoringScheduleRequest.new(monitoring_schedule_config: monitoring_schedule_config, monitoring_schedule_name: monitoring_schedule_name, tags: tags)
        create_monitoring_schedule(input)
      end
      def create_monitoring_schedule(input : Types::CreateMonitoringScheduleRequest) : Types::CreateMonitoringScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMonitoringScheduleResponse, "CreateMonitoringSchedule")
      end

      # Creates an SageMaker AI notebook instance. A notebook instance is a machine learning (ML) compute
      # instance running on a Jupyter notebook. In a CreateNotebookInstance request, specify the type of ML
      # compute instance that you want to run. SageMaker AI launches the instance, installs common libraries
      # that you can use to explore datasets for model training, and attaches an ML storage volume to the
      # notebook instance. SageMaker AI also provides a set of example notebooks. Each notebook demonstrates
      # how to use SageMaker AI with a specific algorithm or with a machine learning framework. After
      # receiving the request, SageMaker AI does the following: Creates a network interface in the SageMaker
      # AI VPC. (Option) If you specified SubnetId , SageMaker AI creates a network interface in your own
      # VPC, which is inferred from the subnet ID that you provide in the input. When creating this network
      # interface, SageMaker AI attaches the security group that you specified in the request to the network
      # interface that it creates in your VPC. Launches an EC2 instance of the type specified in the request
      # in the SageMaker AI VPC. If you specified SubnetId of your VPC, SageMaker AI specifies both network
      # interfaces when launching this instance. This enables inbound traffic from your own VPC to the
      # notebook instance, assuming that the security groups allow it. After creating the notebook instance,
      # SageMaker AI returns its Amazon Resource Name (ARN). You can't change the name of a notebook
      # instance after you create it. After SageMaker AI creates the notebook instance, you can connect to
      # the Jupyter server and work in Jupyter notebooks. For example, you can write code to explore a
      # dataset that you can use for model training, train a model, host models by creating SageMaker AI
      # endpoints, and validate hosted models. For more information, see How It Works .
      def create_notebook_instance(
        instance_type : String,
        notebook_instance_name : String,
        role_arn : String,
        accelerator_types : Array(String)? = nil,
        additional_code_repositories : Array(String)? = nil,
        default_code_repository : String? = nil,
        direct_internet_access : String? = nil,
        instance_metadata_service_configuration : Types::InstanceMetadataServiceConfiguration? = nil,
        ip_address_type : String? = nil,
        kms_key_id : String? = nil,
        lifecycle_config_name : String? = nil,
        platform_identifier : String? = nil,
        root_access : String? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        volume_size_in_gb : Int32? = nil
      ) : Types::CreateNotebookInstanceOutput
        input = Types::CreateNotebookInstanceInput.new(instance_type: instance_type, notebook_instance_name: notebook_instance_name, role_arn: role_arn, accelerator_types: accelerator_types, additional_code_repositories: additional_code_repositories, default_code_repository: default_code_repository, direct_internet_access: direct_internet_access, instance_metadata_service_configuration: instance_metadata_service_configuration, ip_address_type: ip_address_type, kms_key_id: kms_key_id, lifecycle_config_name: lifecycle_config_name, platform_identifier: platform_identifier, root_access: root_access, security_group_ids: security_group_ids, subnet_id: subnet_id, tags: tags, volume_size_in_gb: volume_size_in_gb)
        create_notebook_instance(input)
      end
      def create_notebook_instance(input : Types::CreateNotebookInstanceInput) : Types::CreateNotebookInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNotebookInstanceOutput, "CreateNotebookInstance")
      end

      # Creates a lifecycle configuration that you can associate with a notebook instance. A lifecycle
      # configuration is a collection of shell scripts that run when you create or start a notebook
      # instance. Each lifecycle configuration script has a limit of 16384 characters. The value of the
      # $PATH environment variable that is available to both scripts is /sbin:bin:/usr/sbin:/usr/bin . View
      # Amazon CloudWatch Logs for notebook instance lifecycle configurations in log group
      # /aws/sagemaker/NotebookInstances in log stream [notebook-instance-name]/[LifecycleConfigHook] .
      # Lifecycle configuration scripts cannot run for longer than 5 minutes. If a script runs for longer
      # than 5 minutes, it fails and the notebook instance is not created or started. For information about
      # notebook instance lifestyle configurations, see Step 2.1: (Optional) Customize a Notebook Instance .
      # Lifecycle configuration scripts execute with root access and the notebook instance's IAM execution
      # role privileges. Grant this permission only to trusted principals. See Customize a Notebook Instance
      # Using a Lifecycle Configuration Script for security best practices.
      def create_notebook_instance_lifecycle_config(
        notebook_instance_lifecycle_config_name : String,
        on_create : Array(Types::NotebookInstanceLifecycleHook)? = nil,
        on_start : Array(Types::NotebookInstanceLifecycleHook)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateNotebookInstanceLifecycleConfigOutput
        input = Types::CreateNotebookInstanceLifecycleConfigInput.new(notebook_instance_lifecycle_config_name: notebook_instance_lifecycle_config_name, on_create: on_create, on_start: on_start, tags: tags)
        create_notebook_instance_lifecycle_config(input)
      end
      def create_notebook_instance_lifecycle_config(input : Types::CreateNotebookInstanceLifecycleConfigInput) : Types::CreateNotebookInstanceLifecycleConfigOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateNotebookInstanceLifecycleConfigOutput, "CreateNotebookInstanceLifecycleConfig")
      end

      # Creates a job that optimizes a model for inference performance. To create the job, you provide the
      # location of a source model, and you provide the settings for the optimization techniques that you
      # want the job to apply. When the job completes successfully, SageMaker uploads the new optimized
      # model to the output destination that you specify. For more information about how to use this action,
      # and about the supported optimization techniques, see Optimize model inference with Amazon SageMaker
      # .
      def create_optimization_job(
        deployment_instance_type : String,
        model_source : Types::OptimizationJobModelSource,
        optimization_configs : Array(Types::OptimizationConfig),
        optimization_job_name : String,
        output_config : Types::OptimizationJobOutputConfig,
        role_arn : String,
        stopping_condition : Types::StoppingCondition,
        max_instance_count : Int32? = nil,
        optimization_environment : Hash(String, String)? = nil,
        tags : Array(Types::Tag)? = nil,
        vpc_config : Types::OptimizationVpcConfig? = nil
      ) : Types::CreateOptimizationJobResponse
        input = Types::CreateOptimizationJobRequest.new(deployment_instance_type: deployment_instance_type, model_source: model_source, optimization_configs: optimization_configs, optimization_job_name: optimization_job_name, output_config: output_config, role_arn: role_arn, stopping_condition: stopping_condition, max_instance_count: max_instance_count, optimization_environment: optimization_environment, tags: tags, vpc_config: vpc_config)
        create_optimization_job(input)
      end
      def create_optimization_job(input : Types::CreateOptimizationJobRequest) : Types::CreateOptimizationJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_OPTIMIZATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOptimizationJobResponse, "CreateOptimizationJob")
      end

      # Creates an Amazon SageMaker Partner AI App.
      def create_partner_app(
        auth_type : String,
        execution_role_arn : String,
        name : String,
        tier : String,
        type : String,
        application_config : Types::PartnerAppConfig? = nil,
        client_token : String? = nil,
        enable_auto_minor_version_upgrade : Bool? = nil,
        enable_iam_session_based_identity : Bool? = nil,
        kms_key_id : String? = nil,
        maintenance_config : Types::PartnerAppMaintenanceConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePartnerAppResponse
        input = Types::CreatePartnerAppRequest.new(auth_type: auth_type, execution_role_arn: execution_role_arn, name: name, tier: tier, type: type, application_config: application_config, client_token: client_token, enable_auto_minor_version_upgrade: enable_auto_minor_version_upgrade, enable_iam_session_based_identity: enable_iam_session_based_identity, kms_key_id: kms_key_id, maintenance_config: maintenance_config, tags: tags)
        create_partner_app(input)
      end
      def create_partner_app(input : Types::CreatePartnerAppRequest) : Types::CreatePartnerAppResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTNER_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartnerAppResponse, "CreatePartnerApp")
      end

      # Creates a presigned URL to access an Amazon SageMaker Partner AI App.
      def create_partner_app_presigned_url(
        arn : String,
        expires_in_seconds : Int32? = nil,
        session_expiration_duration_in_seconds : Int32? = nil
      ) : Types::CreatePartnerAppPresignedUrlResponse
        input = Types::CreatePartnerAppPresignedUrlRequest.new(arn: arn, expires_in_seconds: expires_in_seconds, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds)
        create_partner_app_presigned_url(input)
      end
      def create_partner_app_presigned_url(input : Types::CreatePartnerAppPresignedUrlRequest) : Types::CreatePartnerAppPresignedUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTNER_APP_PRESIGNED_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartnerAppPresignedUrlResponse, "CreatePartnerAppPresignedUrl")
      end

      # Creates a pipeline using a JSON pipeline definition.
      def create_pipeline(
        client_request_token : String,
        pipeline_name : String,
        role_arn : String,
        parallelism_configuration : Types::ParallelismConfiguration? = nil,
        pipeline_definition : String? = nil,
        pipeline_definition_s3_location : Types::PipelineDefinitionS3Location? = nil,
        pipeline_description : String? = nil,
        pipeline_display_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePipelineResponse
        input = Types::CreatePipelineRequest.new(client_request_token: client_request_token, pipeline_name: pipeline_name, role_arn: role_arn, parallelism_configuration: parallelism_configuration, pipeline_definition: pipeline_definition, pipeline_definition_s3_location: pipeline_definition_s3_location, pipeline_description: pipeline_description, pipeline_display_name: pipeline_display_name, tags: tags)
        create_pipeline(input)
      end
      def create_pipeline(input : Types::CreatePipelineRequest) : Types::CreatePipelineResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePipelineResponse, "CreatePipeline")
      end

      # Creates a URL for a specified UserProfile in a Domain. When accessed in a web browser, the user will
      # be automatically signed in to the domain, and granted access to all of the Apps and files associated
      # with the Domain's Amazon Elastic File System volume. This operation can only be called when the
      # authentication mode equals IAM. The IAM role or user passed to this API defines the permissions to
      # access the app. Once the presigned URL is created, no additional permission is required to access
      # this URL. IAM authorization policies for this API are also enforced for every HTTP request and
      # WebSocket frame that attempts to connect to the app. You can restrict access to this API and to the
      # URL that it returns to a list of IP addresses, Amazon VPCs or Amazon VPC Endpoints that you specify.
      # For more information, see Connect to Amazon SageMaker AI Studio Through an Interface VPC Endpoint .
      # The URL that you get from a call to CreatePresignedDomainUrl has a default timeout of 5 minutes. You
      # can configure this value using ExpiresInSeconds . If you try to use the URL after the timeout limit
      # expires, you are directed to the Amazon Web Services console sign-in page. The JupyterLab session
      # default expiration time is 12 hours. You can configure this value using
      # SessionExpirationDurationInSeconds.
      def create_presigned_domain_url(
        domain_id : String,
        user_profile_name : String,
        expires_in_seconds : Int32? = nil,
        landing_uri : String? = nil,
        session_expiration_duration_in_seconds : Int32? = nil,
        space_name : String? = nil
      ) : Types::CreatePresignedDomainUrlResponse
        input = Types::CreatePresignedDomainUrlRequest.new(domain_id: domain_id, user_profile_name: user_profile_name, expires_in_seconds: expires_in_seconds, landing_uri: landing_uri, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds, space_name: space_name)
        create_presigned_domain_url(input)
      end
      def create_presigned_domain_url(input : Types::CreatePresignedDomainUrlRequest) : Types::CreatePresignedDomainUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRESIGNED_DOMAIN_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePresignedDomainUrlResponse, "CreatePresignedDomainUrl")
      end

      # Returns a presigned URL that you can use to connect to the MLflow UI attached to your MLflow App.
      # For more information, see Launch the MLflow UI using a presigned URL .
      def create_presigned_mlflow_app_url(
        arn : String,
        expires_in_seconds : Int32? = nil,
        session_expiration_duration_in_seconds : Int32? = nil
      ) : Types::CreatePresignedMlflowAppUrlResponse
        input = Types::CreatePresignedMlflowAppUrlRequest.new(arn: arn, expires_in_seconds: expires_in_seconds, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds)
        create_presigned_mlflow_app_url(input)
      end
      def create_presigned_mlflow_app_url(input : Types::CreatePresignedMlflowAppUrlRequest) : Types::CreatePresignedMlflowAppUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRESIGNED_MLFLOW_APP_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePresignedMlflowAppUrlResponse, "CreatePresignedMlflowAppUrl")
      end

      # Returns a presigned URL that you can use to connect to the MLflow UI attached to your tracking
      # server. For more information, see Launch the MLflow UI using a presigned URL .
      def create_presigned_mlflow_tracking_server_url(
        tracking_server_name : String,
        expires_in_seconds : Int32? = nil,
        session_expiration_duration_in_seconds : Int32? = nil
      ) : Types::CreatePresignedMlflowTrackingServerUrlResponse
        input = Types::CreatePresignedMlflowTrackingServerUrlRequest.new(tracking_server_name: tracking_server_name, expires_in_seconds: expires_in_seconds, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds)
        create_presigned_mlflow_tracking_server_url(input)
      end
      def create_presigned_mlflow_tracking_server_url(input : Types::CreatePresignedMlflowTrackingServerUrlRequest) : Types::CreatePresignedMlflowTrackingServerUrlResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRESIGNED_MLFLOW_TRACKING_SERVER_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePresignedMlflowTrackingServerUrlResponse, "CreatePresignedMlflowTrackingServerUrl")
      end

      # Returns a URL that you can use to connect to the Jupyter server from a notebook instance. In the
      # SageMaker AI console, when you choose Open next to a notebook instance, SageMaker AI opens a new tab
      # showing the Jupyter server home page from the notebook instance. The console uses this API to get
      # the URL and show the page. The IAM role or user used to call this API defines the permissions to
      # access the notebook instance. Once the presigned URL is created, no additional permission is
      # required to access this URL. IAM authorization policies for this API are also enforced for every
      # HTTP request and WebSocket frame that attempts to connect to the notebook instance. You can restrict
      # access to this API and to the URL that it returns to a list of IP addresses that you specify. Use
      # the NotIpAddress condition operator and the aws:SourceIP condition context key to specify the list
      # of IP addresses that you want to have access to the notebook instance. For more information, see
      # Limit Access to a Notebook Instance by IP Address . The URL that you get from a call to
      # CreatePresignedNotebookInstanceUrl is valid only for 5 minutes. If you try to use the URL after the
      # 5-minute limit expires, you are directed to the Amazon Web Services console sign-in page.
      def create_presigned_notebook_instance_url(
        notebook_instance_name : String,
        session_expiration_duration_in_seconds : Int32? = nil
      ) : Types::CreatePresignedNotebookInstanceUrlOutput
        input = Types::CreatePresignedNotebookInstanceUrlInput.new(notebook_instance_name: notebook_instance_name, session_expiration_duration_in_seconds: session_expiration_duration_in_seconds)
        create_presigned_notebook_instance_url(input)
      end
      def create_presigned_notebook_instance_url(input : Types::CreatePresignedNotebookInstanceUrlInput) : Types::CreatePresignedNotebookInstanceUrlOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PRESIGNED_NOTEBOOK_INSTANCE_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePresignedNotebookInstanceUrlOutput, "CreatePresignedNotebookInstanceUrl")
      end

      # Creates a processing job.
      def create_processing_job(
        app_specification : Types::AppSpecification,
        processing_job_name : String,
        processing_resources : Types::ProcessingResources,
        role_arn : String,
        environment : Hash(String, String)? = nil,
        experiment_config : Types::ExperimentConfig? = nil,
        network_config : Types::NetworkConfig? = nil,
        processing_inputs : Array(Types::ProcessingInput)? = nil,
        processing_output_config : Types::ProcessingOutputConfig? = nil,
        stopping_condition : Types::ProcessingStoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProcessingJobResponse
        input = Types::CreateProcessingJobRequest.new(app_specification: app_specification, processing_job_name: processing_job_name, processing_resources: processing_resources, role_arn: role_arn, environment: environment, experiment_config: experiment_config, network_config: network_config, processing_inputs: processing_inputs, processing_output_config: processing_output_config, stopping_condition: stopping_condition, tags: tags)
        create_processing_job(input)
      end
      def create_processing_job(input : Types::CreateProcessingJobRequest) : Types::CreateProcessingJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROCESSING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProcessingJobResponse, "CreateProcessingJob")
      end

      # Creates a machine learning (ML) project that can contain one or more templates that set up an ML
      # pipeline from training to deploying an approved model.
      def create_project(
        project_name : String,
        project_description : String? = nil,
        service_catalog_provisioning_details : Types::ServiceCatalogProvisioningDetails? = nil,
        tags : Array(Types::Tag)? = nil,
        template_providers : Array(Types::CreateTemplateProvider)? = nil
      ) : Types::CreateProjectOutput
        input = Types::CreateProjectInput.new(project_name: project_name, project_description: project_description, service_catalog_provisioning_details: service_catalog_provisioning_details, tags: tags, template_providers: template_providers)
        create_project(input)
      end
      def create_project(input : Types::CreateProjectInput) : Types::CreateProjectOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProjectOutput, "CreateProject")
      end

      # Creates a private space or a space used for real time collaboration in a domain.
      def create_space(
        domain_id : String,
        space_name : String,
        ownership_settings : Types::OwnershipSettings? = nil,
        space_display_name : String? = nil,
        space_settings : Types::SpaceSettings? = nil,
        space_sharing_settings : Types::SpaceSharingSettings? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSpaceResponse
        input = Types::CreateSpaceRequest.new(domain_id: domain_id, space_name: space_name, ownership_settings: ownership_settings, space_display_name: space_display_name, space_settings: space_settings, space_sharing_settings: space_sharing_settings, tags: tags)
        create_space(input)
      end
      def create_space(input : Types::CreateSpaceRequest) : Types::CreateSpaceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSpaceResponse, "CreateSpace")
      end

      # Creates a new Amazon SageMaker AI Studio Lifecycle Configuration.
      def create_studio_lifecycle_config(
        studio_lifecycle_config_app_type : String,
        studio_lifecycle_config_content : String,
        studio_lifecycle_config_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateStudioLifecycleConfigResponse
        input = Types::CreateStudioLifecycleConfigRequest.new(studio_lifecycle_config_app_type: studio_lifecycle_config_app_type, studio_lifecycle_config_content: studio_lifecycle_config_content, studio_lifecycle_config_name: studio_lifecycle_config_name, tags: tags)
        create_studio_lifecycle_config(input)
      end
      def create_studio_lifecycle_config(input : Types::CreateStudioLifecycleConfigRequest) : Types::CreateStudioLifecycleConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_STUDIO_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStudioLifecycleConfigResponse, "CreateStudioLifecycleConfig")
      end

      # Starts a model training job. After training completes, SageMaker saves the resulting model artifacts
      # to an Amazon S3 location that you specify. If you choose to host your model using SageMaker hosting
      # services, you can use the resulting model artifacts as part of the model. You can also use the
      # artifacts in a machine learning service other than SageMaker, provided that you know how to use them
      # for inference. In the request body, you provide the following: AlgorithmSpecification - Identifies
      # the training algorithm to use. HyperParameters - Specify these algorithm-specific parameters to
      # enable the estimation of model parameters during training. Hyperparameters can be tuned to optimize
      # this learning process. For a list of hyperparameters for each training algorithm provided by
      # SageMaker, see Algorithms . Do not include any security-sensitive information including account
      # access IDs, secrets, or tokens in any hyperparameter fields. As part of the shared responsibility
      # model, you are responsible for any potential exposure, unauthorized access, or compromise of your
      # sensitive data if caused by security-sensitive information included in the request hyperparameter
      # variable or plain text fields. InputDataConfig - Describes the input required by the training job
      # and the Amazon S3, EFS, or FSx location where it is stored. OutputDataConfig - Identifies the Amazon
      # S3 bucket where you want SageMaker to save the results of model training. ResourceConfig -
      # Identifies the resources, ML compute instances, and ML storage volumes to deploy for model training.
      # In distributed training, you specify more than one instance. EnableManagedSpotTraining - Optimize
      # the cost of training machine learning models by up to 80% by using Amazon EC2 Spot instances. For
      # more information, see Managed Spot Training . RoleArn - The Amazon Resource Name (ARN) that
      # SageMaker assumes to perform tasks on your behalf during model training. You must grant this role
      # the necessary permissions so that SageMaker can successfully complete model training.
      # StoppingCondition - To help cap training costs, use MaxRuntimeInSeconds to set a time limit for
      # training. Use MaxWaitTimeInSeconds to specify how long a managed spot training job has to complete.
      # Environment - The environment variables to set in the Docker container. Do not include any
      # security-sensitive information including account access IDs, secrets, or tokens in any environment
      # fields. As part of the shared responsibility model, you are responsible for any potential exposure,
      # unauthorized access, or compromise of your sensitive data if caused by security-sensitive
      # information included in the request environment variable or plain text fields. RetryStrategy - The
      # number of times to retry the job when the job fails due to an InternalServerError . For more
      # information about SageMaker, see How It Works .
      def create_training_job(
        output_data_config : Types::OutputDataConfig,
        role_arn : String,
        training_job_name : String,
        algorithm_specification : Types::AlgorithmSpecification? = nil,
        checkpoint_config : Types::CheckpointConfig? = nil,
        debug_hook_config : Types::DebugHookConfig? = nil,
        debug_rule_configurations : Array(Types::DebugRuleConfiguration)? = nil,
        enable_inter_container_traffic_encryption : Bool? = nil,
        enable_managed_spot_training : Bool? = nil,
        enable_network_isolation : Bool? = nil,
        environment : Hash(String, String)? = nil,
        experiment_config : Types::ExperimentConfig? = nil,
        hyper_parameters : Hash(String, String)? = nil,
        infra_check_config : Types::InfraCheckConfig? = nil,
        input_data_config : Array(Types::Channel)? = nil,
        mlflow_config : Types::MlflowConfig? = nil,
        model_package_config : Types::ModelPackageConfig? = nil,
        profiler_config : Types::ProfilerConfig? = nil,
        profiler_rule_configurations : Array(Types::ProfilerRuleConfiguration)? = nil,
        remote_debug_config : Types::RemoteDebugConfig? = nil,
        resource_config : Types::ResourceConfig? = nil,
        retry_strategy : Types::RetryStrategy? = nil,
        serverless_job_config : Types::ServerlessJobConfig? = nil,
        session_chaining_config : Types::SessionChainingConfig? = nil,
        stopping_condition : Types::StoppingCondition? = nil,
        tags : Array(Types::Tag)? = nil,
        tensor_board_output_config : Types::TensorBoardOutputConfig? = nil,
        vpc_config : Types::VpcConfig? = nil
      ) : Types::CreateTrainingJobResponse
        input = Types::CreateTrainingJobRequest.new(output_data_config: output_data_config, role_arn: role_arn, training_job_name: training_job_name, algorithm_specification: algorithm_specification, checkpoint_config: checkpoint_config, debug_hook_config: debug_hook_config, debug_rule_configurations: debug_rule_configurations, enable_inter_container_traffic_encryption: enable_inter_container_traffic_encryption, enable_managed_spot_training: enable_managed_spot_training, enable_network_isolation: enable_network_isolation, environment: environment, experiment_config: experiment_config, hyper_parameters: hyper_parameters, infra_check_config: infra_check_config, input_data_config: input_data_config, mlflow_config: mlflow_config, model_package_config: model_package_config, profiler_config: profiler_config, profiler_rule_configurations: profiler_rule_configurations, remote_debug_config: remote_debug_config, resource_config: resource_config, retry_strategy: retry_strategy, serverless_job_config: serverless_job_config, session_chaining_config: session_chaining_config, stopping_condition: stopping_condition, tags: tags, tensor_board_output_config: tensor_board_output_config, vpc_config: vpc_config)
        create_training_job(input)
      end
      def create_training_job(input : Types::CreateTrainingJobRequest) : Types::CreateTrainingJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRAINING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrainingJobResponse, "CreateTrainingJob")
      end

      # Creates a new training plan in SageMaker to reserve compute capacity. Amazon SageMaker Training Plan
      # is a capability within SageMaker that allows customers to reserve and manage GPU capacity for
      # large-scale AI model training. It provides a way to secure predictable access to computational
      # resources within specific timelines and budgets, without the need to manage underlying
      # infrastructure. How it works Plans can be created for specific resources such as SageMaker Training
      # Jobs or SageMaker HyperPod clusters, automatically provisioning resources, setting up
      # infrastructure, executing workloads, and handling infrastructure failures. Plan creation workflow
      # Users search for available plan offerings based on their requirements (e.g., instance type, count,
      # start time, duration) using the SearchTrainingPlanOfferings API operation. They create a plan that
      # best matches their needs using the ID of the plan offering they want to use. After successful
      # upfront payment, the plan's status becomes Scheduled . The plan can be used to: Queue training jobs.
      # Allocate to an instance group of a SageMaker HyperPod cluster. When the plan start date arrives, it
      # becomes Active . Based on available reserved capacity: Training jobs are launched. Instance groups
      # are provisioned. Plan composition A plan can consist of one or more Reserved Capacities, each
      # defined by a specific instance type, quantity, Availability Zone, duration, and start and end times.
      # For more information about Reserved Capacity, see ReservedCapacitySummary .
      def create_training_plan(
        training_plan_name : String,
        training_plan_offering_id : String,
        spare_instance_count_per_ultra_server : Int32? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrainingPlanResponse
        input = Types::CreateTrainingPlanRequest.new(training_plan_name: training_plan_name, training_plan_offering_id: training_plan_offering_id, spare_instance_count_per_ultra_server: spare_instance_count_per_ultra_server, tags: tags)
        create_training_plan(input)
      end
      def create_training_plan(input : Types::CreateTrainingPlanRequest) : Types::CreateTrainingPlanResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRAINING_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrainingPlanResponse, "CreateTrainingPlan")
      end

      # Starts a transform job. A transform job uses a trained model to get inferences on a dataset and
      # saves these results to an Amazon S3 location that you specify. To perform batch transformations, you
      # create a transform job and use the data that you have readily available. In the request body, you
      # provide the following: TransformJobName - Identifies the transform job. The name must be unique
      # within an Amazon Web Services Region in an Amazon Web Services account. ModelName - Identifies the
      # model to use. ModelName must be the name of an existing Amazon SageMaker model in the same Amazon
      # Web Services Region and Amazon Web Services account. For information on creating a model, see
      # CreateModel . TransformInput - Describes the dataset to be transformed and the Amazon S3 location
      # where it is stored. TransformOutput - Identifies the Amazon S3 location where you want Amazon
      # SageMaker to save the results from the transform job. TransformResources - Identifies the ML compute
      # instances and AMI image versions for the transform job. For more information about how batch
      # transformation works, see Batch Transform .
      def create_transform_job(
        model_name : String,
        transform_input : Types::TransformInput,
        transform_job_name : String,
        transform_output : Types::TransformOutput,
        transform_resources : Types::TransformResources,
        batch_strategy : String? = nil,
        data_capture_config : Types::BatchDataCaptureConfig? = nil,
        data_processing : Types::DataProcessing? = nil,
        environment : Hash(String, String)? = nil,
        experiment_config : Types::ExperimentConfig? = nil,
        max_concurrent_transforms : Int32? = nil,
        max_payload_in_mb : Int32? = nil,
        model_client_config : Types::ModelClientConfig? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTransformJobResponse
        input = Types::CreateTransformJobRequest.new(model_name: model_name, transform_input: transform_input, transform_job_name: transform_job_name, transform_output: transform_output, transform_resources: transform_resources, batch_strategy: batch_strategy, data_capture_config: data_capture_config, data_processing: data_processing, environment: environment, experiment_config: experiment_config, max_concurrent_transforms: max_concurrent_transforms, max_payload_in_mb: max_payload_in_mb, model_client_config: model_client_config, tags: tags)
        create_transform_job(input)
      end
      def create_transform_job(input : Types::CreateTransformJobRequest) : Types::CreateTransformJobResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRANSFORM_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTransformJobResponse, "CreateTransformJob")
      end

      # Creates an SageMaker trial . A trial is a set of steps called trial components that produce a
      # machine learning model. A trial is part of a single SageMaker experiment . When you use SageMaker
      # Studio or the SageMaker Python SDK, all experiments, trials, and trial components are automatically
      # tracked, logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must
      # use the logging APIs provided by the SDK. You can add tags to a trial and then use the Search API to
      # search for the tags. To get a list of all your trials, call the ListTrials API. To view a trial's
      # properties, call the DescribeTrial API. To create a trial component, call the CreateTrialComponent
      # API.
      def create_trial(
        experiment_name : String,
        trial_name : String,
        display_name : String? = nil,
        metadata_properties : Types::MetadataProperties? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrialResponse
        input = Types::CreateTrialRequest.new(experiment_name: experiment_name, trial_name: trial_name, display_name: display_name, metadata_properties: metadata_properties, tags: tags)
        create_trial(input)
      end
      def create_trial(input : Types::CreateTrialRequest) : Types::CreateTrialResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrialResponse, "CreateTrial")
      end

      # Creates a trial component , which is a stage of a machine learning trial . A trial is composed of
      # one or more trial components. A trial component can be used in multiple trials. Trial components
      # include pre-processing jobs, training jobs, and batch transform jobs. When you use SageMaker Studio
      # or the SageMaker Python SDK, all experiments, trials, and trial components are automatically
      # tracked, logged, and indexed. When you use the Amazon Web Services SDK for Python (Boto), you must
      # use the logging APIs provided by the SDK. You can add tags to a trial component and then use the
      # Search API to search for the tags.
      def create_trial_component(
        trial_component_name : String,
        display_name : String? = nil,
        end_time : Time? = nil,
        input_artifacts : Hash(String, Types::TrialComponentArtifact)? = nil,
        metadata_properties : Types::MetadataProperties? = nil,
        output_artifacts : Hash(String, Types::TrialComponentArtifact)? = nil,
        parameters : Hash(String, Types::TrialComponentParameterValue)? = nil,
        start_time : Time? = nil,
        status : Types::TrialComponentStatus? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTrialComponentResponse
        input = Types::CreateTrialComponentRequest.new(trial_component_name: trial_component_name, display_name: display_name, end_time: end_time, input_artifacts: input_artifacts, metadata_properties: metadata_properties, output_artifacts: output_artifacts, parameters: parameters, start_time: start_time, status: status, tags: tags)
        create_trial_component(input)
      end
      def create_trial_component(input : Types::CreateTrialComponentRequest) : Types::CreateTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTrialComponentResponse, "CreateTrialComponent")
      end

      # Creates a user profile. A user profile represents a single user within a domain, and is the main way
      # to reference a "person" for the purposes of sharing, reporting, and other user-oriented features.
      # This entity is created when a user onboards to a domain. If an administrator invites a person by
      # email or imports them from IAM Identity Center, a user profile is automatically created. A user
      # profile is the primary holder of settings for an individual user and has a reference to the user's
      # private Amazon Elastic File System home directory.
      def create_user_profile(
        domain_id : String,
        user_profile_name : String,
        single_sign_on_user_identifier : String? = nil,
        single_sign_on_user_value : String? = nil,
        tags : Array(Types::Tag)? = nil,
        user_settings : Types::UserSettings? = nil
      ) : Types::CreateUserProfileResponse
        input = Types::CreateUserProfileRequest.new(domain_id: domain_id, user_profile_name: user_profile_name, single_sign_on_user_identifier: single_sign_on_user_identifier, single_sign_on_user_value: single_sign_on_user_value, tags: tags, user_settings: user_settings)
        create_user_profile(input)
      end
      def create_user_profile(input : Types::CreateUserProfileRequest) : Types::CreateUserProfileResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserProfileResponse, "CreateUserProfile")
      end

      # Use this operation to create a workforce. This operation will return an error if a workforce already
      # exists in the Amazon Web Services Region that you specify. You can only create one workforce in each
      # Amazon Web Services Region per Amazon Web Services account. If you want to create a new workforce in
      # an Amazon Web Services Region where a workforce already exists, use the DeleteWorkforce API
      # operation to delete the existing workforce and then use CreateWorkforce to create a new workforce.
      # To create a private workforce using Amazon Cognito, you must specify a Cognito user pool in
      # CognitoConfig . You can also create an Amazon Cognito workforce using the Amazon SageMaker console.
      # For more information, see Create a Private Workforce (Amazon Cognito) . To create a private
      # workforce using your own OIDC Identity Provider (IdP), specify your IdP configuration in OidcConfig
      # . Your OIDC IdP must support groups because groups are used by Ground Truth and Amazon A2I to create
      # work teams. For more information, see Create a Private Workforce (OIDC IdP) .
      def create_workforce(
        workforce_name : String,
        cognito_config : Types::CognitoConfig? = nil,
        ip_address_type : String? = nil,
        oidc_config : Types::OidcConfig? = nil,
        source_ip_config : Types::SourceIpConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        workforce_vpc_config : Types::WorkforceVpcConfigRequest? = nil
      ) : Types::CreateWorkforceResponse
        input = Types::CreateWorkforceRequest.new(workforce_name: workforce_name, cognito_config: cognito_config, ip_address_type: ip_address_type, oidc_config: oidc_config, source_ip_config: source_ip_config, tags: tags, workforce_vpc_config: workforce_vpc_config)
        create_workforce(input)
      end
      def create_workforce(input : Types::CreateWorkforceRequest) : Types::CreateWorkforceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKFORCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkforceResponse, "CreateWorkforce")
      end

      # Creates a new work team for labeling your data. A work team is defined by one or more Amazon Cognito
      # user pools. You must first create the user pools before you can create a work team. You cannot
      # create more than 25 work teams in an account and region.
      def create_workteam(
        description : String,
        member_definitions : Array(Types::MemberDefinition),
        workteam_name : String,
        notification_configuration : Types::NotificationConfiguration? = nil,
        tags : Array(Types::Tag)? = nil,
        worker_access_configuration : Types::WorkerAccessConfiguration? = nil,
        workforce_name : String? = nil
      ) : Types::CreateWorkteamResponse
        input = Types::CreateWorkteamRequest.new(description: description, member_definitions: member_definitions, workteam_name: workteam_name, notification_configuration: notification_configuration, tags: tags, worker_access_configuration: worker_access_configuration, workforce_name: workforce_name)
        create_workteam(input)
      end
      def create_workteam(input : Types::CreateWorkteamRequest) : Types::CreateWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkteamResponse, "CreateWorkteam")
      end

      # Deletes an action.
      def delete_action(
        action_name : String
      ) : Types::DeleteActionResponse
        input = Types::DeleteActionRequest.new(action_name: action_name)
        delete_action(input)
      end
      def delete_action(input : Types::DeleteActionRequest) : Types::DeleteActionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteActionResponse, "DeleteAction")
      end

      # Removes the specified algorithm from your account.
      def delete_algorithm(
        algorithm_name : String
      ) : Nil
        input = Types::DeleteAlgorithmInput.new(algorithm_name: algorithm_name)
        delete_algorithm(input)
      end
      def delete_algorithm(input : Types::DeleteAlgorithmInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ALGORITHM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used to stop and delete an app.
      def delete_app(
        app_name : String,
        app_type : String,
        domain_id : String,
        space_name : String? = nil,
        user_profile_name : String? = nil
      ) : Nil
        input = Types::DeleteAppRequest.new(app_name: app_name, app_type: app_type, domain_id: domain_id, space_name: space_name, user_profile_name: user_profile_name)
        delete_app(input)
      end
      def delete_app(input : Types::DeleteAppRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an AppImageConfig.
      def delete_app_image_config(
        app_image_config_name : String
      ) : Nil
        input = Types::DeleteAppImageConfigRequest.new(app_image_config_name: app_image_config_name)
        delete_app_image_config(input)
      end
      def delete_app_image_config(input : Types::DeleteAppImageConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_APP_IMAGE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an artifact. Either ArtifactArn or Source must be specified.
      def delete_artifact(
        artifact_arn : String? = nil,
        source : Types::ArtifactSource? = nil
      ) : Types::DeleteArtifactResponse
        input = Types::DeleteArtifactRequest.new(artifact_arn: artifact_arn, source: source)
        delete_artifact(input)
      end
      def delete_artifact(input : Types::DeleteArtifactRequest) : Types::DeleteArtifactResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteArtifactResponse, "DeleteArtifact")
      end

      # Deletes an association.
      def delete_association(
        destination_arn : String,
        source_arn : String
      ) : Types::DeleteAssociationResponse
        input = Types::DeleteAssociationRequest.new(destination_arn: destination_arn, source_arn: source_arn)
        delete_association(input)
      end
      def delete_association(input : Types::DeleteAssociationRequest) : Types::DeleteAssociationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAssociationResponse, "DeleteAssociation")
      end

      # Delete a SageMaker HyperPod cluster.
      def delete_cluster(
        cluster_name : String
      ) : Types::DeleteClusterResponse
        input = Types::DeleteClusterRequest.new(cluster_name: cluster_name)
        delete_cluster(input)
      end
      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes the cluster policy of the cluster.
      def delete_cluster_scheduler_config(
        cluster_scheduler_config_id : String
      ) : Nil
        input = Types::DeleteClusterSchedulerConfigRequest.new(cluster_scheduler_config_id: cluster_scheduler_config_id)
        delete_cluster_scheduler_config(input)
      end
      def delete_cluster_scheduler_config(input : Types::DeleteClusterSchedulerConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER_SCHEDULER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified Git repository from your account.
      def delete_code_repository(
        code_repository_name : String
      ) : Nil
        input = Types::DeleteCodeRepositoryInput.new(code_repository_name: code_repository_name)
        delete_code_repository(input)
      end
      def delete_code_repository(input : Types::DeleteCodeRepositoryInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CODE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified compilation job. This action deletes only the compilation job resource in
      # Amazon SageMaker AI. It doesn't delete other resources that are related to that job, such as the
      # model artifacts that the job creates, the compilation logs in CloudWatch, the compiled model, or the
      # IAM role. You can delete a compilation job only if its current status is COMPLETED , FAILED , or
      # STOPPED . If the job status is STARTING or INPROGRESS , stop the job, and then delete it after its
      # status becomes STOPPED .
      def delete_compilation_job(
        compilation_job_name : String
      ) : Nil
        input = Types::DeleteCompilationJobRequest.new(compilation_job_name: compilation_job_name)
        delete_compilation_job(input)
      end
      def delete_compilation_job(input : Types::DeleteCompilationJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMPILATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the compute allocation from the cluster.
      def delete_compute_quota(
        compute_quota_id : String
      ) : Nil
        input = Types::DeleteComputeQuotaRequest.new(compute_quota_id: compute_quota_id)
        delete_compute_quota(input)
      end
      def delete_compute_quota(input : Types::DeleteComputeQuotaRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMPUTE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an context.
      def delete_context(
        context_name : String
      ) : Types::DeleteContextResponse
        input = Types::DeleteContextRequest.new(context_name: context_name)
        delete_context(input)
      end
      def delete_context(input : Types::DeleteContextRequest) : Types::DeleteContextResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteContextResponse, "DeleteContext")
      end

      # Deletes a data quality monitoring job definition.
      def delete_data_quality_job_definition(
        job_definition_name : String
      ) : Nil
        input = Types::DeleteDataQualityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        delete_data_quality_job_definition(input)
      end
      def delete_data_quality_job_definition(input : Types::DeleteDataQualityJobDefinitionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATA_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a fleet.
      def delete_device_fleet(
        device_fleet_name : String
      ) : Nil
        input = Types::DeleteDeviceFleetRequest.new(device_fleet_name: device_fleet_name)
        delete_device_fleet(input)
      end
      def delete_device_fleet(input : Types::DeleteDeviceFleetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DEVICE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used to delete a domain. If you onboarded with IAM mode, you will need to delete your domain to
      # onboard again using IAM Identity Center. Use with caution. All of the members of the domain will
      # lose access to their EFS volume, including data, notebooks, and other artifacts.
      def delete_domain(
        domain_id : String,
        retention_policy : Types::RetentionPolicy? = nil
      ) : Nil
        input = Types::DeleteDomainRequest.new(domain_id: domain_id, retention_policy: retention_policy)
        delete_domain(input)
      end
      def delete_domain(input : Types::DeleteDomainRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an edge deployment plan if (and only if) all the stages in the plan are inactive or there
      # are no stages in the plan.
      def delete_edge_deployment_plan(
        edge_deployment_plan_name : String
      ) : Nil
        input = Types::DeleteEdgeDeploymentPlanRequest.new(edge_deployment_plan_name: edge_deployment_plan_name)
        delete_edge_deployment_plan(input)
      end
      def delete_edge_deployment_plan(input : Types::DeleteEdgeDeploymentPlanRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EDGE_DEPLOYMENT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a stage in an edge deployment plan if (and only if) the stage is inactive.
      def delete_edge_deployment_stage(
        edge_deployment_plan_name : String,
        stage_name : String
      ) : Nil
        input = Types::DeleteEdgeDeploymentStageRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, stage_name: stage_name)
        delete_edge_deployment_stage(input)
      end
      def delete_edge_deployment_stage(input : Types::DeleteEdgeDeploymentStageRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_EDGE_DEPLOYMENT_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an endpoint. SageMaker frees up all of the resources that were deployed when the endpoint
      # was created. SageMaker retires any custom KMS key grants associated with the endpoint, meaning you
      # don't need to use the RevokeGrant API call. When you delete your endpoint, SageMaker asynchronously
      # deletes associated endpoint resources such as KMS key grants. You might still see these resources in
      # your account for a few minutes after deleting your endpoint. Do not delete or revoke the permissions
      # for your ExecutionRoleArn , otherwise SageMaker cannot delete these resources.
      def delete_endpoint(
        endpoint_name : String
      ) : Nil
        input = Types::DeleteEndpointInput.new(endpoint_name: endpoint_name)
        delete_endpoint(input)
      end
      def delete_endpoint(input : Types::DeleteEndpointInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an endpoint configuration. The DeleteEndpointConfig API deletes only the specified
      # configuration. It does not delete endpoints created using the configuration. You must not delete an
      # EndpointConfig in use by an endpoint that is live or while the UpdateEndpoint or CreateEndpoint
      # operations are being performed on the endpoint. If you delete the EndpointConfig of an endpoint that
      # is active or being created or updated you may lose visibility into the instance type the endpoint is
      # using. The endpoint must be deleted in order to stop incurring charges.
      def delete_endpoint_config(
        endpoint_config_name : String
      ) : Nil
        input = Types::DeleteEndpointConfigInput.new(endpoint_config_name: endpoint_config_name)
        delete_endpoint_config(input)
      end
      def delete_endpoint_config(input : Types::DeleteEndpointConfigInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ENDPOINT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an SageMaker experiment. All trials associated with the experiment must be deleted first.
      # Use the ListTrials API to get a list of the trials associated with the experiment.
      def delete_experiment(
        experiment_name : String
      ) : Types::DeleteExperimentResponse
        input = Types::DeleteExperimentRequest.new(experiment_name: experiment_name)
        delete_experiment(input)
      end
      def delete_experiment(input : Types::DeleteExperimentRequest) : Types::DeleteExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteExperimentResponse, "DeleteExperiment")
      end

      # Delete the FeatureGroup and any data that was written to the OnlineStore of the FeatureGroup . Data
      # cannot be accessed from the OnlineStore immediately after DeleteFeatureGroup is called. Data written
      # into the OfflineStore will not be deleted. The Amazon Web Services Glue database and tables that are
      # automatically created for your OfflineStore are not deleted. Note that it can take approximately
      # 10-15 minutes to delete an OnlineStore FeatureGroup with the InMemory StorageType .
      def delete_feature_group(
        feature_group_name : String
      ) : Nil
        input = Types::DeleteFeatureGroupRequest.new(feature_group_name: feature_group_name)
        delete_feature_group(input)
      end
      def delete_feature_group(input : Types::DeleteFeatureGroupRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_FEATURE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified flow definition.
      def delete_flow_definition(
        flow_definition_name : String
      ) : Types::DeleteFlowDefinitionResponse
        input = Types::DeleteFlowDefinitionRequest.new(flow_definition_name: flow_definition_name)
        delete_flow_definition(input)
      end
      def delete_flow_definition(input : Types::DeleteFlowDefinitionRequest) : Types::DeleteFlowDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLOW_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFlowDefinitionResponse, "DeleteFlowDefinition")
      end

      # Delete a hub.
      def delete_hub(
        hub_name : String
      ) : Nil
        input = Types::DeleteHubRequest.new(hub_name: hub_name)
        delete_hub(input)
      end
      def delete_hub(input : Types::DeleteHubRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_HUB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete the contents of a hub.
      def delete_hub_content(
        hub_content_name : String,
        hub_content_type : String,
        hub_content_version : String,
        hub_name : String
      ) : Nil
        input = Types::DeleteHubContentRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_content_version: hub_content_version, hub_name: hub_name)
        delete_hub_content(input)
      end
      def delete_hub_content(input : Types::DeleteHubContentRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_HUB_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete a hub content reference in order to remove a model from a private hub.
      def delete_hub_content_reference(
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String
      ) : Nil
        input = Types::DeleteHubContentReferenceRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name)
        delete_hub_content_reference(input)
      end
      def delete_hub_content_reference(input : Types::DeleteHubContentReferenceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_HUB_CONTENT_REFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Use this operation to delete a human task user interface (worker task template). To see a list of
      # human task user interfaces (work task templates) in your account, use ListHumanTaskUis . When you
      # delete a worker task template, it no longer appears when you call ListHumanTaskUis .
      def delete_human_task_ui(
        human_task_ui_name : String
      ) : Types::DeleteHumanTaskUiResponse
        input = Types::DeleteHumanTaskUiRequest.new(human_task_ui_name: human_task_ui_name)
        delete_human_task_ui(input)
      end
      def delete_human_task_ui(input : Types::DeleteHumanTaskUiRequest) : Types::DeleteHumanTaskUiResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_HUMAN_TASK_UI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHumanTaskUiResponse, "DeleteHumanTaskUi")
      end

      # Deletes a hyperparameter tuning job. The DeleteHyperParameterTuningJob API deletes only the tuning
      # job entry that was created in SageMaker when you called the CreateHyperParameterTuningJob API. It
      # does not delete training jobs, artifacts, or the IAM role that you specified when creating the
      # model.
      def delete_hyper_parameter_tuning_job(
        hyper_parameter_tuning_job_name : String
      ) : Nil
        input = Types::DeleteHyperParameterTuningJobRequest.new(hyper_parameter_tuning_job_name: hyper_parameter_tuning_job_name)
        delete_hyper_parameter_tuning_job(input)
      end
      def delete_hyper_parameter_tuning_job(input : Types::DeleteHyperParameterTuningJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_HYPER_PARAMETER_TUNING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a SageMaker AI image and all versions of the image. The container images aren't deleted.
      def delete_image(
        image_name : String
      ) : Types::DeleteImageResponse
        input = Types::DeleteImageRequest.new(image_name: image_name)
        delete_image(input)
      end
      def delete_image(input : Types::DeleteImageRequest) : Types::DeleteImageResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImageResponse, "DeleteImage")
      end

      # Deletes a version of a SageMaker AI image. The container image the version represents isn't deleted.
      def delete_image_version(
        image_name : String,
        alias : String? = nil,
        version : Int32? = nil
      ) : Types::DeleteImageVersionResponse
        input = Types::DeleteImageVersionRequest.new(image_name: image_name, alias: alias, version: version)
        delete_image_version(input)
      end
      def delete_image_version(input : Types::DeleteImageVersionRequest) : Types::DeleteImageVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IMAGE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteImageVersionResponse, "DeleteImageVersion")
      end

      # Deletes an inference component.
      def delete_inference_component(
        inference_component_name : String
      ) : Nil
        input = Types::DeleteInferenceComponentInput.new(inference_component_name: inference_component_name)
        delete_inference_component(input)
      end
      def delete_inference_component(input : Types::DeleteInferenceComponentInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_INFERENCE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an inference experiment. This operation does not delete your endpoint, variants, or any
      # underlying resources. This operation only deletes the metadata of your experiment.
      def delete_inference_experiment(
        name : String
      ) : Types::DeleteInferenceExperimentResponse
        input = Types::DeleteInferenceExperimentRequest.new(name: name)
        delete_inference_experiment(input)
      end
      def delete_inference_experiment(input : Types::DeleteInferenceExperimentRequest) : Types::DeleteInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInferenceExperimentResponse, "DeleteInferenceExperiment")
      end

      # Deletes an MLflow App.
      def delete_mlflow_app(
        arn : String
      ) : Types::DeleteMlflowAppResponse
        input = Types::DeleteMlflowAppRequest.new(arn: arn)
        delete_mlflow_app(input)
      end
      def delete_mlflow_app(input : Types::DeleteMlflowAppRequest) : Types::DeleteMlflowAppResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MLFLOW_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMlflowAppResponse, "DeleteMlflowApp")
      end

      # Deletes an MLflow Tracking Server. For more information, see Clean up MLflow resources .
      def delete_mlflow_tracking_server(
        tracking_server_name : String
      ) : Types::DeleteMlflowTrackingServerResponse
        input = Types::DeleteMlflowTrackingServerRequest.new(tracking_server_name: tracking_server_name)
        delete_mlflow_tracking_server(input)
      end
      def delete_mlflow_tracking_server(input : Types::DeleteMlflowTrackingServerRequest) : Types::DeleteMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMlflowTrackingServerResponse, "DeleteMlflowTrackingServer")
      end

      # Deletes a model. The DeleteModel API deletes only the model entry that was created in SageMaker when
      # you called the CreateModel API. It does not delete model artifacts, inference code, or the IAM role
      # that you specified when creating the model.
      def delete_model(
        model_name : String
      ) : Nil
        input = Types::DeleteModelInput.new(model_name: model_name)
        delete_model(input)
      end
      def delete_model(input : Types::DeleteModelInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon SageMaker AI model bias job definition.
      def delete_model_bias_job_definition(
        job_definition_name : String
      ) : Nil
        input = Types::DeleteModelBiasJobDefinitionRequest.new(job_definition_name: job_definition_name)
        delete_model_bias_job_definition(input)
      end
      def delete_model_bias_job_definition(input : Types::DeleteModelBiasJobDefinitionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_BIAS_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon SageMaker Model Card.
      def delete_model_card(
        model_card_name : String
      ) : Nil
        input = Types::DeleteModelCardRequest.new(model_card_name: model_card_name)
        delete_model_card(input)
      end
      def delete_model_card(input : Types::DeleteModelCardRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_CARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an Amazon SageMaker AI model explainability job definition.
      def delete_model_explainability_job_definition(
        job_definition_name : String
      ) : Nil
        input = Types::DeleteModelExplainabilityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        delete_model_explainability_job_definition(input)
      end
      def delete_model_explainability_job_definition(input : Types::DeleteModelExplainabilityJobDefinitionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_EXPLAINABILITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a model package. A model package is used to create SageMaker models or list on Amazon Web
      # Services Marketplace. Buyers can subscribe to model packages listed on Amazon Web Services
      # Marketplace to create models in SageMaker.
      def delete_model_package(
        model_package_name : String
      ) : Nil
        input = Types::DeleteModelPackageInput.new(model_package_name: model_package_name)
        delete_model_package(input)
      end
      def delete_model_package(input : Types::DeleteModelPackageInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_PACKAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified model group.
      def delete_model_package_group(
        model_package_group_name : String
      ) : Nil
        input = Types::DeleteModelPackageGroupInput.new(model_package_group_name: model_package_group_name)
        delete_model_package_group(input)
      end
      def delete_model_package_group(input : Types::DeleteModelPackageGroupInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_PACKAGE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a model group resource policy.
      def delete_model_package_group_policy(
        model_package_group_name : String
      ) : Nil
        input = Types::DeleteModelPackageGroupPolicyInput.new(model_package_group_name: model_package_group_name)
        delete_model_package_group_policy(input)
      end
      def delete_model_package_group_policy(input : Types::DeleteModelPackageGroupPolicyInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_PACKAGE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the secified model quality monitoring job definition.
      def delete_model_quality_job_definition(
        job_definition_name : String
      ) : Nil
        input = Types::DeleteModelQualityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        delete_model_quality_job_definition(input)
      end
      def delete_model_quality_job_definition(input : Types::DeleteModelQualityJobDefinitionRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MODEL_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a monitoring schedule. Also stops the schedule had not already been stopped. This does not
      # delete the job execution history of the monitoring schedule.
      def delete_monitoring_schedule(
        monitoring_schedule_name : String
      ) : Nil
        input = Types::DeleteMonitoringScheduleRequest.new(monitoring_schedule_name: monitoring_schedule_name)
        delete_monitoring_schedule(input)
      end
      def delete_monitoring_schedule(input : Types::DeleteMonitoringScheduleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an SageMaker AI notebook instance. Before you can delete a notebook instance, you must call
      # the StopNotebookInstance API. When you delete a notebook instance, you lose all of your data.
      # SageMaker AI removes the ML compute instance, and deletes the ML storage volume and the network
      # interface associated with the notebook instance.
      def delete_notebook_instance(
        notebook_instance_name : String
      ) : Nil
        input = Types::DeleteNotebookInstanceInput.new(notebook_instance_name: notebook_instance_name)
        delete_notebook_instance(input)
      end
      def delete_notebook_instance(input : Types::DeleteNotebookInstanceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a notebook instance lifecycle configuration.
      def delete_notebook_instance_lifecycle_config(
        notebook_instance_lifecycle_config_name : String
      ) : Nil
        input = Types::DeleteNotebookInstanceLifecycleConfigInput.new(notebook_instance_lifecycle_config_name: notebook_instance_lifecycle_config_name)
        delete_notebook_instance_lifecycle_config(input)
      end
      def delete_notebook_instance_lifecycle_config(input : Types::DeleteNotebookInstanceLifecycleConfigInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an optimization job.
      def delete_optimization_job(
        optimization_job_name : String
      ) : Nil
        input = Types::DeleteOptimizationJobRequest.new(optimization_job_name: optimization_job_name)
        delete_optimization_job(input)
      end
      def delete_optimization_job(input : Types::DeleteOptimizationJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_OPTIMIZATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes a SageMaker Partner AI App.
      def delete_partner_app(
        arn : String,
        client_token : String? = nil
      ) : Types::DeletePartnerAppResponse
        input = Types::DeletePartnerAppRequest.new(arn: arn, client_token: client_token)
        delete_partner_app(input)
      end
      def delete_partner_app(input : Types::DeletePartnerAppRequest) : Types::DeletePartnerAppResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARTNER_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePartnerAppResponse, "DeletePartnerApp")
      end

      # Deletes a pipeline if there are no running instances of the pipeline. To delete a pipeline, you must
      # stop all running instances of the pipeline using the StopPipelineExecution API. When you delete a
      # pipeline, all instances of the pipeline are deleted.
      def delete_pipeline(
        client_request_token : String,
        pipeline_name : String
      ) : Types::DeletePipelineResponse
        input = Types::DeletePipelineRequest.new(client_request_token: client_request_token, pipeline_name: pipeline_name)
        delete_pipeline(input)
      end
      def delete_pipeline(input : Types::DeletePipelineRequest) : Types::DeletePipelineResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePipelineResponse, "DeletePipeline")
      end

      # Deletes a processing job. After Amazon SageMaker deletes a processing job, all of the metadata for
      # the processing job is lost. You can delete only processing jobs that are in a terminal state (
      # Stopped , Failed , or Completed ). You cannot delete a job that is in the InProgress or Stopping
      # state. After deleting the job, you can reuse its name to create another processing job.
      def delete_processing_job(
        processing_job_name : String
      ) : Nil
        input = Types::DeleteProcessingJobRequest.new(processing_job_name: processing_job_name)
        delete_processing_job(input)
      end
      def delete_processing_job(input : Types::DeleteProcessingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROCESSING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Delete the specified project.
      def delete_project(
        project_name : String
      ) : Nil
        input = Types::DeleteProjectInput.new(project_name: project_name)
        delete_project(input)
      end
      def delete_project(input : Types::DeleteProjectInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used to delete a space.
      def delete_space(
        domain_id : String,
        space_name : String
      ) : Nil
        input = Types::DeleteSpaceRequest.new(domain_id: domain_id, space_name: space_name)
        delete_space(input)
      end
      def delete_space(input : Types::DeleteSpaceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_SPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the Amazon SageMaker AI Studio Lifecycle Configuration. In order to delete the Lifecycle
      # Configuration, there must be no running apps using the Lifecycle Configuration. You must also remove
      # the Lifecycle Configuration from UserSettings in all Domains and UserProfiles.
      def delete_studio_lifecycle_config(
        studio_lifecycle_config_name : String
      ) : Nil
        input = Types::DeleteStudioLifecycleConfigRequest.new(studio_lifecycle_config_name: studio_lifecycle_config_name)
        delete_studio_lifecycle_config(input)
      end
      def delete_studio_lifecycle_config(input : Types::DeleteStudioLifecycleConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_STUDIO_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified tags from an SageMaker resource. To list a resource's tags, use the ListTags
      # API. When you call this API to delete tags from a hyperparameter tuning job, the deleted tags are
      # not removed from training jobs that the hyperparameter tuning job launched before you called this
      # API. When you call this API to delete tags from a SageMaker Domain or User Profile, the deleted tags
      # are not removed from Apps that the SageMaker Domain or User Profile launched before you called this
      # API.
      def delete_tags(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::DeleteTagsOutput
        input = Types::DeleteTagsInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        delete_tags(input)
      end
      def delete_tags(input : Types::DeleteTagsInput) : Types::DeleteTagsOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTagsOutput, "DeleteTags")
      end

      # Deletes a training job. After SageMaker deletes a training job, all of the metadata for the training
      # job is lost. You can delete only training jobs that are in a terminal state ( Stopped , Failed , or
      # Completed ) and don't retain an Available managed warm pool . You cannot delete a job that is in the
      # InProgress or Stopping state. After deleting the job, you can reuse its name to create another
      # training job.
      def delete_training_job(
        training_job_name : String
      ) : Nil
        input = Types::DeleteTrainingJobRequest.new(training_job_name: training_job_name)
        delete_training_job(input)
      end
      def delete_training_job(input : Types::DeleteTrainingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRAINING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified trial. All trial components that make up the trial must be deleted first. Use
      # the DescribeTrialComponent API to get the list of trial components.
      def delete_trial(
        trial_name : String
      ) : Types::DeleteTrialResponse
        input = Types::DeleteTrialRequest.new(trial_name: trial_name)
        delete_trial(input)
      end
      def delete_trial(input : Types::DeleteTrialRequest) : Types::DeleteTrialResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrialResponse, "DeleteTrial")
      end

      # Deletes the specified trial component. A trial component must be disassociated from all trials
      # before the trial component can be deleted. To disassociate a trial component from a trial, call the
      # DisassociateTrialComponent API.
      def delete_trial_component(
        trial_component_name : String
      ) : Types::DeleteTrialComponentResponse
        input = Types::DeleteTrialComponentRequest.new(trial_component_name: trial_component_name)
        delete_trial_component(input)
      end
      def delete_trial_component(input : Types::DeleteTrialComponentRequest) : Types::DeleteTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteTrialComponentResponse, "DeleteTrialComponent")
      end

      # Deletes a user profile. When a user profile is deleted, the user loses access to their EFS volume,
      # including data, notebooks, and other artifacts.
      def delete_user_profile(
        domain_id : String,
        user_profile_name : String
      ) : Nil
        input = Types::DeleteUserProfileRequest.new(domain_id: domain_id, user_profile_name: user_profile_name)
        delete_user_profile(input)
      end
      def delete_user_profile(input : Types::DeleteUserProfileRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Use this operation to delete a workforce. If you want to create a new workforce in an Amazon Web
      # Services Region where a workforce already exists, use this operation to delete the existing
      # workforce and then use CreateWorkforce to create a new workforce. If a private workforce contains
      # one or more work teams, you must use the DeleteWorkteam operation to delete all work teams before
      # you delete the workforce. If you try to delete a workforce that contains one or more work teams, you
      # will receive a ResourceInUse error.
      def delete_workforce(
        workforce_name : String
      ) : Types::DeleteWorkforceResponse
        input = Types::DeleteWorkforceRequest.new(workforce_name: workforce_name)
        delete_workforce(input)
      end
      def delete_workforce(input : Types::DeleteWorkforceRequest) : Types::DeleteWorkforceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKFORCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkforceResponse, "DeleteWorkforce")
      end

      # Deletes an existing work team. This operation can't be undone.
      def delete_workteam(
        workteam_name : String
      ) : Types::DeleteWorkteamResponse
        input = Types::DeleteWorkteamRequest.new(workteam_name: workteam_name)
        delete_workteam(input)
      end
      def delete_workteam(input : Types::DeleteWorkteamRequest) : Types::DeleteWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkteamResponse, "DeleteWorkteam")
      end

      # Deregisters the specified devices. After you deregister a device, you will need to re-register the
      # devices.
      def deregister_devices(
        device_fleet_name : String,
        device_names : Array(String)
      ) : Nil
        input = Types::DeregisterDevicesRequest.new(device_fleet_name: device_fleet_name, device_names: device_names)
        deregister_devices(input)
      end
      def deregister_devices(input : Types::DeregisterDevicesRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Describes an action.
      def describe_action(
        action_name : String
      ) : Types::DescribeActionResponse
        input = Types::DescribeActionRequest.new(action_name: action_name)
        describe_action(input)
      end
      def describe_action(input : Types::DescribeActionRequest) : Types::DescribeActionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeActionResponse, "DescribeAction")
      end

      # Returns a description of the specified algorithm that is in your account.
      def describe_algorithm(
        algorithm_name : String
      ) : Types::DescribeAlgorithmOutput
        input = Types::DescribeAlgorithmInput.new(algorithm_name: algorithm_name)
        describe_algorithm(input)
      end
      def describe_algorithm(input : Types::DescribeAlgorithmInput) : Types::DescribeAlgorithmOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ALGORITHM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAlgorithmOutput, "DescribeAlgorithm")
      end

      # Describes the app.
      def describe_app(
        app_name : String,
        app_type : String,
        domain_id : String,
        space_name : String? = nil,
        user_profile_name : String? = nil
      ) : Types::DescribeAppResponse
        input = Types::DescribeAppRequest.new(app_name: app_name, app_type: app_type, domain_id: domain_id, space_name: space_name, user_profile_name: user_profile_name)
        describe_app(input)
      end
      def describe_app(input : Types::DescribeAppRequest) : Types::DescribeAppResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppResponse, "DescribeApp")
      end

      # Describes an AppImageConfig.
      def describe_app_image_config(
        app_image_config_name : String
      ) : Types::DescribeAppImageConfigResponse
        input = Types::DescribeAppImageConfigRequest.new(app_image_config_name: app_image_config_name)
        describe_app_image_config(input)
      end
      def describe_app_image_config(input : Types::DescribeAppImageConfigRequest) : Types::DescribeAppImageConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_APP_IMAGE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAppImageConfigResponse, "DescribeAppImageConfig")
      end

      # Describes an artifact.
      def describe_artifact(
        artifact_arn : String
      ) : Types::DescribeArtifactResponse
        input = Types::DescribeArtifactRequest.new(artifact_arn: artifact_arn)
        describe_artifact(input)
      end
      def describe_artifact(input : Types::DescribeArtifactRequest) : Types::DescribeArtifactResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeArtifactResponse, "DescribeArtifact")
      end

      # Returns information about an AutoML job created by calling CreateAutoMLJob . AutoML jobs created by
      # calling CreateAutoMLJobV2 cannot be described by DescribeAutoMLJob .
      def describe_auto_ml_job(
        auto_ml_job_name : String
      ) : Types::DescribeAutoMLJobResponse
        input = Types::DescribeAutoMLJobRequest.new(auto_ml_job_name: auto_ml_job_name)
        describe_auto_ml_job(input)
      end
      def describe_auto_ml_job(input : Types::DescribeAutoMLJobRequest) : Types::DescribeAutoMLJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTO_ML_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutoMLJobResponse, "DescribeAutoMLJob")
      end

      # Returns information about an AutoML job created by calling CreateAutoMLJobV2 or CreateAutoMLJob .
      def describe_auto_ml_job_v2(
        auto_ml_job_name : String
      ) : Types::DescribeAutoMLJobV2Response
        input = Types::DescribeAutoMLJobV2Request.new(auto_ml_job_name: auto_ml_job_name)
        describe_auto_ml_job_v2(input)
      end
      def describe_auto_ml_job_v2(input : Types::DescribeAutoMLJobV2Request) : Types::DescribeAutoMLJobV2Response
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTO_ML_JOB_V2, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutoMLJobV2Response, "DescribeAutoMLJobV2")
      end

      # Retrieves information of a SageMaker HyperPod cluster.
      def describe_cluster(
        cluster_name : String
      ) : Types::DescribeClusterResponse
        input = Types::DescribeClusterRequest.new(cluster_name: cluster_name)
        describe_cluster(input)
      end
      def describe_cluster(input : Types::DescribeClusterRequest) : Types::DescribeClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterResponse, "DescribeCluster")
      end

      # Retrieves detailed information about a specific event for a given HyperPod cluster. This
      # functionality is only supported when the NodeProvisioningMode is set to Continuous .
      def describe_cluster_event(
        cluster_name : String,
        event_id : String
      ) : Types::DescribeClusterEventResponse
        input = Types::DescribeClusterEventRequest.new(cluster_name: cluster_name, event_id: event_id)
        describe_cluster_event(input)
      end
      def describe_cluster_event(input : Types::DescribeClusterEventRequest) : Types::DescribeClusterEventResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER_EVENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterEventResponse, "DescribeClusterEvent")
      end

      # Retrieves information of a node (also called a instance interchangeably) of a SageMaker HyperPod
      # cluster.
      def describe_cluster_node(
        cluster_name : String,
        node_id : String? = nil,
        node_logical_id : String? = nil
      ) : Types::DescribeClusterNodeResponse
        input = Types::DescribeClusterNodeRequest.new(cluster_name: cluster_name, node_id: node_id, node_logical_id: node_logical_id)
        describe_cluster_node(input)
      end
      def describe_cluster_node(input : Types::DescribeClusterNodeRequest) : Types::DescribeClusterNodeResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterNodeResponse, "DescribeClusterNode")
      end

      # Description of the cluster policy. This policy is used for task prioritization and fair-share
      # allocation. This helps prioritize critical workloads and distributes idle compute across entities.
      def describe_cluster_scheduler_config(
        cluster_scheduler_config_id : String,
        cluster_scheduler_config_version : Int32? = nil
      ) : Types::DescribeClusterSchedulerConfigResponse
        input = Types::DescribeClusterSchedulerConfigRequest.new(cluster_scheduler_config_id: cluster_scheduler_config_id, cluster_scheduler_config_version: cluster_scheduler_config_version)
        describe_cluster_scheduler_config(input)
      end
      def describe_cluster_scheduler_config(input : Types::DescribeClusterSchedulerConfigRequest) : Types::DescribeClusterSchedulerConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTER_SCHEDULER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClusterSchedulerConfigResponse, "DescribeClusterSchedulerConfig")
      end

      # Gets details about the specified Git repository.
      def describe_code_repository(
        code_repository_name : String
      ) : Types::DescribeCodeRepositoryOutput
        input = Types::DescribeCodeRepositoryInput.new(code_repository_name: code_repository_name)
        describe_code_repository(input)
      end
      def describe_code_repository(input : Types::DescribeCodeRepositoryInput) : Types::DescribeCodeRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CODE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCodeRepositoryOutput, "DescribeCodeRepository")
      end

      # Returns information about a model compilation job. To create a model compilation job, use
      # CreateCompilationJob . To get information about multiple model compilation jobs, use
      # ListCompilationJobs .
      def describe_compilation_job(
        compilation_job_name : String
      ) : Types::DescribeCompilationJobResponse
        input = Types::DescribeCompilationJobRequest.new(compilation_job_name: compilation_job_name)
        describe_compilation_job(input)
      end
      def describe_compilation_job(input : Types::DescribeCompilationJobRequest) : Types::DescribeCompilationJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPILATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCompilationJobResponse, "DescribeCompilationJob")
      end

      # Description of the compute allocation definition.
      def describe_compute_quota(
        compute_quota_id : String,
        compute_quota_version : Int32? = nil
      ) : Types::DescribeComputeQuotaResponse
        input = Types::DescribeComputeQuotaRequest.new(compute_quota_id: compute_quota_id, compute_quota_version: compute_quota_version)
        describe_compute_quota(input)
      end
      def describe_compute_quota(input : Types::DescribeComputeQuotaRequest) : Types::DescribeComputeQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPUTE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComputeQuotaResponse, "DescribeComputeQuota")
      end

      # Describes a context.
      def describe_context(
        context_name : String
      ) : Types::DescribeContextResponse
        input = Types::DescribeContextRequest.new(context_name: context_name)
        describe_context(input)
      end
      def describe_context(input : Types::DescribeContextRequest) : Types::DescribeContextResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeContextResponse, "DescribeContext")
      end

      # Gets the details of a data quality monitoring job definition.
      def describe_data_quality_job_definition(
        job_definition_name : String
      ) : Types::DescribeDataQualityJobDefinitionResponse
        input = Types::DescribeDataQualityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        describe_data_quality_job_definition(input)
      end
      def describe_data_quality_job_definition(input : Types::DescribeDataQualityJobDefinitionRequest) : Types::DescribeDataQualityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATA_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDataQualityJobDefinitionResponse, "DescribeDataQualityJobDefinition")
      end

      # Describes the device.
      def describe_device(
        device_fleet_name : String,
        device_name : String,
        next_token : String? = nil
      ) : Types::DescribeDeviceResponse
        input = Types::DescribeDeviceRequest.new(device_fleet_name: device_fleet_name, device_name: device_name, next_token: next_token)
        describe_device(input)
      end
      def describe_device(input : Types::DescribeDeviceRequest) : Types::DescribeDeviceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DEVICE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDeviceResponse, "DescribeDevice")
      end

      # A description of the fleet the device belongs to.
      def describe_device_fleet(
        device_fleet_name : String
      ) : Types::DescribeDeviceFleetResponse
        input = Types::DescribeDeviceFleetRequest.new(device_fleet_name: device_fleet_name)
        describe_device_fleet(input)
      end
      def describe_device_fleet(input : Types::DescribeDeviceFleetRequest) : Types::DescribeDeviceFleetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DEVICE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDeviceFleetResponse, "DescribeDeviceFleet")
      end

      # The description of the domain.
      def describe_domain(
        domain_id : String
      ) : Types::DescribeDomainResponse
        input = Types::DescribeDomainRequest.new(domain_id: domain_id)
        describe_domain(input)
      end
      def describe_domain(input : Types::DescribeDomainRequest) : Types::DescribeDomainResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDomainResponse, "DescribeDomain")
      end

      # Describes an edge deployment plan with deployment status per stage.
      def describe_edge_deployment_plan(
        edge_deployment_plan_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEdgeDeploymentPlanResponse
        input = Types::DescribeEdgeDeploymentPlanRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, max_results: max_results, next_token: next_token)
        describe_edge_deployment_plan(input)
      end
      def describe_edge_deployment_plan(input : Types::DescribeEdgeDeploymentPlanRequest) : Types::DescribeEdgeDeploymentPlanResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EDGE_DEPLOYMENT_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEdgeDeploymentPlanResponse, "DescribeEdgeDeploymentPlan")
      end

      # A description of edge packaging jobs.
      def describe_edge_packaging_job(
        edge_packaging_job_name : String
      ) : Types::DescribeEdgePackagingJobResponse
        input = Types::DescribeEdgePackagingJobRequest.new(edge_packaging_job_name: edge_packaging_job_name)
        describe_edge_packaging_job(input)
      end
      def describe_edge_packaging_job(input : Types::DescribeEdgePackagingJobRequest) : Types::DescribeEdgePackagingJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EDGE_PACKAGING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEdgePackagingJobResponse, "DescribeEdgePackagingJob")
      end

      # Returns the description of an endpoint.
      def describe_endpoint(
        endpoint_name : String
      ) : Types::DescribeEndpointOutput
        input = Types::DescribeEndpointInput.new(endpoint_name: endpoint_name)
        describe_endpoint(input)
      end
      def describe_endpoint(input : Types::DescribeEndpointInput) : Types::DescribeEndpointOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointOutput, "DescribeEndpoint")
      end

      # Returns the description of an endpoint configuration created using the CreateEndpointConfig API.
      def describe_endpoint_config(
        endpoint_config_name : String
      ) : Types::DescribeEndpointConfigOutput
        input = Types::DescribeEndpointConfigInput.new(endpoint_config_name: endpoint_config_name)
        describe_endpoint_config(input)
      end
      def describe_endpoint_config(input : Types::DescribeEndpointConfigInput) : Types::DescribeEndpointConfigOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENDPOINT_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEndpointConfigOutput, "DescribeEndpointConfig")
      end

      # Provides a list of an experiment's properties.
      def describe_experiment(
        experiment_name : String
      ) : Types::DescribeExperimentResponse
        input = Types::DescribeExperimentRequest.new(experiment_name: experiment_name)
        describe_experiment(input)
      end
      def describe_experiment(input : Types::DescribeExperimentRequest) : Types::DescribeExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeExperimentResponse, "DescribeExperiment")
      end

      # Use this operation to describe a FeatureGroup . The response includes information on the creation
      # time, FeatureGroup name, the unique identifier for each FeatureGroup , and more.
      def describe_feature_group(
        feature_group_name : String,
        next_token : String? = nil
      ) : Types::DescribeFeatureGroupResponse
        input = Types::DescribeFeatureGroupRequest.new(feature_group_name: feature_group_name, next_token: next_token)
        describe_feature_group(input)
      end
      def describe_feature_group(input : Types::DescribeFeatureGroupRequest) : Types::DescribeFeatureGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FEATURE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFeatureGroupResponse, "DescribeFeatureGroup")
      end

      # Shows the metadata for a feature within a feature group.
      def describe_feature_metadata(
        feature_group_name : String,
        feature_name : String
      ) : Types::DescribeFeatureMetadataResponse
        input = Types::DescribeFeatureMetadataRequest.new(feature_group_name: feature_group_name, feature_name: feature_name)
        describe_feature_metadata(input)
      end
      def describe_feature_metadata(input : Types::DescribeFeatureMetadataRequest) : Types::DescribeFeatureMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FEATURE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFeatureMetadataResponse, "DescribeFeatureMetadata")
      end

      # Returns information about the specified flow definition.
      def describe_flow_definition(
        flow_definition_name : String
      ) : Types::DescribeFlowDefinitionResponse
        input = Types::DescribeFlowDefinitionRequest.new(flow_definition_name: flow_definition_name)
        describe_flow_definition(input)
      end
      def describe_flow_definition(input : Types::DescribeFlowDefinitionRequest) : Types::DescribeFlowDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_FLOW_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeFlowDefinitionResponse, "DescribeFlowDefinition")
      end

      # Describes a hub.
      def describe_hub(
        hub_name : String
      ) : Types::DescribeHubResponse
        input = Types::DescribeHubRequest.new(hub_name: hub_name)
        describe_hub(input)
      end
      def describe_hub(input : Types::DescribeHubRequest) : Types::DescribeHubResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HUB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHubResponse, "DescribeHub")
      end

      # Describe the content of a hub.
      def describe_hub_content(
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String,
        hub_content_version : String? = nil
      ) : Types::DescribeHubContentResponse
        input = Types::DescribeHubContentRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name, hub_content_version: hub_content_version)
        describe_hub_content(input)
      end
      def describe_hub_content(input : Types::DescribeHubContentRequest) : Types::DescribeHubContentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HUB_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHubContentResponse, "DescribeHubContent")
      end

      # Returns information about the requested human task user interface (worker task template).
      def describe_human_task_ui(
        human_task_ui_name : String
      ) : Types::DescribeHumanTaskUiResponse
        input = Types::DescribeHumanTaskUiRequest.new(human_task_ui_name: human_task_ui_name)
        describe_human_task_ui(input)
      end
      def describe_human_task_ui(input : Types::DescribeHumanTaskUiRequest) : Types::DescribeHumanTaskUiResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HUMAN_TASK_UI, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHumanTaskUiResponse, "DescribeHumanTaskUi")
      end

      # Returns a description of a hyperparameter tuning job, depending on the fields selected. These fields
      # can include the name, Amazon Resource Name (ARN), job status of your tuning job and more.
      def describe_hyper_parameter_tuning_job(
        hyper_parameter_tuning_job_name : String
      ) : Types::DescribeHyperParameterTuningJobResponse
        input = Types::DescribeHyperParameterTuningJobRequest.new(hyper_parameter_tuning_job_name: hyper_parameter_tuning_job_name)
        describe_hyper_parameter_tuning_job(input)
      end
      def describe_hyper_parameter_tuning_job(input : Types::DescribeHyperParameterTuningJobRequest) : Types::DescribeHyperParameterTuningJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HYPER_PARAMETER_TUNING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHyperParameterTuningJobResponse, "DescribeHyperParameterTuningJob")
      end

      # Describes a SageMaker AI image.
      def describe_image(
        image_name : String
      ) : Types::DescribeImageResponse
        input = Types::DescribeImageRequest.new(image_name: image_name)
        describe_image(input)
      end
      def describe_image(input : Types::DescribeImageRequest) : Types::DescribeImageResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageResponse, "DescribeImage")
      end

      # Describes a version of a SageMaker AI image.
      def describe_image_version(
        image_name : String,
        alias : String? = nil,
        version : Int32? = nil
      ) : Types::DescribeImageVersionResponse
        input = Types::DescribeImageVersionRequest.new(image_name: image_name, alias: alias, version: version)
        describe_image_version(input)
      end
      def describe_image_version(input : Types::DescribeImageVersionRequest) : Types::DescribeImageVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IMAGE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeImageVersionResponse, "DescribeImageVersion")
      end

      # Returns information about an inference component.
      def describe_inference_component(
        inference_component_name : String
      ) : Types::DescribeInferenceComponentOutput
        input = Types::DescribeInferenceComponentInput.new(inference_component_name: inference_component_name)
        describe_inference_component(input)
      end
      def describe_inference_component(input : Types::DescribeInferenceComponentInput) : Types::DescribeInferenceComponentOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INFERENCE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInferenceComponentOutput, "DescribeInferenceComponent")
      end

      # Returns details about an inference experiment.
      def describe_inference_experiment(
        name : String
      ) : Types::DescribeInferenceExperimentResponse
        input = Types::DescribeInferenceExperimentRequest.new(name: name)
        describe_inference_experiment(input)
      end
      def describe_inference_experiment(input : Types::DescribeInferenceExperimentRequest) : Types::DescribeInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInferenceExperimentResponse, "DescribeInferenceExperiment")
      end

      # Provides the results of the Inference Recommender job. One or more recommendation jobs are returned.
      def describe_inference_recommendations_job(
        job_name : String
      ) : Types::DescribeInferenceRecommendationsJobResponse
        input = Types::DescribeInferenceRecommendationsJobRequest.new(job_name: job_name)
        describe_inference_recommendations_job(input)
      end
      def describe_inference_recommendations_job(input : Types::DescribeInferenceRecommendationsJobRequest) : Types::DescribeInferenceRecommendationsJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INFERENCE_RECOMMENDATIONS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInferenceRecommendationsJobResponse, "DescribeInferenceRecommendationsJob")
      end

      # Gets information about a labeling job.
      def describe_labeling_job(
        labeling_job_name : String
      ) : Types::DescribeLabelingJobResponse
        input = Types::DescribeLabelingJobRequest.new(labeling_job_name: labeling_job_name)
        describe_labeling_job(input)
      end
      def describe_labeling_job(input : Types::DescribeLabelingJobRequest) : Types::DescribeLabelingJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LABELING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLabelingJobResponse, "DescribeLabelingJob")
      end

      # Provides a list of properties for the requested lineage group. For more information, see
      # Cross-Account Lineage Tracking in the Amazon SageMaker Developer Guide .
      def describe_lineage_group(
        lineage_group_name : String
      ) : Types::DescribeLineageGroupResponse
        input = Types::DescribeLineageGroupRequest.new(lineage_group_name: lineage_group_name)
        describe_lineage_group(input)
      end
      def describe_lineage_group(input : Types::DescribeLineageGroupRequest) : Types::DescribeLineageGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LINEAGE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLineageGroupResponse, "DescribeLineageGroup")
      end

      # Returns information about an MLflow App.
      def describe_mlflow_app(
        arn : String
      ) : Types::DescribeMlflowAppResponse
        input = Types::DescribeMlflowAppRequest.new(arn: arn)
        describe_mlflow_app(input)
      end
      def describe_mlflow_app(input : Types::DescribeMlflowAppRequest) : Types::DescribeMlflowAppResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MLFLOW_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMlflowAppResponse, "DescribeMlflowApp")
      end

      # Returns information about an MLflow Tracking Server.
      def describe_mlflow_tracking_server(
        tracking_server_name : String
      ) : Types::DescribeMlflowTrackingServerResponse
        input = Types::DescribeMlflowTrackingServerRequest.new(tracking_server_name: tracking_server_name)
        describe_mlflow_tracking_server(input)
      end
      def describe_mlflow_tracking_server(input : Types::DescribeMlflowTrackingServerRequest) : Types::DescribeMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMlflowTrackingServerResponse, "DescribeMlflowTrackingServer")
      end

      # Describes a model that you created using the CreateModel API.
      def describe_model(
        model_name : String
      ) : Types::DescribeModelOutput
        input = Types::DescribeModelInput.new(model_name: model_name)
        describe_model(input)
      end
      def describe_model(input : Types::DescribeModelInput) : Types::DescribeModelOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelOutput, "DescribeModel")
      end

      # Returns a description of a model bias job definition.
      def describe_model_bias_job_definition(
        job_definition_name : String
      ) : Types::DescribeModelBiasJobDefinitionResponse
        input = Types::DescribeModelBiasJobDefinitionRequest.new(job_definition_name: job_definition_name)
        describe_model_bias_job_definition(input)
      end
      def describe_model_bias_job_definition(input : Types::DescribeModelBiasJobDefinitionRequest) : Types::DescribeModelBiasJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_BIAS_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelBiasJobDefinitionResponse, "DescribeModelBiasJobDefinition")
      end

      # Describes the content, creation time, and security configuration of an Amazon SageMaker Model Card.
      def describe_model_card(
        model_card_name : String,
        model_card_version : Int32? = nil
      ) : Types::DescribeModelCardResponse
        input = Types::DescribeModelCardRequest.new(model_card_name: model_card_name, model_card_version: model_card_version)
        describe_model_card(input)
      end
      def describe_model_card(input : Types::DescribeModelCardRequest) : Types::DescribeModelCardResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_CARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelCardResponse, "DescribeModelCard")
      end

      # Describes an Amazon SageMaker Model Card export job.
      def describe_model_card_export_job(
        model_card_export_job_arn : String
      ) : Types::DescribeModelCardExportJobResponse
        input = Types::DescribeModelCardExportJobRequest.new(model_card_export_job_arn: model_card_export_job_arn)
        describe_model_card_export_job(input)
      end
      def describe_model_card_export_job(input : Types::DescribeModelCardExportJobRequest) : Types::DescribeModelCardExportJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_CARD_EXPORT_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelCardExportJobResponse, "DescribeModelCardExportJob")
      end

      # Returns a description of a model explainability job definition.
      def describe_model_explainability_job_definition(
        job_definition_name : String
      ) : Types::DescribeModelExplainabilityJobDefinitionResponse
        input = Types::DescribeModelExplainabilityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        describe_model_explainability_job_definition(input)
      end
      def describe_model_explainability_job_definition(input : Types::DescribeModelExplainabilityJobDefinitionRequest) : Types::DescribeModelExplainabilityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_EXPLAINABILITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelExplainabilityJobDefinitionResponse, "DescribeModelExplainabilityJobDefinition")
      end

      # Returns a description of the specified model package, which is used to create SageMaker models or
      # list them on Amazon Web Services Marketplace. If you provided a KMS Key ID when you created your
      # model package, you will see the KMS Decrypt API call in your CloudTrail logs when you use this API.
      # To create models in SageMaker, buyers can subscribe to model packages listed on Amazon Web Services
      # Marketplace.
      def describe_model_package(
        model_package_name : String
      ) : Types::DescribeModelPackageOutput
        input = Types::DescribeModelPackageInput.new(model_package_name: model_package_name)
        describe_model_package(input)
      end
      def describe_model_package(input : Types::DescribeModelPackageInput) : Types::DescribeModelPackageOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_PACKAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelPackageOutput, "DescribeModelPackage")
      end

      # Gets a description for the specified model group.
      def describe_model_package_group(
        model_package_group_name : String
      ) : Types::DescribeModelPackageGroupOutput
        input = Types::DescribeModelPackageGroupInput.new(model_package_group_name: model_package_group_name)
        describe_model_package_group(input)
      end
      def describe_model_package_group(input : Types::DescribeModelPackageGroupInput) : Types::DescribeModelPackageGroupOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_PACKAGE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelPackageGroupOutput, "DescribeModelPackageGroup")
      end

      # Returns a description of a model quality job definition.
      def describe_model_quality_job_definition(
        job_definition_name : String
      ) : Types::DescribeModelQualityJobDefinitionResponse
        input = Types::DescribeModelQualityJobDefinitionRequest.new(job_definition_name: job_definition_name)
        describe_model_quality_job_definition(input)
      end
      def describe_model_quality_job_definition(input : Types::DescribeModelQualityJobDefinitionRequest) : Types::DescribeModelQualityJobDefinitionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MODEL_QUALITY_JOB_DEFINITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeModelQualityJobDefinitionResponse, "DescribeModelQualityJobDefinition")
      end

      # Describes the schedule for a monitoring job.
      def describe_monitoring_schedule(
        monitoring_schedule_name : String
      ) : Types::DescribeMonitoringScheduleResponse
        input = Types::DescribeMonitoringScheduleRequest.new(monitoring_schedule_name: monitoring_schedule_name)
        describe_monitoring_schedule(input)
      end
      def describe_monitoring_schedule(input : Types::DescribeMonitoringScheduleRequest) : Types::DescribeMonitoringScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMonitoringScheduleResponse, "DescribeMonitoringSchedule")
      end

      # Returns information about a notebook instance.
      def describe_notebook_instance(
        notebook_instance_name : String
      ) : Types::DescribeNotebookInstanceOutput
        input = Types::DescribeNotebookInstanceInput.new(notebook_instance_name: notebook_instance_name)
        describe_notebook_instance(input)
      end
      def describe_notebook_instance(input : Types::DescribeNotebookInstanceInput) : Types::DescribeNotebookInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNotebookInstanceOutput, "DescribeNotebookInstance")
      end

      # Returns a description of a notebook instance lifecycle configuration. For information about notebook
      # instance lifestyle configurations, see Step 2.1: (Optional) Customize a Notebook Instance .
      def describe_notebook_instance_lifecycle_config(
        notebook_instance_lifecycle_config_name : String
      ) : Types::DescribeNotebookInstanceLifecycleConfigOutput
        input = Types::DescribeNotebookInstanceLifecycleConfigInput.new(notebook_instance_lifecycle_config_name: notebook_instance_lifecycle_config_name)
        describe_notebook_instance_lifecycle_config(input)
      end
      def describe_notebook_instance_lifecycle_config(input : Types::DescribeNotebookInstanceLifecycleConfigInput) : Types::DescribeNotebookInstanceLifecycleConfigOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNotebookInstanceLifecycleConfigOutput, "DescribeNotebookInstanceLifecycleConfig")
      end

      # Provides the properties of the specified optimization job.
      def describe_optimization_job(
        optimization_job_name : String
      ) : Types::DescribeOptimizationJobResponse
        input = Types::DescribeOptimizationJobRequest.new(optimization_job_name: optimization_job_name)
        describe_optimization_job(input)
      end
      def describe_optimization_job(input : Types::DescribeOptimizationJobRequest) : Types::DescribeOptimizationJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OPTIMIZATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOptimizationJobResponse, "DescribeOptimizationJob")
      end

      # Gets information about a SageMaker Partner AI App.
      def describe_partner_app(
        arn : String,
        include_available_upgrade : Bool? = nil
      ) : Types::DescribePartnerAppResponse
        input = Types::DescribePartnerAppRequest.new(arn: arn, include_available_upgrade: include_available_upgrade)
        describe_partner_app(input)
      end
      def describe_partner_app(input : Types::DescribePartnerAppRequest) : Types::DescribePartnerAppResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARTNER_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePartnerAppResponse, "DescribePartnerApp")
      end

      # Describes the details of a pipeline.
      def describe_pipeline(
        pipeline_name : String,
        pipeline_version_id : Int64? = nil
      ) : Types::DescribePipelineResponse
        input = Types::DescribePipelineRequest.new(pipeline_name: pipeline_name, pipeline_version_id: pipeline_version_id)
        describe_pipeline(input)
      end
      def describe_pipeline(input : Types::DescribePipelineRequest) : Types::DescribePipelineResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePipelineResponse, "DescribePipeline")
      end

      # Describes the details of an execution's pipeline definition.
      def describe_pipeline_definition_for_execution(
        pipeline_execution_arn : String
      ) : Types::DescribePipelineDefinitionForExecutionResponse
        input = Types::DescribePipelineDefinitionForExecutionRequest.new(pipeline_execution_arn: pipeline_execution_arn)
        describe_pipeline_definition_for_execution(input)
      end
      def describe_pipeline_definition_for_execution(input : Types::DescribePipelineDefinitionForExecutionRequest) : Types::DescribePipelineDefinitionForExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PIPELINE_DEFINITION_FOR_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePipelineDefinitionForExecutionResponse, "DescribePipelineDefinitionForExecution")
      end

      # Describes the details of a pipeline execution.
      def describe_pipeline_execution(
        pipeline_execution_arn : String
      ) : Types::DescribePipelineExecutionResponse
        input = Types::DescribePipelineExecutionRequest.new(pipeline_execution_arn: pipeline_execution_arn)
        describe_pipeline_execution(input)
      end
      def describe_pipeline_execution(input : Types::DescribePipelineExecutionRequest) : Types::DescribePipelineExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePipelineExecutionResponse, "DescribePipelineExecution")
      end

      # Returns a description of a processing job.
      def describe_processing_job(
        processing_job_name : String
      ) : Types::DescribeProcessingJobResponse
        input = Types::DescribeProcessingJobRequest.new(processing_job_name: processing_job_name)
        describe_processing_job(input)
      end
      def describe_processing_job(input : Types::DescribeProcessingJobRequest) : Types::DescribeProcessingJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROCESSING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProcessingJobResponse, "DescribeProcessingJob")
      end

      # Describes the details of a project.
      def describe_project(
        project_name : String
      ) : Types::DescribeProjectOutput
        input = Types::DescribeProjectInput.new(project_name: project_name)
        describe_project(input)
      end
      def describe_project(input : Types::DescribeProjectInput) : Types::DescribeProjectOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProjectOutput, "DescribeProject")
      end

      # Retrieves details about a reserved capacity.
      def describe_reserved_capacity(
        reserved_capacity_arn : String
      ) : Types::DescribeReservedCapacityResponse
        input = Types::DescribeReservedCapacityRequest.new(reserved_capacity_arn: reserved_capacity_arn)
        describe_reserved_capacity(input)
      end
      def describe_reserved_capacity(input : Types::DescribeReservedCapacityRequest) : Types::DescribeReservedCapacityResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESERVED_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReservedCapacityResponse, "DescribeReservedCapacity")
      end

      # Describes the space.
      def describe_space(
        domain_id : String,
        space_name : String
      ) : Types::DescribeSpaceResponse
        input = Types::DescribeSpaceRequest.new(domain_id: domain_id, space_name: space_name)
        describe_space(input)
      end
      def describe_space(input : Types::DescribeSpaceRequest) : Types::DescribeSpaceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSpaceResponse, "DescribeSpace")
      end

      # Describes the Amazon SageMaker AI Studio Lifecycle Configuration.
      def describe_studio_lifecycle_config(
        studio_lifecycle_config_name : String
      ) : Types::DescribeStudioLifecycleConfigResponse
        input = Types::DescribeStudioLifecycleConfigRequest.new(studio_lifecycle_config_name: studio_lifecycle_config_name)
        describe_studio_lifecycle_config(input)
      end
      def describe_studio_lifecycle_config(input : Types::DescribeStudioLifecycleConfigRequest) : Types::DescribeStudioLifecycleConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STUDIO_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStudioLifecycleConfigResponse, "DescribeStudioLifecycleConfig")
      end

      # Gets information about a work team provided by a vendor. It returns details about the subscription
      # with a vendor in the Amazon Web Services Marketplace.
      def describe_subscribed_workteam(
        workteam_arn : String
      ) : Types::DescribeSubscribedWorkteamResponse
        input = Types::DescribeSubscribedWorkteamRequest.new(workteam_arn: workteam_arn)
        describe_subscribed_workteam(input)
      end
      def describe_subscribed_workteam(input : Types::DescribeSubscribedWorkteamRequest) : Types::DescribeSubscribedWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUBSCRIBED_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSubscribedWorkteamResponse, "DescribeSubscribedWorkteam")
      end

      # Returns information about a training job. Some of the attributes below only appear if the training
      # job successfully starts. If the training job fails, TrainingJobStatus is Failed and, depending on
      # the FailureReason , attributes like TrainingStartTime , TrainingTimeInSeconds , TrainingEndTime ,
      # and BillableTimeInSeconds may not be present in the response.
      def describe_training_job(
        training_job_name : String
      ) : Types::DescribeTrainingJobResponse
        input = Types::DescribeTrainingJobRequest.new(training_job_name: training_job_name)
        describe_training_job(input)
      end
      def describe_training_job(input : Types::DescribeTrainingJobRequest) : Types::DescribeTrainingJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRAINING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrainingJobResponse, "DescribeTrainingJob")
      end

      # Retrieves detailed information about a specific training plan.
      def describe_training_plan(
        training_plan_name : String
      ) : Types::DescribeTrainingPlanResponse
        input = Types::DescribeTrainingPlanRequest.new(training_plan_name: training_plan_name)
        describe_training_plan(input)
      end
      def describe_training_plan(input : Types::DescribeTrainingPlanRequest) : Types::DescribeTrainingPlanResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRAINING_PLAN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrainingPlanResponse, "DescribeTrainingPlan")
      end

      # Returns information about a transform job.
      def describe_transform_job(
        transform_job_name : String
      ) : Types::DescribeTransformJobResponse
        input = Types::DescribeTransformJobRequest.new(transform_job_name: transform_job_name)
        describe_transform_job(input)
      end
      def describe_transform_job(input : Types::DescribeTransformJobRequest) : Types::DescribeTransformJobResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRANSFORM_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTransformJobResponse, "DescribeTransformJob")
      end

      # Provides a list of a trial's properties.
      def describe_trial(
        trial_name : String
      ) : Types::DescribeTrialResponse
        input = Types::DescribeTrialRequest.new(trial_name: trial_name)
        describe_trial(input)
      end
      def describe_trial(input : Types::DescribeTrialRequest) : Types::DescribeTrialResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrialResponse, "DescribeTrial")
      end

      # Provides a list of a trials component's properties.
      def describe_trial_component(
        trial_component_name : String
      ) : Types::DescribeTrialComponentResponse
        input = Types::DescribeTrialComponentRequest.new(trial_component_name: trial_component_name)
        describe_trial_component(input)
      end
      def describe_trial_component(input : Types::DescribeTrialComponentRequest) : Types::DescribeTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeTrialComponentResponse, "DescribeTrialComponent")
      end

      # Describes a user profile. For more information, see CreateUserProfile .
      def describe_user_profile(
        domain_id : String,
        user_profile_name : String
      ) : Types::DescribeUserProfileResponse
        input = Types::DescribeUserProfileRequest.new(domain_id: domain_id, user_profile_name: user_profile_name)
        describe_user_profile(input)
      end
      def describe_user_profile(input : Types::DescribeUserProfileRequest) : Types::DescribeUserProfileResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USER_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUserProfileResponse, "DescribeUserProfile")
      end

      # Lists private workforce information, including workforce name, Amazon Resource Name (ARN), and, if
      # applicable, allowed IP address ranges ( CIDRs ). Allowable IP address ranges are the IP addresses
      # that workers can use to access tasks. This operation applies only to private workforces.
      def describe_workforce(
        workforce_name : String
      ) : Types::DescribeWorkforceResponse
        input = Types::DescribeWorkforceRequest.new(workforce_name: workforce_name)
        describe_workforce(input)
      end
      def describe_workforce(input : Types::DescribeWorkforceRequest) : Types::DescribeWorkforceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKFORCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkforceResponse, "DescribeWorkforce")
      end

      # Gets information about a specific work team. You can see information such as the creation date, the
      # last updated date, membership information, and the work team's Amazon Resource Name (ARN).
      def describe_workteam(
        workteam_name : String
      ) : Types::DescribeWorkteamResponse
        input = Types::DescribeWorkteamRequest.new(workteam_name: workteam_name)
        describe_workteam(input)
      end
      def describe_workteam(input : Types::DescribeWorkteamRequest) : Types::DescribeWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeWorkteamResponse, "DescribeWorkteam")
      end

      # Detaches your Amazon Elastic Block Store (Amazon EBS) volume from a node in your EKS orchestrated
      # SageMaker HyperPod cluster. This API works with the Amazon Elastic Block Store (Amazon EBS)
      # Container Storage Interface (CSI) driver to manage the lifecycle of persistent storage in your
      # HyperPod EKS clusters.
      def detach_cluster_node_volume(
        cluster_arn : String,
        node_id : String,
        volume_id : String
      ) : Types::DetachClusterNodeVolumeResponse
        input = Types::DetachClusterNodeVolumeRequest.new(cluster_arn: cluster_arn, node_id: node_id, volume_id: volume_id)
        detach_cluster_node_volume(input)
      end
      def detach_cluster_node_volume(input : Types::DetachClusterNodeVolumeRequest) : Types::DetachClusterNodeVolumeResponse
        request = Protocol::JsonRpc.build_request(Model::DETACH_CLUSTER_NODE_VOLUME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetachClusterNodeVolumeResponse, "DetachClusterNodeVolume")
      end

      # Disables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.
      def disable_sagemaker_servicecatalog_portfolio : Types::DisableSagemakerServicecatalogPortfolioOutput
        input = Types::DisableSagemakerServicecatalogPortfolioInput.new
        disable_sagemaker_servicecatalog_portfolio(input)
      end
      def disable_sagemaker_servicecatalog_portfolio(input : Types::DisableSagemakerServicecatalogPortfolioInput) : Types::DisableSagemakerServicecatalogPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::DISABLE_SAGEMAKER_SERVICECATALOG_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisableSagemakerServicecatalogPortfolioOutput, "DisableSagemakerServicecatalogPortfolio")
      end

      # Disassociates a trial component from a trial. This doesn't effect other trials the component is
      # associated with. Before you can delete a component, you must disassociate the component from all
      # trials it is associated with. To associate a trial component with a trial, call the
      # AssociateTrialComponent API. To get a list of the trials a component is associated with, use the
      # Search API. Specify ExperimentTrialComponent for the Resource parameter. The list appears in the
      # response under Results.TrialComponent.Parents .
      def disassociate_trial_component(
        trial_component_name : String,
        trial_name : String
      ) : Types::DisassociateTrialComponentResponse
        input = Types::DisassociateTrialComponentRequest.new(trial_component_name: trial_component_name, trial_name: trial_name)
        disassociate_trial_component(input)
      end
      def disassociate_trial_component(input : Types::DisassociateTrialComponentRequest) : Types::DisassociateTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateTrialComponentResponse, "DisassociateTrialComponent")
      end

      # Enables using Service Catalog in SageMaker. Service Catalog is used to create SageMaker projects.
      def enable_sagemaker_servicecatalog_portfolio : Types::EnableSagemakerServicecatalogPortfolioOutput
        input = Types::EnableSagemakerServicecatalogPortfolioInput.new
        enable_sagemaker_servicecatalog_portfolio(input)
      end
      def enable_sagemaker_servicecatalog_portfolio(input : Types::EnableSagemakerServicecatalogPortfolioInput) : Types::EnableSagemakerServicecatalogPortfolioOutput
        request = Protocol::JsonRpc.build_request(Model::ENABLE_SAGEMAKER_SERVICECATALOG_PORTFOLIO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EnableSagemakerServicecatalogPortfolioOutput, "EnableSagemakerServicecatalogPortfolio")
      end

      # Describes a fleet.
      def get_device_fleet_report(
        device_fleet_name : String
      ) : Types::GetDeviceFleetReportResponse
        input = Types::GetDeviceFleetReportRequest.new(device_fleet_name: device_fleet_name)
        get_device_fleet_report(input)
      end
      def get_device_fleet_report(input : Types::GetDeviceFleetReportRequest) : Types::GetDeviceFleetReportResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DEVICE_FLEET_REPORT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeviceFleetReportResponse, "GetDeviceFleetReport")
      end

      # The resource policy for the lineage group.
      def get_lineage_group_policy(
        lineage_group_name : String
      ) : Types::GetLineageGroupPolicyResponse
        input = Types::GetLineageGroupPolicyRequest.new(lineage_group_name: lineage_group_name)
        get_lineage_group_policy(input)
      end
      def get_lineage_group_policy(input : Types::GetLineageGroupPolicyRequest) : Types::GetLineageGroupPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LINEAGE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLineageGroupPolicyResponse, "GetLineageGroupPolicy")
      end

      # Gets a resource policy that manages access for a model group. For information about resource
      # policies, see Identity-based policies and resource-based policies in the Amazon Web Services
      # Identity and Access Management User Guide. .
      def get_model_package_group_policy(
        model_package_group_name : String
      ) : Types::GetModelPackageGroupPolicyOutput
        input = Types::GetModelPackageGroupPolicyInput.new(model_package_group_name: model_package_group_name)
        get_model_package_group_policy(input)
      end
      def get_model_package_group_policy(input : Types::GetModelPackageGroupPolicyInput) : Types::GetModelPackageGroupPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_MODEL_PACKAGE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetModelPackageGroupPolicyOutput, "GetModelPackageGroupPolicy")
      end

      # Gets the status of Service Catalog in SageMaker. Service Catalog is used to create SageMaker
      # projects.
      def get_sagemaker_servicecatalog_portfolio_status : Types::GetSagemakerServicecatalogPortfolioStatusOutput
        input = Types::GetSagemakerServicecatalogPortfolioStatusInput.new
        get_sagemaker_servicecatalog_portfolio_status(input)
      end
      def get_sagemaker_servicecatalog_portfolio_status(input : Types::GetSagemakerServicecatalogPortfolioStatusInput) : Types::GetSagemakerServicecatalogPortfolioStatusOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SAGEMAKER_SERVICECATALOG_PORTFOLIO_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSagemakerServicecatalogPortfolioStatusOutput, "GetSagemakerServicecatalogPortfolioStatus")
      end

      # Starts an Amazon SageMaker Inference Recommender autoscaling recommendation job. Returns
      # recommendations for autoscaling policies that you can apply to your SageMaker endpoint.
      def get_scaling_configuration_recommendation(
        inference_recommendations_job_name : String,
        endpoint_name : String? = nil,
        recommendation_id : String? = nil,
        scaling_policy_objective : Types::ScalingPolicyObjective? = nil,
        target_cpu_utilization_per_core : Int32? = nil
      ) : Types::GetScalingConfigurationRecommendationResponse
        input = Types::GetScalingConfigurationRecommendationRequest.new(inference_recommendations_job_name: inference_recommendations_job_name, endpoint_name: endpoint_name, recommendation_id: recommendation_id, scaling_policy_objective: scaling_policy_objective, target_cpu_utilization_per_core: target_cpu_utilization_per_core)
        get_scaling_configuration_recommendation(input)
      end
      def get_scaling_configuration_recommendation(input : Types::GetScalingConfigurationRecommendationRequest) : Types::GetScalingConfigurationRecommendationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SCALING_CONFIGURATION_RECOMMENDATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetScalingConfigurationRecommendationResponse, "GetScalingConfigurationRecommendation")
      end

      # An auto-complete API for the search functionality in the SageMaker console. It returns suggestions
      # of possible matches for the property name to use in Search queries. Provides suggestions for
      # HyperParameters , Tags , and Metrics .
      def get_search_suggestions(
        resource : String,
        suggestion_query : Types::SuggestionQuery? = nil
      ) : Types::GetSearchSuggestionsResponse
        input = Types::GetSearchSuggestionsRequest.new(resource: resource, suggestion_query: suggestion_query)
        get_search_suggestions(input)
      end
      def get_search_suggestions(input : Types::GetSearchSuggestionsRequest) : Types::GetSearchSuggestionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SEARCH_SUGGESTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSearchSuggestionsResponse, "GetSearchSuggestions")
      end

      # Import hub content.
      def import_hub_content(
        document_schema_version : String,
        hub_content_document : String,
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String,
        hub_content_description : String? = nil,
        hub_content_display_name : String? = nil,
        hub_content_markdown : String? = nil,
        hub_content_search_keywords : Array(String)? = nil,
        hub_content_version : String? = nil,
        support_status : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::ImportHubContentResponse
        input = Types::ImportHubContentRequest.new(document_schema_version: document_schema_version, hub_content_document: hub_content_document, hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name, hub_content_description: hub_content_description, hub_content_display_name: hub_content_display_name, hub_content_markdown: hub_content_markdown, hub_content_search_keywords: hub_content_search_keywords, hub_content_version: hub_content_version, support_status: support_status, tags: tags)
        import_hub_content(input)
      end
      def import_hub_content(input : Types::ImportHubContentRequest) : Types::ImportHubContentResponse
        request = Protocol::JsonRpc.build_request(Model::IMPORT_HUB_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ImportHubContentResponse, "ImportHubContent")
      end

      # Lists the actions in your account and their properties.
      def list_actions(
        action_type : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_uri : String? = nil
      ) : Types::ListActionsResponse
        input = Types::ListActionsRequest.new(action_type: action_type, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_uri: source_uri)
        list_actions(input)
      end
      def list_actions(input : Types::ListActionsRequest) : Types::ListActionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListActionsResponse, "ListActions")
      end

      # Lists the machine learning algorithms that have been created.
      def list_algorithms(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListAlgorithmsOutput
        input = Types::ListAlgorithmsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_algorithms(input)
      end
      def list_algorithms(input : Types::ListAlgorithmsInput) : Types::ListAlgorithmsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ALGORITHMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAlgorithmsOutput, "ListAlgorithms")
      end

      # Lists the aliases of a specified image or image version.
      def list_aliases(
        image_name : String,
        alias : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        version : Int32? = nil
      ) : Types::ListAliasesResponse
        input = Types::ListAliasesRequest.new(image_name: image_name, alias: alias, max_results: max_results, next_token: next_token, version: version)
        list_aliases(input)
      end
      def list_aliases(input : Types::ListAliasesRequest) : Types::ListAliasesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ALIASES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAliasesResponse, "ListAliases")
      end

      # Lists the AppImageConfigs in your account and their properties. The list can be filtered by creation
      # time or modified time, and whether the AppImageConfig name contains a specified string.
      def list_app_image_configs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        modified_time_after : Time? = nil,
        modified_time_before : Time? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListAppImageConfigsResponse
        input = Types::ListAppImageConfigsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, modified_time_after: modified_time_after, modified_time_before: modified_time_before, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_app_image_configs(input)
      end
      def list_app_image_configs(input : Types::ListAppImageConfigsRequest) : Types::ListAppImageConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APP_IMAGE_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAppImageConfigsResponse, "ListAppImageConfigs")
      end

      # Lists apps.
      def list_apps(
        domain_id_equals : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        space_name_equals : String? = nil,
        user_profile_name_equals : String? = nil
      ) : Types::ListAppsResponse
        input = Types::ListAppsRequest.new(domain_id_equals: domain_id_equals, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, space_name_equals: space_name_equals, user_profile_name_equals: user_profile_name_equals)
        list_apps(input)
      end
      def list_apps(input : Types::ListAppsRequest) : Types::ListAppsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_APPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAppsResponse, "ListApps")
      end

      # Lists the artifacts in your account and their properties.
      def list_artifacts(
        artifact_type : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_uri : String? = nil
      ) : Types::ListArtifactsResponse
        input = Types::ListArtifactsRequest.new(artifact_type: artifact_type, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_uri: source_uri)
        list_artifacts(input)
      end
      def list_artifacts(input : Types::ListArtifactsRequest) : Types::ListArtifactsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ARTIFACTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListArtifactsResponse, "ListArtifacts")
      end

      # Lists the associations in your account and their properties.
      def list_associations(
        association_type : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        destination_arn : String? = nil,
        destination_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_arn : String? = nil,
        source_type : String? = nil
      ) : Types::ListAssociationsResponse
        input = Types::ListAssociationsRequest.new(association_type: association_type, created_after: created_after, created_before: created_before, destination_arn: destination_arn, destination_type: destination_type, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_arn: source_arn, source_type: source_type)
        list_associations(input)
      end
      def list_associations(input : Types::ListAssociationsRequest) : Types::ListAssociationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociationsResponse, "ListAssociations")
      end

      # Request a list of jobs.
      def list_auto_ml_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListAutoMLJobsResponse
        input = Types::ListAutoMLJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_auto_ml_jobs(input)
      end
      def list_auto_ml_jobs(input : Types::ListAutoMLJobsRequest) : Types::ListAutoMLJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AUTO_ML_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAutoMLJobsResponse, "ListAutoMLJobs")
      end

      # List the candidates created for the job.
      def list_candidates_for_auto_ml_job(
        auto_ml_job_name : String,
        candidate_name_equals : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListCandidatesForAutoMLJobResponse
        input = Types::ListCandidatesForAutoMLJobRequest.new(auto_ml_job_name: auto_ml_job_name, candidate_name_equals: candidate_name_equals, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_candidates_for_auto_ml_job(input)
      end
      def list_candidates_for_auto_ml_job(input : Types::ListCandidatesForAutoMLJobRequest) : Types::ListCandidatesForAutoMLJobResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CANDIDATES_FOR_AUTO_ML_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCandidatesForAutoMLJobResponse, "ListCandidatesForAutoMLJob")
      end

      # Retrieves a list of event summaries for a specified HyperPod cluster. The operation supports
      # filtering, sorting, and pagination of results. This functionality is only supported when the
      # NodeProvisioningMode is set to Continuous .
      def list_cluster_events(
        cluster_name : String,
        event_time_after : Time? = nil,
        event_time_before : Time? = nil,
        instance_group_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        node_id : String? = nil,
        resource_type : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListClusterEventsResponse
        input = Types::ListClusterEventsRequest.new(cluster_name: cluster_name, event_time_after: event_time_after, event_time_before: event_time_before, instance_group_name: instance_group_name, max_results: max_results, next_token: next_token, node_id: node_id, resource_type: resource_type, sort_by: sort_by, sort_order: sort_order)
        list_cluster_events(input)
      end
      def list_cluster_events(input : Types::ListClusterEventsRequest) : Types::ListClusterEventsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTER_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClusterEventsResponse, "ListClusterEvents")
      end

      # Retrieves the list of instances (also called nodes interchangeably) in a SageMaker HyperPod cluster.
      def list_cluster_nodes(
        cluster_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        include_node_logical_ids : Bool? = nil,
        instance_group_name_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListClusterNodesResponse
        input = Types::ListClusterNodesRequest.new(cluster_name: cluster_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, include_node_logical_ids: include_node_logical_ids, instance_group_name_contains: instance_group_name_contains, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_cluster_nodes(input)
      end
      def list_cluster_nodes(input : Types::ListClusterNodesRequest) : Types::ListClusterNodesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTER_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClusterNodesResponse, "ListClusterNodes")
      end

      # List the cluster policy configurations.
      def list_cluster_scheduler_configs(
        cluster_arn : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : String? = nil
      ) : Types::ListClusterSchedulerConfigsResponse
        input = Types::ListClusterSchedulerConfigsRequest.new(cluster_arn: cluster_arn, created_after: created_after, created_before: created_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status: status)
        list_cluster_scheduler_configs(input)
      end
      def list_cluster_scheduler_configs(input : Types::ListClusterSchedulerConfigsRequest) : Types::ListClusterSchedulerConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTER_SCHEDULER_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClusterSchedulerConfigsResponse, "ListClusterSchedulerConfigs")
      end

      # Retrieves the list of SageMaker HyperPod clusters.
      def list_clusters(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        training_plan_arn : String? = nil
      ) : Types::ListClustersResponse
        input = Types::ListClustersRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, training_plan_arn: training_plan_arn)
        list_clusters(input)
      end
      def list_clusters(input : Types::ListClustersRequest) : Types::ListClustersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClustersResponse, "ListClusters")
      end

      # Gets a list of the Git repositories in your account.
      def list_code_repositories(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListCodeRepositoriesOutput
        input = Types::ListCodeRepositoriesInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_code_repositories(input)
      end
      def list_code_repositories(input : Types::ListCodeRepositoriesInput) : Types::ListCodeRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_CODE_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCodeRepositoriesOutput, "ListCodeRepositories")
      end

      # Lists model compilation jobs that satisfy various filters. To create a model compilation job, use
      # CreateCompilationJob . To get information about a particular model compilation job you have created,
      # use DescribeCompilationJob .
      def list_compilation_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListCompilationJobsResponse
        input = Types::ListCompilationJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_compilation_jobs(input)
      end
      def list_compilation_jobs(input : Types::ListCompilationJobsRequest) : Types::ListCompilationJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPILATION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCompilationJobsResponse, "ListCompilationJobs")
      end

      # List the resource allocation definitions.
      def list_compute_quotas(
        cluster_arn : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : String? = nil
      ) : Types::ListComputeQuotasResponse
        input = Types::ListComputeQuotasRequest.new(cluster_arn: cluster_arn, created_after: created_after, created_before: created_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status: status)
        list_compute_quotas(input)
      end
      def list_compute_quotas(input : Types::ListComputeQuotasRequest) : Types::ListComputeQuotasResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPUTE_QUOTAS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComputeQuotasResponse, "ListComputeQuotas")
      end

      # Lists the contexts in your account and their properties.
      def list_contexts(
        context_type : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_uri : String? = nil
      ) : Types::ListContextsResponse
        input = Types::ListContextsRequest.new(context_type: context_type, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_uri: source_uri)
        list_contexts(input)
      end
      def list_contexts(input : Types::ListContextsRequest) : Types::ListContextsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONTEXTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListContextsResponse, "ListContexts")
      end

      # Lists the data quality job definitions in your account.
      def list_data_quality_job_definitions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListDataQualityJobDefinitionsResponse
        input = Types::ListDataQualityJobDefinitionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_data_quality_job_definitions(input)
      end
      def list_data_quality_job_definitions(input : Types::ListDataQualityJobDefinitionsRequest) : Types::ListDataQualityJobDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATA_QUALITY_JOB_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDataQualityJobDefinitionsResponse, "ListDataQualityJobDefinitions")
      end

      # Returns a list of devices in the fleet.
      def list_device_fleets(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListDeviceFleetsResponse
        input = Types::ListDeviceFleetsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_device_fleets(input)
      end
      def list_device_fleets(input : Types::ListDeviceFleetsRequest) : Types::ListDeviceFleetsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICE_FLEETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDeviceFleetsResponse, "ListDeviceFleets")
      end

      # A list of devices.
      def list_devices(
        device_fleet_name : String? = nil,
        latest_heartbeat_after : Time? = nil,
        max_results : Int32? = nil,
        model_name : String? = nil,
        next_token : String? = nil
      ) : Types::ListDevicesResponse
        input = Types::ListDevicesRequest.new(device_fleet_name: device_fleet_name, latest_heartbeat_after: latest_heartbeat_after, max_results: max_results, model_name: model_name, next_token: next_token)
        list_devices(input)
      end
      def list_devices(input : Types::ListDevicesRequest) : Types::ListDevicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDevicesResponse, "ListDevices")
      end

      # Lists the domains.
      def list_domains(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDomainsResponse
        input = Types::ListDomainsRequest.new(max_results: max_results, next_token: next_token)
        list_domains(input)
      end
      def list_domains(input : Types::ListDomainsRequest) : Types::ListDomainsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOMAINS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDomainsResponse, "ListDomains")
      end

      # Lists all edge deployment plans.
      def list_edge_deployment_plans(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        device_fleet_name_contains : String? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListEdgeDeploymentPlansResponse
        input = Types::ListEdgeDeploymentPlansRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, device_fleet_name_contains: device_fleet_name_contains, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_edge_deployment_plans(input)
      end
      def list_edge_deployment_plans(input : Types::ListEdgeDeploymentPlansRequest) : Types::ListEdgeDeploymentPlansResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EDGE_DEPLOYMENT_PLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEdgeDeploymentPlansResponse, "ListEdgeDeploymentPlans")
      end

      # Returns a list of edge packaging jobs.
      def list_edge_packaging_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_name_contains : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListEdgePackagingJobsResponse
        input = Types::ListEdgePackagingJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, model_name_contains: model_name_contains, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_edge_packaging_jobs(input)
      end
      def list_edge_packaging_jobs(input : Types::ListEdgePackagingJobsRequest) : Types::ListEdgePackagingJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EDGE_PACKAGING_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEdgePackagingJobsResponse, "ListEdgePackagingJobs")
      end

      # Lists endpoint configurations.
      def list_endpoint_configs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListEndpointConfigsOutput
        input = Types::ListEndpointConfigsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_endpoint_configs(input)
      end
      def list_endpoint_configs(input : Types::ListEndpointConfigsInput) : Types::ListEndpointConfigsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENDPOINT_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEndpointConfigsOutput, "ListEndpointConfigs")
      end

      # Lists endpoints.
      def list_endpoints(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListEndpointsOutput
        input = Types::ListEndpointsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_endpoints(input)
      end
      def list_endpoints(input : Types::ListEndpointsInput) : Types::ListEndpointsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListEndpointsOutput, "ListEndpoints")
      end

      # Lists all the experiments in your account. The list can be filtered to show only experiments that
      # were created in a specific time range. The list can be sorted by experiment name or creation time.
      def list_experiments(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListExperimentsResponse
        input = Types::ListExperimentsRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_experiments(input)
      end
      def list_experiments(input : Types::ListExperimentsRequest) : Types::ListExperimentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_EXPERIMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListExperimentsResponse, "ListExperiments")
      end

      # List FeatureGroup s based on given filter and order.
      def list_feature_groups(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        feature_group_status_equals : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        offline_store_status_equals : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListFeatureGroupsResponse
        input = Types::ListFeatureGroupsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, feature_group_status_equals: feature_group_status_equals, max_results: max_results, name_contains: name_contains, next_token: next_token, offline_store_status_equals: offline_store_status_equals, sort_by: sort_by, sort_order: sort_order)
        list_feature_groups(input)
      end
      def list_feature_groups(input : Types::ListFeatureGroupsRequest) : Types::ListFeatureGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FEATURE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFeatureGroupsResponse, "ListFeatureGroups")
      end

      # Returns information about the flow definitions in your account.
      def list_flow_definitions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListFlowDefinitionsResponse
        input = Types::ListFlowDefinitionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_flow_definitions(input)
      end
      def list_flow_definitions(input : Types::ListFlowDefinitionsRequest) : Types::ListFlowDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLOW_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlowDefinitionsResponse, "ListFlowDefinitions")
      end

      # List hub content versions.
      def list_hub_content_versions(
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        max_schema_version : String? = nil,
        min_version : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListHubContentVersionsResponse
        input = Types::ListHubContentVersionsRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, max_schema_version: max_schema_version, min_version: min_version, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_hub_content_versions(input)
      end
      def list_hub_content_versions(input : Types::ListHubContentVersionsRequest) : Types::ListHubContentVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HUB_CONTENT_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHubContentVersionsResponse, "ListHubContentVersions")
      end

      # List the contents of a hub.
      def list_hub_contents(
        hub_content_type : String,
        hub_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        max_schema_version : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListHubContentsResponse
        input = Types::ListHubContentsRequest.new(hub_content_type: hub_content_type, hub_name: hub_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, max_schema_version: max_schema_version, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_hub_contents(input)
      end
      def list_hub_contents(input : Types::ListHubContentsRequest) : Types::ListHubContentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HUB_CONTENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHubContentsResponse, "ListHubContents")
      end

      # List all existing hubs.
      def list_hubs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListHubsResponse
        input = Types::ListHubsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_hubs(input)
      end
      def list_hubs(input : Types::ListHubsRequest) : Types::ListHubsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HUBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHubsResponse, "ListHubs")
      end

      # Returns information about the human task user interfaces in your account.
      def list_human_task_uis(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListHumanTaskUisResponse
        input = Types::ListHumanTaskUisRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_human_task_uis(input)
      end
      def list_human_task_uis(input : Types::ListHumanTaskUisRequest) : Types::ListHumanTaskUisResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HUMAN_TASK_UIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHumanTaskUisResponse, "ListHumanTaskUis")
      end

      # Gets a list of HyperParameterTuningJobSummary objects that describe the hyperparameter tuning jobs
      # launched in your account.
      def list_hyper_parameter_tuning_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListHyperParameterTuningJobsResponse
        input = Types::ListHyperParameterTuningJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_hyper_parameter_tuning_jobs(input)
      end
      def list_hyper_parameter_tuning_jobs(input : Types::ListHyperParameterTuningJobsRequest) : Types::ListHyperParameterTuningJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HYPER_PARAMETER_TUNING_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHyperParameterTuningJobsResponse, "ListHyperParameterTuningJobs")
      end

      # Lists the versions of a specified image and their properties. The list can be filtered by creation
      # time or modified time.
      def list_image_versions(
        image_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListImageVersionsResponse
        input = Types::ListImageVersionsRequest.new(image_name: image_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_image_versions(input)
      end
      def list_image_versions(input : Types::ListImageVersionsRequest) : Types::ListImageVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMAGE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImageVersionsResponse, "ListImageVersions")
      end

      # Lists the images in your account and their properties. The list can be filtered by creation time or
      # modified time, and whether the image name contains a specified string.
      def list_images(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListImagesResponse
        input = Types::ListImagesRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_images(input)
      end
      def list_images(input : Types::ListImagesRequest) : Types::ListImagesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IMAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListImagesResponse, "ListImages")
      end

      # Lists the inference components in your account and their properties.
      def list_inference_components(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name_equals : String? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil,
        variant_name_equals : String? = nil
      ) : Types::ListInferenceComponentsOutput
        input = Types::ListInferenceComponentsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name_equals: endpoint_name_equals, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals, variant_name_equals: variant_name_equals)
        list_inference_components(input)
      end
      def list_inference_components(input : Types::ListInferenceComponentsInput) : Types::ListInferenceComponentsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_COMPONENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceComponentsOutput, "ListInferenceComponents")
      end

      # Returns the list of all inference experiments.
      def list_inference_experiments(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil,
        type : String? = nil
      ) : Types::ListInferenceExperimentsResponse
        input = Types::ListInferenceExperimentsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals, type: type)
        list_inference_experiments(input)
      end
      def list_inference_experiments(input : Types::ListInferenceExperimentsRequest) : Types::ListInferenceExperimentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_EXPERIMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceExperimentsResponse, "ListInferenceExperiments")
      end

      # Returns a list of the subtasks for an Inference Recommender job. The supported subtasks are
      # benchmarks, which evaluate the performance of your model on different instance types.
      def list_inference_recommendations_job_steps(
        job_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        step_type : String? = nil
      ) : Types::ListInferenceRecommendationsJobStepsResponse
        input = Types::ListInferenceRecommendationsJobStepsRequest.new(job_name: job_name, max_results: max_results, next_token: next_token, status: status, step_type: step_type)
        list_inference_recommendations_job_steps(input)
      end
      def list_inference_recommendations_job_steps(input : Types::ListInferenceRecommendationsJobStepsRequest) : Types::ListInferenceRecommendationsJobStepsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_RECOMMENDATIONS_JOB_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceRecommendationsJobStepsResponse, "ListInferenceRecommendationsJobSteps")
      end

      # Lists recommendation jobs that satisfy various filters.
      def list_inference_recommendations_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_name_equals : String? = nil,
        model_package_version_arn_equals : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListInferenceRecommendationsJobsResponse
        input = Types::ListInferenceRecommendationsJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, model_name_equals: model_name_equals, model_package_version_arn_equals: model_package_version_arn_equals, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_inference_recommendations_jobs(input)
      end
      def list_inference_recommendations_jobs(input : Types::ListInferenceRecommendationsJobsRequest) : Types::ListInferenceRecommendationsJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_INFERENCE_RECOMMENDATIONS_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInferenceRecommendationsJobsResponse, "ListInferenceRecommendationsJobs")
      end

      # Gets a list of labeling jobs.
      def list_labeling_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListLabelingJobsResponse
        input = Types::ListLabelingJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_labeling_jobs(input)
      end
      def list_labeling_jobs(input : Types::ListLabelingJobsRequest) : Types::ListLabelingJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LABELING_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLabelingJobsResponse, "ListLabelingJobs")
      end

      # Gets a list of labeling jobs assigned to a specified work team.
      def list_labeling_jobs_for_workteam(
        workteam_arn : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        job_reference_code_contains : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListLabelingJobsForWorkteamResponse
        input = Types::ListLabelingJobsForWorkteamRequest.new(workteam_arn: workteam_arn, creation_time_after: creation_time_after, creation_time_before: creation_time_before, job_reference_code_contains: job_reference_code_contains, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_labeling_jobs_for_workteam(input)
      end
      def list_labeling_jobs_for_workteam(input : Types::ListLabelingJobsForWorkteamRequest) : Types::ListLabelingJobsForWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LABELING_JOBS_FOR_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLabelingJobsForWorkteamResponse, "ListLabelingJobsForWorkteam")
      end

      # A list of lineage groups shared with your Amazon Web Services account. For more information, see
      # Cross-Account Lineage Tracking in the Amazon SageMaker Developer Guide .
      def list_lineage_groups(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListLineageGroupsResponse
        input = Types::ListLineageGroupsRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_lineage_groups(input)
      end
      def list_lineage_groups(input : Types::ListLineageGroupsRequest) : Types::ListLineageGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LINEAGE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLineageGroupsResponse, "ListLineageGroups")
      end

      # Lists all MLflow Apps
      def list_mlflow_apps(
        account_default_status : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        default_for_domain_id : String? = nil,
        max_results : Int32? = nil,
        mlflow_version : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status : String? = nil
      ) : Types::ListMlflowAppsResponse
        input = Types::ListMlflowAppsRequest.new(account_default_status: account_default_status, created_after: created_after, created_before: created_before, default_for_domain_id: default_for_domain_id, max_results: max_results, mlflow_version: mlflow_version, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status: status)
        list_mlflow_apps(input)
      end
      def list_mlflow_apps(input : Types::ListMlflowAppsRequest) : Types::ListMlflowAppsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MLFLOW_APPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMlflowAppsResponse, "ListMlflowApps")
      end

      # Lists all MLflow Tracking Servers.
      def list_mlflow_tracking_servers(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        mlflow_version : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        tracking_server_status : String? = nil
      ) : Types::ListMlflowTrackingServersResponse
        input = Types::ListMlflowTrackingServersRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, mlflow_version: mlflow_version, next_token: next_token, sort_by: sort_by, sort_order: sort_order, tracking_server_status: tracking_server_status)
        list_mlflow_tracking_servers(input)
      end
      def list_mlflow_tracking_servers(input : Types::ListMlflowTrackingServersRequest) : Types::ListMlflowTrackingServersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MLFLOW_TRACKING_SERVERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMlflowTrackingServersResponse, "ListMlflowTrackingServers")
      end

      # Lists model bias jobs definitions that satisfy various filters.
      def list_model_bias_job_definitions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelBiasJobDefinitionsResponse
        input = Types::ListModelBiasJobDefinitionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_bias_job_definitions(input)
      end
      def list_model_bias_job_definitions(input : Types::ListModelBiasJobDefinitionsRequest) : Types::ListModelBiasJobDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_BIAS_JOB_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelBiasJobDefinitionsResponse, "ListModelBiasJobDefinitions")
      end

      # List the export jobs for the Amazon SageMaker Model Card.
      def list_model_card_export_jobs(
        model_card_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_card_export_job_name_contains : String? = nil,
        model_card_version : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListModelCardExportJobsResponse
        input = Types::ListModelCardExportJobsRequest.new(model_card_name: model_card_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, model_card_export_job_name_contains: model_card_export_job_name_contains, model_card_version: model_card_version, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_model_card_export_jobs(input)
      end
      def list_model_card_export_jobs(input : Types::ListModelCardExportJobsRequest) : Types::ListModelCardExportJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_CARD_EXPORT_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelCardExportJobsResponse, "ListModelCardExportJobs")
      end

      # List existing versions of an Amazon SageMaker Model Card.
      def list_model_card_versions(
        model_card_name : String,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_card_status : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelCardVersionsResponse
        input = Types::ListModelCardVersionsRequest.new(model_card_name: model_card_name, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, model_card_status: model_card_status, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_card_versions(input)
      end
      def list_model_card_versions(input : Types::ListModelCardVersionsRequest) : Types::ListModelCardVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_CARD_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelCardVersionsResponse, "ListModelCardVersions")
      end

      # List existing model cards.
      def list_model_cards(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_card_status : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelCardsResponse
        input = Types::ListModelCardsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, model_card_status: model_card_status, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_cards(input)
      end
      def list_model_cards(input : Types::ListModelCardsRequest) : Types::ListModelCardsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_CARDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelCardsResponse, "ListModelCards")
      end

      # Lists model explainability job definitions that satisfy various filters.
      def list_model_explainability_job_definitions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelExplainabilityJobDefinitionsResponse
        input = Types::ListModelExplainabilityJobDefinitionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_explainability_job_definitions(input)
      end
      def list_model_explainability_job_definitions(input : Types::ListModelExplainabilityJobDefinitionsRequest) : Types::ListModelExplainabilityJobDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_EXPLAINABILITY_JOB_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelExplainabilityJobDefinitionsResponse, "ListModelExplainabilityJobDefinitions")
      end

      # Lists the domain, framework, task, and model name of standard machine learning models found in
      # common model zoos.
      def list_model_metadata(
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_expression : Types::ModelMetadataSearchExpression? = nil
      ) : Types::ListModelMetadataResponse
        input = Types::ListModelMetadataRequest.new(max_results: max_results, next_token: next_token, search_expression: search_expression)
        list_model_metadata(input)
      end
      def list_model_metadata(input : Types::ListModelMetadataRequest) : Types::ListModelMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelMetadataResponse, "ListModelMetadata")
      end

      # Gets a list of the model groups in your Amazon Web Services account.
      def list_model_package_groups(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        cross_account_filter_option : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelPackageGroupsOutput
        input = Types::ListModelPackageGroupsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, cross_account_filter_option: cross_account_filter_option, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_package_groups(input)
      end
      def list_model_package_groups(input : Types::ListModelPackageGroupsInput) : Types::ListModelPackageGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_PACKAGE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelPackageGroupsOutput, "ListModelPackageGroups")
      end

      # Lists the model packages that have been created.
      def list_model_packages(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        model_approval_status : String? = nil,
        model_package_group_name : String? = nil,
        model_package_type : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelPackagesOutput
        input = Types::ListModelPackagesInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, model_approval_status: model_approval_status, model_package_group_name: model_package_group_name, model_package_type: model_package_type, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_packages(input)
      end
      def list_model_packages(input : Types::ListModelPackagesInput) : Types::ListModelPackagesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_PACKAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelPackagesOutput, "ListModelPackages")
      end

      # Gets a list of model quality monitoring job definitions in your account.
      def list_model_quality_job_definitions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelQualityJobDefinitionsResponse
        input = Types::ListModelQualityJobDefinitionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_model_quality_job_definitions(input)
      end
      def list_model_quality_job_definitions(input : Types::ListModelQualityJobDefinitionsRequest) : Types::ListModelQualityJobDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MODEL_QUALITY_JOB_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelQualityJobDefinitionsResponse, "ListModelQualityJobDefinitions")
      end

      # Lists models created with the CreateModel API.
      def list_models(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListModelsOutput
        input = Types::ListModelsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_models(input)
      end
      def list_models(input : Types::ListModelsInput) : Types::ListModelsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_MODELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListModelsOutput, "ListModels")
      end

      # Gets a list of past alerts in a model monitoring schedule.
      def list_monitoring_alert_history(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        monitoring_alert_name : String? = nil,
        monitoring_schedule_name : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListMonitoringAlertHistoryResponse
        input = Types::ListMonitoringAlertHistoryRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, monitoring_alert_name: monitoring_alert_name, monitoring_schedule_name: monitoring_schedule_name, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_monitoring_alert_history(input)
      end
      def list_monitoring_alert_history(input : Types::ListMonitoringAlertHistoryRequest) : Types::ListMonitoringAlertHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITORING_ALERT_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitoringAlertHistoryResponse, "ListMonitoringAlertHistory")
      end

      # Gets the alerts for a single monitoring schedule.
      def list_monitoring_alerts(
        monitoring_schedule_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMonitoringAlertsResponse
        input = Types::ListMonitoringAlertsRequest.new(monitoring_schedule_name: monitoring_schedule_name, max_results: max_results, next_token: next_token)
        list_monitoring_alerts(input)
      end
      def list_monitoring_alerts(input : Types::ListMonitoringAlertsRequest) : Types::ListMonitoringAlertsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITORING_ALERTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitoringAlertsResponse, "ListMonitoringAlerts")
      end

      # Returns list of all monitoring job executions.
      def list_monitoring_executions(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        monitoring_job_definition_name : String? = nil,
        monitoring_schedule_name : String? = nil,
        monitoring_type_equals : String? = nil,
        next_token : String? = nil,
        scheduled_time_after : Time? = nil,
        scheduled_time_before : Time? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListMonitoringExecutionsResponse
        input = Types::ListMonitoringExecutionsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, monitoring_job_definition_name: monitoring_job_definition_name, monitoring_schedule_name: monitoring_schedule_name, monitoring_type_equals: monitoring_type_equals, next_token: next_token, scheduled_time_after: scheduled_time_after, scheduled_time_before: scheduled_time_before, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_monitoring_executions(input)
      end
      def list_monitoring_executions(input : Types::ListMonitoringExecutionsRequest) : Types::ListMonitoringExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITORING_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitoringExecutionsResponse, "ListMonitoringExecutions")
      end

      # Returns list of all monitoring schedules.
      def list_monitoring_schedules(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        endpoint_name : String? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        monitoring_job_definition_name : String? = nil,
        monitoring_type_equals : String? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListMonitoringSchedulesResponse
        input = Types::ListMonitoringSchedulesRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, endpoint_name: endpoint_name, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, monitoring_job_definition_name: monitoring_job_definition_name, monitoring_type_equals: monitoring_type_equals, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_monitoring_schedules(input)
      end
      def list_monitoring_schedules(input : Types::ListMonitoringSchedulesRequest) : Types::ListMonitoringSchedulesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MONITORING_SCHEDULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMonitoringSchedulesResponse, "ListMonitoringSchedules")
      end

      # Lists notebook instance lifestyle configurations created with the
      # CreateNotebookInstanceLifecycleConfig API.
      def list_notebook_instance_lifecycle_configs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListNotebookInstanceLifecycleConfigsOutput
        input = Types::ListNotebookInstanceLifecycleConfigsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_notebook_instance_lifecycle_configs(input)
      end
      def list_notebook_instance_lifecycle_configs(input : Types::ListNotebookInstanceLifecycleConfigsInput) : Types::ListNotebookInstanceLifecycleConfigsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNotebookInstanceLifecycleConfigsOutput, "ListNotebookInstanceLifecycleConfigs")
      end

      # Returns a list of the SageMaker AI notebook instances in the requester's account in an Amazon Web
      # Services Region.
      def list_notebook_instances(
        additional_code_repository_equals : String? = nil,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        default_code_repository_contains : String? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        notebook_instance_lifecycle_config_name_contains : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListNotebookInstancesOutput
        input = Types::ListNotebookInstancesInput.new(additional_code_repository_equals: additional_code_repository_equals, creation_time_after: creation_time_after, creation_time_before: creation_time_before, default_code_repository_contains: default_code_repository_contains, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, notebook_instance_lifecycle_config_name_contains: notebook_instance_lifecycle_config_name_contains, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_notebook_instances(input)
      end
      def list_notebook_instances(input : Types::ListNotebookInstancesInput) : Types::ListNotebookInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_NOTEBOOK_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNotebookInstancesOutput, "ListNotebookInstances")
      end

      # Lists the optimization jobs in your account and their properties.
      def list_optimization_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        optimization_contains : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListOptimizationJobsResponse
        input = Types::ListOptimizationJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, optimization_contains: optimization_contains, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_optimization_jobs(input)
      end
      def list_optimization_jobs(input : Types::ListOptimizationJobsRequest) : Types::ListOptimizationJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPTIMIZATION_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOptimizationJobsResponse, "ListOptimizationJobs")
      end

      # Lists all of the SageMaker Partner AI Apps in an account.
      def list_partner_apps(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPartnerAppsResponse
        input = Types::ListPartnerAppsRequest.new(max_results: max_results, next_token: next_token)
        list_partner_apps(input)
      end
      def list_partner_apps(input : Types::ListPartnerAppsRequest) : Types::ListPartnerAppsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARTNER_APPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPartnerAppsResponse, "ListPartnerApps")
      end

      # Gets a list of PipeLineExecutionStep objects.
      def list_pipeline_execution_steps(
        max_results : Int32? = nil,
        next_token : String? = nil,
        pipeline_execution_arn : String? = nil,
        sort_order : String? = nil
      ) : Types::ListPipelineExecutionStepsResponse
        input = Types::ListPipelineExecutionStepsRequest.new(max_results: max_results, next_token: next_token, pipeline_execution_arn: pipeline_execution_arn, sort_order: sort_order)
        list_pipeline_execution_steps(input)
      end
      def list_pipeline_execution_steps(input : Types::ListPipelineExecutionStepsRequest) : Types::ListPipelineExecutionStepsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINE_EXECUTION_STEPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelineExecutionStepsResponse, "ListPipelineExecutionSteps")
      end

      # Gets a list of the pipeline executions.
      def list_pipeline_executions(
        pipeline_name : String,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListPipelineExecutionsResponse
        input = Types::ListPipelineExecutionsRequest.new(pipeline_name: pipeline_name, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_pipeline_executions(input)
      end
      def list_pipeline_executions(input : Types::ListPipelineExecutionsRequest) : Types::ListPipelineExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINE_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelineExecutionsResponse, "ListPipelineExecutions")
      end

      # Gets a list of parameters for a pipeline execution.
      def list_pipeline_parameters_for_execution(
        pipeline_execution_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPipelineParametersForExecutionResponse
        input = Types::ListPipelineParametersForExecutionRequest.new(pipeline_execution_arn: pipeline_execution_arn, max_results: max_results, next_token: next_token)
        list_pipeline_parameters_for_execution(input)
      end
      def list_pipeline_parameters_for_execution(input : Types::ListPipelineParametersForExecutionRequest) : Types::ListPipelineParametersForExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINE_PARAMETERS_FOR_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelineParametersForExecutionResponse, "ListPipelineParametersForExecution")
      end

      # Gets a list of all versions of the pipeline.
      def list_pipeline_versions(
        pipeline_name : String,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_order : String? = nil
      ) : Types::ListPipelineVersionsResponse
        input = Types::ListPipelineVersionsRequest.new(pipeline_name: pipeline_name, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, sort_order: sort_order)
        list_pipeline_versions(input)
      end
      def list_pipeline_versions(input : Types::ListPipelineVersionsRequest) : Types::ListPipelineVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelineVersionsResponse, "ListPipelineVersions")
      end

      # Gets a list of pipelines.
      def list_pipelines(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pipeline_name_prefix : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListPipelinesResponse
        input = Types::ListPipelinesRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, pipeline_name_prefix: pipeline_name_prefix, sort_by: sort_by, sort_order: sort_order)
        list_pipelines(input)
      end
      def list_pipelines(input : Types::ListPipelinesRequest) : Types::ListPipelinesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PIPELINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPipelinesResponse, "ListPipelines")
      end

      # Lists processing jobs that satisfy various filters.
      def list_processing_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListProcessingJobsResponse
        input = Types::ListProcessingJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_processing_jobs(input)
      end
      def list_processing_jobs(input : Types::ListProcessingJobsRequest) : Types::ListProcessingJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROCESSING_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProcessingJobsResponse, "ListProcessingJobs")
      end

      # Gets a list of the projects in an Amazon Web Services account.
      def list_projects(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListProjectsOutput
        input = Types::ListProjectsInput.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_projects(input)
      end
      def list_projects(input : Types::ListProjectsInput) : Types::ListProjectsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProjectsOutput, "ListProjects")
      end

      # Lists Amazon SageMaker Catalogs based on given filters and orders. The maximum number of
      # ResourceCatalog s viewable is 1000.
      def list_resource_catalogs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListResourceCatalogsResponse
        input = Types::ListResourceCatalogsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_resource_catalogs(input)
      end
      def list_resource_catalogs(input : Types::ListResourceCatalogsRequest) : Types::ListResourceCatalogsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_CATALOGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceCatalogsResponse, "ListResourceCatalogs")
      end

      # Lists spaces.
      def list_spaces(
        domain_id_equals : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        space_name_contains : String? = nil
      ) : Types::ListSpacesResponse
        input = Types::ListSpacesRequest.new(domain_id_equals: domain_id_equals, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, space_name_contains: space_name_contains)
        list_spaces(input)
      end
      def list_spaces(input : Types::ListSpacesRequest) : Types::ListSpacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SPACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSpacesResponse, "ListSpaces")
      end

      # Lists devices allocated to the stage, containing detailed device information and deployment status.
      def list_stage_devices(
        edge_deployment_plan_name : String,
        stage_name : String,
        exclude_devices_deployed_in_other_stage : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStageDevicesResponse
        input = Types::ListStageDevicesRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, stage_name: stage_name, exclude_devices_deployed_in_other_stage: exclude_devices_deployed_in_other_stage, max_results: max_results, next_token: next_token)
        list_stage_devices(input)
      end
      def list_stage_devices(input : Types::ListStageDevicesRequest) : Types::ListStageDevicesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STAGE_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStageDevicesResponse, "ListStageDevices")
      end

      # Lists the Amazon SageMaker AI Studio Lifecycle Configurations in your Amazon Web Services Account.
      def list_studio_lifecycle_configs(
        app_type_equals : String? = nil,
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        max_results : Int32? = nil,
        modified_time_after : Time? = nil,
        modified_time_before : Time? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListStudioLifecycleConfigsResponse
        input = Types::ListStudioLifecycleConfigsRequest.new(app_type_equals: app_type_equals, creation_time_after: creation_time_after, creation_time_before: creation_time_before, max_results: max_results, modified_time_after: modified_time_after, modified_time_before: modified_time_before, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_studio_lifecycle_configs(input)
      end
      def list_studio_lifecycle_configs(input : Types::ListStudioLifecycleConfigsRequest) : Types::ListStudioLifecycleConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STUDIO_LIFECYCLE_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStudioLifecycleConfigsResponse, "ListStudioLifecycleConfigs")
      end

      # Gets a list of the work teams that you are subscribed to in the Amazon Web Services Marketplace. The
      # list may be empty if no work team satisfies the filter specified in the NameContains parameter.
      def list_subscribed_workteams(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil
      ) : Types::ListSubscribedWorkteamsResponse
        input = Types::ListSubscribedWorkteamsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token)
        list_subscribed_workteams(input)
      end
      def list_subscribed_workteams(input : Types::ListSubscribedWorkteamsRequest) : Types::ListSubscribedWorkteamsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SUBSCRIBED_WORKTEAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSubscribedWorkteamsResponse, "ListSubscribedWorkteams")
      end

      # Returns the tags for the specified SageMaker resource.
      def list_tags(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsOutput
        input = Types::ListTagsInput.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags(input)
      end
      def list_tags(input : Types::ListTagsInput) : Types::ListTagsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsOutput, "ListTags")
      end

      # Lists training jobs. When StatusEquals and MaxResults are set at the same time, the MaxResults
      # number of training jobs are first retrieved ignoring the StatusEquals parameter and then they are
      # filtered by the StatusEquals parameter, which is returned as a response. For example, if
      # ListTrainingJobs is invoked with the following parameters: { ... MaxResults: 100, StatusEquals:
      # InProgress ... } First, 100 trainings jobs with any status, including those other than InProgress ,
      # are selected (sorted according to the creation time, from the most current to the oldest). Next,
      # those with a status of InProgress are returned. You can quickly test the API using the following
      # Amazon Web Services CLI code. aws sagemaker list-training-jobs --max-results 100 --status-equals
      # InProgress
      def list_training_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil,
        training_plan_arn_equals : String? = nil,
        warm_pool_status_equals : String? = nil
      ) : Types::ListTrainingJobsResponse
        input = Types::ListTrainingJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals, training_plan_arn_equals: training_plan_arn_equals, warm_pool_status_equals: warm_pool_status_equals)
        list_training_jobs(input)
      end
      def list_training_jobs(input : Types::ListTrainingJobsRequest) : Types::ListTrainingJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRAINING_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrainingJobsResponse, "ListTrainingJobs")
      end

      # Gets a list of TrainingJobSummary objects that describe the training jobs that a hyperparameter
      # tuning job launched.
      def list_training_jobs_for_hyper_parameter_tuning_job(
        hyper_parameter_tuning_job_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListTrainingJobsForHyperParameterTuningJobResponse
        input = Types::ListTrainingJobsForHyperParameterTuningJobRequest.new(hyper_parameter_tuning_job_name: hyper_parameter_tuning_job_name, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_training_jobs_for_hyper_parameter_tuning_job(input)
      end
      def list_training_jobs_for_hyper_parameter_tuning_job(input : Types::ListTrainingJobsForHyperParameterTuningJobRequest) : Types::ListTrainingJobsForHyperParameterTuningJobResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRAINING_JOBS_FOR_HYPER_PARAMETER_TUNING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrainingJobsForHyperParameterTuningJobResponse, "ListTrainingJobsForHyperParameterTuningJob")
      end

      # Retrieves a list of training plans for the current account.
      def list_training_plans(
        filters : Array(Types::TrainingPlanFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        start_time_after : Time? = nil,
        start_time_before : Time? = nil
      ) : Types::ListTrainingPlansResponse
        input = Types::ListTrainingPlansRequest.new(filters: filters, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, start_time_after: start_time_after, start_time_before: start_time_before)
        list_training_plans(input)
      end
      def list_training_plans(input : Types::ListTrainingPlansRequest) : Types::ListTrainingPlansResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRAINING_PLANS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrainingPlansResponse, "ListTrainingPlans")
      end

      # Lists transform jobs.
      def list_transform_jobs(
        creation_time_after : Time? = nil,
        creation_time_before : Time? = nil,
        last_modified_time_after : Time? = nil,
        last_modified_time_before : Time? = nil,
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        status_equals : String? = nil
      ) : Types::ListTransformJobsResponse
        input = Types::ListTransformJobsRequest.new(creation_time_after: creation_time_after, creation_time_before: creation_time_before, last_modified_time_after: last_modified_time_after, last_modified_time_before: last_modified_time_before, max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order, status_equals: status_equals)
        list_transform_jobs(input)
      end
      def list_transform_jobs(input : Types::ListTransformJobsRequest) : Types::ListTransformJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRANSFORM_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTransformJobsResponse, "ListTransformJobs")
      end

      # Lists the trial components in your account. You can sort the list by trial component name or
      # creation time. You can filter the list to show only components that were created in a specific time
      # range. You can also filter on one of the following: ExperimentName SourceArn TrialName
      def list_trial_components(
        created_after : Time? = nil,
        created_before : Time? = nil,
        experiment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        source_arn : String? = nil,
        trial_name : String? = nil
      ) : Types::ListTrialComponentsResponse
        input = Types::ListTrialComponentsRequest.new(created_after: created_after, created_before: created_before, experiment_name: experiment_name, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, source_arn: source_arn, trial_name: trial_name)
        list_trial_components(input)
      end
      def list_trial_components(input : Types::ListTrialComponentsRequest) : Types::ListTrialComponentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRIAL_COMPONENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrialComponentsResponse, "ListTrialComponents")
      end

      # Lists the trials in your account. Specify an experiment name to limit the list to the trials that
      # are part of that experiment. Specify a trial component name to limit the list to the trials that
      # associated with that trial component. The list can be filtered to show only trials that were created
      # in a specific time range. The list can be sorted by trial name or creation time.
      def list_trials(
        created_after : Time? = nil,
        created_before : Time? = nil,
        experiment_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        trial_component_name : String? = nil
      ) : Types::ListTrialsResponse
        input = Types::ListTrialsRequest.new(created_after: created_after, created_before: created_before, experiment_name: experiment_name, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, trial_component_name: trial_component_name)
        list_trials(input)
      end
      def list_trials(input : Types::ListTrialsRequest) : Types::ListTrialsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRIALS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTrialsResponse, "ListTrials")
      end

      # Lists all UltraServers that are part of a specified reserved capacity.
      def list_ultra_servers_by_reserved_capacity(
        reserved_capacity_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUltraServersByReservedCapacityResponse
        input = Types::ListUltraServersByReservedCapacityRequest.new(reserved_capacity_arn: reserved_capacity_arn, max_results: max_results, next_token: next_token)
        list_ultra_servers_by_reserved_capacity(input)
      end
      def list_ultra_servers_by_reserved_capacity(input : Types::ListUltraServersByReservedCapacityRequest) : Types::ListUltraServersByReservedCapacityResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ULTRA_SERVERS_BY_RESERVED_CAPACITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUltraServersByReservedCapacityResponse, "ListUltraServersByReservedCapacity")
      end

      # Lists user profiles.
      def list_user_profiles(
        domain_id_equals : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        user_profile_name_contains : String? = nil
      ) : Types::ListUserProfilesResponse
        input = Types::ListUserProfilesRequest.new(domain_id_equals: domain_id_equals, max_results: max_results, next_token: next_token, sort_by: sort_by, sort_order: sort_order, user_profile_name_contains: user_profile_name_contains)
        list_user_profiles(input)
      end
      def list_user_profiles(input : Types::ListUserProfilesRequest) : Types::ListUserProfilesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USER_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUserProfilesResponse, "ListUserProfiles")
      end

      # Use this operation to list all private and vendor workforces in an Amazon Web Services Region. Note
      # that you can only have one private workforce per Amazon Web Services Region.
      def list_workforces(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListWorkforcesResponse
        input = Types::ListWorkforcesRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_workforces(input)
      end
      def list_workforces(input : Types::ListWorkforcesRequest) : Types::ListWorkforcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKFORCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkforcesResponse, "ListWorkforces")
      end

      # Gets a list of private work teams that you have defined in a region. The list may be empty if no
      # work team satisfies the filter specified in the NameContains parameter.
      def list_workteams(
        max_results : Int32? = nil,
        name_contains : String? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListWorkteamsResponse
        input = Types::ListWorkteamsRequest.new(max_results: max_results, name_contains: name_contains, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_workteams(input)
      end
      def list_workteams(input : Types::ListWorkteamsRequest) : Types::ListWorkteamsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKTEAMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkteamsResponse, "ListWorkteams")
      end

      # Adds a resouce policy to control access to a model group. For information about resoure policies,
      # see Identity-based policies and resource-based policies in the Amazon Web Services Identity and
      # Access Management User Guide. .
      def put_model_package_group_policy(
        model_package_group_name : String,
        resource_policy : String
      ) : Types::PutModelPackageGroupPolicyOutput
        input = Types::PutModelPackageGroupPolicyInput.new(model_package_group_name: model_package_group_name, resource_policy: resource_policy)
        put_model_package_group_policy(input)
      end
      def put_model_package_group_policy(input : Types::PutModelPackageGroupPolicyInput) : Types::PutModelPackageGroupPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_MODEL_PACKAGE_GROUP_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutModelPackageGroupPolicyOutput, "PutModelPackageGroupPolicy")
      end

      # Use this action to inspect your lineage and discover relationships between entities. For more
      # information, see Querying Lineage Entities in the Amazon SageMaker Developer Guide .
      def query_lineage(
        direction : String? = nil,
        filters : Types::QueryFilters? = nil,
        include_edges : Bool? = nil,
        max_depth : Int32? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_arns : Array(String)? = nil
      ) : Types::QueryLineageResponse
        input = Types::QueryLineageRequest.new(direction: direction, filters: filters, include_edges: include_edges, max_depth: max_depth, max_results: max_results, next_token: next_token, start_arns: start_arns)
        query_lineage(input)
      end
      def query_lineage(input : Types::QueryLineageRequest) : Types::QueryLineageResponse
        request = Protocol::JsonRpc.build_request(Model::QUERY_LINEAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::QueryLineageResponse, "QueryLineage")
      end

      # Register devices.
      def register_devices(
        device_fleet_name : String,
        devices : Array(Types::Device),
        tags : Array(Types::Tag)? = nil
      ) : Nil
        input = Types::RegisterDevicesRequest.new(device_fleet_name: device_fleet_name, devices: devices, tags: tags)
        register_devices(input)
      end
      def register_devices(input : Types::RegisterDevicesRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::REGISTER_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Renders the UI template so that you can preview the worker's experience.
      def render_ui_template(
        role_arn : String,
        task : Types::RenderableTask,
        human_task_ui_arn : String? = nil,
        ui_template : Types::UiTemplate? = nil
      ) : Types::RenderUiTemplateResponse
        input = Types::RenderUiTemplateRequest.new(role_arn: role_arn, task: task, human_task_ui_arn: human_task_ui_arn, ui_template: ui_template)
        render_ui_template(input)
      end
      def render_ui_template(input : Types::RenderUiTemplateRequest) : Types::RenderUiTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::RENDER_UI_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RenderUiTemplateResponse, "RenderUiTemplate")
      end

      # Retry the execution of the pipeline.
      def retry_pipeline_execution(
        client_request_token : String,
        pipeline_execution_arn : String,
        parallelism_configuration : Types::ParallelismConfiguration? = nil
      ) : Types::RetryPipelineExecutionResponse
        input = Types::RetryPipelineExecutionRequest.new(client_request_token: client_request_token, pipeline_execution_arn: pipeline_execution_arn, parallelism_configuration: parallelism_configuration)
        retry_pipeline_execution(input)
      end
      def retry_pipeline_execution(input : Types::RetryPipelineExecutionRequest) : Types::RetryPipelineExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::RETRY_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RetryPipelineExecutionResponse, "RetryPipelineExecution")
      end

      # Finds SageMaker resources that match a search query. Matching resources are returned as a list of
      # SearchRecord objects in the response. You can sort the search results by any resource property in a
      # ascending or descending order. You can query against the following value types: numeric, text,
      # Boolean, and timestamp. The Search API may provide access to otherwise restricted data. See Amazon
      # SageMaker API Permissions: Actions, Permissions, and Resources Reference for more information.
      def search(
        resource : String,
        cross_account_filter_option : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_expression : Types::SearchExpression? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil,
        visibility_conditions : Array(Types::VisibilityConditions)? = nil
      ) : Types::SearchResponse
        input = Types::SearchRequest.new(resource: resource, cross_account_filter_option: cross_account_filter_option, max_results: max_results, next_token: next_token, search_expression: search_expression, sort_by: sort_by, sort_order: sort_order, visibility_conditions: visibility_conditions)
        search(input)
      end
      def search(input : Types::SearchRequest) : Types::SearchResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchResponse, "Search")
      end

      # Searches for available training plan offerings based on specified criteria. Users search for
      # available plan offerings based on their requirements (e.g., instance type, count, start time,
      # duration). And then, they create a plan that best matches their needs using the ID of the plan
      # offering they want to use. For more information about how to reserve GPU capacity for your SageMaker
      # training jobs or SageMaker HyperPod clusters using Amazon SageMaker Training Plan , see
      # CreateTrainingPlan .
      def search_training_plan_offerings(
        duration_hours : Int64? = nil,
        end_time_before : Time? = nil,
        instance_count : Int32? = nil,
        instance_type : String? = nil,
        start_time_after : Time? = nil,
        target_resources : Array(String)? = nil,
        ultra_server_count : Int32? = nil,
        ultra_server_type : String? = nil
      ) : Types::SearchTrainingPlanOfferingsResponse
        input = Types::SearchTrainingPlanOfferingsRequest.new(duration_hours: duration_hours, end_time_before: end_time_before, instance_count: instance_count, instance_type: instance_type, start_time_after: start_time_after, target_resources: target_resources, ultra_server_count: ultra_server_count, ultra_server_type: ultra_server_type)
        search_training_plan_offerings(input)
      end
      def search_training_plan_offerings(input : Types::SearchTrainingPlanOfferingsRequest) : Types::SearchTrainingPlanOfferingsResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_TRAINING_PLAN_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchTrainingPlanOfferingsResponse, "SearchTrainingPlanOfferings")
      end

      # Notifies the pipeline that the execution of a callback step failed, along with a message describing
      # why. When a callback step is run, the pipeline generates a callback token and includes the token in
      # a message sent to Amazon Simple Queue Service (Amazon SQS).
      def send_pipeline_execution_step_failure(
        callback_token : String,
        client_request_token : String? = nil,
        failure_reason : String? = nil
      ) : Types::SendPipelineExecutionStepFailureResponse
        input = Types::SendPipelineExecutionStepFailureRequest.new(callback_token: callback_token, client_request_token: client_request_token, failure_reason: failure_reason)
        send_pipeline_execution_step_failure(input)
      end
      def send_pipeline_execution_step_failure(input : Types::SendPipelineExecutionStepFailureRequest) : Types::SendPipelineExecutionStepFailureResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_PIPELINE_EXECUTION_STEP_FAILURE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendPipelineExecutionStepFailureResponse, "SendPipelineExecutionStepFailure")
      end

      # Notifies the pipeline that the execution of a callback step succeeded and provides a list of the
      # step's output parameters. When a callback step is run, the pipeline generates a callback token and
      # includes the token in a message sent to Amazon Simple Queue Service (Amazon SQS).
      def send_pipeline_execution_step_success(
        callback_token : String,
        client_request_token : String? = nil,
        output_parameters : Array(Types::OutputParameter)? = nil
      ) : Types::SendPipelineExecutionStepSuccessResponse
        input = Types::SendPipelineExecutionStepSuccessRequest.new(callback_token: callback_token, client_request_token: client_request_token, output_parameters: output_parameters)
        send_pipeline_execution_step_success(input)
      end
      def send_pipeline_execution_step_success(input : Types::SendPipelineExecutionStepSuccessRequest) : Types::SendPipelineExecutionStepSuccessResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_PIPELINE_EXECUTION_STEP_SUCCESS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendPipelineExecutionStepSuccessResponse, "SendPipelineExecutionStepSuccess")
      end

      # Starts a stage in an edge deployment plan.
      def start_edge_deployment_stage(
        edge_deployment_plan_name : String,
        stage_name : String
      ) : Nil
        input = Types::StartEdgeDeploymentStageRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, stage_name: stage_name)
        start_edge_deployment_stage(input)
      end
      def start_edge_deployment_stage(input : Types::StartEdgeDeploymentStageRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_EDGE_DEPLOYMENT_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts an inference experiment.
      def start_inference_experiment(
        name : String
      ) : Types::StartInferenceExperimentResponse
        input = Types::StartInferenceExperimentRequest.new(name: name)
        start_inference_experiment(input)
      end
      def start_inference_experiment(input : Types::StartInferenceExperimentRequest) : Types::StartInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::START_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartInferenceExperimentResponse, "StartInferenceExperiment")
      end

      # Programmatically start an MLflow Tracking Server.
      def start_mlflow_tracking_server(
        tracking_server_name : String
      ) : Types::StartMlflowTrackingServerResponse
        input = Types::StartMlflowTrackingServerRequest.new(tracking_server_name: tracking_server_name)
        start_mlflow_tracking_server(input)
      end
      def start_mlflow_tracking_server(input : Types::StartMlflowTrackingServerRequest) : Types::StartMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::START_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMlflowTrackingServerResponse, "StartMlflowTrackingServer")
      end

      # Starts a previously stopped monitoring schedule. By default, when you successfully create a new
      # schedule, the status of a monitoring schedule is scheduled .
      def start_monitoring_schedule(
        monitoring_schedule_name : String
      ) : Nil
        input = Types::StartMonitoringScheduleRequest.new(monitoring_schedule_name: monitoring_schedule_name)
        start_monitoring_schedule(input)
      end
      def start_monitoring_schedule(input : Types::StartMonitoringScheduleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Launches an ML compute instance with the latest version of the libraries and attaches your ML
      # storage volume. After configuring the notebook instance, SageMaker AI sets the notebook instance
      # status to InService . A notebook instance's status must be InService before you can connect to your
      # Jupyter notebook.
      def start_notebook_instance(
        notebook_instance_name : String
      ) : Nil
        input = Types::StartNotebookInstanceInput.new(notebook_instance_name: notebook_instance_name)
        start_notebook_instance(input)
      end
      def start_notebook_instance(input : Types::StartNotebookInstanceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Starts a pipeline execution.
      def start_pipeline_execution(
        client_request_token : String,
        pipeline_name : String,
        mlflow_experiment_name : String? = nil,
        parallelism_configuration : Types::ParallelismConfiguration? = nil,
        pipeline_execution_description : String? = nil,
        pipeline_execution_display_name : String? = nil,
        pipeline_parameters : Array(Types::Parameter)? = nil,
        pipeline_version_id : Int64? = nil,
        selective_execution_config : Types::SelectiveExecutionConfig? = nil
      ) : Types::StartPipelineExecutionResponse
        input = Types::StartPipelineExecutionRequest.new(client_request_token: client_request_token, pipeline_name: pipeline_name, mlflow_experiment_name: mlflow_experiment_name, parallelism_configuration: parallelism_configuration, pipeline_execution_description: pipeline_execution_description, pipeline_execution_display_name: pipeline_execution_display_name, pipeline_parameters: pipeline_parameters, pipeline_version_id: pipeline_version_id, selective_execution_config: selective_execution_config)
        start_pipeline_execution(input)
      end
      def start_pipeline_execution(input : Types::StartPipelineExecutionRequest) : Types::StartPipelineExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::START_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartPipelineExecutionResponse, "StartPipelineExecution")
      end

      # Initiates a remote connection session between a local integrated development environments (IDEs) and
      # a remote SageMaker space.
      def start_session(
        resource_identifier : String
      ) : Types::StartSessionResponse
        input = Types::StartSessionRequest.new(resource_identifier: resource_identifier)
        start_session(input)
      end
      def start_session(input : Types::StartSessionRequest) : Types::StartSessionResponse
        request = Protocol::JsonRpc.build_request(Model::START_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSessionResponse, "StartSession")
      end

      # A method for forcing a running job to shut down.
      def stop_auto_ml_job(
        auto_ml_job_name : String
      ) : Nil
        input = Types::StopAutoMLJobRequest.new(auto_ml_job_name: auto_ml_job_name)
        stop_auto_ml_job(input)
      end
      def stop_auto_ml_job(input : Types::StopAutoMLJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_AUTO_ML_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a model compilation job. To stop a job, Amazon SageMaker AI sends the algorithm the SIGTERM
      # signal. This gracefully shuts the job down. If the job hasn't stopped, it sends the SIGKILL signal.
      # When it receives a StopCompilationJob request, Amazon SageMaker AI changes the CompilationJobStatus
      # of the job to Stopping . After Amazon SageMaker stops the job, it sets the CompilationJobStatus to
      # Stopped .
      def stop_compilation_job(
        compilation_job_name : String
      ) : Nil
        input = Types::StopCompilationJobRequest.new(compilation_job_name: compilation_job_name)
        stop_compilation_job(input)
      end
      def stop_compilation_job(input : Types::StopCompilationJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_COMPILATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a stage in an edge deployment plan.
      def stop_edge_deployment_stage(
        edge_deployment_plan_name : String,
        stage_name : String
      ) : Nil
        input = Types::StopEdgeDeploymentStageRequest.new(edge_deployment_plan_name: edge_deployment_plan_name, stage_name: stage_name)
        stop_edge_deployment_stage(input)
      end
      def stop_edge_deployment_stage(input : Types::StopEdgeDeploymentStageRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_EDGE_DEPLOYMENT_STAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Request to stop an edge packaging job.
      def stop_edge_packaging_job(
        edge_packaging_job_name : String
      ) : Nil
        input = Types::StopEdgePackagingJobRequest.new(edge_packaging_job_name: edge_packaging_job_name)
        stop_edge_packaging_job(input)
      end
      def stop_edge_packaging_job(input : Types::StopEdgePackagingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_EDGE_PACKAGING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a running hyperparameter tuning job and all running training jobs that the tuning job
      # launched. All model artifacts output from the training jobs are stored in Amazon Simple Storage
      # Service (Amazon S3). All data that the training jobs write to Amazon CloudWatch Logs are still
      # available in CloudWatch. After the tuning job moves to the Stopped state, it releases all reserved
      # resources for the tuning job.
      def stop_hyper_parameter_tuning_job(
        hyper_parameter_tuning_job_name : String
      ) : Nil
        input = Types::StopHyperParameterTuningJobRequest.new(hyper_parameter_tuning_job_name: hyper_parameter_tuning_job_name)
        stop_hyper_parameter_tuning_job(input)
      end
      def stop_hyper_parameter_tuning_job(input : Types::StopHyperParameterTuningJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_HYPER_PARAMETER_TUNING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops an inference experiment.
      def stop_inference_experiment(
        model_variant_actions : Hash(String, String),
        name : String,
        desired_model_variants : Array(Types::ModelVariantConfig)? = nil,
        desired_state : String? = nil,
        reason : String? = nil
      ) : Types::StopInferenceExperimentResponse
        input = Types::StopInferenceExperimentRequest.new(model_variant_actions: model_variant_actions, name: name, desired_model_variants: desired_model_variants, desired_state: desired_state, reason: reason)
        stop_inference_experiment(input)
      end
      def stop_inference_experiment(input : Types::StopInferenceExperimentRequest) : Types::StopInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopInferenceExperimentResponse, "StopInferenceExperiment")
      end

      # Stops an Inference Recommender job.
      def stop_inference_recommendations_job(
        job_name : String
      ) : Nil
        input = Types::StopInferenceRecommendationsJobRequest.new(job_name: job_name)
        stop_inference_recommendations_job(input)
      end
      def stop_inference_recommendations_job(input : Types::StopInferenceRecommendationsJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_INFERENCE_RECOMMENDATIONS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a running labeling job. A job that is stopped cannot be restarted. Any results obtained before
      # the job is stopped are placed in the Amazon S3 output bucket.
      def stop_labeling_job(
        labeling_job_name : String
      ) : Nil
        input = Types::StopLabelingJobRequest.new(labeling_job_name: labeling_job_name)
        stop_labeling_job(input)
      end
      def stop_labeling_job(input : Types::StopLabelingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_LABELING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Programmatically stop an MLflow Tracking Server.
      def stop_mlflow_tracking_server(
        tracking_server_name : String
      ) : Types::StopMlflowTrackingServerResponse
        input = Types::StopMlflowTrackingServerRequest.new(tracking_server_name: tracking_server_name)
        stop_mlflow_tracking_server(input)
      end
      def stop_mlflow_tracking_server(input : Types::StopMlflowTrackingServerRequest) : Types::StopMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopMlflowTrackingServerResponse, "StopMlflowTrackingServer")
      end

      # Stops a previously started monitoring schedule.
      def stop_monitoring_schedule(
        monitoring_schedule_name : String
      ) : Nil
        input = Types::StopMonitoringScheduleRequest.new(monitoring_schedule_name: monitoring_schedule_name)
        stop_monitoring_schedule(input)
      end
      def stop_monitoring_schedule(input : Types::StopMonitoringScheduleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Terminates the ML compute instance. Before terminating the instance, SageMaker AI disconnects the ML
      # storage volume from it. SageMaker AI preserves the ML storage volume. SageMaker AI stops charging
      # you for the ML compute instance when you call StopNotebookInstance . To access data on the ML
      # storage volume for a notebook instance that has been terminated, call the StartNotebookInstance API.
      # StartNotebookInstance launches another ML compute instance, configures it, and attaches the
      # preserved ML storage volume so you can continue your work.
      def stop_notebook_instance(
        notebook_instance_name : String
      ) : Nil
        input = Types::StopNotebookInstanceInput.new(notebook_instance_name: notebook_instance_name)
        stop_notebook_instance(input)
      end
      def stop_notebook_instance(input : Types::StopNotebookInstanceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Ends a running inference optimization job.
      def stop_optimization_job(
        optimization_job_name : String
      ) : Nil
        input = Types::StopOptimizationJobRequest.new(optimization_job_name: optimization_job_name)
        stop_optimization_job(input)
      end
      def stop_optimization_job(input : Types::StopOptimizationJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_OPTIMIZATION_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a pipeline execution. Callback Step A pipeline execution won't stop while a callback step is
      # running. When you call StopPipelineExecution on a pipeline execution with a running callback step,
      # SageMaker Pipelines sends an additional Amazon SQS message to the specified SQS queue. The body of
      # the SQS message contains a "Status" field which is set to "Stopping". You should add logic to your
      # Amazon SQS message consumer to take any needed action (for example, resource cleanup) upon receipt
      # of the message followed by a call to SendPipelineExecutionStepSuccess or
      # SendPipelineExecutionStepFailure . Only when SageMaker Pipelines receives one of these calls will it
      # stop the pipeline execution. Lambda Step A pipeline execution can't be stopped while a lambda step
      # is running because the Lambda function invoked by the lambda step can't be stopped. If you attempt
      # to stop the execution while the Lambda function is running, the pipeline waits for the Lambda
      # function to finish or until the timeout is hit, whichever occurs first, and then stops. If the
      # Lambda function finishes, the pipeline execution status is Stopped . If the timeout is hit the
      # pipeline execution status is Failed .
      def stop_pipeline_execution(
        client_request_token : String,
        pipeline_execution_arn : String
      ) : Types::StopPipelineExecutionResponse
        input = Types::StopPipelineExecutionRequest.new(client_request_token: client_request_token, pipeline_execution_arn: pipeline_execution_arn)
        stop_pipeline_execution(input)
      end
      def stop_pipeline_execution(input : Types::StopPipelineExecutionRequest) : Types::StopPipelineExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopPipelineExecutionResponse, "StopPipelineExecution")
      end

      # Stops a processing job.
      def stop_processing_job(
        processing_job_name : String
      ) : Nil
        input = Types::StopProcessingJobRequest.new(processing_job_name: processing_job_name)
        stop_processing_job(input)
      end
      def stop_processing_job(input : Types::StopProcessingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_PROCESSING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a training job. To stop a job, SageMaker sends the algorithm the SIGTERM signal, which delays
      # job termination for 120 seconds. Algorithms might use this 120-second window to save the model
      # artifacts, so the results of the training is not lost. When it receives a StopTrainingJob request,
      # SageMaker changes the status of the job to Stopping . After SageMaker stops the job, it sets the
      # status to Stopped .
      def stop_training_job(
        training_job_name : String
      ) : Nil
        input = Types::StopTrainingJobRequest.new(training_job_name: training_job_name)
        stop_training_job(input)
      end
      def stop_training_job(input : Types::StopTrainingJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_TRAINING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Stops a batch transform job. When Amazon SageMaker receives a StopTransformJob request, the status
      # of the job changes to Stopping . After Amazon SageMaker stops the job, the status is set to Stopped
      # . When you stop a batch transform job before it is completed, Amazon SageMaker doesn't store the
      # job's output in Amazon S3.
      def stop_transform_job(
        transform_job_name : String
      ) : Nil
        input = Types::StopTransformJobRequest.new(transform_job_name: transform_job_name)
        stop_transform_job(input)
      end
      def stop_transform_job(input : Types::StopTransformJobRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_TRANSFORM_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates an action.
      def update_action(
        action_name : String,
        description : String? = nil,
        properties : Hash(String, String)? = nil,
        properties_to_remove : Array(String)? = nil,
        status : String? = nil
      ) : Types::UpdateActionResponse
        input = Types::UpdateActionRequest.new(action_name: action_name, description: description, properties: properties, properties_to_remove: properties_to_remove, status: status)
        update_action(input)
      end
      def update_action(input : Types::UpdateActionRequest) : Types::UpdateActionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateActionResponse, "UpdateAction")
      end

      # Updates the properties of an AppImageConfig.
      def update_app_image_config(
        app_image_config_name : String,
        code_editor_app_image_config : Types::CodeEditorAppImageConfig? = nil,
        jupyter_lab_app_image_config : Types::JupyterLabAppImageConfig? = nil,
        kernel_gateway_image_config : Types::KernelGatewayImageConfig? = nil
      ) : Types::UpdateAppImageConfigResponse
        input = Types::UpdateAppImageConfigRequest.new(app_image_config_name: app_image_config_name, code_editor_app_image_config: code_editor_app_image_config, jupyter_lab_app_image_config: jupyter_lab_app_image_config, kernel_gateway_image_config: kernel_gateway_image_config)
        update_app_image_config(input)
      end
      def update_app_image_config(input : Types::UpdateAppImageConfigRequest) : Types::UpdateAppImageConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APP_IMAGE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAppImageConfigResponse, "UpdateAppImageConfig")
      end

      # Updates an artifact.
      def update_artifact(
        artifact_arn : String,
        artifact_name : String? = nil,
        properties : Hash(String, String)? = nil,
        properties_to_remove : Array(String)? = nil
      ) : Types::UpdateArtifactResponse
        input = Types::UpdateArtifactRequest.new(artifact_arn: artifact_arn, artifact_name: artifact_name, properties: properties, properties_to_remove: properties_to_remove)
        update_artifact(input)
      end
      def update_artifact(input : Types::UpdateArtifactRequest) : Types::UpdateArtifactResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ARTIFACT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateArtifactResponse, "UpdateArtifact")
      end

      # Updates a SageMaker HyperPod cluster.
      def update_cluster(
        cluster_name : String,
        auto_scaling : Types::ClusterAutoScalingConfig? = nil,
        cluster_role : String? = nil,
        instance_groups : Array(Types::ClusterInstanceGroupSpecification)? = nil,
        instance_groups_to_delete : Array(String)? = nil,
        node_provisioning_mode : String? = nil,
        node_recovery : String? = nil,
        restricted_instance_groups : Array(Types::ClusterRestrictedInstanceGroupSpecification)? = nil,
        tiered_storage_config : Types::ClusterTieredStorageConfig? = nil
      ) : Types::UpdateClusterResponse
        input = Types::UpdateClusterRequest.new(cluster_name: cluster_name, auto_scaling: auto_scaling, cluster_role: cluster_role, instance_groups: instance_groups, instance_groups_to_delete: instance_groups_to_delete, node_provisioning_mode: node_provisioning_mode, node_recovery: node_recovery, restricted_instance_groups: restricted_instance_groups, tiered_storage_config: tiered_storage_config)
        update_cluster(input)
      end
      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResponse, "UpdateCluster")
      end

      # Update the cluster policy configuration.
      def update_cluster_scheduler_config(
        cluster_scheduler_config_id : String,
        target_version : Int32,
        description : String? = nil,
        scheduler_config : Types::SchedulerConfig? = nil
      ) : Types::UpdateClusterSchedulerConfigResponse
        input = Types::UpdateClusterSchedulerConfigRequest.new(cluster_scheduler_config_id: cluster_scheduler_config_id, target_version: target_version, description: description, scheduler_config: scheduler_config)
        update_cluster_scheduler_config(input)
      end
      def update_cluster_scheduler_config(input : Types::UpdateClusterSchedulerConfigRequest) : Types::UpdateClusterSchedulerConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER_SCHEDULER_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterSchedulerConfigResponse, "UpdateClusterSchedulerConfig")
      end

      # Updates the platform software of a SageMaker HyperPod cluster for security patching. To learn how to
      # use this API, see Update the SageMaker HyperPod platform software of a cluster . The
      # UpgradeClusterSoftware API call may impact your SageMaker HyperPod cluster uptime and availability.
      # Plan accordingly to mitigate potential disruptions to your workloads.
      def update_cluster_software(
        cluster_name : String,
        deployment_config : Types::DeploymentConfiguration? = nil,
        image_id : String? = nil,
        instance_groups : Array(Types::UpdateClusterSoftwareInstanceGroupSpecification)? = nil
      ) : Types::UpdateClusterSoftwareResponse
        input = Types::UpdateClusterSoftwareRequest.new(cluster_name: cluster_name, deployment_config: deployment_config, image_id: image_id, instance_groups: instance_groups)
        update_cluster_software(input)
      end
      def update_cluster_software(input : Types::UpdateClusterSoftwareRequest) : Types::UpdateClusterSoftwareResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER_SOFTWARE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterSoftwareResponse, "UpdateClusterSoftware")
      end

      # Updates the specified Git repository with the specified values.
      def update_code_repository(
        code_repository_name : String,
        git_config : Types::GitConfigForUpdate? = nil
      ) : Types::UpdateCodeRepositoryOutput
        input = Types::UpdateCodeRepositoryInput.new(code_repository_name: code_repository_name, git_config: git_config)
        update_code_repository(input)
      end
      def update_code_repository(input : Types::UpdateCodeRepositoryInput) : Types::UpdateCodeRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CODE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCodeRepositoryOutput, "UpdateCodeRepository")
      end

      # Update the compute allocation definition.
      def update_compute_quota(
        compute_quota_id : String,
        target_version : Int32,
        activation_state : String? = nil,
        compute_quota_config : Types::ComputeQuotaConfig? = nil,
        compute_quota_target : Types::ComputeQuotaTarget? = nil,
        description : String? = nil
      ) : Types::UpdateComputeQuotaResponse
        input = Types::UpdateComputeQuotaRequest.new(compute_quota_id: compute_quota_id, target_version: target_version, activation_state: activation_state, compute_quota_config: compute_quota_config, compute_quota_target: compute_quota_target, description: description)
        update_compute_quota(input)
      end
      def update_compute_quota(input : Types::UpdateComputeQuotaRequest) : Types::UpdateComputeQuotaResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMPUTE_QUOTA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateComputeQuotaResponse, "UpdateComputeQuota")
      end

      # Updates a context.
      def update_context(
        context_name : String,
        description : String? = nil,
        properties : Hash(String, String)? = nil,
        properties_to_remove : Array(String)? = nil
      ) : Types::UpdateContextResponse
        input = Types::UpdateContextRequest.new(context_name: context_name, description: description, properties: properties, properties_to_remove: properties_to_remove)
        update_context(input)
      end
      def update_context(input : Types::UpdateContextRequest) : Types::UpdateContextResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CONTEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateContextResponse, "UpdateContext")
      end

      # Updates a fleet of devices.
      def update_device_fleet(
        device_fleet_name : String,
        output_config : Types::EdgeOutputConfig,
        description : String? = nil,
        enable_iot_role_alias : Bool? = nil,
        role_arn : String? = nil
      ) : Nil
        input = Types::UpdateDeviceFleetRequest.new(device_fleet_name: device_fleet_name, output_config: output_config, description: description, enable_iot_role_alias: enable_iot_role_alias, role_arn: role_arn)
        update_device_fleet(input)
      end
      def update_device_fleet(input : Types::UpdateDeviceFleetRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEVICE_FLEET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates one or more devices in a fleet.
      def update_devices(
        device_fleet_name : String,
        devices : Array(Types::Device)
      ) : Nil
        input = Types::UpdateDevicesRequest.new(device_fleet_name: device_fleet_name, devices: devices)
        update_devices(input)
      end
      def update_devices(input : Types::UpdateDevicesRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEVICES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the default settings for new user profiles in the domain.
      def update_domain(
        domain_id : String,
        app_network_access_type : String? = nil,
        app_security_group_management : String? = nil,
        default_space_settings : Types::DefaultSpaceSettings? = nil,
        default_user_settings : Types::UserSettings? = nil,
        domain_settings_for_update : Types::DomainSettingsForUpdate? = nil,
        subnet_ids : Array(String)? = nil,
        tag_propagation : String? = nil,
        vpc_id : String? = nil
      ) : Types::UpdateDomainResponse
        input = Types::UpdateDomainRequest.new(domain_id: domain_id, app_network_access_type: app_network_access_type, app_security_group_management: app_security_group_management, default_space_settings: default_space_settings, default_user_settings: default_user_settings, domain_settings_for_update: domain_settings_for_update, subnet_ids: subnet_ids, tag_propagation: tag_propagation, vpc_id: vpc_id)
        update_domain(input)
      end
      def update_domain(input : Types::UpdateDomainRequest) : Types::UpdateDomainResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOMAIN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDomainResponse, "UpdateDomain")
      end

      # Deploys the EndpointConfig specified in the request to a new fleet of instances. SageMaker shifts
      # endpoint traffic to the new instances with the updated endpoint configuration and then deletes the
      # old instances using the previous EndpointConfig (there is no availability loss). For more
      # information about how to control the update and traffic shifting process, see Update models in
      # production . When SageMaker receives the request, it sets the endpoint status to Updating . After
      # updating the endpoint, it sets the status to InService . To check the status of an endpoint, use the
      # DescribeEndpoint API. You must not delete an EndpointConfig in use by an endpoint that is live or
      # while the UpdateEndpoint or CreateEndpoint operations are being performed on the endpoint. To update
      # an endpoint, you must create a new EndpointConfig . If you delete the EndpointConfig of an endpoint
      # that is active or being created or updated you may lose visibility into the instance type the
      # endpoint is using. The endpoint must be deleted in order to stop incurring charges.
      def update_endpoint(
        endpoint_config_name : String,
        endpoint_name : String,
        deployment_config : Types::DeploymentConfig? = nil,
        exclude_retained_variant_properties : Array(Types::VariantProperty)? = nil,
        retain_all_variant_properties : Bool? = nil,
        retain_deployment_config : Bool? = nil
      ) : Types::UpdateEndpointOutput
        input = Types::UpdateEndpointInput.new(endpoint_config_name: endpoint_config_name, endpoint_name: endpoint_name, deployment_config: deployment_config, exclude_retained_variant_properties: exclude_retained_variant_properties, retain_all_variant_properties: retain_all_variant_properties, retain_deployment_config: retain_deployment_config)
        update_endpoint(input)
      end
      def update_endpoint(input : Types::UpdateEndpointInput) : Types::UpdateEndpointOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEndpointOutput, "UpdateEndpoint")
      end

      # Updates variant weight of one or more variants associated with an existing endpoint, or capacity of
      # one variant associated with an existing endpoint. When it receives the request, SageMaker sets the
      # endpoint status to Updating . After updating the endpoint, it sets the status to InService . To
      # check the status of an endpoint, use the DescribeEndpoint API.
      def update_endpoint_weights_and_capacities(
        desired_weights_and_capacities : Array(Types::DesiredWeightAndCapacity),
        endpoint_name : String
      ) : Types::UpdateEndpointWeightsAndCapacitiesOutput
        input = Types::UpdateEndpointWeightsAndCapacitiesInput.new(desired_weights_and_capacities: desired_weights_and_capacities, endpoint_name: endpoint_name)
        update_endpoint_weights_and_capacities(input)
      end
      def update_endpoint_weights_and_capacities(input : Types::UpdateEndpointWeightsAndCapacitiesInput) : Types::UpdateEndpointWeightsAndCapacitiesOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ENDPOINT_WEIGHTS_AND_CAPACITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateEndpointWeightsAndCapacitiesOutput, "UpdateEndpointWeightsAndCapacities")
      end

      # Adds, updates, or removes the description of an experiment. Updates the display name of an
      # experiment.
      def update_experiment(
        experiment_name : String,
        description : String? = nil,
        display_name : String? = nil
      ) : Types::UpdateExperimentResponse
        input = Types::UpdateExperimentRequest.new(experiment_name: experiment_name, description: description, display_name: display_name)
        update_experiment(input)
      end
      def update_experiment(input : Types::UpdateExperimentRequest) : Types::UpdateExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateExperimentResponse, "UpdateExperiment")
      end

      # Updates the feature group by either adding features or updating the online store configuration. Use
      # one of the following request parameters at a time while using the UpdateFeatureGroup API. You can
      # add features for your feature group using the FeatureAdditions request parameter. Features cannot be
      # removed from a feature group. You can update the online store configuration by using the
      # OnlineStoreConfig request parameter. If a TtlDuration is specified, the default TtlDuration applies
      # for all records added to the feature group after the feature group is updated . If a record level
      # TtlDuration exists from using the PutRecord API, the record level TtlDuration applies to that record
      # instead of the default TtlDuration . To remove the default TtlDuration from an existing feature
      # group, use the UpdateFeatureGroup API and set the TtlDuration Unit and Value to null .
      def update_feature_group(
        feature_group_name : String,
        feature_additions : Array(Types::FeatureDefinition)? = nil,
        online_store_config : Types::OnlineStoreConfigUpdate? = nil,
        throughput_config : Types::ThroughputConfigUpdate? = nil
      ) : Types::UpdateFeatureGroupResponse
        input = Types::UpdateFeatureGroupRequest.new(feature_group_name: feature_group_name, feature_additions: feature_additions, online_store_config: online_store_config, throughput_config: throughput_config)
        update_feature_group(input)
      end
      def update_feature_group(input : Types::UpdateFeatureGroupRequest) : Types::UpdateFeatureGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FEATURE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFeatureGroupResponse, "UpdateFeatureGroup")
      end

      # Updates the description and parameters of the feature group.
      def update_feature_metadata(
        feature_group_name : String,
        feature_name : String,
        description : String? = nil,
        parameter_additions : Array(Types::FeatureParameter)? = nil,
        parameter_removals : Array(String)? = nil
      ) : Nil
        input = Types::UpdateFeatureMetadataRequest.new(feature_group_name: feature_group_name, feature_name: feature_name, description: description, parameter_additions: parameter_additions, parameter_removals: parameter_removals)
        update_feature_metadata(input)
      end
      def update_feature_metadata(input : Types::UpdateFeatureMetadataRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FEATURE_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Update a hub.
      def update_hub(
        hub_name : String,
        hub_description : String? = nil,
        hub_display_name : String? = nil,
        hub_search_keywords : Array(String)? = nil
      ) : Types::UpdateHubResponse
        input = Types::UpdateHubRequest.new(hub_name: hub_name, hub_description: hub_description, hub_display_name: hub_display_name, hub_search_keywords: hub_search_keywords)
        update_hub(input)
      end
      def update_hub(input : Types::UpdateHubRequest) : Types::UpdateHubResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HUB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHubResponse, "UpdateHub")
      end

      # Updates SageMaker hub content (either a Model or Notebook resource). You can update the metadata
      # that describes the resource. In addition to the required request fields, specify at least one of the
      # following fields to update: HubContentDescription HubContentDisplayName HubContentMarkdown
      # HubContentSearchKeywords SupportStatus For more information about hubs, see Private curated hubs for
      # foundation model access control in JumpStart . If you want to update a ModelReference resource in
      # your hub, use the UpdateHubContentResource API instead.
      def update_hub_content(
        hub_content_name : String,
        hub_content_type : String,
        hub_content_version : String,
        hub_name : String,
        hub_content_description : String? = nil,
        hub_content_display_name : String? = nil,
        hub_content_markdown : String? = nil,
        hub_content_search_keywords : Array(String)? = nil,
        support_status : String? = nil
      ) : Types::UpdateHubContentResponse
        input = Types::UpdateHubContentRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_content_version: hub_content_version, hub_name: hub_name, hub_content_description: hub_content_description, hub_content_display_name: hub_content_display_name, hub_content_markdown: hub_content_markdown, hub_content_search_keywords: hub_content_search_keywords, support_status: support_status)
        update_hub_content(input)
      end
      def update_hub_content(input : Types::UpdateHubContentRequest) : Types::UpdateHubContentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HUB_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHubContentResponse, "UpdateHubContent")
      end

      # Updates the contents of a SageMaker hub for a ModelReference resource. A ModelReference allows you
      # to access public SageMaker JumpStart models from within your private hub. When using this API, you
      # can update the MinVersion field for additional flexibility in the model version. You shouldn't
      # update any additional fields when using this API, because the metadata in your private hub should
      # match the public JumpStart model's metadata. If you want to update a Model or Notebook resource in
      # your hub, use the UpdateHubContent API instead. For more information about adding model references
      # to your hub, see Add models to a private hub .
      def update_hub_content_reference(
        hub_content_name : String,
        hub_content_type : String,
        hub_name : String,
        min_version : String? = nil
      ) : Types::UpdateHubContentReferenceResponse
        input = Types::UpdateHubContentReferenceRequest.new(hub_content_name: hub_content_name, hub_content_type: hub_content_type, hub_name: hub_name, min_version: min_version)
        update_hub_content_reference(input)
      end
      def update_hub_content_reference(input : Types::UpdateHubContentReferenceRequest) : Types::UpdateHubContentReferenceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HUB_CONTENT_REFERENCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHubContentReferenceResponse, "UpdateHubContentReference")
      end

      # Updates the properties of a SageMaker AI image. To change the image's tags, use the AddTags and
      # DeleteTags APIs.
      def update_image(
        image_name : String,
        delete_properties : Array(String)? = nil,
        description : String? = nil,
        display_name : String? = nil,
        role_arn : String? = nil
      ) : Types::UpdateImageResponse
        input = Types::UpdateImageRequest.new(image_name: image_name, delete_properties: delete_properties, description: description, display_name: display_name, role_arn: role_arn)
        update_image(input)
      end
      def update_image(input : Types::UpdateImageRequest) : Types::UpdateImageResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateImageResponse, "UpdateImage")
      end

      # Updates the properties of a SageMaker AI image version.
      def update_image_version(
        image_name : String,
        alias : String? = nil,
        aliases_to_add : Array(String)? = nil,
        aliases_to_delete : Array(String)? = nil,
        horovod : Bool? = nil,
        job_type : String? = nil,
        ml_framework : String? = nil,
        processor : String? = nil,
        programming_lang : String? = nil,
        release_notes : String? = nil,
        vendor_guidance : String? = nil,
        version : Int32? = nil
      ) : Types::UpdateImageVersionResponse
        input = Types::UpdateImageVersionRequest.new(image_name: image_name, alias: alias, aliases_to_add: aliases_to_add, aliases_to_delete: aliases_to_delete, horovod: horovod, job_type: job_type, ml_framework: ml_framework, processor: processor, programming_lang: programming_lang, release_notes: release_notes, vendor_guidance: vendor_guidance, version: version)
        update_image_version(input)
      end
      def update_image_version(input : Types::UpdateImageVersionRequest) : Types::UpdateImageVersionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IMAGE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateImageVersionResponse, "UpdateImageVersion")
      end

      # Updates an inference component.
      def update_inference_component(
        inference_component_name : String,
        deployment_config : Types::InferenceComponentDeploymentConfig? = nil,
        runtime_config : Types::InferenceComponentRuntimeConfig? = nil,
        specification : Types::InferenceComponentSpecification? = nil
      ) : Types::UpdateInferenceComponentOutput
        input = Types::UpdateInferenceComponentInput.new(inference_component_name: inference_component_name, deployment_config: deployment_config, runtime_config: runtime_config, specification: specification)
        update_inference_component(input)
      end
      def update_inference_component(input : Types::UpdateInferenceComponentInput) : Types::UpdateInferenceComponentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INFERENCE_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInferenceComponentOutput, "UpdateInferenceComponent")
      end

      # Runtime settings for a model that is deployed with an inference component.
      def update_inference_component_runtime_config(
        desired_runtime_config : Types::InferenceComponentRuntimeConfig,
        inference_component_name : String
      ) : Types::UpdateInferenceComponentRuntimeConfigOutput
        input = Types::UpdateInferenceComponentRuntimeConfigInput.new(desired_runtime_config: desired_runtime_config, inference_component_name: inference_component_name)
        update_inference_component_runtime_config(input)
      end
      def update_inference_component_runtime_config(input : Types::UpdateInferenceComponentRuntimeConfigInput) : Types::UpdateInferenceComponentRuntimeConfigOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INFERENCE_COMPONENT_RUNTIME_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInferenceComponentRuntimeConfigOutput, "UpdateInferenceComponentRuntimeConfig")
      end

      # Updates an inference experiment that you created. The status of the inference experiment has to be
      # either Created , Running . For more information on the status of an inference experiment, see
      # DescribeInferenceExperiment .
      def update_inference_experiment(
        name : String,
        data_storage_config : Types::InferenceExperimentDataStorageConfig? = nil,
        description : String? = nil,
        model_variants : Array(Types::ModelVariantConfig)? = nil,
        schedule : Types::InferenceExperimentSchedule? = nil,
        shadow_mode_config : Types::ShadowModeConfig? = nil
      ) : Types::UpdateInferenceExperimentResponse
        input = Types::UpdateInferenceExperimentRequest.new(name: name, data_storage_config: data_storage_config, description: description, model_variants: model_variants, schedule: schedule, shadow_mode_config: shadow_mode_config)
        update_inference_experiment(input)
      end
      def update_inference_experiment(input : Types::UpdateInferenceExperimentRequest) : Types::UpdateInferenceExperimentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INFERENCE_EXPERIMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateInferenceExperimentResponse, "UpdateInferenceExperiment")
      end

      # Updates an MLflow App.
      def update_mlflow_app(
        arn : String,
        account_default_status : String? = nil,
        artifact_store_uri : String? = nil,
        default_domain_id_list : Array(String)? = nil,
        model_registration_mode : String? = nil,
        name : String? = nil,
        weekly_maintenance_window_start : String? = nil
      ) : Types::UpdateMlflowAppResponse
        input = Types::UpdateMlflowAppRequest.new(arn: arn, account_default_status: account_default_status, artifact_store_uri: artifact_store_uri, default_domain_id_list: default_domain_id_list, model_registration_mode: model_registration_mode, name: name, weekly_maintenance_window_start: weekly_maintenance_window_start)
        update_mlflow_app(input)
      end
      def update_mlflow_app(input : Types::UpdateMlflowAppRequest) : Types::UpdateMlflowAppResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MLFLOW_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMlflowAppResponse, "UpdateMlflowApp")
      end

      # Updates properties of an existing MLflow Tracking Server.
      def update_mlflow_tracking_server(
        tracking_server_name : String,
        artifact_store_uri : String? = nil,
        automatic_model_registration : Bool? = nil,
        tracking_server_size : String? = nil,
        weekly_maintenance_window_start : String? = nil
      ) : Types::UpdateMlflowTrackingServerResponse
        input = Types::UpdateMlflowTrackingServerRequest.new(tracking_server_name: tracking_server_name, artifact_store_uri: artifact_store_uri, automatic_model_registration: automatic_model_registration, tracking_server_size: tracking_server_size, weekly_maintenance_window_start: weekly_maintenance_window_start)
        update_mlflow_tracking_server(input)
      end
      def update_mlflow_tracking_server(input : Types::UpdateMlflowTrackingServerRequest) : Types::UpdateMlflowTrackingServerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MLFLOW_TRACKING_SERVER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMlflowTrackingServerResponse, "UpdateMlflowTrackingServer")
      end

      # Update an Amazon SageMaker Model Card. You cannot update both model card content and model card
      # status in a single call.
      def update_model_card(
        model_card_name : String,
        content : String? = nil,
        model_card_status : String? = nil
      ) : Types::UpdateModelCardResponse
        input = Types::UpdateModelCardRequest.new(model_card_name: model_card_name, content: content, model_card_status: model_card_status)
        update_model_card(input)
      end
      def update_model_card(input : Types::UpdateModelCardRequest) : Types::UpdateModelCardResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL_CARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelCardResponse, "UpdateModelCard")
      end

      # Updates a versioned model.
      def update_model_package(
        model_package_arn : String,
        additional_inference_specifications_to_add : Array(Types::AdditionalInferenceSpecificationDefinition)? = nil,
        approval_description : String? = nil,
        client_token : String? = nil,
        customer_metadata_properties : Hash(String, String)? = nil,
        customer_metadata_properties_to_remove : Array(String)? = nil,
        inference_specification : Types::InferenceSpecification? = nil,
        model_approval_status : String? = nil,
        model_card : Types::ModelPackageModelCard? = nil,
        model_life_cycle : Types::ModelLifeCycle? = nil,
        model_package_registration_type : String? = nil,
        source_uri : String? = nil
      ) : Types::UpdateModelPackageOutput
        input = Types::UpdateModelPackageInput.new(model_package_arn: model_package_arn, additional_inference_specifications_to_add: additional_inference_specifications_to_add, approval_description: approval_description, client_token: client_token, customer_metadata_properties: customer_metadata_properties, customer_metadata_properties_to_remove: customer_metadata_properties_to_remove, inference_specification: inference_specification, model_approval_status: model_approval_status, model_card: model_card, model_life_cycle: model_life_cycle, model_package_registration_type: model_package_registration_type, source_uri: source_uri)
        update_model_package(input)
      end
      def update_model_package(input : Types::UpdateModelPackageInput) : Types::UpdateModelPackageOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MODEL_PACKAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateModelPackageOutput, "UpdateModelPackage")
      end

      # Update the parameters of a model monitor alert.
      def update_monitoring_alert(
        datapoints_to_alert : Int32,
        evaluation_period : Int32,
        monitoring_alert_name : String,
        monitoring_schedule_name : String
      ) : Types::UpdateMonitoringAlertResponse
        input = Types::UpdateMonitoringAlertRequest.new(datapoints_to_alert: datapoints_to_alert, evaluation_period: evaluation_period, monitoring_alert_name: monitoring_alert_name, monitoring_schedule_name: monitoring_schedule_name)
        update_monitoring_alert(input)
      end
      def update_monitoring_alert(input : Types::UpdateMonitoringAlertRequest) : Types::UpdateMonitoringAlertResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MONITORING_ALERT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMonitoringAlertResponse, "UpdateMonitoringAlert")
      end

      # Updates a previously created schedule.
      def update_monitoring_schedule(
        monitoring_schedule_config : Types::MonitoringScheduleConfig,
        monitoring_schedule_name : String
      ) : Types::UpdateMonitoringScheduleResponse
        input = Types::UpdateMonitoringScheduleRequest.new(monitoring_schedule_config: monitoring_schedule_config, monitoring_schedule_name: monitoring_schedule_name)
        update_monitoring_schedule(input)
      end
      def update_monitoring_schedule(input : Types::UpdateMonitoringScheduleRequest) : Types::UpdateMonitoringScheduleResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MONITORING_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMonitoringScheduleResponse, "UpdateMonitoringSchedule")
      end

      # Updates a notebook instance. NotebookInstance updates include upgrading or downgrading the ML
      # compute instance used for your notebook instance to accommodate changes in your workload
      # requirements. This API can attach lifecycle configurations to notebook instances. Lifecycle
      # configuration scripts execute with root access and the notebook instance's IAM execution role
      # privileges. Principals with this permission and access to lifecycle configurations can execute code
      # with the execution role's credentials. See Customize a Notebook Instance Using a Lifecycle
      # Configuration Script for security best practices.
      def update_notebook_instance(
        notebook_instance_name : String,
        accelerator_types : Array(String)? = nil,
        additional_code_repositories : Array(String)? = nil,
        default_code_repository : String? = nil,
        disassociate_accelerator_types : Bool? = nil,
        disassociate_additional_code_repositories : Bool? = nil,
        disassociate_default_code_repository : Bool? = nil,
        disassociate_lifecycle_config : Bool? = nil,
        instance_metadata_service_configuration : Types::InstanceMetadataServiceConfiguration? = nil,
        instance_type : String? = nil,
        ip_address_type : String? = nil,
        lifecycle_config_name : String? = nil,
        platform_identifier : String? = nil,
        role_arn : String? = nil,
        root_access : String? = nil,
        volume_size_in_gb : Int32? = nil
      ) : Types::UpdateNotebookInstanceOutput
        input = Types::UpdateNotebookInstanceInput.new(notebook_instance_name: notebook_instance_name, accelerator_types: accelerator_types, additional_code_repositories: additional_code_repositories, default_code_repository: default_code_repository, disassociate_accelerator_types: disassociate_accelerator_types, disassociate_additional_code_repositories: disassociate_additional_code_repositories, disassociate_default_code_repository: disassociate_default_code_repository, disassociate_lifecycle_config: disassociate_lifecycle_config, instance_metadata_service_configuration: instance_metadata_service_configuration, instance_type: instance_type, ip_address_type: ip_address_type, lifecycle_config_name: lifecycle_config_name, platform_identifier: platform_identifier, role_arn: role_arn, root_access: root_access, volume_size_in_gb: volume_size_in_gb)
        update_notebook_instance(input)
      end
      def update_notebook_instance(input : Types::UpdateNotebookInstanceInput) : Types::UpdateNotebookInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTEBOOK_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotebookInstanceOutput, "UpdateNotebookInstance")
      end

      # Updates a notebook instance lifecycle configuration created with the
      # CreateNotebookInstanceLifecycleConfig API. Updates to lifecycle configurations affect all notebook
      # instances using that configuration upon their next start. Lifecycle configuration scripts execute
      # with root access and the notebook instance's IAM execution role privileges. Grant this permission
      # only to trusted principals. See Customize a Notebook Instance Using a Lifecycle Configuration Script
      # for security best practices.
      def update_notebook_instance_lifecycle_config(
        notebook_instance_lifecycle_config_name : String,
        on_create : Array(Types::NotebookInstanceLifecycleHook)? = nil,
        on_start : Array(Types::NotebookInstanceLifecycleHook)? = nil
      ) : Types::UpdateNotebookInstanceLifecycleConfigOutput
        input = Types::UpdateNotebookInstanceLifecycleConfigInput.new(notebook_instance_lifecycle_config_name: notebook_instance_lifecycle_config_name, on_create: on_create, on_start: on_start)
        update_notebook_instance_lifecycle_config(input)
      end
      def update_notebook_instance_lifecycle_config(input : Types::UpdateNotebookInstanceLifecycleConfigInput) : Types::UpdateNotebookInstanceLifecycleConfigOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTEBOOK_INSTANCE_LIFECYCLE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotebookInstanceLifecycleConfigOutput, "UpdateNotebookInstanceLifecycleConfig")
      end

      # Updates all of the SageMaker Partner AI Apps in an account.
      def update_partner_app(
        arn : String,
        app_version : String? = nil,
        application_config : Types::PartnerAppConfig? = nil,
        client_token : String? = nil,
        enable_auto_minor_version_upgrade : Bool? = nil,
        enable_iam_session_based_identity : Bool? = nil,
        maintenance_config : Types::PartnerAppMaintenanceConfig? = nil,
        tags : Array(Types::Tag)? = nil,
        tier : String? = nil
      ) : Types::UpdatePartnerAppResponse
        input = Types::UpdatePartnerAppRequest.new(arn: arn, app_version: app_version, application_config: application_config, client_token: client_token, enable_auto_minor_version_upgrade: enable_auto_minor_version_upgrade, enable_iam_session_based_identity: enable_iam_session_based_identity, maintenance_config: maintenance_config, tags: tags, tier: tier)
        update_partner_app(input)
      end
      def update_partner_app(input : Types::UpdatePartnerAppRequest) : Types::UpdatePartnerAppResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PARTNER_APP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePartnerAppResponse, "UpdatePartnerApp")
      end

      # Updates a pipeline.
      def update_pipeline(
        pipeline_name : String,
        parallelism_configuration : Types::ParallelismConfiguration? = nil,
        pipeline_definition : String? = nil,
        pipeline_definition_s3_location : Types::PipelineDefinitionS3Location? = nil,
        pipeline_description : String? = nil,
        pipeline_display_name : String? = nil,
        role_arn : String? = nil
      ) : Types::UpdatePipelineResponse
        input = Types::UpdatePipelineRequest.new(pipeline_name: pipeline_name, parallelism_configuration: parallelism_configuration, pipeline_definition: pipeline_definition, pipeline_definition_s3_location: pipeline_definition_s3_location, pipeline_description: pipeline_description, pipeline_display_name: pipeline_display_name, role_arn: role_arn)
        update_pipeline(input)
      end
      def update_pipeline(input : Types::UpdatePipelineRequest) : Types::UpdatePipelineResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PIPELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePipelineResponse, "UpdatePipeline")
      end

      # Updates a pipeline execution.
      def update_pipeline_execution(
        pipeline_execution_arn : String,
        parallelism_configuration : Types::ParallelismConfiguration? = nil,
        pipeline_execution_description : String? = nil,
        pipeline_execution_display_name : String? = nil
      ) : Types::UpdatePipelineExecutionResponse
        input = Types::UpdatePipelineExecutionRequest.new(pipeline_execution_arn: pipeline_execution_arn, parallelism_configuration: parallelism_configuration, pipeline_execution_description: pipeline_execution_description, pipeline_execution_display_name: pipeline_execution_display_name)
        update_pipeline_execution(input)
      end
      def update_pipeline_execution(input : Types::UpdatePipelineExecutionRequest) : Types::UpdatePipelineExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PIPELINE_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePipelineExecutionResponse, "UpdatePipelineExecution")
      end

      # Updates a pipeline version.
      def update_pipeline_version(
        pipeline_arn : String,
        pipeline_version_id : Int64,
        pipeline_version_description : String? = nil,
        pipeline_version_display_name : String? = nil
      ) : Types::UpdatePipelineVersionResponse
        input = Types::UpdatePipelineVersionRequest.new(pipeline_arn: pipeline_arn, pipeline_version_id: pipeline_version_id, pipeline_version_description: pipeline_version_description, pipeline_version_display_name: pipeline_version_display_name)
        update_pipeline_version(input)
      end
      def update_pipeline_version(input : Types::UpdatePipelineVersionRequest) : Types::UpdatePipelineVersionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PIPELINE_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePipelineVersionResponse, "UpdatePipelineVersion")
      end

      # Updates a machine learning (ML) project that is created from a template that sets up an ML pipeline
      # from training to deploying an approved model. You must not update a project that is in use. If you
      # update the ServiceCatalogProvisioningUpdateDetails of a project that is active or being created, or
      # updated, you may lose resources already created by the project.
      def update_project(
        project_name : String,
        project_description : String? = nil,
        service_catalog_provisioning_update_details : Types::ServiceCatalogProvisioningUpdateDetails? = nil,
        tags : Array(Types::Tag)? = nil,
        template_providers_to_update : Array(Types::UpdateTemplateProvider)? = nil
      ) : Types::UpdateProjectOutput
        input = Types::UpdateProjectInput.new(project_name: project_name, project_description: project_description, service_catalog_provisioning_update_details: service_catalog_provisioning_update_details, tags: tags, template_providers_to_update: template_providers_to_update)
        update_project(input)
      end
      def update_project(input : Types::UpdateProjectInput) : Types::UpdateProjectOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProjectOutput, "UpdateProject")
      end

      # Updates the settings of a space. You can't edit the app type of a space in the SpaceSettings .
      def update_space(
        domain_id : String,
        space_name : String,
        space_display_name : String? = nil,
        space_settings : Types::SpaceSettings? = nil
      ) : Types::UpdateSpaceResponse
        input = Types::UpdateSpaceRequest.new(domain_id: domain_id, space_name: space_name, space_display_name: space_display_name, space_settings: space_settings)
        update_space(input)
      end
      def update_space(input : Types::UpdateSpaceRequest) : Types::UpdateSpaceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSpaceResponse, "UpdateSpace")
      end

      # Update a model training job to request a new Debugger profiling configuration or to change warm pool
      # retention length.
      def update_training_job(
        training_job_name : String,
        profiler_config : Types::ProfilerConfigForUpdate? = nil,
        profiler_rule_configurations : Array(Types::ProfilerRuleConfiguration)? = nil,
        remote_debug_config : Types::RemoteDebugConfigForUpdate? = nil,
        resource_config : Types::ResourceConfigForUpdate? = nil
      ) : Types::UpdateTrainingJobResponse
        input = Types::UpdateTrainingJobRequest.new(training_job_name: training_job_name, profiler_config: profiler_config, profiler_rule_configurations: profiler_rule_configurations, remote_debug_config: remote_debug_config, resource_config: resource_config)
        update_training_job(input)
      end
      def update_training_job(input : Types::UpdateTrainingJobRequest) : Types::UpdateTrainingJobResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRAINING_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrainingJobResponse, "UpdateTrainingJob")
      end

      # Updates the display name of a trial.
      def update_trial(
        trial_name : String,
        display_name : String? = nil
      ) : Types::UpdateTrialResponse
        input = Types::UpdateTrialRequest.new(trial_name: trial_name, display_name: display_name)
        update_trial(input)
      end
      def update_trial(input : Types::UpdateTrialRequest) : Types::UpdateTrialResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRIAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrialResponse, "UpdateTrial")
      end

      # Updates one or more properties of a trial component.
      def update_trial_component(
        trial_component_name : String,
        display_name : String? = nil,
        end_time : Time? = nil,
        input_artifacts : Hash(String, Types::TrialComponentArtifact)? = nil,
        input_artifacts_to_remove : Array(String)? = nil,
        output_artifacts : Hash(String, Types::TrialComponentArtifact)? = nil,
        output_artifacts_to_remove : Array(String)? = nil,
        parameters : Hash(String, Types::TrialComponentParameterValue)? = nil,
        parameters_to_remove : Array(String)? = nil,
        start_time : Time? = nil,
        status : Types::TrialComponentStatus? = nil
      ) : Types::UpdateTrialComponentResponse
        input = Types::UpdateTrialComponentRequest.new(trial_component_name: trial_component_name, display_name: display_name, end_time: end_time, input_artifacts: input_artifacts, input_artifacts_to_remove: input_artifacts_to_remove, output_artifacts: output_artifacts, output_artifacts_to_remove: output_artifacts_to_remove, parameters: parameters, parameters_to_remove: parameters_to_remove, start_time: start_time, status: status)
        update_trial_component(input)
      end
      def update_trial_component(input : Types::UpdateTrialComponentRequest) : Types::UpdateTrialComponentResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRIAL_COMPONENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTrialComponentResponse, "UpdateTrialComponent")
      end

      # Updates a user profile.
      def update_user_profile(
        domain_id : String,
        user_profile_name : String,
        user_settings : Types::UserSettings? = nil
      ) : Types::UpdateUserProfileResponse
        input = Types::UpdateUserProfileRequest.new(domain_id: domain_id, user_profile_name: user_profile_name, user_settings: user_settings)
        update_user_profile(input)
      end
      def update_user_profile(input : Types::UpdateUserProfileRequest) : Types::UpdateUserProfileResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserProfileResponse, "UpdateUserProfile")
      end

      # Use this operation to update your workforce. You can use this operation to require that workers use
      # specific IP addresses to work on tasks and to update your OpenID Connect (OIDC) Identity Provider
      # (IdP) workforce configuration. The worker portal is now supported in VPC and public internet. Use
      # SourceIpConfig to restrict worker access to tasks to a specific range of IP addresses. You specify
      # allowed IP addresses by creating a list of up to ten CIDRs . By default, a workforce isn't
      # restricted to specific IP addresses. If you specify a range of IP addresses, workers who attempt to
      # access tasks using any IP address outside the specified range are denied and get a Not Found error
      # message on the worker portal. To restrict public internet access for all workers, configure the
      # SourceIpConfig CIDR value. For example, when using SourceIpConfig with an IpAddressType of IPv4 ,
      # you can restrict access to the IPv4 CIDR block "10.0.0.0/16". When using an IpAddressType of
      # dualstack , you can specify both the IPv4 and IPv6 CIDR blocks, such as "10.0.0.0/16" for IPv4 only,
      # "2001:db8:1234:1a00::/56" for IPv6 only, or "10.0.0.0/16" and "2001:db8:1234:1a00::/56" for dual
      # stack. Amazon SageMaker does not support Source Ip restriction for worker portals in VPC. Use
      # OidcConfig to update the configuration of a workforce created using your own OIDC IdP. You can only
      # update your OIDC IdP configuration when there are no work teams associated with your workforce. You
      # can delete work teams using the DeleteWorkteam operation. After restricting access to a range of IP
      # addresses or updating your OIDC IdP configuration with this operation, you can view details about
      # your update workforce using the DescribeWorkforce operation. This operation only applies to private
      # workforces.
      def update_workforce(
        workforce_name : String,
        ip_address_type : String? = nil,
        oidc_config : Types::OidcConfig? = nil,
        source_ip_config : Types::SourceIpConfig? = nil,
        workforce_vpc_config : Types::WorkforceVpcConfigRequest? = nil
      ) : Types::UpdateWorkforceResponse
        input = Types::UpdateWorkforceRequest.new(workforce_name: workforce_name, ip_address_type: ip_address_type, oidc_config: oidc_config, source_ip_config: source_ip_config, workforce_vpc_config: workforce_vpc_config)
        update_workforce(input)
      end
      def update_workforce(input : Types::UpdateWorkforceRequest) : Types::UpdateWorkforceResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKFORCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkforceResponse, "UpdateWorkforce")
      end

      # Updates an existing work team with new member definitions or description.
      def update_workteam(
        workteam_name : String,
        description : String? = nil,
        member_definitions : Array(Types::MemberDefinition)? = nil,
        notification_configuration : Types::NotificationConfiguration? = nil,
        worker_access_configuration : Types::WorkerAccessConfiguration? = nil
      ) : Types::UpdateWorkteamResponse
        input = Types::UpdateWorkteamRequest.new(workteam_name: workteam_name, description: description, member_definitions: member_definitions, notification_configuration: notification_configuration, worker_access_configuration: worker_access_configuration)
        update_workteam(input)
      end
      def update_workteam(input : Types::UpdateWorkteamRequest) : Types::UpdateWorkteamResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_WORKTEAM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateWorkteamResponse, "UpdateWorkteam")
      end
    end
  end
end
