require "json"
require "time"

module Aws
  module Inspector2
    module Types

      # You do not have sufficient access to perform this action. For Enable , you receive this error if you
      # attempt to use a feature in an unsupported Amazon Web Services Region.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An Amazon Web Services account within your environment that Amazon Inspector has been enabled for.

      struct Account
        include JSON::Serializable

        # The ID of the Amazon Web Services account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # Details of the status of Amazon Inspector scans by resource type.

        @[JSON::Field(key: "resourceStatus")]
        getter resource_status : Types::ResourceStatus

        # The status of Amazon Inspector for the account.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @account_id : String,
          @resource_status : Types::ResourceStatus,
          @status : String
        )
        end
      end

      # An object that contains details about an aggregation response based on Amazon Web Services accounts.

      struct AccountAggregation
        include JSON::Serializable

        # The type of finding.

        @[JSON::Field(key: "findingType")]
        getter finding_type : String?

        # The type of resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The value to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @finding_type : String? = nil,
          @resource_type : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # An aggregation of findings by Amazon Web Services account ID.

      struct AccountAggregationResponse
        include JSON::Serializable

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The number of findings that have an exploit available.

        @[JSON::Field(key: "exploitAvailableCount")]
        getter exploit_available_count : Int64?

        # Details about the number of fixes.

        @[JSON::Field(key: "fixAvailableCount")]
        getter fix_available_count : Int64?

        # The number of findings by severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @account_id : String? = nil,
          @exploit_available_count : Int64? = nil,
          @fix_available_count : Int64? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # An object with details the status of an Amazon Web Services account within your Amazon Inspector
      # environment.

      struct AccountState
        include JSON::Serializable

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # An object detailing which resources Amazon Inspector is enabled to scan for the account.

        @[JSON::Field(key: "resourceState")]
        getter resource_state : Types::ResourceState

        # An object detailing the status of Amazon Inspector for the account.

        @[JSON::Field(key: "state")]
        getter state : Types::State

        def initialize(
          @account_id : String,
          @resource_state : Types::ResourceState,
          @state : Types::State
        )
        end
      end

      # Contains details about an aggregation request.

      struct AggregationRequest
        include JSON::Serializable

        # An object that contains details about an aggregation request based on Amazon Web Services account
        # IDs.

        @[JSON::Field(key: "accountAggregation")]
        getter account_aggregation : Types::AccountAggregation?

        # An object that contains details about an aggregation request based on Amazon Machine Images (AMIs).

        @[JSON::Field(key: "amiAggregation")]
        getter ami_aggregation : Types::AmiAggregation?

        # An object that contains details about an aggregation request based on Amazon ECR container images.

        @[JSON::Field(key: "awsEcrContainerAggregation")]
        getter aws_ecr_container_aggregation : Types::AwsEcrContainerAggregation?

        # An object that contains details about an aggregation request based on code repositories.

        @[JSON::Field(key: "codeRepositoryAggregation")]
        getter code_repository_aggregation : Types::CodeRepositoryAggregation?

        # An object that contains details about an aggregation request based on Amazon EC2 instances.

        @[JSON::Field(key: "ec2InstanceAggregation")]
        getter ec2_instance_aggregation : Types::Ec2InstanceAggregation?

        # An object that contains details about an aggregation request based on finding types.

        @[JSON::Field(key: "findingTypeAggregation")]
        getter finding_type_aggregation : Types::FindingTypeAggregation?

        # An object that contains details about an aggregation request based on container image layers.

        @[JSON::Field(key: "imageLayerAggregation")]
        getter image_layer_aggregation : Types::ImageLayerAggregation?

        # Returns an object with findings aggregated by Amazon Web Services Lambda function.

        @[JSON::Field(key: "lambdaFunctionAggregation")]
        getter lambda_function_aggregation : Types::LambdaFunctionAggregation?

        # Returns an object with findings aggregated by Amazon Web Services Lambda layer.

        @[JSON::Field(key: "lambdaLayerAggregation")]
        getter lambda_layer_aggregation : Types::LambdaLayerAggregation?

        # An object that contains details about an aggregation request based on operating system package type.

        @[JSON::Field(key: "packageAggregation")]
        getter package_aggregation : Types::PackageAggregation?

        # An object that contains details about an aggregation request based on Amazon ECR repositories.

        @[JSON::Field(key: "repositoryAggregation")]
        getter repository_aggregation : Types::RepositoryAggregation?

        # An object that contains details about an aggregation request based on finding title.

        @[JSON::Field(key: "titleAggregation")]
        getter title_aggregation : Types::TitleAggregation?

        def initialize(
          @account_aggregation : Types::AccountAggregation? = nil,
          @ami_aggregation : Types::AmiAggregation? = nil,
          @aws_ecr_container_aggregation : Types::AwsEcrContainerAggregation? = nil,
          @code_repository_aggregation : Types::CodeRepositoryAggregation? = nil,
          @ec2_instance_aggregation : Types::Ec2InstanceAggregation? = nil,
          @finding_type_aggregation : Types::FindingTypeAggregation? = nil,
          @image_layer_aggregation : Types::ImageLayerAggregation? = nil,
          @lambda_function_aggregation : Types::LambdaFunctionAggregation? = nil,
          @lambda_layer_aggregation : Types::LambdaLayerAggregation? = nil,
          @package_aggregation : Types::PackageAggregation? = nil,
          @repository_aggregation : Types::RepositoryAggregation? = nil,
          @title_aggregation : Types::TitleAggregation? = nil
        )
        end
      end

      # A structure that contains details about the results of an aggregation type.

      struct AggregationResponse
        include JSON::Serializable

        # An object that contains details about an aggregation response based on Amazon Web Services account
        # IDs.

        @[JSON::Field(key: "accountAggregation")]
        getter account_aggregation : Types::AccountAggregationResponse?

        # An object that contains details about an aggregation response based on Amazon Machine Images (AMIs).

        @[JSON::Field(key: "amiAggregation")]
        getter ami_aggregation : Types::AmiAggregationResponse?

        # An object that contains details about an aggregation response based on Amazon ECR container images.

        @[JSON::Field(key: "awsEcrContainerAggregation")]
        getter aws_ecr_container_aggregation : Types::AwsEcrContainerAggregationResponse?

        # An object that contains details about an aggregation response based on code repositories.

        @[JSON::Field(key: "codeRepositoryAggregation")]
        getter code_repository_aggregation : Types::CodeRepositoryAggregationResponse?

        # An object that contains details about an aggregation response based on Amazon EC2 instances.

        @[JSON::Field(key: "ec2InstanceAggregation")]
        getter ec2_instance_aggregation : Types::Ec2InstanceAggregationResponse?

        # An object that contains details about an aggregation response based on finding types.

        @[JSON::Field(key: "findingTypeAggregation")]
        getter finding_type_aggregation : Types::FindingTypeAggregationResponse?

        # An object that contains details about an aggregation response based on container image layers.

        @[JSON::Field(key: "imageLayerAggregation")]
        getter image_layer_aggregation : Types::ImageLayerAggregationResponse?

        # An aggregation of findings by Amazon Web Services Lambda function.

        @[JSON::Field(key: "lambdaFunctionAggregation")]
        getter lambda_function_aggregation : Types::LambdaFunctionAggregationResponse?

        # An aggregation of findings by Amazon Web Services Lambda layer.

        @[JSON::Field(key: "lambdaLayerAggregation")]
        getter lambda_layer_aggregation : Types::LambdaLayerAggregationResponse?

        # An object that contains details about an aggregation response based on operating system package
        # type.

        @[JSON::Field(key: "packageAggregation")]
        getter package_aggregation : Types::PackageAggregationResponse?

        # An object that contains details about an aggregation response based on Amazon ECR repositories.

        @[JSON::Field(key: "repositoryAggregation")]
        getter repository_aggregation : Types::RepositoryAggregationResponse?

        # An object that contains details about an aggregation response based on finding title.

        @[JSON::Field(key: "titleAggregation")]
        getter title_aggregation : Types::TitleAggregationResponse?

        def initialize(
          @account_aggregation : Types::AccountAggregationResponse? = nil,
          @ami_aggregation : Types::AmiAggregationResponse? = nil,
          @aws_ecr_container_aggregation : Types::AwsEcrContainerAggregationResponse? = nil,
          @code_repository_aggregation : Types::CodeRepositoryAggregationResponse? = nil,
          @ec2_instance_aggregation : Types::Ec2InstanceAggregationResponse? = nil,
          @finding_type_aggregation : Types::FindingTypeAggregationResponse? = nil,
          @image_layer_aggregation : Types::ImageLayerAggregationResponse? = nil,
          @lambda_function_aggregation : Types::LambdaFunctionAggregationResponse? = nil,
          @lambda_layer_aggregation : Types::LambdaLayerAggregationResponse? = nil,
          @package_aggregation : Types::PackageAggregationResponse? = nil,
          @repository_aggregation : Types::RepositoryAggregationResponse? = nil,
          @title_aggregation : Types::TitleAggregationResponse? = nil
        )
        end
      end

      # The details that define an aggregation based on Amazon machine images (AMIs).

      struct AmiAggregation
        include JSON::Serializable

        # The IDs of AMIs to aggregate findings for.

        @[JSON::Field(key: "amis")]
        getter amis : Array(Types::StringFilter)?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @amis : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding aggregation by AMI.

      struct AmiAggregationResponse
        include JSON::Serializable

        # The ID of the AMI that findings were aggregated for.

        @[JSON::Field(key: "ami")]
        getter ami : String

        # The Amazon Web Services account ID for the AMI.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The IDs of Amazon EC2 instances using this AMI.

        @[JSON::Field(key: "affectedInstances")]
        getter affected_instances : Int64?

        # An object that contains the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @ami : String,
          @account_id : String? = nil,
          @affected_instances : Int64? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Contains details about a request to associate a code repository with a scan configuration.

      struct AssociateConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource

        # The Amazon Resource Name (ARN) of the scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @resource : Types::CodeSecurityResource,
          @scan_configuration_arn : String
        )
        end
      end


      struct AssociateMemberRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the member account to be associated.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct AssociateMemberResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the successfully associated member account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # The Amazon Web Services Threat Intel Group (ATIG) details for a specific vulnerability.

      struct AtigData
        include JSON::Serializable

        # The date and time this vulnerability was first observed.

        @[JSON::Field(key: "firstSeen")]
        getter first_seen : Time?

        # The date and time this vulnerability was last observed.

        @[JSON::Field(key: "lastSeen")]
        getter last_seen : Time?

        # The commercial sectors this vulnerability targets.

        @[JSON::Field(key: "targets")]
        getter targets : Array(String)?

        # The MITRE ATT&amp;CK tactics, techniques, and procedures (TTPs) associated with vulnerability.

        @[JSON::Field(key: "ttps")]
        getter ttps : Array(String)?

        def initialize(
          @first_seen : Time? = nil,
          @last_seen : Time? = nil,
          @targets : Array(String)? = nil,
          @ttps : Array(String)? = nil
        )
        end
      end

      # Represents which scan types are automatically enabled for new members of your Amazon Inspector
      # organization.

      struct AutoEnable
        include JSON::Serializable

        # Represents whether Amazon EC2 scans are automatically enabled for new members of your Amazon
        # Inspector organization.

        @[JSON::Field(key: "ec2")]
        getter ec2 : Bool

        # Represents whether Amazon ECR scans are automatically enabled for new members of your Amazon
        # Inspector organization.

        @[JSON::Field(key: "ecr")]
        getter ecr : Bool

        # Represents whether code repository scans are automatically enabled for new members of your Amazon
        # Inspector organization.

        @[JSON::Field(key: "codeRepository")]
        getter code_repository : Bool?

        # Represents whether Amazon Web Services Lambda standard scans are automatically enabled for new
        # members of your Amazon Inspector organization.

        @[JSON::Field(key: "lambda")]
        getter lambda : Bool?

        # Represents whether Lambda code scans are automatically enabled for new members of your Amazon
        # Inspector organization.

        @[JSON::Field(key: "lambdaCode")]
        getter lambda_code : Bool?

        def initialize(
          @ec2 : Bool,
          @ecr : Bool,
          @code_repository : Bool? = nil,
          @lambda : Bool? = nil,
          @lambda_code : Bool? = nil
        )
        end
      end

      # Details of the Amazon EC2 instance involved in a finding.

      struct AwsEc2InstanceDetails
        include JSON::Serializable

        # The IAM instance profile ARN of the Amazon EC2 instance.

        @[JSON::Field(key: "iamInstanceProfileArn")]
        getter iam_instance_profile_arn : String?

        # The image ID of the Amazon EC2 instance.

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The IPv4 addresses of the Amazon EC2 instance.

        @[JSON::Field(key: "ipV4Addresses")]
        getter ip_v4_addresses : Array(String)?

        # The IPv6 addresses of the Amazon EC2 instance.

        @[JSON::Field(key: "ipV6Addresses")]
        getter ip_v6_addresses : Array(String)?

        # The name of the key pair used to launch the Amazon EC2 instance.

        @[JSON::Field(key: "keyName")]
        getter key_name : String?

        # The date and time the Amazon EC2 instance was launched at.

        @[JSON::Field(key: "launchedAt")]
        getter launched_at : Time?

        # The platform of the Amazon EC2 instance.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The subnet ID of the Amazon EC2 instance.

        @[JSON::Field(key: "subnetId")]
        getter subnet_id : String?

        # The type of the Amazon EC2 instance.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The VPC ID of the Amazon EC2 instance.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @iam_instance_profile_arn : String? = nil,
          @image_id : String? = nil,
          @ip_v4_addresses : Array(String)? = nil,
          @ip_v6_addresses : Array(String)? = nil,
          @key_name : String? = nil,
          @launched_at : Time? = nil,
          @platform : String? = nil,
          @subnet_id : String? = nil,
          @type : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # An aggregation of information about Amazon ECR containers.

      struct AwsEcrContainerAggregation
        include JSON::Serializable

        # The architecture of the containers.

        @[JSON::Field(key: "architectures")]
        getter architectures : Array(Types::StringFilter)?

        # The image SHA values.

        @[JSON::Field(key: "imageShas")]
        getter image_shas : Array(Types::StringFilter)?

        # The image tags.

        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(Types::StringFilter)?

        # The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR container image is in use.

        @[JSON::Field(key: "inUseCount")]
        getter in_use_count : Array(Types::NumberFilter)?

        # The last time an Amazon ECR image was used in an Amazon ECS task or Amazon EKS pod.

        @[JSON::Field(key: "lastInUseAt")]
        getter last_in_use_at : Array(Types::DateFilter)?

        # The container repositories.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::StringFilter)?

        # The container resource IDs.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(Types::StringFilter)?

        # The value to sort by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order (ascending or descending).

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @architectures : Array(Types::StringFilter)? = nil,
          @image_shas : Array(Types::StringFilter)? = nil,
          @image_tags : Array(Types::StringFilter)? = nil,
          @in_use_count : Array(Types::NumberFilter)? = nil,
          @last_in_use_at : Array(Types::DateFilter)? = nil,
          @repositories : Array(Types::StringFilter)? = nil,
          @resource_ids : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # An aggregation of information about Amazon ECR containers.

      struct AwsEcrContainerAggregationResponse
        include JSON::Serializable

        # The resource ID of the container.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The Amazon Web Services account ID of the account that owns the container.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The architecture of the container.

        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The SHA value of the container image.

        @[JSON::Field(key: "imageSha")]
        getter image_sha : String?

        # The container image stags.

        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR container image is in use.

        @[JSON::Field(key: "inUseCount")]
        getter in_use_count : Int64?

        # The last time an Amazon ECR image was used in an Amazon ECS task or Amazon EKS pod.

        @[JSON::Field(key: "lastInUseAt")]
        getter last_in_use_at : Time?

        # The container repository.

        @[JSON::Field(key: "repository")]
        getter repository : String?

        # The number of finding by severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @resource_id : String,
          @account_id : String? = nil,
          @architecture : String? = nil,
          @image_sha : String? = nil,
          @image_tags : Array(String)? = nil,
          @in_use_count : Int64? = nil,
          @last_in_use_at : Time? = nil,
          @repository : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # The image details of the Amazon ECR container image.

      struct AwsEcrContainerImageDetails
        include JSON::Serializable

        # The image hash of the Amazon ECR container image.

        @[JSON::Field(key: "imageHash")]
        getter image_hash : String

        # The registry for the Amazon ECR container image.

        @[JSON::Field(key: "registry")]
        getter registry : String

        # The name of the repository the Amazon ECR container image resides in.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The architecture of the Amazon ECR container image.

        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The image author of the Amazon ECR container image.

        @[JSON::Field(key: "author")]
        getter author : String?

        # The image tags attached to the Amazon ECR container image.

        @[JSON::Field(key: "imageTags")]
        getter image_tags : Array(String)?

        # The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR container image is in use.

        @[JSON::Field(key: "inUseCount")]
        getter in_use_count : Int64?

        # The last time an Amazon ECR image was used in an Amazon ECS task or Amazon EKS pod.

        @[JSON::Field(key: "lastInUseAt")]
        getter last_in_use_at : Time?

        # The platform of the Amazon ECR container image.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The date and time the Amazon ECR container image was pushed.

        @[JSON::Field(key: "pushedAt")]
        getter pushed_at : Time?

        def initialize(
          @image_hash : String,
          @registry : String,
          @repository_name : String,
          @architecture : String? = nil,
          @author : String? = nil,
          @image_tags : Array(String)? = nil,
          @in_use_count : Int64? = nil,
          @last_in_use_at : Time? = nil,
          @platform : String? = nil,
          @pushed_at : Time? = nil
        )
        end
      end

      # Metadata about tasks where an image was in use.

      struct AwsEcsMetadataDetails
        include JSON::Serializable

        # The details group information for a task in a cluster.

        @[JSON::Field(key: "detailsGroup")]
        getter details_group : String

        # The task definition ARN.

        @[JSON::Field(key: "taskDefinitionArn")]
        getter task_definition_arn : String

        def initialize(
          @details_group : String,
          @task_definition_arn : String
        )
        end
      end

      # The metadata for an Amazon EKS pod where an Amazon ECR image is in use.

      struct AwsEksMetadataDetails
        include JSON::Serializable

        # The namespace for an Amazon EKS cluster.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The list of workloads.

        @[JSON::Field(key: "workloadInfoList")]
        getter workload_info_list : Array(Types::AwsEksWorkloadInfo)?

        def initialize(
          @namespace : String? = nil,
          @workload_info_list : Array(Types::AwsEksWorkloadInfo)? = nil
        )
        end
      end

      # Information about the workload.

      struct AwsEksWorkloadInfo
        include JSON::Serializable

        # The name of the workload.

        @[JSON::Field(key: "name")]
        getter name : String

        # The workload type.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # A summary of information about the Amazon Web Services Lambda function.

      struct AwsLambdaFunctionDetails
        include JSON::Serializable

        # The SHA256 hash of the Amazon Web Services Lambda function's deployment package.

        @[JSON::Field(key: "codeSha256")]
        getter code_sha256 : String

        # The Amazon Web Services Lambda function's execution role.

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The name of the Amazon Web Services Lambda function.

        @[JSON::Field(key: "functionName")]
        getter function_name : String

        # The runtime environment for the Amazon Web Services Lambda function.

        @[JSON::Field(key: "runtime")]
        getter runtime : String

        # The version of the Amazon Web Services Lambda function.

        @[JSON::Field(key: "version")]
        getter version : String

        # The instruction set architecture that the Amazon Web Services Lambda function supports. Architecture
        # is a string array with one of the valid values. The default architecture value is x86_64 .

        @[JSON::Field(key: "architectures")]
        getter architectures : Array(String)?

        # The date and time that a user last updated the configuration, in ISO 8601 format

        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time?

        # The Amazon Web Services Lambda function's layers . A Lambda function can have up to five layers.

        @[JSON::Field(key: "layers")]
        getter layers : Array(String)?

        # The type of deployment package. Set to Image for container image and set Zip for .zip file archive.

        @[JSON::Field(key: "packageType")]
        getter package_type : String?

        # The Amazon Web Services Lambda function's networking configuration.

        @[JSON::Field(key: "vpcConfig")]
        getter vpc_config : Types::LambdaVpcConfig?

        def initialize(
          @code_sha256 : String,
          @execution_role_arn : String,
          @function_name : String,
          @runtime : String,
          @version : String,
          @architectures : Array(String)? = nil,
          @last_modified_at : Time? = nil,
          @layers : Array(String)? = nil,
          @package_type : String? = nil,
          @vpc_config : Types::LambdaVpcConfig? = nil
        )
        end
      end

      # One or more tags submitted as part of the request is not valid.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct BatchAssociateCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # A list of code repositories to associate with the specified scan configuration.

        @[JSON::Field(key: "associateConfigurationRequests")]
        getter associate_configuration_requests : Array(Types::AssociateConfigurationRequest)

        def initialize(
          @associate_configuration_requests : Array(Types::AssociateConfigurationRequest)
        )
        end
      end


      struct BatchAssociateCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # Details of any code repositories that failed to be associated with the scan configuration.

        @[JSON::Field(key: "failedAssociations")]
        getter failed_associations : Array(Types::FailedAssociationResult)?

        # Details of code repositories that were successfully associated with the scan configuration.

        @[JSON::Field(key: "successfulAssociations")]
        getter successful_associations : Array(Types::SuccessfulAssociationResult)?

        def initialize(
          @failed_associations : Array(Types::FailedAssociationResult)? = nil,
          @successful_associations : Array(Types::SuccessfulAssociationResult)? = nil
        )
        end
      end


      struct BatchDisassociateCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # A list of code repositories to disassociate from the specified scan configuration.

        @[JSON::Field(key: "disassociateConfigurationRequests")]
        getter disassociate_configuration_requests : Array(Types::DisassociateConfigurationRequest)

        def initialize(
          @disassociate_configuration_requests : Array(Types::DisassociateConfigurationRequest)
        )
        end
      end


      struct BatchDisassociateCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # Details of any code repositories that failed to be disassociated from the scan configuration.

        @[JSON::Field(key: "failedAssociations")]
        getter failed_associations : Array(Types::FailedAssociationResult)?

        # Details of code repositories that were successfully disassociated from the scan configuration.

        @[JSON::Field(key: "successfulAssociations")]
        getter successful_associations : Array(Types::SuccessfulAssociationResult)?

        def initialize(
          @failed_associations : Array(Types::FailedAssociationResult)? = nil,
          @successful_associations : Array(Types::SuccessfulAssociationResult)? = nil
        )
        end
      end


      struct BatchGetAccountStatusRequest
        include JSON::Serializable

        # The 12-digit Amazon Web Services account IDs of the accounts to retrieve Amazon Inspector status
        # for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil
        )
        end
      end


      struct BatchGetAccountStatusResponse
        include JSON::Serializable

        # An array of objects that provide details on the status of Amazon Inspector for each of the requested
        # accounts.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::AccountState)

        # An array of objects detailing any accounts that failed to enable Amazon Inspector and why.

        @[JSON::Field(key: "failedAccounts")]
        getter failed_accounts : Array(Types::FailedAccount)?

        def initialize(
          @accounts : Array(Types::AccountState),
          @failed_accounts : Array(Types::FailedAccount)? = nil
        )
        end
      end


      struct BatchGetCodeSnippetRequest
        include JSON::Serializable

        # An array of finding ARNs for the findings you want to retrieve code snippets from.

        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        def initialize(
          @finding_arns : Array(String)
        )
        end
      end


      struct BatchGetCodeSnippetResponse
        include JSON::Serializable

        # The retrieved code snippets associated with the provided finding ARNs.

        @[JSON::Field(key: "codeSnippetResults")]
        getter code_snippet_results : Array(Types::CodeSnippetResult)?

        # Any errors Amazon Inspector encountered while trying to retrieve the requested code snippets.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::CodeSnippetError)?

        def initialize(
          @code_snippet_results : Array(Types::CodeSnippetResult)? = nil,
          @errors : Array(Types::CodeSnippetError)? = nil
        )
        end
      end


      struct BatchGetFindingDetailsRequest
        include JSON::Serializable

        # A list of finding ARNs.

        @[JSON::Field(key: "findingArns")]
        getter finding_arns : Array(String)

        def initialize(
          @finding_arns : Array(String)
        )
        end
      end


      struct BatchGetFindingDetailsResponse
        include JSON::Serializable

        # Error information for findings that details could not be returned for.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::FindingDetailsError)?

        # A finding's vulnerability details.

        @[JSON::Field(key: "findingDetails")]
        getter finding_details : Array(Types::FindingDetail)?

        def initialize(
          @errors : Array(Types::FindingDetailsError)? = nil,
          @finding_details : Array(Types::FindingDetail)? = nil
        )
        end
      end


      struct BatchGetFreeTrialInfoRequest
        include JSON::Serializable

        # The account IDs to get free trial status for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        def initialize(
          @account_ids : Array(String)
        )
        end
      end


      struct BatchGetFreeTrialInfoResponse
        include JSON::Serializable

        # An array of objects that provide Amazon Inspector free trial details for each of the requested
        # accounts.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::FreeTrialAccountInfo)

        # An array of objects detailing any accounts that free trial data could not be returned for.

        @[JSON::Field(key: "failedAccounts")]
        getter failed_accounts : Array(Types::FreeTrialInfoError)

        def initialize(
          @accounts : Array(Types::FreeTrialAccountInfo),
          @failed_accounts : Array(Types::FreeTrialInfoError)
        )
        end
      end


      struct BatchGetMemberEc2DeepInspectionStatusRequest
        include JSON::Serializable

        # The unique identifiers for the Amazon Web Services accounts to retrieve Amazon Inspector deep
        # inspection activation status for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil
        )
        end
      end


      struct BatchGetMemberEc2DeepInspectionStatusResponse
        include JSON::Serializable

        # An array of objects that provide details on the activation status of Amazon Inspector deep
        # inspection for each of the requested accounts.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(Types::MemberAccountEc2DeepInspectionStatusState)?

        # An array of objects that provide details on any accounts that failed to activate Amazon Inspector
        # deep inspection and why.

        @[JSON::Field(key: "failedAccountIds")]
        getter failed_account_ids : Array(Types::FailedMemberAccountEc2DeepInspectionStatusState)?

        def initialize(
          @account_ids : Array(Types::MemberAccountEc2DeepInspectionStatusState)? = nil,
          @failed_account_ids : Array(Types::FailedMemberAccountEc2DeepInspectionStatusState)? = nil
        )
        end
      end


      struct BatchUpdateMemberEc2DeepInspectionStatusRequest
        include JSON::Serializable

        # The unique identifiers for the Amazon Web Services accounts to change Amazon Inspector deep
        # inspection status for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(Types::MemberAccountEc2DeepInspectionStatus)

        def initialize(
          @account_ids : Array(Types::MemberAccountEc2DeepInspectionStatus)
        )
        end
      end


      struct BatchUpdateMemberEc2DeepInspectionStatusResponse
        include JSON::Serializable

        # An array of objects that provide details for each of the accounts that Amazon Inspector deep
        # inspection status was successfully changed for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(Types::MemberAccountEc2DeepInspectionStatusState)?

        # An array of objects that provide details for each of the accounts that Amazon Inspector deep
        # inspection status could not be successfully changed for.

        @[JSON::Field(key: "failedAccountIds")]
        getter failed_account_ids : Array(Types::FailedMemberAccountEc2DeepInspectionStatusState)?

        def initialize(
          @account_ids : Array(Types::MemberAccountEc2DeepInspectionStatusState)? = nil,
          @failed_account_ids : Array(Types::FailedMemberAccountEc2DeepInspectionStatusState)? = nil
        )
        end
      end


      struct CancelFindingsReportRequest
        include JSON::Serializable

        # The ID of the report to be canceled.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct CancelFindingsReportResponse
        include JSON::Serializable

        # The ID of the canceled report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct CancelSbomExportRequest
        include JSON::Serializable

        # The report ID of the SBOM export to cancel.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct CancelSbomExportResponse
        include JSON::Serializable

        # The report ID of the canceled SBOM export.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end

      # A CIS check.

      struct CisCheckAggregation
        include JSON::Serializable

        # The scan ARN for the CIS check scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The account ID for the CIS check.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description for the CIS check.

        @[JSON::Field(key: "checkDescription")]
        getter check_description : String?

        # The check ID for the CIS check.

        @[JSON::Field(key: "checkId")]
        getter check_id : String?

        # The CIS check level.

        @[JSON::Field(key: "level")]
        getter level : String?

        # The CIS check platform.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The CIS check status counts.

        @[JSON::Field(key: "statusCounts")]
        getter status_counts : Types::StatusCounts?

        # The CIS check title.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @scan_arn : String,
          @account_id : String? = nil,
          @check_description : String? = nil,
          @check_id : String? = nil,
          @level : String? = nil,
          @platform : String? = nil,
          @status_counts : Types::StatusCounts? = nil,
          @title : String? = nil
        )
        end
      end

      # The CIS date filter.

      struct CisDateFilter
        include JSON::Serializable

        # The CIS date filter's earliest scan start time.

        @[JSON::Field(key: "earliestScanStartTime")]
        getter earliest_scan_start_time : Time?

        # The CIS date filter's latest scan start time.

        @[JSON::Field(key: "latestScanStartTime")]
        getter latest_scan_start_time : Time?

        def initialize(
          @earliest_scan_start_time : Time? = nil,
          @latest_scan_start_time : Time? = nil
        )
        end
      end

      # The CIS finding status filter.

      struct CisFindingStatusFilter
        include JSON::Serializable

        # The comparison value of the CIS finding status filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value of the CIS finding status filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS number filter.

      struct CisNumberFilter
        include JSON::Serializable

        # The CIS number filter's lower inclusive.

        @[JSON::Field(key: "lowerInclusive")]
        getter lower_inclusive : Int32?

        # The CIS number filter's upper inclusive.

        @[JSON::Field(key: "upperInclusive")]
        getter upper_inclusive : Int32?

        def initialize(
          @lower_inclusive : Int32? = nil,
          @upper_inclusive : Int32? = nil
        )
        end
      end

      # The CIS result status filter.

      struct CisResultStatusFilter
        include JSON::Serializable

        # The comparison value of the CIS result status filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value of the CIS result status filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS scan.

      struct CisScan
        include JSON::Serializable

        # The CIS scan's ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The CIS scan's configuration ARN.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        # The CIS scan's failed checks.

        @[JSON::Field(key: "failedChecks")]
        getter failed_checks : Int32?

        # The CIS scan's date.

        @[JSON::Field(key: "scanDate")]
        getter scan_date : Time?

        # The the name of the scan configuration that's associated with this scan.

        @[JSON::Field(key: "scanName")]
        getter scan_name : String?

        # The account or organization that schedules the CIS scan.

        @[JSON::Field(key: "scheduledBy")]
        getter scheduled_by : String?

        # The security level for the CIS scan. Security level refers to the Benchmark levels that CIS assigns
        # to a profile.

        @[JSON::Field(key: "securityLevel")]
        getter security_level : String?

        # The CIS scan's status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The CIS scan's targets.

        @[JSON::Field(key: "targets")]
        getter targets : Types::CisTargets?

        # The CIS scan's total checks.

        @[JSON::Field(key: "totalChecks")]
        getter total_checks : Int32?

        def initialize(
          @scan_arn : String,
          @scan_configuration_arn : String,
          @failed_checks : Int32? = nil,
          @scan_date : Time? = nil,
          @scan_name : String? = nil,
          @scheduled_by : String? = nil,
          @security_level : String? = nil,
          @status : String? = nil,
          @targets : Types::CisTargets? = nil,
          @total_checks : Int32? = nil
        )
        end
      end

      # The CIS scan configuration.

      struct CisScanConfiguration
        include JSON::Serializable

        # The CIS scan configuration's scan configuration ARN.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        # The CIS scan configuration's owner ID.

        @[JSON::Field(key: "ownerId")]
        getter owner_id : String?

        # The name of the CIS scan configuration.

        @[JSON::Field(key: "scanName")]
        getter scan_name : String?

        # The CIS scan configuration's schedule.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The CIS scan configuration's security level.

        @[JSON::Field(key: "securityLevel")]
        getter security_level : String?

        # The CIS scan configuration's tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The CIS scan configuration's targets.

        @[JSON::Field(key: "targets")]
        getter targets : Types::CisTargets?

        def initialize(
          @scan_configuration_arn : String,
          @owner_id : String? = nil,
          @scan_name : String? = nil,
          @schedule : Types::Schedule? = nil,
          @security_level : String? = nil,
          @tags : Hash(String, String)? = nil,
          @targets : Types::CisTargets? = nil
        )
        end
      end

      # The CIS scan result details.

      struct CisScanResultDetails
        include JSON::Serializable

        # The CIS scan result details' scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The CIS scan result details' account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The account ID that's associated with the CIS scan result details.

        @[JSON::Field(key: "checkDescription")]
        getter check_description : String?

        # The CIS scan result details' check ID.

        @[JSON::Field(key: "checkId")]
        getter check_id : String?

        # The CIS scan result details' finding ARN.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String?

        # The CIS scan result details' level.

        @[JSON::Field(key: "level")]
        getter level : String?

        # The CIS scan result details' platform.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The CIS scan result details' remediation.

        @[JSON::Field(key: "remediation")]
        getter remediation : String?

        # The CIS scan result details' status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The CIS scan result details' status reason.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The CIS scan result details' target resource ID.

        @[JSON::Field(key: "targetResourceId")]
        getter target_resource_id : String?

        # The CIS scan result details' title.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @scan_arn : String,
          @account_id : String? = nil,
          @check_description : String? = nil,
          @check_id : String? = nil,
          @finding_arn : String? = nil,
          @level : String? = nil,
          @platform : String? = nil,
          @remediation : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @target_resource_id : String? = nil,
          @title : String? = nil
        )
        end
      end

      # The CIS scan result details filter criteria.

      struct CisScanResultDetailsFilterCriteria
        include JSON::Serializable

        # The criteria's check ID filters.

        @[JSON::Field(key: "checkIdFilters")]
        getter check_id_filters : Array(Types::CisStringFilter)?

        # The criteria's finding ARN filters.

        @[JSON::Field(key: "findingArnFilters")]
        getter finding_arn_filters : Array(Types::CisStringFilter)?

        # The criteria's finding status filters.

        @[JSON::Field(key: "findingStatusFilters")]
        getter finding_status_filters : Array(Types::CisFindingStatusFilter)?

        # The criteria's security level filters. . Security level refers to the Benchmark levels that CIS
        # assigns to a profile.

        @[JSON::Field(key: "securityLevelFilters")]
        getter security_level_filters : Array(Types::CisSecurityLevelFilter)?

        # The criteria's title filters.

        @[JSON::Field(key: "titleFilters")]
        getter title_filters : Array(Types::CisStringFilter)?

        def initialize(
          @check_id_filters : Array(Types::CisStringFilter)? = nil,
          @finding_arn_filters : Array(Types::CisStringFilter)? = nil,
          @finding_status_filters : Array(Types::CisFindingStatusFilter)? = nil,
          @security_level_filters : Array(Types::CisSecurityLevelFilter)? = nil,
          @title_filters : Array(Types::CisStringFilter)? = nil
        )
        end
      end

      # The scan results aggregated by checks filter criteria.

      struct CisScanResultsAggregatedByChecksFilterCriteria
        include JSON::Serializable

        # The criteria's account ID filters.

        @[JSON::Field(key: "accountIdFilters")]
        getter account_id_filters : Array(Types::CisStringFilter)?

        # The criteria's check ID filters.

        @[JSON::Field(key: "checkIdFilters")]
        getter check_id_filters : Array(Types::CisStringFilter)?

        # The criteria's failed resources filters.

        @[JSON::Field(key: "failedResourcesFilters")]
        getter failed_resources_filters : Array(Types::CisNumberFilter)?

        # The criteria's platform filters.

        @[JSON::Field(key: "platformFilters")]
        getter platform_filters : Array(Types::CisStringFilter)?

        # The criteria's security level filters.

        @[JSON::Field(key: "securityLevelFilters")]
        getter security_level_filters : Array(Types::CisSecurityLevelFilter)?

        # The criteria's title filters.

        @[JSON::Field(key: "titleFilters")]
        getter title_filters : Array(Types::CisStringFilter)?

        def initialize(
          @account_id_filters : Array(Types::CisStringFilter)? = nil,
          @check_id_filters : Array(Types::CisStringFilter)? = nil,
          @failed_resources_filters : Array(Types::CisNumberFilter)? = nil,
          @platform_filters : Array(Types::CisStringFilter)? = nil,
          @security_level_filters : Array(Types::CisSecurityLevelFilter)? = nil,
          @title_filters : Array(Types::CisStringFilter)? = nil
        )
        end
      end

      # The scan results aggregated by target resource filter criteria.

      struct CisScanResultsAggregatedByTargetResourceFilterCriteria
        include JSON::Serializable

        # The criteria's account ID filters.

        @[JSON::Field(key: "accountIdFilters")]
        getter account_id_filters : Array(Types::CisStringFilter)?

        # The criteria's check ID filters.

        @[JSON::Field(key: "checkIdFilters")]
        getter check_id_filters : Array(Types::CisStringFilter)?

        # The criteria's failed checks filters.

        @[JSON::Field(key: "failedChecksFilters")]
        getter failed_checks_filters : Array(Types::CisNumberFilter)?

        # The criteria's platform filters.

        @[JSON::Field(key: "platformFilters")]
        getter platform_filters : Array(Types::CisStringFilter)?

        # The criteria's status filter.

        @[JSON::Field(key: "statusFilters")]
        getter status_filters : Array(Types::CisResultStatusFilter)?

        # The criteria's target resource ID filters.

        @[JSON::Field(key: "targetResourceIdFilters")]
        getter target_resource_id_filters : Array(Types::CisStringFilter)?

        # The criteria's target resource tag filters.

        @[JSON::Field(key: "targetResourceTagFilters")]
        getter target_resource_tag_filters : Array(Types::TagFilter)?

        # The criteria's target status filters.

        @[JSON::Field(key: "targetStatusFilters")]
        getter target_status_filters : Array(Types::CisTargetStatusFilter)?

        # The criteria's target status reason filters.

        @[JSON::Field(key: "targetStatusReasonFilters")]
        getter target_status_reason_filters : Array(Types::CisTargetStatusReasonFilter)?

        def initialize(
          @account_id_filters : Array(Types::CisStringFilter)? = nil,
          @check_id_filters : Array(Types::CisStringFilter)? = nil,
          @failed_checks_filters : Array(Types::CisNumberFilter)? = nil,
          @platform_filters : Array(Types::CisStringFilter)? = nil,
          @status_filters : Array(Types::CisResultStatusFilter)? = nil,
          @target_resource_id_filters : Array(Types::CisStringFilter)? = nil,
          @target_resource_tag_filters : Array(Types::TagFilter)? = nil,
          @target_status_filters : Array(Types::CisTargetStatusFilter)? = nil,
          @target_status_reason_filters : Array(Types::CisTargetStatusReasonFilter)? = nil
        )
        end
      end

      # The CIS scan status filter.

      struct CisScanStatusFilter
        include JSON::Serializable

        # The filter comparison value.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The filter value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS security level filter. Security level refers to the Benchmark levels that CIS assigns to a
      # profile.

      struct CisSecurityLevelFilter
        include JSON::Serializable

        # The CIS security filter comparison value.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The CIS security filter value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS session message.

      struct CisSessionMessage
        include JSON::Serializable

        # The CIS rule details for the CIS session message.

        @[JSON::Field(key: "cisRuleDetails")]
        getter cis_rule_details : Bytes

        # The rule ID for the CIS session message.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String

        # The status of the CIS session message.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @cis_rule_details : Bytes,
          @rule_id : String,
          @status : String
        )
        end
      end

      # The CIS string filter.

      struct CisStringFilter
        include JSON::Serializable

        # The comparison value of the CIS string filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value of the CIS string filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS target resource aggregation.

      struct CisTargetResourceAggregation
        include JSON::Serializable

        # The scan ARN for the CIS target resource.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The account ID for the CIS target resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The platform for the CIS target resource.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The target resource status counts.

        @[JSON::Field(key: "statusCounts")]
        getter status_counts : Types::StatusCounts?

        # The ID of the target resource.

        @[JSON::Field(key: "targetResourceId")]
        getter target_resource_id : String?

        # The tag for the target resource.

        @[JSON::Field(key: "targetResourceTags")]
        getter target_resource_tags : Hash(String, Array(String))?

        # The status of the target resource.

        @[JSON::Field(key: "targetStatus")]
        getter target_status : String?

        # The reason for the target resource.

        @[JSON::Field(key: "targetStatusReason")]
        getter target_status_reason : String?

        def initialize(
          @scan_arn : String,
          @account_id : String? = nil,
          @platform : String? = nil,
          @status_counts : Types::StatusCounts? = nil,
          @target_resource_id : String? = nil,
          @target_resource_tags : Hash(String, Array(String))? = nil,
          @target_status : String? = nil,
          @target_status_reason : String? = nil
        )
        end
      end

      # The CIS target status filter.

      struct CisTargetStatusFilter
        include JSON::Serializable

        # The comparison value of the CIS target status filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value of the CIS target status filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS target status reason filter.

      struct CisTargetStatusReasonFilter
        include JSON::Serializable

        # The comparison value of the CIS target status reason filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value of the CIS target status reason filter.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The CIS targets.

      struct CisTargets
        include JSON::Serializable

        # The CIS target account ids.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The CIS target resource tags.

        @[JSON::Field(key: "targetResourceTags")]
        getter target_resource_tags : Hash(String, Array(String))?

        def initialize(
          @account_ids : Array(String)? = nil,
          @target_resource_tags : Hash(String, Array(String))? = nil
        )
        end
      end

      # The Cybersecurity and Infrastructure Security Agency (CISA) details for a specific vulnerability.

      struct CisaData
        include JSON::Serializable

        # The remediation action recommended by CISA for this vulnerability.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The date and time CISA added this vulnerability to their catalogue.

        @[JSON::Field(key: "dateAdded")]
        getter date_added : Time?

        # The date and time CISA expects a fix to have been provided vulnerability.

        @[JSON::Field(key: "dateDue")]
        getter date_due : Time?

        def initialize(
          @action : String? = nil,
          @date_added : Time? = nil,
          @date_due : Time? = nil
        )
        end
      end

      # Details about the task or pod in the cluster.

      struct ClusterDetails
        include JSON::Serializable


        @[JSON::Field(key: "clusterMetadata")]
        getter cluster_metadata : Types::ClusterMetadata

        # The last timestamp when Amazon Inspector recorded the image in use in the task or pod in the
        # cluster.

        @[JSON::Field(key: "lastInUse")]
        getter last_in_use : Time

        # The number of tasks or pods where an image was running on the cluster.

        @[JSON::Field(key: "runningUnitCount")]
        getter running_unit_count : Int64?

        # The number of tasks or pods where an image was stopped on the cluster in the last 24 hours.

        @[JSON::Field(key: "stoppedUnitCount")]
        getter stopped_unit_count : Int64?

        def initialize(
          @cluster_metadata : Types::ClusterMetadata,
          @last_in_use : Time,
          @running_unit_count : Int64? = nil,
          @stopped_unit_count : Int64? = nil
        )
        end
      end

      # The filter criteria to be used.

      struct ClusterForImageFilterCriteria
        include JSON::Serializable

        # The resource Id to be used in the filter criteria.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @resource_id : String
        )
        end
      end

      # Information about the cluster.

      struct ClusterInformation
        include JSON::Serializable

        # The cluster ARN.

        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String

        # Details about the cluster.

        @[JSON::Field(key: "clusterDetails")]
        getter cluster_details : Array(Types::ClusterDetails)?

        def initialize(
          @cluster_arn : String,
          @cluster_details : Array(Types::ClusterDetails)? = nil
        )
        end
      end

      # The metadata for a cluster.

      struct ClusterMetadata
        include JSON::Serializable

        # The details for an Amazon ECS cluster in the cluster metadata.

        @[JSON::Field(key: "awsEcsMetadataDetails")]
        getter aws_ecs_metadata_details : Types::AwsEcsMetadataDetails?

        # The details for an Amazon EKS cluster in the cluster metadata.

        @[JSON::Field(key: "awsEksMetadataDetails")]
        getter aws_eks_metadata_details : Types::AwsEksMetadataDetails?

        def initialize(
          @aws_ecs_metadata_details : Types::AwsEcsMetadataDetails? = nil,
          @aws_eks_metadata_details : Types::AwsEksMetadataDetails? = nil
        )
        end
      end

      # Contains information on where a code vulnerability is located in your Lambda function.

      struct CodeFilePath
        include JSON::Serializable

        # The line number of the last line of code that a vulnerability was found in.

        @[JSON::Field(key: "endLine")]
        getter end_line : Int32

        # The name of the file the code vulnerability was found in.

        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The file path to the code that a vulnerability was found in.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The line number of the first line of code that a vulnerability was found in.

        @[JSON::Field(key: "startLine")]
        getter start_line : Int32

        def initialize(
          @end_line : Int32,
          @file_name : String,
          @file_path : String,
          @start_line : Int32
        )
        end
      end

      # Contains information on the lines of code associated with a code snippet.

      struct CodeLine
        include JSON::Serializable

        # The content of a line of code

        @[JSON::Field(key: "content")]
        getter content : String

        # The line number that a section of code is located at.

        @[JSON::Field(key: "lineNumber")]
        getter line_number : Int32

        def initialize(
          @content : String,
          @line_number : Int32
        )
        end
      end

      # The details that define an aggregation based on code repositories.

      struct CodeRepositoryAggregation
        include JSON::Serializable

        # The project names to include in the aggregation results.

        @[JSON::Field(key: "projectNames")]
        getter project_names : Array(Types::StringFilter)?

        # The repository provider types to include in the aggregation results.

        @[JSON::Field(key: "providerTypes")]
        getter provider_types : Array(Types::StringFilter)?

        # The resource IDs to include in the aggregation results.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(Types::StringFilter)?

        # The value to sort results by in the code repository aggregation.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by (ascending or descending) in the code repository aggregation.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @project_names : Array(Types::StringFilter)? = nil,
          @provider_types : Array(Types::StringFilter)? = nil,
          @resource_ids : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding aggregation by code repository.

      struct CodeRepositoryAggregationResponse
        include JSON::Serializable

        # The names of the projects associated with the code repository.

        @[JSON::Field(key: "projectNames")]
        getter project_names : String

        # The Amazon Web Services account ID associated with the code repository.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The number of active findings that have an exploit available for the code repository.

        @[JSON::Field(key: "exploitAvailableActiveFindingsCount")]
        getter exploit_available_active_findings_count : Int64?

        # The number of active findings that have a fix available for the code repository.

        @[JSON::Field(key: "fixAvailableActiveFindingsCount")]
        getter fix_available_active_findings_count : Int64?

        # The type of repository provider for the code repository.

        @[JSON::Field(key: "providerType")]
        getter provider_type : String?

        # The resource ID of the code repository.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?


        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @project_names : String,
          @account_id : String? = nil,
          @exploit_available_active_findings_count : Int64? = nil,
          @fix_available_active_findings_count : Int64? = nil,
          @provider_type : String? = nil,
          @resource_id : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Contains details about a code repository associated with a finding.

      struct CodeRepositoryDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the code security integration associated with the repository.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String?

        # The name of the project in the code repository.

        @[JSON::Field(key: "projectName")]
        getter project_name : String?

        # The type of repository provider (such as GitHub, GitLab, etc.).

        @[JSON::Field(key: "providerType")]
        getter provider_type : String?

        def initialize(
          @integration_arn : String? = nil,
          @project_name : String? = nil,
          @provider_type : String? = nil
        )
        end
      end

      # Contains metadata information about a code repository that is being scanned by Amazon Inspector.

      struct CodeRepositoryMetadata
        include JSON::Serializable

        # The name of the project in the code repository.

        @[JSON::Field(key: "projectName")]
        getter project_name : String

        # The type of repository provider (such as GitHub, GitLab, etc.).

        @[JSON::Field(key: "providerType")]
        getter provider_type : String

        # The visibility setting of the repository (public or private).

        @[JSON::Field(key: "providerTypeVisibility")]
        getter provider_type_visibility : String

        # The Amazon Resource Name (ARN) of the code security integration associated with the repository.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String?

        # The ID of the last commit that was scanned in the repository.

        @[JSON::Field(key: "lastScannedCommitId")]
        getter last_scanned_commit_id : String?

        # Information about on-demand scans performed on the repository.

        @[JSON::Field(key: "onDemandScan")]
        getter on_demand_scan : Types::CodeRepositoryOnDemandScan?

        # The scan configuration settings applied to the code repository.

        @[JSON::Field(key: "scanConfiguration")]
        getter scan_configuration : Types::ProjectCodeSecurityScanConfiguration?

        def initialize(
          @project_name : String,
          @provider_type : String,
          @provider_type_visibility : String,
          @integration_arn : String? = nil,
          @last_scanned_commit_id : String? = nil,
          @on_demand_scan : Types::CodeRepositoryOnDemandScan? = nil,
          @scan_configuration : Types::ProjectCodeSecurityScanConfiguration? = nil
        )
        end
      end

      # Contains information about on-demand scans performed on a code repository.

      struct CodeRepositoryOnDemandScan
        include JSON::Serializable

        # The timestamp when the last on-demand scan was performed.

        @[JSON::Field(key: "lastScanAt")]
        getter last_scan_at : Time?

        # The ID of the last commit that was scanned during an on-demand scan.

        @[JSON::Field(key: "lastScannedCommitId")]
        getter last_scanned_commit_id : String?


        @[JSON::Field(key: "scanStatus")]
        getter scan_status : Types::ScanStatus?

        def initialize(
          @last_scan_at : Time? = nil,
          @last_scanned_commit_id : String? = nil,
          @scan_status : Types::ScanStatus? = nil
        )
        end
      end

      # A summary of information about a code security integration.

      struct CodeSecurityIntegrationSummary
        include JSON::Serializable

        # The timestamp when the code security integration was created.

        @[JSON::Field(key: "createdOn")]
        getter created_on : Time

        # The Amazon Resource Name (ARN) of the code security integration.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        # The timestamp when the code security integration was last updated.

        @[JSON::Field(key: "lastUpdateOn")]
        getter last_update_on : Time

        # The name of the code security integration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the code security integration.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the current status of the code security integration.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String

        # The type of repository provider for the integration.

        @[JSON::Field(key: "type")]
        getter type : String

        # The tags associated with the code security integration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_on : Time,
          @integration_arn : String,
          @last_update_on : Time,
          @name : String,
          @status : String,
          @status_reason : String,
          @type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Identifies a specific resource in a code repository that will be scanned.

      struct CodeSecurityResource
        include JSON::Serializable

        # The unique identifier of the project in the code repository.

        @[JSON::Field(key: "projectId")]
        getter project_id : String?

        def initialize(
          @project_id : String? = nil
        )
        end
      end

      # Contains the configuration settings for code security scans.

      struct CodeSecurityScanConfiguration
        include JSON::Serializable

        # The categories of security rules to be applied during the scan.

        @[JSON::Field(key: "ruleSetCategories")]
        getter rule_set_categories : Array(String)

        # Configuration settings for continuous integration scans that run automatically when code changes are
        # made.

        @[JSON::Field(key: "continuousIntegrationScanConfiguration")]
        getter continuous_integration_scan_configuration : Types::ContinuousIntegrationScanConfiguration?

        # Configuration settings for periodic scans that run on a scheduled basis.

        @[JSON::Field(key: "periodicScanConfiguration")]
        getter periodic_scan_configuration : Types::PeriodicScanConfiguration?

        def initialize(
          @rule_set_categories : Array(String),
          @continuous_integration_scan_configuration : Types::ContinuousIntegrationScanConfiguration? = nil,
          @periodic_scan_configuration : Types::PeriodicScanConfiguration? = nil
        )
        end
      end

      # A summary of an association between a code repository and a scan configuration.

      struct CodeSecurityScanConfigurationAssociationSummary
        include JSON::Serializable


        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource?

        def initialize(
          @resource : Types::CodeSecurityResource? = nil
        )
        end
      end

      # A summary of information about a code security scan configuration.

      struct CodeSecurityScanConfigurationSummary
        include JSON::Serializable

        # The name of the scan configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account ID that owns the scan configuration.

        @[JSON::Field(key: "ownerAccountId")]
        getter owner_account_id : String

        # The categories of security rules applied during the scan.

        @[JSON::Field(key: "ruleSetCategories")]
        getter rule_set_categories : Array(String)

        # The Amazon Resource Name (ARN) of the scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        # The repository events that trigger continuous integration scans.

        @[JSON::Field(key: "continuousIntegrationScanSupportedEvents")]
        getter continuous_integration_scan_supported_events : Array(String)?

        # The schedule expression for periodic scans, in cron format.

        @[JSON::Field(key: "frequencyExpression")]
        getter frequency_expression : String?

        # The frequency at which periodic scans are performed.

        @[JSON::Field(key: "periodicScanFrequency")]
        getter periodic_scan_frequency : String?

        # The scope settings that define which repositories will be scanned. If the ScopeSetting parameter is
        # ALL the scan configuration applies to all existing and future projects imported into Amazon
        # Inspector.

        @[JSON::Field(key: "scopeSettings")]
        getter scope_settings : Types::ScopeSettings?

        # The tags associated with the scan configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @owner_account_id : String,
          @rule_set_categories : Array(String),
          @scan_configuration_arn : String,
          @continuous_integration_scan_supported_events : Array(String)? = nil,
          @frequency_expression : String? = nil,
          @periodic_scan_frequency : String? = nil,
          @scope_settings : Types::ScopeSettings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about any errors encountered while trying to retrieve a code snippet.

      struct CodeSnippetError
        include JSON::Serializable

        # The error code for the error that prevented a code snippet from being retrieved.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The error message received when Amazon Inspector failed to retrieve a code snippet.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The ARN of the finding that a code snippet couldn't be retrieved for.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @finding_arn : String
        )
        end
      end

      # Contains information on a code snippet retrieved by Amazon Inspector from a code vulnerability
      # finding.

      struct CodeSnippetResult
        include JSON::Serializable

        # Contains information on the retrieved code snippet.

        @[JSON::Field(key: "codeSnippet")]
        getter code_snippet : Array(Types::CodeLine)?

        # The line number of the last line of a code snippet.

        @[JSON::Field(key: "endLine")]
        getter end_line : Int32?

        # The ARN of a finding that the code snippet is associated with.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String?

        # The line number of the first line of a code snippet.

        @[JSON::Field(key: "startLine")]
        getter start_line : Int32?

        # Details of a suggested code fix.

        @[JSON::Field(key: "suggestedFixes")]
        getter suggested_fixes : Array(Types::SuggestedFix)?

        def initialize(
          @code_snippet : Array(Types::CodeLine)? = nil,
          @end_line : Int32? = nil,
          @finding_arn : String? = nil,
          @start_line : Int32? = nil,
          @suggested_fixes : Array(Types::SuggestedFix)? = nil
        )
        end
      end

      # Contains information on the code vulnerability identified in your Lambda function.

      struct CodeVulnerabilityDetails
        include JSON::Serializable

        # The Common Weakness Enumeration (CWE) item associated with the detected vulnerability.

        @[JSON::Field(key: "cwes")]
        getter cwes : Array(String)

        # The ID for the Amazon CodeGuru detector associated with the finding. For more information on
        # detectors see Amazon CodeGuru Detector Library .

        @[JSON::Field(key: "detectorId")]
        getter detector_id : String

        # The name of the detector used to identify the code vulnerability. For more information on detectors
        # see CodeGuru Detector Library .

        @[JSON::Field(key: "detectorName")]
        getter detector_name : String

        # Contains information on where the code vulnerability is located in your code.

        @[JSON::Field(key: "filePath")]
        getter file_path : Types::CodeFilePath

        # The detector tag associated with the vulnerability. Detector tags group related vulnerabilities by
        # common themes or tactics. For a list of available tags by programming language, see Java tags , or
        # Python tags .

        @[JSON::Field(key: "detectorTags")]
        getter detector_tags : Array(String)?

        # A URL containing supporting documentation about the code vulnerability detected.

        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # The identifier for a rule that was used to detect the code vulnerability.

        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The Amazon Resource Name (ARN) of the Lambda layer that the code vulnerability was detected in.

        @[JSON::Field(key: "sourceLambdaLayerArn")]
        getter source_lambda_layer_arn : String?

        def initialize(
          @cwes : Array(String),
          @detector_id : String,
          @detector_name : String,
          @file_path : Types::CodeFilePath,
          @detector_tags : Array(String)? = nil,
          @reference_urls : Array(String)? = nil,
          @rule_id : String? = nil,
          @source_lambda_layer_arn : String? = nil
        )
        end
      end

      # A compute platform.

      struct ComputePlatform
        include JSON::Serializable

        # The compute platform product.

        @[JSON::Field(key: "product")]
        getter product : String?

        # The compute platform vendor.

        @[JSON::Field(key: "vendor")]
        getter vendor : String?

        # The compute platform version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @product : String? = nil,
          @vendor : String? = nil,
          @version : String? = nil
        )
        end
      end

      # A conflict occurred. This exception occurs when the same resource is being modified by concurrent
      # requests.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the conflicting resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the conflicting resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Configuration settings for continuous integration scans that run automatically when code changes are
      # made.

      struct ContinuousIntegrationScanConfiguration
        include JSON::Serializable

        # The repository events that trigger continuous integration scans, such as pull requests or commits.

        @[JSON::Field(key: "supportedEvents")]
        getter supported_events : Array(String)

        def initialize(
          @supported_events : Array(String)
        )
        end
      end

      # a structure that contains information on the count of resources within a group.

      struct Counts
        include JSON::Serializable

        # The number of resources.

        @[JSON::Field(key: "count")]
        getter count : Int64?

        # The key associated with this group

        @[JSON::Field(key: "groupKey")]
        getter group_key : String?

        def initialize(
          @count : Int64? = nil,
          @group_key : String? = nil
        )
        end
      end

      # Contains details of a coverage date filter.

      struct CoverageDateFilter
        include JSON::Serializable

        # A timestamp representing the end of the time period to filter results by.

        @[JSON::Field(key: "endInclusive")]
        getter end_inclusive : Time?

        # A timestamp representing the start of the time period to filter results by.

        @[JSON::Field(key: "startInclusive")]
        getter start_inclusive : Time?

        def initialize(
          @end_inclusive : Time? = nil,
          @start_inclusive : Time? = nil
        )
        end
      end

      # A structure that identifies filter criteria for GetCoverageStatistics .

      struct CoverageFilterCriteria
        include JSON::Serializable

        # An array of Amazon Web Services account IDs to return coverage statistics for.

        @[JSON::Field(key: "accountId")]
        getter account_id : Array(Types::CoverageStringFilter)?

        # Filter criteria for code repositories based on project name.

        @[JSON::Field(key: "codeRepositoryProjectName")]
        getter code_repository_project_name : Array(Types::CoverageStringFilter)?

        # Filter criteria for code repositories based on provider type (such as GitHub, GitLab, etc.).

        @[JSON::Field(key: "codeRepositoryProviderType")]
        getter code_repository_provider_type : Array(Types::CoverageStringFilter)?

        # Filter criteria for code repositories based on visibility setting (public or private).

        @[JSON::Field(key: "codeRepositoryProviderTypeVisibility")]
        getter code_repository_provider_type_visibility : Array(Types::CoverageStringFilter)?

        # The Amazon EC2 instance tags to filter on.

        @[JSON::Field(key: "ec2InstanceTags")]
        getter ec2_instance_tags : Array(Types::CoverageMapFilter)?

        # The number of Amazon ECR images in use.

        @[JSON::Field(key: "ecrImageInUseCount")]
        getter ecr_image_in_use_count : Array(Types::CoverageNumberFilter)?

        # The Amazon ECR image that was last in use.

        @[JSON::Field(key: "ecrImageLastInUseAt")]
        getter ecr_image_last_in_use_at : Array(Types::CoverageDateFilter)?

        # The Amazon ECR image tags to filter on.

        @[JSON::Field(key: "ecrImageTags")]
        getter ecr_image_tags : Array(Types::CoverageStringFilter)?

        # The Amazon ECR repository name to filter on.

        @[JSON::Field(key: "ecrRepositoryName")]
        getter ecr_repository_name : Array(Types::CoverageStringFilter)?

        # The date an image was last pulled at.

        @[JSON::Field(key: "imagePulledAt")]
        getter image_pulled_at : Array(Types::CoverageDateFilter)?

        # Returns coverage statistics for Amazon Web Services Lambda functions filtered by function names.

        @[JSON::Field(key: "lambdaFunctionName")]
        getter lambda_function_name : Array(Types::CoverageStringFilter)?

        # Returns coverage statistics for Amazon Web Services Lambda functions filtered by runtime.

        @[JSON::Field(key: "lambdaFunctionRuntime")]
        getter lambda_function_runtime : Array(Types::CoverageStringFilter)?

        # Returns coverage statistics for Amazon Web Services Lambda functions filtered by tag.

        @[JSON::Field(key: "lambdaFunctionTags")]
        getter lambda_function_tags : Array(Types::CoverageMapFilter)?

        # Filters Amazon Web Services resources based on whether Amazon Inspector has checked them for
        # vulnerabilities within the specified time range.

        @[JSON::Field(key: "lastScannedAt")]
        getter last_scanned_at : Array(Types::CoverageDateFilter)?

        # Filter criteria for code repositories based on the ID of the last scanned commit.

        @[JSON::Field(key: "lastScannedCommitId")]
        getter last_scanned_commit_id : Array(Types::CoverageStringFilter)?

        # An array of Amazon Web Services resource IDs to return coverage statistics for.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : Array(Types::CoverageStringFilter)?

        # An array of Amazon Web Services resource types to return coverage statistics for. The values can be
        # AWS_EC2_INSTANCE , AWS_LAMBDA_FUNCTION , AWS_ECR_CONTAINER_IMAGE , AWS_ECR_REPOSITORY or AWS_ACCOUNT
        # .

        @[JSON::Field(key: "resourceType")]
        getter resource_type : Array(Types::CoverageStringFilter)?

        # The filter to search for Amazon EC2 instance coverage by scan mode. Valid values are
        # EC2_SSM_AGENT_BASED and EC2_AGENTLESS .

        @[JSON::Field(key: "scanMode")]
        getter scan_mode : Array(Types::CoverageStringFilter)?

        # The scan status code to filter on. Valid values are: ValidationException , InternalServerException ,
        # ResourceNotFoundException , BadRequestException , and ThrottlingException .

        @[JSON::Field(key: "scanStatusCode")]
        getter scan_status_code : Array(Types::CoverageStringFilter)?

        # The scan status reason to filter on.

        @[JSON::Field(key: "scanStatusReason")]
        getter scan_status_reason : Array(Types::CoverageStringFilter)?

        # An array of Amazon Inspector scan types to return coverage statistics for.

        @[JSON::Field(key: "scanType")]
        getter scan_type : Array(Types::CoverageStringFilter)?

        def initialize(
          @account_id : Array(Types::CoverageStringFilter)? = nil,
          @code_repository_project_name : Array(Types::CoverageStringFilter)? = nil,
          @code_repository_provider_type : Array(Types::CoverageStringFilter)? = nil,
          @code_repository_provider_type_visibility : Array(Types::CoverageStringFilter)? = nil,
          @ec2_instance_tags : Array(Types::CoverageMapFilter)? = nil,
          @ecr_image_in_use_count : Array(Types::CoverageNumberFilter)? = nil,
          @ecr_image_last_in_use_at : Array(Types::CoverageDateFilter)? = nil,
          @ecr_image_tags : Array(Types::CoverageStringFilter)? = nil,
          @ecr_repository_name : Array(Types::CoverageStringFilter)? = nil,
          @image_pulled_at : Array(Types::CoverageDateFilter)? = nil,
          @lambda_function_name : Array(Types::CoverageStringFilter)? = nil,
          @lambda_function_runtime : Array(Types::CoverageStringFilter)? = nil,
          @lambda_function_tags : Array(Types::CoverageMapFilter)? = nil,
          @last_scanned_at : Array(Types::CoverageDateFilter)? = nil,
          @last_scanned_commit_id : Array(Types::CoverageStringFilter)? = nil,
          @resource_id : Array(Types::CoverageStringFilter)? = nil,
          @resource_type : Array(Types::CoverageStringFilter)? = nil,
          @scan_mode : Array(Types::CoverageStringFilter)? = nil,
          @scan_status_code : Array(Types::CoverageStringFilter)? = nil,
          @scan_status_reason : Array(Types::CoverageStringFilter)? = nil,
          @scan_type : Array(Types::CoverageStringFilter)? = nil
        )
        end
      end

      # Contains details of a coverage map filter.

      struct CoverageMapFilter
        include JSON::Serializable

        # The operator to compare coverage on.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The tag key associated with the coverage map filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value associated with the coverage map filter.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @comparison : String,
          @key : String,
          @value : String? = nil
        )
        end
      end

      # The coverage number to be used in the filter.

      struct CoverageNumberFilter
        include JSON::Serializable

        # The lower inclusive for the coverage number.

        @[JSON::Field(key: "lowerInclusive")]
        getter lower_inclusive : Int64?

        # The upper inclusive for the coverage number.&gt;

        @[JSON::Field(key: "upperInclusive")]
        getter upper_inclusive : Int64?

        def initialize(
          @lower_inclusive : Int64? = nil,
          @upper_inclusive : Int64? = nil
        )
        end
      end

      # Contains details of a coverage string filter.

      struct CoverageStringFilter
        include JSON::Serializable

        # The operator to compare strings on.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value to compare strings on.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # An object that contains details about a resource covered by Amazon Inspector.

      struct CoveredResource
        include JSON::Serializable

        # The Amazon Web Services account ID of the covered resource.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the covered resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the covered resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The Amazon Inspector scan type covering the resource.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String

        # The date and time the resource was last checked for vulnerabilities.

        @[JSON::Field(key: "lastScannedAt")]
        getter last_scanned_at : Time?

        # An object that contains details about the metadata.

        @[JSON::Field(key: "resourceMetadata")]
        getter resource_metadata : Types::ResourceScanMetadata?

        # The scan method that is applied to the instance.

        @[JSON::Field(key: "scanMode")]
        getter scan_mode : String?

        # The status of the scan covering the resource.

        @[JSON::Field(key: "scanStatus")]
        getter scan_status : Types::ScanStatus?

        def initialize(
          @account_id : String,
          @resource_id : String,
          @resource_type : String,
          @scan_type : String,
          @last_scanned_at : Time? = nil,
          @resource_metadata : Types::ResourceScanMetadata? = nil,
          @scan_mode : String? = nil,
          @scan_status : Types::ScanStatus? = nil
        )
        end
      end


      struct CreateCisScanConfigurationRequest
        include JSON::Serializable

        # The scan name for the CIS scan configuration.

        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The schedule for the CIS scan configuration.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule

        # The security level for the CIS scan configuration. Security level refers to the Benchmark levels
        # that CIS assigns to a profile.

        @[JSON::Field(key: "securityLevel")]
        getter security_level : String

        # The targets for the CIS scan configuration.

        @[JSON::Field(key: "targets")]
        getter targets : Types::CreateCisTargets

        # The tags for the CIS scan configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @scan_name : String,
          @schedule : Types::Schedule,
          @security_level : String,
          @targets : Types::CreateCisTargets,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCisScanConfigurationResponse
        include JSON::Serializable

        # The scan configuration ARN for the CIS scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        def initialize(
          @scan_configuration_arn : String? = nil
        )
        end
      end

      # Creates CIS targets.

      struct CreateCisTargets
        include JSON::Serializable

        # The CIS target account ids.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)

        # The CIS target resource tags.

        @[JSON::Field(key: "targetResourceTags")]
        getter target_resource_tags : Hash(String, Array(String))

        def initialize(
          @account_ids : Array(String),
          @target_resource_tags : Hash(String, Array(String))
        )
        end
      end


      struct CreateCodeSecurityIntegrationRequest
        include JSON::Serializable

        # The name of the code security integration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The type of repository provider for the integration.

        @[JSON::Field(key: "type")]
        getter type : String

        # The integration details specific to the repository provider type.

        @[JSON::Field(key: "details")]
        getter details : Types::CreateIntegrationDetail?

        # The tags to apply to the code security integration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @details : Types::CreateIntegrationDetail? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCodeSecurityIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created code security integration.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        # The current status of the code security integration.

        @[JSON::Field(key: "status")]
        getter status : String

        # The URL used to authorize the integration with the repository provider.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String?

        def initialize(
          @integration_arn : String,
          @status : String,
          @authorization_url : String? = nil
        )
        end
      end


      struct CreateCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # The configuration settings for the code security scan.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CodeSecurityScanConfiguration

        # The security level for the scan configuration.

        @[JSON::Field(key: "level")]
        getter level : String

        # The name of the scan configuration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The scope settings that define which repositories will be scanned. Include this parameter to create
        # a default scan configuration. Otherwise Amazon Inspector creates a general scan configuration. A
        # default scan configuration automatically applies to all existing and future projects imported into
        # Amazon Inspector. Use the BatchAssociateCodeSecurityScanConfiguration operation to associate a
        # general scan configuration with projects.

        @[JSON::Field(key: "scopeSettings")]
        getter scope_settings : Types::ScopeSettings?

        # The tags to apply to the scan configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::CodeSecurityScanConfiguration,
          @level : String,
          @name : String,
          @scope_settings : Types::ScopeSettings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end


      struct CreateFilterRequest
        include JSON::Serializable

        # Defines the action that is to be applied to the findings that match the filter.

        @[JSON::Field(key: "action")]
        getter action : String

        # Defines the criteria to be used in the filter for querying findings.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria

        # The name of the filter. Minimum length of 3. Maximum length of 64. Valid characters include
        # alphanumeric characters, dot (.), underscore (_), and dash (-). Spaces are not allowed.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the filter.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The reason for creating the filter.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # A list of tags for the filter.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String,
          @filter_criteria : Types::FilterCriteria,
          @name : String,
          @description : String? = nil,
          @reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFilterResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the successfully created filter.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct CreateFindingsReportRequest
        include JSON::Serializable

        # The format to generate the report in.

        @[JSON::Field(key: "reportFormat")]
        getter report_format : String

        # The Amazon S3 export destination for the report.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::Destination

        # The filter criteria to apply to the results of the finding report.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        def initialize(
          @report_format : String,
          @s3_destination : Types::Destination,
          @filter_criteria : Types::FilterCriteria? = nil
        )
        end
      end


      struct CreateFindingsReportResponse
        include JSON::Serializable

        # The ID of the report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end

      # Contains details required to create an integration with a self-managed GitLab instance.

      struct CreateGitLabSelfManagedIntegrationDetail
        include JSON::Serializable

        # The personal access token used to authenticate with the self-managed GitLab instance.

        @[JSON::Field(key: "accessToken")]
        getter access_token : String

        # The URL of the self-managed GitLab instance.

        @[JSON::Field(key: "instanceUrl")]
        getter instance_url : String

        def initialize(
          @access_token : String,
          @instance_url : String
        )
        end
      end

      # Contains details required to create a code security integration with a specific repository provider.

      struct CreateIntegrationDetail
        include JSON::Serializable

        # Details specific to creating an integration with a self-managed GitLab instance.

        @[JSON::Field(key: "gitlabSelfManaged")]
        getter gitlab_self_managed : Types::CreateGitLabSelfManagedIntegrationDetail?

        def initialize(
          @gitlab_self_managed : Types::CreateGitLabSelfManagedIntegrationDetail? = nil
        )
        end
      end


      struct CreateSbomExportRequest
        include JSON::Serializable

        # The output format for the software bill of materials (SBOM) report.

        @[JSON::Field(key: "reportFormat")]
        getter report_format : String

        # Contains details of the Amazon S3 bucket and KMS key used to export findings.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::Destination

        # The resource filter criteria for the software bill of materials (SBOM) report.

        @[JSON::Field(key: "resourceFilterCriteria")]
        getter resource_filter_criteria : Types::ResourceFilterCriteria?

        def initialize(
          @report_format : String,
          @s3_destination : Types::Destination,
          @resource_filter_criteria : Types::ResourceFilterCriteria? = nil
        )
        end
      end


      struct CreateSbomExportResponse
        include JSON::Serializable

        # The report ID for the software bill of materials (SBOM) report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end

      # The Common Vulnerability Scoring System (CVSS) version 2 details for the vulnerability.

      struct Cvss2
        include JSON::Serializable

        # The CVSS v2 base score for the vulnerability.

        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64?

        # The scoring vector associated with the CVSS v2 score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        def initialize(
          @base_score : Float64? = nil,
          @scoring_vector : String? = nil
        )
        end
      end

      # The Common Vulnerability Scoring System (CVSS) version 3 details for the vulnerability.

      struct Cvss3
        include JSON::Serializable

        # The CVSS v3 base score for the vulnerability.

        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64?

        # The scoring vector associated with the CVSS v3 score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        def initialize(
          @base_score : Float64? = nil,
          @scoring_vector : String? = nil
        )
        end
      end

      # The Common Vulnerability Scoring System (CVSS) version 4 details for the vulnerability.

      struct Cvss4
        include JSON::Serializable

        # The base CVSS v4 score for the vulnerability finding, which rates the severity of the vulnerability
        # on a scale from 0 to 10.

        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64?

        # The CVSS v4 scoring vector, which contains the metrics and measurements that were used to calculate
        # the base score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String?

        def initialize(
          @base_score : Float64? = nil,
          @scoring_vector : String? = nil
        )
        end
      end

      # The CVSS score for a finding.

      struct CvssScore
        include JSON::Serializable

        # The base CVSS score used for the finding.

        @[JSON::Field(key: "baseScore")]
        getter base_score : Float64

        # The vector string of the CVSS score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String

        # The source of the CVSS score.

        @[JSON::Field(key: "source")]
        getter source : String

        # The version of CVSS used for the score.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @base_score : Float64,
          @scoring_vector : String,
          @source : String,
          @version : String
        )
        end
      end

      # Details on adjustments Amazon Inspector made to the CVSS score for a finding.

      struct CvssScoreAdjustment
        include JSON::Serializable

        # The metric used to adjust the CVSS score.

        @[JSON::Field(key: "metric")]
        getter metric : String

        # The reason the CVSS score has been adjustment.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @metric : String,
          @reason : String
        )
        end
      end

      # Information about the CVSS score.

      struct CvssScoreDetails
        include JSON::Serializable

        # The CVSS score.

        @[JSON::Field(key: "score")]
        getter score : Float64

        # The source for the CVSS score.

        @[JSON::Field(key: "scoreSource")]
        getter score_source : String

        # The vector for the CVSS score.

        @[JSON::Field(key: "scoringVector")]
        getter scoring_vector : String

        # The CVSS version used in scoring.

        @[JSON::Field(key: "version")]
        getter version : String

        # An object that contains details about adjustment Amazon Inspector made to the CVSS score.

        @[JSON::Field(key: "adjustments")]
        getter adjustments : Array(Types::CvssScoreAdjustment)?

        # The source of the CVSS data.

        @[JSON::Field(key: "cvssSource")]
        getter cvss_source : String?

        def initialize(
          @score : Float64,
          @score_source : String,
          @scoring_vector : String,
          @version : String,
          @adjustments : Array(Types::CvssScoreAdjustment)? = nil,
          @cvss_source : String? = nil
        )
        end
      end

      # A daily schedule.

      struct DailySchedule
        include JSON::Serializable

        # The schedule start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Types::Time

        def initialize(
          @start_time : Types::Time
        )
        end
      end

      # Contains details on the time range used to filter findings.

      struct DateFilter
        include JSON::Serializable

        # A timestamp representing the end of the time period filtered on.

        @[JSON::Field(key: "endInclusive")]
        getter end_inclusive : Time?

        # A timestamp representing the start of the time period filtered on.

        @[JSON::Field(key: "startInclusive")]
        getter start_inclusive : Time?

        def initialize(
          @end_inclusive : Time? = nil,
          @start_inclusive : Time? = nil
        )
        end
      end

      # Details of the Amazon Inspector delegated administrator for your organization.

      struct DelegatedAdmin
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Inspector delegated administrator for your
        # organization.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The status of the Amazon Inspector delegated administrator.

        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        def initialize(
          @account_id : String? = nil,
          @relationship_status : String? = nil
        )
        end
      end

      # Details of the Amazon Inspector delegated administrator for your organization.

      struct DelegatedAdminAccount
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Inspector delegated administrator for your
        # organization.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The status of the Amazon Inspector delegated administrator.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DeleteCisScanConfigurationRequest
        include JSON::Serializable

        # The ARN of the CIS scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end


      struct DeleteCisScanConfigurationResponse
        include JSON::Serializable

        # The ARN of the CIS scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end


      struct DeleteCodeSecurityIntegrationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the code security integration to delete.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        def initialize(
          @integration_arn : String
        )
        end
      end


      struct DeleteCodeSecurityIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted code security integration.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String?

        def initialize(
          @integration_arn : String? = nil
        )
        end
      end


      struct DeleteCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scan configuration to delete.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end


      struct DeleteCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        def initialize(
          @scan_configuration_arn : String? = nil
        )
        end
      end


      struct DeleteFilterRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the filter to be deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteFilterResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the filter that has been deleted.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DescribeOrganizationConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeOrganizationConfigurationResponse
        include JSON::Serializable

        # The scan types are automatically enabled for new members of your organization.

        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Types::AutoEnable?

        # Represents whether your organization has reached the maximum Amazon Web Services account limit for
        # Amazon Inspector.

        @[JSON::Field(key: "maxAccountLimitReached")]
        getter max_account_limit_reached : Bool?

        def initialize(
          @auto_enable : Types::AutoEnable? = nil,
          @max_account_limit_reached : Bool? = nil
        )
        end
      end

      # Contains details of the Amazon S3 bucket and KMS key used to export findings.

      struct Destination
        include JSON::Serializable

        # The name of the Amazon S3 bucket to export findings to.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The ARN of the KMS key used to encrypt data when exporting findings.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String

        # The prefix that the findings will be written under.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket_name : String,
          @kms_key_arn : String,
          @key_prefix : String? = nil
        )
        end
      end


      struct DisableDelegatedAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the current Amazon Inspector delegated administrator.

        @[JSON::Field(key: "delegatedAdminAccountId")]
        getter delegated_admin_account_id : String

        def initialize(
          @delegated_admin_account_id : String
        )
        end
      end


      struct DisableDelegatedAdminAccountResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the successfully disabled delegated administrator.

        @[JSON::Field(key: "delegatedAdminAccountId")]
        getter delegated_admin_account_id : String

        def initialize(
          @delegated_admin_account_id : String
        )
        end
      end


      struct DisableRequest
        include JSON::Serializable

        # An array of account IDs you want to disable Amazon Inspector scans for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The resource scan types you want to disable.

        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @resource_types : Array(String)? = nil
        )
        end
      end


      struct DisableResponse
        include JSON::Serializable

        # Information on the accounts that have had Amazon Inspector scans successfully disabled. Details are
        # provided for each account.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::Account)

        # Information on any accounts for which Amazon Inspector scans could not be disabled. Details are
        # provided for each account.

        @[JSON::Field(key: "failedAccounts")]
        getter failed_accounts : Array(Types::FailedAccount)?

        def initialize(
          @accounts : Array(Types::Account),
          @failed_accounts : Array(Types::FailedAccount)? = nil
        )
        end
      end

      # Contains details about a request to disassociate a code repository from a scan configuration.

      struct DisassociateConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource

        # The Amazon Resource Name (ARN) of the scan configuration to disassociate from a code repository.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @resource : Types::CodeSecurityResource,
          @scan_configuration_arn : String
        )
        end
      end


      struct DisassociateMemberRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the member account to disassociate.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct DisassociateMemberResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the successfully disassociated member.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Enables agent-based scanning, which scans instances that are not managed by SSM.

      struct Ec2Configuration
        include JSON::Serializable

        # The scan method that is applied to the instance.

        @[JSON::Field(key: "scanMode")]
        getter scan_mode : String

        def initialize(
          @scan_mode : String
        )
        end
      end

      # Details about the state of the EC2 scan configuration for your environment.

      struct Ec2ConfigurationState
        include JSON::Serializable

        # An object that contains details about the state of the Amazon EC2 scan mode.

        @[JSON::Field(key: "scanModeState")]
        getter scan_mode_state : Types::Ec2ScanModeState?

        def initialize(
          @scan_mode_state : Types::Ec2ScanModeState? = nil
        )
        end
      end

      # The details that define an aggregation based on Amazon EC2 instances.

      struct Ec2InstanceAggregation
        include JSON::Serializable

        # The AMI IDs associated with the Amazon EC2 instances to aggregate findings for.

        @[JSON::Field(key: "amis")]
        getter amis : Array(Types::StringFilter)?

        # The Amazon EC2 instance IDs to aggregate findings for.

        @[JSON::Field(key: "instanceIds")]
        getter instance_ids : Array(Types::StringFilter)?

        # The Amazon EC2 instance tags to aggregate findings for.

        @[JSON::Field(key: "instanceTags")]
        getter instance_tags : Array(Types::MapFilter)?

        # The operating system types to aggregate findings for. Valid values must be uppercase and underscore
        # separated, examples are ORACLE_LINUX_7 and ALPINE_LINUX_3_8 .

        @[JSON::Field(key: "operatingSystems")]
        getter operating_systems : Array(Types::StringFilter)?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @amis : Array(Types::StringFilter)? = nil,
          @instance_ids : Array(Types::StringFilter)? = nil,
          @instance_tags : Array(Types::MapFilter)? = nil,
          @operating_systems : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding aggregation by Amazon EC2 instance.

      struct Ec2InstanceAggregationResponse
        include JSON::Serializable

        # The Amazon EC2 instance ID.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        # The Amazon Web Services account for the Amazon EC2 instance.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Machine Image (AMI) of the Amazon EC2 instance.

        @[JSON::Field(key: "ami")]
        getter ami : String?

        # The tags attached to the instance.

        @[JSON::Field(key: "instanceTags")]
        getter instance_tags : Hash(String, String)?

        # The number of network findings for the Amazon EC2 instance.

        @[JSON::Field(key: "networkFindings")]
        getter network_findings : Int64?

        # The operating system of the Amazon EC2 instance.

        @[JSON::Field(key: "operatingSystem")]
        getter operating_system : String?

        # An object that contains the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @instance_id : String,
          @account_id : String? = nil,
          @ami : String? = nil,
          @instance_tags : Hash(String, String)? = nil,
          @network_findings : Int64? = nil,
          @operating_system : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Meta data details of an Amazon EC2 instance.

      struct Ec2Metadata
        include JSON::Serializable

        # The ID of the Amazon Machine Image (AMI) used to launch the instance.

        @[JSON::Field(key: "amiId")]
        getter ami_id : String?

        # The platform of the instance.

        @[JSON::Field(key: "platform")]
        getter platform : String?

        # The tags attached to the instance.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @ami_id : String? = nil,
          @platform : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The state of your Amazon EC2 scan mode configuration.

      struct Ec2ScanModeState
        include JSON::Serializable

        # The scan method that is applied to the instance.

        @[JSON::Field(key: "scanMode")]
        getter scan_mode : String?

        # The status of the Amazon EC2 scan mode setting.

        @[JSON::Field(key: "scanModeStatus")]
        getter scan_mode_status : String?

        def initialize(
          @scan_mode : String? = nil,
          @scan_mode_status : String? = nil
        )
        end
      end

      # Details about the ECR automated re-scan duration setting for your environment.

      struct EcrConfiguration
        include JSON::Serializable

        # The rescan duration configured for image push date.

        @[JSON::Field(key: "rescanDuration")]
        getter rescan_duration : String

        # The rescan duration configured for image pull date.

        @[JSON::Field(key: "pullDateRescanDuration")]
        getter pull_date_rescan_duration : String?

        # The pull date for the re-scan mode.

        @[JSON::Field(key: "pullDateRescanMode")]
        getter pull_date_rescan_mode : String?

        def initialize(
          @rescan_duration : String,
          @pull_date_rescan_duration : String? = nil,
          @pull_date_rescan_mode : String? = nil
        )
        end
      end

      # Details about the state of the ECR scans for your environment.

      struct EcrConfigurationState
        include JSON::Serializable

        # An object that contains details about the state of the ECR re-scan settings.

        @[JSON::Field(key: "rescanDurationState")]
        getter rescan_duration_state : Types::EcrRescanDurationState?

        def initialize(
          @rescan_duration_state : Types::EcrRescanDurationState? = nil
        )
        end
      end

      # Information on the Amazon ECR image metadata associated with a finding.

      struct EcrContainerImageMetadata
        include JSON::Serializable

        # The date an image was last pulled at.

        @[JSON::Field(key: "imagePulledAt")]
        getter image_pulled_at : Time?

        # The number of Amazon ECS tasks or Amazon EKS pods where the Amazon ECR container image is in use.

        @[JSON::Field(key: "inUseCount")]
        getter in_use_count : Int64?

        # The last time an Amazon ECR image was used in an Amazon ECS task or Amazon EKS pod.

        @[JSON::Field(key: "lastInUseAt")]
        getter last_in_use_at : Time?

        # Tags associated with the Amazon ECR image metadata.

        @[JSON::Field(key: "tags")]
        getter tags : Array(String)?

        def initialize(
          @image_pulled_at : Time? = nil,
          @in_use_count : Int64? = nil,
          @last_in_use_at : Time? = nil,
          @tags : Array(String)? = nil
        )
        end
      end

      # Information on the Amazon ECR repository metadata associated with a finding.

      struct EcrRepositoryMetadata
        include JSON::Serializable

        # The name of the Amazon ECR repository.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The frequency of scans.

        @[JSON::Field(key: "scanFrequency")]
        getter scan_frequency : String?

        def initialize(
          @name : String? = nil,
          @scan_frequency : String? = nil
        )
        end
      end

      # Details about the state of your ECR re-scan duration settings. The ECR re-scan duration defines how
      # long an ECR image will be actively scanned by Amazon Inspector. When the number of days since an
      # image was last pushed exceeds the duration configured for image pull date, and the duration
      # configured for image pull date, the monitoring state of that image becomes inactive and all
      # associated findings are scheduled for closure.

      struct EcrRescanDurationState
        include JSON::Serializable

        # The rescan duration configured for image pull date.

        @[JSON::Field(key: "pullDateRescanDuration")]
        getter pull_date_rescan_duration : String?

        # The pull date for the re-scan mode.

        @[JSON::Field(key: "pullDateRescanMode")]
        getter pull_date_rescan_mode : String?

        # The rescan duration configured for image push date.

        @[JSON::Field(key: "rescanDuration")]
        getter rescan_duration : String?

        # The status of changes to the ECR automated re-scan duration.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A timestamp representing when the last time the ECR scan duration setting was changed.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @pull_date_rescan_duration : String? = nil,
          @pull_date_rescan_mode : String? = nil,
          @rescan_duration : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct EnableDelegatedAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Inspector delegated administrator.

        @[JSON::Field(key: "delegatedAdminAccountId")]
        getter delegated_admin_account_id : String

        # The idempotency token for the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @delegated_admin_account_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct EnableDelegatedAdminAccountResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the successfully Amazon Inspector delegated administrator.

        @[JSON::Field(key: "delegatedAdminAccountId")]
        getter delegated_admin_account_id : String

        def initialize(
          @delegated_admin_account_id : String
        )
        end
      end


      struct EnableRequest
        include JSON::Serializable

        # The resource scan types you want to enable.

        @[JSON::Field(key: "resourceTypes")]
        getter resource_types : Array(String)

        # A list of account IDs you want to enable Amazon Inspector scans for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The idempotency token for the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource_types : Array(String),
          @account_ids : Array(String)? = nil,
          @client_token : String? = nil
        )
        end
      end


      struct EnableResponse
        include JSON::Serializable

        # Information on the accounts that have had Amazon Inspector scans successfully enabled. Details are
        # provided for each account.

        @[JSON::Field(key: "accounts")]
        getter accounts : Array(Types::Account)

        # Information on any accounts for which Amazon Inspector scans could not be enabled. Details are
        # provided for each account.

        @[JSON::Field(key: "failedAccounts")]
        getter failed_accounts : Array(Types::FailedAccount)?

        def initialize(
          @accounts : Array(Types::Account),
          @failed_accounts : Array(Types::FailedAccount)? = nil
        )
        end
      end

      # Details about the Exploit Prediction Scoring System (EPSS) score.

      struct Epss
        include JSON::Serializable

        # The Exploit Prediction Scoring System (EPSS) score.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @score : Float64? = nil
        )
        end
      end

      # Details about the Exploit Prediction Scoring System (EPSS) score for a finding.

      struct EpssDetails
        include JSON::Serializable

        # The EPSS score.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @score : Float64? = nil
        )
        end
      end

      # Details of the evidence for a vulnerability identified in a finding.

      struct Evidence
        include JSON::Serializable

        # The evidence details.

        @[JSON::Field(key: "evidenceDetail")]
        getter evidence_detail : String?

        # The evidence rule.

        @[JSON::Field(key: "evidenceRule")]
        getter evidence_rule : String?

        # The evidence severity.

        @[JSON::Field(key: "severity")]
        getter severity : String?

        def initialize(
          @evidence_detail : String? = nil,
          @evidence_rule : String? = nil,
          @severity : String? = nil
        )
        end
      end

      # Contains information on when this exploit was observed.

      struct ExploitObserved
        include JSON::Serializable

        # The date an time when the exploit was first seen.

        @[JSON::Field(key: "firstSeen")]
        getter first_seen : Time?

        # The date an time when the exploit was last seen.

        @[JSON::Field(key: "lastSeen")]
        getter last_seen : Time?

        def initialize(
          @first_seen : Time? = nil,
          @last_seen : Time? = nil
        )
        end
      end

      # The details of an exploit available for a finding discovered in your environment.

      struct ExploitabilityDetails
        include JSON::Serializable

        # The date and time of the last exploit associated with a finding discovered in your environment.

        @[JSON::Field(key: "lastKnownExploitAt")]
        getter last_known_exploit_at : Time?

        def initialize(
          @last_known_exploit_at : Time? = nil
        )
        end
      end

      # An object with details on why an account failed to enable Amazon Inspector.

      struct FailedAccount
        include JSON::Serializable

        # The Amazon Web Services account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The error code explaining why the account failed to enable Amazon Inspector.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The error message received when the account failed to enable Amazon Inspector.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # An object detailing which resources Amazon Inspector is enabled to scan for the account.

        @[JSON::Field(key: "resourceStatus")]
        getter resource_status : Types::ResourceStatus?

        # The status of Amazon Inspector for the account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String,
          @error_code : String,
          @error_message : String,
          @resource_status : Types::ResourceStatus? = nil,
          @status : String? = nil
        )
        end
      end

      # Details about a failed attempt to associate or disassociate a code repository with a scan
      # configuration.

      struct FailedAssociationResult
        include JSON::Serializable


        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource?

        # The Amazon Resource Name (ARN) of the scan configuration that failed to be associated or
        # disassociated.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        # The status code indicating why the association or disassociation failed.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # A message explaining why the association or disassociation failed.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @resource : Types::CodeSecurityResource? = nil,
          @scan_configuration_arn : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An object that contains details about a member account in your organization that failed to activate
      # Amazon Inspector deep inspection.

      struct FailedMemberAccountEc2DeepInspectionStatusState
        include JSON::Serializable

        # The unique identifier for the Amazon Web Services account of the organization member that failed to
        # activate Amazon Inspector deep inspection.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The status of EC2 scanning in the account that failed to activate Amazon Inspector deep inspection.

        @[JSON::Field(key: "ec2ScanStatus")]
        getter ec2_scan_status : String?

        # The error message explaining why the account failed to activate Amazon Inspector deep inspection.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @account_id : String,
          @ec2_scan_status : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Details about a filter.

      struct Filter
        include JSON::Serializable

        # The action that is to be applied to the findings that match the filter.

        @[JSON::Field(key: "action")]
        getter action : String

        # The Amazon Resource Number (ARN) associated with this filter.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time this filter was created at.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # Details on the filter criteria associated with this filter.

        @[JSON::Field(key: "criteria")]
        getter criteria : Types::FilterCriteria

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Web Services account ID of the account that created the filter.

        @[JSON::Field(key: "ownerId")]
        getter owner_id : String

        # The date and time the filter was last updated at.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # A description of the filter.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The reason for the filter.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The tags attached to the filter.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String,
          @arn : String,
          @created_at : Time,
          @criteria : Types::FilterCriteria,
          @name : String,
          @owner_id : String,
          @updated_at : Time,
          @description : String? = nil,
          @reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Details on the criteria used to define the filter.

      struct FilterCriteria
        include JSON::Serializable

        # Details of the Amazon Web Services account IDs used to filter findings.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : Array(Types::StringFilter)?

        # Filter criteria for findings based on the project name in a code repository.

        @[JSON::Field(key: "codeRepositoryProjectName")]
        getter code_repository_project_name : Array(Types::StringFilter)?

        # Filter criteria for findings based on the repository provider type (such as GitHub, GitLab, etc.).

        @[JSON::Field(key: "codeRepositoryProviderType")]
        getter code_repository_provider_type : Array(Types::StringFilter)?

        # The name of the detector used to identify a code vulnerability in a Lambda function used to filter
        # findings.

        @[JSON::Field(key: "codeVulnerabilityDetectorName")]
        getter code_vulnerability_detector_name : Array(Types::StringFilter)?

        # The detector type tag associated with the vulnerability used to filter findings. Detector tags group
        # related vulnerabilities by common themes or tactics. For a list of available tags by programming
        # language, see Java tags , or Python tags .

        @[JSON::Field(key: "codeVulnerabilityDetectorTags")]
        getter code_vulnerability_detector_tags : Array(Types::StringFilter)?

        # The file path to the file in a Lambda function that contains a code vulnerability used to filter
        # findings.

        @[JSON::Field(key: "codeVulnerabilityFilePath")]
        getter code_vulnerability_file_path : Array(Types::StringFilter)?

        # Details of the component IDs used to filter findings.

        @[JSON::Field(key: "componentId")]
        getter component_id : Array(Types::StringFilter)?

        # Details of the component types used to filter findings.

        @[JSON::Field(key: "componentType")]
        getter component_type : Array(Types::StringFilter)?

        # Details of the Amazon EC2 instance image IDs used to filter findings.

        @[JSON::Field(key: "ec2InstanceImageId")]
        getter ec2_instance_image_id : Array(Types::StringFilter)?

        # Details of the Amazon EC2 instance subnet IDs used to filter findings.

        @[JSON::Field(key: "ec2InstanceSubnetId")]
        getter ec2_instance_subnet_id : Array(Types::StringFilter)?

        # Details of the Amazon EC2 instance VPC IDs used to filter findings.

        @[JSON::Field(key: "ec2InstanceVpcId")]
        getter ec2_instance_vpc_id : Array(Types::StringFilter)?

        # Details of the Amazon ECR image architecture types used to filter findings.

        @[JSON::Field(key: "ecrImageArchitecture")]
        getter ecr_image_architecture : Array(Types::StringFilter)?

        # Details of the Amazon ECR image hashes used to filter findings.

        @[JSON::Field(key: "ecrImageHash")]
        getter ecr_image_hash : Array(Types::StringFilter)?

        # Filter criteria indicating when details for an Amazon ECR image include when an Amazon ECR image is
        # in use.

        @[JSON::Field(key: "ecrImageInUseCount")]
        getter ecr_image_in_use_count : Array(Types::NumberFilter)?

        # Filter criteria indicating when an Amazon ECR image was last used in an Amazon ECS cluster task or
        # Amazon EKS cluster pod.

        @[JSON::Field(key: "ecrImageLastInUseAt")]
        getter ecr_image_last_in_use_at : Array(Types::DateFilter)?

        # Details on the Amazon ECR image push date and time used to filter findings.

        @[JSON::Field(key: "ecrImagePushedAt")]
        getter ecr_image_pushed_at : Array(Types::DateFilter)?

        # Details on the Amazon ECR registry used to filter findings.

        @[JSON::Field(key: "ecrImageRegistry")]
        getter ecr_image_registry : Array(Types::StringFilter)?

        # Details on the name of the Amazon ECR repository used to filter findings.

        @[JSON::Field(key: "ecrImageRepositoryName")]
        getter ecr_image_repository_name : Array(Types::StringFilter)?

        # The tags attached to the Amazon ECR container image.

        @[JSON::Field(key: "ecrImageTags")]
        getter ecr_image_tags : Array(Types::StringFilter)?

        # The EPSS score used to filter findings.

        @[JSON::Field(key: "epssScore")]
        getter epss_score : Array(Types::NumberFilter)?

        # Filters the list of Amazon Web Services Lambda findings by the availability of exploits.

        @[JSON::Field(key: "exploitAvailable")]
        getter exploit_available : Array(Types::StringFilter)?

        # Details on the finding ARNs used to filter findings.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : Array(Types::StringFilter)?

        # Details on the finding status types used to filter findings.

        @[JSON::Field(key: "findingStatus")]
        getter finding_status : Array(Types::StringFilter)?

        # Details on the finding types used to filter findings.

        @[JSON::Field(key: "findingType")]
        getter finding_type : Array(Types::StringFilter)?

        # Details on the date and time a finding was first seen used to filter findings.

        @[JSON::Field(key: "firstObservedAt")]
        getter first_observed_at : Array(Types::DateFilter)?

        # Details on whether a fix is available through a version update. This value can be YES , NO , or
        # PARTIAL . A PARTIAL fix means that some, but not all, of the packages identified in the finding have
        # fixes available through updated versions.

        @[JSON::Field(key: "fixAvailable")]
        getter fix_available : Array(Types::StringFilter)?

        # The Amazon Inspector score to filter on.

        @[JSON::Field(key: "inspectorScore")]
        getter inspector_score : Array(Types::NumberFilter)?

        # Filters the list of Amazon Web Services Lambda functions by execution role.

        @[JSON::Field(key: "lambdaFunctionExecutionRoleArn")]
        getter lambda_function_execution_role_arn : Array(Types::StringFilter)?

        # Filters the list of Amazon Web Services Lambda functions by the date and time that a user last
        # updated the configuration, in ISO 8601 format

        @[JSON::Field(key: "lambdaFunctionLastModifiedAt")]
        getter lambda_function_last_modified_at : Array(Types::DateFilter)?

        # Filters the list of Amazon Web Services Lambda functions by the function's layers . A Lambda
        # function can have up to five layers.

        @[JSON::Field(key: "lambdaFunctionLayers")]
        getter lambda_function_layers : Array(Types::StringFilter)?

        # Filters the list of Amazon Web Services Lambda functions by the name of the function.

        @[JSON::Field(key: "lambdaFunctionName")]
        getter lambda_function_name : Array(Types::StringFilter)?

        # Filters the list of Amazon Web Services Lambda functions by the runtime environment for the Lambda
        # function.

        @[JSON::Field(key: "lambdaFunctionRuntime")]
        getter lambda_function_runtime : Array(Types::StringFilter)?

        # Details on the date and time a finding was last seen used to filter findings.

        @[JSON::Field(key: "lastObservedAt")]
        getter last_observed_at : Array(Types::DateFilter)?

        # Details on network protocol used to filter findings.

        @[JSON::Field(key: "networkProtocol")]
        getter network_protocol : Array(Types::StringFilter)?

        # Details on the port ranges used to filter findings.

        @[JSON::Field(key: "portRange")]
        getter port_range : Array(Types::PortRangeFilter)?

        # Details on the related vulnerabilities used to filter findings.

        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(Types::StringFilter)?

        # Details on the resource IDs used to filter findings.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : Array(Types::StringFilter)?

        # Details on the resource tags used to filter findings.

        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Array(Types::MapFilter)?

        # Details on the resource types used to filter findings.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : Array(Types::StringFilter)?

        # Details on the severity used to filter findings.

        @[JSON::Field(key: "severity")]
        getter severity : Array(Types::StringFilter)?

        # Details on the finding title used to filter findings.

        @[JSON::Field(key: "title")]
        getter title : Array(Types::StringFilter)?

        # Details on the date and time a finding was last updated at used to filter findings.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Array(Types::DateFilter)?

        # Details on the vendor severity used to filter findings.

        @[JSON::Field(key: "vendorSeverity")]
        getter vendor_severity : Array(Types::StringFilter)?

        # Details on the vulnerability ID used to filter findings.

        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : Array(Types::StringFilter)?

        # Details on the vulnerability type used to filter findings.

        @[JSON::Field(key: "vulnerabilitySource")]
        getter vulnerability_source : Array(Types::StringFilter)?

        # Details on the vulnerable packages used to filter findings.

        @[JSON::Field(key: "vulnerablePackages")]
        getter vulnerable_packages : Array(Types::PackageFilter)?

        def initialize(
          @aws_account_id : Array(Types::StringFilter)? = nil,
          @code_repository_project_name : Array(Types::StringFilter)? = nil,
          @code_repository_provider_type : Array(Types::StringFilter)? = nil,
          @code_vulnerability_detector_name : Array(Types::StringFilter)? = nil,
          @code_vulnerability_detector_tags : Array(Types::StringFilter)? = nil,
          @code_vulnerability_file_path : Array(Types::StringFilter)? = nil,
          @component_id : Array(Types::StringFilter)? = nil,
          @component_type : Array(Types::StringFilter)? = nil,
          @ec2_instance_image_id : Array(Types::StringFilter)? = nil,
          @ec2_instance_subnet_id : Array(Types::StringFilter)? = nil,
          @ec2_instance_vpc_id : Array(Types::StringFilter)? = nil,
          @ecr_image_architecture : Array(Types::StringFilter)? = nil,
          @ecr_image_hash : Array(Types::StringFilter)? = nil,
          @ecr_image_in_use_count : Array(Types::NumberFilter)? = nil,
          @ecr_image_last_in_use_at : Array(Types::DateFilter)? = nil,
          @ecr_image_pushed_at : Array(Types::DateFilter)? = nil,
          @ecr_image_registry : Array(Types::StringFilter)? = nil,
          @ecr_image_repository_name : Array(Types::StringFilter)? = nil,
          @ecr_image_tags : Array(Types::StringFilter)? = nil,
          @epss_score : Array(Types::NumberFilter)? = nil,
          @exploit_available : Array(Types::StringFilter)? = nil,
          @finding_arn : Array(Types::StringFilter)? = nil,
          @finding_status : Array(Types::StringFilter)? = nil,
          @finding_type : Array(Types::StringFilter)? = nil,
          @first_observed_at : Array(Types::DateFilter)? = nil,
          @fix_available : Array(Types::StringFilter)? = nil,
          @inspector_score : Array(Types::NumberFilter)? = nil,
          @lambda_function_execution_role_arn : Array(Types::StringFilter)? = nil,
          @lambda_function_last_modified_at : Array(Types::DateFilter)? = nil,
          @lambda_function_layers : Array(Types::StringFilter)? = nil,
          @lambda_function_name : Array(Types::StringFilter)? = nil,
          @lambda_function_runtime : Array(Types::StringFilter)? = nil,
          @last_observed_at : Array(Types::DateFilter)? = nil,
          @network_protocol : Array(Types::StringFilter)? = nil,
          @port_range : Array(Types::PortRangeFilter)? = nil,
          @related_vulnerabilities : Array(Types::StringFilter)? = nil,
          @resource_id : Array(Types::StringFilter)? = nil,
          @resource_tags : Array(Types::MapFilter)? = nil,
          @resource_type : Array(Types::StringFilter)? = nil,
          @severity : Array(Types::StringFilter)? = nil,
          @title : Array(Types::StringFilter)? = nil,
          @updated_at : Array(Types::DateFilter)? = nil,
          @vendor_severity : Array(Types::StringFilter)? = nil,
          @vulnerability_id : Array(Types::StringFilter)? = nil,
          @vulnerability_source : Array(Types::StringFilter)? = nil,
          @vulnerable_packages : Array(Types::PackageFilter)? = nil
        )
        end
      end

      # Details about an Amazon Inspector finding.

      struct Finding
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the finding.

        @[JSON::Field(key: "awsAccountId")]
        getter aws_account_id : String

        # The description of the finding.

        @[JSON::Field(key: "description")]
        getter description : String

        # The Amazon Resource Number (ARN) of the finding.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String

        # The date and time that the finding was first observed.

        @[JSON::Field(key: "firstObservedAt")]
        getter first_observed_at : Time

        # The date and time the finding was last observed. This timestamp for this field remains unchanged
        # until a finding is updated.

        @[JSON::Field(key: "lastObservedAt")]
        getter last_observed_at : Time

        # An object that contains the details about how to remediate a finding.

        @[JSON::Field(key: "remediation")]
        getter remediation : Types::Remediation

        # Contains information on the resources involved in a finding. The resource value determines the valid
        # values for type in your request. For more information, see Finding types in the Amazon Inspector
        # user guide.

        @[JSON::Field(key: "resources")]
        getter resources : Array(Types::Resource)

        # The severity of the finding. UNTRIAGED applies to PACKAGE_VULNERABILITY type findings that the
        # vendor has not assigned a severity yet. For more information, see Severity levels for findings in
        # the Amazon Inspector user guide.

        @[JSON::Field(key: "severity")]
        getter severity : String

        # The status of the finding.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the finding. The type value determines the valid values for resource in your request.
        # For more information, see Finding types in the Amazon Inspector user guide.

        @[JSON::Field(key: "type")]
        getter type : String

        # Details about the code vulnerability identified in a Lambda function used to filter findings.

        @[JSON::Field(key: "codeVulnerabilityDetails")]
        getter code_vulnerability_details : Types::CodeVulnerabilityDetails?

        # The finding's EPSS score.

        @[JSON::Field(key: "epss")]
        getter epss : Types::EpssDetails?

        # If a finding discovered in your environment has an exploit available.

        @[JSON::Field(key: "exploitAvailable")]
        getter exploit_available : String?

        # The details of an exploit available for a finding discovered in your environment.

        @[JSON::Field(key: "exploitabilityDetails")]
        getter exploitability_details : Types::ExploitabilityDetails?

        # Details on whether a fix is available through a version update. This value can be YES , NO , or
        # PARTIAL . A PARTIAL fix means that some, but not all, of the packages identified in the finding have
        # fixes available through updated versions.

        @[JSON::Field(key: "fixAvailable")]
        getter fix_available : String?

        # The Amazon Inspector score given to the finding.

        @[JSON::Field(key: "inspectorScore")]
        getter inspector_score : Float64?

        # An object that contains details of the Amazon Inspector score.

        @[JSON::Field(key: "inspectorScoreDetails")]
        getter inspector_score_details : Types::InspectorScoreDetails?

        # An object that contains the details of a network reachability finding.

        @[JSON::Field(key: "networkReachabilityDetails")]
        getter network_reachability_details : Types::NetworkReachabilityDetails?

        # An object that contains the details of a package vulnerability finding.

        @[JSON::Field(key: "packageVulnerabilityDetails")]
        getter package_vulnerability_details : Types::PackageVulnerabilityDetails?

        # The title of the finding.

        @[JSON::Field(key: "title")]
        getter title : String?

        # The date and time the finding was last updated at.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @aws_account_id : String,
          @description : String,
          @finding_arn : String,
          @first_observed_at : Time,
          @last_observed_at : Time,
          @remediation : Types::Remediation,
          @resources : Array(Types::Resource),
          @severity : String,
          @status : String,
          @type : String,
          @code_vulnerability_details : Types::CodeVulnerabilityDetails? = nil,
          @epss : Types::EpssDetails? = nil,
          @exploit_available : String? = nil,
          @exploitability_details : Types::ExploitabilityDetails? = nil,
          @fix_available : String? = nil,
          @inspector_score : Float64? = nil,
          @inspector_score_details : Types::InspectorScoreDetails? = nil,
          @network_reachability_details : Types::NetworkReachabilityDetails? = nil,
          @package_vulnerability_details : Types::PackageVulnerabilityDetails? = nil,
          @title : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Details of the vulnerability identified in a finding.

      struct FindingDetail
        include JSON::Serializable

        # The Cybersecurity and Infrastructure Security Agency (CISA) details for a specific vulnerability.

        @[JSON::Field(key: "cisaData")]
        getter cisa_data : Types::CisaData?

        # The Common Weakness Enumerations (CWEs) associated with the vulnerability.

        @[JSON::Field(key: "cwes")]
        getter cwes : Array(String)?

        # The Exploit Prediction Scoring System (EPSS) score of the vulnerability.

        @[JSON::Field(key: "epssScore")]
        getter epss_score : Float64?

        # Information on the evidence of the vulnerability.

        @[JSON::Field(key: "evidences")]
        getter evidences : Array(Types::Evidence)?

        # Contains information on when this exploit was observed.

        @[JSON::Field(key: "exploitObserved")]
        getter exploit_observed : Types::ExploitObserved?

        # The finding ARN that the vulnerability details are associated with.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String?

        # The reference URLs for the vulnerability data.

        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # The risk score of the vulnerability.

        @[JSON::Field(key: "riskScore")]
        getter risk_score : Int32?

        # The known malware tools or kits that can exploit the vulnerability.

        @[JSON::Field(key: "tools")]
        getter tools : Array(String)?

        # The MITRE adversary tactics, techniques, or procedures (TTPs) associated with the vulnerability.

        @[JSON::Field(key: "ttps")]
        getter ttps : Array(String)?

        def initialize(
          @cisa_data : Types::CisaData? = nil,
          @cwes : Array(String)? = nil,
          @epss_score : Float64? = nil,
          @evidences : Array(Types::Evidence)? = nil,
          @exploit_observed : Types::ExploitObserved? = nil,
          @finding_arn : String? = nil,
          @reference_urls : Array(String)? = nil,
          @risk_score : Int32? = nil,
          @tools : Array(String)? = nil,
          @ttps : Array(String)? = nil
        )
        end
      end

      # Details about an error encountered when trying to return vulnerability data for a finding.

      struct FindingDetailsError
        include JSON::Serializable

        # The error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The finding ARN that returned an error.

        @[JSON::Field(key: "findingArn")]
        getter finding_arn : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @finding_arn : String
        )
        end
      end

      # The details that define an aggregation based on finding type.

      struct FindingTypeAggregation
        include JSON::Serializable

        # The finding type to aggregate.

        @[JSON::Field(key: "findingType")]
        getter finding_type : String?

        # The resource type to aggregate.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @finding_type : String? = nil,
          @resource_type : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding type aggregation.

      struct FindingTypeAggregationResponse
        include JSON::Serializable

        # The ID of the Amazon Web Services account associated with the findings.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The number of findings that have an exploit available.

        @[JSON::Field(key: "exploitAvailableCount")]
        getter exploit_available_count : Int64?

        # Details about the number of fixes.

        @[JSON::Field(key: "fixAvailableCount")]
        getter fix_available_count : Int64?

        # The value to sort results by.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @account_id : String? = nil,
          @exploit_available_count : Int64? = nil,
          @fix_available_count : Int64? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Information about the Amazon Inspector free trial for an account.

      struct FreeTrialAccountInfo
        include JSON::Serializable

        # The account associated with the Amazon Inspector free trial information.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # Contains information about the Amazon Inspector free trial for an account.

        @[JSON::Field(key: "freeTrialInfo")]
        getter free_trial_info : Array(Types::FreeTrialInfo)

        def initialize(
          @account_id : String,
          @free_trial_info : Array(Types::FreeTrialInfo)
        )
        end
      end

      # An object that contains information about the Amazon Inspector free trial for an account.

      struct FreeTrialInfo
        include JSON::Serializable

        # The date and time that the Amazon Inspector free trail ends for a given account.

        @[JSON::Field(key: "end")]
        getter end : Time

        # The date and time that the Amazon Inspector free trail started for a given account.

        @[JSON::Field(key: "start")]
        getter start : Time

        # The order to sort results by.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of scan covered by the Amazon Inspector free trail.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @end : Time,
          @start : Time,
          @status : String,
          @type : String
        )
        end
      end

      # Information about an error received while accessing free trail data for an account.

      struct FreeTrialInfoError
        include JSON::Serializable

        # The account associated with the Amazon Inspector free trial information.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The error code.

        @[JSON::Field(key: "code")]
        getter code : String

        # The error message returned.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @account_id : String,
          @code : String,
          @message : String
        )
        end
      end


      struct GetCisScanReportRequest
        include JSON::Serializable

        # The scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The format of the report. Valid values are PDF and CSV . If no value is specified, the report format
        # defaults to PDF .

        @[JSON::Field(key: "reportFormat")]
        getter report_format : String?

        # The target accounts.

        @[JSON::Field(key: "targetAccounts")]
        getter target_accounts : Array(String)?

        def initialize(
          @scan_arn : String,
          @report_format : String? = nil,
          @target_accounts : Array(String)? = nil
        )
        end
      end


      struct GetCisScanReportResponse
        include JSON::Serializable

        # The status.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The URL where a PDF or CSV of the CIS scan report can be downloaded.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @status : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct GetCisScanResultDetailsRequest
        include JSON::Serializable

        # The account ID.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The target resource ID.

        @[JSON::Field(key: "targetResourceId")]
        getter target_resource_id : String

        # The filter criteria.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CisScanResultDetailsFilterCriteria?

        # The maximum number of CIS scan result details to be returned in a single page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort by order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @account_id : String,
          @scan_arn : String,
          @target_resource_id : String,
          @filter_criteria : Types::CisScanResultDetailsFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct GetCisScanResultDetailsResponse
        include JSON::Serializable

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The scan result details.

        @[JSON::Field(key: "scanResultDetails")]
        getter scan_result_details : Array(Types::CisScanResultDetails)?

        def initialize(
          @next_token : String? = nil,
          @scan_result_details : Array(Types::CisScanResultDetails)? = nil
        )
        end
      end


      struct GetClustersForImageRequest
        include JSON::Serializable

        # The resource Id for the Amazon ECR image.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ClusterForImageFilterCriteria

        # The maximum number of results to be returned in a single page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ClusterForImageFilterCriteria,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetClustersForImageResponse
        include JSON::Serializable

        # A unit of work inside of a cluster, which can include metadata about the cluster.

        @[JSON::Field(key: "cluster")]
        getter cluster : Array(Types::ClusterInformation)

        # The pagination token from a previous request used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster : Array(Types::ClusterInformation),
          @next_token : String? = nil
        )
        end
      end


      struct GetCodeSecurityIntegrationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the code security integration to retrieve.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        # The tags associated with the code security integration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @integration_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCodeSecurityIntegrationResponse
        include JSON::Serializable

        # The timestamp when the code security integration was created.

        @[JSON::Field(key: "createdOn")]
        getter created_on : Time

        # The Amazon Resource Name (ARN) of the code security integration.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        # The timestamp when the code security integration was last updated.

        @[JSON::Field(key: "lastUpdateOn")]
        getter last_update_on : Time

        # The name of the code security integration.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current status of the code security integration.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the current status of the code security integration.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String

        # The type of repository provider for the integration.

        @[JSON::Field(key: "type")]
        getter type : String

        # The URL used to authorize the integration with the repository provider. This is only returned if
        # reauthorization is required to fix a connection issue. Otherwise, it is null.

        @[JSON::Field(key: "authorizationUrl")]
        getter authorization_url : String?

        # The tags associated with the code security integration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_on : Time,
          @integration_arn : String,
          @last_update_on : Time,
          @name : String,
          @status : String,
          @status_reason : String,
          @type : String,
          @authorization_url : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scan configuration to retrieve.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end


      struct GetCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # The configuration settings for the code security scan.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CodeSecurityScanConfiguration?

        # The timestamp when the scan configuration was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The timestamp when the scan configuration was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # The security level for the scan configuration.

        @[JSON::Field(key: "level")]
        getter level : String?

        # The name of the scan configuration.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        # The scope settings that define which repositories will be scanned. If the ScopeSetting parameter is
        # ALL the scan configuration applies to all existing and future projects imported into Amazon
        # Inspector.

        @[JSON::Field(key: "scopeSettings")]
        getter scope_settings : Types::ScopeSettings?

        # The tags associated with the scan configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::CodeSecurityScanConfiguration? = nil,
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @level : String? = nil,
          @name : String? = nil,
          @scan_configuration_arn : String? = nil,
          @scope_settings : Types::ScopeSettings? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetCodeSecurityScanRequest
        include JSON::Serializable

        # The resource identifier for the code repository that was scanned.

        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource

        # The unique identifier of the scan to retrieve.

        @[JSON::Field(key: "scanId")]
        getter scan_id : String

        def initialize(
          @resource : Types::CodeSecurityResource,
          @scan_id : String
        )
        end
      end


      struct GetCodeSecurityScanResponse
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the scan.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The timestamp when the scan was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The identifier of the last commit that was scanned. This is only returned if the scan was successful
        # or skipped.

        @[JSON::Field(key: "lastCommitId")]
        getter last_commit_id : String?

        # The resource identifier for the code repository that was scanned.

        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource?

        # The unique identifier of the scan.

        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # The current status of the scan.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the current status of the scan.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The timestamp when the scan was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @created_at : Time? = nil,
          @last_commit_id : String? = nil,
          @resource : Types::CodeSecurityResource? = nil,
          @scan_id : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetConfigurationResponse
        include JSON::Serializable

        # Specifies how the Amazon EC2 automated scan mode is currently configured for your environment.

        @[JSON::Field(key: "ec2Configuration")]
        getter ec2_configuration : Types::Ec2ConfigurationState?

        # Specifies how the ECR automated re-scan duration is currently configured for your environment.

        @[JSON::Field(key: "ecrConfiguration")]
        getter ecr_configuration : Types::EcrConfigurationState?

        def initialize(
          @ec2_configuration : Types::Ec2ConfigurationState? = nil,
          @ecr_configuration : Types::EcrConfigurationState? = nil
        )
        end
      end


      struct GetDelegatedAdminAccountRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetDelegatedAdminAccountResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Inspector delegated administrator.

        @[JSON::Field(key: "delegatedAdmin")]
        getter delegated_admin : Types::DelegatedAdmin?

        def initialize(
          @delegated_admin : Types::DelegatedAdmin? = nil
        )
        end
      end


      struct GetEc2DeepInspectionConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetEc2DeepInspectionConfigurationResponse
        include JSON::Serializable

        # An error message explaining why Amazon Inspector deep inspection configurations could not be
        # retrieved for your account.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The Amazon Inspector deep inspection custom paths for your organization.

        @[JSON::Field(key: "orgPackagePaths")]
        getter org_package_paths : Array(String)?

        # The Amazon Inspector deep inspection custom paths for your account.

        @[JSON::Field(key: "packagePaths")]
        getter package_paths : Array(String)?

        # The activation status of Amazon Inspector deep inspection in your account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @org_package_paths : Array(String)? = nil,
          @package_paths : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetEncryptionKeyRequest
        include JSON::Serializable

        # The resource type the key encrypts.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The scan type the key encrypts.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String

        def initialize(
          @resource_type : String,
          @scan_type : String
        )
        end
      end


      struct GetEncryptionKeyResponse
        include JSON::Serializable

        # A kms key ID.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        def initialize(
          @kms_key_id : String
        )
        end
      end


      struct GetFindingsReportStatusRequest
        include JSON::Serializable

        # The ID of the report to retrieve the status of.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        def initialize(
          @report_id : String? = nil
        )
        end
      end


      struct GetFindingsReportStatusResponse
        include JSON::Serializable

        # The destination of the report.

        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination?

        # The error code of the report.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The error message of the report.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The filter criteria associated with the report.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The ID of the report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        # The status of the report.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @destination : Types::Destination? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @report_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMemberRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the member account to retrieve information on.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end


      struct GetMemberResponse
        include JSON::Serializable

        # Details of the retrieved member account.

        @[JSON::Field(key: "member")]
        getter member : Types::Member?

        def initialize(
          @member : Types::Member? = nil
        )
        end
      end


      struct GetSbomExportRequest
        include JSON::Serializable

        # The report ID of the SBOM export to get details for.

        @[JSON::Field(key: "reportId")]
        getter report_id : String

        def initialize(
          @report_id : String
        )
        end
      end


      struct GetSbomExportResponse
        include JSON::Serializable

        # An error code.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Contains details about the resource filter criteria used for the software bill of materials (SBOM)
        # report.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::ResourceFilterCriteria?

        # The format of the software bill of materials (SBOM) report.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The report ID of the software bill of materials (SBOM) report.

        @[JSON::Field(key: "reportId")]
        getter report_id : String?

        # Contains details of the Amazon S3 bucket and KMS key used to export findings

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::Destination?

        # The status of the software bill of materials (SBOM) report.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @filter_criteria : Types::ResourceFilterCriteria? = nil,
          @format : String? = nil,
          @report_id : String? = nil,
          @s3_destination : Types::Destination? = nil,
          @status : String? = nil
        )
        end
      end

      # The details that define an aggregation based on container image layers.

      struct ImageLayerAggregation
        include JSON::Serializable

        # The hashes associated with the layers.

        @[JSON::Field(key: "layerHashes")]
        getter layer_hashes : Array(Types::StringFilter)?

        # The repository associated with the container image hosting the layers.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::StringFilter)?

        # The ID of the container image layer.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(Types::StringFilter)?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @layer_hashes : Array(Types::StringFilter)? = nil,
          @repositories : Array(Types::StringFilter)? = nil,
          @resource_ids : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding aggregation by image layer.

      struct ImageLayerAggregationResponse
        include JSON::Serializable

        # The ID of the Amazon Web Services account that owns the container image hosting the layer image.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The layer hash.

        @[JSON::Field(key: "layerHash")]
        getter layer_hash : String

        # The repository the layer resides in.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The resource ID of the container image layer.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # An object that represents the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @account_id : String,
          @layer_hash : String,
          @repository : String,
          @resource_id : String,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Information about the Amazon Inspector score given to a finding.

      struct InspectorScoreDetails
        include JSON::Serializable

        # An object that contains details about the CVSS score given to a finding.

        @[JSON::Field(key: "adjustedCvss")]
        getter adjusted_cvss : Types::CvssScoreDetails?

        def initialize(
          @adjusted_cvss : Types::CvssScoreDetails? = nil
        )
        end
      end

      # The request has failed due to an internal failure of the Amazon Inspector service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The details that define a findings aggregation based on Amazon Web Services Lambda functions.

      struct LambdaFunctionAggregation
        include JSON::Serializable

        # The Amazon Web Services Lambda function names to include in the aggregation results.

        @[JSON::Field(key: "functionNames")]
        getter function_names : Array(Types::StringFilter)?

        # The tags to include in the aggregation results.

        @[JSON::Field(key: "functionTags")]
        getter function_tags : Array(Types::MapFilter)?

        # The resource IDs to include in the aggregation results.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(Types::StringFilter)?

        # Returns findings aggregated by Amazon Web Services Lambda function runtime environments.

        @[JSON::Field(key: "runtimes")]
        getter runtimes : Array(Types::StringFilter)?

        # The finding severity to use for sorting the results.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to use for sorting the results.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @function_names : Array(Types::StringFilter)? = nil,
          @function_tags : Array(Types::MapFilter)? = nil,
          @resource_ids : Array(Types::StringFilter)? = nil,
          @runtimes : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of an Amazon Web Services Lambda function finding aggregation.

      struct LambdaFunctionAggregationResponse
        include JSON::Serializable

        # The resource IDs included in the aggregation results.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The ID of the Amazon Web Services account that owns the Amazon Web Services Lambda function.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Web Services Lambda function names included in the aggregation results.

        @[JSON::Field(key: "functionName")]
        getter function_name : String?

        # The tags included in the aggregation results.

        @[JSON::Field(key: "lambdaTags")]
        getter lambda_tags : Hash(String, String)?

        # The date that the Amazon Web Services Lambda function included in the aggregation results was last
        # changed.

        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time?

        # The runtimes included in the aggregation results.

        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        # An object that contains the counts of aggregated finding per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @resource_id : String,
          @account_id : String? = nil,
          @function_name : String? = nil,
          @lambda_tags : Hash(String, String)? = nil,
          @last_modified_at : Time? = nil,
          @runtime : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # The Amazon Web Services Lambda function metadata.

      struct LambdaFunctionMetadata
        include JSON::Serializable

        # The name of a function.

        @[JSON::Field(key: "functionName")]
        getter function_name : String?

        # The resource tags on an Amazon Web Services Lambda function.

        @[JSON::Field(key: "functionTags")]
        getter function_tags : Hash(String, String)?

        # The layers for an Amazon Web Services Lambda function. A Lambda function can have up to five layers.

        @[JSON::Field(key: "layers")]
        getter layers : Array(String)?

        # An Amazon Web Services Lambda function's runtime.

        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        def initialize(
          @function_name : String? = nil,
          @function_tags : Hash(String, String)? = nil,
          @layers : Array(String)? = nil,
          @runtime : String? = nil
        )
        end
      end

      # The details that define a findings aggregation based on an Amazon Web Services Lambda function's
      # layers.

      struct LambdaLayerAggregation
        include JSON::Serializable

        # The names of the Amazon Web Services Lambda functions associated with the layers.

        @[JSON::Field(key: "functionNames")]
        getter function_names : Array(Types::StringFilter)?

        # The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function layer.

        @[JSON::Field(key: "layerArns")]
        getter layer_arns : Array(Types::StringFilter)?

        # The resource IDs for the Amazon Web Services Lambda function layers.

        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(Types::StringFilter)?

        # The finding severity to use for sorting the results.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to use for sorting the results.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @function_names : Array(Types::StringFilter)? = nil,
          @layer_arns : Array(Types::StringFilter)? = nil,
          @resource_ids : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of an Amazon Web Services Lambda function layer finding
      # aggregation.

      struct LambdaLayerAggregationResponse
        include JSON::Serializable

        # The account ID of the Amazon Web Services Lambda function layer.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The names of the Amazon Web Services Lambda functions associated with the layers.

        @[JSON::Field(key: "functionName")]
        getter function_name : String

        # The Amazon Resource Name (ARN) of the Amazon Web Services Lambda function layer.

        @[JSON::Field(key: "layerArn")]
        getter layer_arn : String

        # The Resource ID of the Amazon Web Services Lambda function layer.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # An object that contains the counts of aggregated finding per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @account_id : String,
          @function_name : String,
          @layer_arn : String,
          @resource_id : String,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # The VPC security groups and subnets that are attached to an Amazon Web Services Lambda function. For
      # more information, see VPC Settings .

      struct LambdaVpcConfig
        include JSON::Serializable

        # The VPC security groups and subnets that are attached to an Amazon Web Services Lambda function. For
        # more information, see VPC Settings .

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of VPC subnet IDs.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The ID of the VPC.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct ListAccountPermissionsRequest
        include JSON::Serializable

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # NextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The service scan type to check permissions for.

        @[JSON::Field(key: "service")]
        getter service : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service : String? = nil
        )
        end
      end


      struct ListAccountPermissionsResponse
        include JSON::Serializable

        # Contains details on the permissions an account has to configure Amazon Inspector.

        @[JSON::Field(key: "permissions")]
        getter permissions : Array(Types::Permission)

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @permissions : Array(Types::Permission),
          @next_token : String? = nil
        )
        end
      end

      # A list of CIS scan configurations filter criteria.

      struct ListCisScanConfigurationsFilterCriteria
        include JSON::Serializable

        # The list of scan configuration ARN filters.

        @[JSON::Field(key: "scanConfigurationArnFilters")]
        getter scan_configuration_arn_filters : Array(Types::CisStringFilter)?

        # The list of scan name filters.

        @[JSON::Field(key: "scanNameFilters")]
        getter scan_name_filters : Array(Types::CisStringFilter)?

        # The list of target resource tag filters.

        @[JSON::Field(key: "targetResourceTagFilters")]
        getter target_resource_tag_filters : Array(Types::TagFilter)?

        def initialize(
          @scan_configuration_arn_filters : Array(Types::CisStringFilter)? = nil,
          @scan_name_filters : Array(Types::CisStringFilter)? = nil,
          @target_resource_tag_filters : Array(Types::TagFilter)? = nil
        )
        end
      end


      struct ListCisScanConfigurationsRequest
        include JSON::Serializable

        # The CIS scan configuration filter criteria.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::ListCisScanConfigurationsFilterCriteria?

        # The maximum number of CIS scan configurations to be returned in a single page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The CIS scan configuration sort by order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The CIS scan configuration sort order order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @filter_criteria : Types::ListCisScanConfigurationsFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCisScanConfigurationsResponse
        include JSON::Serializable

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The CIS scan configuration scan configurations.

        @[JSON::Field(key: "scanConfigurations")]
        getter scan_configurations : Array(Types::CisScanConfiguration)?

        def initialize(
          @next_token : String? = nil,
          @scan_configurations : Array(Types::CisScanConfiguration)? = nil
        )
        end
      end


      struct ListCisScanResultsAggregatedByChecksRequest
        include JSON::Serializable

        # The scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The filter criteria.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CisScanResultsAggregatedByChecksFilterCriteria?

        # The maximum number of scan results aggregated by checks to be returned in a single page of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort by order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @scan_arn : String,
          @filter_criteria : Types::CisScanResultsAggregatedByChecksFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCisScanResultsAggregatedByChecksResponse
        include JSON::Serializable

        # The check aggregations.

        @[JSON::Field(key: "checkAggregations")]
        getter check_aggregations : Array(Types::CisCheckAggregation)?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @check_aggregations : Array(Types::CisCheckAggregation)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCisScanResultsAggregatedByTargetResourceRequest
        include JSON::Serializable

        # The scan ARN.

        @[JSON::Field(key: "scanArn")]
        getter scan_arn : String

        # The filter criteria.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CisScanResultsAggregatedByTargetResourceFilterCriteria?

        # The maximum number of scan results aggregated by a target resource to be returned in a single page
        # of results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The sort by order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The sort order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @scan_arn : String,
          @filter_criteria : Types::CisScanResultsAggregatedByTargetResourceFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCisScanResultsAggregatedByTargetResourceResponse
        include JSON::Serializable

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The resource aggregations.

        @[JSON::Field(key: "targetResourceAggregations")]
        getter target_resource_aggregations : Array(Types::CisTargetResourceAggregation)?

        def initialize(
          @next_token : String? = nil,
          @target_resource_aggregations : Array(Types::CisTargetResourceAggregation)? = nil
        )
        end
      end

      # A list of CIS scans filter criteria.

      struct ListCisScansFilterCriteria
        include JSON::Serializable

        # The list of failed checks filters.

        @[JSON::Field(key: "failedChecksFilters")]
        getter failed_checks_filters : Array(Types::CisNumberFilter)?

        # The list of scan ARN filters.

        @[JSON::Field(key: "scanArnFilters")]
        getter scan_arn_filters : Array(Types::CisStringFilter)?

        # The list of scan at filters.

        @[JSON::Field(key: "scanAtFilters")]
        getter scan_at_filters : Array(Types::CisDateFilter)?

        # The list of scan configuration ARN filters.

        @[JSON::Field(key: "scanConfigurationArnFilters")]
        getter scan_configuration_arn_filters : Array(Types::CisStringFilter)?

        # The list of scan name filters.

        @[JSON::Field(key: "scanNameFilters")]
        getter scan_name_filters : Array(Types::CisStringFilter)?

        # The list of scan status filters.

        @[JSON::Field(key: "scanStatusFilters")]
        getter scan_status_filters : Array(Types::CisScanStatusFilter)?

        # The list of scheduled by filters.

        @[JSON::Field(key: "scheduledByFilters")]
        getter scheduled_by_filters : Array(Types::CisStringFilter)?

        # The list of target account ID filters.

        @[JSON::Field(key: "targetAccountIdFilters")]
        getter target_account_id_filters : Array(Types::CisStringFilter)?

        # The list of target resource ID filters.

        @[JSON::Field(key: "targetResourceIdFilters")]
        getter target_resource_id_filters : Array(Types::CisStringFilter)?

        # The list of target resource tag filters.

        @[JSON::Field(key: "targetResourceTagFilters")]
        getter target_resource_tag_filters : Array(Types::TagFilter)?

        def initialize(
          @failed_checks_filters : Array(Types::CisNumberFilter)? = nil,
          @scan_arn_filters : Array(Types::CisStringFilter)? = nil,
          @scan_at_filters : Array(Types::CisDateFilter)? = nil,
          @scan_configuration_arn_filters : Array(Types::CisStringFilter)? = nil,
          @scan_name_filters : Array(Types::CisStringFilter)? = nil,
          @scan_status_filters : Array(Types::CisScanStatusFilter)? = nil,
          @scheduled_by_filters : Array(Types::CisStringFilter)? = nil,
          @target_account_id_filters : Array(Types::CisStringFilter)? = nil,
          @target_resource_id_filters : Array(Types::CisStringFilter)? = nil,
          @target_resource_tag_filters : Array(Types::TagFilter)? = nil
        )
        end
      end


      struct ListCisScansRequest
        include JSON::Serializable

        # The detail applied to the CIS scan.

        @[JSON::Field(key: "detailLevel")]
        getter detail_level : String?

        # The CIS scan filter criteria.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::ListCisScansFilterCriteria?

        # The maximum number of results to be returned.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The CIS scans sort by order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The CIS scans sort order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @detail_level : String? = nil,
          @filter_criteria : Types::ListCisScansFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListCisScansResponse
        include JSON::Serializable

        # The pagination token from a previous request that's used to retrieve the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The CIS scans.

        @[JSON::Field(key: "scans")]
        getter scans : Array(Types::CisScan)?

        def initialize(
          @next_token : String? = nil,
          @scans : Array(Types::CisScan)? = nil
        )
        end
      end


      struct ListCodeSecurityIntegrationsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the NextToken value returned from
        # the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeSecurityIntegrationsResponse
        include JSON::Serializable

        # A list of code security integration summaries.

        @[JSON::Field(key: "integrations")]
        getter integrations : Array(Types::CodeSecurityIntegrationSummary)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the NextToken value returned from
        # the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @integrations : Array(Types::CodeSecurityIntegrationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeSecurityScanConfigurationAssociationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scan configuration to list associations for.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        # The maximum number of results to return in the response. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @scan_configuration_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeSecurityScanConfigurationAssociationsResponse
        include JSON::Serializable

        # A list of associations between code repositories and scan configurations.

        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::CodeSecurityScanConfigurationAssociationSummary)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @associations : Array(Types::CodeSecurityScanConfigurationAssociationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeSecurityScanConfigurationsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the NextToken value returned from
        # the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCodeSecurityScanConfigurationsResponse
        include JSON::Serializable

        # A list of code security scan configuration summaries.

        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::CodeSecurityScanConfigurationSummary)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the NextToken value returned from
        # the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configurations : Array(Types::CodeSecurityScanConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoverageRequest
        include JSON::Serializable

        # An object that contains details on the filters to apply to the coverage data for your environment.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CoverageFilterCriteria?

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_criteria : Types::CoverageFilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoverageResponse
        include JSON::Serializable

        # An object that contains details on the covered resources in your environment.

        @[JSON::Field(key: "coveredResources")]
        getter covered_resources : Array(Types::CoveredResource)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @covered_resources : Array(Types::CoveredResource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoverageStatisticsRequest
        include JSON::Serializable

        # An object that contains details on the filters to apply to the coverage data for your environment.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::CoverageFilterCriteria?

        # The value to group the results by.

        @[JSON::Field(key: "groupBy")]
        getter group_by : String?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_criteria : Types::CoverageFilterCriteria? = nil,
          @group_by : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCoverageStatisticsResponse
        include JSON::Serializable

        # The total number for all groups.

        @[JSON::Field(key: "totalCounts")]
        getter total_counts : Int64

        # An array with the number for each group.

        @[JSON::Field(key: "countsByGroup")]
        getter counts_by_group : Array(Types::Counts)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @total_counts : Int64,
          @counts_by_group : Array(Types::Counts)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDelegatedAdminAccountsRequest
        include JSON::Serializable

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDelegatedAdminAccountsResponse
        include JSON::Serializable

        # Details of the Amazon Inspector delegated administrator of your organization.

        @[JSON::Field(key: "delegatedAdminAccounts")]
        getter delegated_admin_accounts : Array(Types::DelegatedAdminAccount)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @delegated_admin_accounts : Array(Types::DelegatedAdminAccount)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFiltersRequest
        include JSON::Serializable

        # The action the filter applies to matched findings.

        @[JSON::Field(key: "action")]
        getter action : String?

        # The Amazon resource number (ARN) of the filter.

        @[JSON::Field(key: "arns")]
        getter arns : Array(String)?

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action : String? = nil,
          @arns : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFiltersResponse
        include JSON::Serializable

        # Contains details on the filters associated with your account.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::Filter),
          @next_token : String? = nil
        )
        end
      end


      struct ListFindingAggregationsRequest
        include JSON::Serializable

        # The type of the aggregation request.

        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : String

        # The Amazon Web Services account IDs to retrieve finding aggregation data for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(Types::StringFilter)?

        # Details of the aggregation request that is used to filter your aggregation results.

        @[JSON::Field(key: "aggregationRequest")]
        getter aggregation_request : Types::AggregationRequest?

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @aggregation_type : String,
          @account_ids : Array(Types::StringFilter)? = nil,
          @aggregation_request : Types::AggregationRequest? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFindingAggregationsResponse
        include JSON::Serializable

        # The type of aggregation to perform.

        @[JSON::Field(key: "aggregationType")]
        getter aggregation_type : String

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Objects that contain the results of an aggregation operation.

        @[JSON::Field(key: "responses")]
        getter responses : Array(Types::AggregationResponse)?

        def initialize(
          @aggregation_type : String,
          @next_token : String? = nil,
          @responses : Array(Types::AggregationResponse)? = nil
        )
        end
      end


      struct ListFindingsRequest
        include JSON::Serializable

        # Details on the filters to apply to your finding results.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Details on the sort criteria to apply to your finding results.

        @[JSON::Field(key: "sortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @filter_criteria : Types::FilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end


      struct ListFindingsResponse
        include JSON::Serializable

        # Contains details on the findings in your environment.

        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings : Array(Types::Finding)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersRequest
        include JSON::Serializable

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies whether to list only currently associated members if True or to list all members within
        # the organization if False .

        @[JSON::Field(key: "onlyAssociated")]
        getter only_associated : Bool?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @only_associated : Bool? = nil
        )
        end
      end


      struct ListMembersResponse
        include JSON::Serializable

        # An object that contains details for each member account.

        @[JSON::Field(key: "members")]
        getter members : Array(Types::Member)?

        # The pagination parameter to be used on the next list operation to retrieve more items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::Member)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon resource number (ARN) of the resource to list tags of.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListUsageTotalsRequest
        include JSON::Serializable

        # The Amazon Web Services account IDs to retrieve usage totals for.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The maximum number of results the response can return. If your request would return more than the
        # maximum the response will return a nextToken value, use this value when you call the action again to
        # get the remaining results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. If your response returns more than the
        # maxResults maximum value it will also return a nextToken value. For subsequent calls, use the
        # nextToken value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @account_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListUsageTotalsResponse
        include JSON::Serializable

        # The pagination parameter to be used on the next list operation to retrieve more items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An object with details on the total usage for the requested account.

        @[JSON::Field(key: "totals")]
        getter totals : Array(Types::UsageTotal)?

        def initialize(
          @next_token : String? = nil,
          @totals : Array(Types::UsageTotal)? = nil
        )
        end
      end

      # An object that describes details of a map filter.

      struct MapFilter
        include JSON::Serializable

        # The operator to use when comparing values in the filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The tag key used in the filter.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value used in the filter.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @comparison : String,
          @key : String,
          @value : String? = nil
        )
        end
      end

      # Details on a member account in your organization.

      struct Member
        include JSON::Serializable

        # The Amazon Web Services account ID of the member account.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The Amazon Web Services account ID of the Amazon Inspector delegated administrator for this member
        # account.

        @[JSON::Field(key: "delegatedAdminAccountId")]
        getter delegated_admin_account_id : String?

        # The status of the member account.

        @[JSON::Field(key: "relationshipStatus")]
        getter relationship_status : String?

        # A timestamp showing when the status of this member was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @account_id : String? = nil,
          @delegated_admin_account_id : String? = nil,
          @relationship_status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # An object that contains details about the status of Amazon Inspector deep inspection for a member
      # account in your organization.

      struct MemberAccountEc2DeepInspectionStatus
        include JSON::Serializable

        # The unique identifier for the Amazon Web Services account of the organization member.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # Whether Amazon Inspector deep inspection is active in the account. If TRUE Amazon Inspector deep
        # inspection is active, if FALSE it is not active.

        @[JSON::Field(key: "activateDeepInspection")]
        getter activate_deep_inspection : Bool

        def initialize(
          @account_id : String,
          @activate_deep_inspection : Bool
        )
        end
      end

      # An object that contains details about the state of Amazon Inspector deep inspection for a member
      # account.

      struct MemberAccountEc2DeepInspectionStatusState
        include JSON::Serializable

        # The unique identifier for the Amazon Web Services account of the organization member

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The error message explaining why the account failed to activate Amazon Inspector deep inspection.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The state of Amazon Inspector deep inspection in the member account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @account_id : String,
          @error_message : String? = nil,
          @status : String? = nil
        )
        end
      end

      # A monthly schedule.

      struct MonthlySchedule
        include JSON::Serializable

        # The monthly schedule's day.

        @[JSON::Field(key: "day")]
        getter day : String

        # The monthly schedule's start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Types::Time

        def initialize(
          @day : String,
          @start_time : Types::Time
        )
        end
      end

      # Information on the network path associated with a finding.

      struct NetworkPath
        include JSON::Serializable

        # The details on the steps in the network path.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::Step)?

        def initialize(
          @steps : Array(Types::Step)? = nil
        )
        end
      end

      # Contains the details of a network reachability finding.

      struct NetworkReachabilityDetails
        include JSON::Serializable

        # An object that contains details about a network path associated with a finding.

        @[JSON::Field(key: "networkPath")]
        getter network_path : Types::NetworkPath

        # An object that contains details about the open port range associated with a finding.

        @[JSON::Field(key: "openPortRange")]
        getter open_port_range : Types::PortRange

        # The protocol associated with a finding.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @network_path : Types::NetworkPath,
          @open_port_range : Types::PortRange,
          @protocol : String
        )
        end
      end

      # An object that describes the details of a number filter.

      struct NumberFilter
        include JSON::Serializable

        # The lowest number to be included in the filter.

        @[JSON::Field(key: "lowerInclusive")]
        getter lower_inclusive : Float64?

        # The highest number to be included in the filter.

        @[JSON::Field(key: "upperInclusive")]
        getter upper_inclusive : Float64?

        def initialize(
          @lower_inclusive : Float64? = nil,
          @upper_inclusive : Float64? = nil
        )
        end
      end

      # A one time schedule.

      struct OneTimeSchedule
        include JSON::Serializable

        def initialize
        end
      end

      # The details that define an aggregation based on operating system package type.

      struct PackageAggregation
        include JSON::Serializable

        # The names of packages to aggregate findings on.

        @[JSON::Field(key: "packageNames")]
        getter package_names : Array(Types::StringFilter)?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @package_names : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains the results of a finding aggregation by image layer.

      struct PackageAggregationResponse
        include JSON::Serializable

        # The name of the operating system package.

        @[JSON::Field(key: "packageName")]
        getter package_name : String

        # The ID of the Amazon Web Services account associated with the findings.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # An object that contains the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @package_name : String,
          @account_id : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end

      # Contains information on the details of a package filter.

      struct PackageFilter
        include JSON::Serializable

        # An object that contains details on the package architecture type to filter on.

        @[JSON::Field(key: "architecture")]
        getter architecture : Types::StringFilter?

        # An object that contains details on the package epoch to filter on.

        @[JSON::Field(key: "epoch")]
        getter epoch : Types::NumberFilter?

        # An object that contains details on the package file path to filter on.

        @[JSON::Field(key: "filePath")]
        getter file_path : Types::StringFilter?

        # An object that contains details on the name of the package to filter on.

        @[JSON::Field(key: "name")]
        getter name : Types::StringFilter?

        # An object that contains details on the package release to filter on.

        @[JSON::Field(key: "release")]
        getter release : Types::StringFilter?

        # An object that describes the details of a string filter.

        @[JSON::Field(key: "sourceLambdaLayerArn")]
        getter source_lambda_layer_arn : Types::StringFilter?

        # An object that contains details on the source layer hash to filter on.

        @[JSON::Field(key: "sourceLayerHash")]
        getter source_layer_hash : Types::StringFilter?

        # The package version to filter on.

        @[JSON::Field(key: "version")]
        getter version : Types::StringFilter?

        def initialize(
          @architecture : Types::StringFilter? = nil,
          @epoch : Types::NumberFilter? = nil,
          @file_path : Types::StringFilter? = nil,
          @name : Types::StringFilter? = nil,
          @release : Types::StringFilter? = nil,
          @source_lambda_layer_arn : Types::StringFilter? = nil,
          @source_layer_hash : Types::StringFilter? = nil,
          @version : Types::StringFilter? = nil
        )
        end
      end

      # Information about a package vulnerability finding.

      struct PackageVulnerabilityDetails
        include JSON::Serializable

        # The source of the vulnerability information.

        @[JSON::Field(key: "source")]
        getter source : String

        # The ID given to this vulnerability.

        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : String

        # An object that contains details about the CVSS score of a finding.

        @[JSON::Field(key: "cvss")]
        getter cvss : Array(Types::CvssScore)?

        # One or more URLs that contain details about this vulnerability type.

        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # One or more vulnerabilities related to the one identified in this finding.

        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(String)?

        # A URL to the source of the vulnerability information.

        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The date and time that this vulnerability was first added to the vendor's database.

        @[JSON::Field(key: "vendorCreatedAt")]
        getter vendor_created_at : Time?

        # The severity the vendor has given to this vulnerability type.

        @[JSON::Field(key: "vendorSeverity")]
        getter vendor_severity : String?

        # The date and time the vendor last updated this vulnerability in their database.

        @[JSON::Field(key: "vendorUpdatedAt")]
        getter vendor_updated_at : Time?

        # The packages impacted by this vulnerability.

        @[JSON::Field(key: "vulnerablePackages")]
        getter vulnerable_packages : Array(Types::VulnerablePackage)?

        def initialize(
          @source : String,
          @vulnerability_id : String,
          @cvss : Array(Types::CvssScore)? = nil,
          @reference_urls : Array(String)? = nil,
          @related_vulnerabilities : Array(String)? = nil,
          @source_url : String? = nil,
          @vendor_created_at : Time? = nil,
          @vendor_severity : String? = nil,
          @vendor_updated_at : Time? = nil,
          @vulnerable_packages : Array(Types::VulnerablePackage)? = nil
        )
        end
      end

      # Configuration settings for periodic scans that run on a scheduled basis.

      struct PeriodicScanConfiguration
        include JSON::Serializable

        # The frequency at which periodic scans are performed (such as weekly or monthly). If you don't
        # provide the frequencyExpression Amazon Inspector chooses day for the scan to run. If you provide the
        # frequencyExpression , the schedule must match the specified frequency .

        @[JSON::Field(key: "frequency")]
        getter frequency : String?

        # The schedule expression for periodic scans, in cron format.

        @[JSON::Field(key: "frequencyExpression")]
        getter frequency_expression : String?

        def initialize(
          @frequency : String? = nil,
          @frequency_expression : String? = nil
        )
        end
      end

      # Contains information on the permissions an account has within Amazon Inspector.

      struct Permission
        include JSON::Serializable

        # The operations that can be performed with the given permissions.

        @[JSON::Field(key: "operation")]
        getter operation : String

        # The services that the permissions allow an account to perform the given operations for.

        @[JSON::Field(key: "service")]
        getter service : String

        def initialize(
          @operation : String,
          @service : String
        )
        end
      end

      # Details about the port range associated with a finding.

      struct PortRange
        include JSON::Serializable

        # The beginning port in a port range.

        @[JSON::Field(key: "begin")]
        getter begin : Int32

        # The ending port in a port range.

        @[JSON::Field(key: "end")]
        getter end : Int32

        def initialize(
          @begin : Int32,
          @end : Int32
        )
        end
      end

      # An object that describes the details of a port range filter.

      struct PortRangeFilter
        include JSON::Serializable

        # The port number the port range begins at.

        @[JSON::Field(key: "beginInclusive")]
        getter begin_inclusive : Int32?

        # The port number the port range ends at.

        @[JSON::Field(key: "endInclusive")]
        getter end_inclusive : Int32?

        def initialize(
          @begin_inclusive : Int32? = nil,
          @end_inclusive : Int32? = nil
        )
        end
      end

      # Contains the scan configuration settings applied to a specific project in a code repository.

      struct ProjectCodeSecurityScanConfiguration
        include JSON::Serializable

        # The continuous integration scan configurations applied to the project.

        @[JSON::Field(key: "continuousIntegrationScanConfigurations")]
        getter continuous_integration_scan_configurations : Array(Types::ProjectContinuousIntegrationScanConfiguration)?

        # The periodic scan configurations applied to the project.

        @[JSON::Field(key: "periodicScanConfigurations")]
        getter periodic_scan_configurations : Array(Types::ProjectPeriodicScanConfiguration)?

        def initialize(
          @continuous_integration_scan_configurations : Array(Types::ProjectContinuousIntegrationScanConfiguration)? = nil,
          @periodic_scan_configurations : Array(Types::ProjectPeriodicScanConfiguration)? = nil
        )
        end
      end

      # Contains the continuous integration scan configuration settings applied to a specific project.

      struct ProjectContinuousIntegrationScanConfiguration
        include JSON::Serializable

        # The categories of security rules applied during continuous integration scans for the project.

        @[JSON::Field(key: "ruleSetCategories")]
        getter rule_set_categories : Array(String)?

        # The repository event that triggers continuous integration scans for the project.

        @[JSON::Field(key: "supportedEvent")]
        getter supported_event : String?

        def initialize(
          @rule_set_categories : Array(String)? = nil,
          @supported_event : String? = nil
        )
        end
      end

      # Contains the periodic scan configuration settings applied to a specific project.

      struct ProjectPeriodicScanConfiguration
        include JSON::Serializable

        # The schedule expression for periodic scans, in cron format, applied to the project.

        @[JSON::Field(key: "frequencyExpression")]
        getter frequency_expression : String?

        # The categories of security rules applied during periodic scans for the project.

        @[JSON::Field(key: "ruleSetCategories")]
        getter rule_set_categories : Array(String)?

        def initialize(
          @frequency_expression : String? = nil,
          @rule_set_categories : Array(String)? = nil
        )
        end
      end

      # Details about the recommended course of action to remediate the finding.

      struct Recommendation
        include JSON::Serializable

        # The URL address to the CVE remediation recommendations.

        @[JSON::Field(key: "Url")]
        getter url : String?

        # The recommended course of action to remediate the finding.

        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @url : String? = nil,
          @text : String? = nil
        )
        end
      end

      # Information on how to remediate a finding.

      struct Remediation
        include JSON::Serializable

        # An object that contains information about the recommended course of action to remediate the finding.

        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::Recommendation?

        def initialize(
          @recommendation : Types::Recommendation? = nil
        )
        end
      end

      # The details that define an aggregation based on repository.

      struct RepositoryAggregation
        include JSON::Serializable

        # The names of repositories to aggregate findings on.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::StringFilter)?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @repositories : Array(Types::StringFilter)? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # A response that contains details on the results of a finding aggregation by repository.

      struct RepositoryAggregationResponse
        include JSON::Serializable

        # The name of the repository associated with the findings.

        @[JSON::Field(key: "repository")]
        getter repository : String

        # The ID of the Amazon Web Services account associated with the findings.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The number of container images impacted by the findings.

        @[JSON::Field(key: "affectedImages")]
        getter affected_images : Int64?

        # An object that represent the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        def initialize(
          @repository : String,
          @account_id : String? = nil,
          @affected_images : Int64? = nil,
          @severity_counts : Types::SeverityCounts? = nil
        )
        end
      end


      struct ResetEncryptionKeyRequest
        include JSON::Serializable

        # The resource type the key encrypts.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The scan type the key encrypts.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String

        def initialize(
          @resource_type : String,
          @scan_type : String
        )
        end
      end


      struct ResetEncryptionKeyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Details about the resource involved in a finding.

      struct Resource
        include JSON::Serializable

        # The ID of the resource.

        @[JSON::Field(key: "id")]
        getter id : String

        # The type of resource.

        @[JSON::Field(key: "type")]
        getter type : String

        # An object that contains details about the resource involved in a finding.

        @[JSON::Field(key: "details")]
        getter details : Types::ResourceDetails?

        # The partition of the resource.

        @[JSON::Field(key: "partition")]
        getter partition : String?

        # The Amazon Web Services Region the impacted resource is located in.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The tags attached to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @id : String,
          @type : String,
          @details : Types::ResourceDetails? = nil,
          @partition : String? = nil,
          @region : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains details about the resource involved in the finding.

      struct ResourceDetails
        include JSON::Serializable

        # An object that contains details about the Amazon EC2 instance involved in the finding.

        @[JSON::Field(key: "awsEc2Instance")]
        getter aws_ec2_instance : Types::AwsEc2InstanceDetails?

        # An object that contains details about the Amazon ECR container image involved in the finding.

        @[JSON::Field(key: "awsEcrContainerImage")]
        getter aws_ecr_container_image : Types::AwsEcrContainerImageDetails?

        # A summary of the information about an Amazon Web Services Lambda function affected by a finding.

        @[JSON::Field(key: "awsLambdaFunction")]
        getter aws_lambda_function : Types::AwsLambdaFunctionDetails?

        # Contains details about a code repository resource associated with a finding.

        @[JSON::Field(key: "codeRepository")]
        getter code_repository : Types::CodeRepositoryDetails?

        def initialize(
          @aws_ec2_instance : Types::AwsEc2InstanceDetails? = nil,
          @aws_ecr_container_image : Types::AwsEcrContainerImageDetails? = nil,
          @aws_lambda_function : Types::AwsLambdaFunctionDetails? = nil,
          @code_repository : Types::CodeRepositoryDetails? = nil
        )
        end
      end

      # The resource filter criteria for a Software bill of materials (SBOM) report.

      struct ResourceFilterCriteria
        include JSON::Serializable

        # The account IDs used as resource filter criteria.

        @[JSON::Field(key: "accountId")]
        getter account_id : Array(Types::ResourceStringFilter)?

        # The EC2 instance tags used as resource filter criteria.

        @[JSON::Field(key: "ec2InstanceTags")]
        getter ec2_instance_tags : Array(Types::ResourceMapFilter)?

        # The ECR image tags used as resource filter criteria.

        @[JSON::Field(key: "ecrImageTags")]
        getter ecr_image_tags : Array(Types::ResourceStringFilter)?

        # The ECR repository names used as resource filter criteria.

        @[JSON::Field(key: "ecrRepositoryName")]
        getter ecr_repository_name : Array(Types::ResourceStringFilter)?

        # The Amazon Web Services Lambda function name used as resource filter criteria.

        @[JSON::Field(key: "lambdaFunctionName")]
        getter lambda_function_name : Array(Types::ResourceStringFilter)?

        # The Amazon Web Services Lambda function tags used as resource filter criteria.

        @[JSON::Field(key: "lambdaFunctionTags")]
        getter lambda_function_tags : Array(Types::ResourceMapFilter)?

        # The resource IDs used as resource filter criteria.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : Array(Types::ResourceStringFilter)?

        # The resource types used as resource filter criteria.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : Array(Types::ResourceStringFilter)?

        def initialize(
          @account_id : Array(Types::ResourceStringFilter)? = nil,
          @ec2_instance_tags : Array(Types::ResourceMapFilter)? = nil,
          @ecr_image_tags : Array(Types::ResourceStringFilter)? = nil,
          @ecr_repository_name : Array(Types::ResourceStringFilter)? = nil,
          @lambda_function_name : Array(Types::ResourceStringFilter)? = nil,
          @lambda_function_tags : Array(Types::ResourceMapFilter)? = nil,
          @resource_id : Array(Types::ResourceStringFilter)? = nil,
          @resource_type : Array(Types::ResourceStringFilter)? = nil
        )
        end
      end

      # A resource map filter for a software bill of material report.

      struct ResourceMapFilter
        include JSON::Serializable

        # The filter's comparison.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The filter's key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The filter's value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @comparison : String,
          @key : String,
          @value : String? = nil
        )
        end
      end

      # The operation tried to access an invalid resource. Make sure the resource is specified correctly.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An object that contains details about the metadata for an Amazon ECR resource.

      struct ResourceScanMetadata
        include JSON::Serializable

        # Contains metadata about scan coverage for a code repository resource.

        @[JSON::Field(key: "codeRepository")]
        getter code_repository : Types::CodeRepositoryMetadata?

        # An object that contains metadata details for an Amazon EC2 instance.

        @[JSON::Field(key: "ec2")]
        getter ec2 : Types::Ec2Metadata?

        # An object that contains details about the container metadata for an Amazon ECR image.

        @[JSON::Field(key: "ecrImage")]
        getter ecr_image : Types::EcrContainerImageMetadata?

        # An object that contains details about the repository an Amazon ECR image resides in.

        @[JSON::Field(key: "ecrRepository")]
        getter ecr_repository : Types::EcrRepositoryMetadata?

        # An object that contains metadata details for an Amazon Web Services Lambda function.

        @[JSON::Field(key: "lambdaFunction")]
        getter lambda_function : Types::LambdaFunctionMetadata?

        def initialize(
          @code_repository : Types::CodeRepositoryMetadata? = nil,
          @ec2 : Types::Ec2Metadata? = nil,
          @ecr_image : Types::EcrContainerImageMetadata? = nil,
          @ecr_repository : Types::EcrRepositoryMetadata? = nil,
          @lambda_function : Types::LambdaFunctionMetadata? = nil
        )
        end
      end

      # Details the state of Amazon Inspector for each resource type Amazon Inspector scans.

      struct ResourceState
        include JSON::Serializable

        # An object detailing the state of Amazon Inspector scanning for Amazon EC2 resources.

        @[JSON::Field(key: "ec2")]
        getter ec2 : Types::State

        # An object detailing the state of Amazon Inspector scanning for Amazon ECR resources.

        @[JSON::Field(key: "ecr")]
        getter ecr : Types::State


        @[JSON::Field(key: "codeRepository")]
        getter code_repository : Types::State?

        # An object that described the state of Amazon Inspector scans for an account.

        @[JSON::Field(key: "lambda")]
        getter lambda : Types::State?

        # An object that described the state of Amazon Inspector scans for an account.

        @[JSON::Field(key: "lambdaCode")]
        getter lambda_code : Types::State?

        def initialize(
          @ec2 : Types::State,
          @ecr : Types::State,
          @code_repository : Types::State? = nil,
          @lambda : Types::State? = nil,
          @lambda_code : Types::State? = nil
        )
        end
      end

      # Details the status of Amazon Inspector for each resource type Amazon Inspector scans.

      struct ResourceStatus
        include JSON::Serializable

        # The status of Amazon Inspector scanning for Amazon EC2 resources.

        @[JSON::Field(key: "ec2")]
        getter ec2 : String

        # The status of Amazon Inspector scanning for Amazon ECR resources.

        @[JSON::Field(key: "ecr")]
        getter ecr : String

        # The status of Amazon Inspector scanning for code repositories.

        @[JSON::Field(key: "codeRepository")]
        getter code_repository : String?

        # The status of Amazon Inspector scanning for Amazon Web Services Lambda function.

        @[JSON::Field(key: "lambda")]
        getter lambda : String?

        # The status of Amazon Inspector scanning for custom application code for Amazon Web Services Lambda
        # functions.

        @[JSON::Field(key: "lambdaCode")]
        getter lambda_code : String?

        def initialize(
          @ec2 : String,
          @ecr : String,
          @code_repository : String? = nil,
          @lambda : String? = nil,
          @lambda_code : String? = nil
        )
        end
      end

      # A resource string filter for a software bill of materials report.

      struct ResourceStringFilter
        include JSON::Serializable

        # The filter's comparison.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The filter's value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # The status of the scan.

      struct ScanStatus
        include JSON::Serializable

        # The scan status. Possible return values and descriptions are: ACCESS_DENIED - Resource access policy
        # restricting Amazon Inspector access. Please update the IAM policy. ACCESS_DENIED_TO_ENCRYPTION_KEY -
        # The KMS key policy doesn't allow Amazon Inspector access. Update the key policy.
        # DEEP_INSPECTION_COLLECTION_TIME_LIMIT_EXCEEDED - Amazon Inspector failed to extract the package
        # inventory because the package collection time exceeding the maximum threshold of 15 minutes.
        # DEEP_INSPECTION_DAILY_SSM_INVENTORY_LIMIT_EXCEEDED - The SSM agent couldn't send inventory to Amazon
        # Inspector because the SSM quota for Inventory data collected per instance per day has already been
        # reached for this instance. DEEP_INSPECTION_NO_INVENTORY - The Amazon Inspector plugin hasn't yet
        # been able to collect an inventory of packages for this instance. This is usually the result of a
        # pending scan, however, if this status persists after 6 hours, use SSM to ensure that the required
        # Amazon Inspector associations exist and are running for the instance.
        # DEEP_INSPECTION_PACKAGE_COLLECTION_LIMIT_EXCEEDED - The instance has exceeded the 5000 package limit
        # for Amazon Inspector Deep inspection. To resume Deep inspection for this instance you can try to
        # adjust the custom paths associated with the account. EC2_INSTANCE_STOPPED - This EC2 instance is in
        # a stopped state, therefore, Amazon Inspector will pause scanning. The existing findings will
        # continue to exist until the instance is terminated. Once the instance is re-started, Inspector will
        # automatically start scanning the instance again. Please note that you will not be charged for this
        # instance while it's in a stopped state. EXCLUDED_BY_TAG - This resource was not scanned because it
        # has been excluded by a tag. IMAGE_SIZE_EXCEEDED - Reserved for future use.
        # INTEGRATION_CONNNECTION_LOST - Amazon Inspector couldn't communicate with the source code management
        # platform. INTERNAL_ERROR - Amazon Inspector has encountered an internal error for this resource.
        # Amazon Inspector service will automatically resolve the issue and resume the scanning. No action
        # required from the user. NO_INVENTORY - Amazon Inspector couldn't find software application inventory
        # to scan for vulnerabilities. This might be caused due to required Amazon Inspector associations
        # being deleted or failing to run on your resource. Please verify the status of
        # InspectorInventoryCollection-do-not-delete association in the SSM console for the resource.
        # Additionally, you can verify the instance's inventory in the SSM Fleet Manager console.
        # NO_RESOURCES_FOUND - Reserved for future use. NO_SCAN_CONFIGURATION_ASSOCIATED - The code repository
        # resource doesn't have an associated scan configuration. PENDING_DISABLE - This resource is pending
        # cleanup during disablement. The customer will not be billed while a resource is in the pending
        # disable status. PENDING_INITIAL_SCAN - This resource has been identified for scanning, results will
        # be available soon. RESOURCE_TERMINATED - This resource has been terminated. The findings and
        # coverage associated with this resource are in the process of being cleaned up.
        # SCAN_ELIGIBILITY_EXPIRED - The configured scan duration has lapsed for this image.
        # SCAN_FREQUENCY_MANUAL - This image will not be covered by Amazon Inspector due to the repository
        # scan frequency configuration. SCAN_FREQUENCY_SCAN_ON_PUSH - This image will be scanned one time and
        # will not new findings because of the scan frequency configuration. SCAN_IN_PROGRESS - The resource
        # is currently being scanned. STALE_INVENTORY - Amazon Inspector wasn't able to collect an updated
        # software application inventory in the last 7 days. Please confirm the required Amazon Inspector
        # associations still exist and you can still see an updated inventory in the SSM console. SUCCESSFUL -
        # The scan was successful. UNMANAGED_EC2_INSTANCE - The EC2 instance is not managed by SSM, please use
        # the following SSM automation to remediate the issue:
        # https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-troubleshoot-managed-instance.html
        # . Once the instance becomes managed by SSM, Inspector will automatically begin scanning this
        # instance. UNSUPPORTED_CODE_ARTIFACTS - The function was not scanned because it has an unsupported
        # code artifacts. UNSUPPORTED_CONFIG_FILE - Reserved for future use. UNSUPPORTED_LANGUAGE - The scan
        # was unsuccessful because the repository contains files in an unsupported programming language.
        # UNSUPPORTED_MEDIA_TYPE - The ECR image has an unsupported media type. UNSUPPORTED_OS - Amazon
        # Inspector does not support this OS, architecture, or image manifest type at this time. To see a
        # complete list of supported operating systems see:
        # https://docs.aws.amazon.com/inspector/latest/user/supported.html . UNSUPPORTED_RUNTIME - The
        # function was not scanned because it has an unsupported runtime. To see a complete list of supported
        # runtimes see: https://docs.aws.amazon.com/inspector/latest/user/supported.html . IMAGE_ARCHIVED -
        # This image has been archived in Amazon ECR and is no longer available for scanning in Amazon
        # Inspector.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The status code of the scan.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String

        def initialize(
          @reason : String,
          @status_code : String
        )
        end
      end

      # A schedule.

      struct Schedule
        include JSON::Serializable

        # The schedule's daily.

        @[JSON::Field(key: "daily")]
        getter daily : Types::DailySchedule?

        # The schedule's monthly.

        @[JSON::Field(key: "monthly")]
        getter monthly : Types::MonthlySchedule?

        # The schedule's one time.

        @[JSON::Field(key: "oneTime")]
        getter one_time : Types::OneTimeSchedule?

        # The schedule's weekly.

        @[JSON::Field(key: "weekly")]
        getter weekly : Types::WeeklySchedule?

        def initialize(
          @daily : Types::DailySchedule? = nil,
          @monthly : Types::MonthlySchedule? = nil,
          @one_time : Types::OneTimeSchedule? = nil,
          @weekly : Types::WeeklySchedule? = nil
        )
        end
      end

      # Defines the scope of repositories to be included in code security scans.

      struct ScopeSettings
        include JSON::Serializable

        # The scope of projects to be selected for scanning within the integrated repositories. Setting the
        # value to ALL applies the scope settings to all existing and future projects imported into Amazon
        # Inspector.

        @[JSON::Field(key: "projectSelectionScope")]
        getter project_selection_scope : String?

        def initialize(
          @project_selection_scope : String? = nil
        )
        end
      end

      # Details on the criteria used to define the filter for a vulnerability search.

      struct SearchVulnerabilitiesFilterCriteria
        include JSON::Serializable

        # The IDs for specific vulnerabilities.

        @[JSON::Field(key: "vulnerabilityIds")]
        getter vulnerability_ids : Array(String)

        def initialize(
          @vulnerability_ids : Array(String)
        )
        end
      end


      struct SearchVulnerabilitiesRequest
        include JSON::Serializable

        # The criteria used to filter the results of a vulnerability search.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::SearchVulnerabilitiesFilterCriteria

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request to a list action. For subsequent calls, use the NextToken
        # value returned from the previous request to continue listing results after the first page.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filter_criteria : Types::SearchVulnerabilitiesFilterCriteria,
          @next_token : String? = nil
        )
        end
      end


      struct SearchVulnerabilitiesResponse
        include JSON::Serializable

        # Details about the listed vulnerability.

        @[JSON::Field(key: "vulnerabilities")]
        getter vulnerabilities : Array(Types::Vulnerability)

        # The pagination parameter to be used on the next list operation to retrieve more items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @vulnerabilities : Array(Types::Vulnerability),
          @next_token : String? = nil
        )
        end
      end


      struct SendCisSessionHealthRequest
        include JSON::Serializable

        # A unique identifier for the scan job.

        @[JSON::Field(key: "scanJobId")]
        getter scan_job_id : String

        # The unique token that identifies the CIS session.

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @scan_job_id : String,
          @session_token : String
        )
        end
      end


      struct SendCisSessionHealthResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct SendCisSessionTelemetryRequest
        include JSON::Serializable

        # The CIS session telemetry messages.

        @[JSON::Field(key: "messages")]
        getter messages : Array(Types::CisSessionMessage)

        # A unique identifier for the scan job.

        @[JSON::Field(key: "scanJobId")]
        getter scan_job_id : String

        # The unique token that identifies the CIS session.

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @messages : Array(Types::CisSessionMessage),
          @scan_job_id : String,
          @session_token : String
        )
        end
      end


      struct SendCisSessionTelemetryResponse
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use Service Quotas to request a service quota increase.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that exceeds a service quota.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end

      # An object that contains the counts of aggregated finding per severity.

      struct SeverityCounts
        include JSON::Serializable

        # The total count of findings from all severities.

        @[JSON::Field(key: "all")]
        getter all : Int64?

        # The total count of critical severity findings.

        @[JSON::Field(key: "critical")]
        getter critical : Int64?

        # The total count of high severity findings.

        @[JSON::Field(key: "high")]
        getter high : Int64?

        # The total count of medium severity findings.

        @[JSON::Field(key: "medium")]
        getter medium : Int64?

        def initialize(
          @all : Int64? = nil,
          @critical : Int64? = nil,
          @high : Int64? = nil,
          @medium : Int64? = nil
        )
        end
      end

      # Details about the criteria used to sort finding results.

      struct SortCriteria
        include JSON::Serializable

        # The finding detail field by which results are sorted.

        @[JSON::Field(key: "field")]
        getter field : String

        # The order by which findings are sorted.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @field : String,
          @sort_order : String
        )
        end
      end

      # The start CIS session message.

      struct StartCisSessionMessage
        include JSON::Serializable

        # The unique token that identifies the CIS session.

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @session_token : String
        )
        end
      end


      struct StartCisSessionRequest
        include JSON::Serializable

        # The start CIS session message.

        @[JSON::Field(key: "message")]
        getter message : Types::StartCisSessionMessage

        # A unique identifier for the scan job.

        @[JSON::Field(key: "scanJobId")]
        getter scan_job_id : String

        def initialize(
          @message : Types::StartCisSessionMessage,
          @scan_job_id : String
        )
        end
      end


      struct StartCisSessionResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StartCodeSecurityScanRequest
        include JSON::Serializable

        # The resource identifier for the code repository to scan.

        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @resource : Types::CodeSecurityResource,
          @client_token : String? = nil
        )
        end
      end


      struct StartCodeSecurityScanResponse
        include JSON::Serializable

        # The unique identifier of the initiated scan.

        @[JSON::Field(key: "scanId")]
        getter scan_id : String?

        # The current status of the initiated scan.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @scan_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An object that described the state of Amazon Inspector scans for an account.

      struct State
        include JSON::Serializable

        # The error code explaining why the account failed to enable Amazon Inspector.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The error message received when the account failed to enable Amazon Inspector.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The status of Amazon Inspector for the account.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @status : String
        )
        end
      end

      # The status counts.

      struct StatusCounts
        include JSON::Serializable

        # The number of checks that failed.

        @[JSON::Field(key: "failed")]
        getter failed : Int32?

        # The number of checks that passed.

        @[JSON::Field(key: "passed")]
        getter passed : Int32?

        # The number of checks that were skipped.

        @[JSON::Field(key: "skipped")]
        getter skipped : Int32?

        def initialize(
          @failed : Int32? = nil,
          @passed : Int32? = nil,
          @skipped : Int32? = nil
        )
        end
      end

      # Details about the step associated with a finding.

      struct Step
        include JSON::Serializable

        # The component ID.

        @[JSON::Field(key: "componentId")]
        getter component_id : String

        # The component type.

        @[JSON::Field(key: "componentType")]
        getter component_type : String

        # The component ARN. The ARN can be null and is not displayed in the Amazon Web Services console.

        @[JSON::Field(key: "componentArn")]
        getter component_arn : String?

        def initialize(
          @component_id : String,
          @component_type : String,
          @component_arn : String? = nil
        )
        end
      end

      # The stop CIS message progress.

      struct StopCisMessageProgress
        include JSON::Serializable

        # The progress' error checks.

        @[JSON::Field(key: "errorChecks")]
        getter error_checks : Int32?

        # The progress' failed checks.

        @[JSON::Field(key: "failedChecks")]
        getter failed_checks : Int32?

        # The progress' informational checks.

        @[JSON::Field(key: "informationalChecks")]
        getter informational_checks : Int32?

        # The progress' not applicable checks.

        @[JSON::Field(key: "notApplicableChecks")]
        getter not_applicable_checks : Int32?

        # The progress' not evaluated checks.

        @[JSON::Field(key: "notEvaluatedChecks")]
        getter not_evaluated_checks : Int32?

        # The progress' successful checks.

        @[JSON::Field(key: "successfulChecks")]
        getter successful_checks : Int32?

        # The progress' total checks.

        @[JSON::Field(key: "totalChecks")]
        getter total_checks : Int32?

        # The progress' unknown checks.

        @[JSON::Field(key: "unknownChecks")]
        getter unknown_checks : Int32?

        def initialize(
          @error_checks : Int32? = nil,
          @failed_checks : Int32? = nil,
          @informational_checks : Int32? = nil,
          @not_applicable_checks : Int32? = nil,
          @not_evaluated_checks : Int32? = nil,
          @successful_checks : Int32? = nil,
          @total_checks : Int32? = nil,
          @unknown_checks : Int32? = nil
        )
        end
      end

      # The stop CIS session message.

      struct StopCisSessionMessage
        include JSON::Serializable

        # The progress of the message.

        @[JSON::Field(key: "progress")]
        getter progress : Types::StopCisMessageProgress

        # The status of the message.

        @[JSON::Field(key: "status")]
        getter status : String

        # The message benchmark profile.

        @[JSON::Field(key: "benchmarkProfile")]
        getter benchmark_profile : String?

        # The message benchmark version.

        @[JSON::Field(key: "benchmarkVersion")]
        getter benchmark_version : String?

        # The message compute platform.

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : Types::ComputePlatform?

        # The reason for the message.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @progress : Types::StopCisMessageProgress,
          @status : String,
          @benchmark_profile : String? = nil,
          @benchmark_version : String? = nil,
          @compute_platform : Types::ComputePlatform? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StopCisSessionRequest
        include JSON::Serializable

        # The stop CIS session message.

        @[JSON::Field(key: "message")]
        getter message : Types::StopCisSessionMessage

        # A unique identifier for the scan job.

        @[JSON::Field(key: "scanJobId")]
        getter scan_job_id : String

        # The unique token that identifies the CIS session.

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @message : Types::StopCisSessionMessage,
          @scan_job_id : String,
          @session_token : String
        )
        end
      end


      struct StopCisSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object that describes the details of a string filter.

      struct StringFilter
        include JSON::Serializable

        # The operator to use when comparing values in the filter.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The value to filter on.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @value : String
        )
        end
      end

      # Details about a successful association or disassociation between a code repository and a scan
      # configuration.

      struct SuccessfulAssociationResult
        include JSON::Serializable


        @[JSON::Field(key: "resource")]
        getter resource : Types::CodeSecurityResource?

        # The Amazon Resource Name (ARN) of the scan configuration that was successfully associated or
        # disassociated.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        def initialize(
          @resource : Types::CodeSecurityResource? = nil,
          @scan_configuration_arn : String? = nil
        )
        end
      end

      # A suggested fix for a vulnerability in your Lambda function code.

      struct SuggestedFix
        include JSON::Serializable

        # The fix's code.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The fix's description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @code : String? = nil,
          @description : String? = nil
        )
        end
      end

      # The tag filter.

      struct TagFilter
        include JSON::Serializable

        # The tag filter comparison value.

        @[JSON::Field(key: "comparison")]
        getter comparison : String

        # The tag filter key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag filter value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @comparison : String,
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to apply a tag to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to be added to a resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The limit on the number of requests per second was exceeded.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The time.

      struct Time
        include JSON::Serializable

        # The time of day in 24-hour format (00:00).

        @[JSON::Field(key: "timeOfDay")]
        getter time_of_day : String

        # The timezone.

        @[JSON::Field(key: "timezone")]
        getter timezone : String

        def initialize(
          @time_of_day : String,
          @timezone : String
        )
        end
      end

      # The details that define an aggregation based on finding title.

      struct TitleAggregation
        include JSON::Serializable

        # The type of finding to aggregate on.

        @[JSON::Field(key: "findingType")]
        getter finding_type : String?

        # The resource type to aggregate on.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The value to sort results by.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order to sort results by.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        # The finding titles to aggregate on.

        @[JSON::Field(key: "titles")]
        getter titles : Array(Types::StringFilter)?

        # The vulnerability IDs of the findings.

        @[JSON::Field(key: "vulnerabilityIds")]
        getter vulnerability_ids : Array(Types::StringFilter)?

        def initialize(
          @finding_type : String? = nil,
          @resource_type : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil,
          @titles : Array(Types::StringFilter)? = nil,
          @vulnerability_ids : Array(Types::StringFilter)? = nil
        )
        end
      end

      # A response that contains details on the results of a finding aggregation by title.

      struct TitleAggregationResponse
        include JSON::Serializable

        # The title that the findings were aggregated on.

        @[JSON::Field(key: "title")]
        getter title : String

        # The ID of the Amazon Web Services account associated with the findings.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # An object that represent the count of matched findings per severity.

        @[JSON::Field(key: "severityCounts")]
        getter severity_counts : Types::SeverityCounts?

        # The vulnerability ID of the finding.

        @[JSON::Field(key: "vulnerabilityId")]
        getter vulnerability_id : String?

        def initialize(
          @title : String,
          @account_id : String? = nil,
          @severity_counts : Types::SeverityCounts? = nil,
          @vulnerability_id : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateCisScanConfigurationRequest
        include JSON::Serializable

        # The CIS scan configuration ARN.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        # The scan name for the CIS scan configuration.

        @[JSON::Field(key: "scanName")]
        getter scan_name : String?

        # The schedule for the CIS scan configuration.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::Schedule?

        # The security level for the CIS scan configuration. Security level refers to the Benchmark levels
        # that CIS assigns to a profile.

        @[JSON::Field(key: "securityLevel")]
        getter security_level : String?

        # The targets for the CIS scan configuration.

        @[JSON::Field(key: "targets")]
        getter targets : Types::UpdateCisTargets?

        def initialize(
          @scan_configuration_arn : String,
          @scan_name : String? = nil,
          @schedule : Types::Schedule? = nil,
          @security_level : String? = nil,
          @targets : Types::UpdateCisTargets? = nil
        )
        end
      end


      struct UpdateCisScanConfigurationResponse
        include JSON::Serializable

        # The CIS scan configuration ARN.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @scan_configuration_arn : String
        )
        end
      end

      # Updates CIS targets.

      struct UpdateCisTargets
        include JSON::Serializable

        # The target account ids.

        @[JSON::Field(key: "accountIds")]
        getter account_ids : Array(String)?

        # The target resource tags.

        @[JSON::Field(key: "targetResourceTags")]
        getter target_resource_tags : Hash(String, Array(String))?

        def initialize(
          @account_ids : Array(String)? = nil,
          @target_resource_tags : Hash(String, Array(String))? = nil
        )
        end
      end


      struct UpdateCodeSecurityIntegrationRequest
        include JSON::Serializable

        # The updated integration details specific to the repository provider type.

        @[JSON::Field(key: "details")]
        getter details : Types::UpdateIntegrationDetails

        # The Amazon Resource Name (ARN) of the code security integration to update.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        def initialize(
          @details : Types::UpdateIntegrationDetails,
          @integration_arn : String
        )
        end
      end


      struct UpdateCodeSecurityIntegrationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated code security integration.

        @[JSON::Field(key: "integrationArn")]
        getter integration_arn : String

        # The current status of the updated code security integration.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @integration_arn : String,
          @status : String
        )
        end
      end


      struct UpdateCodeSecurityScanConfigurationRequest
        include JSON::Serializable

        # The updated configuration settings for the code security scan.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CodeSecurityScanConfiguration

        # The Amazon Resource Name (ARN) of the scan configuration to update.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String

        def initialize(
          @configuration : Types::CodeSecurityScanConfiguration,
          @scan_configuration_arn : String
        )
        end
      end


      struct UpdateCodeSecurityScanConfigurationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated scan configuration.

        @[JSON::Field(key: "scanConfigurationArn")]
        getter scan_configuration_arn : String?

        def initialize(
          @scan_configuration_arn : String? = nil
        )
        end
      end


      struct UpdateConfigurationRequest
        include JSON::Serializable

        # Specifies how the Amazon EC2 automated scan will be updated for your environment.

        @[JSON::Field(key: "ec2Configuration")]
        getter ec2_configuration : Types::Ec2Configuration?

        # Specifies how the ECR automated re-scan will be updated for your environment.

        @[JSON::Field(key: "ecrConfiguration")]
        getter ecr_configuration : Types::EcrConfiguration?

        def initialize(
          @ec2_configuration : Types::Ec2Configuration? = nil,
          @ecr_configuration : Types::EcrConfiguration? = nil
        )
        end
      end


      struct UpdateConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateEc2DeepInspectionConfigurationRequest
        include JSON::Serializable

        # Specify TRUE to activate Amazon Inspector deep inspection in your account, or FALSE to deactivate.
        # Member accounts in an organization cannot deactivate deep inspection, instead the delegated
        # administrator for the organization can deactivate a member account using
        # BatchUpdateMemberEc2DeepInspectionStatus .

        @[JSON::Field(key: "activateDeepInspection")]
        getter activate_deep_inspection : Bool?

        # The Amazon Inspector deep inspection custom paths you are adding for your account.

        @[JSON::Field(key: "packagePaths")]
        getter package_paths : Array(String)?

        def initialize(
          @activate_deep_inspection : Bool? = nil,
          @package_paths : Array(String)? = nil
        )
        end
      end


      struct UpdateEc2DeepInspectionConfigurationResponse
        include JSON::Serializable

        # An error message explaining why new Amazon Inspector deep inspection custom paths could not be
        # added.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The current Amazon Inspector deep inspection custom paths for the organization.

        @[JSON::Field(key: "orgPackagePaths")]
        getter org_package_paths : Array(String)?

        # The current Amazon Inspector deep inspection custom paths for your account.

        @[JSON::Field(key: "packagePaths")]
        getter package_paths : Array(String)?

        # The status of Amazon Inspector deep inspection in your account.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error_message : String? = nil,
          @org_package_paths : Array(String)? = nil,
          @package_paths : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateEncryptionKeyRequest
        include JSON::Serializable

        # A KMS key ID for the encryption key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # The resource type for the encryption key.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The scan type for the encryption key.

        @[JSON::Field(key: "scanType")]
        getter scan_type : String

        def initialize(
          @kms_key_id : String,
          @resource_type : String,
          @scan_type : String
        )
        end
      end


      struct UpdateEncryptionKeyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateFilterRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the filter to update.

        @[JSON::Field(key: "filterArn")]
        getter filter_arn : String

        # Specifies the action that is to be applied to the findings that match the filter.

        @[JSON::Field(key: "action")]
        getter action : String?

        # A description of the filter.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Defines the criteria to be update in the filter.

        @[JSON::Field(key: "filterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The name of the filter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The reason the filter was updated.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @filter_arn : String,
          @action : String? = nil,
          @description : String? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct UpdateFilterResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the successfully updated filter.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains details required to update an integration with GitHub.

      struct UpdateGitHubIntegrationDetail
        include JSON::Serializable

        # The authorization code received from GitHub to update the integration.

        @[JSON::Field(key: "code")]
        getter code : String

        # The installation ID of the GitHub App associated with the integration.

        @[JSON::Field(key: "installationId")]
        getter installation_id : String

        def initialize(
          @code : String,
          @installation_id : String
        )
        end
      end

      # Contains details required to update an integration with a self-managed GitLab instance.

      struct UpdateGitLabSelfManagedIntegrationDetail
        include JSON::Serializable

        # The authorization code received from the self-managed GitLab instance to update the integration.

        @[JSON::Field(key: "authCode")]
        getter auth_code : String

        def initialize(
          @auth_code : String
        )
        end
      end

      # Contains details required to update a code security integration with a specific repository provider.

      struct UpdateIntegrationDetails
        include JSON::Serializable

        # Details specific to updating an integration with GitHub.

        @[JSON::Field(key: "github")]
        getter github : Types::UpdateGitHubIntegrationDetail?

        # Details specific to updating an integration with a self-managed GitLab instance.

        @[JSON::Field(key: "gitlabSelfManaged")]
        getter gitlab_self_managed : Types::UpdateGitLabSelfManagedIntegrationDetail?

        def initialize(
          @github : Types::UpdateGitHubIntegrationDetail? = nil,
          @gitlab_self_managed : Types::UpdateGitLabSelfManagedIntegrationDetail? = nil
        )
        end
      end


      struct UpdateOrgEc2DeepInspectionConfigurationRequest
        include JSON::Serializable

        # The Amazon Inspector deep inspection custom paths you are adding for your organization.

        @[JSON::Field(key: "orgPackagePaths")]
        getter org_package_paths : Array(String)

        def initialize(
          @org_package_paths : Array(String)
        )
        end
      end


      struct UpdateOrgEc2DeepInspectionConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateOrganizationConfigurationRequest
        include JSON::Serializable

        # Defines which scan types are enabled automatically for new members of your Amazon Inspector
        # organization.

        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Types::AutoEnable

        def initialize(
          @auto_enable : Types::AutoEnable
        )
        end
      end


      struct UpdateOrganizationConfigurationResponse
        include JSON::Serializable

        # The updated status of scan types automatically enabled for new members of your Amazon Inspector
        # organization.

        @[JSON::Field(key: "autoEnable")]
        getter auto_enable : Types::AutoEnable

        def initialize(
          @auto_enable : Types::AutoEnable
        )
        end
      end

      # Contains usage information about the cost of Amazon Inspector operation.

      struct Usage
        include JSON::Serializable

        # The currency type used when calculating usage data.

        @[JSON::Field(key: "currency")]
        getter currency : String?

        # The estimated monthly cost of Amazon Inspector.

        @[JSON::Field(key: "estimatedMonthlyCost")]
        getter estimated_monthly_cost : Float64?

        # The total of usage.

        @[JSON::Field(key: "total")]
        getter total : Float64?

        # The type scan.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @currency : String? = nil,
          @estimated_monthly_cost : Float64? = nil,
          @total : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # The total of usage for an account ID.

      struct UsageTotal
        include JSON::Serializable

        # The account ID of the account that usage data was retrieved for.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # An object representing the total usage for an account.

        @[JSON::Field(key: "usage")]
        getter usage : Array(Types::Usage)?

        def initialize(
          @account_id : String? = nil,
          @usage : Array(Types::Usage)? = nil
        )
        end
      end

      # The request has failed validation due to missing required fields or having invalid inputs.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the validation failure.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The fields that failed validation.

        @[JSON::Field(key: "fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @fields : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # An object that describes a validation exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # The validation exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the validation exception.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Contains details about a specific vulnerability Amazon Inspector can detect.

      struct Vulnerability
        include JSON::Serializable

        # The ID for the specific vulnerability.

        @[JSON::Field(key: "id")]
        getter id : String

        # An object that contains information about the Amazon Web Services Threat Intel Group (ATIG) details
        # for the vulnerability.

        @[JSON::Field(key: "atigData")]
        getter atig_data : Types::AtigData?

        # An object that contains the Cybersecurity and Infrastructure Security Agency (CISA) details for the
        # vulnerability.

        @[JSON::Field(key: "cisaData")]
        getter cisa_data : Types::CisaData?

        # An object that contains the Common Vulnerability Scoring System (CVSS) Version 2 details for the
        # vulnerability.

        @[JSON::Field(key: "cvss2")]
        getter cvss2 : Types::Cvss2?

        # An object that contains the Common Vulnerability Scoring System (CVSS) Version 3 details for the
        # vulnerability.

        @[JSON::Field(key: "cvss3")]
        getter cvss3 : Types::Cvss3?

        # An object that contains the Common Vulnerability Scoring System (CVSS) Version 4 details for the
        # vulnerability.

        @[JSON::Field(key: "cvss4")]
        getter cvss4 : Types::Cvss4?

        # The Common Weakness Enumeration (CWE) associated with the vulnerability.

        @[JSON::Field(key: "cwes")]
        getter cwes : Array(String)?

        # A description of the vulnerability.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Platforms that the vulnerability can be detected on.

        @[JSON::Field(key: "detectionPlatforms")]
        getter detection_platforms : Array(String)?

        # An object that contains the Exploit Prediction Scoring System (EPSS) score for a vulnerability.

        @[JSON::Field(key: "epss")]
        getter epss : Types::Epss?

        # An object that contains details on when the exploit was observed.

        @[JSON::Field(key: "exploitObserved")]
        getter exploit_observed : Types::ExploitObserved?

        # Links to various resources with more information on this vulnerability.

        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # A list of related vulnerabilities.

        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(String)?

        # The source of the vulnerability information. Possible results are RHEL , AMAZON_CVE , DEBIAN or NVD
        # .

        @[JSON::Field(key: "source")]
        getter source : String?

        # A link to the official source material for this vulnerability.

        @[JSON::Field(key: "sourceUrl")]
        getter source_url : String?

        # The date and time when the vendor created this vulnerability.

        @[JSON::Field(key: "vendorCreatedAt")]
        getter vendor_created_at : Time?

        # The severity assigned by the vendor.

        @[JSON::Field(key: "vendorSeverity")]
        getter vendor_severity : String?

        # The date and time when the vendor last updated this vulnerability.

        @[JSON::Field(key: "vendorUpdatedAt")]
        getter vendor_updated_at : Time?

        def initialize(
          @id : String,
          @atig_data : Types::AtigData? = nil,
          @cisa_data : Types::CisaData? = nil,
          @cvss2 : Types::Cvss2? = nil,
          @cvss3 : Types::Cvss3? = nil,
          @cvss4 : Types::Cvss4? = nil,
          @cwes : Array(String)? = nil,
          @description : String? = nil,
          @detection_platforms : Array(String)? = nil,
          @epss : Types::Epss? = nil,
          @exploit_observed : Types::ExploitObserved? = nil,
          @reference_urls : Array(String)? = nil,
          @related_vulnerabilities : Array(String)? = nil,
          @source : String? = nil,
          @source_url : String? = nil,
          @vendor_created_at : Time? = nil,
          @vendor_severity : String? = nil,
          @vendor_updated_at : Time? = nil
        )
        end
      end

      # Information on the vulnerable package identified by a finding.

      struct VulnerablePackage
        include JSON::Serializable

        # The name of the vulnerable package.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the vulnerable package.

        @[JSON::Field(key: "version")]
        getter version : String

        # The architecture of the vulnerable package.

        @[JSON::Field(key: "arch")]
        getter arch : String?

        # The epoch of the vulnerable package.

        @[JSON::Field(key: "epoch")]
        getter epoch : Int32?

        # The file path of the vulnerable package.

        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The version of the package that contains the vulnerability fix.

        @[JSON::Field(key: "fixedInVersion")]
        getter fixed_in_version : String?

        # The package manager of the vulnerable package.

        @[JSON::Field(key: "packageManager")]
        getter package_manager : String?

        # The release of the vulnerable package.

        @[JSON::Field(key: "release")]
        getter release : String?

        # The code to run in your environment to update packages with a fix available.

        @[JSON::Field(key: "remediation")]
        getter remediation : String?

        # The Amazon Resource Number (ARN) of the Amazon Web Services Lambda function affected by a finding.

        @[JSON::Field(key: "sourceLambdaLayerArn")]
        getter source_lambda_layer_arn : String?

        # The source layer hash of the vulnerable package.

        @[JSON::Field(key: "sourceLayerHash")]
        getter source_layer_hash : String?

        def initialize(
          @name : String,
          @version : String,
          @arch : String? = nil,
          @epoch : Int32? = nil,
          @file_path : String? = nil,
          @fixed_in_version : String? = nil,
          @package_manager : String? = nil,
          @release : String? = nil,
          @remediation : String? = nil,
          @source_lambda_layer_arn : String? = nil,
          @source_layer_hash : String? = nil
        )
        end
      end

      # A weekly schedule.

      struct WeeklySchedule
        include JSON::Serializable

        # The weekly schedule's days.

        @[JSON::Field(key: "days")]
        getter days : Array(String)

        # The weekly schedule's start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Types::Time

        def initialize(
          @days : Array(String),
          @start_time : Types::Time
        )
        end
      end
    end
  end
end
