module AwsSdk
  module EMRContainers
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

      # Cancels a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL
      # query, that you submit to Amazon EMR on EKS.
      def cancel_job_run(
        id : String,
        virtual_cluster_id : String
      ) : Protocol::Request
        input = Types::CancelJobRunRequest.new(id: id, virtual_cluster_id: virtual_cluster_id)
        cancel_job_run(input)
      end
      def cancel_job_run(input : Types::CancelJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a job template. Job template stores values of StartJobRun API request in a template and can
      # be used to start a job run. Job template allows two use cases: avoid repeating recurring StartJobRun
      # API request values, enforcing certain values in StartJobRun API request.
      def create_job_template(
        client_token : String,
        job_template_data : Types::JobTemplateData,
        name : String,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateJobTemplateRequest.new(client_token: client_token, job_template_data: job_template_data, name: name, kms_key_arn: kms_key_arn, tags: tags)
        create_job_template(input)
      end
      def create_job_template(input : Types::CreateJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a managed endpoint. A managed endpoint is a gateway that connects Amazon EMR Studio to
      # Amazon EMR on EKS so that Amazon EMR Studio can communicate with your virtual cluster.
      def create_managed_endpoint(
        client_token : String,
        execution_role_arn : String,
        name : String,
        release_label : String,
        type : String,
        virtual_cluster_id : String,
        certificate_arn : String? = nil,
        configuration_overrides : Types::ConfigurationOverrides? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateManagedEndpointRequest.new(client_token: client_token, execution_role_arn: execution_role_arn, name: name, release_label: release_label, type: type, virtual_cluster_id: virtual_cluster_id, certificate_arn: certificate_arn, configuration_overrides: configuration_overrides, tags: tags)
        create_managed_endpoint(input)
      end
      def create_managed_endpoint(input : Types::CreateManagedEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MANAGED_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a security configuration. Security configurations in Amazon EMR on EKS are templates for
      # different security setups. You can use security configurations to configure the Lake Formation
      # integration setup. You can also create a security configuration to re-use a security setup each time
      # you create a virtual cluster.
      def create_security_configuration(
        client_token : String,
        name : String,
        security_configuration_data : Types::SecurityConfigurationData,
        container_provider : Types::ContainerProvider? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSecurityConfigurationRequest.new(client_token: client_token, name: name, security_configuration_data: security_configuration_data, container_provider: container_provider, tags: tags)
        create_security_configuration(input)
      end
      def create_security_configuration(input : Types::CreateSecurityConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SECURITY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create,
      # describe, list and delete virtual clusters. They do not consume any additional resource in your
      # system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you
      # can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.
      def create_virtual_cluster(
        client_token : String,
        container_provider : Types::ContainerProvider,
        name : String,
        security_configuration_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVirtualClusterRequest.new(client_token: client_token, container_provider: container_provider, name: name, security_configuration_id: security_configuration_id, tags: tags)
        create_virtual_cluster(input)
      end
      def create_virtual_cluster(input : Types::CreateVirtualClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIRTUAL_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a job template. Job template stores values of StartJobRun API request in a template and can
      # be used to start a job run. Job template allows two use cases: avoid repeating recurring StartJobRun
      # API request values, enforcing certain values in StartJobRun API request.
      def delete_job_template(
        id : String
      ) : Protocol::Request
        input = Types::DeleteJobTemplateRequest.new(id: id)
        delete_job_template(input)
      end
      def delete_job_template(input : Types::DeleteJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a managed endpoint. A managed endpoint is a gateway that connects Amazon EMR Studio to
      # Amazon EMR on EKS so that Amazon EMR Studio can communicate with your virtual cluster.
      def delete_managed_endpoint(
        id : String,
        virtual_cluster_id : String
      ) : Protocol::Request
        input = Types::DeleteManagedEndpointRequest.new(id: id, virtual_cluster_id: virtual_cluster_id)
        delete_managed_endpoint(input)
      end
      def delete_managed_endpoint(input : Types::DeleteManagedEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MANAGED_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a virtual cluster. Virtual cluster is a managed entity on Amazon EMR on EKS. You can create,
      # describe, list and delete virtual clusters. They do not consume any additional resource in your
      # system. A single virtual cluster maps to a single Kubernetes namespace. Given this relationship, you
      # can model virtual clusters the same way you model Kubernetes namespaces to meet your requirements.
      def delete_virtual_cluster(
        id : String
      ) : Protocol::Request
        input = Types::DeleteVirtualClusterRequest.new(id: id)
        delete_virtual_cluster(input)
      end
      def delete_virtual_cluster(input : Types::DeleteVirtualClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIRTUAL_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a job run. A job run is a unit of work, such as a Spark jar,
      # PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.
      def describe_job_run(
        id : String,
        virtual_cluster_id : String
      ) : Protocol::Request
        input = Types::DescribeJobRunRequest.new(id: id, virtual_cluster_id: virtual_cluster_id)
        describe_job_run(input)
      end
      def describe_job_run(input : Types::DescribeJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a specified job template. Job template stores values of
      # StartJobRun API request in a template and can be used to start a job run. Job template allows two
      # use cases: avoid repeating recurring StartJobRun API request values, enforcing certain values in
      # StartJobRun API request.
      def describe_job_template(
        id : String
      ) : Protocol::Request
        input = Types::DescribeJobTemplateRequest.new(id: id)
        describe_job_template(input)
      end
      def describe_job_template(input : Types::DescribeJobTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_JOB_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a managed endpoint. A managed endpoint is a gateway that
      # connects Amazon EMR Studio to Amazon EMR on EKS so that Amazon EMR Studio can communicate with your
      # virtual cluster.
      def describe_managed_endpoint(
        id : String,
        virtual_cluster_id : String
      ) : Protocol::Request
        input = Types::DescribeManagedEndpointRequest.new(id: id, virtual_cluster_id: virtual_cluster_id)
        describe_managed_endpoint(input)
      end
      def describe_managed_endpoint(input : Types::DescribeManagedEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MANAGED_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a specified security configuration. Security configurations in
      # Amazon EMR on EKS are templates for different security setups. You can use security configurations
      # to configure the Lake Formation integration setup. You can also create a security configuration to
      # re-use a security setup each time you create a virtual cluster.
      def describe_security_configuration(
        id : String
      ) : Protocol::Request
        input = Types::DescribeSecurityConfigurationRequest.new(id: id)
        describe_security_configuration(input)
      end
      def describe_security_configuration(input : Types::DescribeSecurityConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SECURITY_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays detailed information about a specified virtual cluster. Virtual cluster is a managed entity
      # on Amazon EMR on EKS. You can create, describe, list and delete virtual clusters. They do not
      # consume any additional resource in your system. A single virtual cluster maps to a single Kubernetes
      # namespace. Given this relationship, you can model virtual clusters the same way you model Kubernetes
      # namespaces to meet your requirements.
      def describe_virtual_cluster(
        id : String
      ) : Protocol::Request
        input = Types::DescribeVirtualClusterRequest.new(id: id)
        describe_virtual_cluster(input)
      end
      def describe_virtual_cluster(input : Types::DescribeVirtualClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIRTUAL_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generate a session token to connect to a managed endpoint.
      def get_managed_endpoint_session_credentials(
        credential_type : String,
        endpoint_identifier : String,
        execution_role_arn : String,
        virtual_cluster_identifier : String,
        client_token : String? = nil,
        duration_in_seconds : Int32? = nil,
        log_context : String? = nil
      ) : Protocol::Request
        input = Types::GetManagedEndpointSessionCredentialsRequest.new(credential_type: credential_type, endpoint_identifier: endpoint_identifier, execution_role_arn: execution_role_arn, virtual_cluster_identifier: virtual_cluster_identifier, client_token: client_token, duration_in_seconds: duration_in_seconds, log_context: log_context)
        get_managed_endpoint_session_credentials(input)
      end
      def get_managed_endpoint_session_credentials(input : Types::GetManagedEndpointSessionCredentialsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MANAGED_ENDPOINT_SESSION_CREDENTIALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists job runs based on a set of parameters. A job run is a unit of work, such as a Spark jar,
      # PySpark script, or SparkSQL query, that you submit to Amazon EMR on EKS.
      def list_job_runs(
        virtual_cluster_id : String,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListJobRunsRequest.new(virtual_cluster_id: virtual_cluster_id, created_after: created_after, created_before: created_before, max_results: max_results, name: name, next_token: next_token, states: states)
        list_job_runs(input)
      end
      def list_job_runs(input : Types::ListJobRunsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_RUNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists job templates based on a set of parameters. Job template stores values of StartJobRun API
      # request in a template and can be used to start a job run. Job template allows two use cases: avoid
      # repeating recurring StartJobRun API request values, enforcing certain values in StartJobRun API
      # request.
      def list_job_templates(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListJobTemplatesRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token)
        list_job_templates(input)
      end
      def list_job_templates(input : Types::ListJobTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_JOB_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists managed endpoints based on a set of parameters. A managed endpoint is a gateway that connects
      # Amazon EMR Studio to Amazon EMR on EKS so that Amazon EMR Studio can communicate with your virtual
      # cluster.
      def list_managed_endpoints(
        virtual_cluster_id : String,
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil,
        types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListManagedEndpointsRequest.new(virtual_cluster_id: virtual_cluster_id, created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token, states: states, types: types)
        list_managed_endpoints(input)
      end
      def list_managed_endpoints(input : Types::ListManagedEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MANAGED_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists security configurations based on a set of parameters. Security configurations in Amazon EMR on
      # EKS are templates for different security setups. You can use security configurations to configure
      # the Lake Formation integration setup. You can also create a security configuration to re-use a
      # security setup each time you create a virtual cluster.
      def list_security_configurations(
        created_after : Time? = nil,
        created_before : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityConfigurationsRequest.new(created_after: created_after, created_before: created_before, max_results: max_results, next_token: next_token)
        list_security_configurations(input)
      end
      def list_security_configurations(input : Types::ListSecurityConfigurationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags assigned to the resources.
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

      # Lists information about the specified virtual cluster. Virtual cluster is a managed entity on Amazon
      # EMR on EKS. You can create, describe, list and delete virtual clusters. They do not consume any
      # additional resource in your system. A single virtual cluster maps to a single Kubernetes namespace.
      # Given this relationship, you can model virtual clusters the same way you model Kubernetes namespaces
      # to meet your requirements.
      def list_virtual_clusters(
        container_provider_id : String? = nil,
        container_provider_type : String? = nil,
        created_after : Time? = nil,
        created_before : Time? = nil,
        eks_access_entry_integrated : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        states : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListVirtualClustersRequest.new(container_provider_id: container_provider_id, container_provider_type: container_provider_type, created_after: created_after, created_before: created_before, eks_access_entry_integrated: eks_access_entry_integrated, max_results: max_results, next_token: next_token, states: states)
        list_virtual_clusters(input)
      end
      def list_virtual_clusters(input : Types::ListVirtualClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIRTUAL_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts a job run. A job run is a unit of work, such as a Spark jar, PySpark script, or SparkSQL
      # query, that you submit to Amazon EMR on EKS.
      def start_job_run(
        client_token : String,
        virtual_cluster_id : String,
        configuration_overrides : Types::ConfigurationOverrides? = nil,
        execution_role_arn : String? = nil,
        job_driver : Types::JobDriver? = nil,
        job_template_id : String? = nil,
        job_template_parameters : Hash(String, String)? = nil,
        name : String? = nil,
        release_label : String? = nil,
        retry_policy_configuration : Types::RetryPolicyConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartJobRunRequest.new(client_token: client_token, virtual_cluster_id: virtual_cluster_id, configuration_overrides: configuration_overrides, execution_role_arn: execution_role_arn, job_driver: job_driver, job_template_id: job_template_id, job_template_parameters: job_template_parameters, name: name, release_label: release_label, retry_policy_configuration: retry_policy_configuration, tags: tags)
        start_job_run(input)
      end
      def start_job_run(input : Types::StartJobRunRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_JOB_RUN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns tags to resources. A tag is a label that you assign to an Amazon Web Services resource. Each
      # tag consists of a key and an optional value, both of which you define. Tags enable you to categorize
      # your Amazon Web Services resources by attributes such as purpose, owner, or environment. When you
      # have many resources of the same type, you can quickly identify a specific resource based on the tags
      # you've assigned to it. For example, you can define a set of tags for your Amazon EMR on EKS clusters
      # to help you track each cluster's owner and stack level. We recommend that you devise a consistent
      # set of tag keys for each resource type. You can then search and filter the resources based on the
      # tags that you add.
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

      # Removes tags from resources.
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
    end
  end
end
