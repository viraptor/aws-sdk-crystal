require "json"
require "time"

module AwsSdk
  module Tnb
    module Types

      # Insufficient permissions to make request.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CancelSolNetworkOperationInput
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String

        def initialize(
          @ns_lcm_op_occ_id : String
        )
        end
      end

      struct CreateSolFunctionPackageInput
        include JSON::Serializable

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSolFunctionPackageOutput
        include JSON::Serializable

        # Function package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the function package.
        @[JSON::Field(key: "id")]
        getter id : String

        # Onboarding state of the function package.
        @[JSON::Field(key: "onboardingState")]
        getter onboarding_state : String

        # Operational state of the function package.
        @[JSON::Field(key: "operationalState")]
        getter operational_state : String

        # Usage state of the function package.
        @[JSON::Field(key: "usageState")]
        getter usage_state : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @onboarding_state : String,
          @operational_state : String,
          @usage_state : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSolNetworkInstanceInput
        include JSON::Serializable

        # Network instance name.
        @[JSON::Field(key: "nsName")]
        getter ns_name : String

        # ID for network service descriptor.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # Network instance description.
        @[JSON::Field(key: "nsDescription")]
        getter ns_description : String?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_name : String,
          @nsd_info_id : String,
          @ns_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSolNetworkInstanceOutput
        include JSON::Serializable

        # Network instance ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network instance ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Network instance name.
        @[JSON::Field(key: "nsInstanceName")]
        getter ns_instance_name : String

        # Network service descriptor ID.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @ns_instance_name : String,
          @nsd_info_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSolNetworkPackageInput
        include JSON::Serializable

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSolNetworkPackageOutput
        include JSON::Serializable

        # Network package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the network package.
        @[JSON::Field(key: "id")]
        getter id : String

        # Onboarding state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOnboardingState")]
        getter nsd_onboarding_state : String

        # Operational state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOperationalState")]
        getter nsd_operational_state : String

        # Usage state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdUsageState")]
        getter nsd_usage_state : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @nsd_onboarding_state : String,
          @nsd_operational_state : String,
          @nsd_usage_state : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct DeleteSolFunctionPackageInput
        include JSON::Serializable

        # ID of the function package.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        def initialize(
          @vnf_pkg_id : String
        )
        end
      end

      struct DeleteSolNetworkInstanceInput
        include JSON::Serializable

        # Network instance ID.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        def initialize(
          @ns_instance_id : String
        )
        end
      end

      struct DeleteSolNetworkPackageInput
        include JSON::Serializable

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        def initialize(
          @nsd_info_id : String
        )
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Provides error information.
      struct ErrorInfo
        include JSON::Serializable

        # Error cause.
        @[JSON::Field(key: "cause")]
        getter cause : String?

        # Error details.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @cause : String? = nil,
          @details : String? = nil
        )
        end
      end

      # Metadata for function package artifacts. Artifacts are the contents of the package descriptor file
      # and the state of the package.
      struct FunctionArtifactMeta
        include JSON::Serializable

        # Lists of function package overrides.
        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::ToscaOverride)?

        def initialize(
          @overrides : Array(Types::ToscaOverride)? = nil
        )
        end
      end

      struct GetSolFunctionInstanceInput
        include JSON::Serializable

        # ID of the network function.
        @[JSON::Field(key: "vnfInstanceId")]
        getter vnf_instance_id : String

        def initialize(
          @vnf_instance_id : String
        )
        end
      end

      # The metadata of a network function instance. A network function instance is a function in a function
      # package .
      struct GetSolFunctionInstanceMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct GetSolFunctionInstanceOutput
        include JSON::Serializable

        # Network function instance ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network function instance ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Network function instantiation state.
        @[JSON::Field(key: "instantiationState")]
        getter instantiation_state : String

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolFunctionInstanceMetadata

        # Network instance ID.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # Function package ID.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        # Function package descriptor ID.
        @[JSON::Field(key: "vnfdId")]
        getter vnfd_id : String

        @[JSON::Field(key: "instantiatedVnfInfo")]
        getter instantiated_vnf_info : Types::GetSolVnfInfo?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Network function product name.
        @[JSON::Field(key: "vnfProductName")]
        getter vnf_product_name : String?

        # Network function provider.
        @[JSON::Field(key: "vnfProvider")]
        getter vnf_provider : String?

        # Function package descriptor version.
        @[JSON::Field(key: "vnfdVersion")]
        getter vnfd_version : String?

        def initialize(
          @arn : String,
          @id : String,
          @instantiation_state : String,
          @metadata : Types::GetSolFunctionInstanceMetadata,
          @ns_instance_id : String,
          @vnf_pkg_id : String,
          @vnfd_id : String,
          @instantiated_vnf_info : Types::GetSolVnfInfo? = nil,
          @tags : Hash(String, String)? = nil,
          @vnf_product_name : String? = nil,
          @vnf_provider : String? = nil,
          @vnfd_version : String? = nil
        )
        end
      end

      struct GetSolFunctionPackageContentInput
        include JSON::Serializable

        # The format of the package that you want to download from the function packages.
        @[JSON::Field(key: "Accept")]
        getter accept : String

        # ID of the function package.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        def initialize(
          @accept : String,
          @vnf_pkg_id : String
        )
        end
      end

      struct GetSolFunctionPackageContentOutput
        include JSON::Serializable

        # Indicates the media type of the resource.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Contents of the function package.
        @[JSON::Field(key: "packageContent")]
        getter package_content : Bytes?

        def initialize(
          @content_type : String? = nil,
          @package_content : Bytes? = nil
        )
        end
      end

      struct GetSolFunctionPackageDescriptorInput
        include JSON::Serializable

        # Indicates which content types, expressed as MIME types, the client is able to understand.
        @[JSON::Field(key: "Accept")]
        getter accept : String

        # ID of the function package.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        def initialize(
          @accept : String,
          @vnf_pkg_id : String
        )
        end
      end

      struct GetSolFunctionPackageDescriptorOutput
        include JSON::Serializable

        # Indicates the media type of the resource.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Contents of the function package descriptor.
        @[JSON::Field(key: "vnfd")]
        getter vnfd : Bytes?

        def initialize(
          @content_type : String? = nil,
          @vnfd : Bytes? = nil
        )
        end
      end

      struct GetSolFunctionPackageInput
        include JSON::Serializable

        # ID of the function package.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        def initialize(
          @vnf_pkg_id : String
        )
        end
      end

      # Metadata related to the function package. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.
      struct GetSolFunctionPackageMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # Metadata related to the function package descriptor of the function package.
        @[JSON::Field(key: "vnfd")]
        getter vnfd : Types::FunctionArtifactMeta?

        def initialize(
          @created_at : Time,
          @last_modified : Time,
          @vnfd : Types::FunctionArtifactMeta? = nil
        )
        end
      end

      struct GetSolFunctionPackageOutput
        include JSON::Serializable

        # Function package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Function package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Function package onboarding state.
        @[JSON::Field(key: "onboardingState")]
        getter onboarding_state : String

        # Function package operational state.
        @[JSON::Field(key: "operationalState")]
        getter operational_state : String

        # Function package usage state.
        @[JSON::Field(key: "usageState")]
        getter usage_state : String

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolFunctionPackageMetadata?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Network function product name.
        @[JSON::Field(key: "vnfProductName")]
        getter vnf_product_name : String?

        # Network function provider.
        @[JSON::Field(key: "vnfProvider")]
        getter vnf_provider : String?

        # Function package descriptor ID.
        @[JSON::Field(key: "vnfdId")]
        getter vnfd_id : String?

        # Function package descriptor version.
        @[JSON::Field(key: "vnfdVersion")]
        getter vnfd_version : String?

        def initialize(
          @arn : String,
          @id : String,
          @onboarding_state : String,
          @operational_state : String,
          @usage_state : String,
          @metadata : Types::GetSolFunctionPackageMetadata? = nil,
          @tags : Hash(String, String)? = nil,
          @vnf_product_name : String? = nil,
          @vnf_provider : String? = nil,
          @vnfd_id : String? = nil,
          @vnfd_version : String? = nil
        )
        end
      end

      # Information about a network function. A network instance is a single network created in Amazon Web
      # Services TNB that can be deployed and on which life-cycle operations (like terminate, update, and
      # delete) can be performed.
      struct GetSolInstantiatedVnfInfo
        include JSON::Serializable

        # State of the network function.
        @[JSON::Field(key: "vnfState")]
        getter vnf_state : String?

        def initialize(
          @vnf_state : String? = nil
        )
        end
      end

      struct GetSolNetworkInstanceInput
        include JSON::Serializable

        # ID of the network instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        def initialize(
          @ns_instance_id : String
        )
        end
      end

      # The metadata of a network instance. A network instance is a single network created in Amazon Web
      # Services TNB that can be deployed and on which life-cycle operations (like terminate, update, and
      # delete) can be performed.
      struct GetSolNetworkInstanceMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct GetSolNetworkInstanceOutput
        include JSON::Serializable

        # Network instance ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network instance ID.
        @[JSON::Field(key: "id")]
        getter id : String

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolNetworkInstanceMetadata

        # Network instance description.
        @[JSON::Field(key: "nsInstanceDescription")]
        getter ns_instance_description : String

        # Network instance name.
        @[JSON::Field(key: "nsInstanceName")]
        getter ns_instance_name : String

        # Network service descriptor ID.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String

        # Network service descriptor info ID.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        @[JSON::Field(key: "lcmOpInfo")]
        getter lcm_op_info : Types::LcmOperationInfo?

        # Network instance state.
        @[JSON::Field(key: "nsState")]
        getter ns_state : String?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::GetSolNetworkInstanceMetadata,
          @ns_instance_description : String,
          @ns_instance_name : String,
          @nsd_id : String,
          @nsd_info_id : String,
          @lcm_op_info : Types::LcmOperationInfo? = nil,
          @ns_state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetSolNetworkOperationInput
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String

        def initialize(
          @ns_lcm_op_occ_id : String
        )
        end
      end

      # Metadata related to a network operation occurrence. A network operation is any operation that is
      # done to your network, such as network instance instantiation or termination.
      struct GetSolNetworkOperationMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # Metadata related to the network operation occurrence for network instantiation. This is populated
        # only if the lcmOperationType is INSTANTIATE .
        @[JSON::Field(key: "instantiateMetadata")]
        getter instantiate_metadata : Types::InstantiateMetadata?

        # Metadata related to the network operation occurrence for network function updates in a network
        # instance. This is populated only if the lcmOperationType is UPDATE and the updateType is
        # MODIFY_VNF_INFORMATION .
        @[JSON::Field(key: "modifyVnfInfoMetadata")]
        getter modify_vnf_info_metadata : Types::ModifyVnfInfoMetadata?

        # Metadata related to the network operation occurrence for network instance updates. This is populated
        # only if the lcmOperationType is UPDATE and the updateType is UPDATE_NS .
        @[JSON::Field(key: "updateNsMetadata")]
        getter update_ns_metadata : Types::UpdateNsMetadata?

        def initialize(
          @created_at : Time,
          @last_modified : Time,
          @instantiate_metadata : Types::InstantiateMetadata? = nil,
          @modify_vnf_info_metadata : Types::ModifyVnfInfoMetadata? = nil,
          @update_ns_metadata : Types::UpdateNsMetadata? = nil
        )
        end
      end

      struct GetSolNetworkOperationOutput
        include JSON::Serializable

        # Network operation ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Error related to this specific network operation occurrence.
        @[JSON::Field(key: "error")]
        getter error : Types::ProblemDetails?

        # ID of this network operation occurrence.
        @[JSON::Field(key: "id")]
        getter id : String?

        # Type of the operation represented by this occurrence.
        @[JSON::Field(key: "lcmOperationType")]
        getter lcm_operation_type : String?

        # Metadata of this network operation occurrence.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolNetworkOperationMetadata?

        # ID of the network operation instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String?

        # The state of the network operation.
        @[JSON::Field(key: "operationState")]
        getter operation_state : String?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # All tasks associated with this operation occurrence.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::GetSolNetworkOperationTaskDetails)?

        # Type of the update. Only present if the network operation lcmOperationType is UPDATE .
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        def initialize(
          @arn : String,
          @error : Types::ProblemDetails? = nil,
          @id : String? = nil,
          @lcm_operation_type : String? = nil,
          @metadata : Types::GetSolNetworkOperationMetadata? = nil,
          @ns_instance_id : String? = nil,
          @operation_state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @tasks : Array(Types::GetSolNetworkOperationTaskDetails)? = nil,
          @update_type : String? = nil
        )
        end
      end

      # Gets the details of a network operation. A network operation is any operation that is done to your
      # network, such as network instance instantiation or termination.
      struct GetSolNetworkOperationTaskDetails
        include JSON::Serializable

        # Context for the network operation task.
        @[JSON::Field(key: "taskContext")]
        getter task_context : Hash(String, String)?

        # Task end time.
        @[JSON::Field(key: "taskEndTime")]
        getter task_end_time : Time?

        # Task error details.
        @[JSON::Field(key: "taskErrorDetails")]
        getter task_error_details : Types::ErrorInfo?

        # Task name.
        @[JSON::Field(key: "taskName")]
        getter task_name : String?

        # Task start time.
        @[JSON::Field(key: "taskStartTime")]
        getter task_start_time : Time?

        # Task status.
        @[JSON::Field(key: "taskStatus")]
        getter task_status : String?

        def initialize(
          @task_context : Hash(String, String)? = nil,
          @task_end_time : Time? = nil,
          @task_error_details : Types::ErrorInfo? = nil,
          @task_name : String? = nil,
          @task_start_time : Time? = nil,
          @task_status : String? = nil
        )
        end
      end

      struct GetSolNetworkPackageContentInput
        include JSON::Serializable

        # The format of the package you want to download from the network package.
        @[JSON::Field(key: "Accept")]
        getter accept : String

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        def initialize(
          @accept : String,
          @nsd_info_id : String
        )
        end
      end

      struct GetSolNetworkPackageContentOutput
        include JSON::Serializable

        # Indicates the media type of the resource.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Content of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdContent")]
        getter nsd_content : Bytes?

        def initialize(
          @content_type : String? = nil,
          @nsd_content : Bytes? = nil
        )
        end
      end

      struct GetSolNetworkPackageDescriptorInput
        include JSON::Serializable

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        def initialize(
          @nsd_info_id : String
        )
        end
      end

      struct GetSolNetworkPackageDescriptorOutput
        include JSON::Serializable

        # Indicates the media type of the resource.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # Contents of the network service descriptor in the network package.
        @[JSON::Field(key: "nsd")]
        getter nsd : Bytes?

        def initialize(
          @content_type : String? = nil,
          @nsd : Bytes? = nil
        )
        end
      end

      struct GetSolNetworkPackageInput
        include JSON::Serializable

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        def initialize(
          @nsd_info_id : String
        )
        end
      end

      # Metadata associated with a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.
      struct GetSolNetworkPackageMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # Metadata related to the onboarded network service descriptor in the network package.
        @[JSON::Field(key: "nsd")]
        getter nsd : Types::NetworkArtifactMeta?

        def initialize(
          @created_at : Time,
          @last_modified : Time,
          @nsd : Types::NetworkArtifactMeta? = nil
        )
        end
      end

      struct GetSolNetworkPackageOutput
        include JSON::Serializable

        # Network package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolNetworkPackageMetadata

        # Network service descriptor ID.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String

        # Network service descriptor name.
        @[JSON::Field(key: "nsdName")]
        getter nsd_name : String

        # Network service descriptor onboarding state.
        @[JSON::Field(key: "nsdOnboardingState")]
        getter nsd_onboarding_state : String

        # Network service descriptor operational state.
        @[JSON::Field(key: "nsdOperationalState")]
        getter nsd_operational_state : String

        # Network service descriptor usage state.
        @[JSON::Field(key: "nsdUsageState")]
        getter nsd_usage_state : String

        # Network service descriptor version.
        @[JSON::Field(key: "nsdVersion")]
        getter nsd_version : String

        # Identifies the function package for the function package descriptor referenced by the onboarded
        # network package.
        @[JSON::Field(key: "vnfPkgIds")]
        getter vnf_pkg_ids : Array(String)

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::GetSolNetworkPackageMetadata,
          @nsd_id : String,
          @nsd_name : String,
          @nsd_onboarding_state : String,
          @nsd_operational_state : String,
          @nsd_usage_state : String,
          @nsd_version : String,
          @vnf_pkg_ids : Array(String),
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the network function. A network function instance is a function in a function
      # package .
      struct GetSolVnfInfo
        include JSON::Serializable

        # State of the network function instance.
        @[JSON::Field(key: "vnfState")]
        getter vnf_state : String?

        # Compute info used by the network function instance.
        @[JSON::Field(key: "vnfcResourceInfo")]
        getter vnfc_resource_info : Array(Types::GetSolVnfcResourceInfo)?

        def initialize(
          @vnf_state : String? = nil,
          @vnfc_resource_info : Array(Types::GetSolVnfcResourceInfo)? = nil
        )
        end
      end

      # Details of resource associated with a network function. A network instance is a single network
      # created in Amazon Web Services TNB that can be deployed and on which life-cycle operations (like
      # terminate, update, and delete) can be performed.
      struct GetSolVnfcResourceInfo
        include JSON::Serializable

        # The metadata of the network function compute.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::GetSolVnfcResourceInfoMetadata?

        def initialize(
          @metadata : Types::GetSolVnfcResourceInfoMetadata? = nil
        )
        end
      end

      # The metadata of a network function. A network instance is a single network created in Amazon Web
      # Services TNB that can be deployed and on which life-cycle operations (like terminate, update, and
      # delete) can be performed.
      struct GetSolVnfcResourceInfoMetadata
        include JSON::Serializable

        # Information about the cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Information about the helm chart.
        @[JSON::Field(key: "helmChart")]
        getter helm_chart : String?

        # Information about the node group.
        @[JSON::Field(key: "nodeGroup")]
        getter node_group : String?

        def initialize(
          @cluster : String? = nil,
          @helm_chart : String? = nil,
          @node_group : String? = nil
        )
        end
      end

      # Metadata related to the configuration properties used during instantiation of the network instance.
      struct InstantiateMetadata
        include JSON::Serializable

        # The network service descriptor used for instantiating the network instance.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # The configurable properties used during instantiation.
        @[JSON::Field(key: "additionalParamsForNs")]
        getter additional_params_for_ns : Types::Document?

        def initialize(
          @nsd_info_id : String,
          @additional_params_for_ns : Types::Document? = nil
        )
        end
      end

      struct InstantiateSolNetworkInstanceInput
        include JSON::Serializable

        # ID of the network instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # Provides values for the configurable properties.
        @[JSON::Field(key: "additionalParamsForNs")]
        getter additional_params_for_ns : Types::Document?

        # A check for whether you have the required permissions for the action without actually making the
        # request and provides an error response. If you have the required permissions, the error response is
        # DryRunOperation . Otherwise, it is UnauthorizedOperation .
        @[JSON::Field(key: "dry_run")]
        getter dry_run : Bool?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_instance_id : String,
          @additional_params_for_ns : Types::Document? = nil,
          @dry_run : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct InstantiateSolNetworkInstanceOutput
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_lcm_op_occ_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Unexpected error occurred. Problem on the server.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Lifecycle management operation details on the network instance. Lifecycle management operations are
      # deploy, update, or delete operations.
      struct LcmOperationInfo
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String

        def initialize(
          @ns_lcm_op_occ_id : String
        )
        end
      end

      # Lists information about a network function instance. A network function instance is a function in a
      # function package .
      struct ListSolFunctionInstanceInfo
        include JSON::Serializable

        # Network function instance ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network function instance ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Network function instance instantiation state.
        @[JSON::Field(key: "instantiationState")]
        getter instantiation_state : String

        # Network function instance metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ListSolFunctionInstanceMetadata

        # Network instance ID.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # Function package ID.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        @[JSON::Field(key: "instantiatedVnfInfo")]
        getter instantiated_vnf_info : Types::GetSolInstantiatedVnfInfo?

        # Function package name.
        @[JSON::Field(key: "vnfPkgName")]
        getter vnf_pkg_name : String?

        def initialize(
          @arn : String,
          @id : String,
          @instantiation_state : String,
          @metadata : Types::ListSolFunctionInstanceMetadata,
          @ns_instance_id : String,
          @vnf_pkg_id : String,
          @instantiated_vnf_info : Types::GetSolInstantiatedVnfInfo? = nil,
          @vnf_pkg_name : String? = nil
        )
        end
      end

      # Lists network function instance metadata. A network function instance is a function in a function
      # package .
      struct ListSolFunctionInstanceMetadata
        include JSON::Serializable

        # When the network function instance was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # When the network function instance was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct ListSolFunctionInstancesInput
        include JSON::Serializable

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextpage_opaque_marker")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSolFunctionInstancesOutput
        include JSON::Serializable

        # Network function instances.
        @[JSON::Field(key: "functionInstances")]
        getter function_instances : Array(Types::ListSolFunctionInstanceInfo)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @function_instances : Array(Types::ListSolFunctionInstanceInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information about a function package. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.
      struct ListSolFunctionPackageInfo
        include JSON::Serializable

        # Function package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the function package.
        @[JSON::Field(key: "id")]
        getter id : String

        # Onboarding state of the function package.
        @[JSON::Field(key: "onboardingState")]
        getter onboarding_state : String

        # Operational state of the function package.
        @[JSON::Field(key: "operationalState")]
        getter operational_state : String

        # Usage state of the function package.
        @[JSON::Field(key: "usageState")]
        getter usage_state : String

        # The metadata of the function package.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ListSolFunctionPackageMetadata?

        # The product name for the network function.
        @[JSON::Field(key: "vnfProductName")]
        getter vnf_product_name : String?

        # Provider of the function package and the function package descriptor.
        @[JSON::Field(key: "vnfProvider")]
        getter vnf_provider : String?

        # Identifies the function package and the function package descriptor.
        @[JSON::Field(key: "vnfdId")]
        getter vnfd_id : String?

        # Identifies the version of the function package descriptor.
        @[JSON::Field(key: "vnfdVersion")]
        getter vnfd_version : String?

        def initialize(
          @arn : String,
          @id : String,
          @onboarding_state : String,
          @operational_state : String,
          @usage_state : String,
          @metadata : Types::ListSolFunctionPackageMetadata? = nil,
          @vnf_product_name : String? = nil,
          @vnf_provider : String? = nil,
          @vnfd_id : String? = nil,
          @vnfd_version : String? = nil
        )
        end
      end

      # Details for the function package metadata. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.
      struct ListSolFunctionPackageMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct ListSolFunctionPackagesInput
        include JSON::Serializable

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextpage_opaque_marker")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSolFunctionPackagesOutput
        include JSON::Serializable

        # Function packages. A function package is a .zip file in CSAR (Cloud Service Archive) format that
        # contains a network function (an ETSI standard telecommunication application) and function package
        # descriptor that uses the TOSCA standard to describe how the network functions should run on your
        # network.
        @[JSON::Field(key: "functionPackages")]
        getter function_packages : Array(Types::ListSolFunctionPackageInfo)

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @function_packages : Array(Types::ListSolFunctionPackageInfo),
          @next_token : String? = nil
        )
        end
      end

      # Info about the specific network instance. A network instance is a single network created in Amazon
      # Web Services TNB that can be deployed and on which life-cycle operations (like terminate, update,
      # and delete) can be performed.
      struct ListSolNetworkInstanceInfo
        include JSON::Serializable

        # Network instance ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the network instance.
        @[JSON::Field(key: "id")]
        getter id : String

        # The metadata of the network instance.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ListSolNetworkInstanceMetadata

        # Human-readable description of the network instance.
        @[JSON::Field(key: "nsInstanceDescription")]
        getter ns_instance_description : String

        # Human-readable name of the network instance.
        @[JSON::Field(key: "nsInstanceName")]
        getter ns_instance_name : String

        # The state of the network instance.
        @[JSON::Field(key: "nsState")]
        getter ns_state : String

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::ListSolNetworkInstanceMetadata,
          @ns_instance_description : String,
          @ns_instance_name : String,
          @ns_state : String,
          @nsd_id : String,
          @nsd_info_id : String
        )
        end
      end

      # Metadata details for a network instance. A network instance is a single network created in Amazon
      # Web Services TNB that can be deployed and on which life-cycle operations (like terminate, update,
      # and delete) can be performed.
      struct ListSolNetworkInstanceMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct ListSolNetworkInstancesInput
        include JSON::Serializable

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextpage_opaque_marker")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSolNetworkInstancesOutput
        include JSON::Serializable

        # Lists network instances.
        @[JSON::Field(key: "networkInstances")]
        getter network_instances : Array(Types::ListSolNetworkInstanceInfo)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_instances : Array(Types::ListSolNetworkInstanceInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Information parameters for a network operation.
      struct ListSolNetworkOperationsInfo
        include JSON::Serializable

        # Network operation ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of this network operation.
        @[JSON::Field(key: "id")]
        getter id : String

        # Type of lifecycle management network operation.
        @[JSON::Field(key: "lcmOperationType")]
        getter lcm_operation_type : String

        # ID of the network instance related to this operation.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # The state of the network operation.
        @[JSON::Field(key: "operationState")]
        getter operation_state : String

        # Error related to this specific network operation.
        @[JSON::Field(key: "error")]
        getter error : Types::ProblemDetails?

        # Metadata related to this network operation.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ListSolNetworkOperationsMetadata?

        # Type of the update. Only present if the network operation lcmOperationType is UPDATE .
        @[JSON::Field(key: "updateType")]
        getter update_type : String?

        def initialize(
          @arn : String,
          @id : String,
          @lcm_operation_type : String,
          @ns_instance_id : String,
          @operation_state : String,
          @error : Types::ProblemDetails? = nil,
          @metadata : Types::ListSolNetworkOperationsMetadata? = nil,
          @update_type : String? = nil
        )
        end
      end

      struct ListSolNetworkOperationsInput
        include JSON::Serializable

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextpage_opaque_marker")]
        getter next_token : String?

        # Network instance id filter, to retrieve network operations associated to a network instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @ns_instance_id : String? = nil
        )
        end
      end

      # Metadata related to a network operation. A network operation is any operation that is done to your
      # network, such as network instance instantiation or termination.
      struct ListSolNetworkOperationsMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The network service descriptor id used for the operation. Only present if the updateType is
        # UPDATE_NS .
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String?

        # The network function id used for the operation. Only present if the updateType is MODIFY_VNF_INFO .
        @[JSON::Field(key: "vnfInstanceId")]
        getter vnf_instance_id : String?

        def initialize(
          @created_at : Time,
          @last_modified : Time,
          @nsd_info_id : String? = nil,
          @vnf_instance_id : String? = nil
        )
        end
      end

      struct ListSolNetworkOperationsOutput
        include JSON::Serializable

        # Lists network operation occurrences. Lifecycle management operations are deploy, update, or delete
        # operations.
        @[JSON::Field(key: "networkOperations")]
        getter network_operations : Array(Types::ListSolNetworkOperationsInfo)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_operations : Array(Types::ListSolNetworkOperationsInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Details of a network package. A network package is a .zip file in CSAR (Cloud Service Archive)
      # format defines the function packages you want to deploy and the Amazon Web Services infrastructure
      # you want to deploy them on.
      struct ListSolNetworkPackageInfo
        include JSON::Serializable

        # Network package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # ID of the individual network package.
        @[JSON::Field(key: "id")]
        getter id : String

        # The metadata of the network package.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ListSolNetworkPackageMetadata

        # Onboarding state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOnboardingState")]
        getter nsd_onboarding_state : String

        # Operational state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOperationalState")]
        getter nsd_operational_state : String

        # Usage state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdUsageState")]
        getter nsd_usage_state : String

        # Designer of the onboarded network service descriptor in the network package.
        @[JSON::Field(key: "nsdDesigner")]
        getter nsd_designer : String?

        # ID of the network service descriptor on which the network package is based.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String?

        # Identifies a network service descriptor in a version independent manner.
        @[JSON::Field(key: "nsdInvariantId")]
        getter nsd_invariant_id : String?

        # Name of the onboarded network service descriptor in the network package.
        @[JSON::Field(key: "nsdName")]
        getter nsd_name : String?

        # Version of the onboarded network service descriptor in the network package.
        @[JSON::Field(key: "nsdVersion")]
        getter nsd_version : String?

        # Identifies the function package for the function package descriptor referenced by the onboarded
        # network package.
        @[JSON::Field(key: "vnfPkgIds")]
        getter vnf_pkg_ids : Array(String)?

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::ListSolNetworkPackageMetadata,
          @nsd_onboarding_state : String,
          @nsd_operational_state : String,
          @nsd_usage_state : String,
          @nsd_designer : String? = nil,
          @nsd_id : String? = nil,
          @nsd_invariant_id : String? = nil,
          @nsd_name : String? = nil,
          @nsd_version : String? = nil,
          @vnf_pkg_ids : Array(String)? = nil
        )
        end
      end

      # Metadata related to a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.
      struct ListSolNetworkPackageMetadata
        include JSON::Serializable

        # The date that the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The date that the resource was last modified.
        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        def initialize(
          @created_at : Time,
          @last_modified : Time
        )
        end
      end

      struct ListSolNetworkPackagesInput
        include JSON::Serializable

        # The maximum number of results to include in the response.
        @[JSON::Field(key: "max_results")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextpage_opaque_marker")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSolNetworkPackagesOutput
        include JSON::Serializable

        # Network packages. A network package is a .zip file in CSAR (Cloud Service Archive) format defines
        # the function packages you want to deploy and the Amazon Web Services infrastructure you want to
        # deploy them on.
        @[JSON::Field(key: "networkPackages")]
        getter network_packages : Array(Types::ListSolNetworkPackageInfo)

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @network_packages : Array(Types::ListSolNetworkPackageInfo),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # Resource ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Metadata related to the configuration properties used during update of a specific network function
      # in a network instance.
      struct ModifyVnfInfoMetadata
        include JSON::Serializable

        # The configurable properties used during update of the network function instance.
        @[JSON::Field(key: "vnfConfigurableProperties")]
        getter vnf_configurable_properties : Types::Document

        # The network function instance that was updated in the network instance.
        @[JSON::Field(key: "vnfInstanceId")]
        getter vnf_instance_id : String

        def initialize(
          @vnf_configurable_properties : Types::Document,
          @vnf_instance_id : String
        )
        end
      end

      # Metadata for network package artifacts. Artifacts are the contents of the package descriptor file
      # and the state of the package.
      struct NetworkArtifactMeta
        include JSON::Serializable

        # Lists network package overrides.
        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::ToscaOverride)?

        def initialize(
          @overrides : Array(Types::ToscaOverride)? = nil
        )
        end
      end

      # Details related to problems with AWS TNB resources.
      struct ProblemDetails
        include JSON::Serializable

        # A human-readable explanation specific to this occurrence of the problem.
        @[JSON::Field(key: "detail")]
        getter detail : String

        # A human-readable title of the problem type.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @detail : String,
          @title : String? = nil
        )
        end
      end

      struct PutSolFunctionPackageContentInput
        include JSON::Serializable

        # Function package file.
        @[JSON::Field(key: "file")]
        getter file : Bytes

        # Function package ID.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        # Function package content type.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @file : Bytes,
          @vnf_pkg_id : String,
          @content_type : String? = nil
        )
        end
      end

      # Update metadata in a function package. A function package is a .zip file in CSAR (Cloud Service
      # Archive) format that contains a network function (an ETSI standard telecommunication application)
      # and function package descriptor that uses the TOSCA standard to describe how the network functions
      # should run on your network.
      struct PutSolFunctionPackageContentMetadata
        include JSON::Serializable

        @[JSON::Field(key: "vnfd")]
        getter vnfd : Types::FunctionArtifactMeta?

        def initialize(
          @vnfd : Types::FunctionArtifactMeta? = nil
        )
        end
      end

      struct PutSolFunctionPackageContentOutput
        include JSON::Serializable

        # Function package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Function package metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::PutSolFunctionPackageContentMetadata

        # Function product name.
        @[JSON::Field(key: "vnfProductName")]
        getter vnf_product_name : String

        # Function provider.
        @[JSON::Field(key: "vnfProvider")]
        getter vnf_provider : String

        # Function package descriptor ID.
        @[JSON::Field(key: "vnfdId")]
        getter vnfd_id : String

        # Function package descriptor version.
        @[JSON::Field(key: "vnfdVersion")]
        getter vnfd_version : String

        def initialize(
          @id : String,
          @metadata : Types::PutSolFunctionPackageContentMetadata,
          @vnf_product_name : String,
          @vnf_provider : String,
          @vnfd_id : String,
          @vnfd_version : String
        )
        end
      end

      struct PutSolNetworkPackageContentInput
        include JSON::Serializable

        # Network package file.
        @[JSON::Field(key: "file")]
        getter file : Bytes

        # Network service descriptor info ID.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # Network package content type.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @file : Bytes,
          @nsd_info_id : String,
          @content_type : String? = nil
        )
        end
      end

      # Update metadata in a network package. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.
      struct PutSolNetworkPackageContentMetadata
        include JSON::Serializable

        @[JSON::Field(key: "nsd")]
        getter nsd : Types::NetworkArtifactMeta?

        def initialize(
          @nsd : Types::NetworkArtifactMeta? = nil
        )
        end
      end

      struct PutSolNetworkPackageContentOutput
        include JSON::Serializable

        # Network package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Network package metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::PutSolNetworkPackageContentMetadata

        # Network service descriptor ID.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String

        # Network service descriptor name.
        @[JSON::Field(key: "nsdName")]
        getter nsd_name : String

        # Network service descriptor version.
        @[JSON::Field(key: "nsdVersion")]
        getter nsd_version : String

        # Function package IDs.
        @[JSON::Field(key: "vnfPkgIds")]
        getter vnf_pkg_ids : Array(String)

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::PutSolNetworkPackageContentMetadata,
          @nsd_id : String,
          @nsd_name : String,
          @nsd_version : String,
          @vnf_pkg_ids : Array(String)
        )
        end
      end

      # Request references a resource that doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Service quotas have been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # Resource ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. You can use tags to search and filter your resources or track your Amazon Web
        # Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct TerminateSolNetworkInstanceInput
        include JSON::Serializable

        # ID of the network instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_instance_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct TerminateSolNetworkInstanceOutput
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_lcm_op_occ_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Exception caused by throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Overrides of the TOSCA node.
      struct ToscaOverride
        include JSON::Serializable

        # Default value for the override.
        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # Name of the TOSCA override.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @default_value : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # Resource ARN.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Tag keys.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Metadata related to the configuration properties used during update of a network instance.
      struct UpdateNsMetadata
        include JSON::Serializable

        # The network service descriptor used for updating the network instance.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # The configurable properties used during update.
        @[JSON::Field(key: "additionalParamsForNs")]
        getter additional_params_for_ns : Types::Document?

        def initialize(
          @nsd_info_id : String,
          @additional_params_for_ns : Types::Document? = nil
        )
        end
      end

      struct UpdateSolFunctionPackageInput
        include JSON::Serializable

        # Operational state of the function package.
        @[JSON::Field(key: "operationalState")]
        getter operational_state : String

        # ID of the function package.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        def initialize(
          @operational_state : String,
          @vnf_pkg_id : String
        )
        end
      end

      struct UpdateSolFunctionPackageOutput
        include JSON::Serializable

        # Operational state of the function package.
        @[JSON::Field(key: "operationalState")]
        getter operational_state : String

        def initialize(
          @operational_state : String
        )
        end
      end

      struct UpdateSolNetworkInstanceInput
        include JSON::Serializable

        # ID of the network instance.
        @[JSON::Field(key: "nsInstanceId")]
        getter ns_instance_id : String

        # The type of update. Use the MODIFY_VNF_INFORMATION update type, to update a specific network
        # function configuration, in the network instance. Use the UPDATE_NS update type, to update the
        # network instance to a new network service descriptor.
        @[JSON::Field(key: "updateType")]
        getter update_type : String

        # Identifies the network function information parameters and/or the configurable properties of the
        # network function to be modified. Include this property only if the update type is
        # MODIFY_VNF_INFORMATION .
        @[JSON::Field(key: "modifyVnfInfoData")]
        getter modify_vnf_info_data : Types::UpdateSolNetworkModify?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Identifies the network service descriptor and the configurable properties of the descriptor, to be
        # used for the update. Include this property only if the update type is UPDATE_NS .
        @[JSON::Field(key: "updateNs")]
        getter update_ns : Types::UpdateSolNetworkServiceData?

        def initialize(
          @ns_instance_id : String,
          @update_type : String,
          @modify_vnf_info_data : Types::UpdateSolNetworkModify? = nil,
          @tags : Hash(String, String)? = nil,
          @update_ns : Types::UpdateSolNetworkServiceData? = nil
        )
        end
      end

      struct UpdateSolNetworkInstanceOutput
        include JSON::Serializable

        # The identifier of the network operation.
        @[JSON::Field(key: "nsLcmOpOccId")]
        getter ns_lcm_op_occ_id : String?

        # A tag is a label that you assign to an Amazon Web Services resource. Each tag consists of a key and
        # an optional value. When you use this API, the tags are only applied to the network operation that is
        # created. These tags are not applied to the network instance. Use tags to search and filter your
        # resources or track your Amazon Web Services costs.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ns_lcm_op_occ_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information parameters and/or the configurable properties for a network function. A network function
      # instance is a function in a function package .
      struct UpdateSolNetworkModify
        include JSON::Serializable

        # Provides values for the configurable properties declared in the function package descriptor.
        @[JSON::Field(key: "vnfConfigurableProperties")]
        getter vnf_configurable_properties : Types::Document

        # ID of the network function instance. A network function instance is a function in a function package
        # .
        @[JSON::Field(key: "vnfInstanceId")]
        getter vnf_instance_id : String

        def initialize(
          @vnf_configurable_properties : Types::Document,
          @vnf_instance_id : String
        )
        end
      end

      struct UpdateSolNetworkPackageInput
        include JSON::Serializable

        # ID of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # Operational state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOperationalState")]
        getter nsd_operational_state : String

        def initialize(
          @nsd_info_id : String,
          @nsd_operational_state : String
        )
        end
      end

      struct UpdateSolNetworkPackageOutput
        include JSON::Serializable

        # Operational state of the network service descriptor in the network package.
        @[JSON::Field(key: "nsdOperationalState")]
        getter nsd_operational_state : String

        def initialize(
          @nsd_operational_state : String
        )
        end
      end

      # Information parameters and/or the configurable properties for a network descriptor used for update.
      struct UpdateSolNetworkServiceData
        include JSON::Serializable

        # ID of the network service descriptor.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # Values for the configurable properties declared in the network service descriptor.
        @[JSON::Field(key: "additionalParamsForNs")]
        getter additional_params_for_ns : Types::Document?

        def initialize(
          @nsd_info_id : String,
          @additional_params_for_ns : Types::Document? = nil
        )
        end
      end

      struct ValidateSolFunctionPackageContentInput
        include JSON::Serializable

        # Function package file.
        @[JSON::Field(key: "file")]
        getter file : Bytes

        # Function package ID.
        @[JSON::Field(key: "vnfPkgId")]
        getter vnf_pkg_id : String

        # Function package content type.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @file : Bytes,
          @vnf_pkg_id : String,
          @content_type : String? = nil
        )
        end
      end

      # Validates function package content metadata. A function package is a .zip file in CSAR (Cloud
      # Service Archive) format that contains a network function (an ETSI standard telecommunication
      # application) and function package descriptor that uses the TOSCA standard to describe how the
      # network functions should run on your network.
      struct ValidateSolFunctionPackageContentMetadata
        include JSON::Serializable

        @[JSON::Field(key: "vnfd")]
        getter vnfd : Types::FunctionArtifactMeta?

        def initialize(
          @vnfd : Types::FunctionArtifactMeta? = nil
        )
        end
      end

      struct ValidateSolFunctionPackageContentOutput
        include JSON::Serializable

        # Function package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Function package metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ValidateSolFunctionPackageContentMetadata

        # Network function product name.
        @[JSON::Field(key: "vnfProductName")]
        getter vnf_product_name : String

        # Network function provider.
        @[JSON::Field(key: "vnfProvider")]
        getter vnf_provider : String

        # Function package descriptor ID.
        @[JSON::Field(key: "vnfdId")]
        getter vnfd_id : String

        # Function package descriptor version.
        @[JSON::Field(key: "vnfdVersion")]
        getter vnfd_version : String

        def initialize(
          @id : String,
          @metadata : Types::ValidateSolFunctionPackageContentMetadata,
          @vnf_product_name : String,
          @vnf_provider : String,
          @vnfd_id : String,
          @vnfd_version : String
        )
        end
      end

      struct ValidateSolNetworkPackageContentInput
        include JSON::Serializable

        # Network package file.
        @[JSON::Field(key: "file")]
        getter file : Bytes

        # Network service descriptor file.
        @[JSON::Field(key: "nsdInfoId")]
        getter nsd_info_id : String

        # Network package content type.
        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        def initialize(
          @file : Bytes,
          @nsd_info_id : String,
          @content_type : String? = nil
        )
        end
      end

      # Validates network package content metadata. A network package is a .zip file in CSAR (Cloud Service
      # Archive) format defines the function packages you want to deploy and the Amazon Web Services
      # infrastructure you want to deploy them on.
      struct ValidateSolNetworkPackageContentMetadata
        include JSON::Serializable

        @[JSON::Field(key: "nsd")]
        getter nsd : Types::NetworkArtifactMeta?

        def initialize(
          @nsd : Types::NetworkArtifactMeta? = nil
        )
        end
      end

      struct ValidateSolNetworkPackageContentOutput
        include JSON::Serializable

        # Network package ARN.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Network package ID.
        @[JSON::Field(key: "id")]
        getter id : String

        # Network package metadata.
        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ValidateSolNetworkPackageContentMetadata

        # Network service descriptor ID.
        @[JSON::Field(key: "nsdId")]
        getter nsd_id : String

        # Network service descriptor name.
        @[JSON::Field(key: "nsdName")]
        getter nsd_name : String

        # Network service descriptor version.
        @[JSON::Field(key: "nsdVersion")]
        getter nsd_version : String

        # Function package IDs.
        @[JSON::Field(key: "vnfPkgIds")]
        getter vnf_pkg_ids : Array(String)

        def initialize(
          @arn : String,
          @id : String,
          @metadata : Types::ValidateSolNetworkPackageContentMetadata,
          @nsd_id : String,
          @nsd_name : String,
          @nsd_version : String,
          @vnf_pkg_ids : Array(String)
        )
        end
      end

      # Unable to process the request because the client provided input failed to satisfy request
      # constraints.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
