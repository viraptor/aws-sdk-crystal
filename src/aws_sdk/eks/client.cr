module AwsSdk
  module EKS
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

      # Associates an access policy and its scope to an access entry. For more information about associating
      # access policies, see Associating and disassociating access policies to and from access entries in
      # the Amazon EKS User Guide .

      def associate_access_policy(
        access_scope : Types::AccessScope,
        cluster_name : String,
        policy_arn : String,
        principal_arn : String
      ) : Protocol::Request
        input = Types::AssociateAccessPolicyRequest.new(access_scope: access_scope, cluster_name: cluster_name, policy_arn: policy_arn, principal_arn: principal_arn)
        associate_access_policy(input)
      end

      def associate_access_policy(input : Types::AssociateAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an encryption configuration to an existing cluster. Use this API to enable encryption on
      # existing clusters that don't already have encryption enabled. This allows you to implement a
      # defense-in-depth security strategy without migrating applications to new Amazon EKS clusters.

      def associate_encryption_config(
        cluster_name : String,
        encryption_config : Array(Types::EncryptionConfig),
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateEncryptionConfigRequest.new(cluster_name: cluster_name, encryption_config: encryption_config, client_request_token: client_request_token)
        associate_encryption_config(input)
      end

      def associate_encryption_config(input : Types::AssociateEncryptionConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ENCRYPTION_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an identity provider configuration to a cluster. If you want to authenticate identities
      # using an identity provider, you can create an identity provider configuration and associate it to
      # your cluster. After configuring authentication to your cluster you can create Kubernetes Role and
      # ClusterRole objects, assign permissions to them, and then bind them to the identities using
      # Kubernetes RoleBinding and ClusterRoleBinding objects. For more information see Using RBAC
      # Authorization in the Kubernetes documentation.

      def associate_identity_provider_config(
        cluster_name : String,
        oidc : Types::OidcIdentityProviderConfigRequest,
        client_request_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::AssociateIdentityProviderConfigRequest.new(cluster_name: cluster_name, oidc: oidc, client_request_token: client_request_token, tags: tags)
        associate_identity_provider_config(input)
      end

      def associate_identity_provider_config(input : Types::AssociateIdentityProviderConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_IDENTITY_PROVIDER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an access entry. An access entry allows an IAM principal to access your cluster. Access
      # entries can replace the need to maintain entries in the aws-auth ConfigMap for authentication. You
      # have the following options for authorizing an IAM principal to access Kubernetes objects on your
      # cluster: Kubernetes role-based access control (RBAC), Amazon EKS, or both. Kubernetes RBAC
      # authorization requires you to create and manage Kubernetes Role , ClusterRole , RoleBinding , and
      # ClusterRoleBinding objects, in addition to managing access entries. If you use Amazon EKS
      # authorization exclusively, you don't need to create and manage Kubernetes Role , ClusterRole ,
      # RoleBinding , and ClusterRoleBinding objects. For more information about access entries, see Access
      # entries in the Amazon EKS User Guide .

      def create_access_entry(
        cluster_name : String,
        principal_arn : String,
        client_request_token : String? = nil,
        kubernetes_groups : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        type : String? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::CreateAccessEntryRequest.new(cluster_name: cluster_name, principal_arn: principal_arn, client_request_token: client_request_token, kubernetes_groups: kubernetes_groups, tags: tags, type: type, username: username)
        create_access_entry(input)
      end

      def create_access_entry(input : Types::CreateAccessEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon EKS add-on. Amazon EKS add-ons help to automate the provisioning and lifecycle
      # management of common operational software for Amazon EKS clusters. For more information, see Amazon
      # EKS add-ons in the Amazon EKS User Guide .

      def create_addon(
        addon_name : String,
        cluster_name : String,
        addon_version : String? = nil,
        client_request_token : String? = nil,
        configuration_values : String? = nil,
        namespace_config : Types::AddonNamespaceConfigRequest? = nil,
        pod_identity_associations : Array(Types::AddonPodIdentityAssociations)? = nil,
        resolve_conflicts : String? = nil,
        service_account_role_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAddonRequest.new(addon_name: addon_name, cluster_name: cluster_name, addon_version: addon_version, client_request_token: client_request_token, configuration_values: configuration_values, namespace_config: namespace_config, pod_identity_associations: pod_identity_associations, resolve_conflicts: resolve_conflicts, service_account_role_arn: service_account_role_arn, tags: tags)
        create_addon(input)
      end

      def create_addon(input : Types::CreateAddonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ADDON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a managed capability resource for an Amazon EKS cluster. Capabilities provide fully managed
      # capabilities to build and scale with Kubernetes. When you create a capability, Amazon EKSprovisions
      # and manages the infrastructure required to run the capability outside of your cluster. This approach
      # reduces operational overhead and preserves cluster resources. You can only create one Capability of
      # each type on a given Amazon EKS cluster. Valid types are Argo CD for declarative GitOps deployment,
      # Amazon Web Services Controllers for Kubernetes (ACK) for resource management, and Kube Resource
      # Orchestrator (KRO) for Kubernetes custom resource orchestration. For more information, see EKS
      # Capabilities in the Amazon EKS User Guide .

      def create_capability(
        capability_name : String,
        cluster_name : String,
        delete_propagation_policy : String,
        role_arn : String,
        type : String,
        client_request_token : String? = nil,
        configuration : Types::CapabilityConfigurationRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateCapabilityRequest.new(capability_name: capability_name, cluster_name: cluster_name, delete_propagation_policy: delete_propagation_policy, role_arn: role_arn, type: type, client_request_token: client_request_token, configuration: configuration, tags: tags)
        create_capability(input)
      end

      def create_capability(input : Types::CreateCapabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CAPABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon EKS control plane. The Amazon EKS control plane consists of control plane
      # instances that run the Kubernetes software, such as etcd and the API server. The control plane runs
      # in an account managed by Amazon Web Services, and the Kubernetes API is exposed by the Amazon EKS
      # API server endpoint. Each Amazon EKS cluster control plane is single tenant and unique. It runs on
      # its own set of Amazon EC2 instances. The cluster control plane is provisioned across multiple
      # Availability Zones and fronted by an ELB Network Load Balancer. Amazon EKS also provisions elastic
      # network interfaces in your VPC subnets to provide connectivity from the control plane instances to
      # the nodes (for example, to support kubectl exec , logs , and proxy data flows). Amazon EKS nodes run
      # in your Amazon Web Services account and connect to your cluster's control plane over the Kubernetes
      # API server endpoint and a certificate file that is created for your cluster. You can use the
      # endpointPublicAccess and endpointPrivateAccess parameters to enable or disable public and private
      # access to your cluster's Kubernetes API server endpoint. By default, public access is enabled, and
      # private access is disabled. The endpoint domain name and IP address family depends on the value of
      # the ipFamily for the cluster. For more information, see Amazon EKS Cluster Endpoint Access Control
      # in the Amazon EKS User Guide . You can use the logging parameter to enable or disable exporting the
      # Kubernetes control plane logs for your cluster to CloudWatch Logs. By default, cluster control plane
      # logs aren't exported to CloudWatch Logs. For more information, see Amazon EKS Cluster Control Plane
      # Logs in the Amazon EKS User Guide . CloudWatch Logs ingestion, archive storage, and data scanning
      # rates apply to exported control plane logs. For more information, see CloudWatch Pricing . In most
      # cases, it takes several minutes to create a cluster. After you create an Amazon EKS cluster, you
      # must configure your Kubernetes tooling to communicate with the API server and launch nodes into your
      # cluster. For more information, see Allowing users to access your cluster and Launching Amazon EKS
      # nodes in the Amazon EKS User Guide .

      def create_cluster(
        name : String,
        resources_vpc_config : Types::VpcConfigRequest,
        role_arn : String,
        access_config : Types::CreateAccessConfigRequest? = nil,
        bootstrap_self_managed_addons : Bool? = nil,
        client_request_token : String? = nil,
        compute_config : Types::ComputeConfigRequest? = nil,
        control_plane_scaling_config : Types::ControlPlaneScalingConfig? = nil,
        deletion_protection : Bool? = nil,
        encryption_config : Array(Types::EncryptionConfig)? = nil,
        kubernetes_network_config : Types::KubernetesNetworkConfigRequest? = nil,
        logging : Types::Logging? = nil,
        outpost_config : Types::OutpostConfigRequest? = nil,
        remote_network_config : Types::RemoteNetworkConfigRequest? = nil,
        storage_config : Types::StorageConfigRequest? = nil,
        tags : Hash(String, String)? = nil,
        upgrade_policy : Types::UpgradePolicyRequest? = nil,
        version : String? = nil,
        zonal_shift_config : Types::ZonalShiftConfigRequest? = nil
      ) : Protocol::Request
        input = Types::CreateClusterRequest.new(name: name, resources_vpc_config: resources_vpc_config, role_arn: role_arn, access_config: access_config, bootstrap_self_managed_addons: bootstrap_self_managed_addons, client_request_token: client_request_token, compute_config: compute_config, control_plane_scaling_config: control_plane_scaling_config, deletion_protection: deletion_protection, encryption_config: encryption_config, kubernetes_network_config: kubernetes_network_config, logging: logging, outpost_config: outpost_config, remote_network_config: remote_network_config, storage_config: storage_config, tags: tags, upgrade_policy: upgrade_policy, version: version, zonal_shift_config: zonal_shift_config)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an EKS Anywhere subscription. When a subscription is created, it is a contract agreement for
      # the length of the term specified in the request. Licenses that are used to validate support are
      # provisioned in Amazon Web Services License Manager and the caller account is granted access to EKS
      # Anywhere Curated Packages.

      def create_eks_anywhere_subscription(
        name : String,
        term : Types::EksAnywhereSubscriptionTerm,
        auto_renew : Bool? = nil,
        client_request_token : String? = nil,
        license_quantity : Int32? = nil,
        license_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEksAnywhereSubscriptionRequest.new(name: name, term: term, auto_renew: auto_renew, client_request_token: client_request_token, license_quantity: license_quantity, license_type: license_type, tags: tags)
        create_eks_anywhere_subscription(input)
      end

      def create_eks_anywhere_subscription(input : Types::CreateEksAnywhereSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EKS_ANYWHERE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Fargate profile for your Amazon EKS cluster. You must have at least one Fargate profile
      # in a cluster to be able to run pods on Fargate. The Fargate profile allows an administrator to
      # declare which pods run on Fargate and specify which pods run on which Fargate profile. This
      # declaration is done through the profile's selectors. Each profile can have up to five selectors that
      # contain a namespace and labels. A namespace is required for every selector. The label field consists
      # of multiple optional key-value pairs. Pods that match the selectors are scheduled on Fargate. If a
      # to-be-scheduled pod matches any of the selectors in the Fargate profile, then that pod is run on
      # Fargate. When you create a Fargate profile, you must specify a pod execution role to use with the
      # pods that are scheduled with the profile. This role is added to the cluster's Kubernetes Role Based
      # Access Control (RBAC) for authorization so that the kubelet that is running on the Fargate
      # infrastructure can register with your Amazon EKS cluster so that it can appear in your cluster as a
      # node. The pod execution role also provides IAM permissions to the Fargate infrastructure to allow
      # read access to Amazon ECR image repositories. For more information, see Pod Execution Role in the
      # Amazon EKS User Guide . Fargate profiles are immutable. However, you can create a new updated
      # profile to replace an existing profile and then delete the original after the updated profile has
      # finished creating. If any Fargate profiles in a cluster are in the DELETING status, you must wait
      # for that Fargate profile to finish deleting before you can create any other profiles in that
      # cluster. For more information, see Fargate profile in the Amazon EKS User Guide .

      def create_fargate_profile(
        cluster_name : String,
        fargate_profile_name : String,
        pod_execution_role_arn : String,
        client_request_token : String? = nil,
        selectors : Array(Types::FargateProfileSelector)? = nil,
        subnets : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateFargateProfileRequest.new(cluster_name: cluster_name, fargate_profile_name: fargate_profile_name, pod_execution_role_arn: pod_execution_role_arn, client_request_token: client_request_token, selectors: selectors, subnets: subnets, tags: tags)
        create_fargate_profile(input)
      end

      def create_fargate_profile(input : Types::CreateFargateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FARGATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a managed node group for an Amazon EKS cluster. You can only create a node group for your
      # cluster that is equal to the current Kubernetes version for the cluster. All node groups are created
      # with the latest AMI release version for the respective minor Kubernetes version of the cluster,
      # unless you deploy a custom AMI using a launch template. For later updates, you will only be able to
      # update a node group using a launch template only if it was originally deployed with a launch
      # template. Additionally, the launch template ID or name must match what was used when the node group
      # was created. You can update the launch template version with necessary changes. For more information
      # about using launch templates, see Customizing managed nodes with launch templates . An Amazon EKS
      # managed node group is an Amazon EC2 Auto Scaling group and associated Amazon EC2 instances that are
      # managed by Amazon Web Services for an Amazon EKS cluster. For more information, see Managed node
      # groups in the Amazon EKS User Guide . Windows AMI types are only supported for commercial Amazon Web
      # Services Regions that support Windows on Amazon EKS.

      def create_nodegroup(
        cluster_name : String,
        node_role : String,
        nodegroup_name : String,
        subnets : Array(String),
        ami_type : String? = nil,
        capacity_type : String? = nil,
        client_request_token : String? = nil,
        disk_size : Int32? = nil,
        instance_types : Array(String)? = nil,
        labels : Hash(String, String)? = nil,
        launch_template : Types::LaunchTemplateSpecification? = nil,
        node_repair_config : Types::NodeRepairConfig? = nil,
        release_version : String? = nil,
        remote_access : Types::RemoteAccessConfig? = nil,
        scaling_config : Types::NodegroupScalingConfig? = nil,
        tags : Hash(String, String)? = nil,
        taints : Array(Types::Taint)? = nil,
        update_config : Types::NodegroupUpdateConfig? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::CreateNodegroupRequest.new(cluster_name: cluster_name, node_role: node_role, nodegroup_name: nodegroup_name, subnets: subnets, ami_type: ami_type, capacity_type: capacity_type, client_request_token: client_request_token, disk_size: disk_size, instance_types: instance_types, labels: labels, launch_template: launch_template, node_repair_config: node_repair_config, release_version: release_version, remote_access: remote_access, scaling_config: scaling_config, tags: tags, taints: taints, update_config: update_config, version: version)
        create_nodegroup(input)
      end

      def create_nodegroup(input : Types::CreateNodegroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_NODEGROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an EKS Pod Identity association between a service account in an Amazon EKS cluster and an
      # IAM role with EKS Pod Identity . Use EKS Pod Identity to give temporary IAM credentials to Pods and
      # the credentials are rotated automatically. Amazon EKS Pod Identity associations provide the ability
      # to manage credentials for your applications, similar to the way that Amazon EC2 instance profiles
      # provide credentials to Amazon EC2 instances. If a Pod uses a service account that has an
      # association, Amazon EKS sets environment variables in the containers of the Pod. The environment
      # variables configure the Amazon Web Services SDKs, including the Command Line Interface, to use the
      # EKS Pod Identity credentials. EKS Pod Identity is a simpler method than IAM roles for service
      # accounts , as this method doesn't use OIDC identity providers. Additionally, you can configure a
      # role for EKS Pod Identity once, and reuse it across clusters. Similar to Amazon Web Services IAM
      # behavior, EKS Pod Identity associations are eventually consistent, and may take several seconds to
      # be effective after the initial API call returns successfully. You must design your applications to
      # account for these potential delays. We recommend that you don’t include association create/updates
      # in the critical, high-availability code paths of your application. Instead, make changes in a
      # separate initialization or setup routine that you run less frequently. You can set a target IAM role
      # in the same or a different account for advanced scenarios. With a target role, EKS Pod Identity
      # automatically performs two role assumptions in sequence: first assuming the role in the association
      # that is in this account, then using those credentials to assume the target IAM role. This process
      # provides your Pod with temporary credentials that have the permissions defined in the target role,
      # allowing secure access to resources in another Amazon Web Services account.

      def create_pod_identity_association(
        cluster_name : String,
        namespace : String,
        role_arn : String,
        service_account : String,
        client_request_token : String? = nil,
        disable_session_tags : Bool? = nil,
        tags : Hash(String, String)? = nil,
        target_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreatePodIdentityAssociationRequest.new(cluster_name: cluster_name, namespace: namespace, role_arn: role_arn, service_account: service_account, client_request_token: client_request_token, disable_session_tags: disable_session_tags, tags: tags, target_role_arn: target_role_arn)
        create_pod_identity_association(input)
      end

      def create_pod_identity_association(input : Types::CreatePodIdentityAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_POD_IDENTITY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an access entry. Deleting an access entry of a type other than Standard can cause your
      # cluster to function improperly. If you delete an access entry in error, you can recreate it.

      def delete_access_entry(
        cluster_name : String,
        principal_arn : String
      ) : Protocol::Request
        input = Types::DeleteAccessEntryRequest.new(cluster_name: cluster_name, principal_arn: principal_arn)
        delete_access_entry(input)
      end

      def delete_access_entry(input : Types::DeleteAccessEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon EKS add-on. When you remove an add-on, it's deleted from the cluster. You can
      # always manually start an add-on on the cluster using the Kubernetes API.

      def delete_addon(
        addon_name : String,
        cluster_name : String,
        preserve : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteAddonRequest.new(addon_name: addon_name, cluster_name: cluster_name, preserve: preserve)
        delete_addon(input)
      end

      def delete_addon(input : Types::DeleteAddonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ADDON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a managed capability from your Amazon EKS cluster. When you delete a capability, Amazon EKS
      # removes the capability infrastructure but retains all resources that were managed by the capability.
      # Before deleting a capability, you should delete all Kubernetes resources that were created by the
      # capability. After the capability is deleted, these resources become difficult to manage because the
      # controller that managed them is no longer available. To delete resources before removing the
      # capability, use kubectl delete or remove them through your GitOps workflow.

      def delete_capability(
        capability_name : String,
        cluster_name : String
      ) : Protocol::Request
        input = Types::DeleteCapabilityRequest.new(capability_name: capability_name, cluster_name: cluster_name)
        delete_capability(input)
      end

      def delete_capability(input : Types::DeleteCapabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CAPABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon EKS cluster control plane. If you have active services in your cluster that are
      # associated with a load balancer, you must delete those services before deleting the cluster so that
      # the load balancers are deleted properly. Otherwise, you can have orphaned resources in your VPC that
      # prevent you from being able to delete the VPC. For more information, see Deleting a cluster in the
      # Amazon EKS User Guide . If you have managed node groups or Fargate profiles attached to the cluster,
      # you must delete them first. For more information, see DeleteNodgroup and DeleteFargateProfile .

      def delete_cluster(
        name : String
      ) : Protocol::Request
        input = Types::DeleteClusterRequest.new(name: name)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an expired or inactive subscription. Deleting inactive subscriptions removes them from the
      # Amazon Web Services Management Console view and from list/describe API responses. Subscriptions can
      # only be cancelled within 7 days of creation and are cancelled by creating a ticket in the Amazon Web
      # Services Support Center.

      def delete_eks_anywhere_subscription(
        id : String
      ) : Protocol::Request
        input = Types::DeleteEksAnywhereSubscriptionRequest.new(id: id)
        delete_eks_anywhere_subscription(input)
      end

      def delete_eks_anywhere_subscription(input : Types::DeleteEksAnywhereSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EKS_ANYWHERE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Fargate profile. When you delete a Fargate profile, any Pod running on Fargate that was
      # created with the profile is deleted. If the Pod matches another Fargate profile, then it is
      # scheduled on Fargate with that profile. If it no longer matches any Fargate profiles, then it's not
      # scheduled on Fargate and may remain in a pending state. Only one Fargate profile in a cluster can be
      # in the DELETING status at a time. You must wait for a Fargate profile to finish deleting before you
      # can delete any other profiles in that cluster.

      def delete_fargate_profile(
        cluster_name : String,
        fargate_profile_name : String
      ) : Protocol::Request
        input = Types::DeleteFargateProfileRequest.new(cluster_name: cluster_name, fargate_profile_name: fargate_profile_name)
        delete_fargate_profile(input)
      end

      def delete_fargate_profile(input : Types::DeleteFargateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FARGATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a managed node group.

      def delete_nodegroup(
        cluster_name : String,
        nodegroup_name : String
      ) : Protocol::Request
        input = Types::DeleteNodegroupRequest.new(cluster_name: cluster_name, nodegroup_name: nodegroup_name)
        delete_nodegroup(input)
      end

      def delete_nodegroup(input : Types::DeleteNodegroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_NODEGROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a EKS Pod Identity association. The temporary Amazon Web Services credentials from the
      # previous IAM role session might still be valid until the session expiry. If you need to immediately
      # revoke the temporary session credentials, then go to the role in the IAM console.

      def delete_pod_identity_association(
        association_id : String,
        cluster_name : String
      ) : Protocol::Request
        input = Types::DeletePodIdentityAssociationRequest.new(association_id: association_id, cluster_name: cluster_name)
        delete_pod_identity_association(input)
      end

      def delete_pod_identity_association(input : Types::DeletePodIdentityAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_POD_IDENTITY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deregisters a connected cluster to remove it from the Amazon EKS control plane. A connected cluster
      # is a Kubernetes cluster that you've connected to your control plane using the Amazon EKS Connector .

      def deregister_cluster(
        name : String
      ) : Protocol::Request
        input = Types::DeregisterClusterRequest.new(name: name)
        deregister_cluster(input)
      end

      def deregister_cluster(input : Types::DeregisterClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEREGISTER_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an access entry.

      def describe_access_entry(
        cluster_name : String,
        principal_arn : String
      ) : Protocol::Request
        input = Types::DescribeAccessEntryRequest.new(cluster_name: cluster_name, principal_arn: principal_arn)
        describe_access_entry(input)
      end

      def describe_access_entry(input : Types::DescribeAccessEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACCESS_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Amazon EKS add-on.

      def describe_addon(
        addon_name : String,
        cluster_name : String
      ) : Protocol::Request
        input = Types::DescribeAddonRequest.new(addon_name: addon_name, cluster_name: cluster_name)
        describe_addon(input)
      end

      def describe_addon(input : Types::DescribeAddonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ADDON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configuration options.

      def describe_addon_configuration(
        addon_name : String,
        addon_version : String
      ) : Protocol::Request
        input = Types::DescribeAddonConfigurationRequest.new(addon_name: addon_name, addon_version: addon_version)
        describe_addon_configuration(input)
      end

      def describe_addon_configuration(input : Types::DescribeAddonConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ADDON_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the versions for an add-on. Information such as the Kubernetes versions that you can use
      # the add-on with, the owner , publisher , and the type of the add-on are returned.

      def describe_addon_versions(
        addon_name : String? = nil,
        kubernetes_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owners : Array(String)? = nil,
        publishers : Array(String)? = nil,
        types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DescribeAddonVersionsRequest.new(addon_name: addon_name, kubernetes_version: kubernetes_version, max_results: max_results, next_token: next_token, owners: owners, publishers: publishers, types: types)
        describe_addon_versions(input)
      end

      def describe_addon_versions(input : Types::DescribeAddonVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ADDON_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information about a specific managed capability in your Amazon EKS cluster,
      # including its current status, configuration, health information, and any issues that may be
      # affecting its operation.

      def describe_capability(
        capability_name : String,
        cluster_name : String
      ) : Protocol::Request
        input = Types::DescribeCapabilityRequest.new(capability_name: capability_name, cluster_name: cluster_name)
        describe_capability(input)
      end

      def describe_capability(input : Types::DescribeCapabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CAPABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Amazon EKS cluster. The API server endpoint and certificate authority data returned by
      # this operation are required for kubelet and kubectl to communicate with your Kubernetes API server.
      # For more information, see Creating or updating a kubeconfig file for an Amazon EKS cluster . The API
      # server endpoint and certificate authority data aren't available until the cluster reaches the ACTIVE
      # state.

      def describe_cluster(
        name : String
      ) : Protocol::Request
        input = Types::DescribeClusterRequest.new(name: name)
        describe_cluster(input)
      end

      def describe_cluster(input : Types::DescribeClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists available Kubernetes versions for Amazon EKS clusters.

      def describe_cluster_versions(
        cluster_type : String? = nil,
        cluster_versions : Array(String)? = nil,
        default_only : Bool? = nil,
        include_all : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil,
        version_status : String? = nil
      ) : Protocol::Request
        input = Types::DescribeClusterVersionsRequest.new(cluster_type: cluster_type, cluster_versions: cluster_versions, default_only: default_only, include_all: include_all, max_results: max_results, next_token: next_token, status: status, version_status: version_status)
        describe_cluster_versions(input)
      end

      def describe_cluster_versions(input : Types::DescribeClusterVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CLUSTER_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns descriptive information about a subscription.

      def describe_eks_anywhere_subscription(
        id : String
      ) : Protocol::Request
        input = Types::DescribeEksAnywhereSubscriptionRequest.new(id: id)
        describe_eks_anywhere_subscription(input)
      end

      def describe_eks_anywhere_subscription(input : Types::DescribeEksAnywhereSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EKS_ANYWHERE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an Fargate profile.

      def describe_fargate_profile(
        cluster_name : String,
        fargate_profile_name : String
      ) : Protocol::Request
        input = Types::DescribeFargateProfileRequest.new(cluster_name: cluster_name, fargate_profile_name: fargate_profile_name)
        describe_fargate_profile(input)
      end

      def describe_fargate_profile(input : Types::DescribeFargateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_FARGATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an identity provider configuration.

      def describe_identity_provider_config(
        cluster_name : String,
        identity_provider_config : Types::IdentityProviderConfig
      ) : Protocol::Request
        input = Types::DescribeIdentityProviderConfigRequest.new(cluster_name: cluster_name, identity_provider_config: identity_provider_config)
        describe_identity_provider_config(input)
      end

      def describe_identity_provider_config(input : Types::DescribeIdentityProviderConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_IDENTITY_PROVIDER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about an insight that you specify using its ID.

      def describe_insight(
        cluster_name : String,
        id : String
      ) : Protocol::Request
        input = Types::DescribeInsightRequest.new(cluster_name: cluster_name, id: id)
        describe_insight(input)
      end

      def describe_insight(input : Types::DescribeInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the status of the latest on-demand cluster insights refresh operation.

      def describe_insights_refresh(
        cluster_name : String
      ) : Protocol::Request
        input = Types::DescribeInsightsRefreshRequest.new(cluster_name: cluster_name)
        describe_insights_refresh(input)
      end

      def describe_insights_refresh(input : Types::DescribeInsightsRefreshRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSIGHTS_REFRESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a managed node group.

      def describe_nodegroup(
        cluster_name : String,
        nodegroup_name : String
      ) : Protocol::Request
        input = Types::DescribeNodegroupRequest.new(cluster_name: cluster_name, nodegroup_name: nodegroup_name)
        describe_nodegroup(input)
      end

      def describe_nodegroup(input : Types::DescribeNodegroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_NODEGROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns descriptive information about an EKS Pod Identity association. This action requires the ID
      # of the association. You can get the ID from the response to the CreatePodIdentityAssocation for
      # newly created associations. Or, you can list the IDs for associations with
      # ListPodIdentityAssociations and filter the list by namespace or service account.

      def describe_pod_identity_association(
        association_id : String,
        cluster_name : String
      ) : Protocol::Request
        input = Types::DescribePodIdentityAssociationRequest.new(association_id: association_id, cluster_name: cluster_name)
        describe_pod_identity_association(input)
      end

      def describe_pod_identity_association(input : Types::DescribePodIdentityAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_POD_IDENTITY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an update to an Amazon EKS resource. When the status of the update is Successful , the
      # update is complete. If an update fails, the status is Failed , and an error detail explains the
      # reason for the failure.

      def describe_update(
        name : String,
        update_id : String,
        addon_name : String? = nil,
        capability_name : String? = nil,
        nodegroup_name : String? = nil
      ) : Protocol::Request
        input = Types::DescribeUpdateRequest.new(name: name, update_id: update_id, addon_name: addon_name, capability_name: capability_name, nodegroup_name: nodegroup_name)
        describe_update(input)
      end

      def describe_update(input : Types::DescribeUpdateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_UPDATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an access policy from an access entry.

      def disassociate_access_policy(
        cluster_name : String,
        policy_arn : String,
        principal_arn : String
      ) : Protocol::Request
        input = Types::DisassociateAccessPolicyRequest.new(cluster_name: cluster_name, policy_arn: policy_arn, principal_arn: principal_arn)
        disassociate_access_policy(input)
      end

      def disassociate_access_policy(input : Types::DisassociateAccessPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ACCESS_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an identity provider configuration from a cluster. If you disassociate an identity
      # provider from your cluster, users included in the provider can no longer access the cluster.
      # However, you can still access the cluster with IAM principals.

      def disassociate_identity_provider_config(
        cluster_name : String,
        identity_provider_config : Types::IdentityProviderConfig,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateIdentityProviderConfigRequest.new(cluster_name: cluster_name, identity_provider_config: identity_provider_config, client_request_token: client_request_token)
        disassociate_identity_provider_config(input)
      end

      def disassociate_identity_provider_config(input : Types::DisassociateIdentityProviderConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_IDENTITY_PROVIDER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the access entries for your cluster.

      def list_access_entries(
        cluster_name : String,
        associated_policy_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessEntriesRequest.new(cluster_name: cluster_name, associated_policy_arn: associated_policy_arn, max_results: max_results, next_token: next_token)
        list_access_entries(input)
      end

      def list_access_entries(input : Types::ListAccessEntriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_ENTRIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the available access policies.

      def list_access_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_access_policies(input)
      end

      def list_access_policies(input : Types::ListAccessPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the installed add-ons.

      def list_addons(
        cluster_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAddonsRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token)
        list_addons(input)
      end

      def list_addons(input : Types::ListAddonsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ADDONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the access policies associated with an access entry.

      def list_associated_access_policies(
        cluster_name : String,
        principal_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedAccessPoliciesRequest.new(cluster_name: cluster_name, principal_arn: principal_arn, max_results: max_results, next_token: next_token)
        list_associated_access_policies(input)
      end

      def list_associated_access_policies(input : Types::ListAssociatedAccessPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_ACCESS_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all managed capabilities in your Amazon EKS cluster. You can use this operation to get an
      # overview of all capabilities and their current status.

      def list_capabilities(
        cluster_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCapabilitiesRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token)
        list_capabilities(input)
      end

      def list_capabilities(input : Types::ListCapabilitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CAPABILITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Amazon EKS clusters in your Amazon Web Services account in the specified Amazon Web
      # Services Region.

      def list_clusters(
        include : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersRequest.new(include: include, max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the full description of the subscription.

      def list_eks_anywhere_subscriptions(
        include_status : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEksAnywhereSubscriptionsRequest.new(include_status: include_status, max_results: max_results, next_token: next_token)
        list_eks_anywhere_subscriptions(input)
      end

      def list_eks_anywhere_subscriptions(input : Types::ListEksAnywhereSubscriptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EKS_ANYWHERE_SUBSCRIPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Fargate profiles associated with the specified cluster in your Amazon Web Services account
      # in the specified Amazon Web Services Region.

      def list_fargate_profiles(
        cluster_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFargateProfilesRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token)
        list_fargate_profiles(input)
      end

      def list_fargate_profiles(input : Types::ListFargateProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FARGATE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the identity provider configurations for your cluster.

      def list_identity_provider_configs(
        cluster_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIdentityProviderConfigsRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token)
        list_identity_provider_configs(input)
      end

      def list_identity_provider_configs(input : Types::ListIdentityProviderConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IDENTITY_PROVIDER_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all insights checked for against the specified cluster. You can filter which
      # insights are returned by category, associated Kubernetes version, and status. The default filter
      # lists all categories and every status. The following lists the available categories:
      # UPGRADE_READINESS : Amazon EKS identifies issues that could impact your ability to upgrade to new
      # versions of Kubernetes. These are called upgrade insights. MISCONFIGURATION : Amazon EKS identifies
      # misconfiguration in your EKS Hybrid Nodes setup that could impair functionality of your cluster or
      # workloads. These are called configuration insights.

      def list_insights(
        cluster_name : String,
        filter : Types::InsightsFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInsightsRequest.new(cluster_name: cluster_name, filter: filter, max_results: max_results, next_token: next_token)
        list_insights(input)
      end

      def list_insights(input : Types::ListInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the managed node groups associated with the specified cluster in your Amazon Web Services
      # account in the specified Amazon Web Services Region. Self-managed node groups aren't listed.

      def list_nodegroups(
        cluster_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListNodegroupsRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token)
        list_nodegroups(input)
      end

      def list_nodegroups(input : Types::ListNodegroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NODEGROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the EKS Pod Identity associations in a cluster. You can filter the list by the namespace that
      # the association is in or the service account that the association uses.

      def list_pod_identity_associations(
        cluster_name : String,
        max_results : Int32? = nil,
        namespace : String? = nil,
        next_token : String? = nil,
        service_account : String? = nil
      ) : Protocol::Request
        input = Types::ListPodIdentityAssociationsRequest.new(cluster_name: cluster_name, max_results: max_results, namespace: namespace, next_token: next_token, service_account: service_account)
        list_pod_identity_associations(input)
      end

      def list_pod_identity_associations(input : Types::ListPodIdentityAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POD_IDENTITY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the tags for an Amazon EKS resource.

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

      # Lists the updates associated with an Amazon EKS resource in your Amazon Web Services account, in the
      # specified Amazon Web Services Region.

      def list_updates(
        name : String,
        addon_name : String? = nil,
        capability_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        nodegroup_name : String? = nil
      ) : Protocol::Request
        input = Types::ListUpdatesRequest.new(name: name, addon_name: addon_name, capability_name: capability_name, max_results: max_results, next_token: next_token, nodegroup_name: nodegroup_name)
        list_updates(input)
      end

      def list_updates(input : Types::ListUpdatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_UPDATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Connects a Kubernetes cluster to the Amazon EKS control plane. Any Kubernetes cluster can be
      # connected to the Amazon EKS control plane to view current information about the cluster and its
      # nodes. Cluster connection requires two steps. First, send a RegisterClusterRequest to add it to the
      # Amazon EKS control plane. Second, a Manifest containing the activationID and activationCode must be
      # applied to the Kubernetes cluster through it's native provider to provide visibility. After the
      # manifest is updated and applied, the connected cluster is visible to the Amazon EKS control plane.
      # If the manifest isn't applied within three days, the connected cluster will no longer be visible and
      # must be deregistered using DeregisterCluster .

      def register_cluster(
        connector_config : Types::ConnectorConfigRequest,
        name : String,
        client_request_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RegisterClusterRequest.new(connector_config: connector_config, name: name, client_request_token: client_request_token, tags: tags)
        register_cluster(input)
      end

      def register_cluster(input : Types::RegisterClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates an on-demand refresh operation for cluster insights, getting the latest analysis outside
      # of the standard refresh schedule.

      def start_insights_refresh(
        cluster_name : String
      ) : Protocol::Request
        input = Types::StartInsightsRefreshRequest.new(cluster_name: cluster_name)
        start_insights_refresh(input)
      end

      def start_insights_refresh(input : Types::StartInsightsRefreshRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_INSIGHTS_REFRESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to an Amazon EKS resource with the specified resourceArn . If existing
      # tags on a resource are not specified in the request parameters, they aren't changed. When a resource
      # is deleted, the tags associated with that resource are also deleted. Tags that you create for Amazon
      # EKS resources don't propagate to any other resources associated with the cluster. For example, if
      # you tag a cluster with this operation, that tag doesn't automatically propagate to the subnets and
      # nodes associated with the cluster.

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

      # Deletes specified tags from an Amazon EKS resource.

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

      # Updates an access entry.

      def update_access_entry(
        cluster_name : String,
        principal_arn : String,
        client_request_token : String? = nil,
        kubernetes_groups : Array(String)? = nil,
        username : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAccessEntryRequest.new(cluster_name: cluster_name, principal_arn: principal_arn, client_request_token: client_request_token, kubernetes_groups: kubernetes_groups, username: username)
        update_access_entry(input)
      end

      def update_access_entry(input : Types::UpdateAccessEntryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCESS_ENTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon EKS add-on.

      def update_addon(
        addon_name : String,
        cluster_name : String,
        addon_version : String? = nil,
        client_request_token : String? = nil,
        configuration_values : String? = nil,
        pod_identity_associations : Array(Types::AddonPodIdentityAssociations)? = nil,
        resolve_conflicts : String? = nil,
        service_account_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAddonRequest.new(addon_name: addon_name, cluster_name: cluster_name, addon_version: addon_version, client_request_token: client_request_token, configuration_values: configuration_values, pod_identity_associations: pod_identity_associations, resolve_conflicts: resolve_conflicts, service_account_role_arn: service_account_role_arn)
        update_addon(input)
      end

      def update_addon(input : Types::UpdateAddonRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ADDON, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a managed capability in your Amazon EKS cluster. You can update the IAM
      # role, configuration settings, and delete propagation policy for a capability. When you update a
      # capability, Amazon EKS applies the changes and may restart capability components as needed. The
      # capability remains available during the update process, but some operations may be temporarily
      # unavailable.

      def update_capability(
        capability_name : String,
        cluster_name : String,
        client_request_token : String? = nil,
        configuration : Types::UpdateCapabilityConfiguration? = nil,
        delete_propagation_policy : String? = nil,
        role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCapabilityRequest.new(capability_name: capability_name, cluster_name: cluster_name, client_request_token: client_request_token, configuration: configuration, delete_propagation_policy: delete_propagation_policy, role_arn: role_arn)
        update_capability(input)
      end

      def update_capability(input : Types::UpdateCapabilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CAPABILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon EKS cluster configuration. Your cluster continues to function during the update.
      # The response output includes an update ID that you can use to track the status of your cluster
      # update with DescribeUpdate . You can use this operation to do the following actions: You can use
      # this API operation to enable or disable exporting the Kubernetes control plane logs for your cluster
      # to CloudWatch Logs. By default, cluster control plane logs aren't exported to CloudWatch Logs. For
      # more information, see Amazon EKS Cluster control plane logs in the Amazon EKS User Guide .
      # CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported control plane
      # logs. For more information, see CloudWatch Pricing . You can also use this API operation to enable
      # or disable public and private access to your cluster's Kubernetes API server endpoint. By default,
      # public access is enabled, and private access is disabled. For more information, see Cluster API
      # server endpoint in the Amazon EKS User Guide . You can also use this API operation to choose
      # different subnets and security groups for the cluster. You must specify at least two subnets that
      # are in different Availability Zones. You can't change which VPC the subnets are from, the subnets
      # must be in the same VPC as the subnets that the cluster was created with. For more information about
      # the VPC requirements, see https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html in the
      # Amazon EKS User Guide . You can also use this API operation to enable or disable ARC zonal shift. If
      # zonal shift is enabled, Amazon Web Services configures zonal autoshift for the cluster. You can also
      # use this API operation to add, change, or remove the configuration in the cluster for EKS Hybrid
      # Nodes. To remove the configuration, use the remoteNetworkConfig key with an object containing both
      # subkeys with empty arrays for each. Here is an inline example: "remoteNetworkConfig": {
      # "remoteNodeNetworks": [], "remotePodNetworks": [] } . Cluster updates are asynchronous, and they
      # should finish within a few minutes. During an update, the cluster status moves to UPDATING (this
      # status transition is eventually consistent). When the update is complete (either Failed or
      # Successful ), the cluster status moves to Active .

      def update_cluster_config(
        name : String,
        access_config : Types::UpdateAccessConfigRequest? = nil,
        client_request_token : String? = nil,
        compute_config : Types::ComputeConfigRequest? = nil,
        control_plane_scaling_config : Types::ControlPlaneScalingConfig? = nil,
        deletion_protection : Bool? = nil,
        kubernetes_network_config : Types::KubernetesNetworkConfigRequest? = nil,
        logging : Types::Logging? = nil,
        remote_network_config : Types::RemoteNetworkConfigRequest? = nil,
        resources_vpc_config : Types::VpcConfigRequest? = nil,
        storage_config : Types::StorageConfigRequest? = nil,
        upgrade_policy : Types::UpgradePolicyRequest? = nil,
        zonal_shift_config : Types::ZonalShiftConfigRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterConfigRequest.new(name: name, access_config: access_config, client_request_token: client_request_token, compute_config: compute_config, control_plane_scaling_config: control_plane_scaling_config, deletion_protection: deletion_protection, kubernetes_network_config: kubernetes_network_config, logging: logging, remote_network_config: remote_network_config, resources_vpc_config: resources_vpc_config, storage_config: storage_config, upgrade_policy: upgrade_policy, zonal_shift_config: zonal_shift_config)
        update_cluster_config(input)
      end

      def update_cluster_config(input : Types::UpdateClusterConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon EKS cluster to the specified Kubernetes version. Your cluster continues to
      # function during the update. The response output includes an update ID that you can use to track the
      # status of your cluster update with the DescribeUpdate API operation. Cluster updates are
      # asynchronous, and they should finish within a few minutes. During an update, the cluster status
      # moves to UPDATING (this status transition is eventually consistent). When the update is complete
      # (either Failed or Successful ), the cluster status moves to Active . If your cluster has managed
      # node groups attached to it, all of your node groups' Kubernetes versions must match the cluster's
      # Kubernetes version in order to update the cluster to a new Kubernetes version.

      def update_cluster_version(
        name : String,
        version : String,
        client_request_token : String? = nil,
        force : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterVersionRequest.new(name: name, version: version, client_request_token: client_request_token, force: force)
        update_cluster_version(input)
      end

      def update_cluster_version(input : Types::UpdateClusterVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an EKS Anywhere Subscription. Only auto renewal and tags can be updated after subscription
      # creation.

      def update_eks_anywhere_subscription(
        auto_renew : Bool,
        id : String,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEksAnywhereSubscriptionRequest.new(auto_renew: auto_renew, id: id, client_request_token: client_request_token)
        update_eks_anywhere_subscription(input)
      end

      def update_eks_anywhere_subscription(input : Types::UpdateEksAnywhereSubscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EKS_ANYWHERE_SUBSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Amazon EKS managed node group configuration. Your node group continues to function during
      # the update. The response output includes an update ID that you can use to track the status of your
      # node group update with the DescribeUpdate API operation. You can update the Kubernetes labels and
      # taints for a node group and the scaling and version update configuration.

      def update_nodegroup_config(
        cluster_name : String,
        nodegroup_name : String,
        client_request_token : String? = nil,
        labels : Types::UpdateLabelsPayload? = nil,
        node_repair_config : Types::NodeRepairConfig? = nil,
        scaling_config : Types::NodegroupScalingConfig? = nil,
        taints : Types::UpdateTaintsPayload? = nil,
        update_config : Types::NodegroupUpdateConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateNodegroupConfigRequest.new(cluster_name: cluster_name, nodegroup_name: nodegroup_name, client_request_token: client_request_token, labels: labels, node_repair_config: node_repair_config, scaling_config: scaling_config, taints: taints, update_config: update_config)
        update_nodegroup_config(input)
      end

      def update_nodegroup_config(input : Types::UpdateNodegroupConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NODEGROUP_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Kubernetes version or AMI version of an Amazon EKS managed node group. You can update a
      # node group using a launch template only if the node group was originally deployed with a launch
      # template. Additionally, the launch template ID or name must match what was used when the node group
      # was created. You can update the launch template version with necessary changes. If you need to
      # update a custom AMI in a node group that was deployed with a launch template, then update your
      # custom AMI, specify the new ID in a new version of the launch template, and then update the node
      # group to the new version of the launch template. If you update without a launch template, then you
      # can update to the latest available AMI version of a node group's current Kubernetes version by not
      # specifying a Kubernetes version in the request. You can update to the latest AMI version of your
      # cluster's current Kubernetes version by specifying your cluster's Kubernetes version in the request.
      # For information about Linux versions, see Amazon EKS optimized Amazon Linux AMI versions in the
      # Amazon EKS User Guide . For information about Windows versions, see Amazon EKS optimized Windows AMI
      # versions in the Amazon EKS User Guide . You cannot roll back a node group to an earlier Kubernetes
      # version or AMI version. When a node in a managed node group is terminated due to a scaling action or
      # update, every Pod on that node is drained first. Amazon EKS attempts to drain the nodes gracefully
      # and will fail if it is unable to do so. You can force the update if Amazon EKS is unable to drain
      # the nodes as a result of a Pod disruption budget issue.

      def update_nodegroup_version(
        cluster_name : String,
        nodegroup_name : String,
        client_request_token : String? = nil,
        force : Bool? = nil,
        launch_template : Types::LaunchTemplateSpecification? = nil,
        release_version : String? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateNodegroupVersionRequest.new(cluster_name: cluster_name, nodegroup_name: nodegroup_name, client_request_token: client_request_token, force: force, launch_template: launch_template, release_version: release_version, version: version)
        update_nodegroup_version(input)
      end

      def update_nodegroup_version(input : Types::UpdateNodegroupVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_NODEGROUP_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a EKS Pod Identity association. In an update, you can change the IAM role, the target IAM
      # role, or disableSessionTags . You must change at least one of these in an update. An association
      # can't be moved between clusters, namespaces, or service accounts. If you need to edit the namespace
      # or service account, you need to delete the association and then create a new association with your
      # desired settings. Similar to Amazon Web Services IAM behavior, EKS Pod Identity associations are
      # eventually consistent, and may take several seconds to be effective after the initial API call
      # returns successfully. You must design your applications to account for these potential delays. We
      # recommend that you don’t include association create/updates in the critical, high-availability code
      # paths of your application. Instead, make changes in a separate initialization or setup routine that
      # you run less frequently. You can set a target IAM role in the same or a different account for
      # advanced scenarios. With a target role, EKS Pod Identity automatically performs two role assumptions
      # in sequence: first assuming the role in the association that is in this account, then using those
      # credentials to assume the target IAM role. This process provides your Pod with temporary credentials
      # that have the permissions defined in the target role, allowing secure access to resources in another
      # Amazon Web Services account.

      def update_pod_identity_association(
        association_id : String,
        cluster_name : String,
        client_request_token : String? = nil,
        disable_session_tags : Bool? = nil,
        role_arn : String? = nil,
        target_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePodIdentityAssociationRequest.new(association_id: association_id, cluster_name: cluster_name, client_request_token: client_request_token, disable_session_tags: disable_session_tags, role_arn: role_arn, target_role_arn: target_role_arn)
        update_pod_identity_association(input)
      end

      def update_pod_identity_association(input : Types::UpdatePodIdentityAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_POD_IDENTITY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
